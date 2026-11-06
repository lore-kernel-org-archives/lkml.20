Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982752;
	b=hLy0GJrHaRwjhWF5nzTNHhDsD1k6I4TWrVhRsb1/upTGMMqYqMe5WAsbPvZ6XviWZABA
	 /8t3/z1a7jR2aRx94XmsLspikiadOga++fhe2gbKA6jKj5HUcY8V01J7KhAhraWIEhg+K
	 tREMtAfMTUJt5hIE4wwKbXVqwlpxbQQczu+aXNr/sGK7n/QtAarOlVjAEdAEPO77ODXGK
	 1KeIAODzmIEWmVjZ/PFoR9OuiA+mPSOZ8HLCe1xlMCzJtmWKRcLUnOh5zn6bN/w3j3fqU
	 zmcmdbqGip+BOU+em/gaac349cdlScexdCxGDInfOGL7ZU6Ik6qGlov01GRgSFn0VJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DnSiCHS57/5NeVGNSfvi5weTMPVYKrlFxAEl/9lABc0=;
	b=ZSk3BsW5lDAkwm6Fo7DgUuXQqRGDdEBSh6ky5974JfRRkchjC5lalM0u062mqdaTBQbg
	 ZLffNllvffK+7Oe2E+iMQcmCyoTHeGPvq11eoAOwA5GdDn/zNdD8LCOPb0fkSCyqJ9+lg
	 7qUuhxkbPIwfXc76h5rlyUG9K1Pl5NuraAIlGD0EtWgPPR0jZ//QRltfOpS4CbLPIxu1l
	 weWBJ+CgBUgAGP/ozfIzrUMlLjaTdmHLtZmpmC/sPFW4uSPGjtRTFYRk/UPNYTnV8uiFg
	 x1QXZhyvSh03OInsv9llYi78A8hzTtwrdNEQ7wK8XSZ6pGQ/CDuaQFIHdF4337jKyfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKmURR3Y;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8147A606D808
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8147A606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKmURR3Y
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-825b40f8a26so355961a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982751; x=1794587551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DnSiCHS57/5NeVGNSfvi5weTMPVYKrlFxAEl/9lABc0=;
        b=fKmURR3Y8bzdTsTHRtYKNCAdRwxxuX2OL1P79AJLyIpUpGnztdb1gPfHVcd/+nAxwk
         X0bk4fBiCmF7lZNpJ2qk2x0FT8JQno8Z6roFRuIbqWtPkTsLAdGRyJdR3TXPf1Ab0MFx
         8Pqbu/h23EtfQkyC7prb8IYEpYSN5WS8UmYx/7DE5BOHRfwcAoIFecHrsAB6FqHAm5FC
         Vnmo2bCn0QrJuk04+DoFmOtBLZ8u3A2ARaLNuSLuSOhEadjTXIZ00FnCPj20OimWREZL
         9RD3/NQ9PE3cGRXekRfrhbXWDkO53VhvzKXSH2HsXY6zjamarjBRSr8wic4TA1nyhSVP
         ED+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982751; x=1794587551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DnSiCHS57/5NeVGNSfvi5weTMPVYKrlFxAEl/9lABc0=;
        b=LTXcn2nh+QrJnxE9hjmaw03MlnsAh5gUhqe2P9U4ONvH+oSCeQ0XKdosSTFY1gmMkd
         Kw4/v8VIjB5kcyg4C0dOqjSa1G+LJ3jIgMjUF7RgGCqXzgesfQe/BHavQCeEgGauySoH
         rO09U8EGXrNgO4yAe8tiMILcjjW+fOVBucrl5jklaZbpPdE+9SgQ63f/+irRr9oUVRwV
         3mAWowXosnTK/J/8/OsUKubhoow0S2LOzM/0d1HSKRXFArQbSLbfSaL67kng3iRgQen6
         BU/+3bki7181rooESVFypZ2l29eUBHeKO8KE3skiA7dL/M6+M4pAdLawGVTFUQJdTDs3
         9Qmw==
X-Forwarded-Encrypted: i=1; AKwUvByCWQ8vA6sdCPOcyUj2xZ1q0LOFooHEbRkPZVYTiGPaT0dOeDFT1adQPVFDuFmcgfwLQwmZZgM9Xh/DG5U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tHN87gGqxF0z6VIrQQJV8dfr1g7wmWwMYjLSxUU8mAQkIJFeY
	ojajYF8nLNV/PVFaFEdtkgbFuqFheDCDug0w/+Xb1YhhuDrtjMqr+3tK
X-Gm-Gg: AYBFou3GA2csTH5koX+EFO1GHkc3yx1/S9OLr0SgDas6erlHCuS7CN6Y3SNjAhgL3oS
	8aetVxvAyMVmNq3Qy23IY7rmKjFg5LXU5Gs7IprvmWyJ4PUaH4Ku+llsHYTnlCaVel2odJCkM4V
	KWa+GHa9hk+IvpfHi0Msb0IM2XfwppjE9jfg4cYI3gHwsaV5/abZdP0qyD4ofpiyaJHPAFVh1pt
	8C4FktfmCREJiFEk8djIDKaNWoBeXw3XyvbUAGhL3UcTG+Dlm1sJvPKR/8xopbdT8HAaC5F4Pxz
	lTdXk1026iJuKH0H3uRKJbBB9weg0kAyrLW0obniDbNKW2IK6qYQyiFrq6f1Dxe0mnjLSBkZ4FM
	gm5jQxnGA0TRIcM5wZNbMgJGmvQgNLOiWheHXmpw2dM6d7Pzf0yxDlPNOa3ZxutaIcLeVzq4KHC
	i37q02Bx4N2PDCnQk1vt+4s9zxqIP3hQsAEQiLkd3QJvuvKNXIoZuLadhXVk93zyul5hmMS11/a
	r7FtkVB4W2kAk9qTNPNIUkxXIFU0AXSmc0xpsMKVu6N7Ddrnftpke/wSDUBIqI2PuaggzX8qLSY
	Ef5+SQcqXrehbhzLXgQxwkfLc6pkuLA8XOMxpizAwZEnt/I=
X-Received: by 2002:a05:6830:82f4:b0:81e:abb6:749f with SMTP id 46e09a7af769-85f1cee7892mr2866810a34.8.1793982751368;
        Fri, 06 Nov 2026 08:32:31 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:30 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 07/16] ALSA: mixer_audient: Add integer range checks
Date: Fri,  6 Nov 2026 10:31:20 -0600
Message-ID: <20261106163129.1006907-8-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106163129.1006907-1-mrwillporter@gmail.com>
References: <aupn1wwW7w08M3gu@khmer.arcnet>
 <20261106163129.1006907-1-mrwillporter@gmail.com>
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

From: Christian Ruppert <arc@gmx.li>

Add range checks to integer parameters to improve error management:
- Reject out-of-range write attempts with -EINVAL
- Prune out-of-range values returned by the device to the range limits

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 4b20db9a82e2..433bb5479d8e 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -44,10 +44,10 @@ static const struct snd_audient_ctrl_type {
 	unsigned long flags;
 	size_t len;		/* datatype size, can be 1, 2 or 4 bytes */
 	union {
-		int integer;
+		long integer;
 	} min;		/* for booleans holds physical int value for false */
 	union {
-		int integer;
+		long integer;
 	} max;		/* for booleans holds physical int value for true */
 	const unsigned int *tlv;
 	u8 unit;
@@ -425,6 +425,12 @@ static int snd_ctl_audient_integer_get(struct snd_kcontrol *kctl,
 		if (ret < 0)
 			return ret;
 
+		if (val < ctype->min.integer)
+			val = ctype->min.integer;
+
+		if (val > ctype->max.integer)
+			val = ctype->max.integer;
+
 		ctl_val->value.integer.value[i] = val;
 	}
 
@@ -448,6 +454,13 @@ static int snd_ctl_audient_integer_set(struct snd_kcontrol *kctl,
 	int changed = 0;
 	int i;
 
+	for (i = 0; i < hwchan; i++) {
+		long val = ctl_val->value.integer.value[i];
+
+		if ((val < ctype->min.integer) || (val > ctype->max.integer))
+			return -EINVAL;
+	}
+
 	CLASS(snd_usb_lock, pm)(mixer->chip);
 	if (pm.err < 0)
 		return pm.err;
-- 
2.47.3

