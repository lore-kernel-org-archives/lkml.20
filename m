Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB1044CF59
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683056; cv=none; b=e2FleYJ4Pg9wdqG8QqQqR/jvCrs8U6IYS5LIu9T/OF0IpAQQgdosKS+R7az6P7sIfEdUfrft5i+j3bHeiG6644Be/QkT3mgo/yoFXJVza7tJWzIKV+MjNCi2e9Zd8tpqLJ/M6uLL6fFrIhLIhk42pJaORpkZJRwuJ6dDNouIex4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683056; c=relaxed/simple;
	bh=EIOooAgRXTXYR3nUPe7+qWA3VnGSbF7f3BmKeOhOlR4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=H5EYMPJVR882qGcWnOgnLKNpg2wb+cCxNm4Sri2Y+cVDl0Stak/oadnYnL6gpy5N3ZKQk4ALVJoEj7EZ1OaI00Ixg4Z7DWuIUXiOym3XpGXoz26bHU0Ocs9GgaE/S4IXq1zfjUFtSIGfjvaHiBqfaP0Ti3ix2Ub+xg9t7WwxrsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conchuod.ie; spf=pass smtp.mailfrom=conchuod.ie; dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie header.b=cWqqr2Ze; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conchuod.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=conchuod.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie header.b="cWqqr2Ze"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so19271366b.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google; t=1789683052; x=1790287852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4MdRysMZonNBikWS5TQbdWBsvJt0hCvhc9Psf0kfFPA=;
        b=cWqqr2Zehd91I8SRp8ZWnt8nKP+KdLwI+4gf5UFOGCyS6MpCNkxt8ZhMJhOvv/Ad8D
         Zu72/HiBiA9TpsCS7PwdQaoJke4ffo2PdDVlH20LWroLPhQxy49Z+85584l8rRC7KvSk
         uL9gfDNtlFA4kuoK41Kd9lT1Cvqd9IuP/Vk6GWo1dliV/eG+PAwa+MllWH49DX6FpZJL
         Lh+sjG0bHrAmTUIhjMB0NvDfofF6LKPR2ju1ta/gyKwWYydbW6u4STkQaE0Vr0WDgksx
         DE352RHudZ0ijuhv6oQgG2Y5pPbdRU/Y91qY2l9/8ESAKOmFa+JDwr0GEJfAf8jQeMtv
         kKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683052; x=1790287852;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4MdRysMZonNBikWS5TQbdWBsvJt0hCvhc9Psf0kfFPA=;
        b=ukTE+/HlelTrROmKTtWBV7h0I3eoz7gRGFm495tQEWlmI3G+EzSvD59IR1FLWTnpXD
         nx8Ufo7lXHAotpyi4SxRKH8cR4Bd2yMDL8XowIC5UEETuH94wltg1Z+pPPvz8Fh6i+EK
         VDyA8nJ1cvfXWmCACfsY89GKYBqqz3Z+I9aDgiF85NJM9AudyLtMzOw67Pd2FvpbM3jL
         NhNQQZ4XhfghUBmJS/P/OQdWvP+aH3Z7RN9lrLlhWs2fd43rdAYJBu8AaZ9R4yHH9kuQ
         mGgECPKsRumx8NaMjO9OPiNac/0o13sDKadiE0dc61LlH4onsAsFIjntg8sFYWSv8Ytj
         JCPw==
X-Forwarded-Encrypted: i=1; AKwUvBxNGVgVJTHt3jwBSGbse1V0NLtWxvPRf9X44qfR0lQXolUbNQeHBBB2gWkIXyxj+txzUAu2+EsQWJDKi4Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nx1O/GR38LHjnFrXCl3Q5f1KQxM5ALGw18qVajIiALHVT8Xtnf
	QrfJRhgl9oxYT+PVwbTIvwCc9TbL5hDFNDCU2X/jvc9B9qAQf7ekMC+19n59nfLKei4=
X-Gm-Gg: AYBFou1u7PEBdTrb0T93KN3SqpkfKCTXARw29ythFd1LPnV/c6JlqZlknoT0cHbecrZ
	AIu+Cpm4nlprubC4dk31EJ7jxAGC3XGclchxTs1v9XpxIL8G+2fi9KmLv2+V8cod8d5IiRFuDBY
	74U0Z2kRpwpps8u+jscwIUacQorScrqg8VFiEJZImCSLIhn0Bu6kygYknrFNL5YjHONVUdOHynR
	6PfH5pD76heTkobhdX0rdL6Ukzbl2fFLwdzm7b9RbyxvbMu4hOLGDEfho2JFxYGzxBPdfG5GR1w
	A++EM2jU7rWjCWdV/zlD1T2BWbW+b+vnKi4OaZWF60ZGz2qRzecyHjezYZVz6QjMNr4X8M44uBu
	QzQJOiSPdxI603TkFtR4Di3t0P9crFIjJITh1Kp51soh+R0bBgQE9wr9cVRwwea17jLIFV6mQcz
	Q2zWdEyyV3lC+MNbvWBRXxK64ywcna/E2RdzxlNIHRipVmVnY3q4M+ldfQ2KjIMTddq6+ZUYT+2
	hX78y+swOzhHtbXTZ1+r/K9rPEttMxTT89OGedE1a+RnrfvmrM=
X-Received: by 2002:a17:907:9481:b0:c26:1648:a069 with SMTP id a640c23a62f3a-c2a15e529e2mr50347066b.36.1789683051860;
        Thu, 17 Sep 2026 15:10:51 -0700 (PDT)
Received: from ehlo.thunderbird.net (ip-077-020-009-205.vkd66.pools.vodafone-ip.de. [77.20.9.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de453f04sm349106366b.15.2026.09.17.15.10.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 15:10:51 -0700 (PDT)
Date: Fri, 18 Sep 2026 00:10:48 +0200
From: Conor <mail@conchuod.ie>
To: rahul sharma <r-sharma3@ti.com>, Conor Dooley <conor@kernel.org>
CC: peda@lysator.liu.se, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vigneshr@ti.com
Subject: =?US-ASCII?Q?Re=3A_Re=3A_Re=3A_=5BPATCH_1/2=5D_dt-bindings=3A_mux-con?=
 =?US-ASCII?Q?troller=3A_ti=3A_add_binding_for_event_mux_router?=
User-Agent: K-9 Mail for Android
In-Reply-To: <62194a7f-5b7e-419a-8235-9eb46f2f2e7d@ti.com>
References: <20260828100615.1700223-1-r-sharma3@ti.com> <20260828100615.1700223-2-r-sharma3@ti.com> <20260828-goes-scrawny-a5cf40c9514d@spud> <bacf61ea-91b1-454c-97aa-8c6e4ca07b16@ti.com> <20260915-shredder-liver-219bbc18dd18@spud> <62194a7f-5b7e-419a-8235-9eb46f2f2e7d@ti.com>
Message-ID: <8724E360-7B38-48E2-8A5D-9BBAA69EAD06@conchuod.ie>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 17 September 2026 17:44:21 GMT+02:00, rahul sharma <r-sharma3@ti=2Ecom>=
 wrote:
>Hi Conor,
>
>On 15/09/26 19:19, Conor Dooley wrote:
>> On Tue, Sep 15, 2026 at 06:10:45PM +0530, rahul sharma wrote:
>>> Hi Conor,
>>>=20
>>> Thanks for reviewing=2E
>>> Apologies for the delay in responding=2E
>>>=20
>>> On 28/08/26 21:57, Conor Dooley wrote:
>>>> On Fri, Aug 28, 2026 at 03:36:14PM +0530, Rahul Sharma wrote:
>>>>> Add binding for the event mux router of TI's K3 based SoC AM62L=2E
>>>>>=20
>>>>> The TI K3 mux routers which route the GPIO input events or Time-Sync
>>>>> events b/w peripherals instead of routing to a CPU=2E
>>>>>=20
>>>>> Refer Section 10=2E2 and 10=2E2=2E1 of https://www=2Eti=2Ecom/lit/pd=
f/sprujb4
>>>>>=20
>>>>> Signed-off-by: Rahul Sharma <r-sharma3@ti=2Ecom>
>>>>> ---
>>>>>    =2E=2E=2E/mux/ti,am62l-event-mux-router=2Eyaml        | 79 ++++++=
+++++++++++++
>>>>>    1 file changed, 79 insertions(+)
>>>>>    create mode 100644 Documentation/devicetree/bindings/mux/ti,am62l=
-event-mux-router=2Eyaml
>>>>>=20
>>>>> diff --git a/Documentation/devicetree/bindings/mux/ti,am62l-event-mu=
x-router=2Eyaml b/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-=
router=2Eyaml
>>>>> new file mode 100644
>>>>> index 000000000000=2E=2Ea5ba7f78a156
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-route=
r=2Eyaml
>>>>> @@ -0,0 +1,79 @@
>>>>> +# SPDX-License-Identifier: (GPL-2=2E0-only OR BSD-2-Clause)
>>>>> +%YAML 1=2E2
>>>>> +---
>>>>> +$id: http://devicetree=2Eorg/schemas/mux/ti,am62l-event-mux-router=
=2Eyaml#
>>>>> +$schema: http://devicetree=2Eorg/meta-schemas/core=2Eyaml#
>>>>> +
>>>>> +title: TI Event Multiplexer on K3 SoCs
>>>>> +
>>>>> +maintainers:
>>>>> +  - Rahul Sharma <r-sharma3@ti=2Ecom>
>>>>> +
>>>>> +description:
>>>>> +  The TI K3 mux routers routes the GPIO input events or Time
>>>>> +  Sync events between peripherals instead of routing to a CPU=2E
>>>>> +
>>>>> +allOf:
>>>>> +  - $ref: mux-controller=2Eyaml#
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: ti,am62l-event-mux-router
>>>>> +
>>>>> +  reg:
>>>>> +    description: Register base address and size=2E
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  '#mux-control-cells':
>>>>> +    const: 1
>>>>> +    description:
>>>>> +      Number of cells in a mux control specifier=2E This should be =
1=2E
>>>>> +      The cell specifies which mux control to use (0-based index)=
=2E
>>>>> +
>>>>> +  ti,reg-mask-val:
>>>>> +    $ref: /schemas/types=2Eyaml#/definitions/uint32-matrix
>>>>> +    items:
>>>>> +      items:
>>>>> +        - description: Register offset (relative to reg base)
>>>>> +        - description: Bit mask for the mux control bits
>>>>> +        - description: Value to write when mux is active (state 1)
>>>>> +    minItems: 1
>>>>> +    description: |
>>>>> +      Array of triplets specifying register offset, mask, and value=
 for each
>>>>> +      mux control=2E Each triplet contains:
>>>>> +      - register offset (relative to reg base)
>>>>> +      - bit mask for the mux control bits
>>>>> +      - value to write when mux is active (state 1)
>>>>=20
>>>> You have a device-specific compatible, why do you need this? If the
>>>> active setting depends on the device or w/e, why can that not come fr=
om
>>>> a mux-control-cell?
>>>=20
>>> This is a boot-time/board-fixed routing decision, not a runtime-select=
able
>>> mux that any driver ever calls mux_control_select() on=2E
>>=20
>> 2/3 of this property appears to describe the register layout of the
>> device, that's not affected by the board or some boot time decision=2E
>>=20
>
>You are right about the mask element; I will move the mask into the drive=
r since it is constant across all entries=2E However, the reg-offset must r=
emain in the DT, as it is specific to each BCDMA channel's trigger line con=
figuration=2E This allows the DT to define the unique routing offsets requi=
red for the hardware=2E

The reason you cite here for needing reg offset is exactly what using mux-=
controls from a consumer node provides=2E

>
>>>=20
>>> Please refer below link for the IP block diagram:
>>> https://github=2Ecom/lucifer-9852/linux/commit/aed1746e411a9f0ad7824f4=
e4a7121e6f56a4ef2
>>>=20
>>> For detailed view of IP you can refer Section 10=2E2 and 10=2E2=2E1 of=
 TRM
>>> https://www=2Eti=2Ecom/lit/pdf/sprujb4
>>>=20
>>> That's precisely why we added ti,reg-mask-val as a controller-side pro=
perty
>>> rather than sourcing the value from a consumer's mux-control-cell: the=
re is
>>> no runtime consumer selecting between states, so the routing has to be=
 fully
>>> described on the provider=2E
>>=20
>> Why do you have #mux-control-cells if there are no consumers? I don't
>> understand why the GPIO controller or the device that the interrupt is
>> being routed to cannot have a mux-controls property that contains the
>> "value to write when the mux is active"=2E
>>=20
>
>You are correct regarding #mux-control-cells=2E Since, this driver is use=
d for static routing rather than runtime selection by a consumer, that prop=
erty is unnecessary=2E I will remove it=2E

I still don't understand this argument, if you have a static configuration=
 just do it the probe of the consumers driver=2E
Then you get to use standard properties rather than encode the register ma=
p in the binding=2E=2E=2E

>
>BR,
>Rahul
>
>> Confused,
>> Conor=2E
>>=20
>>>=20
>>> BR,
>>> Rahul
>>>=20
>>>>=20
>>>>> +
>>>>> +  idle-states:
>>>>> +    $ref: /schemas/types=2Eyaml#/definitions/uint32-array
>>>>=20
>>>> This is not needed, you get the type from mux-controller=2Eyaml=2E
>>>>=20
>>>> pw-bot: changes-requested
>>>>=20
>>>> Thanks,
>>>> Conor=2E
>>>>=20
>>>>> +    description: |
>>>>> +      Idle state for each mux control=2E Each entry corresponds to =
a mux control:
>>>>> +      - 0: clear masked bits when idle, also refers to inactive sta=
te
>>>>> +      - 1: set configured value when idle, also refers to active st=
ate
>>>>> +      - MUX_IDLE_AS_IS (-1): keep current state when idle
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +  - '#mux-control-cells'
>>>>> +  - ti,reg-mask-val
>>>>> +  - idle-states
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    #include <dt-bindings/mux/mux=2Eh>
>>>>> +
>>>>> +    // Example 1: TI AM62L GPIO Mux Router
>>>>> +    mux-controller@a00000 {
>>>>> +        compatible =3D "ti,am62l-event-mux-router";
>>>>> +        reg =3D <0xa00000 0x400>;
>>>>> +        #mux-control-cells =3D <1>;
>>>>> +
>>>>> +        /* Mux Register addresses: 0xa00004 + (J =C3=97 4) */
>>>>> +        /* GPIO0_40 -> BCDMA trigger 15 */
>>>>> +        ti,reg-mask-val =3D <0x40 0x000ff 0x00028>;
>>>>> +        idle-states =3D <0>;
>>>>> +    };
>>>>> --=20
>>>>> 2=2E34=2E1
>>>>>=20
>>>=20
>
