Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015D84CB8C8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956061; cv=none; b=mYGcEX5/R9JGevXnHIsTrZkD41NTGtjLlb6/khjIRcoEJA6ClBgnCNLG9+5p7SvET8Yrl6TdoqEd2oi1litgpyDMjVxpLC5H0JNSYtkTzD5qNi9aUJ+WmSO9i6ng/VsRzNUhv7tbfo0MxMs6dwIiQ1oPqEIzg6fl80B69+MToV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956061; c=relaxed/simple;
	bh=JWbLj2P+p86noThvo+5f8RnGmWlyN7xYkrPZPWdyG9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOWqe23upxUb2bM16fRucVem+iI7pqsx1cyQaoJY/GO+ZMWLYpsKmg/7brYIvZ8V23/ZvSZ4UIl+RwGMABBw/ukdm8EHit/5UEbmiig1FjCYbCTv6dhdYXpSVEY49h6znAtP7QSNx+mUUZpIK3x367AFygLHt048DDQ0aDRZIro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RWKuKQKH; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RWKuKQKH"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fd8d88so10831a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788956052; x=1789560852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OLeB5rXfOH7E7UhM6CACBitNmfAy17RFqKwRIPuMUr8=;
        b=RWKuKQKHaDPefePsmpuo8p3TXAI4POEdud22sFhWI8EUF/otvo11P4K+D+hjV+S2Vw
         GvfSkZc3dGJC8NkIwefIDQtin/y4CZW3LNTkT2wUe6lFcJVkHurxCH7JMot5WE9fxHiD
         cWjHZhBR9KaleBhHd8+c2wNj30esrLao+86AQRMoTwHKFMzl5m3OL/RItiwt1OiBqt3N
         TGId0wrKWFSfnr3b9+iAGSxaTPj62ngp8USLlX9Yr9DQl7NnovvqqJTKlzsQq51PkTnc
         MF9gzrKa9GjNFRhht/elcj/MmcXHyJKNu12xWi3b7AmJ/sL3IHEa2K0EL4y9hDGzMwkd
         neKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956052; x=1789560852;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLeB5rXfOH7E7UhM6CACBitNmfAy17RFqKwRIPuMUr8=;
        b=OJBUpyrlHKu/X7EmllCvJmK3MneMOEeBmnmIXzfprAZ76ebwioVcxWgKf72y4NJbNg
         M/O99EiIF2i8w95BcTmkqiejhxG2D9qmFrbGuFrasbZ4PFnND17c5dxfXWkNMlrwQ/KV
         2hOpi0PYgBjRXE2PbEyIkO9LBRMaux2uSx9IhgwlCEhke73I95B7ZwL6By7VSQg5fKG/
         cFzhyPN4oal9j6E/OUa3har9wByY3RphRXeYnkBDmAZofF0AEngOm6QeTrZQDR5YcgKo
         3kHBzjQqg9puDrYxwvk0b0/2/hw9YgS4IzbGtWvlG6gQVzQdq0AZIO4GP0mVI0b0hATF
         GAQA==
X-Forwarded-Encrypted: i=1; AKwUvBz3nzyZXAy2+xKWCKXqbMwU2X+aVjm0uE8Z7idXiXr8XCWK/34oUBXIIz2gIhmRWqBSnZ0xUmMsKMzUQoM=@vger.kernel.org
X-Gm-Message-State: AFuF++mjo7mXarW9qhUEX5cvbJFdWLdTeCktAxosUROa7DejS5Qr/9iY
	6SruF35s1QV5lSsrgy5s4lumGbQwR4mC/TT8kVqhBZZki4Kv7XULfimBhWij+JRt5Q==
X-Gm-Gg: AYBFou19iNBo07Fb8BdO3r3VLMQoI5fxfilUesYBYA3dYg9owFap6Gd4eOKeJL4h2tM
	evuXXTbmckXau5mRU8c9FKhIOxskcNrB+3PAw2lCA+iBn07giBM+dyBNUg0/hn/HRY+BtiS3V3t
	nJGKybhNYuMStPzgKwfhHaVItrsQzjG/dKtGgahTiy/jNk5M+68OKEpijssUy4aryI+oFwzqBGl
	e+NsJvz65taqtt1evvTkI20UP2ZguDW3UhczOdn9JHxoN6ePT5vmfsqDkK/BOdyDZG8thxN+UOw
	dmWKVRGiyLhXWovaK+6rH44iLz7ij19ewnQcfBtRxvVVKKXWSIBE+vyewT/hLXNNJRjfLUt76R9
	xE/rzHL5KrevXYHVcjSbP1Xb9jBGSh1j+zkNO1LLooFBax7bOARHAgN4yW6TKRQN2XJwvbokiKY
	2u+2zUv9CdbK5n3obpkEp06aciW1DFwDtcToyzRy0lYhqdpoz2ho1ETU0bmNSkjP+s8OnekXJOA
	YP5OeCJnSxh+idX1ChuBS7w2FY8+hBeLw/WQDdQt4ei9FgQpMY=
X-Received: by 2002:a05:6402:344c:b0:69e:98c8:e958 with SMTP id 4fb4d7f45d1cf-6a993369262mr31093a12.7.1788956051604;
        Wed, 09 Sep 2026 05:14:11 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d501662sm770293066b.23.2026.09.09.05.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:14:10 -0700 (PDT)
Date: Wed, 9 Sep 2026 12:14:06 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
Message-ID: <aqFNjlB4Kh7ipKdy@google.com>
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <ap_PdUrwLIVGJ3oG@google.com>
 <dcae935c-ccbb-4cb5-a184-eb5dc2cc84b8@oldschoolsolutions.biz>
 <ap_qwdz-3WibXRjq@google.com>
 <364326dc-9715-4e77-bf25-4d0a30179826@oldschoolsolutions.biz>
 <ap_69OsnAOwQyo50@google.com>
 <9762659c-fbde-4887-8da8-200db7dfad09@oldschoolsolutions.biz>
 <aqBKI0Fg3ZqYPOJh@google.com>
 <f89bf46b-dfda-4fad-9e8e-fb88741fca1b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f89bf46b-dfda-4fad-9e8e-fb88741fca1b@oss.qualcomm.com>

On Wed, Sep 09, 2026 at 01:31:53PM +0200, Konrad Dybcio wrote:
> On 9/8/26 7:47 PM, Mostafa Saleh wrote:
> > On Tue, Sep 08, 2026 at 05:04:44PM +0200, Jens Glathe wrote:
> >> Hi Mostafa,
> >>
> >> On 9/8/26 14:09, Mostafa Saleh wrote:
> >>> I don't have a display connected (never managed/bothered to enable it).
> >>>
> >>> Can you please share your .config, I can test with it, just to eliminate
> >>> the possibility it's causing the issue.
> 
> [...]
> 
> > Booting in EL1 hangs with timeouts and missing suppliers:
> > [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x512f0011]
> > [    0.000000] Linux version 7.3.0-rc1-next-20260904+ (smostafa@mostafa1.c.googlers.com) (Debian clang version 21.1.8 (3), Debian LLD 21.1.8) #2 SMP PREEMPT_DYNAMIC Tu6
> > [    0.000000] KASLR enabled
> > [    0.000000] Machine model: Lenovo IdeaCentre Mini 01Q8X10 (Purwa)
> > [    0.000000] earlycon: qcom_geni0 MMIO:0x0000000000894000 (options '')
> > [    0.000000] printk: legacy bootconsole [qcom_geni0] enabled
> > [    0.000000] CPU features: SYS_ID_AA64MMFR0_EL1[63:60]: forced to 1
> > [    0.000000] ITS@0x0000000017040000: Devices Table too large, reduce ids 32->19
> > [    0.000000] ITS@0x0000000017040000: Devices too large, reduce ITS pages 1024->256
> > [    0.163152] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
> > [    0.163313] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
> > [    0.168334] clk: Not disabling unused clocks
> > [    0.168336] PM: genpd: Not disabling unused power domains
> > [    0.170770] qcom-pcie 1c00000.pcie: supply vddpe-3v3 not found, using dummy regulator
> > [    0.178347] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
> > [    0.184718] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
> > [    0.211932] Warning: unable to open an initial console.
> > [    0.212057] qcom-pcie 1c00000.pcie: supply vddpe-3v3 not found, using dummy regulator
> > [    0.213907] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
> > [    0.213928] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
> > [    0.244210] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
> > [    0.244275] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
> > [    0.251833] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
> > [    0.259418] qcom-pcie 1c00000.pcie: supply vddpe-3v3 not found, using dummy regulator
> > [   10.213618] qcom-pcie 1bf8000.pcie: supply vdda not found, using dummy regulator
> > [   10.214873] arm-smmu 3da0000.iommu: deferred probe timeout, ignoring dependency
> > [   10.228713] arm-smmu 3da0000.iommu: probe with driver arm-smmu failed with error -110
> 
> If I had to take a guess, your initramfs it missing some(many?) modules

I am not using initramfs or modules, everything is builtin in my config,
so re-using the .config will not work, but I'd expect that just using
the device tree with my setup should work, I am currently investigating
that and will post an update soon.

Thanks,
Mostafa

> 
> Konrad
