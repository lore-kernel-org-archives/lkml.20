Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=135.181.139.185
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793806275;
	b=neJi5lXWJQWiDEbWanJdimQwbokLLNtQhTnJHaRpftCM4qSAGkxtfythW0HDZ/g70u0X
	 7p2m5EiFgArWVXuR0QscZhKc5n/iu/UxTLoWugLXwEaCSvyZTzMZBkt4AV1ho4dCuJ1Rn
	 CrVfZv+zVOz4ylTatvleQS6/0BVwS10jW39obqbeCz1/I/V2lotoNa4cjbwfTWi3WNpMO
	 8hZG1FaIRvZEDYfb0Lw8wNPlvnyKgbQsYAoHS2cL+txnTFNrOn2Sk01WlaWeQOQTi5USU
	 NHKIJ8Rc8EMMAZW6ubZDmZ/lD86mY4dJeoiC2I25ljT3gRIdehQdo1qg8WXkj1oWvYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806275;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:To:
	 Cc:References:Subject:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YcTu78fwRsZ423aZq3ydzdnaGJrAPYdEOB86A5oSNsY=;
	b=Ewwvm5w0WoaT3tHJ5Vr5zhCTSXUeKyeX1vz2kl5gLtUA2rU9ab+WAUHMhfwk6XAmXfFL
	 6CqfV4+G9RcZ005orhmtYUSf6tu3gVcj81mNew7chwqiQF68xfXL087Xo/RWI0pwbeKmp
	 DPdx+p03f5a3XsP85/RcYA4xDF/9rB45L+UnaJzlnx33D5tMjee57JtkY29Xc/3lF1dbA
	 x6X/fnk5njpUgS+k6/f7FjyBW14AT1n24ielbvwkfCQ9LzgDZFjJstkg5CG8yE6Zo73fz
	 vmij/GiOlpNbALiAv5Sj813uuGt/b4PLFcWF1NIfAlCP52L9Z502fe8yxKQlIwTIpjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=murena.io;
	spf=pass smtp.mailfrom=murena.io;
	dkim=pass header.d=murena.io header.i=@murena.io header.a=rsa-sha256 header.s=mail3 header.b=fvGqEt75;
	arc=pass header.oldest-pass=0 smtp.remote-ip=135.181.139.185
Received: from mail3.ecloud.global (mail3.ecloud.global [135.181.139.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFAE606A32E;
	Wed,  4 Nov 2026 15:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BFAE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=murena.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=murena.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=murena.io header.i=@murena.io header.a=rsa-sha256 header.s=mail3 header.b=fvGqEt75
Received: from authenticated-user (mail3.ecloud.global [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail3.ecloud.global (Postfix) with ESMTPSA id 9C79A892219;
	Wed, 04 Nov 2026 15:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io; s=mail3;
	t=1793806267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YcTu78fwRsZ423aZq3ydzdnaGJrAPYdEOB86A5oSNsY=;
	b=fvGqEt75s9iWkGdzW8PyLgckj9pdrMGkjGvFyZyahqRWPs9QHhig4DERi86GdJV1NnX5pN
	1bIxfn/i6EW0gwi6gU8zIFSI2giGzm7nR4pymGBrVjCMSU+xd6peZmpSehIcs1cUSgKb79
	lPnEOCSFnhHd1crPgsSQsiU2ACzrft8=
ARC-Seal: i=1; a=rsa-sha256; d=murena.io; s=mail3; cv=none; t=1793806267;
	b=vAJtK0uq7OD5cpcDMEr6T2zAIOODrXUui0Fba9wRf1JUKx81ri5QsE2SwcfvwRoZ+9S2aP
	T52/xJyP3aPAqP64AwRoNdwAGBivpgD4FFc49zKk9DRdfzr9n1Nf4tsm9/+FHZCzvADXBA
	2G57Kel3WG/PwQdzJKxbMLl9edo3df8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io;
	s=mail3; t=1793806267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YcTu78fwRsZ423aZq3ydzdnaGJrAPYdEOB86A5oSNsY=;
	b=BaLGS0dkI31diK5IGJGwMlfhbAoOq9EWfkPdIwLqh368idE9xeuc9QM4cpddJUSjURyl/f
	EZsxZfy7LPL/PgtehfcUMW/79cWCUUZ/3yD4Z2RHDYspbKvMKMPA9YnRrCXQegkWPDjuE3
	ZTb+f/Cw1JqFuKPrn0F0DzKV1aPzUYg=
ARC-Authentication-Results: i=1;
	mail3.ecloud.global;
	auth=pass smtp.mailfrom=maud_spierings@murena.io
Message-ID: <5f595068-671e-4823-95af-da1702354a16@murena.io>
Date: Wed, 4 Nov 2026 16:31:06 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
To: sandie.cao@deepcomputing.io
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dlan@kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org,
 spacemit@lists.linux.dev, troy.mitchell@linux.spacemit.com
References: <20261102060105.100645-1-sandie.cao@deepcomputing.io>
Subject: Re: [PATCH v3 1/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 add P1 PMIC regulator tree
Content-Language: en-US
From: Maud Spierings <maud_spierings@murena.io>
In-Reply-To: <20261102060105.100645-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sandie,

> Add the P1 PMIC's regulator topology tree for DeepComputing FML13V05 board
> 
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> ---
>  .../spacemit/k3-deepcomputing-fml13v05.dts    | 155 ++++++++++++++++++
>  1 file changed, 155 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> index b5d5112de358..804abc85602a 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> @@ -22,6 +22,161 @@ memory@100000000 {
>  		device_type = "memory";
>  		reg = <0x1 0x00000000 0x4 0x00000000>;
>  	};
> +
> +	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "AUX_VCC3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_aux_vcc5v: regulator-aux-vcc5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "AUX_VCC5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&i2c8 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c8_cfg>;
> +	status = "okay";
> +
> +	p1@41 {

I believe this should be pmic@41
If it needs a label it could be p1: pmic@41 but the node name should be 
more descriptive.

Kind regards,
Maud
