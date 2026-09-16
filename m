Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3762B4534B7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544235; cv=none; b=ctMqLUIdRhZycs5Sx+wXxKGPG9vrFuQGXpW4izoh3DhruasXF1B+vdLIgr2dxowJBcZMWNsCKgxmZaGHXO0BjEYVMIt6ULR4CBGNVPhUOCbFZ/KouHF+3wbBE0Y33g7l9NjeNw4arYpkxLVurSeRX/JkJAhFFTYSN/2WRV4gG9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544235; c=relaxed/simple;
	bh=1T6G2GdipAuIpsHBWuDFEV6aIj1b93ts1plzYTqBaak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kE+kjcK7My1TH5IjD/SvfLdpc4NqSeDIv6rHXhF6nsROPnX6BFhtK2txZaG0mCeug8hK7DmOfdjii+u3oWZR/XFe21fAQWYDobOFgInxxGs/Rl+LfIVXhTHc76K04DYlaGk+XrxIv9HxDvVdy/xjDXAIi//+Mk+CCs5kEn2T1bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nheQpAlg; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nheQpAlg"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e25187so380920b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789544213; x=1790149013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Tks2oyxzxlf1TCNUshxK4sU+kJbcz/yddyURBT1Wps=;
        b=nheQpAlgUYIc8jFFfHoRPDfbx9XwCH7MxauhCM55JA+l7L9v5vw7iId+F+3C69LWb/
         be0wPB/lfoUGDrVMmhVNMR5KeN/k4pkGNix7BEJ+lTNEg7TW5qCprqCGGb3kURaH2pOM
         2ReCKRkLzlfYr6W0FKknEPaIcVrVjjPd5XP2WHpUW+61MxnMBvjPSbeqcOUt7sCZGUfV
         8wT04n2ftOICA9RXOvSlAOkY7NyU27dKCLboq66Hvx9RLHGLoGaAwragmW2RN7fv59Ch
         dGxyUpUKkBMNyxxhV0Su29TfDGSmK4y+YCTpftsNZKIrnob0U5KNK4ixAsokom0a9mOx
         QdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789544213; x=1790149013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Tks2oyxzxlf1TCNUshxK4sU+kJbcz/yddyURBT1Wps=;
        b=bRP/v2gXfaPsWfRqBn5UOpSyWc4KRk1/Z64IZgyNHawBzClIxccAfNPbQS5HDN/I/n
         t723iqordsmjfHtGV+3nEYv+w15FaGNrY7vNaU0IaR9gkT+cbUa3lQ68g85Z3VDxDL0r
         Sw0a2N3MfsF8kmJELDLzdXD7/dQ9L2RsmXPu5qelU2kl7mLyjwaTUMo7ZsMgLbGDV4Nx
         AI8/KVVal45JL6frAqPyYYchTPNOWzOiIJ84z/F8rsd366BcsL0MDpe6HYAO5/s42x6V
         jsS9KyFAhW52e7nKpQ1Z6RiHXzBVuKNexahfZwZ7eTTpdhpdAUFzIrODUWH1rFm0rdrT
         aE2w==
X-Forwarded-Encrypted: i=1; AKwUvBzu9x+KJb+KW/lUgxG0R2g7k+CFgdda59RtNGKI0PiGnuKSQDEH3LTBEEmFky+QwUaEzOD/nJSi7jZ1BNI=@vger.kernel.org
X-Gm-Message-State: AFuF++lObzWnQwatjttcko+htzNRCEDzlhZydbutrDOzc+VtgbKpUeOu
	9eVYkg/fvflctdjk7tjpQaU5BtbWWNs45OAdmZS6YIJjB/FImuo1tcu6
X-Gm-Gg: AYBFou3jBJ/14Zpu6EDhLldhqaHInZzRkOJ868UcH5CJClUka+5b6xO9p3225tvxn/g
	t5dYJvRuHs+eKP9Y/5Ne1nRdjWiAvSbQk2QrrPQKuJvZmyY2VgBPxrhOB7rz+0obzKzYFpOC4UL
	ktlXOzr/KlKP3dLq2vf7L9E2jLgZoW/SAogcfH8QThcyM6rOUsOgxdy51g+1P6Nu7D7UC54B5m0
	jBgu1s+8GDRS9lDIbvmIpSDnDv96haDyYw0AyvCvB6HCE3RK4xyWDlClT1LXdQ0cjQdyQpPzsn2
	Em+mKF8VaBmcqK41NQrpT1bV76QjwCkqfZi89T8giP1k/pLtuxlOcmR+Io1phlBoUo1KqRM1PpF
	j+U61o8acZrjsBgDQsETXXxsh+tUKUBx8HeywdrPD86cw+1VsRHFNiWLIgr80o+j6DwccKIZsbw
	8KTAmUK5xnl+blfDRrsJ5SQY/u4NYcmSjM4EMsJAN8tF/X2lFJGCj+KJpnyjGsNHuyK2JV+p5Ai
	mhsrSjIcyknKloquSwoQy+URpcnW6YjiX9ZHaR8ZUnCtSSMMg==
X-Received: by 2002:a05:6a21:b82:b0:3b4:8880:2089 with SMTP id adf61e73a8af0-3dd5f5d9f56mr4321805637.16.1789544213182;
        Wed, 16 Sep 2026 00:36:53 -0700 (PDT)
Received: from localhost.cuchdit.in ([45.248.159.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad6b9dsm5291011eec.21.2026.09.16.00.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:36:52 -0700 (PDT)
From: Punnay Sharma <punnaysharma805@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: atomisp: ov2722: Clean up resources on probe failure
Date: Wed, 16 Sep 2026 13:06:46 +0530
Message-ID: <20260916073646.26709-1-punnaysharma805@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915140828.25537-1-punnaysharma805@gmail.com>
References: <20260915140828.25537-1-punnaysharma805@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov2722_probe() mishandles cleanup on three failure paths:

- media_entity_pads_init(): calls ov2722_remove() but falls through
  to registration with a freed subdevice.
- atomisp_register_i2c_module(): returns without releasing the device,
  controls, CSI allocation or platform resources.
- __ov2722_init_ctrl_handler(): leaves the CSI allocation behind.

Route control-handler, pad initialization and module registration
failures to out_remove to call ov2722_remove(client) and return ret.
Keep the separate configuration failure path because ov2722_s_config()
already unwinds CSI setup.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>
---
v2:
  - Handle cleanup and error return if atomisp_register_i2c_module()
    fails (Dan Carpenter).
  - Route __ov2722_init_ctrl_handler() failure to out_remove to clean
    up CSI resources.
  - Add missing Fixes tag (Dan Carpenter).

 .../staging/media/atomisp/i2c/atomisp-ov2722.c    | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..272291e370fd 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -971,7 +971,7 @@ static int ov2722_probe(struct i2c_client *client)
 
 	ret = __ov2722_init_ctrl_handler(dev);
 	if (ret)
-		goto out_ctrl_handler_free;
+		goto out_remove;
 
 	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
@@ -980,12 +980,17 @@ static int ov2722_probe(struct i2c_client *client)
 
 	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
 	if (ret)
-		ov2722_remove(client);
+		goto out_remove;
 
-	return atomisp_register_i2c_module(&dev->sd, ovpdev);
+	ret = atomisp_register_i2c_module(&dev->sd, ovpdev);
+	if (ret)
+		goto out_remove;
 
-out_ctrl_handler_free:
-	v4l2_ctrl_handler_free(&dev->ctrl_handler);
+	return 0;
+
+out_remove:
+	ov2722_remove(client);
+	return ret;
 
 out_free:
 	atomisp_gmin_remove_subdev(&dev->sd);

base-commit: 587858367581b9c55c3690f4e63382ad622719d4
-- 
2.55.0

