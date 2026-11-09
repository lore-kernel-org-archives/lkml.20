Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794208329;
	b=GpAvZUpfYnum0g8Nf0dwUeAsl6cJkjO2aTNrOpKD++k0F0xpnvtMoWtE+IgqqZSRzKlG
	 cVFWwx3r81dNcOTjAs3vakJCkuvD9OS8xRyqM7B58JSThfV7DcLDnb33zrZsRqhanx56N
	 vGVewREV3MDXbpzaX3J41pofVv64soKeDtt4b/X20aPjwfLz6YLu1K/uyBS1TbHSdXUxy
	 QbNsvADoghc7TIZwAXNiA3crOsbB5G6q5BBL/IU7qU5oc698c4KFlrAfLxeI8Oui8EiYQ
	 Or53D2H2BhZbKuiXt4Ad5fwSi0aevPigB6LOskzXwZC06g+tZyb+/WM2JbeKRSyLLRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OupCEGaIrNwuKpf7Jfdnd1ZAhIgrnuD9zgt3Qr7q5bI=;
	b=wrosBAXrmvG9rUhB9indnTUsns+f+0vJvcp30pL3CCXAAinQxBPwtPHYNFjryeQRY+1V
	 Qv6/o0TgKBdivmp6BNwfRu4Z8pSNAee28Qstw9PfXP+p74pcawB1ShmD2vP0v6x78DgEP
	 btGv8FbSkfZ9Lm6kj/ZQTwBmvuFEcyus57QQbutgEPn4k+9jzvZPeZx68B49/5vXXi8I7
	 t3u76pXMkZYDmq/lO1oL5C7eO+86RjFsWpTc8YiyNJcKsnAvvPysSiTulfGWc9xfwZY5S
	 jyQYJk2bBNs/en9A8WUYBy1Ry4/Q4xQdy67ouNtFBmUiyUu5tEnJFpBHLuMMkXXBiSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3VYJ1Ch;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2435A606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2435A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3VYJ1Ch
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91eb3ac1875so5964116d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:12:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794208328; cv=none;
        d=google.com; s=arc-20260327;
        b=iYTKEBdu8pfzBWxGJeQjEgjIeTI0ItpZzuf7LPdMIutJrI32zeqHo94yqsOJ2AoASW
         VBhWBD+HGhm21dM5yPQJ6Bo6qx35xzQ1c7JCHj4twPmRg5B24uMOcf5vNVW01PGIz0n1
         dZAiiIOCR6GVQLGFx8lULuaZjfxP7dMNar9r9gvEqeRHQhPo58nQ/tvIe3iasgo/7K7c
         rhfIUjogU+fp5qNfPWrnIl712+5cG0p4cXdX1fvAVmxh06/uBJhlPwgQl+ZofcQnf1zI
         kSriips1yXIwzzlwo258dR5GSMnB+TOxcQoEfF3iVoNpjv6zCBCZHJcDyT4Y4CoX2L5j
         ESHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OupCEGaIrNwuKpf7Jfdnd1ZAhIgrnuD9zgt3Qr7q5bI=;
        fh=Cr5N5A/ncuxPwYzi/rSahWrMIqqXtVMqPKwqsUGdj88=;
        b=XTTMcN+Dv4EdMD6+mTkguxLfwLICiBrWkWB/x9o+M6i3zNfx5M+M/RFIpSLhKMi+rd
         rYpARgKU3eO7+pA3aIVFG2D11sLkO1aBhH8DVzbPAbZVEvTfohK5SL/MaR9K8bi0yEDs
         TTj9zTQ84njtuzOnB4axhV55NzfM6NyMjH40ZG6bPl0Dn4flB5XqA7AOM/qoKJHmrOLD
         eC4nUDzpUk1xt80vB+YOJd1EMaEQnb+FK6LRHcf7H2zrKH1yJ1G0zsCcQkAA0xzfQj2+
         MB1PcCoz37Qxnu4fhUOjFnib5QifM/EZXRWUQkholtOhZixwP4jx2n/y+/E+dBliDU72
         UWog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208328; x=1794813128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OupCEGaIrNwuKpf7Jfdnd1ZAhIgrnuD9zgt3Qr7q5bI=;
        b=S3VYJ1ChTDVlnZj+ORlw3KQTe4wFrKpaIAerq2bLU+VqDtH0D62D+PF3ST71FgSKI+
         k1KBQoX5cgBknJwIVa4+v74qnq7guJen+5Mi3pSWXAvG/6KxzRROdUD9ZCBVIIC47Aev
         NdntDwYgJwQRuTbSHQOU1HTk4ydzNikWETFE1v6pzuJnbsxJ/xRxx+sThdeF2sllZkDl
         ntVA+YCCpQEIpTyFDPU1J7q9JZCEI6uDFFeOdAZvOc3nPmQ7moYUlxwzyFBDVrb1XK6D
         gpVA68mlf54X1gjcI/xPPjua/XDCwpeogYnFwPZoQYTVk8QR7hyfQZLaSbQohcJZNHXr
         sjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208328; x=1794813128;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OupCEGaIrNwuKpf7Jfdnd1ZAhIgrnuD9zgt3Qr7q5bI=;
        b=PqR+J6eKLy1iRHmSH7t9pfa6zClmWfgX4Fic4ggk7NLwE0uWcGmu/U7X290YIRmsN+
         PfBlJ1yqN0mfD3NmPawSFu2rQeXNJs7aSwszeUY/uWxIwP4AKmU71xYGHb6G1geWZJOW
         Ysg/o60/Hp5ijveB2LvlFdGYnlLY4TjspqVDSB+HdbStOZMix0wtR3xZq9IpVhjCkqOr
         PXBkCSos/SqTUD4q7hq4Ax7h327CrxFqxNhkNyOy8B0WopsKco2A9v3N+1eEketm3RhK
         bM4WFbbFRKmjq/BntZjTUcaQVxaDd71UqBDaZTLebmPpv2Y5VHaU5rmMLkNHE0pr/mjB
         dUHA==
X-Forwarded-Encrypted: i=1; AL+hErGploDgpEQZ3ctZh/R1wi3HqSbA+h1zRc9Fb+vOAGSnebaaSHcRegrx8r07IwwEuq0EJUoUnDneeBsZV7o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dvbOyhuPKvL1owfl1OkjoTFZdhaskdppCFIn9Q3eS1yTZSlxo
	aLkfztSwr34XvK184ptxc8McyDQCA+NHVa3LoLOtM+NTRP/h9k8BPmfOxV+Vhn4XwbaFnD/lvCz
	mzku45eUBmtwsZ+r5kks04D03HGCfiJo=
X-Gm-Gg: AYBFou20i4edxMqSG/LpvS3XbsUVUnlxlbefvk4xy/ELMo1Yn9NbFY1YFZsA5w2AYIG
	kB1ASMqcZiSz+CpXAX3639Imbj4bFKPb2KhWrSHRXrUZu7uooF2KMu6fRijF6gfnqia+//1JnXq
	YD6V2b8Ohkef3vet0YeLJ8SQKCTQuqKRiSF5s30iJ+hSqE3xoaNqaaOyF3IJnAPBkMj0G73jaQT
	T9UjJGzhVNGobpLtcVYSXVidI08xszSzBZsMgcAIkhHCG1n4fWX672NBEiGp1wSxqOc2oRevY5t
	/f/tT3tltbLlybDQNnz4nK6BY+F4pK4dSP+wmQEMr0zo/mp6ERAEXHK2yq/0Q1PhIMGraP7lmId
	CMygt6Eei5jB4bM1y+T2D1UkDD8YUBwcwa12V
X-Received: by 2002:ad4:5c46:0:b0:91e:9d18:6a61 with SMTP id
 6a1803df08f44-91ed21f31e0mr43992646d6.5.1794208328122; Sun, 08 Nov 2026
 23:12:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261002041220.133911-1-artem122novak@gmail.com>
 <CAPufuhaE=pg9yzqZYaDcfkxooZeQPzSNsKQw-kX7PHN99yZyQQ@mail.gmail.com> <469a405f0a447cf433e9449016551cb408fd11dc.camel@physik.fu-berlin.de>
In-Reply-To: <469a405f0a447cf433e9449016551cb408fd11dc.camel@physik.fu-berlin.de>
From: Artem Novak <artem122novak@gmail.com>
Date: Mon, 9 Nov 2026 01:11:57 -0600
X-Gm-Features: AclHuK9M0NU4pJUOxjwJxtUPXJmeVW_GjcaKtkSrXnuPLAjKurNTbXo_mGqnfSw
Message-ID: <CAPufuhbXzbgBR=L+5o3eBRXXnHh2FPqThdUnnPsSOuSyjgOsfw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] sh: add initial SH7305 CPU support
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

No problem, thanks for the update

Best regards,
Artem

On Mon, Nov 9, 2026 at 1:04=E2=80=AFAM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi Artem,
>
> On Mon, 2026-11-09 at 00:43 -0600, Artem Novak wrote:
> > I wanted to follow up on this patch series,
> > as it's been a little over five weeks since the v2 submission.
>
> I'm sorry, but there has been too much else on my plate in the
> past weeks. And before I can get to your patches, there are a
> few others still lingering on Patchwork for SH that I need to
> review and pick up.
>
> See: https://patchwork.kernel.org/project/linux-sh/list/
>
> > I'm happy to revise and resubmit if necessary.
>
> Not necessary. I will let you know.
>
> Adrian
>
> --
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer
> `. `'   Physicist
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
