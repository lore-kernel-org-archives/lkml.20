Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1CF48B38A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525510; cv=none; b=alKvaCZa8cT7oFQeBnrzUeWMziT7U59NaxyAnr6HFozVKrLfoByk1qkupYrhn2vGstQex++bN4vlh+iKmVxYQtGJ0AScCS0eXl+TeNzZtQ9fFWnwn/4Y3OJvMGtEvyFu0iZh+2PdIXwWSIAqvmUP8U7rKjM35tMRx6NUBojFegg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525510; c=relaxed/simple;
	bh=BGJG30BBlU5JlTVzTh+NGap4GEh5ZtB7jDRbNDEsn8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nvDYC4R/+u2NzdJcBLoWLh849n0WGXA/kChUeSQC2vIVuqWMwGhrP7Tca3jBz1rFCgtf6EA37AXlox7/ky9FNoVi36mFsdowKzGfffrtdSyM79ew2Y12A4zk1LbsvLOSLU5vxjFiMY232fv9XJT+IBrDE8t/DVDIQaA2shLkIx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7bwYLD/; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7bwYLD/"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-499f6e0bbabso686984b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525507; x=1789130307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sHdptObuetze5oBfguIxEgGh+NdTyXGzCj6d2TKz3Lo=;
        b=Q7bwYLD/HiY3D2gHjPKqXn4Qy2fsdX7i2qPM8n4oOsNm1pwLDCPv2FAwljrd22HGpS
         YP9uVSvobBFHZAQf0wBD1pOx/By9iP7rp62Osm+046aV4j+p7ILFKfX+Jixo+0aNTVNj
         n86L9gV2AgO21lzX0TJR3htJzMIFu/nue0CAFajnybDg6BUWx4uOO7rSV7LngF6xXBt5
         EMoFgN0sBQ6gZuJo5h9GBjqXeGFxVPmffWDhFWA2RLbgtfa84Km8/zgxREaeLTLJ9W6J
         PN3S1SscmR7A0+ZofR+ay6fVRcOV/tchKfkLf3hAcITIKCYBR4XoFFt8VlNn3uPs8IPN
         81Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525507; x=1789130307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sHdptObuetze5oBfguIxEgGh+NdTyXGzCj6d2TKz3Lo=;
        b=VAEHVV2EGppkV8b/aE2V2p7Szrr7JD28ff8i6Xx7xqChbAY5WlhIbXEEU9rqX3hUMF
         bTu1g0ox/b9ua/CITgUKkDY+3IqO1nzgpy5WcE/SuP4bWgHBZU9a6OIR0GkFIBdc3TDi
         9VxO4x/BB9fuHg/jOH3BSUnGAg0u4mIrmesaGn6KiiVpyxbvZZCHhgPQKJ1ltN295SQ+
         EFsOsU6zEc8st9W4h3IcGHvZ3aapzohXps1f6D33u40sHjZEbX9ST2wYwZBzDOIrl2Xk
         qKkn/zSHmOxrKerCihnfMEVdCPXumK9W//Br33MXvkbxdRezmLgoBfeXZyffXYPmRz0o
         H+ug==
X-Gm-Message-State: AFuF++kNNkHhWFTFJWcjUNwEgKvto9z22/TDO68ZXviVb0Ng6hhLllUS
	kCfEfmBG1EtuEtjNuwj/PRcN5gBMVAb5zW681RqCknK+Oh6IsovdrqIj
X-Gm-Gg: AYBFou1cO2ZKuUit22Q9mKQzmjY5bzaGAejccbX7KIgv1cog0ugREIIXfjda4ZoKljO
	+VnXdUICRoJGO1GfbRO1oQr9EuoTR8LJfauRHnx6cXY78fxY6aVONNbm0W9BE0cv1tLgmYscg97
	BvODgbUGKc3j25Iur6vQ2CzgYDcWxEF+ORCG/+9cVYeyA3Vt7JexEhFTGVs3YQeRwVEGAQUobx3
	4NrAU+8V4aDiNTYSGvoYwWA2HHTQPmDn8mRwGGjpI+/hJUy1VIxLc03XyD2EIFNtdeQy33Ts5qj
	blWa0FzA/Ygz4BH4r1XoSMYZotScEvfNiiaHSHvdusf5vQXzhjZV4tydQ4JXEdiZPzbWdAN5bVJ
	YrIjQHlyKn8uhzy8ls8Qw1oZMQgULg3FwuwLsnLjFlkgCZ3K1ckCZl9lRwWRSV7Ur/Na4io4mZR
	dZlEOVjBDVQRocxmeTfgeCzbPeDVOsqAwVD9MK0bvTEgu7xjzitTiLF3B7/YqQ7KxGNWnLMto/1
	PL98GjEJMYOb+8=
X-Received: by 2002:a05:6820:80d:b0:6b7:8415:d77a with SMTP id 006d021491bc7-6b78415d94emr1607160eaf.37.1788525507551;
        Fri, 04 Sep 2026 05:38:27 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm3046021eec.4.2026.09.04.05.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:38:26 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Daniel Jordan <daniel.m.jordan@oracle.com>
Cc: linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: [PATCH] kernel: fix typo "dependend" in comment
Date: Fri,  4 Sep 2026 18:08:20 +0530
Message-ID: <20260904123821.40427-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "dependend" to "dependent", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 kernel/padata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/padata.c b/kernel/padata.c
index 0d3ea1b68b1f..5a113c667d4c 100644
--- a/kernel/padata.c
+++ b/kernel/padata.c
@@ -534,7 +534,7 @@ static void padata_init_reorder_list(struct parallel_data *pd)
 	}
 }
 
-/* Allocate and initialize the internal cpumask dependend resources. */
+/* Allocate and initialize the internal cpumask dependent resources. */
 static struct parallel_data *padata_alloc_pd(struct padata_shell *ps,
 					     int offlining_cpu)
 {
-- 
2.48.1

