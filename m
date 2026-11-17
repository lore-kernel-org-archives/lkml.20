Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917575;
	b=Nj1kX/QQNk3uJah5dgD3cpWoCh4DGvQgr//3AfCYbUuf0SFGPQvdzAkIPvWVktfiB3ni
	 SVMIg0uUiw2VMsv5T2MfCL++w8knx1DLO+H0yIIpuwScgRvsWFQ3EWiYJmn/Wsj0a1onm
	 f0m2QDHWOYfbpTE3URkzuFhAjpI6o6Meaqsogja1zBwktRAxPOgQ4qM4kdPY2UejkFaRs
	 /R+4xxBS85aHNRvDsSWTUf/zU1YPgs6CPWpFzwWqGzXiTpCYu5+ZshYyfdYIweG5HMigY
	 nM3XsmsNQj4P3C+eHD9qu0gBqfwQZytOcIQVtW/i7jJ+BIxZUcA1pq0oVahjYo0l/Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917575;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=SSx5wIgosY6H9+fVRqrZZsSZ7OrTMTUpB4OQbwOFcCI=;
	b=3ZXWd0S9QzZZeLtWxoSgiJRy3II0InBHIBzlEjgYZEq99c5WiY7U7KNF1G1c4f6XdBXq
	 NQoaoGFFHf1I8K8UvKrf1ZjiyD91Du0gZzjArjfT2Axa62uIXmbStoqffk3oR5iITtENj
	 OYuYZv2KiWREavfdsjwavnloYmaNrSDQno5sUluE/Yrj28At345aeJ/UfyYleFg3Lj4G/
	 xHytg7/HVEQm94KcSO5HBn10xOnJZmRcMDcEDtBEjFsyKGXRDG6TcQ9QNiblZUFhMxLSC
	 eB5AMOzX8ODknouu4J81u1aqQS7i3MTWBCNgkRdoinkj/0eTyTi69Pn1o0anOo/v9ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=M3Y08yYK;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC94606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BC94606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=M3Y08yYK
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so4188748a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:12:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917574; x=1795522374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SSx5wIgosY6H9+fVRqrZZsSZ7OrTMTUpB4OQbwOFcCI=;
        b=A6q/8r1GAxDdg/OXSvt0iCZiwIRHuljD3ze+J++UYDl2yVQP513aIYWekiAf+avY2I
         Q+QrBfCdwmKGmCZ+qFGiEjKMtcAT+K8oSM5YzzCmzXs34QdDJWhxkwFa1T8XwXMQjE2d
         08Aaqb4TbMl0zfsse/hHDl9XHyEXyzxF/fKn5vxnEDjpH2JYosVWAynAjqL4iJ+5GDXH
         hhp4u0PLe5osoXVamk55f+9R1ERarqX2YxwVz9A89FQLJowserzfDjBxvcfiZX0a/Q4q
         uDu3qGE2D69ghx5Qkms0epxN975GEDI/Y6oQogVxqO1UP+gsN5E/frzNZW9XpyLfYZft
         gpFg==
X-Forwarded-Encrypted: i=1; AL+hErGqiQV5wbjZbVvcMUly05E+UWYdou97Kgo7B1Vv3O9NoulTcd5mYi1u49zM5XaGK//UU/9zEYWXg4dh6N0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qJKR9Jnp81oOrhzHiP0NYaPZQwvpiidaoBB1TiSgFKKMxfQ6t
	NmfooZQgBYy46R8m2a7w6B++dVNuNywk3RQoqNtzqfBlrgBZ+3oOlSscfY3SkzFLYFoWlckuN1i
	ccGOFbDAudQ8Fc70+CHi7UDALKjGMqXKjw0GrHuvidWPDMB0ztACcgUAmtb0xjsRD6vrcWMK1uj
	yXoM9gqOVekAIuop1e356RXnAvtYOLGl0eFIMhQ6X+0rBwxcFcSek4zwUsJPlmHog8YH4zGw18n
	TFobU1rw93z6F7v+D/3qk6NUw==
X-Gm-Gg: AZFdTZfDaNea62AkHA7mtX36NnDFD4bT7ywgWxd2kDipvlGCKpQA2YJHP++dZ6BM5be
	WWsiPgg9KlTKf7KTUx0mt3VDMmzFIRtv6fl4ANozHqaUyfX8dnYfgfiaUZXhHItyk7HamNPvNB9
	qXQUlmAd4uMokFXbA4y2nv9zl8cfeJVc3Vp8zWbS7A/2y/hSAClDh2CTNUyLo2Crb4ToZ3JgjEJ
	XpYbWkXMVGDl7e3RR70s+jngUT0G3os1yB9cTWj/Kzm3AR17lgqtKTDdg7giVOM7UaEQoeYwoIl
	Xhg/JDS16o08TTVDiyqETGskKrrL3HyE7Wz07DKCQ+d0XYY2aZaQRFS9I8fX+axQVk0wV21+Ufq
	/xcZ8hV+3ijws0sk2eeGGrlZlHq0yegSjSZhOKT3e87g5BJvAPlIubRJf06gwbA1Jyz05Ud1odF
	gV2uCpzzdi4a1Ibp4RCC+8EfbqrLg4XLVaFJ7+NhY=
X-Received: by 2002:a17:90b:2604:b0:3b3:c4dd:5437 with SMTP id 98e67ed59e1d1-3b3c4dd8fddmr415928a91.5.1794917573937;
        Tue, 17 Nov 2026 04:12:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ac020c2fsm1833337a91.6.2026.11.17.04.12.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:12:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-49205554e17so2800564f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794917572; x=1795522372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSx5wIgosY6H9+fVRqrZZsSZ7OrTMTUpB4OQbwOFcCI=;
        b=M3Y08yYKCSjMAv9g2RT+iASWSxNSIDU81eGC3hOW/4yu9wLHIqbGB2AJBIfpSss5Xh
         SoMPkyqW55u8jugaDKbcKJBN9LiHF+lrDrqQdQxVmKDXAsvcHpNmRPuVombGDzQOsU9B
         Ckc7d6TpcDL7kXTCeW0yR1i03JcuTDC9KNvfw=
X-Forwarded-Encrypted: i=1; AL+hErFi+A2gh1ZlcIxwbrnc13bfK42bLTSAxhgloBmcWzuVCvtmW2uWL2lgs109ig+mswusrKHRwrv3PfHtufY=@vger.kernel.org
X-Received: by 2002:a05:6000:22c2:b0:48d:ecba:3cf8 with SMTP id ffacd0b85a97d-49c741b1331mr31821696f8f.43.1794917571826;
        Tue, 17 Nov 2026 04:12:51 -0800 (PST)
X-Received: by 2002:a05:6000:22c2:b0:48d:ecba:3cf8 with SMTP id ffacd0b85a97d-49c741b1331mr31821633f8f.43.1794917571373;
        Tue, 17 Nov 2026 04:12:51 -0800 (PST)
Received: from [10.176.3.187] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a3d39b8a37sm3709465f8f.46.2026.11.17.04.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:12:50 -0800 (PST)
Message-ID: <b8ccdaca-ce91-44f9-925d-eb5ef6b78088@broadcom.com>
Date: Tue, 17 Nov 2026 13:12:49 +0100
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
Subject: Re: [PATCH] wifi: brcmfmac: reload the firmware after a missing D3
 ACK
To: Andre Eikmeyer <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 sebastian.reichel@collabora.com, Lukas Klizas <lukas@klizas.lt>,
 Yossef Osman <Yossef.Osman@proton.me>, Aditya Garg <aditya.garg@linux.dev>
References: <20261104151616.70623-1-dev@deq.rocks>
 <20261116110839.4481-1-arend.vanspriel@broadcom.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20261116110839.4481-1-arend.vanspriel@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 16/11/2026 12:08, Arend van Spriel wrote:
> Thanks for the patch. The resume problem is addressed by Andre Eikmeyer's
> series "wifi: brcmfmac: pcie: S3 and deep sleep on the T2 Mac chips" [1]:

It is all you ;-) so you can probably confirm whether this is indeed 
superseded by the series mentioned above. I marked it as such in 
linux-wireless patchwork.

Regards,
Arend
