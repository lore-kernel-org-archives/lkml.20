Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506206;
	b=1OqOFrOCFZzxFCEG6ZM3Y3gMlgcrwC2zauswozkw30XZfeezMyyErPS0i+ZhZgPc3TtG
	 JbL4bOtbC9KkuwmybEGN0OYk2A+4mM23jaKOgIXU3HXX9wRGpxU4H3v67OzJ+gm8ZWEoO
	 Kra2ucqxwAwoRwvd+2TswiXonFrXrheNSAKY1uLY/aLi0QzgmpFDW3apqKJ1nUnfe+Ssm
	 NbFEiJCoIfdm7hPKiLKGq3kUhzOew8kiaGgeSeM9P5J6Ztta/UZwmqKjN+jLBxJhhIg2M
	 wkjySlHMTx5THo7aeVD4IHfuAJYnn8z6sNwsqjTsrfApPa4WE/UKA7QrSe3weMtuP7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bVukesRVZXuCwNfxWw9b9XoFHDuzUlJG4NqmqHbHpsU=;
	b=h409C1jrB2fast6vd2YhmUQoLyVa9vVaA0pu7IogaIUO6oBjaQVsv3rdXgkmYNeAyY0N
	 AMkyHfSsK0Ra9W/3eGJO3CPQMwtOgPZhoL8OAIhhW5OkQI+TB0KeyGcDAep9TexEmn+6q
	 rQ+Ygk14Iclv1BfBkXaVrhVGJN/DqOXmFGr4eF7HAcm0XNcjHEnHJBlV9iypg9GivKlfJ
	 RIUZ55YPyw41KsUhbRJCqbW/KR6gTFS5sP1X49e1y8kQodZTJAl7qmKK3AFFfjzbIq5/u
	 YJijLqH7xRY7l197B5fa7I0KRYsqKlgJwg8bc9LYXi1C8UgIrVS00YPnzrn0n2veywg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DNhznkaJ;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C07606A88E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23C07606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DNhznkaJ
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e46e449e8so19282f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794506203; x=1795111003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bVukesRVZXuCwNfxWw9b9XoFHDuzUlJG4NqmqHbHpsU=;
        b=DNhznkaJ7zNMnvcw6AjzPAyKEmfn/mVFmumdzGHftPMpKwHVvLxpVCKemf74ZwriZA
         rE8U6eTNtP7H+eVD3LrBRY7+v78iRu+kQImaWQLDUZNnV2kdiL6FNb7J8eak2szh9BLH
         iTsdq00Ndt1GsmGIA8K2QcTz/QUj8mrrS8koLwMpROTv1rCMCctahmy13WERe8AgV59Z
         98xN+vGkU2sDL6YcjxRvmK/v4z7enJXgcyIREhdndSAPb5/McZdSquMKFHkD7SVwsSUu
         Ugg8UIzoNGGaWGB2mcgrBlRV7Y3kdSPUCwhPbT1weyclnFidqgVHHMSv+81V6Zy9Vo+p
         nKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506203; x=1795111003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bVukesRVZXuCwNfxWw9b9XoFHDuzUlJG4NqmqHbHpsU=;
        b=ReCwCjbKvQYvJdTvE/bpuKmgdGZWPJ0zRQ8CZd1QqtzGpswj9iqRMx9Zoc6Bw5wR1C
         i9H4iJxYCHN84bOdzoRvCl9rp88ZCgk41x8GRtL4d4PMP2DARj7uFwalMCf5t46ujSw0
         0+iwUHgjsrYsoNNbX7wbGqhaWa4+RdnBGJSS4v+AUp4I5lhD3Dv86Y86+QpPmCCFHfqT
         smsSG9LnZw963sAEMrSc9XQIvtVNDIyCcvst1sYWt76D9x5mqx/+Dm1FrLJxfkCBNmTE
         tgEPVHmnyFvOLSJWUjq6y/3xNh0lFyZJP1zwIDjcCy+OxCzY5sWx4krcLE7kimpTOBlM
         id0Q==
X-Forwarded-Encrypted: i=1; AL+hErFdjXB/YSAoRVRXIUe3omoSy35b4XWsSjeeBJw8V/kxO4g+1PbV7/kHK3mGmFWEF8smGYOnmRZDqfoDLgQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PLpuviBVJxgC+r+Bcp95B69byPnXp4MNHVugqy2Z+kFBJ7hr9
	hSFQj5mfFVrh6HZUTOszbjT1s5/R4ILf4Lnb8RO4CORBP3Ta0qkhSw1u
X-Gm-Gg: AYBFou0wifJQnWNGLkqVHQSzlakCGh29WGNq58rva/19ZTrdGRGz7OrHNzN6MGtCFpE
	MwJnopRSeMSTb7W80I1tt3QOcvfp/juZrntWsagjRv3X4fY7g+LgQ2vpZtYWzVGTU+bwUALQ1jl
	mNQX0hZQOmU1B4C5pmJi8IcpBdmgnqZepCcYsKT3mvsMRTZpUSqr804Wea3IQGFy1v6sYxGXx3y
	xdu2TV4d8eiL78mja4FRYqbh9fLiKZUxRE324IVdzYL0tjqkpkUvU1ce5KNB/0pN2Y2xU5MZmQS
	0Nrzzju4db1t45MtfJK/ghrs+5VA+W1dBnxwOTO4jo8qbhzL1tWj8o/qDAiMNIKd1+5PMmDaSzG
	WOzADfKwazrneLNzTC8ajybxWt9a7fri131fXVNpoWc1EtTx/IhL0yGwksNaupoGd9LazmMqaY3
	ON9EnJ7xPPAaWXDhrKjSPzPpvuRaQqdXsP8ggni/JswbUkfeChA0xcwvfhN5ufdC0Ihe+r4cSKL
	vT7vUKE3n7ivSBGolQV/UOjPc1c4RYz0HUM2JUUTNj5pEjpdbrHs3BhQde5DBq7uXhV0KFOsH9k
	UiPwDBtxGF3d/qQYyN61ad9cX1/cRiva11qr6bbaFwb2dwggI0nJx2Q6kyojab7u1czmuoBVFzK
	fIWFk7vHBpSMt79Z5rx+UEjBDQoy+s21FtDWuOIQqDYmGn+MZbge+XNi32eFg+NLYltU64PbDlw
	X/fwHI2OVFLvts23kFRjgaKPD81FPSAUmvOizPPYuZG6rmdD1RIOKWWrTapQe2T8Q=
X-Received: by 2002:a05:6000:2411:b0:48d:df08:307c with SMTP id ffacd0b85a97d-49c726da6a6mr271994f8f.44.1794506203353;
        Thu, 12 Nov 2026 09:56:43 -0800 (PST)
Received: from zitrone.tail45b538.ts.net ([2a02:810d:a1:6000:900:be5c:7a9c:c176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c193fsm547430f8f.13.2026.11.12.09.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:56:42 -0800 (PST)
From: Andreas Wendleder <gonsolo@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	b43-dev@lists.infradead.org,
	Michael Buesch <m@bues.ch>,
	Alessio Ferri <alessio.ferri@mythread.it>,
	kvalo@kernel.org,
	julian.calaby@gmail.com,
	jpeisach@ubuntu.com,
	rosenp@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC wireless-next 1/4] wifi: b43: 11ac chanspec for the AC microcode
Date: Thu, 12 Nov 2026 18:56:37 +0100
Message-ID: <20261112175640.40603-2-gonsolo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112175640.40603-1-gonsolo@gmail.com>
References: <20261112175640.40603-1-gonsolo@gmail.com>
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

The AC microcode keeps an 11ac chanspec of the current channel in SHM
(where older microcode keeps the channel cookie) and takes one in every
TX descriptor and puts one in every RX header: the channel, 0x1000 for
20 MHz and 0xc000 on 5 GHz.

Add b43_ac_chanspec() and use it for the channel cookie in
b43_switch_channel(). The TX and RX header patches that follow use it too.
Signed-off-by: Andreas Wendleder <gonsolo@gmail.com>
---
 drivers/net/wireless/broadcom/b43/phy_common.c | 13 +++++++++++++
 drivers/net/wireless/broadcom/b43/phy_common.h |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/net/wireless/broadcom/b43/phy_common.c b/drivers/net/wireless/broadcom/b43/phy_common.c
index 285490f..cfc14c1 100644
--- a/drivers/net/wireless/broadcom/b43/phy_common.c
+++ b/drivers/net/wireless/broadcom/b43/phy_common.c
@@ -413,6 +413,17 @@ void b43_phy_take_out_of_reset(struct b43_wldev *dev)
 	}
 }
 
+/*
+ * The 11ac chanspec of a primary channel as the AC microcode takes it in
+ * SHM and in the TX and RX headers: channel, 0x1000 for 20 MHz, 0xc000 on
+ * 5 GHz.
+ */
+u16 b43_ac_chanspec(struct b43_wldev *dev, unsigned int channel)
+{
+	return channel | 0x1000 |
+	       (b43_current_band(dev->wl) == NL80211_BAND_5GHZ ? 0xc000 : 0);
+}
+
 int b43_switch_channel(struct b43_wldev *dev, unsigned int new_channel)
 {
 	struct b43_phy *phy = &(dev->phy);
@@ -428,6 +439,8 @@ int b43_switch_channel(struct b43_wldev *dev, unsigned int new_channel)
 	/* FIXME: set 40Mhz flag if required */
 	if (0)
 		channelcookie |= B43_SHM_SH_CHAN_40MHZ;
+	if (b43_ucode_is_ac(dev))
+		channelcookie = b43_ac_chanspec(dev, new_channel);
 	savedcookie = b43_shm_read16(dev, B43_SHM_SHARED, B43_SHM_SH_CHAN);
 	b43_shm_write16(dev, B43_SHM_SHARED, B43_SHM_SH_CHAN, channelcookie);
 
diff --git a/drivers/net/wireless/broadcom/b43/phy_common.h b/drivers/net/wireless/broadcom/b43/phy_common.h
index 5ec5233..c20a20e 100644
--- a/drivers/net/wireless/broadcom/b43/phy_common.h
+++ b/drivers/net/wireless/broadcom/b43/phy_common.h
@@ -390,6 +390,13 @@ void b43_phy_take_out_of_reset(struct b43_wldev *dev);
  */
 int b43_switch_channel(struct b43_wldev *dev, unsigned int new_channel);
 
+/*
+ * 11ac chanspec of the AC microcode, and the centre channel of the 80 MHz block
+ * of a 5 GHz primary (0: none)
+ */
+u16 b43_ac_chanspec(struct b43_wldev *dev, unsigned int channel);
+unsigned int b43_ac_80mhz_centre(unsigned int channel);
+
 /**
  * b43_software_rfkill - Turn the radio ON or OFF in software.
  */
