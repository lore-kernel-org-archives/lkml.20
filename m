Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0555A3921CE
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789850899; cv=none; b=u9KJb+I2Jh/tIJIuPRxuk1sG68vs0jJ8gyYZ0ugRI2K1vVAqz5Old4piqoyk4IU/v7dg36MCgNLIgVmMVpnFI7YOSrjMiRwy/lLF0ApdJ7hEIBP/kD6CrV5GLM+ralsjalKW+DkeTBstKDJIXZjBZ+grsrRdV6RxNRZRMIklJow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789850899; c=relaxed/simple;
	bh=kliTvICRH0Fcd6Vd2aAXvpTk/pzziOHkHnc3NS+KfaA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uQqMcmnzvxOD0Qlx/p8Ux1CFjMzTHmmdEaNaaXDP0zchFKIousWoTk7yGHv9Mn6CMZ3x0ZZigD3l1k3TcuHwfq9SRv88/zKYzZfGDJtaMS6ugsPkxRFtdf6ocylpeUOJjEhtlmRZI94TEsLyOJ3W7H6+pM19DDpqNfg3UhxepVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tF8Ph803; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tF8Ph803"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2d747f05ffcso14049715ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789850897; x=1790455697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ao07vO5WCBmMaWfKvIi66w+Y2+Y6qk8tpF9eVXkWu4=;
        b=tF8Ph803eh7T7j7Cyz9qiWffS/mfG3olxCZG0MysENHKol2tKXQCwpQo51mVx0wCR9
         oPkp8AkHiINBNAfpVY7QX/R1KrCBFm60Z90wA2KlV3r8st5jnJV4ZhG6oy0WzJbXvy1I
         uDKkbD79rNmAJSLzXsMXz0l5Dcu4QGKT4oOUrbYyReFPMULHlSos8dRGt2kLoqciVJ7y
         79g45uqw7YcuhYSFf7gvZV/ocNTM/UUibuvKvfAxfnOyj9XEuan93OEmGa8iqmyQFQ0u
         lkQrVmNn18v2UI6XNx1he/HqFnjRD5tHbfewc59I1widnrLMab3STzXf0Vyt+X+x+6u2
         yDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789850897; x=1790455697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ao07vO5WCBmMaWfKvIi66w+Y2+Y6qk8tpF9eVXkWu4=;
        b=2ERyMfY4bNdtfdPKTod4wHFnsuFMx8nB6N9i95DY8n12kbTOfAX7bAZ9q4sGEIuYoK
         MfM9HJ9Z7jDqGosJXo9sBGP5phLL0U3yeysGP5eABSgUlCkxXd0ODzQWtoqAhVj37EyH
         KmXe/t5Dw7vjZaDSY8uQ4yDf3lfG1vzfZP+6HnIYGP87UZXvVZ+Fv82cxEQcbRiS6tIO
         sZpAJ7IxT7f/CM6r8dFav7vhGVd9ey0XmoiaX1TGWmaW6a8YKFjj9K15FJji6BhyozCx
         DzaaGRggFz25fRAkQV19o2hdPcNTYUPDlb1TF48nCdSe8i4U3yFgC202A/3UBoW8EPmS
         mP2A==
X-Forwarded-Encrypted: i=1; AKwUvByy5AhiE4kZ6Oz7V6RljXBsHhbmCq8MtqR2INXWAqsUiwutNZQIaWLkUX1mZmTdlYed4Vf0XVeFkjWiB3o=@vger.kernel.org
X-Gm-Message-State: AFuF++mD8DqSaBYFqBBHNyMGqP7do4koQ4/tq+SxD+Ks04XFd6Ps+XnY
	brbh+7u3G/lnr4cTiAp6EANSB1yVL5Qyz0s0G7faI2oBhOflMlv7Lqn2
X-Gm-Gg: AYBFou0XrQpI3v+IrXXd3ieZYfFsOzPeJRT1hUnH2sRU3s0PAMKgRhT5dh9F0afbpX9
	4arn7W6tgR4xsPzvXtkS49LjCqpRrcSr+rcVCtSnpotgIFhP+SGSpJAszJEb1s37ReolmjS7PxO
	DRFVEOQAugkqCFoLswbRr78SUlKJVlhcOjQibmnRBTY+fOm8izqUqUZlEZDaF2td0mQXuSqWLYs
	ngk2QAqjNHd9RZzcGmuqf6z0/fsOl0bxeWOFIa4zq4B9BqEmXXutFyzw+xu8vy7Px7wB2jbOuo8
	i9R+fQlcOE0INVv3+SGfSl0iOZ7wMeKhMN6naD9wK4IB2qpkNjLTZDy4e0g9aiGyXR+nvdbipF4
	4GbvHGl9tOv9RDyWRhv7RUpC3MhnnbjHpuuC3YFa4C4XepN5hlj8cL1NVVnZkVJ3tXRgkkggrKS
	FWA134NTNGtRvO9xCMosDkTmYtHTFraI8zgluhIpPcP5utg53abRVDs44JAPQ+HO0P49C5NLeo0
	KdT1zULXXAkv/mWBZ9edxP85nLyjpnukCDCUuxpx7iHs1msLMkB2bU4A7QqOatJHzSvaa5JFRoR
	SVjW00eZSw==
X-Received: by 2002:a17:90b:4b85:b0:39e:6c6a:2096 with SMTP id 98e67ed59e1d1-39e6c6a22e1mr4411473a91.55.1789850897297;
        Sat, 19 Sep 2026 13:48:17 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5ccf8634sm3957373a91.2.2026.09.19.13.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 13:48:17 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: serio - acquire device_lock(&serio->dev) in serio_bind_driver()
Date: Sat, 19 Sep 2026 20:48:16 +0000
Message-ID: <20260919204816.2815952-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drvctl_store() calls serio_bind_driver(serio, drv) under serio_mutex
without holding device_lock(&serio->dev). Because sysfs driver bind and
unbind attributes (/sys/bus/serio/drivers/<drv>/bind and unbind)
serialize via device_lock(&serio->dev) without acquiring serio_mutex,
serio_bind_driver() can race concurrently with bind_store() or
unbind_store(), causing duplicate sysfs link creation warnings
(sysfs_warn_dup / -EEXIST) or NULL pointer dereferences in klist_put().

Acquire guard(device)(&serio->dev) in serio_bind_driver() and check
serio->dev.driver before binding.

Fixes: 0a66045bcfd3 ("Input: serio core - handle errors returned by device_bind_driver()")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/input/serio/serio.c b/drivers/input/serio/serio.c
--- a/drivers/input/serio/serio.c
+++ b/drivers/input/serio/serio.c
@@ -83,6 +83,11 @@ static int serio_bind_driver(struct serio *serio, struct serio_driver *drv)
 {
 	int error;
 
+	guard(device)(&serio->dev);
+
+	if (serio->dev.driver)
+		return serio->dev.driver == &drv->driver ? 0 : -EBUSY;
+
 	if (serio_match_port(drv->id_table, serio)) {
 
 		serio->dev.driver = &drv->driver;
-- 
2.43.0
