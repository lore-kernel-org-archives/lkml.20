Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807211;
	b=Oo0E7SApUUv5JgV4mcYb8cf4xz37FmvvfHoUDNq/WnFRuHHB9mo8g+hnM+RRgfBROKgg
	 5d9IBZQKGuOuDrB0CYfOeVmlTAafyZQnh66V8B4u+5DXvA1Ui6VFkPMSCc8u194rPbi8Z
	 s84rOf+Gb9ATmMPpW7a3hg+JrPwJoG5l1f6jOPBJinL638nY0Q5pLDshasSVip8N4ikSJ
	 fBoL5FVyCZpjmaHzzwJQu2LDB1sW3k8gi+sTrgOsds08nEc0Q6dAmDCNlz8s9tAIzgPe4
	 Az83vDBGMe2rcBmT3TJymiKOFkdOtYVoTfQ/pgLPcSmPKkkITtmZtxS8RK/Tl5kZSGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YHNdm8WS8O7cmpiTCluq8jnb6nNTp793I0+H3Iv8acs=;
	b=xE5ytonogjvboRt4LgROg/DFDbq8Zfg4EeUNmMtgk8Cm+v+BHSJcoORtAIvuYr/0Q7eU
	 ioxBQixYi83WRyh1P5qbbqAFlIgTnPsJ8H5n5O/tl4qx5ngRci0b/vAr4oLdLb1csSFTI
	 XuBTFKPtiijLIdcKETIoNDyuLvp1P7htZxQP6U4qXNkX1evJ83xFVyamv3u9d+a9chCOX
	 RFv6QcJ/LtuCfxeep3Uo43+DV1wVvkB6+3OY8OBuRg+rBvQv51iFywG3qrYqFXgaWRVB/
	 Cq5e9bOo6yPkq+dr1aCQPookuPkldMNhNRd4Ebj1jfX1wEtiI8O8EmCzC1KemtSBAXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tGvf6uV/";
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692F7606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 692F7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tGvf6uV/
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a070781f63so467059b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793807211; x=1794412011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YHNdm8WS8O7cmpiTCluq8jnb6nNTp793I0+H3Iv8acs=;
        b=tGvf6uV/qxwp6Qciuo75f19diU6x6TeIOd8sDHpgMZ/QR5kQFTvqilxAI8klZ2TX70
         MTL/M8UVWrcjlUbKll5ZwkuXw2xkViintysaV2m41QysCW9yY9sFq0Rm/5WBtSoxnCMB
         xLpOfQA54YYmsK6x5XGGayCU70zlrS/c42YjVBd/CVnYH9DyKH880dGZEIOqxwB0C7X0
         725m1Nv9Zhf4TyEeTgWVKlsk6CV3wS6mPCWpDUHJpDxO2dTzFVNNvpOCcxrLluA/4Rvb
         ULFo1qSuwKYJlsW/y2YAHYdOaQ1sbc0GwbjTygPB6YoUIq+gmiH59nlICupl083gtem2
         Oeww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793807211; x=1794412011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHNdm8WS8O7cmpiTCluq8jnb6nNTp793I0+H3Iv8acs=;
        b=r3GXTMmwMJUgIokKJVWuOOUOSSYm0OT8SV9ZYFOo+tEFiw86JWQwCcnD6QdJqqb8WK
         40yHZyG44oZPGQMEZD/reUy4Z4qPSC+JcR4yz6LMX9pixkmLcompQTQzY8GlNF/jnIXx
         Oaox3J02uV0FqIpZ0yt2dcjbSeLK82003jn91CACnB2vPtvNxgCxMgwRamatW5d0/g/0
         2LmXdY3NvXuOJU9PD13SsQYOY7O5vLSqGsdfj3K93QfpBAMjweaRyrFV4kQxaHV2ejsV
         owuinL5lZ26Vf4223YE36rxAnsyVKFfztXOimduNvOQp/LRtXFXtOVyLOMur4thTv0OU
         sWnQ==
X-Forwarded-Encrypted: i=1; AKwUvBypOpft6RC5eJTsHopHJdXPYVi1ylghvVAnMBiT4TPAxh+fGl0niO4OAae0fFw/Puh2bmZ6Gtvts5uAR/4=@vger.kernel.org
X-Gm-Message-State: APuU4Z90fPYfXKLhdqUWKT+M+QICo2t7goCmTOiu48D+/jAJxYVPnAPM
	wrBGSNnQVrAwduIWZOzmIowllcrL33LzYf+TCtnz8TuB/B59CKvEg+5BaZEW7g==
X-Gm-Gg: AYBFou0Lkz0KP4hJISRuXNKPTpwr/sfX9vs19X3fJqJrox0A/WRapYQAghEEUxKgh0l
	CEpzKS1I8jzFR1QwYOVxt1z9JlzUwORlVPKOm+igT9aOfF+3OUN8eibEYmHhYyfrJJnBwrxioMT
	/Aieo9J2UFdHjiwj2LdbbtqUnLUNVvrDbfNQ+rFIpOe8P9+rIDPfTf3z2NMaBa9UYpdNofXlrDM
	72cYMUnvGBmpGkKsO82Y4zDUtd7CClhAIWlOqjT/sAncQXBf/cHb/8y/F3T8fEmI6bl1zg08CSA
	e3jeNZKKQo8ldiElVpe6HUUz2JZwQsbp8yUWLdyzEGTbw/yNCtRucmhLyIw/KAwDSVZfQ09eStH
	GUQBPfm7EjpyhOgDy6uvp45nypMGDxaZKVrEp0DaeNPxreRzDbv/CyIi4Lh0VSr8wuFLCIDqL4x
	bDk7MPOc+9oymEqhPA4n+wylOiWHYeeNwbYnCqIrEfET+GcbuLSBKb24GpCiRDba4+OhDukzvvg
	DBkfp6cce80Vtwhx3yn1TY67QDevP9s3CYmEHo1Iu9xjj2RON5Rxb9K/0qLx6/XhgZx9MUymHAF
	+Y61QfbxV8G+7/pZAqF5rl8L62TGq27i+JNTZJJMGwHhZKrd8U53
X-Received: by 2002:a05:6a20:a11f:b0:3e2:819f:8a6d with SMTP id adf61e73a8af0-3e928d469f1mr15255320637.18.1793807210370;
        Wed, 04 Nov 2026 07:46:50 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb4694a0e0sm1372632a12.20.2026.11.04.07.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:46:48 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: dmaengine@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] dmaengine: pl08x: Support the Hi3798MV100 PL080 variant
Date: Wed,  4 Nov 2026 23:45:37 +0800
Message-ID: <20261104154542.3131916-1-mmyangfl@gmail.com>
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

Hi3798MV100 (HiSilicon HiSTB) carries a PL080-class DMAC. The block
reports 0x0a141080 -- the ID reserved for Samsung's PL080S -- while its
register map is plain PL080 and the instance has 4 channels instead of
the 8 the plain PL080 entry claims.

Set the DT node to arm,primecell-periphid = <0x00041080> and
dma-channels = <4>, and apply the two patches to add that support.

Tested on Hi3798MV100 hardware.

David Yang (2):
  dmaengine: pl08x: Release the reset before reading registers
  dmaengine: pl08x: Use the channel count from the device tree

 drivers/dma/amba-pl08x.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

-- 
2.53.0

