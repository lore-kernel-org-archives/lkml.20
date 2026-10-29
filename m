Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281858;
	b=gJKDioYDxEyMQzZ8Atzu34BZsSHYEfIGau5gtX1WY7Ifm43fTWymyrwiQHCyTl0E90bj
	 rmjXdpjfH4Eiz7OPMwdxDfSWzUY6afdBYi2mcFnmsRfmnRLUWrMqFQnA7TcWvWyPWCogY
	 AHIGe9p7QubnRmAH+G2pAxIX373vxeyc3UCYy1VHpj0X8RLZPdNeu87Jq+rPgNuiKUmv+
	 7bn2XdvEm5MKW7ztfLvMMeVI056JYI19rAQAOBtpLZ2MdPveRown9dJ0vbpO6NIfUZIjt
	 op0DTqMjStxpxzRz98rvz0Jnd89wJEGRc9Nh38W+53GZkf3komzQFz4K4W5nt2XuloQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281858;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=tl/0tt4DBdnUlTF61vXRxhF+HFOKLRG/ZnDXYNQcxMU=;
	b=zTigMAaiIk1i02jJcZfVinmu43jHO3+paOLXT0G2wtm3gdwEFUEqsWmjuUNUgHemrhAZ
	 S+xss4ZzbnNbbqZk3c2zcXqKvyuA3w1gcNe15x+hcSOh0ElJINKm5/F2DYYF/Rs+zbzny
	 mspc+p3aqdrtoqQ4VrZfxkDhFT9aVGyDfjsbgCx5l+FJpCK1YmWQZd6zaZglCJlDjrfIn
	 OAS/JYAENL2m/mhcK9b2mgaReVQhym06+nvlr8+yBUIdEK34ALxu9rpcTn8D9EXjh7fbV
	 fqiVCocczFuFAMKO90uxXGY8DefhbYzi7ut0E5jmwLCZvFFttLUYhzLuXZ4Mw+/fS+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b="nPaKuxv/";
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B4B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1B4B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=nPaKuxv/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1793281848; bh=tl/0tt4DBdnUlTF61vXRxhF+HFOKLRG/ZnDXYNQcxMU=;
	h=From:Message-ID:From;
	b=nPaKuxv/tGVfzxOcF7CanXXMNFyXL/yODBN8CwF9xXMo12U5uyq8zPY3tuCcwhA3H
	 68e7M3EY6brLogSotsZTWQ9CwSlBMoMgXiTq2fBDSK/5FzM6g3KKCD6f9B1caw/dDE
	 AgOBY4+91DV3DQl6Ir6fVEwC4fq0QT9hPcitenrk=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id AB305C0923;
	Thu, 29 Oct 2026 14:50:48 +0100 (CET)
Date: Thu, 29 Oct 2026 14:50:47 +0100
From: Willy Tarreau <w@1wt.eu>
To: panyuhang@hdu.edu.cn
Cc: zack.rusin@broadcom.com, gregkh@linuxfoundation.org,
        bcm-kernel-feedback-list@broadcom.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vmwgfx: unpin BOs without revalidating placement
Message-ID: <auNPN50Nt51ih1Yt@1wt.eu>
References: <AD6AfwDkLPJWAKFimg*tgar*.1.1793261964318.Hmail.242270054@hdu.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AD6AfwDkLPJWAKFimg*tgar*.1.1793261964318.Hmail.242270054@hdu.edu.cn>

On Thu, Oct 29, 2026 at 04:19:24PM +0800, you wrote:
> 
> Unpinning a buffer object does not change its memory placement.
> Placement revalidation is unnecessary. Currently
> vmw_bo_pin_reserved() calls ttm_bo_validate() for both pin and unpin
> operations and treats any validation error as impossible with BUG_ON().
(...)

Please *stop* CCing security@k.o for public e-mails. We already have
enough noise to stay busy, no need to add public messages there!

Thanks,
Willy
