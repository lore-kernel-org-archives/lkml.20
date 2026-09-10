Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.111.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF01A53FD4D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.104.111.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789060350; cv=none; b=jvndTvkvLzM1C8OckSdCcD2pFuuehoDHePqCi27gVYyyJkbTYHkvLjxSELkD7JwFm/0at9EAk8a5dENwOLFNNbJGEmIYNmVOA2DNo+efAOt/TTYuxRKjzhJbo8iQrosG+S5h06bBA0pI9y+LXCiWdLc0wn9d0mYGVQ5Rx/XJ6uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789060350; c=relaxed/simple;
	bh=QhQDCwVyfD/PEgie3S0zLZuk84xghrlrmylx3+osVp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type:Content-Disposition; b=ROZWh4Yu4M/H6Cj1nuntHLIDFIL+1lOm6NWs9detOuw5uiRwEjBAVly+cLTdWOqzuAmg2smJqTQYtqTN2rrj1/pIcmDiQt+nIQ1Pm6Om/syAsEJN2BB9TVSkVIHcmRUNEIl+wbCkVh9PKJoiqjawiiPyP5HtLSwBd/4xhB/cmc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com; spf=pass smtp.mailfrom=toradex.com; dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b=Cwuca6sk; arc=none smtp.client-ip=194.104.111.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toradex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b="Cwuca6sk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1789060332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2GOG89oMfhyGtc0zIxq7uFeyZkDDw1ADWld6NwnVEYY=;
	b=Cwuca6skqPgu1GLAgmeka5O6SL4NAcJstbqnug8hIg862HUUtWEBMHbqggBkUxIg+ggBOY
	IZeNXfshJlcX7hGS7Yvm5iPCWc0JgnnmbBlHpEuDbSMrv/5OXwbOiknrCk/wLjgiMxk/MI
	3OjYrbfgclaIx39IOFjMTPcItLEtOxk=
Received: from GVAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandwestazon11020111.outbound.protection.outlook.com
 [52.101.188.111]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-64-O_GlWKyGPcakNo-Atc1a1w-1; Thu, 10 Sep 2026 19:12:09 +0200
X-MC-Unique: O_GlWKyGPcakNo-Atc1a1w-1
X-Mimecast-MFC-AGG-ID: O_GlWKyGPcakNo-Atc1a1w_1789060329
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZR1PPFC76DBE08A.CHEP278.PROD.OUTLOOK.COM (2603:10a6:918::2ab) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.9; Thu, 10 Sep 2026 17:12:07 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 17:12:06 +0000
Date: Thu, 10 Sep 2026 19:12:05 +0200
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 3/6] dt-bindings: connector: Add Toradex camera connector
Message-ID: <aqLk5UAv-j39Jxd3@francesco-nb>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
 <20260910-verdin-imx8mp-hmp-camera-ready-v1-3-3c9349ecdb9f@toradex.com>
 <aqLaLmz7n31P6igy@SMW015318>
 <prwghb3ftrz5xd3hapxtlv2o2gm5xmuapnpz2h7fqulf75phqz@lk4yiaepormb>
 <aqLif2zrrsbYd5sM@SMW015318>
In-Reply-To: <aqLif2zrrsbYd5sM@SMW015318>
X-ClientProxiedBy: ZR0P278CA0106.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::21) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZRAP278MB0495:EE_|ZR1PPFC76DBE08A:EE_
X-MS-Office365-Filtering-Correlation-Id: 760c55b3-bc4c-4b48-bc0b-08df0f5ea444
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|6133799003|22082099003|3023799007|56012099006|4143699003|18002099003|10067099003
X-Microsoft-Antispam-Message-Info: TcMypZiM1aBlq94BwTbMbS+/ttHVJXBvbdXcMUOrdOK6Z/oK2oDF47Q/NvaXvALvTKVz5WaJr0N1pHR7v4SH4R7H6Xp+7C1dzmzAhqf6gAktva1FWa5/DNH6bD3xatUxBaMiWmOMbz9BDqX6xGVSJ2sgM3STyWIDWVV8H9w/ToCxAmlsBq6E3UodSplnaEbblo1J/HnDIOwpafuYetj150tNC/aSIUgEHao2Rzg1+kP2umXsaa0AJ/x8InZ1dZUKYHTwOi2ZNFo85FFMTtUMb+m4Wu3X1eSJ8FtibK9PMx6JhQWnVEx2aZepn3k7gsFS1QWxEcPprUGjHROU8hAfVQMI8aXNhsBAMsHkOyCbiSoS4P+FdIwwQuZqoM45tf06A4esyPNs4I7gVRvYVFxlU54yqgdHyrKhwkfmkGIM9lugKVD+3JdPwsniEEncks47D8QRt4n3jYLP0YIET0k36dVkq3/1h/XhAEnK5zivtRfkTyDgGJ8e1PWNVX4ydHN2LV8b+vSXJjcL4LjkVwK/1kQWvjeiGh67KxM0wWKgDguDIWIOyTXFDdHfxvvWs9Ch4DAOkxN9szl4vylaRo2Hl5WSbEuP6d79KdP7GcKqAoKvNPPsx4ZJ4qN/xOmfA1Er
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(6133799003)(22082099003)(3023799007)(56012099006)(4143699003)(18002099003)(10067099003);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6zjcKDND9eYiguZScc/Wli29GrEJYCSqyKj+f3xiGGIf6vanlZI5cs5yqW0f?=
 =?us-ascii?Q?UzxNlcLpzCTXSC64lbKD0lPRh2UOpEX7a2bKzRbG6DyZGMMh9S+37Ls763Yw?=
 =?us-ascii?Q?sSi4ayVFzqeq4lOOcE6NQSg38L8Ks/ERNUSU85jZFU1yCeCDwWGnlbF+gXc/?=
 =?us-ascii?Q?+x6x+dynbfM3jl8Axr/6IvTILBwC+Q6X075YeV6ATL8nYx7fJ2xGXiG9hLAx?=
 =?us-ascii?Q?ZWSUoSCC1MPh3sFQ2AaUfJYcQqrZj/iq4GoJxMpxC14Q1SuQsd8zbZh4p/CY?=
 =?us-ascii?Q?QN+BjiAcWRd4y6mX7WeEer+Jj8QU0rpfuSuFItmKJvFcl9gNDbwxDLnHRDV/?=
 =?us-ascii?Q?gGrhEMhKDwlvGzVSBIPjGAIrX8y/WObkMU1W0VIYRT52M94m7IfgJBKutw43?=
 =?us-ascii?Q?k54OMAANyyNHmmwuRd9zjiMHWqK4EmfMQxCB2+7/mm4a2DbJTntVJLeZNsw7?=
 =?us-ascii?Q?W/IbMcHgg8tUB0qj2+ECIJDPacuqKzwbHSFXDam2ytz6S3zKIFvJXDptjW3b?=
 =?us-ascii?Q?aQWTGdFuj36t0NN+rEoQk0YGvUtAPahaIcZleHgA5SBVf1Fo2ZbEZnwKenKg?=
 =?us-ascii?Q?PszsUM5905sAj1E9I6uTp7oe6dGLsfMj9NxRczaEJA7AkCAGAb04KKTNjbjX?=
 =?us-ascii?Q?tm7/fEyYrJ6Dlpi5ewDA+W/ds8tAajYrT+kxwZMzbOPmAFhtXPNmExd3EGDI?=
 =?us-ascii?Q?INlmAtKSy/XWNYfCfWCdew2776inhxHlVhQn8yce03Mk/A6jvJPcqbFofk0U?=
 =?us-ascii?Q?aniOueuW2BiAMjJN/LCX3FaoXVBVvFX94fsG/bWNWG9U4jB71D8y6zUGKOdk?=
 =?us-ascii?Q?6xcO6OevBjNMNoVIMm+tdAmK9VD/KsEByVgwBT2LxAiioYxwd38ddxTHKvhY?=
 =?us-ascii?Q?Ih7ghNcmpQqErSKXrnbNJQADfRZrF8fWEolljk46hPPM8JLTidQXEA/EeOuI?=
 =?us-ascii?Q?j8fui+kxxxu3SgXPDoqi0l088UjfSFAZBCWDhpuA4Jxne53zeChMUKtQSfVI?=
 =?us-ascii?Q?WQUY1br0hVJvJ7gE3ZQlxFIcrfZiA4vGMguKwLZzpUtvd+HvOF9ET/CiFYyC?=
 =?us-ascii?Q?ZevYGtROTSycJRHQ1bKG34sSK8fsF48UO5ORw+xtOGCN00XTmblBLH0lN9OJ?=
 =?us-ascii?Q?jjDzgmUnYMJvEEVmeIg1c+HlF2KIrGsFsQ2nHiwm9vYFdcxp+kDakkb/erC8?=
 =?us-ascii?Q?YjUpgCpGvdQNzAXrUK5cUpuLDtVxpLJux+XGuWwgVLVvpWVpIsrzyyLZ3BZR?=
 =?us-ascii?Q?WPxSZnhJqnt0d+1rm30P0ts64TqKupzRWDO8CYbX+ok7NxXTH9zQLywpvXqT?=
 =?us-ascii?Q?/8M8DSemCwguOa9tZwcCT3TDPNbOFR9euYjf7/B7bk3Rr4g1LDWTdf2Hy8r+?=
 =?us-ascii?Q?R8AfU9Ei5cVkxyZz4+paM9YD9RoAYn6u/+89x450sDhNJY6VZeswuf3ntdyc?=
 =?us-ascii?Q?eFa3ggkcHfQaK1s13ZNfIrYrxZdmylQ5AwSf8Gjcg8pcsFDwSbvQJPEpjvqq?=
 =?us-ascii?Q?SoERGnb9jIii1QH2e9HNrM7fmasTwJ1UW4Sds/VTn7/4+LIco1jOO1zsFmSw?=
 =?us-ascii?Q?rO9l5f4lf06yPBOi4wEpiuX0HPf5GhXCyViODBTfUW8MgJv3b23lITekd+Fr?=
 =?us-ascii?Q?01x9EppYkgqbMcZxnqxecQK8UdMuVEk5QpxrXzjHEPTT5W4UH/szU9FioGFS?=
 =?us-ascii?Q?oVbtVLeYUClJEdGtdxSQI9p9mtKpUP92nsJpwtHIA+pz78iixCbUBv+yvnAt?=
 =?us-ascii?Q?q8NBlXFObwfFHhGtRnwDMOkpAc8jeH8=3D?=
X-Exchange-RoutingPolicyChecked: mkOEI3FiUXnHk46kUyQAw+xl1kU60xzt0uZPdo6t+6aDaBDgcajoDDzl6Pnj/DwvRCN/7RyTW7g9E+FpVzhSB/6JKuA2OKuT9VrCHSLPADvJKDHONwjhX7owIpzRafcggBJ656t7XfmoRii2XLDcngid0CMdY0WPSgETJV1mFn5BcfFNAygHi7kM4wr8ii/9j7KrLMYg5a51yaWkwYYNqtUkXkuiZwWvjqnFKcVHzb68EfBv+YgutPJQCPqxgUlAmojVEFgdIp2LSf5DSnvOl6sd8PTY5ELDQXYyFDLVGRumJVpx1kyKhlLzh/YVvwlvApRQk4g9JezdeegHx/1TsA==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 760c55b3-bc4c-4b48-bc0b-08df0f5ea444
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 17:12:06.8324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOFsJJv82Fn0hj6QudbTps1JjJYk8FJiS2AXHqw+hFsmezKLUF1MrJ7htuEM+s9n2ZacIl0NcaETSFBpLdoBY090nYCW4a/5GKviXtcHlq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1PPFC76DBE08A
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iDPPFjX7_KKkVt1RnAzEZiGNJB9m-HAAP1KkOGoSE_Y_1789060329
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 12:01:51PM -0500, Frank Li wrote:
> On Thu, Sep 10, 2026 at 06:39:30PM +0200, Ernest Van Hoecke wrote:
> > Hi Frank,
> >
> > Thanks for reviewing this so quickly.
> >
> > On Thu, Sep 10, 2026 at 11:26:22AM -0500, Frank Li wrote:
> > > On Thu, Sep 10, 2026 at 05:37:59PM +0200, Ernest Van Hoecke wrote:
> > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > >
> > > > Toradex boards route the sideband signals of their 24-pin camera
> > > > connectors to different GPIO controllers. Camera overlays which nam=
e
> > > > those controllers directly must therefore be duplicated for each ho=
st
> > > > board.
> > > >
> > > > Describe reset, power-down, detection and power-control as
> > > > connector-local GPIO functions. This lets an accessory overlay rema=
in
> > > > independent of the host wiring. MIPI CSI-2, I2C, clocks and supplie=
s
> > > > remain described separately because the GPIO nexus does not abstrac=
t
> > > > them.
> > > >
> > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > ---
> > > >  .../connector/toradex,camera-connector.yaml        | 86 ++++++++++=
++++++++++++
> > > >  1 file changed, 86 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/connector/toradex,ca=
mera-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,c=
amera-connector.yaml
> > > > new file mode 100644
> > > > index 000000000000..06e6836e1aa6
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/connector/toradex,camera-co=
nnector.yaml
> > > > @@ -0,0 +1,86 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/connector/toradex,camera-connec=
tor.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/base.yaml#
> > > > +
> > > > +title: Toradex camera connector GPIO nexus
> > > > +
> > > > +maintainers:
> > > > +  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > +  - Toradex Linux BSP Team <linux-bsp@toradex.com>
> > > > +
> > > > +description: |
> > > > +  Toradex boards provide 24-pin camera connectors carrying MIPI CS=
I-2, I2C,
> > > > +  clock, power, and sideband GPIO signals. This binding describes =
the sideband
> > > > +  signals as a GPIO nexus. The other connector resources remain de=
scribed by
> > > > +  the surrounding board device tree.
> > > > +
> > > > +  The nexus exposes connector-local GPIO function numbers to camer=
a overlays
> > > > +  and maps the functions wired by a carrier board to their GPIO co=
ntrollers.
> > > > +  GPIO specifiers contain a function number followed by standard G=
PIO flags.
> > > > +  A board may omit functions which it does not wire.
> > > > +
> > > > +  The function numbers are:
> > > > +    - 0: Camera reset, connector pin 11
> > > > +    - 1: Camera power-down, connector pin 22
> > > > +    - 2: Camera identification, connector pin 23
> > > > +    - 3: Camera power control, connector pin 24
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: toradex,camera-connector
> > >
> > > Name is too generally, suggest use board name, we got similar comment=
s at
> > >
> > > https://lore.kernel.org/imx/20260629074734.3643227-2-chancel.liu@oss.=
nxp.com/
> >
> > I saw that and it made me reconsider this name.
> >
> > However, I believe that in our case it is specific enough. It is really
> > the same on all our carrier boards, and Toradex specific. It's also onl=
y
> > for cameras, which is more defined than just "io". Curious to see if
> > others agree or if we should come up with a name for this.
>=20
> If some days later, you update hardware connector to 30pin from 24pins.

That connector is there since years, not days.

We have multiple cameras, designed to mate with it.

If tomorrow we will define a new camera connector (that is absolutely
possible), the new connector will get its name, maybe
toradex,camera-connector-v2, or toradex,camera-connector-22pin or
whatever that connector would be named, not just in the DT, but also as
a product and on the actual HW.


Francesco

