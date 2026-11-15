Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794761022;
	b=sPI03stL5zP/paZSQX4OR/SUtnZ4StETiDv2kY8ZL80qtu+1Lvz6CpG232Ex7cM7ENcd
	 NOG4httxjbOoiIJfxEUXTkjtGtBHHjb+c2KsjQ4g5lqU/62HO+hIpzpPky43FanbQd5eo
	 8VLo+0EcaBR1uzDNkxADl3NnDhPVFL2BNd7cfkXTfq6cxS3Jc3/nEjAutqvL4Y2wnemV/
	 CpwdO8K5XWjsQZkHY0qrq0NBbAkxOCFjeccphk/OluM5UIfan3WR4NsPxeuObIaVA2CRp
	 G+gqIpCvBtHYro1Mm9MHFHiHp+zf8C6bZOocX7o/Iu98psmdejjeZgFiKB4wIpUuCog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794761022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eAXXrvsjRFMO0n68EN7RdSjVlW+SNmR/BRQ8PtICMfY=;
	b=kxEzEy7n2MNvw4T/2cPfkCD+97ezuLIv+20u37Rm9W8+VMp/TTIjIQR1SO2APz0pa+Oj
	 vsPX9fsli55KRUOAsPSHIuP9SOaB7uOPTlfAL1C7DvFNRz9X613sC61i/wY8n2qmr6aNS
	 fSz7avdySli3nRSvFuTuz2cutGvKLfZDCY0dvjzTJupAwYkwCQ/q/0erZ2qDB0oNA5zfV
	 zwlTw3QjrenPxne8SKJmY+0vn/VqONaxIe8hUyNLRSoS15W9phuyHD1qizfj3TmNRUkZz
	 JQs4iDmcFPrhjcaiEGhsa7of7nsMGV8UAcSwHmCjSqWFxSSX06c5uostRNRCIRVwjFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="idvliN+/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D20606A881
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22D20606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=idvliN+/
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-54492d8a988so184441cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:43:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794761020; cv=none;
        d=google.com; s=arc-20260327;
        b=D34xOu2fI1uL5t9tHTDzE8/xPb+9DALPSrznltdOX8BjOZSfKnSi0+Cg8/Xmsk6law
         HHCF/vEya/jrXGn2aadH4ZDjfLCqXD8UePWBlX1OEMZgIjt/BIMZjo9dm2f9NbdCpuyT
         2v2JoYyVGPzQIUpLu058QdABlBRsOfDfAjv6kRgeleV88vpfgn8NNOYBx0oMPX7zDySZ
         UE+AKrfAEWneAySN2xjEP8Ani7swUj36HRok6JZ0pPB2Eukz8aZ5YncCG7yhfEVbpxFc
         PAxoG7xHm9wYXm03EVRQZYdxuJLgGDOS1RcQy0h+Ig1jVUME+9oCutaw1Cka2mPZYqOI
         dPYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eAXXrvsjRFMO0n68EN7RdSjVlW+SNmR/BRQ8PtICMfY=;
        fh=e2LUodLIxH3BgZvEtqF6ZPGxczR5D2AAPH8WjPXzkws=;
        b=qe8OrscaDDwthOgW2izIfLppX+YEV7ackuc2vSWF791WEEFeuQhwHyq2M6jPiVfjDg
         Iy7cy5OGbR/au3n8GVwblOelJZlZl/UImvNwzFYrMLhiFYjwLPfkWGIN6379qtKXztra
         Tl+JTtJsesRE3ZkSRftrU+83WxWbm7Bako9/l1VcVjhZ8onYTxc65Ppa8c+0l46PpjCP
         dEJPcLSCQsBlQFZYoIt/s/55WeH8gSZ2inrTJ2YQez21zowl5FaPsj+JbQQzh+U15MEQ
         YjufB7M4/oZbWf4+vFjcC1nQJnZ6hzE9aRBRvLMa+d3hQDnRBvcmiWCbdGe5QKxa3GR0
         M+RQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794761020; x=1795365820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eAXXrvsjRFMO0n68EN7RdSjVlW+SNmR/BRQ8PtICMfY=;
        b=idvliN+/PvmGbeRJsCPli1Y9URCCgOOt9Ys2ZYavWyaS8DgBzjigXYCUKC/iU4AwoU
         VHSr0FwbkvTot8fmdnuI4y1H/mDr3+QNzbM22P+7zzGQNrT+r1T/YNigZqjAJKzwfhnL
         7Y2COlvvnNIad1SDllueZd+28NZ0YGALgfWG/SFZc4XR8SvW2BDFVWeZmqDv6KDQQETA
         ZWzXpm+TXsrfPJ4Rkn+dasO0s52PSVE1x48tBGN4EGkcG3KPe8x7Y89CAADLWUV8s8t+
         6WqxiSd9AlZOonnHp4S8SbOuYlXSHfP7iVPclHzhFAYSCu9m1DyQK6lpmtoqAdSD71d2
         lDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794761020; x=1795365820;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAXXrvsjRFMO0n68EN7RdSjVlW+SNmR/BRQ8PtICMfY=;
        b=AHp6n4zn1NZb0whKyQlP3nwiDpZBnZzJUvOnHaF0NFwNiL7J/hWWfumDevi5TlFLIX
         D1jFqRY5mpYO7DSfpSpE+f6n19lSWrFf3zqqgD9kcpclFqteARA1rukFDvm44ZPVkdhh
         C5P6+6dBM2udIIMVX7evKtNWc7Fmw8pCDMwLxahD4S5vrAGE6RvQjABOnivQqx+xNgvk
         iq+Z2zfukA09b/VYcx0pSTegjaIOlbze7QS58Kez1fKP+OplAsiVMjtWtNdxAo6eK/uK
         xGLW8tv42oR+F3lhuu7thj5Hjous+qNW/KrSSEQC0pP/PhQq+20xZ27UqX2vxsVvgvD8
         pFcQ==
X-Forwarded-Encrypted: i=1; AL+hErEyaVzrdXesbN+eHFlXAaqZSysLVHraoNWU8jzLc5+F5xqyKxtfWdKReqLGDy43Hr+VqNpuZTdklrdLDQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AGLAJHp/andNpJM+aBuOTzqYxiVx7xFD/2/nWtNSfkOJrYkZu
	qQ98PEaxAm39bBAMUsL0vaLH1T3T5ZJjMtQIM169wovakp6MMM2IIWnyQ+srdppn0/urZM0tJEi
	RMRTBEOYid1cimNyrU1dQ1JHckQaXA6mv9ojCoMO2wYo4Tmh6XnI8gGJK17X2TQ==
X-Gm-Gg: AYBFou0Q46j8KF0IyZ/yOPS7zeSZ9b1qCbwyTG2/utatammOPkT6aBIGOhVb6GoaT5C
	k87xN+LdTRE9ZTrM2+ARP2NY9ScgLqipCMbjOg88Ti/59bUwhb9ekv8XNoEsZSmUvTuQayaDYw6
	bgNeGLT9xnXGO3qE0TOy9BA5pks/KBZVekUmi0VtJIdcp0v8Jc6o6sKn4AeUKI8Jz6tBaZlvZ6f
	JvVhI8NRMZXxAYFU0rFh2MATpPfugtxiGIUnsmtf1I43mzun9aK9rEJDRmzExWxQLVvXTuQovZi
	pKPfX3TwfwH5JB+zO4lgIDyK3MhOfkXU2oiqAorW9ScgcGFP1ykgxCxBbxWXSjmv0K8+ziTlTC0
	eSIijEtrTn5czOZF936vq+Xkof2hWcxiexDh1RSqN9PgYR7tKD+30rpEWGHTFlIUUvjSYpj99pc
	ZKla01AuQ4X67DQYNpJP0PR3Am
X-Received: by 2002:a05:622a:230f:b0:55b:ab4a:6fad with SMTP id
 d75a77b69052e-55c67104981mr23175511cf.9.1794761019198; Sun, 15 Nov 2026
 08:43:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103042608.387626-1-vamshigajjela@google.com>
 <20261103042608.387626-3-vamshigajjela@google.com> <20261103-handiwork-replace-25efd6b3d8be@spud>
In-Reply-To: <20261103-handiwork-replace-25efd6b3d8be@spud>
From: VAMSHI GAJJELA <vamshigajjela@google.com>
Date: Sun, 15 Nov 2026 22:13:27 +0530
X-Gm-Features: AclHuK8MvtFT0aS_Uz-6An9GgpSrSIomZQrTNYNRlPO6FZypoZaZtmFLqNrb5IA
Message-ID: <CAMTSyjrYSzb57w9G6a+JVaZzRHBBV6zaW_Br_UcM7C5REWLgVw@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: spmi: Add SmartDV SPMI controller
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 11:47=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Nov 03, 2026 at 09:56:06AM +0530, vamshi gajjela wrote:
> > From: Vamshi Gajjela <vamshigajjela@google.com>
> >
> > Document the device tree bindings for the SmartDV IP Solutions MIPI SPM=
I
> > master controller ("smartdv,spmi").
> >
> > This controller IP is integrated in Google Tensor SoCs starting with th=
e
> > G5 generation (codename: laguna, canonically written as "lga"), so add
> > "google,lga-spmi" with a fallback to "smartdv,spmi".
> >
> > Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
> > ---
> >  .../bindings/spmi/smartdv,spmi.yaml           | 126 ++++++++++++++++++
> >  MAINTAINERS                                   |   6 +
> >  2 files changed, 132 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/spmi/smartdv,spmi=
.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml b=
/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
> > new file mode 100644
> > index 000000000000..e0512e60d932
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
> > @@ -0,0 +1,126 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/spmi/smartdv,spmi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SmartDV IP Solutions SPMI Controller
> > +
> > +maintainers:
> > +  - Vamshi Gajjela <vamshigajjela@google.com>
> > +
> > +description:
> > +  SmartDV IP Solutions MIPI System Power Management Interface (SPMI) m=
aster
> > +  controller supporting MIPI SPMI Specification versions 1.0 and 2.0.
> > +
> > +allOf:
> > +  - $ref: spmi.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: google,lga-spmi
>
> > +          - const: smartdv,spmi
> > +      - const: smartdv,spmi
>
> I hate compatibles for purchasable IP like this, particularly when
> unversioned as they maybe become effectively useless when a new revision
> releases. The standalone smartdv,spmi compatible has to go at least,
> soc-specific compatibles are mandatory.

Agreed. In v2 I will drop "smartdv,spmi" (both standalone and as a
fallback) and use only the SoC-specific "google,lga-spmi" compatible,
renaming the binding to google,lga-spmi.yaml and dropping patch 1/3.

>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description:
> > +      Core clock to the controller from which SPMI SCL is derived. Opt=
ional if
> > +      the controller uses a free-running clock and clock-frequency is =
specified.
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  clock-frequency:
> > +    description:
> > +      Input core clock frequency in Hz when the controller uses a free=
-running
> > +      clock not described in clocks.
> > +
> > +  smartdv,master-arb-enable:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1]
> > +    default: 0
> > +    description:
> > +      Enable master bus arbitration phase (0 =3D disable, 1 =3D enable=
).
>
> What aspect of board design governs the decision here?
> Why can it not be determined from the soc specific compatible?

These parameters do not vary between boards on LGA (this applies
to all smartdv,* properties below). In v2 I will drop all
of them from the binding and move the LGA controller configuration into
of_device_id match data in the driver keyed off "google,lga-spmi"

>
> > +
> > +  smartdv,master-id:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 3
> > +    default: 0
> > +    description:
> > +      Master ID for the controller on the SPMI bus.
>
> What aspect of board design governs the decision here?
> Why can it not be determined from the soc specific compatible?
>
>
> > +
> > +  smartdv,spmi-version:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1]
> > +    default: 0
> > +    description:
> > +      MIPI SPMI specification version used for transfers (0 for MIPI S=
PMI v1.0,
> > +      1 for MIPI SPMI v2.0).
>
> What aspect of board design governs the decision here?
> Why can it not be determined from the soc specific compatible?
>
>
> > +
> > +  smartdv,arb-retry-limit:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 255
> > +    default: 32
> > +    description:
> > +      Maximum number of times the master retries a command when losing=
 bus
> > +      arbitration.
>
> What aspect of board design governs the decision here?
> Why can it not be determined from the soc specific compatible?
>
>
> > +
> > +  smartdv,prescaler:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 255
> > +    default: 0
> > +    description:
> > +      Clock divider value to generate SPMI SCL from the input core clo=
ck. Writing
> > +      1 divides the system clock by 2; more generally, a non-zero valu=
e n
> > +      divides the system clock by 2 * n.
>
> What aspect of board design governs the decision here?
> Why can it not be determined from the soc specific compatible?
>
>
> > +
> > +  smartdv,read-latency:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 255
> > +    default: 32
> > +    description:
> > +      Number of SPMI SCL clock cycles to pause during bus turnaround o=
n read
> > +      commands to allow the target device to fetch data.
>
> What aspect of board design governs the decision here?
> Why can it not be determined from the soc specific compatible?
>
>
> > +
> > +  smartdv,arb-scl-delay:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 3
> > +    default: 0
> > +    description:
> > +      Delay between arbitration and Sequence Start Condition (SSC) whe=
n the
> > +      controller is the Bus Owner Master (BOM).
>
> What aspect of board design governs the decision here?
> Why can it not be determined from the soc specific compatible?
>
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
>
> I find it hard to believe that this is the set of required properties.

Agreed. In v2 I will make clocks and resets required alongside compatible
and reg, and drop the remaining optional properties.

Thanks,
Vamshi Gajjela
