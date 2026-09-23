Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013047.outbound.protection.outlook.com [52.101.72.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AA348F853;
	Wed, 23 Sep 2026 10:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159774; cv=fail; b=hyueAvwbufkt9uQP1EL3NTpsikkXYIEHPWfi+Vl+yZJhfak1MF7Y8ZfxIEsZJ4/6YshgJkJq7lrbeznRZGO+Rj5dKu7gsWnQjLZ0bEsfYwFU17Q3V74EdZo1CFjkSkQwH0IqgpbBHfWcOskTlHVpDMNp4oKAzhhOYyQSMXVUe/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159774; c=relaxed/simple;
	bh=nveoWA7m+VWGpNK4722PbvK6f/bSA4Ks1jskQAihcxs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DhI+pLctEc0oQs6X+omHMu+BLxAfnoKoZahXy2+9cUG64kesgs+F2+uAqHc3YzbaeqCm0qP1BaNsah7IsXk0HeLzYHERx9yEQBXsKckYOV7eQKbe6K4Xov8IXWyAjaA+hiEEIlueRZQAIiQR0F8i/X2sC62R3F6npQmK+56Wcnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hHQmt0dk; arc=fail smtp.client-ip=52.101.72.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hHQmt0dk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoJwXbitvVztcveMcORI+UdBexXWsG2NQvMmDEGqM1mJHJAH9JBGb3VicKBCesC1pVVZ+Pu98hN2mCFY7iWtmqPBXUdngWAy0zf2CczbU+7c7fBFxczOmU1TwJNJT6a0zI8p3/3BjWa0OWgRNk+a43P+zyz7Oq3TgQHsh+Ww+RxJQrdRW+oaHfYJiILWe9ZyhOW8EQEOHQw9VnbWbkYSJmbFebQTo30OUKFiA81lgtPFwYjDArnyBatJJpoV04V6s/9M2W0smE5Hgl+7+1yByQoeEThV/QJkssHbw14F0m2Xg5fZ27cRvAMeHTS9zNvIFPYgdMDfZZ6X5vk9UXrK/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0KnkplB/NDfeylUdal2D2vHz/We0OKtx/zD05De0GA=;
 b=oJXANlROtkWKmmhPzhpd0aMFIFN3KV18IjqnrObPZ3t8i2fNAd/IGaP251jJW8s9cyno7c4KIHllmp4EvofjhMydDlLVLxe0rex6lyk4IXBqanQ/j6LLehP/Ilys2QTNwer87RnfDZyXle5zqMB/PjvrxGsTIxnKQGFD5zRUaEbcUNei8siW6vbwhirSf/7UfiRTCNxVuGohMKjYRfv74vKMCeI5/jODfNWLN+boShrjD4P+Sl+w52pq9XldI8dESh91aP161XQLC7oLT1et5X1Z/fKBLim3fqJS6pqvKMQHcgUz2fiIxtNZ7lxZivCOFiGX5eKY6N5B2lhfFCtD1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0KnkplB/NDfeylUdal2D2vHz/We0OKtx/zD05De0GA=;
 b=hHQmt0dk+rjcXQXwDqqp3DxssmyRAw41ae948EkafMiuG2yBbm27iSdgWCAaJAAV7mzT7TC173yrotXm9O282SNYn2qO2dNbh3kAjzWGkcLR4p4a7pZxoGAecNujimFkRQVPwsSG8/u+yYU7UHx/I/oE0JVhxjx3Felk1w1np1W/RIC0IuPVwxWWEFRqgtNCTMsX/J7QUfzz6htSUU+sC25MWBV6AxGA5UtrvvwSR3yRT7YKnkC0VP3YISY7juBoimCCdWlF6W5MY+mJ788UAYUK+PuMx3Za4JvDiw06vNCVPRVohBOfmud8PNam6Vv8cfm/m0VaHwn7jkyCRksySA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS8PR04MB8643.eurprd04.prod.outlook.com (2603:10a6:20b:42a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 10:35:33 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 10:35:28 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Wed, 23 Sep 2026 18:39:44 +0800
Subject: [PATCH v2 1/2] usb: gadget: uvc: replace mutex lock/unlock with
 scoped_guard in uvc_function_bind()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-usb-uvc-fixes-v2-1-844e04a4a4b7@nxp.com>
References: <20260923-usb-uvc-fixes-v2-0-844e04a4a4b7@nxp.com>
In-Reply-To: <20260923-usb-uvc-fixes-v2-0-844e04a4a4b7@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kai Aizen <kai.aizen.dev@gmail.com>, Michael Grzeschik <mgr@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Xu Yang <xu.yang_2@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159986; l=5573;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=+yT1pNo/+zD0ekvzcmVHoNKA5bNqVyEOBr44h1gn35o=;
 b=YHHj0e7z8jG1c2tv9fccuIAGlmqtSm86Cnji6GgEUX5gnAb3cJYKGfHP5/TifVLQWrRsrhHsW
 jxwBgpEqw5kCCO4QOQBOYdMLfenNrOZAq1R/IfjSknW+b/9UGbMxSiW
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI2PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::17) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS8PR04MB8643:EE_
X-MS-Office365-Filtering-Correlation-Id: 502372aa-9800-4c1b-d0f2-08df195e6281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	9lsedZMc5ESp1DpQJfVYHit0za2vH/CiI7jTl62RTc7O0nAt37qeiLu3OWVLiA3rd1lw3tY+Xb+UDT0+vmXoVffhluRh4wzGZqP3X5V35JDstRO3c1RrpVVR07f5ofzcOb0VzMa1PGPq8ANXLoZTAso8zkeskEUMobu2jw8eLrAxHIvqc3BZ3kmpDJJ34IWOd2de2fRHeVekgfqkji58TQPo8EQ7/gQ3Yjlqm23mlIE9X/aSRvB1oqFco45BJHV2k8O3BUhR3zaMQJmSBqOgvO1aiWNh9Nb6Nown8f4T9AQO/HBudFRoq9NJqZlGcZW7LrAMLawJO2wLDptTG0J1tJ9TLap6udjMJr+I+YddyH/rIT2kZRj0ISYcQb6PvT3il9jHChWULwpM8lXJEaWgZu6/cQS2dc9CouAuLZ4VTtODq49B0HR2iPwM7zMpcDcUSrEqkxgO7QKb0nnm/pFPTzLig3DsbCyCbGS1Ff6oRgA6IPSK6GylK68z4RIXlby9y9rfEzo1/fS48dfavDiPFzZpdBbePOff/QnxRPgDDRZxrk0fBkuQ30JJgSBpRV2jA0wb37tHcYHZr2Z6NMEE1YiaP0xnMgQYhx5r6Xn5wDxyAwv3ObZ4m14fDQUkX/evg6M3zNORI8HDaItWQlu55l4OkUsdvLJblgDn4JzlB+8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NytINGNTWElqaFJ2cS9ONmZIS0J2aGpyL0ZlR2tnMEEzT1VqdnBJemFpWHBD?=
 =?utf-8?B?Sk9TMWdId1M5MnRseHNVT0szVXpFYWJQeGFnelpkK0NJbWhZMFdyR2N5czla?=
 =?utf-8?B?VnFLdGd6ckErbTlYaSt5NURYWDBMV3lyckVLVS9TN2JKVlMwa0IzSG1yZTFX?=
 =?utf-8?B?MnR6V1hpSS80MVV4Y21yYVZMaDZBcWdqa3kxa1lKRE0zdUo0T2Y4cFJLMHRh?=
 =?utf-8?B?bldUWlNpSmhNWllyRmt3M0ljV3JHeU1sOWhzSkk0Y1MvWUVEQmdnVjU2ZHVV?=
 =?utf-8?B?c2dlYkM3MFZLNlJvT1ZRVThBRDRkR2R2Yjl3NEpXNzNldHVPakJheFpkV0k3?=
 =?utf-8?B?UUk5R3NkNmtHSFdNYzVpalk1ZXZlaXZjbjZOT2xNd2xMeXFXR2RGUFdJN0VF?=
 =?utf-8?B?WitieXhYTmFFQmp0d2NhQ3hIdFdSajBJaXpvZ0JwQ1ZVSm1WR0dFMU5tV05u?=
 =?utf-8?B?blFBVmJBUUJIMkR2bFV4OVZ0VW93VTZ1OEM5SEZGdERBZFRyekZMdU9jZnIv?=
 =?utf-8?B?OUF4T3hacWNvRWhqdEZTb1k4SEFIKzhaaUlwV0tMOVpIVDhNaXRkcml3RGtr?=
 =?utf-8?B?NlVQQkZFTHprKy84dWUyNmRtaHlZdW9tUEVlei90d2ZYaUIrb1Y0Qmp0elBN?=
 =?utf-8?B?UUVBbXplZVpTL2Z3aUxqdFhEUFFxMFd6ZVRvUjBYeS9tL2llZEJjRlFtRUZQ?=
 =?utf-8?B?Qk9NbkhpRERaMzZrZjUvUUxPcXRMYzEzNU9xVkRRUzN0VHVyRktaMk5MaGti?=
 =?utf-8?B?dW1RYXlRVGMzbWZ4QzFsUnMrdUcwY28yTE1Ca1EydkVGNko4N3dXQnM4b2tL?=
 =?utf-8?B?TXBTbWZPN2VDMzNlODlGMHE0cHdJcnF0dUF3dE1lSHZXcC8yYS9NeWMxL0E4?=
 =?utf-8?B?eXdqekN0MlNVL3M0S0ZFSHV5TUpPYnY3K3JrSWNGOHVZc0dVOW5DdWcvK296?=
 =?utf-8?B?dkFQNHBseUN3MGRIOVdtOElsOHc4REh6MnBtYUtJY2poanJzNW1aT3BrNVQ5?=
 =?utf-8?B?bjdGdUt6K01iQXJsYU1aeVVsbWJRR2FnWUpTakNPdXpDblVvanF6QnRoeWpH?=
 =?utf-8?B?K0paWDVFZGEvUmpIUEhHUFd6V2k4bUkrRUZHQzNydk96M2VrQlZTazAySCt3?=
 =?utf-8?B?dTZYVFZKbHEzUFVBcDFWWlk2VmhGK09BdGFTSWxoRjcrSmc2Vmo2OEZNY3F1?=
 =?utf-8?B?OXJMSm8rNGQ5MnZwckltelRVTzVacndXSU44OGQ0a2l1WkEwekxZSWZBd2tw?=
 =?utf-8?B?Y0RGVENKd3M5RHRIUldiRERMZThxY3Z1Z3NNU0NrYmFlWTdGU1pvdVpXMkpE?=
 =?utf-8?B?NUZhQWJPblpoQUdkU0NQQ3FBenlEKzAzZ3ZTdFpOenhMVS9Dd2xGQnNzTy9m?=
 =?utf-8?B?RnlPU3EwS2k4N1FtSTBVRGZsa3lMWWJVOW1NL3J0V0RCbUhpNGJReHIzdElW?=
 =?utf-8?B?OTNqMmtUcmNJTFZMTzRiWWoyYzNpS2tOM2VOSUs2QlVIcWc2OWp0Ukd0NEd0?=
 =?utf-8?B?UTFwQ0Vpc01kcG5tK1NMZEZQZnRENFozSFNkRkt6eHRTZnRmSGFUUTM5VE03?=
 =?utf-8?B?UzY4RWQrZmJ3TzA2WThLTlVVenBkTElVWnE4Y2g3RDdGMjZhbUcwVjBnWmM3?=
 =?utf-8?B?RGhQZWcwbW1IZnJWMGRnb3E4bGwycG5mY1ZqTnZOMDZUbHhmSVFSU1RTdXdo?=
 =?utf-8?B?bUNWMjZJOE5HUlBxc1hGd01oTUNvczBjRVpXemhDTVdWYXdXN3psSHRjRjBx?=
 =?utf-8?B?eXpicUt0SUtkWEFtTGsweksyWlVjUW9RNVVsMmxDaCs3UkR2ZDgvd0V4VnNJ?=
 =?utf-8?B?Mm95c2phV2Z6cmFESTBycXp4OXBCNzZ2UFJFZ3BDVEljbnV5SjMzMzQ5R3VX?=
 =?utf-8?B?VWZscFJHTWwydXc3MXlnN2NkMVlxVjVKVVpxWktHR0xhVXFOQ2hEQXJ5Wlhw?=
 =?utf-8?B?MThLYnpRQmp0V05nNXV5aWhwNGduU2s0bktBMmhEaUFTNXFRTVBFRXpnNE93?=
 =?utf-8?B?Qkh6cDNYYjVRWmFhK2VQZmM2NWRKTGNUNWZGRDB3R2VMb1VPYWdOYW9IVlkx?=
 =?utf-8?B?YTFPb3Yybml5TmFnclIveXNWZUhIMUkxbkVjY2xZQ1lIRDNyMWNpeEgrWGhG?=
 =?utf-8?B?VDVmTUM2NTVjR2lkSFRNcGQxbEQxcDhQbGxkdXUwMmgzLy9hSlZOd2ZxRDd0?=
 =?utf-8?B?di9rQUtGaW9QWXkrS2hhYmVVY2d4M3BJelZKR0JRRWtyaU14c25tKzFUdWJB?=
 =?utf-8?B?c3B0NDdjZFMzNk1ZVFVpQThPOThtek9NYUJ1anB1dWdpRWptdnRaaWc3bWpi?=
 =?utf-8?B?K0dCUDVKZG9OZ1NtelVPYjNNTmc5bXV1M0ZmNVQxY0VpdTk3Rmd4OHB2N0d4?=
 =?utf-8?Q?+irywjchfKNY4ZQh/IBHBKCBNN0SEclsrgg+5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 502372aa-9800-4c1b-d0f2-08df195e6281
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 10:35:28.2877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qp7yRQNmdV9cCPZGmfPItUUf1oxQmCIs19DkNGTDJ2xGGPuLicQ1SUeulh9mub7QUgKwS/mLihJylDOUxXlJ6zMptHGBIy8uwXdJxKbGfB/RdZLslulR++RVr+1yNmrx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8643

From: Xu Yang <xu.yang_2@nxp.com>

Commit 68aa70648b62 ("usb: gadget: uvc: hold opts->lock across XU walks
in uvc_function_bind") introduced an error_unlock label to release
opts->lock on failure paths. The label is misplaced between the return
statement and v4l2_error, causing it to fall through into v4l2_error
and call v4l2_device_unregister() on a device that was never registered.

Replace the manual mutex_lock/unlock pair and the error_unlock label
with scoped_guard(mutex), removing the need for explicit lock cleanup on
error paths.

Fixes: 68aa70648b62 ("usb: gadget: uvc: hold opts->lock across XU walks in uvc_function_bind")
Assisted-by: Claude:claude-sonnet-4.6
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/gadget/function/f_uvc.c | 80 +++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 44 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index d1bf3ea75197..a4fb2790f4ff 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -768,23 +768,17 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 	uvc_hs_streaming_ep.bEndpointAddress = uvc->video.ep->address;
 	uvc_ss_streaming_ep.bEndpointAddress = uvc->video.ep->address;
 
-	/*
-	 * Hold opts->lock across both the XU string-descriptor fixup below and
-	 * the descriptor-copy block further down.  Without this, configfs
-	 * uvcg_extension_drop() (which takes opts->lock) can race with the
-	 * list_for_each_entry() walks here and inside uvc_copy_descriptors(),
-	 * leading to a UAF on a freed struct uvcg_extension.  See
-	 * drivers/usb/gadget/function/uvc_configfs.c::uvcg_extension_drop().
-	 */
-	mutex_lock(&opts->lock);
-
 	/*
 	 * XUs can have an arbitrary string descriptor describing them. If they
-	 * have one pick up the ID.
+	 * have one pick up the ID. Hold opts->lock here to avoid race with configfs
+	 * uvcg_extension_make() and uvcg_extension_drop().
 	 */
-	list_for_each_entry(xu, &opts->extension_units, list)
-		if (xu->string_descriptor_index)
-			xu->desc.iExtension = cdev->usb_strings[xu->string_descriptor_index].id;
+	scoped_guard(mutex, &opts->lock) {
+		list_for_each_entry(xu, &opts->extension_units, list)
+			if (xu->string_descriptor_index)
+				xu->desc.iExtension =
+					cdev->usb_strings[xu->string_descriptor_index].id;
+	}
 
 	/*
 	 * We attach the hard-coded defaults incase the user does not provide
@@ -795,7 +789,7 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 				 ARRAY_SIZE(uvc_en_us_strings));
 	if (IS_ERR(us)) {
 		ret = PTR_ERR(us);
-		goto error_unlock;
+		goto error;
 	}
 
 	uvc_iad.iFunction = opts->iad_index ? cdev->usb_strings[opts->iad_index].id :
@@ -809,50 +803,50 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 
 	/* Allocate interface IDs. */
 	if ((ret = usb_interface_id(c, f)) < 0)
-		goto error_unlock;
+		goto error;
 	uvc_iad.bFirstInterface = ret;
 	uvc_control_intf.bInterfaceNumber = ret;
 	uvc->control_intf = ret;
 	opts->control_interface = ret;
 
 	if ((ret = usb_interface_id(c, f)) < 0)
-		goto error_unlock;
+		goto error;
 	uvc_streaming_intf_alt0.bInterfaceNumber = ret;
 	uvc_streaming_intf_alt1.bInterfaceNumber = ret;
 	uvc->streaming_intf = ret;
 	opts->streaming_interface = ret;
 
 	/* Copy descriptors */
-	f->fs_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_FULL);
-	if (IS_ERR(f->fs_descriptors)) {
-		ret = PTR_ERR(f->fs_descriptors);
-		f->fs_descriptors = NULL;
-		goto error_unlock;
-	}
+	scoped_guard(mutex, &opts->lock) {
+		f->fs_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_FULL);
+		if (IS_ERR(f->fs_descriptors)) {
+			ret = PTR_ERR(f->fs_descriptors);
+			f->fs_descriptors = NULL;
+			goto error;
+		}
 
-	f->hs_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_HIGH);
-	if (IS_ERR(f->hs_descriptors)) {
-		ret = PTR_ERR(f->hs_descriptors);
-		f->hs_descriptors = NULL;
-		goto error_unlock;
-	}
+		f->hs_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_HIGH);
+		if (IS_ERR(f->hs_descriptors)) {
+			ret = PTR_ERR(f->hs_descriptors);
+			f->hs_descriptors = NULL;
+			goto error;
+		}
 
-	f->ss_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_SUPER);
-	if (IS_ERR(f->ss_descriptors)) {
-		ret = PTR_ERR(f->ss_descriptors);
-		f->ss_descriptors = NULL;
-		goto error_unlock;
-	}
+		f->ss_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_SUPER);
+		if (IS_ERR(f->ss_descriptors)) {
+			ret = PTR_ERR(f->ss_descriptors);
+			f->ss_descriptors = NULL;
+			goto error;
+		}
 
-	f->ssp_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_SUPER_PLUS);
-	if (IS_ERR(f->ssp_descriptors)) {
-		ret = PTR_ERR(f->ssp_descriptors);
-		f->ssp_descriptors = NULL;
-		goto error_unlock;
+		f->ssp_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_SUPER_PLUS);
+		if (IS_ERR(f->ssp_descriptors)) {
+			ret = PTR_ERR(f->ssp_descriptors);
+			f->ssp_descriptors = NULL;
+			goto error;
+		}
 	}
 
-	mutex_unlock(&opts->lock);
-
 	/* Preallocate control endpoint request. */
 	uvc->control_req = usb_ep_alloc_request(cdev->gadget->ep0, GFP_KERNEL);
 	uvc->control_buf = kmalloc(UVC_MAX_REQUEST_SIZE, GFP_KERNEL);
@@ -884,8 +878,6 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 
 	return 0;
 
-error_unlock:
-	mutex_unlock(&opts->lock);
 v4l2_error:
 	v4l2_device_unregister(&uvc->v4l2_dev);
 error:

-- 
2.34.1

