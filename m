Received: from mail-pz2-f2.google.com (mail-pz2-f2.google.com [74.125.228.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF38D49C4C2
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301969; cv=none; b=mKkWb6v2DpJx2dvBREXuum8vFLHjutDq2/jXcLKT+gq0hFsMPVc22nzQwQo2RP43B7xtlByvKUAoXCW8oe2tMsrlfBTFVfTleTJ6wf9kW4H9NP/P9zO0w8zkeDecmfen0kD1YL+n9pnVnIWHPjzvallgUvS1tGIVPHjuaAm13IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301969; c=relaxed/simple;
	bh=aXEIj4YhxFHWSlbikZxZ69RwpFEU6HVG6IcQVjVkR1M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=o0d9gy8Qu+Ovoika170GA1/h+oMroWWw4/hcF1i4/D7gco1IzWT1v64fOouLA8lQS2W6XtsMpmBj5URhtzyfK0Sb67ntJTPOaFHB7I6fXgiRrKQrQsxEH81LCeCSShHEEWKUwRBC1vwbL4ihzC5u9kW6EbnBnXg2zUV3KGHq++Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eo+j0UGs; arc=none smtp.client-ip=74.125.228.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eo+j0UGs"
Received: by mail-pz2-f2.google.com with SMTP id 41be03b00d2f7-ccc451ef3a7so324594a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791301967; x=1791906767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iCfMB+9jyOng6UjHASMF1if+uXMBv5ni2DoESrOf5F0=;
        b=eo+j0UGssVt7bm929+QbdBOAqVo6ZOf1hfVhrn9FrI5m1Zb33XY8+cHw8BUkt6YJ50
         UydZ0F5/ctyGvq2n7CbOUyjYVyEb07+w74+5blCa2s2zBS4nZc/LKbN/se6922eZc1Ng
         ejHdSbQz6Uk2UU1gcPD8M0YIiLnw0lIliIhQFrXXM/fO4OGdAo4tGv1Uf9hoIcMc6Fs5
         ObKzXYOmblOBdba8ZbEcHzn8oe8GIzt2NaCc4y7L8PPv8kZ6+gDF4MFALN6wUyw8Bfqj
         1kPqKb8Q9jp8UD1+OM1M7ktGdPM0GdiOhA+8fjeP6H/wSgQcWoNjJ/7ST23TwvRHQ75C
         oz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301967; x=1791906767;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCfMB+9jyOng6UjHASMF1if+uXMBv5ni2DoESrOf5F0=;
        b=C9O0Tq0GjsyoEUc48Rmq0rUzNV3VWGZNrx6CGI1zHyumY08Su+fIoi3d3Qcl+OMKce
         9aM6rLxOuhnezlDwYTECxQC8ZO7sYaq19a3P+vbJW7MnfEYQW9yEEyodEmyYkCGOYTBw
         fznxPc9XwPCPS0zhnQVyJDaUYJj+oZolos1RdsMhp7H/xjK+PTyOIUi5anUU8seFHW6G
         V5c614EcYfyezJn725SG8WJqm85kZ7uFYZpewVOG5xkmRcsmR5rShaJEN3wk7+lKnXNE
         /7MvpGiFLNZ3AaK+9oyPTfJfRpR53AkZ26HZ5wE7aHTmV4kvTgmoJSLw2/ESLQDwT8/W
         n2DA==
X-Forwarded-Encrypted: i=1; AKwUvBw7W2NBv4I1a6nno3AFz2uBqQKwAO2ibMzOKWmONXGhEyxkX9yjn8I2EYCT9R0t9+uKxw/57Y1+nxlWn7A=@vger.kernel.org
X-Gm-Message-State: AFuF++kMfN5ZOC/UDt7KreJoHv+HUrsQ+am6Iwf25Xj1yEUhzT3PdRjG
	Gy8OTxjR4xfWymWyVp5N0YRxpxUg+VOSPsTKzmXWsdy2YPQ4W6wGcrYl
X-Gm-Gg: AYBFou0rQXYaLtW9emkiDl0LyfLTXXZh42MGgwFHVIbX3np4vbsjOzG1I1M7Kw/HHqo
	DtErK7VeWKSKEo2gW4WpL49frgLCvdICyMlOm/SfwfCfCivprhxp8hO9wr3gqArZs2eixVVkMvU
	bJnz8pQVSa/VKRnIvC8+GzakdzpWVHmDkFJshprfmF+TAlVwysO+sFC2rq5Nda+watvAEY3rihW
	pvC/WqgvTsV3N90N5MTXthhi7QT3T2KbD1I0LWN3xBaeVwKaLze0DQ5xqzfJmY6xEyNAfsibFZt
	3I/v/e0Z7d+zlmKT+o3ncfvuLU6AGtDiKwDb3pVBblNX7irU/iIqfLEX3ReCyXOafSjLUWkNt7r
	xSpHd5+k6SAz0CE/RD7WcQLW7zEL0N0sWSe0UbT1A4iFm/AzfHQY+s9W65IJxZlfM2rzWsazEdU
	oZkNXsFXL3yoU03o1Fnc+W2pV/ZIta+6h/npa9vzRh9oAafRBWw81RjMNazjH9C40/Dn+b13yqK
	8/4s3BM
X-Received: by 2002:a05:6a00:22ca:b0:890:e1ff:3bac with SMTP id d2e1a72fcca58-890e1ff47c8mr1583488b3a.8.1791301967068;
        Tue, 06 Oct 2026 08:52:47 -0700 (PDT)
Received: from ehlo.thunderbird.net ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-891894f6c0asm184007b3a.33.2026.10.06.08.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 08:52:46 -0700 (PDT)
Date: Tue, 06 Oct 2026 23:52:22 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 David Wu <david.wu@rock-chips.com>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_net-next_v10_1/6=5D_dt-bindings=3A_?=
 =?US-ASCII?Q?net=3A_pcs=3A_add_rockchip=2Crk3568-xpcs_support?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20261006150831.GC2194299-robh@kernel.org>
References: <20261005223011.1124347-1-coiaprant@gmail.com> <20261005223011.1124347-2-coiaprant@gmail.com> <20261006132428.GA1659963-robh@kernel.org> <96FA84EA-3C0E-4FAC-963F-2A8165538748@gmail.com> <20261006150831.GC2194299-robh@kernel.org>
Message-ID: <46337722-9C86-4118-8286-A506B455B23D@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 6, 2026 11:08:31 PM GMT+08:00, Rob Herring <robh@kernel=2Eorg> w=
rote:
>On Tue, Oct 06, 2026 at 09:59:49PM +0800, Coia Prant wrote:
>> On October 6, 2026 9:24:28 PM GMT+08:00, Rob Herring <robh@kernel=2Eorg=
> wrote:
>> >On Tue, Oct 06, 2026 at 06:30:03AM +0800, Coia Prant wrote:
>> >> Add device tree binding documentation for the Synopsys DesignWare
>> >> XPCS integrated on the Rockchip RK3568 SoC=2E
>> >>=20
>> >> The XPCS is accessed over the APB3 bus and internally connected to
>> >> a Naneng Combo SerDes PHY=2E  It supports 1000BASE-X, SGMII, and
>> >> QSGMII modes, with four MII ports=2E
>> >>=20
>> >> The four MII ports are described as ethernet-pcs-mii@N child nodes,
>> >> consumed by the Rockchip XPCS glue driver later in this series=2E
>> >>=20
>> >> phys and phy-names are required because dtbs_check only validates
>> >> required properties for enabled nodes=2E The SerDes link is a board-=
level
>> >> design choice (combphy1 on some boards, combphy2 on others), so thes=
e
>> >> properties must be provided by the board device tree, not the SoC dt=
si=2E
>> >>=20
>> >> The CRU reset lines (SRST_XPCS*) are intentionally not described: no
>> >> in-tree user requests them, and bring-up relies on the PD_PIPE power
>> >> domain, the SerDes PHY and the in-IP soft reset=2E They can be added
>> >> later as optional without breaking ABI=2E
>> >>=20
>> >> Signed-off-by: Coia Prant <coiaprant@gmail=2Ecom>
>> >> ---
>> >>  =2E=2E=2E/net/pcs/rockchip,rk3568-xpcs=2Eyaml         | 110 +++++++=
+++++++++++
>> >>  1 file changed, 110 insertions(+)
>> >>  create mode 100644 Documentation/devicetree/bindings/net/pcs/rockch=
ip,rk3568-xpcs=2Eyaml
>> >>=20
>> >> diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip,rk35=
68-xpcs=2Eyaml b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-=
xpcs=2Eyaml
>> >> new file mode 100644
>> >> index 0000000000000=2E=2E703fcff0e3f70
>> >> --- /dev/null
>> >> +++ b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs=
=2Eyaml
>> >> @@ -0,0 +1,110 @@
>> >> +# SPDX-License-Identifier: (GPL-2=2E0-only OR BSD-2-Clause)
>> >> +%YAML 1=2E2
>> >> +---
>> >> +$id: http://devicetree=2Eorg/schemas/net/pcs/rockchip,rk3568-xpcs=
=2Eyaml#
>> >> +$schema: http://devicetree=2Eorg/meta-schemas/core=2Eyaml#
>> >> +
>> >> +title: Rockchip RK3568 Synopsys DesignWare Ethernet PCS
>> >> +
>> >> +maintainers:
>> >> +  - Coia Prant <coiaprant@gmail=2Ecom>
>> >> +
>> >> +description: |
>> >> +  Rockchip RK3568 SoC integrates a Synopsys DesignWare Ethernet Phy=
sical
>> >> +  Coding Sublayer (XPCS)=2E
>> >> +  The PCS provides an interface between the Media Access Control (M=
AC)
>> >> +  and the Physical Medium Attachment (PMA) sublayer through a Media
>> >> +  Independent Interface (GMII)=2E
>> >> +
>> >> +  The XPCS is accessed over the APB3 bus and internally connected t=
o a
>> >> +  Naneng Combo SerDes PHY=2E
>> >> +  It supports 1000BASE-X, SGMII and QSGMII modes=2E
>> >> +
>> >> +  The block contains four MII ports that can be individually enable=
d and
>> >> +  routed to one of the Ethernet GMAC controllers via the pcs-handle
>> >> +  property in the MAC device tree node=2E
>> >> +
>> >> +properties:
>> >> +  compatible:
>> >> +    const: rockchip,rk3568-xpcs
>> >> +
>> >> +  reg:
>> >> +    maxItems: 1
>> >> +
>> >> +  "#address-cells":
>> >> +    const: 1
>> >> +
>> >> +  "#size-cells":
>> >> +    const: 0
>> >> +
>> >> +  clocks:
>> >> +    items:
>> >> +      - description: APB3 bus interface clock (clk_csr_i), required=
 for register access
>> >> +      - description: EEE clock (clk_eee_i), required for Energy Eff=
icient Ethernet operation
>> >> +
>> >> +  clock-names:
>> >> +    items:
>> >> +      - const: csr
>> >> +      - const: eee
>> >> +
>> >> +  phys:
>> >> +    maxItems: 1
>> >> +
>> >> +  phy-names:
>> >> +    const: serdes
>> >
>> >You don't really need phy-names if there is only 1 entry=2E
>> >
>> >> +
>> >> +  power-domains:
>> >> +    maxItems: 1
>> >> +
>> >> +patternProperties:
>> >> +  "^ethernet-pcs-mii@[0-3]$":
>> >> +    type: object
>> >> +    description:
>> >> +      One of the four MII ports of the XPCS=2E The port is linked t=
o an
>> >> +      Ethernet MAC controller via the pcs-handle property in the MA=
C's
>> >> +      device tree node=2E
>> >> +
>> >> +    properties:
>> >> +      reg:
>> >> +        description: MII port number=2E
>> >> +        enum: [0, 1, 2, 3]
>> >> +
>> >> +    required:
>> >> +      - reg
>> >
>> >Why the child nodes? They don't contain anything=2E
>> >
>> >Perhaps that's due to pcs-handle not supporting arg cells to pass the=
=20
>> >port number? That's about to change[1]=2E
>> >
>> >Rob
>> >
>> >[1] https://github=2Ecom/devicetree-org/dt-schema/pull/198
>>=20
>> Hi Rob,
>>=20
>> Both points make sense=2E
>>=20
>> 1=2E I'll drop phy-names since there's only a single entry=2E
>>=20
>> 2=2E For the ethernet-pcs-mii child nodes: you're right that they only
>>    contain 'reg'=2E The reason I used child nodes is because pcs-handle
>>    arg cells are not available yet -- PR #198 is still open and in
>>    RFC/change-request state=2E
>>=20
>>    The RZN1 MII converter binding does the same thing: it declares
>>    MII ports as subnodes and references the PCS via pcs-handle, until
>>    arg cells land=2E
>>=20
>>    So I'd like to keep the child nodes as a temporary workaround, and
>>    I'll add a note in the binding that this can be simplified once
>>    PR #198 is merged=2E
>
>Bindings are an ABI=2E You can't merge the binding then change it=2E Plea=
se=20
>comment on the PR that you all need it=2E
>
>Rob

Hi Rob,

Understood on the ABI point, and I don't want to merge a binding we'd
have to change later=2E

Could I ask for your guidance on the practical path? This series is
ready, and I'd like to get it into 7=2E4 if possible, since OpenWrt and
other distros base their support on LTS kernels=2E Missing this window
means a long wait for users=2E

Given PR #198 is still open, I see these options:

1=2E Wait for PR #198, then use pcs-handle =3D <&xpcs 0>=2E My concern is =
that
   I have no visibility into its timeline -- it could be weeks or much
   longer -- and holding the whole binding on that is hard to plan
   around=2E

2=2E Keep the child nodes as the final ABI, RZ/N1 style, no planned
   migration=2E

3=2E Something else you'd prefer=2E

Which would you recommend? If waiting is the right call, I'll do that,
but I'd like to understand roughly how long PR #198 is expected to take=2E

Thanks,
Coia
