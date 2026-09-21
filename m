Received: from mail-wm2-f7.google.com (mail-wm2-f7.google.com [74.125.225.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3A74E4C4D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790014479; cv=none; b=H7Y2V2a0ah57MKdIiKkvERSiY89oXmlY6igCbPPJTUI2bGW+tkYQSTPm9XBbjGT1gnh11czIKLBQUpFaV6jum9Z4IE8CswEoA3y7raPP5/9eE3hhADIgWfhR0U5jA2ZXpi1H4pF0Z84bv2SLDfcr6XFLJkwIcDj7f6dlPV0RC6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790014479; c=relaxed/simple;
	bh=BhklwgvkpUrE+CC+vXjr1M0j6bhRvxIIJDO2uMkw5I0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NJ247Vymx12lOMkr6h4hBeMNXD2VVYpVs2IAJZyZEOwHsQ8dOtMZdblDAM+se/ZWks9GSIrKhDkfYd/ycWhFY477aAswHMU1oe9Lbuuk3FSVcFAMZXK9QIF0Eg5hBMamtPb+qS2Vx8qqtvBPw3mO4A89VMzd+92H1bzCENT/RYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sHv3lfSe; arc=none smtp.client-ip=74.125.225.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sHv3lfSe"
Received: by mail-wm2-f7.google.com with SMTP id 5b1f17b1804b1-49fd4ea3409so5010845e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790014476; x=1790619276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8njTdDuR2VjcLI0zLlnQh6RcubDIwEA0WzrR3t+nYKc=;
        b=sHv3lfSeMeG2AjFf9qcoqs2YuQUC1YVlK19hpSPlOGXBFudL/boTMcNub5wHs50y43
         4nqYG7gY8L2db4DfXmj8jAVZbSmOJAB9S7cppiLsaywuUYQJs99VZCamfo/OF8FIVfVs
         QwB+8ZKEc9Jtu4SI0j0eRzD0upcW0KebS5wbhIHbBBscfD254+1QQYsuU/cIo6KB6SkV
         lnmoFxp9tIOUv16VqNqqO0K/zfk8yDADdV60JazkotxnzIqJq84GkIRIxG/kVBUA09Cb
         ed/bnDuux6J/pLxhw0TPUUURO9tQ5P+qFbMfjbzJROhZcwvWRswkiAPsQJhSE/bglNQS
         gamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790014476; x=1790619276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8njTdDuR2VjcLI0zLlnQh6RcubDIwEA0WzrR3t+nYKc=;
        b=SmHVtcSqbu/v3IT/Na+izxkIqQlAm4Pu5scDcj9P9OXV1Ll+RJyn94ZCQxS6v53ujP
         2kytSWHRr2po4mK0wSW55Xm91rGD3C26OfHJLpb5yu4Ytghxivzf2Udy4bb1EMchv33s
         Qa7lCpeb226FuevFwRP6bnnlkaqGK5IJdLwrx20rXljzlPaxkujjWmiwOVVNheUOP2gm
         EC3d4f9Vc03bIBrTKVO4tUQ+WdKRzQoOCIQh7Vnik2vccfY9DtiEkDGocaZESiOf9LHz
         DG6e4nsj+WiR6S2RAio3m7HYlhrP85uf9H5lPTbr9XlwNIiiFXibwUWHKImGEHit06pM
         89NA==
X-Forwarded-Encrypted: i=1; AKwUvBzP5D3p4HBUMBLAEgBngMM6scYnmarZSStKQ9XZv4U1GsTGPxufcEy4s5ca8Rm1w+870QqezW73Eep36iU=@vger.kernel.org
X-Gm-Message-State: AFuF++klZRUfkLmveZv40Z4kPdMRnB5nIDJsoAXb1piQFJ3+aCCBy7fj
	blqf7zeypFCuktIdaCVd4zmQUovVRrCMRWZcIcY4TyErb+0d545QOe9S
X-Gm-Gg: AYBFou30ZFzpM10ZAW5LQYW5DTqGLFqpaGFisA73zaHR5R+hS7P+VYAZ21JP6P5UCbr
	R9s2KwO+GeUXCHUjLEH3xtRPa36nscz7RIW2humWrTEEfOY18DZIoGuBqj+flX1xcriBYD7JZCg
	ZaRQVaqYAzC+8HpBNWKesyJNr7c8BCXwsQYQZBDU9/sOZYHLUnzixVuLGV2J2DKp2cyQP7MwzOc
	th/KeLM9AvCGc06HrQkOA+AmJH/iS4gnO21MdNuMMsW77HKDBzFjSvULywA+E1cRJPW+W2Ie/IP
	04RAAZkeRprtOuQPJxdgFWhJ4FqmebS3DIX8Wcc6OCBQvJYuYi7RqIKb/4jt5aWbCajF/vuR+2k
	NYLP3lsLUasBBAAtOqQB5DoVNcshioYqhHewBGw5wx2To17hs6vlXUsc6bXcB2G5qDaNGzV0VoB
	gKpWsukeXJrRpu3Hf4R2zo5Z5eWmqWqXWPlJ9WeQzHLIHwGrjHv3EJVsE9Ptm4ikCxhQU3fKvKR
	F0/HY75ekU8tFJE
X-Received: by 2002:a05:600c:4f8c:b0:49f:c18a:61c8 with SMTP id 5b1f17b1804b1-49fc573f858mr164351925e9.29.1790014476102;
        Mon, 21 Sep 2026 11:14:36 -0700 (PDT)
Received: from gbox.chicasongroup.com ([197.210.105.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8a636d1sm10754875e9.0.2026.09.21.11.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:14:35 -0700 (PDT)
From: UgwuRhema <hikarialiyev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Andy Shevchenko <andy@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: fbtft-bus: remove space before close parenthesis
Date: Mon, 21 Sep 2026 18:13:50 +0000
Message-ID: <20260921181350.89925-1-hikarialiyev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl errors regarding prohibited spaces before closing
parentheses in fbtft-bus.c.

Signed-off-by: UgwuRhema <hikarialiyev@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff1..409770891 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.55.0

