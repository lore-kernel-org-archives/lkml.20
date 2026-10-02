Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE54B3F39E8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968523; cv=none; b=kttlEjsm0icVNcvlocWSuKAKTLcWLiM/Zz6abHDT2V0y0lMoKTfpGpnurIRTXCV7MIrsstyGxcadQIlcb5iVjJY3z38WKtvH1GbfAfsJJSwXwDnHpfq4bkIqkS5flFIEBOqn65N3Ej0d4SqgWHdQKy+QdNU3FCTgois32eMoPQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968523; c=relaxed/simple;
	bh=XAQgb0F0u4DegmBOA3E903aqLrqIrvi3IpWeNxWb+gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IuF8D7apGQN3sxdX8UVbhZJkyv8iJE/gnZ1CxRIlf2uQ2KC4HuQTjzyubuRKlY9lBUw0Y6qUhiAPPGXGt6Afs2UZ/izwZBAiVLOtRcSCNW2rMTQUMtAruzFIu7U7RU/wjy9qpbqApBcAH7x2i9585+QnGotwazudphZ70ODYnGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXdVWcxb; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXdVWcxb"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a1681949b8so643265e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790968520; x=1791573320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cIvFwZrJp04ZdQA1Z5QwmseYff1JrQtZkKNKsph8seM=;
        b=MXdVWcxbmecbwEivTOhXdex5vMSFzZMPBbIUzYyKvIxct43IGIdtPaXkNDhS3j6WI7
         qkXnMOKz4pukuES0QhPQEJlUrf6nbmeLbbo/6Jn51Ck/hEFi6wUg9pnP0ECmu2jBCgpd
         YgAu9bY6IsvU1gUNVXedUY/XnovRr59wbncOmLoWnmS9T/TitvFNNi5BOKjyr2/P3CEo
         Tpi2gJNbjN7/x/COPtWbMPEIiOClfC2ZmMmlefTRddyl6i2SYieWhUwRZk4wiESlg/QS
         OysgbdRZF3fS/pPoiCO4t/T6lcwnli43PFWbuIXUI6FzxtqubU6+adVXMdw7le07jIKU
         oNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968520; x=1791573320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cIvFwZrJp04ZdQA1Z5QwmseYff1JrQtZkKNKsph8seM=;
        b=t9zQ+DCctn+EHvFBBK5xyuET8/WZIo3aG7zgly003oxCkdlaFg6BW+Bl4VFPF+xiWP
         dom9oRy9KeXfQVIjSkCKmFxEfwpGg6LNVNvzmkymPenCdXz5bM6bgEzt9XAUG78lK3KN
         VPv8WjrsUc7UVWsMgSos2kroiW8f40LHx5G8i2qrdPXWKr/MiEfu75X3CVXVGU8X60Wd
         nrIleUd57r9r91FDoznB1G0ZffEBG0bdZrAeYDPyHkrAXY3j4xjj1wuJMLZd/WHTeTVI
         w1yc+8Q+BP1K4ZOkDrc8L+7YNBRvvvJlFBdrDF9BwaIya0PgGIosaaWPrZaUin1BHDYR
         olPg==
X-Forwarded-Encrypted: i=1; AKwUvBwhllF1DiF+8f8xlDof7NEa/swvzFP6Eq3IXKTKzNWP5kEidpvXeQBJaI+nkrBMonld2sB34Fhgd9zOKDw=@vger.kernel.org
X-Gm-Message-State: AFuF++mlPX0esS0kODOacVCH5IZqvVHhZQlJV0Lb/02u49taROwhkIVD
	cfB9rJP2L60q1r1yl1DutXGQLPZIgddTJuDvzUIhLenziGT9vrdlC27j
X-Gm-Gg: AYBFou3FEcojeo4h2ECg7G3SRBSdJn42UcWJcTuwCGaVmh/J52r/2Sg3YkGkPmFITNg
	BcVk7uoNu7jnAFK6xNQ59jASLFk7AAIYhfrvwFnTPnVy9Br22wNUch+FISEwcv33yrdwmHT1b1y
	sOq9gfoL3ibPqCluxxXyEVhA0jbEjaNNkZlIzELDuZK5NDrtipLXD6KKmjLNYktNuL0CgYDTTXE
	joWlHdEntgf9WaLZm/pgkBgxBySr88Mkr4w9B94XmUqd8MegTCJtelDyVkOXOwHeclGVvjfctRP
	TIQRUvfE4/XkVNT2X6SJnZOEzHxEfOXVIr5vXwrnaJLIqISiSSK1poUbmqnaXy82BqN8nefS4l9
	JsAiDHqDxGbjHxQ3t4LZY3z67LR3eGQnIez2y+lO3B9yjJM3jTDr/ZPyhW5sGCc6d56ccDPhu3c
	hUwox8S8h83yax+9yJUL4arhih+ivrHgfHEl5lRz04KGD0i9d8KQ//DcwCC4LA0KQjBn28pnUn0
	I1MqPJ/SieRWXsJDPMXPTLtlax2KILr4XYcEc5CFQ4SdHcDyunu
X-Received: by 2002:a05:600c:3152:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4a027584bc4mr63811445e9.22.1790968520005;
        Fri, 02 Oct 2026 12:15:20 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm81151145e9.4.2026.10.02.12.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:15:19 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 8/9] platform/x86: hp-bioscfg: NUL-terminate the SPM auth token
Date: Sat,  3 Oct 2026 00:14:33 +0500
Message-ID: <20261002191434.58529-9-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002191434.58529-1-meatuni001@gmail.com>
References: <20261002191434.58529-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

auth_token_store() copies the token with kmemdup(), which does not NUL
terminate it, but hp_calculate_security_buffer() and
hp_populate_security_buffer() treat it as a C string and read past the
allocation.

A lone newline (echo > auth_token) is worse: kmemdup() of 0 bytes
returns ZERO_SIZE_PTR, which passes the NULL checks, so a later
attribute write calls strlen() on address 0x10.

Use kmemdup_nul(), which allocates one extra byte for the terminator
and never returns ZERO_SIZE_PTR.

Compile tested only.

Fixes: b2715aa2e135 ("platform/x86: hp-bioscfg: spmobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v4:
 - New patch

 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
index f0eb5c445..19f0f9f16 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
@@ -316,7 +316,7 @@ static ssize_t auth_token_store(struct kobject *kobj,
 		length--;
 
 	/* allocate space and copy current auth token */
-	bioscfg_drv.spm_data.auth_token = kmemdup(buf, length, GFP_KERNEL);
+	bioscfg_drv.spm_data.auth_token = kmemdup_nul(buf, length, GFP_KERNEL);
 	if (!bioscfg_drv.spm_data.auth_token) {
 		ret = -ENOMEM;
 		goto exit_token;
-- 
2.43.0

