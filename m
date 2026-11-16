Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810576;
	b=kOZmOh2PHH+OzLJBZjL4JBMHt/y3G4ifyANUTQSCgSin2s6H3aypNQ1h2LL1nNNUKUO7
	 97aZ1lHZk6tLx7VSjCIoRdcxMzg53wKmUCIhC+W7k49oRjA2spCOFTr/dLPrn/jITVaq3
	 0t+RhIR65jYp6rgk7q2eP1FdI2s3YwtImrBrKPx9yFQPxu17Zu4dZ7EBQF1dtZ0pWddlt
	 4l7b016Hdx9nUg98iQC2DqSkLav68COaPNsJYgmkoDugKZR79H9RfnINVqdDEojCkg0y8
	 +Hk1dzIcWM0/nigxaAxtDCUrQX6axuVcyWTVmExkJEAb1h1L8JafoXVAkFkkdR0BcyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=W5ubNBjYB7gj80s79SF+MJ9soJGkJ6wOwgYIYNtKFtg=;
	b=zJG4D+YY/+BBxhIcbGKJTCckdXXUs/PFK2XZKsUzdUuuVNtmwOsNLojbIzeUr3UR95jH
	 oAJgjaRhhTpaecdltSV5CX5W19Vm9KF6Pvgz8Zt7JZrYQB1wkXNP426+W1dPw7RPPxgxv
	 /pmcFvdJLt01fJaL5iktNweYSRV7/0z3xC0Z2LMqFXaOeqW0Vnja1pqs/d9piV7qNRhr7
	 h0YuMoi1OKh9mBeem5Mk+8PwyVZSFVOi4x4rcF3yLMWT/PhJ3AeThekRsmP8pJXy+DqZx
	 7T+A/PTvddQapCI68YxiZiBmcWm/xQGFdHBvXxko2FRttyJyq6gYKwKu+tLrNCBws/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="in/mlC3N";
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADCF606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DADCF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=in/mlC3N
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b4c8b51b58so2721858b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810575; x=1795415375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W5ubNBjYB7gj80s79SF+MJ9soJGkJ6wOwgYIYNtKFtg=;
        b=in/mlC3NccXXcNXQfVbNv8b15JjccC4L1zO4lkVzKYVZJj7W/+0bKewQNEK6gZEhnV
         si7O+WZnM4lPE76uV3sbBxpDAOwvJVGHCtcMZykFdaWhoLAxtAbRXtqyV918k/z7K3kA
         O8ZqxMKQj1p5j3md4WKkcs+zBjwHEnOgKzS22bqlafc6tNRLxRFfnn2NHMecQkfD3z4q
         zr3vEbe9GIQjDwzobXjA/tDYObuCUO08H7oAM6A/P86XmUGrPXwwPuLMmMvMS5owSA6z
         QR1dhL7VyrjjUC5nNQAkaODzzCdhMXbtf5QoQMrc9EfaumbUJu1JlPUTcyqTmRaSnhYB
         MtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810575; x=1795415375;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W5ubNBjYB7gj80s79SF+MJ9soJGkJ6wOwgYIYNtKFtg=;
        b=YmuBA0FY7sPaVnsG48qBo4KeVOVs8jhUYtf56ecpTOJzzCfEPl3/dmGspxPw+1fXw4
         RkZUtstkRqjQHqCht94bIkPrAe5/SewuR+lqWhzt57zqQ2zBAhDfqkaDtagZWH5HBETc
         SDAWJguya/fs5f5n56l/l5+PCe4Ir78HwdZIt7e4uKOIbh/WMuUcZzmIPSKjHUTCyJDV
         MXQHnExlIZ5PdpOIJc6eEfMbo+Xd3sBi1CF/YhvNH8c/FeV8vcL/8ONUjdy+Z54RTri2
         XSHFgoi3yFZKi6+cT8AmROZSKxRiCQxx1WUk+no9BACCmOIWAFrJclt7nk5LuyCdqYls
         nf+w==
X-Forwarded-Encrypted: i=1; AL+hErFHUP2TpiVp5ErauXf1pZcKltAVCWSrqkiEQm0Y6LR+4dLaELGiewdJKTkCujOQoTu79c6PyRGzIIofRHk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uCoTpNa52OU6/iknKFabKql/U4A5agkmKYQjmvRoUgB6o9eFz
	x6cwwAA+1ecw58a+dG/ar7Z/hFk8VIDbVwZa9JJ+ilaxPnqYhtnNp5Fg
X-Gm-Gg: AYBFou0fTxbf9FOGWNmeGMHk6kFdy992wQlrUojPXmJbn1bDQMXaQUZ4k32PrEUA4yR
	pUymoNuw3CEsqJcRYeSqB2jVMIhZoc5F1HLCTcgPW3H4BTOBtxAK1OH2++8LAqVtOJB6vmeE5QG
	71NWMzbbLygCu9jTKss/Cv2j+i+qfDPym8ZmQ32CYfL2167ZfmfvXM3zBIoj6/mKKi7FXf7my/e
	IZGCqsfDaC6qGaw5rabDbmmgqxJeKO3XfKfqvVEFmNUiEtuoz2SlunSJgjryqKORGdinA/dbEGV
	e5eiLBAdwjdfZ+74TArRqPGy7C01mOgHawHktOC8qfWQSluPWbymFE743uqONbQZ25oTGOKlBd8
	QtSJMOhL7/2ZVDimK30P4iwvVFKc4Z3ibf77gQmS+W9Cr2xQ+lpY3I/8O4CNgqWD472SO8T/ILg
	38Rp17PddsIEqoJpAnQgiUX1L6IMULXgOXr3es4w8+XwC45oFScFDIFxK3kGx4iIwvgCA9OkGYd
	wKkZj5s/VHkBsnP3AoiYGa+suNIXJgDo9+CslWJVyP00Bom1Vao4MMsnVzG5Yg7HdZqiTBsXxy0
	f0/ielFOAMN7wCoKUpsJe8NaVcT1TRflYFU2/Xt9xSgHpY+IZKhJD4zckius6ZAF6o+z
X-Received: by 2002:a05:6a00:4b52:b0:89e:df2e:cebb with SMTP id d2e1a72fcca58-8beb7d1ce3dmr10000964b3a.59.1794810575158;
        Sun, 15 Nov 2026 22:29:35 -0800 (PST)
Received: from linux.internal.banvien.com ([119.82.142.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2346e73sm3387975b3a.40.2026.11.15.22.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:29:34 -0800 (PST)
From: Nhat Tran <nhat.tranminhk2@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nhat Tran <nhat.tranminhk2@gmail.com>
Subject: [PATCH] thermal/drivers/rzg2l: Fix precision loss in temperature calculation
Date: Mon, 16 Nov 2026 13:29:09 +0700
Message-Id: <20261116062909.36618-1-nhat.tranminhk2@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

According to the RZ/G2L hardware user's manual (Rev.1.50, section
44.4.4 Procedure for Measuring the Temperature) the temperature is
computed as

  Tj = (DSENSOR - OTPTSUTRIM1) * (165 / (OTPTSUTRIM0 - OTPTSUTRIM1)) - 40

The driver follows the same grouping with integer arithmetic, so the
fractional part of 165000 / (calib0 - calib1) is truncated before it is
multiplied by (dsensor - calib1). Above -40 °C this always makes the
driver report a lower value than the real one, and the error grows
linearly with the temperature, so trip points are crossed later than
configured.

On an RZ/G2L SMARC EVK with OTP calibration values calib0 = 2902 and
calib1 = 586, the slope 71.24 is truncated to 71. The computed value is
313 m°C too low at 52 °C and 351 m°C too low at 63 °C, e.g. 62382 m°C
instead of 62733 m°C, which is reported as 62500 instead of 63000 after
rounding. With the default calibration values (3148, 503) the
calculated error is about 1 °C at 125 °C.

Multiply before dividing, as rzg3s_thermal already does, and use signed
arithmetic so that temperatures below -40 °C are still handled. The
intermediate value is at most 4095 * 165000, which fits in a signed
32-bit integer.

Fixes: 673c68bd4839 ("thermal/drivers: Add TSU driver for RZ/G2L")
Signed-off-by: Nhat Tran <nhat.tranminhk2@gmail.com>
---
 drivers/thermal/renesas/rzg2l_thermal.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/renesas/rzg2l_thermal.c b/drivers/thermal/renesas/rzg2l_thermal.c
index 90e2ba378a4b..3295eef12001 100644
--- a/drivers/thermal/renesas/rzg2l_thermal.c
+++ b/drivers/thermal/renesas/rzg2l_thermal.c
@@ -75,8 +75,8 @@ static inline void rzg2l_thermal_write(struct rzg2l_thermal_priv *priv, u32 reg,
 static int rzg2l_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 {
 	struct rzg2l_thermal_priv *priv = thermal_zone_device_priv(tz);
-	u32 result = 0, dsensor, ts_code_ave;
-	int val, i;
+	u32 result = 0, ts_code_ave;
+	int dsensor, val, i;
 
 	for (i = 0; i < TS_CODE_CAP_TIMES ; i++) {
 		/*
@@ -105,8 +105,8 @@ static int rzg2l_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 	 * Tj = (dsensor − calib1) * 165/ (calib0 − calib1) − 40
 	 * where calib0 and calib1 are the calibration values.
 	 */
-	val = ((dsensor - priv->calib1) * (MCELSIUS(165) /
-		(priv->calib0 - priv->calib1))) - MCELSIUS(40);
+	val = (dsensor - (int)priv->calib1) * MCELSIUS(165) /
+	      (int)(priv->calib0 - priv->calib1) - MCELSIUS(40);
 
 	*temp = roundup(val, RZG2L_THERMAL_GRAN);
 
-- 
2.25.1

