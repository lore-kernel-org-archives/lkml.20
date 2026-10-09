Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FED7175A89
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 04:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791521222; cv=none; b=LKXyYkYeEScr7mWkwc6LqaoTJtF015H0Y92UFM/oqEip20Ggsp1XzMhQN5fvuHxFNRbori2WQBwHWhdKzECu5JPj43e2EGzLgRxXs0L87qnp+XhtvIZvhJ3kjHeRYfY5sNw+kIo/STwHq+L0xU1RuoGOfWv799fLxKAYdlrj7+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791521222; c=relaxed/simple;
	bh=hYEcRZfNO0ZIL03cS/C0g3gPMWns4wpZXwJgVX+O4lY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MFKGLLfCu4KQthqBJiwjUTDJvLfKY1G/cw0bmyywqQo9GL6zasiOIAf64wUYzX2u+2/nwzxfT4nWFf/oonRig3A1octgcqwoLWMD1rJ53ZpTNph08gh5c05PcC47vV3mcRRupgf8hfisGW0rH1dIKwxD+BsKWgFNFKiPEJD5oE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfoqvXMw; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfoqvXMw"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so2081007a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 21:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791521219; x=1792126019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x7hgxnnVrOAesdTxc+DeNAbIYuClRLjoTwntAP7fngE=;
        b=VfoqvXMwVVUZAe1JyUgKnXJeppTUDsNU++4LDA+C6LND2eDYgkfqJjGTOWGghlOZhN
         Z2tYl6Re77IVibSSaQED1JthBveDpWl+WYZfmXA8XYXZe1clluNlDi5B7FpKhCv/dw9O
         OdTupRoJEtBSSnzYGtMYiG8t9qeoVSBAIXpGT/BQ7bzpC3kJx/iYSAgS1rRTAeWyLFL9
         Gfv5+Ql6XswV/oI45VR3P0OaPrxjOJ6eg67yWc8fE4LOK2r8Pczh1ZcZ/P5aKTKDjLWO
         c/9lZsM39s7aH1Ew5J6oVHG9odreNDuew3j3eboSzjbxpRME29o4GbZwnjITsNRrOCf2
         Dflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791521219; x=1792126019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x7hgxnnVrOAesdTxc+DeNAbIYuClRLjoTwntAP7fngE=;
        b=IcYtWIwxWnLrvDH/p3WPaDCzvAGY3Y/AewpoiRzk5NHUXO7lFNEJpJJ9qQLAESR8Nc
         biETi/eX5IQzgpsFp5RZKkYz50bhLH68xTBVxnd5jG5TjX1W1zN4/DgI0MuQ+zqbDHHb
         qpKFzOrcpMxtJqZf9WjHiLIC9zcvG2XC6QKi+Lvkc0+vSGjOU+ml38yDkTW8U+IowdAp
         tXwROhiktMbMRomj7PtC4Z9V8w/RCeixHrbD1EOf1e8MfrD2cSzZ8yFOSnf0xUkoEtWZ
         r0xFcA+ouLblm/Qs4DXjVT+e/lAQjnj3lGcITpWXChBc3bVYozm4luTVotvC00aT+rnJ
         8GAw==
X-Forwarded-Encrypted: i=1; AKwUvBwpGRfjwkPrtOYdLv+dr8WARJ/Bzi7oqqSyeHC8OTqY2sPCQwmjPLcbFUzOlQL28YBDkg79hrBeCNL4xrg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKm4zoUC3IYhs1JX61ndjD+m4vrkyqsQ7IeB0HninE9Noh86BT
	wgxjuzXjVCczv01vaTosJoNm2PyVxCXysjnN0MhnbTN6mJd1bBFISCVl
X-Gm-Gg: AYBFou0nlmETiXdCmT8WcCwqMbtlP3iiYUx3ijy9fzEArPUjOlf0FUJIESUvkzAyQ2U
	BW9RBw2Niozvfsyw7PuSykDxjlM11cV2jGlKgOyqnsC0uBRP2ZcqNSJRabYUXQbQDuZ9P09/D1b
	LdMlBvNYenuba8ds8z9wRKDD+0FdNXX4Pj3z965oiJ4JOjsmPnt77obMC3HGlkm7YL2chU2JEI1
	0sB2jaBMjnGIE4rbENmzhx+6CnmVbuRJJAn/PVQoDOdajmrri+XhhrZpw3+/kk7nNJJD95hPG++
	smChhvzWkCzYvDXm3DAPcH2t+oSKwdyFRKCwnMtOjS7wcgnqGLLCxTxaF/usQjxY2lFGmb1S2MR
	XL5Kd0B6P1grHH65sZubD9d8KOyy4H78XlfKkjf0TD4XvA6+TA1J1pi9HV8lgr0oqO79tVoJWy0
	sjMQ8DOAe37LS3OXX5Xa9eCps6FmmgmmW3dp241k9vVWjK48tr1dGHd+6Ehc2fyTqLcbL57xv3i
	M1KB4c3izXSdQpMCA5C6s1Y5HvtGd/pHIzD9YGRc7uMLSQ2Qvg2BHNhIUo=
X-Received: by 2002:a05:6402:5189:b0:6aa:f809:ef44 with SMTP id 4fb4d7f45d1cf-6b17c296a4bmr407721a12.19.1791521219033;
        Thu, 08 Oct 2026 21:46:59 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b178d1605fsm504745a12.2.2026.10.08.21.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:46:58 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: himanshu.bhavani@siliconsignals.io,
	hardevsinh.palaniya@siliconsignals.io,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: i2c: imx576: Fix line length register
Date: Fri,  9 Oct 2026 05:46:55 +0100
Message-ID: <20261009044655.7586-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The line length is written to FRAME_LENGTH_LINES instead of
LINE_LENGTH_PCK. The value is later overwritten by the VBLANK control,
so the sensor runs with its default line length while the driver
reports HBLANK and PIXEL_RATE computed from IMX576_LINE_LENGTH.

Fixes: ee2e9bf41d3e ("media: i2c: add imx576 image sensor driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/i2c/imx576.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx576.c b/drivers/media/i2c/imx576.c
index 3fcd28d18a51..6243683302c7 100644
--- a/drivers/media/i2c/imx576.c
+++ b/drivers/media/i2c/imx576.c
@@ -507,7 +507,7 @@ static int imx576_set_window(struct imx576 *imx576,
 	format = v4l2_subdev_state_get_format(state, 0);
 
 	/* Line length */
-	cci_write(imx576->regmap, CCS_R_FRAME_LENGTH_LINES, IMX576_LINE_LENGTH,
+	cci_write(imx576->regmap, CCS_R_LINE_LENGTH_PCK, IMX576_LINE_LENGTH,
 		  &ret);
 
 	/* Imaging area */
-- 
2.55.0

