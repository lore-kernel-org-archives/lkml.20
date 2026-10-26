Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024572;
	b=torz2ZzbNZduYCXBXXFatX6KDXxWA/s1xjQHWQq4wT8oHKTuPDcrBM2LfR4HArfgaquR
	 V/kditsXtyJXuZUhOAkZ134flyv0cSJ4nNcQ0BepZK/Cd0UK9TN0ahLj9kdc1n0cq7eRm
	 Y/J7v+8XyNVrvEV4hPQRRLekk3NgVPjhyvA7QzWO3m2uYKWVg0i+PmCdL5d8ze77KCFUg
	 GS5QLfGHnVeMsNhxR8zS7LoNwFOXzrcukNGOd9Sfp/echxKzw164BZ+yKoRdj/pwy8UcV
	 ddFUr4YC0U7QPwKwWRz20vNbBpcOjW3pH/vWt59u7kwUEt06O5cGqUtXu5TjbyDhx6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CUSUCiQZP/dAD19/atHYlozTi9sHvSmUJXvcuZQG9Bs=;
	b=1cSjNltKHX+1Bc0OTSgII0yn9FppS0D9BQ8x55jg/tyI6DGsZZWbYR8SDuxx0fSzccmG
	 Qjeof036eD7YS3r+tFNnqtMUuM4gnTmpsWVAv1Hg5RTQRWm/kpashnKsI66uI/KPaClUv
	 CScWwsy/y9ry9HB6aQVgDLPtCRYTLHtqi7Q2tAWN3kMGLuoZ5jOpQGsrDAWOA7KzUIyt+
	 YmUXV/cS6sW932jNeN7UR4hNDzjSQqescJ7ZeUqfTcbT4G/Lj+1d763/M8kuZpO+5FTpB
	 rW8hPWlOvguXnp938hvK71ytUVwQoJCefbP/6FzcHXiDa+MpT6SsR/AapxQuXQqQ5vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C590606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C590606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so1344632a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793024565; x=1793629365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUSUCiQZP/dAD19/atHYlozTi9sHvSmUJXvcuZQG9Bs=;
        b=gKA7taNdAdgVSgQKMxloBx5inx7xUSEgMIOXm7fVi4xaJlAoPHjWyYcVgrGI9QFEjg
         zWC0n4IyLU4eijqnfH9bNYBUc9sdx9thPkqF4yhHyT36cuwWaiJE7D8I862oSB+/Fip+
         N3LZ3ruw7/VJU2VOlWvAIYtfEaISQmvO4IPWmovsopn61xeg1LbCM0KwCM4gdifH+kPf
         TcNlVa7NR/es/BmEywadSxzc16S/2FVhDVVzhn3vlneqbuh41J7MlImCJqzXgqZ61LCj
         6yxfXds9jAmDLaapT/AqFG6OK2w+s1l2bT5T/d+wbTiT/ps+alRkhbZrHBUVfamGlcJ+
         x+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793024565; x=1793629365;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CUSUCiQZP/dAD19/atHYlozTi9sHvSmUJXvcuZQG9Bs=;
        b=HwiA18CZhoFa/hOQTjhcdWzGlvND8Sc5j6DQeaKpDB1xDIExAjRReM93JBohlFDn6/
         tJSzdNod1KJCVQnG6JC0hfIEYnbGjYdp4XUuNu2o0hmFqJ7sl+84CBIXUihXuhqaI2e0
         7vHWh252UXB8RiIHCxSgOoBHZZP6G/HNFhCp3NeTi2gob+oIPr8vTc+x1bha600BANQQ
         DKwVEpQpzE0pqqmAYFfhsX16wUa1cgu1xNAuiGZ1q5/q8obrd7RwS2lhI2VWGRKfpsfc
         EqO2tR1gSRB0WVRuh58dBS6hzXE3w7VGmOr3ApEbvzibd+Mf7owK3i/aOOQexY+EJaIV
         +j5w==
X-Forwarded-Encrypted: i=1; AKwUvBxYCMHdUXMgy1n+SCUsPYFjmC7RITGrJbVyOLW72F0QQVK2DuSsJ0sapWW+ygWEq2af4/fhiZkkAvNe9g8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLh/uSGHg85f+ngi7WYrxZTx9O75twiYpgTQUNkm3f57ZHS8ZdG
	2LQU3xKu2S4c1teGV1eU9nmqP8J3hgfMon6eN+V5iXIzE/alLlk6zybQ
X-Gm-Gg: AYBFou180SgYiijQPz9n0M3xZc6zpan+HgS6XC0IvT7Aea22MVrzWs5dZgt10V1mFRP
	rXjU8J6ZlBJ4PXSThhqrmhPNGqfmy2D9ub5473JnBAE7MGLDGyXy8FSc706lsHBv5irF0MaOMYa
	m3eZ6xVC6I0VJLjkntoiGR9Ope8YWHYiukp6dJdav0Me9bok5GfK5L32q2XyIG9HqI1WrTW6FaC
	BY384bNtDsZnywSm36/xZjTsT1JutMWA8njeZMSj3ysQkfEM8Czbp+0izdZ318EXRYabsZ2XjI8
	TX7zxFCfrsOK7aN+brMD0yxglWUk6i/M2O1ATwkuEuhsHxoWeBJh3aZnHfgg5w1dxq/DrNS6h6t
	uY1ATqcAq3btg2VUK14djBhBBzZuAlHZtWGWhrPTv7QdfXz0dIjcncQTBUps3E+0z1OYs3z7cHH
	Gi5ReiGcS3KixUxfD821wGqiNA4pzKt1wkHi7auf+8Gs07tBv5SG/7BSRo2MHddTgoMvVWpz8nk
	HxQ97acxOB8hoR02DwpaqB8DQSjSxKWTgZfbCEov0zMl1r5TnjGAlsczfWdJR2tQ6IkXJRGMB21
	b+3y0/bW4fBcBKipprykOk4KcdyWNA==
X-Received: by 2002:a05:6a21:e08a:b0:3e1:4fbc:5ce9 with SMTP id adf61e73a8af0-3e7bfa9c559mr4196804637.20.1793024564910;
        Mon, 26 Oct 2026 07:22:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc666d1sm1618155a12.16.2026.10.26.07.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:22:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d8c327b8-3113-4490-83b2-70cf3ccd3224@roeck-us.net>
Date: Mon, 26 Oct 2026 07:22:42 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (pmbus/max20830) Add support for MAX20810,
 MAX20815, LTM4739, LTM4740
To: Carlos Jones Jr <carlosjr.jones@analog.com>,
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261026050241.100428-1-carlosjr.jones@analog.com>
 <20261026050241.100428-3-carlosjr.jones@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261026050241.100428-3-carlosjr.jones@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 10/25/26 22:02, Carlos Jones Jr wrote:
> Add support for additional members of the MAX20830 family:
> - MAX20810: 2.7V-16V input, up to 10A output
> - MAX20815: 2.7V-16V input, up to 15A output
> - LTM4739:  3V-15V input, up to 10A output
> - LTM4740:  3V-15V input, up to 15A output
> 
> The LTM4739 and LTM4740 are the LTM-series equivalents of the MAX20810
> and MAX20815 respectively. All share the MAX20830 PMBus command set and
> telemetry, so no new register handling is required; they are accepted by
> matching their IC_DEVICE_ID.
> 
> The LTM4739 and LTM4740 are uModules built around the MAX20810/MAX20815
> dies and therefore report the die's IC_DEVICE_ID by design: "MAX20810B"
> and "MAX20815B" respectively. Match on those identifiers rather than on
> the module part names.
> 

According to the datasheets, MAX20810 reports "MAX20810", and MAX20815 reports
"MAX20815". I find no reference to the "B" variants on the Analog Web page.

LTM4739, according to its datasheet, reports "LTM4739”, and LTM4740 reports
"LTM4740".

Please explain the discrepancy.

Thanks,
Guenter

