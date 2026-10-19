Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F04638A717
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792391724; cv=none; b=bPbRV21phuGa8Z7zfLh29/7TfBj9wzoeCwWvMdSNJGKlvJW/7mdbFQPBwpwVwUlzjs4tAHtuh1apmQ9VSy/4SXbIsXLmNIlilJKKS9KFsIOAWgaWl5AJb/lzoSDhon+cLkL9dCBCr/KS+/LnXV1WHdFP02B2C/PkiRfsOKltSNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792391724; c=relaxed/simple;
	bh=0L4XVH1RatRMUnOcb3s8s0yM9FwbW/K5J4m77k7HPEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pgxG8JwvChFHRCHTJBV3oVPu5nMhFRZqVwThS6wuPILbz+rtKMWK6yZemJpKyZmbgV48+/heO9P6JSj4zNTa8N8f/HM70HnBd/BSFnKP8hFCLgfhpazj2khpifqYWFOp3fPBOkXZMicTHOWG5sn5Ou6eA3dw/I7/mqKWpdlVk9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e7cym90H; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e7cym90H"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1517bda04a0so969259c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792391723; x=1792996523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nKi2z3pi3oxPdtq2njVr3OPRIkpSJmJ+atF7S1CFI8U=;
        b=e7cym90HTIneY8egdzDlq6uwmQcaqUcHwYKJOxiQr/SiHMlVW/CTQSN67+OaPBaT4K
         BeFO+XGXTLMjoH3wHnPu9Vh6ssOCppfNb074E8r+JEwZOGRw27Q74FlAPy3gD6Chba4q
         8Objcyfr2/EkDidq8EKJaHNQvJTKWY0e/D33ygSMBca2rgQje7oRCELYvsAuHgahRVj0
         AYV8e/X/1sqjp3DsuuwNMvRdJ2Env1EGdob41DfHm3mvzmELgkVsmorm13oRuHNctiP5
         CR7zOYINrGdLvHfZeGuTWznbeck5lBC/WkB1LoMia1PaLPN1QVNCXv8NBpuJ8VQlbxh7
         pJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792391723; x=1792996523;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nKi2z3pi3oxPdtq2njVr3OPRIkpSJmJ+atF7S1CFI8U=;
        b=h9FF0D53f6qPI7/wEdzpQSOoYkXMp9eFarUENoWiofVWhIlgaJ9vUzHLaDlZwcWosc
         ubSfyfAL7uQP02Ht1PfImJW/5V0bsKjdoupUx7TjaojKdiKTNlPL8Lc342Lk5wNdGore
         TglaUSP+vQZgxqkagsbqg3iBjWAeCbBg7AmT9raKd48Mq5tzA7xmSf3syXw2o22dyawi
         as/pLWOP0jnF2E0l+EeFnKsrn31azduHyOh0KdkEfQB93nAsXT45ZjewSoZJPp+YSnRV
         DQKApQIKzOkjR67wm09VYK9becRRBh3whN8XY5nMjEtx/fu5qCx7VGjbrOO+y1hGfQA+
         wZFA==
X-Forwarded-Encrypted: i=1; AKwUvByFjmfoobh8C1bFtF6W703+kjH9d51+VL03lzVp/ODaQ5OO25Y646tuZ05MU07C5LzuyTD09T3YLwWDSU8=@vger.kernel.org
X-Gm-Message-State: AFq9FYILjQqLtc8biVu7xdE4Fx38A7nm/X3CRyHtm/kiVTPMlvp/bBUH
	uciyB1u1crT/L2LH4Vxg5V+NInOvAMb1f4940usy8UU1qmAh6UBy8FhVwt1LwdLsXxo=
X-Gm-Gg: AYBFou3M8Y88Ee+Tf5y0n3onvZN7rsrcDEnpV0fT2pjXmJkJiepqogcVdrB5I9iE9UE
	WusgQtve0fgE25mEdUYcIQLxmoMPsZ3vc7woTVj1GPsBbEMl4nHEviXcO7ZYNbc/AQeY2Obt1b5
	0AbggiYZAFwRCtvw3EVAjcny/uk5+OYa88mi7VobWfX9lutdufQgQAysmn5ajrSdkrkDsx64Eds
	/IeYMZUI/mlLrw34Qh2NGmNs0mdiJStPhjbWvHbO1GrcwtPL+aodMEhlyYy81i9qtxvd3hJvS1o
	+7GuPF/7KdXaIDL3OxY6ZzGQSPgdXfu6MAckcNQ2TOYig1V3xxtWyT+Ls4spRsS11HnX2wM1nFH
	bOABmSLE7Fyia3tqD1t2MqnrWvEY45ofWZCwrB1fsG6OafRS88PmOkTn4q4xVkGrEF39XnoeyhV
	hrt0U/wTbkd67muqwMmUJsBFI86zmf+BU3z6arZeRi36P6MGfUuHmoij94p3aYwUWa5sn9O141u
	dpFwEAeQEI=
X-Received: by 2002:a05:701b:42cb:10b0:169:b1b1:1445 with SMTP id a92af1059eb24-18512e2515fmr10313720c88.31.1792391722239;
        Sun, 18 Oct 2026 23:35:22 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ab80f9sm46711875eec.12.2026.10.18.23.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:35:20 -0700 (PDT)
Date: Mon, 19 Oct 2026 12:05:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: longrun: fix typo in kernel-doc
Message-ID: <atW6JlE-pkObg9MX@vireshk-B250M-D3H>
References: <20261017071434.1250140-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017071434.1250140-2-manuelebnerli@mailbox.org>

On 17-10-26, 09:14, Manuel Ebner wrote:
> Fix typo to fix:
> 
>   $ ./scripts/kernel-doc -none drivers/cpufreq/longrun.c
>   Warning: drivers/cpufreq/longrun.c:126 expecting prototype for longrun_verify_poliy(). Prototype was for longrun_verify_policy() instead
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
>  drivers/cpufreq/longrun.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh
