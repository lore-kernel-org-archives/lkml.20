Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF55638E5DF
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272975; cv=none; b=XWmsn6gKW4Gfjh/q4KF2L/lnbZQmwH8wDGbfukPeueZQ8tFdcm9k5/SaG2sgqSIBIjsMRiNactUZooJBBlrA6PhdRkiwIjxpqi8gauOwWLghNqQmH1tU6Q+vOpNgpCyqu4qMzE/9N9UjgENcJVLLw5o2r+6IDA3BNLuY1X4hfDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272975; c=relaxed/simple;
	bh=rNOLGxfFn7Qvml8kNLPG9u9UQGIqD8Swb2q+N85bW+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lNZIS8os9bZoZPWd+LfS9X1+ReOuIgj7pfwE7c5ifX2NOhYsf2XVxXa7l4sAPHu152Z/SZFFHC2EqyFLpZ9ePXOS2XdqQEHNFZn2gKoS/Wi6vEeH/12dabzj68XIhURURS2Mm735Ztxkk9MATuAsH/bZYQldfth/8iomVP2vka0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnGjm3cd; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnGjm3cd"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469d249c6so1179675b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272973; x=1789877773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyVHM8u7HMPgnwIbEYmNF2RMu8EpZx7YE/N3umyngf0=;
        b=ZnGjm3cdEnPWSImeZbJ5C6SBMtfr18cWXC9Tv0Em0nr030Dz/cULQY65DISGgoRMeX
         hq6Ov3hJ5Cu8odyTWbMGEPTHR92JMembC67OqN4xwx62NnzrFOExan3A060OBmrkYCzg
         Vpd/9Soi6iwD4ZTyq16EGB80nlaNQqP/3HUxy1BXCoEpxcjASopGy+iwLRNO8vYVZ26l
         pTkien5IxgW5YzS9k/X4nFxi6stGN5hWsPhy0pKsziLSjpAf7IKK5ASVXFmN0dgyFqwC
         ABFp1eKtOAqzp/Ja3QlRNx2O8lX1VNdLy5qBexK/1uB0UZgVDsNtIkzkCuzZcnn3q1Wr
         Q81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272973; x=1789877773;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iyVHM8u7HMPgnwIbEYmNF2RMu8EpZx7YE/N3umyngf0=;
        b=kkUX5FyW4FWpN5s/MSOd7dIuoDxFGmYOXi+MUbXQh39GIisMTjiS/gyK9I2BxZSE+3
         fPFw3gzd2CRipJGzmFQlJ8jKdW1OLaxEkQNwynsDBi7X3XORUq3dN9z7iHOO78z6H8kT
         34qK3RdWTOjCWzRsI0e99ju1Y6E58ApJo+UoA8aIc1gt/breJA+kskFDkVIM7gyKJ+Zw
         mx+WGUBcoWjDmmSuoeNDrVv17h6BxNxkIOpIVGL3xaD51BvnfhjklpYm55Ye+IDY6TYk
         kvy/RXgqBx3T1G5hbHAe4JNYqyGD1bWRjXol3Y561OxgzUuNyloSGa5WhbiuJNHhs4b7
         yRIw==
X-Forwarded-Encrypted: i=1; AKwUvBzZZj2mUJpQfP+/Ad/hmVqeg6+mZB57SyQiY61Rob3PMBKG2rIH5cwPeKNRJifbW/7q1UVPwYBjJS4+j+M=@vger.kernel.org
X-Gm-Message-State: AFuF++mGBxf3p6eV9uy9lIv7tq3fzykeud+i6hGgFeUa5nvsZTmatSyX
	06R7WTAeWCDAlK5LPH+49mtC/oyrtmB7nhsNdXIHrDLnV95hogdPMcvx
X-Gm-Gg: AYBFou1aIsaS9MJpSykj6EA7jdYchIUakPO6haWWCXfNqDDlBnuSjctdAfkffsPKDwn
	AscfpIymfGTpN7VDRjjqazHis0eLRv1dp1VXYEh8DURoq/vW/NVPtsKYxqrFs7O0Ikz/DLCbY4c
	PPd9JgO9CqaP6IUoZlijkAooZ3/ba7RIKIOhgBJpgkvbBXonDVJVc4a72aVc6Z+qbGIAZc5Ih8g
	9FR0CKUm8sr8EHnSyMwnOowAyC5MG3CAyFMY8RvReXLqav6BauRKoTXlzXYyNy9uK/eBvQtZjxR
	4icg3Ouqshkvi3EEv2CE3uxZQOK3NtcPUB+raP3wP6Lw1Gamolf/LQw8aEBQTw4jabVmcWb1mTT
	xDU2enxwiVI2xPPLpcijNQGjQtcWszAQEAiaYjtHcHo0m/dRolAnBZXAN8QEcPw83y89bUGbfAr
	QTqkl2wGibRnln+OZ7pgFiPsxL1Bh8yBTZqcqCE4goJOdEFLwZVtgveprXBAQSCUF8brf/A1YiW
	q1TZ0ZfGZI8Dy7/LUgSFHhiPDCMc8oDIaVrQmL4WhQsZuCdrnNS8g3HasJA
X-Received: by 2002:a05:6a20:3ca7:b0:3c3:791e:5e18 with SMTP id adf61e73a8af0-3daed16281bmr23388505637.7.1789272973145;
        Sat, 12 Sep 2026 21:16:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fb3ddasm15274832eec.30.2026.09.12.21.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 21:16:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <eefdb261-49d7-42dd-9ec8-850789852bec@roeck-us.net>
Date: Sat, 12 Sep 2026 21:16:11 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] hwmon: (peci/dimmtemp) Add support for Granite
 Rapids (GNR)
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Iwona Winiarska <iwona.winiarska@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
 <20260903133408.110847-7-changhuang.liang@starfivetech.com>
 <c89f582d-57fe-40d5-835b-5e5ce38daccb@roeck-us.net>
 <ZQ4PR01MB1202109A402BBFDAD908C08EF2BC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <ZQ4PR01MB1202109A402BBFDAD908C08EF2BC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/26 21:07, Changhuang Liang wrote:
> Hi, Guenter
> 
> Thanks for the review.
> 
>> On 9/3/26 06:34, Changhuang Liang wrote:
>>> Add support for Granite Rapids (GNR) platform in PECI DIMM temperature
>>> monitoring driver.
>>>
>>> The GNR platform has different DIMM topology from previous
>>> generations, with 12 channel ranks (CHAN_RANK_MAX_ON_GNR) and 2
>> DIMM
>>> indexes per channel. Define these new constants and update
>>> CHAN_RANK_MAX to use the GNR value since it represents the maximum
>>> across all supported platforms.
>>>
>>> I am not sure whether it differs from previous models, but on GNR,
>>> requests to read DIMM temperature thresholds (DIMM_TEMP_MAX/
>>> DIMM_TEMP_CRIT) via PECI are rejected with completion code 0x90
>>> (invalid request). To handle this, the read_thresholds callback is not
>>> defined for GNR, and the visibility logic is updated to skip exposing
>>> the max and crit temperature attributes when thresholds are not
>>> supported.
>>>
>>
>> Are you sure this doesn't just require different parameter conversion when
>> calling peci_pci_local_read() ? The translation from dimm_order and
>> chan_rank to the register number seems to be different for each architecture.
>>
> 
> Yes, different models have different configuration parameters. The following commit has a reference for this part.
> 
> https://github.com/ocp-hm-openbmc-opf-ami/linux/commit/f851a79143556f0c138617d68e924071434d8bb7
> 
> However, after my actual testing, I found that this logic would always get an invalid request, causing it to fall
> through to the statement below:
> /* Use default or previous value */,
> 
> and in the end, it actually never obtained valid data from the peci client.
> 
> So in my current test environment, I'll temporarily regard this part as dead code and not include it in this series.
> It would be great if Iwona could help confirm this. This also needs to be improved later by someone who
> understands this CPU model better.
> 

I think it would be useful to clarify in the commit message
that this is not a platform limitation but a driver limitation.
As curently written, the commit messages for this and the previous
patch suggest that the platform does not support it, which
based on the available information is incorrect: The problem is
(or appears to be) that it is unknown how to extract the information,
not that it isn't supported by the platform.

Thanks,
Guenter

