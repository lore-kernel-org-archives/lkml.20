Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794729702;
	b=KgNgWH+mZ3ezoYvWyOh4TIm/TpPj+eNmqgJzCKSI8lPtAVni20amyxdn/2B0Cuc5HgPo
	 jGE1zPExkZhAqqwG3aBGe1KGfXXtm0rdnNzI0YsEns89qWjvJMjmufRRLR7kyYwxycx5m
	 QyIYz6BggQbKgJAlJCnTc12d3kfSdP0sy/S8aQDV420ktR3g8pk5VGMYPh7iWOB/56+C8
	 rEEOSNHjaB46xFP+iacaQ5l0Eronhu0Yv9SLBuubR2lms7I8/qdYveTG+AVeoTIgGbgjD
	 PIbkDscom/ts4WLMFNb+Jmhbe2KZCbzoCBRYBjmKRH5iVgk0wUcbRWj+oW1UxeLy+ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794729702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=80dMFC0Ro/jAPdAujll83Boy4CMrv8kmaX2kTiPJvwU=;
	b=mVBDMEp4HX2J1VRQ/xgwNGwtoOkSR+yGLNez6wxBnupD4z0p7VFcSAIVmEArB4PeOHa+
	 H4TI71JuwU+OeHFi9053RUDb3D7CBWLiObozFkTfVaCvePrWHxY3d4CtLs5jSXLDKv/n1
	 loE44VOj9vCyKgboepeqZO3UiLsncRmA0uJjh1g+/UsCtvkBMC4/i9e1M2/OWHsz1K3o+
	 5Lv3T5oHARDeT+onbg7JWzw93KBKxe2SG+GjyEcckhGlWa8M/7bbWHGhEFJqD8bNcIrKr
	 wIKa80VLniKw4FnlrBZ4c3mkp78OZ8YmZ874wVIQ9zetvW6i1ptDw7+SEONbksdbZ8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Si/Mdjj7";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFB8606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEFB8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Si/Mdjj7
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b1c2c31a6fso252123a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729701; x=1795334501; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=80dMFC0Ro/jAPdAujll83Boy4CMrv8kmaX2kTiPJvwU=;
        b=Si/Mdjj768sD2q668cuh3FitL/nAinn/bgSvLZLfFWYX0LpPiohHIGDiNgK5SUCv2s
         xeLw5794RXcgnMHhCp9xDvPmq/vLHuAQCIQfBAqiBZpAxJ62UaDA+KFyusJFpRvunoJq
         wsbQCfUKfi1MzsodkZ9wo/XTgxpCFuVehXzLJcv5Agxn4tbDelLymObZhXcrNdgOsKEU
         LPMC+IkNMD3ZPE1XWM72/Lg1eMbC1nAfx9VdZ81b7fRMYNYu1J9lTGnC8vRjQzRCnjd1
         LG6cfL95IKft22mmJBQLcDHyAFVRkVTHLbxeaqPNBX0xLpo+yln+zqYLjyWF5axUa047
         RGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729701; x=1795334501;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80dMFC0Ro/jAPdAujll83Boy4CMrv8kmaX2kTiPJvwU=;
        b=LHva4tZkRC4/ZBKEasoXrTGftry5jlt2fHEnXlZI5EduTf9lEaRaA3dhrvHGZWqslF
         tkgjpWLSx4hD3nnzhrtFor/UhqtSkIkB/8zYckhj8AhwfA9b5JA5//WtiTnpRjIc/9WG
         PrTCmDZwsXSOIpImlk6aweYcBwSCzvU7bHUhpmnmW3xzq4VdAvWyfVPaJvRMA8Y1LHsp
         AOtJYXB4POA/YR0GFnEQ/CGy5utbj/RXhvn6rIkdXRPH7eCZpjD5qHLtopiijFAqIpr7
         kXKWF9iPIXrByN9qkqZrX89V+ZEcbZyW/AyQkXMZhhhsSUcNxFKNgOnCkMCALPCAO8H7
         HkZQ==
X-Forwarded-Encrypted: i=1; AL+hErGlXH70PGMdlln76oa7zcAoEFyu4/zeX+9IqdIPgWbze7HfXuf+FYyZwtUqoKxCn12xZyl6ragceV8MqBA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A8fQFG4D5eQlroVGhX9cfihuPZL2tR53ks3pCVdBUvWwarIPy
	lJ+E37cIiLl2awckeAigYuRafmYdnN6OxHXnlHDmb2DjbyDqZs3/TDrn
X-Gm-Gg: AYBFou3Lrv+GdXP163fzz1aPDnrjKSK3AeCczkX9GbsiBxJ3+Tr+ubnVIX/51RmPjcm
	fNSLNKpefwAO3YPrCwrL2FZvvnz+Qan++oHR8QXUlGPsHXazPfILV5NfZphuk5ukHTbn9aF44Uk
	8yyiXluPeA+GrbMRbl2Zc9DhfrB6PZDZHMcvEoE1zOONN9ktCUyjCbD6ty2DVmygF9aM0SsUgp2
	qVer0Yqo7QjcRrFyrCdA2CUl1XVnYDHnuyrr1NfI4rpTyQf0ztKhYfWgOs3/ES3kxKebXqPPl9O
	ryFrpYUfnFiXojnqBQfNLekN0Z1SyQs/OhSVPNq+NnK9JYawC11jxKtPGYFNXp/vKtjPvdl680T
	Dj7RNIPk60RvDo/AZ45Ry+A2dkSTrSsjaMfaMfO017qen/nPHSmn/gSqou2y6rHj798piEj/TIY
	c4yXOP1Pgk6Ad5O675ob99ahgvSwn16HE+MFepbNmVcgGOVmlS2rgbvi3lqRPNCCqVrc1tV2iXJ
	1DWgfcqbZARq6pd/yttDxFajmOwZnlPiPaSwjmHTDlTqb7JCHPh/nfhjMgL1VVhRvXHlvZ2Ioo9
	N7GxvvRUxXhk8K8P29c73KmaLpntbyCHEh+U+yFtAnJDaky4i+BljPiWS9wwd0+FSBeCavL/wTN
	y+o3Kysk=
X-Received: by 2002:a17:90a:e7c2:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3b1b0608b39mr11786795a91.0.1794729701017;
        Sun, 15 Nov 2026 00:01:41 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3a21769sm6224118a91.4.2026.11.15.00.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:01:40 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Lukas Splavec <lukas.splavec@puresig.cz>
Cc: detlev.casanova@collabora.com, ezequiel@vanguardiasur.com.ar,
 mchehab@kernel.org, heiko@sntech.de, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] media: rkvdec: Use dma_map_resource() to map RCB SRAM buffers
In-Reply-To: <20261114094916.28744-1-lukas.splavec@puresig.cz>
References: <20261114094916.28744-1-lukas.splavec@puresig.cz>
Date: Sun, 15 Nov 2026 08:01:39 -0000
Message-ID: <179472969996.3843098.1159119154248532841@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Tested on an Orange Pi 5 (RK3588S), rkvdec from media next with this
patch, KASAN and lockdep on: all RCBs in SRAM now use IOVAs, no IOMMU
fault or splat, fluster HEVC and H.264 results unchanged.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com>
