Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336223;
	b=EvJHDvExB+tOcLv9tF+lLxmOhrjld1Dd7N5XbHgfR7fdXWXHzsSW5peUK7WogQY0injr
	 TDsUTIadby4WPRXFbI2skXD97jWRCRf07IuoeuRcrH5rX2ZxoBq39QXzJMQaFsqCjXDVM
	 X8S6lHx1UkkYuOc0oFie1x1Kc+dAbIF/DxrnlhAthM8kJzBKnx6klhW8T+psz2t6PtiFh
	 KcYZPaV3kk9heufUPjvo+XQGcWowBLqCsTafdSNW8HrZBxjK5MCgdbZgFk66XryplS7vX
	 APOFg0eZ3PedYAzB/eytCv/Fy5jtcgacuZhdNIP/OHaH2vA/ZRHc3p/R9us6o6bhDVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WauGYljzgKnkDbfgsq+TqBtz3mTXIMflL8/jV2GYK38=;
	b=5dGRiUot+aednag1Xw7oP+0Fwsp8ILymJyEf9UCGboSb+LtxUvzSFLqFxrU49Bc2bgFB
	 gjid3LM4hiBKQGEOe1VkEkluiwHbIsusNxZoj2K/svuiigirslSrTrvCcden0u5gtE1qc
	 ojB+1d8Ib5SCRFVIv93/QQFQErfT6tMYKzlfkXydkCUxK1+78RgI0OY/k8vBshfC0dABc
	 ESNIRYAPPI+BKm0Jxmkd08nbmV4648P6Hg1jUSKWD1Ss3Tfftfaisi7oEflNPt2n1Saif
	 af7dvP70YZ/ycTAOnCyACcfY+X3z+RdHJlPnJR3XTL6MKnncLPOCv7vT2bW6RzcbxFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rtnK0eLq;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C69606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17C69606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rtnK0eLq
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so7416355e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793336221; x=1793941021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WauGYljzgKnkDbfgsq+TqBtz3mTXIMflL8/jV2GYK38=;
        b=rtnK0eLqQBZ6iE5ubPlRK7qFsX0fEdPLRNcKXT6yCKGRIaRqsFIYF+UA4UutebBA8A
         0pC6JpW275fFdM/XVFN6yK6K+Y8jYCHmtKRk5vnS1vd/uKD/ip+FXcj7ndGUvZaJs3CI
         agY3Xja6Hd3vz6a+DY3hu9+F9pggrsMhS/wJnQWfRhh5PhJeOdqg/+ne2lQtNSql7Vvf
         brMUEZy2h2gn1oti6kOYSzWcuWQiwZUuvbQshK7xrWTu1y7E4Clrf3zv7oJib0q8h+aM
         5JdRHVeJ+ALrw/sxZJgFwA8+uIWDra/B3JZ0qyuBGOfE8x1K3CsuMk01Sqva7RQIFvOp
         9ngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793336221; x=1793941021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WauGYljzgKnkDbfgsq+TqBtz3mTXIMflL8/jV2GYK38=;
        b=sxjZJHe1w7hPoOOa1GmT+cSZSTYtn0FpqnfylLPVObq54fHkuFxHKBhF91XnfI1M07
         bQxl/HOnhVOKrrvioB2F39i1lMKEUs0pios0/fmAOqGpbQY5bba0kj+hEc1EOtXOR4XK
         G2WT//WMXOxQTIdEA8jvFlpgzOmo/+ZlaDf2rrmUQXLkEe1uhT5j0Sz1Ve7yuXxIU06w
         /QYXlj7ZuKGhtdbb8U63V0XidFPqopNOjNTonHY4IwhKcoxvL36iKv/50efX2orRWKCX
         JgUhTON8ODRoiKpu43oZVBK87GY1Swj0fYAEojwCQpG4/hsweenoWsKZNxuhO2uIoiZq
         qvXw==
X-Forwarded-Encrypted: i=1; AKwUvBx5RfEmFedclBc9FqUipY8VD/u4LU1DVXpqJF9TmcwCcBLd6UGY5vkBs+1SheoPh4qKeoIz/DD6CwFXOzA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4FDwscft4fKOwFn3r2DBGOJeaNuc12oZoKjCvpGxGWZ6bMy2T
	1j24etYc/BMDdf+RVd8wm8OZbd9aMBJv8Lq6QhqDqeyrFAziigsel+lp
X-Gm-Gg: AYBFou0J8YLfdgNuBxsxsl+aAAsOZsh+BmF2Utea0oS8OKnHlqJIsaJdCFyGqPFTmEL
	QadZQ8OM3N9Y/SU9UL83tXUR9bJWUNmzqVnN5vRv6BjJIZRDI7g8iRNbkPBjks5CRifHMbdqQTw
	4bzUlbz8pT0UMtSYLQ5bOUhPHRpZJifIUPuomVdw6gReTM73pgmOSVdCoxwT7iLUbJoiq7WcVPi
	A68jVwk7y1b/dQd1RkGSTg7ECzWutw4S/wHHVv01obQaeCDe38lRKWHKgLXn64y02hyMoIBAeu5
	v9FS8JRQBfhLDI1TabgHhHpB41fVKXloxAPs0e7uYm19Kc7UMUqLJX0CieZplyBlfto6UDZx/LQ
	gV//y4BkaEP9pEBt2yBbJYSfCfcOAw1Poj6KnfIft54KS7usT/qw+DyHG13IkXRFVipSoLyWPGP
	w0n/3dyfRP+6PDtrDvg4kjEXcG3UITz/NIDsnpW4iACArmIELCABLYO6BXSuOg5v2Sd/0tRKejy
	rneR6XIIB6ijtfxCbsmebp7qrntFFar8YUDD40WcUt/3ptXlRf4EHpCW/Q6w6LmMZwZWXVBcz5L
	ywNWp/7gCYLGElEWTzfBBaCPNHkReBw3QV7z5lcm13Oa0vR3uqjxTmhS4pFPcGWHKYZKo9FA
X-Received: by 2002:a05:600c:19d3:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4ac1209eafcmr22580955e9.0.1793336221237;
        Thu, 29 Oct 2026 21:57:01 -0700 (PDT)
Received: from ahmad-HP-ZBook-17-G3 ([5.212.7.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea72254csm19118045e9.1.2026.10.29.21.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:57:00 -0700 (PDT)
From: ahmad baghereslami <ahmad.b1995@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ahmad baghereslami <ahmad.b1995@gmail.com>
Subject: [PATCH v2] ALSA: hda/conexant: Add mute LED quirk for HP ZBook 17 G3
Date: Fri, 30 Oct 2026 08:26:26 +0330
Message-ID: <20261030045626.1608040-1-ahmad.b1995@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029174446.1412118-1-ahmad.b1995@gmail.com>
References: <20261029174446.1412118-1-ahmad.b1995@gmail.com>
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

The HP ZBook 17 G3 (PCI SSID 103c:80d6, codec CX20724 with SSID
103c:80f8) has its speaker-mute LED on codec GPIO0 and its mic-mute LED
on GPIO1, both active high, like the HP ZBook 15u G3 that already uses
CXT_FIXUP_MUTE_LED_GPIO. HP's Windows driver agrees: chdrt.inf sets
EnableGPIO0MuteSignal for this model, and MicTray's MasterMute section
for SUBSYS_103C80D6/103C80F8 sets PlaybackGPIO = 0 and CaptureGPIO = 1.

Use CXT_FIXUP_MUTE_LED_GPIO for it.

Tested on an HP ZBook 17 G3 with Ubuntu's 7.0.0 kernel: with each GPIO
held high and low, GPIO0 switches only the speaker-mute LED and GPIO1
only the mic-mute LED; GPIO2-6 switch neither. With this quirk applied,
hda::mute and hda::micmute follow the speaker and mic mute, and sound
and the microphone keep working.

Finding the LEDs (the GPIO tests and reading HP's driver) and writing
this patch were done with the help of an AI coding assistant (Claude);
I checked the LEDs on the machine.

Signed-off-by: ahmad baghereslami <ahmad.b1995@gmail.com>
---

Notes:
    v2: v1 said the mic-mute LED is not on the codec and added a mute-only
    fixup. That was wrong: my v1 test blinked each GPIO too fast to see.
    Holding each GPIO high and low shows GPIO1 is the mic-mute LED, as HP's
    MicTray configuration for this model says, so v2 just uses the existing
    CXT_FIXUP_MUTE_LED_GPIO. v1:
    https://lore.kernel.org/all/20261029174446.1412118-1-ahmad.b1995@gmail.com/

 sound/hda/codecs/conexant.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index a141c94ee..88651a36d 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -1193,6 +1193,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK(0x1025, 0x1937, "Acer Aspire Go 16", CXT_FIXUP_ACER_ASPIRE_GO_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8079, "HP EliteBook 840 G3", CXT_FIXUP_HP_DOCK),
 	SND_PCI_QUIRK(0x103c, 0x807C, "HP EliteBook 820 G3", CXT_FIXUP_HP_DOCK),
+	SND_PCI_QUIRK(0x103c, 0x80d6, "HP ZBook 17 G3", CXT_FIXUP_MUTE_LED_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x80FD, "HP ProBook 640 G2", CXT_FIXUP_HP_DOCK),
 	SND_PCI_QUIRK(0x103c, 0x8115, "HP Z1 Gen3", CXT_FIXUP_HP_GATE_MIC),
 	SND_PCI_QUIRK(0x103c, 0x814f, "HP ZBook 15u G3", CXT_FIXUP_MUTE_LED_GPIO),
-- 
2.53.0

