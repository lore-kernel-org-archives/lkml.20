Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEEA49B210
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287050; cv=none; b=OS0vEo8cdWbBtdwdMP0yoaPRtaZLQBiAvEBety52vTMPZPoJ2wYTbBpgi6O0vU6I1/TFTallQI5oqPPiyFq5MQrCXD2YOrhKQh4W7p73UwcpEaq+McYB1mf7gTQ9do3mEni5u9ZI1/xVNX+QPDFxuwo9PfUG9WjZsCzN1D50ZgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287050; c=relaxed/simple;
	bh=gTUWiR5VTJ8w/OOAFnC6tiKQEwNgsZyGLwtJMFQxMkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnFPSuJuiUwmIr1556O8h73+HBCVl75hFjXNs4WtoiXrZ0+DoESNWQRA+66PdtsTHgck7G4BewvkoqGEIP9CSz3WAfA22EkeqbEVkVIMG87VbM33NurBz7bLYgsiAqAOXRcVX3EVyyQH2xE8ApPNYQcXlhioG9CWzRREnEbwMZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2E/3p8J; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2E/3p8J"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso187551a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788287049; x=1788891849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vi3RXIQaIvC+Ri0ofJm7If1tHUYP3Tau+8yQZvuwIZY=;
        b=N2E/3p8JtYK83hi+GTRhJH+rKUUIkOPJoy1U5oHLZIBaUF1B6ZEiu49bu5W0XF04Kp
         ylDfAC1PTAUEbuBRsbgXM0zyeLIWaJ3s7ARxYMtRJM2K7vTnz1+EkqBdizqFeOg4gxOA
         Xh8gRsUJOI5l82nVJybJ9YclNJBlgO4VKjT/LBIfrB0I+jFekK+xmxgUh1cCaanqppO7
         BBLiM0iRZQ3Tl480xq1moTOeAnQmnlZO4kHQiP+IgXGI8r9HwcC8vpzOS9ObxxIzTswm
         0JK9Z0DoR+0u7FNaugf1RN6IcNXeIPJ0ia7LDJNmb3+oShfq4k63rEVQnJfv9KJRBFmG
         QVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788287049; x=1788891849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vi3RXIQaIvC+Ri0ofJm7If1tHUYP3Tau+8yQZvuwIZY=;
        b=S29H1QgDkvKNmxTAQbtDXJ94Ylt9S7lQdjneg5Pxk4ZkoPW901Zv/Zn8s+va19vxj/
         R2SWuLRFDL7qFOBjmOfJxPdZpHXz5G7SZT/HZbeqNpm7Yj4qk/2+Gg8dHghtj91TXKix
         ctjdTKrRFTyLCK6kwgXxoWl2VIPdZmj7aTdk4qk9kFdAgAtmh/0XcT5kWa8+pi1Q8nKc
         AtQ04PUy6Y8cFTKGmE136oINHw1/C6vli67x7X5N+AHj3aYLL9xJnfGGVKEIO1anVgXr
         WzAcKoLT15yarNbX+viELfjG5WC61FQqNIdnaJyUYIs+TZtX1hYsTpOxE1FmeEWKiqcU
         hu4w==
X-Forwarded-Encrypted: i=1; AKwUvByIrct8cUHBo/90qGXWzQpIU3neAz9eQZd6MyecESiD/y2TxTLIcGu0uKGoX9l37vzpcrzTaJo7cO4NqHE=@vger.kernel.org
X-Gm-Message-State: AFuF++nibFcs8Vb5Dsjz5mpAQVVgHQUewxg+3cEaEIwE4RzyUGFubry5
	4T9MvuPjR6YVeXWCMeVXvuRhfL6mvu4PL/JlCnhQHVsCdn6n+oFpfVyDf3KOpA==
X-Gm-Gg: AYBFou2uCwcj6vlrUiXwKUQCWFjlcWaHyB6db9V39AAv+YX/22CNTRGwaX1eUDPXQhQ
	zzw2MPSellkEctIgupUQzgBWxSFrVFfO1kb6Qq2Torm6Q8NRgzN7aPBMVXQYMUSCR14Q4bYF85g
	LtqBuZerCOilUIxCkjIJd2zK2c3p2DBPk9F6sxOrtLaeSEkG8bksZtwc1bfNuq2FMyiTEVy+M2V
	ckXuxinj3ACU468WpGF1SnKZR/n1wgaMeM9n+SJcC/yN1aJG5L/JSPTmgwJ4pmTHliaUyKvE0iy
	KnleAal6iy0x8Af+SXs5kS0siVj0vPRMongTiMp0JhqfYXnWIRIIpeU24LIm0E7fQF9/hwNrdNE
	+jKA2wQjtYAR3dmRFOz4le0rD5RmMYRIOS6XyocGdAG0rvsYnW3VruKeEcAaU+8Xwuwam3yhUCi
	c+rCStSGyKGKo8nmGtlufARCIbHglXKKGFvdc00nGV4AdXHvmTtIZaOBw+SRpV9H06XtgtoXcQt
	g==
X-Received: by 2002:a17:90b:4a8a:b0:399:e97:8d5a with SMTP id 98e67ed59e1d1-3990e97a0a4mr11272779a91.25.1788287048611;
        Tue, 01 Sep 2026 11:24:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0dfcd65sm864498a91.3.2026.09.01.11.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 11:24:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 1 Sep 2026 11:24:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: pali@kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, pp12313124124@gmail.com
Subject: Re: [PATCH 1/2] hwmon: (dell-smm) Add Dell OptiPlex 7090 to fan
 control whitelist
Message-ID: <1a0d87b1-0606-4bfd-983c-94be05cc8141@roeck-us.net>
References: <20260901181849.241776-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901181849.241776-1-W_Armin@gmx.de>

On Tue, Sep 01, 2026 at 08:18:48PM +0200, Armin Wolf wrote:
> A user reported that the Dell OptiPlex 7090 needs to be whitelisted
> for the special SMM calls necessary for globally enabling/disabling
> BIOS fan control.
> 
> Closes: https://github.com/Wer-Wolf/i8kutils/issues/18
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.

Thanks,
Guenter
