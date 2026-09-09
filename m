Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A242149BD64
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788993261; cv=pass; b=pegAg0VQKLsrwWGtK6J4ogMkEdBpiyBn/JVGtVIhVF47cI2YMFxCtXCOqBc6qObhDl5X40CnvoNVNX6u006KadwWNjxx9ZCeNJeW63T9phGFaquQko/6EcVi0f3QtMWayMb366ZkmYoFrzoOPThM8koVgkikIL89YtUGTZHcxBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788993261; c=relaxed/simple;
	bh=p4ouJS0ERmg4V41iiyrVTmgErtU8is5ykYRBXMvLOfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRPOMNfz9l5gV9Fx5J+kIPSLj3bfmqp2DkXvdic8Ocnbc06EndNLH3O+/hBwC7R5OvhH5q6HgC5zpBwVUgFDB6VS3tcC5DFb/t23rQC63wusQZ0x1ar/ni0k0o3roMkHUjJqAIogOH2/FlvFAEuE/tSVxq9vccdvSTy9ZwzyqCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1ic7lJP; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1ic7lJP"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c294a71c377so16290566b.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:33:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788993230; cv=none;
        d=google.com; s=arc-20260327;
        b=pWn/HPQn3cqDhaMOLJh04zAJED/O08OAVt+LfaFmO/QKHDGY65uyo4WmRWXaJm+dm1
         a+PelR7z6FKCoKVJSFMkopJW5SKcORt+1n8AJppHq+ly/OaXUcdF0IZ1n9j8SY09l1wT
         dJLLL2+VzsFpithP0tnS9O7825A/p839oJxrJBXukXsK5ZQ84xNmQMqpijH0YzuYj/pk
         D+atVW1mtoy9z03ua1yNFQxBzqv7f1uoCZBWIyY8vqZelmJHvFmdGLmYdzBV9sPfm2wG
         qa0QsJmNQp7h6v8YSkLqRji9tyTIO/pu63qCY8J5knFBt3gEDe48UNKzPHJv9zze0G/u
         Pk3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XriYikcYkRGTr1z1OW979/dS0p7qEfVswmwuDwYZJjE=;
        fh=PT69/HNXvStc4WjhLmwE7xITMca+U8+SGpjBEU8pX+o=;
        b=Q7PRZcqylxzE3+Lb+m0Od+W7NSWb4TPRlJEJG3Xknl8C9NFDT8KdnLnkZtTXiJhVtk
         FbBavIK/ZOsLumQNFvXX5cCTaXuZuTj8IuNi7ppJuxFD0nNeAeLEAu1dEeydHm2MlKkn
         vSPt0IinUlClL/Gi3ihj2tIwXv4ZjobFhBNwMurxoavT3E6CV7FcbYHQeZacseS1W8BB
         k0tHn9F1wlSnaOeCop6/IiEDeFY6xkAEmpS0rHozDetvu4kiPE3B26RAvl9gFjWbxshw
         cN8vAO8sprnTTtZnFwTAAHZklxzBnrCv7UmIbfEztC1WqZajJMPGTLd38HRdK2f7lxHH
         qoVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788993230; x=1789598030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XriYikcYkRGTr1z1OW979/dS0p7qEfVswmwuDwYZJjE=;
        b=i1ic7lJPs6KHov3g3v3wLtzOaS8ZEfcc2LNKH5t4VyrzgrrbAF8rd9XNDclhi7rufJ
         7qAd3ik6QEmEDaZ3ROjgbgrp+dAM9IhZ1R1vJsFlfpcFIrR3kfEPBhze2EPj//unoIrZ
         wExuIDGiKkdZECRiBlJfLx4z3ENkLRidsTB87OGdulmbe5KdwhvtKwwDlHglJd/W6a0n
         uztu4/9QGAtJGZ9HwLLWtQklpayicp2SXlxh1cEogSBnPonq64wJHhH2dSGPCQv+BC/m
         COqm/7x0y4zkSv6MjYk0AVm8ITBccZaUbzNg3MsHMiiemQ58kIv9iwkclUhOQPYnOose
         UVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788993230; x=1789598030;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XriYikcYkRGTr1z1OW979/dS0p7qEfVswmwuDwYZJjE=;
        b=h/3fy6mN2FhKYlYUJoTD3HjYozALCIeldFAEyFX4bfpSmnTjlxLvCpdTj2tBC5mTaS
         D3RPuPMbXWh0zQU4Yo50S+eh40yK5KBc6nvXH43XQoeuSW7oaG0TdmXIrcuHG0g1H2BO
         4fZ89Dvew4huxQEmdCzjzJtyYCtaFTHZlTfABHU7eFZrN0T4jS92HK8T+CxYW5Gic2op
         Th+n6nKEl5WAH5EIPQX0g9CRELk4o61QrltQdT+DVqpuFbgypjF9YyyNaM3GSybvn0R+
         unnxexTEY45S3G0DRT/dcMGa/Z65FPxNbggGpcth3R8JIIim/76OU0nR45ZBoI8VtCAm
         GMNA==
X-Gm-Message-State: AFuF++mbjmgV4y917e4iprxLCLa15JdLBHlaKY4NfhgjEnoXIUvqAkpT
	yDB/hHPlJ3B8DwaNXmQxQNkztqJSf/d5ENfQ2rHB2agNziNImqf2pWy6mg3VtNtAPIJQIyE/pil
	AIRXY70MQnObEJQsz8YSPFDfqXwWY2WlYrA==
X-Gm-Gg: AYBFou2XXn2kaAKQH6kJZr+V3xq/1ckhIHhR5CvkO0WTJKBIeI0NO4aNlF73HDOnoFM
	ORW3Vdxkpuu7ZB/Yxk34x0kjvlNlN9AyEExhdJV/BxdSY4LUrGVtp/ZxJQHWGSVzBRynebxTCF8
	LiUgYOAtSiBh680jsZBdzoPOZ1ouMf1jxMTSZkRWBfqUPTvIlH4omsGDEoYbaZXy/gysen6joj1
	sjk+SCcI1FicrVzkXdj551wjewphcwZ/BO80eHIJquiyAY1UihVWKJbip5Ut+0c1d8m6n8y5PnB
	U4hHSymQedLuNaThUok/w+opT59v5xcSSAoneaH5PpSh7+C2X8vYgaiEpmtdP7HD4v7epbXjz4I
	NcZb08KYRxx5ZMCcnU9UypTQGmeY1ALOtjyBk946Djnj7hgz41iWkYFmZirZ66uiCOm+C4Xhsz7
	K/NwXWLYPCtr6JAT4z4Or03X8XbIcBmd8ibgXi0FUVSb7BM7BMI6dvzzab91QZVUvS3g==
X-Received: by 2002:a17:907:3e9c:b0:c26:19de:9acd with SMTP id
 a640c23a62f3a-c2619dea779mr1330877366b.37.1788993230198; Wed, 09 Sep 2026
 15:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721202450.485171-1-rosenp@gmail.com> <20260721202450.485171-2-rosenp@gmail.com>
 <3bfabe23-b88d-4548-a7a4-06bf526c3a31@kernel.org> <CAKxU2N-xfKn_AChcAse_nxFBznxog+OLYW2htBwKHd_Mxk0BUA@mail.gmail.com>
 <dc7c1fb8-9d01-4d1c-abcd-1bddd70edecb@kernel.org>
In-Reply-To: <dc7c1fb8-9d01-4d1c-abcd-1bddd70edecb@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 9 Sep 2026 15:33:38 -0700
X-Gm-Features: AcwNN1Xv4NrhY70pBo01DcLol3V7gUwQoVeyBo3ixR0q66dA2kZFKyovsqVHdBk
Message-ID: <CAKxU2N8OVpTtcduUtodPtX+wP4qF5SXEZAyVKxNM8V8C5i6Xqg@mail.gmail.com>
Subject: Re: [PATCHv2 1/4] memory: fsl_ifc: Fix optional NAND IRQ handling and
 migrate to platform IRQ API
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 11:00=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 06/09/2026 20:34, Rosen Penev wrote:
> > On Tue, Sep 1, 2026 at 8:29=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>>       dev_set_drvdata(&dev->dev, NULL);
> >>> @@ -204,9 +202,21 @@ static int fsl_ifc_ctrl_probe(struct platform_de=
vice *dev)
> >>>       int ret =3D 0;
> >>>       int version, banks;
> >>>       void __iomem *addr;
> >>> +     int nand_irq;
> >>> +     int irq;
> >>
> >> Why do you need the intermediate variables?
> > In order to call platform_get_irq before any allocation happens in prob=
e.
> >>
>
> But allocation is the first thing the probe is doing.
We're going in circles.

It's better to return -EPROBE_DEFER as early as possible to avoid
doing anything.
>
> Best regards,
> Krzysztof
