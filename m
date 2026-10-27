Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793139960;
	b=TWp4sUJgkm0GREcbRDD7QhHBa7ThDJodwiriayjg9ofsUvlDODxSCGR2v2KhtyMGMu33
	 vaKNjAFP1Bf7lEo/QPyMMHR+6lwCrttoss4XRKI6EucbYyugKf6JQ6VFyP9w3BY+HlVGf
	 tqspwHh0p3yG+JqMAdKv25hvEcVET6TxR+ObS5GbgCRf0iXrqmgtLQQpASmwFWB2DdIRu
	 ziEqzV9L+Y67Mo7KEH4wz97VET5LrED3u8LIO0kL3o6RcFn6plNcazSheS7y8LAz5f0KT
	 G5VMF2azF0TR5hmGkxx4qkyilzpmEVGKv/uB1kmxScINwU0LENjr1W7xL2AJwgRW/yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=foMtuJXLdxu7UI1j+IPfbjutuzhkAxYfoH1ISosJmU8=;
	b=I0+GxXPw5dtJcnzN/9+KBYcx9qNJ5upO0IRNqZZr5ea+xAxbh8MWa7bA34fDpZbZBamR
	 Rkzn3u7Oy2eFed3dvSthyHCzfCTqptFHzLGa2LB5l7BF1Ar8wwkfPHRQIjlRii9oHblnP
	 mkl1eXn32UBDY+XCEiDzLU55z7HCoY20eZrd9DF6tHl+PTX8NsIGLOuPJWcgUZ03mV0bl
	 eKHCU7lmc7wLWnsCCmJMEeBIloneLRsW9L6sY6rxU05o0wxl2srYzW4ZKyHA74I9GHMMU
	 o6I6d63j6kl0fRO2z9uxqfRNYn4SGstOxOTM04hUt4XzSt6MxBSeByibXfiLu8EHtPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f6G9JLIn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336ED606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 336ED606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f6G9JLIn
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eac01ff101so160725e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:26:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793139959; cv=none;
        d=google.com; s=arc-20260327;
        b=oZvksQI6Bo6k1wfjaJAwD/38U8Hrqw92RAeAzoG5W4LBqTAY3zV+67a9iJbho4bOTJ
         uCIKsFhBFoHknYXD7YIg8+Mk65z/Y/Ma9zG+yFAPawOiw94YLvI3TJI6Ecl1E9VNAAXk
         HqipomVn1mDepRA9vqYmyWa+5sJKMEkBMag+cTFj0U46dRBmzBnv/S8tZ5TdPC/bJmnl
         Nu9ocgao0xuWayu/C3MlgQg5uCqCh4EhCLj5zqdjEku2OaMpfMcIH7a9pyFrvMSeYSJv
         8ombuEpCTJNeyj6eg0QjY5Qz5SNegGb6eW2XiEWU/fhg3RVp10AWitgmUyDa4WHzFh9J
         RjOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=foMtuJXLdxu7UI1j+IPfbjutuzhkAxYfoH1ISosJmU8=;
        fh=DpY/hTXpXiCCal7vg6AuhV2xMRnex04M0pmiLEzlmNI=;
        b=Qofbz+zOElpU+GtvaPob7mxhkomQK79cK8Yd1WIMH2Rp6/LxNKajPQV1Ji1JEV8fp3
         UGJ8yS5dBTEDu1UfT6WTd+5zWxU6rmV1d5MnHckgDVOfUGiy0YqdC4vjsNoZn+7q4UBz
         dDD+cZ4xvJJ+Q9i2+lhtvdHbJ9rXeGeZh4JqoKRsJP2Rjsub28J30cp2r6xSvM45Bc5b
         hSHXxMcvfRLGnU9FOgCwcEP/dyzpfInhI/m6JZTzB6ij8mOXIksndoq1G5WFkhyUR+aE
         H7btRwGs7i0IPN/F0VpM0hrOb9Nw+r5Ifq4bx1TI2FHxEhHzInstNVQsL+H7Gvtjee7O
         cTxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793139959; x=1793744759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=foMtuJXLdxu7UI1j+IPfbjutuzhkAxYfoH1ISosJmU8=;
        b=f6G9JLInPmaSge8xffSf6HZoWcpO8d6qi4TNYFtaxBEN61UfaMNheiokRQ8WIyRVGm
         fqj3gV5AbF8FR49SFOt+++JKsFDpRER2OP73qJqDoL5QOafpFdEtnISaF2buSi2WfuqI
         IrOZClVF7r6IUg2ylW9lpqEx3+AfRt7srQQ7bklsW9RThWKEI4kzVLabZlQxuYyjtXux
         DvOuLTFsRpOwnGufHeV4ugPhxQ1Yb1dxB7v9GbaYaQioisIMmy4Y2pjYydSqwdqXWtLP
         0kREAUAA9ZU4l12AeDUeqefL5uOU0cDxJEpGGZhQIjvQ6Yamtsw/7Q0zoTQENOuPPbu8
         8CHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139959; x=1793744759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=foMtuJXLdxu7UI1j+IPfbjutuzhkAxYfoH1ISosJmU8=;
        b=WQIJRP1r63UmegKy/wgX+riLYGY24yhG6AdNBFc9YvG9rZMfz+JMwg8145tT8hudWW
         AerXezy0rgyJ6pDP1BsbIBc/x7+b/TKeQHcfuXpD9YbemBPCukk2elDhAG0AuYK91aQJ
         nNuY7srYDSh2mQDvmUCxqr2gUO5nHV6I8A266rNoN2xx4YwFspA1kGdjMaJUYfUGGEr2
         JD1K1qRFBZIKVrjuQOcp/UBb0p+YV2nzkoVqVdvgsL7mCVFd+XsTY0sEUUPEiRC/5fqi
         QHBhoV95xQKJbgV48CmdYgSJfE5fHA3cq2tp3R4NrFmrI1sdM2/m9hThNpevIlJlNeZG
         D82w==
X-Forwarded-Encrypted: i=1; AKwUvBws7VuTslYypYHiwfyc3HB0IrCgdjA5t08sogdC4/Ifmw+VwAXsPfQo2Lwv4vbS03WuEVAV02HMXriaYK0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMFmZCOLF2FyHEc5OrC/LhKXNP1PduZzE4XB7InjZIOWpp9chp
	6iBX/JGu9OQ4grig6Yp6l4sklURqmYCVAfLlcKD9EqS06J20rYw+8uTQ4hnF7gvqh8rKZcJAK0s
	1S7vxhlah5geitbYIOqwa6Ai9WO1Yecc=
X-Gm-Gg: AYBFou3teBl/zfGUubXATwMtTpxBG4nfnXnaQ9/n+TwfNyJyZEsz2hj/W7t03VGpKf6
	e6j5VoBETt/9KUChsDrywRzRvRFQTko9knaFdmR79TfSWMpz3yLTgZoi5zT1WrhpPQ1FS8Fr+IW
	vUo2hNMen8uEnKTh2Zpqwe+2Gt4EmmWoLFwy0+vlaUW5gtvOZTlG7ALjf3tOSqPQdOzO6mNctSL
	WW2Gxa7+KQJJuJK+kX9llejyBdMfNLVtLnD0i4kdM4byX4v81k2RNyOZVQZJeJ0UP9TlE0iWOB/
	bO7g3/11w7bfuD+d59E0xrUxmEgHJMWvvzN+ltVHM0qhEVeuGslr0vuamg2z9SdfIRcuy5lDNtk
	o/dpM3DBwbmuz2k245oRK78LtRSG0+0biL29O3R/n9b+cuvENsoUB1XWb5zs5ElfrEkhlJ3j1Pr
	v5gSNviYlJy2wWZl0BI/rflVvGnHhJdWDiNPOuiOv7ZGRMKVCyyzankakoF8cnGZmqa+evSaD2a
	VvsyOJgyaMgmo5XEQZcrgVwSeNfUQ==
X-Received: by 2002:a05:6122:6602:b0:5ea:c727:11fa with SMTP id
 71dfb90a1353d-5ec4c932ademr347091e0c.0.1793139959098; Tue, 27 Oct 2026
 15:25:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
 <20261024-submit-h616-uart-fifo-v1-v3-2-286fc1b8c3c1@gmail.com>
 <20261027-nifty-reliable-octopus-6cbac5@quoll> <CADvTj4qrBYSyT39=xK3_oGgHdFoSH=oyDvTtLCSzW=F9KAgi3Q@mail.gmail.com>
 <3287a7db-fbab-4b23-9ee0-d40c52fe855a@kernel.org> <CAGb2v64Qr-XCRdgi+RNS2XkKUn=F8zW+8WUKaauM2PjzL2XgWg@mail.gmail.com>
 <18f1e637-48de-4962-8a13-65f6597eb2dc@kernel.org>
In-Reply-To: <18f1e637-48de-4962-8a13-65f6597eb2dc@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 16:25:48 -0600
X-Gm-Features: AclHuK8HgBo8KQle8selMQ5AGJ_mUpjdczBdxOIx6OfVD5T9FzVHNBxWX4VKWiM
Message-ID: <CADvTj4qqwC=HjPmsdHoZdNNWY8GN8TqXnQG9PqKD-GpRZo11Kg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wens@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 4:05=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/10/2026 11:02, Chen-Yu Tsai wrote:
> >>>>> +  - if:
> >>>>> +      properties:
> >>>>> +        compatible:
> >>>>> +          contains:
> >>>>> +            const: allwinner,sun50i-h616-uart
> >>>>> +    then:
> >>>>> +      properties:
> >>>>> +        fifo-size:
> >>>>> +          const: 256
> >>>>> +      required:
> >>>>> +        - fifo-size
> >>>>
> >>>> Why do you require fifo-size if is const? It is implied by the
> >>>> compatible.
> >>>
> >>> H616 has a fixed depth, but other sunxi integrations have different
> >>> depths between UART instances. For example, D1 has 64-byte FIFOs on
> >>> UART0 and 256-byte FIFOs on UART1=E2=80=935.
> >>>
> >>> Should I keep this explicit for consistency for all sunxi uarts?
> >>
> >> I am confused, there are no other instances here.
> >
> > I think the point is that it is going to be needed in the future when
> > we add the compatibles for the SoCs that do have UARTs with different
> > FIFO sizes.
>
> Then we add it. We don't create code which is not used.

On further investigation it appears the sunxi boards with UARTS with
different FIFO sizes might all have a register for reading the FIFO size
at runtime via FCC capacity bits so I guess we might not even need
a fifo-size device tree property for any sunxi boards if that is the case,
not entirely sure if all mixed FIFO size boards support this however but
I have yet to come across one that doesn't.

>
> Best regards,
> Krzysztof
