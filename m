Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252449;
	b=NVkY8mGYu/lIizfjiwgcY0SjZAwKYte1bzpcR8AV5CJ4iV+a8C2yKE4NqkBgtuy+KJQC
	 /rl6U8HCooojHL/B2N5zceFOKHopxr7GLTOwltfConBq2VofC8tgfOP5rxV9UB75n7NdY
	 YI3tSYPrFW7cH6DjSscg59EDoAlLC1rvX182cXvhTPwzvkzYtMc0BU29C7y+GfdXi+BtB
	 8IMoZjKcz5mEwVuRA8nkFHiUBXzcNiEShvVmlistU+WmxDyzYjwx70scVr0GuQXN8GlRf
	 igHE7cg5cyaQskc6Oc7rFPQ0K7gS2ShJ762WhI2MIvDIAlmuu2qVXdljFoM5RD3pF1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252449;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=bC8+Xr/oJf/T5cIuTvXutc2g7ns43TmGmQIa8da+Epo=;
	b=jIkkhIMcJtLZJnOsfJbsDZVquUW3pejaKq+AXkiSiNeo9m5/XCuiQDSSpmvpSJJKVyUB
	 rF6J/HYu0SxiaIXng20ICfmo1+Z7BYcUnte6JHKdMkHl1mRVnTCgc/a8S6HJCVxX/4Z8K
	 Mxh2d2vcYQrKp9saTwlD3DlO1KTF/GS4MJlrE+H8QZN+/Z0wuaLXe1Dh9QFLH84lObgCV
	 z0ai9S6dVx3W3cZaW/B6nhmlL72DQmdnCDTeRnzOa0lXwxkyz09oyej60bu9vfxYt1KY/
	 vXskaPmczkdCI2J6ImfBHsF+A4smyFAVLnYrh7tSQzuwietdY5/2TVEO5+3qEbjx6Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=VRbDEQiJ;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAFD606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBAFD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=VRbDEQiJ
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3BFAA10BD4C;
	Thu, 29 Oct 2026 06:40:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793252446;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=bC8+Xr/oJf/T5cIuTvXutc2g7ns43TmGmQIa8da+Epo=;
	b=VRbDEQiJcvIdFsAcMI+tCeU3ljrr5uXe9ansYnw14gaUjmrjAOgD69vS6eVZPtvuvgnM0q
	BxtyYx+EXZfYEc5zDvLMGY+XQHcK8sv80UC3sQxMD/U3FeUtwIV3sYOzbbdIiewpbQtkB5
	ISbYxGZ0L7IHa5ZeIfeSjQaoWwU2NA+JMjUSHtJ/VPeDEobg73rMKu5sFVBPwjdLzRwcBW
	0CbCIqpcrlQXvhWq6hEl2NBF4cKN0POx8q8HYDhaCY16IF9dn6YH9jJUrftE551BZmSXT5
	IVOaJRjba79PW4i2nR3n/m4atXjnRsFJlEdV63VASYb9WuzX+cY7FR7FZMs8Fw==
Message-ID: <5c3ab7fc-2b99-4f8c-b625-1402d1f67067@nabladev.com>
Date: Thu, 29 Oct 2026 02:06:50 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: Describe locking support for MX25L51245G
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Maarten Zanders <maarten@zanders.be>,
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261024001658.222147-1-marex@nabladev.com>
 <8ee5b312-80bc-4584-ac35-cc76c2812c5d@nabladev.com>
 <20261028081534.945416-1-linchengming884@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261028081534.945416-1-linchengming884@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/28/26 9:15 AM, Cheng Ming Lin wrote:

Hello Cheng Ming,

> On 10/24/26 2:18 AM, Marek Vasut wrote:
>> Cheng Ming , can you (or someone from Macronix) please have a look at
>> this patch and confirm that it is OK ?
> 
> I checked the patch against the MX25L51245G datasheet. RDCR (0x15),
> CR bit 3 as TB, the TB bit being OTP, and the 4-BP locking scheme all
> match the datasheet, so the description is correct from our side.
> 
> One concern, in line with the sashiko-bot comment: since locking is
> an optional feature, I think failing to read CR should not fail the
> probe. Controllers with a restricted opcode set (e.g. spi-intel) will
> return -EOPNOTSUPP for 0x15, and this part probes fine on them today
> with macronix_qpp4b_fixups. Rather than special-casing -EOPNOTSUPP,
> how about just leaving locking disabled on any CR read error, e.g.:
> 
> 	/*
> 	 * Locking is optional. If CR cannot be read (e.g. the controller
> 	 * does not support RDCR), leave locking disabled instead of
> 	 * failing the probe.
> 	 */
> 	if (mx25l51245_read_cr(nor, nor->bouncebuf))
> 		return 0;

I can add an explicit check, if (ret == -EOPNOTSUPP) return 0; , that is 
probably better than blanked ignore of all errors ?

> Michael, a related question for you. Maarten posted a series last
> year to make the RDCR opcode configurable in the core and use 0x15
> for Macronix:
> 
> https://lore.kernel.org/linux-mtd/20250922155635.749975-1-maarten@zanders.be/
> 
> It stalled because setting 0x15 for all Macronix parts is wrong (e.g.
> MX25L12805D has no RDCR), and because there was no user of RDCR at the
> time. This patch is now such a user.
> 
> I have gone through the flashes currently in the Macronix ID table
> and checked which ones do not have a CR / do not support RDCR. If it
> helps, I can add this information per flash entry, so that 0x15 is
> only used for the parts that actually support it. For IDs that are
> shared by several parts, RDCR would only be enabled if all of them
> support it. That should address the concern on Maarten's series, and
> this patch could then simply use spi_nor_read_cr() instead of
> implementing its own RDCR helper in macronix.c.
> 
> Would that be an acceptable direction?

I'll wait for input from Michael .

Thank you for your help !

-- 
Best regards,
Marek Vasut
