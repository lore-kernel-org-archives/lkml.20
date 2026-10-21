Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792597473;
	b=qbI73qnLKcjXtloRIs+1OnCGZkIrDS/eUnF0R/ugneQ2kx5qS1HPESHdcZeSD6s8Jb6N
	 tP+s7G/Q1Wx7rq4ndsOGz6lr0ul1P6Zzq7jaDK7mdu1CHMdXqqxjMmeH4oZHoKZexGG1s
	 /Z8fbSSf9qDj4b3cn78MdImw4EW83EbND3XiWYQU/aJoiP5frkWkVyZb4mI5pUY7lQ5i9
	 ndu/S9uro/3v8l4bRAK+j4y9xsV9bFTfvbHdKsYISdSnfQWrQ+fBdS+abE1QCv/rOfnW2
	 paS7Eytv7cLU/gjEFtmA5W03Y/TuDYh4HlUb/P6zsInMXemmfvr/oWhx3jt7nacnjpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JP3isnTjkGCFTemUyIlLVxDc+jortqiyhczyp4kIfzM=;
	b=hF7N2HngAkorjXWwsSqs//u6YEyaivu+4T0Cjdb9OUc9mC6kpTjl+WIA4Iz7wQXWbtI7
	 xUfRJVXGSl1pJNg5qA/gkZjT4G+jUQgR8Bvkw9v+UYq1XkmjayEQCT+jTFcRHhkbH7XSO
	 NAFnrl2aDREqkRrxCX1qQtlfW8vX75C5QyLYzOsdOrV+ywweliEz8kVD+WGZOOdainD3s
	 12EiZEp94d+x5xpcy5gpDt9MWDEoveNa6SPjhll/Mi4lPXiWnXAVF34a0mwr/9bsbWIvs
	 yXmnDWkMVJBi2vtaNErLOGR3JYPoHT7jPAOfXkogcjX0uGPq0m6L26Qk0AySSp9gW4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b="fT1Ejq+/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A7460A2625
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8A7460A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=fT1Ejq+/
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso127928666b.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792597471; cv=none;
        d=google.com; s=arc-20260327;
        b=EuUGNUd+vc7LnJLuWrAVozQoeAsrxksjomviwmUveZzGb84zs91G4lE5A/2UpfGhpi
         ZsVYbBxgtpfg4zQYKRpSwo8dwRv1BCgj42fcI0Fb9Rlmks3w5qI+1snMGjkg78dWFM6C
         xtNQjpBN3ms+V/6j2+uN9/2XbvoTYrNFK01N2Z6XWSznMFzQyWtqxbNrovanwVshtTIY
         n3jbR9q7C+VavFC1Rrc5TuKavPqSzo7DLKfLHUWOiaz6vVddJRcjIhoRYH/hig3Oc8Tx
         sml+Ux9LTDkTjbW9v9ShLXlZJKLG3O/1k87nRLxhICXFsrR5kVB4TfDIJGSYcSS8BjCA
         LpGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JP3isnTjkGCFTemUyIlLVxDc+jortqiyhczyp4kIfzM=;
        fh=lNz3oyLUDd66fO8IwjPUvOU0KRxciWXAbWBDiNQeuyI=;
        b=E+gYGKIDTF404WS8YS+dF9yGUWQf+2rrek4X7FcN2dpqM45AmUqRmq1DaXbUbIIFTZ
         KIeS3k6HVT3MW3J0FWHDQGeYqjWga2xare94rCoegTr3HozdWaVR+rWQrAWhhz/SXJ/m
         k5La+TGiODyRfPEfoGRFWLouDLupU9YsQSaJtZN6vAddnqwAm/JgW64AxZAzAIn5jYYp
         7vI3jKObf7P1Ed9x/DVta7/j4VGvxkEs8IWLWYfLA9X1wWIVBBIpNlGGbqh8b5v4H5LC
         VbmYPgZXsh6m3lrKC2zTxGqzMm86ZW3sqHo3w/ETO1RUZE79IqA0lcXLwIrYecojdKkc
         REHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1792597471; x=1793202271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JP3isnTjkGCFTemUyIlLVxDc+jortqiyhczyp4kIfzM=;
        b=fT1Ejq+/L56l79ie+PNmdQbxUE9/wPpsUh5WzFCARRIo7DhXjRMQdSMvNzHnT/eXUK
         U1uG49UybtIek/3tGTHsFnortB7I2Ud3eqM90D/fcwX2ZoNpWpLOYqIySWj5tZGiVmo5
         A8c4weGoCSi9qGxJAFMQK7fltmLgJitKz6b5FZvPv8IhrMLbQUQ3XkwLPLN4X5zIAw7V
         jDdMr7FQo9B1Jxu6a/lEtrZm7yUThf57nza2x9rNdhhjVZ2bCwn+ycLxa1LDU2+7gAwM
         c4w3om4KynnPQ8oVYNL8wqUCw1p0MtaOC4BAZXAZdu98lWHTUOJYF6I9QRNLwZnlW/9S
         b/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597471; x=1793202271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JP3isnTjkGCFTemUyIlLVxDc+jortqiyhczyp4kIfzM=;
        b=NuJyirbr8FyBYMm91nS51tv43w0CC3Iqr5c/+t4MwdJgutIe7piqqcHPbcdGkqUiGl
         pDcafHMgE/rb9KOt9miSrqTAdPcb98o3RcvaDvJvYS4BsXqTovrX3EwDcCkJNWCK3L8v
         8IO+gau9I8rM4xJ7H3eeEPo5plLJIoBsbCeDI9gjKde+c3cAwbY3G95uYeDOUiqfNhjq
         k2hYv5JBz2ItwXVroCemGwWKbvijnaay5rPOnqd/aPuYM6o0zDAwnPJ4cOov5j5nBQfF
         NTrgIV3AWPlrJG/lfcy6ae3QnbGCY+G1c0VLKMLIzIyW3vx+ZltbIrmBV+NlH6/0Rm8N
         BwNg==
X-Forwarded-Encrypted: i=1; AKwUvByxaxCej2yOYABA1TaAnq6SUWUbkKmHtXQQWkL+7rUnUraLx4/Vv5xTP5iC4ZnPCb1givQgkAFufZpLTwY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVrH4Qr3/AvD5I8qPM6p6k8BMeyudhQR7rp2OfPl19qkkWCFhC
	lBdPR6qx5Yr1SVlZr93oNS9Fvikucnu4MZ5FULjIZpk7zMDWa4IZuyq3ujO2Wb9DBLpkS1GfqPb
	lt8k3pdpuoFcwC3DIXr5uNjkWXVTHS5tHwTLX4L5/6Q==
X-Gm-Gg: AYBFou0+ix9mDPvOPeEwdKXehIzSOcALQdUQvHuD09RpESZ2/uAUxajb+j7FHpDNLPw
	MA0vn0PQ7MfFhiH3d8V0XDwrJ8BNXRGJ0I0TOiF+bjin1FLatiDwDRs7i8E8+FEKy2uWkZ3z5up
	C7ZDgwo7ilIECfBGKQWJlkWgW0JDw/HXxVJTQiC6pd6XhOVKuKPL3Fh5nbcgzboQU02QPAFJO7a
	KPj45t7PKIpxJB0IoyskUgHG6pAcFh2RQDggZbXOoa0GOHHkFOoYFJlU07oEY0DNWWCZWvFoBim
	KLUkzk3fMdNtCjZgz7CBbt9zajUUN9/4z6BHj096d9ZMXI5ErrHN5UM7i5gby5DCVIIaqQy3WoP
	tfzpy750Ehr+dkNldzfml2bAEm38sx1OMoAp/jEhjlRb85AmC51mkCF3PTGcDYdz561L9qQ==
X-Received: by 2002:a17:906:4fc8:b0:c2d:ca32:2176 with SMTP id
 a640c23a62f3a-c467961d9f7mr245660266b.8.1792597471151; Wed, 21 Oct 2026
 08:44:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com> <20261021-pcie6_fix-v1-1-ad37134c35a3@oss.qualcomm.com>
In-Reply-To: <20261021-pcie6_fix-v1-1-ad37134c35a3@oss.qualcomm.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 21 Oct 2026 19:44:20 +0400
X-Gm-Features: AclHuK_OzLUc98RwVb-VyZ4la1jnJworigni-GUiOSt1W-ytIr-eQQIArUmgwS4
Message-ID: <CAKTNdwG5XA_chr2ZM9qTnr2RaDMzOjdb85bRdCr4aJCr1EGy7Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: connector: Add PCIe M.2 Mechanical Key B connector
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krishna,

On Wed, Oct 21, 2026 at 5:51=E2=80=AFPM Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> wrote:
>
> Add the devicetree binding for PCIe M.2 Mechanical Key B connector
> defined in the PCI Express M.2 Specification, r4.2, sec 3.2.19.1. This
> connector is used to attach WWAN Adapters to the host machine over
> interfaces such as PCIe, USB3.1 Gen1, SSIC, or USB 2.0, selected by the
> Adapter's configuration pins.
>
> The connector provides a primary power supply of 3.3V/VBAT, along with
> optional GPIO signals for WWAN-specific power/radio control:
> FULL_CARD_POWER_OFF#, RESET#, W_DISABLE1#/2#, WAKE_ON_WWAN#, and DPR.
>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.co=
m>
> ---
>  .../bindings/connector/pcie-m2-b-connector.yaml    | 146 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 147 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-b-connec=
tor.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-b-connector.=
yaml
> new file mode 100644
> index 000000000000..a7f4bcbc5119
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/pcie-m2-b-connector.yam=
l
> @@ -0,0 +1,146 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/connector/pcie-m2-b-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PCIe M.2 Mechanical Key B Connector
> +
> +maintainers:
> +  - Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> +
> +description:
> +  A PCIe M.2 B connector node represents a physical PCIe M.2 Mechanical =
Key B
> +  connector. Mechanical Key B connectors are used to connect WWAN device=
s to
> +  the host machine over interfaces like PCIe, USB3.1 Gen1, SSIC, or USB =
2.0,
> +  selected by the Adapter's configuration pins.
> +
> +properties:
> +  compatible:
> +    const: pcie-m2-b-connector
> +
> +  vpcie3v3-supply:
> +    description: A phandle to the regulator for the 3.3v/VBAT supply.
> +
> +  full-card-power-off-gpios:
> +    description: GPIO output to FULL_CARD_POWER_OFF# signal. This signal=
 is
> +      used by the host system to turn off the entire Adapter. Refer, PCI
> +      Express M.2 Specification r4.0, sec 3.2.13.1 for more details.
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: GPIO output to RESET# signal. This signal is used by th=
e
> +      host system to place the WWAN Adapter into a power-on reset condit=
ion.
> +      Refer, PCI Express M.2 Specification r4.0, sec 3.2.13.2 for more
> +      details.
> +    maxItems: 1
> +
> +  w-disable1-gpios:
> +    description: GPIO output to W_DISABLE1# signal. This signal is used =
by
> +      the host system to disable the WWAN radio on the Adapter. Refer, P=
CI
> +      Express M.2 Specification r4.0, sec 3.1.12.3 for more details.
> +    maxItems: 1
> +
> +  w-disable2-gpios:
> +    description: GPIO output to W_DISABLE2# signal (default function of
> +      GPIO_10). This signal is used by the host system to disable a seco=
nd
> +      radio on the Adapter. Refer, PCI Express M.2 Specification r4.0,
> +      sec 3.1.12.3 for more details.
> +    maxItems: 1
> +
> +  wowwan-gpios:
> +    description: GPIO input to WAKE_ON_WWAN# (WoWWAN#) signal. The Adapt=
er
> +      asserts this signal to wake up the host system. Refer, PCI Express=
 M.2
> +      Specification r4.0, sec 3.2.13.3.6 for more details.
> +    maxItems: 1
> +
> +  dpr-gpios:
> +    description: GPIO output to the Dynamic Power Reduction (DPR) signal=
.
> +      This signal is provided by a host system proximity sensor to the
> +      Adapter to trigger a reduction in the radio transmit output power =
to
> +      meet regulatory SAR requirements. Refer, PCI Express M.2 Specifica=
tion
> +      r4.0, sec 3.2.13.4 for more details.
> +    maxItems: 1

This seems to be missing the four CONFIG_* pins, which are quite
crucial in these connectors, as they define which interfaces the
module asks the host to provide on the respective pins. Without those
module type detection is impossible.

> +  clocks:
> +    description: 32.768 KHz Suspend Clock (SUSCLK) input from the host s=
ystem to
> +      the M.2 card. Refer, PCI Express M.2 Specification r4.0, sec 3.1.1=
2.1 for
> +      more details.
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: OF graph bindings modeling the interfaces exposed on th=
e
> +      connector. Since a single connector can have multiple interfaces, =
every
> +      interface has an assigned OF graph port number as described below.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: PCIe interface for WWAN
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: SSIC interface for WWAN
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: USB 2.0 interface for WWAN
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: USB3.1 Gen1 interface for WWAN
> +
> +    anyOf:
> +      - required:
> +          - port@0
> +      - required:
> +          - port@1
> +      - required:
> +          - port@3

This misses SATA which shares pins with PCIe. PCIe second lane also
conflicts with USB 3.1/SSIC, which isn't captured here. Should it be?

Should the graph also envisage connections for the I2C bus (GNSS),
audio (2 or 4 wire), re-muxing of W_DISABLE2# and WAKE_ON_WWAN# into
HSIC functions in Port Config_3, GNSS interrupt line and the such?
Should the connector node also define pinctrl configurations for each
of the 15 interface configurations?

Best regards,
Alexey
