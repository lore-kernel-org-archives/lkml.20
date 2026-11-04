Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793765664;
	b=geeqCoI5sFrhEpHyMzbRstZcA6oes/SJ2m+XXZvXrfVi6nBC794rPXw6hAc1f3R6KmVB
	 3dtCWI/fnNAQVQMi5lPgU1IjUmk7E84gjyQUqZ3AHIyU0Pq1/nrtsjHN6yLWpvKZPrIbT
	 sYTIW/jBrFRJBmqIaYZB74WiVgdIMscQk+yAeECMGxrUp0BD+KZY0SzohhNODdZ/W6Sf3
	 q2AkYkFSlCH9HuKFq2sfXsv47P3b3KiG0bkRb7QiYeMHiW10iAca7VhtmtK8HdRIS1aeo
	 ZogCOIEI7WgKLmfPD7gIH2EjIGNcPjBOXDq+Hv7j4iP+MeYt7GPcRM1h9YQ4z1M7/UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793765664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mo2jrEhx3R1WdZmEd8pAxQMx+AigXmp2SsMuSvDCixU=;
	b=ZXTT2gKBqrE7dY8FWctOg2GyehXCIbsuy/Tgi01QaBpJWXWr8B7wxcAvaEFhCEzNVrUY
	 K76PH5n5m09RHADkRs/ie7+53WAKFwrHn/SdDPGNAoH7rarVFvPhqIOvPGVpDBF7NKPsy
	 G2BlcZYSW+4th+sAOfMJI1rAzKUKQt4EVKweYUk735r6vOx96sxm0RKAerSyJnMu06wma
	 2vdaQa1URiYXX0OvX1nlAVthGVoadHuGiA0Pe+RiEU2gmMmFGnsU0G2kxEm6j0vpB9WWS
	 ZKKVDWGErNpq3SGy2T5iRYaGdB1uItFIpPA4YnIOIoUx4fmLVPXZqmkP34K1QJxhZLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="bzqQDg/l";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC43606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABC43606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bzqQDg/l
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35b2c599f43so536364eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793765663; x=1794370463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mo2jrEhx3R1WdZmEd8pAxQMx+AigXmp2SsMuSvDCixU=;
        b=bzqQDg/lMGz6dfQ7rqjvLLWKj2SVqN8Lq9OKxulhAav2LnwZYXQdZpmC6NjI+BM7Fc
         mX2vXoYj+74+aTstbYN3ykK+SGEgJxP5l/cLySrg2TF05mjSHi/lgG5TsqZFgdvcPknE
         sBQzJOhoL1hBrSbDU4FFMijklZCS/vu66Xs8KZI0aSwRXVub/X9SR+frX5Z4xo1FVswG
         mfqBe4+jA0PESCQGHJDnisxP+vAV43qNDlMjuIHTuHXNTlC2hFXuaVUuRNVWp0kBQ7+w
         abaR+5oODDc3xKrGLv3pPVJavBHsG5mGZQgtCKl6D3pVWEXued21+12lul+RJEgZWYWj
         TiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793765663; x=1794370463;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mo2jrEhx3R1WdZmEd8pAxQMx+AigXmp2SsMuSvDCixU=;
        b=zLbN4jMVCKH409CdbkNSiI/RxDYWaPbeicTQw/jwMosJeRIM7zex3Apivm3PwPtGSC
         UVibKFbb62mM82+XqZvJtkCzjpfZNVcxS9mVUz1Eosqm0cAomaz60BLExF2bO9OI1Eb2
         MRfTodlNIV39aJUMVUk/VC5xSDP0cvyPce+WMj2+AjyS3/vR1cFg2YQZ8//uZ6WopKqQ
         i5rTdmn3g3a5YTvu6gpcZ7rPP32ynL5Do7nQqau366TosBnMuhX2K7pXBlOztziYGvXC
         znpfNCD6N6j84wqYR9qsJO7ftzFh7JCF6gnWY6h4JH68Cg/eZaw6Lck17S+CyBQjH4HD
         96bA==
X-Forwarded-Encrypted: i=1; AKwUvBwMLOu7jqaMxKvu5iTHpMeCZdKhmyN+k4xKDSh4fgC+25LnifnM3z2/GMnggnlM+LFRaJ+yZu/MeqJRGwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ID+Ih0JCMHmMzVpCuTc7nSfy5MkIvJ0De98Z1ZPjLn1I8u/Ie
	aNlXLEstB8r8pttsZ7r1H7xNmqy6PfFqoFxfaJvyApwGY8/JvRjnG65tFKqHNv2TW7E=
X-Gm-Gg: AYBFou3XpXyn5yUdksbfX6ack9rCUGIOyhkUCEtFckDXEiSk5087JIqFk4HdApsudOb
	jdEh6m6TYQyDjuOG598ZRUD5Um16sYKwSBmCVnfnSueRenilIi6mOai8c5+bKm/CmS5RzS4WaQX
	yO4tE+h4v3e2/PNi8/KHaxWbSnH3EUdE0ZUN5UwRZuVDU7A7n0B52NdMsJGYi2/Ey1iSbQPwo6W
	enGhU4FJ+doDSQ5jz4lqvI1GqY9PHz/3yhSHaTP0V2Icmtqj90+P7pDzqO6NW1j//w50nZ1L53o
	kjclHqZRUxSj35T1rCiPgpnPZGKZ6adt28dxGsP5E4YKavoQA4uogJkOWYnoivBbw71T7Cm1S4H
	o0KdUOwUh8VG0zT4pbRFWwH5tS4Xj1Ived4sf+7yM8fs3P3kgQhXg1FCk61jecl/TrENak3TyaI
	LhPW7Q9a1IAOZeJg9twT51JuGfa//E6uRkK+r/GJ5SdQzs01N9SuT5LT8CHk/PsW44jOPld/J4S
	oGImHzqQLZKbl036SMgy95HXX28xJzuuiqHF37SHvbcWWtOBmnXpikcosrd3LJg3srnD38Fvy6c
	ahxBdj6xfD0eLyecIuT2/CmQhpSFkA==
X-Received: by 2002:a05:693c:6316:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-36a7bb74690mr6683187eec.34.1793765662314;
        Tue, 03 Nov 2026 20:14:22 -0800 (PST)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca394f297sm3541017eec.21.2026.11.03.20.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 20:14:21 -0800 (PST)
Date: Wed, 4 Nov 2026 09:44:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: opp: Allow 'clock-latency' with dynamically
 populated OPPs
Message-ID: <auqxGmYmQpWVXNeC@vireshk-B250M-D3H>
References: <20261103224538.877008-1-robh@kernel.org>
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
In-Reply-To: <20261103224538.877008-1-robh@kernel.org>

On 03-11-26, 16:45, Rob Herring (Arm) wrote:
> Tegra210 builds its CPU OPP table at runtime from fuse-derived process
> and speedo values and built-in CVB coefficients. Its CPU node therefore
> has clock-latency without a static operating-points property. The OPP
> core still reads that latency when initializing the table.
> 
> Fixes: 80728bfa8c79 ("dt-bindings: arm/cpus: Add missing properties")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/opp/opp-v1.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/opp/opp-v1.yaml b/Documentation/devicetree/bindings/opp/opp-v1.yaml
> index 61c080e50859..3dca8f7f146d 100644
> --- a/Documentation/devicetree/bindings/opp/opp-v1.yaml
> +++ b/Documentation/devicetree/bindings/opp/opp-v1.yaml
> @@ -24,7 +24,8 @@ properties:
>    clock-latency:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> -      The latency in nanoseconds for clock changes. Use OPP tables for new
> +      The latency in nanoseconds for clock changes. This also applies when
> +      operating points are populated dynamically. Use OPP tables for new
>        designs instead.
>  
>    voltage-tolerance:
> @@ -41,7 +42,6 @@ properties:
>          - description: Voltage for OPP in uV
>  
>  dependencies:
> -  clock-latency: [ operating-points ]
>    voltage-tolerance: [ operating-points ]
>  
>  additionalProperties: true

Applied. Thanks.

-- 
viresh
