Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794774913;
	b=tur6bxpiA1wt+YM+mtnx7jtfIyj69edYmFwiKjGDGM+Gug7wkmxfFUsjvPrwznm6SWSD
	 4TROJhIhpvlBOSp8ib0fuGlzUen2cN4Qlwywrm78qz2Nv8O708mEBgUdPmcwjR8fy24mP
	 XMQlypZXpJAOi6jJGNunAgi3t5TJQZCuKbHi3hHqVSIgW6sbGcVP5mAy5iSFfdkcyNj/q
	 9imGVCcfG8SEaV/JhkCQEAkpaSAJ3R/9O6dggzfsul+WBoSZIpSuRitrUfzGXnJURU5Bh
	 33ol/SS3bGsjwCL8vvVdpkL8lMk6BTgpV7Zik2+DsqSZa8qxs8W2B3TjbR4UO5Antcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hfoGaPOvarXU+50W/KFhlCJQD8hal54gXW4WmBlLFMM=;
	b=mjInQ7Hez+5qYL/iVoKERXlvnFr6LKibiekMTpKFcQQpsWrcDR9qOtiFiLpIgVotDfj1
	 Cy7Crmya3NeHuS9qxL2Z2OOhuhAT4QhxF7nOTMIYj3EbsSsrnibZGBTfGO9iTOlJvMaXM
	 VKeuaUZCS3xdx1gIqyMFAYcyFAVmNVIyl8hcV86tl5Usylkr8wHIiQmpa1wvIia+1Cj5O
	 irmwMIp/BUDIIg2/2t6v4jZ23tu3Kkwt0MoibOhSiKU/JshefkXEO3jZF09IvKdEpW/nX
	 AQdpjx57m3W7eIZNScr5voaNkA5as9vuKmXL8zBw/dLEFvcNnlFRsVVPGlbCVSvc12w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=TzBK7im3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE95606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAE95606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=TzBK7im3
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b4c2da74c0so4156507b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:35:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794774912; cv=none;
        d=google.com; s=arc-20260327;
        b=mzPJbegwT2hydk8BcCxUKYXsa6kv5OW4Y7sXVnrjSukL6//Zz4s2BlZe85Th3AjlCq
         Fu6axPvoRVU/wMQds1pwtnLB7WLDiHz6tcqwUQmX8b9oyjUZCLF1nfoup/nOdvchY0Wc
         l/tMbGgX23C41yq3z6lHagvIJinOG/nZld1puLgcAsNoP/kF3sOs87nLWfKmBTc8mg8W
         j8KT+llKe43/JMIdx3w7WzPV84DPI56QOysqXORNpuZ+G3oaOszcjT33ILPNSRGUvawd
         OA9kHXR9Pmmf9Re9E2lAPqnAcIS+Pnq2OK+DridhQ4+5t0Rsmil9o5q0v86kC25yF7tk
         6dqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hfoGaPOvarXU+50W/KFhlCJQD8hal54gXW4WmBlLFMM=;
        fh=On7R+nc2vtckB4PUhsjkLYHOceM9SA3mfG6hZexM5aA=;
        b=cjNDlnEWfqmykaLgvm3ta++ayavwAa9ljwX35nxGhe68CUL5Isi1OaLhCKRgA8MkG9
         Q9Z57jYXIJ9uMGZnWSPJiYNPu729q7XhACUXC3/mzbIrRaVaOuuwwArFsGXgESBgKvae
         wLsm24C9AplRZsNUuGRKs6vOGvlpR+gSKw2pmZunm/VpwSYu14Tnp9KIMJWGtt74tL2B
         v5w1zZpgGtGQeNEjSPwBxzyds57CtF7bGuR+YPbC41T08gH57ag0eeNf0zd0ew4l3IyW
         QCOtfZ1YVV1g92c6RWH1nY/VwAcndhYtVCVGMlFRhYPJhzOzrFvKOYyg9O72++tZmMTi
         22ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794774912; x=1795379712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hfoGaPOvarXU+50W/KFhlCJQD8hal54gXW4WmBlLFMM=;
        b=TzBK7im3+A4TiHE8I1qr19R9+l0rNSyHA0FD1ldcuLLKw1GjH6aCJNIaK1H04kn3Kt
         tq5BWmYEFXeGwK6Fw/3kFe9rGnRajOyFIVndChGVmR1Aw2BDigzZbBodCm5A6Cc9bStB
         W4UbsLi0e0KPaOH3/AkiJO+gXsar0r5vtdsMi3Qy/czfHW0hhWap/KazaPCqm5oDF9Fm
         II/ddsLBDRW1iVoWxcLCNHuYP8V9XU6Xqtk7aCd/drSvKhv1VS7TxCvq8iWt56MZeDlH
         EDlSJ5KYossvwEWcFTNeNxEeCBnlYEqok51o3nrg83hAKJp6+arb9VvCD7nM0gaePGSV
         Oqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794774912; x=1795379712;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfoGaPOvarXU+50W/KFhlCJQD8hal54gXW4WmBlLFMM=;
        b=V9tqmTIqMSFnZ52IMvzybj8K1UbvYvE7S7JvPxqbvtm+yclavgIuJBF0e6XOkh/NQ9
         gu1EJ4a3Fu0/tc0xTYkIh+MvLGCvmu4VVXfKOOrQnE0Z+fJ+cCj/Dw54z0lZLEGa+Hti
         maMnyB3970FiCzK4boK6BnlfMqvi4sLg9BoGaWzuVjTduGC5hTvOUnTyZlwiyIQevPER
         SX4KV2qAIrsiUROqYOaOww4ROXTx9Nj17FUgveDDn7vVmABub0P+X9Ox+Nk5B3Fok8Ot
         slmaPHKDuiaQESWLkTvpLHKmaWfLl/E2151g2wQmVQtWmqtW9iFoeAvTFMkBc8puseMJ
         pYeA==
X-Forwarded-Encrypted: i=1; AL+hErF1vHF1c+YYhYeWuZB4Ojgk5uHNCYm7nepuOZckhM0Tnxc/m50aruDMk0yAOA/mJMU0+ksbshkVUhwl9aA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wQTrADHfa+X3OarSk82ckq/JuCPEpGOVyT0DOiBRfEwu2o9Ho
	AVGuqz6+L7GvTlpU72w0XWrXksL+XevBeOd197aICJlaqYHqSA3xUmAcOoIXcURlCJKdwtEByxn
	eIqSKMlbj2YMCvVNt+8wCVIB0dkiYKyY=
X-Gm-Gg: AYBFou3UoqX1zagUZvZlCb3HA79a72TUmLFb5+574ex7jm6y/whFOLZ/cLehbQoFRdF
	IK1G5QbynyCMS9QLRCLe/z18/1tKhIy/Hw1XVspCUnzzWBQNAKaWgFHoq6IE2LZZWextyYRdy3C
	FeeeCumKT0I4tty4HQ31LFoWMbvLutDSxvFqtCAHHaWo4MshgYSNRuDGc9uQd0z7VLCHz/GFHvN
	cyw1gcCCrY/4URNZvCllO63ZchmdE6+9GGtMfvhzVycuYGfrJVjN3uAvVHGPiutggy9jun8GIEN
	JzW90wRq8tS9Sopp0fPqVBwGo9+vsSkD0PsKGBVEt9rMrVe4jnWMpHenUUCDOACfRp1VLmhGl5Y
	JKv8Q5jRcKD/kWP9jbzI52/BHA44X9asZ3mGd/lioXDfC3kdex3RepcaqeNTBKwcpQto6wA==
X-Received: by 2002:a05:690e:12cb:b0:67d:b94b:6021 with SMTP id
 956f58d0204a3-67db94b66dcmr213466d50.143.1794774911740; Sun, 15 Nov 2026
 12:35:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106104632.54161-1-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261106104632.54161-1-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 21:35:01 +0100
X-Gm-Features: AclHuK-bZ0RnQfOiBUZa9VF3gQt02asaFssBFzc6vFvqnEmYWhTqvHFuHS-Culc
Message-ID: <CAFBinCDfE9J7fFnvJ2YqeFx1ZijY+5aFjGcpcBLMDrnpU8OipA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add S4 support
To: christian.koever-draxl@student.uibk.ac.at, krzk+dt@kernel.org
Cc: gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:46=E2=80=AFAM
<christian.koever-draxl@student.uibk.ac.at> wrote:
>
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The S4 USB glue is the G12A one, but it fronts an xHCI host controller
> instead of a DWC3 core, with two USB2 PHYs and no USB3 PHY. Add an S4
> compatible with the G12A one as fallback, and allow a generic xHCI
> child node.
Krzysztof, I have have a question regarding the last sentence:

[...]
>      oneOf:
>        - $ref: dwc2.yaml#
>        - $ref: snps,dwc3.yaml#
> +      - $ref: generic-xhci.yaml#
Does this mean we need to the allowed child-nodes to the compatible
string (so only S4 allows generic-xhci and G12A only allows dwc2/dwc3
but not generic-xhci)?
