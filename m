Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792613106;
	b=JaYrQbaqGvGYSNurVaVP66W641Nf0mIKHyItw1b9hCg/+b5n4i6lPTDIZrCLBQzjwKGc
	 lbtWUV5zLYJWvMyIQR3FyWF+6DHReS0wRVusun3YRVcH0hkVt9WjCAalUpd13EYEhFB/c
	 RmHQJXObCTbZU0/SK9C7cbZHdOvL+xeyyYzvJohdGEwhtZIXnXklJAgxrLK1tkM+/S+EA
	 45UQq/QdAm4IlGKNVYi7ag9+Y0rgbY75oSKmx1A5ZCYzmI0xMZg142J0gHSR5J0JuOdRI
	 6voW0RNyFuKy3fIZ8rBHdiL6dD8lhNDPEzeuH+RuX9zTh6DirVZ2P7sJxzXhMNtmNDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792613106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yem/FCFQ19eiUX+mO8WtB6J4U2HGPncanaJPXy64y58=;
	b=JYfTcSJY/eRlzFiAJ8YbjOQLmjCwBXUTxOWvzRiyNZgN8vP3tt5zV92Rzn5Gf3MbcCwe
	 mCh09PoDcZAoPVdVX4DbZHuIhpKrl12QDzZsx4nczKnh+hg5Xih8x9HIKrURbQRlhysxc
	 4gbIEGYuaY+RDUv9c7L1KMNqFum15OI24eZx+xBFszs7YOwyFR35U8gLifsOqhc2hv+lO
	 uanXrrvxufPMnrCyK7qkwmns1Kv73GF+N6E1bKV8w88unxCbFRZiTi7Fml/fjTjSxv/uS
	 pBjpo/d5WIwZLH7rnP4fxaXFFxfKhF43SAfywG/1N74z9Yq4SAV0UuK8Zda69Zd1Q4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ym1TYH9+;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE204606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE204606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ym1TYH9+
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93e63ee7b4cso126731085a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792613100; x=1793217900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yem/FCFQ19eiUX+mO8WtB6J4U2HGPncanaJPXy64y58=;
        b=Ym1TYH9+MGUbPFXjUtxvTI/tyvFxuDDo2d7X9M9Ad72puFTEACheu1aWHQ7SprkB6s
         yz3XSeURAPin0XpP8yZvMZXFNEICUQvD3uWS8zbBxOovJDbk0GoBb2XU02coqMuvaLG+
         jAYLnKOefHN91xV65mm0s6KPPogMitgV5F6mxopjxAyhL59OWhDs0wQNKAam/sVbF+3F
         jVDUbl6jcQrsI7Dw62Ft5oQ16uStdgrGXn2Wz0Dalyli2HPTHsbnRVLeacs1UPtBuWOU
         237XA7UujSPxhC/bU8ytWFKp4zEbpUN0NRJ645IGh879Uy+CbHPCQWpwkDkrkDWiLy2y
         q1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792613100; x=1793217900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yem/FCFQ19eiUX+mO8WtB6J4U2HGPncanaJPXy64y58=;
        b=XFg8fsmrVZGFk2IkD4AlLacyneA6o2EwMc4V1Rfcm+J6srxoplY7Kp4snlcRcnPwvt
         UVgAXnbVoUB2RExwEz/sSDG9M89L7hFBiOmIUJQqd/AbynIKgXS5o0mmV4vF61jP8sfg
         tjIYkr/Hw1we9KeQMduVW3yRqeEu9XZjw+ueX7OX95bXWF2HXdraB8ZFOv7otvZvrQYB
         coRnReX1R2tijB27dBcu10fXLRlyBSAX7osFbMTUXGEwMZWDwRpg+w/Zoy02+J/a55aJ
         xbi840N2h0LA/qS2/QzIYzCMIjk0M1q6WMGKLcrSAlryevHqilxHGRlR0OcPjwHaPQZe
         a/HA==
X-Forwarded-Encrypted: i=1; AKwUvBw53IriNeSsqyBGtpiYTWKBqNa5khbS6bNPslgv5ShDsnwlLZ93kNogJv1jO4b0Tv0qhDt2c6zMlyYQAkI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPk58U+aLg+fy4cl+i0EDCeImsANVnqvGglO5iBi4Kbos+uEyr
	JbWCrVxH9Ell991jEwaBTkI44aq0WZlrP2wyw9pfnfgLBmfPgIy88pytAN7xiQ==
X-Gm-Gg: AYBFou3Bj/E1Vj1U//XKkskYAuGw8yp8Jti7Zhcj3LQUWiEXhuiwarug8V7pxAAZ1fJ
	K3whf72OxdBKrLSmUEzaaViQEdyjCYE6WOJ+nAOciRkI7k53UPiGeA+zunw8Rn/k9JuYff4n5Cj
	E8da3BbfoYOhnNA+m8TvkFuO2q3M2xk/k4xwBdjjEaCNwLKn1haxoJ+jANEF4OdU/ngk2VASU0m
	psygFo+aojH5mXeDrmTEsZxT4nAD6fuIq7q5rGNOiVHgSxyaPNdt/p7K6rAXz26XiddCaqgO90K
	i41qHynbYUgbfJEqEuaz/go+quHw+VGXITMINdcmstZJxjA8lruOddkZx+npgWxBznqhoHnTdHE
	TrW40R1s7xMmElTMedCxNLwBDgFrVvKyVlxwlGSfdC1jeNFO/Rq7yxEC0c+dq1jmLECU/6W3oWw
	rCFB0oFHlIBhtjwERuBmSacouhsfmkDL9VIAIydJJ/cs9DODRatOU32eSy9YEemmsgSLbXP7OjZ
	Jp6uh2KpcjQFZNNc+3sw9AYi9nB2vUiBvhlH01eK6DYNZ/fxBmM2bzRi9tbMgjZqImTyGLVqOmd
	1FbiELM=
X-Received: by 2002:a05:620a:45a2:b0:93f:12d4:67cb with SMTP id af79cd13be357-93f5803d490mr595358885a.80.1792613099719;
        Wed, 21 Oct 2026 13:04:59 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56d98978sm336971485a.10.2026.10.21.13.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 13:04:58 -0700 (PDT)
Message-ID: <5388e60d-6418-4b84-8a88-5e647248025d@gmail.com>
Date: Wed, 21 Oct 2026 13:04:55 -0700
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
Subject: Re: [PATCH] MIPS: Cobalt: Include legacy IDE ports in the PCI I/O
 window
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Bjorn Helgaas <bhelgaas@google.com>, open list <linux-kernel@vger.kernel.org>
References: <20261015203107.545047-1-f.fainelli@gmail.com>
 <alpine.DEB.2.21.2610201758400.22065@angie.orcam.me.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2610201758400.22065@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 10:13, Maciej W. Rozycki wrote:
> On Thu, 15 Oct 2026, Florian Fainelli wrote:
> 
>> The Cobalt PCI I/O window starts at 0x1000, excluding the VIA IDE
>> controller's fixed compatibility-mode ports at 0x170, 0x1f0, 0x376 and
>> 0x3f6. These resources cannot be claimed under the host bridge window.
>>
>> Since pcibios_enable_device() was converted to pci_enable_resources(),
>> the unclaimed IDE resources cause device enable to fail with -EINVAL:
>>
>>    pata_via 0000:00:09.1: BAR 0 [io  0x01f0-0x01f7]: not claimed; can't enable device
>>    pata_via 0000:00:09.1: probe with driver pata_via failed with error -22
>>
>> Lower the PCI I/O window start to 0x100 so the fixed IDE resources can
>> be claimed. Keep the reserved ISA resources below 0x100 outside the PCI
>> window.
> 
>   Why not go with 0 (unless that's not what the system controller supports
> as the bottom of the PCI I/O space), and just set PCIBIOS_MIN_IO correctly
> as several platforms do instead?  Is there a southbridge in your system?

0 does not work and gives me:

[    0.205993] Skipping PCI bus scan due to resource conflict

There is no south bridge AFAICT, the CPU connection to the GT-64111.
-- 
Florian
