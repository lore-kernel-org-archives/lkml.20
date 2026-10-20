Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493835;
	b=V+7rexsEZjM/5cHNBV9l7qPCVjCu2fV4JNc0JqIrR9zhCgnmYxTlZ18InE5OD2gnriEE
	 GWmMwK3aKcfixQPTFbE014X+kqLS4sxsd2BDwjGAyJiv+Mh11Doe5UR+yB2sO3jspomky
	 XfT3eqlS2mwchAxJWZw6OMhaypNc+kf520TYoqHIMmBSgA/E7Q1s4Jfau+O2/xjyADYha
	 VVE3mX4afOR2n3ayzNpHPeEfaXGrFn+7OK+LU1o7dgyShVeFWX/ajumDuE+HD5RPPaIr4
	 xaoWbvh5JaJ/F2UsnsbMGmVfOarss43c+QsnW4UbavvKz6ixsB8Q22vKy/oO5j8opoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Xmo5pGCKClMTznAgnt3P15PbfjUdQDHaOBja2Zq9dD8=;
	b=hCXFwEf1/ChS1LAu5keoNHDOaYC2ohXUB/MTJ45pE0tg9ZwfJhUA8ulms/knor1n9WaD
	 +h4OtPaazP6YOBfoB9bdB36yH9dXQTFsPn5mzDBYv07Xtyu8lMoD7eBlqw37WfRSRlVUh
	 p7+RysIJuzKo4GGJ5SDsqJdNgHXqJnxiGPin2QzVpSvJ4WGtJoaRCs+E0vwcn5KtAoDRk
	 Buzc3jVo2uzdUe6CljsXu9MNAsTHzhwOYYQk/+7kqbIaS4E5rEgcRDf5pbLninz76jlvP
	 2bUWIKxeaeRH/wAQ4dbZvQos1m4qom85+s28keGMqbHAwwV28M2Rm9rdUiiYAYCYagw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IG8CNnwU;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F57C606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F57C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IG8CNnwU
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48df54150dfso2373654f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792493833; x=1793098633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xmo5pGCKClMTznAgnt3P15PbfjUdQDHaOBja2Zq9dD8=;
        b=IG8CNnwU3Yrj9dJ8HGq+mCXNLvDjQMFVKXd9PsRwu4nWGz2dDCgtbz/8x0FT463ahU
         uL12vHG8JwsMp6f2N5DElvkEFuZjOIoxpjr2CTgly2P1KGn4wNbR4YrxWNh3zUZ+deuq
         JLF2B0G339BdzTy9BSEtsuL4tAuyPRbCTeOhkafSrK9LYj8oBzky8Jja75yXmF8SDRqw
         bOydB5/9MlSxpEPaCoNJFF+zrYyTQXJu2xhjY/1Ohm5W04Xn39Abwj/Q+xQ4ZuckKuJ2
         Ps7ImPM35FH3Y7idboydTb9Fwa5MqaFu2iqTlbtXbvDXsVveqhPuaedBrNXLhWwP7eqW
         p9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493833; x=1793098633;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xmo5pGCKClMTznAgnt3P15PbfjUdQDHaOBja2Zq9dD8=;
        b=PQB9v+Zx6B7XNTiZPbvpE5jiYGFKMaSSq89zcYj4noFoRAcf4hur5NeR7wB+agYPdW
         m5CyRK1n53E3u7GipCWlyoOqk3pNRMD0LweK7FpElx+hPfA8kWdIYIVItiyTklebpgma
         q3H/An9vYXNpwYTCe4Ci/0iNYZvpQIHPDpRPYjVmCDX0W30cxR430hVD/mJOPGJ2M/ZP
         L2nJc9NrKKcS+GxLlAnN0GOUOJtN97PrQHFRYfj+C3DtOEODitc9B5C1FtWDqgb+YbTR
         ee2Ks0ninAzod1JjnzJosOJPmHtrWyedpOjgtddeXW7IGJmwIzp8XYOY+HI8v0ZyRgqj
         lkeA==
X-Forwarded-Encrypted: i=1; AKwUvBx+Iwb5AypbN9shmAKArGy4mNRx4WUtvJp7oFdH7rrDZvsIQMSmS26XQX81fmHeRFSvKvsetUie2mkWQrM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5RN6zd+7EXeF9rkiI1oA+kb6bMsDhZtvKow9MDh8MJwm29Nty
	vhIZR3O0nQI+Dy/Z8SmMMeCjs90dmOXa2ilFYdE4Y8ad6hjAghFrCpsaKvv87DTk
X-Gm-Gg: AYBFou04Y+QwsMZ1IEdrBlhDxEYzX26Upr8JuByIBT2vRn4UqxjYFBiz8CuA52m/nOS
	rTk9dXOHaLyPIumDsNo8S0y84fRZT5pGYLH9VvuiuYov8eYzbQvEcEnJTPlUaMEdy1eAxJZDZcJ
	pFhn5c6aUhEN7p3Jrlyvj/PRc36oM05f2s4xn5B2mhhzC1e42vkop2JWIYM70ISyVlpxUvMXCsI
	3T8TdGDbLERzb6kzXXV0um3GSqwdoqumeEUSjNrCVAMKF4dH0G16IbSWmaJNdRKLGJOWRGVxMTT
	WKzQ7qktNNI4/+8oMOjFRsGnbDxBCUD68PrJh4l1MCfzjMJr0cHhDCiPXPyIkpG9CFS3X0aCPxt
	aX+hwpjRDH51DHmndCMkma3besSRyHhoNqSSI4cdoKn0oSzzdw1rfD/XGGxSVFHql6lyjYibCrL
	RKp/M/TsRBN9PPAnoiwnCjyqx0LO0A6/HdCw1JOVGYC6BJKhnqZtjckWOaBPkRIIJu4awW5byG+
	6QwkQmtsm5bmjqOGE9K1n3XzOvEmw/1VSc3ImBn1d/lpM3BGs601sIFHxuW
X-Received: by 2002:a05:600c:3556:b0:4a0:25c:8af2 with SMTP id 5b1f17b1804b1-4a1d76051b8mr237749825e9.17.1792493833438;
        Tue, 20 Oct 2026 03:57:13 -0700 (PDT)
Received: from [192.168.1.105] (92-184-144-135.mobile.fr.orangecustomers.net. [92.184.144.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce3302b5sm231782675e9.4.2026.10.20.03.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:57:12 -0700 (PDT)
Message-ID: <87d73b29-945b-476b-ba02-71a5bad4b4bb@gmail.com>
Date: Tue, 20 Oct 2026 12:57:04 +0200
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
Subject: Re: [PATCH net] net: jme: keep RX MAC clock enabled for WoL
To: Jakub Kicinski <kuba@kernel.org>, netdev-bot+sashiko@kernel.org
Cc: cooldavid@cooldavid.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261011-jme-wol-submit-v1-1-9cc033e259e4@gmail.com>
 <179181078924.434549.16666867636447785126@kernel.org>
 <20261019182217.18e26e57@kernel.org>
Content-Language: en-US
From: Franck Baur <franck.baur.67@gmail.com>
In-Reply-To: <20261019182217.18e26e57@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Agreed, thanks for the review.

The RX MAC clock should be gated again after WoL is disabled on resume. 
I have added a call to jme_mac_rxclk_off() in jme_resume() to restore 
the expected clock state.

I have also addressed Sashiko's second concern regarding concurrent 
link-change work. The revised code prevents new link-change work from 
being scheduled and drains pending work before arming WoL during suspend 
and shutdown.

The revised driver object builds successfully with W=1. Runtime 
validation on the JMC250 rev 03 hardware is still pending.

I will complete the remaining tests before submitting v2 as a separate 
patch thread.

Thanks,
Franck

pw-bot: changes-requested


On 10/20/26 03:22, Jakub Kicinski wrote:
> On Mon, 12 Oct 2026 13:13:09 +0000 netdev-bot+sashiko@kernel.org wrote:
>> - [Medium] The patch turns the RX MAC clock on before arming WoL, but
>>    resume never turns it back off.
> sounds legit
