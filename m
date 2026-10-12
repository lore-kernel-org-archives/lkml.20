Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239A01AF0BB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768891; cv=pass; b=B5cSrejiVVDyhXFlGeMUNb7LSUrq9878auLd5Ql+TWli/sx3KYcL235A9dLJyzkEI91aJCc7DWxarsAqA1E/VTdxknTO1ooe0tXxA+MOCk3y4bRll7FRFJk2Gf46UOWXeAKpwK8xHKIE3v82A9O+WwIWCvv2LUeLsp3hn8eIZ0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768891; c=relaxed/simple;
	bh=qyHBCINY8BuIFSHWxGWlHH3StMfbaDeRJF3+IuIneyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m88G3VKEgMIP1gCT+Bo0rlCoZR9eOcjIRkzAGBNijCsH9PhuPqmyrxTHIdDc2u4e1z8pkpUoZgGyz/EfKiQQpSPoLk5tAG0RXn2sVS8zl4l5auSxKwc8+MfvqUpTYWi5vBSgIfVEJbeIj+5Xo2Vgad4pjAJQ6JycNwqxxtBQRrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSkxkcN4; arc=pass smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSkxkcN4"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4b21f71613fso1008532b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:34:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768889; cv=none;
        d=google.com; s=arc-20260327;
        b=s/fWtbfvr1m21BSI/fCOWBFRVtowPAdsLhRNCGOiC30cUL+szB1WMfzKISPbHodZh4
         wEYfC2AAWOiMf1ENdTlZkXl5GZCEiFuPqrTNM3Zs6S05XGRpIDPaYhn4tyt98ITW8ghV
         UdsJqQPoZx7dEMyj2Np9JeTrc/wesys0T0CWiSfLGD/zaBOT66JgwfRU3PX8r+cfRdaV
         zjgWRUA3Bm5COQNL+t2Qo202yFplXVJ6NEdXXz0UNhQeDN8Pg4YsSIHMZi6P78QJDUSY
         WNnBK9J0AsTlHcDmQ/yXJEQj2FBrC1NAQX1xiktw6McfTDTiSh9FrACPn+/LHgDLdiq4
         2flQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yd+VV6HCPCXSlFSdL5xbsRPgSPrExlGh9Pya53tbL44=;
        fh=kT0P2MNzJIA6anwgj8h2+nO/Gt9NsWVqPoXFbA4xquk=;
        b=b7xsn01BaHA9CJ0YMulifBYEuI3dx7lKiDPkxJleivDQaefD/3KIKVOFYXVOuKPNMG
         2dZiTh908qmF7VUd+zHcQrzIjzPgYgkFhPtPUnFLDy2uZ8niCwkxZ3Z7nJIZN03c3d44
         UBLQ9NliHVaOTmVXL402Gir6S34Y797IkrqQh/NAqIOaYrvMHlph6+NMazAPaMXa8Uhj
         C4ZERuMIIRHnDL0gN+9xfLU2/5Qwds+5HPxgkTByz4OYu2yNkFSXMX737DQJiFLdLI5D
         VTod3hHnX9SbRDdSO/hstftchYOLt2P5wvFPNOu0dxwz93oLXSw35Z58SxvFAh90KLcD
         b8Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768889; x=1792373689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yd+VV6HCPCXSlFSdL5xbsRPgSPrExlGh9Pya53tbL44=;
        b=iSkxkcN40y7VOeR4M4t3qOgjIZtp3pA4Qm4B/tT5KUP8gRDo4OF1NcdUvPV9WRBX2c
         Uux1biAMKEk9rgONYwVIxcF9efz8rfGZUHqCWZlnyRoKFfTy081bjeH8cqQelHGBMFwJ
         pMUDBhnHOtZYX5f8YIdUM+zrwJryV8purt5qMIGJLK0YtzUMKVbkd58vE65lFeowPHVK
         jGuyM/BdPaORk3JoeT2niOoZk5sJW5PaTnqCM1GMwbwUyF2BzHPApm+7qNpYfGOSyaro
         lg5IFt2ODRYPbn+nxNoscF06SYssKH3ssLEJSZilNJcaIwiC4Hhlat9Wgm8deW5h9qBt
         kBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768889; x=1792373689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yd+VV6HCPCXSlFSdL5xbsRPgSPrExlGh9Pya53tbL44=;
        b=r9zPzVDSwAFSGnHnsE0Gfp1pcbPNydLvl+QDS08yVjQ9nL1sub5zasY7qsZTPQ2KhT
         WLSnG2TVqQJDUtuIVh/Vwo40X9SQFeRYFEOmdT88uZ5qcNfjN8DZL/d2JczloibzDS3p
         3/yniJiGpc28c4iphOOHXKv+O/CV82nHdlX+phOkoE5jJSi2AttQAp1LeeDKvG9cX2Xt
         4WnfM3l6RiabUyhRSC2MsGKLqXGD9HTvo13Z9CWZ2xvOpiiPRxCXGR+N3a95UVjwu4yC
         8CHN+B9fk0gO9Mus6wocDrArF9KIdrdAFchEe+FhI0NLt3QOXBJnARFtXMFgLEJ7LBCs
         SKrQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4aWuLyDdpJNYXCI+9suY2rPh+SfmG/RP5RHU5QRqFZ8ks7OySpDcUk4h7HWCYOFmojybVeJBJ1pB7zl4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJVLKpRge59gmDjd6fq0RP/ylOoenjv8h0uhGgZcnKF0Vq6DVL
	ubpKQCTrg6qWy364RcmFq4Yc+ftlM0Si4t7efPZ/la8KxSWf++SLDoUmvcV26t1uJS0yMUffO9c
	PgjEll9tayKIIY5kl4Uc+LBahVekWwBA=
X-Gm-Gg: AYBFou3Wqx+4/RoogJYZCWZ8fB6PxMRVhRHENdpk7TCHsnHRSQjHjEAqoBK8Wew7Max
	BAo464uMKubSOIGciV6MlVIBm8/Vpt4RS6B+iNybzGkuTwanFw1+YAyeP1qpMU7PSgLQtlhlJsP
	+ymmuLe4GpxwsJnh4DecYD3M5s+5fHDNCDNX3lLTIWKXc0v+elMPjAy163ANy2tTWPrWdpJW2Aj
	nHjxsJKD46KtJ9/Y+8iBeJi9aH2YywZk2QjUZdZaShlXIjHjyWF7CuhZZxkLID0BeKflWM3aSOn
	04w+H7+Md8DOggR/vmG1fn/t1xwPNxxWY1qfxgRMPifXXwqobRDRtS8=
X-Received: by 2002:a05:6808:1a02:b0:4f3:f7da:3e55 with SMTP id
 5614622812f47-50c56afda4cmr7587631b6e.62.1791768889038; Sun, 11 Oct 2026
 18:34:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001230547.2752114-1-robh@kernel.org>
In-Reply-To: <20261001230547.2752114-1-robh@kernel.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:34:37 -0500
X-Gm-Features: AclHuK_cf01zBbe15tZZMxEgmQJZJDXkL40OgLYY1zsEOSoV-94elMUOv7zsFl0
Message-ID: <CABb+yY0OjXwfv2+S1zxqYKEtZean-=SNLjfUF_yS3cV6E9BfYg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mailbox: Convert hisilicon,hi6220-mbox to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wei Xu <xuwei5@hisilicon.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 6:05=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
> Convert the hisilicon,hi6220-mbox binding to DT schema format. It's a
> straight forward conversion.
>
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../mailbox/hisilicon,hi6220-mailbox.txt      | 74 -------------------
>  .../mailbox/hisilicon,hi6220-mbox.yaml        | 63 ++++++++++++++++
>  2 files changed, 63 insertions(+), 74 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,h=
i6220-mailbox.txt
>  create mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,h=
i6220-mbox.yaml
>
> diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-m=
ailbox.txt b/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mai=
lbox.txt
> deleted file mode 100644
> index de9fbf722bee..000000000000
> --- a/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.=
txt
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -Hisilicon Hi6220 Mailbox Driver
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> -
> -Hisilicon Hi6220 mailbox supports up to 32 channels. Each channel
> -is unidirectional with a maximum message size of 8 words. I/O is
> -performed using register access (there is no DMA) and the cell
> -raises an interrupt when messages are received.
> -
> -Mailbox Device Node:
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Required properties:
> ---------------------
> -- compatible:          Shall be "hisilicon,hi6220-mbox"
> -- reg:                 Contains the mailbox register address range (base
> -                       address and length); the first item is for IPC
> -                       registers, the second item is shared buffer for
> -                       slots.
> -- #mbox-cells:         Common mailbox binding property to identify the n=
umber
> -                       of cells required for the mailbox specifier. Must=
 be 3.
> -                       <&phandle slot_id dst_irq ack_irq>
> -                         phandle: Label name of mailbox controller
> -                         slot_id: Slot id used either for TX or RX
> -                         dst_irq: IRQ identifier index number which used=
 by MCU
> -                         ack_irq: IRQ identifier index number with gener=
ating a
> -                                  TX/RX interrupt to application process=
or,
> -                                  mailbox driver uses it to acknowledge =
interrupt
> -- interrupts:          Contains the interrupt information for the mailbo=
x
> -                       device. The format is dependent on which interrup=
t
> -                       controller the SoCs use.
> -
> -Optional Properties:
> ---------------------
> -- hi6220,mbox-tx-noirq: Property of MCU firmware's feature, so mailbox d=
river
> -                       use this flag to ask MCU to enable "automatic idl=
e
> -                       flag" mode or IRQ generated mode to acknowledge a=
 TX
> -                       completion.
> -
> -Example:
> ---------
> -
> -       mailbox: mailbox@f7510000 {
> -               compatible =3D "hisilicon,hi6220-mbox";
> -               reg =3D <0x0 0xf7510000 0x0 0x1000>, /* IPC_S */
> -                     <0x0 0x06dff800 0x0 0x0800>; /* Mailbox */
> -               interrupt-parent =3D <&gic>;
> -               interrupts =3D <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> -               #mbox-cells =3D <3>;
> -       };
> -
> -
> -Mailbox client
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Required properties:
> ---------------------
> -- compatible:          Many (See the client docs).
> -- mboxes:              Standard property to specify a Mailbox
> -                       Cells must match 'mbox-cells' (See Mailbox Device=
 Node above).
> -
> -Optional Properties:
> ---------------------
> -- mbox-names:          Name given to channels seen in the 'mboxes' prope=
rty.
> -
> -Example:
> ---------
> -
> -       stub_clock: stub_clock {
> -               compatible =3D "hisilicon,hi6220-stub-clk";
> -               hisilicon,hi6220-clk-sram =3D <&sram>;
> -               #clock-cells =3D <1>;
> -               mbox-names =3D "mbox-tx", "mbox-rx";
> -               mboxes =3D <&mailbox 1 0 11>, <&mailbox 0 1 10>;
> -       };
> diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-m=
box.yaml b/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mbox.=
yaml
> new file mode 100644
> index 000000000000..f4c8f1f29baa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mbox.yam=
l
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/hisilicon,hi6220-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Hisilicon Hi6220 Mailbox Controller
> +
> +maintainers:
> +  - Wei Xu <xuwei5@hisilicon.com>
> +
> +description:
> +  Hisilicon Hi6220 mailbox supports up to 32 channels. Each channel is
> +  unidirectional with a maximum message size of 8 words. I/O is performe=
d using
> +  register access (there is no DMA) and the cell raises an interrupt whe=
n
> +  messages are received.
> +
> +properties:
> +  compatible:
> +    const: hisilicon,hi6220-mbox
> +
> +  reg:
> +    items:
> +      - description: IPC registers
> +      - description: Shared buffer for mailbox slots
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#mbox-cells":
> +    const: 3
> +    description: >
> +      The cells content are as follows:
> +        - Slot number
> +        - Remote destination interrupt vector
> +        - Local ack interrupt vector
> +
> +  hi6220,mbox-tx-noirq:
> +    description:
> +      Flag to request MCU to enable automatic idle flag mode instead of =
IRQ for
> +      TX completion.
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    mailbox@f7510000 {
> +        compatible =3D "hisilicon,hi6220-mbox";
> +        reg =3D <0xf7510000 0x1000>,
> +              <0x06dff800 0x0800>;
> +        interrupts =3D <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +        #mbox-cells =3D <3>;
> +    };
> --
> 2.53.0
>
Applied to mailbox/for-next

Thanks
Jassi
