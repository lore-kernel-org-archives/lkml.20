Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26BD3F4DE0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790807087; cv=none; b=Iw3korNS8OKPNFm0bWm44hk5fnkWRpd6UXS4QDOFoXBoDqXRSi+qPLmsaxgKeWiMUxMq3YJKJBfvQQ7oOMUmYbsbDL65js4iny+ukIvxg21SCxcKnCcYFIbDi/xuhoa1GkmFWySzTioFp2vhoSuR6KF74nL5QyI3RffCoWKfJ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790807087; c=relaxed/simple;
	bh=v4299bNl+lAPOB6/3VYr1Qulsb87AFZNEFsdu+iXIIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=heOs7KZyDsIOH9oogWlVqc+t0PA7C4MlxKMFQdSWhRFr9H2KE27O5Vq9VvtivS1oDIgpSSenZmzuVtiY4QQV0FdTtIwygmGtF4/ryOejtb/lhDBIbcByyD/9VS3ZthBR/3Tzx+iW0ocuDwSy4DlC1FVs0RoNrQC06SmdQbXglk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rz7JdNCD; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rz7JdNCD"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d90ba1d807so45924935ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790807085; x=1791411885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UqD2onkoNKbwoz5eLcMSO+ts9RQq0wVH4NJCZCES+ns=;
        b=rz7JdNCDG8mxKKfOq8WAE4Dy9A5cDzDiIUl0kDifDV8Auca745O1ubZRkh3eEFCt0F
         5xQtSXwU+oae1fzuq7MjSfqU0a1RIYPWGi7gMv9oN2gCbnjHWKTKSVXeFr719Vh1pJ+o
         Tul3G4qRhzGFFok7TEuREBSXk5thPF6ZIUoQpcRODKrBDkA48ieC9iEgjUS8Jl5oSI0g
         c3zykUVwscJFArAiK97PDmhKGRNozh7I5wyXUrgtlzuAYQwRKmcTiJI9JUHSSODHcuRf
         GidZPmFpNI+CmWym2gPQSUbMXJrJiS9LFyzFtJtVVb71lBhOLeERfx7M+4uTf3Lpc6Gg
         CnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790807085; x=1791411885;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UqD2onkoNKbwoz5eLcMSO+ts9RQq0wVH4NJCZCES+ns=;
        b=h7f5Njxz9xpNj0g3vv2tQvKTAEOSniAZrTnUcWBjpi70+L8WxyktJ3mkqD7A1MtSsW
         rzicVpwUlUwaSCzWZ3KW82iESxwHycOgW8PVFbDPGsiy/UEM2ERnzcFmnNbm6HiedVdU
         FFL57R3+zpF18WC3X4Gsp0MJUjmPkOSMl6usK1/U9SCuexarMqWEjEdpG+roJhh15JfP
         EpPMLfKMXmupj5cAbQ0nXa23J127rPoprjBJIu9jLmbMKZ71zIT8/7CfIYGoAH5R4epu
         CgkcCwKZVzV7GPB1LeGOUi6XBLLIYyIYiUkFRpe316+zAN6EpWOnbFe/np/UOPigyS3S
         gSWw==
X-Forwarded-Encrypted: i=1; AKwUvByikAO5s+tqFnvYwKwMvmIjc61Cgt6nqEjchgheQRByaZwW5zAs6w/Zi2gON0pWwoViypju5JiakUFzP5s=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3ftyjIVCDxs23btQPE65+/UyXNgMiiINhQHSjgnMnNMD8ddCX
	EQg7RzG5JhhtQPC8vpCaGRi3XHpRasEuHFnr/1yp3q9mB7Rbzw8hmLiMKXR6qqtN
X-Gm-Gg: AYBFou2/pBkthHv/Whg33lW92RHF5mO+7Jc9x/Y5z803WaOjpK5q8K1Z1hGBaMBFvD2
	CBsfbKZ5jIpPSLJR3AvEFLolJBXz/Zqg8rvMeCErlLekxcZNHpVjbzLyQTOlfQ5+yjAtlAaBgaG
	s15whFQTorRCdLKObkCxu+mBCbG67fHcJlvIfwIbRzL0JQamT+vC4+UEhiygKLfiwnmc82I30g3
	9OxogUZg6JtZk3EkcZvhyGn2s9NMMFfZxqga9VLWwaCezN6yfUoH4yA9GDIBe/Tv7hyoWV22V+v
	IdLiXwO3+Eusd0u14uysK7en4y4734jSuHi0Pn0tD+Bl8crjPNyxKy4FoLdo0NTIURL3AIsOqem
	anNxZP18tu2+atTIU4lt7wTWM2yKHPHx/AXpLHl2ybkdeVFrxMsSKcHyZWIGyc9kN3FldmxRVZB
	dO8MGEeQ6Hxni8f82iNYBMXgP5psop46SeWZ02ksjrmYKf78SD2PKibOrkM6LoLfa78djPeyIs0
	bogfJWQM7x8F5R4ZjFBpc4=
X-Received: by 2002:a17:903:1a27:b0:2e2:f1f8:42bb with SMTP id d9443c01a7336-2e2f1f89acfmr13956375ad.54.1790807085027;
        Wed, 30 Sep 2026 15:24:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b90719sm2510425ad.84.2026.09.30.15.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 15:24:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 30 Sep 2026 15:24:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: pmbus: mps,mpq8785: add
 #thermal-sensor-cells
Message-ID: <37298c5b-aa6b-473a-8e22-d29ddec12c04@roeck-us.net>
References: <20260930-for-upstream-dt-mpq8785-thermal-sensor-cells-v1-1-6573c765eef8@free.fr>
 <20260930140721.E066D1F0089D@smtp.kernel.org>
 <ar1Gj2XVOCEjUY0l@L20747.iliad.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar1Gj2XVOCEjUY0l@L20747.iliad.fr>

On Wed, Sep 30, 2026 at 07:27:43PM +0200, Vincent Jardin wrote:
> Hi Guenter,
> 
> On Wed, Sep 30, 2026 at 02:07:21PM +0000, sashiko-bot@kernel.org wrote:
> > [Severity: Medium]
> > Is it correct to set the cell count constraint to 1 for this hardware?
> >
> > The Devicetree specification generally mandates that single-sensor devices
> > use a cell count of 0, as no index is needed to identify the sensor. By
> > forcing this to 1, it appears we might be baking a Linux-specific driver
> > quirk (the PMBus core's internal 1-based index) into the OS-agnostic
> > hardware description ABI.
> 
> M. Bot has a point, and it is a PMBus core question, so I would like
> your view before a v2 of this binding.
> 
> Since the commit
>   3aa74796cfd0 ("hwmon: (pmbus) Register with thermal for PSC_TEMPERATURE")
> pmbus_core registers each temperature input using its hwmon index as the
> sensor id, so temp1 is sensor 1.
> 
> The hwmon core counts from 0 instead:
> for example temp1 is sensor 0 for jc42, tmp401, lm90 or adt7470.
> 
> With the 1 based id, a single-sensor PMBus device cannot use
> #thermal-sensor-cells = <0>: thermal_of matches a phandle without
> cells as id 0, and no PMBus sensor has id 0. That is why this patch
> uses const 1.
> 
> No current DTS references a PMBus device from a thermal zone, and no
> PMBus binding allows #thermal-sensor-cells yet.
> 
> Aligning PMBus on the hwmon core would mean:
> 
> drivers/hwmon/pmbus/pmbus_core.c
> static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
>   ...
>  	if (class == PSC_TEMPERATURE && strcmp(type, "input") == 0)
> -		pmbus_thermal_add_sensor(data, sensor, seq);
> +		pmbus_thermal_add_sensor(data, sensor, seq - 1);
> 
>  	return sensor;
>  }
> 
> 
> If you agree, I will send it, with a v2 of this binding using
> const: 0, since each device of mps,mpq8785.yaml has a
> single temperature input. Otherwise, we should keep const 1.
> 

Yes, that is a bug. Please send a patch. I'd prefer the index
to be handled in the call to devm_thermal_of_zone_register(),
though, with an added comment explaining that the temperature sensor
index in the PMBus core starts with 1 and the thermal core expects
a 0-based index.

Thanks,
Guenter
