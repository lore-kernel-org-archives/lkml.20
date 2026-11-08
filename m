Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794110413;
	b=U5hJnZShoki8Mtkad9dmQTx3il3g4VV/ZemaAQrod8Mk9nJMp9mT+yvr/QF5WEjac08t
	 UHN19WxP11KKcmhsjcHTIyFsOa76UE/tBH06y9fTxOuSrdKfWrB3djLEBr6CflGhVmJSt
	 32ZVgIeReUWI0vsiGXLCKPI2W4RiRr3jrzIq0onwbHaCSsgalEuz8DAQWainMLtyIue59
	 HpZeiGDkSXz086NYMWLIMRNyS3Ep7JHROBpY5s6Tq9PhIEwEurcJg8fFbToe8tvtAmCnG
	 t4zzConb4rM6/gGbIlMVJ3OTBIodRVjye9Y3T+b1tClwRG+PgMyMWNmwFgq6r/j9giA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794110413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Fm7dk54aTQ+ve82k3n7UjfY8j5o5QSbD2ilJ3czYZ9s=;
	b=fiwHYpTxsaLJMlYrP0EtHv8/QibXEx+Yee7OVFlzbKFXn/AKSaRWZzPL4ddBc9WiPxXV
	 L1JKggeboqHYGZ+oqaqHmFlea1+2375gFK8fm9Ct1HVwiFdYkxjFgAQ60E3wBgvqfQQ1d
	 Ya8oRJ4cKbzSLuH2KOmj8AWuaQvng8wuyKmq3C+Eam1DmIsnOztEChGGmSnwfCquGuhHj
	 1kAOMhO3JRNOkv9eb9Gqp5R/gZNBirHg9XNYQ37A3G0X31IHG0QNJg1+HqYTprhJUB2KD
	 Pvj6yi0KhV+RXTJbIRpgEjdEPqODgBt9MEK9UqLTj44OwTTAyhUuVMGA3dh0+Tfsslg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="cevSR/Vk";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C2C606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 04:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C2C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cevSR/Vk
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e47347279so74136f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 20:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794110411; x=1794715211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fm7dk54aTQ+ve82k3n7UjfY8j5o5QSbD2ilJ3czYZ9s=;
        b=cevSR/VkliMogtQRW+YzMZulGqDey7G2dUNthfEZ/ilfXISo6heT0vscTZ3fsrQBpv
         xafQDz318vWiH6imAHOIPe9Io3MwLKNxBR5OudAKaNYqIeDzm6mwHDGaZWcbM5qRzbWd
         ma10rQMPPkaiF1GQIl+HU+y4C1z399JcjDJQ4AocXvSdy0193lbnKW5DHlkJh20/vAHw
         kNkcisbJ19StBODPcQ8ybEP8SsOT4upSJ0KzIO24Y/xHcHUVIKXJt4pMlDx5xlNih0P4
         OgpnaqvquuLJ67dLT7BBwErsRGctAOQoJK2N+wAWs3q3139fkz7A2SIW2aFHfEEiZFSq
         epaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794110411; x=1794715211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fm7dk54aTQ+ve82k3n7UjfY8j5o5QSbD2ilJ3czYZ9s=;
        b=c45LedE2YAKOiAEi5GND27h7WMfTgMIaGjNcJVg658UK7yTUQZn5l/w6YOf6KfUbVI
         /G/lcK2GANTH5/W3qUqOwkD8FkBi5JUQcTK/wj8a8XGhW/wJDe16M+6mpQnKq9VNanrs
         JWtSdj6QnksWaYhQ0+fDURiSv4SiJNKljhGgoh6zFMxqNpgm27bhS8jmtlaVbMHEEoKb
         TpAcD2mQn36ffQ6zhSewcG8/d3UYhNoFRWpzGS5peidvrtMTx+MYOmLrkTLNLWlqVnPn
         bUhQMm7h9lKIUkk5D39ZArbpieA2bmtjs5VgfYSx9656uMIFPSS5RWT/TyVEPeKkaqIJ
         E4JA==
X-Forwarded-Encrypted: i=1; AL+hErFdKdqUDe3BWI8/7b0gzPPdZ3Tgsan083nsrGRILnSwXmHCUTfFFv4ELx20DXENz/KDQr3VPtWCetmMBuk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/j9paK1GK09dPrYPiwtpC/X//v5xU7YBENNcxbUc8N1UA2b3rs
	zQX2t5KunjPRoktB9vmmpdbG2twbTtjATLGEl1CplqZdxsR2NUq4L44y
X-Gm-Gg: AYBFou1oaoDEtMNpa5/ejxXyROy3mKulUFEGrBPMpn6pCgbFwuqtBn/wFaAPNliFjkd
	OrwojajiZARSGxNirsH3NLtoyE4DPOByDkSHfIt4RsnlVf41f/JVWVZKRhedP8xV7o94JFFlatd
	LdJo5JpZj7bCwdym9FYhVbAdMVRwLZCbE7toPjRgIZLXQrWDfF9aehtobcAmgK5g2lwg27X3UO1
	2IMt4efMGFxJ4aAAdF/EbP8DPrtklSyr9jOBSMjD6Ijow8YZbdEIttYOB3iODjHEP7eMom9lsFb
	EhUKDCGM0OGjci+C8mwwOQYZ/yNM0QFEsf3t1Q+/F7s1sHgMGnqVU6y7Hun2a1BNeb1L/uQMU6z
	uKlJAYPXf1Qmepgv8CE+Qpho5WwNGTYf01jSf9gHKcZwWtJgOIMVNch6Lqf81/jxL2+EcSzCZit
	ARtbZJT9Ishi5/GnUboBe6frL2Sq2j01rqN3IGwdxR1FNl/EAhTVCH0gMA5teuHFngDTVPJT9oq
	l16spvYe8++5RidkwSvG6nt85Q+xsScM7mZe2xzl/TQ/IAjVxdcxLGRDTiSHI2oW8uhoXqrn0o4
	3FXiVJvEUtVRCEKXANXbo3CXyCbG3DR0IXupTRwM
X-Received: by 2002:a05:6000:310e:b0:48e:68d5:81a6 with SMTP id ffacd0b85a97d-4958502c858mr1324688f8f.34.1794110411323;
        Sat, 07 Nov 2026 20:00:11 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f3163sm1736310f8f.11.2026.11.07.20.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:00:09 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Sun, 08 Nov 2026 03:59:53 +0000
Subject: [PATCH 1/3] hwmon: (max31760) Fix the local temperature limit
 registers
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-max31760-fixes-v1-1-a61450463059@gmail.com>
References: <20261108-max31760-fixes-v1-0-a61450463059@gmail.com>
In-Reply-To: <20261108-max31760-fixes-v1-0-a61450463059@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Nurettin Bolucu <Nurettin.Bolucu@analog.com>, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794110404; l=1123;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=WJExlUq5ujG6qQKDWF6XzEtTjL9CmUxpEncKbMZrTaQ=;
 b=7PBaY1x6zXFhU5famM+RU8tFWnND0XETbo0Ofb4N2FB/6ncUthuj+NWDSuVaNebMUeRee6+rC
 ueGNH53YyAXCjx3cJO7lmgktuK4aAVqPfTzk1LLTawkDVZEPXYyvXIc
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

temp2_max and temp2_crit use each other's registers, so reading them
shows the local limits swapped and writing temp2_max changes the
overtemperature (SHDN) threshold.

Use the high limit (0x0C) for temp2_max and the overtemperature limit
(0x08) for temp2_crit.

Fixes: 38b04ad02d0d ("drivers: hwmon: Add max31760 fan speed controller driver")
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/hwmon/max31760.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/max31760.c b/drivers/hwmon/max31760.c
index 8d3be064b025..e3d86dc4257e 100644
--- a/drivers/hwmon/max31760.c
+++ b/drivers/hwmon/max31760.c
@@ -27,8 +27,8 @@
 
 #define REG_TACH(ch)		(0x52 + (ch) * 2)
 #define REG_TEMP_INPUT(ch)	(0x56 + (ch) * 2)
-#define REG_TEMP_MAX(ch)	(0x06 + (ch) * 2)
-#define REG_TEMP_CRIT(ch)	(0x0A + (ch) * 2)
+#define REG_TEMP_MAX(ch)	((ch) ? 0x0C : 0x06)
+#define REG_TEMP_CRIT(ch)	((ch) ? 0x08 : 0x0A)
 
 #define TEMP11_FROM_REG(reg)	((reg) / 32 * 125)
 #define TEMP11_TO_REG(val)	(DIV_ROUND_CLOSEST(clamp_val((val), -128000, \

-- 
2.55.0

