Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883875;
	b=DUgLCPrWIE2YdKjxks0CHtklQuTdkWA/ZKeLA4ZhxV3Q1P3/QPXREg8cJKE/fbcMJHRq
	 r1xrlkIhMEJWQmPd9TOHH7zAQ975t368m7K9ucqd6K3ad/OdScBFR09LuCaYjgx09hg4H
	 ClYL7yyivIUWVuHVpq/tpi2Kgh+kOdMr9hZZHDO1c/OoaUwJJLlVBgmGj+ldGY81ti7s4
	 77CXWELDSbc2HMQZhnjIIPDij+R6qJ6OcuOoTXNdIXSuDVyztyMumGDtjPxQLgJFYpHp+
	 7VXOPhhDBIRklh6Oe0hlZMrqF7M3Hl7eVWrZbaN1WxtOoTisJDm0M28bA0HXcV3SE8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C5uJloTcQYPi9T0asaKzKiE7s1zjiE7yBLbSpX65ozo=;
	b=q0PYNQSOTUDgJpfUns1o9Iv+hRtMlBEHGci4u5BZkBCdTNSESgsse4ovL8MG7foaFsr5
	 rrRe11LfpRE51xTXxCbZFrZMqP8KB6wqHfV4dA9tUV81P2OI3kMXHhpiAV3532lRzVst9
	 wcLG0lHivPBHejpZGcDbODCN6DeJrEdd9JiSMSNhF13xGTpVRfrFIrSXFWknhQzjODHeF
	 elSH0RHoYTaA4oVVbvdfRbmTo7RLjzyY7hhBUaFB6pmg7MRJgIMKMYpyGbgBVFZUEnfDA
	 DGhapTMp64tVu5YUAUgY+VGAg5N/3B9OHlltoFKaRLKvubr62Lr57aE21HDgF+8ObkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b/b1x5kW";
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8BF606A338
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E8BF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b/b1x5kW
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdab938dc83so796454a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793883874; x=1794488674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C5uJloTcQYPi9T0asaKzKiE7s1zjiE7yBLbSpX65ozo=;
        b=b/b1x5kWVN3NDzvl/0GcyQAaOV/TVos3n1N6oVmtPhMaX/DGQ135b4OI9OPNAOa+kB
         UssFDiBUDrlJX0hd5i9Aht8dCrP4AmTbfFCLeyt1vMbAHpJ3OQapHZWlZNvwlJTJ0PM+
         ABuZciAY7kfkXXOJQxlHhZl9v4Ht3RlAinWkCaLgEbdaM+xmNNcwk+82ESxTZPiKNXAl
         w07zhDI7EPmcEwFAccWFf1G5HS2lyVGzCiS/mSY0akepsFZO9QHw+N17WhpG13FevaEm
         cDENHLXyLuHJXpcnL0qWqyiSQ62tk7HW44XZbeor0c8wqeF/fZRzAeWfXJ3l6nzNJVje
         QJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883874; x=1794488674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5uJloTcQYPi9T0asaKzKiE7s1zjiE7yBLbSpX65ozo=;
        b=notudBKSH+SCrpSr9ok0HGS+OGfBxZKay1eVATP4zjqHvxDXJK/CDA2h7mbjcBxv2m
         Qh+rZsBC3z0Fatgd/nNOgPGR7tPIL8IJtO7sNoe7LDe8ENP1AKN5D44AgIlQJN9y4n0o
         qbxXA/gazjObuu0sejDAH2Zuginvc64mhSkr91VRraLtVO+4aJtrwk0vAEyQ2kDTKZab
         h1BCElmV6Puyo4hc9BqleGoZnKkj95uM1M6V/BINkWAuBjyVrbSwBpcnVtuGThz4WU3G
         Wt16i5aE4MDIoTGr7neNr2OUEztgGkIFNRkOOUMpUuIpHtWsLOBAmpL6EeWOzO5xV5gA
         hAPA==
X-Forwarded-Encrypted: i=1; AKwUvBwFjHc6e9ZALxnf6vCu83bwVr9e7ygr62JKS/SmHYlf//4dZmCyrXRz8CjcW+VtsMWTaHNS4/mkeEL6vPs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9G8kRQhfvh/akMf9osopLdSjTe88ohjICjMBV2IcKjASOHbyrr
	OoSC4/Sq2IQE4R5PP0laB6RKVGc6J4Th7VSR/5cD02FEb0jWirqcs+aU
X-Gm-Gg: AYBFou3u9N8Zkv9Ac3D12481YFxxl9MHx9sQd3BCp9Kd269aBZt2g9PSvcwv9V3ZgPB
	hroVrnMNY896odI+2vUcTlWt33Yruu6i4tH9SUg5P3GbAZBU3xVaAseasGoyEwOfRXlLctdrLtw
	PIlZQN39FFHCJVv56nitvkZeBmdkm/xGuNiOYUqqfnJjzDWkXon3ah8Q6eVe3hchzQwoV+A1mvX
	qcuGvT22yRqxgwLSqTDpzGBzIO47oVgE9+t3kTkiDa35mj5O0CXIIjrF4il6TQ0bOluA2DsrIOz
	Ygu848OCzsecWUGG4m9XU1G4hsoaS8iu7Xm/XFP0bnRgTb2Pu3M/Iy1e0ltug2ZlP0TuyGnO92y
	ccoHyDBQZYXOsUJqG+ERisAKQY8sWV9jPS/eXxIZU7E6IFsnExwUnF+Wq4uzTefwB9auWCcHRqM
	HwceB330rwS5yVaMm9xCPnfRnLpb3ldzDFjU/oEHWkW68vEnFiJFBozPd+Y/Wi2IFxJpwvz0bZF
	jhv3cAyFGpm9kR4A42vkngRv8RNhx9PlEsT/2EOPtMbbHJpjZIN68gdvvrEqVp4NIcH440fF9/9
	IBXd6NrfFyw/FWK7FyGriky9000=
X-Received: by 2002:a05:6a20:b603:b0:3e2:1218:3ea8 with SMTP id adf61e73a8af0-3e928c8b835mr16920915637.14.1793883874384;
        Thu, 05 Nov 2026 05:04:34 -0800 (PST)
Received: from isthelight ([2a09:bac5:d46c:15f::23:490])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09a7cc082sm1950840b3a.12.2026.11.05.05.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:04:33 -0800 (PST)
From: Nguyen Thanh Nhat <nguyenthanhnhat397@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Kailang Yang <kailang@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Thanh Nhat <nguyenthanhnhat397@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Acer Predator PHN16-71
Date: Thu,  5 Nov 2026 20:03:30 +0700
Message-ID: <20261105130330.6797-1-nguyenthanhnhat397@gmail.com>
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

The Acer Predator PHN16-71 (subsystem ID 1025:170f) with a Realtek
ALC245 codec does not detect external headset microphone on the 3.5mm
combo jack because 0x19 pin is marked as unconnected (0x411111f0). Add a
quirk using ALC2XX_FIXUP_HEADSET_MIC.

Signed-off-by: Nguyen Thanh Nhat <nguyenthanhnhat397@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 873eb3d5ddbe..a756e0076021 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7550,6 +7550,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x166c, "Acer Predator PH16-71", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1679, "Acer Nitro 16 AN16-41", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
+	SND_PCI_QUIRK(0x1025, 0x170f, "Acer Predator PHN16-71", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x172c, "Acer Nitro ANV16-41", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC2XX_FIXUP_HEADSET_MIC),
-- 
2.56.0

