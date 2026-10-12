Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FDB6FC5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768870; cv=pass; b=TJEH1W3rUYzUtbUou0AEMv47/2lb6OOecBdaTEymJ/66n6o2o5ZiblkiiEBuo9yth+IPWk9WthvFmoGgEG2ihZNAaqF0e2QOCiIOxuxNz5OwYAyBsbyzMlxjYl+uG198WyaAL4xLrLm0UyL68ALLKqzbkeQXclBwH1Jb21bWUsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768870; c=relaxed/simple;
	bh=k2HzGmqyeadeBzQW8i+doTwWk61csXAnKcDwOMAX0GE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BFLSNYk6FCVJ7DcBmB2uF1yu4u9USVGuJdcF57RsfZCesyH3BQpLOpf8vnxcc4ZQZNhMGcVls7IQV+2dCRGSwcjlrS42gIV6VK8PENsr29fpMiR8e5hPol7ZNY8lkIXwvl9pdZHjEOGVUnrYcoQ1Bziz9NmdzU9ihMnX2czXkKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHD4XUFY; arc=pass smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHD4XUFY"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6dcf573c429so939299eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768868; cv=none;
        d=google.com; s=arc-20260327;
        b=qLS/QrFHU66u6rUWvONwqQNvKz3k6nsyYLVp466ppYidXBI1t1NuXwr5LjnY3bVcuh
         OLYsG9G6Q4IRqmAC3nOP9gZq8eK2gMIkFKwGhiTC42rAbS6E/jORzTy3E9OeCA160ZhE
         13VNE8OTmQqo/TkT+v1NtcGXGIFqFzUMjv1kWFUr6FrxORmw/F1fkfZVUIAQu31eojWf
         i6/xLmd3YfPctgG0IdEnpaf2m19FeZQj0eb42fH6r/aitOjyhZzON3T/qnX0+0w+M6H+
         rr/EAh6LWcBF/72XKfV6HGbI4oxZIIGXJv1yVr7Lm63XNhjWgY9grpgptWNp093zX/69
         afkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pDa+xMMOc/P3nrGCK4nQLiDZ2Nmx/iXraUyvbmKuLDc=;
        fh=4anB93v4NSXI2URlTVGpHlj3GL8mWiHt+2d6ZUAZX1k=;
        b=j3oloY1YfAh+5G8noMlgTsAwEW/sPx/7vl7wwKuR4WUH+rCwu8oBjbsEQVnElNQhQB
         9RAeIUqxtlBplSUuLnJGQ7lv7DhsSJHVnjdIbnhbA1wMDSWo1cHi9P8KGB9uXodj+LgS
         L7BvvX06ZoaTTefi/TlEXwfQ4NFe9Yo092z8MHQolu7M9jUS28fmzKYFQKejy6yt48Vm
         Tb65Gg4FiKD10tJgTaRGxDFk0nIte89GrPpKBPiaE7hp7dBqZ8BPcPiM0z6jmJarhkn6
         2upzHuH/mzQ05tTabiYiNp8DLtstzD5NQafH/g1LoUsxwii0ChJFOavyZLy10Q55IzyM
         a3VQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768868; x=1792373668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pDa+xMMOc/P3nrGCK4nQLiDZ2Nmx/iXraUyvbmKuLDc=;
        b=AHD4XUFYDMngRPW7l4ht/3ozFUEfHb26ZlklT+/cWN8VLJuhHWAspgR8tNRt31vRWM
         7s/Kl7Se/2N8mvcB91lA65jMTly1fP/kFY6exRpGjx3u7Jcd3D7AFrO0WIYWsSlcICmu
         fXo+OjVX110rGjuSNaZLqfGJsZpChVSdXoBV+FdMli0vtYbXcgqa8s7j6LL4HZ00pD4z
         zbRQ/zQcjvIDKoB5rStrrbfDxJZNue66iNhWGvT6GmZHqbwPWluzgDYEjfAAyRwGtxzk
         pKR94GGfZjwnmckrtoaD3nfOty0c/zAWZNaEn898veJ4VupHOikhZ+9zDMXKPZ6IRadV
         M2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768868; x=1792373668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pDa+xMMOc/P3nrGCK4nQLiDZ2Nmx/iXraUyvbmKuLDc=;
        b=PPT4KK6ct6CtwVdv6puIjEX0CNPlYkh+9GchxNQ3eQKNXwzZO284OgA47BTOWqzKE6
         z+2sVoVWxhFPDFRA3bv688UeLk3EvFr2ATneBjpcrItK81gmoD/pNcw0mleJzaSV22UL
         lVmpYeyptLttsSOxgMjHkQ+GiAN/zkMB5VrunOaWL3N+NAsYG68LV6fR3nVeO3h8ilw+
         BAwcMu+YhRsC0LlwG3AlfVMEFcq1bGDEBFZGxugcTjli46zU5REc/Thm/oLjiwGJtcpk
         UJf7Ef2oqCwmlMmJKprTA3Piy795EyIrIjQWTda633epCAwWFu9qSeU5jcn7w35hlV0l
         yDVw==
X-Forwarded-Encrypted: i=1; AKwUvBzEWiP8NOVuAPVAVC2mgZE2ukhorg6wkuiqW2AUmn9eEBLfl0igK1dyZXJnE4VsntZhWGyfGJxvAAjNx3o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLp/NrMb8fueSPP9+MwcrTsneMDsbgymy7mFuc+9eee8EXFfCOB
	7lWxfs7qp0qfgW/j6cAi7n76IUzQ2uye91qyew17Dhu3WKy6xEs33wqoVlKTnKua4kpF6VqgFS6
	Gz4nmQ1I1Q8okO+NqD8bXIDl7DkTEiOs=
X-Gm-Gg: AYBFou15fg1icinA2FxVhfZ0cf7lqvZzDxQGnG02QORe4VsgSn6baEoqAGgBou2oSax
	f4zwC5H26CjwaQc3Dy7c2UaoybmyqmAXWEnkH+SKhF4DArNBZ+M+7uY6avs8X40H9Hj/yObj9AJ
	MihloviG3lW2fDah0liMqqMWGEBnwPqvSNY/lzPKhR1dIduWCmkW3gAAI8sB9uVL38smhH//fhm
	yv/SemcLsgn5p3+EY1GCVaDkRCHRmB/ic8n3SgXbFFssgUe7qi1XaEQKLSIjBl9QvhqCeEiUm4Q
	N7qgcLbdqziMfnoWaFoP8MTencROQ4KrT9/LPx/wnJeHLoXAfZhLVXHpLTG7ckrO6Ok=
X-Received: by 2002:a05:6820:8187:b0:6da:4b62:b6b2 with SMTP id
 006d021491bc7-6ef0e6e5a0cmr5570778eaf.40.1791768867820; Sun, 11 Oct 2026
 18:34:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001230538.2751621-1-robh@kernel.org>
In-Reply-To: <20261001230538.2751621-1-robh@kernel.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:34:16 -0500
X-Gm-Features: AclHuK9RPfsi9QYxKe1xshyF9l4fH-kCDWKjWiJN_CiVUkSbujLN4YSrez-akBg
Message-ID: <CABb+yY0WsGARMBkmyG_gbHexw0rYmdaBGEgomkARGF+3xEuSuQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mailbox: Convert hisilicon,hi3660-mbox to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wei Xu <xuwei5@hisilicon.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 6:05=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
> Convert the hisilicon,hi3660-mbox binding to DT schema format. The
> binding and driver give no clue about what the 2 interrupts are, so more
> details can't be added.
>
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../mailbox/hisilicon,hi3660-mailbox.txt      | 51 -----------------
>  .../mailbox/hisilicon,hi3660-mbox.yaml        | 57 +++++++++++++++++++
>  2 files changed, 57 insertions(+), 51 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,h=
i3660-mailbox.txt
>  create mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,h=
i3660-mbox.yaml
>
> diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-m=
ailbox.txt b/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mai=
lbox.txt
> deleted file mode 100644
> index ec2da5c9e647..000000000000
> --- a/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.=
txt
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -Hisilicon Hi3660 Mailbox Controller
> -
> -Hisilicon Hi3660 mailbox controller supports up to 32 channels.  Message=
s
> -are passed between processors, including application & communication
> -processors, MCU, HIFI, etc.  Each channel is unidirectional and accessed
> -by using MMIO registers; it supports maximum to 8 words message.
> -
> -Controller
> -----------
> -
> -Required properties:
> -- compatible:          : Shall be "hisilicon,hi3660-mbox"
> -- reg:                 : Offset and length of the device's register set
> -- #mbox-cells:         : Must be 3
> -                         <&phandle channel dst_irq ack_irq>
> -                           phandle     : Label name of controller
> -                           channel     : Channel number
> -                           dst_irq     : Remote interrupt vector
> -                           ack_irq     : Local interrupt vector
> -
> -- interrupts:          : Contains the two IRQ lines for mailbox.
> -
> -Example:
> -
> -mailbox: mailbox@e896b000 {
> -       compatible =3D "hisilicon,hi3660-mbox";
> -       reg =3D <0x0 0xe896b000 0x0 0x1000>;
> -       interrupts =3D <0x0 0xc0 0x4>,
> -                    <0x0 0xc1 0x4>;
> -       #mbox-cells =3D <3>;
> -};
> -
> -Client
> -------
> -
> -Required properties:
> -- compatible           : See the client docs
> -- mboxes               : Standard property to specify a Mailbox
> -                         Cells must match 'mbox-cells' (See Controller d=
ocs above)
> -
> -Optional properties
> -- mbox-names           : Name given to channels seen in the 'mboxes' pro=
perty.
> -
> -Example:
> -
> -stub_clock: stub_clock@e896b500 {
> -       compatible =3D "hisilicon,hi3660-stub-clk";
> -       reg =3D <0x0 0xe896b500 0x0 0x0100>;
> -       #clock-cells =3D <1>;
> -       mboxes =3D <&mailbox 13 3 0>;
> -};
> diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-m=
box.yaml b/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mbox.=
yaml
> new file mode 100644
> index 000000000000..c42ce576a029
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mbox.yam=
l
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hisilicon,hi3660-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Hisilicon Hi3660 Mailbox Controller
> +
> +maintainers:
> +  - Wei Xu <xuwei5@hisilicon.com>
> +
> +description:
> +  Hisilicon Hi3660 mailbox controller supports up to 32 channels.  Messa=
ges
> +  are passed between processors, including application & communication
> +  processors, MCU, HIFI, etc.  Each channel is unidirectional and access=
ed
> +  by using MMIO registers; it supports maximum to 8 words message.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: hisilicon,hi3660-mbox
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: Mailbox interrupt vectors for message processing
> +    maxItems: 2
> +
> +  '#mbox-cells':
> +    description: >
> +      The cells content are as follows:
> +        - Channel number
> +        - Remote destination interrupt vector
> +        - Local ack interrupt vector
> +    const: 3
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - '#mbox-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    mailbox@e896b000 {
> +        compatible =3D "hisilicon,hi3660-mbox";
> +        reg =3D <0xe896b000 0x1000>;
> +        interrupts =3D <GIC_SPI 0xc0 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 0xc1 IRQ_TYPE_LEVEL_HIGH>;
> +        #mbox-cells =3D <3>;
> +    };
> --
> 2.53.0
>
Applied to mailbox/for-next

Thanks
Jassi
