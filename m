Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794180275;
	b=ge/ZC4pwFUNSM+8ZhppAwXfr74VCovEft135I7vsvsa1APxakg9ISNidJ1il5nPSGx8o
	 ntep0Ru5rQmeYVElI7iRf/mrZcpihdi7wKvnoJxSjLWras+FZz6c+0jFLFZbVEP1JdNW1
	 Bdh0LX10wQPRPO5R5w1++lNwSFv/mUC3pjcrSp+5OJ4wrqghN8qPY661ofsC0MOqgDiya
	 tG2EWQqGEP+DeFvo8HBvs5GKAV7rG+5fjQ+QwZ2nOjOTrRtM4gpBrjcMydWZttQAX/GBH
	 +HfyNK5D3Q2PZQyRn1Gcv37uQ62qR7yUAHhB5L7qIdCF+8fy33SMoLVJPMQPCA2pTQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794180275;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ES2fe2OeeWN8lXmtNe7OrgYovNQ/GK0YNS0MK0hH5CY=;
	b=qO6TQslK7k3onoWngLlG22pIFW98LJX7+WiyE37iw0T1mf+qRBIDrw2fZQpLxec5W1am
	 PUn7LXuufsX3HRGvZmiNjSLEvpC52yGI8qQS9VQd++WYqyHLoagVqAbXZL8H1Mkovd9RU
	 iEspilN0CTokS/3MuTK2bsF1/Mt0VKAsQ2FO7HWDG5eP0mrchKUB2+NQwdNxhqhEO7v62
	 7uaFW6F1+L89G8ClbL1ZxNRctRGOTT1d4RYtv+pICJgULP526WPVW+hJtx88RrRDz2P2J
	 nIIfVgo/vbSlqIo1orQwIxvsi27L/P5rg1RI0JBUw1tqRKj6gT90jWR3qHbVkXGHiRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fGcDhCMH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0520F606A31C;
	Sun,  8 Nov 2026 23:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fGcDhCMH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F44A1F0089F;
	Sun,  8 Nov 2026 23:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794180274;
	bh=ES2fe2OeeWN8lXmtNe7OrgYovNQ/GK0YNS0MK0hH5CY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fGcDhCMH/a85cDlsr3pElVB/dGeefSIpWRLTFB+Ci99m6t59r+FCUnzgL6ONW3NvS
	 /Jsbg/8bt4bFtGcGL1untNKBH/r9rBdOCX7TdPJiwh/0e7IGjTUJfmzymTiPHwhEje
	 8HmYGLH3gsDwAJSWt8OjmdIliUzzU25x2KYlfY5MNToxUtWZnRPFzASI7XwV3yqd5U
	 o5xSGVLxbHjUrMZG/NQE1qGto0QdPq0c12DMvRL/DRiKUoDBvkJHRrTkli7EFV/HVJ
	 MthORDnmiY9Q9W7ow6umvXR0CS/gW8crxxH2te7LZSI6qff3FZk3wqCtkAxlWRTRtJ
	 rE2E0F1Wpc0NQ==
Date: Sun, 8 Nov 2026 23:24:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Owen O'Hehir <oo.hehir@gmail.com>
Cc: e@freeshell.de, kernel@esmil.dk, conor.dooley@microchip.com,
	robh@kernel.org, krzk+dt@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status
 power LED on
Message-ID: <20261108-florist-smartness-eeaaf38d5d1a@spud>
References: <20261106184055.3891621-1-oo.hehir@gmail.com>
 <179399127414.1902073.729566010968054971.b4-ty@microchip.com>
 <181fdcd8-80ff-4486-ab16-9cbce16b0a29@freeshell.de>
 <20261106-tumble-hurt-d1a0be3fddae@spud>
 <CALp3LZ5Vwhx-CqKz7Jr+VE+e0S1EyNO_-OA-uC0h_dz0VF0r_g@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AVtvTnoaGFJXJKwI"
Content-Disposition: inline
In-Reply-To: <CALp3LZ5Vwhx-CqKz7Jr+VE+e0S1EyNO_-OA-uC0h_dz0VF0r_g@mail.gmail.com>

--AVtvTnoaGFJXJKwI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 08, 2026 at 09:55:07PM +0000, Owen O'Hehir wrote:
> Hi Conor,
>=20
> You may have missed my email on Friday at 21:12.
>=20
> I think E has a point. There is a separate red LED on the board that
> shows power. My confusion came from the net that drives this green LED,
> which is labelled STS_PWR. This green LED has no silkscreen label and the
> schematic is ambiguous on this particular LED.
>=20
> It is probably better to drop this patch. Apologies again.

Okay, no worries.

--AVtvTnoaGFJXJKwI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavEErQAKCRB4tDGHoIJi
0syNAQD9ambPIxy/jezDHx7UY3KpaN3HqLlA2khDM59kkcX4KQEA4IuuqDTsxm7n
gsTdgRWg2MrqzasI1NpptgGPIQu4Rwk=
=LdK7
-----END PGP SIGNATURE-----

--AVtvTnoaGFJXJKwI--
