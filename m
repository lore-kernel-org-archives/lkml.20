Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219225;
	b=YjiYudNe55rBaNvd/HPjixkaWW9LnVnqEn+sIld1+W9fzriA8rFV3H8VjQEVGzsNeCXY
	 K5oDa72NWMd7VhHrtqLLANX85x3An0DRgfppmi07z7QkRpDzDeQcUgDLrQZWK0mTO26sJ
	 bM7MqmchV+fhnr3gKUqGrrwNQgOSn+d3eTp7uagdopfzjbxZllmgh0R3T+jXClJwmtf5d
	 NzlfkxVmJf9u7Cp26umyOvBD7G3wzSyIuKmLpAFYR5Li/ypiObg1hxFzGKPXVriVLSV5W
	 Ury4l8LgdMbUyTUxHSBhRd2ruqNYwH+4zkeOIsQlNGZ6jg8uS6TLFsvPsE+Gj38BmCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219225;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=4cWcD/bzjuW1+x/I/VRjXTyV5V9MtoyJBu7/LrrJqG8=;
	b=ZY7p67/rZVIblotgQMGJJLfTP42woh3zmfcZIAkZDGlnkkzyR+o8Tn/mN737QvOa1tIA
	 WyjT25hlkrbU389fnHOTvLR4ai9SQm6IXoUan6tntpzausOSieq7Ab1JQV6E0pSHmxz3a
	 1ob1NUvFCDwO/T1jLGEt01uUvKtaEAqYfUXNjFIz27D1g/tO0wl3VWlzREYH2sjqZ5tZB
	 DDwRlENif5/0qf5xi0cJu24FBarrhNTz2OrU8k40KBSB9+V5qk/IuPViDR15L/rOgf1vs
	 XBMvKE0Rz+v57gWPcH5ys4+xnLDNOGyfhJPJfgrY4RRl2FkVGj86cBk7A7E4PCUDMTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dDDKU9D/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1A6606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dDDKU9D/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CDD1F0089F;
	Mon,  9 Nov 2026 10:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794219224;
	bh=4cWcD/bzjuW1+x/I/VRjXTyV5V9MtoyJBu7/LrrJqG8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=dDDKU9D/nbWI947P/bqB5TRveB13WIcUMrx4AadpGAkSwI0GFbW14VGyiZS4uv6rA
	 KzKRBVbQ5xQHo4/+PKwOkCSwquxGwMEHIi1vpoQySTsu5iolONOgG2szMYlzITqfou
	 ziGzvfsqEdQ4yqkzrRjC/JrqQ1e0fXFITCG0JX4BiSHNg8eql6+gG44X2OaY7Z2E9c
	 iRk5l2/tLeq93iV+5xnpgfjLK/T3MpP3me724MKMPKXslzCdYCF0hHXQpk3jmyEzfO
	 d02a0eGdESWAtKs7tGHWv/ew1dkyKo8wyEJ0ZUQNfmVfWvaQc3HEiABnuD5334cH4L
	 HuKOTKOw8Kv+w==
From: Thomas Gleixner <tglx@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>, Anup Patel
 <anup@brainfault.org>, Radu Rendec <radu@rendec.net>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH] irqchip/riscv-aplic: Process pending affinity changes
 on EOI
In-Reply-To: <20261104-aplic-affinity-fix-v1-1-e538cd76e563@linux.dev>
References: <20261104-aplic-affinity-fix-v1-1-e538cd76e563@linux.dev>
Date: Mon, 09 Nov 2026 11:13:41 +0100
Message-ID: <87pkweuxbe.ffs@fw13>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Nov 04 2026 at 14:21, Troy Mitchell wrote:
> IMSIC rejects an affinity change with -EBUSY while a previous vector
> move is still in flight, and the IRQ core then records the new mask as
> pending. The change is meant to be applied by irq_move_irq() in the
> IMSIC irq_ack callback, but APLIC MSI interrupts are handled by
> handle_fasteoi_irq(), which does not call irq_ack.

Which is a bug when the interrupt is edge type.

Edge type interrupts are fire and forget from the device point of
view. So you want handle_edge_irq() for them, which issues the ack()
_before_ the handler is invoked. Otherwise you can lose interrupts.

Thanks,

        tglx
