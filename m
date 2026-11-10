Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794300362;
	b=zaamZTAVBJ5xtNHIL2n5QXhsFyHGX6A5BmPcmMz5c/wsENkeCdfMLPxVxOhrP9/VrXKh
	 bMNh6+X0ZE+4en9PzFmwPfd86c6SrWSWcmP6uR4hqm2HAYcQp0YrxbCNL0fh+h7Xfc+ol
	 lVMKFZwiJanBvdryVBmsq26KsQu0nCptDkPrlS2mjOrroBEAriuJ2VxKZnAswmDpJXyWl
	 zE9V5GahxMCqGT/rziAQLlFFcAivxQlpOt5wYoA4AHxAFqNqZ8INZHrQmpM9dYfoOt0Br
	 YZgpsdGxADO41gwBtTBml1lfiWi4ytEft+9mS6eKt/j4caEpX4LQ2dFWm305Hq5y1pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794300362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pDdwdwnPkDpwaUGvrR+GyxsXOY4KK8QRKqRhYcUlZH8=;
	b=41ocnZEAYskoFrZQPj1a9QCrmh8s+PcwU1bocNqWOaWW8bjStr+CQxWBkaRFkb5pmCxp
	 ytMrVxJRz/q/6MTTfBatjM/PTW/w/GlJaFxu6C1NWG/lDTCd2INUKkaA8OuZGlgTd3vkD
	 CVDHssSiY7jgPlpNZV4evling3F6UjXK1yAmUfeRGWWt+EqMAJt/pWGsPLxGSmd4+MFD2
	 /NkCTrJ26GZGqmB6/6o4396OWTv484uwd3nM/K94ejF4FJbdy+Ce5Vq/ber/aFvGjOrzk
	 PlnkYGL+o2ZLmLK/4N4ZOVyXIc0c191w1REIyzZXrZRXNsv72DTXaQ6c03/uxF5wfdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iSwEv4VA;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1950606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1950606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iSwEv4VA
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b467581b98so15869215e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794300360; x=1794905160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pDdwdwnPkDpwaUGvrR+GyxsXOY4KK8QRKqRhYcUlZH8=;
        b=iSwEv4VAOCNwexBeds3LoDqqNpNPJtJRAc5qW0O4SH38oz11qIz/2QOO3Uhhml1uYi
         4nglexAY/UNX+dEP9HT3j/7fU+TTwV56CiizORNNurqaFo85i4nB3fkbP4TKMkRLLfXJ
         BKJSEH/OMUG6c1XijG0s6oRzBvovdqdoAnXn0+zxNXSmADa9LGNzPTbcDOJne5bBfxl7
         Rfj+ynSyWm3KVA145YonhbTY9M+fyiDDsJebMn5Qc51eMjfC0aFUR9dpnAY7+BMDmCL7
         epFru3XdjFeWXhaPjqqYPFmOKEdvSZgyy23OulKGkzOz1cBjZ28sRRmF0Wq1l+RS4ONX
         fB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794300360; x=1794905160;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pDdwdwnPkDpwaUGvrR+GyxsXOY4KK8QRKqRhYcUlZH8=;
        b=0qYquYEDTxy8eOkSPEynUt18ae7xGEuvCwvY3WYCK8t4KpU1Hh7nVmxe+xWy9g4mOT
         9Tv1EaxDRi9eOijZf+M993uQHoYmbnXyoF1rMNej7UOCLtte5p8mI9JTaGkG1RiU9TLJ
         SEkzbXSYF48VFk838V/N7N4yJGVT76Lsp8nRx9maB0P8CxoH/c2C9koLZAIyqAdZFmnq
         t2nt7yHoGgmW2vgyCg9xkqpIjYUMnVz1frRZV8AA/gU25cWE3SocXJ7F2ppEPxk63sFr
         Aeo+RCpjTbfLMWHHp2JDNloepmJJgLle+fSce3doDkEv0Wx1D1W9jnbWLhepJjRHrzQH
         v76w==
X-Forwarded-Encrypted: i=1; AL+hErFVsfW56IXfeqqok5tQSvzn6aAvg2UalVPdh72D9ag9O9GJIFiugh5KyUriRZVQ7c5nyQ+RL0brdIQoFsI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jLLPAgoX4/vE5bUOqBfo9peD4QbXCu1uHRK9gQG0F37iyK97z
	zhjfy6yv7u0H4SpvSXbFJFtV43l0Df+kixBVk4ohN0RHHb2IzQqwCAScknToTxWT
X-Gm-Gg: AYBFou1keTjK/aMJslEVEzyUbR17rZgzGeqiA9qy8BdRfOflskc9wiVrHEIG7G79aYC
	0wx0H6GcHVhW5T5fRetKrGbTx7HTKKQmhh/8eHLjAEKQRUMw/hYmgvUH2nXUwhw/Rk9MnXUvvHl
	5D5WidyQ2iga105dVnDSV8QlnMT9Ic54FerVK56A9AET6hbiSxaDN5D/MKp5gL5hakpVfqUYwzI
	TTXUuIgX+/BsfSnMKu35kNwzi9rvlr2TjDIxWXCgx0KE5lwsYsd6Nuyfrjmrcccf0qd3AHzCrrR
	Q+8caDtrokB1kBQ5p0AOrlg7bh1kpRo9fwxa3qFpVSFXWrkrGkzHxZqyp+zUohc6PysYhUVG4sm
	tQlzucF4MwlsGTg7hJhb/1ruYRlcTnYixSEcMkbAu4SQ5QX5++kfzaK0gnE4ph+Mc40MBP6ga83
	Hd9cri3x1vNbIQO50vSrx/EMlCpyDdiDWBUQ6GQsOXnF7xz/vzLscRIfiNV16WmIx3YlpiquRw0
	inRoba8ECsHExqkNB8JxPkh45FMqaL3rwt3t5ucXKFle82Sntjq0+8ocqkScgaEZOWNtLJ40vZW
	oz2/PZNKC3ljfAFG8N4IYftVcxwMHUVoKJBJoA==
X-Received: by 2002:a05:600c:4e41:b0:4a1:a45a:88f with SMTP id 5b1f17b1804b1-4ba02346e39mr25356735e9.20.1794300359821;
        Tue, 10 Nov 2026 00:45:59 -0800 (PST)
Received: from foxbook (bfj76.neoplus.adsl.tpnet.pl. [83.28.47.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363dffa1sm3700351f8f.39.2026.11.10.00.45.58
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 10 Nov 2026 00:45:59 -0800 (PST)
Date: Tue, 10 Nov 2026 09:45:53 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Shunbo Shi <shishunbo@cmss.chinamobile.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/22] usb: host: fix a few spelling mistakes in
 comments
Message-ID: <20261110094553.05e693e4.michal.pecio@gmail.com>
In-Reply-To: <20261110075825.24946-12-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
	<20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
	<20261110075825.24946-12-shishunbo@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Nov 2026 07:58:14 +0000, Shunbo Shi wrote:
> No functional changes.
> 
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Hi,

Not 100% sure, but hasn't Greg KH indicated no interest in such patches
for drivers outside of staging?

I don't like them either, IMO the noise added to git-blame is usually
more annoying in practice than original errors.

> - * long delay for the handshake of STS_HALT is neeed in xhci_suspend()
> + * long delay for the handshake of STS_HALT is need in xhci_suspend()

> -/* Mult - Max number of burtst within an interval, in EP companion desc. */
> +/* Mult - Max number of burst within an interval, in EP companion desc. */

So words that don't exist have been replaced with words that exist.
But the text is still wrong.

These are just two random examples near the end, I haven't read even
a fraction of the whole thing.

Another issue I have seen in those patches are fixes to comments that
aren't even true anymore, but the author has no idea of course.

Regards,
Michal
