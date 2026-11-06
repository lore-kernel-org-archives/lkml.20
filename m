Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964616;
	b=FHdwq+/gKU9lXPBS7aF0b+thgD6Fe+HCW/IF/Hsyi5g2+zKgwGU5gG2XfFTYbQ2uCHFb
	 +e4cbTlsCm7Xw2cIgmAXa785CrS04NX8GuxBuEqi+yYkIvbghX6qBk7mXNF45NnQ2Pj1z
	 UajJ2y+yjqbNdvHImmc46TRES6UTAOoA7K9ya+jk7qwCAUc3VkP9Zybyc9vBsmxLdPScT
	 4MX5l7nQAJ2FVp0hPyaGHH5lqTjW+nr0fnJ8DSfidLyXiv02Q7hYhDbUjyc0dPechR/iH
	 +VUESEJ8dBWM9Bj+oPi80hVNYrgzjEtbmy8T0GdLPf8qSqIhTOusOgoz1kumTBFVs6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QZdVv0AoqKGhSOeGpNQjce6sWXA6jAFaxzQW9Vhz4uc=;
	b=Wfw/5CF5VZN/PHZxehzNn/K2fAtQeCrcynRDmqHTBzuZ7qyOMzQgyCd2yXsez3H3A+oA
	 G5D84838OYH4nnw9/7ig5jTsZEPenqO5TSjyjuhHVvBQCkfxbd4WONKlQnU9+ZaPWi5Cf
	 Ss5fwZD8ZgCjlZ3jCI1/VDb5E2PCxMyao9RmNeq2Ht9GadaNG7Wjf4c/vYhHHruiyS+tW
	 mK6SJm52o+pabmUDl7dnDP26PWGIz1JDNkh3r5KuQZWVR0iRhewxjbwH09UrClasFgkQf
	 GCaMKRJiWx1QgbZwlwBXubrzaQPZ4mdIihk7BmMdfvLpy+nGcIuoSyhY8z31rqMMGPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8OZB6VU;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF6D606D81D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAF6D606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8OZB6VU
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a058315c79so232978b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964615; x=1794569415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QZdVv0AoqKGhSOeGpNQjce6sWXA6jAFaxzQW9Vhz4uc=;
        b=g8OZB6VUAn8mhaaN/mvT96SCEyqMkupXV3YRV14g1vx3YBx4I5tA5nRsP07Vhzy5Up
         VPYSF80TT9LI1gG4D4NF9s9jZM1+zvvbmPdEXZuJwWdzl6tv/XUIskEIYdDhzRXb30li
         6mG6m9uF9m9KypErwqGZgYOK86cSMavJEGKtmjdqmnBN9wxmrF3ptr5xrscJKqPb/R4W
         87uV+SHcI/VF3K6DMzoIy/7tTVkU3cw+5en9gvBY9cm2Y07QjV1zGZdBE3hctRWwgszN
         e0PO7C4zqWmiA3t/keBmknlIphMRoPKWbB2XW+E5cVJ5gyFlUuGRYSo+2ZJxBahgqYVJ
         bYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964615; x=1794569415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QZdVv0AoqKGhSOeGpNQjce6sWXA6jAFaxzQW9Vhz4uc=;
        b=bqJjR4uc8VYeYViTtSHPTUp0NuQF3GVSKHUGezwoFU/d3I7RMf7d2d/qk0YJNqUoUx
         sgVPgC54S14i1dcLsYKoSXcS+zBV2/a1/qf4Za4uIy4YKpeWNPGDDSTS4cSnrKU/fgqs
         eRrChSc2wLp8YS9EDvhZP/HeXyNmiWxHW9Oh8fUtcZu8r2DdJsj2h9ao5WuTwoAJIJrO
         6iiqRGoQtgTdDHIupOX20WS3Nf3uplZOqTsbas4CUkeSXi7UUmDHiiFbjNoIH0ou/MxL
         O+2Lx2tOWWDej/CyOpDDgeRyOK3DSW37bA3E3aWPPu+H5sBJ7mRGzjRPLEi9znL8Z/CA
         na3A==
X-Forwarded-Encrypted: i=1; AKwUvBzNAmHpH+A+aDJht6w8Yrft1zMou9g5kG1hfi1KyEx6gohtRf5F7dVqzV1Y2P0KJkLLU7oFqJ+/cemyfa0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PDqL5KUUo0C+716e1PT/SIyvC8hbbQRt7HwGryPglzSXjljNL
	I3MNtTEglW/TtZWHHC8gqAIZ6GbF6USX65a3PpgDHs//UJ5f2uRL9JZu
X-Gm-Gg: AYBFou2t5HcEfx5U+cXgrIN6jkT86T5/so+Sfz4MLmvtm6365J+TZJiMOS4IeM4jQrI
	kbyQg924AybQkC77uSwVyM9PnP7uwjkMGtveKqM1lY2VlVCnP/qusdxg484pbXoQav3HwO3GDw/
	xksSaiKZvyj9+M9+22vNJHYbvPrPDqIDBxPLszAuDMaJcJcBD0MHrnfYMEbCzd5c11GsoBYix9Q
	fRbxFkF6hDOofV8w+fTLE1x8kDesQR8ayReZjOdm1ngspIE9vxjEa3bIFYShwx2BqC7wPwjMmNs
	NSAfEW8Z/PxbSsfVZ53vWDStEK4DkV2M1aw3BNViIyMKZfz4iGbBphDF0E6iDKTYH3t2QluIW8a
	Zi+EiLe7iOmmt4bi1vknDW3S4VZNq2i8iUUFjViBWSF0Ri4ACHd/7T9ZzDTsZMuA+LMMFvAJyzA
	J100Em2GK50MaPB8xvpPn6MJnczfQxS+aRtjh6PDC29qTFTzv8S/wpWSnEjGjm/ilO/rCTPudFl
	Iu0zSydhGaAlkiM6WGliRvrcDfJTF3GFa5jwkyY7CU+uqKQGK7sfDKyz+wSEDII2HxC1fUYfmDj
	VFxMn2Rq0mpn2YmP/VtxqfsBTUxOIs3JrIHZkMDk2ePV25/5jEW25mdu5c1zJJk1MnKohp2rR/Y
	/ikBP1N0SciDuIk5sxDCGcCHm6gB3X3exaKD9CORhwC1yVTD7UIHS9t7z18HThXTWsg==
X-Received: by 2002:a05:6a21:47c1:b0:3de:570:12a7 with SMTP id adf61e73a8af0-3ebb274ebadmr2230545637.8.1793964615221;
        Fri, 06 Nov 2026 03:30:15 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70aa6ab9sm479228a12.27.2026.11.06.03.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:30:14 -0800 (PST)
From: phucduc.bui@gmail.com
To: Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/5] Fix several issues in the DesignWare I2S driver
Date: Fri,  6 Nov 2026 18:29:35 +0700
Message-ID: <20261106112940.53550-1-phucduc.bui@gmail.com>
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

I've continued reviewing the DesignWare I2S driver and referred to
the DesignWare APB I2S databook when looking into its clock
configuration, channel limits, and FIFO handling.

I couldn't access the document through the manufacturer's website
due to regional restrictions, so I've found an externally hosted
copy for convenience. The Synopsys product page is also included
for reference.

Databook: 
https://www.scribd.com/document/891940768/Designware-apb-i2s
Manufacturer's website: 
https://www.synopsys.com/dw/ipdir.php?c=DW_apb_i2s

Compile-tested only.

Best regards,
Phuc

bui duc phuc (5):
  ASoC: dwc: Fix bit clock rate in TDM mode
  ASoC: dwc: Fix error handling in dw_i2s_set_fmt()
  ASoC: dwc: Fix channels_max derived from COMP_PARAM_1
  ASoC: dwc: Fix DMA fifo_size calculation
  ASoC: dwc: Remove redundant error messages

 sound/soc/dwc/dwc-i2s.c | 53 ++++++++++++++++-------------------------
 1 file changed, 21 insertions(+), 32 deletions(-)

-- 
2.43.0

