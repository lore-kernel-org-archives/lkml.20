Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D49284880
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923102; cv=pass; b=b8msGzgoloZKugMGNCbpd27tmOH5aVDaYg8bwGcIlHk5eilWgzInzmau59A+s7dVRQ+svIBaL8E52XBL1mLzX23IWjtoXMZFv6sk/fMnapPz2F3y2uUaWuPph1OdAfl8sukoBlpqzEEeTLuWTKqhXtSnNUua/6ern7S0aW4kuek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923102; c=relaxed/simple;
	bh=yV3JE0Cnos9PoA68Fc4Q90Ws8HM+nw25XLSK+zxbXSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpLhaRz+w7tF/Ohl9bjkTlIkt/i9l+z5jwFaz6u/mO+7gDPYFQoRUNtY6My+u1snhe11WKCfNzEZrqQywGAKDKuVC5Zv95GXE/hhId9a46z4czPRDcFo3xXbcbJQBx3vV3Na922HW5kV3Viuo6gw14ZLU17c0qHGaAlYZzYquP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com; spf=pass smtp.mailfrom=divinehawk.com; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=divinehawk.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c250a2bc3b3so138412366b.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:18:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787923099; cv=none;
        d=google.com; s=arc-20260327;
        b=jWtVzjwPO6znZRXnJsE4i6YAuaxA6kddc3ERfTFVwAibbcTiQ/glIzDDfwtW/YJjHn
         l3T4BTzA9pNE50i2z+kejkelhkPCO9+euLO00DQiOccr4Nxtmnv0c3LF5Yk1Q42E9gwY
         5iV0r5G0xjdGAnuhWc7NNdaF1Rh5QlVu1wAmDQmUYOhybjkVgHBkbEqW+vJqGrVnRb6H
         yXuYvxRblZR2L48yO/eCG5+fAo9ClFWkakiZurKEHqpgpeWsdYdeR/2q3u5Ok1yJYiU1
         ThZsWzGJwPsXfidwRuEC6jG915VL95Hkv0gXco5zFdljTxMT1R780EXJETGvkthwmt23
         0CyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=PFz56wB0GV+0hhESIdSd+taIVyxjjVHt3mnYzY55vbE=;
        fh=BQ+ip2OEnLSzGIV8f1X3iG8jaSozNiu3O0D8dn0hQUU=;
        b=VRt+kFj8B61uu6ifxXCPGIojOe7XBt6+UNjrG9yZpaAemRfjlq07U6Mclg/U6oILja
         x//6EuC2ax5kmaoVo97+4pHHskhrhxPL0VKI90+ZXc1Mnknpe+7taIvKfj/XJCxhNC/U
         rfWnLIZDtGYnObEXjgtOPBZi7z245f1Y3hvHwc4FPryAfDaf83ayClav61CoQIhSF8sc
         9cZFXIccgkWkdAL4fgOB+qxPvp1KYiJVzGXv+2Nd0Dc3uCFCLOQfUTLoMwMxPyClI/7O
         9sLd+NpJE1/TowpxXRzAEg5k5UzPmuo15YoTID9z4pv95NYyco/Dy9hh/3r7rLgVZuBN
         sIXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923099; x=1788527899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PFz56wB0GV+0hhESIdSd+taIVyxjjVHt3mnYzY55vbE=;
        b=EC823+CB59hhovGd8F1WMv+Z98e6xoZTSobb7p7ZvxpKeQ8gGca6gz97n2xF7Wy6aG
         xH4kzBw9EYGtHn/U3lfCRThKl2sXNCC83DRUSNIqjmkCAa7KsTxV00LTABWIVWUbTC5F
         9Ztk6OwbIy+HT5q59xZultmyJxPUvFBMyV4fQpNl6JdLOTGwr638v9Ib8KJmdcAW4uxn
         Lo6Ixxxt9pCf3X6h/rRPlY1ndlCGkV0lmOl/1bl9uwVrxqbVWwjiPzDGn5kGfM7c8cuG
         JCJzEcRE5QFXRNEoYQnf3CWSThKDsgwJXqbyPOzjYPGyQH7C4RjUjIDxzXwHqnPSeSmk
         XK7w==
X-Forwarded-Encrypted: i=1; AHgh+Rppco8NXOt3v1Y1aW693pgE4LxfXwqK4Yg8ydExtBv0sRt44wE32SrQj//nLZnPFGHHShfhj/6pvT8k/JQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lp+eCA2bv3EprtfrMxDmaCBes5hC988Wl5AwQfWytyxsBfZAQq
	bT4I9AzUj6mC/1tSp+4A3wQop44MZybOCQzRXBs/iHeBntzpY/GN3Ecd/3WKyZ1UPnHZJQm6GHF
	M1wMekygvRhG2+wPKEK/wB8xFBVPnRCXziy3+wapA
X-Gm-Gg: AR+sD12p0EgKvwBQQn5SUH4tIZbu87eWHYm6etS3t6UFQAD+CU3gz9HLvCaAMUwvbet
	QLXVW50rOryLodEz1rnvBx2hR8+t24gZ55nQPMzRneeTFFfiTp7dt7AXKRwfG740zMkxiSBBmWr
	ExgeVb+WGcG4DrQOhpcQgrr8gEkSJ7Toti4TCcgGLQE2cgWVgkA04gdJ9aBiAaDeLnh8ZehZ+x/
	mASnvzJ37dAGioRiRyF4Yv2jmE1FXFBitX5mDc6zufrzG9gbPWeSrohGoL3cM2VySWWsyHf2ViH
	OPa5e2FPCdj/bAbG1U2adrFaBOtv8tNv+C6O1QSJfMczUZkRArhkCSQzo7Et3PyhBXqowcCF4By
	8yv4=
X-Received: by 2002:a17:907:1b07:b0:c20:21be:ea75 with SMTP id
 a640c23a62f3a-c2556fe4518mr453938866b.8.1787923098863; Fri, 28 Aug 2026
 06:18:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-xhci-no-soft-retry-v1-0-b9c264b56601@divinehawk.com>
 <20260828-xhci-no-soft-retry-v1-1-b9c264b56601@divinehawk.com> <1aa6d82a-0d35-45a4-9ebd-1c3d8929e611@kernel.org>
In-Reply-To: <1aa6d82a-0d35-45a4-9ebd-1c3d8929e611@kernel.org>
From: Matt Eaton <linux@divinehawk.com>
Date: Fri, 28 Aug 2026 15:18:07 +0200
X-Gm-Features: AcwNN1UdhBXMcVV342l5oAIhvqQEvxYxIlYwCOo4jCJdj3zhDYTey4YdaXTvReg
Message-ID: <CABUBpLfsjscV1-ftUPjKbL4EYq-9NSHYSCGJ_vqStM7k4FtkdA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: xhci: add xhci-no-soft-retry-quirk
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 2:39=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 28/08/2026 14:37, Matt Eaton via B4 Relay wrote:
> > From: Matt Eaton <linux@divinehawk.com>
> >
> > Document the xhci-no-soft-retry-quirk property, added in the
> > following patch.
> >
> > snps,dwc3-common.yaml refs usb-xhci.yaml for every dr_mode other than
> > peripheral, so a host-mode dwc3 node inherits it and dt_binding_check
> > accepts it there.
>
> I do not understand how this sentence is relevant. Please describe the
> hardware needing this.

I came across this while porting the UniFi Travel Router (IPQ4018),
the stock Qualcomm kernel is 4.4.60 which predates the soft retry
code. The command ring hangs if you disconnect the device while it's
transmitting. Reproducible consistently when using USB to tether to a
phone.

> >
> > Signed-off-by: Matt Eaton <linux@divinehawk.com>
> > ---
> >  Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Docu=
mentation/devicetree/bindings/usb/usb-xhci.yaml
> > index 4238ae896ef6..5d67a41658f7 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> > @@ -25,6 +25,10 @@ properties:
> >      description: Set if the controller has broken port disable mechani=
sm
> >      type: boolean
> >
> > +  xhci-no-soft-retry-quirk:
> > +    description: Set if the controller cannot perform xHCI Soft Retry =
correctly
>
> Why isn't this implied by compatible? Looks like controller's property.

The xhci device is created by dwc3 core as a child device, and so
xhci_plat_probe() is used. I think a DT property is the right
approach, similar to quirk-broken-port-ped, but to set
XHCI_NO_SOFT_RETRY.

>
> Best regards,
> Krzysztof

Cheers,
Matt Eaton
