Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794622662;
	b=5FmGl3naOm4BLL+xoj9h9iYoVktgImn3S5ag4t8Bsf6MrVTtDh8ROfA3A5SZOcQgyLPa
	 TdWa3X39bg6HSKKHGBbaOYQ/kHEHwU1gxTA3Afv3qF7ZjoPCxxl5Z3LdNMdhPUor1k32r
	 1jXnCf5or+QXDUZwquoOxJx2v4NaPEzqHTZPBsSMurTPFEzrlHzDZatBVIdGbcXjQ7TrC
	 vcgpF/b/cQa+hna0PIxvMTK0eLXfnZ8pXIyKg8/8vxh1smaE/kZFahIW817sBeYTN6LMg
	 saLsbC6rr7UkgphkngujZ7GXWrSq4ZkmaKJ2Xyn9IJ24ikRWOp2eB3Agl1xmijl1TLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794622662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=OfIKBZnhOOiL2WcgTc07r4rHGBprvyQL2SchtUxUdKw=;
	b=xpyMeNk32Ai2yPLQY5uc2tN4NT9EyJBqVL61qnSD6eS2yQ3ruMCQ6a1+Bf86rxnD21kb
	 RHv29lZF7qLFFiqYpVxDISxXJF8Y8avztw8uTfSkoyUVWZFBTvK7AysNaVnwbiMn26QaK
	 ALumcIJ/hjEiONmZEReWJiygMeQg3QouWulNdmBdFtMm3b5xAbacYRdtLEAGAB4hlh9UW
	 6FkqUYfxzi/IR2CyXhamHsX/BE6sIKAcn2pFQFVKIchgEZa6Us69Fct0z6Qm23pOwVABs
	 e4XOuuPQDzhNmErPmvXVLhbKGK/PXtuR7Izt6GMKrilkxnWjJMlUFkzKMIuzivcke9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBTySpgG;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85059606A33B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85059606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBTySpgG
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1058472eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794622662; x=1795227462; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OfIKBZnhOOiL2WcgTc07r4rHGBprvyQL2SchtUxUdKw=;
        b=lBTySpgGD/QnNG/ZxyjrFEiehOFqMoyUzvo5UapiKvWUxbefYbV/Tnr0dOrP4gcfkF
         FY8pZ5GK4hn2Ypxb4dspKTumrL7ODfcwrTWXU2hMoOgrNSlHvyAavT/Bw88ykGvlknzr
         alLcnJKYiR4CqkHanHmZJ5Vd0nMLkIps4gxSjrb6oJfx0lyA8suUqcF4ujAqK8YGjJ3E
         bZhPCUv10u1lZ7vOMWJF1dU7DzNGMHdzLbAhRptsSSZ8NeRIoY5afLXlrmnv4St3VKyJ
         g7YQgUjnNKeeCa7AgWrmXgP2PSirrJoPYMYarW9zzL1cOXx5AXJ/FFwiwASYHvQpyaiN
         j2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794622662; x=1795227462;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OfIKBZnhOOiL2WcgTc07r4rHGBprvyQL2SchtUxUdKw=;
        b=RaFrm7ivoI4pECTaiHJJdmmcfOHpjNZzYa3tNqz5CFjGax3g/vBB5asmASCa7EnXe6
         +5YczLU1bf55IScnoAkdscDGfpVhTpdWq5AD6VXCbZ6Do71qEj+JwXi4rI+gLiLtEF91
         W1gxvhTXPM0NSEv7tqYLTcuekRbo+87KpFqqWJ+oN58uHXiJOWOA2HHgdKJtZTPbxIK/
         0aac1Db2rNPDEJHARFgNYpmQjlGTHxqc53HQu6ajT+lwEAYW0u5reVaZviJt30bXI68S
         AwaUSLv4ijtdpsvS/ICWWPHOWdqEBt1IDsN8v+28Xix6P1Qede20bDq7YHuryEV8seJA
         5eGw==
X-Forwarded-Encrypted: i=1; AL+hErGY6ISkNCudEI18zf0xe0vRxJtift9HYADJE1ebYApGIxWyKDDInoMNxYMk0lHqOB5nArVh/6qpRLOwA4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QaEoDPVWk8cUp9IoX7h2eFVReiKdkjmROvx9uNx8l5e2TrVSI
	NcJQr/9c66FoNlMv0SB6yHxYrQh3GKpv8lTuF5oxPBYuxVBwRvVGGgJ3
X-Gm-Gg: AYBFou1RkfAe4fyfHqQnd2A8FIY1W4ujGvMYEyFaNaSvFqIMU8uB20OcAJ+Nj+/lGbB
	P5jLWRP6RyFHWoawG+6TvelzIT5lYBzsb7kuxI3vhtMAcTJEDU57FGjzweYIjgybGluMRMU/UsC
	EmI/2t3Wvo9fUBlilWkl+Wqpar4KwMJ+CHz2xMSgGAY3LxHPAZeIIDP5Oiv3zV/c2lQOVn4ntM2
	jZ/NYJv6k/mKdPmTynVup/oqCEF2H1F+OyMuiRsVkCJAcenTH0ZIHii6Tq9yiz1C0bydD5s72u9
	yv0J+8MuKVue2JRjc2v5SXglcrGFxo99muPtFpAE1mtNpuD7rowlQeTNEScthK/DbkKPGdyewHS
	oQm4ruYdqrTg59EhpvtXy/HGfwRQa6fje37gRLK0ayiqmFezDxvehjOhSQga7ukvk8lX6zWg8zn
	MM1PRjb+NeXkxHWWmAvtqfvEzlP4jXJ1XlKqYQmd1Q8LsKng14i4GiqHIe9Qisvfo/aM+X+Vb6r
	M/Xq1/LruBf/usLkQxXQGv9Xt8KsWQa6/l47D5gfx1R8FU8uRgh0jp4xk4JAnKH5GZ8zV/TM4YQ
	4J8qSggK37kmCK0rZuy1sqofxvO93JlQrf/WTiwreKP6Ig5nB0Y71X6s7cj2RYEp3bKjkEPMmPh
	m2FoH0bdbKD1+h06eYqEnpUNs
X-Received: by 2002:a05:7300:c8c5:b0:379:e0a2:1a1 with SMTP id 5a478bee46e88-379e0a20687mr3206612eec.35.1794622661423;
        Fri, 13 Nov 2026 18:17:41 -0800 (PST)
Received: from [127.0.1.1] ([2602:feda:30:cafe:ec49:38a8:0:1866])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm11298969eec.3.2026.11.13.18.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:17:40 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [RFC] spi: handling a stuck queue worker during controller unregister
Date: Sat, 14 Nov 2026 10:17:37 +0800
Message-ID: <179462265760.266954.15125504985835019625@gmail.com>
In-Reply-To: <03d73980-f558-4dd4-8ec1-a8d40bd2474d@sirena.org.uk>
References:
 <CAGTEBTY2EhOHwmWhB0_YdnP-nMyGzzhnwH+ta9yeynHD-Y0JyQ@mail.gmail.com>
 <03d73980-f558-4dd4-8ec1-a8d40bd2474d@sirena.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Mark,

Thanks for offering to review a patch.

I tried a core-side fix for the unregister race, but found that the lifetime
rules need more thought before the patch is ready.

The original problem is that spi_destroy_queue() can time out while the pump
worker is still running. Unregister then continues, potentially releasing the
controller while the worker is still using it.

I experimented with tracking active I/O and waiting for it during removal.
This helped with the original test, but I found a problem with my accounting
for asynchronous transfer_one_message() controllers.

spi_finalize_current_message() signals cur_msg_completion before calling the
message's completion callback. In my experimental patch, the pump can
therefore drop the active I/O count before that callback returns.

I confirmed this with a fake controller and a non-sleeping callback using a
bounded busy-wait to expose the ordering. spi_unregister_controller() returned
while the callback had entered but not exited. The test produced no KASAN
report; it was intended to demonstrate the ordering, not a separate UAF. The
fake peripheral driver deliberately left an asynchronous request outstanding
during remove().

I also found that core-side accounting cannot protect private resources that
a peripheral driver frees while its own asynchronous callbacks can still
access them.

I've stopped work on the experimental patch for now. Before extending it, I'd
appreciate your guidance on two points:

1. Is it the peripheral driver's responsibility to stop new requests and
   drain outstanding asynchronous callbacks before releasing private
   resources in remove(), including requests submitted during removal?
2. If a controller cannot terminate an active transfer, should its driver
   ensure that the transfer completes before unregister returns? Given that
   spi_unregister_controller() returns void, would the core need a different
   contract to handle an unabortable transfer safely?

I can provide the test module, logs and experimental diff if useful.

Thanks,
Yaohan
