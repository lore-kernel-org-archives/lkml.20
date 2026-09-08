Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE595237B3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883836; cv=none; b=n6Y28ToBr0PHznb1a3tKmbP7gQb2o7nOwOZIwZHt4Co9QntvqoVtYdeYCQlJT7KjWBT5N7lBIijA3nnfdjui7muIgOUd7oJlpkzAF760vjNUVyU1Bfr7sOCoQjOY3sbMes5sBgDMD5bQ8NSje4jRKBwmnaiN/Oo8ZW9Ks+baee8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883836; c=relaxed/simple;
	bh=Gl+Swk1dn461Tx4EjTwhkpaDP70S6FB1TJLZiQwopO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tEp/3X+5FWNZC4NtVZ0+TRm/DhrI/iXKK7Kv5S869llqa0kuOxkxReok+G81Dr1KdCiTHrUYraGgStyZi3+3PMxYHWah7RPHixVqwp1wXGryBTC4Lq+FOpT50L5MnXg8+t768efjozhVIuyrUgOHPX4C8mLQZ/1ydPUlnhLSmfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNWc5Fnu; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNWc5Fnu"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-85339ed040aso3916728b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883833; x=1789488633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FBzAEPvhV3BtFCxgHkQSHE7fPChGhBuXoruAGzCkmWk=;
        b=hNWc5Fnux8tGT7viaOITZwZdYS0A6iYjMRq8lNUAZEY2zOOZ7NZCKtmqK64jrpI0wb
         gIxCptd6CUR70u33SUHCo8+zcjDmspoVKANabu1JvdFmlUkL9vFlzGCo8QT/IYeQFqn+
         cV3l14NEofDCv+L1IvYVfhSOtDVk9LeBgtuSaivuKNgFmkFcjTTavtq+ETmQnpVtt5A3
         /8YDwMOOjnj8gPdxgrJBvavYTMZqg0EnP6G3Vq7F7j6t1cBZS7CorFZah6BZS4jE+UH8
         PEGNfBhnorIoemxq28Thp0+6JcUMDCrUvTrKFXnN+YRj6yKh/ZQZciGdHrCRtkpd1RdQ
         fxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883833; x=1789488633;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FBzAEPvhV3BtFCxgHkQSHE7fPChGhBuXoruAGzCkmWk=;
        b=BpV8QG0YXv6NW9TXYpDVdpII2tPWApohsvH/TIv5iumxm3JMXHYUlHu0VgdtTL02Ax
         YQJxsdBhZUKN6IHyO0nwCfeN01kFZZCyI+ZkSsU6GYntKO3kGocMAWXsTVk+ZTl6nMVj
         OahfSr9dYT3iaNjMiG3N9+amaXmDghv/YwHsyDLxmeMydmi8qodAqQr9fpz3gZLMmuqI
         +J+uAGojehGFoGjwlSJZmyIjgoxvCgaB+e9je5VVhxqtiRhFbeSlo1ipeD6sEe0JuraP
         1ajVR05wA1PZHW2MhSAeys+7ah+oqzq75uRsUsAs1D9EBm0qx9jGVhXAno4X/bVpXjZH
         3f7A==
X-Forwarded-Encrypted: i=1; AKwUvByZJbNVxVuu3mbsnRNmvKP3bQEY51XgXcRNDQOCPq2ySqRU8TZqwk3iSLU8sRGz8dXZtjgmLEbX5krR8Ew=@vger.kernel.org
X-Gm-Message-State: AFuF++n/g5OVcRipeuezk8NzvooKARll7mu7Ld4cYOxh+QPkpbT5WQw7
	hW8Dsjt8CD/SG/RQAsIEkG0mljSO2N+767DtDtBNLFXA+e2ZONXJvMIH
X-Gm-Gg: AYBFou3tnHiVg2ttGjCNQUzRen4BkFBgsP7nmYMxt0JLxuD+3GohbcUX7Mwscnb8CmN
	EcJUBOigpMG18k1BEMM6oECWRynuz5G0+lD+tCwI2L6XHJaCjT06GxzJhbuvcZ6+J5wprTAE5rg
	hGiFZTi5+tduFyfe1af/+TW3Tc1xqV/VqZLB5f3VFPQu3SJWtlnv+rqFqvJG9NBvKZ52T9iJ8Uf
	yTvpCtolSlnoBBxRGLCBDyzGedNbm8egFq37LOoJhRaIh5n9FhfuKxcWQwHyqpgZMC44r4veiA9
	zmBONTTRG00ezitJyAa8m1ccRB246R8ZX1ziAmJo5IrZ0IwI5kpZSRh7poorI7y9jULebRi2SBh
	GNDuv1QkiPoDcoEYyvhKysvLq/loo097UBOBdLmtquLOByENCJlE1cKFKtcNi5/24Gl7VIk8jgc
	pKn23jiP8kPOcUdL0VyD4htZHNYylT0emidfTmBdnkGdz0MwbpMw3WwkitJR/7biil8Bvf/e/vP
	Sb5ax6vp12G
X-Received: by 2002:a05:6a00:b94:b0:84e:2382:f4f0 with SMTP id d2e1a72fcca58-861660e2f8amr39694011b3a.4.1788883832664;
        Tue, 08 Sep 2026 09:10:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152e39a38sm5766013b3a.39.2026.09.08.09.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:10:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:10:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Carl Lee <carl.lee@amd.com>
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (pmbus/ltc4286) Add writable shunt_resistor
 sysfs attribute
Message-ID: <49b1e36c-32d3-4511-979c-d04b2e80d1b8@roeck-us.net>
References: <20260907-hwmon-pmbus-ltc4286-add-runtime-shunt-resistor-control-v2-1-5f47f7e5a1bb@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-hwmon-pmbus-ltc4286-add-runtime-shunt-resistor-control-v2-1-5f47f7e5a1bb@amd.com>

On Mon, Sep 07, 2026 at 03:58:32PM +0800, Carl Lee wrote:
> The LTC4286/LTC4287 driver uses rsense to scale current and power
> telemetry. rsense is board-specific rather than a fixed device
> characteristic, and may differ across qualified BOM variants using the
> same software image.
> 
> If rsense does not match the installed board configuration, current and
> power readings are mis-scaled.
> 
> Add a writable shunt_resistor sysfs attribute so userspace can update
> the board calibration value after platform identification. Initialize
> rsense from shunt-resistor-micro-ohms as before (or the existing default
> when absent), and validate runtime updates before recalculating the
> current/power scaling coefficients.
> 
> Signed-off-by: Carl Lee <carl.lee@amd.com>

Applied.

Thanks,
Guenter
