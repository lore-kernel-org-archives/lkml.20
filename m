Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062503314DE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026323; cv=none; b=WquwCiqDn9UAwHwmtnpk514UDJ/EEeW2xLYZrcPmwk+TOGmUgWJzYZcihw4TMqb+nwMOCP7JkpEgA06KE6bAseNXWzMxbNO82Pl/ErVefbY4pSj6l8FipeRmE4kx/F1uJ/hR+6ZB8klbOow476+e4bSKlUJFWACT2ffSGC+KOVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026323; c=relaxed/simple;
	bh=n/d7HWNTYU5Q3kG1iBDkGKT8mLK9Pf+E32vLhkgrMVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KZ7sWX9wnEHtUAlP2ihZFl+MwohnDU0ISzb0OZFf3h9XUHJrtga7v8mmnOuAvJIZp42YR9Yn38lbnOLbi3AoG3LxefFMP3TM8dAITrg5YABSondVpRd0NF52Bxl9+LA4QO7Skit42PYxaDt43mvQ2N5UdIIgFhiWSj3qvhOPWb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DElOq/oS; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DElOq/oS"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-485850cbac3so4275230f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789026320; x=1789631120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TmGY48YFLUyzzSWarNmLSyWYwm/BjrcQMX/n4tj7yYE=;
        b=DElOq/oSUNoUJsemEaUWrFfTvUhdh7KWEzSQmBL2KMvQetozMqpGWvM+Cor3TI/eB+
         wiOvjWpeBDQet+aQ/dTlB9Cv4RukZ4HASMid5EWKg8UTxAouRU/YvfXRGHErXRPZPL90
         6VeuYpyZJEzjWWJfh9a7uP4yNtoxFTUvnJi/ow0OEn0vPZIcHkg1dVgeBt7oc/CjS7O0
         Cxat4gHZ0LdnS5AiJoI+e1hfsgxCTAS/5SewG4n/xJCir4Dkv1WRqQ5Jy5RplfenGP59
         PFygb70Sf8vyobQ0UMHY70SVu7m4jziuetOwd8hYeDkHUudSxsTPZNegokKDkkbcA5Xm
         RZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789026320; x=1789631120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TmGY48YFLUyzzSWarNmLSyWYwm/BjrcQMX/n4tj7yYE=;
        b=jyVPbSD3vOps4C1ZZjPcG1TxMTmyXLhHqGEsXGmvpzE3I6tQcvOtwlbkqBqmvfbdfG
         r+zzYQZT/St7g/gu/ZgsPhc2Uaei1M9LUOFGo+2Oh9qKHqzYmfTIPfaEy5pZhU+llmmb
         6VYSWBEtWEZ5JzSAeUAty0Wxl3Rn89JTlTxcscvzQ8m6okpQF5hjnJX6yi/KPanSczgd
         7KoQfWtCQeFUlWcMnspFs9zMP5R01hSptIn6k+PtzzXgJ/zixNOVhcdA5jrUUQVHW42Y
         bl8cskVUJBH32fD/qY54Zh3TIyPvXkJ6Rwrg2mIkc1NxowkMZZ96IH5yzteR5UNEadl8
         i9aA==
X-Forwarded-Encrypted: i=1; AKwUvBy+hk4QynqSgeCQICSXsI9Wa7KAsR2mtQ8rg8K4cdeQQmsVkYdNB9IwH7rkhs0iNVU/XjblGfk2tOgTojY=@vger.kernel.org
X-Gm-Message-State: AFuF++mRmQHC8zAKbDp3TQh9Dpt3OH6xCrpQIcl/51ihclvIKfrjCd+N
	eQbnSotkpB32s1jlD3Fpaik02Jryz54y1Hx/DrCOVuTWlhaLkPAmuaD4LZsrlKAHh/yr6g==
X-Gm-Gg: AYBFou36Nc076XQX7ZPVOHQrwrdiB6E/qFRPq6avKNKzT5A5mStBCPIIEnH5Rcqxhk0
	q2AAS2xqndDfUeaIVHWvfdfkOCQZ1/zgKdPkPZuVLr+RR+aR4jjZsBqdcy3DsN0mzs5kBujuG7o
	9cTgfAGWBgQ1flr/AcVSj/3qiwrw6pT8HCFJsVyKO7tw7RWgm2ZUOigbEPS7R78/bEblnFDVw3R
	SFbtiLnTj8dKAJVOH560Eo09rn8Ly7TS7dp9tnF9EYhN4EBDOBEydbfA9i8Uuk1c7iNxRPTngeS
	PiBx6H+xwqsnw0rfcko7XLG13Bzb5X3mi5BhQBtqm5lxLcmgN9Jt+iotx1pZl7zWx2kSR1X8A3a
	K5qN4jdzddzDFuG04WWbreN48uPXf2FezJV/ntj+NObTatau2bXybFoWyyHrg+G5as6oZd+BjlW
	+yzSe7rqR0sW70uCi4WAzJC0pQCZukrD7YytAt3KndBrP3q3MThiJczO0+SYKf8P2do8hVJ/blS
	DHg5qkCQ+69RnB7CzZMTS7jdiCBNdfJ2H+3aY2vmUgTLSY9QlCmlLR18w8=
X-Received: by 2002:a05:600c:630a:b0:49d:2625:1b0f with SMTP id 5b1f17b1804b1-49d26251b4cmr36609165e9.31.1789026319826;
        Thu, 10 Sep 2026 00:45:19 -0700 (PDT)
Received: from sergio-82n7.fritz.box (host27-7-217-213.cgnat.broadband.ehiweb.it. [213.217.7.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm54366260f8f.25.2026.09.10.00.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:45:19 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: [PATCH v3] Documentation: hwmon: (yogafan) adjust table alignment for long model name
Date: Thu, 10 Sep 2026 09:45:05 +0200
Message-ID: <20260910074505.1077544-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the reStructuredText table layout and column separators to
accommodate the longer product family string for the newly added IdeaPad
model (IdeaPad 3 15ALC6 Ub). This prevents Sphinx build warnings and
maintains proper visual alignment.

Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
---
v3: Adjust rst table alignment and column separators for the new IdeaPad model.
v2: Split changes and addressed reviewer comments.
---
 Documentation/hwmon/yogafan.rst | 47 ++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
index 9ff5db5dc..239c7b576 100644
--- a/Documentation/hwmon/yogafan.rst
+++ b/Documentation/hwmon/yogafan.rst
@@ -85,28 +85,30 @@ immediately to ensure the user knows the fan has stopped.
 
 ::
 
- MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PATH          | WIDTH  | MULTiplier
- ----------------------------------------------------------------------------------------------------
- 82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
- 80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
- 83E2           | Yoga Pro 7       | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
- 83DN           | Yoga Pro 9 16IMH9 | 0x06/0xFE | \_SB.PC00.LPCB.EC0.FANS/FA2S  |  8-bit | 100
- 82A2 / 82A3    | Yoga Slim 7      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
- 81YM / 82FG    | IdeaPad 5        | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
- 82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
- 82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
- 82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
- 82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
- 82XV / 83DV    | LOQ 15/16        | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS /FA2S  | 16-bit | 1
- 83AK           | ThinkBook G6     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
- 81X1           | Flex 5           | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
- 83KF           | XiaoXinPro 13ARE | 0x06/0xFE | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
- 82KU           | IdeaPad 3 15ALC6 | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
- 83RU           | Legion Pro 7 16  | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
- 83KF           | Yoga Pro 7 14IAH | 0x06      | \_SB.PC00.LPCB.EC0.FANS        |  8-bit | 100
- 83BS           | Yoga 7 16ARP8    | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
- *Legacy*       | Pre-2020 Models  | 0x06      | \_SB.PCI0.LPC.EC.FAN0          |  8-bit | 100
- ----------------------------------------------------------------------------------------------------
+ MODEL (DMI PN) | FAMILY / SERIES     | EC OFFSET | FULL ACPI OBJECT PATH          | WIDTH  | MULTiplier
+ -------------------------------------------------------------------------------------------------------
+ 82N7           | Yoga 14cACN 2021    | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
+ 81TD           | Yoga 740-15IML      | 0x06      | \_SB.PCI0.LPCB.EC0.FANS        |  8-bit | 100
+ 82KU           | IdeaPad 3 15ALC6 Ub | 0x06      | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
+ 80V2 / 81C3    | Yoga 710/720        | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
+ 83E2           | Yoga Pro 7          | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
+ 83DN           | Yoga Pro 9 16IMH9   | 0x06/0xFE | \_SB.PC00.LPCB.EC0.FANS/FA2S   |  8-bit | 100
+ 82A2 / 82A3    | Yoga Slim 7         | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
+ 81YM / 82FG    | IdeaPad 5           | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
+ 82JW / 82JU    | Legion 5 (AMD)      | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
+ 82JW / 82JU    | Legion 5 (AMD)      | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
+ 82WQ           | Legion 7i (Int)     | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
+ 82WQ           | Legion 7i (Int)     | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
+ 82XV / 83DV    | LOQ 15/16           | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS /FA2S  | 16-bit | 1
+ 83AK           | ThinkBook G6        | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
+ 81X1           | Flex 5              | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
+ 83KF           | XiaoXinPro 13ARE    | 0x06/0xFE | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
+ 82KU           | IdeaPad 3 15ALC6    | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
+ 83RU           | Legion Pro 7 16     | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
+ 83KF           | Yoga Pro 7 14IAH    | 0x06      | \_SB.PC00.LPCB.EC0.FANS        |  8-bit | 100
+ 83BS           | Yoga 7 16ARP8       | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
+ *Legacy*       | Pre-2020 Models     | 0x06      | \_SB.PCI0.LPC.EC.FAN0          |  8-bit | 100
+ -------------------------------------------------------------------------------------------------------
 
 METHODOLOGY & IDENTIFICATION:
 
@@ -159,6 +161,7 @@ Contributors & DSDT Providers:
 - **Sarbajit Sarkar** (Lenovo LOQ 15IAX9)
 - **HinataKato** (XiaoXin Pro 13ARE 2020 - 83KF)
 - **PenPenIsGod** (IdeaPad 3 15ALC6 - 82KU & Legion Pro 7 16AFR10H - 83RU)
+- **wizard-28** (IdeaPad 3 15ALC6 Ub - 82KU)
 - **unlockxiaom** (Legion Pro 7 16AFR10H - 83RU, Yoga Pro 7 14IAH10 - 83KF, ThinkCentre M80q)
 - **Phani Pavan K** (Yoga Pro 7 14IAH10 - 83KF)
 - **Splarkszter** (Yoga 7 16ARP8 - 83BS)
-- 
2.55.0

