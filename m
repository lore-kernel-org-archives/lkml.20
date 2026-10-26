Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792976508;
	b=Jt6JRymg1gVK+cDLMDE/o3fD6CWkvUGgs0BJquqGAL8/2PhYTmBFSwVWFg6wEN1invgE
	 1BWbHkO7bTnVek/NHzS57ob4hp0LiVQ4tKUkZcZ0fZAWxxJ+2DIRuOeHR8EF3NTLZ1314
	 gXNc0AcGEkAjQMYGItqOImju3jL19uWgxq8NABbNQG55AbT/oj17ZUIPdMgb2HPEz19YN
	 q/9F71WJHazl5YDay4ozo5pTwHBxUNhO6wadkjjrLbkmQUNZqInKB28M7oVFj0/auga+r
	 pop5IZUO9H51CJIVplV62UCEbg0tVe+KVbD1YJaDxFow83cAImGs68IUf/k19Ildq9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792976508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VeZPXDm0RhtGiOKTO2xKl1A3KDZM7VNOTwEX394Zg9c=;
	b=NVHR5f3P1NoiSCVcnVsRhRerxkgskhRCYVSLANrltm/m8tQW8Yqrj2oXmYel1JFIs8nG
	 DaREnF7lPz205Jr0stYbMhabv+RvsAE89GAmHiukZBZQU9X5o3gQUNI7IjtrxPUSDtLAx
	 ISeKhZbKxGMwq4oi+Cd5Zhdhe9SRkW8ooPgzvSdrXXuDrefJeSeGGG/rXuIgDqiFCeH17
	 as7+/3MrdLY+CMIaLZEAgeVNaJjFVl2h6PmFe5d0rk/iLBewCv1RC9eKMmfe/pef9W+IO
	 y8k8PnAx01ThYqT+fQPULRQCDxWpdJZJF1gaWh+hMtZQmTq8CUZu/hBAxaQO6Z3EgqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kesbnkBJ;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFD4606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFFD4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kesbnkBJ
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a07025cce4so1521788b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792976507; x=1793581307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VeZPXDm0RhtGiOKTO2xKl1A3KDZM7VNOTwEX394Zg9c=;
        b=kesbnkBJUvYzphCkzZljvgMUBw1E06XWOAD40PUeR5WSEw8f5QOb5oeqUFKJDCRJG9
         yhVF178AgwImYtHmpAEKXvHVphu1ZGmSWSRrsYI2ORSd0HLi1vPcAMQwnSGS16lHAlSf
         MYY2DGatfnLI75aO0EyiUmHgyzBzkJIg4iVMaTGSJ+bXC/6dCt8oBdnUkVPQSPjiTM8p
         X0viSroGrckqS+rov3CRMIaaZ0HIdYA3aQunn68nZT2xkedbzpO8zq/aLIhN5KirLjT5
         9rTyCnqnrA47T9HlUgzymCDyhYr3Xz6Nbn4AiwYE8KRLk6olcMMrC0W4/71LGf3zwL55
         jvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792976507; x=1793581307;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VeZPXDm0RhtGiOKTO2xKl1A3KDZM7VNOTwEX394Zg9c=;
        b=z1yZzaKu04OjUX/M09g7mWp97pnyxlQgYEc/+4v9YtbrYWZV5plRa04PkTCN/dpMjn
         q+KYQl/0GmKagN7Q6SqTorbD1HE5EGX0Bl74LcHgKYfPMpnQ/RrPzjsCuLPKVXH6j81l
         KRgM0Fl/NUazWOacwLROF9MChNqtDD5LMiEMQ46sOWhANdSW9GJcNxb8cEEXe0VHeN27
         mK3V0x5jms9dchnY5wdOYDEL3SRi9TWexJgYLgiRd84Fm9tJSVz6U//cBe+obSH5OoGH
         /RJxRf/fIF0HlTVTmgYmanUG2pgSS2rKpjSHmvsp2UHKgpr5ne7hLEtN/QZQXh81EAQ2
         79rA==
X-Forwarded-Encrypted: i=1; AKwUvBwM74IvxyF9KbAKiPb3MqAIp6V8FUvj7h6KxvEHXPMjM/W6kScOu0VrrS1705qqbP4g6yQEx6wJok8Ui0c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOSQpV9OHRb8lQoSqJzay77p4nMwdr7bdEMFVPt74XCIQ/XUDQ
	2oVYLNJp87jiyEsC0zALSqHUP8eTYJUCBi3ZZNfQSmlVhaTKZ2LbDniTV8C8Wg==
X-Gm-Gg: AYBFou2PUfBMVmNl161bFnOfJx8uYX9WOiAqR0oZe3798SsDfahjVkO2OZrHcAj+l5e
	mgECddYkWnV2dbhsHJ8xdRozbKpZ928KJgqXQnqRmVrTSBys8uoXdP8WxHO23QMs5oMge/QSCda
	XSQxEu1vXFpXG4ws6G6xx6eqUtuWTzgBq3Wd/JMvbCPTOZNsOgiM+cELqIPvjj8/ylraj/J3JrE
	xCO8YZe9hhJrRpOR6Wxj7TWdzEanPPZFmNIsFqc4JDT8gmUtlY1My+jMjpLRDywVHcEONef5D0n
	CGNBj/maPySo/EVWMEgj1p4CNvtIbRy/E/6FgQdKRGTvDwAtVnXFTQhjFIe7h/4/VTikJH31rlC
	PbbncLbpTq15rtafbkTdKlVQhDkjidmse+/h0Hp12mLe3Dq2Fit64gkmz40mmuzen3lTVck2ukP
	Nq3FuNcz+yTvqSj2dY+5pu9L7ZCJu5iIrH2V8rPqdmDSqQIo0p3wh6ghpAjY5tOwdnyLnnQ9r6h
	JMmfBsnOltifvqXFEXHPRbQrtLHnVtJy1Pw+9E73jmtLJ3nkEcf+b3OXiMJTER9m8br7Rarf/it
	kIL5ozCd6mU3w20=
X-Received: by 2002:a05:6a00:2e9b:b0:89f:6989:cb9b with SMTP id d2e1a72fcca58-8a3686bf26cmr4112884b3a.27.1792976507110;
        Sun, 25 Oct 2026 18:01:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c4e8616sm830722b3a.56.2026.10.25.18.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:01:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 18:01:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	Eduardo Valentin <eduval@amazon.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: hwmon: pmbus: mps,mpq8785: add
 #thermal-sensor-cells
Message-ID: <cee14239-74f2-4fc7-8122-cd1df1dfbf84@roeck-us.net>
References: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr>
 <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-2-bfafba9fcc95@free.fr>
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
In-Reply-To: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-2-bfafba9fcc95@free.fr>

On Thu, Oct 01, 2026 at 11:47:40PM +0200, Vincent Jardin wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> Each device of this binding has a single temperature sensor: the
> internal sensor of its die, which the device also uses for its
> over-temperature protection. It is read over PMBus with
> READ_TEMPERATURE_1 (8Dh). The sensor is internal, not an input:
> none of these devices has a pin for an external temperature sensor.
> 
> Allow a thermal zone to use the device as its sensor, to monitor the
> regulator's temperature. With a single sensor per device, no cell is
> needed.
> 
> The MPM82504 has four channels, each with its own PMBus address set by
> its own ADDR pin, so each channel is described by its own node.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
