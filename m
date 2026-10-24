Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792806120;
	b=cAj6ffEHkGAynkZQzNELrvx4K8cXed7WWTJemqwn0QWOysD2DSbnjNx4Wqt0PYO2s7ae
	 MH6BwyOSFDHpnOkqbdDFqdi9lJmjYQGhsyjrirQxSpwmOrvwldSL94GFIR9c22lodaoqo
	 l91uz+4tk7EacHjb6nGecj6R+l1MuHA8+zPoyFVGHEk9ZstVx0VEizv33eyr+3zb7ckCN
	 NDcSmtcXazcKsUVRvOXS9KoJt95AlcpRhiyq57ZN5WY6DlN2ZtdcMHIO84UHSOIUnkI8i
	 TwTXqkLDPtQedogaTXTXqGaPgk2mLBSx4c4m9tjhQBOkBt+Z4LioNsfZfzm7txLNZgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792806120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=qeH1FHgicGjvAz+02O19qqIqMgAUZ46ecfWddEW2Mak=;
	b=AGBnMZloW2GKwFV7YC3GwA317JA6J7bHggy6YJ9hhlKlUJPv6jiJQxQoB0RLr6MNfcjI
	 EPJt5homTIs6E8SBF6Pcs/srWfM2DdR7ZF3j8GuDM6Xx0OZ3J1ynzzTpSGD3ONK28u14H
	 AGxaBgFhgZ/hL39cZ0q89adt1ta12FrvTtoRnOhXmt24eqh/EAMLA4e22og2qHW/T23PZ
	 /NcS/0kpZZ9TJkGLc25BU7Afp1qKLtEHgBtCInywcGJVKOU+qnZHUInk3oxMaIhMtFXUA
	 MxLcjtXPUxBadMYZnBmEZwJIIq4mxPaI1mCRXDF0ZU5lfC/DnPUryl0uh2YT2M6cYZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=AL6KnPUi;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDA3606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BDA3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=AL6KnPUi
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c40e30c26a4so361471466b.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1792806117; x=1793410917; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qeH1FHgicGjvAz+02O19qqIqMgAUZ46ecfWddEW2Mak=;
        b=AL6KnPUieL29OD851tZPuMhJSfajXpP8zoH0sEeBU4uYmBjvXIRPi8CftEMiRVaDgj
         3qdw3NzKLO3X1lHWiTgwtohwDdjlsRsRt21Wu1ArJ0HX90gHtOwlEojZyR+mZKf+gNyt
         Fa1yJN7UVDi/X/SouMYdK+sXdujBY3d9FvifU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792806117; x=1793410917;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qeH1FHgicGjvAz+02O19qqIqMgAUZ46ecfWddEW2Mak=;
        b=vcSTFOs/hi5BFJtJXTkKzxZrpWkyB5khFLr6pZilGRlsqtTPIVM3bsDeZR2B0a94Dq
         fwVm2KKaBAZOca8+/RqA94R5CF59ocOB6G8TdXchvBR0g2iKBIIHY1v7IzDRFzZ0WaRG
         zT4vWm7TBWmI8vALIBz+zLtE9OG/W8FBbNDVrrm9LKpVD60xJk/E5qChs8KD4wA6xEiE
         eyoiIwaTmH5pWHvgiVp3ROHJfgVhLmR1GWZMbY0C9iezsIW16S75FdYz0HIffC4aV1nd
         idkXvLd+WZjzquqiIj/kkpQOGUdpAqTs2Xlw6vLjQiZ6wvu7toV4ZiBpMTXCLjzRLhL4
         UZsw==
X-Forwarded-Encrypted: i=1; AKwUvBxBjZzDD4hGVRgk735h4M1hH/uCpmcUO+dA/ehxg5Rf9ye+UCzBj7SVSaWHxKWneJyy/YdKXVhUm3kYxww=@vger.kernel.org
X-Gm-Message-State: AFq9FYItHFUV7yKw+0DkEnFQN26OXbGkT8jJBcJz2fZT5zyNRk+w+WRX
	7sR7zX5aYiT0Ki2GEEclW/o65xoerZZmPzZO5sl2jJXkVaY/NoPlAgtezPJ7/s/VlamZ9FFzGs3
	dG6Vj9m0=
X-Gm-Gg: AYBFou0cremevp5yR9yLr2VhCMW23ZQmmdM3mN1aUv2y42f/ORUPjt0bzqqJf7rZsqM
	IKPCup06JKn4Cg2TKtDPEeHwgvg0yL9VKgQjCw5qKwtw+Dh76nWjhF6rqQMdpl10BPk+MExAlV8
	9yDsmdy2GUhRkKvkTCbTu3HEWrh77fAtA8xfEClpfuJqvw6Na2RV2IZmaMIS7/vLEki7swjbEjY
	fb5ffSyzE68ej5aa/DKbuaUdkb7KZj2CSUk5vZ8bzQWsKz88F6InsaGQuM9y8IwZpGZAmP4LD6C
	FcNypNVSeo3U+Q+vnIjc9jpZr5IV+XV0Tp8lDKYx3+y/aoc75sMfEteoT4SBLh5z65+rvf8usXt
	MlSToAsNY+Ur5HxSHsWJTLa48WvazEBAr8N+YOS1hGGg3wGqc2EEW0ToJDbVQG7VIOSxvMZNLvW
	Gf2jaKqpcXv40rXyK8WmCrsM1Qqzdc0OcSVfs9w+xu2mCQVaYJBXi9HhltD7EbHjrO4zCgIfZ+A
	mntyTaX42hgBN9k5N4TuSoyMvu6Mx42pZ11Eya/SBA8IyJXCdjLsO9r4d3XXF6wqZPMIO3Y/0AB
	/gmvUHdRaOQcm72chdkgs5HJv+QOiA==
X-Received: by 2002:a17:907:e1c1:20b0:c2d:d4dd:8b5 with SMTP id a640c23a62f3a-c46be5cfed0mr40988666b.19.1792806117429;
        Fri, 23 Oct 2026 18:41:57 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd6573dfsm30148566b.52.2026.10.23.18.41.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 18:41:56 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c434376dbebso267293266b.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:41:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwQgcTJ/o+5YYTY+IUce6IcScuTQGVI88/vBUiareDr9nZBo0f8h1Th17RJ4UMB0KRRmTnFXOlNPkLSdzY=@vger.kernel.org
X-Received: by 2002:a17:907:808:b0:c2a:4847:231b with SMTP id
 a640c23a62f3a-c46be5efdccmr59745466b.24.1792806116362; Fri, 23 Oct 2026
 18:41:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021224355.GA2571577@bhelgaas>
In-Reply-To: <20261021224355.GA2571577@bhelgaas>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 23 Oct 2026 15:41:39 -1000
X-Gmail-Original-Message-ID: <CAHk-=wioEin24Sm4DM9TFgYw=kH+PR7NHQ_Z5pzk2=AfpQd0qg@mail.gmail.com>
X-Gm-Features: AclHuK8B3O46Wh0EulZdlUpt8bUfci3dIeRGqlrWK7Dq47jxll3Yo4YSYc2JBho
Message-ID: <CAHk-=wioEin24Sm4DM9TFgYw=kH+PR7NHQ_Z5pzk2=AfpQd0qg@mail.gmail.com>
Subject: Re: [GIT PULL] PCI changes for v7.4
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 at 12:44, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
>   - Fix leaks when ACPI APEI/GHES error events overflow the kfifo or
>     mention a device that no longer exists (Priyank Rathod)

There were conflicts in this area that I resolved differently from
linux-next. Somebody should double-check.

                 Linus
