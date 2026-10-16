Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7793139A060
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139506; cv=none; b=W8AJ1T4K17WcePOfMmeFf9j1gIK3gOGxJ6ba/xwhjr6R9ZeIP0KtzpdEx7g/bRUTUM75FgL7xKJjszyNvRilJm0y4l1D27cliq7pLrJhzFQAV1hgT4X7PTCWtiX9UAukOdrPFcOIhFgxxWY6z+bEKg0I0NM+VzPUNc6ipEGRf/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139506; c=relaxed/simple;
	bh=OLLLfWKBpwqo5exF9ou0EKVfVVOyS128Lh6BBfC4mEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k6TOIC+yLHbFQpBcsRs7psMssUDqrAEMUG1wud586LjpXBbBooeQkBXgI8W421VOYTmGlKSSMmDyIKFDpSOpuYmjgeLuLinHYP5J0u/rDocAggAU50oLGtCG1y+hhfuVhovAgiFGXEpjqX57h+cJroRd+QAkeIIwf63A8XdmCzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWDiC9Xm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWDiC9Xm"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so52709845e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792139504; x=1792744304; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnFQlpRueWJU6LQTCtMO2U4Bg6ST/1jzJh/3XkIm/00=;
        b=fWDiC9Xmu2oQpFdIhjofgPPGf8PAGsfzLjGATbPDlg20Ol9flQpzQJjNgYVn19huzD
         YzT2/IJ/SRFd7Un2Zgxw/9We4Ht63SBOf2syLswcgh5pJz2mEovMpxJy8rh3mE+jgyp3
         LgSaOrC0wbuXMR0yIloqT/3lLuieyrzZyHXnAPXvYAxIBncto7Fy5FXI2jKqTPArwy+6
         smkTN/g6SasOUMOAckhUDeLLVXbR3X6rCn1Ws7rJ6wUV5h4winbmiVNiuRMxUDUXOGZF
         epqSWpE5zKuV5FEjv19DZk+g2VgTjjiKbahuWJGqp19i+MpUTHpXkSkqxxWHqbUTxxAt
         fSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139504; x=1792744304;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnFQlpRueWJU6LQTCtMO2U4Bg6ST/1jzJh/3XkIm/00=;
        b=2BAoasVuVYrw9NLL8Z+evynJeTtBpUhbX4E6/j0JeAb6tmcbBV8JjzXSxM0AGOwb/c
         tt0wwIf6nJVniO/O/fNTX2ExRtSNK1CTYxT3dUwxwf4LusjZdfyBCpI7nh/Dt3Tkwl0F
         UKPfpYB1RwXKytjw/SDI1MtyPiGAv2hc0652ePKlMcKBJoVJkU8+CNfUk3O5divE7XKx
         0fJrNwh/j6rHit3+tBjONh1tzyYZZH3BdbyfeqsytiGN8e4qeyVPI0+4w7luHRrB/aWz
         ec2XsoF5OysYvRNe5+jF/i9S7vcEiYPtMl8t7Rv+pV2KxNX9E+4aKyk3CBH6wVzlCu7K
         M1cQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoe/g/FEWax8v+LJB5/yQOIWJTXl3l/laGMGlWm7duDoxiEv5Tmk6wsTX1e8mn+TzjYn0taggOLOm/Aks=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFuYO3nM0MuZVnIBDQ83I2iZSD4rTpDRUitnZn14waTn/5a8xZ
	UaXG8NGVlzUL0QpNIdiuXEJX+sEWEPu4fQdNlGPxDzdb59mGipBoL14p
X-Gm-Gg: AYBFou03jN4oE2g//i8+vFCWEcKmKCPVboEd7pJ5HC9GCiyE0FbAnhQlSb3zPBlcM6Q
	nb184ygiuf2xr+Y8crvhdnwMPijVj1CdsrPnlbxOSBv/IiolnfwHqXyGQyeCjuH3cWAwxJtv2Yk
	33QSzwho1WqfVQl/0ADyQAaxIE+0ZJvlVH4JDZVm6NlVqaN1DXLMWFxC1AUE+o27ATZiA+ad//z
	Y1f/q4smly39Ki4AkBtSt0zWhJ63gmI7Z5WInMgd3yKJTsyTZODkQJ6sFu8YzAvJg50R0pu+Knh
	d6iDjG4qMtfCKewXQr0wCkwYtFEHpd29rLTPNOa0KLX+D9m6qIx/Pydrky5E82HI2C/4RMUaBt7
	aFNKLpHukr92j8qAsZpbnWcBg1Xf/ZbGhT6KKngYLkoCtmhwzuTa6ZyVIeZEHT7Vc8a0iEPfpgX
	L8E5Q64yY8KZshAFsxDA+yHwurwaiPBLdx49lbVLINcSyI50BtUdZMLNXMbFiHZBpbtEU=
X-Received: by 2002:a05:600c:4688:b0:4a1:8d46:6228 with SMTP id 5b1f17b1804b1-4a18e4a9ba5mr452180195e9.14.1792139503538;
        Fri, 16 Oct 2026 01:31:43 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8de682bsm38391285e9.13.2026.10.16.01.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:31:42 -0700 (PDT)
Date: Fri, 16 Oct 2026 11:31:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] media: uvcvideo: Add sanity check to
 uvc_mapping_get_menu_value()
Message-ID: <atHg6s8VaFxNzuR6@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Smatch warned that "idx" could be too large, leading to an out of bounds
read.  When we reviewed the callers it was a false positive.  However,
add a sanity check here anyway, just for future proofing and being
consistent with the rest of the code.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
v2: It's not a real bug but Ricardo asked me to add the sanity check
anyway.  Use BITS_PER_TYPE() instead of BITS_PER_LONG.

 drivers/media/usb/uvc/uvc_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index d2f722bc3459..249c68783474 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -538,7 +538,8 @@ static void uvc_mapping_set_s32(struct uvc_control_mapping *mapping,
 static int uvc_mapping_get_menu_value(const struct uvc_control_mapping *mapping,
 				      u32 idx)
 {
-	if (!test_bit(idx, &mapping->menu_mask))
+	if (idx >= BITS_PER_TYPE(mapping->menu_mask) ||
+	    !test_bit(idx, &mapping->menu_mask))
 		return -EINVAL;
 
 	if (mapping->menu_mapping)
-- 
2.53.0

