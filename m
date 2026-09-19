Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D9E392825
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856266; cv=none; b=R8asE7uyRZ7EYszZGFjnbnxTrZJndB119AJi3018arh1e/7mphBENR2xjcMdPJLKHZal80ZmsR3RzRNAwoODOQxhkQi2ifk6YwlxUnJjLjB720DwghYVCmvaCdKm5mZg9Ns8GHTg7RhhqO1YSjtY/nUe6DKTdejM2Fikuyccl84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856266; c=relaxed/simple;
	bh=luG39Slsuu9toOe2oysPgljEJ4oyaSeqnju93SdcYmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l5AZRxj5MqgWpUOM7KGMgB1FH1YxrjL6dhzsYIPrI4ZMXaCbWS0xuOWy/lhOsYfAmliDP4hzIyDaMPrKVwx1tXnGohgZGzEfOu7qaVzc+/J4YF+WTvNuUNL8e33T0+Mo4TpQhb72dHwExqEJ0Fo6Syp3jsSLfMyZEultkd6K2KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAsGnIET; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAsGnIET"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f0b25dso20523545ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856264; x=1790461064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7+KkRzAFhVcVxvzlKQ3lllIEZuNf/Ys+gCGhed5VDjE=;
        b=EAsGnIETjvd8dHTwVql8HYC2+QtLK4Z9qmj1nHamRP6oHLK27YmIOqfurFyDLDUSBv
         MbCzXTn0yRk4USqKeFdn3Eb36T2gEIg5Few2Tobtbso/v8qZme4YOAjC/H0M4+XWLAfd
         7JSTuFx559fKJTRijoIaaBcUJlL8l9wxEmRg1EnJC7/V9Q1u3kW5yVbY9uXhDMl2Z8U6
         1GmBPsjq5Qc9XVLuyMwPhfMFULHq3t/8gZ/9ibZv6JBXN624wqHLlXO3IoaJrpXo1N5T
         QasNDBNgwdu429GICgCApwuNm3EgIfRHPNhW3LMWKPKD6ab227zfWbrfpNRGoLNNmq7c
         jw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856264; x=1790461064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+KkRzAFhVcVxvzlKQ3lllIEZuNf/Ys+gCGhed5VDjE=;
        b=nSbynNaqIxn3FyWq7kXUH8T+orLsvDWO8penqMCpH8fKGTEEE0CPR6EmBmOpW7nmeR
         9z/ZM+RwsN4Rs1oOPBz79OfBhnb+beZLSFLTK1l9J1yTrGLe/Od5qvvZVH2DIn0rYQAC
         WFAfa0L7KME/emSHW+f7zSrSo2TbaLU1WJp43imNiK1qZ49MsqTFaXr4oQ/CluEW4Nz/
         IvfAritmnjLILnBO4r8T3lHdjOb81CZsmEDyVwDG6sa0yZBro119bnEDF/pChZ0PbgHl
         IubJiyxe7rTiT5YiN4BbXghIAQdvXT73MkhJP7rGHzLGzvZQ4wjSPJfYY31pET78BrF3
         eDGw==
X-Forwarded-Encrypted: i=1; AKwUvBwfjLx6ZJY7PuS/2HRkT7RSHjdyL1hXu85BNl5bSFvaJWGJXYJQhBnuxCyJgfUkgzp4891usAj6EXMc4ak=@vger.kernel.org
X-Gm-Message-State: AFuF++nDhSu5j2nBUMh/QR7a8WEGTmiowN+cUEguVn586RVx8wf1s1Kj
	xzY09H+nnp+t7klnHqna60q2UB7xGloKc+v5RecPnpeXgn5dlUSWKk7p
X-Gm-Gg: AYBFou0HTlor50gg0g7hMYH7WGmAyiLvnwnRyo1iX49HO0bh1jG3yhrhiodUaDXs3rh
	r8htsOB32X8PtW5Ef4nwdwYjw99JdQFm/uJ/eC9FpkNYl9P4mCxvennBEN7PyuKkzOauvy/jUNL
	Cl75E3cpy4IC847Da4Tgkzz7o4oxeimvgJDNYG+gRtGLV9YA1Bs1oUwvFs7ddVBilNkYdFv/s4b
	VxUgrXze6zrfTeAA9jyhcUhC1fFoXrGucgmNTmHYA+OBggQFEwRs7FiZYmObFGqaoBG2f8sYSmF
	eeB8hniEuSQ0Ef3wM4StPbe0wccmY4kkRAciFWLxAcO8WGsBXYUT4AmztGVgzwoG0xn1klMyfpd
	P6kl1YmLhsUFD7jiHKNegHR5FfjkNL6OXf35U6o1u+jPsZZOpK9zi3cEftLwDvu2UwxlN0PLpdZ
	YbTQP8cHlPj7uAGZaxho9NsO0Co5IPHz92tMzGw4hQuL1GeChE7kz9OY57bKT5wlP0GN09dRMFh
	QGXhzOie9W0WkbZYzYxC590m84VcUkJ/SgMzdSlmceMi+gGU7bfIlCZMgpfv1xUMiHbMrGJdWcE
	EisFGpxVoaeLwZDGCHpu
X-Received: by 2002:a17:902:d4c6:b0:2dd:c100:3130 with SMTP id d9443c01a7336-2ddc100319amr48902415ad.44.1789856264177;
        Sat, 19 Sep 2026 15:17:44 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc178701csm12904705ad.13.2026.09.19.15.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:17:43 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: dhowells@redhat.com,
	jarkko@kernel.org,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com
Cc: keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KEYS: asymmetric: fix out_len bounds check and in2_len union clobber in keyctl_pkey
Date: Sat, 19 Sep 2026 22:17:42 +0000
Message-ID: <20260919221742.3709658-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two bugs in asymmetric keyctl parameter validation:

1. In keyctl_pkey_params_get_2() (security/keys/keyctl_pkey.c),
   params->in2_len and params->out_len share an anonymous union.
   Assigning params->in2_len for KEYCTL_PKEY_VERIFY after setting
   params->out_len clobbers out_len, and info.max_data_size is checked
   against in_len instead of out_len for encrypt/decrypt/sign
   operations.
2. In software_key_determine_akcipher()
   (crypto/asymmetric_keys/public_key.c), ensure buffer length checks
   properly validate both input and output sizes against the key's
   maximum size.

Fixes: 00d60fd3b932 ("KEYS: Provide keyctls to drive the new key type ops for asymmetric keys [ver #2]")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index 09a0b83d5d77..4d8e5592fce8 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -358,7 +358,7 @@ static int software_key_eds_op(struct kernel_pkey_params *params,
 		BUG();
 	}
 
-	if (!issig && ret == 0)
+	if (params->op == kernel_pkey_encrypt && ret == 0)
 		ret = crypto_akcipher_maxsize(tfm);
 
 error_free_tfm:
diff --git a/security/keys/keyctl_pkey.c b/security/keys/keyctl_pkey.c
index 15b6bf6399b5..6d334531dd5b 100644
--- a/security/keys/keyctl_pkey.c
+++ b/security/keys/keyctl_pkey.c
@@ -136,21 +136,21 @@ static int keyctl_pkey_params_get_2(const struct keyctl_pkey_params __user *_par
 	switch (op) {
 	case KEYCTL_PKEY_ENCRYPT:
 		if (uparams.in_len  > info.max_dec_size ||
-		    uparams.out_len > info.max_enc_size)
+		    uparams.out_len < info.max_enc_size)
 			return -EINVAL;
 
 		params->out_len = info.max_enc_size;
 		break;
 	case KEYCTL_PKEY_DECRYPT:
 		if (uparams.in_len  > info.max_enc_size ||
-		    uparams.out_len > info.max_dec_size)
+		    uparams.out_len < info.max_dec_size)
 			return -EINVAL;
 
 		params->out_len = info.max_dec_size;
 		break;
 	case KEYCTL_PKEY_SIGN:
 		if (uparams.in_len  > info.max_data_size ||
-		    uparams.out_len > info.max_sig_size)
+		    uparams.out_len < info.max_sig_size)
 			return -EINVAL;
 
 		params->out_len = info.max_sig_size;
@@ -160,7 +160,7 @@ static int keyctl_pkey_params_get_2(const struct keyctl_pkey_params __user *_par
 		    uparams.in2_len > info.max_sig_size)
 			return -EINVAL;
 
-		params->out_len = info.max_sig_size;
+		params->in2_len = uparams.in2_len;
 		break;
 	default:
 		return -EOPNOTSUPP;
