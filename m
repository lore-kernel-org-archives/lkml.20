Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258520;
	b=cuWl4dzZyhAK3R453OA8pnL9kbwMdy/0kC7wAadkyoZXaSouU25gOgOGxnxpco3yt31Y
	 9VmY2cmcgTtfJ8t0sZQ7bIr4+YLqcHqJU7z6VKcbUqXDXK+k08Fb4GiE1bKib4wCQFUJi
	 Q6MlNCJDAG0mUzXzOlbVjBJCPD6mfwuw+/lBOGeMO5mWFtbG9wEsaO7oPb+3YIYuFS4Dh
	 2gvez3lcHYW8MoK4+R1IM014YUzagk3RJF3jhK5ZttXLnxD8ct0u9ePu67Dj1eBMSgE0Z
	 ezX02sr1VMVVzOGpBvl3XGiLrxqQfHRLISzdyVTa0v38lq+8WHtHXrHDnrZxgtNEW1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=aNKqN93kR+lNxistdWyjeL4QD2Ikaa3czqMk7TzqBYw=;
	b=MjtVzUCCn+DiScsrnrRHTGjoiic2LV5qWxyfmYNKIemR48ogesrvsLvgZUKpzVhMBUsL
	 x3H6LIMYndYcgJzI6wrf0ACJsXu0tEdDVqHuzio++3ql+GiaVJCmCn57rBQKmnbF1niKd
	 nsBKc05umLVY/QA6JkqCvwRXRpIyYfCzNfLqtk0cJopR0ZaqaGjJZIxVf5zD0e3b1rJPM
	 3SuG0OztBsafuWbQvUXD5w8z6LqaUTaa0p1/rF5+F1wwgTAUvLdynyBowifaj9IgB7IHl
	 1qTPu+JlimX7AYIkaxg95Vxj7ywARb/l6hCSJheVrTilX/46fKAmjNBe+bTARdHUujg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g1mx7+5d;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB5D60A261A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DB5D60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g1mx7+5d
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-844bc76180bso1799907a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794258519; x=1794863319; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNKqN93kR+lNxistdWyjeL4QD2Ikaa3czqMk7TzqBYw=;
        b=g1mx7+5dB/dwi5suUFjiBOitGRwdI8l7Hbx2/LPl7dz8QUomivRSvO9bkukH3n/P7/
         K3D7NGrPe84Hzd2vuzGLv2FsaKj9giidpggDMWYtcSa/y7RGYLuO7A4a35J91cWLaOme
         l7mcUMw6u2dpopRlJsDZEVH+tSPeTi6CdLClHK9pX7LJ/pq20uuf7aLhQ0uOdyrcqwXb
         VhaTf7YirRLgpGB94EW41kKF24E9yG5kbnOLBugs9fFy2lZC0G66wIdPJiBEpaZy1Sf5
         ZAVzKkg1b0L/OXIvSw7uWog2nuHLchLrS4pquLtU0s4uJWhMmrAFJkuDkFhXsWiF3ayK
         eA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794258519; x=1794863319;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNKqN93kR+lNxistdWyjeL4QD2Ikaa3czqMk7TzqBYw=;
        b=EkAeR12a1CXy3+ADiejLTGyFLI9Fbw4npZT8jwOyAx4FEfkDUaH/9B1I7HiH0DHgVF
         g0aoHDEy0ILvinN8p65SMCoBh6QywAc7rIhEubH3J1EQICu8YsC1raL1CA+1qc+x2RAF
         5plmoyGICpeAZz5Ln1FOML/Rx/TFpHbm50vg19ycoHliI731eVfCASA+2slEf7fsHvZd
         rKpvSeVGw/+2zwqvHHXpwOL10sL/D7zVoTFtcJdKBmxlCeq52QYG0gDfYWNPLn5s6bW3
         l23egA8cJyHWmwGqFrmsjtpsLW9MsTn0E6kMDGncFupXhj/60YVs9a18Lh9peUjW56Pq
         ucEg==
X-Forwarded-Encrypted: i=1; AL+hErHxC1ZEbGuwDOa6RHL6KaPKcNGclS0u+EiiT6u0mipar/SGhFpXlwt9KDjkOBYzZ2/aj3k3zN1z41IMqh0=@vger.kernel.org
X-Gm-Message-State: APuU4Z92bNaVzZuXnYus+psTMvwez40Ga8RtM/YuoCkjnio6WPcKJMXj
	wIHqoQvC00+gBlEAI/X0nUMBIejhurcBocsLEgH0M2VJUovMsMsRhwQuY/LvF9D9H1jLp4hySi+
	DL3XywywW3FMmxQ==
X-Received: from ilej14-n1.prod.google.com ([2002:a05:6e02:620e:10b0:53c:6681:b05])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6809:1ca:10b0:568:66c5:2ad with SMTP id 5614622812f47-56866c50430mr374020b6e.34.1794258519045;
 Mon, 09 Nov 2026 13:08:39 -0800 (PST)
Date: Mon,  9 Nov 2026 21:08:31 +0000
In-Reply-To: <20261109210833.1250548-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261109210833.1250548-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261109210833.1250548-4-dmatlack@google.com>
Subject: [PATCH v3 3/5] vfio: selftests: Print the IOMMU modes when a
 requested mode can't be used
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Print the names of all known IOMMU modes when passed an unrecognized
IOMMU mode, and the names of the available IOMMU modes when a test skips
because the IOMMU mode it requested is not available. If no IOMMU mode
is available at all, print the generic "No IOMMU mode is available"
message instead. Expose both lists via iommu_mode_names_all() and
iommu_mode_names_available() so that tests can also print them, e.g. in
their help output.

irq_test lets users choose the IOMMU mode with -t, so a typo or
unavailable mode should tell them which modes are valid.

Suggested-by: Sean Christopherson <seanjc@google.com>
Link: https://lore.kernel.org/kvm/auit0kVkAaWcNUvk@google.com/
Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../vfio/lib/include/libvfio/iommu.h          |  9 ++++
 tools/testing/selftests/vfio/lib/iommu.c      | 44 ++++++++++++++++---
 2 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
index 8306ade5f069..309b231eb0d8 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
@@ -52,6 +52,15 @@ bool iommu_mode_is_available(const char *iommu_mode);
  */
 const char *iommu_mode_unavailable_msg(const char *iommu_mode);
 
+/* Returns a comma-separated list of the names of all IOMMU modes. */
+const char *iommu_mode_names_all(void);
+
+/*
+ * Returns a comma-separated list of the names of the IOMMU modes that are
+ * available on the current system, or "none" if no IOMMU mode is available.
+ */
+const char *iommu_mode_names_available(void);
+
 int __iommu_map(struct iommu *iommu, struct dma_region *region);
 
 static inline void iommu_map(struct iommu *iommu, struct dma_region *region)
diff --git a/tools/testing/selftests/vfio/lib/iommu.c b/tools/testing/selftests/vfio/lib/iommu.c
index 56696bd5c30d..bde53bd55208 100644
--- a/tools/testing/selftests/vfio/lib/iommu.c
+++ b/tools/testing/selftests/vfio/lib/iommu.c
@@ -105,6 +105,38 @@ static const struct iommu_mode *iommu_mode_detect(void)
 	return NULL;
 }
 
+static const char *iommu_mode_names(bool include_unavailable)
+{
+	static char all_names[256];
+	static char avl_names[sizeof(all_names)];
+	char *names = include_unavailable ? all_names : avl_names;
+	int i, len = 0;
+
+	if (names[0])
+		return names;
+
+	for (i = 0; i < ARRAY_SIZE(iommu_modes); i++) {
+		if (!include_unavailable && !iommu_mode_probe(&iommu_modes[i]))
+			continue;
+
+		len += snprintf(names + len, sizeof(all_names) - len, "%s%s",
+				names[0] ? ", " : "", iommu_modes[i].name);
+		VFIO_ASSERT_LT(len, (int)sizeof(all_names));
+	}
+
+	return names[0] ? names : "none";
+}
+
+const char *iommu_mode_names_all(void)
+{
+	return iommu_mode_names(true);
+}
+
+const char *iommu_mode_names_available(void)
+{
+	return iommu_mode_names(false);
+}
+
 /*
  * Returns the IOMMU mode with the given name, or if iommu_mode is NULL, the
  * most preferred IOMMU mode that is available (or NULL if none).
@@ -123,7 +155,8 @@ static const struct iommu_mode *iommu_mode_lookup(const char *iommu_mode)
 		return &iommu_modes[i];
 	}
 
-	VFIO_FAIL("Unrecognized IOMMU mode: %s\n", iommu_mode);
+	VFIO_FAIL("Unrecognized IOMMU mode '%s'.  Known modes: %s.\n",
+		  iommu_mode, iommu_mode_names_all());
 }
 
 bool iommu_mode_is_available(const char *iommu_mode)
@@ -136,13 +169,14 @@ bool iommu_mode_is_available(const char *iommu_mode)
 
 const char *iommu_mode_unavailable_msg(const char *iommu_mode)
 {
-	static char msg[128];
+	static char msg[512];
 
-	if (!iommu_mode)
+	if (!iommu_mode || !iommu_mode_detect())
 		return NO_IOMMU_MODE_AVAILABLE_MSG;
 
-	snprintf(msg, sizeof(msg), "IOMMU mode '%s' is not available",
-		 iommu_mode);
+	snprintf(msg, sizeof(msg),
+		 "IOMMU mode '%s' is not available.  Available modes: %s.",
+		 iommu_mode, iommu_mode_names_available());
 	return msg;
 }
 
-- 
2.56.0.506.g506a7eabc5-goog

