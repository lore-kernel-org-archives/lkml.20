Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793800735;
	b=cwjfQCIhslqao3XWRbipAdDmpO0ZnFT2G7N++ZC6lHWV95DMZbLW7Lvuod1uh+JR8EyM
	 0J5FoekB8JRHnOldnrS4m6Y17qo6Ko5320++JEhNRS0wXKK1U6pQNA8pOgWaqj36PECwF
	 Tx8LRQDfEsUqZ2MgzOSGaDyYKrqKFwqyvv1MHZf85PdihAjbAHJGhkS8/MMaCOXv9d5mF
	 9j4OWYx09sAi3BzRe1hJZbMmie3BwxLfqcI2mujFhXwvE1KE+4DNkFH+bl8Q/G7IXX0O9
	 +ZTA2+UZpI9ICnEimxrcAK6YpLReNakeUw5478JhBhKcfh9P77KpzfPU4ano2LCbJAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800735;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=o4EIHpxl57I6a94RuHg0e1sZQ5iF0hUORfBXfBn7tP4=;
	b=2efjp4qFTVUdeybQ3siM3m7K40yUir+c4bGPbr7XRTzaxucUzjfhHCFnjyUC01zqrDKX
	 jFWIKQT3p2fZjYtZAuRRSaYWI4u7yYawpduLtb5Rux/amSEip/LC7+AavBi+wp9D7tBmm
	 ylZf1T+7DGr1QgSREOXsAix4sUa6WATTCsGQZGdzUmN85SbXJyGMzvhvkN+QBJiqhGjql
	 1y9Efh8NGxM5g3jHmLJe7AcPk4hRQRZtPkDAj3vl4r9WV0EnpU/6Y0vq+BEp9RLTOCJ+A
	 f26L2f1XALMaGTPjsRLDynjhu1tmWMyZeLlHcyiBUtXYNnKmuA6RUOK24FTAJZlqMvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C9E606D80D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6C9E606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so837648a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:58:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793800733; cv=none;
        d=google.com; s=arc-20260327;
        b=OPrYEuJgLyBmD8NjTZz+oD3Dka2npZrFNdmLdLZpTo7cIwi8US+CL5FV0ando7bhvK
         wKV2/WBec8f6+bRDXEkTgInranfn7XP9D7q5L/UHL+rR/0sDWZ1SJ1KKMhAyj1zsx6s/
         gIZbBhaoCqC8Ljyt+kHyTtMQ+dAzwcbAkENAWxgmueftQw/26Ac0+FeCKDE/v8ed0FYe
         L+N6tPuNBjn0D9nV7Hqcl2PDkC/c3rSGjDa8Glb7/KZ+dMHOq4MjDbRhcakrr1aeFKFn
         bRdaoDKhhN4AxFToSWtRw2OszE+sUWficIuxmOzQWG3xfwpAdSks8S/lZgPg9zdcRKY2
         4HAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=o4EIHpxl57I6a94RuHg0e1sZQ5iF0hUORfBXfBn7tP4=;
        fh=83yGo0UGUb5mqZDpl1Pep/e1w674e5KsciZ4qHUK7uI=;
        b=rajHJbRSjy5kAA5lRT3YY+HTcgi6nE+NBt+RJFGvfJpDsNSRAS+4TlreVNd5I2tBta
         3neyiafJqGJmt3TGez4csuzfeNAPZ28My5D6a6QtcQA4N2ZEhRpvTQXqoS/0cB3kOWfu
         1QtNz47NfaOd4zbg5handomRsd4ojfXlxv9+7EdgKKd6Iuz2QYUZMsH+5rHVskSy6DCw
         olTNQYBCAgAK5vmrZ7mvTSmvancJLQT7yA24VP1jkC1QZEV8caEcoBEsybcISlMOykYS
         fc32LyeV/Fj2s0WTanRcjxFDmZ6LzVht3Hx2S1MnCPbxcJaXCEaLR6UcmOwTHkrJt5lj
         aemg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800733; x=1794405533;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o4EIHpxl57I6a94RuHg0e1sZQ5iF0hUORfBXfBn7tP4=;
        b=QC2ngCx5QTQGp2s6MRCHQRj3NVDbooMvVI+16RNngLNkaixAXI/mBmLjp5dlDmmUE1
         JPFj7wSYZqyMv3TVN/J2XGREaEiLDq2RjrBHuZBFg4tcjKQ/iWwxoX5jcfisRrubuLZT
         Pk12xJY5xCe41VlvARM0+CbMihUfT0pi60hp7Y3zoxM4TCTg7pOBpB8Mc9z+f5dztp8K
         LJfynzG2iPI6FjrBtcIUbSOGOlZZmdSnPvHimmoHoELSYG7kxcE/bamIun6UaRWBsynO
         kSuJKCmHJkksfEAiYnvjsXjAlRjjqUg+F7i8Bugo8ufOJfUw47xgL6xHRibpT5A4wVcU
         8D1w==
X-Forwarded-Encrypted: i=1; AKwUvByxJ7MyhxZFzBn/wd70RmW5CkpA9G0EQuaAdjKLKz7WMkhHAqUY7WDrPCaiQmIa+LJ5Hl/7TgZj2RP9eq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Vo6hHmA0KyfB3SsEefrPPPbh3fD5gEKNdCntny5bZxE4qqID+
	lX3eN+USo23YM3wU8aPcx2syV8hOYPZ2k/S94S5Gt5HQqbYucc7mfhOQJvCy27kiHiB3LrDRfP4
	zyjtnE0+r4bGbYKBYZHMKg5cVZVnM2dZ7DY0aCdCDLQ==
X-Gm-Gg: AYBFou0SKGDyA2pMOOKyM9L/r4D+Ev16ZEXducpHiavkbDNxvX2hEhx+aPdtvQMOFKc
	WY4XdEwwqvRhMn7NRZ4XFTTSeyOs4DUdHOfEi2G6wSFsYyCs6zFZ8YOLJQNcpgyZbZpEeSQ3DNm
	eaoJtoOMFjHcUrLKsmksdf3qr9UgjbMYS/wZov5Y6FW/jFDvXx5R54SWBgDyWQtSWSa1lcUjshg
	xtVkeWftS7WLuVnYQDhCaOgnGcMWZMUjiaFvCFPiMiKeY94DbNqSs7Di6t8GHNOHr7G6RlLJHGc
	QI9EYWvqyLD+LzFkidZpIdRyGMrwe6teC3YahnKVNNq6zwbG2TziSb3NLyYy2o/v6js3d0IX6Lk
	ukW4CJlg+tjewzz+o197PbTmU4L+2XLUG7a0s
X-Received: by 2002:a05:6402:10c4:b0:6b1:d439:5c5 with SMTP id
 4fb4d7f45d1cf-6b4d3374024mr8489250a12.3.1793800733137; Wed, 04 Nov 2026
 05:58:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020190319.884375-4-opensource@grische.xyz> <179279532482.3134.8732796861806998047@kernel.org>
In-Reply-To: <179279532482.3134.8732796861806998047@kernel.org>
From: opensource@grische.xyz
Date: Wed, 4 Nov 2026 14:58:25 +0100
X-Gm-Features: AclHuK_IvwAzwzvaVvW3vcX9pBmkxBHmo3ddDOqECYjDXhAMhYt-2sOn-aUE7ys
Message-ID: <CALsH2cwoB3P5Td3SgZ7ARTcGRLhCANSDU9dXake6ty1XAf38Tw@mail.gmail.com>
Subject: Re: [PATCH net 3/3] net: stmmac: dwmac1000: stop hardware from
 dropping checksum-error packets
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, o.rempel@pengutronix.de, 
	stable@vger.kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, aaro.koskinen@nokia.com, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Does this work on dwmac1000 cores that use normal descriptors?

No, this only works on enhanced descriptors.

> Would it make sense to set DT only when enhanced descriptors are in use,
> or to make ndesc_get_rx_status() report csum_none for checksum errors?

v2 will set DT only with enhanced descriptors.
