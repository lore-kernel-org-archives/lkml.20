Received: from mail-ej2-f30.google.com (mail-ej2-f30.google.com [74.125.228.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1AE336897
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789846783; cv=none; b=MV35xS6VXlgCgT6nCuTFhYign3hS1I9ZrojFus9yQQS+qmXFqo7D/QV6CYT5h+ahWsFOVSl90bkFB4oIwhWU5xh9kOfN1NELY7GCMrWmnNOrM/nNLHM7k3Em4Q/zIAasMIkE0qBA0m0aJ7Qjq1gmYT78phZJYjrUMcyR/Wt7BKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789846783; c=relaxed/simple;
	bh=bgKv18866W78Mbpx8hOBJOSR0yOtKr7wLjy0DIiX4BE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=DDo7Eq3yBepB1VFeH5tY9OWn87YeXjK918oK8Dzyf2MyB38o9WA7YfKccx0SzHCGxGAzCJg2ZGbeU8cAXSbVZmQr6mHCSO8h5YJWN687apbrGnBd6CljTGufvSsMwoxEKG6Z9fDirXTIhbU4eAmzoQZqGqGupU93P5joU43RVAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conchuod.ie; spf=pass smtp.mailfrom=conchuod.ie; dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie header.b=GhpP+RHx; arc=none smtp.client-ip=74.125.228.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conchuod.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=conchuod.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie header.b="GhpP+RHx"
Received: by mail-ej2-f30.google.com with SMTP id a640c23a62f3a-c2a4fbc5586so40334166b.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google; t=1789846779; x=1790451579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UvnpEG1rIKpCpN2YL8Hpr3qhRaXweKl2EYEkvdr9SeQ=;
        b=GhpP+RHxrfDvPnH7Q6+nkp1L74fMn0WcKR90kyld/hynZPkRFkyX+b6oXeoX48shMy
         DURGnealI7lVo6sdGp1eXgUGNOCTMDiml+/3ZkxuSNPsgKpAcN8CY+6WTtKti40+UUFD
         8yycttPCV9xTxLPWCsWpmHqKM1vx+G5PBVwi5E4+XZiPwZ3yrJLJVOQsNjAf0dd+XPrL
         g1p94VYhCpsAq72rptj5vWtTERpYcxQNkGr71bgkyxA1tyTFqFocfcGXtIZZk07immw1
         un8/41Fkc95BaO4j0B6Mm4pgZwOv85DK1yfKRUCOjy8i0KjhXwDFwJuulHyrSP2dH2yA
         fN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789846779; x=1790451579;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvnpEG1rIKpCpN2YL8Hpr3qhRaXweKl2EYEkvdr9SeQ=;
        b=vjNUT+uZm1TLvOObtmL3jLUYKge1533jnoF9I98B9OyeXJOBjmxHAgmxyX1lS6DsVL
         HLJV/Ut0/6FpNRvfmZUCoL3nVzQ2AWQqq5F6Xyk4N5P4c6ksYJtrlt0ROex4dZdWqmgt
         eIii0Lvw7DfM2UplivIQ5QFEVlcglLfVmNdk6ncRYJIw/krTc6enzCz1wK2+Se4t5GfX
         72T7nNuriuWsjY+QARxpLW9+E2EXaR8k8WgzFl8T6rIeyRvU/Vyg30goXFs/9HeNBlZu
         3Tl/DOB+cfE3ede7eA8tpnufnelZ5UpWs4mfOEwoUtDtScC94lR4aSkUQHfOZTRF0bA5
         Mf7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzSvYoQhWcut1f7qG2AKS7xlBEE9B7vERIMOHJb4aFMH5rTYJq5kaSZXS/iTabQ5iPMgVNe0gl9WbtNpD8=@vger.kernel.org
X-Gm-Message-State: AFuF++nJkXmY2Zg5GNY7vZBXb+Ocv4Ri4eT+xh3NCnBHjUK8UiMgoAYk
	Lz1qGTph7YT4p6a26dw2M3hXnXMW9Bt22IY1C+aM38hFbZEF6ti99kFBMqDzh5KtXCw=
X-Gm-Gg: AYBFou1PA4rQKjXc4X67dr6OQoaypK9ZCo4AZrS7q76BP+x/H5GlpnZVv5Q39psNUvU
	3fb9Y0+PoRNBgiOmczhHtzJLQzt6wxWcEeLSQYKD42ffdx49I7GS8hwes1etDXAU7qlODdOzT33
	GkuIELEcE6Jvhzmqu0gRmI0wV1y6+bA/TlyZt1Uc/3ZneY69uWpoK0p5mSPgsrAWQmo3DZDsNhR
	VqABZgroaItWClxvtP1SB1HLZj/DYr7bxQycvpSEPqTsmVxzQKUmjOHLIxJ3jvGsTG2duMDrGJc
	nBEsMKsPEK+HnZOS8gpaBJKLBkyrGWTICATj28fX4t96FXj7duFv3QaT5m8PgxJ5/Bg2YwJOWjC
	YVTT1VTl19rCnKrXGsJQ/1zLrbJVEzVnMpnb6+JAw8paR27hZ+iU+kNCc5y8cTQxKvJbGi0pd7l
	D+iarsn5yp41p/cp+C683/2pbEvlsn//vjXbQPoSJ5YG76oDiJq2ZChoPpxi6VaAZ4P5+lGLd9+
	n92RKyApL2pYDAMPAWoOG5c7WYOrVXxc14CrEsVcG7kPYwCX84=
X-Received: by 2002:a17:906:9c95:b0:c29:f5d8:9c78 with SMTP id a640c23a62f3a-c2a1583524amr549095166b.39.1789846779319;
        Sat, 19 Sep 2026 12:39:39 -0700 (PDT)
Received: from ehlo.thunderbird.net (ip-077-020-009-205.vkd66.pools.vodafone-ip.de. [77.20.9.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a3588489fsm109005066b.44.2026.09.19.12.39.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 12:39:38 -0700 (PDT)
Date: Sat, 19 Sep 2026 21:39:38 +0200
From: Conor <mail@conchuod.ie>
To: rahul sharma <r-sharma3@ti.com>, Conor Dooley <conor@kernel.org>
CC: peda@lysator.liu.se, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vigneshr@ti.com
Subject: =?US-ASCII?Q?Re=3A_Re=3A_Re=3A_Re=3A_=5BPATCH_1/2=5D_dt-bindings=3A_mux-c?=
 =?US-ASCII?Q?ontroller=3A_ti=3A_add_binding_for_event_mux_router?=
User-Agent: K-9 Mail for Android
In-Reply-To: <1cd03e37-a9bb-4c21-b8f6-557a1fcacc5b@ti.com>
References: <20260828100615.1700223-1-r-sharma3@ti.com> <20260828100615.1700223-2-r-sharma3@ti.com> <20260828-goes-scrawny-a5cf40c9514d@spud> <bacf61ea-91b1-454c-97aa-8c6e4ca07b16@ti.com> <20260915-shredder-liver-219bbc18dd18@spud> <62194a7f-5b7e-419a-8235-9eb46f2f2e7d@ti.com> <8724E360-7B38-48E2-8A5D-9BBAA69EAD06@conchuod.ie> <1cd03e37-a9bb-4c21-b8f6-557a1fcacc5b@ti.com>
Message-ID: <6A724057-E588-4DC7-8499-7B5606C53210@conchuod.ie>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 18 September 2026 20:05:28 GMT+02:00, rahul sharma <r-sharma3@ti=2Ecom>=
 wrote:
>Hi Conor,
>
>On 18/09/26 03:40, Conor wrote:
>> On 17 September 2026 17:=E2=80=8A44:=E2=80=8A21 GMT+02:=E2=80=8A00, rah=
ul sharma <r-sharma3@=E2=80=8Ati=2E=E2=80=8Acom>
>> wrote: >Hi Conor, > >On 15/09/26 19:=E2=80=8A19, Conor Dooley wrote: >>=
 On Tue, Sep 15,
>> 2026 at 06:=E2=80=8A10:=E2=80=8A45PM +0530, rahul sharma wrote: >>> Hi =
Conor,
>>=20
>>=20
>>=20
>> On 17 September 2026 17:44:21 GMT+02:00, rahul sharma <r-sharma3@ti=2Ec=
om> wrote:
>>> Hi Conor,
>>>=20
>>> On 15/09/26 19:19, Conor Dooley wrote:
>>>> On Tue, Sep 15, 2026 at 06:10:45PM +0530, rahul sharma wrote:
>>>>> Hi Conor,
>>>>>=20
>>>>> Thanks for reviewing=2E
>>>>> Apologies for the delay in responding=2E
>>>>>=20
>>>>> On 28/08/26 21:57, Conor Dooley wrote:
>>>>>> On Fri, Aug 28, 2026 at 03:36:14PM +0530, Rahul Sharma wrote:
>>>>>>> Add binding for the event mux router of TI's K3 based SoC AM62L=2E
>>>>>>>=20
>>>>>>> The TI K3 mux routers which route the GPIO input events or Time-Sy=
nc
>>>>>>> events b/w peripherals instead of routing to a CPU=2E
>>>>>>>=20
>>>>>>> Refer Section 10=2E2 and 10=2E2=2E1 of https://www=2Eti=2Ecom/lit/=
pdf/sprujb4=20
>>>>>>> Signed-off-by: Rahul Sharma <r-sharma3@ti=2Ecom>
>>>>>>> ---
>>>>>>>    =2E=2E=2E/mux/ti,am62l-event-mux-router=2Eyaml        | 79 ++++=
+++++++++++++++
>>>>>>>    1 file changed, 79 insertions(+)
>>>>>>>    create mode 100644 Documentation/devicetree/bindings/mux/ti,am6=
2l-event-mux-router=2Eyaml
>>>>>>>=20
>>>>>>> diff --git a/Documentation/devicetree/bindings/mux/ti,am62l-event-=
mux-router=2Eyaml b/Documentation/devicetree/bindings/mux/ti,am62l-event-mu=
x-router=2Eyaml
>>>>>>> new file mode 100644
>>>>>>> index 000000000000=2E=2Ea5ba7f78a156
>>>>>>> --- /dev/null
>>>>>>> +++ b/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-rou=
ter=2Eyaml
>>>>>>> @@ -0,0 +1,79 @@
>>>>>>> +# SPDX-License-Identifier: (GPL-2=2E0-only OR BSD-2-Clause)
>>>>>>> +%YAML 1=2E2
>>>>>>> +---
>>>>>>> +$id: https://urldefense=2Ecom/v3/__http://devicetree=2Eorg/schema=
s/mux/ti,am62l-event-=20
>> mux-router=2Eyaml*__;Iw!!G3vK!VJUh5A8cDCko1ZAGtTQ8V-
>> LL1vTj1BNr5NNBonzfy5GnFCQkP4Oc-0Kkq4xVdCcEA5bQcDckFu6UyA$ <https://urld=
efense=2Ecom/v3/__http://devicetree=2Eorg/schemas/mux/ti,am62l-event-mux-ro=
uter=2Eyaml*__;Iw!!G3vK!VJUh5A8cDCko1ZAGtTQ8V-LL1vTj1BNr5NNBonzfy5GnFCQkP4O=
c-0Kkq4xVdCcEA5bQcDckFu6UyA$>
>>>>>>> +$schema: https://urldefense=2Ecom/v3/__http://devicetree=2Eorg/me=
ta-schemas/core=2Eyaml*__;Iw!!=20
>> G3vK!VJUh5A8cDCko1ZAGtTQ8V-LL1vTj1BNr5NNBonzfy5GnFCQkP4Oc-0Kkq4xVdCcEA5=
bQcDdyRJuLcg$ <https://urldefense=2Ecom/v3/__http://devicetree=2Eorg/meta-s=
chemas/core=2Eyaml*__;Iw!!G3vK!VJUh5A8cDCko1ZAGtTQ8V-LL1vTj1BNr5NNBonzfy5Gn=
FCQkP4Oc-0Kkq4xVdCcEA5bQcDdyRJuLcg$>
>>>>>>> +
>>>>>>> +title: TI Event Multiplexer on K3 SoCs
>>>>>>> +
>>>>>>> +maintainers:
>>>>>>> +  - Rahul Sharma <r-sharma3@ti=2Ecom>
>>>>>>> +
>>>>>>> +description:
>>>>>>> +  The TI K3 mux routers routes the GPIO input events or Time
>>>>>>> +  Sync events between peripherals instead of routing to a CPU=2E
>>>>>>> +
>>>>>>> +allOf:
>>>>>>> +  - $ref: mux-controller=2Eyaml#
>>>>>>> +
>>>>>>> +properties:
>>>>>>> +  compatible:
>>>>>>> +    const: ti,am62l-event-mux-router
>>>>>>> +
>>>>>>> +  reg:
>>>>>>> +    description: Register base address and size=2E
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  '#mux-control-cells':
>>>>>>> +    const: 1
>>>>>>> +    description:
>>>>>>> +      Number of cells in a mux control specifier=2E This should b=
e 1=2E
>>>>>>> +      The cell specifies which mux control to use (0-based index)=
=2E
>>>>>>> +
>>>>>>> +  ti,reg-mask-val:
>>>>>>> +    $ref: /schemas/types=2Eyaml#/definitions/uint32-matrix
>>>>>>> +    items:
>>>>>>> +      items:
>>>>>>> +        - description: Register offset (relative to reg base)
>>>>>>> +        - description: Bit mask for the mux control bits
>>>>>>> +        - description: Value to write when mux is active (state 1=
)
>>>>>>> +    minItems: 1
>>>>>>> +    description: |
>>>>>>> +      Array of triplets specifying register offset, mask, and val=
ue for each
>>>>>>> +      mux control=2E Each triplet contains:
>>>>>>> +      - register offset (relative to reg base)
>>>>>>> +      - bit mask for the mux control bits
>>>>>>> +      - value to write when mux is active (state 1)
>>>>>>=20
>>>>>> You have a device-specific compatible, why do you need this? If the
>>>>>> active setting depends on the device or w/e, why can that not come =
from
>>>>>> a mux-control-cell?
>>>>>=20
>>>>> This is a boot-time/board-fixed routing decision, not a runtime-sele=
ctable
>>>>> mux that any driver ever calls mux_control_select() on=2E
>>>>=20
>>>> 2/3 of this property appears to describe the register layout of the
>>>> device, that's not affected by the board or some boot time decision=
=2E
>>>>=20
>>>=20
>>> You are right about the mask element; I will move the mask into the dr=
iver since it is constant across all entries=2E However, the reg-offset mus=
t remain in the DT, as it is specific to each BCDMA channel's trigger line =
configuration=2E This allows the DT to define the unique routing offsets re=
quired for the hardware=2E
>>=20
>> The reason you cite here for needing reg offset is exactly what using m=
ux-controls from a consumer node provides=2E
>
>I will refactor this to use mux-control-cells=2E I will drop ti,reg-mask-=
val from the bindings and instead source the reg-offset and value from the =
consumer node=2E

To be clear, the reg offset needs to be deduced from the index, it should =
not appear directly in the property=2E

Thanks,
Conor=2E

>
>BR,
>Rahul
>
>>=20
>>>=20
>>>>>=20
>>>>> Please refer below link for the IP block diagram:
>>>>> https://urldefense=2Ecom/v3/__https://github=2Ecom/lucifer-9852/linu=
x/commit/=20
>> aed1746e411a9f0ad7824f4e4a7121e6f56a4ef2__;!!G3vK!VJUh5A8cDCko1ZAGtTQ8V=
-
>> LL1vTj1BNr5NNBonzfy5GnFCQkP4Oc-0Kkq4xVdCcEA5bQcDdDoeFS5w$ <https://urld=
efense=2Ecom/v3/__https://github=2Ecom/lucifer-9852/linux/commit/aed1746e41=
1a9f0ad7824f4e4a7121e6f56a4ef2__;!!G3vK!VJUh5A8cDCko1ZAGtTQ8V-LL1vTj1BNr5NN=
Bonzfy5GnFCQkP4Oc-0Kkq4xVdCcEA5bQcDdDoeFS5w$>
>>>>>=20
>>>>> For detailed view of IP you can refer Section 10=2E2 and 10=2E2=2E1 =
of TRM
>>>>> https://www=2Eti=2Ecom/lit/pdf/sprujb4=20
>>>>> That's precisely why we added ti,reg-mask-val as a controller-side p=
roperty
>>>>> rather than sourcing the value from a consumer's mux-control-cell: t=
here is
>>>>> no runtime consumer selecting between states, so the routing has to =
be fully
>>>>> described on the provider=2E
>>>>=20
>>>> Why do you have #mux-control-cells if there are no consumers? I don't
>>>> understand why the GPIO controller or the device that the interrupt i=
s
>>>> being routed to cannot have a mux-controls property that contains the
>>>> "value to write when the mux is active"=2E
>>>>=20
>>>=20
>>> You are correct regarding #mux-control-cells=2E Since, this driver is =
used for static routing rather than runtime selection by a consumer, that p=
roperty is unnecessary=2E I will remove it=2E
>>=20
>> I still don't understand this argument, if you have a static configurat=
ion just do it the probe of the consumers driver=2E
>> Then you get to use standard properties rather than encode the register=
 map in the binding=2E=2E=2E
>>=20
>>>=20
>>> BR,
>>> Rahul
>>>=20
>>>> Confused,
>>>> Conor=2E
>>>>=20
>>>>>=20
>>>>> BR,
>>>>> Rahul
>>>>>=20
>>>>>>=20
>>>>>>> +
>>>>>>> +  idle-states:
>>>>>>> +    $ref: /schemas/types=2Eyaml#/definitions/uint32-array
>>>>>>=20
>>>>>> This is not needed, you get the type from mux-controller=2Eyaml=2E
>>>>>>=20
>>>>>> pw-bot: changes-requested
>>>>>>=20
>>>>>> Thanks,
>>>>>> Conor=2E
>>>>>>=20
>>>>>>> +    description: |
>>>>>>> +      Idle state for each mux control=2E Each entry corresponds t=
o a mux control:
>>>>>>> +      - 0: clear masked bits when idle, also refers to inactive s=
tate
>>>>>>> +      - 1: set configured value when idle, also refers to active =
state
>>>>>>> +      - MUX_IDLE_AS_IS (-1): keep current state when idle
>>>>>>> +
>>>>>>> +required:
>>>>>>> +  - compatible
>>>>>>> +  - reg
>>>>>>> +  - '#mux-control-cells'
>>>>>>> +  - ti,reg-mask-val
>>>>>>> +  - idle-states
>>>>>>> +
>>>>>>> +additionalProperties: false
>>>>>>> +
>>>>>>> +examples:
>>>>>>> +  - |
>>>>>>> +    #include <dt-bindings/mux/mux=2Eh>
>>>>>>> +
>>>>>>> +    // Example 1: TI AM62L GPIO Mux Router
>>>>>>> +    mux-controller@a00000 {
>>>>>>> +        compatible =3D "ti,am62l-event-mux-router";
>>>>>>> +        reg =3D <0xa00000 0x400>;
>>>>>>> +        #mux-control-cells =3D <1>;
>>>>>>> +
>>>>>>> +        /* Mux Register addresses: 0xa00004 + (J =C3=97 4) */
>>>>>>> +        /* GPIO0_40 -> BCDMA trigger 15 */
>>>>>>> +        ti,reg-mask-val =3D <0x40 0x000ff 0x00028>;
>>>>>>> +        idle-states =3D <0>;
>>>>>>> +    };
>>>>>>> --=20
>>>>>>> 2=2E34=2E1
>>>>>>>=20
>>>>>=20
>>>=20
>>=20
>
