Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793163204;
	b=pu6Pl+Y8eTclntV/RGn4CcQP78Q2GN21gdVXwXpNw7LtEJBUa7l4DIcs5LHTI6+3hG5C
	 gZ6qXp9XEx4t1dGln+vAR8S8KLYkKwzgkmaNzlElBSipl47ti4w/G3GQO6TA+7yybZtaW
	 UY1up3T9HipXSxR/PL3Mw4r1irMl3cyzANElNFDX9SQeMxSPReNCZKMdDJVjbTq+Wt9GQ
	 vuGCRCNIvtlKtNGYxeXNjUhMh2xFFdM4alQGiINHL/nMN41DeMZBRsGuN09RsOf9lNsTw
	 ooS2VTCrJOIjr29kG1YF+/HObMkn6hnoGyEjtgxocO/mScWlhXnVPCNoqP/8wVDpXnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793163204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iMvg9EuHuu+x9NUwMZWsnJGwMCIhGiOL6i2k5eUcGIU=;
	b=yST+QDjmdwDTCU3b6c8ZWCPj0+ODjyCkwseyLfqm/LIeCwr8v8bnlEORKGvwyxIc7x3b
	 DqhxFhRitBnNCnpfyIaaK2UsoExhVXBorsEaopzPfd/WaVDk2tcauO71yz8hzPiQi7vl/
	 vZZGbcP6ac3HiFU4/VL451t6n21wLMfkOkd/QpiKeWGTqvjVNwisQa9+z6v24cuih0NDB
	 D1rzdAKStnMMKwhA5a5UBlnCeZ6CkX1xWKMZqa/jRWBrD0tPZw9qbIKgZDE2giSQIcB5p
	 0pMAdEoaNIj1H1v+zlpfXEZWhMRG9+FGZpei1JzylLafYQivDgSzKg2vzfm29tzkvqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tOpnL67Y;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D78606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57D78606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tOpnL67Y
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a121bb8c2so747702eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793163202; x=1793768002; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iMvg9EuHuu+x9NUwMZWsnJGwMCIhGiOL6i2k5eUcGIU=;
        b=tOpnL67Y1PljKsF3ziaS9wAhsBV5kF3kmf0yRJwDX+pXgmLxS8Qwi45H+GtfdqVVZB
         1qNHlx4j4iwfCilWctQBdR+wgcs8sDxZmBr7a74BGymY0F81SIG8lrqBC5kFwuCcqCkA
         nOybCI8az5UoI9NQeZ4Qz9t431NYzE4wrSxq6rg+7UBf9yseMpxWc25y41AtAjDrvzTv
         TAHA18rRwSYt4g6cZ/2GsSJUrpOMoQuQkrAxi98RvtbJL+auwGvfzA84v066kWZmLEVi
         x5cpq/bBXAKPHd0pltPABjMSclgbcg9S+XC9qTlwPSX05aAKsCMDTnRanVBu78qQc6uf
         doXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793163202; x=1793768002;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMvg9EuHuu+x9NUwMZWsnJGwMCIhGiOL6i2k5eUcGIU=;
        b=qeHtbcbbx3032EbjkESkwp7OuVWzY9Fy0P1wPUFewB9uuLXknnV2E3lvxGdEYl9vAI
         R1YwZYhj4FDzcdZfBCNoMw1b6EmuEeYoMUt4wpEhoKaQrX7/uo8PgdknNh01gOY1oePB
         id5gZATI5BiuSQD120tsEphoNM55w04+haJK5GjPXePokPStRJGGef2zp0aFrv7+YRvU
         /crXk5bjYXBwRyXkwN4RFKHhmd3ge97gyVVioazDYT13OsGAlJsDX8Dzhhsvm0OIGHP2
         2f4lOV0C1NlW7XeTqXA4472M/JXbZkUgRPqchqak7QSPvktKrrTNDiPFruHy0RPIUws9
         gamg==
X-Forwarded-Encrypted: i=1; AKwUvByGHCY9MVqRZcAnafNRIbT9MeuAO8kQ1gl2M3PAGWGqFVGwsUR9ZJxjt1EGWR/1bJQrl+1YuAE3wdd1YR4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKW9zTK3SzpGEjjbXJ/HV0515TyA5hcfU+j0tXPfLktmMWY4V3X
	Lby5PjLjZuO2o3+345LIH8u7AuJCF512Ddf/ATX8WlOdkjDVDdd14hujyhkUKTioH+hdC00lXOW
	MWQ8E
X-Gm-Gg: AYBFou3aXHY/XmFv82WaUrM12Z0fUqe7ngP/ZgKchzqNLLtZnE8sO3/dz8AbU6aug+c
	7paYRC63gixq8485PeIiyGQMaxoVPaoVHPeGXeeP3Nzq7RK+Cv+X375dd7/CzRvizNfe32sm4SB
	C7XCzFCi4LdGckGsx2zlzDSZ4zpk5sXrAEzVKTc4fJD6lSG2exI1vgHHkWxQ0pgzubETB+GokoX
	XX+9782moKtiFIw24PPw7E0c1ZDxsqsSyLIEJuh0y4gT29sPM5EEnw7cCRaMnLwpkbzE6U1Kjh9
	8gtEeJcYvhjOCfWOupv9cnUEbd5rLlh5vdPgUAdG+OygBBEsBKamOoDIHtqppRPwqXwy8O48fSN
	ONIWqvL+rZRYZhAjTgRI3Z7jtfJzdz9kPPIxq0GzKctrWy1iJpYYI6IUwJ+hBG38U0KputMTlaS
	m8YjbsrlKDq4y1hROw9Y+wFGlBRXqRpoNd6SweObtOGe3x+1jLcOfkY4yltdEj8flcf3m5tgDQa
	qXjnge7jEfo2f2bd33304qEpyE7/x9SJc48KdZa3IY0Yr8xK821UXzlndpC1BdaKe/4fegHwKEv
	TjQQq5bsN1gOrfMgIsA8GsUmnKztA/Y=
X-Received: by 2002:a05:7300:a212:b0:367:a092:3c73 with SMTP id 5a478bee46e88-36a0f81af52mr6190963eec.12.1793163202055;
        Tue, 27 Oct 2026 21:53:22 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2395bee6sm1963997eec.21.2026.10.27.21.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:53:21 -0700 (PDT)
Date: Wed, 28 Oct 2026 10:23:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: virtio: convert to immutable irq_chip
Message-ID: <auF_vjF6f0Y7dBHn@vireshk-B250M-D3H>
References: <20261027-virtio-gpio-irqchip-immutable-v1-1-f64ed13d4567@valla.it>
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
In-Reply-To: <20261027-virtio-gpio-irqchip-immutable-v1-1-f64ed13d4567@valla.it>

On 27-10-26, 13:55, Francesco Valla wrote:
> The kernel has been warning about non-immutable irq_chips for quite some
> time, printing messages such as the following one during initialization:
> 
>   gpio gpiochip6: (virtio2): not an immutable chip, please consider fixing it!
> 
> Convert the gpio-virtio irq_chip to immutable and add the relevant
> helpers. The exposed name is kept the same as before through the
> .irq_print_chip callback.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/gpio/gpio-virtio.c | 41 ++++++++++++++++++++++++++---------------
>  1 file changed, 26 insertions(+), 15 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
