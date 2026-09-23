Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013001.outbound.protection.outlook.com [40.107.159.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A89248EC9C;
	Wed, 23 Sep 2026 10:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159755; cv=fail; b=oRKGkQBwC6435b2RFfVSa4gKgESKgTVaLKEC5QxGyQEs0NVovGLt/wA+VGnKpMhtSsqsqKl54zj4y7DHlehhYNO8aemhIo+o1gjJTbLvgmS8ePi4o+jrTF4uAsmO7XZUGYYaisk/fyA7y3Tv5nqGDR7E1Jo4UoaFgYZVO1vZ99c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159755; c=relaxed/simple;
	bh=bGyhgwTOvKrAQrZwukE8rPQ45U5I6+z9cwB8UyFAEJ0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=txKxvq8GSsjdrvpl3Wzm/zPQI9gJz8WcYt0hw+xIIWiY8+TKUWeQJjmB5RiVBQmQjZPWUPRGwSoJEQFRQEThHjAIzqWFckDUk0H7JdtN80xjU+H6tnBbIqS+15xqrIPEewN19eLfB4rIWEbg/85Xdvnfykq1KT/RZPm9uK6qFh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PtWD/IvP; arc=fail smtp.client-ip=40.107.159.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PtWD/IvP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAKKAnoZsqNeN82rfNEJRVRwGNWyHfAb3aXvQPML2+XJxR54ILCCd5l4BKilJ/ZaHvnPEL241NeALrab12x5X1DvrCxL5/SdmkLJlUW04DR5Aljzz1Vx1N83vP2S+IsbYuvSfJLF6T6WVRVEH3cfO6RvKnMd8Fv3ZvAboTDAH9ho28tg6NkM5QH8mN7nOaEpGWG4OipMWlKxZ1CvVoz2NN/FnxTi/sQ/E52PuAZ3mFTOnunQ+CbeKTeP21b6rgz8ukiYY1+ukv/LSojL+YzYFC9ELEEKixGHeTyzZj8NpsePWp0RyVbf1FSBgcEqW0LsTYOErluU/5G8SIeMutAx4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jp2Lzye0/Z+XfKBt4UakqWh0NUxqmPHo0NyW5OxbkXA=;
 b=KUUV2KtfT3pb2nUamtaNz6cPA0J99dRkT3sLiwuLHcEZKd6l694FGrgW9ycX1wKRZGgeROKk8cviMCRtqBIhoUQsqQ2RpYB6yYks9TgJ0vKt93gilcbnZEKVL9OUtbGIEz+JVBYZDLx8RJd6VixJ4tkE0Sm1AX5LT2zXBzqaTk+4wKORyWT1jnWGk5KsTomGmUe3hqViX0ohloA/ooN4ZDKxxwP1XLZAmR+zJ7klzNRTHflrKtad5B+NztkhB3MaEbc6vWEfCP7TbS2CG32X6j2k1MpN8A8nCnMjaEndZIpNKaKatugpdl15XDLMs5tjI4qAhFRXo8eWUhH2x8fS+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jp2Lzye0/Z+XfKBt4UakqWh0NUxqmPHo0NyW5OxbkXA=;
 b=PtWD/IvPJm9M3F+8kb3et4LPZXgYuWq50Adej1aNNTXReWa9K7Hhv92Y9ioBVL2qgZxEHGkc2pbfiZZVz5w8Xcegsm4zAABr/8WgZCuYHgFSEXffPUv7fG/7nUv3nU0IptoS5KPnR8gnh1RVy9x5XzshuUq6xLfch5jo/4MWya6MXa03dJNB9dVSH10sDBmbHeB7B9BI1Ym1npbPeGf+mrppJHJgEnqFLKAuyh/rksBsUdogF7tiR5ulKsvPtAfGfJNSQrVJwjs3DF/Hh30OW5VZucrUNhEvAQ0PRb26L04x4IWJXdFypTzOW+jnnhC9pxxBIEeFXT5db9Krv80npA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AMBPR04MB226274.eurprd04.prod.outlook.com (2603:10a6:20b:75c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 10:35:33 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 10:35:33 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Wed, 23 Sep 2026 18:39:45 +0800
Subject: [PATCH v2 2/2] usb: gadget: uvc: refactor video cleanup into
 uvcg_video_deinit()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-usb-uvc-fixes-v2-2-844e04a4a4b7@nxp.com>
References: <20260923-usb-uvc-fixes-v2-0-844e04a4a4b7@nxp.com>
In-Reply-To: <20260923-usb-uvc-fixes-v2-0-844e04a4a4b7@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kai Aizen <kai.aizen.dev@gmail.com>, Michael Grzeschik <mgr@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Xu Yang <xu.yang_2@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159986; l=3734;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=+AwygW4z9SGKJPULpsM/LzxkVYdzsckLRmMqBmIxdj4=;
 b=VVEfs1O/R2wiookVgqjxI5VMlWHbcuT2DoLyJzKgV3/SK1HqP0SYLWriJFgMZuCYZiMP3C0cI
 ZQ5NpH4Fm8HBl8ZnDMKogV+mw6beqoxvVdEI1DUGUhaMcJdlLmprveO
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI1PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::19) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AMBPR04MB226274:EE_
X-MS-Office365-Filtering-Correlation-Id: be7912e9-f1a8-421e-938b-08df195e6558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|376014|366016|6133799003|3023799007|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MepBsA+U9TyRiyI5jl4mF/yj14zDwr8orRONxUibmupGppql70mu54bQ1yaKv9cUqowMYgrmqwQvC4FmuYQYwX0l/L6p+Dxxqi159AFP2Is83Sos5Lk+6KRoYAUYzqNLuwdXZ/Ucu9AFefaW6YWMQHwhb5h0qo978qB8oaHv8G4j9ky0Fx2Rj3njW0as+HjaV0y98cyKNefz9CKWb7gm4iaLFLq9HGTLAWoiX8HXOCojMItkgIN/icZD6F1AquqtjEjqe770t8hJpzJeLnIRp6YARxhfObEgSkButMiQFQKdTQh508K78LfwUzGVnU/AZWgCWiDusBS+7dzVjr8iEohaKhGX3rcsdwzz5MrUjUyRxQnhbjthDt3AIpjoYG5FLfc593nGOcMpXjVlH3HO4NOFrBJHWn1AzGjRz07FIhKfe9h5OHhfwIUceJeZlhywYUj8oCdwR/LzVFxndGi2HJxENtByLnhVAnnqDu4DWlZW4DAqtZxHcr/2/H4qWTTRQFxuazJdI1QoN8xFLt2Mxd8LQzBkFmCcnVbOVjOExFp1lgCgF6BuX44qEG7S/Zyk0pvyngyy/tUBgJR0ppMxJ9R/fioWhvybjGse6ZItQit53424FfnkDUhYstGcYVC8rmDHDpCoU4mP0vJZetAOfef++MZokzl9OVnnu79+jjI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(376014)(366016)(6133799003)(3023799007)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nm1Ib1g1VnBORkxHbUxuU29LdXNoMmpMWWlPWjV5aURxbjE3NkZRRnBhWGdp?=
 =?utf-8?B?d0Z3TDI1T1hHRUsveURnOCtST2dhTk50bVdQdWVTTk1SMGFaR2ZXdEZra1Z4?=
 =?utf-8?B?cDR3UGt4dTRNSUtRTk5JRnpFNHdOckFrVWUzbmR4dkprbWRTSU5qYllybjR4?=
 =?utf-8?B?QitqRjNvTlU0NEtsSXdBclorblRaMTgwZDRWMU55bDN1c1pVWmdrTytVR3Jo?=
 =?utf-8?B?ajhSYzZrMHd5clNFbEZhditpTFZXakJjT2FLRm1lVTh1ZWY0dU5sTzBqMHBS?=
 =?utf-8?B?TGY4TFNlcnZTamxYUEJhM2JZQVFtdUFLWEE4cEhhRURLU080TzhQUE1ZbmFl?=
 =?utf-8?B?U3hOb1pVdVFJUlhGUVJMZzIzc29neE1CeDNWN2NNVFBsRjBmYnlyODlHQnBq?=
 =?utf-8?B?dDgwWFNBdGhrSGtFQlp5SzE1aVRzUUFxTE55cXF3Y3ltdldidDVNZVhkRmlJ?=
 =?utf-8?B?STlyRFFSVDljWWNSM245VmVqVVowdUlTUnpmdkgrK3lzZElRTElmSmpvc1dB?=
 =?utf-8?B?cStHdFV5eVFiTVdjSmRlanAvNG5IZjVhZlBqdVdnMmp2QTY0SFlaazgvaHlC?=
 =?utf-8?B?aC9nQ3UrbERtQkNTM3dXdXNkbTVlbFoxRkRwUzdrYUNVL3dHQklWazJBdm5L?=
 =?utf-8?B?UjJKbERsN0cxUDBRWEIzK1dLL2R4UVB0NXlKNkVEUCtVS3Y2YzRWcDByU256?=
 =?utf-8?B?N0pkYjB0clE5OWJ5bUV5R3FkQXZHMGFVS01aaFc3MG9Fcmk3YnFDTVJldksz?=
 =?utf-8?B?bWtzNzBVc01aS1JaUjFtYXgyQ1BONHYvUHErZGUzVUZLZDlhNmUzTzBoRjNI?=
 =?utf-8?B?TXdFVWNDQWYrZnZiMXBDUms3d3VjOXVUcFNTbHMrVUJVTWhyY0duUWIxT2F1?=
 =?utf-8?B?WXZNbVBYNEluVndPZ0xvNDJGUWRlZ2l2YmpYM1Z1TjhldjJPTll4N3RhaVZu?=
 =?utf-8?B?VmF2YW45SUJlMlV3K0hUYnk1dFJoWURubWQvQWwra2Vxc1MyMGFIYnF0RDAz?=
 =?utf-8?B?c284dWYwaHRiZW1rRTZNbTB0dnB5ZmVpUnVySkxzaHpNMlYyMWtUbHZyUUtN?=
 =?utf-8?B?TzdtTlpmSUs5ZlF0YnJZWWwydFVJTkVNMmo4Qjdyc1llMDhNYkk3VXVnMEtM?=
 =?utf-8?B?WWk4K0ZCemhyYVZsM3ZRWnhiM0wxVWF2Ynk5aUFqNWhLOGNJWitwSlhTTnJ4?=
 =?utf-8?B?cG1MV2tNZHAxS3hNVnlsbVVpVVlKVUJJZzJWY1pMeUxZSGVqc1h2alMyUjNP?=
 =?utf-8?B?aWtVV0lMMGw2LzhQM0NDRmhOcktQdVg2dnc3K2xuVy9pemhxSHQydUtiZXlm?=
 =?utf-8?B?K3hOcWVoY0tJN2NPY2xRdzZ1QllhelozR3Zva3dyV2lFWUMxQ29SYmFhenhi?=
 =?utf-8?B?REFSRTlNa1Vmc0g5SFBUejNXbFFVMmwvd29aRHAySTFMYTdBUXpoWWpaTXF4?=
 =?utf-8?B?RGE4VmhBK3Q0SkYwSHBIR3krWlE0Zms2ek9nSVBMSWU2RGd4cWs1Mng2SHAw?=
 =?utf-8?B?aWhZOUluZEoxSzI2R3hVSHFPNHVJK01rWXVWR0VSODJZNDBZKzR2M0M5K09P?=
 =?utf-8?B?UFlTQzdVMHNoend1MWpvcGRFcDB6U3pELzQ4U3FudkQ3YXpUVEdjU3F3bWs3?=
 =?utf-8?B?Q3A1UUJwVDcxZnhDQ0VMZTN5enRYL1JFMTViaGhVT1ZNby9FL25MUWdDRXRr?=
 =?utf-8?B?UXp1R3A3RXhxZGZrL2NmU2lyY2Z5RjZjeXpDNysvSFRySHBVMVFKU0VpNGNu?=
 =?utf-8?B?RGpQaUhVUFJLcm9vdnRIM09VTEZWTy9ZM2h3a3JFTGtqQkZDSExvVlZxMHJH?=
 =?utf-8?B?eENsTHlQWVpFUHduU3ZnQzhFREtSZElEMGc2Mm4wU3J5OE4ycDFaOW9LWStn?=
 =?utf-8?B?SWhTNmhuS3Ztd2VlUFF3NU9oem5RWHV2QnNRbE5VZGswVnY3aHdmcjJVeU5J?=
 =?utf-8?B?bUdNZmJPazBVai9uYkdRNGN4MW1UWUtiNytVejUvTmdTT2RIaTJUNmtmbnVa?=
 =?utf-8?B?MS94VEdOVWQ0b0NqaWdjakxVenpJOVFYRi9MQ3lZR3A2eGp3ellsZXJjN3JG?=
 =?utf-8?B?MDhJbCtNZ2tKcWowOHRMdjZaSlZ1RGNPdVRxaDl6R0d2dHpsWTl2dEowUGxV?=
 =?utf-8?B?UDh0R1BNcGdrTFZnS3RJMXo4WHM3eEZNSVBaOTIwWlFPM2tUbjQzODVvUzZK?=
 =?utf-8?B?cFRXUGZBQm5MMDIrUnlkN3p0NE5uWDI4aExIZ3ZlMGFpWC9hdk9URFhCbHgz?=
 =?utf-8?B?d1I1YTFsVitCSTcwZ3BXUW51SkU5OHNLVjFxRTdMK2ZBQ1pXeEtQNmFXd0E0?=
 =?utf-8?B?MU40K1JLWEFQYmtGZllXSnptZ2FWNktRV0UwUHNjTVZPcU5EbC9WZ0t0Z09t?=
 =?utf-8?Q?TNMWeIPJGGxOUJHH/+WauJoFIIXd8wT64lmQZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be7912e9-f1a8-421e-938b-08df195e6558
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 10:35:33.1403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6ma0PJYsrfVxdD1rZK+bJx7SuFHv9C75KZJIYbpCqRcGSAIKZ8T4N5KgN9BmDtq1mn89MV7RBtntPtO61yAkXnz5gQWbPqoqYeD25olDQmhadLQ+3QxoYmf7lgRyOZN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB226274

From: Xu Yang <xu.yang_2@nxp.com>

kthread_destroy_worker() was never called during unbind, leaving the
UVCG kthread running after the gadget function is unbound. Also, if
uvcg_video_init() or uvc_register_video() fails during bind, async_wq
and kworker were not cleaned up, causing resource leaks.

Both issues require the same teardown sequence: cancel the pending work,
destroy the kworker, and destroy the workqueue. Consolidate this logic
into a new uvcg_video_deinit() helper and call it from both
uvc_function_unbind() and the v4l2_error path in uvc_function_bind().

In uvc_function_unbind(), uvcg_video_deinit() is placed after
video_unregister_device() to fix the ordering. Without this ordering,
tearing down the workers before unregistering the V4L2 device could lead
to use-after-free on video device resources still accessed by those
workers.

Fixes: f0bbfbd16b3b ("usb: gadget: uvc: rework to enqueue in pump worker from encoded queue")
Assisted-by: Claude:claude-sonnet-4.6
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/gadget/function/f_uvc.c     |  7 ++-----
 drivers/usb/gadget/function/uvc_video.c | 15 +++++++++++++++
 drivers/usb/gadget/function/uvc_video.h |  1 +
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index a4fb2790f4ff..fa2f9d0e4ce0 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -879,6 +879,7 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 	return 0;
 
 v4l2_error:
+	uvcg_video_deinit(&uvc->video);
 	v4l2_device_unregister(&uvc->v4l2_dev);
 error:
 	if (uvc->control_req) {
@@ -1028,11 +1029,6 @@ static void uvc_function_unbind(struct usb_configuration *c,
 		connected = uvc->func_connected;
 	}
 
-	kthread_cancel_work_sync(&video->hw_submit);
-
-	if (video->async_wq)
-		destroy_workqueue(video->async_wq);
-
 	/*
 	 * If we know we're connected via v4l2, then there should be a cleanup
 	 * of the device from userspace either via UVC_EVENT_DISCONNECT or
@@ -1048,6 +1044,7 @@ static void uvc_function_unbind(struct usb_configuration *c,
 
 	device_remove_file(&uvc->vdev.dev, &dev_attr_function_name);
 	video_unregister_device(&uvc->vdev);
+	uvcg_video_deinit(video);
 	v4l2_device_unregister(&uvc->v4l2_dev);
 
 	scoped_guard(mutex, &uvc->lock)
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 9ba09118bb74..002afca9141e 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -841,3 +841,18 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 	return uvcg_queue_init(&video->queue, uvc->v4l2_dev.dev->parent,
 			V4L2_BUF_TYPE_VIDEO_OUTPUT, &video->mutex);
 }
+
+void uvcg_video_deinit(struct uvc_video *video)
+{
+	kthread_cancel_work_sync(&video->hw_submit);
+
+	if (!IS_ERR_OR_NULL(video->kworker)) {
+		kthread_destroy_worker(video->kworker);
+		video->kworker = NULL;
+	}
+
+	if (video->async_wq) {
+		destroy_workqueue(video->async_wq);
+		video->async_wq = NULL;
+	}
+}
diff --git a/drivers/usb/gadget/function/uvc_video.h b/drivers/usb/gadget/function/uvc_video.h
index 8ef6259741f1..6c5481f107f9 100644
--- a/drivers/usb/gadget/function/uvc_video.h
+++ b/drivers/usb/gadget/function/uvc_video.h
@@ -18,5 +18,6 @@ int uvcg_video_enable(struct uvc_video *video);
 int uvcg_video_disable(struct uvc_video *video);
 
 int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc);
+void uvcg_video_deinit(struct uvc_video *video);
 
 #endif /* __UVC_VIDEO_H__ */

-- 
2.34.1

