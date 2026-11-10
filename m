Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297553;
	b=rSk4NBogplHJhy4P+DOgy14kdNs45IR86lVF3YMWbtgx69luxkNSkGsmgxHHEZmsz7vT
	 srt++M7qBXW7cY+TceZjTtog14CIJ8NRtogEZh9xOPbMF4fHsLr0xkkWKgTZ7tPeDV8tZ
	 5J1v4vnnDuKgRgUyWSIJHt2Xtt2PnIbTBOHxczn4l4/KkGHt4q0mATWDKG93QU49XwyPJ
	 +usDvhaTKZ2ui/eaPULmO/IONlbSSxDZidtXoTbu5bUS72p0ZY3kLLvI6C51bCb65mEnC
	 CsHkcIeHGXqIrYzzs8cnZN+UXDg4SD1pcAdZa1D21PF7BL4DP7WVddUlGR2oaypxPUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HxK09xxN2287CuasdDaPYZTGt3qPRFw1gcuA14R7A5g=;
	b=Z9spglEByf6V1/tbw1+6YfNbspT95IIHcJVBjRaNrLdF/0rEa9Dw8mnuZ8LG1B38c3E7
	 K30Y70ql+VtaK5GDqGM08ayxHZVC/kEc+4hBkRdbd6HYSagF6QfvB9blfShFtZSYf2EVP
	 4oiYigmcGNykBZko/mQlGoAPOUZZXOEGE453Taqs896ZgaA76Uhkzfb7EU1zwSntbkIVj
	 aKaUrYFrJReDIVpysX/WRCR4rvIdYHdhAy01Px+mxzplQjs5tSxo9AZKK2BKMJ9TkHcx2
	 2Y2nCZax4iuqGdTw4WMbkwGEFuGiUei/AIMIu86OYybyQbqTbmq/7lLbEFZTO23G1OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=suj8vKis;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13162606A334
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13162606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=suj8vKis
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-372bdb942dbso2342955eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297552; x=1794902352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HxK09xxN2287CuasdDaPYZTGt3qPRFw1gcuA14R7A5g=;
        b=suj8vKisfeaqzOS5JiCAThSGRGDCktf4osaRC9YDApBn6xYoTckWsv3rSfNlKdtTSF
         2SNfd6amg9nx2D3v5dnZQfHXRYOuyg249gFgl7BdzwuFjL0TTgKBPD07fhTxfUTKi6bj
         9HQFvXPBDBQ7+aFT/4XXROlgm6RbBEXYknQKrr8qyhVglSIcrMrvTxWvU7ILWtM24TBJ
         1U5Js+2tkDOp+277U7aVd6u5rOsWFgkBGJkxyaonsZi97xV0vOpIzAws7/QwN2GjJBe1
         ue1c9vQKOAbS9Pmk3C6tiPJXFFpBSSJW5C4q23jcyBhn9nhXIjSlwT2oDEMEv0F8Dc1i
         xKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297552; x=1794902352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HxK09xxN2287CuasdDaPYZTGt3qPRFw1gcuA14R7A5g=;
        b=IA53WSGnjKT0befA55bjuG9JOUsPAp/47PXAFc2dyaD+flENrSKnLWyqRItgQhWOsd
         G6mCWtdVPe1Fa9gq87XcaonuicyhR8TdQYDjq8Et4h557oeTA/vq2DQ37y/zNHdg52b2
         L1S1tz7ueKhLJ0vckeOfaoEExLV+2J+MrHoGg+mYB9zxSLpgbo/dFLFO13uRxXu+7Id+
         sQ6wyvpwqfPWtOBqKlbVqV/iDDc9wzuXQ9caQqDXygFyw45uD3LgYYUN3w1MFZQk6E2r
         M9Wh4GQat/Km1RmM5zXFOjVPUygPtbYZZx7l0sfGXIGVD2b64z+x9e3H9Gwu3vqsf4DM
         SxFA==
X-Forwarded-Encrypted: i=1; AL+hErFyzmkzMw3lKEjmCZGGT7dPIAeHo0d+58Ak+pEX1/S5kcrfqs9KB/BRrxc7Km52lGn7rr/F7e1btLUIauM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/jLw23FaKQ0fNHZT90SQrnrc7E8r2FRjNFWrTu5hW/z9g20BF
	ZdeHciiCpWBXlUG3MZTa8f3TmRVfsIvQ71DkZidz9ChrK2YV0eZQE0sz
X-Gm-Gg: AYBFou3dp3lRrxNJgvpT3tteQQ4wlEBBEDPH6mT3GLoegKJS97alsoV+OcX4uGjos9d
	+K/vcsSZEQlesspwgmkEgUXHsWeXPHYECQTtX+k0Y9CWNlOzGwvLNfHB78hDm7+xjGu9QeUj1n/
	c0zJS48d/iXSD8igNOyuE8sB96zqcyt9o/gmubcMCZv7HILwvRBpxy7o5no//u+24WwtIDMXUF6
	SSqK1c1bnmS0+3Spzz1v1apkoJmeC9Atc+PYMiDoBeZJRpZ1Be1HDJ02GwlwX4HXjzimYjMjRow
	Bgqpt9AygasDfTAEWGS+6EM4UedDtPn/7iRPFbjCWHdSS9lvv02ONPKYG3R3irWFiObNxLgMk0u
	zVsu3MgbOtyx4d3uirbu1m0q4nwmfFTYVSuYRon5XLIMpZk8YDES6bqfXvBTHgpGeklsHzxajKJ
	qPUDaNwW+F8/mbYQ9MUt1764u87sx9Ol4HYlOrWCJd+DWgH1loaXGEru5ziUQkP0Wc1onf4yPM/
	X9W2eJYJiYH1k2KXz0LHUx4nGwpDgHovxalGYeNNLEApxF+aVXZcVhcvBxxqdUk7hPU2lpDShst
	0Wo4IMGwKBYHBM0oa+s+uD5Pe7DnS4Wz17fA2n3K39/ajN3+34Oa51cphZUyZLLO2BoFk/2c1VV
	TV8+BnWtV5VQ3uGSyU2vBVREmaH38yW0Cmjk3RGnrr63A
X-Received: by 2002:a05:693c:394b:b0:36c:49a7:86ac with SMTP id 5a478bee46e88-37520713cbamr2941577eec.37.1794297551590;
        Mon, 09 Nov 2026 23:59:11 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm4498321eec.3.2026.11.09.23.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:59:11 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: fsl_sai: Improve error handling
Date: Tue, 10 Nov 2026 14:58:39 +0700
Message-ID: <20261110075841.12104-1-phucduc.bui@gmail.com>
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

This series includes two follow-up changes for the FSL SAI driver,
covering hardware reset handling and dataline configuration
error reporting.

Complie-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: fsl_sai: Make fsl_sai_reset_hw() return void
  ASoC: fsl_sai: Report dataline configuration read errors

 sound/soc/fsl/fsl_sai.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

-- 
2.43.0

