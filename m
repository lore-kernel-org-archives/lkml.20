Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443223;
	b=l99y7R43A2Cs1SnV0QUZMLJvF2EqYXhRCXN14FAKaQm/WCobm6dAj/qsMgO1cO3p2d2b
	 19D4rRG4uiPSP3eaH3tcYEW5pQtw2bIuDNtAtIXwnmH1oMuzu5It33veGJ8K4J7/C7Mz2
	 bFDsXsEmo+dyRXRbY6sMX07djoGEAc3v1DMmaR1CoAcrCba1pnEZSVRoovvRsbU9LYYAq
	 0vy5gNGc6cKu70JuPSEcw1xYfZJUXozPgN3fYjhRRQN9Ue4dwz58RQp1HN7AWBpUQunDo
	 lHqvQ+dutFgMvimi+X1khAr3kwPzuWLgJ0OBab3yNoN/pQ0rEyhe0bsb0pQzHF82afA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eQ7btiBcp3eDTgLhx/ibMINfBWMqVGu1dC3mx3tEGz0=;
	b=yufYraF+95ubgCriDP1TXkP9EP1H+iKN2yOt3q0BwY3OjC6ZWSNJwFqJboYrMBlWSszG
	 vfx2FJUvdlx5EddXP3S7fncWst8npDasQG8E+XacTJP5bePaf8XO+Jzg54r0o5PSwWse3
	 e1k752jSj37B+SABFwfyRMC1D0l/46I8FphJ7OGSp/gKJg15+zBx6tgqz4ZqQ+d83k8mM
	 LFOkAKuGtsr7uRTYZSpchUdRpZbEs2wSTjS5wxJwlig+S0WoNEutVg7tPj52xQLjEVpJD
	 D1PPxZwsiV5JWQIQr1wvHcogWjMt2wgWmi2OHBdWU0v4icVYsBIIMKJ5ZKLb9Qe6zJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sVlY+y6s;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFCB606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABFCB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sVlY+y6s
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35943f55c06so121394eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792443222; x=1793048022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eQ7btiBcp3eDTgLhx/ibMINfBWMqVGu1dC3mx3tEGz0=;
        b=sVlY+y6snCjEyok2OxXlhW7JqE2aCHv2dt9r24qcl3pkp92skH2ZPKNiRTXiX8C2bM
         4EnafOF/sbC4VBWTaqIck6qCxbJfLRnV66YW/KiWKMd294EK9vAGk4Iarj+TQPCnuNce
         tlgg8d5EQIieck8VBH6mfEkG1DuWBpgfVw4VnutAdbGqQWA6Kdd3Woq+iABFPNYMtiBg
         sDydMlLl/n6tajuYoyMnMCEsKsFjhSzHG4bqtDYarcnPc51nXYyTjSdfLF+BDM7FOMS+
         Yv2QkohREQUVSy1gg1pYcPZ+SG27bfvaF/MT1TY0++/5k36jtPX75Hx4CQ2gCwGvSJps
         gvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443222; x=1793048022;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eQ7btiBcp3eDTgLhx/ibMINfBWMqVGu1dC3mx3tEGz0=;
        b=KOANW/68cQRF4Wqd5QvB4CYrIe1jmSGa9DqaV5x/luaubyMWWGCRvaGuFmTs6HfYnn
         Fu39UmZQUbDtB4RQGRZa8bj7alIE+qLwEZmNkxtuwec6i9maRMc0tA1iOI7pRr9Q/67I
         y6ODK69Zl+kayNUyOLXqHJIkSFiybEInWvglftF79j0ejPKcfPCffQDMegbWlmhtYR9X
         w6FRiUFULFrIXdvKfUlEk7Sjet9aPPnOC3TpHkiT8zC/zBe3g9mczBACbKNyYAa6bGp4
         yykfwUO6Q8ZndWJMgEE8MJ/G/ZhQD/Y8RvJeK3y0WP0aVlJ8QrYtrwJYoL5FbBTWT7FV
         r7FQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/TM2yj3hD1LxFFOOc71WCfWkzme86itYTRGNqnrrtnZFYwHp2f2uRN7QXfdWARO8d0FY1mTH21Pnrar4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8/hoY2ggXy+aWn4T2fGfWDVY8a6+iLd4U9e/hJyjxAwQAjZjB
	NmohD0ognOO2quNiwv0nWymTv/zu6M3Zz+faAPoCGIHYg6pxkd1GajSSQ+ubxA==
X-Gm-Gg: AYBFou1lPlSA/oPdV23SOyyCwLwxEy0rNMF5h0+ziG6p4lfgftgNYIImh01/RZGF+tU
	IyrP8jBVs/P/erO82ma9ChWM3XkyQtfYOyrnYTp91mtSFBW7KgZXt0gtCEHDcS5lVccj3NUWYnr
	1wYYPZTQ1DCIJ+iEVYjYGBN32mkpccmePqceJoiQm9F2BBzpCL49NteCSE6aDU4fSGeUoXmq+2l
	KoPc7T1XPkZwZGKP4wgVD/T+XN8G1Bov6Xh0xh0mf9WpQTl6VuvqKClSFEuaHuAI6y/LB16x8c7
	isKazMbVDtXg2v7MIaYWC26lPRMbDboGMvzcXIS+WbczlImsA5zcsbvulacQp5jYIFLSZEQinRg
	4sI4M4VrIV45H7sT0gnyqlIAE0tZUnEkqlVVxn/+Sd3nf7D8BrjprPVq86/DDchn/oOXPtP/GSq
	5eqTcHrltJ7Hv26+NqWbcNOC9slOpZIaqULVC6tcbrDrwb4o4DGURGOjdPb5mTQc3cULa2+OFEg
	M7woP3QNqWq
X-Received: by 2002:a05:7300:f193:b0:351:2f0a:cb2a with SMTP id 5a478bee46e88-365f829953cmr487552eec.2.1792443221795;
        Mon, 19 Oct 2026 13:53:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081bafa7asm33939258eec.14.2026.10.19.13.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:53:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 13:53:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: github@firefishy.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (acpi_power_meter) Fix 18.45 TW bug
Message-ID: <86b3c644-544d-4c23-8e7a-4478f4094058@roeck-us.net>
References: <20261006234618.10943-1-W_Armin@gmx.de>
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
In-Reply-To: <20261006234618.10943-1-W_Armin@gmx.de>

On Wed, Oct 07, 2026 at 01:45:34AM +0200, Armin Wolf wrote:
> The ACPI specification says:
> 
> "If an error occurs while obtaining the meter reading or if the value
> is not available then an Integer with all bits set is returned"
> 
> This integer can also be 64-bit wide on ACPI 2.0 and later systems,
> so we have to check for that too.
> 
> Compile-tested only.
> 
> Reported-by: Grant Slater <github@firefishy.com>
> Closes: https://github.com/lm-sensors/lm-sensors/issues/460
> Fixes: 1fefca6c57fb ("hwmon: (acpi_power_meter) Fix 4.29 MW bug")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.

Thanks,
Guenter
