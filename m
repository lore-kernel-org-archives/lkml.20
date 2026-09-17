Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BF633A70E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789610577; cv=none; b=o/FALJry1RO9IeJlBC+Un2yS7FitK/yETUz8IIPQF1afI5j9EK7xUt7VmR0Rs/Gjp/l1o+033zEKC0obn5fZIGw6Jtm4QlkhmcH69PaVM0krwFW9Wqh8wGH8yoawru/CRDl9VeNwIdzOSKO0mwNLXNST/biPMKiMUq75wA3QIy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789610577; c=relaxed/simple;
	bh=b6wjZQ1RX/T/S/dEijbGBQbbX4WRTC8hJhLEfqq2hAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3iibWu2mTqHdpwp6xuzXt0B5nkd7YATeKZZ7KKCUCr5YoZpBd0VABgQqJHbs4UdKm1sVk9TjzG120vuvabLla4oT8xDylt0ydKdBpdU6PA49vxp58VKSvwzn9OGMLlngaELbtbU1+Uzk2Toc6gy4BWzIpT9OGEgXtKC6fTXDGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iatyy7Ia; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iatyy7Ia"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4cdc0d663so175664a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789610575; x=1790215375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yXMeRLzLYKk1dOekGjdx+ZqUH1z0s4dOYL9Yud176Xg=;
        b=iatyy7IagoJHp+93+mPMInbGpjmt78n0ou+hzbzuGb3mhO5m61sP2rrF1ZCt7M+7Uk
         nOGw33CScClXkTGIMc3026b7F8irTmQwFuxUP/lZ5gwnlwRS8MdMV/Rgk8y+0DYwP5uU
         nkI+llN4/qI4lWUbIvrZ7GRNqtXJtVZo+jKaNfNaGP1Rx2rfKWLwvbLpdTLkrSHdF5JF
         9I41wfFSc3tAt/PnCZpq0915am3gX8dtkxiK4WGG3jTZRc3ubpaOA2EQl1jL4u1o/cyF
         q/WUy2lFGrcA50eFuTi2FaibZr5lkYCEX9GFWehuhmD2XWDb12vG8HjMfL1VnuKTOPcD
         hHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789610575; x=1790215375;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yXMeRLzLYKk1dOekGjdx+ZqUH1z0s4dOYL9Yud176Xg=;
        b=dFW1BJKAwTscdT3Fw1wGL1Vib1dXkHQFyQMf4B/oQsAKyJtOhf+hA06LodnMM+pM5j
         HEJgq3XfyW6E9Hcd09HXA3yIgdE/ixHzBU105zpp4hJbskXntzn3k+aLr6KJcwNVJaau
         sQfIyvGJ34uBxfW3QA3UU/Qn/sD14WiQ/2c2Y/HB6zhd7HKCiUpKm7WZ9gIm0dHoWbHA
         iCwZIzzrd/FTpf71yYL7fK+fidG1s30fGeUG1vHH8wTr4mID0pNMGMc37iQPvrTf8lV5
         pLJRJqWC2q+2HqLpG8PZ4/8P1dyKXOLWDJLeXjoBzpv/GU5oI4WQ33FfSCSbArBXnUEv
         aNZA==
X-Forwarded-Encrypted: i=1; AKwUvBwRFdfUBuICtcLarSO03Z10Ksryg/ZrTz14US4nrDiUbXt+d6rOywvs0pep/mzPVobd6jUg/hqIId5jEDM=@vger.kernel.org
X-Gm-Message-State: AFuF++m8xYIPc1Xf3FAHSm3BPvK7xsIi+aqJ1uzlXceaSVWyuA2eJTNE
	7Mdl1zZ/pXY1e9fOEF6sITUhcFFd2awm6C+nj75B5nBIdCNIex08tHsF
X-Gm-Gg: AYBFou1IUzs+mJpxmCAfpVxSBg9kpdUxJaeMJ2L7YC6t2KNVoEpQkmBNEQcN+540Ekw
	2rDV4cO6zmanlkGf6P0waBPs45jLQ3IarRPOadiWc1GZuXDmvHPtleJJ07CuCrDgmI1QAVkjHzC
	s+GDc/kPJBUtRMbCR0oyJ4mZ3+x35LVX28lAncWxl+YAWSbFiZKPWFF/R559Y0FkYlSMT5hM0lr
	9ycZoRyFHEjnZj5HxR8xYxnqMDygE+KYVwEM2hmfC9h1U1X56jbp/ou9bQPKadX6SOSj6yNinUy
	eiPtq09FDXfpJnRxwKNAAt5bJmSnCgSoRRbRv+qSFqxKhAkHEdeoWk6q8hVCDfORaHO11g/NLx6
	TxnFeqx4GarsgyzG8yJdlUFKiuKvebsZ2Y/ZJqlszirLsG8XApLilGpFO2yUJm1vX435Li8AiEL
	Sy6D/QWg9qjyuJRpMEfMg25tW4N3UMdix1tW6jw2MfTekFbX32PHYsYVE9GpX4mwjZx+xpAalar
	1hjCwkY
X-Received: by 2002:a17:90b:1641:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39e1e4d99d4mr10807662a91.18.1789610574914;
        Wed, 16 Sep 2026 19:02:54 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35dab2e9sm2345861a91.1.2026.09.16.19.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:02:54 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:02:10 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrei Lalaev <andrey.lalaev@gmail.com>, 
	Samuel Holland <samuel.holland@sifive.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: sg2000-milkv-duo-s: reserve memory
 for RTOS
Message-ID: <aqtKAuoVSCxcts52@inochi.infowork>
References: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
 <6e4b5c98-7d48-4629-a6a0-4d930327f9a0@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e4b5c98-7d48-4629-a6a0-4d930327f9a0@sifive.com>

On Wed, Sep 16, 2026 at 12:10:23PM -0500, Samuel Holland wrote:
> Hi Andrei,
> 
> On 2026-09-16 11:06 AM, Andrei Lalaev wrote:
> > The FSBL loads the coprocessor firmware into the last 2 MB of RAM.
> > Reserve this region to prevent Linux from using it.
> 
> If the FSBL wants to reserve some RAM, it should modify the devicetree at
> runtime to add that reservation. Adding the reservation here creates an
> unnecessary ABI surface between the FSBL and all consumers of the devicetree.
> 
> Regards,
> Samuel
> 

This is fair, and the fact is that the current fsbl can disable
coprocessor in its configuration. So I will not take this patch
and maybe do a cleanup for existed devicetree if I have enough
time for it.

Regards,
Inohci

> > Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> > index 78a257839f6f..693c9fd7b771 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> > +++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> > @@ -22,6 +22,17 @@ chosen {
> >  		stdout-path = "serial0:115200n8";
> >  	};
> >  
> > +	reserved-memory {
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges;
> > +
> > +		coprocessor_rtos: region@9fe00000 {
> > +			reg = <0x9fe00000 0x200000>;
> > +			no-map;
> > +		};
> > +	};
> > +
> >  	wifi_pwrseq: wifi-pwrseq {
> >  		compatible = "mmc-pwrseq-simple";
> >  		reset-gpios = <&porta 15 GPIO_ACTIVE_LOW>;
> > 
> > ---
> > base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
> > change-id: 20260916-milkv-duo-s-rtos-memory-7a94933e35bd
> > 
> > Best regards,
> > --  
> > Andrei Lalaev <andrey.lalaev@gmail.com>
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
