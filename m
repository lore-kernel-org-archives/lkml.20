Received: from mail-pz2-f6.google.com (mail-pz2-f6.google.com [74.125.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D233E5EF1
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791295200; cv=none; b=vDpoLa4uaTdECSs8Eh5Q/IxVV7htXcxPTroWsJGEej0Qg9DAEO/DcyxOacQzjUKOn1wkTDRzrldhULzrdtz1KjhZD6kVkUJ4f/I4CcwliDCfqv08css07sOIfQ4ZhdQn06xdH6lVPkC8L1EMzIFDybnf63YOejMW9y+NSO+q4+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791295200; c=relaxed/simple;
	bh=M82nwgNX76iCRR4cujDnXwZBrtDhYXuYRvUQUXdn+oU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=n+CIM+/au6Cl2y1XKEHfUhQoijJWavdPTyBSLMg72oZmILEWv1YIeSGEZqBSOkUqE/v7NCsgmoGQkIy0LFDPj54ifU7NDOSbbBR91P8phgiGxGlrbWCL0CPV0m5wD4EsuI9p43WQ64aqAd3HiRIEgvEh5EK0lwgEWnoYsOY+Ilc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCuwPDZG; arc=none smtp.client-ip=74.125.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCuwPDZG"
Received: by mail-pz2-f6.google.com with SMTP id 41be03b00d2f7-cc73514ac7dso940395a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791295198; x=1791899998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1lgDiGiDkESTunf7jYG2kAM7tCOtBYTh+K/PRaEYgo0=;
        b=XCuwPDZG+qWeh3/CXDGQc/AATXko01Ffo54hFQm7Q8dbNr3k7IQ7dMokRZU7E6SUWh
         VS73CESmgr3vhmBCeE9FRT7qKikvOTMJLtT4C6rMaTv+y3EMumlTpA973W5CFbUsy8ok
         LshrFhod5wZo710DxGPeKlQtt1dzGMak/yeBH97sgaH6lTcnxqmW7QR5MecOcb0i3j5S
         X0eBQMRjDfEuKDrdTW5G0cYiBpmvYcWZH5SJFXR8wV6V7Xihj0WmH4b81URP8M+GRdo6
         On5XON8DCQZwZANxHgebSGikomXAEOvDbMNs/4r66NwdTJAwUmNC3cQnFuyk4Ag2KFwT
         fPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791295198; x=1791899998;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1lgDiGiDkESTunf7jYG2kAM7tCOtBYTh+K/PRaEYgo0=;
        b=XXEVXJsaKk5IzdcPZ/yPG6Y5qf8eh94T5GD3KRSCIRrykwwhgljWoPO3rjO6OVL9HP
         Adk2B/896Fin2MZpHcazR42CraKj8HG4buWl76VOk8QQD45cfpw5zrGDqe5Yn15GiXrw
         oOAynyMFSXrbKSa0pEOdw+3KDc9e85MqN3e7Za+Qa3gKESGHp2aUICtVzAvzsS7HEuXT
         dBzbW44KGocuWyiim40OlqaBankewxuyn+NP9Ta0zzPN4b7cO8H7bL4727CYSMuBn2BB
         AHsGXrV7bTTCYMqfi60NRjJvUUvm3XcjBL9ETLndmijd9fOzlSE5qNIkZY7cgZck4H3Z
         Wcgw==
X-Forwarded-Encrypted: i=1; AKwUvBx1oMeu27ZKvEstqnnF+jMeV8n5rUxy3R3+j+n8ZsE3vxcUEHoIGWuqLStXG78keAvhhfZ4fFRPB+UL7PA=@vger.kernel.org
X-Gm-Message-State: AFuF++lw8HnUA1U2F0LDABLAdQhq4fF7bHg4hE7KB37SUlGD8XUQhUzn
	Uukq2V98fQtaZD405dq5dZYC1JGFue0+aLl+v3OES1XcbdymnTfB0h2C
X-Gm-Gg: AYBFou1Ac0QrQzQFALlz6TRGfKy+mWhjS31pONnWmdqj3fw1pzo9KoZsEUWQOjcfapY
	/iPB2blq/nlip3vaS1nYd5Is4bKoogyFwedaVYM2US7b0hczlcnorENaMesx2vD6B0Mo+7cTNHE
	LgnytHZT00aWKMYBP0OP/W6GcB5LluFjBcSajnqx0zTtBZL0z5/E2e5Tt0A3vlW98E98HMZgAPJ
	XRrA6sGbnzMyW6XUy3FWgCxHyFbG4K5pl7yPIrymfAFliuFWyqI/YEDEhP9sftckq4T/YNs3YX4
	AKqdwREVtr2uEQSd5P3/mUqaVEeuPChkzoIq4KsEJkrl5V8aQ9bqn0BQjfZMAiRw0/KknOkBSDp
	OvqRZETRrpJxOuxKxqaX2+PLawcTPLMEua/m20tlBdRsInDEP1kV2YJj3shZfOknA0vNZ7zcwso
	HQQSddt0AF9jUECx2aFtZtK04YZEfPs3tcq4joAZc9ZmOIcOarILt4Ov7N8iGoQPxZNC4=
X-Received: by 2002:a05:6a00:3319:b0:882:ace7:88e2 with SMTP id d2e1a72fcca58-890ddffc726mr1294423b3a.12.1791295198063;
        Tue, 06 Oct 2026 06:59:58 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2603:c021:8000:9500:233::14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d04ed92sm5001409b3a.51.2026.10.06.06.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 06:59:57 -0700 (PDT)
Date: Tue, 06 Oct 2026 21:59:49 +0800
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
In-Reply-To: <20261006132428.GA1659963-robh@kernel.org>
References: <20261005223011.1124347-1-coiaprant@gmail.com> <20261005223011.1124347-2-coiaprant@gmail.com> <20261006132428.GA1659963-robh@kernel.org>
Message-ID: <96FA84EA-3C0E-4FAC-963F-2A8165538748@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 6, 2026 9:24:28 PM GMT+08:00, Rob Herring <robh@kernel=2Eorg> wr=
ote:
>On Tue, Oct 06, 2026 at 06:30:03AM +0800, Coia Prant wrote:
>> Add device tree binding documentation for the Synopsys DesignWare
>> XPCS integrated on the Rockchip RK3568 SoC=2E
>>=20
>> The XPCS is accessed over the APB3 bus and internally connected to
>> a Naneng Combo SerDes PHY=2E  It supports 1000BASE-X, SGMII, and
>> QSGMII modes, with four MII ports=2E
>>=20
>> The four MII ports are described as ethernet-pcs-mii@N child nodes,
>> consumed by the Rockchip XPCS glue driver later in this series=2E
>>=20
>> phys and phy-names are required because dtbs_check only validates
>> required properties for enabled nodes=2E The SerDes link is a board-lev=
el
>> design choice (combphy1 on some boards, combphy2 on others), so these
>> properties must be provided by the board device tree, not the SoC dtsi=
=2E
>>=20
>> The CRU reset lines (SRST_XPCS*) are intentionally not described: no
>> in-tree user requests them, and bring-up relies on the PD_PIPE power
>> domain, the SerDes PHY and the in-IP soft reset=2E They can be added
>> later as optional without breaking ABI=2E
>>=20
>> Signed-off-by: Coia Prant <coiaprant@gmail=2Ecom>
>> ---
>>  =2E=2E=2E/net/pcs/rockchip,rk3568-xpcs=2Eyaml         | 110 ++++++++++=
++++++++
>>  1 file changed, 110 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip,=
rk3568-xpcs=2Eyaml
>>=20
>> diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-=
xpcs=2Eyaml b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpc=
s=2Eyaml
>> new file mode 100644
>> index 0000000000000=2E=2E703fcff0e3f70
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs=2E=
yaml
>> @@ -0,0 +1,110 @@
>> +# SPDX-License-Identifier: (GPL-2=2E0-only OR BSD-2-Clause)
>> +%YAML 1=2E2
>> +---
>> +$id: http://devicetree=2Eorg/schemas/net/pcs/rockchip,rk3568-xpcs=2Eya=
ml#
>> +$schema: http://devicetree=2Eorg/meta-schemas/core=2Eyaml#
>> +
>> +title: Rockchip RK3568 Synopsys DesignWare Ethernet PCS
>> +
>> +maintainers:
>> +  - Coia Prant <coiaprant@gmail=2Ecom>
>> +
>> +description: |
>> +  Rockchip RK3568 SoC integrates a Synopsys DesignWare Ethernet Physic=
al
>> +  Coding Sublayer (XPCS)=2E
>> +  The PCS provides an interface between the Media Access Control (MAC)
>> +  and the Physical Medium Attachment (PMA) sublayer through a Media
>> +  Independent Interface (GMII)=2E
>> +
>> +  The XPCS is accessed over the APB3 bus and internally connected to a
>> +  Naneng Combo SerDes PHY=2E
>> +  It supports 1000BASE-X, SGMII and QSGMII modes=2E
>> +
>> +  The block contains four MII ports that can be individually enabled a=
nd
>> +  routed to one of the Ethernet GMAC controllers via the pcs-handle
>> +  property in the MAC device tree node=2E
>> +
>> +properties:
>> +  compatible:
>> +    const: rockchip,rk3568-xpcs
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +  clocks:
>> +    items:
>> +      - description: APB3 bus interface clock (clk_csr_i), required fo=
r register access
>> +      - description: EEE clock (clk_eee_i), required for Energy Effici=
ent Ethernet operation
>> +
>> +  clock-names:
>> +    items:
>> +      - const: csr
>> +      - const: eee
>> +
>> +  phys:
>> +    maxItems: 1
>> +
>> +  phy-names:
>> +    const: serdes
>
>You don't really need phy-names if there is only 1 entry=2E
>
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +patternProperties:
>> +  "^ethernet-pcs-mii@[0-3]$":
>> +    type: object
>> +    description:
>> +      One of the four MII ports of the XPCS=2E The port is linked to a=
n
>> +      Ethernet MAC controller via the pcs-handle property in the MAC's
>> +      device tree node=2E
>> +
>> +    properties:
>> +      reg:
>> +        description: MII port number=2E
>> +        enum: [0, 1, 2, 3]
>> +
>> +    required:
>> +      - reg
>
>Why the child nodes? They don't contain anything=2E
>
>Perhaps that's due to pcs-handle not supporting arg cells to pass the=20
>port number? That's about to change[1]=2E
>
>Rob
>
>[1] https://github=2Ecom/devicetree-org/dt-schema/pull/198

Hi Rob,

Both points make sense=2E

1=2E I'll drop phy-names since there's only a single entry=2E

2=2E For the ethernet-pcs-mii child nodes: you're right that they only
   contain 'reg'=2E The reason I used child nodes is because pcs-handle
   arg cells are not available yet -- PR #198 is still open and in
   RFC/change-request state=2E

   The RZN1 MII converter binding does the same thing: it declares
   MII ports as subnodes and references the PCS via pcs-handle, until
   arg cells land=2E

   So I'd like to keep the child nodes as a temporary workaround, and
   I'll add a note in the binding that this can be simplified once
   PR #198 is merged=2E

Thanks,
Coia
