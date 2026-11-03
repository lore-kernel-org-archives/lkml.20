Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793683206;
	b=hcT1gVmFnI2p1vyXgx6nPt6KPGykpTJM59sgEuHJakvuIJ+FicXM/n1OoNv8uqUg6F1I
	 Z3Oqd4fW5IwbB5IWDqK8PP24McRxd0c59X/k/RanJdG+rAek+RmzJb4JHJYzw5QmPkNFF
	 U2MJDt4UF9MqdZrNRaXKnpGfUHwkddRJNBIia1SjOr7uUm6/SKZiAwBpDcxo+ez9GPCXo
	 EJ8wvzKHm1plo1f55Sh0Gl+WS6CLrDJTm8fa3c2cUhbWNxkSbhATr8apSRV3TgNEx0q5k
	 nm69ANwFGbZP2FTRECUNV1psGqtvkl8VLMNuldeI6Xz72KkfrYegZImFxlygq8ZxpjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793683206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pDTsD4t56MeX2uV9b6GeWSndHvaDFEKKyK2s+LL9ewc=;
	b=oN7QVeXccWaY66HhyAwlE1KUiHZZTBW3QyxZ6kd/NotfYlFD3d9Lc/aYxiiciBdOxsOo
	 gNWS37OgXa6V99CEFvVaxHfgjjcPIjG2q0ldKMN5/UiO2gkhvof1khpHp30kVvSq/S6nQ
	 K/scHKF6s+vZUXihizzVtcL+MJ26xHdG7oVXA4jvAl2w4jrEO+hUxl2sTNZByfiOA1CyP
	 lvxWSGFFIJfrlEmq2/TnrRjoeGbVXVuW4u7XtO/T3oqZfkEI8bYSVaNMkoX6DCMen8l1Q
	 pCobj9eyEIYrqBwW7OVRxmUFNLizppapB3rE/h5DkbMa8dKX5IK8NplsCmaciyXNRcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3IzuS6K;
	arc=fail smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85594606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 05:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85594606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3IzuS6K
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c45551fa84eso546765366b.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 21:20:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793683205; cv=none;
        d=google.com; s=arc-20260327;
        b=YlVP+zufc3S8pyaWkZkMmZUqz8zFJRWmtED7bOBk9LjOcllzob44/x3OR2cvaZLK/W
         80IrbtgNwYvzBIKHyX5PMFeXkC4gCoME/IDWKXVBVs+Qpx2Z9ghSGFcNUUPW7XXrLbIw
         hT8prsl2OTpT16KsYkvDd1m6fs+iq5fKUfqmDkseuOhuKfAlRSiWom9G5sxVFmYX5Pln
         1aFJCmv8mV676/05jIy/pkQeliPS9GztL1iSF2ZnCKjN4m4ly2xYAjd+UbOcg7hUMFcR
         GLUiLkPWSsXYr4bS+cg9fS6L8eYRido1K0grlnQ5gi7e/jRJvpFWtGaHdYKxQDXGRi9V
         qnIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pDTsD4t56MeX2uV9b6GeWSndHvaDFEKKyK2s+LL9ewc=;
        fh=SCqsvPoWisZuTxPXMsnjH3JS1lmcEGJJAOwSc5L8AFM=;
        b=jZk2J3NPI+qNcc8D4Bc4jH9NXtVrx9u1LzDlqcecEdFLZSt8caxaAiIfqqD73IDghS
         q7R4926JTZ9JJU9Y2GpDDLPqDsNHX/s6xWFMBUpn4Qv9QnCAWTEYGHQpwonVlYg/icU9
         7yHWMj+2LD75o+8eMrZwjBKTTsPc9uZwbd03uK5/lHIefaovrtX0KYMVKixFZ+6gH7Eo
         8LbJxoPJpeAUY5ma72gkisD/MmALLN/CCh421cEoOUzN+jUzyqXzo45xqj2Av98o7dKp
         hzftIOjEsYngKP0yH/VyIigKvC8TgHr3yTUTqXLUw5iD+5jL5u8iaIY2D0hNwPQ+rQOU
         uyKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793683205; x=1794288005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pDTsD4t56MeX2uV9b6GeWSndHvaDFEKKyK2s+LL9ewc=;
        b=M3IzuS6KCu7o7iNdl6VPiSqbL231YdHzMgGAGeXFG8t6cpxlvypNiaYepyn4x2q7lW
         8kz4Bd0tu+pUrZibEHgqYesViY87g9GQqCSLj9th/snQ896c3FaJUifwQaSeDR7Pa8xI
         1aI6T/YUi2gSYRbgsFpqRl6qZWUmyXcRe/ewVN7NymUF+2Ecv5CfCjPxXr9nzYCuJyr5
         Mu9rOsv9QNU0vog1DRT+tsGJQWJTZ0aeutV9xLpYyJTgV6H80RBA7V3WgEtmtlIJadgF
         zyOvk8b3soep59A6arPrSJn5O0RxtLkPGfHbgH3i97i586HN2pdDJ9ZuhsQF9DGPzUTG
         FePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793683205; x=1794288005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pDTsD4t56MeX2uV9b6GeWSndHvaDFEKKyK2s+LL9ewc=;
        b=c6OwAlLSbnjO7lvlZG3GETIV78ii3eFdz9ptNSoxY4qPFBS/OsCb/kMRUn0jrwqxnY
         rqQlVAbl+b22VRI0aPRbonG+7KnW51lgOvV2o/iePPglN9ZsaI7RObJWdm59JTiyTaNE
         SDT5zDzlZhIVsC5fbGZE/XA9Svxo27sP+Fh36fXzp2htEM30TxUu0GgtiD1gY2nihEPD
         SyGUZ3lpAuF4wWlE/bbrfMvs5R7I/OIC49ezE/JEISAiLSsy4tGec5FJ7IPhXG34FjWb
         nqcD6s1/XAh2iLOb86qYhfvXov9bEJv+MFKLniWNzijKfG5NuQu+EWmMNTsT5vdLvqGd
         OZKw==
X-Forwarded-Encrypted: i=1; AKwUvBwoQkZjAGR8JXnUyeuNWHPNbHPaGNYzJpjLmQr1MQIJf14rsUh9qssCra/6EFMwW2NtEhqIwvwk+mzB5Ys=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FpznDbNB37FRQh4bRANzQaQP4HPi2fmqdh7Vc3bdd4WgslSIR
	pcdv/QyspyTPNHNfmtGLRmlvTZsa7044ZuIcnsCaeWRjUXnT+j+79/0QVkGT1sqRB4ieNnhQ8kb
	YKtyYP2mEVolLlh13u9+S9bMaB5kXzY0=
X-Gm-Gg: AYBFou1KOh172v+yF3JP5zZ0r7aDOFlQvjhTgTwjmaq6PCLvUUPRi/8fPqxsHcyqDi3
	5RANr2PlOyC13se62+ey8kHSvwMmw1lqlsYKnUQ3PeiB0cKGwP63pG7ISeSkNCYF5gcZ8mAJlsN
	AxNx64bvwWZUWpyh4EMcjPDN3HMqshKn1keqG14i51MxuRGJqZbKv7DABDiINFQ0X+AjBbJd/gO
	8+Yrt5+STC8NQFo45YAnTlL8i0LZL3A5wJBbPfVaoNw/KcSMaY9pYG86dHhAGNU5zWLZXKcSa/k
	XXhJ8SjfLiWL9dIKKbKVhQINqTknPlCqJ4vtyHNh80YuzisWeTBtXYToYxB58RpQf07ptnzCycH
	2/TOvCFU2R5UfecQ3qs8yYewTvStoNWK8L1g5zRk6MfcBv5wz/OTe1x1YlLA=
X-Received: by 2002:a17:907:1b27:b0:c31:8441:35ff with SMTP id
 a640c23a62f3a-c4ca7ac00e2mr960824566b.48.1793683204767; Mon, 02 Nov 2026
 21:20:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029073257.84594-1-shengjiu.wang@oss.nxp.com>
 <20261029073257.84594-2-shengjiu.wang@oss.nxp.com> <20261102-tough-brawny-rooster-a3d3cd@quoll>
In-Reply-To: <20261102-tough-brawny-rooster-a3d3cd@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 3 Nov 2026 13:19:37 +0800
X-Gm-Features: AclHuK9QcK19DBzWKX6U7B2jdmB2traqMfPAukSvaMhLFGEyPx_6lzhivdpXnb0
Message-ID: <CAA+D8AP+=qDya3JDPTn0WYTG6xvoc=ORqkTF5FNWvArgd3DB6A@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: dsp: fsl,dsp: document debug reset control
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shengjiu.wang@nxp.com, daniel.baluta@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 7:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Oct 29, 2026 at 03:32:54PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The HIFI4 DSP provides an additional debug reset control that can be
> > used by the debug interface.  This patch adds the `dbgreset` entry to
>
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submi=
tting-patches.rst#L94
>
> > the `reset-names` property and expands the `resets` array to allow up t=
o
> > three entries (runstall, softreset, dbgreset) by setting `maxItems: 3`.
>
> No need to repeat the diff. And if explaining more, say something
> useful.
>
Thanks for the comments,  I will update the commit message in the next vers=
ion.

Best regards
Shengjiu Wang
