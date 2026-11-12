Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794477737;
	b=m9RtoQyVN7BUkNR+6vBkhILs5P5aJuVvRaoGHKmGp2T6hQ0QsEF6kzqGiH+Uq+Gh2pGS
	 kAck9ez/VsdvYcyCdx69PRius9/1cbmlll/49FdBRiV8+xUtXuyp01LncqMVnlBL1GtDB
	 nwuqnz4UcFpqIlIDIH9/jxWItPSQY8seZjxAmi7QJH45XcArSoPUO2AlLLnopNyX1L/FL
	 uPs/Pg7DelSFvyjXt5W16iFvxsd+I1oHhv5KnxYVo88vE7lWUWUAzWV3LjczD0Im51bvu
	 9gKTqWZcBxt9M5V4836vOGd3FUnx/wKlb9GQLUp31dVGi6Q2fUaaLqxeedGH/n29XCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794477737;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fAJgQGrnDyIs42JcXtisaVGtyeecTwCSDIN2y9VjEI4=;
	b=ypupptV05wHLfcRC9llLJQgvTKsudR/N+5G942U2PBUJJfuVYra/23/KsmuAW2uooqZ6
	 PuIUGLEHYZPi8JZ4xw6AjEliDf7d1dd71s4d4eofpwwe3kcSqXUoq1lKTI3XGv9OrdCat
	 Rk4BcqW2RzjI1Yq07UGXA2jLJwLVrDDfaKdnzei01Vs2uzbXu2lhkFloZsWPqx+srwcXU
	 HZ6knALRwsEhmgcCY2MX58rGMapZUxG1ZtiJd1R/Q70F0scAALIrHYbimGKOTSmr94Iwm
	 k7v6J1TSHAUizV9iEUmATdM/c0AFX6tizf1lqxZUn50K/9nLInVw+/hzl6sPdWWPzFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GVXtq76/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EBA606A31C;
	Thu, 12 Nov 2026 10:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GVXtq76/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6711F00A05;
	Thu, 12 Nov 2026 10:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794477737;
	bh=fAJgQGrnDyIs42JcXtisaVGtyeecTwCSDIN2y9VjEI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GVXtq76/u9xl4SMRCANNQKCkWsHmarDqlIaoymv2vBGdGzzB4GQFDK9tqX465uxf4
	 sdu5VOuR72EOlIl9np9cEcyywPIERWmFXpcXSQTEQkngbVb/SfpBlFv/BhgmxvuJL3
	 BZ5OG8o43CSTkVoWtWt/S5kcKR7I8V/0tPcCRrWiKHX1Blv9qgz2sNhprNOXF502Dg
	 AyJlKYu9WRXqQpO+nqQ5q2ZiiWsDkQgjlPEezPNJ3qjujHJdh19w1U/MFmR0yP9Jyx
	 VKiO7ApjaUnfo0+iNJ1RDB+/hdyTera/zEABABKR0OFDOMdQk2MV2TtbAaxpeBlk2y
	 lWON0jlSLba0A==
Date: Thu, 12 Nov 2026 11:02:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com, 
	gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
Message-ID: <20261112-benevolent-discreet-warthog-1dbf04@quoll>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
 <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com>

On Tue, Nov 10, 2026 at 06:39:02PM +0200, Atanas Filipov wrote:
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sc7280-jpeg-enc
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: Titan top GDSC
> +            - description: CX power domain
> +        power-domain-names:
> +          items:
> +            - const: titan_top
> +            - const: cx
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm8250-jpeg-enc
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: Titan top GDSC
> +            - description: MX power domain
> +            - description: MMCX power domain

CX and MMCX are the same inputs, right? Then make MMCX second, unify the
list at the top-level with minItems and here you only narrow
min/maxItems.

HPG also calls both domains only as MX and CX.


> +        power-domain-names:
> +          items:
> +            - const: titan_top
> +            - const: mx
> +            - const: mmcx
> +
> +additionalProperties: false

Best regards,
Krzysztof

