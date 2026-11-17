Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877078;
	b=oeemGeRxiuhlsZKqoqD6u7Efx0A2tyf1R3XUF9yZSx/9yE3WmqbceH1w8Dm5hzXNHepQ
	 KtMJb8VTi3Vab9DEJOIZmiaGnmWpOmjUdXoN5KbUrSfAS++NyMNPF+EK/8KzBJhYet7/o
	 q1WT3K1cC/ZWwiUBvNzYV0s2E5Gf4oD6J+xb51TebzSDFpwPVouwj03j+D/1bMn0GZGfk
	 ivVnxr6+EPCCmKhW+0iLPCN5q2lOXXuWTJI2S0cRDLsNS0tpoi5LBLxGlBfnq6jJ8QkG6
	 NlbcbD/3edims/XEgtEQkp5Q9bnbFtg9uWVfXZhi9mVKsOQFaEoMrga+vsoW/NddDjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877078;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KgDSpxzJb3bAALuMtGoPjTr7eQ9Jv9niChI7HXsF3Z4=;
	b=heIKjjviB3Gybwzx/2JNWYxM/uNvD500auXOfALDSaEIyXmpQOYtAmL9tUm0k2omzS+v
	 uLUyKPtGaIOZLwPOpijYRGk1oa8wOYdlW8wkOL0ZFhB1bBVJFvKuqiLrw7bdhR3E1j9vg
	 9AgzjA0I+BfPXLurknRDAVw1xdKbpxknS75bZwiWiKHtZFT8nyZoK1RtwdX/GzTejc45y
	 J30vVq7MPby754NUtoQlwT+Rls5k5r6zDIT8/ag4rnu2fxnm2zbaL9RXKfeRRxQd30qBC
	 fc76e0YGC6mfthnhz+va2ajZlm7qqvWqfwpSAKMmw0QNPt00tPmEyfwvXFsFJreI9KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=epJ76Q5N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEFA606A31C;
	Tue, 17 Nov 2026 00:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=epJ76Q5N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74971F000C4;
	Tue, 17 Nov 2026 00:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877078;
	bh=KgDSpxzJb3bAALuMtGoPjTr7eQ9Jv9niChI7HXsF3Z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=epJ76Q5NwE05ch2nHZjELnmbx2glge7NHXjaE2gHfeTw43Gp+kfzoNCgilb9C+DsC
	 eqaGWYfMSCv19UUGWTyP55mgIipVnYtbXVEr3jUx4W0csz5AF/xXx7cUgTQef0U6WD
	 Jw/VLhGoxb/1++54nSFdEZeDZ7kklgfhCvvIftnOdyuPuliWMKUap3zpJlTLJSdcTp
	 rQ5yQOOCziYFiJ0BM0lDSy5CRhF1amTipv4C6RkeqvXyw4VPeV0Yz8bpeeRJDJuJmg
	 OiyPiNZeDYB4Xj0+e6Qpy9qgIvdq5VUFjxtPDK6sjH9/PM/4PCibmRWS/jFERSsFuZ
	 2vwlQALqlYjxA==
Date: Tue, 17 Nov 2026 00:57:55 +0000
From: Yixun Lan <dlan@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: k3: use com260 8gb memory
 configuration
Message-ID: <20261117005755-GKD100890@kernel.org>
References: <20261115195112.32120-1-e@freeshell.de>
 <20261115195112.32120-2-e@freeshell.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261115195112.32120-2-e@freeshell.de>

Hi E Shattow,

On 11:50 Sun 15 Nov     , E Shattow wrote:
> The boot loader may override this configuration based on stored ID value
> in EEPROM TLV and if it does not then the smallest common sold
I think bootloader will detect memory size during DDR initiliazation phase,
and then update the DT configuration, I haven't checked vendor code, but
plan to implement this in mainline u-boot..

While the change itself looks good, to have always smallest valid default..

> configuration of 8gb is the most compatible option.
> 
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> index 054bfff7413a..c18680b963a4 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> @@ -14,7 +14,7 @@ / {
>  
>  	memory@100000000 {
>  		device_type = "memory";
> -		reg = <0x1 0x00000000 0x4 0x00000000>;
> +		reg = <0x1 0x00000000 0x2 0x00000000>;
>  	};
>  
>  	reg_5v_sys: regulator-5v-sys {
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)
