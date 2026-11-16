Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843163;
	b=i9L8oZTyqcmBv1AGcqw0+2ckpDxXwjYIhMkW1wcqqTQx5ivS6aVP9BPZAP6MpOGzRlyJ
	 lTPrhAByecUmm852rQdJwtDaokxkzzKYoPHNACQxyNXVuxWmbPJEsiGdpLeiI/Cgk+BdR
	 JBWddBNLkIOK04BgzNo61BxHrBMLi8tacvSKPUs0kvEp+zJHZQGA895HK+GzguG+e/6o3
	 nSyEWlfpA5H/LKxfHossGRD7oT/BqpFgC7kXiPx4EYVMNFWn0Q52EqlNB2N35tOfmfwgj
	 wUEs/JWTRK49EpxlWYHs4mbIdBBAjJP4//4ZSI1d3ychF39lgOQnRy2JbKSumfwmjcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2xyBkwKv4BrxAZVMZWySx0jWDoYepT9/2qGbvbAFTiM=;
	b=cb5b9HrGHcX173/XE2oyPQ+2Y6Xjy6EUqM1CRs372+uBt6Tb1wqBz+Q7+69Bet5qJizX
	 Qw5CmdZpc/JybpVe6uwaKymMFFf14pLux0vuKLG900Yw3IT/Stro+eHqf+nE8lsrcNecF
	 LLJMT4pxeb1RSyE6EI6F5TczMuqSFRH0a0Lw87AA4fetNlZ9Mp7OVC4SQNbKF9BMFFjsv
	 waPKk7LLRInuE0h/HouIT9SEHhGu+sxr1rGw3iw660U4LSugXrwvgyEJsf0S7dFQKJNOW
	 JS390CdFxHWiBDzDIt+NLKiIt2Yh/O6izna2B+g9LrJqf/pECd2tdZeB5vUFg3GX2kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yWnSx1TL;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34D9606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B34D9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yWnSx1TL
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso23349155e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794843161; x=1795447961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2xyBkwKv4BrxAZVMZWySx0jWDoYepT9/2qGbvbAFTiM=;
        b=yWnSx1TL5l6kjCTmSKkZCezqdAtxY1N1aYhAhcE9Z0AI93ZNAsFp/MI3jz95O7euY4
         zGtJ2sxkbxsxRk3ERdEqcF308SJun5XxH2Wky3pXmhc7iI+/ywbgrLsG80JM4UKmQlmS
         uWnPuSxJ1p9YZwujC0Mh+Pb4GXD343zKX+LrtBUlnpaTDir+7xZoc+3LiPPa7G3CqvBT
         GscgjrX4778SbbDJ7Sf+7DksWJVLuOgGaRt47bk633qhkdGS3w67u4BTRtNvzaQ0D46c
         CXs8fj5FO5VnWgtWDEO6LIM+qySa33Eg1NmUPQ5t6WP4iFUJg4K3gPaiSjboYRs489xW
         7+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843161; x=1795447961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xyBkwKv4BrxAZVMZWySx0jWDoYepT9/2qGbvbAFTiM=;
        b=YGcfPApwl5syc8d4k1aUGdYFsQ5eR0L23ZQYO1R+vuqUCpHZTIaNYyfa3hATjBUHHZ
         iYyDvrbP+oAgKBxXqCm28F1oATSSusF8dtj7TwZaoaxGv0PKGf1a0fP7KfjTdbnM7Ccj
         kae+22YLF7mw2kMxxbov2TXyY1imLofWmyghPTUPiHBJvV7GtCx6Ij/GennjB7vb56F+
         HNyRCYLVvl0v3HDwHW0t/6rKFIYukwz+eeQhbY3ezvWkLEj51ThIuujH6B0PQCrIoMp6
         rOVwg7/uX4DsNmxuWSMnAuujKWVOgLJ0t8S4faG0quTfEmUJJJH00pIPGRtdchnDhyjH
         BItg==
X-Forwarded-Encrypted: i=1; AL+hErHLVQfgBvWj0bNMM1Tgz4ncp1z2SQcgGecZk38eZDrFF8n/DfkatOI2m5DeQ1IO8RBEZDidDNWNurnSoPM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ygxX0Ezi8SEe0yuou4JeucoZo4eA27V1OQVE+eSxfHgY+koQ3
	zQuXfCSPWXF5IgPMKVLBOnErPXjE8cfqsZ4ts/AotnIWbeGd5vy7GJ9wiqXP7Q==
X-Gm-Gg: AYBFou2xfrM+NSzdNGiplJMIdag591IPSyPBOiLMfy6wr77hMSjtQ5TtcmUUeeBJDbm
	IfIapJ/ulbo/I4pO0rHTKb24+2Wx6OMOnem9Gh3Qr6scibCy8/Wfk871KYhSF0cOoN3aAJoDoVz
	FiTqv+MQrf98BLgbpQqq1hBmHLRQPiuv8DOVvJ9zR7ruFK3KNlBkwAugcRPYtu2xbqYE7IMrkmg
	JMfKQHaG9yaLwOvhdhAgxMJbPP2c9hYM8Sy0EGvXqzxR/9mfiINR9ZirGAcS94Gf0tOvkDdREP0
	DLn1UX5XuzMT39Bst2r3r5aMRu+eBx4TPPjooFIQtwstIDEQgDNykA8vFSEnh0ibCzVwL2sKQIc
	byyCOUZcPOu0licADmeqEppCF32GocEMaxMMD6LgWSeROVV7Acph7/WxXDA4TVuLwrzQavfGBLm
	1+WAd5m+jm9f1pX9+wGZHZs4DcMupvU09DsMxoG94ja4BvUKYjyrkodxx2u/v19+8OJNvf7VHrc
	7Sx6SXTlSyuc6skgsJKbBY3m0QuTG48+bJNjmYVtdp+k3qZh7MRSQ49Rs4RWodcAiufa+X02nSe
	xXtP5Y871smosSgw6LoV46qNxFgfIcEc+XC22JL22XZXI+scVlik/nZgxo9QnuYTJ/kIR/7crw=
	=
X-Received: by 2002:a05:600c:190d:b0:4bb:69d8:3e92 with SMTP id 5b1f17b1804b1-4bb69d841bamr119311075e9.29.1794843160950;
        Mon, 16 Nov 2026 07:32:40 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d0d430sm86798195e9.3.2026.11.16.07.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:32:40 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Angelo Compagnucci <angelo.compagnucci@gmail.com>
Subject: [PATCH 0/2] mtd: spinand: add GD5F4GM7UExxG and XT26G04C
Date: Mon, 16 Nov 2026 16:28:45 +0100
Message-ID: <20261116152847.3658486-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This series adds two 4Gbit 3.3V SPI NAND parts:

- GigaDevice GD5F4GM7UExxG
- XTX XT26G04C

Both have 4096 byte pages, 256 byte OOB and 8-bit on-die ECC. The
GigaDevice part reuses existing code. The XTX part needs a new ECC
status function.

Both parts are tested on STM32MP133 boards with UBI and UBIFS: full
device read, write and read back, and a system update.

The same entries are sent to U-Boot.

Angelo Compagnucci (2):
  mtd: spinand: gigadevice: add support for GD5F4GM7UExxG
  mtd: spinand: xtx: add support for XT26G04C

 drivers/mtd/nand/spi/gigadevice.c | 10 ++++++++++
 drivers/mtd/nand/spi/xtx.c        | 28 ++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)


base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
-- 
2.53.0

