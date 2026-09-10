Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744A13AFCE9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789065813; cv=none; b=Q98HJNfh57ty/iCJEA0kKv25nwVaX6Np/RaJnPF0mIxcN3FSZBjdNgaAB8sfKKooEaHR4/4ZVXf2qfRTQu4prLMpqp7RrsRqMSJo2iLH/HdwAM8DpZ3n5nxGy7kw0RwVuRNzgemO8Yb764xY7wpg6opDMJnMjG2hG6ScH7dm8vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789065813; c=relaxed/simple;
	bh=zxAoEHThtrRI1+PP+mczGKc+hlwe0/Q82vX2QBWledg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r+JUot7XKAY994p/x+LaV7LAyca0OJ4paLc27Y+xs59DqMmEwsF9b5mBCq1aWMxaXO6tT0Czv3Afr4k2XhrsAYtsQC8cVT5m3zoYcGB4Ahk9TfEkdlDvMoKtAF8CiGDHMASLgrcMEDygLOwbWYfvkcxznYeXPVDZTaHYhtcgGbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9M+v8Td; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9M+v8Td"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so725015e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789065809; x=1789670609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fwA3kPn5zA0nZJtDyWePWVLP0eWqJWLwH/csx6HCgdo=;
        b=f9M+v8TdXl3hO7JkxNaLzbvjakCcbtfs4EQPu+9wWejz/x67JZCVEWptt3BEDZ+DKd
         ZMebfBRnqX+OBpX/V7mGi91IqJK23iU7b+YU4SaLCTgnkZv7l1RE2VFuppRjjg0YGbme
         Wr0tdhZuFRaY5qEAR/awqZLBe7Q6O3IbJ9/Cs+1EIHVGnL1y+OAWy/8z7p5PYyIbLaX2
         FY1p83UjJaVxcswpTqNG0Q9MJD5c835DD488P/CQX9l0gb1PaNKm1E2ThQ85rgNRibt3
         IFhFIe4wJXU6duETMrQH+bsAQGZHnWfhLhEGLkPxHv6B82ZxwVi0lqiUPF/GFJQhsReb
         rEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789065809; x=1789670609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fwA3kPn5zA0nZJtDyWePWVLP0eWqJWLwH/csx6HCgdo=;
        b=Ijv5c4Eb+8coVk7SH4zQ94r7qzMfacgKAyGpQ2WeO667Y0NqucNZhUqjK82/3Vdons
         rmGvMbflLLYSObWW9795JTtMmQMrYJxuMBtbLjpGMDN2ntxKMeMXWnxU4y+jWBqLLB1u
         K5XhJr9Op2sug8mIJoNNWw0fbpXrw84V5oj2WMs70hpaNzXTbSTZ1nAJ51ML+wfvdJY2
         MdNY1GU1AW+JVcRuQB+85trS7hYKBXeW9NS8wUF1fTRSStEW6SpjKz2i7GHiF2HSZ/LN
         uDI/1IdTsi5QYc+29zkjKURFbFgj+23lkY/b1xVez0irFGq/kXrHdADOgbI2PcuWhm+W
         k/tA==
X-Forwarded-Encrypted: i=1; AKwUvByATtjIYSqEu7Zf7+qH2k5KwLJXnW19ru61aCgFwF05sAUVpq6RNRuN2C/1FG6lzOk54IedW/fXuYSDFVM=@vger.kernel.org
X-Gm-Message-State: AFuF++nnhI7IOMZEP/85pWCGiseANckR4oQlsRTYeSkeYqpayizVX9fG
	OsTOQJ2fLQvmmEXe8eMp485zlVV0LbXWuzbOHXrbjyTAFiR/HoV1ch99FT9yWXQqEXA=
X-Gm-Gg: AYBFou1/ZKdL7vRuMMJyd5U1NTFEoYthSRv+1hbT6BBmT8NynUyt6TQEAI/TmAyYCVt
	lMHof0RphdP2RFSKCE4zaNxLpGtoq/G4uTR5jWXQ7M57YC+ns0WwzHPtwtVepQu7PrvRf5786nW
	41cWdHu8HSKKNQZCYr0pX95C99YM8Ik/mN/0+RP5PMRhV8SiTy+pQzI2Ffo+FH27lGoexyShtg3
	mvYYNMcUA/nWyY9NG3fU9duPjetQYx2JS/CpSqYeRauzUgfwe0ozwzv8HjNvuO3LsCql6SXPefx
	CsS66H0XAsLCLNaZ4t8OD7Dk3lXGd3CzdEA1qH2JGoPtqJTSeIUh7h2NSyTa3y6lr5hl06gA/bh
	jOKivO3cswG2yocGJtwntBbalzNbh7hHdkpGcLffdZmVDI6wMmR3Bjh+oDzFLZV//xN0/VDbs4A
	PDRyLW5SZYoMI24ipd+G4wkxc2EFuM6J7OBaGVWdStuQZfZ5+ZTNa8YBGZtRGxnxCUrwCAgSkqz
	lmc3GubpkXalM2f/yG9pPqFtCJlxqgw3GEtCqcUpTRknaXaMjLb0HyHlAZS6TWXE/GW9Q==
X-Received: by 2002:a05:600c:620a:b0:49c:799a:177b with SMTP id 5b1f17b1804b1-49e60f5af42mr10561325e9.2.1789065809300;
        Thu, 10 Sep 2026 11:43:29 -0700 (PDT)
Received: from sergio-82n7.fritz.box (host27-7-217-213.cgnat.broadband.ehiweb.it. [213.217.7.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a3314esm3542185e9.2.2026.09.10.11.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:43:28 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: [PATCH v4] Documentation: hwmon: (yogafan) Update model reference table and contributors
Date: Thu, 10 Sep 2026 20:43:22 +0200
Message-ID: <20260910184322.1816996-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the new IdeaPad 3 15ALC6 Ub model and Yoga 740-15IML, update existing
model entries, include corresponding contributors, and adjust the
reStructuredText table layout and column separators to accommodate the
longer strings and prevent Sphinx build warnings.

Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
---
v4: Update commit message to explicitly document model additions and table updates.
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

