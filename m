Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110213932EE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199690; cv=none; b=F5AFFCxw1XpL7pa4tEozKWvFE+imxpMEDslOKeTqs7hgzPacEvd/pVT2gVlTtobSEp/X+AVBpUGRv/qQej7zIrowWpX6cOv18ePe5LIwYlZEj3VJBckzu3dq/0rX1v9SHUqJnqaPYD8MHNWCW/enDsGWqpgsfq3QH9rDrfV62qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199690; c=relaxed/simple;
	bh=utSLBmDfnw5ZtpTvHWIdpGOyIo2oeZyEbk6tvpC4Xzo=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tweTGojd/wUIUfw6qDHZNqK6EKhXewvjnQBq1QxQmKiTSG6GS7gBkxbwULNb3+B8SNO7LwvJbyQUl8ftXCP6ScdWR3EjwfgMTqLImWbOj0u05XwPFWZgbdsytLR274LV9vWiE9wmCvPVwHSSilcf7zLHKR0IsJDU3blSLeuGsnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=O/6a/vQd; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="O/6a/vQd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788199678; x=1788458878;
	bh=hmotLLr+f+bR5tsRrGV8jHmTV4TQEm31OAGWhKiXFnA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=O/6a/vQdIND+ZuWoV9ljRQ2HMmHnBydee+RGliftMQxvXltR7eQhQebf3coXUR0Sc
	 q8YvJwyNUvbr0dp8FC5SIkdJxUL5PDTsJKMh1mZDmz0ZlIxpL1YzlhtWYe4aDzI87+
	 ZXOUEXve9lh4eY9VfUNaQdS3q6yxjMlUYRPp/YLeDDBYPddEw5BdpOtXKlSO+s1aAW
	 0j5NtXr2ySVTuVZ3Jxvu9acvnHFlUz/KOpsl1ckGEKZ6mtmOh4/sbw6Qy1EQFJFj/C
	 QW+v3IO3jq/A4EgiCp6Yw4kpH4YJq+mDbh1B6lLrFSO0cAMwVprCJlt2OYTqmp2TpX
	 S8ibIzmWUJzmA==
Date: Mon, 31 Aug 2026 18:07:54 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov13858: cap analogue gain at 15.5x
Message-ID: <20260831180746.68878-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 91d1afb34b95dbc3a46d7471a9c1c69b761d9de3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

V4L2_CID_ANALOGUE_GAIN is advertised as 0..0x1fff, but the control is not
monotonic over that range. Measured on raw Bayer from the CSI-2 receiver
at fixed exposure, on a Surface Pro 11, taking signal as the frame mean
minus the black level:

  register    requested    measured
      1024          8x        7.55
      1536         12x       11.09
      1984       15.5x       14.23
      2047      15.99x       13.71
      2048         16x        7.54
      4096         32x        7.58
      8191         64x       14.28

Up to 0x7c0 the control tracks. At 0x800 the gain halves, and above that it
wanders: 0x1000 behaves as 0x400 did, 0x1800 as 0x600, 0x1fff as 0x7ff. An
autoexposure loop that raises its request and gets back less signal cannot
converge, and 0x800 in particular costs a full stop against 0x7ff.

0x07c0 is what ov13b10 and ov08x40 use, and 1984/128 is 15.5x, the usual
analogue ceiling for these parts. I have no datasheet for the ov13858; the
value is the one its siblings use and the one the measurements agree with.

This does not make pictures brighter, since 0x7c0 and 0x1fff reach the same
gain. It stops the driver claiming range that is not there.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
Tested on a Surface Pro 11 (Intel Lunar Lake, IPU7) with libcamera's
software ISP. Image quality is unchanged: over three runs, mean luma
85.6/85.6/86.2 against 87.9 before, matching 14.23x against 14.28x.

 drivers/media/i2c/ov13858.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -63,7 +63,7 @@
 /* Analog gain control */
 #define OV13858_REG_ANALOG_GAIN=09=090x3508
 #define OV13858_ANA_GAIN_MIN=09=090
-#define OV13858_ANA_GAIN_MAX=09=090x1fff
+#define OV13858_ANA_GAIN_MAX=09=090x07c0
 #define OV13858_ANA_GAIN_STEP=09=091
 #define OV13858_ANA_GAIN_DEFAULT=090x80
=20

