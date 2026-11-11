Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794425060;
	b=0/wgaanK7GTJ2t9IA9Ux8dl+eaMnN4RMF8PocTjyrodM6BlW6+o2baqN7jwLYkUpTFPK
	 SaUHn3RME8eBuuKkpyoPHKxpoVpUVAshtQnT8k60KsQlsE8yId6JZ5TYA77LMFwUG62Vb
	 /ROdhRw8UEFVWBT7goJnHzVtgWBRzowqOoBwubtz+U/CP7StYF6Jpkm8+bCX2fbrJfH8B
	 t0K9oa5IjlN8cr9Ad1/QXkXArg/GDXuXCQG0Wp7sQCxa+Gf1uRVBZkhsbFpLMTBFO9xLa
	 WJ/cqlE4/4UFnS4PuNlxfu/l32Eodei6DjZly+5175LtJZPZp7N/KwCMcOEYvNgYeNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=jeGS53i3H2ZA/AB75TkRMSZsgx42pQ2yxXWF/NRY1NA=;
	b=ir+s511lbO1tlk3K2qT2KnDlj7njZ3YwrtYaJrXNNLsQWe6xcDCNNd8n4TttlBDjoCuG
	 77eT55q82ILF7qsgronVgx5r1HWW8NeqcIBeMWWdoEuemIkEnZD9wmrxuVNME3imAYGLG
	 8yelDmToX8z2ILVRWXVoo1Xo0hNykm4HApMTnpz72jFqHwzXdLMC6E+gEyEoW89Dq1Kaw
	 E+8BBx/UHft5R/2vdzhY24TDsKTdO5/BDnZ5c6ot+vNWTZqQLfds3R7G7WnNiH15Qjokg
	 BZMFsAqWI2eqRdHncKNSXKRG/xt55j2h7K38W8S6/DnlVjCRfqkrM8h9gEjIT2XU3fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cQkqVn92;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512B860A2603
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 512B860A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cQkqVn92
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4e937c5bd4fso2650772b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794425059; x=1795029859; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jeGS53i3H2ZA/AB75TkRMSZsgx42pQ2yxXWF/NRY1NA=;
        b=cQkqVn92T4Oui/+VCglZgs8fJXAig6R5l+VclvZ+Jt0ppAVZz4yDq1yK/FyJHtdx+g
         Y9AiC9GzQYqQro0gB91+f6zfs0CI38Rz0k7LPkpjFOsYWA1zXOu+8tnZI0ih0tUHOjom
         VABERVCjvucj3eWe0UUcbmbkNqpagIeM/SCJrDtbrSlGJHN/SVcH+SjdOaXs54xDLKp5
         dW5KWH23Ywn8CdnSF45Z/tKhvFCVaL2W1JCCVW2w6DdjUey1K/IgHSnBZoUUdTv33CKi
         h38Ig4xOV5fIjWj+37pSTKurD5RI10wq9TInvnW5n07x3XTcdyNRemmhhvbbzPFv3JFc
         9MeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794425059; x=1795029859;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeGS53i3H2ZA/AB75TkRMSZsgx42pQ2yxXWF/NRY1NA=;
        b=iPBQrXUNI3yYb/YiPEle8Bkb75uYOZNmHmkQJMii0Db067YvDttIrSRxwbHTHzbLY7
         Z9QBIkx3UT3CNAHJpjijPmKFfQcGDovdF4UETa6t8z9avvFGKSeMOxyIiMJiFofv9MDl
         Rw14E3VyCTYRTRMtvzYxrxspx9YmjJy4a9Xhl1S7i7txvthN2mpweHxJnMpOEijQpLmy
         gfBOZJ6tEqedWg9o7Opr4iaUg9ZrfRvp9WyWfQ/uo5j1pk4sq/ZV446QyVgWcKK650Zs
         UNSfKL2yeo2fpGSBQIMyoOlX3jdCk0t+t0W3uNiLfDL3gvfzt/QorJEaEMctk5bJb6Jn
         2ovA==
X-Forwarded-Encrypted: i=1; AL+hErEUtfzBd1d3caql+UzuEbDzPXixROf5jL+Fx4ADZLvfsU/prfsmMadwwmj9UWQegoRPSK+2t0VH6e9SG+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lolvyYutCa6n0zz110ke7yiauBpzayyC9y/v6KLktcLFoGGG8
	ifnRnVVjrdtUsfAIRmi9fWbfLnMxDmZoF/+Fj/g1r7Dfy8ate8Ds+4Qb3nRxMyV20mK90BdLFOy
	71eejVn7iEmJJWA==
X-Received: from jagm2.prod.google.com ([2002:a05:6638:40c2:b0:620:1989:fc1c])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6809:19:20b0:567:cbf5:bb96 with SMTP id 5614622812f47-56cc533e313mr527002b6e.44.1794425059253;
 Wed, 11 Nov 2026 11:24:19 -0800 (PST)
Date: Wed, 11 Nov 2026 19:24:07 +0000
In-Reply-To: <20261111192411.4133780-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111192411.4133780-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111192411.4133780-4-dmatlack@google.com>
Subject: [RFC PATCH 3/7] vfio: selftests: Allow multiple BDFs in VFIO_SELFTESTS_BDF
From: David Matlack <dmatlack@google.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org
Cc: Alex Mastro <amastro@fb.com>, Alex Williamson <alex@shazbot.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, David Matlack <dmatlack@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Matt Evans <mattev@meta.com>, 
	Matt Evans <matt@ozlabs.org>, Mina Almasry <almasrymina@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Parse whitespace-separated PCI BDFs from VFIO_SELFTESTS_BDF in
vfio_selftests_get_bdfs() instead of requiring a single BDF.

Multi-device tests such as P2P DMA tests need two or more devices even
when invoked through run_kselftest.sh without command-line arguments.
Single-device callers using vfio_selftests_get_bdf() continue to receive
the first BDF.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/vfio/lib/libvfio.c | 53 ++++++++++++++++------
 1 file changed, 39 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/vfio/lib/libvfio.c b/tools/testing/selftests/vfio/lib/libvfio.c
index 3a3d1ed635c1..448d11442b53 100644
--- a/tools/testing/selftests/vfio/lib/libvfio.c
+++ b/tools/testing/selftests/vfio/lib/libvfio.c
@@ -2,6 +2,7 @@
 
 #include <stdio.h>
 #include <stdlib.h>
+#include <string.h>
 #include <sys/mman.h>
 
 #include <linux/align.h>
@@ -32,38 +33,62 @@ static char **get_bdfs_cmdline(int *argc, char *argv[], int *nr_bdfs)
 	return *nr_bdfs ? &argv[i] : NULL;
 }
 
-static char *get_bdf_env(void)
+static char **get_bdfs_env(int *nr_bdfs)
 {
-	char *bdf;
+	static char **bdfs;
+	static int count;
+	char *env, *tok, *saveptr;
+	int cap = 0;
 
-	bdf = getenv("VFIO_SELFTESTS_BDF");
-	if (!bdf)
+	if (bdfs) {
+		*nr_bdfs = count;
+		return bdfs;
+	}
+
+	env = getenv("VFIO_SELFTESTS_BDF");
+	if (!env)
 		return NULL;
 
-	VFIO_ASSERT_TRUE(is_bdf(bdf), "Invalid BDF: %s\n", bdf);
-	return bdf;
+	env = strdup(env);
+	VFIO_ASSERT_NOT_NULL(env);
+
+	for (tok = strtok_r(env, " \t\n", &saveptr); tok;
+	     tok = strtok_r(NULL, " \t\n", &saveptr)) {
+		VFIO_ASSERT_TRUE(is_bdf(tok), "Invalid BDF: %s\n", tok);
+		if (count == cap) {
+			cap = cap ? cap * 2 : 4;
+			bdfs = realloc(bdfs, cap * sizeof(*bdfs));
+			VFIO_ASSERT_NOT_NULL(bdfs);
+		}
+		bdfs[count++] = tok;
+	}
+
+	if (!count) {
+		free(env);
+		return NULL;
+	}
+
+	*nr_bdfs = count;
+	return bdfs;
 }
 
 char **vfio_selftests_get_bdfs(int *argc, char *argv[], int *nr_bdfs)
 {
-	static char *env_bdf;
 	char **bdfs;
 
 	bdfs = get_bdfs_cmdline(argc, argv, nr_bdfs);
 	if (bdfs)
 		return bdfs;
 
-	env_bdf = get_bdf_env();
-	if (env_bdf) {
-		*nr_bdfs = 1;
-		return &env_bdf;
-	}
+	bdfs = get_bdfs_env(nr_bdfs);
+	if (bdfs)
+		return bdfs;
 
 	fprintf(stderr, "Unable to determine which device(s) to use, skipping test.\n");
 	fprintf(stderr, "\n");
-	fprintf(stderr, "To pass the device address via environment variable:\n");
+	fprintf(stderr, "To pass the device address(es) via environment variable:\n");
 	fprintf(stderr, "\n");
-	fprintf(stderr, "    export VFIO_SELFTESTS_BDF=\"segment:bus:device.function\"\n");
+	fprintf(stderr, "    export VFIO_SELFTESTS_BDF=\"segment:bus:device.function ...\"\n");
 	fprintf(stderr, "    %s [options]\n", argv[0]);
 	fprintf(stderr, "\n");
 	fprintf(stderr, "To pass the device address(es) via argv:\n");
-- 
2.56.0.567.gdb80ae8cd5-goog

