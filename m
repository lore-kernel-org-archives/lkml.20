Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886316;
	b=h+HhXbkXH5hpXu3oaXTTX9J+ZreQVHc9wdnXjrTY3H5+O7y3VAPU6OVyCmcSZ/Wky0HH
	 h4Et49mimVOflsWYUHJP/WuerKfq+9L7q+4Z+t8jBIF9mTcm2RfGUtCtQ/0DyFvIe+s5E
	 D6OqdCQjAIneZSOPlZ8S4q9cu1Ej2U1wGGqiF7Jysh/wl9L9EBOWeC778cBDjMpUEObIS
	 CnkgV0vUOsoH/cBhNdYa3DPUNayzS12qMlItnBfo4BeiKscCU8ubVw8W6HzLVTARaeAny
	 L1wqC7TUROaezgFQDlo66wbGqJ61JXKeP1MG2I1j50Rsu1Z3+b2rfBx9KC9YPD5hIAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=4SSzib5VWeur1UFjzFHifegpVxu2wOnePo4bxIewHVU=;
	b=vM74/K9NjXcuDyoANKMBnrxA14I9V8Z+7unkYRk1PNc5q+cJPxIyksnxisB2s9PWiXT+
	 9Fu6UyeHx9y9zb6D0Ov8xfuJ3OSLGGOMlFP+7rFWnWBRD5KcVB9Nx0sdbbrJxBkyLBuJk
	 V3FcDVgqrz5syB5fCpAS8yuqONDVSRRTtVejZS+bUmZmEEp3oCmHqvyt92Hni7xhKCUAj
	 9jA/oEWuj0eaNN1tQmEPH8SAafvNdHIC/q7+Nt6nwYjt0lFzTRDfplBTe1H9R3t7foaWR
	 06/Z7edtSz7cCIH3Po4W1+JGKMuFB11bIjMOpWpN7oJZc4Uoy7gvcmUKQ9MEpXYMIdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EmqlH7ni;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C38606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39C38606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EmqlH7ni
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so14938805e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793886315; x=1794491115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4SSzib5VWeur1UFjzFHifegpVxu2wOnePo4bxIewHVU=;
        b=EmqlH7nikgIUs4lABse+RVCI39H2DzVmBvEa9v/whwmVP1aJYm6K+0hXifFOneR2xf
         AJTZxNfW0Z/lzWGZJOK9CCJ+55az25Q6zozJmr7wV1IJubS5nRy22RUQiWU8qXJtP6uz
         RNnpwtepATRAe6Hk6MW4amrYTwZ6Pr9a1tdYk1CoZEWqLR2ZHO4nQhWXdg+Gi+yOAWJq
         k7oY8OMOwFXCS6sXu7+q7/49+ivOCZe8EqNqTeJWGwPekbDPNutVUTiDfvK8EDsVrmj+
         hhb+6HpZk3eoEWgN+6sr6NO2+3pU6+f2FvxJfxLoRgcsNEd+reWWaHpq+jcg9bcdxQsE
         d9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886315; x=1794491115;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4SSzib5VWeur1UFjzFHifegpVxu2wOnePo4bxIewHVU=;
        b=ZI3zYY6k4AZZYFORGvkjzP+GKJ999GjFwjoAKpYoGy4pgWgr/Rtx+yYQtDTzVUHvi4
         GRwcC28JaEoHRjXKYdaj6j9UnDWRcUZxoJSdHyTG7NYpPtsbfuuMUw0lnKKKZD+g6stX
         Oz3ugLrl7KVYmwnjnQxYcB3ex5qRZdQzmHBNnFnP3QTaINf6Yt52FSb+D9MIez9bRPox
         w5QjE3Ov7NGDO3Vx4trTQ7R35y+BDNgAk553PyXKkTgBtATHiPJuHL8A5BmAfaDCddpV
         b7U4UZIMwjAqrv6BDQ8kRESQCzoKxmibWVOLNAbs+7Udmtemv82oSgtiKYX8WUCmAcKo
         tH8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwt8tUiPiCmNR6VONtmDsQ+hfhjS8Qa2Q6q1Siy3UTiMVLxVyqTeEe4LLwjBog+Fqr6XrzS9NjPjOBIIEY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y8cwRBWpDUJedV9931NSQyrSOQIPSpiMN1yK1zjmMXv22smjX
	nzBOBwVEk0ivLF0uDyEHTkhLq1A2H6g6zSQKfVG6APjpvKE9yOJlgCXC
X-Gm-Gg: AYBFou1xgHIwDljSDy5duxPnHHp2HnEK02xDS89o3qD+Ew10gi8FHtgXjV1SXT2SJk/
	SFKyv0bs95J+JTffoOyNnM2E6bZhEnf03I8gV0W5mjzwIFUzEXeuZhbvRxFpwgjzmgPoqOgTcVW
	V7wu5tH8pwKWo9hvNNvj1U+8gHzwf382dUcrJ7yLRKUAdmAJYiFDIr2g/mSPFoW2uDFlvNc33cN
	H+Q9HU0n1FEdA8xzM/SA6YHITr03AzshAaIpqk1IscsoUbrIYgl+t7xuBYHZfNp3cXueDOfvwti
	OB7ZuzlOB6aNygYi/gQk+5AaaOhTIdEhHdEJ90qEMvmdqUFuUDgpv39VJXmLeEbEm/ma5a/eOfx
	gZTSpugBurdXGch5UI5QFY0rs6YrjNTa8E5xlv28b+kENX7AIwvU6j/q8OPL68abtMQ4Eicy2r6
	Ayp/l6bAvyVb7/mwslVAIa17ywrU7kmTt6O7yzBoX6Rz7IfaE+vsk4lBR0IjSyQY4uyy9ucfYgi
	5RQFvvMBcDpcgT05TnrItAnLzfxHo1J8D6yEJ3qsyac9Grhbg09TqknpMOwvkYUmZfq0cC0UMFk
	CJK1Piqi+kcW1l+IjSYVC73luylN8mCsq+HHkyyqmEb7oOaJ0HArRk+GKtW3dolw41qJtQ==
X-Received: by 2002:a05:600c:4714:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4ac180f1c7amr420433645e9.12.1793886314348;
        Thu, 05 Nov 2026 05:45:14 -0800 (PST)
Received: from [192.168.2.178] (109-252-159-107.dynamic.spd-mgts.ru. [109.252.159.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56eb4da1esm110800005e9.6.2026.11.05.05.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 05:45:13 -0800 (PST)
Message-ID: <3018a4cb-d986-4c77-a472-ca4d1b83c3b4@gmail.com>
Date: Thu, 5 Nov 2026 16:45:11 +0300
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
Subject: Re: [PATCH v2 0/2] mfd: tps65910: Use modern API for poweroff and
 restart
To: Svyatoslav Ryhel <clamor95@gmail.com>, Lee Jones <lee@kernel.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261027152423.194794-1-clamor95@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Content-Language: en-US
In-Reply-To: <20261027152423.194794-1-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

27.10.2026 18:24, Svyatoslav Ryhel пишет:
> Switch to modern way of registering poweroff call and add restart call.
> 
> ---
> Changes in v2:
> - swapped to use dev_err_probe
> - ddata is passed directly into handler
> ---
> 
> Dmitry Osipenko (2):
>   mfd: tps65910: Use devm_register_power_off_handler()
>   mfd: tps65910: Add restart handler
> 
>  drivers/mfd/tps65910.c | 36 ++++++++++++++++++++++++++++--------
>  1 file changed, 28 insertions(+), 8 deletions(-)
> 

Thanks for sending the patches :)
