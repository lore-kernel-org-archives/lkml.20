Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695664;
	b=fbhVhNFFnASZweHcE++lLkOiv3cgPeW6U3/En3ZkREZVZ4W8NsTyG8VKmQmlVw9rubnZ
	 Vme4XSSo9kyhC3BJuyDxI/GNtqRMTVkZNSIsXI6SUaDD/PFSwYa59JBL2xCODCpgZGdEW
	 R95Y+0n/J7Kdh5LIKrruxwnD3f3Q7654YGDeQ9Ow42NT6ShBwuFxDDjRYA4atsbdIqGHi
	 nugNS6yFkoWPKYAdHVYtv/ZCus2YF6RJmlVlAEUVhYNbkVYyRsVNYjTSz6EG3FsA+Tihq
	 +I8EjcVo3BTnTfQ5nJibO8U19b8uWXXvBASSy5gW8ZZqkb/OnZOTvJHWCOldORqxiJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=B+BHED5eRoDIkE3I9oNS1EqLCs1mF8mondSiDowJlEA=;
	b=ndEaaf+bdMDTSHF2sIwsaYDE1dFojz/iDOM9WJx8Sn8NFNzhU4wzU/uJdtu7cjTR3gq9
	 YBuCYXNy1Fmnsa9Fu+PZB+AyYD9z0ybIKEh/k2n7I7qq26NF6sMedhXMMFgkCRwWPzZhu
	 TBXYcFCSup2ajK2IPcHOKEMeZ+E3X8ZG2hUQUPTRmRwQ/pVrFBOUNTSvnHLAa5hKEW7+j
	 IO4OXRxkZhCQhkFjL+eNMBrOepiGDEpfGZTpaHanSRr4KI1MepDAVZTdBOZBflO3MT00G
	 //GFVuiRicWM6PjDhRd/slzG39r7OwVh/Bq+7hxz9M2EFHtwOvshv5/hXxANGkWoDMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJ6rLKic;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8B4606A33A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD8B4606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJ6rLKic
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a064fac8cbso2574087b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695663; x=1794300463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B+BHED5eRoDIkE3I9oNS1EqLCs1mF8mondSiDowJlEA=;
        b=EJ6rLKicFs/V8t7AShlkaCPJb3//mmq5INznbJek8qBXVZ9a1t/jAnD7/+Xb9DZmQF
         Sx74RVj3/48r4oYff39D4C18huhRZ2s8bZS3a7QMBpuivzxHlEO+pI1J4s4gA5lOeI3i
         uLMGZHXmFEAB2Twxo2vKzzglbOi0kb9Gb80Sk5tuz2dMR1EVDTgTSBBkqBGlJo53jf3E
         4j8igUqCS2eiO+JfrTkJmVgqjH9KL1o5QX1NwEMklesE3wTjLKvFiCskEDmwVkUd16oE
         d6NGJxxNOAdipqW56OkPx9zqiw+IAqgxO0esQKI0C0ZBbZZAzDZoBXK9VinfKJs0gtWA
         S6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695663; x=1794300463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B+BHED5eRoDIkE3I9oNS1EqLCs1mF8mondSiDowJlEA=;
        b=TEFw+3dqx/hqDbASANAOq7cOmKxr+OijzXAgugL0ytLyUmEk7Zv2lqVgovOoOMY71a
         LhvLtFzRED2qqihsMKLGbN1+9WrYQiuplY6M4n5V/Jg5wj0spxGB2RnAW+RyUTNu3654
         x6Os7vfmT3m9SuaBgTcNsfMZ3Fz2qe0nBQZxts7xAdC3VyRdLid0hg+x/heL02T9z/Py
         Jc+NtYAQoLAbE2o0/umFz9vN63cGHp9P6IyTbF5AogjsCS1+AaA+XvRD/TPsVjtRBIjf
         F7Aseg3+cqqmjayFzXAF/JcJyIipxqPBsF6MnjqFN2FeMFnyTP1CfME4u1eKTRQRBAjq
         Eshw==
X-Forwarded-Encrypted: i=1; AKwUvBzKZtC+IoxzFd2FAA/V2IWzW3C2ukDZ12qvalnRzk3EYRYocUM53g+sNlcUUQs+jmBj8MZxE4/nMqEpaWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dIEdG6S5CrePId3zBfX3+1j7n5fx7MVi8e5vIRE5OuptIFvvZ
	rJXbSsqvaw6NxXBW4zoKV9VUUjPADz3SGc5znt6mS/FNfzkTgZ3q28zX
X-Gm-Gg: AYBFou1kSgkNqQvtVaGst6UYkHYtUDY/2++3dxGAc3XLwlhRlJgcb25kFYUF+08Kxht
	IdeE5KkjXOIK0eZu2eyKLNWJ90ym1elGalT4FxgeECt9RFYPX7PxZqPs1Ava3yfYMCOqu32mzqS
	Pt/uKH2TpW7xnPrq7FPqbPKS3+kj4kUYGbXGnVtW6RXv1/k4Fwcql+3cGocCp8+g9VxuOKksiTP
	fPxo4Z9Uz03awX1LwPvY3CGhnzhwuIyB9uKrK+81ovUxPjn4XHYoN5uUUF3Bsb3McXypRnwTUaR
	dLCuHgGlavSXKKOPb44Xi78kEQjKgmR5AQUrt/r8FZqWhpZD1vl/NoJBAEBwJHQ06rvqxsYsOjs
	NlxId6SybSeENjjaxy1I04HbaEx/ZvrsR0v97wL+IkngA/Uq/gLX/N4pSmwnlIz/N5/bhynwaHu
	IqOA8jp2IV4HbM36/pPS5UMDJssmdetjo0Tgp0mP0X9PQk2DMOsSMSyyK6T6mHQoH57Q91rJmCA
	zF1RcndWM7V8xxxBtWO9MnBjXAxxvOcADgbe6PholFNtDe2D5xVhlzYoScUQJzdtt8V6czqW3o4
	EIpIRaSnI/sknNl563UhlXtXHw8VmWElCojOktqVoNrl+z5u
X-Received: by 2002:a05:6a00:4b4f:b0:89e:fe2d:abe2 with SMTP id d2e1a72fcca58-8a9bf90cae1mr10126228b3a.44.1793695663009;
        Tue, 03 Nov 2026 00:47:43 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada9aab57sm2844023b3a.46.2026.11.03.00.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:47:42 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: T Pratham <t-pratham@ti.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: Re: [PATCH] crypto: ti - dthev2: fix empty-list wild pointer in dthe_get_dev()
Date: Tue,  3 Nov 2026 16:47:34 +0800
Message-Id: <20261103084734.1996045-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <e9e36645-51c3-4099-9c5f-063224b479d0@ti.com>
References: <e9e36645-51c3-4099-9c5f-063224b479d0@ti.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Pratham,

On 10/28/26 12:26, T Pratham wrote:
> Thanks for the patch. However, this fix is already in works in this series:
>
> [PATCH v10 00/15] Fix several issues in DTHEv2 driver
> https://lore.kernel.org/all/20261016124456.1802080-1-t-pratham@ti.com/
>
> Specifically this is the patch:
> https://lore.kernel.org/all/20261016124456.1802080-2-t-pratham@ti.com/

Thanks for the pointer - we were not aware of your series. Our patch
duplicates the dthe_get_dev() part of it, and yours goes further by
also fixing the callers, so please consider our patch dropped in favor
of your series. We will review your patches instead.

Sorry for the noise, and thanks for the heads-up.

Best regards,
Li Ximo
