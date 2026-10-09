Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6732435C69E
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558945; cv=pass; b=qpHXMJ66i0c6ukiV2duQ6WbsmL1jtx7L26Txfe4OM5W0jTku77//XS0+8WbPkOwrL7YqfE9I5gUKavpCVPmDl+pzhLrTZh0d4Ja7XZ5/5y3+1OWlM9IgKLfA5A8QtbSniHwb81mmQ33q9OUPXtFdiR75SSoLc6thncdgPFPxp2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558945; c=relaxed/simple;
	bh=xvA8DTirzMNyhS52A8f+1loxVqPpu9nQXkLXOqerews=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PxByDAGN4gi7EIZsPe0RDFg6+21gytd+amvSf/fPDFqKk9PidQdC4IV8wdBBVMSXGcRPW5RfYp9KLO/JfFhtXkjDlVklT+L3BeSBPteO4ytRghl1nkcVM/bjSO3G7NtqJHzHPCppJw+jNnjQ3iG1yxHxTDoYgpznbWpn7AOtq0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYVvTc1H; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYVvTc1H"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-9199927cb42so23141236d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:15:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791558941; cv=none;
        d=google.com; s=arc-20260327;
        b=VERzdQ4BegrYRykE1jU7/RrH74r48s1brYa74TEFU3Lrq4+yhZdC5hwrRW1/oX7wqp
         Dm3hiTxG4P3JFvASu/ttUGr5vX/JBpgadRIlxEiodnt9yc61+Cw1KpDEltHblNce4NaS
         vNHpkLx80T3orQi/4JUy0kJpB3V/Lk3Xerr1znyqTKQtZFrfJx2sXRNKmVhDIWEREJFu
         7wVeXFhKpa4LmeVu8WtRj+15KEata+cM+lxggOKall/ZL+H8BWVGSCQQ/G59z3I02BLh
         W98tsNiz78LbT9FdrenA9ByfPGVhLbGC1darLSqNwIK1976xEsa+cho8kbl99joHM/aX
         79fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=liSfgm3aLspZBk/EvQTw5ZezUOYb7ES99ZZ1K8Pg3bo=;
        fh=3tTtyorlAxGMfMvbimz0FHcGHnEooLKaBBDggyFmI9Q=;
        b=I/XTyG6NF9/j6yONL/1ohXRSLCO6IGXouYqyLboMhzHBGmbKqrdf/2+CWq3HZR9gGj
         j5m5me6mI9ajWkxfxDUX5M7Qn6HJPm0BYC+O1t1KNay/BUG+cpCIRe8owwKLT3VQ/GLo
         0U/Y1Z2cIBm1Fyy8JVDTsDe3ofS7WbMtWKxyeo++BO7wxqw4bTNvxAI73Pn4DtVJPLDA
         2ujhO8iwooby6oJKm6J93U/ss4HbyqDIUchjUOEQsvNz4K1nEveEnrd9hhaVy/lnO5yc
         cvdklf+WTGCpcgStsAwa+HNoYYgph/56R2n2AVxv6Aim3wAGHZsMkmWX9CIvL/NtJaSa
         j0lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791558941; x=1792163741; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=liSfgm3aLspZBk/EvQTw5ZezUOYb7ES99ZZ1K8Pg3bo=;
        b=gYVvTc1HAv1GJYETcIWnG6sJrHeaO2yVkq/jA5JpDnvcmzCDtIxWtzkhE04kuBJMzw
         oPTITqRxv8L6ZqrGjdtHT2xI4NyMZ/ZS38wh4tZ/KOjrk4EHt8NAYAkhd/3oIkXI88iw
         mXaGKfMTbwj65C6xD6u6z1+udIAwV8woLg898RiqBFPYFyQfsjKoYlZX04LUfEICd3bM
         J5b4/rACNEdwtzlwCIFRJN31REabD/cpzOvcORgxL8w4z1WXArRO5dSC1OLCjUXHXHq0
         SVg8wLFsk4e3k+laNInWMFrl5JVZQU6LUhISMWx3VH28kuS7UIZKyqd5hCJT5KEEQXf7
         Yi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791558941; x=1792163741;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=liSfgm3aLspZBk/EvQTw5ZezUOYb7ES99ZZ1K8Pg3bo=;
        b=SfHmWDeVzwpwQopP/jXJZShmoN+zl4rmvHkCE9QQzdWCJI2acRNEjC2PepPXwXVMY7
         ZU7HXdJMnew3/Zxz1vJOD8nhUtRUdWpTGzShIoemvInmTbAPOtU7TF7+E5NHf+eOeXfB
         WR4I9NoldyERKqmFsjLZdvthacVLWIWGecBWRtBgMagULB7gbwUMuh53UMe1Pp5VyRKN
         WPalLsQdcbOGdF2SIFypFjwrMO2xd7sqIr5okbbEFnaUP4HimnZV0VH1ipK4VOurXWP5
         AP5M0SEsQTaxnyOYqLL3LfvojDxeqr1caZVnbwg+/8fAKG0ygyciJ0yGOYp9e42hw1R8
         jFmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzG/SJw787imXaEE2nBgAXtynp/VPjrZNXm2FBG2nqLe+Re588JDyq3C14yH72J2YXfNUlTlLvkjELhYdI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJe1zcLmtul6O6o/LnTK2SPd8zucD5fWGz8EH8XU7AoToh54dqs
	vJSB1x9XLGXzojSJqzjDjjkdCbDPZDR+bKfMu16p+558OpRqaaTcP5Bob6V46mFoDD2sgq3TLdf
	jW7LTQPhS7cW3U60cVGzZ37Aq8kTr6gw=
X-Gm-Gg: AYBFou0wbkt6/b6+v4WaTK2hV0/K9dJ1jRsaFJ9qLYwZm1D7Jw2PRSu4P64bS9HsF+o
	rT2pbVSe2iSVO3MecXZKv/kS7SWS+D44NxWn2UI7KsR7nZNieiH/8KgTCgpcMbEMVt6L7vW+0XS
	rOCimTy2T+crdIpgeP+3rBDksc1D06Jr2OEvRhjIdVsB/7N8R9P0L3gO4SHZvayD27EhmXP5Bl+
	B4CPyeou7Fru3YSI34Y0LTlKMeSvAyFxHq+LxIn+Ln+gKaf8anKJ6KspGr+RYY0PRh5hy4kisss
	qn4NA1RH4S9BTfI8BCM6nqZEP/yXJBV/AbOZE+srwLVA7d3GMOUU6Pj1fEkA2yaHUnGNjDRWIaD
	h7I5gA3y13ZztIfQfvWoDRa2GQunWb4jleg==
X-Received: by 2002:a05:6214:4e82:b0:91b:5d3a:510a with SMTP id
 6a1803df08f44-91b5d3a56admr20534886d6.56.1791558941026; Fri, 09 Oct 2026
 08:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009073330.18175-1-ansuelsmth@gmail.com> <20261009073330.18175-2-ansuelsmth@gmail.com>
 <20261009-7326174694c52ccce16615b2@squawk>
In-Reply-To: <20261009-7326174694c52ccce16615b2@squawk>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 9 Oct 2026 17:15:27 +0200
X-Gm-Features: AclHuK_TaWQMRaZGsQ3qxEM8_zEYr5bmwxiSK0Zad2EZWuG4HWavWzZ47j3MGaA
Message-ID: <CA+_ehUyP35PF6cm17dzeLcREVFEPv=89Do-s5-hm-T3mKveuKQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: devfreq: Document support for Airoha
 Subsystem Scale
To: Conor Dooley <conor@kernel.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 9 ott 2026 alle ore 17:06 Conor Dooley
<conor@kernel.org> ha scritto:
>
> On Fri, Oct 09, 2026 at 09:33:28AM +0200, Christian Marangi wrote:
> > Airoha SoC contains multiple subsystems that are scaled to a
> > specific OPP taking the CPU clock as reference. Such subsystem
> > can enter idle or performance state based on the system load
> > and power consumption conditions.
> >
> > Example of such subsystems are GSW (Gigabit Switch), NPU (Custom
> > Risc Co-Processor for Network acceleration), SOE (Crypto Module) BUS...
>
> The device you document here does not appear to exist at all, since it
> just consumes a clock without any registers or anything. Why can't these
> operating points be added to the actual consumers: the switch, the npu,
> or event the bus itself in one case. In the bus case, I think that's
> exactly what simple-pm-bus does?
>

Can the consumer be registered as a devfreq with all the other thing?
Isn't that problematic?

Also one big problem is that some subsystem are used internally.
Example SOE and BUS. (and also NPU)

How those can be configured to follow the CPU frequency and
use the required-opp and opp?

> >
> > Document all the required property and provide examples for the various
> > subsystem OPP + subsystem scale nodes.
> >
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../devfreq/airoha,subsystem-scale.yaml       | 114 ++++++++++++++++++
> >  1 file changed, 114 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/devfreq/airoha,subsystem-scale.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/devfreq/airoha,subsystem-scale.yaml b/Documentation/devicetree/bindings/devfreq/airoha,subsystem-scale.yaml
> > new file mode 100644
> > index 000000000000..2cf7f23a926c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/devfreq/airoha,subsystem-scale.yaml
> > @@ -0,0 +1,114 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/devfreq/airoha,subsystem-scale.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha SoC Subsystem Scale Driver
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +description:
> > +  Airoha SoC contains multiple subsystems that are scaled to a
> > +  specific OPP taking the CPU clock as reference. Such subsystem
> > +  can enter idle or performance state based on the system load
> > +  and power consumption conditions.
> > +
> > +  Example of such subsystems are GSW (Gigabit Switch), NPU (Custom
> > +  Risc Co-Processor for Network acceleration), SOE (Crypto Module) BUS...
> > +
> > +properties:
> > +  compatible:
> > +    const: airoha,an7581-subsystem-scale
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  operating-points-v2:
> > +    description:
> > +      OPP table of the related subsystem supported rates that referenced
> > +      clocks will be scaled to.
> > +
> > +required:
> > +  - compatible
> > +  - clocks
> > +  - operating-points-v2
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/en7523-clk.h>
> > +
> > +    npu_opp_table: opp-table-npu {
> > +        compatible = "operating-points-v2";
> > +
> > +        npu_low: opp-400000000 {
> > +           opp-hz = /bits/ 64 <400000000>;
> > +        };
> > +
> > +        npu_high: opp-720000000 {
> > +           opp-hz = /bits/ 64 <720000000>;
> > +        };
> > +    };
> > +
> > +    emi_opp_table: opp-table-emi {
> > +        compatible = "operating-points-v2";
> > +
> > +        emi_low: opp-400000000 {
> > +            opp-hz = /bits/ 64 <400000000>;
> > +        };
> > +
> > +        emi_high: opp-540000000 {
> > +           opp-hz = /bits/ 64 <540000000>;
> > +        };
> > +    };
> > +
> > +    bus_opp_table: opp-table-bus {
> > +        compatible = "operating-points-v2";
> > +
> > +        bus_low: opp-200000000 {
> > +           opp-hz = /bits/ 64 <200000000>;
> > +        };
> > +
> > +        bus_high: opp-300000000 {
> > +           opp-hz = /bits/ 64 <300000000>;
> > +        };
> > +    };
> > +
> > +    gsw_opp_table: opp-table-gsw {
> > +        compatible = "operating-points-v2";
> > +
> > +        gsw_low: opp-200000000 {
> > +            opp-hz = /bits/ 64 <200000000>;
> > +        };
> > +
> > +        gsw_high: opp-500000000 {
> > +           opp-hz = /bits/ 64 <500000000>;
> > +        };
> > +    };
> > +
> > +    npu-subsystem {
> > +        compatible = "airoha,an7581-subsystem-scale";
> > +        operating-points-v2 = <&npu_opp_table>;
> > +        clocks = <&scuclk EN7523_CLK_NPU>;
> > +    };
> > +
> > +    emi-subsystem {
> > +        compatible = "airoha,an7581-subsystem-scale";
> > +        operating-points-v2 = <&emi_opp_table>;
> > +        clocks = <&scuclk EN7523_CLK_EMI>;
> > +    };
> > +
> > +    bus-subsystem {
> > +        compatible = "airoha,an7581-subsystem-scale";
> > +        operating-points-v2 = <&bus_opp_table>;
> > +        clocks = <&scuclk EN7523_CLK_BUS>;
> > +    };
> > +
> > +    gsw-subsystem {
> > +        compatible = "airoha,an7581-subsystem-scale";
> > +        operating-points-v2 = <&gsw_opp_table>;
> > +        clocks = <&scuclk EN7523_CLK_GSW>;
> > +    };
> > --
> > 2.55.0
> >
