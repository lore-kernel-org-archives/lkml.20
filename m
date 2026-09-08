Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E34560AA9
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883193; cv=none; b=ezsOQ2QUE2GHrHflzBSlJ8oJVBHCnxT54zqS1AyqHARfryDgoTwqlTP6HucXR/KsOpXHmyvR3krrtII3qzIeZq0z6qJzs27UB2FOqqYpxoYr52eR2I8QkCIrUHNUeQdE/+cdMEOa47dm/QBp0mJpIGhnSHd0mJY4oCDQlk8TTx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883193; c=relaxed/simple;
	bh=DPLLTBlulGDAXkVChW8w3cSATEMr3BsPlC4aCTDP18o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbW53VHGeqXc9/SZJu8az2UcxY10uduK/2urVtJBk18r2SQZ/7PEDOdzYv6E/JYtR2yQvo4b4FqPAfyqqVQmU6LrNNDaE8n7Xr6WRQQJMSC7o4RQcpDh8zR8C1cjIwlnT5sguPkM0OI2MLIy4NSOFLSd/OgDhmkDkgzGY+cXjoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzDVu04X; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzDVu04X"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d5cad1a6baso43584435ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883191; x=1789487991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r/mir+2iQlJTvdPnCuP61g/f1Ie0oQVHQNrLp619CMw=;
        b=gzDVu04XIMON+YuzIfoXoYKmcl5BNCHrze45Z48VKWqSRK7CJs6FCEzohQqtdjuHLJ
         iKKFdZKQDUMR3Q7t6a37/bFp+cygYXVPjKlvsFFeIPBYrIwHAQCUUQFGCKZ+QHY9qLcr
         q6FdcDpiLfeIouzUevBs0gsEHDjQ4ekT3DG+bD2Uq7je1xtdnUBQQyMPBvH92wCOxMnp
         aejofaxzglzGlEMewrbvVn7xStooguUQ6eQpLHAES/+/q7heL5+szLtYrh5qxwMX/hWW
         YU+KcDY8fIzK2WrfcZzaKap32WNtsxjJu83V4cQGgn8XnrJOlCVgxlFFX/eod2MtoueV
         wvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883191; x=1789487991;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r/mir+2iQlJTvdPnCuP61g/f1Ie0oQVHQNrLp619CMw=;
        b=FXKNPwYKK10Oz5iyz7ebsYtyTzpXh7yc8avIP2Z7exOEvisStPsCvUVwSS1cnW3rvf
         f2xddjKVOCj1iOcaoMGT1R26a695bh7D1C+mrjBizEEZzzDE6ZWKgG+mJIa44BeoPeh8
         yiSe4HM1KwjkVGCZ9hkj/WuF8mSQ91PLpw6stM3HmbTtyKzDN6xZJKUmgiis7nPjxLTj
         MEzHz+3Fpmf39FnhZoFrN3T/vPZS0KHf3NCUVrJQFy+LLkfnjKkrOa0qW6Qf16pm8p4t
         ZfY1ZfskeTU21OA0RBs23PUj7WsYgBxfU5FjQSyUyX86TeUXJKhzTPik7tw15FWwmSHk
         1u1A==
X-Forwarded-Encrypted: i=1; AKwUvByybBxewC5bhcf5dwjUxBcVfaocvLjXbrVOZptfikVpU0xmW3xaS/ymLCPt9uETBDBqNAFi5iESGRu7Xjg=@vger.kernel.org
X-Gm-Message-State: AFuF++n9Jd7UyKp+pjtGg/qGf/twgi8g7zFu5TCwHdiElMr7VIiCrUuo
	BeCrGjQp7LQzCD54DFaSgrmOtGK/5Vo1L623Vm266tdSzyZd69VvoeYx
X-Gm-Gg: AYBFou1NAGDopb+pa+08GZuQt8NeWlJEJYGiaShdCIsBtHedCq+EHgT466qjZnp/ViT
	Z+E2cuC3evgSxPkSJswlqwf4t/BYXxO141CGubjno4hqd3o69ME2fG558o7pLKSp1MN7UaTw22U
	Vhxdp0brFg85RQ9If9H7E9459lWNVPlD2cerQEdlV+vYK5q1DgF0aeysTaeN25PMs4qlXSCJ1+F
	/4w7CQIj39XjVvsbiR9c+OpjRAciFiBPUR91M82CosjdFJcy1dpmjYl6Z4ZB66WqP6vSLwQFpeF
	9FZ7469RNJrc5IBrOGrNr/IruC9+Pob4GKaUBIZ8jHZfZsO/2z0YvYHOL3HmdGMB89vNe3jSGMR
	pzskzql5gZMsem2a6F2bStCuBqwcGOzTt0Hqgcek2D2ljcxehXyoSLNLguke+jkbmDrFFK4ElhO
	ZM7uQngG2Xf7FhE60bwU2xFcjpreHcFPxabxjnmN9z0r0xRGdehQ6pqbMEXZONNw27A5JaBziVL
	w==
X-Received: by 2002:a17:903:2acc:b0:2db:5f8c:b81c with SMTP id d9443c01a7336-2db5f8cca7emr181466235ad.19.1788883190782;
        Tue, 08 Sep 2026 08:59:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db2bbcc0c5sm47712845ad.53.2026.09.08.08.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:59:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 08:59:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: hwmon: ti,tmp401: add
 #thermal-sensor-cells
Message-ID: <ed1b1e90-5201-4374-8152-9663dfb4ec5d@roeck-us.net>
References: <20260902-for-upstream-dt-tmp401-vcc-tsc-v3-1-49c484d2f08b@free.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902-for-upstream-dt-tmp401-vcc-tsc-v3-1-49c484d2f08b@free.fr>

On Wed, Sep 02, 2026 at 03:54:00AM +0200, Vincent Jardin wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> Since commit
>   a3b61ba2558e ("hwmon: (tmp401) register with thermal subsystem")
> the driver sets HWMON_C_REGISTER_TZ, so the hwmon core calls
> devm_thermal_of_zone_register() for every temperature channel and the
> device can be referenced as a thermal sensor.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

> ---
> Changes in v3:
> - Rewrite the commit message: justify the property from the driver,
>   which sets HWMON_C_REGISTER_TZ since a3b61ba2558e
>   (Krzysztof Kozlowski)
> - Keep "const: 1": every chip in this binding has at least two
>   temperature channels, see national,lm90.yaml
> - No change to the diff/code
> - Link to v2: https://lore.kernel.org/r/20260825-for-upstream-dt-tmp401-vcc-tsc-v2-1-cbc360ec51d9@free.fr
> 
> Changes in v2:
> - Drop vcc-supply: tmp401.c has no regulator code, every hwmon binding
>   that declares vcc-supply today has a driver consuming it, so declaring it
>   as description only does not belong to this patch (Sashiko)
> - Adapt the commit message
> - Link to v1: https://lore.kernel.org/r/20260824-for-upstream-dt-tmp401-vcc-tsc-v1-1-ecb5ef7898bd@free.fr
> ---
>  Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> 
> ---
> base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04
> change-id: 20260824-for-upstream-dt-tmp401-vcc-tsc-a16bec8352e4
> 
> Best regards,
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
> index 0e8ddf0ad7890..f283b567d5b6c 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp401.yaml
> @@ -50,6 +50,9 @@ properties:
>      minimum: 0
>      maximum: 15
>  
> +  "#thermal-sensor-cells":
> +    const: 1
> +
>  allOf:
>    - if:
>        properties:
