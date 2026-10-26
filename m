Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009388;
	b=S1572R7c6hLbi3CYaAuhJZRwt0BEIJBkdsV/YdWZeb5mK7ztaFw0kvKNSkm5POkw6bBd
	 Yjr/6Ykd3CfD2CDWbGnikvGuEney+3cVkc94lepA1D51IUYgGokWyagmKcGGsBZUjBfhK
	 VYBPTdsGJs8QBLby8x49uHnEbokoD7AXJ+OBa1iSOkL5jZjshMOtcxT4AjlNxuo2XGh8b
	 H8yH+NyzTxrK6Q85shiAqBHmj70l5kt0car4tQECbA+S3mWU1D4XIEENQVQQSBRTNVWNT
	 4eR9zKnqbqS/afmehdMEJtVHk6s9xlJeJeGiAg4CQ2GKO+Mxn9cZjoqVPVE7DhZYhNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=HumEFrlMqHCto2ViTmw+G3OxsKbMuowdLIAMmEN3GFQ=;
	b=BoSBGwu9v0cxmyhDI/5m8NuFAF4JzfSnWk3IBEVPFV0hwc3uJ3gwDwRKx4TTiZpP3gdW
	 nkcLmfHkyi5NP1eyynu2QgM/dcgJvVQRiRAoXEV/v7NPTBvWcR91JbKnT3lLzjz/PBZzY
	 2R2IeIZDv/d8KGH6Fy4naHrPZhQW0eTOPCF5X1XYV3YDBoGvyEBQ0Kd3jBBJ9pVAGrbaS
	 Qvf8tKizmEf4LLdpAUKbRSfKmnYImHuER/NK7kVCIZGiRwbkC61xiE32NSXyal98tX96+
	 Msi1nlaJ128quo9eb1HrvsDjJ3rqdc5kRSwSsqxSbH9RH+c8KEO/68FjYxawsj4WcAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JZuZgN3Z;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8BD606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD8BD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JZuZgN3Z
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso12231815e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793009385; x=1793614185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HumEFrlMqHCto2ViTmw+G3OxsKbMuowdLIAMmEN3GFQ=;
        b=JZuZgN3ZaHBU5bf9mP5LFwOJZ3fHDzyePPVR6tvhiRp9MzApvgLYo7Y/M5/f5wpIXo
         fcgIdbTFu2l4kaKy8XlWcj7JFIrOoG4HE03xSrCIpXxWIlox3nHrspsLd9NxNBq7mKJ5
         th0/tHhY1jQ0VglgulY2rma617ptazwJ/HEQKun4eQc+Z+QFl8UeASLU+AT9KahXPSsP
         loTawEQkK9R3vZt2W4jlc1ClwzKmkzehrcLOOetf8/0he8DlxAx/ARYncx+ULFA9ftnA
         KkJwDR0ubPc0mSsa22cYpfxAMGCAG/a00ry7qWaIE51/XuGYeMp9F1mCcg6NrsUDIQI0
         rx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009385; x=1793614185;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HumEFrlMqHCto2ViTmw+G3OxsKbMuowdLIAMmEN3GFQ=;
        b=Zx90dR0156PGkjnqRFGJf2nFfa5nkLe1jpNPRIB3kNidb7OkzuP3L9jv1nlAaUKGRa
         d52mEPL21N3N7QR/fkApQPu8fz+NtD6q/eQ2I9ZOnvGUkpXTRORDYatDEZx73U3QMkqv
         m4MntlsFy04kM32QY55sUO+2BxFMnIfm/PKcaY3rk5cGNIatrAXjRLrG8pXiyYJnb2No
         QuQfwXX/xX/CGVdsO3D3p2NYFRKNyJs3Vs7mDnz/SzjDpBtvkxdWYlMUkX1LKoTd5icE
         NKGcHeYnxGxB+LF2vS9YMpGt+/tTBthem+dgEXX84DknXjZxjWSXwGm/huivvnQ6u43B
         XzEw==
X-Forwarded-Encrypted: i=1; AKwUvBxWV7pmllNMv+rNL/B9mnl446ZMVXT2k9ywv8ybQg/NNd598wVgyI2X91Xj9Czbd2X2m2Ec0GTuhIqKagM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEp6fTdbIzuNwmDTDyQbjcaurOzvcIH8LXGO9xu6RDlVLDOi6A
	pOUBmddr0knsoIwmp5jbQYintQxeOGNTqF8H5nQ6VUg5zZ03Am8q/MRpogozUD3MFSw=
X-Gm-Gg: AYBFou1XC43zY9vtz8kTTfQZygvT2alUsB685fylC71KX434st3yCJ8F39CiWefXS+Y
	RoPfqq2Ce8JZbTMuD4DVfwcSU+hkTwlxfKxOtbj3PNr/eWvf7NHeVjOmyl8mQu7OHVl/1iZj2Q4
	QGS+4DcX2KfGQNnGcQAEalQkyUbn1PrzoUwf8psBeZQ2+ggMsyBOU4MQ/5G6i+3ME/SlPZWhFD4
	DbCvz4XUzBdcwia06TdtVcmuRbRqP8R0p11Z8pEeNv3gUyKMRmN/WhzkvDU19bns366m0jm4yaT
	qs672KbqnqaGSyWiEeR1A+VmWpdsQfloxJzDXEGq/PaOlhfxLVr9VwGBjQ04L2TyJd/5U7ugexU
	nbC+Pf+EeM+FwgYB6m9Kxpg6pei0SneEAWK35uFZhH4uTjvKwt9OLJemvzauaXZkoF4EcBugbQG
	JeUhfnQ89saCxCK+4mVID1V68Wzd/x8EDMoraSaUBwADES2rLS7DGqi/5SHC6ES41w9bhUx0rO0
	H0C1Pdcu22sl9h1W+n5mIC4sLFfBdcpYp9ZWJKMnRfwhdzz2rMp8xz+4VnNP+T+44QrZwoGOBme
	n6tIM6C3+x4Z4xKDLkvkiOBUTLTOfSGH+oDQPIqurA==
X-Received: by 2002:a05:600c:1d0f:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4a35acc76d6mr115228495e9.32.1793009384948;
        Mon, 26 Oct 2026 03:09:44 -0700 (PDT)
Received: from localhost (p200300f65f19a904bf765b6740c3076b.dip0.t-ipconnect.de. [2003:f6:5f19:a904:bf76:5b67:40c3:76b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a59d998sm191748665e9.15.2026.10.26.03.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:09:44 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] remoteproc: elf_loader: Make rproc_elf_load_segments() more generic
Date: Mon, 26 Oct 2026 11:09:29 +0100
Message-ID: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=p8BCvf4WNLvDTsTcauj4vL9ILkW9KOR07cSl5g6yvHs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq3ybbdZZQCmOQEwlRereTB+cpQErFhNTawdaYm 8GKarLnZ5OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat8m2wAKCRCPgPtYfRL+ TiTnB/9q/2uqQ7mxzRKdtOBIs8bbAq6IDNldcSzkBYE882FHSYLuF69QzQGYggbfdshBZF6KfEi 72spEUCb74/WTgDet3zcw610iMpBONFQx/bnX2ygNae5l3T8DwcJ/QLRfRstK9JJBodno+45XLP qFCvgs1ubvMdtdoBLpPTCAmEADK2B5fhqO3+LuR6opB9OseqLp4zSO4/4GF/YxM9aZoLnD0V0Zw aqqoMBTyaJNu773gIqT894WQGRijP+G+Q8hiA8RsiEbmHCXr2rSjjEE34SYCF7AQp7nQoeIZX/R 0YHk4Zo2OTearFppBqodw/347Sk1klnFu9Nxl5okTb67O2W6
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

I'm currently working on remoteproc for ADI's ADSP SoC family (SC598 +
SC846 and others). On at least SC846 the memory of the remote processor
isn't directly accessible by the main cpu. (The memory is mapped into
the cpu's memory space, but cannot be accessed directly from non-secure
EL2.)

Instead of creating another near-copy of rproc_elf_load_segments() that
just differs by the memory access functions, generalize this function
and make the driver that already has such a copy benefit from it.

This is only compile tested.

Uwe Kleine-König (2):
  remoteproc: elf_loader: Create new callback for copying segments to
    remote cpu
  remoteproc: imx_dsp_rproc: Implement .memcpy_tova()

 drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
 drivers/remoteproc/remoteproc_elf_loader.c |  63 ++++++-----
 include/linux/remoteproc.h                 |   3 +
 3 files changed, 69 insertions(+), 117 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.47.3

