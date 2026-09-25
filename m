Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641FB3148C9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790335099; cv=none; b=PC+sbTmA7BcwOhqQHOllXJLcIU+ad7VIacYnoNj18N4q1KScKJMOvSpavXfdlxNb4/OYyRDVBDIkMJjzLIM28ip/RKs4FE7nPsvcdwQSXl9nNTG+YsJE02YFvrhQggvmUyO4PwWWIvpqDX+EjgZSUlZavExSlYf/TlEpwz/IFW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790335099; c=relaxed/simple;
	bh=qQvHNbcNv86OUv4+0sUm6+7CdMwi0kP9PrqQI0TYCog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kC+AN6oxbDdNu5x7Oemi8e3N3JHBvf12y4qdHj1MVzdZn4TZDRW3nPlxtwLD3mXCKhGUEOPhEJ2FINQAxL4oUAATcc2nwowC1ZrxWtv3kwHblCr8cWXVlt3GZxg+8xSowYmnW+6QevtY4dt8bk8HafF9CO6Sy3p/NH18OqBCGOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5d8FIdD; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5d8FIdD"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-34182b58c7eso454458eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790335097; x=1790939897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o37z/WFs2S7wSK+zKaTZnLYQIEauaxwWZx8GFjSZetU=;
        b=S5d8FIdDFlWvPf5VVqgowd3YZrat5bg9jOSVN+ocNDIUzCuMfWSlTDV8OxYYxDkweC
         2jKGyphXDmb3nCP3fNchdax2YcktXozaCSyMEbMqgMCMjrK5+re9AL0Bim98H1hkTtgl
         +DBoRzuBc1t9KYF0e5UMYO7X/pcQJLJdDg4YubymGfRByiBt4gvfvUkIykgL65KuvOz1
         vcosq1e/d6wLg82r1xr/mpIrPsAOlKIz0qNpY4LKD96NM8I/J1pAdknESjnyVwvw9GAP
         wRlYOvDIHSqNo+e+p44b4Pr8j5sdGmTcsGpcgUZ+wQ/iVIUycbktS4Uk0J8QSnrD8zED
         2mjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790335097; x=1790939897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o37z/WFs2S7wSK+zKaTZnLYQIEauaxwWZx8GFjSZetU=;
        b=vApfGLcH5AuooAVWi8bk2638hU7Yl6CbELuSY9O0DuYfUTAeChh8fjHAx7Spk/i5wd
         YcSje7qPQnIw98QSYq+hTuuCoxBFAv13xEmPe/tg4OnF5wrxgfjhYdvoxjtt1E6TK2al
         dXYlyfrG2fPmOzZjDeMOwcyVzYZ9JzGSRz/i851DFUPcZ3R7LObeUVs3di7nq6ZiAhru
         lGZq/PAEiMPpHFm0xFTin8BWczeqOXlDYZinqUDrACrdjpCu32PiK4HUymnRpTxIKgTf
         ierIJrYxUT3Qqr83cuk8i2/IK05NAt6vTFJ11yjp2zOUiJ+23qZSINvatgqJeXKbvoRt
         zhtQ==
X-Forwarded-Encrypted: i=1; AKwUvBziX55b5XMtlgiKZKtW2Lz027FYEFiVwdKTPl+IiwX4jDxPrRWhRt1SOYNZWmoUY7Te/Jbucd/7EOaV3XE=@vger.kernel.org
X-Gm-Message-State: AFuF++mFVQ47zgr2uQ81KcRNDBy+RcNxPz7aV5AXTZ7e1oEua9jcfbhw
	SUdfzw6yblOJZVGgjOYasbzB2uVGfMdpGzRKg0Qq1CVzpurk3asvTIKM
X-Gm-Gg: AYBFou3wRelSxdRaWXrUYrnlOrb9movhlv4ht6ZkoHhi4bAHEOgTk86VQoJ1O25d/Z1
	di1sA0o7k6IG2SzJEU78RGYWw/iZBlqK/T6bRfWk9otsPtWHUFe7i6e4W139xExVO4sL7KTqtw9
	PC5drK5dWdSGO60Bmo7+NqKu9/nSOyDsc78i+CzeZqNjVgExLB4lBGAsusbnD2FVqFUvJ+j4qdt
	X188s5xvdEDjb1KjpBeoTseoyMMhbhBRIYWMwvpyLvd1AUY9zWSjAZw9S+gWULWnjtJIKcCzIJB
	J0xd5cstRbJpYDneOu+XuVzvNqgOn0zuNo+/XrmkghSy26t58MPQ7Ww8s+NWbC/ChrbdLcMtN7A
	rsT3/fWZkgRfePdmP1dLqr4SWJk6AoGDSCQWws7WXTf1cxAwrrZHqafOARd6QU8rpTY9OtLLqv7
	vi9vx1scK+g0LgIoI2EDcv88P5mb976+URMBskt2PGPwKSIcVtWFcncRlzorMvoul5SPR5Rl7g6
	f4Vgg2lM5QwD8DjFY7V5rE0bbUfjF7biBjUEg==
X-Received: by 2002:a05:7300:ea11:b0:33c:e82:70c8 with SMTP id 5a478bee46e88-34000c300c1mr4557256eec.31.1790335097180;
        Fri, 25 Sep 2026 04:18:17 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:8004:98ea:c60f:8ff:fe17:57ff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145c17074sm5463427eec.26.2026.09.25.04.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 04:18:16 -0700 (PDT)
From: Bihaan Sen <stevewholikesthings@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bihaan Sen <stevewholikesthings@gmail.com>
Subject: [PATCH v2] Input: xpad - add support for 8BitDo Pro 2 Wired Controller for Xbox
Date: Fri, 25 Sep 2026 16:47:56 +0530
Message-ID: <20260925111806.89555-1-stevewholikesthings@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925092439.79904-1-stevewholikesthings@gmail.com>
References: <20260925092439.79904-1-stevewholikesthings@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 8BitDo Pro 2 Wired Controller for Xbox is already matched by the
vendor-wide XPAD_XBOXONE_VENDOR(0x2dc8) entry, but a later hardware
revision reports product ID 0x201e, which has no entry in the
xpad_device table. The device therefore binds and functions but is
exposed to userspace as "Generic X-Box pad".

Add the VID/PID pair so the controller is named correctly.

Signed-off-by: Bihaan Sen <stevewholikesthings@gmail.com>
---
v2: move the entry after 0x200f to keep xpad_device sorted by product ID

 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index feb8f368f834..39e835dab9df 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -372,6 +372,7 @@ static const struct xpad_device {
 	{ 0x2993, 0x2001, "TECNO Pocket Go", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x200f, "8BitDo Ultimate 3-mode Controller for Xbox", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
+	{ 0x2dc8, 0x201e, "8BitDo Pro 2 Wired Controller for Xbox", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x3106, "8BitDo Ultimate Wireless / Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x3109, "8BitDo Ultimate Wireless Bluetooth", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x310a, "8BitDo Ultimate 2C Wireless Controller", 0, XTYPE_XBOX360 },
-- 
2.55.0

