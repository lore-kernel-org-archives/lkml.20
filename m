Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101410;
	b=T4gFzRiXgobvDJgdwnYULWmgH0xWd8ZPS0Ef8WWBrmqv8YU9hBC6om2p+Hg8CvoMHS8o
	 tCVoHAH3o8hm8/F4Ui9WkqWyoEAWoFIqQVdmrHwF7SsdAh25iWYrIoWpMO30cgPATXKy4
	 LV8dRhOjMAJFjyS72880C9jg1w2AS0xDsKljVbbitofG7o8cqg0dGd8+q2StGoH9WqBzn
	 wXB8IhfN5i0EEChwcpMH5bciU1MEcQby+kLUQu4g4mLU6xs2Y4d5xcMxrVh0CTPKaTos9
	 j8T2zGMDNQJULk+3gBtUj+UuVkQVsL2Zg/BeCjjeol1hlnI3fOv+DdYhHtCn5OF6S0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=qRj5nmSVr8oaHYTfwp3nV+7muLaSPF1hwSVuKOsZ4eM=;
	b=UENtL4UZFA+XdfUSPnMwq5Qh5I6dSMZbQCWvMr3031/QSMkHdCsDPIltmlUrIQZojaE8
	 yIZ/I7C+DqU1HHBtKqQB5Dx8GH9EzxVNHAPw0P2RIinfNA7VettpiuPzESBPd7qZj5nc8
	 YJj8gKgJ+/cpCpVOd8frNYt8pK09IHcJri5ZWZPeq9021VNTbRpR0RsW3EOXzVYIT2s9J
	 JPrFrmREbcT1JlbQ7AKecrBchOuH2ofJcXD3TPUa8v+1HW1mwDsfA07kncG0Dz1AArZum
	 kNKju9FuNQo1Yli1gqgJdxwutsEudbwFLwbr2z9v1OPVSReilvFXO4wKJGdij6Dk8Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="iBOg8BS/";
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17029606A9C8
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17029606A9C8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=iBOg8BS/
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1711306a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793101409; x=1793706209; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qRj5nmSVr8oaHYTfwp3nV+7muLaSPF1hwSVuKOsZ4eM=;
        b=iBOg8BS/AfD0VOTVMWP3REB+11vPV7w0ToTM56EJrWZAxVXDxPmG2MqW8hvNvUbI+l
         YLBtKH1cr2sx6cgkWNqYFi3Vz8TZKPEM4+mP4lXO1mL58LsaQeFs/aZsyjGzeSlcZ0Lb
         r9YN/CYxzdAX9OSGZqJcz9kVZHtlPumWOo/gM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101409; x=1793706209;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRj5nmSVr8oaHYTfwp3nV+7muLaSPF1hwSVuKOsZ4eM=;
        b=latgVduaXB5UufdGxs+VZRMtwsSZhZkUaCragWm5A93DXoqjtXWyt0hDPzE0IC1cu2
         rnh3Edvyp531cpU+/Ihr+87vFUxj8d0qPe5iLD2iLI504FHqM/RWkWQQHZ6W+/3G9LR+
         z/tfRNpDlQ2KZRS86e/Btoxn+kjLMCD0w2jgT/gBi+vL+YUwfIcslp1Q0VjJ216JEEiP
         UksQ+q8PEkE0gIQtSyJy7BGxp75IswWkiQ79JPCWiKTQftHd2j3Y9vOaAwQC1piIg62W
         loArfK8BVVMZCD3Yd+AlzFDwU4pSI7jYtHuYGjcU3AJ8eyWQ65j06KlxTfJbQs34z28G
         RQ2w==
X-Forwarded-Encrypted: i=1; AKwUvBxoi8vN2T1YLI+ePKdKyJKZgFAGdlRpfdDU81OQzD37dF/Np6faVEZGjgEAuGKbc9uTxNPky3VBDGCE1KM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2TDmu7zFejG1GlR/HdEcT6k0rpnu6H4N87kCwXAm9JpRd9DYB
	KWGih9qq53UOjKNi00O56HezLcKwIZmv/drec5HRpkeifxThd3+3TIAiRLXxavbcM74=
X-Gm-Gg: AYBFou0MUwp/Pwb9kA4y9e95YB0DW2wt/MSVZAFFoeTLuZJ6MwrEOLE3bquQI0bE4dZ
	q9k1IWGHrACMhiQPJY83u8wVytsfT7Dlbsktnj9UTpDSAmzJSwjjftO4tAUEWCyJSYbf6p7ke3a
	R4mHdETR5AWSLdOREC6L5R5lF92Ps5yw3n0A2xgxjtsyUUooppLJvCj0kVl1muej5n6901+QHj9
	jRU7t1LeZ2RLb+LkQ4m6jiPy2VpTd3pvs3dUcebb4k7DPThEQDrudpW+3b7wy+iaPVBAmLk3hCb
	BaiSp1dgMTPn2ZJUWQGw6ASX4+Dqy2s3P2TklT7NJ8gnZr4BTEdnApPHtyO8ecUMFHtahW7ArFu
	KicFWrq4Wnt8rxqj4lLcIpWTka0NYGn1OawGfbeM+ZlLmLAu/1Gdb+1gbMDZI6k4q9wWKWckteR
	p5ga1CTkdxItzjbA5UkIfIh9qf86HK8QcSo7HO/j8vnrvBNRdioxtPH+251TZTutskSCBLUEa8B
	5WLNiPoeCc2k7YvscTI9g6K1V7ue3dMFC7QX8CRXFs3PYsFNJcfn8IKf7duOR2lqaaEXTsM2zZc
	Xc/N1XPDUnhXcct14f+kq9csB2tMmW50ph20WU3X7H68DwDUzYWflmwZMKpUy9+2oALgZmYq00d
	aVVJ4NHeGW0zCbL/+/2vZ+Bs=
X-Received: by 2002:a17:90b:35c5:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3adeafb079amr6566975a91.34.1793101409391;
        Tue, 27 Oct 2026 04:43:29 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adf8f3f22csm7120822a91.3.2026.10.27.04.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:43:28 -0700 (PDT)
Date: Tue, 27 Oct 2026 19:43:25 +0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>, Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH 3/3] selftests/mseal_system_mappings: Test vdso unmap and
 remap
Message-ID: <621847973ba2ec49d0a58e0261da35a9f3a97eda.1793094611.git.chris@chrisdown.name>
References: <cover.1793094611.git.chris@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793094611.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../mseal_system_mappings/sysmap_is_sealed.c  | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c b/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
index ea75ad537620..83b4fadfbfe7 100644
--- a/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
+++ b/tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c
@@ -10,6 +10,7 @@
 #include <unistd.h>
 #include <string.h>
 #include <stdbool.h>
+#include <sys/mman.h>
 #include <sys/utsname.h>
 #include <zlib.h>
 
@@ -232,4 +233,95 @@ TEST_F(basic, check_sealed)
 	EXPECT_EQ(expected, sealed);
 };
 
+static bool find_vdso(unsigned long *start, unsigned long *end)
+{
+	char line[MAX_LINE_LEN];
+	bool found = false;
+	FILE *maps;
+
+	maps = fopen("/proc/self/maps", "r");
+	if (!maps)
+		return false;
+
+	while (fgets(line, sizeof(line), maps)) {
+		if (strstr(line, "[vdso]") &&
+		    sscanf(line, "%lx-%lx", start, end) == 2) {
+			found = true;
+			break;
+		}
+	}
+
+	fclose(maps);
+	return found;
+}
+
+static int vdso_is_sealed(void)
+{
+	int sealed = -1;
+	FILE *maps;
+
+	maps = fopen("/proc/self/smaps", "r");
+	if (!maps)
+		return -1;
+	if (has_mapping("[vdso]", maps))
+		sealed = mapping_is_sealed(maps);
+	fclose(maps);
+	return sealed;
+}
+
+/*
+ * Unmapping or moving [vdso] must fail with EPERM when it is sealed. When it
+ * is not sealed, it succeeds and leaves glibc with a stale vdso pointer, which
+ * is fine because each test runs in its own forked child.
+ */
+TEST(vdso_munmap)
+{
+	int sealed;
+	unsigned long start, end;
+	int ret;
+
+	if (!find_vdso(&start, &end))
+		SKIP(return, "could not find the mapping, [vdso]");
+	sealed = vdso_is_sealed();
+	if (sealed < 0)
+		SKIP(return, "could not read the [vdso] sealing state");
+
+	ret = munmap((void *)start, end - start);
+	if (sealed) {
+		EXPECT_EQ(-1, ret);
+		EXPECT_EQ(EPERM, errno);
+	} else {
+		EXPECT_EQ(0, ret);
+	}
+	EXPECT_EQ(sealed, find_vdso(&start, &end));
+}
+
+TEST(vdso_mremap)
+{
+	int sealed;
+	unsigned long start, end, size, new_start;
+	void *dst, *ret;
+
+	if (!find_vdso(&start, &end))
+		SKIP(return, "could not find the mapping, [vdso]");
+	sealed = vdso_is_sealed();
+	if (sealed < 0)
+		SKIP(return, "could not read the [vdso] sealing state");
+	size = end - start;
+
+	dst = mmap(NULL, size, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, dst);
+
+	ret = mremap((void *)start, size, size, MREMAP_MAYMOVE | MREMAP_FIXED,
+		     dst);
+	if (sealed) {
+		EXPECT_EQ(MAP_FAILED, ret);
+		EXPECT_EQ(EPERM, errno);
+	} else {
+		EXPECT_EQ(dst, ret);
+	}
+	ASSERT_TRUE(find_vdso(&new_start, &end));
+	EXPECT_EQ(sealed ? start : (unsigned long)dst, new_start);
+}
+
 TEST_HARNESS_MAIN
-- 
2.54.0

