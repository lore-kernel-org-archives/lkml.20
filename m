Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9469C474268
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253043; cv=none; b=kxYgX7tbRon9qgDeNK3Wskgt20qHZV8Qv5zVZRiXVbaXBgJtiQd7JbVcUcOTztJAsnVqdT4bvhFK15k8dZ3yQYa980ypr5AsKJ03w/Un/z6jiFR+KfXhDGu1v5/HS0GH4gQptNiwNwuSJenN1Erz1eJdriyNkrMc1eRlKkQ8WgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253043; c=relaxed/simple;
	bh=ENu0ff/T9GLBxirGVWZDIEaSILfp2s3hEpQHwIiy3fc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GmtivHp396yT+zSd0V8Sh1BIwTt1YJ70YzzQbZKQ1l/16J4s8sF4a2/GXQvKRjS9fw88Qyl3ip/N1iOn8rTRlz2/cFZ05lQsKd8u715tEmhjQZa8FqGYdIkaWECIxbudifBr2KLq0gzvSGlWem2T97xk19I37aP4IZD5IpiEhWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=f68geqt7; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="f68geqt7"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so4372833a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1788253041; x=1788857841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3N14T7S98EVd1zcTAmDaJnZi9OULXIvtKuCSfJc2RNs=;
        b=f68geqt71ydmLpoUQEoVuDgFfHpnTSEaKO9o5RW9YK81ULPw0DEMN9EeIrfX4UUQ+H
         iXMNaB2hXNUUkYKTWcW1Klb+8cjjrhHLUt37JtuFqfv42WnYgAwfZG0QFpF8WDdVibdh
         dXK+Q19ZRNlcz5yU1T3Mmh/gZrsx6PW3NgRGfTVjoLtKZ8Th0TUuPXBRdbM5UcILB9Xc
         A0h+FRVh5YBN4t01q4rkMiCpEoeFTOXZvPZizZtzR1m7LMVCGa2aMQ8nHXn3OC8jhdCz
         RaepSsgBG5LL2jyVSgsJPi39aU2zuEM1M83WytDkpMGxFZpBI0HRGaeEVGm647H9Bsdq
         iDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253041; x=1788857841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3N14T7S98EVd1zcTAmDaJnZi9OULXIvtKuCSfJc2RNs=;
        b=hFiTRtno/vmu5MLzgku7I7pnvwNgBrnj6CvQBPE6RIyFnGfs5oMycV8lBpm8Gi39+x
         pDA1sCKPAvYzFk9uPAt4Kk1MthFHfE1D3QKf2LQRuq72Sit3TupP/hhE4K8aqNNn9iXp
         4FHv0wN7qKxj4YsDD5lC+oaokHZHLN719bQi04gt9nfj4InTm8EljAPxUJuvkR6bPAYv
         OD05ZGprd5hxL/JJh2tffMrAIVbBavdA7RRzkN+VYAIjxV1EdeXnzs4P637tu4xYam6h
         WjHyu3WSY0fVHFpM2UdrP9zlPrGGgu8J+IUsFspA1IsUV0vv/wZ+H0qZ7Q0q9uZYM+B1
         yeig==
X-Forwarded-Encrypted: i=1; AKwUvBxyHH39aKZZ66Nna1UEbgv9LWKitqhIpFn/XwycmQgTwEbguQPOHMVJs+DJrcEItMBbuMdzTuWapb5Z/mI=@vger.kernel.org
X-Gm-Message-State: AFuF++mjKettkEwHYQ7fnbeupxbhCwTONyVK+nzNCLrSN4qxmQg/7xGZ
	/ClfkpQKIFqJ/nsJRFSWX1+0WJttNNU9TraZTNNaS1OM47a3vzNxPmJHGmU8dLyQlSI=
X-Gm-Gg: AYBFou0uhrRSjz91UEKhQFmM2wuC2L2RqrpG5kqU6938aC80m+yjhDkdBE/wUfuktIQ
	cLSEDxVW/ATpx+iB+OmzeFs3t3ClSoadKmAyevxBVAtuXc3J08Z1DtC3iCeEvRmLDw0v2GTOgnv
	lPqVPOaJOUjp8FflP2mRAiCxLzInpC4N9UEGxhnkqNf+4qemUnRPI4CpiGWZWSCtn+vByLqCi+v
	Xg9rTvygdMD23GqSz21txsokNlrcUMUu85rrR+8FXUkCSXNu7xt1VmfVOEiWhX099UGlx9NeNFN
	5741IGvyn+vgeYG43W7zzZ5vgygThRof86WCAjJmNPU0VZ3A6ujnlF4iYvYCO/rPlVm+hDN+nLk
	5b5MjBDM60+jpjVJZsRH2GBFaJQbfIwDRSW3aPQGjUd/frWpu1eKjHn1b5rxc6nZwi9bZIVN8Em
	vfuL2OW3FU76n3N1uc2NVoldZNEfgBQ7Um5zrvnV8L++K+L6k/WH0JeTvLkQ43XxcrBeWJmNWdZ
	Ck5ncQa1YcXgQKpZrLk6BTkgf50RTR+vFmtc2YgVS52Y6inoNEtDnJJGW8PIW7oU1rzSnNbL0tl
	UFdpeA==
X-Received: by 2002:a17:90b:388d:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-396d0ed8eb2mr47596038a91.9.1788253040839;
        Tue, 01 Sep 2026 01:57:20 -0700 (PDT)
Received: from bt-tpe-server.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bcf6800sm5934432a91.3.2026.09.01.01.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:57:19 -0700 (PDT)
From: Andy Chang <andy.chang@synaptics.corp-partner.google.com>
To: linux-bluetooth@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	Andy Chang <andy.chang@synaptics.corp-partner.google.com>
Subject: [PATCH v3 0/2] Add support for the Synaptics BCM4384 Bluetooth controller
Date: Tue,  1 Sep 2026 16:57:00 +0800
Message-Id: <20260901085702.1515378-1-andy.chang@synaptics.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260901023300.1382808-2-andy.chang@synaptics.corp-partner.google.com>
References: <20260901023300.1382808-2-andy.chang@synaptics.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

he first patch adds the BCM4384 Device Tree compatible string.

The second patch adds the controller support to the Broadcom
Bluetooth driver

Changes in v3:
 - Patch 1: Fixed typo and GitLint failure.

Andy Chang (2):
  Bluetooth: dt-bindings: net: bluetooth: add BCM4384
  Bluetooth: btbcm: Add Synaptics 4384 chip support

 .../devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml   | 1 +
 drivers/bluetooth/btbcm.c                                   | 6 +++++-
 drivers/bluetooth/hci_bcm.c                                 | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.25.1

