Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013019.outbound.protection.outlook.com [52.101.83.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D002E2F39B5;
	Mon,  5 Oct 2026 17:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222142; cv=fail; b=oOmxKFFrTXZN3/vpv6UhX11LTUS61o1xWxEUjIwmwmhjhRogGot2DbenixVDNSlSQwncaBByn8AfpNjdHdnfkYvQ0CqeTssc2noDWoqOqZqETVWK0MHJb5IrABiHjWMwHBrBzSQpXnj4djLNrIKDB7uKEopic+hw1Jqz0Xf5cnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222142; c=relaxed/simple;
	bh=vZFrx4aA/4s/hII7Wh/hy6e6ltV6KL2Idp8jvoebmGc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RK1vcG//Uzs9T0ngeUzg9uawdGRD3VxWwdlOiDpJRvZV8017u3HrFxuiwu4hoy7ZhBa7xVNWtQLoxoB7SWj2DyBtVur9b5ei8rhpDrtNMyRvfuD7MDA7Jh6aGOmM1bAo5yQBxbRdZ6GK5UwQsHaDlMrqfmHtfNvLV8rlRzwCJGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ibeMl9mc; arc=fail smtp.client-ip=52.101.83.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ibeMl9mc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPPkHAgBW3xHwrZHVQxpBjj4WSuDjrt+zNsneeMB0I2sO897HxC4A70m41fw3dwjueUubSN8mxheaCokgM/tz43rCwCOdB+qd+X/0QSJ5kyvRHX6SYJlK3oH++uoFKRA/Jd/l58I/ZWhvtL9IlJMS8aVqXWo5eZiAK8QsrFZqaweTikdAM1ahIl0h+5vNoWG5GSmVuRsanMutZL7y685Y13TGmFjOINYWkxrVFmFXF/yqGqg++KByyPONgZvzREoKVnWJWf+JGVkA8nJN3wNBxlZcIM2EVrHkDWMNA19WtGjXzcaBvoxvav5QXzv0Lyq29rJUKP4xBPkCQjxrTPPfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vboA0EU3E3eD8gME3TeJ10AzrROmtCm/U5k3mzpMhFU=;
 b=Xv+wHlr5rgpyMJMSbrNKS+2V5w6g6n8ykbh2b/6wQ187P1Osm7neIf8tPeJ/jaYmSLkU4b09WEIL3GDrC2Ie32Y/OllB1Vueav3Il2DKVR1L1P9qly/Vl6hOtMbXe+G2sf+8Z2g/kGgUuL/a30qlJdmimpn4+ckf4mR5LRN4irLB6VORZRZ3LuEJ0AL7/gmI3Xp1PMTjZTO7q9B7NYHlo1457M2ekVkpkjiobskHXUyPRN1utLBZRCCjLn5sk+d0BAxW3VbSt9eNrnUDzBpmnDM0e6teDb+t8sGiUnypI9IalSge5Ev4B5pwdbshaCTLTxogo+9ZhtN87DjWxTyX3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vboA0EU3E3eD8gME3TeJ10AzrROmtCm/U5k3mzpMhFU=;
 b=ibeMl9mclhQsV5rWYAmu1dXgTGf0hzM4o1ojv9LZuIGN6hQ9GR0uLrkkmhPESfecdQyqsd7DXLldSAQRZX69NdSafQln10Mpsnm4xgWKT4rU0ajrzIeSzOvbX5wfxeekW7DAygV8lfKNjJ3bHkMjaiKwB9lUdNMveEknnkugyXJDnHYc5xFS0tMrMTqE4tOoeEthwikQz3anRIePFb0A5nPwkDVtz7xiEcfcVLh1jyN6O104Mgc9LU8QWE4bGXjM1yW72tPSa5mOpxWpq21mT6nHOLo7Nzc2Oo/TedbQMN7cVkYucuOmy06HBvdDmKY5cyAfktCSxOdqTWpQObK1JA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Mon, 5 Oct
 2026 17:42:15 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 17:42:15 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	r-donadkar@ti.com,
	jai.luthra@ideasonboard.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	laurentiu.palcu@nxp.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com,
	kieran.bingham@ideasonboard.com,
	johannes.goede@oss.qualcomm.com,
	dave.stevenson@raspberrypi.com,
	devicetree@vger.kernel.org,
	robert.chiras@nxp.com,
	tomas.babinec@nxp.com,
	daniel.baluta@nxp.com,
	frank.li@nxp.com
Subject: [PATCH v5 0/4] media: i2c: Add OX05B1S camera sensor driver
Date: Mon,  5 Oct 2026 20:50:58 +0300
Message-ID: <20261005175102.2358881-1-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0P309CA0019.EURP309.PROD.OUTLOOK.COM
 (2603:10a6:20b:28f::29) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|PAXPR04MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f285234-e7ff-4bb7-6d4a-08df2307fe94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|19092799006|1800799024|376014|23010399003|6133799003|56012099006|10067099003|11063799006|3023799007|5023799004|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	DLlY1e9dkEPbkVnzedwtJxtNEkbuDPySevm97AhRl91nuGyV8yRXGySqPzNKlvFWZWTDyKnKt8UC4QoW7/b3wFE5iYPjdxS2G4JLxpdlh82zi/YfnCD+uWt754HXqWImvaZsveCT0FrUa4q52+esBMHLzJtCI22rd9fWQpEPej8hPFgSwRNHz2iZtRwu8avHBtMZ02OQeCqNra+imSc+UHkUewvlZtcYZCXi3CfhsNAqfMuQNrsDqPi87oHVds2bd0aHsFBRkiArAHrW/8aoXEQlhtkao5ekurXh5fZtgd3gQMps7iHpIcJQh6XHUJsrdEerUTAMaGu4OeTZdNLALksDV8IhNYDpxv/X9gVlMXl+OOleYJ+wSxmoDWkQngw+BbUAYtLpBrHeCIGFbQS70qfDlT3dF9h1sAJUXiyqpXyOMj3qtkAtVXhJVqw0H3u3gMHfn72GNwqaMsXcHuhZHqOLmPVtTTiMoUN3ZEArllbwvwkW56sRR98OD6c44vBO94GsJdk3I2PsJiIUs2oAscIVdmSXJRe6w/lJsAtZ4mCb4G6RX+92QGrq0jNa1BoT+8ytpkkeOfHUdrDStgCt2yOfIRA0JLhAa5ACxUkclomt99z3rp1+hRj/7bUNzoUIfrmfut2p7Jg77AbmKsB3KpLemPv6DP492/KXq0Z8QlY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(19092799006)(1800799024)(376014)(23010399003)(6133799003)(56012099006)(10067099003)(11063799006)(3023799007)(5023799004)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r7mjWftj75+7ynnpwAQLf97HihguL/E3/Ymmo5SkZH/7W6YnyVQZAINqFNNv?=
 =?us-ascii?Q?R60iwiZsMzAH7+nuOW3w5nP6bbQv5Dr5LfW70hY35KLq8U5tl0m+YvukTkSb?=
 =?us-ascii?Q?KG0zArPYjB/rcxwQfsCvGj4t1/x9s/9BpXaKe/XPBbueehMxFkbUhLlz8ZvM?=
 =?us-ascii?Q?2X+1Gj6gpWBMdcW3iRh9aBAkG8TKOzO3mXr1gr+kM1B2dtyUSEI6scxpmjh4?=
 =?us-ascii?Q?VGfTMEzQgERqMnrmAbjmwNlNkF1NJ6q1lx3zRLnUtubG7ubpT3RBn3lHK2+y?=
 =?us-ascii?Q?4r5G7oeD4/GPacB6gTZBvn2rSog23fKg9h4hV6QBg+OqDZvsbIZpK3MqeHq2?=
 =?us-ascii?Q?NzjnO8s4aMgwVgZlyb/CPz9k97wbYRk78FnRKQsxpCWSgpzX4QRE6kekpa/q?=
 =?us-ascii?Q?YovKVg3FAFblLdRFpaVaSt1p3Stx987n57/PLN8uY/2b/6b5bqHNp2fDCzHw?=
 =?us-ascii?Q?rT3FTVetQ4F4jguBbB8vb/eIBkx8vdYRfxkau0SpXgeHiLR0LcdA/znFMMTM?=
 =?us-ascii?Q?LKmyTB7bDBEUyylaN8wRATAO/T1PrMWaa6F3uOXXUxQ4u3IE2E0Jg9/2LKqt?=
 =?us-ascii?Q?mvwl8LZvV8DhqMbdooFyg/8IxtzBv+OxOMc+J11BSYOJk+QDpYJp+GM5uVr8?=
 =?us-ascii?Q?zcm6poXm8QDQmb90N47D3V1/Re/lo48eyr1sLDS/5mO6tmxdqwMb2uM8o2KF?=
 =?us-ascii?Q?Kz4dzIobkeHFqdd/j0AeH6eQLfEiLSX4s1dLKOwIuLbANmLy3hs3ulrSCj5p?=
 =?us-ascii?Q?wyUEBH7myV/VfaRnU1fZgO/zAs/whZrtwp/2NrYUWF6SsZ28tPvvkKZs1oWS?=
 =?us-ascii?Q?YfedEHQbjHiQDRerrLvy337pgZtimeCG9c33FSmr4sBx1C33s1GumaVKivMo?=
 =?us-ascii?Q?NxFBiEtzC0Q8+aWYDbIwkB5vt7ZO5FxVpN8SJ8UpWy4CSAqG2CmDspk6lkRT?=
 =?us-ascii?Q?D6juRCfMld4cWPZjHOx+yi2f43G5Bca8ARRQkAwhXA6kfsfAqgdFLnbXTrfZ?=
 =?us-ascii?Q?f8omifJJwpxT+AAZi6aPiil/qr1TQYUzP578JVLMare363eXFYJ94HsWXjQU?=
 =?us-ascii?Q?fcXB8E7wV6dO5DLpnFKWUnKMhoo9euOCNdb4ErR2Ps9Z7Ys2IRsJrxlqDeBs?=
 =?us-ascii?Q?oY35p+XygLncKSTHkFk7EdNC0D9sJmSqdFUVyyiVhZGoq1DhvCVPqbT5LoJ2?=
 =?us-ascii?Q?bqclXIC/e0egfZExoT4pC8lO14+Q8+pJnlgNVwlOCKBHvCIJvTrsqH0oz2Fu?=
 =?us-ascii?Q?Rdxp1G+w6f+Al1EiQ2yD6G4EhFfeDNjHBurPpv17dGkVqkT726GNhiVnTkc5?=
 =?us-ascii?Q?sgC+O6JalRrCY++da7CK7V7H6Oxusn3P1Oye/HAhjF/BkuxMokFH3Wo81xRV?=
 =?us-ascii?Q?oFrGFbDffAuK/egbxZDyjFjD+86LZmOaV73fYVuhO/m/uIxFzhcnMiFx0oIe?=
 =?us-ascii?Q?tl5gJQep80aYOBfYFvWzCHNSuA33m62wepQQWhBHR6gbIo56R/XzlS4/rxA0?=
 =?us-ascii?Q?DThykf0LS4uqIEkOHBJBg/gpT87AzekVunsRdTERIEJXnrWU/gRaG5cZN+Hy?=
 =?us-ascii?Q?kPA56Y5SM7ergLGyY940iaCOGZscwcBgjDKiH84viHwpMHlwp8wPhejLEqU0?=
 =?us-ascii?Q?6o8pDfvxgBLVm3/cJu7CKeGQRlHjAWTwN4qF6yrSR38W0GiSBVMJxaOzQWty?=
 =?us-ascii?Q?HKfmf68sEeQzeNaWRA4W9YyDhFa3mGWQtPm60aT00FSXVK5dEByQ7EEd8icy?=
 =?us-ascii?Q?IYQs0NtLIg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f285234-e7ff-4bb7-6d4a-08df2307fe94
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 17:42:15.4194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rFFQPIEh9MnlQQ8ljga+lnU2pXmA4lAARCdPHaB99Ol3R/l0insdf2clgcvNgYeTtdK+/EdVENKPkGlptkezQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8096

Add a v4l2 subdevice driver for the Omnivision OX05B1S RGB-IR sensor

The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an active array size
of 2592 x 1944.
    
The following features are supported for OX05B1S:
   - Manual exposure an gain control support
   - vblank/hblank control support
Supported resolution:
   - 2592 x 1944 @ 30fps (SGRBG10)

Support for another sensor, OS08A20, is added as a separate patch, using another compatible.
For OS08a20, HDR mode control is supported, with one HDR mode: staggered HDR with 2 exposures on separate virtual channels. However, for now, only one exposure (VC 0) is accessible via get_frame_desc.

Supported resolutions:
   - 1920 x 1080 @ 60fps (SBGGR10, no HDR)
   - 1920 x 1080 @ 30fps (SBGGR10, HDR)
   - 3840 x 2160 @ 30fps (SBGGR12, no HDR)
   - 3840 x 2160 @ 15fps (SBGGR12, HDR)
   - 3840 x 2160 @ 30fps (SBGGR10, no HDR)
   - 3840 x 2160 @ 15fps (SBGGR10, HDR)

The current know limitations up to this version (v5) are:
   - for both OX05B1S (RGB-Ir sensor) and OS08a20(HDR sensor),
     the sensors may generate 1 stream (in non-context or non-HDR switch mode)
     or 2 streams, one on VC0 one on VC1 (in context switch or HDR mode); however,
     only the VC0 stream is exposed, waiting for internal pads to be merged
     in order to expose the second stream/route; in NXP tree we experimented
     both streams and MEDIA_PAD_FL_INTERNAL, see [1]

   - for multi-streams, we need multi-capture controls, I will resume on RFC
     that I started on this matter [2], and which was also referenced by
     Rishikesh & Jay for ov2312 seerie [3]

   - for OX05B1S (RGB-Ir sensor) I switched back from Y mbus format to BGGR's,
     however this format is not 100% suitable for RGB-Ir, waiting for the
     common raw mbus formats.

   - for now we have managed to keep together (same binding, same driver)
     both OX05B1S and OS08A20 (nxp uses the same adapter board for both),
     it would be good to get a clear feedback weather this may continue or
     we need to split them. From bindings point of view, they are the same
     with one little diference on the clock range. From sensor registers point
     of view, they are similar, but there are some differences too (see [1]),
     from features point of view, quite different (one is RGB-ir with context
     switching, one is HDR-staggered, we expose 2 streams on virtual channels
     for both). Again, see [1] for a glimpse into the future of this experiment

The previous version (v4) is here: [4]
Since then, in v5, I addressed comments from upstream reviewers, various 
problems we found with it in NXP tree, and latelly sashiko issues.

[1] https://github.com/nxp-imx/linux-imx/tree/lf-6.18.y/drivers/media/i2c/ox05b1s
[2] https://lore.kernel.org/all/20250818155809.469479-1-mirela.rabulea@nxp.com/
[3] https://lore.kernel.org/all/20260925133001.2780868-1-r-donadkar@ti.com/#r
[4] https://lore.kernel.org/all/3df6d174-ce7d-40ff-a7e0-fb9e8a9ab435@nxp.com/#r


The driver was tested on nxp tree based on 7.1 on imx8mp-evk.

The results of v4l2-compliance test:

root@imx8mpevk:~# ./v4l2-compliance -s -d /dev/video2 
v4l2-compliance 1.33.0-5506, 64 bits, 64-bit time_t
v4l2-compliance SHA: 91dda32e4cc9 2026-09-28 07:58:16

Compliance test for mxc-isi device /dev/video2:

Driver Info:
	Driver name      : mxc-isi
	Card type        : mxc-isi-cap
	Bus info         : platform:32e00000.isi
	Driver version   : 7.1.0
	Capabilities     : 0xa4201000
		Video Capture Multiplanar
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24201000
		Video Capture Multiplanar
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mxc-isi
	Model            : FSL Capture Media Device
	Serial           : 
	Bus info         : platform:32e00000.isi
	Media version    : 7.1.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.1.0
Interface Info:
	ID               : 0x0300000c
	Type             : V4L Video
Entity Info:
	ID               : 0x0000000a (10)
	Name             : mxc_isi.0.capture
	Function         : V4L2 I/O
	Pad 0x0100000b   : 0: Sink
	  Link 0x0200000e: from remote pad 0x1000009 of entity 'mxc_isi.0' (Video Pixel Formatter): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video2 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 4 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test MMAP (no poll, REQBUFS): OK                  
	test MMAP (select, REQBUFS): OK                   
	test MMAP (epoll, REQBUFS): OK                    
	test MMAP (no poll, CREATE_BUFS): OK              
	test MMAP (select, CREATE_BUFS): OK               
	test MMAP (epoll, CREATE_BUFS): OK                
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
		warn: v4l2-test-buffers.cpp(2220): Cannot test DMABUF, specify --expbuf-device
	test DMABUF (no poll): OK (Not Supported)
	test DMABUF (select): OK (Not Supported)

Total for mxc-isi device /dev/video2: 60, Succeeded: 60, Failed: 0, Warnings: 1
root@imx8mpevk:~#

Mirela Rabulea (4):
  dt-bindings: media: i2c: Add OX05B1S sensor
  media: ox05b1s: Add omnivision OX05B1S raw sensor driver
  MAINTAINERS: Add entry for OX05B1S sensor driver
  media: ox05b1s: Add support for Omnivision OS08A20 raw sensor

 .../bindings/media/i2c/ovti,ox05b1s.yaml      |  124 ++
 MAINTAINERS                                   |   10 +
 drivers/media/i2c/Kconfig                     |    1 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ox05b1s/Kconfig             |    9 +
 drivers/media/i2c/ox05b1s/Makefile            |    2 +
 drivers/media/i2c/ox05b1s/ox05b1s.h           |   23 +
 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c      | 1329 +++++++++++++++++
 drivers/media/i2c/ox05b1s/ox05b1s_modes.c     |  213 +++
 9 files changed, 1712 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
 create mode 100644 drivers/media/i2c/ox05b1s/Kconfig
 create mode 100644 drivers/media/i2c/ox05b1s/Makefile
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s.h
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_modes.c

-- 
2.43.0

