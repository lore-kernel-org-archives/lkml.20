Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364103;
	b=T6dE4GiT28YC6mvOSeZ4Lqa2KJPJreRQ3W1NmV/oT2Vg+Zyw/vdOLb9P0/1E2LvBxoMO
	 OgjsdQCXKLYs9v/qUQRxyBZKRwjq+4jF9eWdKFoYRYpuwbYrN4f0TZGtLmiA8abWu1AyA
	 V1e4ZYAf8txHjbQyiHTTz4gU2Qf6DXwskVxkSbDXQf499460z0S6z3M1BqW2t8lNuCdoh
	 L5qDpJ+HI/a51jzuyAaMwo8Of+NZG6+Dzs0Co3Hxn2bJ/tL324hdY/YxAsc/VgMhOREXj
	 nN+FF37N5INZo+Vhe92NSk8PLzjF0GI8GxPicmf9Ush8RBudegZGeW2EFqunwhyLLgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LIw999DKhGL9raQZizUEhyS0NYOakQkyAsor8Jedtw4=;
	b=hYo+wNziQYOOymr0cNxQHmwmL+SdqKvRWBpXCi7XQKPU3/Y3KnGLGFdcM70tfL1O87lp
	 1FV4JXRvmsCc1dRddBAuKEv9iMGfAodBz5/fE2Pp8BpS8/Xt7q1TSdsHb8kpLP0Lh9hb2
	 Yy1VMM7PL3wx845QwaYlzVKPWFiYNNJHY0tzzXVEvYzjmO//xp3xDvW38BQflpZ5ynIct
	 KuXzmQppvOP4gtCcVuAs6Bt1QmHiBqnxughB98JV18DBqjUIbSnoGe0jbB+4zOwUpTqUt
	 a9w9+UlFdU5Ov57O+7ZeX/GXBA1GLYsKTA5Tmrf1xTUAlsXoxtVRwqv0lm1WvQXriFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rGuks6vy;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D565606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D565606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rGuks6vy
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36dbde64409so5640757eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364102; x=1794968902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LIw999DKhGL9raQZizUEhyS0NYOakQkyAsor8Jedtw4=;
        b=rGuks6vy1k5Lhfnv9gV7fP1lIdzcKOY8yl5G0SxHFWwUJuuQHoqQNu7JSW5ZGM+64+
         xEB9K+Pp3Fvh6BJMg6dZeg48zvI/VTdCT7eBpP6LAMQwJkMhJ7PeTQ16RylX0dsJMKAJ
         87Gwds21qOCgQtGEolJmxrwa0JG4YZiXQbL0YvmJNOJB7fFT+sgcK/kW/paTig3LrdzQ
         b0ZbJwhQfX4+NG7L1NXi+E5CYJHGLRNda90in+4QdkDZVaYid2St1tpO7dIPZZE2Jyqs
         yfJvDbEFoN+oe4+p4B9LKyH5XaU2LPD+28PGLs5MSLlp34Ua3wlgjaVIMu0Xvd1lkOZ/
         zRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364102; x=1794968902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIw999DKhGL9raQZizUEhyS0NYOakQkyAsor8Jedtw4=;
        b=KE/dBXSO14gEnsVAZYxH7TT2cKZSB4V1f+vEG/0FSgfWohFFiOaIz0zDftoGTVRSVL
         7mKLoHwjGWC1aZOuFfFE41myINcsqW351fjrtMOTQasOObnLBGa87VkxrXKw2lPxG/CG
         e/6QCSUoKnxygwXwEtN6RGo/IZ8PS/6797mEGxMW/kqX4xEm3UKQFf/u8EftiBN1owMF
         sueGlhzc67KiFMiPsuMGFVAbOhLZwcyc3d30Cmrh0U2SGE5cD7hAlTP0Njnmvghcugo6
         o1QguA/xCK8pAM2Khs+O/Lla0vYKSNoI8aTUznFai2DLYxJZInaHcn2d1bw24AZ6qoJG
         9/yQ==
X-Forwarded-Encrypted: i=1; AL+hErFcBZtyWdSF10oB+TUww3BNxF5GQflrmPRL6UMyc5q7cDY1/GF0X4xyi1b7SAJIIGYMShupPsx0EgoHgB0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8S2iOWd3J8GsFo7cAwZF527S8KpdaCNXO0lrQIlhEjn96SkVXi
	6PJQUiCHn2Ciz+QfujZrzDHtfn3K2zllbIFvnbLmxsz7S8VcJnNdM8Ht
X-Gm-Gg: AYBFou2RbInBJYiZtcbIc0zF74pKTF4DuxCMNPNvIZTwO02mWFdOhGvN8CQTMsk7lvT
	p/YjBTBPiainsCAphUHWMqH5JCelZkxv2P0oyyHduAwTdcASq6oHLnnF6s8V7sZJBVVa+k40DEK
	F44IStv3ykTmm583bVdAP3ZT/S8SxP7AUgJpZB5vH6FX8rz3Qe0zOIbmpfbAxdBx216jl+zK0bK
	3UvksjFGrWr+mWtcXemLScxFpg3UsvKxZpJ+lEGHk7dfKkEyjYS5mnKE8svdG2crPGV0+oEQRxU
	eXVYTpCEC1GWTr5ILf/ssJi47NIU9I6n023eYX/1/B3T2VebmJ/LEloT3nhZpySK8disTZdTnDV
	+RQCJGXomfPYJpih08iPZEJ0sGLfMEiqAPFjuNNVa2CxZYrg2JJWoCcqgG5LEFEag9dKkZiBx2Q
	kdDUzQqHu6pR/PukiPMW7U4zrz3BN4+AstaHFv2RuciNB3S4CCL/mgcF7FS3kH08A1jOC2mpu27
	kyRoaKX7Ud486AB59DqRataQhc8lAASGliZI0QWpUCXEgPZxFgcL9NAu9QEkdoMol0cxZWvxtvI
	x6KoP6LIFN4CJQHYcCOiEatbxbTfBO2dmgwiiPgMSgHLQreWbw6ikeexjNKPeQVVQJbMmUFA5W/
	94WucZDk0K3HPuN90/BK4axawt4igNgRGXNdUEb1VWei7
X-Received: by 2002:a05:7022:f50a:b0:1b2:6855:99ac with SMTP id a92af1059eb24-1b3c03affbemr924246c88.46.1794364101997;
        Tue, 10 Nov 2026 18:28:21 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm10054285c88.14.2026.11.10.18.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:28:21 -0800 (PST)
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
Subject: [PATCH v3 0/6] ASoC: dwc: Fix several issues in the I2S driver
Date: Wed, 11 Nov 2026 09:27:25 +0700
Message-ID: <20261111022731.8243-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hi all,

This series addresses several issues in the DesignWare I2S driver,
including clock rate calculation, DAI configuration, channel limits,
DMA FIFO sizing, and error handling.

Changes in v2:
 - Move the indentation and typo fixes into a separate commit.
 - Add a separate patch to propagate optional IRQ lookup errors.
 - Add Maxim Kochetkov's Reviewed-by tag.

Changes in v3:
 - Add a Fixes tag to "ASoC: dwc: Fix DMA fifo_size calculation",
   as suggested by Sashiko.
 - Ensure the reset is asserted when IRQ lookup fails,
   as suggested by Sashiko.

Link v1: 
https://lore.kernel.org/all/20261106112940.53550-1-phucduc.bui@gmail.com/

Link v2:
https://lore.kernel.org/all/20261110095525.504660-1-phucduc.bui@gmail.com/

Compile-tested only.

Best regards,
Phuc

bui duc phuc (6):
  ASoC: dwc: Fix bit clock rate in TDM mode
  ASoC: dwc: Fix error handling in dw_i2s_set_fmt()
  ASoC: dwc: Fix channels_max derived from COMP_PARAM_1
  ASoC: dwc: Fix DMA fifo_size calculation
  ASoC: dwc: Propagate optional IRQ lookup errors
  ASoC: dwc: Remove redundant error messages

 sound/soc/dwc/dwc-i2s.c | 59 +++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 34 deletions(-)

-- 
2.43.0

