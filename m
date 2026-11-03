Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793703678;
	b=2+6f1j2YLjeYzeBazuiFk3sHxLPP0Nhu9B3VTNuaw1LaLeX0iWkA5lXv5brYkMvRVQC6
	 AvDAyiIMTjLfHsyvy9IbDCio2tX4wKuIZMGKI6ofkFIkc7NNENthchN5oaDXQF3jOXhpz
	 h51VfuDXyleycRH4koIINDvYGNk8pPyu4shL5JLOlbhX9hvi/hpIRiSpWUIZU2/6VcFns
	 ZLf/yPaNzF6F1yMfhmOO5QA0ytmk3tIkFfhwOynN9EJnRVuUSBcU/RO3mERqx1Oo0YcNt
	 7TZ1RiyTYN5FtqMRKIOP15LjZxlwBKaK/NWf+p7gnj1iw3cKfLIQncnQ6PTVNfr/VEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=sn9Od1d1g96GmgUVpWI8H/bAOkp0jHvgb53RStXQYfQ=;
	b=F4yVGdkQgY6VpkCyF+tZs6d+aFw1+KmdUyz0lxxIJkBlAHGjD2xUse1vF96Vx0CAXUbI
	 HM8KYQOtDuagzVK8IKZ6VYupPzxmo1APutdLTk5nsagVi0peAQlE+OV7sZHzQ2kQk4KYC
	 0hCOg8xUxLjDPFuibgDJ/nl6C3lsCKvywT0XrL9jAZz/NQNZSSMXDZgtLIykFXjvZjgnF
	 aqQcsoKI+XK2KZcUMv7+CnXv/aLyMH+53DAcxQQtAD73yRV0JEiMigy34CpFVVXy7MLbS
	 w1fnKmpiP1En1TZjCiRoR1CMDD+C1jV9hOFa9ggL1+rQNGnZVEoW+pHqaxZtezXzpWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Pz3Y4KMe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68184606B106
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68184606B106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Pz3Y4KMe
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5364d86f7f0so56408651cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:01:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793703672; cv=none;
        d=google.com; s=arc-20260327;
        b=NkQGG+G+ZarWb31a1wc1FhcUKhiAvdLcjyx0l0s9ts6pjReLa3H/UW2zRUbR5F32+Y
         7ctR5RMeOX7DgdwLJT4WGroNGR7F9BKANKjngqymExPeTrZfugiR+hDceH5MnV7ElHz3
         GfvB5oUIPuN61JrmQFZcSBGYbReWfuC/7VKZA9NavRjFnehdaiXZhTE8qZE2v8+8XMA1
         pb68EB2UWvwfH5uqydbFibs98Sx/afMuiDsa4CZZdHcF6ruL5Xqvoohmjb8TuVphdumo
         BvcB+l4S0MMEu8k2mjW+UpQu9vOXOOinIjP584xI1GGvtvcex6uNUjL53jo00c5FvAlj
         mOTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sn9Od1d1g96GmgUVpWI8H/bAOkp0jHvgb53RStXQYfQ=;
        fh=DbyubBG77kn0gUt8BR4a92Ez3JTXuxcb8i7/t8m8588=;
        b=aAc2NGuQOgH74p5wiwc7ev17ZdrQNnbzDPgOno/sumNSG5DTrfr0cbErsAPeDxC/T0
         fDnTqVl58C3gXjiAXZV/2zlDsi+ZyXclGyHSTvUhyRehdZ+8KEHg283wFmUMgqEmmZQm
         OKN+SuzX3YE11AyiyEnb68bCJfRc75j3nyoy15wdsldcEYaIrtZAgRUpRPGd1I6fSwSA
         heVjAAtPS9W+/9GLZ+786eIBQzkKiNOpmxP2+Io7a8hf6IWXyxHSdFk8o+CwDxfl2WqN
         bEBn5vhFK75hLKuRmQToZYVI7N3F2d8ym0iBiCJWkqUmQB7mvX2QfQNo60G4NWPLdjpw
         EzjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793703672; x=1794308472; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sn9Od1d1g96GmgUVpWI8H/bAOkp0jHvgb53RStXQYfQ=;
        b=Pz3Y4KMeK2eY7RaHYtlKu1J7sH+3HT1AN9Y1jhkU1u1BzolllJGseg6l0Oh+TO8WmZ
         I787+KldE1OJsVNQ2eZ1lqF2kjDacSGnXeu/o+LOEpxQXmQVkfUFpS/62LO1lxz56G9f
         RkPsCCf8TfPczShU7BO/ULwQqV6l2XIQ/vMOl0YzKXnRMgfI74WdLvnUjgSHxJUWWSok
         iUAV/T1HLxAGh1up7gSomvRNV76+6VaXaQTUcMC5ZBRjgjs71nHOZ27jLrBWjrnoqx7k
         oQDdoOjRZnn9TbtLI3DhY2XCnZ8HBCxPVNA6+eJIfEUPR5CAJ3UmuUeWgkypprr3KVHN
         xFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703672; x=1794308472;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sn9Od1d1g96GmgUVpWI8H/bAOkp0jHvgb53RStXQYfQ=;
        b=EwpJPJjzZ2tbUYgCXwnXwcNk9ZxbbmsZbh//t5y7QkAfgv6ChsOhoPmO7D2A6OU7FD
         KFS2wbuv/XuuB4AKlEJx5pm3s3gUtWQYe0BUv1O0Xq/Uv+G1uhSjqExvfey3YF7nN1bg
         MQPQ3wKSKiqWJZkmjLMGt5oqD9pLH/JN9O3WuPk1BMQ45LvM3OEiK43xLSjOHlQGKcW7
         RNSL/N448SbqUNbyLjCtz+Tu6IoqwtbePqmFNIGDi0qBidfKEVxyWY+U11/AOF+21Ym+
         wdmU5hhNqO2bmht3Bwg7NA42WIowDDfqayu+ilsMTMipDrU03nQBZ+kAwo7TntADhw/l
         YPTw==
X-Forwarded-Encrypted: i=1; AKwUvByOLaccXGHIvq7woDQ0usj1xcjz8MBI2n6MQ7aOm10Hvrmjz6oD+8TqBcgYkiZYcdp6Pp+UB/oCG56LtK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ai3cNcJfB7ZBM3yZFfdXapLsirSXfDYJF2qJERms5vr+InWYm
	3N323rjQ1vyU3JcII33NLK/vZJqK6h06bsCYp8OPf1sBecIm3PkhR25GQ5l4djf6CM8eBTBlFVD
	D+qjRyqW2wlLLUlSTn8Pi1W5V8Mq33boDiGj87HT6tw==
X-Gm-Gg: AYBFou2PFpMV/I8ncfe8dsqgGguM28GShPUt6pj3R6VVEbSRu8c7VdISeW+f+tJXIKd
	xHXK/m/JjC+AsbzxW3pcqCaX9fb6HTjEHfsgmwGzCxcDYaSLGTtfPgZO8dMhq9JIkoh9MMqPW+4
	XS2yerY377FgrQ+FDMvRBTiJx47E7XUmt1vsGFdfjBsM8NETD7wtpf5Vxz4rOWzLlkoRaoVSryd
	bTyF7XUz/5Hk2i3L4JF92sgVnoDpcIFM5SxZ/3NbKsukE1lUGp5bVH7Ue24H6nVMtRBrnGmO559
	oSw/h+dVBY2ysiO8kqoF7MPH72SPkSvniGm/YsQTHk+4tNANSDETHNzgyYnPyJpjL50vLgZnMpQ
	1PkcDGZWE3LcrifQJE6NLtDVJ3NPQY70aHk2YrO1HFMXlvUyl/IYVM67kOCGfEGCZOTLUhMo=
X-Received: by 2002:a05:622a:1386:b0:537:f05d:6ae9 with SMTP id
 d75a77b69052e-542b62a5744mr204134421cf.13.1793703672263; Tue, 03 Nov 2026
 03:01:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-acpi-mfd-v1-1-d61029971be8@thegoodpenguin.co.uk> <aum3RLDLDa1gllge@ashevche-desk.local>
In-Reply-To: <aum3RLDLDa1gllge@ashevche-desk.local>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Tue, 3 Nov 2026 11:01:01 +0000
X-Gm-Features: AclHuK-r_cJD1goYWPornsINa7shzhekDP8lLl1_99QVlK0QEb0lwrUHquiGssM
Message-ID: <CAA6zWZKqCpD8GLjnTwAOnBq+Uhq0fA=eCRm4tkX9YDeiC=h2mQ@mail.gmail.com>
Subject: Re: [PATCH] mfd: Use named initializers for acpi_device_id
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Zha Qipeng <qipeng.zha@intel.com>, 
	Qunqin Zhao <zhaoqunqin@loongson.cn>, Thomas Richard <thomas.richard@bootlin.com>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Can you split Intel LPSS to a separate patch? It will help reviewing both parts.

Sure I can - will do in v2.
