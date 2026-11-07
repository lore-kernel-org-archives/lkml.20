Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060530;
	b=Tx61bvJ9wYR6ayeuKvVdH7qkBic693keN+fOeekvBeRAPh6D9pYLLqaZLR/HFT+cUKeU
	 OVUCC55rnnbuJo4q22YvtS5ePSq59mGILVbYGuRfcwKiOqVe5ys4byXLsvrmGELIOJb8A
	 bOmXpuN+zS3XFfGv8fJaHAbKHVMnawDcZxsTOe1F7om2nP1BFwveGrhnzzAsZmrg0bh0H
	 eFBObbXTG+gKly7UXww8EYh8v8Vqm0hoTp/Cek0MUpGt1e1eblR0eDihrW2ufJgVOE2nR
	 HplVzNW+9FYb0dBvTzWB/JN/aBQDeo980dJzbJmG35KTnAV12gSSEv1TvuQKzRQtYmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Hr16Fowc+FBEmAYx4CWWn17wGWcX/dD/MZtdPd+ASsA=;
	b=KY0uv8XuJfqSkaT3Lpw/QmWQEKuQcLnspgiCWUzqEwsv/pg0VhYj1eHCPijThznGjm+/
	 opa23hZHxF/FzRb8aizRABi+a0WvqEg/VVVM1ig2/OvdsqWuVB+dvsekHXa2Qyp45ZrKF
	 5rGaJ5VACGlcgJUUUFYcujbcUyN1cKOAxtHS5YYefgpoa8f8Wv64/OdTJC+UI6i8MiDrq
	 ty9O0dbQ/d4XSJ9eddTZVLV8IWj5OAmFaAwwfgmgWKrtzY6rJTZZ3lmGDvWuqs5UVaDCS
	 QmInDgjDyLcaaR0vyQpIf/rdVncbmicC8ZrHmHbxdXb1PQ8k0f232cSmZLroQo+I9jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="T724W/Lt";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E3E606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E3E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T724W/Lt
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so2562052eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794060529; x=1794665329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hr16Fowc+FBEmAYx4CWWn17wGWcX/dD/MZtdPd+ASsA=;
        b=T724W/LtQ4ky62wb76RYKI8r85JT2yclvz94YgeazwQ4/coL+6YO5Gec/9nSj7AqNi
         l7RwpFuU9UgLOMaI0TvjcLXmtolpEzTYLvoTZTLpWcmrcmc6absy+JekBbfAya6UkMON
         /ehVuyRrkP2aHd/+XRYavSl8rsLYcCagSrvoY7sZ+j4AIIQ6Aw4vcGHgONLKfG4Y7fzT
         7QW0yOm4/edQXTokHAOKC14hCYC4GJjNGBIIoAmWFJoVSK3zPX+eRh4jzSfn3yKokxCl
         B4a1NNurm3wYgRfU+VtrZ0nxfHkEahbptyhiQVB83TTUDbFsnJBIa7VL79FgE+gtzJGo
         8h1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060529; x=1794665329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hr16Fowc+FBEmAYx4CWWn17wGWcX/dD/MZtdPd+ASsA=;
        b=bRlhwyIp9RIPA4rCmNOT8j2Jto9ZFdcQbCad52+oSBxrCjYh2vjVW/3n4tpExarPVD
         qlgxN4RwDIfMkKMPciLp7f/7uYZQb6UTSxafhF1Eyc9qhZub3YSXquYEnAs0lnUdXVI0
         5ETCa0eUrd0pbouMOPeB0RQG5k4PTuZlL1XVo10FOEIiaGY5c1JVccwQSo3X1S0QBT0D
         CEVSiXG972CvD4Z/zEmBTtlKI7kmhj55Otv3ooPYiv7KTUIe2Mlr3trqa7Wbf3c4djfp
         QWuRGwj/pwHOakICrKZbZ88Bg0QVIL4j1KE3hP+lEf8GjMxcr3N8254AhdFTkczBaWQC
         2LsA==
X-Forwarded-Encrypted: i=1; AKwUvByzmCE4Jg4OQVbhSlHmGd37/Mdm0QnnfbIVo5+xW/hk6V458OVbVkLNaJwuGiOiIz5YL284MoxxToqQjhY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8H/oJ3CygUcfvequ/VCW+I5nMN8Ec+m7ZWLOou9aA1tr4Q71Eu
	K3kqqS0bc/CRmaHmLa/7iSaMMIMTIuMpoesS9mwhIqXH4Bu8Pki0lzQj
X-Gm-Gg: AYBFou3rwUFtuGbCwBFtLQRjqwsP/OBpXdigWlmWOLkxYtwm3EXEm4clykWvGGj2t08
	+wWe/3xjbZMqjRUsfWyFZQvrFlCFsj5ok0uEzogeOYf8j8LZuV1OsGHCAz9GCzzPrzEtQ/eRPDX
	C6GMYyHqkHRGaktAdkgA++a7GQr/uU3MWIzS0dQEQ6RGdk7OF/cHryIkZwQrrXaRRt1qE0b6bju
	AlI4CVjhRBgUrY5UUZ7j19WpBaFtafmBTLKOWhwySxRLwdsoPZMlm/ndzDQp+ntdlVNr4Hpyr4p
	ki+ykgqkoy4k4CGT8wauvK5QxXiUqadPT8wlsxzpkw3Qjc1P6M2+rubaa4FS10eJ5/kU+eYjQTL
	1B7GdDkDg2vqFUW5tQvO1j//dlk6DSER4/wi4HcU608tvQ+fJmlYVIIsMN9FfH9U7lW71yIBhf2
	4kI98VL1ssZETIJabsZVjCDy8iMiHYiy6fTpHshc/A6afeiD9U5mPfjBIOCq3tvX1y1ns0VkA5r
	RQ2BpnIALDrNHpuy5ivxJRmqqpXARr2Hndgqn8mN8jxsCuIqUxUfosjcl+vPkYxxmOZB/RwR4wc
	UJ3JIhfJ0qkjNyMYZSJzK5alBFduoNKi8LwmY/UN7m2oXnHUGCrXAZbwPbZR2SnXqxsb74gJmjr
	w+Om5UO9q1ugJMzM8
X-Received: by 2002:a05:7301:1887:b0:361:6884:78b1 with SMTP id 5a478bee46e88-36f7671a78cmr8352073eec.28.1794060528719;
        Sat, 07 Nov 2026 06:08:48 -0800 (PST)
Received: from localhost ([2401:4900:1c6e:17b2:fef3:c40e:ca92:2036])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27571401eec.15.2026.11.07.06.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:08:47 -0800 (PST)
From: Punnay Sharma <punnaysharma805@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>
Cc: Punnay Sharma <punnaysharma805@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: ideapad-laptop: Do not warn if KBLC reports no backlight
Date: Sat,  7 Nov 2026 19:35:56 +0530
Message-ID: <20261107140700.16036-1-punnaysharma805@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On probe, the driver asks KBLC for the keyboard backlight type and
warns about any result other than 0x5 or 0x7.

The LOQ 15IRX10 with an RGB keyboard returns 0x1. Its KBLC sets bit 0
in every result, and sets bit 2 for the type query only if the EC field
GZ35 is 0. On this model GZ35 is not 0, and a separate USB controller
(048d:c693) drives the keyboard lights. So 0x1 means that KBLC controls
no keyboard backlight, but the driver logs on every boot:

  ideapad_acpi VPC2004:00: Unknown keyboard type: 1

Add KBD_BL_NONE_TYPE for 0x1 and do not warn about it.

Tested on a Lenovo LOQ 15IRX10 (BIOS R3CN44WW).

Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>
---
KBD_BL_NONE_TYPE is placed last to avoid a conflict with Rong Zhang's
pending keyboard backlight series.

The same warning appears on other models, e.g. LOQ 15AHP10 [1] and
Legion 5 Pro 16ACH6H [2].

[1] https://lore.kernel.org/all/3f03931e7eafcb1781ca3cf922e588ab57caadcf@lavx.hu/
[2] https://github.com/johnfanv2/LenovoLegionLinux/issues/336

 drivers/platform/x86/lenovo/ideapad-laptop.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index fcb5ed7035f5..eb4158bed264 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -148,6 +148,7 @@ enum {
 #define KBD_BL_QUERY_TYPE		0x1
 #define KBD_BL_TRISTATE_TYPE		0x5
 #define KBD_BL_TRISTATE_AUTO_TYPE	0x7
+#define KBD_BL_NONE_TYPE		0x1	/* No backlight through KBLC */
 
 #define KBD_BL_COMMAND_GET		0x2
 #define KBD_BL_COMMAND_SET		0x3
@@ -2246,7 +2247,7 @@ static int ideapad_check_features(struct ideapad_private *priv)
 			} else if (val == KBD_BL_TRISTATE_AUTO_TYPE) {
 				priv->features.kbd_bl = true;
 				priv->kbd_bl.type = KBD_BL_TRISTATE_AUTO;
-			} else {
+			} else if (val != KBD_BL_NONE_TYPE) {
 				dev_warn(&priv->platform_device->dev,
 					 "Unknown keyboard type: %lu",
 					 val);

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.56.0

