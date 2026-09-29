Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011071.outbound.protection.outlook.com [40.107.130.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F503A3822;
	Tue, 29 Sep 2026 07:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790667053; cv=fail; b=pYvM5ICU5JY2pz40+mEjKlMA+ojCjjoBdKmwzPTzKSo03yigOjnsv8JHCEMPauRSHRPnKa0W9AttInYuvxAglFIn4+LQI6Y7OpsM8c9A88IjyNAI4crVtfbi/z6+cUB8k6qrt93syLHaAPFYLw8TWX7bfaS5w8iY/qeKfP2nBt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790667053; c=relaxed/simple;
	bh=0jTMvjfhyu9pUTelspHPktt1+3URXqYGLygczZyAnAI=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=l8/jSmWQA1yCB+ZGS7Vf2g0BRI8fiAFiTmAcxct0eKhUzUNMnaPl6J7A48GCLjuZkKSjeZlBbwpXt+7dEtmPDaQrkA8VZaP8eMc6iIPpk9SffXq8Fe63dSHKrze4wrIyx5cwc9NgX356S1atPytEIl/s0ZkslROSV8C5h1uDW9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=r8oSU2+k; arc=fail smtp.client-ip=40.107.130.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="r8oSU2+k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIF0wBJACT/nOhA+G/9V/yuPwwgh7BvGu/+wAJZvOTQ2KAPUO83NGv9ehmr0yY75EM9e0/aEU7JJuKlAH/H/h7lsXmWrHNeFrpOgaGuxawxkw0jYkoR2U2Q7chV6pXFWBnXqF43l2Tt1c+InxNVYNoEaM9qL29J5fyTB46R+JU7KO+kmQwo0a75iW8zug+ESaycJAS4jEk/w4ywrUjcTWimmNGcmOTQIdQZk0HCNMmrt2HewS6l/QaFGBrBp8EBQd5NNqlbTpMNtQaN8ujXC0ZKe4LUtqj/imivpiwcF6LYj8I/GzpYIQGsRCQEzSV+3dXiWfYF9epHW7GQBSbi/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRlN/4Zd6uvtWpNC2sSCOef+x8tqwHQEgxl+zJ3J/10=;
 b=cJSZPZ9w0a/tgPt+JD9glVH2N80NBrmX2dURxuPt4A0vSriqAGIWswpqoxd/oRZiIZHmNnZp/pDS5TP0sEOXFx5WcP80qQc7Iuum4jcAD9LLr+qxrK36k7bLkMbpZG27SaZcqFw1VEzyyq7QZ8kifnkl9v2xs5j8mSf5VjFIBpWXWdeosM67GTZCQMH0oDohOFe41XfsRkW+GNuUKnF7MhWu64XFfV2krpyB/qibtOFGXeGdiQCU+ufJu3i9qsOVN0hnQ7mk3xD+ZTyTcRSjJ5O8caQwNQHXCIU3hmxokYzvr3sLMTSBhmxCqSVF6ZFXFuj4dMYr3ylqFTOi50wdtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRlN/4Zd6uvtWpNC2sSCOef+x8tqwHQEgxl+zJ3J/10=;
 b=r8oSU2+kZr5dcMEmNhfdtJrBhuXV1QwA0JOm4WIVeEKpezc1alxLJ+HA8bG12G50KfHWchj9RQjpUNjwi/UlF3AxhkNBO9l7dRqcYWOQH+5CSEKqq6JV1MKIIO3Gp+sD68j6Kf9umT8rQGFtJRcrZG1k605H4Gn9IVrk03EYRmmegigiHUPFGR3jgP0I3jNZL1iI0JCrqv9/uBgkRk1FmXgrzbf+CmqNgASpQgUSySKr4XQd0ro6a0Qs7kuz0CCaLKz87KYgkqABLTewxUrf7gNig9oge7a6qrqm+5wymUQG/8yKhZum0Ut8sYB4rXdjTqjUvamU335PwbEcEF4fYw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB7PR04MB4698.eurprd04.prod.outlook.com (2603:10a6:10:1c::21)
 by BESPR04MB299202.eurprd04.prod.outlook.com (2603:10a6:b10:13f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 07:30:48 +0000
Received: from DB7PR04MB4698.eurprd04.prod.outlook.com
 ([fe80::c571:bdf2:afe7:c03c]) by DB7PR04MB4698.eurprd04.prod.outlook.com
 ([fe80::c571:bdf2:afe7:c03c%4]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 07:30:48 +0000
From: Ming Qian <ming.qian@oss.nxp.com>
Date: Tue, 29 Sep 2026 16:30:28 +0900
Subject: [PATCH v2] media: amphion: Add V4L2_FMT_FLAG_DYN_RESOLUTION for
 VC1L
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-flag-dyn-resolution-v2-1-ef29487f7215@oss.nxp.com>
X-B4-Tracking: v=1; b=H4sIABNpu2oC/32Nyw6DIBQFf8Ww7jVAkdiu+h+NC+ShNBYMV43G+
 O/Fdt/lJHPm7ARt8hbJvdhJsotHH0MGfimI7lXoLHiTmXDKJZW0BjeoDswWIFmMwzxlH9z15gw
 XiraKk7wck3V+/VafzY9xbl9WT2fqNHqPU0zb93Zhp/f/YWFAQQijZVUxyUT9iIhlWMdSxzdpj
 uP4AEXgiOPKAAAA
X-Change-ID: 20260608-flag-dyn-resolution-f39fd24a0ba2
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Ming Qian <ming.qian@nxp.com>
Cc: Zhou Peng <eagle.zhou@nxp.com>, Elliot Chen <elliot.chen@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, linux-imx@nxp.com, imx@lists.linux.dev, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ming Qian <ming.qian@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: JH0PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:990:5::6) To DB7PR04MB4698.eurprd04.prod.outlook.com
 (2603:10a6:10:1c::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4698:EE_|BESPR04MB299202:EE_
X-MS-Office365-Filtering-Correlation-Id: cf1d48a3-2d2a-4214-b9b6-08df1dfb9507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|1800799024|18002099003|3023799007|6133799003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	/Cwr+ubGd83eD1tcVJAYJtCjylpaDjntB0Gfq51W49Gdhg6Jjtj8DC5rCyZmc2BmhG3wZ4Aw/4FBIY1vsDlj3yY7VK45FtuHfDYT6N4KeKELla3ZbOWknKNt2NMJjaZ3U3QK/nVjwYQs7Ti7tyutoZdgJRiGyq2oW+85R4CK/MQ0KoQXbfk+nX4D6dcmrPbkV96a8p4QFRiSoOI5dBnxKhKY7OAeLzQFlGasNUm/hQhcNhNs65tDqzgGMjvJ4xnjqQTtaz3yQZEO9vFDtEbQ6ZLL6U+rHrZsI3zzelGaajk+w6MK1THRHLGmfSx/RuqYdSQEUBMMbAXVxgrPyCxrj6aIMboSdcGPZE8XJ5+lsbcyf9IQOv7XLQH5tJCXyHFel4P8zinnRWqRYqbNWd5HJf7Xin0m7m5Zz3pwM8eGYMd68YGDnlxqz0FNmf9dFrJfH7hWFVNu6e7CXMYTvZZGcWK9/rXs6txYdq37UNDq4BWiH5XndBSYc6nEsYzPd/PLowBB07+97udFVza5E+63pRh9daEqHtpmX8hJ4SMIN3KkbXROOknDEJpcNYF3r6DgBj2a73w+XcZnRPYYEnCsn/dsNk31CCGR3oUWugAumaQKUkXzUGYt9wKPEkz/VN2p
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4698.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(1800799024)(18002099003)(3023799007)(6133799003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnBaWkZVMTFncHc4bW0xY20wN3dJU3plbXFHZW4wUk1oeGk1ZnNVaUtjanEz?=
 =?utf-8?B?ck1mQ1cxTVVDcXBRMHJ5RWdPeStPbFdTTk1saW4vV3VnOXdMamRqRHl4cGZF?=
 =?utf-8?B?Sk41eWpXR09sYmVid3RUWm0xUE9NaVNRSElQYkhZNzRNOVprN2VNQzM3bFp2?=
 =?utf-8?B?bWw4STZsVWgyTWpST3N6SVE4cWI2UmtDbmJJNStNVmx5T1BLSnhablBTMlhi?=
 =?utf-8?B?amthd0UwbFFpVGFxSktBY1lnbDVYalErempIL29aOEFabkRRb0c3YTJ1V2Ex?=
 =?utf-8?B?YW00V2NaRFloc3dnSC9xdTZ6ZThJeUZZOHV3eGR3ekJxKzlraEdYSllYOC92?=
 =?utf-8?B?SGtBeE1ud0pDQ3F6ZDVzcmZybE5mWG5OQUJiUHpTNGczbklhZWcrOGlUb1Rn?=
 =?utf-8?B?ZXpZOGttY3J1bVI3Sys4dFBaY1o0Q2pVdmNxUEFWYkRiS0kxcWhVaXFNTjRW?=
 =?utf-8?B?MzEvUWxGZVBIYVlUL3ZiRVRpc3l0RzRJaVl6NTMvTlRoUmJrcDUwVmRnVUhS?=
 =?utf-8?B?UExYTzNGNVZET2tBUEdpRExDUUVSVnJoYW5ISEhxeGxyTTY1aWw2TUhHNlZE?=
 =?utf-8?B?a0hVM2VhUWU4SzVUTEVocnJpSWFDdkREV25MMXl3cVIydHNDSzVyUmZleUIy?=
 =?utf-8?B?RU5zZkhPQ0JQWHBDeXZEZ29XSFlXNTJvY0tPZEhZY2R6QXFQcVcxaGwzQUJv?=
 =?utf-8?B?bHdBYVRjMTZwdzZmVytIVkRUa1h0T3VXZjhiSnczWHJkY3dOd1NJemR6Q3pU?=
 =?utf-8?B?RjlKWHdSYzljSWNVMjhHZzBBSUtGcDd4ZnJRZWFEZWZNNjJldFloT0V2QlpB?=
 =?utf-8?B?R2RPNDZ1OWtHNVZxeWFOR08veW4rRlBBYVIzZHVML3BtS3NZUTBaUUdtSWhB?=
 =?utf-8?B?R09qNHA2T2VlQTRhaVhDbEk2WGV5NDNvVm5QQ3p5bnIyd0MrNnU3Y3FuaE1Z?=
 =?utf-8?B?Vk1YWVJFOE42LzQzazNZbUNzbkFrS0h4eTEwVzIyU2h6TnJoUDhWUGhMbGY1?=
 =?utf-8?B?SlN1VmVLWkFCUTdtZ3FQcXBrMmN0WGcrWkl0RzRsTUN0N0xwM1Q5RFp5ZU5B?=
 =?utf-8?B?ZUg5OTczcElNUU5LZS9tUURFUUtlcW1DMmlGR0d6Y1dhYkNRaXRmbzROQmFu?=
 =?utf-8?B?VTVjdE5wb1dTSnFNcDZWS0hyU3V3T2hCYzlEVkxrWlEreHl2bU5YTXhva0lG?=
 =?utf-8?B?azZYcXBRTG9IcFd0UFR4MGg3cFZzaUNPa1dlL1ZUWTY1ZVhneG4zeWNPanAx?=
 =?utf-8?B?TXhyZEtDbHVvWUZyWmxMUGtzOEV6VUJEeEdob1NuZlJCcXhOZWtWOXkvV3Fp?=
 =?utf-8?B?bUs0WWJmZkgwcUlyc05laVZtaFBYOS9xOGpFRVV6djAwblpORHFvM3V3c01O?=
 =?utf-8?B?dVZ2R2NCbDMxL0NVQ3RtbmtkbkpyOTdEWnNka3dFSUJPbVNqUmxwdnRsTFBY?=
 =?utf-8?B?dktGYllQbzdBWVVlSWFrVFFac21sTTA0TWRQOVZUc0NwYkVrTU02TlI2dUcw?=
 =?utf-8?B?clNsZmc2cDdzVm0zSExkV0VOeXkzNUxWWW5VaGl0dVl5clYvd3AxemRGY2xI?=
 =?utf-8?B?ekZZSTFWK05ORmhVaGxaQmllMDZXTGlkczBvMVFzUmJQSnFic242eEZxc0RS?=
 =?utf-8?B?Z2tta1BVM0RJejc2OU9uR29weVJWMmRhK2txckFGNVd0Y3JGeXo1N0Ivblc5?=
 =?utf-8?B?MEJnT0plV3l2L2Q2WVJ5eXRIYUpLVnhrT3NCUmZBR0hxS2lhVnoyUjhjbzhJ?=
 =?utf-8?B?dVJNKzNOdGJES1haUG5nTnRobDlsOXozdk1QZ1Fqb3NYd2hpZFNaQ29PZVY5?=
 =?utf-8?B?VERxWUZSQ1o0MG1CbldmM1cxcmxUcjM4ejZqYzVFbEs0UzdETE5NSGs3TVZZ?=
 =?utf-8?B?a2FiV3QvRk5JY0tYcTFXK1BkSWpFZWYvZmZud3Jub2pUQXZFQUdZNHR5bWky?=
 =?utf-8?B?UW55MzRNT20xSlp5dkVKOVhqOHpsMnhCemV0cjhhTTJyejVKNUNGaHdnMzI5?=
 =?utf-8?B?ME1TT1lWbStoMTdiNlZMWjd3TUlUaFU5Q3VMMEVMMjNLaGhLOHVnaHdDK3pn?=
 =?utf-8?B?NElMcjZYa2tQYmpnZWsvalJ5NUZ1N0xUWjJjcGJrTGZRTjlyUEdjeTNuMWhy?=
 =?utf-8?B?ektXWS96K21VUlNkLzh0Z0lrM3QzRFFyUThadFlXQ3dOTXFxQ1I0SjhiNkRZ?=
 =?utf-8?B?NGJTRHhJSFF2MVQrVXkrcjRWOU5EdzhkbWF0TmhoUTlCYmc3ZE1Kb0IxaE9L?=
 =?utf-8?B?NFB3a3ZZRDJvaVdrK1lucG05dTFlbk85anVTVitBdXpST3hBczNMNWVzcmt4?=
 =?utf-8?B?dU1hYnZpQlBLZXd3YVFya3NBV2lma3YyZGNQM3hpOTFtR3oyOE5XS1l4UGt5?=
 =?utf-8?Q?YVtS4XxIwf4dVzY8uunjMX00Q54uU81znZR41?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf1d48a3-2d2a-4214-b9b6-08df1dfb9507
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4698.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 07:30:48.6761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVsSV0VG2ZL/njYtlBFRZZl6jw/1yP0fSNTgc82E3TJ+1uBd36JCrhpDHpvZRd5j8O8h/8T5iEysE3UNMNQLgS5Ju4XKQWnKW5wFRF9BXmdJNQEJBn0EDj7jkD4jcXFP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB299202

The amphion VPU decoder always emits an initial V4L2_EVENT_SOURCE_CHANGE
event after parsing the resolution from the stream header for VC1 Annex
L format. Without V4L2_FMT_FLAG_DYN_RESOLUTION, userspace (e.g.
GStreamer) cannot determine that the driver will signal the initial
resolution, causing it to skip waiting for the event and fail to set up
the CAPTURE queue properly.

Add V4L2_FMT_FLAG_DYN_RESOLUTION to the VC1 Annex L format entry to
indicate that the decoder will emit the source change event during
initialization, consistent with other coded formats supported by this
driver.

Fixes: e670f5d672ef ("media: amphion: only insert the first sequence startcode for vc1l format")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
Changes in v2:
- Drop the documentation patch. Nicolas pointed out that
  V4L2_FMT_FLAG_DYN_RESOLUTION postdates the stateful decoder spec, so any
  driver setting it is already required to follow that spec. The
  non-compliant drivers (coda, s5p-mfc) are pre-spec history and not worth
  bending the spec text around.
- Drop the RFC prefix, as requested by Nicolas.
- Link to v1: https://patch.msgid.link/20260608-flag-dyn-resolution-v1-0-44dc65516148@oss.nxp.com
---
 drivers/media/platform/amphion/vdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index a9f0521f2e1a..75808482d090 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -136,7 +136,7 @@ static const struct vpu_format vdec_formats[] = {
 		.mem_planes = 1,
 		.comp_planes = 1,
 		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-		.flags = V4L2_FMT_FLAG_COMPRESSED
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION | V4L2_FMT_FLAG_COMPRESSED
 	},
 	{
 		.pixfmt = V4L2_PIX_FMT_MPEG2,

---
base-commit: 2dcdfb625c3b8fe87454e19dfbc54b3e3f0ad70e
change-id: 20260608-flag-dyn-resolution-f39fd24a0ba2

