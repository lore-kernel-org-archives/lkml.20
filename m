Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794762;
	b=CwH9ToO74VRxvGQqQDOu13in15vguRdXr4dzFHWx/kt7sDGap1a5cyqEfifXQRDquDW0
	 PjYRhsGXPSF1nDhptE1ojfZ9kXnIZIV4+YV6DdmRzmoyZX+Q6ru6bW1HvSgKELazmN86g
	 K7Q7CJ6GLfGHtMwWCOi9chS7Nr5tST5Fz3dOpdp/ryLMzveUpSaY0dHkffeY5scOeWcaJ
	 JYNKa/NvHS3XtuT9z5mllgZFPETqOUQyQvyTpImpWQvDcxAYOTG2OUBQcPu5nv8xqkZ3o
	 EFwYOnqsshSOeEGUTTjNhCoWoaosaweS/W8Kvlfhhq+yLaykCUxfmPqDkgkzT+ji63A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794762;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ldwSzi/rtM4rVlpRqThCmsYc8DAQrxnXAvnD5Uo3lnA=;
	b=sIdY4Z4YXMv8ZHl+crZNyk3fH51WLTYSz9F2BpKtR/A0NMLzyFKQiaaU+eAEGBAI6SWY
	 SGyj5+/XlcAQvUw/DllpeayGDWgKKE/H3HcREW1zXd74JyAKo74G8k3EUoAsWnXSRuLfn
	 v67qkznVE+2XK9kIZsUWxjsfuvXwbBeH7wnxXYDDNzM7ZveQoqMM+3cQEgyqKUhE0tznJ
	 txCs6YZcErExdsG+6JI0G884ohL1mBYFMdlrQrLmepf3vdF5OBRfH8aON87DXftqfGK76
	 zd+C/g/6LUq2qqGwuUWkpzNW8kDgGExP6ga9Dw6K9f5JLqGE3XtFSRGFr92N+SoPETQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=kSjCLcs6;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A515606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A515606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=kSjCLcs6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ldwSzi/rtM4rVlpRqThCmsYc8DAQrxnXAvnD5Uo3lnA=; b=kSjCLcs6wZfgV0J8oJPJF5iZ+3
	0P/BdDrUVxopE3uksWX3TVoNyQERQSWYQpyi4S97lHToo6Rk8OU5H7uhFcXUN2JUMdmhXRYo3sB6c
	unlxwnDPw6lWZNr/XpqqT8OM1+g+K7s68DG3InLTrlrYcgSHgXVYdzUnrAr+If9pMVQXU3yBrfDn6
	4iizVAxSAFQ11L3WSl3/NhQOkTDllHuCKgVQtrtaL+3iosjpFv34R1hUGFVpbQtGkgR1KDW25U1CU
	M00FIvlsNG4Kdl0hkiypu0+pSYK/1bmZxRJChBnl3Y8rHvUgJFWVQgd1bs6qeWrLwcOZElLgQ6Wsj
	vEvG/Iyg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Russell King <linux@armlinux.org.uk>,
	Johan Jonker <jbx6244@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ARM: rockchip: smp: enable secondary rk3066a/rk3188 CPUs
Date: Wed,  4 Nov 2026 13:19:04 +0100
Message-ID: <179379472868.648452.16899951038766297238.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261017-cpu-v3-1-25d8f4b06362@gmail.com>
References: <20261017-cpu-v3-1-25d8f4b06362@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 17 Oct 2026 15:27:09 +0200, Johan Jonker wrote:
> Early Rockchip SoCs like rk3066a and rk3188 had boot loaders
> that remapped the boot ROM and the internal memory. Currently
> U-boot makes use of a common board file without remapping
> resulting in the secondary CPUs power up hanging in a wait loop.
> 
> Make the various boot loader methods work by:
> 
> [...]

Applied, thanks!

[1/1] ARM: rockchip: smp: enable secondary rk3066a/rk3188 CPUs
      commit: 4e0ee307117af04d6ef7e36cf0b36ff7252e016a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
