Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C520142254A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.104.109.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243049; cv=none; b=kyM6HkFsjM8UaUTWBayD8TO4xKOq3HCBa0P69Q6NFyGgujsv6y7YIvX832H62V+kfgppWs9oQ96wBULUXuOyJN2IP1FvWMEfodk2e5ECKnvnQ37imiA9Hf2OaUi30rCFG93WJFVcw5ZF2gFZtndFi+T/VQa+Lh1bpvqOBeKvLTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243049; c=relaxed/simple;
	bh=HFYAyd4R5llObt+kQfPkA5ON4Erbz886AmkA+AaAtZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type:Content-Disposition; b=R8Y+huhgmD0Jix282UXR2dh3AfYgGUj9sC9A1J8lKQvIMBSDnPbTM5kMLGBnrXsvWgJbBnUaTBSBGjQuCXyUNPYJEFBa2k4URmAraFday2/d4k2+YmD/GPg+EHN4LiBhXxUqeHwFhMClRpV16eAMkq8+hQhnM4mUxGMMWBDnfwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com; spf=pass smtp.mailfrom=toradex.com; dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b=mjLBpkMM; arc=none smtp.client-ip=194.104.109.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toradex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b="mjLBpkMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1790243040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HFYAyd4R5llObt+kQfPkA5ON4Erbz886AmkA+AaAtZ4=;
	b=mjLBpkMMnv3VcaWI3rrOmjvGt7+OyUxnb9ICIscOI0y+HLbBdbv6fa1S9/GKiKTusMRk2u
	GWohByGeeFbCNlYhCE3FOubDfDZOd9QZAw+0CAZh2MXm7JPwRCi/tSqtoRq9jzYxXbNq0J
	TJ6S5FmSVniH8AMGoZg9xW4FD0IekYI=
Received: from ZRAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandnorthazon11020086.outbound.protection.outlook.com
 [52.101.186.86]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-63-GZYctS2oOsOh-IQLgA6Ffw-1; Thu, 24 Sep 2026 11:42:28 +0200
X-MC-Unique: GZYctS2oOsOh-IQLgA6Ffw-1
X-Mimecast-MFC-AGG-ID: GZYctS2oOsOh-IQLgA6Ffw_1790242947
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZR0P278MB0155.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:33::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.18; Thu, 24 Sep 2026 09:42:27 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 09:42:26 +0000
Date: Thu, 24 Sep 2026 11:42:24 +0200
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
Message-ID: <arTwgIrjfMGD3I9B@francesco-nb>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
 <20260910-verdin-imx8mp-hmp-camera-ready-v1-3-3c9349ecdb9f@toradex.com>
 <aqLaLmz7n31P6igy@SMW015318>
 <prwghb3ftrz5xd3hapxtlv2o2gm5xmuapnpz2h7fqulf75phqz@lk4yiaepormb>
 <aqLif2zrrsbYd5sM@SMW015318>
 <aqLk5UAv-j39Jxd3@francesco-nb>
 <20260918192447.GB1465432-robh@kernel.org>
 <178981707848.1761404.17065871878122418287@ping.linuxembedded.co.uk>
 <arDZoulyKIzVj-73@francesco-nb>
 <179023382707.1723501.12070631258057963152@ping.linuxembedded.co.uk>
In-Reply-To: <179023382707.1723501.12070631258057963152@ping.linuxembedded.co.uk>
X-ClientProxiedBy: MI1PEPF000008C1.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::437) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZRAP278MB0495:EE_|ZR0P278MB0155:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ad309fd-2dd2-481a-0892-08df1a20249e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10067099003|56012099006|4143699003|6133799003|18002099003|22082099003
X-Microsoft-Antispam-Message-Info: DK/epuPjwRhgzuZ+8NpaElwqtgMOoJvCcFyOgqbMIvTpSwNfk05b4JOuu/ixr+Uyg/M4bt5ijqg6KRo3yahzB/oGMDcHbRG1roodU0xxR1h+LDhMFeiqjSTE6PipAvBOCtDaFgZmPAat3EfeFKxAgveeyiWcED46LLcnXVDVDhcZbv/w4Z1dvvULj3J6MpFUoTp2LFk4aK4hUbhTazzzRGexBRDIxRRfc42jbANv//TGLmCnnOxxltbwG1k5vMt382kQ10jRhITIiF4ETggRx9qWF8BEylwdL5udpFN2sJ8FKc/pIkv844OO4Xvj/xEnlmk4vg/07qhcYAinMbxQsJf5sEWzAOCThsLHKqphwRPvJxsVZ/MY5mNyOfq3235nRuSTrfhenhtFBWSFNqYAQv4ViHirdI/fF/cyc5lAwpCVt6rbgUqZixyCcd/VQENLKcI4CDALKp2+ymejpIV92TR+Ta+vPhtbcdb6ZZBfyZgXORqf9YLEDPlV7bltXjq6OxZ8/81tW6hJwZYdTUtxSDzdcZlKs3hjVZMaU3IlGfn8UEvSiV0Hgj7gi3q4wE4WeXybdKwjTFoCM8n+wSIovhj8PS/sjz/JR/6rQt6Qb3KDEsunAmAeWgsI+pG1OTcknwyKSZfZBIkQou7EhIuLAmMDzQ+sGXwDibNQpjcOwNY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(4143699003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nDAV1P+U46pl48emK1xvSxFY1Jt6GFeSQsIYiXpTxx8tWnCRs9uHsc8TM65e?=
 =?us-ascii?Q?HuJEZhSZk4lw7GJWkR5Khnm9UNrL0fMCDvZMS9+xMhUu2YrBYjo+3RBKEFdL?=
 =?us-ascii?Q?Zlu6IXdnbWIoocfB7V/+wYhweG04dmWvw6rptNPz2bHdVhs2McdiqO5+eCxz?=
 =?us-ascii?Q?obDq6pZZFu90zz2k6D/kFADHZz95vsOerQL9T7bcH3+KnMP9iFwqXwG0OVYL?=
 =?us-ascii?Q?E30bo35W7DAti5OihJB+V4L+acv4FqIeZYkpFxn0QdSlsjd2MEVQnJRmXQuZ?=
 =?us-ascii?Q?/XC6vz4WwrGY1zN76VZG6rVptAujzWqOjfbAm3fKRBn8pFBbqLyIvWgUgyr7?=
 =?us-ascii?Q?zzw8dWE7dUAMDYBS+HyOtvIGqlyKlmcDcn2rwqJ/35dyTLzfge9By14/OhLG?=
 =?us-ascii?Q?VjFoaQGc9qhvrVYkSieYYqg8A+UJdhaguAeDuXf6a5UwyLfIzPJMKvxg3YPE?=
 =?us-ascii?Q?jrUjEd6VZRVagQYWi18UhsrajA3a8rkZB4iLL4BzwNR7wPl30ihUjKkbCyg4?=
 =?us-ascii?Q?SjIkj4B53Ib+ZlsbrBDxo/GzfO3yaIf2y/ZLjmB1kDEcOkm1z8+45RDC+227?=
 =?us-ascii?Q?FbeEkpVcJfNgTVGFfrbpjzuHJq+dQEumriJ+AVxxm+4rEWopOBg/V5iMLWPe?=
 =?us-ascii?Q?veOek4VohbeM1XErAQQ8Bt94t9CGk1NAwLzqUoBj8KcunmwvSUmGhQDz/enl?=
 =?us-ascii?Q?0GZo3v/kE3pdV/AcQuuY+c/uoatQvpvEQugmh4lkR+QV1EozMJZpyNxJp4bT?=
 =?us-ascii?Q?7FKmjJpjjt+1kwEcHy7QMGV9wKv7HKFL+2dTUblTiORGfgOVC/l4eteV0fms?=
 =?us-ascii?Q?2+IkOVIiNe89FFzxDn2DwY9TejrIJdXP28KjoGKTbkmPy7wNtoBwAcPD+6Ls?=
 =?us-ascii?Q?uWYY3RZsmI/0RNJGcDGyygPyf47ToI/H520S04PWTpBsbLx5NBOotywJyrI0?=
 =?us-ascii?Q?d3VFefsr371R8bDaFE0yLPpUxivOfRa7/CpCHez6S6VhlI7T/3rsbbD5RFG+?=
 =?us-ascii?Q?SE9qFgsHxkJWrkCg3VwObHnA3TURT/pqq0COhzUmLx28pvjtv4G3oa6g2u3H?=
 =?us-ascii?Q?r2qGgRsRMAGMPNRrIhM1r1eQYRaEuwXuE3INL1CfxfKHzOSpnwKBjOilqXuQ?=
 =?us-ascii?Q?WbymLnfL024q32L9JJnwl9pZPsvAf3Y/szPFmM6+FSnD3XP9FtrYAvls8bqp?=
 =?us-ascii?Q?5LapqOO5gqEb8ZOteckRCuV7/rBPMxEPQDYlxyDyo+MbiflceEAsRck0IAQt?=
 =?us-ascii?Q?/s254Om+J6QSE9pn/ajiS6LOHLXJGxdpCX4DdBr6MKivrqIJkJPyHsBMrNS4?=
 =?us-ascii?Q?cIFup8c6Eq64UO2+HqBsD9kFWO8smddFH4+2vhFPsC3+wTQOVSU6Mp+kMOyw?=
 =?us-ascii?Q?h3ws1cmrdVW8Rp6x5nslv7576CdFDyYRfxaqlNhqUpLu671blaZLupftjVNh?=
 =?us-ascii?Q?WcsV4XnjXeNRf7XeV9GJbApXjE4yiz+xyLfwhTv/Xqtnz4WLkRRUh5TfPXtM?=
 =?us-ascii?Q?VNkVOob3IPjEezfSynkBq4MUnvtGAtYy1U2jD5gGR9hwz9h+xvM0aNSzoOjl?=
 =?us-ascii?Q?wDvsh44gjpYdjCD3Om2TbRe5hZ++cbW7zeeICGA5CzwEJEdYhSwXGPgwYEGO?=
 =?us-ascii?Q?v5zhSTcHXQ6awg4/QVHHz46xMrQP3o0f9aKOmPj6kOMQHdSHCztlQ58S5GXj?=
 =?us-ascii?Q?XNVi12CceK2xKXC0euVeSHZwk62aL4msgzjKgDDl5UGd+5AFQlnvPDey/fT+?=
 =?us-ascii?Q?gDvAelZ9DWBWDg4ZmTox5pUorJWgaEI=3D?=
X-Exchange-RoutingPolicyChecked: ZpkX8VZB1Rm34l7o3Jx+BAhpp3Rd1gHPncl/lO3z4Ml6yBQtyOWSutD75o8zHpWxQO6jcOIS232rM4uXTjvbr3NSMaTQ4VPXloZCX+WCV9v7KoGl01M024borGsBnN9zPLxYcS/7cYwqEjWj2prWeuyvwI3TTUWeVjYuFBHI+lN+vrQoUzQju3HZ6fCJingIzqEXG2EKcQXcEMbu+DT7ewJ2zm700/xX64X7WLeqajTqxLt9bFS+1stmHbXdBWj61I1B9qNK8W6IqdifYaZ7sYwwSdDO7YFiyNsx7cd2bgwQbrm2x4QHVspBQKWEzzj9o2St1jwA6WfqbU28iHzR0g==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad309fd-2dd2-481a-0892-08df1a20249e
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 09:42:26.7688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3qlpVhsEgyQVK50gz+uOUfXNzEZIpWLdr/6xJceHyK+6u48Y9z1ty3qGlXueK1fLD9gyLCKOtN+nt0dtQOtlDZjPQ5uN3oZfgKJ954eolpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0155
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qv6r7grDl3IcQ2mKRlGuYui4ffR8yKvVUEGFNoPdtFo_1790242947
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Kieran,

On Thu, Sep 24, 2026 at 08:10:27AM +0100, Kieran Bingham wrote:
> Quoting Francesco Dolcini (2026-09-21 08:15:46)
> >=20
> > On Sat, Sep 19, 2026 at 12:24:38PM +0100, Kieran Bingham wrote:
> > > Quoting Rob Herring (2026-09-18 20:24:47)
> > > > On Thu, Sep 10, 2026 at 07:12:05PM +0200, Francesco Dolcini wrote:
> > > > > On Thu, Sep 10, 2026 at 12:01:51PM -0500, Frank Li wrote:
> > > > > > On Thu, Sep 10, 2026 at 06:39:30PM +0200, Ernest Van Hoecke wro=
te:
> > > > > > > Hi Frank,
> > > > > > >
> > > > > > > Thanks for reviewing this so quickly.
> > > > > > >
> > > > > > > On Thu, Sep 10, 2026 at 11:26:22AM -0500, Frank Li wrote:
> > > > > > > > On Thu, Sep 10, 2026 at 05:37:59PM +0200, Ernest Van Hoecke=
 wrote:
> > > > > > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > > >
> > > > > > > > > Toradex boards route the sideband signals of their 24-pin=
 camera
> > > > > > > > > connectors to different GPIO controllers. Camera overlays=
 which name
> > > > > > > > > those controllers directly must therefore be duplicated f=
or each host
> > > > > > > > > board.

[...]

> > > > > That connector is there since years, not days.
> > > > >=20
> > > > > We have multiple cameras, designed to mate with it.
> > > > >=20
> > > > > If tomorrow we will define a new camera connector (that is absolu=
tely
> > > > > possible), the new connector will get its name, maybe
> > > > > toradex,camera-connector-v2, or toradex,camera-connector-22pin or
> > > > > whatever that connector would be named, not just in the DT, but a=
lso as
> > > > > a product and on the actual HW.
> > > >=20
> I can imagine some connector updates might happen if(ahem, when?) MIPI
> C-PHY gains any popularity on industrial / SBCs / SoMs. Perhaps even
> sooner now that you have Qualcomm SoMs on the Aquila IQ-8275 SoMs.

Yes, I agree that we do not know the future. And changes are going to
happen.

Aquila IQ8 is going to expose the same interfaces than any other SoM
compliant with the Aquila family specification, and the camera connector
is part of the (already existing) carrier boards.

Francesco

