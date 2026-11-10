Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310539;
	b=0cpjOM3PukepLxnbnynIOfS/vmoHiX+pFCW7svZir8jXnEK7bJYKK66ncIzkWCxBgrBL
	 HO+O81OJI3C6i/3QldXPKNrJNLyD36av5aFobdGHCF6UW7RhHT506H3EaGqcUuhysdA5y
	 O6NE5eYGvc4WvuNiL591zjQhZpbeJ2tYly46KXId05KZ8Hm+lxXAFi7XcIQJ44j98PSfd
	 xXKahk5PGEQQ96YX7OhCQmzInL7GypU0UmdL6e7iFXH+wmRpIkxiBPaIoilWplkHSrN51
	 vHFFcXrEoXr0xIquBCbE/2XcLj3trLLzU7PIE9KAM7QUvAp7M3/AjNL9fDh/CNbsTeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=eb4IbN5BS1fARhwXlM0e58qZU7d7q3WTMx1lm2ye1vM=;
	b=zsPDWJtP2RKSejVaT/3GkVZrQObFuq0jBD+cyOLFhVIzDFRLKgNyHDizT8/YIwu7xT4s
	 T80DfC5PK5gMVWq5USIG1dT6ZhQCXYkRIMvJa/Qj3KZQvCDJn7JlxyQ0dkjBp92P7CmT2
	 NbNKIgJExm2VuJIS6LNIxHzmkhiUmn3SFtPBtrjce+G8te2VtSzjVFlqjVy17ewuJqvAE
	 5wr1Hx1nfAMiz9YhF4aqKhTM0nQvdDKwM72/s0Df1MTpcq3Z7SFUbu6q3qU+vdnvLYtEy
	 hyjlQiVqPh7YJGwjJZYXcGDn7o5JVGwQ2EycJ5AegIzVVqpN5AFhwaSeDX+5dWpxYZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=woGs86VP;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE84606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE84606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=woGs86VP
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-37000e7234bso3295585eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794310538; x=1794915338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eb4IbN5BS1fARhwXlM0e58qZU7d7q3WTMx1lm2ye1vM=;
        b=woGs86VP9WukCGihLuuEETxfyk3LIy4+aPZ9uUxsPCPKEPedXzFpMRVw2LPNci+8Kr
         5cgovCxwNTcq4GiVsO50ugl/u1KYLyjQCfb7RoXfdAGEaG9ijYcjYetBMDZ9F+dGudYv
         VUBJ8f9sOa9tXbWiE3Rw3qqZuo77Af0F9JxRmrj/7O3uVzUykDxOD+JU5MKYBATTz0F0
         CsHfCYDXTOD2PbKyhzqmrkMmKSAi4NYi5AdP4reLwrJZf3KiffjHfnTTQdSHMZfRMsy+
         MzAT+RhN3jG3BSiDPGTBOHDBjFyG99tLunsEtKTt5cPDqZvRWClaxfhh1iozr6IrtLip
         KrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310538; x=1794915338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eb4IbN5BS1fARhwXlM0e58qZU7d7q3WTMx1lm2ye1vM=;
        b=CMuU+LoV96JM3+PDjWTpqeQXZ6YuSxTvCjg/z0Y4g1v390HyestNG0kvXn2o3HKDeB
         WIrk/ocBGY6mq9PfDFjBZb+9nHxJrqCpfr8I5cQyQg6GNDkSvjooRMzY6JaCGL/Jl76P
         qwzNR+By4vQuVZ9UzbqrLxm8rWeIgYLFEKwrqpbX7Ld6s+XqQ+mTiJFWE6LYNTf1zP6X
         /Zjs1izbWHenAeqgfvC6PP0Kj2xnWE30O4TiSMJqiAlUBkIKuPHjQchhAhUPTxbCYwWk
         MNQmDlQSAlDnipWk1IykxkjbaYEVVrKVfVPux8EUAbWU8BKlCn7jLv7FKgD3SuXfMOVk
         HdEA==
X-Gm-Message-State: APuU4Z9/qabZPcwMWShRDf8lB838BboMmxcgx6t6hp6HX/wvTLvjcQ9z
	Pah+ax6wGH32wGdGs2aofYeu3PZB9lijf2qWvC1i9KELTKMgd3nrkR3D
X-Gm-Gg: AYBFou0KhqWOUBHigrpVjmrvF/i5b+qZW+C2UbpJKueF2lo0fhIkew7I45obtKe7+Dr
	6lFkrQXrY1umP+vspN5V1IdJqFFqmk5rc/5i+USJqATVBdgqtAJEOQ41qFzrMpzgAVN2eYRaMFP
	CYIpp0ZGKSwQbulWDo0lv6xcvsinU4ADv/di6jpWa8PMNYjCoUkjb2ooSM9jWROdF1tWPLGWvK5
	BT8uiRqXDVaHuTnEgHZLg8yJCnjQYWWWqgfTiLIVtmDWSeEaYKloZIbt43JSVKRtd20ec408fmB
	VGdxs6EN6tXPIwTnOnmgs6sYz6LPkz9F3wGpJa6TsoeAX8HpAG0X2Aq8dCMXXTEEoVX6AkQqLUc
	91JkZttp/idVTyOt+Ek4y/LGJIg7e9jyXSZyp2lYLkgZn94T3qtoFItTViMjp5LDPo9oJC+VN/Y
	CFmYq/R6to1Sj3RzV+WoZWbOv3Lt0Fm9GeOgSrSNBqMhYsYt5/8GB9kCiinLW9nGpL6ZKyVmUJ6
	JySRFe1WAQNTo/DQ5QygO8Y3j0YmmY+rSkQK8MwKHsMjBQk/rHsTni439gBAt4NKfW5KQ8qdOsN
	0DcUF9f+NZARM7TU0FJcDn8BRBbkV99baV+tVkQJlxpP1vfOvvbmpkYvFaancDfWO0Kpr2XPLJ4
	=
X-Received: by 2002:a05:7301:d184:b0:36d:a465:b38e with SMTP id 5a478bee46e88-3751c53689emr3136955eec.5.1794310537844;
        Tue, 10 Nov 2026 03:35:37 -0800 (PST)
Received: from localhost.localdomain ([103.179.231.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060dc0csm7675796eec.14.2026.11.10.03.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:35:37 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: hare@kernel.org,
	hare@suse.de,
	hch@lst.de,
	kbusch@kernel.org,
	kch@nvidia.com,
	sagi@grimberg.me
Cc: linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH v4] nvmet: clean up DH group state on initialization failure
Date: Tue, 10 Nov 2026 11:35:02 +0000
Message-ID: <20261110113502.3235-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvmet_setup_dhgroup() leaves the DH transform and group ID
initialized when private-key generation, public-key allocation,
or public-key generation fails.

A subsequent invocation with the same DH group incorrectly
returns success because the existing transform and group ID
are treated as proof of successful initialization.

Release the transform and reset the group state on initialization
failures so that subsequent attempts can properly retry setup.

Fixes: 7a277c37d352 ("nvmet-auth: Diffie-Hellman key exchange support")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v4:
 - Consolidate DH group error handling and clear stale key state
   when switching DH groups.
v3:
 - Clear stale DH key state when crypto_alloc_kpp() fails during
   re-authentication.
 - Fix the error path when crypto_alloc_kpp() fails by returning
   the allocation error instead of incorrectly reporting success.
v2:
 - Consolidate error handling in "nvmet_setup_dhgroup()" using
   a shared cleanup label to avoid duplicated teardown code.
 - Add Fixes trailer.

 drivers/nvme/target/auth.c | 67 +++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 30 deletions(-)

diff --git a/drivers/nvme/target/auth.c b/drivers/nvme/target/auth.c
index ccba84b1344e..681459b5db3b 100644
--- a/drivers/nvme/target/auth.c
+++ b/drivers/nvme/target/auth.c
@@ -76,8 +76,11 @@ int nvmet_setup_dhgroup(struct nvmet_ctrl *ctrl, u8 dhgroup_id)
 			return 0;
 		}
 		crypto_free_kpp(ctrl->dh_tfm);
+		kfree_sensitive(ctrl->dh_key);
 		ctrl->dh_tfm = NULL;
 		ctrl->dh_gid = 0;
+		ctrl->dh_key = NULL;
+		ctrl->dh_keysize = 0;
 	}
 
 	if (dhgroup_id == NVME_AUTH_DHGROUP_NULL)
@@ -95,38 +98,42 @@ int nvmet_setup_dhgroup(struct nvmet_ctrl *ctrl, u8 dhgroup_id)
 			 __func__, ctrl->cntlid, dhgroup_id,
 			 PTR_ERR(ctrl->dh_tfm));
 		ret = PTR_ERR(ctrl->dh_tfm);
-		ctrl->dh_tfm = NULL;
-		ctrl->dh_gid = 0;
-	} else {
-		ctrl->dh_gid = dhgroup_id;
-		pr_debug("%s: ctrl %d setup DH group %d\n",
-			 __func__, ctrl->cntlid, ctrl->dh_gid);
-		ret = nvme_auth_gen_privkey(ctrl->dh_tfm, ctrl->dh_gid);
-		if (ret < 0) {
-			pr_debug("%s: ctrl %d failed to generate private key, err %d\n",
-				 __func__, ctrl->cntlid, ret);
-			kfree_sensitive(ctrl->dh_key);
-			ctrl->dh_key = NULL;
-			return ret;
-		}
-		ctrl->dh_keysize = crypto_kpp_maxsize(ctrl->dh_tfm);
-		kfree_sensitive(ctrl->dh_key);
-		ctrl->dh_key = kzalloc(ctrl->dh_keysize, GFP_KERNEL);
-		if (!ctrl->dh_key) {
-			pr_warn("ctrl %d failed to allocate public key\n",
-				ctrl->cntlid);
-			return -ENOMEM;
-		}
-		ret = nvme_auth_gen_pubkey(ctrl->dh_tfm, ctrl->dh_key,
-					   ctrl->dh_keysize);
-		if (ret < 0) {
-			pr_warn("ctrl %d failed to generate public key\n",
-				ctrl->cntlid);
-			kfree(ctrl->dh_key);
-			ctrl->dh_key = NULL;
-		}
+		goto err;
+	}
+
+	ctrl->dh_gid = dhgroup_id;
+	pr_debug("%s: ctrl %d setup DH group %d\n",
+		 __func__, ctrl->cntlid, ctrl->dh_gid);
+	ret = nvme_auth_gen_privkey(ctrl->dh_tfm, ctrl->dh_gid);
+	if (ret < 0) {
+		pr_debug("%s: ctrl %d failed to generate private key, err %d\n",
+			 __func__, ctrl->cntlid, ret);
+		goto err;
+	}
+	ctrl->dh_keysize = crypto_kpp_maxsize(ctrl->dh_tfm);
+	ctrl->dh_key = kzalloc(ctrl->dh_keysize, GFP_KERNEL);
+	if (!ctrl->dh_key) {
+		pr_warn("ctrl %d failed to allocate public key\n",
+			ctrl->cntlid);
+		ret = -ENOMEM;
+		goto err;
+	}
+	ret = nvme_auth_gen_pubkey(ctrl->dh_tfm, ctrl->dh_key,
+				   ctrl->dh_keysize);
+	if (ret < 0) {
+		pr_warn("ctrl %d failed to generate public key\n",
+			ctrl->cntlid);
+		goto err;
 	}
 
+	return 0;
+err:
+	kfree_sensitive(ctrl->dh_key);
+	ctrl->dh_key = NULL;
+	crypto_free_kpp(ctrl->dh_tfm);
+	ctrl->dh_tfm = NULL;
+	ctrl->dh_gid = 0;
+	ctrl->dh_keysize = 0;
 	return ret;
 }
 
-- 
2.55.0

