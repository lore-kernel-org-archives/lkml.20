Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012330;
	b=Q/qQw3WaMr+ioss9+GeOB4KxWyt5VLzYDczsQw+CErrqh1SkxASCVSx7SSTpIWv2n9mJ
	 IlK6XE5YcjQthIhUc5Cim+R2QkshxAVG9fWFIRk5sUxZPCbFwSlb5TKTXG1UPMg1iQ8f3
	 p9/vwANPAJF79vOZwqPDgzxqGnqqC41i0SJrYhblNq7IhWgVUI548hVeimg5UxsqccHwn
	 0cwFfMw8kgb0RZnICqCOzEwXqCIQzns8u50nVthBcAB7zCj9IC+gIcPxaARQux5jX2OFW
	 nZHjQm/tjuqC2hgXIAsh4wotNXClpaGDkvqRs1a8e8F6Gz0XD3FwtvNmtqRpDlK842g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oeh28SrrH4onteuX2bTowmkL8SoxLDzHp+MgXoVMSPQ=;
	b=t4rQZfmM+7B4w33bCul9fY94NKfwyTYPq4oNwHlgWWkr3UtCavGKN+iHOhyWWCx7aeJI
	 D6GbB+QlOcGZ9kiXGRkGc0k6LLXqxR5F+hi0gA8QRtCUf1gcBRuggr7KbksVkuDjitBAX
	 tbmQJjv+S9xo4dUygfvZsn0AOTLVzrpiih/yjjEShkVkSfZgtr5hETyt/LCsuKbZqsXsP
	 NBjziEcZ7jcRf3R0JaLNyPLENbCxkoxuE6Nsavy+Em7qb3eSAoI+/XbgKuWPvhRnt1fMn
	 +4+JtiZ+T790kJdzTcep+JT/xzGs2MUmWZr+HzxyDK66osRCgmXf4lWImSrOLEElDvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="WSQ/NSDP";
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0395606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0395606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WSQ/NSDP
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd623dfe420so1822683a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793012329; x=1793617129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oeh28SrrH4onteuX2bTowmkL8SoxLDzHp+MgXoVMSPQ=;
        b=WSQ/NSDPaq+fu90JVvXh2nn6dhS6asWvcgt5EMSrmsyz21mvtsMGK+9cpjlQLutBqw
         3awg7JBTWGxxFkgsF3HWiZKNtBmBkCXANuxyC5GtTcBw2xeqzebWI5arHprqM5D+QOf8
         190voOFHSsvN88y0Cv/gdb5eh1pI32QwDiezk7Wg9wIRZJi3IZZe/rR8qS0GIXxQldli
         cyBoMoIRYo/uTBt9X3bGBu/fHQOS/GWyRTIdz1z51p8GAFl+ztgA0JHJJ1VMcULfuef3
         33bo3VZWiAAAs06qLOlCzSmrS55VqVZLdZc9F02RHWkoNKtcCCejUs56eG/xhuS0z21Q
         aSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012329; x=1793617129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oeh28SrrH4onteuX2bTowmkL8SoxLDzHp+MgXoVMSPQ=;
        b=Y3wDvfADZswjYIJrg2QnLGXoYWTrfVw3iRm8/W7KYit+BcU4rIA8RoSnGUSkR6v9zK
         czqRzFBH/JEXgj5RXGtbgZ0isd45Mu895M0TAcJTmFV7KdW02NHQgieeL8gBhVLfZAy1
         QxnUZ/IkHLMCQJTx4TxymRal2sHtogin9pmlm89spSM251vqKBCuLKK1JIzDjvN8PcHu
         pXeeRY7FSD6uWZrXzMqYNOrGfHbn/2iPWQ+UKRu4hzITLuddpPdjdaWx2QodKd/OebqO
         Ts9qnuX8rfzWilQ1PZZ95I9ZKNbgHFT5L5xh8Of4zAxOpp24mBbyVXx5fLUmcrMTwHYJ
         nNMw==
X-Forwarded-Encrypted: i=1; AKwUvBwWxadTXVDExobe+126h9AHOy/VHpOz3Mk1arvHs7M9d5hjnDSclnaRgo/T5K/4rnQgxGH1vlxffXUeTGQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUBKy2X1HzrQFbwQpwhgoL6bt/aAO0canx2xshkbDaFPFdA6S2
	nDouSR3QNBgodOZgLhl1HhE+kZ5JiA7VYVkANHd6KsDIun+UQuP3EIk1
X-Gm-Gg: AYBFou0IGB4RONwqVPwPdhg+TjQvF5G6hoABKVQKDR3HFVewRC9EpY+1A/lhQiBZPR0
	TVB3/k/yroEyp9rqKoP16Deo1r0AaM/Hl28hmzCNqj+OJeP8TZpj+AZivg7urPhEomqQlCtbudw
	T3bC2oJbslJJphwEL2ca6JiIaEcPLpsYS8ZupQn2yIGX3URzO2PhJpJ4hCISYiLIrw9pcaZm2GV
	XqWtolf/NWIQDnEMJt+U5+Heo2cbOhPaprYfFHNxjjNaKy6nA35WA/RpOoYPViI2bTTNo0FT8HF
	JNOlOuD295clRnkGOcLFGkinwkNwQecXKKszDvTYCBuKLhWNv1fUsXlzNPLD7S1gPQSe5EQvQPh
	O1Kjlks0T4wFrj/1HWvA16PO+gZ7x3iTgx/dmrB8p+/C92MoU/Kh13bfRNMisFhHGWV467h7JgN
	21MeFptDwLCYEV7AUcMWdHg7N+liPcXXGgFML8Ral8XuZHABOCJUvTEzBV2aL3MsyB3fIqNzZ5p
	bR9dcrEM8hlgNqz8ZMMOSFqVRiB8gRNJLcAGuLjmomxbBLG9sZLKZ4sQpmuDBX3P5ph2qra3aqi
	b9RPb2umbMsicAGzRLogXdFfUWDyjHvzVlzctpg0WtZwgCMrDI+7H6m2BQ9Ijvx0Qs/AnQcp9jq
	VGemWfHz16Zuo8kWp
X-Received: by 2002:a17:90b:524d:b0:3a7:b260:9ccc with SMTP id 98e67ed59e1d1-3adeafdd84cmr5386884a91.65.1793012328990;
        Mon, 26 Oct 2026 03:58:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm7980768a91.8.2026.10.26.03.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:58:48 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	Russell King <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/5] ASoC: kirkwood: Improve clock and error handling
Date: Mon, 26 Oct 2026 17:58:30 +0700
Message-ID: <20261026105835.19052-1-phucduc.bui@gmail.com>
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

This series improves error handling and clock management in the
Kirkwood I2S driver.

It propagates resource mapping and clock enable errors, removes
redundant error logging, and ensures that clocks are cleaned up in
the correct order on probe failures and device removal.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (5):
  ASoC: kirkwood: kirkwood-i2s: Fix error handling for resource mapping
  ASoC: kirkwood: kirkwood-i2s: Improve error handling in probe
  ASoC: kirkwood: kirkwood-i2s: Check return value of
    clk_prepare_enable()
  ASoC: kirkwood: kirkwood-i2s: Disable extclk on internal clk error
  ASoC: kirkwood: kirkwood-i2s: Disable clocks in reverse order in
    remove()

 sound/soc/kirkwood/kirkwood-i2s.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

-- 
2.43.0

