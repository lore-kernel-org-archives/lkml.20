Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793349689;
	b=ywpBimwzPLgtYkX+Id6IqnQeSmWciwkRUI9u5XJ8eFmP3JE/Y5rszZ7tZYVvpjCxUeMM
	 MECqGX7p1u7tJih8Vb9ZfIwmX2H/cA3WeD/IzZqB07lXHqdRP4GxC0wfQVxtnUCboBerI
	 kmhbYpzphBHPiHdD3kU8x6mzFQZ1v9otI5de0xIbWBYPUdnauHzICGCcMXzm6x1ItXVqz
	 yAUc32oeodkb7B2bvf9Da8EMt9nG9lvyxrvutHXa6rTIrLVSRzMNLOKYwDSUAiFKg/XUP
	 2VYlS+yjHPGvA4BY6xhIcPWxkc79p01PeoG3ABR8Kt2olBAMUfRdEpFgja1uUROQraA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UrLH7U2TwTbVq0Prf1EZK1OLwkqGxJZQmo/JtOYxWHw=;
	b=LEPyV2Yj7xnNCWoN6fgerPahF3c0HQ6pGs2qudm/kpAD1sZWmdayrQo/BXKpMGRCwi5/
	 NVpCKr5MUrCgKfBJM6Nif7ucWPBTDfxFmwmlbY0oRzIrYyvXh05+RjRJsSEu5l8U2vSbd
	 1IwV71J0hGL5BgIqTBoQnrakJXUWyRuxTlGmEx/pVn3nnCbiHBWz5YTId2wJFoxljg3tf
	 Gl/d086EBRdUZtMdnfoTWCubjhLmC31ZFrczkIU2I0orB6rETJkRbZ3wQCM9L7u8kyFdT
	 mk3KyNKUOAoIZe/GblURRMP0CTlGQmp2Z0FDxZrRxrgZXAU2YbZMkfSa33In997xfIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKsLO3Ie;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B036D606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B036D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKsLO3Ie
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so1592928e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793349687; cv=none;
        d=google.com; s=arc-20260327;
        b=XWPg4c67JjXfmTRlvFaXP7YKJbgcuxAIwzCjh+JR6BAdpe1Ad3brxZkdlXx+3Pw4w5
         3WJRRp+yCcGV2O89Y7o9A//TJzmqyddL0kzlJfAeyFjg12vI7qE+rTLNbCDb2cw1WArz
         TAaxpSZXxG0PGE14g0BEpgDW1zRpHO5zGKZrxEtLoGw0tNJQD4Kr4azQ1tLfRPeH+0fq
         6ELM97S5CpUgM1B6k27YJaSa0i+yfQV9Jn7mELlU3mTMseOI6WIKP56f8nEXfD5ZEyFM
         Gk3h3ZL7xb1W5HeKGchThZ9QiMzjEGb81aBiJvXKhhnJlm6tUPUdeLKO2C51qmcIWYJB
         C3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UrLH7U2TwTbVq0Prf1EZK1OLwkqGxJZQmo/JtOYxWHw=;
        fh=KyhWK6PHtphBg3e540/0TF2ScWJstULxyTl3StufJUs=;
        b=SBd+jo6mKHOjB9fymxJUO3lqvgTJbWSwysNfTCT8HhosgtEGq7mttAUStUuIk2X+iA
         Qdz3t0qN55L4e1ZA49G8smnrmQaCeuI8qe+j1Owik3mJpGfJ8fqtZtUsCO1VIOkQ4g18
         gDez7kKX4BlLomYOaAyNWhQVlSZj+RYOKNl+i+2r1CKdE65shlh13adf0IwqzANuB/OL
         4Kt72TRhDXMaUEyZ/a7rwIul/llOLovLwUQjPrGQ8+GYuoexUmS1+z/glvZIb/qZdnZv
         KdBJ7/E7uyer5d9ACxe8t/pdvaiH0oGsmHHtiR4FceP3o3mH5TLl+jcH54LFi29DCISU
         oolw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793349687; x=1793954487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UrLH7U2TwTbVq0Prf1EZK1OLwkqGxJZQmo/JtOYxWHw=;
        b=OKsLO3IeFrjmRhia5U7avHthvPf/c7EndZITjoOvpdgWpednDscHO/GejLjawfF4BD
         p1FzblpPWXUfIOmKTjrp/K5OpIBWppICtumm31zTv9dTNLfn0FDUH8zuYeqL4OhquoVH
         fb3rUfGaa29K2sJw4tyC4XP9pET0ZSOO1Dj5FgcwwqMQNvb+29jvuyuhBtQlLJk9iwNB
         UeMjI3Lpx/jjvT3Rjr8ikbI+kNpfU3p28Oas8AR8yNV/i9BR/xhRVFmeE750XhOMRuGY
         vVYps1YZZCcWOms4EvAJRJoenvhIlfhfYFeihIEqfNrHZmBpWec471xXSj4qRUIJEiDs
         a/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349687; x=1793954487;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrLH7U2TwTbVq0Prf1EZK1OLwkqGxJZQmo/JtOYxWHw=;
        b=0nFeV9dQTAIIMQXAyiZRRk/WxZrp/LwC8xy7CD2plFFryH3CAkTUwbfYPbq4lJ/iWa
         vQDGdCAa4mJJHMVYOs4o1NOTEMTXTd1XYlxcwQlkuL0L/11vqUyQgAYS2GpHANyFVulN
         H8ZbU3pliEQs0r61rfGbuTh+6judM5twaR+O9OjzUsQrbUXDI2ZIC15shSNnUxLcpt5E
         VVAWkOyS2hh8+WuRNPOHipkQJE3ijxSJq94VslO2Lort2+Bh56ettmjRtX44h0uNeV5z
         XaryZkvdmi013qp1ViCXnJWmF0mBSsKamwQ48CKjlz4y/Cbwf6jOsi0ui7yQTp2EOZu7
         70uw==
X-Forwarded-Encrypted: i=1; AKwUvBzfcAf9AvvSBdNK/ybA8BMWmVZjKZrh1F2bkJd1Ijgxe5DlAELT7mzZMeXQcB/0TZCmOrCBnAcxwoXR5U4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJh3PLBMtZVBRkPbbJFO3tjS0lhAgEqn45oTg1zY2aK950Czmwu
	Bs2Ll4G7PZoLRWYf8aGgcYwd7UtKP7oK4XuPF98GwpUeY1FKzIL7Z0SIMf8CF1KD9cutgIciv7d
	73flNZ70iGCfnQgk4QXxGaQ2lRqBXGzA=
X-Gm-Gg: AYBFou1F5gqVNZwb8n746pD+IpTPhUF3lS+J7l9SM9ynI2sHDYfSSoCigJRVKfoEAKJ
	LfdiwGEqMbvWhfvPtTL2ucAsPhejkmKUiuE51075SPTzXnVYf9qBF1dRSR7Ud9wDwuRrcEqcUWH
	FQO0Pfv839q+Oj31dW/mBSMB4FOWPYxYsMsAdFwmUaehtAMn+c04x4MjHV4Ej4V3VXjPJY759GZ
	N74VIlFQW9HeGcU3P6rS3SG83y86/aWbw5I0dg36u9SBy7jQGasX5UakD5JZBH61ylB+uVqSeE2
	pNa/aTiQTQ8f2fLACG/ntxtzSGGhfZxh27vV+1cDQVed0bQ19rw+Gsj/G3Y1sWb9l1LoBQqCpwO
	RafOGbYUqf0n5NgpsPPv82sNARlfMsCx9iKfF6d+GIPbkPhYce//RYW7y3t+FvpEfhY0SW9Q=
X-Received: by 2002:a05:6102:370d:b0:7cb:cfcf:3d01 with SMTP id
 ada2fe7eead31-7d05432ac0amr1782183137.33.1793349687565; Fri, 30 Oct 2026
 01:41:27 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
 <20261029-anacapa-devlop-phase-devicetree-v10-5-26ee3cf9d9d0@gmail.com> <c78efbed-e91b-484c-b2a8-4e44383bbc30@kernel.org>
In-Reply-To: <c78efbed-e91b-484c-b2a8-4e44383bbc30@kernel.org>
From: Colin Huang <u8813345@gmail.com>
Date: Fri, 30 Oct 2026 16:41:16 +0800
X-Gm-Features: AclHuK9XCUvHE6twaUxwd5Nq_zSeUGonn6zfgdlBk1GcUoScVQ6GTN_l7KvPN_Y
Message-ID: <CAPBH0A96nFFqv4a0--OD=67w=uNkiX5qWb1aQFF9=kGVsUijRQ@mail.gmail.com>
Subject: Re: [PATCH v10 05/16] ARM: dts: aspeed: anacapa: Add eeprom device
 node for NFC adaptor board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, colin.huang2@amd.com, 
	Carl Lee <carl.lee@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=8829=
=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:43=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 29/10/2026 14:38, Colin Huang wrote:
> > From: Carl Lee <carl.lee@amd.com>
> >
> > Add eeprom device node for NFC adaptor board FRU.
> >
> > Signed-off-by: Carl Lee <carl.lee@amd.com>
>
> DCO mismatch / missing SoB. Please read submitting patches document for
> further explanation.
>

https://github.com/torvalds/linux/blob/master/Documentation/process/submitt=
ing-patches.rst#sign-your-work---the-developers-certificate-of-origin

Thanks. Krzysztof
This means I need to add my Signed-off-by to each patch, right ?

Best regards,
Colin

> Best regards,
> Krzysztof
