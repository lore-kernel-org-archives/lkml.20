Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679490;
	b=iqKZwTPKSDd6vA2ndk47NxrZvHWoN0+LDDN98vMdD7R65QM6Og7eANENFRfdmkc4fnU2
	 lziZx0JYJzHLE4RVtMjhBhUoEC1NPlmsqqLclTYrZf5otqVmrUMPP/RaaWILRfg4Wp+NE
	 yw1n7BoCj01HGgN/lISiVy5eloLl4YaeT+kBQ6X+K/Tqk9uZf6xGJohvrU7PhSc6P+qVH
	 vbGo4rlRmZlAbA5PAh1qZ3ZK0DTl2eKLK9PWPaOqALivM+3b1+JMU3II34ZAfAsXo2ZpG
	 pioBYdv2aScLJ+RyYa10n4A3PGD8NNaxClN1XioSbeIgeskfdmzfAU9OyI+ADtjO43A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679490;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=i5UScEbi5P+SKDxLk2/1WH1m35SDk+R8PVhmVEVHgPs=;
	b=CXJrknyoemHET6QLlntiXgxhsMCJlN42gL3t7tpP7jh4jx4A7CV6rfsM8mtpmINv/fHN
	 ZSaJp6oBwRR4qxrIW7zTgc9m4qYk8E2ZxgF0/1qJzT9yVDYi6HnyL40edqcUBKJqzH1rJ
	 t4TbElKtkDZ6EJk6Ii86OTXqnFs5Npx4UmOfJWhVyPWU0voa0U2He139WblCmi2z24J0H
	 3bfdoqwueA4MU7mPS7RXIABnuFi7iA/JNQKK8apWClKQDZ+/Clbtzk4hLXn+qp1sqe3qV
	 tVDzuTQ8wuUPDYssx7+guYIdJFncSGqEfg8s/IyZgjuR2/zANaT8h8TMWrSJTCcgODA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=a7t79Qzf;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78DA606A326;
	Tue,  3 Nov 2026 04:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D78DA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=a7t79Qzf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793679487;
	bh=i5UScEbi5P+SKDxLk2/1WH1m35SDk+R8PVhmVEVHgPs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=a7t79QzfSTdOmbUGBi5zuXRXLb9bnKCNXZ7ddcXCve5Iki/BJfETkutBAfN6dIsSa
	 6hWOY8+mbeiLrGyha8O5lIQ/p7UB+I0Ll4SsJPrg/ujXWKTRaiMCx6dk5CCCYfdKie
	 TDllu+3oC2+dHpqpaW5IYHSsrjguyDQBTv67x76CrDX576Gaa5lFfNlUUygdF3zoWF
	 SW2O2ZEUJSZBb14lGttfI5aBk3F8AnH39EyAwqmWdxvjwY2zhhJmgG/PgYI3aQQvgm
	 Mq+2XnwOg5SN4ix95gbCrxbwfRF44hJavRKXeW53i4kZASS28FOrji5FhIKvW28kFj
	 /HAhKA+WVXVsw==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D92A9648E3;
	Tue,  3 Nov 2026 12:18:06 +0800 (AWST)
Message-ID: <bc6e605a8c5bee59ad9bcbce5f4fe775c9c3324e.camel@codeconstruct.com.au>
Subject: Re: [PATCH] arm64: dts: aspeed: Enlarge AST2700 EVB kernel
 partition to 12 MiB
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cooper Huang <cooper_huang@aspeedtech.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>, Ryan Chen
 <ryan_chen@aspeedtech.com>, Billy Tsai	 <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Chin-Ting Kuo
	 <chin-ting_kuo@aspeedtech.com>
Date: Tue, 03 Nov 2026 14:48:06 +1030
In-Reply-To: <20261029-ast2700-evb-kernel-part-v1-1-e6f52742c575@aspeedtech.com>
References: 
	<20261029-ast2700-evb-kernel-part-v1-1-e6f52742c575@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Cooper,

On Thu, 2026-10-29 at 15:25 +0800, Cooper Huang wrote:
> From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
>=20
> The 128 MiB flash layout of the AST2700 EVB reserves 9 MiB for the
> kernel FIT image. A FIT image containing an LZMA-compressed kernel,
> the DTB and an initramfs is already close to that size, leaving little
> room for the kernel to grow.
>=20
> Grow the kernel partition to 12 MiB and take the 3 MiB from rofs,

Why 12MiB? Why only take 3MiB?

> which now starts at 0x1020000 and shrinks from 82.875 MiB to
> 79.875 MiB. rofs still ends at 0x6000000, so the u-boot, u-boot-env
> and rwfs partitions are unchanged.
>=20
> This is the same layout used by the OpenBMC images ASPEED provides
> for the EVB [1],
>=20

Why was what was sent upstream different to what you were doing
elsewhere in the software stack? It seems oddly incoherent.=20

>  so the rofs partition described by the device tree
> also matches where those images place the filesystem.
>=20
> Link: https://github.com/AspeedTech-BMC/openbmc/blob/438e761ed38644b77ba7=
04c984cb607649bf2724/meta-aspeed-sdk/meta-ast2700-sdk/conf/machine/ast2700-=
default.conf=C2=A0[1]
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Signed-off-by: Cooper Huang <cooper_huang@aspeedtech.com>
> ---
> Notes:
> - "Already close to that size": with mainline at c339f4010dea
> =C2=A0 (v7.3-17997), ASPEED's aspeed_g7_defconfig [2] and GCC 13.2, a FIT

A bit of a tangent, but GCC 13.2 is over 3 years old at this point.
Debian stable ships 14.2. Why such an old compiler?

> =C2=A0 image with the LZMA-compressed kernel, ast2700-evb.dtb and the
> =C2=A0 OpenBMC phosphor initramfs is about 8.99 MiB, less than 20 KiB

What are your measured sizes for the kernel vs the initramfs?

Is the initramfs content reasonable?

Andrew

> =C2=A0 below 9 MiB (the exact size varies by a few KiB between builds).
> - Upstream OpenBMC's AST2700 machines use the static-norootfs layout
> =C2=A0 (no rofs) and are unaffected; the rwfs offset does not change.
>=20
> [2] https://github.com/AspeedTech-BMC/linux/blob/76457d3afe2bd4022ca82dd9=
eb8fc48b84f0e9ab/arch/arm64/configs/aspeed_g7_defconfig
> ---
> =C2=A0arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-128.dtsi | 6 +++=
---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-128.dtsi =
b/arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-128.dtsi
> index b54915f06efd..f54d53077538 100644
> --- a/arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-128.dtsi
> +++ b/arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-128.dtsi
> @@ -16,12 +16,12 @@ u-boot-env@400000 {
> =C2=A0	};
> =C2=A0
> =C2=A0	kernel@420000 {
> -		reg =3D <0x420000 0x900000>; // 9MB
> +		reg =3D <0x420000 0xc00000>; // 12MB
> =C2=A0		label =3D "kernel";
> =C2=A0	};
> =C2=A0
> -	rofs@d20000 {
> -		reg =3D <0xd20000 0x52E0000>; // 82.875MB
> +	rofs@1020000 {
> +		reg =3D <0x1020000 0x4fe0000>; // 79.875MB
> =C2=A0		label =3D "rofs";
> =C2=A0	};
> =C2=A0
>=20
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20261029-ast2700-evb-kernel-part-63b3c998ea6e
>=20
> Best regards,
