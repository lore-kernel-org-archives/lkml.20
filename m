Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561248;
	b=BLIWAICjX4vSiVdxz+Qwe9niOOtbF5AqRZ37mCwSBoC+JKHZUZjOr6CvOP11eOk3qq/X
	 r5lfa/Y4v8mQdEjC03YhtAO9LOz9p6YANs6pLjD9sqjufOXLP0oGf7ROZ0Fz+ahxyisFx
	 nQzFpAvnL3eEefz+zEryrswAHy/K208+P9itbcOzZYc8yliQm41bZVghBSN6PHk55zEH6
	 8FBiax2GZL/9PiXJ7/oPwnzKEnbEmdn3oTRuu4VMqfFccPgQftUC1ULxbIf2bRKOcAycK
	 cy5ANgBCn+fWwRSO44mEpLlDTgVZj/Ktd02jhFBGHA91OQfeGKaQdgzz63xIAp+1K7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561248;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=FBzaqWRuYJDOcynWW1oUqzv1XeYY64zxgMqREXlXnBE=;
	b=vhPakmPrk7yQ5Prhl8MvRxPJFSwLRtGCuk/DSdDnCvBll+Xag4aERJwYlHDjt63sKycg
	 TZH+OB3PK5oGRlgO1GBU7LiHYc+RfpWnWaaQ2iEXyYPW1KN5auhBwCDxNDb055vjZi7oH
	 LHur/MTkViGFr8LgYoqI7dzYgZmtfio6CD0PP+jXRDMBMSQUsuEFFuvmxjE7hoJOe7r7s
	 009WpcaOQlawaCmi4Vg2pDrxSqla/s6ZowGXxYgkUmGCY/iMt2oL3EolgAZwOUrYbYGW8
	 N4Jl6xxvtnB+y6ZAU5KizL8SZ+kwQ33oldKUbxvs5P50QAzGKqxHG2W+sbVqAe1iCmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DhrvIh21;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDB5606A329
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CDB5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DhrvIh21
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdb2893531bso133640a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:27:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561247; x=1794166047;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FBzaqWRuYJDOcynWW1oUqzv1XeYY64zxgMqREXlXnBE=;
        b=mJbraoIeW5gYxAsfwkv7cllQso0OcE6eZoc6DcHFF5iGHlnEZp8Y3o727zFiCoV4nk
         +BlbFj4wKkxJhvpBpJ1Xqv7cNLlmfFRty2f9vIkIPcLjghdYCMlZYHmKBQTNkeoSUKOG
         Ka/khazWnqWhZfj8MycJXIqOf7YQfRHhCjmsM6L/F61M1DSQcyLM84hVQ9I8Lk8WzaLG
         SYuahgWDc1H1JoFIfxmUjpzfmA98ZhH6hG4Ro1aXRnb+G7LAqB07YYIJ+BR4RseCWX4b
         jg+xX/9hz8UdyQhDcbh1hsrxAOTkhU0WuKRIWMe2WXm0m92V+E2t+kd9rMsytVFtJGYi
         99fQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6VhG5NMxf2XBv8oitsgKrgTzCEq9eVESkHNAVbeQuaD9PUs1pAoWev7hrzY91nHzrcVqqBR32zuRwzhc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ah/D4zi+gw3x/HlBQ79Psm5WxdejYKrLb/6XNJZ+3iuxeFnu4
	pyfWAtiE9yB3QencA48oxEMxISpcyfqVQNWgD5b6U+m3PwfbfmbOVhB5ZySlRAqHPEK7JUSUDYs
	17/d6IoDverSRsKKqA5xiNbaQmf17ALOvUDt+kwA7H54DS9S2Vvj5RrugyCRTvfhUZJKW1ihupY
	GkYPNyX9g2DGH2svaMpuTvndKuCyRohdbomJhcSmzBDZE0wP3TjLmXlM0EUbSNinajapIh+okEH
	f1xym/6xPAYzmHYuA3L7Cw=
X-Gm-Gg: AYBFou1bN5GpiAGsC563C0qa5M6k6swyX/9xRPIcis2mUjZuceWnA3ktTR5YlIHmTfZ
	aFPVoNjjCQXZlllmYLVCkNq5RStBtkKrSgPFNdXazsCczFqD77h/uFvDBCwT2pQpuR1qo/0RqRA
	eq6CEies6Sm57vBpkMa/Jz/7UUkBNF1huLUGnhcovgT58N1xt3yHybII13G3WGYKk/mkD34gual
	AMo0LqNQ3ua/7i89d2dIuWeHI0c6lslf4w1i6lHiBQDf9my+gp9RYI0mW1oRDBz+LSbpojDpz5S
	5+oqPPOpaMRRwWZfAEUDcqrLl6FSOFHSs+lOTcTvYBanMOcENwAApB+Ezvn+BPEXltKOvXVpM5L
	Yf9fPaw9NMzjHKqlwuRMQizypuFWkQRutIxoPRm8XMeh8jzazgZ8QDn6FmT/9xcnC7Esai5MUT7
	mP9B+ECQL8caHFSKW9fGlQjJJkh6uKVH4Kac3DpdQ=
X-Received: by 2002:a17:90b:2549:b0:3ac:4e18:238e with SMTP id 98e67ed59e1d1-3ae89847e94mr6228392a91.46.1793561247478;
        Sun, 01 Nov 2026 11:27:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e88749csm8588189a91.7.2026.11.01.11.27.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Nov 2026 11:27:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c4322d31021so114725866b.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793561244; x=1794166044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FBzaqWRuYJDOcynWW1oUqzv1XeYY64zxgMqREXlXnBE=;
        b=DhrvIh21w1XzU5LgWa9mrFLSjCH/FjS5+8gKwe4Xa4Diyaen3FJnosCbGfUO+p07SW
         ijy1U2WlmTouxOa58w/1JLPLZaQi6XCay+WFJIpK3ADbMZZHVTP7o/aFW322QNLLsCut
         PzU4LFIRWv4FO1Qsoa4/m6FSNeRi8OeOtvc/c=
X-Forwarded-Encrypted: i=1; AKwUvBzdHSkMzUlhLtjERO30zlIJD45+VrSaBCW6s6ipZjiSZNYQwiWsSroA8H4WTCVVETXR+wi+JPBMYzGcgoo=@vger.kernel.org
X-Received: by 2002:a17:907:86a4:b0:c46:9d7b:37d with SMTP id a640c23a62f3a-c4ca7a4b544mr641619466b.17.1793561244349;
        Sun, 01 Nov 2026 11:27:24 -0800 (PST)
X-Received: by 2002:a17:907:86a4:b0:c46:9d7b:37d with SMTP id a640c23a62f3a-c4ca7a4b544mr641618066b.17.1793561243910;
        Sun, 01 Nov 2026 11:27:23 -0800 (PST)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc1920csm303460866b.5.2026.11.01.11.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 11:27:22 -0800 (PST)
Message-ID: <d78cbbd2-601a-4cf1-800f-3be57a2b7de2@broadcom.com>
Date: Sun, 1 Nov 2026 20:27:22 +0100
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
Subject: Re: [PATCH 00/13] wifi: brcmfmac: Add BCM4388 support
To: michael.reeves077@gmail.com, Pieter-Paul Giesberts
 <pieterpg@broadcom.com>, "Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
 Mathy Vanhoef <vanhoefm@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, asahi@lists.linux.dev,
 Hector Martin <marcan@marcan.st>, Daniel Berlin <dberlin@dberlin.org>,
 Janne Grunau <j@jannau.net>, linux-kernel@vger.kernel.org,
 Hante Meuleman <meuleman@broadcom.com>, linux-hardening@vger.kernel.org,
 Peter Robinson <pbrobinson@gmail.com>,
 Izabela Bakollari <ibakolla@redhat.com>
References: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

+ Peter, Izabela

On 25/09/2026 15:43, Michael Reeves via B4 Relay wrote:
> The Broadcom BCM4388 chipset requires new PCIe initialization and
> firmware interfaces. Add support for these interfaces to brcmfmac to
> enable basic station operation.
> 
> This series adds:
> - Signed firmware loading and mailbox transport
> - Fixes for chip identification and firmware capability matching
> - Versioned scan and join requests, and extended PMK payloads
> - Updated event mask handling
> 
> These changes include work by Hector Martin and Daniel Berlin from Asahi
> Linux, refactored where needed for upstream inclusion.
> 
> The series provides basic station support only. 6 GHz support is planned
> for a follow-up patchset after this lands. The driver retains legacy
> interfaces for older firmware.
> 
> Tested on an Apple M3 MacBook Air (J613):
> - Device boot and network scanning
> - 5 GHz WPA2-PSK association and DHCP
> - Bidirectional TCP traffic

Finally got some time to get this series tested on my setup. The patches 
generally look good. So far no regressions observed. It would be good if 
some more people could test this series on their equipment. I will do 
some more testing and wait some days.

Regards,
Arend
