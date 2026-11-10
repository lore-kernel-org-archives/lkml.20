Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304606;
	b=AnFUrWG1rdllbxmFkbfM8ElK5nO9WYSmvYHCVu/d7Mzn08USJssQknFbKTyJ8W0pGHmY
	 cuQX7olZD5XEq9qIyhKQQYbmvU07F2GVB4RfzYiisfgJ/OU15fLocKpCzBBgSF4qH3fwa
	 dHvYigF77SE5+JtVfsiQgT/QuUQ/XnvLZE1HXFE/wVbtAjkR5of1vAa3sTo1Wa6vbW5vv
	 +g9caHA+bPDDQKusyw3LwFBOpgHVBxzu8Xd/Og/I9/8WFW3/YWzilBwQPGBCEbeBhmN3/
	 FzKpqtUga225oojyCzhJCu1o4C38/C7j+FjBk90dvAaYVjoqJCEid8aCprkEC0y4XfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RjnOMEA3v51kaSR8Z91KF0TI4KPRyGyGQgxSggzifdo=;
	b=sc7o/wi4UE0pjEmMcJMcpqdqt4B0EUW2f/qrgIqNab5zyRXyPKIDrguHL0uwhFxjzJHi
	 QdTzmBH6yGj87SHBpQ1nLd09pwiMUGft1l3i+5mM0B8gARUv0UxyGcqtYz5fuF+0qolnR
	 0zQp+uK/u0vv54vR2bkh3k5N70B6aaZMXNt0v2uB6voVS3ppjz8kRBqupfjwiM6aLQj/y
	 J3zRoGrc3zUNuC/Ct2An7cQXJN77PNw0MCm9cIRW9X1BggUZU6tUBHPjON7WK0qI3zLLK
	 /5kkU5El01JXE6sb56qlfjecutqfWcb8rkLqBs8S7rU6C5hXqDbSh0uJCHEwfNgbKJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iel46GNZ;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D7D606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82D7D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iel46GNZ
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1535815c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304605; x=1794909405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjnOMEA3v51kaSR8Z91KF0TI4KPRyGyGQgxSggzifdo=;
        b=Iel46GNZB4kiY8ZR6SAMa/C5HB+QeFYiIp5tH8vQEE3/n3TkHiV0HwpYCxjIVVSuLK
         GCRIDfS8I7plld3r7z2fkijPDvVOWf6SiueyoGSdLTmwf1y+1falsyY9aC0X3lAbJjxA
         ccxa/NXEzfPu4C6M+oqABLZrTTNkK8dLas5sptMm+CAVatYtIqfVgJV2lMaFmyghLofB
         3wvekCjhYEWO5qYKB5BbfjkdkodnLevGScviEHwi/+hVB7h3xcrj5f8egeM+otNH4Lw7
         aKZrQ5kZWxOue9EH9tk4iFCSAgi+pFS6TVZbaxpO9wy3yzM+FBzFm6YeaLOiw9CvOgqR
         8MIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304605; x=1794909405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjnOMEA3v51kaSR8Z91KF0TI4KPRyGyGQgxSggzifdo=;
        b=hwDluXmey5NizMaR1b2RR2TnYaidAYn/t4k6tcphlXF9mRglGTXZ2oD2tgwwFvayZv
         SADsamRerh6kLbRbRgFgsN7SA/2WpTPDhnL4pwLnA5o9QiBY9ka23EGlslsOhXC6NE42
         u4Rdp2d89j/tgsFvNVXVBWTD0bD0HNqVml0oDkdz1NJEVhf0RKwXtg0vBiF4mrDp/vRV
         53xYb48WHaOKrvzctTmH3m0CElk5O/CJWGpMcjBBQOSmrOuuPs3oCM6Qo6skteRNX7qv
         2p7ekw+2FNX7l0sbfl1MBKwxLzVN0WZcHTpBqgD8QHmFRmzXf0Y5WWN02Psb5m6og3hX
         kuOg==
X-Forwarded-Encrypted: i=1; AL+hErEzZFZzIpdwnUiG3E8VKIhdokSNaX4YpVRqDS0lMct9thStfPvx0rr/fHv5MbIvmQROdIbpBx/sYWoUvX4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GZ8o7lZ5DeYy31Ix2Rot3VzSHLFQ3X/gkzvVJh8rLbOJPOuUh
	cfOPfJibNF6wNaom8XAI4ST7tyFECkxMyk6L1AzYrZfFVJtydGG91i6W
X-Gm-Gg: AYBFou22a963w+Le7VOazDKYdku4r9zuotGn4XgtVrVmfTyqCs3q+x4neP3KXJuDkEa
	/NswQRMPcE+2oiy9RNy9blvn4cUk0Hbcej/Eux77kTqouEmKjnvSagDpkVITs6aVajle1ce0V5z
	Su31PvrceDzfDVneaZMn7moKQwNJZQg4FhRp+HIjXoTkxLbMaTJRiP4r+ZYO66QBylwsG44Jq5O
	97XHCvtO21jRl9fHUghWI53iZferTSh4leRstZ8941WzAwIPVPkaMZ4PMYkWp7r4UE/sqWV+fo3
	Y7TUgL70jVOHCjJuAJ6cy+bO5vtS+1OLe+FNWtXmPdGKowSmPrRDAj8hgwfcNSZ/CRwg6j9rwWY
	4gPeBfB1vThvQym/u5+LcqxkwfcCjuW9Mz/Zu53naIorxAB7YeuhCUMQ2ldVnWUVPYsKsyxRObm
	2SACbgkntVbtYdGHWVBQocT4BuxBqYZHMXORBJ49aXXqeyKmcFgDVWcQ1JRgRKn/i1Wgawk3KmR
	50WVN2IfexfQhBtD+xGh36kibV/FX5GTcU8kDcx67vYRSdEltWdLipB3wBwKLVf0U7r9iDjkppX
	3MawYzTvczA6D6bGgZLHlVi1GQsUYO/vHguz952KWmVBcem6Yo/c2cyyCtQ7a1d/mkM+O/nL7k9
	PJam0c+3Tf6Ol51/M7KjwR6birgHw/Sx1lHV4KbGzeHIo
X-Received: by 2002:a05:701b:454c:10b0:17a:a3d4:8b17 with SMTP id a92af1059eb24-1b3b605b619mr2801727c88.12.1794304605260;
        Tue, 10 Nov 2026 01:56:45 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b75d42sm5203801c88.20.2026.11.10.01.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:56:14 -0800 (PST)
From: phucduc.bui@gmail.com
To: Maxim Kochetkov <fido_max@inbox.ru>,
	Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/6] ASoC: dwc: Fix error handling in dw_i2s_set_fmt()
Date: Tue, 10 Nov 2026 16:55:21 +0700
Message-ID: <20261110095525.504660-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110095525.504660-1-phucduc.bui@gmail.com>
References: <20261110095525.504660-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Return early when an unsupported clock provider format is
encountered, preventing the function from updating frame_offset
before returning an error.

Fixes: 221acc16aee1 ("ASoC: dwc: Add TDM mode support")
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Move the typo fixes into a separate commit.
 - Add Maxim Kochetkov's Reviewed-by tag.

 sound/soc/dwc/dwc-i2s.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 1f4d06a82333..6a25d2a69ea7 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -390,29 +390,19 @@ static int dw_i2s_trigger(struct snd_pcm_substream *substream,
 static int dw_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 {
 	struct dw_i2s_dev *dev = snd_soc_dai_get_drvdata(cpu_dai);
-	int ret = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_BC_FC:
-		if (dev->capability & DW_I2S_SLAVE)
-			ret = 0;
-		else
-			ret = -EINVAL;
+		if (!(dev->capability & DW_I2S_SLAVE))
+			return -EINVAL;
 		break;
 	case SND_SOC_DAIFMT_BP_FP:
-		if (dev->capability & DW_I2S_MASTER)
-			ret = 0;
-		else
-			ret = -EINVAL;
-		break;
-	case SND_SOC_DAIFMT_BC_FP:
-	case SND_SOC_DAIFMT_BP_FC:
-		ret = -EINVAL;
+		if (!(dev->capability & DW_I2S_MASTER))
+			return -EINVAL;
 		break;
 	default:
 		dev_dbg(dev->dev, "dwc : Invalid clock provider format\n");
-		ret = -EINVAL;
-		break;
+		return -EINVAL;
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -431,7 +421,7 @@ static int dw_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int dw_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai,	unsigned int tx_mask,
-- 
2.43.0

