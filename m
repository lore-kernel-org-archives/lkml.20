Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.111.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DFC3769E1
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.104.111.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974969; cv=none; b=TCueAwNrt3/ZJ1yjqagdcmZovGgiB9NTwhiYejQggoPYxYYLFDqoQKgMY96MLLX1T6Z0kP7rU5ECZaBybsHL4D/7WEzHzLzOEhAXMWHCfdYFWCMiOlqcWNtcEx+1aWTndsJ9JDwxKZeh0NuBC/d2TT6d//COtuXL6yjrqwA0gNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974969; c=relaxed/simple;
	bh=O6z8vM9plsABkbYRna0hlYB5IU/g6JJXUmPieDCvRcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type:Content-Disposition; b=QuBVNBecCJ/USDHelz/zafLB3VGEoZ1gvTzJnMzBMjgC3jJo3KbtQj5h2uEUueRp97e6glIkTqGIecQXaK4fQMxtW0bZkfzqLb4z98VDAhsOODzTkrS/Lg/LmGc5Aqlqb4Vlg3RnJ4ex5Q8JG/3hfngy8Zy6GV/MJM6R3AMTRt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com; spf=pass smtp.mailfrom=toradex.com; dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b=OMXplDh8; arc=none smtp.client-ip=194.104.111.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toradex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b="OMXplDh8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1789974957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pa8fA3NnKgToABoCj8CplO03uImYGS89s2RzWlw2xo8=;
	b=OMXplDh81A58NrnsMJPTf/JlCSHOWo816GJvPZ82EGYufzsVkl0HqBf9/U17svHTSxbbIj
	dgowAFyMbgZH+k7DzIb+07L2naZF6rnxnqW+alr5NQn3BUFGwqcAMgAdPBkPDV8R2aPnkn
	UxiFzO7PKA/0+oBJz1NbD2eBkQclLlQ=
Received: from ZRZP278CU001.outbound.protection.outlook.com
 (mail-switzerlandnorthazon11021090.outbound.protection.outlook.com
 [40.107.167.90]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-34-gd8o0yEhMH-M_Vy_8FqW0g-1; Mon, 21 Sep 2026 09:15:54 +0200
X-MC-Unique: gd8o0yEhMH-M_Vy_8FqW0g-1
X-Mimecast-MFC-AGG-ID: gd8o0yEhMH-M_Vy_8FqW0g_1789974954
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 GV0P278MB1898.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:70::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.16; Mon, 21 Sep 2026 07:15:49 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 07:15:49 +0000
Date: Mon, 21 Sep 2026 09:15:46 +0200
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Frank Li <Frank.li@oss.nxp.com>,
	Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 3/6] dt-bindings: connector: Add Toradex camera connector
Message-ID: <arDZoulyKIzVj-73@francesco-nb>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
 <20260910-verdin-imx8mp-hmp-camera-ready-v1-3-3c9349ecdb9f@toradex.com>
 <aqLaLmz7n31P6igy@SMW015318>
 <prwghb3ftrz5xd3hapxtlv2o2gm5xmuapnpz2h7fqulf75phqz@lk4yiaepormb>
 <aqLif2zrrsbYd5sM@SMW015318>
 <aqLk5UAv-j39Jxd3@francesco-nb>
 <20260918192447.GB1465432-robh@kernel.org>
 <178981707848.1761404.17065871878122418287@ping.linuxembedded.co.uk>
In-Reply-To: <178981707848.1761404.17065871878122418287@ping.linuxembedded.co.uk>
X-ClientProxiedBy: ZR2P278CA0054.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::17) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZRAP278MB0495:EE_|GV0P278MB1898:EE_
X-MS-Office365-Filtering-Correlation-Id: 2363425a-4293-4821-da10-08df17b0299a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|6133799003|22082099003|18002099003|56012099006|4143699003|10067099003|3023799007
X-Microsoft-Antispam-Message-Info: a8vqaDppGRJSy1L6lI2yZF8hcikxB14pbzMsXxXJ/7bGFO05+osZR8slgJ1wWZg+VrC0cnDWHuSRYjBh421iOoF9Rb+uFvTwAq0kwQwVFywApEwekU5fzEwj0SsTG3Jk2xEjCtUxZbNd7Fs8CsoWDupyE8SYt20G5F5VzQQIYLXE2QdICEY+u5Ayb53e1BArPfDBMeXHN3eOMdui5ZHE38kqTw76St+S3KmnHMx3wK4NbHX6rCvPr/kK582A46Ruw3n79bXwv12Z8lOFVTw7xZvw1rKAXjV5YGp/6gohiC7ss2rcI1+CQtwnqILZ+T8Fs347BB6a0x7KqrAsaseCFT97oVvUfgGcCPIPttD7mXWPmyVhkTtN6YbUouRv2pCxJ2M3fRaZsOh1nVyXCnFJ7tsWuOdmNQdDf7NWEdJ53nwz+0z2JVbbNWjHvsuqcvqDx/ajqpjdpV9PFFR8kfpBK2AjrzX/7DGiwrgnzHoYJh1V23w+aCAKRm17t5ICUzyTPKf9XWw+ZnSAzp82L/aMErE7k1VAJdqRnjGiHcNizfQc5/MV1uDHENv0Pj2GGVMkBwxBvE8NTvVW0HHhF0/OR94k9/Bu2twTAR5ta4QIH44PC1PyWarvVV2yhb8s+VTp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(10067099003)(3023799007);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UIdJ53Tqdoc1rJod4u1BGRRsG4tj53kZshc6gJhVnZSbh3eKr0G6exO9+feQ?=
 =?us-ascii?Q?wR3RK/ilpA232QaegIA1gVXLlJFwZ6prc+Eupf5aTsn/2Hk1pr5o8EMqqg69?=
 =?us-ascii?Q?/krvYe3QLuUa53bdicTP30Hr8kL9577KKV74De/ki55JpT44bqtWoUOBAziV?=
 =?us-ascii?Q?90f5qd11SfHQZ4n6TvkhruzjRKOt0wnc3jegeTrx5r2cnnBYt/JejhV96eht?=
 =?us-ascii?Q?yjv69PANc4IKYCV9AM+tZyjMsvII6FzJKqsSRy1IurqWjbuk5FYFchaVSc5Y?=
 =?us-ascii?Q?FsGzRuPeXRjhh0NBrPkUoswJ8bR2bt340cCfxRhJoksOXquYEmxqojB5V3gO?=
 =?us-ascii?Q?1i/mWf+gLk485R3gAR3EwGXJrvDQ+9GCKAPtkv27C9o3QkyNUX6yOLDEHQ70?=
 =?us-ascii?Q?ihqcQ0B98IhswY4M+nX9XvzV3NQyUNyk7LLrS2/9GQp/Z0t6c3GRDoRGQ1rG?=
 =?us-ascii?Q?y4YQ2a+2RCg/IgYMt4OkGa9Gd5ju3eLkeSFjS6thrg6muaW+FLf4GzU+CEyJ?=
 =?us-ascii?Q?HnhMb+i8S2lzs+votcmaADlrjl0XAD6fLZOXqUWAlsF0u9iS0ZPrJGsbR8u7?=
 =?us-ascii?Q?AKsT83AwU4zp+UlcJLDXMwMVZZ+3V84RqSQJyrK/+sVTZIUTc4OgSEF/6rTa?=
 =?us-ascii?Q?KdcWyNJus+2n1WzZ8GT5Lo8733+a8s5Azs2Orgzx1m3Ba+tHxKuq2fVzWvw8?=
 =?us-ascii?Q?yhgKJBS13Edk26p1wY/JU3ansUIFMM6xmnfck/d/vOQrmQMpARKykK9MO1bw?=
 =?us-ascii?Q?gLjBHx/IMeZ+WUeF9yh6+2BTi+FyzSY0GBUW6NZ0BbP0MhKVcbJZ7s2gaf4A?=
 =?us-ascii?Q?eAw7iv/i/CvpMIgr9JQubk6otCG9zRCQMODUTnC1s4hMEIogrgkRDi5+hGfK?=
 =?us-ascii?Q?sz27qcwdVLhylUaWO4BCe+rZyE7I4AC8qJgm6csfSqXxfhCZlBaE04XWaoLN?=
 =?us-ascii?Q?nOJddpcf+qLqNyUpw/rNKaxTFogJu8cml/oeJ4264L1apzMvJYbC6tHEOscL?=
 =?us-ascii?Q?/oZlssxUlRgR2b/wj07w81ROCjywuzsLOUI/TNT9bFlFcdKbhMb8KZiHA6yL?=
 =?us-ascii?Q?3XWOReRsvqcKrEMcgJSYvinTCPpi201crI0QYVyRHgsY6Bkc3jF/cC0eBGNK?=
 =?us-ascii?Q?O9smqhsAwmrsZ9OC0Zg6EDAMoNyyl+DMl07yuHUwJeouRxKyvinhnceOCn1j?=
 =?us-ascii?Q?r4nAVW9ifS5OkuBHXi6/UTSmxjrylVUhLc9Yzb87sx1EkHU7tehk2tDUu7xx?=
 =?us-ascii?Q?Sb3sz/wgwM1wwaea5DYkihbuV2CayIJA0sxHoscxs/7YMmJPXhpJk/GRmNsp?=
 =?us-ascii?Q?DUU7KIRX8x/jgK8iBKMlzUBd+Igaoc97IZl2G5ekXh6ZmvVVtpWEDWlq3E11?=
 =?us-ascii?Q?PodkaKmzILOUsatDUYZtQANZS1VSWHB3zFHztAhyAdUp7Q69pfY3t80EqChs?=
 =?us-ascii?Q?mZYrdAgnY1cKcYZZGGJOnn6X/gcEd3y7ez/RMXfLq+54MktNCyblMsgJpQXO?=
 =?us-ascii?Q?FKPiXG229VMUQlJovwepZuOfO3LHCc8OqW6Nf3u9R8LzqyzSWK04OTA2k5d2?=
 =?us-ascii?Q?cLyY03oyqBB4i9JRCRKdXVvfPjtjH7Q31V6pG9hechoDmg8elFvYJ8WSdLAW?=
 =?us-ascii?Q?w7xAUrh9OOiNFEu5UUw1lMHfUdrdwRYYp6vy3vLha+5RDjuqKGokRNnEbj4C?=
 =?us-ascii?Q?acgznG//LZU7J9XRTBbdM8bYS5BOepoB6hXDvYsNScVwI0S5RiddDQW0ANNh?=
 =?us-ascii?Q?VEq9TD9ZV2LX70ZiHvMO6O3jiznZWRk=3D?=
X-Exchange-RoutingPolicyChecked: D7ZUkU/hF8JWcE7f3FTDysnuZReKAYDEr3N/K+cJYgfk+t8zRdZQWT+x+p/QlrvaFqQxsTbBoE8GmIy6FC1Twp0NDugI04b/4IDC3z2msQetPABCtgTLsuST6Z+C0ycpuH8ZzSuRX8YXVeSR1SUwDMXmZ9QFXKh9xwaIeAuwLP9D0xwgUbQczDWxNrNR4/X9k9e7u4UK4fE8gWr+/8xykbC+hDa78uaidXaV23Ex+cpn+J/dhAFRlwf7/5MJv3iAlV7ccPeQld9zOvutpJ6wjM/Jl8yPMIabA1XjkeKNcnBfqszdEIeav8letgzTFhN5IcA9WIJcxkQfQaV10Zp1mg==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2363425a-4293-4821-da10-08df17b0299a
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 07:15:49.3475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TXfbHpGgoHQl+hhwu4Sv2fqgAit4UFhSqltWAOEum/Saxsl0a812EPxDigBPPj7V4A+6lKQHpLsXvtyoHtmTdWBxxXYdWgrmHYFmyJeMEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1898
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cOIi0Vc9QlCXybAlOCWol9slxC03VLvoVO4PuTGC1HQ_1789974954
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Kieran,

On Sat, Sep 19, 2026 at 12:24:38PM +0100, Kieran Bingham wrote:
> Quoting Rob Herring (2026-09-18 20:24:47)
> > On Thu, Sep 10, 2026 at 07:12:05PM +0200, Francesco Dolcini wrote:
> > > On Thu, Sep 10, 2026 at 12:01:51PM -0500, Frank Li wrote:
> > > > On Thu, Sep 10, 2026 at 06:39:30PM +0200, Ernest Van Hoecke wrote:
> > > > > Hi Frank,
> > > > >
> > > > > Thanks for reviewing this so quickly.
> > > > >
> > > > > On Thu, Sep 10, 2026 at 11:26:22AM -0500, Frank Li wrote:
> > > > > > On Thu, Sep 10, 2026 at 05:37:59PM +0200, Ernest Van Hoecke wro=
te:
> > > > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > >
> > > > > > > Toradex boards route the sideband signals of their 24-pin cam=
era
> > > > > > > connectors to different GPIO controllers. Camera overlays whi=
ch name
> > > > > > > those controllers directly must therefore be duplicated for e=
ach host
> > > > > > > board.
> > > > > > >
> > > > > > > Describe reset, power-down, detection and power-control as
> > > > > > > connector-local GPIO functions. This lets an accessory overla=
y remain
> > > > > > > independent of the host wiring. MIPI CSI-2, I2C, clocks and s=
upplies
> > > > > > > remain described separately because the GPIO nexus does not a=
bstract
> > > > > > > them.
> > > > > > >
> > > > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.co=
m>
> > > > > > > ---
> > > > > > >  .../connector/toradex,camera-connector.yaml        | 86 ++++=
++++++++++++++++++
> > > > > > >  1 file changed, 86 insertions(+)
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/connector/tora=
dex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/tor=
adex,camera-connector.yaml
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..06e6836e1aa6
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/connector/toradex,cam=
era-connector.yaml
> > > > > > > @@ -0,0 +1,86 @@
> > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id: http://devicetree.org/schemas/connector/toradex,camera-=
connector.yaml#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/base.yaml#
> > > > > > > +
> > > > > > > +title: Toradex camera connector GPIO nexus
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > +  - Toradex Linux BSP Team <linux-bsp@toradex.com>
> > > > > > > +
> > > > > > > +description: |
> > > > > > > +  Toradex boards provide 24-pin camera connectors carrying M=
IPI CSI-2, I2C,
> > > > > > > +  clock, power, and sideband GPIO signals. This binding desc=
ribes the sideband
> > > > > > > +  signals as a GPIO nexus. The other connector resources rem=
ain described by
> > > > > > > +  the surrounding board device tree.
> > > > > > > +
> > > > > > > +  The nexus exposes connector-local GPIO function numbers to=
 camera overlays
> > > > > > > +  and maps the functions wired by a carrier board to their G=
PIO controllers.
> > > > > > > +  GPIO specifiers contain a function number followed by stan=
dard GPIO flags.
> > > > > > > +  A board may omit functions which it does not wire.
> > > > > > > +
> > > > > > > +  The function numbers are:
> > > > > > > +    - 0: Camera reset, connector pin 11
> > > > > > > +    - 1: Camera power-down, connector pin 22
> > > > > > > +    - 2: Camera identification, connector pin 23
> > > > > > > +    - 3: Camera power control, connector pin 24
> > > > > > > +
> > > > > > > +properties:
> > > > > > > +  compatible:
> > > > > > > +    const: toradex,camera-connector
> > > > > >
> > > > > > Name is too generally, suggest use board name, we got similar c=
omments at
> > > > > >
> > > > > > https://lore.kernel.org/imx/20260629074734.3643227-2-chancel.li=
u@oss.nxp.com/
> > > > >
> > > > > I saw that and it made me reconsider this name.
> > > > >
> > > > > However, I believe that in our case it is specific enough. It is =
really
> > > > > the same on all our carrier boards, and Toradex specific. It's al=
so only
> > > > > for cameras, which is more defined than just "io". Curious to see=
 if
> > > > > others agree or if we should come up with a name for this.
> > > >=20
> > > > If some days later, you update hardware connector to 30pin from 24p=
ins.
> > >=20
> > > That connector is there since years, not days.
> > >=20
> > > We have multiple cameras, designed to mate with it.
> > >=20
> > > If tomorrow we will define a new camera connector (that is absolutely
> > > possible), the new connector will get its name, maybe
> > > toradex,camera-connector-v2, or toradex,camera-connector-22pin or
> > > whatever that connector would be named, not just in the DT, but also =
as
> > > a product and on the actual HW.
> >=20
>=20
> Diving in because, cameras :D
>=20
>=20
> > I for one hate 'v2' naming.
> >=20
>=20
> Me too. I wouldn't ever call it v2, but a future
> toradex,camera-connector-24pin might be appropriate.
>=20
> Note that I specifically said 24 as an example because there is already
> a 22 pin Raspberry Pi connector.
>=20
> If Toradex were to produce boards with a 22 pin connector, I would
> anticipate it to be the same pinout as the Raspberry Pi connector.
>=20
> Raspberry Pi camera connectors have already somewhat become a defacto
> standard (albeit for both positives and negatives there).
>=20
> So I would imagine if a 22 pin layout were ever made it would be
> compatible with RPi 22. And if Toradex ever make a 22 pin connector
> which is not RPi compatible ... well I might scream into the void ;-)
> but then it would have a toradex prefix I guess!
>=20
>=20
> Equally we have other vendors who have 30 pin connectors (There are
> quite a few, so I have myself a research project to go find out how
> {in,}compatible they all are here ...)
>=20
> So, I would imagine if we're giong to name connectors we should set out
> an expectation to start with
>=20
>   toradex,camera-connector-30pin
>   raspberrypi,camera-connector-15pin
>   raspberrypi,camera-connector-22pin
>=20
> And if Toradex were to make a *different* 22 pin connector then it would
> be:
>=20
>   toradex,camera-connector-22pin,
>=20
> But if it's RPi layout, then it would be defined as such.
>=20
>=20
> All that to say - I think Toradex certainly warrant a specific
>=20
>   toradex,camera-connector
>=20
> But I think specifiying the pin count already could be useful (but not
> essential).

As Toradex, this is how this connector is called, and there is no plan
to design a new one. If you want a full descriptive name you can call it
"Toradex MIPI CSI-2 Camera Connector".

I see no evidence that we are going to have a connector with a different
amount of pins anytime, if we would redesign the connector today it will
likely have the same pin count but 1v8 logic instead of 3v3, and your
proposal would not help.

A little bit more data on what we have today, the connector is a 24-pin
0.5mm pitch FFC/FPC, it goes back to 2017 and it never changed after
that. It is currently implemented in Apalis, Verdin, Aquila, SMARC and
OSM Toradex Carrier boards.

Francesco

