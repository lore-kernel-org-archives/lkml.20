Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D47D3BB130
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 22:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788647233; cv=none; b=sNlV+SBx6rIyLWUnfiIu9M9V1AmqmiZ2c6JgNeYyW6bpzapp0yr73opRIQc2st4BWQpyGPtz9UYZZKTV0cCO0NV9JUHsp0XNYorU/4Ta8vJbefeNZRiHKQ1Fa4ZeRye9cWlKLDDWC7AcRMSUNUfQEreT5hXZiRxyHvSWaJV0iXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788647233; c=relaxed/simple;
	bh=0vyDvbj1aE6ce+OT40UuheNXEfROtOJ2IbEziGagt1Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PyQsCRFQxJb35RUAL5/Wap8LywoAkvWV4WvTsYSOX50VbuLZYQUCLi5TLCDe3u5CU9v40SZzx3HfcqZpFccSGrJieHqNFjx6JB8RNs3LRZ/rV8mVWwL0Y2QUnhpmcRZQb3lb3G3JAhrB/b0cAoAXQzknVMm0VNZNU2hjgNA9YEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBaYqwfX; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBaYqwfX"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d5335cf904so22288915ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 15:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788647231; x=1789252031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LKYQ9YXPXC7AQL+wDeglTr7PWmC0dNVqh+gm0Bvig0g=;
        b=kBaYqwfXNYPRbPICWLJxsymewxLUvgJnfV+88sMMUrXvQvWplT7rUEVI48WL/c2a/y
         N5Pk53JnfONHB3Kz6p7/7rm7CxDe4gi7ubQElSwkW4SEqCHi9X4PtozGVy8Scfy5JNuz
         yOUy+ezQHZapQKWiKAwJwy+Qagj154SpJruuvwmQpxSNxgGo8lSg8rHvT1kCYL/94g+v
         fXQvPtxIr4UKoFcOc+lWV0Hi/qdJTJsNLT/Hx6jPu1Bj9TTy0Pil9x2baWtV0wmM9Hoh
         Pq9vrJeQ1XsG73kh5ZkuMsHjDSVwyGx4FZ/8OKPjZDClj+Tlo8oh8OXXKRfvYZXYLJOK
         OBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788647231; x=1789252031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LKYQ9YXPXC7AQL+wDeglTr7PWmC0dNVqh+gm0Bvig0g=;
        b=QZ1iUyAqXJJrC5VSAazW1azLyyq//BSko7lnMruJEkg5wJO8QAIV21pbWVPpk0JpkH
         H/XMlER8yKpfsWk9ByRDEvWytUrAFJWh+303QpcegwHPAQNfZzNei7OPoSUhWaW/pezJ
         Z37aXz3KypCekRIJRNP2hIkhVCiALiPHMlY14kPXIzJl1dPGFyVGP1cr5LemWryeNUam
         ijdoYl2kubFZHFbMClIaxq9be8rrWJSxzpaEkUsXAP2Afao6ftfLQVEUgwztMg95fEKA
         kb1+u1dnyvaItiJBCb/z95odwlPesQE0LzA1YlCNcty2scblEi/tSzMnY3ycQkEyjkxV
         hEHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaDVjJahnmFjbl6uPCzmOWRDSQ/Cq7+B0qIA5aXKb+QPCb8BRCClj3aQN9MmMkZkSHB5ZEzMPJi7qLmI0=@vger.kernel.org
X-Gm-Message-State: AFuF++mMj7Xi6b3Wqq4t4i0zs36mqVmQ4YYq8oSyeKEHFeUXAezZuS6Q
	rgnSNz2ZZnhP26kwrW3OyGU64pLej4Ti1jmtO+u4Ne3WDvUp8VG6fiHC
X-Gm-Gg: AYBFou1j3L/42t21w//Czp8eCt77xDa1fJjQ72Vcja29R7mIX8mYA4m0RAHqOdT72ga
	k1EJleEcC3HPY/jxtBRCMEswIGyoMmFi41JqEXT8q9awoYyOHWVkzNAbOqCOMQOsEj2T3hlWOcK
	DfzG2XzPMSmPWqa6uvNf0B4LHYo/H7I5/DaWBUwpzd5/FMZl9xrllQ4pXTQBCo3VXKMXgf487/l
	hBL8m4+sO1JHnh9DPEky6gy+FVl3eXXMSEfrBM9q61g9RvaGqP/1E21EsqBz90cR8t1xO5OaeDE
	NjRkf9tTm+afXeQ9fgwTWjFI6t7fxi7LZeDO5feZkzDYn93oXgfNQRAUKdnpzw/nL5V9+HxbmQQ
	4+dUdheyhuNBUD5DBR1giyRl04nsARqNnGXPeVaZ+IgBjK3Kq9PKK4oj2hE8ZvcbGgReAb2dyp1
	ZfIlLqX2Jnb6DOXAFkVS/BEQRa8rH4r3EI2UHx/aER3FJM3QzHJiwObNSIHk1nIt+HNoFhRVgxW
	fgQ3BdHhWwJcmeKeeNdU18El2V2AGty0PHLexEtv7VRsRSJOUgdFXuktEZtYodBI5bI8u+PzloG
	0KgEqtZB4KDMoAIEuHugJw==
X-Received: by 2002:a17:903:1983:b0:2cf:8131:75f4 with SMTP id d9443c01a7336-2db127c3903mr253514825ad.11.1788647231100;
        Sat, 05 Sep 2026 15:27:11 -0700 (PDT)
Received: from arch.taild3b82f.ts.net ([2401:4900:ad20:813b:5d6e:82de:195:ca4e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm18200019eec.30.2026.09.05.15.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 15:27:10 -0700 (PDT)
From: Krish Gulati <krishgulati7@gmail.com>
To: krishgulati7@gmail.com,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for HP Omen 16-wd0xxx mute LED
Date: Sun,  6 Sep 2026 03:56:56 +0530
Message-ID: <20260905222659.10247-1-krishgulati7@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905084951.9595-1-krishgulati7@gmail.com>
References: <20260905084951.9595-1-krishgulati7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SND_PCI_QUIRK entry for HP Omen 16-wd0xxx (PCI SSID 103c:8ba9)
using ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT, which controls the mute
LED via a COEF bit write on the ALC245 codec. Without this quirk,
the mute LED does not reflect mute state on this model.

Tested on the affected hardware; mute LED now toggles correctly.

Signed-off-by: Krish Gulati <krishgulati7@gmail.com>

v2:
 - Fixed table ordering: entry moved to sort by PCI device ID
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 95b40a177d2b..f7786e1b0878 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7566,6 +7566,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b92, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b96, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b97, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8ba9, "HP Omen 16-wd0xxx", ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bb3, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bb4, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bb6, "HP Laptop 15-fd0039nt", ALC236_FIXUP_HP_15_FD0XXX),
-- 
2.55.0

