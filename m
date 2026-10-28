Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178966;
	b=5MzVIa0uw3wTn3A0yJp2dCUq4y2MaUkL0o0ld5qTaHPoBR0GoveGpTmSyQHAnRwz8dVW
	 1dowUuA38EZ3WZX6glzmW5mXhh/4oxFYXwYr1CB63S6CVw9gMEd+btQR1b0Im7WcInyGx
	 bt153FC2tPu9tW8wbYkDurdWUlI8RKppxL9oA1Namk+6oczvq8X3tKnv4VW7oHvxnlAy/
	 lQHsY4SaUt2ZGBksX+QdIAtm4AzuhBQpqAQtbezU1Qv0CYyX4QI7qWyRVJo1Hl3Ze2bXZ
	 WHaZIhHDrAmKVyih94mJHW5/iiDm96aD9gaexZjI2APXi64Htl5MCMA2JvuX5t8cyAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZWOWC2oU8I/gHy0HNXFlxQ+f1tLC07XbRG3QM6aF9YY=;
	b=Sey1mIr7uY/f97M37sic0yKxrTzvZ8MKH/wvWtax/TW3cHccxRsRG3imrwUAmiUFBxrQ
	 EqKPgsbqrEQHz9WgFxwjZ/Bu2Fd9kvgS1dW4LIAUrbZzpeeVGOffDYUntGVmZihxKE+0D
	 RhbzycCtRj9eWjEPeek49zUDvKQaoRL3DcY6hvdtikH+ig60N5wsAJFt7OO8HEddGC+PS
	 VqBmE2oWPopKtLOXjicgzn/R9/EjVFVx264MbKynUvK/ny7BgM362GsswYsoAKHjwBiLy
	 vUUvR4sk1PZYCzWl79DD2GXT0nk4X243djaXhcDxWOgq6RHlWv2OJF8YOHSSvztx7JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TUdpTYRC;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973F0606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 973F0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TUdpTYRC
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b060ec084so411144f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793178964; x=1793783764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZWOWC2oU8I/gHy0HNXFlxQ+f1tLC07XbRG3QM6aF9YY=;
        b=TUdpTYRC0c2kpSct0A9kP6oB1jRC6Y92VWORrairzKIKM47BVWuRgYMSb68Pzg3U4l
         2rqGst5n0UUmhLzMZpKUscGNJq70R3iHL/aHhjd+2+BDz0YiFiXTorxgPbu+DX8whN5a
         s2sr6Oq0kj+7gs2B21iFWyiWIJmy7sjHzFKnlI45zucI8/zfi3m4B7RpUxLBPb9orqwL
         sCdoTGUwWx+jyjA/8z7YJhW36lILioN7NGj8smV53MZFh4vFIBHibWG57KQpXDRVWQ+3
         Oy8Et2T3AIO9UOxxeAx4Uwp7GJme0XDRPrgPXtymFMxTByRh1Ozz9po3lDjCOjQ0lmfU
         F8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178964; x=1793783764;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZWOWC2oU8I/gHy0HNXFlxQ+f1tLC07XbRG3QM6aF9YY=;
        b=LJ7cIyjBi8CuoW9Gy35mW4/ZUcqy0dBXBvcuOUcFlKHJCB+184fsoIcORcNHqLA/ew
         yXNMdUa0kEtaxWAL/zlw4+PbQr3bRVpr0NUzcMButOurCtvK8wve7pqS3PxKUd/is0E4
         A2O7ualBsCYEdwclwbMpCI2PwfG92yjYVwbe6qPnEI4up8p1Z4eabQ8mlqy25QByVgYj
         armOj8qwoseafOlW28wZ5nJt2exzmt2iycA9YnBzWaG/WxMNtG9lwLhyuzz72lgee7A9
         ktjhWWitqu2cts3pUA/X8beAHUOldt3roise+3xefXzcVZSnL0ZyKQW46PxuVJ8dd/VS
         ENyw==
X-Forwarded-Encrypted: i=1; AKwUvByk+vCg9mI8mosMX5ZZN8L9N8UAvCSR50TiChGeBRaWktLN+kzIcra7cL6bp7Un2IvBf+N5mktgI74Ovfc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1NEoxQzIB659ZwRT0PtBzf4ru7Jfk7GpaHw9RCkEuMhappPH7
	HMIkNzpal3lYljAPm07HwS/0HHy06hvNEuPPSIAoBs6EkEWxRkkRm/3jJAugQxqOeTg=
X-Gm-Gg: AYBFou1LNfxpt88+hOET+aXw9Dn0+52vvPjvS6j9rUFJ8ZK2ziJRJ96TUTR7CQecNP0
	Yo5xPY9DGbmSebza6yRSi2x5ofGiFhqIWN6UUaAPs4/khi/1IIe1g4lILDVuZayWRI/A2TTkCEq
	pu2MrHrtqaU+KT//U1KMbjC1YaZo/dOm8g8UbLCv6LWEgFBYdDv5CRrgqIr9dZSHnA3AT5jV82N
	V4WWJrSVbvdEidBtaQcdZ5xRZ5EAGzZejHRPyQ2jyKqzfTvRww7sg2bm81zPQZF8ORutL4FbjUk
	dMU0SYQIEPNt7kQar2UjLN+oZbxeMj9rbeD1OAt+LW/kyetk/NXOlXHGJqME28z7roWAc/+Ydra
	HHwXJiXO7are2AjczgXCFUT9JJYZ4Qrp29kc6IgFK5R9/XqkAZaEsoIwelpBHYHAZErTvrmytts
	CluQLQWeaQ7Vz6uk3KmO4C/kGJrMfY0CMoTBqatnWXsm16SGvyS7fciBjDUcKLaUXrEMqzROCbf
	Im0wGNq4BAiyQL0sHDsrDKpnMIRVAxGgttTN4oUIT+7wLd15X7hc5AFWa9bsXkT+vDbaV4Tnapv
	pw/3Qq9GCuIsTzP8jyvNpYa0MuzaKWHYog==
X-Received: by 2002:a05:600c:83c3:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4a965be61cfmr33902465e9.11.1793178963871;
        Wed, 28 Oct 2026 02:16:03 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05e4e4sm21781175e9.3.2026.10.28.02.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:16:03 -0700 (PDT)
Message-ID: <75e0cdca-4bcf-443f-924d-c6397d616ad5@linaro.org>
Date: Wed, 28 Oct 2026 09:16:02 +0000
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
Subject: Re: [PATCH 1/9] coresight: cpu-debug: Fix PM usage counter leak in
 debug_enable_func()
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>
References: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
 <20261027-james-cs-sashiko-easy-fixes-1-v1-1-db43c4668644@linaro.org>
 <20261027180805.GA9176@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261027180805.GA9176@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/10/2026 18:08, Leo Yan wrote:
> On Tue, Oct 27, 2026 at 02:55:47PM +0000, James Clark wrote:
>> pm_runtime_get_sync() increments the usage counter even when it fails,
>> but the failing CPU isn't added to the rollback mask, so its reference
>> is never dropped. Use pm_runtime_resume_and_get() which drops the
>> reference itself on failure.
>>
>> Fixes: 2227b7c74634 ("coresight: add support for CPU debug module")
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Closes: https://sashiko.dev/#/bug/linux-2ff60e6d-33ac-4a69-9c62-63eb482f1913
>> Signed-off-by: James Clark <james.clark@linaro.org>
> 
> This duplicates with:
> https://lore.kernel.org/linux-arm-kernel/20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com/#r
> 
> I'd prefer to pick up that patch, as it has fixed all drivers in the
> CoreSight directory.
> 
> Thanks,
> Leo

Yep we should drop this one

