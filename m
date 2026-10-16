Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906E5484888
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154031; cv=none; b=VisFFizbnots+EjgnDX9IYJm2vT8tJr4lkW9J4KjwfWenFQDeaQG8Nf42TvF9hjI44Seq/7smtAutK8+/XvfCQW2IUfC2q+dOa8HfQ6UNCuRA/5jTYocLHj1Wrg1HeMlSVakmz4e1wp1BUGf8vVaCR1BNS9TTqXOg6o+fv9uG0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154031; c=relaxed/simple;
	bh=JfDefijwbtezDgijQgyKJbzKl0+gWmC5y7+nqbaenDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RoEj3tCsBm5Y7TRKvi/f1qHH/tFvzCMN0tLiT6uKvEutptRuOMEZaXtPYdQ9JcD07U3QJtme+PToN54qDT1dPw3QcuIGqU04mNEXFsLFlj514WnSUSu12T64XHBMYd9L+OLzhrEEff6nUERiKZMiyScv3+j28FDjhHnK4/LEp44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=lHNW62Ew; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="lHNW62Ew"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso1843989a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792154028; x=1792758828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KjxNdKF35KA5nRKq/qBO1VDFTjnQTP1XeouQ0eeALwY=;
        b=lHNW62Ewd0eGVls3qGF7+sNuukjdC5PFmAbaFCo79fpbHt/wV4IyIcucNHrw3HbS1u
         O5WUNhtDzh4Xa6iPg5tzdFM75OfRw2kFjY5nyD+0uzvVKQNlKuT/4SIKIP1lWilG6K1I
         y/JjxGJZxyoFVkhX4dlPvfd6+cEDt/Dvjt2b8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154028; x=1792758828;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KjxNdKF35KA5nRKq/qBO1VDFTjnQTP1XeouQ0eeALwY=;
        b=o9V0wYwkCIwsYwOUdWUXYq55zJgZOhIm/RnWGgUTkSgsB9uL5SCe5HhjEb8w0xyNbq
         c1adGnIGhc13FACLf4AT61joW9yN0sdXhBvMc43SbBKNR99cM7P+UwuTcMM5e7/0zkBx
         VqA8qV7/kfQML7+8mK4YUWcVxpAzBCXsky/U79OyHR1eKd0JdYeDX9fao8MPnBjT0qdH
         LfMvqqjGPQgUMix7rolcsv+lk+Z6PNlS7+FeuTlVhDbqhPMbjUjjYyfphJY3iqpAViT5
         bW3Cpxn0epmw+odyKc4pr7DqJX3kbH5Bmbqb5YthEURRBNaFBnAECnBddKY+7WYPSx3L
         OQsQ==
X-Gm-Message-State: AFq9FYLtpQsQ0d/LbkKHRdCZklRm0wKR97f7m0yZUpptYzrGU70/F2NV
	R5H6gmyFhflZgOdMC7MJehKd2NFMEoe8yn8uW82cteiZH0N6g2O71kAHRu1PK3r2PPY=
X-Gm-Gg: AYBFou1qOxI3lKdmpg2/B2XmQIQu26Q40JnB7zATQhkAhgqp5GyrRRs6cOUyYCf3iQk
	r/7b0+dEqlU5kQifaGKR0/RxPL6VSD1cvb++94zg5nUWDtcZO47pC0HoYZBsY2kxA7l9hCBiSxO
	pxNNxdB2/6HLeh9emlpS5ASSGXj00pv0woxYVqrKoOO1FEIwkhCIFBddjNSJjpBOKgX6iC1Tm59
	oihyLKG6BvtOutQGfcs3V0olGSy1sjb61eM7V2zsp4HXPMzDXHVti0EFTe8RzZtarTmFtEqntjr
	tGhn7E/eXvZsQ7RQdhFeAjtqDn7+QD70HNdITrdbcPs4uGLqsUIBGntmNn2/RGWZGiPa+jM2U7p
	1L89+3Vu4Vr3C9EmuG16RX7Ydh+SuMAw6CRs3dhox1QdqZm3aIqib887q8kW+bs7gFHceua1bgK
	ydJHPohMq8xJdLeSH5yZZGI0ZkgGXhomxHaOnFBg1fnH2MjtRsc8R/S/nDVAWLfxqAhH5cqoB0b
	CJQl/TUaVRCqOw0C60JA9c13BeBNt7p
X-Received: by 2002:a17:907:2d11:b0:c29:519b:3aee with SMTP id a640c23a62f3a-c402349d091mr280091066b.33.1792154027651;
        Fri, 16 Oct 2026 05:33:47 -0700 (PDT)
Received: from carbon.k.g (87-243-94-255.ip.btc-net.bg. [87.243.94.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ca52esm69793266b.38.2026.10.16.05.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:33:47 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:33:46 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	arnemaximilian.richter@draeger.com, martynas.grybauskas@draeger.com
Subject: Re: [PATCH v11 3/3] arm: dts: altera: add Draeger M48 CPU Module
Message-ID: <20261016123346.GC15187@carbon.k.g>
References: <20261015145804.3632839-1-petko.manolov@konsulko.com>
 <20261015145804.3632839-4-petko.manolov@konsulko.com>
 <62afc804-8a9f-42c0-93a5-8b0b7f3b84f0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62afc804-8a9f-42c0-93a5-8b0b7f3b84f0@kernel.org>

On 26-10-16 06:08:53, Dinh Nguyen wrote:
> 
> On 10/15/26 09:58, Petko Manolov wrote:
> > M48 is a heterogeneous board made by Draeger that is based on two
> > independent cpus, that are monitoring each other.  One of them is
> > imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
> > independently off qspi.

<snip>

> > +&gmac0 {
> > +	status = "okay";
> > +	phy-mode = "rgmii";
> > +	phy-handle = <&ethphy>;
> > +
> > +	mdio0 {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> 
> You also need this here:  compatible = "snps,dwmac-mdio"

Thanks a lot.  Is there a way to send patches to Sashiko without bombing the
LKML and, respectively, all of you guys?


		Petko
