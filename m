Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5E34E4C4C;
	Tue, 22 Sep 2026 07:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062155; cv=none; b=mo1n+910vHUCGpXzJGjw0LY6zOd1kHuMGX+4IEy1ZxQwc3Q4/1VZOpj9gqqXCyK6haI32cfTZ/baqbtqMcTAjyGKdwHlV5NL4Dny+lIvnocjs7lbFe3UQnMlvU3pAbGT8JEKWFvQ4QXEmEe8mDhzuy6OnoO5pEfsMTBzVnnXIrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062155; c=relaxed/simple;
	bh=PqIM2Qviukhcl3o+EC3IQOTxcs3TiUTloXus2jpKlWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yc9jXjrBDXKZR8Rom7uK8iqSuwxrQRZulL/nBe/3gF8nGnptmZri4kFCVJNEIU9bfVFO8fo5ovKeBSf9DxAOV0lahYMsL/I6uJnDnJCq0xYohP650MArmlxVkxc3ZONss43tySAO9b//k6QHQSpvJ6BO5IsmEMShzRGf+v82Rqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lj4h3NN4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lj4h3NN4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90ADA1F000FF;
	Tue, 22 Sep 2026 07:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790062154;
	bh=mrmWGHtOctOdZhqNCNIpUiwnnfhpa2OZaFb59cUmK9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lj4h3NN4HFuNhjBGJO0IUmHXJZIe5Dwhvi97k38gWPKQSn/ezGBj34b/irhN3gLyM
	 R+MVwWQbTuaDMbfD/9Tv0V4fXth90C054y8BTYzdhlR7/RTx+MAVweAMY2SFULTfU5
	 vOaNN1ca3ug9IQPXoQF2R3R5BDZhS6IjaildgQKbhJmJRH8piTcYDKcvFd56o63bt0
	 Fd33nMEWjwknaW/qe5bHXq1hJvAdooBxTzs/LeZsbNI/LKuywyQrV9o4gTe7V3hveB
	 29EJmCcsssT9aD+DDYYFyx2RQx3LBe3r5BaobDEo4pShlkyrGVMOXogtDkgeS1OW3A
	 w8AOLNMJCLE3g==
Date: Tue, 22 Sep 2026 07:29:10 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for
 OrangePi
Message-ID: <20260922072910-GKB353745@kernel.org>
References: <20260921124206-GKI297024@kernel.org>
 <20260922065001.1888961-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922065001.1888961-1-amadeus@jmu.edu.cn>

Hi Chukun,

On 14:50 Tue 22 Sep     , Chukun Pan wrote:
> Hi,
> 
> > Could you point me where the u-boot patching the MAC address?
> > I'm not fully aware of this problem..
> 
> This is handled by U-Boot's fdt_fixup_ethernet() function:
> https://github.com/u-boot/u-boot/blob/main/boot/fdt_support.c#L639
> 
> do_bootm_linux()
>         |
> boot_prep_linux()
>         |
> image_setup_linux()
>         |
> image_setup_libfdt()
>         |
> fdt_fixup_ethernet()
> 
So checked the code, it's not a direct problem of /alias, but due to the
env variable provided to override the mac address, see

https://github.com/u-boot/u-boot/blob/main/boot/fdt_support.c#L698
	tmp = env_get(mac);
	if (!tmp)
		continue;

In this case, I don't think it's necessary to drop the ethernet alias,
I mean it's totally fine if there is uboot ethaddr env and it wins

-- 
Yixun Lan (dlan)
