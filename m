Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.203
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794610551;
	b=TRndtuvD9H+EPY9orSr5Mtoi01N3rvF/GjTb2Seak7nDDe3MS5dIb4Bh/jq3YI21vwyD
	 hrvOgiEb8c21VqD7OD/eDtFlVKjpjxZW94uuyf216AuHr4e7KCpLUeukmMooeMYvtZNdx
	 nnIfCstrVrmPDu5q1sAz7e2bEeJf0u3cLFTEpI2A6/Ztujsj/QMpvUsvIIPYJPhWInTON
	 Zs0sdWHuDJBOXTOCqo5EZ9mw2aQiY3U5+lHQl7sfeS1QgEMsQk+/7X/O3emhYyVLTFKv4
	 +mZuInghQZP+9vq46/DLxym9M2IEmO1XCPFJY+jbdsimSvQtRLPAvWpr5tpuweGOTrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794610551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ubHIV78BWdtikOGMl2tBl1TNThY7XLd4PDLG1WQAfwA=;
	b=vb/CX/t+yllPaWoGPcQNdCiEIjbRkdzv+SyrK99lAvP78DN2gi2efYyohlQNhgXfimzg
	 pyqXL+Jehauj2bKLb8g5qKW+jNWV7oCa553v+xyz1c2q4m3ruGJQ7sxTfm6zYFOipwbTi
	 paDn2t5QnjJW2WasL/1VWb883YaHu8nC5XiOtTH/Utby4n3qhgj+jkjFfF464+WE1ATUJ
	 Ht2jjCEXc8Gdtq37aMOfOkpTgP13fhXCMdUpICICh5l4r0SVK5Gr+83TRHtcy6eMKhfuq
	 0MpBnLIGwJUNPErJ9HAcouGNvuSfquX399uVo43YBcXXO99RuE6I4TC29KZZjkKr7/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T8hARIt+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.203
Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F0A606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49F0A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T8hARIt+
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-5681e6e7818so558970b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:55:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794610550; cv=none;
        d=google.com; s=arc-20260327;
        b=fxlEiVm6JU6zKwjY17maPoTUucExk90oaDldZKXSKdX/PC+JdC3xh2gmsKKkb3uC3Y
         qZIsiYkIbnrCDePKW2m3Gq9+b6onwlFFbFsX3Az0kYGZa2f4PiyTX/xszq0G5Uuo6jY7
         c0NNVSzth50Ucg4PqYJdaT1b/LvrFmUwBIjH2p7pxxYzsXHWSLKjQ8nYxPDCvz/HubAx
         JeSeGbKPjLGsdgESpeioGWp9/yZjU+iND1SsmvBP2qGzzlibQnandOcE3m1HhVdMK77V
         mrKQJJXFLGuD8iRGMeirPpDKzcGaujQqlM/zCVqp/OrPd1a6CGDnsgufBdx6QMaqgaP+
         OJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ubHIV78BWdtikOGMl2tBl1TNThY7XLd4PDLG1WQAfwA=;
        fh=lyrzgqlPWQTnnC+Trn/w0H1QL3/DSbyPKC4KjZIZ4qA=;
        b=WKOXdAYb4Cmq9eYxNR+KjP6JEvmE9n538uWoOQu76kvZ1+0GZTsNN9Yv/bGP2FfDJa
         7EJVtMEigpHnIVlfMGHSiqVBew99Qwubyy3AM34kwgObXP0PgF0jqlihB7z9PnLLhCKs
         EPqv2JZRD7pKF28uWdHQ7K/GrNfv3kyoJlJNz9kcUoarqUQ41VvxWyGHEY8m3zclrsag
         qB/4XoAk6W4qCauZnA+PPIdrfcB3k6S2BTCtB8QGYGlHUfljENlPx4bX2y6Ryj+AaSyd
         6JQjXmSMwHRpf/VP2nZPtmUd4kX5d5M8sT+lp0qcPqw41LrWAOFkGJKky+7NTXKGcSrH
         QKVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794610550; x=1795215350; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ubHIV78BWdtikOGMl2tBl1TNThY7XLd4PDLG1WQAfwA=;
        b=T8hARIt+NW/FmW4/v/sit/FuJmA+iWrY0G9FAUkVCaY5ReC4DhU1n+4d5HNCZx/sqN
         p2LpU5HqGTycZUoSsC7EgjFQDuek2CryyOAC9wy7u9eFvv9NnRZz7ppKcqKwwKhZg7A5
         FneRPeENdI/K5C7y69Uh9+xIdnlp7vqaL02jEGjbC2J0urD0pY22a+Crie9SNJi7ytQW
         6bzWxT3AVzJ07bR5nfk7c6kuwFuA1mJX06yXTwaJhJaRyD+8uktkpC2Z0Czw7x/a5Rp1
         bD0O8L2pdnp1fayOogb+nYkGkYhsrWtIoa9hAX48la8jEqyot5Qrd962dcxk8voN4ysu
         Al2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794610550; x=1795215350;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ubHIV78BWdtikOGMl2tBl1TNThY7XLd4PDLG1WQAfwA=;
        b=bCK0G/FwmEqUfXl8/aNaMLis4a7uhvKyh8Mm/0ySiLQLMtsj+RD9h3NOQKB62UTQAu
         hIHhniJz4fO1XQeCEvRJSvfeldSNgy6Msi3xDaw9wkfRQZExJ6q/wnDtVyxIIDhoTTYd
         aCrgIQuhZ3lRTI2SQG/sgVit59Xyb1lyTjkgj6GwKwz0ZXiN1MFb1Khmqz3A+rRyoWq9
         a68+ZpQD/C9PdvDL3v6o0/4PWEYPoRYSuz1BCkWwTNhL67jZMxUdNvEucEKlPiug23V4
         WKLRyl7UQMe0dCO+T5wa5RWI4U01Cj982vg2T9wLbriNWzAa0YYepCuK42MfT+818hZ2
         fTOA==
X-Forwarded-Encrypted: i=1; AL+hErF2jlVPNVJUfQCqCJzYgScCDihEfKVap+3ovFnvK0ES60wiId9maP+NiM1+Put18z5SHOPyfgQE6mgVBxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nZFvqJbbTS8/m7F6jHFwz5LY0/4AcooJMxvqqsvIR1/Bx/bkW
	z+cy3qJtV3wHOEhoHUvKGJup30zrFl53wkupzJQiw7hRtWVWv8C04ln+ATX2Cc8AFaYJuPJSECT
	2hAglppi+mP/UVmf/fD4HjMjL7uWk3xk=
X-Gm-Gg: AYBFou282bkyKsOdKsDEFLv4LNywbv5zuQJ7AogMVH8fXNT9N5Qy9alb0TO1UY9xD0y
	gswvGFZLQmnF/Mxda/Yo82JKRAzy5HfN3fCepipZmulmObUI55NhqQL95uhI3fcHAKLy4XUa+Z4
	82WgPHADb9fEEyWSR/3RCYY+eutLjYMPYJOrtEyWaodQBJP945+UyTitO9GiUsAcxwa5HTWaPFy
	UqsMEb/Ax1anXx6PxEmStWKIWSgvYK4oGmb+2A+iAII8wrIZCJQF7tayHx8YkikH7v+NDrMu2yO
	z84NiQdm+YyZvdK1HD8GmYghKG/7c8QxhPjfUbRTjlQbroflbkgseq46VIh4raamNNPwNgX30Mf
	2wGpsKcgrWzSnaAWx43MFChYGShmn0Q8JhA58r6F6+MpA6GsqqIqx2zgrHepHgPBm7GS2gJXIur
	6E2peTWrOwoEgO88SKsZVKEbOi6D9G4sdg8m/eCR3xPpGIwo3jlBFJ
X-Received: by 2002:a05:6808:244e:b0:55b:f88d:919f with SMTP id
 5614622812f47-56e65317dbamr3590625b6e.53.1794610550183; Fri, 13 Nov 2026
 14:55:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106124639.12584-1-dennylin0707@gmail.com>
 <20261112075624.23c04230@kernel.org> <706b09ea-49cc-4801-a24b-b22d2ea7d257@lunn.ch>
 <bc45c1e8-6904-47f7-9c96-512e024c9d71@gmail.com> <20261112113550.016cdab3@kernel.org>
In-Reply-To: <20261112113550.016cdab3@kernel.org>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Fri, 13 Nov 2026 14:55:38 -0800
X-Gm-Features: AclHuK9f-4XUFh-cJPJlk-I0MGZ48DWAeQPY9iTICab41F9Jkn5YSmRgl-29Kew
Message-ID: <CAGEkeHdz3GPv8sd0SLD7zbRBPFfzMrWBSWG7uxho8uOUJAL4fA@mail.gmail.com>
Subject: Re: [PATCH net] vlan: prevent cross-netns MII register writes
To: Jakub Kicinski <kuba@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, n05ec@lzu.edu.cn, 
	ylong030@ucr.edu, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 12, 2026 at 11:35 AM Jakub Kicinski <kuba@kernel.org> wrote:
> Maybe we can just delete it in -next and see if anyone complains?

Will do, I'll send a patch for net-next.

Andrew, vlan is the only one doing this.

Hungyu
