Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792979814;
	b=JX+l/giPATfk2X+sbvKdEjQEV1If+WoD/H9Q+MMJbc24vJvawxq3fbajHY8SOz8NQbbu
	 JJEOjUH1Br8OPeLMz53/SCO3i1tAi4wmzc55EWW1Frk3w9KRX1aaJkfUwVGxndHBwFirz
	 V1mAjbgpIffwQ8ZWlS6EYwswUIdaPCuCBEew1bYCHsSiUqHAZyfQEAU5KI6onPeE2lnOj
	 QSZKGSbzz7CxKMv3YkkiG31BDqt393Hk5qIVOdk6cUsi38d43wwpRpsuMaWPzuZNkyXLt
	 +VGEKjZNqRFmOUaP2d/7HLM9PNMAb3CsjDFKgLvJmi0074cdSg1yn/rcn6v9eBO0r7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=SDc9vfJEDvOZ9KutnQcEZVkooC4ZxQzWj68/tktcKGU=;
	b=ipuwDTjZIJANGeybiZMSw+bEeZaQoG8fhOO0jWZ8W+/fp2FSdtxTUDv3HpG8JCq+DScJ
	 j02PKZedHeHZBgiFZbmVMR+Q0NuhFjQhbW1y0m+vHurkBRfto4W+WIazD9O3uvCrH/4Xe
	 tPTvQUmXld+FXkJ88QxZzZBn/RvwPJr9/lAIzhk1NRczjYiyELLhM+0z8n9NGuCDLpihs
	 e9V2t60qkglog8fspLMPTrXh6be5PfPy+CtiRmOn8DSEeitbtz5/WDIC9yyYc3OX7+f2W
	 RnQRsDg2m8n3JmZ2W1w0xlqbfs+yrFLUwua1QNMZPPWlYA6RpnuEVnOvWoTYPwBetjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qrclkRgf;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECA0606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ECA0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qrclkRgf
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91b9e758c50so36319386d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792979813; x=1793584613; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SDc9vfJEDvOZ9KutnQcEZVkooC4ZxQzWj68/tktcKGU=;
        b=qrclkRgfOsMEvFkIVMdRXfEd2lcoY8o9dNOvaxoMTrQFTPc5o7DDMlGN+yQbh6Th0j
         5PUw1WZX9P0G12ow8Peh3qmIdqdZ6WHkA1B2czj4ubaEKsuW5LE7K8kZDuyHvDvIhTJ5
         Q0tRp+lDWWCZeeh10rr+WNBY25J2kRJcr2re0yxD81ZKrM4NAgBkyz8V7RVb5GFkeYoW
         x/76pPUtf77yYlbLEnrFauoJumApj7y5cOcmmb3MbXb0moNZGnGXM0Jm/kmrsjR81kvY
         n1dtaSyy3IhPS91RdYmfMahfGxRYQ7ct3qBp9nRE4VXxK20+bd6I8MJ1H2Iqg3KwPGtb
         0M0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792979813; x=1793584613;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SDc9vfJEDvOZ9KutnQcEZVkooC4ZxQzWj68/tktcKGU=;
        b=bGPEtHc7htXVQZdqqUf/EVuWU/rA37Fk+8tiAKKebROxjnPekkNRM97XFNhVWP3AtV
         Y1ccpYDhQsnSVQ2ubD+8PUrxAp8+HxhNJrlpQlbjJwsmxlZ7r/I5cAbssmc1CrPnLXAk
         3UNP6f4PLaIB8WYSCqT2yWd1mgvIxoGG7/Feq3krhO2xlzf5fjqqXp81yAFYF45VQgdB
         JSttHEh68I9bRv8t/gH1nnWfSJKuSe57oFnxdiWZjA3QxnFnqD4CocYzQGTbm39qZ+Rg
         WBDUl9p24yT9QKj7USnvwCu3zr1+ZlvaPDjaQlLpyrp/XGQExMIwd+MWZZfZgeI4MLjo
         dPEw==
X-Forwarded-Encrypted: i=1; AKwUvBx2QmV32nlBJT9ykOOkRXgDK1X5UdK5r1rTGJ75fuLM/lta6A2e1g3RxHGqt1yJ5RQgo2EBaTDQtTwDyR0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhp3VY7fa2Rvio2vnwwELJ8y5vmk6Adh9rRViAmWbdDl7swK3M
	ojlpAWZwTS0cVwVHiLG/Qq2pyx1kypuuiydi83RWRiPDSCW37t+b77CgjoBWkQodLo8D0mg4
X-Gm-Gg: AYBFou1vNCVtQAM6rBwu8Uo49XX46jf639jrek0/HEwXf8DoSVF99os4wNsCrmrmd+o
	0RZte0nbWXgiPq9q5un8pqebKBsZ2+GewvNCQA1vvRUvSeHPBUUXOxV3yUPNEvWipCjQ3YaKH9F
	KhMR+EBP75jPXwgRqUlLC8a9Z/anOlFjRMy4lNeEY16bZWm2TvuzzX7aDDjoSxSKZwG3QsZqYbH
	LUAal9VWMf93z+Duvo8Byx5s9jY90A60ygqOL3IeO4T+O6g0ucjt3EnUMAqUD1GaascJpCLkOh0
	yRLNF4NJtWpuECciwUtb1UTdrnTJP3fvD7oOOqPbUZ2tDnpJALGz6IQarH3mis74eAmz05OxjJS
	oZ9uzyqpQ30dyuy60z6VyJbRUwmup84kqyEiA6w28yWrIjZKOvcz7KDiaYHCokYE2OkHBvQdgRG
	+oz/VDFUX5y/9llTw1g+b6fFVtiszH/379GWv+LIdIAoTGtKGfuyzZj/qLnYyzGKq7uNr9uhRbd
	vrXx0KdLQ+gQsGmgRyYFsJJ59ZKEcGjfBFF+SG4eGpoZnDINEH5VagNCsi3dRWjTp39ONKb4neb
	T4BqKTgMb6XXI076+bGwI43g8NyZAho0ALM5fx+qaUUYJYNGaJE7ww==
X-Received: by 2002:a05:6214:3217:b0:914:4c57:5103 with SMTP id 6a1803df08f44-91c48ecc76cmr89332146d6.8.1792979813343;
        Sun, 25 Oct 2026 18:56:53 -0700 (PDT)
Received: from localhost.localdomain ([217.150.74.224])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c51eb8b4dsm42413926d6.21.2026.10.25.18.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:56:52 -0700 (PDT)
Date: Sun, 25 Oct 2026 18:56:52 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: toke@toke.dk
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] wifi: ath9k: make sure we stop the wmi tasklet on init fail
In-Reply-To: <20261021120237.481898-1-toke@toke.dk>
References: <20261021120237.481898-1-toke@toke.dk>
Message-ID: <179297981008.47871.8854747166395230996@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Toke,

I tested this patch with the syzbot C reproducer and KASAN on a 7.3.0 kernel =
built from upstream commit 21a7f44fd.

On the baseline kernel, the reproducer hit the reported slab-use-after-free i=
n tasklet_action_common during ath9k_htc probe failure. With this patch, the =
same failure path completed without a KASAN report. Both kernels were run in =
QEMU with the syzbot config and ath9k firmware extracted from the syzbot root=
fs.

Tested-by: Eduard Zateev <hackerowskiy@gmail.com>
