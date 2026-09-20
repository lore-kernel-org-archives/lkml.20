Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021103.outbound.protection.outlook.com [52.101.65.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA232DECBA;
	Sun, 20 Sep 2026 19:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789931224; cv=fail; b=O+2rcaTpfKpYbZf2OdNZmthEvULs2KODnChTu2fEp6a8RNBtK6sb+bS5zP+wR/QIPOujwT5/a1KH1W0lpxvAT2Q003KqfmD5WD8yyl28qVSzjNgCcGn2RWXOqG9jyw+DsLo13ikzVsv7MXcB1CqhJ0pWwg7MzzMQVrk1IYxD1Y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789931224; c=relaxed/simple;
	bh=ibtFdCKz9wPo1XgQJ2Kb14gA2QQ9IyXm1A5NO+p29/k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ptfyVv0Eqg+byT/MUu5g/DZr0uJr4nvfVZhdc1LqURaiaEHeYnuzKV6LaoCK6wDVNIY+vIIg/LxHwx0AvqEr8GwscIIr06dB+ydYjT/L4ogkpuePM+F7Fps83tvpDVtdzGj79oIjGO0pDUaNDW3/vVNkcu3AG0IgLiqu9zxrfrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=studio.unibo.it; spf=pass smtp.mailfrom=studio.unibo.it; dkim=pass (2048-bit key) header.d=studio.unibo.it header.i=@studio.unibo.it header.b=fZTyKDxX; arc=fail smtp.client-ip=52.101.65.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=studio.unibo.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=studio.unibo.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=studio.unibo.it header.i=@studio.unibo.it header.b="fZTyKDxX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AA0Y9WaLhPIgtB9g6GlIRDYGnc4JrwpCkKV3VflT3f46yNrjHDGqXtCnrxGwiPLUZiEf+SIRg+w6/wI8VRnYhTQXH41PxdEBhMLNMOVW2S1uXD8V4Y3PDZuGr1p4YlxJPzytV9HCMAynKjGDpox5w6BTw3hum4f4/Tn2JWuU2fJsyY2GL7D1pcJ8zvIjTKOST179AUvrDQA5LjWiw9Ly0rC3lAnWuoVnBsBl757+SqIsZUy/sy9ciqoGph5TIvHkMTYEDg/wno3xzyOsMurBW5YzXHE9OAPHFWza7L/GDOrOuyMrGa1AkpBcNBl+5FeogCAafvSC6Ff2VD/nZPFaGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fj1rc6hj1yB9nURDa8P+f0wP+mrIkBOaUm+KwM1/8WU=;
 b=PsyFcEcDTzdvNbpxxdA98WlArZsIhBXiaEwDvtLcRi81bSXTxbIQgVmArq+lO9hYUUN2Z499KLFSm11BTShyX/RwilTCzHMTC/j8yeWw32M1VQFy6QP+uLF6jno52grOpFv16IdnlE41VTPg5SGgeopgNxaTtNZdNSlx8hVpmfQWw86ijmbvUTsTc8kmu1g4EGlc1YxLFtMmYQLKViq/jqILB+1jtc7c004gpKjqbp/o/T7M1YRFxYXTYQ5Ae1D1oFZXsPqbK9zPkLGOeHMxFUIozSz4zyXaHVAK0bOvbqQd1YXL8Vd9t/51qxOS0ZMSIif+rHeKgf3b5zWfLETL+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=studio.unibo.it; dmarc=pass action=none
 header.from=studio.unibo.it; dkim=pass header.d=studio.unibo.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=studio.unibo.it;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fj1rc6hj1yB9nURDa8P+f0wP+mrIkBOaUm+KwM1/8WU=;
 b=fZTyKDxXNa7UKoPpynNRm3ztyA+fqb8a1Lpr4IxfNSjY5OQYPW2CKDF7sMVdvziO3lywcCu9n6y6M682/gtroqgCOVtWOPokz5EBieZ4ZLdKUdAHZ1VHBmKMIHDtgkF2oA6ly0v6DAr3+m5cz99MZcmB1LWERncZFHB1rUpatS434O06L8bvuwaeWGIhUHoDXar+douruJhnDjtCB2CcI4QTJ85DO5IO4RVw67b0HzC5a90plZCuvPV6ZaP2b5Lo4VFDPPLkH/Y4+nlSUHOS8Ho9vVkH74rq6dK6yVY1Pgu+1VJ44xYKzLLTfDh9XGM5Tzi5LWYysUc4Qg9EyAiolg==
Received: from DU4PR01MB12163.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:620::18) by PA4PR01MB7183.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:f6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 19:06:56 +0000
Received: from DU4PR01MB12163.eurprd01.prod.exchangelabs.com
 ([fe80::bffd:753f:fbcc:c402]) by
 DU4PR01MB12163.eurprd01.prod.exchangelabs.com ([fe80::bffd:753f:fbcc:c402%6])
 with mapi id 15.21.0428.015; Sun, 20 Sep 2026 19:06:56 +0000
From: =?iso-8859-1?Q?Nicol=F2_Giuliani_-_nicolo=2Egiuliani6=40studio=2Eunibo=2E?=
 =?iso-8859-1?Q?it?= <nicolo.giuliani6@studio.unibo.it>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Gregory
 Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: R: [PATCH 2/3] dt-bindings: arm: marvell: Add Sophos XGS 107w NPU
Thread-Topic: [PATCH 2/3] dt-bindings: arm: marvell: Add Sophos XGS 107w NPU
Thread-Index: AQHdSG9GxBQZQG/Yuky0HTy90utOuLbXyoGAgAAK4vo=
Date: Sun, 20 Sep 2026 19:06:56 +0000
Message-ID:
 <DU4PR01MB121639BFF1C58DF21347613CC80852@DU4PR01MB12163.eurprd01.prod.exchangelabs.com>
References: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
 <20260919-send-dt-v1-2-365615a74ef3@studio.unibo.it>
 <20260920-therapeutic-wapiti-of-novelty-76abfc@quoll>
In-Reply-To: <20260920-therapeutic-wapiti-of-novelty-76abfc@quoll>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=studio.unibo.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU4PR01MB12163:EE_|PA4PR01MB7183:EE_
x-ms-office365-filtering-correlation-id: 417331ff-0a4b-4222-c18a-08df174a572b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|786006|7416014|376014|23010399003|10067099003|11063799006|22082099003|18002099003|56012099006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 QZd4YI3T0nBBgwUzlNffdDeoVvCUbdzgvgYII35T3E/nDf1pc3lfbGDXk7xyRgcHH9NYfAhEmb5ar/DMNNJZ9GuCBKcwErnMsBNCEgJ0nJYe4KYCP/ghPbkT3YoYHBlUeGDAnDn5s7ERsKwpgyA6UzbZO+5fOvOC3ibf9VCI3QdK9zGnERLMTDk8AcK636/U+Ub+VVVu0TByl3lUDuggjAsrS5v0bxwfxcTHbeCDVi6gLEw3mONHzmH1ea40VzSg0WwLrLixZmOnnqQ8yoeufi4OF5ZFGDnzb+MiatIR5EUcLQyqoBSUaCUAtJuZfX5sRi11kzzBkVKYZ0hcGWozRsCkK6B+aQdex4YX+ryh9E0a5QB82gvtMCL+6uY7eG/K+o0jX/BobwrTf3SAoa/6BDkLfwRmbg9uhgIQqjxdpmX0McpDNPjAZYR/qRZGrZ0Wl+M6tRRU0kU2TQ7+2SOYLmgibtM83JIEP5KB/YLMOQQZqVlotD57GzajqiObqYsfhPtaxMEwSA/Sb6yKuwiaGPblcfXxbPWKi7BYLRUeMq43dKbOty+JxxehfgiIr19br9JycT/Bw4NTWpDFpBgegQwMImN6bpuaTv13CkS3Ll+TePM8mVYLiuSGEpm5yRtuueixwxSpUBRdvN36RPVz96qqnExbwuLWHjRWDQGNKkRubStqwMY3ZcG/0gv27GruoTy+JyauFZDlgvQ1/TVpGmarTUs9bIVHqd/rbVBqTjc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR01MB12163.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(786006)(7416014)(376014)(23010399003)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?X959c757UDcLvR4g1Hu7Nh1uN/ApGITV+CRnijgwwewYoRUEYyDdrigD+b?=
 =?iso-8859-1?Q?gsrz+gDaTdhgpP3lqAGinS0agVF1mko/ug0JzOKiV5gdi03kf6v5WQGmzz?=
 =?iso-8859-1?Q?MAmGsWEgOFXdtjR8+0byvOea1x/kZkNlUgFpIFwUd+OYBrCYtKMVGH0BP5?=
 =?iso-8859-1?Q?sFshvRlKm3bgp4eObpgGy9swh84tLdS/wsdkrIj/5y1Uvj2beHA3JZ2ftS?=
 =?iso-8859-1?Q?mNju3N5UUiRKVbunddJyOS0ZnsXkiKhdNyCXHUxnvCIceZ3ETFUM1Eq4t0?=
 =?iso-8859-1?Q?UNFN7JaATfd0uXHhmL0E58UPN7/Alt9HVmK4XCpL+JFmU9WdKOC7SANYrD?=
 =?iso-8859-1?Q?Xiu6tvJDFuhY/8wCexBe/B08SRnLVfuskRIe2KRTp9UpcXhgfmt323ol0H?=
 =?iso-8859-1?Q?Di/NNH04ddIwoKlDq2GwVlUJfw+y5PD1x3vaamuAcV09PItmQPnGpI+vx4?=
 =?iso-8859-1?Q?1Hl7f/2eqH1hGQuzFPc5QjF5I9NDMHFdFrIduvHcwlqyKewM6qeC0xD8iq?=
 =?iso-8859-1?Q?C3WRiWFGDFO69iT7YJtRI6ji+XEqaxZeIt5GTdtav5fsp9KnoM4BiqYFJ1?=
 =?iso-8859-1?Q?LqFwDA5afwblhTqPyHN9XcdFbuan906vGhxvHVhS9q4Z3b1nV6v/kxn10f?=
 =?iso-8859-1?Q?zV0rYKEDHTSvi8rraIncfyY7A+GejGZzjaA6d58x8c0Px6X/c69DVRdIWN?=
 =?iso-8859-1?Q?WfXz3LVnryV3vQ2WiFMei8oUXW8HcF2/GUAU7ZCOVAmRVE436WGFFaIMVe?=
 =?iso-8859-1?Q?w9fk0UER3cRASdRXS18WUSzXAXE4pDnzl6zkxJ8+FLSmrw3RDnm5t10C5q?=
 =?iso-8859-1?Q?Fi7SiocOfMHTDkowLFK+ZOadj7BKrb7i/GCL5j8SseFL8P0kZs0X1BHka6?=
 =?iso-8859-1?Q?n5/7zpjrpDPBn1oWgfhaWN82t4CIrrSjCq8vYJfm7KDaOHJFxTm9GrOQBr?=
 =?iso-8859-1?Q?HKvcBmVt+MC8JaDmY1vbVSS8L7DpPQANK0ZPX6B77o3svlsoe8BWLh9yWr?=
 =?iso-8859-1?Q?IIzqPUOGEEv7/OvHtdbtunrPrRLjodKBCo1FHhY4davmt/1Ggvjfq9QAms?=
 =?iso-8859-1?Q?OeX1ZWjtrS8eg/twUOB8oipy2OYWH1Bl0ggzlVMvoIjt/80MnYlQr3Ds4K?=
 =?iso-8859-1?Q?5/bhPBzX+9wkAirj3pw1gwwMecO1OQHzkzBKa7Dmbl8uYLAZyfqNzUJDLi?=
 =?iso-8859-1?Q?C94Bc7Fpb1rBVXYq4n+0wt/UADhqVJypTx9+c0thoeggRM7W43dOk5NyHi?=
 =?iso-8859-1?Q?XU8xIa96zyUfHMpxLaW43g1KdmbA7u3AZQqdCIIggM4fFU8FdIg3Vs1swq?=
 =?iso-8859-1?Q?pQey0JizEbeBcfDfw1R/yYK2DmHW0s6siacIITgZUfbeLTxanARNnJQatU?=
 =?iso-8859-1?Q?zch2EtyJkr8g/CrdR/NLOgKEQ+6We/8FTxI+va69PNIj9ienipZyx7Ak9+?=
 =?iso-8859-1?Q?6O6Pcs9n6Tm717o01WSCo6QxXZAmnQ0ZZuy68ofQqoTYzAr7jWSwCqCicN?=
 =?iso-8859-1?Q?QGY2bjgI+RGU5ODyUiXnv4DdLfFPsX56EKSzEOf3H62Mlggw1XM4QSP48+?=
 =?iso-8859-1?Q?+juWavxDP3z0DrjonhIE1n8mLschni5YRrwb0uc/kGtthASludetyoinmH?=
 =?iso-8859-1?Q?avqX942NInkEYNBVAxRsFo0cmcsq9tajrbpYTpINVpmPF19Y05YS1ae1L0?=
 =?iso-8859-1?Q?1zH56ZDshYYoocJpqo+sHt1jTbWp7Jv6ZarKNl+VJEMBgO4SbU+bfTtvwj?=
 =?iso-8859-1?Q?hFhSBLUsHVZWFVQDR3l/iF0yulQLqLByrhf9mHsR0oQiBfd2cs1sBjGNbb?=
 =?iso-8859-1?Q?1iIETEgypDNRT9AEOItT1MhcBxyOx0I=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: studio.unibo.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU4PR01MB12163.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 417331ff-0a4b-4222-c18a-08df174a572b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2026 19:06:56.6911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e99647dc-1b08-454a-bf8c-699181b389ab
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0i6nfway5YYNlB1FP651U7wjRQHZNYb5BgTQ/hVp/nCB+VEg1EFB0dOUvuPEvZyCIptM9nIoEVdMiG1Xfs61PQ8Co1H/seFWULgEz93qlBcMAg8o0A+yKENHnSnQkpaf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR01MB7183


Hi Krzysztof,

Thanks for the review.

> Looks like you add to the end of the file, not in correct spot.

In v2 the entry is next to the other CN9130 board entries, before the Solid=
Run ones, instead of at the end of the list.

> Why is cn9130 used once as final compatible and once as not?

I understood this as the difference between my entry (marvell,cn9130 follow=
ed by the AP807 compatibles) and the SolidRun CN9130 boards above it (marve=
ll,cn9130 last). In v2 the entry and the device tree both use "sophos,xgs10=
7w-npu", "marvell,cn9130", like the SolidRun boards, so cn9130 is always th=
e last compatible. If you meant something else, please tell me before I sen=
d v2.

I will send v2 as a new thread after the 24 hours have passed, with your Ac=
ked-by on patch 1.

Thanks,
Nicolo Giuliani

________________________________________
Da: Krzysztof Kozlowski <krzk@kernel.org>
Inviato: domenica 20 settembre 2026 20:27
A: Nicol=F2 Giuliani - nicolo.giuliani6@studio.unibo.it
Cc: Rob Herring; Krzysztof Kozlowski; Conor Dooley; Andrew Lunn; Gregory Cl=
ement; Sebastian Hesselbarth; devicetree@vger.kernel.org; linux-kernel@vger=
.kernel.org; linux-arm-kernel@lists.infradead.org
Oggetto: Re: [PATCH 2/3] dt-bindings: arm: marvell: Add Sophos XGS 107w NPU

On Sat, Sep 19, 2026 at 09:44:18PM +0200, Nicolo Giuliani wrote:
> The Sophos XGS 87/107 desktop firewalls combine an AMD x86 host with a
> separate network processing unit (NPU). The NPU is a Marvell Armada CN913=
0
> SoC with its own eMMC and SPI NOR flash, connected to the x86 host over
> PCIe. It serves the front panel ports through a Marvell 88E6193X switch.
>
> Document the compatible string of the NPU board, with the CN9130 SoC
> compatibles as fallbacks.
>
> Assisted-by: LLM
> Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
> ---
>  Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml | 9 ++++=
+++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.y=
aml b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
> index 7e77310da6..2e114139f1 100644
> --- a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
> +++ b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
> @@ -136,4 +136,13 @@ properties:
>            - const: solidrun,cn9132-sr-cex7
>            - const: marvell,cn9130
>

Looks like you add to the end of the file, not in correct spot.

> +      - description:
> +          Sophos XGS 87/107 network processing unit (Armada CN9130 SoC
> +          with an 88E6193X switch)
> +        items:
> +          - const: sophos,xgs107w-npu
> +          - const: marvell,cn9130

Why is cn9130 used once as final compatible and once as not?

> +          - const: marvell,armada-ap807-quad
> +          - const: marvell,armada-ap807

Best regards,
Krzysztof

