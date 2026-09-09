Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011047.outbound.protection.outlook.com [40.107.130.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F98A5632B4;
	Wed,  9 Sep 2026 16:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970917; cv=fail; b=uRB8EmdLDVl8iEmcTok7wwyvh6tVm0Sf2gYLZYn3fmJLF1ZjUj15cbVvXfuvhNdWwn4Q3TZT18KNLQL9VWWEFUhAvF3kNjT/gLLnDkJ7G3MfaOUJGv2JBl6N8w+vh9XQElG0bkGpV5yiREGMh5qqIUy5Pfa5/+t2dI8w3VJUfYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970917; c=relaxed/simple;
	bh=qRVZnWioDlnegkZfLhbyqSQaibfuBh20AbuO4u3wXsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VFxQp0TXddd+IRUJ8oij2OLMPhndUgINQDdaGnGpJ0mImwF9dUNQjzgPcUUTKpuoeQ8X4dmDhxu48ilQ2Ko8qEUNJHHtOKojvoGJwrfoexCKGSBR5OcsgW8a6sQl5x8vlHloMTOpeqm/bdt5SOBDTIfDeQMRTZC5MN0LNB6lqpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FOv7hBTD; arc=fail smtp.client-ip=40.107.130.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FOv7hBTD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPDnEQBHN/4W+WD/8dcJISVsBmpg7J66yyCJsg9RKMBXJ/dXnkuupRrmB/N66aWVqSKU0JB8bP13nAJ4V5r+3NU54XNFmEvKnk6C4uPPDncUVeQid7l0eBqOhoQHfMHfT20BtKoNJ2F0axFUvL0udZawfUNJQ2VbsZanvPkPfd/64CT/4KyELuiZdRvtKitr9QgelmLYvMkimXjgiqA8gyoJnM4ORjSGW5ZUp05wZisK2w6EfkDEfHiTlCkO0RuKRWvLdArHgAN0KcBL36JmuMCjXI2BBGnHPmv+GgX3CirPPBnjuTHRR6cChtvvdw8nrXkkEUv2M8DnFcFfv9t7yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dk3Pmfp2JwxW7I3lZX+3vJgwL4vQix3gXGyEZXByrKE=;
 b=rZ72cMk7vRs7rz13UZRjwDCtDyjeZXqgnUGKiT4ejqbo37iLs+Id5qjYbSCQMPBZRdTpGWMUdhbqqxv3kCtmZhUz6dNxYcoDkfiU5H3MSNZ2tO1KEXQ74n2Lfl/nD4sC8SgPKfC8VM6CN7hdbbpNbxYJ+9HjENPwh8PzC8kZTsqNx2ZgxfP6nKOuOVtQYjG1tHeJoWNo+Wf3NCFeooJZrQPa9L2bLBpoxC42W9HuJg9uwT4SkuIZjmdlyqMEV7bON5eAIsjJlOFgrzQVWWt/rs4opekDUWCL7oNC3Hoa9VpvWzMJaGCOsDtRMRrGaKwh5YKjU0bb7N0G5ekNXqBY5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dk3Pmfp2JwxW7I3lZX+3vJgwL4vQix3gXGyEZXByrKE=;
 b=FOv7hBTDxL0m8djHEfJBOXt1yzdmpKDxdIZv/c6zf5/zRZZL3f042a8S7riSFB2CznSDUfITCEmSF/CfoX9m3epZFW+mf9kLnavhka6UUCqhW1HkN/QV9kwePtWE08/+vXrgLZn9KEpZxGWEjn0X6VXfpiKenk2e96vHnDstXYov82+AnIOXxljjzXe+d0EifZALjuSX/WBNFJrqDoHDQg09F8eQXjZHt9H5U7DquxMDiv7a25Fu81UFkEx5JdiqKjRJerAcBgcVQAOL9jdnfNnoNZaAfeRbMAec1FCUAQ67mBfTcMZJSyrKaBlhLXLASKTTr5AvAvF5o8mS0OInmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB9846.eurprd04.prod.outlook.com (2603:10a6:10:4db::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 16:21:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 16:21:51 +0000
Date: Wed, 9 Sep 2026 11:21:41 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Shubham Patil <shubhamsanjay.patil@amd.com>,
	alexandre.belloni@bootlin.com, Frank.Li@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <aqGHlWpQjpHEft3j@SMW015318>
References: <20260908094257.3196120-1-shubhamsanjay.patil@amd.com>
 <20260908094257.3196120-2-shubhamsanjay.patil@amd.com>
 <20260908-groin-undivided-0af701135404@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-groin-undivided-0af701135404@spud>
X-ClientProxiedBy: CYXPR02CA0090.namprd02.prod.outlook.com
 (2603:10b6:930:ce::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB9846:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b99047c-4e6e-4bdd-fd62-08df0e8e7466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|19092799006|11063799006|5023799004|4143699003|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	fsjrunZ9tVpa5xBztrnopv8qdn4afkDgR9Hi0xtABBU7RJ/9S7dNBDmWmNB+CqoMSxj6/xC5fAEsrKQ3AmY2+2wO5KBRVfU8M0EBM06BtRfa6BrzkXGeO0mBCFDhrvSAJp/5KkPwM8kBvvZaN6QZ7GYn3nWBZCHVpB3zTVCoC5bMwS7aWYivb3+WOUHhvqwSRJxiYI0io49m0ANXGsPEnNX8aaSAKUuW+OgDd7WPctwWUgvx0xcA04Me6KcH8LgXfiyFQI8NLG9AxEhXJ85ugrQzAb2mkONjbVCCWUytgZi23dSIzb09hVYpZewksid3p5DmFUIUFmeZpMfCU9kCXoJErliLMcxQ10WQCp+nDqmckkeyPtyV4FJ0C2iyVv1s1iLFRUlmBXTafpjzs7Oz8sSQuTPeFstAbIr6acXtlqeCLdbdv5rF/hTxzKO1+b3NCMAyZCEd3AZ5jDQxhzcbNatC8RSsuUueKbpcUixEYAdzLSlIJYVO04Ou3yqO88Bvui/9Ki7CiqlswBuBzMKIFzYvIVUcKkcy1wEXL0PKQ3Vo5rkxFZWiQgYByw4y3hGxic52sioVmJDTdxIJNc4PFSTaM4MTtpXybFirVy8NXu1BeGgCm4YdlS1Lxt2BC4o31cEDN2FuatGhIu8S4NLbtqPHIoynD8Ao1LUjXfrfSr8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(19092799006)(11063799006)(5023799004)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7cSoDHu/iz3DlwjiXmOHUTAoT2xnN2vs+BhepHMojhtFI5AYJZNVws+u7aYq?=
 =?us-ascii?Q?boPjARP/nny6pnKl26JuGl+Upw1P0uKk4cDZG2S6Dmil8O+t8V/S1owJQ93/?=
 =?us-ascii?Q?HOYO0LI9yGeQvhMK+M1aLGOgd4CLsZ+/t4uB7DcqO3zlvIKGco6OoBe9W6gc?=
 =?us-ascii?Q?wiFFVUHr7lCu0856IYXWtKcbg0ZEvHjfa98VINakj21YDeJTXF7C5sOdWCYG?=
 =?us-ascii?Q?mJQOPLs3roJxMpk+duZmgaoYK5zJJjF8E55ZipZXRBFq82XCdqtzX3D7zT7V?=
 =?us-ascii?Q?DDTH1iIgvuoU3cKaxBtOpY5n04SisSum6AasxTIgZdJ+3S7Sxaenzf+7zbD+?=
 =?us-ascii?Q?WjUVKvDs7dJGmupgKDMo6c9jfvo9F77vJQYfedD1Vp2sDM2iO3hTk7DTQpP4?=
 =?us-ascii?Q?X5hvsmYxO0vRzZyVK1ihRFCr08xlWOEwoKZgsxH/xJ1xQPCxwjfaahgTXWie?=
 =?us-ascii?Q?85x8lg8wc4OfD4wKEcB6+IuuoSrB6nyGtwg+l0XnSypUda1xNqUEQROkFk9g?=
 =?us-ascii?Q?vHrkNLf9UZLpeRQGulZ7l0yGrcIqyowZ7jOrFKeoJ8IbOliC62qwglCyxgfg?=
 =?us-ascii?Q?1v23tbzEPt4Cq+rjE5dfCK/1IC+/qCcQIaroB7WT3YRjSsb7hLvv5Oxk1hIW?=
 =?us-ascii?Q?vBUtGowGkosLKVckq2SzdIaYGDDI4cM6E3KE8s935xo+H+q/lucgzhi3dWcn?=
 =?us-ascii?Q?Ox2bKjlfHroosp5JboWgfXj0egXdfR+WT6c6B93ATBs1MREUArjGVUGBBJ/4?=
 =?us-ascii?Q?h8iaXU9vlyva+tiTWZYNEz7TqVwMUeA14VOCvZ1mGy8cG6tFEGq1aeXUL/Yo?=
 =?us-ascii?Q?G/4FmluW20YsbC/cgXMxe2clKqTmRSN9U7L757iT4TfBPdqso/AXIw8hPqa1?=
 =?us-ascii?Q?arBQffIvGSXz2fN5Cbnrrb7qVH0OyvT5JxsAwnIusVhyha3JA7AR75fBYqOv?=
 =?us-ascii?Q?JKL6J5V9ZihsOXDXM8asWBVZh+887cruSaXVUJZyEhxqCp308Kh5M6UJOJ2g?=
 =?us-ascii?Q?ZbxDDlqpsPh5asOw8qud5qqhpOHE3Mzn/ufbKfCEukrQs9/+ODNhMxS4jkwy?=
 =?us-ascii?Q?foEy6WhoQM4bcUjAEuO99C2MURooM8lnNE3LumJ4nWmcnxctvEWeep3ck8+a?=
 =?us-ascii?Q?qbRg8CEk+DhzhUPdqYRypLFt0J54bORudeT4iekQDNHfrIwqMn6eb/7tP2Yk?=
 =?us-ascii?Q?fp1tF37OvLEuhcOfIrkxLx+Yqaoeb01xPfkUTczdZW1NZ4UZhnwNE4dwIl0t?=
 =?us-ascii?Q?KPv8I5U0v/pUZlWWStYkgyY1Qdeu4uWpX6FtdwQIcUpmmp29n5iuL0hRFwCV?=
 =?us-ascii?Q?e7PpBiHhnavRyyb99eTViUb0HenWO4V21HqP8tkwDP1+wjkpKgAzx2wQNwzK?=
 =?us-ascii?Q?acu5tUhUuXEAczoz/ugvyCqbAJm2Kpc1yeWKPwhKX8o7XUbScNUavSjglrNQ?=
 =?us-ascii?Q?Bfy6TGUuNST1I0j303da34nVIs97PyM/jPx2gzmolwOpa4UkzPWvkoCDBRnU?=
 =?us-ascii?Q?WAzh3XcFhJOhRHYNW9Jny2cllKYyFoqKTV9v5xA0gP3+/9ZJhJCrx0K8sN7B?=
 =?us-ascii?Q?FxXvRZcEQKf+3aiX5I3kP5rHSVLIt89Gh4pT7U5xhWhSgzU5EvYtuQE0rtmp?=
 =?us-ascii?Q?sw6vgpCNh1aFPcT+Q3CBxHGVfxKsH973nIq+qABwpb0hbmT+IJSCu9xpPjuR?=
 =?us-ascii?Q?WjbfoZiXRxNJY5GJEs30ueWtLmGB2uH4WJafjemnpfjtpbHTK7vux72IVli9?=
 =?us-ascii?Q?aSQRAfQnpOsOZPOxbcvrqBCZXTWepNuNlsvIeACEAlHW4ZaQmL+i?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b99047c-4e6e-4bdd-fd62-08df0e8e7466
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 16:21:51.6719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+tmEBq0K+RBO6JkBXTZDa+Umck7Cb86hWvH4RtkC7NR26pH0oPmvEemTcFYKra5OcMJdP7V18cX7jbnKHWN0rjesRRJAS7AQOtiCtIXIEmPzOuWjSLPQ5Eq3FCDxnrM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9846

On Tue, Sep 08, 2026 at 06:54:31PM +0100, Conor Dooley wrote:
> On Tue, Sep 08, 2026 at 03:12:55PM +0530, Shubham Patil wrote:
> > In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
> > IP. Describe them with two boolean properties.
> >
> > A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
> > capable design is always IBI capable as well. Both events are reported
> > through the controller interrupt, which is therefore required whenever
> > the capability is present.
> >
> > Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> > ---
> > Changes in V3:
> > - Move in-band-interrupt-capable and hot-join-capable into the common
> >   i3c.yaml schema and drop the xlnx, prefix.
> > - Keep dependencies in the AMD binding.
> > - Update the commit description accordingly.
> > - Conor Dooley acked v2 with the xlnx,-prefixed properties in the AMD
> >   binding [1].
> >   That Acked-by is not carried here: the names lost the vendor prefix
> >   and the definitions moved to i3c.yaml after Frank Li's comment.
> >   [1]:https://lore.kernel.org/all/20260824-tightwad-impose-495476599087@spud/
>
> I disagree with Frank. These properties make sense for Xilinx because it
> is an FPGA IP and synthesis options impact this. For other devices, this
> should be determined from the compatible.
> Please revert to how things were done in v2, especially as no rationale
> was provided for why these should be common.

It is common problems, when IP intergrate by SOC, which may defeature some
part, It is not appeared now just because IBI and HJ have not enabled
widely.

IBI and HJ is optional features of I3C. Ideally it should be indicated by
some registers. But not all vendor implement provide this CAP registers.

IBI and HJ depend on some slow clocks, which monitor SDA line change.
Some instances of IP may not have such slow clocks. Some IP's IBI and HJ
use seperate IRQ line, but these irq line may not connect of difference
instances.

like previous SPI vendor customized property, we takes efforts to convert
to common one and also meet back compatiblity problem at convert. I don't
want to do it again. This kind property is most likely as below.

default: 	decide by comaptible string or hardware cap
force-disabled: force disable for some reason, like, miss connect irq line
or missed some clock, or IP bugs, or board desgin's some level shift chip
broken IBI/HJ timing requirements.

Frank

>
> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
> >
> > Changes in V2:
> > - Rename the properties to "xlnx,in-band-interrupt-capable" and
> >   "xlnx,hot-join-capable", and expand their descriptions.
> > - Express the interrupt requirement with dependencies: instead of an
> >   allOf/if-then clause.
> > ---
> >  Documentation/devicetree/bindings/i3c/i3c.yaml    | 15 +++++++++++++++
> >  .../devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml |  6 ++++++
> >  2 files changed, 21 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
> > index e25fa72fd7857..7430394cc6b9b 100644
> > --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> > +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
> > @@ -61,6 +61,21 @@ properties:
> >        Indicates that the system is accessible via this bus as an endpoint for
> >        MCTP over I3C transport.
> >
> > +  in-band-interrupt-capable:
> > +    type: boolean
> > +    description:
> > +      The controller supports In-Band Interrupts. A target can request
> > +      attention on SDA/SCL by driving its dynamic address during bus
> > +      arbitration, instead of using a dedicated side-band interrupt line.
> > +
> > +  hot-join-capable:
> > +    type: boolean
> > +    description:
> > +      The controller supports Hot-Join. A target attached or powered up
> > +      after the bus is already running can announce itself using the
> > +      reserved Hot-Join address so the controller can assign it a dynamic
> > +      address.
> > +
> >  required:
> >    - "#address-cells"
> >    - "#size-cells"
> > diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> > index 2caa245a86568..9480de3fe8e1d 100644
> > --- a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> > +++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> > @@ -37,6 +37,10 @@ required:
> >    - reg
> >    - clocks
> >
> > +dependentRequired:
> > +  hot-join-capable: [ in-band-interrupt-capable ]
> > +  in-band-interrupt-capable: [ interrupts ]
> > +
> >  allOf:
> >    - $ref: i3c.yaml#
> >
> > @@ -54,5 +58,7 @@ examples:
> >          interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> >          #address-cells = <3>;
> >          #size-cells = <0>;
> > +        hot-join-capable;
> > +        in-band-interrupt-capable;
> >      };
> >  ...
> > --
> > 2.34.1
> >


