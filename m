Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426972;
	b=MKuTUgwmclE62y8W/tCYjW1+31j+NTShnCmvinVkQxbejTHNEhnilDawp1UtS42jig0G
	 VtMRSH9ZdeeotPH4iV+/S4EO52KKS3CiMcFyPgyb1hK0USekJpOvASqs3PpNs59oO00fr
	 93hQZNGkCSLVdiXxITnolQO402D11NY4xa/xMOUoXE0qAevnymXMFOk95cipTQz782/a2
	 5aKv6eJlXQkQb37ZVc1pM/epBWqJsEdBtimUrK1csnwbqUOxPzYpRN4aO3nwskwMF3VTA
	 RLa8SKpnoFhg6+kLMYdwFISl4nxiTCNkXI8RhCwkkOCjK5aE8g/RWPQZB1Qt+Cs/ukg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=upfL+B9eEMA70OzYaC5FfA43/7aUmNJ/6D8byJUgj14=;
	b=nlAI2Tr2MEoNsYhXLskWDCwJkAfkbsHDeK40mdG9J6rLVOWjz4kDCyR6UXwYPNllmhUx
	 s9si91doAUUpqc8KJd0XI5vZgj+Tqvx1Sjw0Fiv+OfaL/dCjQDXmLznwGuFywz1/2AZLY
	 mX0cd2f3mDxnclaOw3xBTGSmU5T6murEknhBhiWdoUFK50UeutnaWBtVwv/Jmu8hi3sTj
	 IHDPEmVn5LBYG2ldwKUTXC1sG2FsBk2BDGmpL2OMdnV97ILGXc+j//6O4ghgQhrAFDGRx
	 YXwR+aJqR+L//oaQxkrC+/S/coH6M2STQdYNQMJm0qy3xZY6OMje/yP5LhBVC4P3xrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H1tI7V8p;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506E2606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 506E2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H1tI7V8p
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6300919eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794426971; x=1795031771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=upfL+B9eEMA70OzYaC5FfA43/7aUmNJ/6D8byJUgj14=;
        b=H1tI7V8pjUpsuRRzZxXCHtNfRWQ0HPt2db8FnCzwtKcYlM2KREK94qWkufa2iRf9+N
         4JyI7xr+7Kimla/MYNC0whOkjw5Hzw/EbXDRKjJieN8SuKcTOn65AvZ94wyw3IdeyKQz
         OKcvyNwmju4xiv4NideVKrE4tCS8/KjkJV3BYFL5TndTHT71MQ+0HvajTH9cgBFYCJbE
         6WMiR2/78gyOvJCgk2G7aMsPNPAtulnu73rMZZf71rzArs4ImllTtP5KbtnC2LcPAeb5
         3EvUTypAl51nwPEBEDZEHA+MB7NeIh09bPftYZ+PVQ2QMbjv3YIZlTmsU7YYGbS+nx/D
         aWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426971; x=1795031771;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upfL+B9eEMA70OzYaC5FfA43/7aUmNJ/6D8byJUgj14=;
        b=yP3LXBnWDCPYbfBEZCbd4eHhAm7TW+Ae0AJcyXoT4xqUaEWiNVRhU+wvm+K+oc1VUn
         p6+a9Z9kzzsClerM7GuYsDGAESpR6i9MQoZupW0P9kz0x44EfIaAjMdn0wJJF6QFmJFL
         h74Q1UgYNRyrSjbH0EGqdZ+dlvRZ5oPF9deYH3TOVdZ0MAfp6RUsEvDAEvHtxMkRzsIg
         RbcZS8l6MEx/Aal/4dfgNi8Uu4vsal4/YRg7trZKw54wAhFjRae9H2q0nMWpKaBUL/O3
         9fEp+rYuIWcDRlW+8Fcc0fws0mo7Jz89rIQBeNTrXdnpTZENU5zGggxgpzyFyAnjpEGy
         Wstw==
X-Forwarded-Encrypted: i=1; AL+hErGD3NydyAPTUzy4NpuYhAy8HFN92DfW5qsnNznnI+0yJTwTl0BAgQ/d7FowGefxThtDyY50TaFlvFYwZL4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c5K1RF4VJrX3fYUPFYdlsVvVbdNROcNo4OdUQe0C7xZBOXM9T
	7cbQizipS0i3gHeRzJqmWNq63WVIxPooxEgDkdvTNWF8AnS6AYvBzkcd
X-Gm-Gg: AYBFou3XHIwuY3N0lDVPSTpcJi56fbN19m+qd44zlebn66XxhKjoPp0mXIz8Z9ewHRm
	Fdci3wtLJRq0EcbfJMwHxUT+cxPdKC4zSR9xJM6CVGiCNDwmXycJGlfFN+wN4bN4N/g1XzxLhJp
	roP0OF7/cgfy06SAFXWhXxqSW4K894IlNHLZerLGg33a+amcSl7/aCG3t/FLZ53FdqEJ5PAv5Xn
	iSWb6N9sSEG6XQ3AbHC/v+eDGsh5UZehIfBiBYY8ZmH7bjgcmKujUVSWJAooUHGi22Y9qxAxqBH
	4Yr6rLHFjgCJ41KuVlyXjZw4vZHb2z/jbx9sgsTlpUA2bRxVBHD2R3A5ITjqfQi2ItCmwddk3ZR
	kCx13uW6BTJ1+IxNyPdXzA8u3muVDX+Sp4dqPFf3LbESsyJ8Sm1hQpD6vqMg28lSlDCrVhtF0Js
	9HCjhdRbvXFiHgciQ+7d1mpp9zRyJia34SgsVfj938RwfeDe5+1l9ADa3FqpO9LMeRADA/3z8ZG
	nk8XL+fQQ2xsflgYoqaUv5ynsMT38w+3r4UAymR7ph2Yk7DRTtEnao/uzyaE/9NQKiRgTuznWKD
	HBYJFE9lMQZ6uRJ069yppPw7d40ywoP0I5Y5MBc7Yq6ryQA29kog5Jo086L0WblfIl9Npn494FA
	6SdNxx+RcZJbJcQ0Q5aT4iTLoxQ==
X-Received: by 2002:a05:7301:906:b0:35d:4185:5395 with SMTP id 5a478bee46e88-37686171e97mr4425039eec.16.1794426970704;
        Wed, 11 Nov 2026 11:56:10 -0800 (PST)
Received: from smalls.localdomain (ip-198-145-71-161.az.bambroadband.net. [198.145.71.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512b6asm17414286eec.10.2026.11.11.11.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:56:10 -0800 (PST)
From: Hunter Laux <hunterlaux@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH] MIPS: ingenic: Let Config.VI tell whether the icache is virtual
Date: Wed, 11 Nov 2026 12:56:09 -0700
Message-ID: <20261111195609.2694096-1-hunterlaux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1a6aac61cb167ce0eea611afe73e8c87782edd43.camel@crapouillou.net>
References: <20261110-mips-xburst-icache-vi-v1-1-efba689606dd@gmail.com> <1a6aac61cb167ce0eea611afe73e8c87782edd43.camel@crapouillou.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Paul,

On Wed, 11 Nov 2026 17:23:31 +0100, Paul Cercueil wrote:
> The docs I have do say that both caches are "virtually indexed, physically
> tagged". So the patch looks good.

Thanks for checking.

> If anything it's missing a Fixes: tag (with stable@vger.kernel.org in Cc).

I don't think it needs to go to stable. The vtag setting doesn't cause
wrong behaviour, only extra icache flushes. I can add a Fixes: tag
without Cc: stable if you'd like the origin recorded.

>> -#define cpu_has_vtag_icache	1
>
> Don't remove it, set it to 0.

The Config.VI probe already reports it correctly, so I left it to the
probe. Would you prefer the constant anyway?

Hunter
