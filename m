Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B195E3BB123
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788101841; cv=none; b=kKpkWABsUeCAcSEx90iLji7gSx62HOk8yf6Fm+FLhZL8tgDvj311gdYMpr8jo6SYQmlX38YeTMmBOY/VO/WQhxzzej0hj1E8SlRPqHamA3gF2LSFs1bk+odgUQWPErWb/0lIv9RdguhtsKDQ7aWW07Ehdy1Dt7J1uFipFdTDb9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788101841; c=relaxed/simple;
	bh=b1F0QGdcNcKqjBmJqPYaGuRqoPzwEbKHfEf64wpPqLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QcSu6gDihhL4tsZLEZ1qQ+yqJYubVWpbVCZHQlvb/Dbj/YLUHo2+MaLR1ahSwXp2sHMDtsgk3g574oEGJ4IunbjdQmkk2avjbuquA3oiFt2Km1eLhNIZvQrpHaJUAB3j8D4smRaP2obnwLBVVoS0vQkhceYnlE/j2fq2ABVLUpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xghm78Ci; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xghm78Ci"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso1853181a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788101840; x=1788706640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ia2lwM8sH8Xra67OChYDjtdRyZ6AcvO2JIxbnOb99b4=;
        b=Xghm78Ci3qo7kzjWYs0B91LTgEo0GhheRNJYGNGAZG8kHIOen4ku5zXU7l+FBcarGM
         cGZUBZOsDupgwQAeNpod5uaxMOaLI0syks5A5vohJ0McDlvzhwjLrnxTgpDYyku2LUFO
         rjf6yz1luOaMQ3xaJNr+SOHFeqAAjUA6orJozW+8MC2MGM9UHIvGXj2qLQ2eoA2gGfgc
         /DweK3wOuHd/7KR0zUYPviFcOGY3XNLP2dL2jh2npIDW98P4lUQqjILEl3UkYRZlq4In
         T6DAUdYeOzobuvf7m1o3gMYwdRWPYHeykCvX/EiE4GSSr9NJvKTDKzGmWw7di4CMSiX+
         AfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788101840; x=1788706640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ia2lwM8sH8Xra67OChYDjtdRyZ6AcvO2JIxbnOb99b4=;
        b=sdtnbc24fQKnmJJ7yjjL31r2C/+6nXYOEPIET+zLo9yURBFMqsd4T7jXk/U3tVUXmI
         2mo8c+5kHwR6Ej1+jS9ONOXqCroXs60LCciDJl41UYNbd12tDfaUKu0XYXsLesTfaXjx
         fjTTO2cEn4hAMl4crE3J12/1HzxcZ+DHBb4RfKxlKYslSwdygQDrISui/lzV/2knvoMR
         m7c+XqgliwQmYozfgv1AOY5gqucvZC/l+mHi2W0xnkhLagH5aaWDMZxJhGE0qejpa6+8
         qBJHc5rCj4nT/JdlqxFLHjgAkw9xjiyzQsbBP+6Rq17QP0TTrgN7rDRD2oOr3yItt/OO
         AibA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7TOlLDItYNudm/bkGR8H2dixcXMZlobDP6cRq+Sso7I7UF0iqiXjH1iGDW580oTDGFMYFEFdAG8vi7Bg=@vger.kernel.org
X-Gm-Message-State: AFuF++lHHgFZ3DMHeoRxuwnEbfZ/IaPEhr1U8/kIHvFnko7DJ/XEjee/
	it9qkTvRWWgUZ9bk8joSALW7FF09J5rJDfqWftzDM2FNjOKZcnx8l4dm
X-Gm-Gg: AR+sD10wgaDm16j2at46zUC5h72yCVZRw+j5kkJ6zx6cDasvR2CI66Fc7nOpFeltrwJ
	8W4WRL6Gxwo92wvA/3zdrdtbIW3w73JonVS0lCcAg1phXBjZuWJL0V51H7xjqLuv+eiS8N0+Qs3
	qsZ6jhtmO4myCZs5R7aqjBuSYd1AJNRNbwk1StUIbSnntRtb/K3oxReT1ngiZGPlNj0eeaJ2HGV
	wJBBbqc0Fokia1BxCmU6Mqc2yYAtU+nEknZ2OJLokorCOqpo5+KpvgKaIgX+R806yVPBZ7Efp+m
	MYZbct0gjUBpCy7NSOfJckai5PF/jk2YngMdbZzdi1YjFnorPTX/mA/NJFeWIsgH3IXAMJb06pC
	CFJvLO6DzALP7l8d0S0tjsrxNjf3Nw+xpd6wyKg7Vht74Duvi8JMFpLOl4e665e/qPg7PDE6VHa
	OX3QqU7In3dTeEd/5rt7GcR3fytWqexpHPJwYhbcemlvHabd4DpF6+strEyqNMCDDt4i7xyk8uC
	eTPNM0pikXldlmKJzI=
X-Received: by 2002:a05:6a20:9151:b0:3c0:b943:f984 with SMTP id adf61e73a8af0-3d2658376f7mr29403739637.3.1788101840016;
        Sun, 30 Aug 2026 07:57:20 -0700 (PDT)
Received: from localhost.localdomain ([103.16.69.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f959575sm23198024eec.15.2026.08.30.07.57.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 07:57:19 -0700 (PDT)
From: Aditya Dash <mradityadash@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] HID: hid-lenovo-go: normalize calibration failure status
Date: Sun, 30 Aug 2026 20:26:56 +0530
Message-ID: <c7b6d167fae5846377d49b57b0f542063fd80ad1.1788096668.git.mradityadash@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788096666.git.mradityadash@gmail.com>
References: <cover.1788096666.git.mradityadash@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver stores the firmware result byte as an index into the
calibration status text. A Legion Go 1 returned 0x08 after an idle Stop.
The status table has only three entries, so a later read returns -EINVAL.

Keep the defined values 0x00 through 0x02. Treat larger result values as
failure before storing them.

Fixes: 995887a10da1 ("HID: hid-lenovo-go: Add Calibration Settings")
Assisted-by: Pi:gpt-5.6-sol
Signed-off-by: Aditya Dash <mradityadash@gmail.com>
---
 drivers/hid/hid-lenovo-go.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
index dbfacbb70394..c7a2e621a4ad 100644
--- a/drivers/hid/hid-lenovo-go.c
+++ b/drivers/hid/hid-lenovo-go.c
@@ -648,17 +648,22 @@ static int hid_go_light_event(struct command_report *cmd_rep)
 
 static int hid_go_device_status_event(struct command_report *cmd_rep)
 {
+	u8 status = cmd_rep->data[1];
+
+	if (status > CAL_STAT_FAILURE)
+		status = CAL_STAT_FAILURE;
+
 	switch (cmd_rep->device_type) {
 	case LEFT_CONTROLLER:
 		switch (cmd_rep->data[0]) {
 		case CALDEV_GYROSCOPE:
-			drvdata.gp_left_gyro_cal_status = cmd_rep->data[1];
+			drvdata.gp_left_gyro_cal_status = status;
 			return 0;
 		case CALDEV_JOYSTICK:
-			drvdata.gp_left_joy_cal_status = cmd_rep->data[1];
+			drvdata.gp_left_joy_cal_status = status;
 			return 0;
 		case CALDEV_TRIGGER:
-			drvdata.gp_left_trigg_cal_status = cmd_rep->data[1];
+			drvdata.gp_left_trigg_cal_status = status;
 			return 0;
 		default:
 			return -EINVAL;
@@ -667,13 +672,13 @@ static int hid_go_device_status_event(struct command_report *cmd_rep)
 	case RIGHT_CONTROLLER:
 		switch (cmd_rep->data[0]) {
 		case CALDEV_GYROSCOPE:
-			drvdata.gp_right_gyro_cal_status = cmd_rep->data[1];
+			drvdata.gp_right_gyro_cal_status = status;
 			return 0;
 		case CALDEV_JOYSTICK:
-			drvdata.gp_right_joy_cal_status = cmd_rep->data[1];
+			drvdata.gp_right_joy_cal_status = status;
 			return 0;
 		case CALDEV_TRIGGER:
-			drvdata.gp_right_trigg_cal_status = cmd_rep->data[1];
+			drvdata.gp_right_trigg_cal_status = status;
 			return 0;
 		default:
 			return -EINVAL;
-- 
2.55.0

