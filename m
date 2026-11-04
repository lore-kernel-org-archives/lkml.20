Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782238;
	b=eAwRn3spqsoWlU+y9ualSLJSPFlgMYUwWcQfkJAoaa7e+sWi9MUXdXzTb2x37HLMNwqw
	 nC74SyFfn4EGhIKvkkeHmgvcSv8j1sWpLIDufer5P8alc7Pv8Po4DcX5Y3KnvOpLZ+W6r
	 ED02+F16Xd14wUzvTygNPvT5BNJLVIQA4oOSJsCKgk0YrHfjIwlac3CvUv9VVPDI0PDnz
	 NHRJIlpj9SKwCtKxqAO2N9OPUAsC5MlnSQVT/fidsveBaav9At48rBO3ZugwC8n6LkQrQ
	 /VYAayLRejoRR7vmkgY21SHV909PN4Hc10hcJRJ5EIFVna8I5TPn5xbQ/10qMtO7qVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=c/7fexNl7s80SzWj4K2ndKBWVJpy6wm9DpcfZBzaNlU=;
	b=nhzwDODDfXjYloyhRX3GvDsYRWyH93AhfzI1TvEpCDyEh0WEnPPmOCIOBcKUOK/8uYm1
	 QMDXXNLxUWXEaAucgeDieSGpfLZ7h/Wvmu+5Ra+8b5iQe7820CnjnzEnb9XuLr3B3yJTq
	 A5peI1k3F0yTor4yk60AwyeXmzu1wtXhDA18Ho3sw7UloS6zUzf7zmJj2EyMzra1PY0Jh
	 b8Pay75lWUzOGURD20iM4cHRhw8Y4q7bIVFN+2/3z9bdJ64OrVNHenaOs0D+Qn3uUEQfI
	 gzwWdBGsGobGYOdtb5QT/QsU/5PGdeYH3eWUOHf7HXQE74TDRa2lein4tP/zhgrkL6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BeGuGwgx;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37A7606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C37A7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BeGuGwgx
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3acd239776cso4123451fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793782231; x=1794387031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c/7fexNl7s80SzWj4K2ndKBWVJpy6wm9DpcfZBzaNlU=;
        b=BeGuGwgx4Rt87ZlwOx/3AgYM5Q+NiOd8+GRccRF0FlCMrtzc/x8taqLQSg4KpGaFcW
         HgXjPMzoEtBeUJrJfyGki5vj42BcCyW6KuzYGXmKgKsyQdhx/1YqynSk8SkoZjYTqGsG
         kmJnggFJovR02NygTlrcWhWf0lZ39nxvFPuZtvGmWPkrTlPi2XqgbFTdDGngKh2Z4KNT
         cTiQYEX7+c+hx99SZcocOoLEW5nVULFDjHc3EUR44oXYQPDqVQ/RcGn9u+NnhrlR4fnK
         9uXPpNhVdaseLgNSTovn1tSJPvHbL4tY144qOx9rJLcOu+xL+S9EBRK3GtOzgeJOl1/b
         6AUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782231; x=1794387031;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c/7fexNl7s80SzWj4K2ndKBWVJpy6wm9DpcfZBzaNlU=;
        b=ktr704PlnVbysT/ClI4PG5w/F60hj1+kWNd2B9ieLoOYYWMoAlAniK5/kpKwu127zT
         pM2B5qlyKgy3rxJCSuWrsDgUxqi9zMUQ6r49lkxMLHtBzkOx84gHcmQhMcMbsnyzfOMt
         mgYNJputsQ+FuaNukiyDs0fKuObtipgMv2xWF+O0KllapHxPpIi6DtP9F0EH7if7VVlb
         EKlAvZhmucI/Yfxb0PV0502AFHkKLM3BfvaQZla7QgE3Humg7C7HdeI4Me4ndGxmLRG6
         OgVn59detEJz1ZU9aHWQaUNIX6Nwt3FQxL1kyl9a0YOblelRVIig3OPluiUsmR4FoGDR
         I+AA==
X-Forwarded-Encrypted: i=1; AKwUvBylOckDj7Rnv2O0Jf42imF9GB5wFGxloAasoz5VmZRRut6UVEa0i8AgY1KVLRG5R5b3SR4zgcZPqizjSDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QIjrxLxcS1ra+bpd1mw0He1nxSDJzUpyTtLHQzNGq1UR5ZFYI
	9+AdLRkm2qJQohMBSqzuxhauatoOoZFIxRbEE8LhXE7aTc1dME0N0nw6bkV/mLsodD8=
X-Gm-Gg: AYBFou3oYcspIx7rqzsl7RYvc4NPbYgm/6cqBFUOVLSTeYAyHkSiTMd54Tbe5lA/XSw
	d99kyEVXzLhswyzsLDGnqGK7z6oUwb9tVgHPBV4XY83BECpZJXZU8dPxGuA/D137xa9H/pXzNcV
	jvEUIunDRDQt5OBd12svOb77JhRYEyaVHDdyFzy0kI0xdACiNRSib96IGzjk31AKnyqVfKHWVcm
	mG3q2gHjLHi1xJCb3cyImzUtuPx1Dnyc++zX4/3g7gtF9Ydxu5qnYNPoVTQPL5wNrYKpl/Z31iq
	5/TmIDmTZqSwL5rYHjXqejIc+RJXHkKOxWNIdxeOp43V0d/Yv6fhO7QD7ahQAfoef6H3YE/uw1n
	JZ+T6NG883GzYpDGhrn4Uy+13Fs8rhGouFe07TdogFhh7Kf/EZ3l1bT25M5Kyaft7Ujq9So1UvA
	HV6pyXayeGA54+wLXXujgEA65UutfDRWi3F7q9SkjXUkDQORshQ0mMLTquNL+CKw8lFpTHFh0J5
	XLAXGmtU5pN3QH6wZ7ODceTiO9L+nfIMpyDxJ4IcmkB7tDI5iaSE+p3Eb0WSmOGBqSQ8qG9oum8
	Mbbz22SUG6CCslthE10pcsME/bAKTWlumYNprlP2p2BlLVqTdE1ILLE=
X-Received: by 2002:a05:6512:2250:b0:5bf:a12b:9ba8 with SMTP id 2adb3069b0e04-5bfd957cd8dmr5159537e87.65.1793782230950;
        Wed, 04 Nov 2026 00:50:30 -0800 (PST)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff384c97csm278483e87.5.2026.11.04.00.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:50:30 -0800 (PST)
Date: Wed, 4 Nov 2026 10:50:28 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: Kconfig dependency loop LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL
 -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS (was Re: [PATCH v4 2/4]
 platform: arm64: Add a driver for the EC found on ASUS Glymur machines )
Message-ID: <aurx1DKC9JQcO94B@nuoska>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>
 <aursRfQRr0AOL1Oi@nuoska>
 <a759d346-3fea-4a01-a80f-de354746a288@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a759d346-3fea-4a01-a80f-de354746a288@oss.qualcomm.com>

Hi,

On Wed, Nov 04, 2026 at 09:37:27AM +0100, Konrad Dybcio wrote:
> On 11/4/26 9:26 AM, Mikko Rapeli wrote:
> > (Adding linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org and
> > yocto kernel maintainer Bruce)
> 
> [...]
> 
> > With this new EC_ASUS_GLYMUR driver in 7.4-rc1 there now exists a kconfig dependency loop
> > in arm64 builds:
> > 
> > LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS
> > 
> > In Yocto distro we use additional tools[1] to check that kconfig elements in fragments actually
> > get applied in the final .config etc and one of the checks is for dependency loops which now
> > fails with 7.4-rc1, full log below[2].
> > 
> > To me it looks like EC_ASUS_GLYMUR correctly depends on LEDS_CLASS and that enabling this
> > driver by default on arm64 with LEDS_CLASS is correct. And also HID_NVIDIA_SHIELD correctly
> > depends on LEDS_CLASS. Thus I don't think the drivers are doing anything wrong and thus
> > on the Yocto kernel QA check side the dependency loop check should be relaxed since they
> > now can exists in the kernel tree.
> > 
> > Do you agree to this or is there maybe some way to remove the kernel side kconfig dependency
> > loop to and from LEDS_CLASS?
> 
> https://lore.kernel.org/lkml/20261029021330.460192-1-haiyuewa@163.com/

Ah, excellent! Fix is coming soon then.

Cheers,

-Mikko
