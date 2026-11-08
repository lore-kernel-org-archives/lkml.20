Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794152509;
	b=LqJlo0bg0qyCMYYcOOTJFjApR3yvWVuFyZxQ9i0d33Ec15lF3IPhvejfrsOPNqq4FD+M
	 2VdFKmiE4yiBw9LH121+zONOzDsXbFAxwhTveLezHKPTgZSJgf2t4MG8iiBrUg1nFqpu2
	 bQzm5nYrzlgAd5oQUbBvMNIEYbQmvFMVSoPOzreYxOu85jZs7S7PDtC805tMp2wpR2T0b
	 e3F1rfKdfONu5o3A5cQrQsFBMpNuAsjXyiW4wK0tXm1Y3zAnmXALUGtLUMCrudH5X41/w
	 6tkh3ffrkrvbR7axYJyOFznNgxeRXDTfKdq7+Vtb9ph3DYFOBRbwOWek3cwtpUh5T2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794152509;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=5yCu6EdDfR4gzCOuCd5mbFeaXjz0iD8JjCv3Au6Mdwg=;
	b=DVsnqKi+1DAw9U1VLf19f0f8rq6reCBJlL9Ow37o2rQG+MUVc+T+MfwDhy6XCi9cF8nH
	 FRecFcgeZTxz7MFs/rjFU1aGrEegonjldTBHsZd3zXJUJtT1XYYIJnJIlKhicK/pMd3Ce
	 SgVZ1Iz1F88PF6QfBZQ1nPwtt+UNHyG662zcGT0aolG+ETK3fT1C60fVjLkbZzaU1TgFW
	 1oqyNFDWYF1U+87XrHui/Y1Grb+1K3GEF5PmY1/oVnYjzUGX8Ya8QQLRi9ZnfvuGiIvFG
	 VVvCelXceZoKJrRxMv7EEHXpEQ7xMA+hlsgV0pFjIQIly4Zy5Yc/2CZCYNtAPFlIcbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Xy1DDHgX;
	arc=none smtp.remote-ip=209.85.222.227
Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E62606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6E62606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Xy1DDHgX
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-945ae2daa3eso15859585a.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:41:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794152507; x=1794757307;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5yCu6EdDfR4gzCOuCd5mbFeaXjz0iD8JjCv3Au6Mdwg=;
        b=KXfJPxfYr4fhnR5/2usdOAJt6rl33mdJ00XUCmwUfp8N5mnU/w8Ei2G6TV1uNLOHQx
         VL7kfTVD8Rea8LcdJ8avGAj+s614iPiU1BnnrQ27PfaVq7+mafkkpG8mb2rxSlyT+UGT
         cOUEyxu3GplKyToSFzQpAHYxswOuyNGvVmuVnJJgebLISVpuTmUKSGzf2sauz/29GAtu
         5lTxW9d0fHirD01+Qbjw9T1aOmhkqDm3L9mVUIIfG5HpFVtoMcLAnSB2+rEij1oDMujI
         gi3jo+YBIVDLMT9ltxF0bcOVVOg76PmntRA6JVj0coDvHnEDBy59Onlvxk9YdqLjkn6P
         hO8Q==
X-Forwarded-Encrypted: i=1; AL+hErHcYm/JLXyCItjPXp7vw9RFkXbXt4YxI+WUqRKduwcQ3qPBhyu3FI4lZEzjyhpWGdGyLPSex5jMU6DCM30=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oEJP5GI5C8qp4Jk64Pib82ZGND5y0xYvs5IjA64UnAu8hVnJ3
	Lyk7g8c2JJcDNje32tWK++0Nzcjc1HlAw9RpLDyK1IsuldU1q9GiAYV/WXHreQceLljkBmqBEWT
	GpYjlkkN8FUW4eGkU028O5Ac572fre3rwcxvSxFdvkfg8ZvgTkNIHfNYu3p5pbDPHRdR4DgNdZ+
	9kRElXUYJgyHlYgeWSL14NYO5GNGLgdi/mTDfk9glOJCxmFGug0mcJhPIE3He3Y7jBiJgIH3I9T
	1eSY9BdWXcHRudzt5lllaQ5lQ==
X-Gm-Gg: AYBFou0CigtFrEy/weVsHfYUkDNHb+9OpOBuvfve0+JpD+UKY14HFzTTKU8ydXUP8qG
	bzFcoIBPk2zPIOeF/ST50XCzCkNlEShOrQkr/Dgs2FzHCHsbyU0MjwZn3n0olgJ+3QmR7+l1EXg
	q09IGStufMIXjmGEHa1YWG3w38492PJ8kbBuLxPnpP0JNWRhi7sUmhieyaBXn7IX1gdf0AnYfnh
	K8KevnxfAyuPAxI1E6lwAX92VThGZxN2sQ7rYFJ4KVeuk7xXNN1IiWGxrnff1uZDio9qJ0YOIim
	b5fvPlv37kwchrYAFmod0QeCHxc3B3oekk9z4IdBNw1Ug6rovL2qzJ/k4ZogPfWBEE4e8UcEBUA
	Q6ncDPCtGP0GLVLt0WXiVOPg4dpTkvDr6pVoXkP39OvbNZTDs3YvSL1aFXSmvXONA9DwDbXZBje
	lJSBc68V2NcTDF0WG48K6mmFg7MQ4o3Mxa2KUCCUk=
X-Received: by 2002:a05:620a:6cc3:b0:93f:23ef:d6ad with SMTP id af79cd13be357-94783fe4580mr260886785a.0.1794152507453;
        Sun, 08 Nov 2026 07:41:47 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-94782d49e63sm19168385a.8.2026.11.08.07.41.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2026 07:41:47 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so232887eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794152506; x=1794757306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yCu6EdDfR4gzCOuCd5mbFeaXjz0iD8JjCv3Au6Mdwg=;
        b=Xy1DDHgXIqn+VULlq1ya1aelptGMf/FW+NmvpEh/fSKmsozeE1GEnEZ3yP+744OQeN
         JbystK9DAifkGe8hJBLw+6OiGrjagjrUduTIlaqmm23llBbHqaHz7mYuTVdKm8/NipEp
         ZZAUuhxjNdx1vU246trC2leXzRglqcefGJ30s=
X-Forwarded-Encrypted: i=1; AL+hErEUZGa4I+4wAV5xdRSoBFxQAK6X5JxXqjYDwkVR06G4KlpiHAqrY+Ib6YjCZodVp3K0EoFbSxxmjbcy8z0=@vger.kernel.org
X-Received: by 2002:a05:701b:2802:b0:1b0:20:6444 with SMTP id a92af1059eb24-1b39feffbdfmr2453824c88.39.1794152505946;
        Sun, 08 Nov 2026 07:41:45 -0800 (PST)
X-Received: by 2002:a05:701b:2802:b0:1b0:20:6444 with SMTP id a92af1059eb24-1b39feffbdfmr2453786c88.39.1794152505155;
        Sun, 08 Nov 2026 07:41:45 -0800 (PST)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm7469375c88.6.2026.11.08.07.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 07:41:44 -0800 (PST)
Message-ID: <c93fa1b2-9d05-4536-9025-6c4d1e6e6b5f@broadcom.com>
Date: Sun, 8 Nov 2026 16:41:37 +0100
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
Subject: Re: [PATCH 0/7] wifi: brcmfmac: AWDL for AirDrop on Apple T2 Macs
To: Andre Eikmeyer <dev@deq.rocks>, Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20261104151547.70333-1-dev@deq.rocks>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20261104151547.70333-1-dev@deq.rocks>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 04/11/2026 16:15, Andre Eikmeyer wrote:
> This series adds AWDL support to brcmfmac, so Linux on the Apple T2 Macs
> can send and receive files over AirDrop with Macs, iPhones and iPads.
> 
> AirDrop runs over Apple Wireless Direct Link (AWDL). On these Macs the
> Apple firmware runs AWDL itself. The host creates an AWDL interface and
> sets its parameters. From then on the firmware keeps the AWDL schedule,
> sends the AWDL frames it gets from the host and carries data frames to
> and from the peers. Election, peer discovery and AirDrop run in user
> space.
> 
> The driver enables AWDL on any firmware that announces "awdl" in its
> capabilities and supports interface_create version 3. The linux-firmware
> image for the BCM4350 (7.35.180.133) on a pre-T2 MacBookPro14,1
> announces "awdl" and answers interface_create with BCME_UNSUPPORTED, so
> it stays without the feature. Other Apple chips, such as the BCM4355,
> are untested.
> 
> The KaiT2en community, about 280 members, runs this series with its
> kernels. Users reported it working with the BCM4364 and BCM4377 on the
> MacBookPro15,1, 15,2, 15,3, 15,4, 16,1, 16,4, MacBookAir9,1 and
> iMac20,1, and nobody reported a regression. AirDrop transfers on the
> MacBookPro16,1 and 16,4 are slower than on the other models, the cause
> is still open.
> 
>    1    match firmware capabilities as whole words
>    2    move the interface_create definitions to fwil_types.h
>    3    detect AWDL support of the firmware
>    4    create and remove the AWDL interface
>    5    add the AWDL data path
>    6    add vendor commands for AWDL
>    7    pass AWDL frames and role changes to user space
> 
> Patch 1 is a fix on its own and carries a Fixes tag. It is here because
> patch 3 adds an entry next to the lines it changes.
> 
> The AWDL interface is a network device "awdl%d" outside cfg80211. User
> space talks to the driver through typed vendor commands and events of
> the Broadcom OUI: start, stop, frames, sync, peer add and remove, and
> events for received frames and role changes. Creating the interface
> needs RTNL and vendor commands run with the wiphy lock only, so
> AWDL_START and AWDL_STOP run in a work item and report their result as
> vendor events. The driver sets the firmware parameters itself.
> 
> The firmware interface was worked out by tracing. A dtrace script
> recorded the iovar calls macOS 15.4.1 made to the firmware on a
> MacBookAir9,1 (BCM4377) while AirDrop was opened and closed in Finder.
> The other way round, the MacBookAir9,1 was traced as AWDL peer while a
> MacBookPro15,1 (BCM4364) brought AWDL up under Linux, together with the
> AWDL frames macOS received and the console and events of the BCM4364
> firmware. The BCM4364 handling in patch 6 comes from these runs. The
> iovars, their order, their values and the AWDL frames come from these
> traces and from the frames the firmware passes up.
> 
> The user space side is t2-drop, part of KaiT2en-Fedora and published
> under the GPL:
> 
>    https://github.com/kaiT2en/KaiT2en-Fedora/tree/main/apps/t2-drop
> 
> With it, AirDrop works in both directions.
> 
> Comments on the vendor command interface are welcome in particular.
> nl80211 has no AWDL interface type, and the AWDL schedule and frame
> exchange run in the firmware here.

I really have no idea how to deal with this series. AWDL is not part of 
the IEEE 802.11 so I can imagine the kernel wireless subsystem does not 
care to support this. From driver perspective I am not keen on 
supporting this upstream either. My limited understanding of AWDL was 
that it was Apple's variant of TDLS (802.11z).

So what does AWDL provide to user-space and could the same be 
accomplished by TDLS? From the explanation above it seems AWDL provides 
more knobs to user-space, but not sure whether the awdl%d interface is 
merely a control interface or actually passing data through it (patch 5 
implies it does). If my memory does not fail me then adding vendor 
commands is generally pushed back.

Regards,
Arend
