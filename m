Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793934471;
	b=3ZMLfFPZd0+ayfV3/d8lRgU7aIfRTDMX8PUguiOa5cebvVEltIz2pi6LbtPejwr0egVc
	 73UKgLrnZWPvXPBbd/w+BJ5UXcJ9DtIo7wb3o5WNbBESkA/yxn4WoHLps6caFRtlvwA0j
	 jS4Kr+0vUHtUYRIDLjbf8BFt1pWEP6pAWVZ22uPSQfQUZ7X6HomWKVvc8SgVAJygfTX/E
	 SGdTuJQ7F/JFQn+DeZcFv9QaTyENl8CNPIlcUHlOW06lB3TMxDaxXk/LRu0bXdvzbXIj+
	 RkRsDcRcDdr2QAeSJczwD3GGQLTGyTRqSSXGTcm/F6SmWkmyhzG4ui1TDxfazfbFYmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934471;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=WrcDyNMIi0mUETHZgvfxTk77EumAo5SkUnAx8vxMG5M=;
	b=gJUmLRDKW5gxi5CBe1yI+k2XJOB+47pO2K3rLeAbJ7RU8PkcHAzjAKkkc7dlIi4K4/T+
	 L6BRkCMvNkGQ6HZHmSgQ3fcqCbTVt1XaVWT6c0QgceKCQs9Tf7veFfUzsHWSeLzWRrSm8
	 Pa0h7avL0T9zJrz9l0pC7N3CjF2oNrmXBlPGinosjwuipD3AcYasMLILkWi1DKeR7+n85
	 aaGHsaW16BxLwa4wpt8s9AK3K30cy4xSYvmzY/7XV8Iyd6mlAXevgidUhvR385jzci65l
	 tmKjXbVbl3kuhNOUoYbI8pkSC7Qnr9oAKM4zhM7rMW0CDcO5XdBs2txR6P4fUMI6rmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ugG3YBEm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.45
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702D8606A326;
	Fri,  6 Nov 2026 03:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 702D8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ugG3YBEm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifAjeSdu7DJiR18f/0fAkiACEKiR0Hu7GM6U7vwKDEHtAiTCCQ77vwscU3vPFh5dnesEJ9VYP8oe9qdjpT3OqhbwVcoIqzV3p12IO1pfFPKvYQlWhuJ3vOnfZbdnmYMZUqp/nnOqolT40luLmaoggsEKKcwpgAmX3tzpcM7KYbJtLk/LLKLgCypUwjcfCL2zQlNb+metRrIt2vq5VTAy3r8WuGyi41aFwnaMmQW+rWCOBIa90UaTLh9b7fb/6JZyHWJqrR/A7rAbv6JK9wD6PZSvExejErzng1ea+jjh1XmgQhpHW4KphzJQsoxFXliNweqqzw5QyHB0gN+s4Ec8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrcDyNMIi0mUETHZgvfxTk77EumAo5SkUnAx8vxMG5M=;
 b=J28nXBX9hEkxUy0pSqa6hPZgHcq+53+9k6w7qmGo3QbtUfb/CAy0rbnargGsPebdYdjsnEhIij58zThlX8Np30E0gxXdbu37+I7AW7vKVe6jlc6hLfQkHQ4Srin8pLFuloJQGfoco99ZzqpXhFhXyM+BHy0jAuhbT8uHRGNJ6lVlsVrM202Xplm4zLIinsLQodnZhofJ9jnBPAHRsmSjxNMx1mfph89roFl/oXy1ZgaVLdvH3FUyqkr9S/iucdeKMBKPE9YWBXzvlBwNbKdpDDhb9YHazcD8Q319bLAK5WX+UDYg2ub99eOzrGlC0/T0DTRUA2Nxi0R3kNbac21F6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrcDyNMIi0mUETHZgvfxTk77EumAo5SkUnAx8vxMG5M=;
 b=ugG3YBEmgvZeLhzcNsbqO8r8Lg+FXbEB1DMDqyLgWbbTOEJPBQY/jJuHvfWCCgapsVsiRBeSSspkCFV/75E7zDAQNiO1uiH5N8wC+PhBjMVnJcwbqhncvaTmuIpy2RL8FkoBWHtseZtHRhTTdDUf0Dxw6x2xHFkxDLRwakdQKux03ZRI8SzOEnIPVrMPAiD28ypWwY9OCuwgk+mKwoBBUDA301iO0mvhyDyDKFvA9Rq7O3CFbRl0QawBa0GdWNAW8rkBJtJfL+E3EH1yuJ9rSJpv1hiW0JisbJLz+z/7m415EeTKBCceaEx9mozSSOwRQWTMX2vpTfBFcM/uot5qHg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 03:07:46 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 03:07:46 +0000
Date: Fri, 6 Nov 2026 11:04:48 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, jun.li@nxp.com, heikki.krogerus@linux.intel.com
Subject: Re: [PATCH] usb: typec: pd: mark usb_power_delivery sysfs devices as
 PM not required
Message-ID: <t2d3kgswrf3btizsiid2mglzyl5i3ckhvmvu2vzsnerdovp3sa@dgtzw6ty5fbd>
References: <20260914093923.1910484-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914093923.1910484-1-xu.yang_2@oss.nxp.com>
X-ClientProxiedBy: FR4P281CA0370.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::16) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PAXPR04MB8703:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aa596fd-a54f-4173-d748-08df3bb321f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|19092799006|11063799006|261102123227099003|261021121427099003|56012099006|261021123027099003|261026121527099003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	/jNCFV2rK0+ndRdIDTQGI4912ist56njm6GMUPOLt0hnJyd5ddEO8xpsF4eMOWMBaAYk/Ra+zPnmd39eu+gnR3oDraqjhGSnSa5kXqMD2hJCGJ/s6l0KV1iZIbP9zeWVGFNyY/vBWOYdFydsHnYVn+7+kDZ4OJbeeQNdjN4Gf4SK8LoS1veA2mHCGfEI7mjDcnMVbC4Ez+beptHPEmkRcs8Sytmc6hIrNbQwIAjzqkIrzNGavzLp0uG04kvgITF04nUTfvZVjrOhKsFhAFCphjHaedSe5PFU8XtMFYdPTvNxU0mEqKXNmhM7HVI4xBBn6ti4qqtaK+eCxCJxlMSSKGWD/zcHoznIL+CoDunUchrPqULcasA5A3BTVkNRiOYOlQ8uCB77WgO+IB54Z9TnCZJRH0piSB2dQDKNLLsmX7L9vg9CXr1rPll5T4sTM9ihhlq3zNAflct9h9vU8mMFE9QBcJYw0/4ZDVA4wv7pBoH6YTLoECb0InZzIXhOd7zpysDKAO7OYDhP2UuJ1e4U63fD+5KUptDYgcUru+gqyCZCPXNnEhDqmEmhLhnM9VoO50h00G+/xsjuaMn78ss303ThwTOpo5t6x6DYUljuyDfqnMnHmJLdpZc6IL5M/BMDrp4aSHAKULetP0B+BCuwzO/zAP5oAEilWkTQGQesW7w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(19092799006)(11063799006)(261102123227099003)(261021121427099003)(56012099006)(261021123027099003)(261026121527099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SMy9mvE4ONaIFEw3aNER5TPCVP+tFLsqx09VnxhvxxjTod/BL/QAs8Ghkm/f?=
 =?us-ascii?Q?1CuoBIOQR2Xc5n5FlleHymWpzrAr/XhNCixyhGUPyNzVeEbt6PBti9MX6Mx3?=
 =?us-ascii?Q?AXT23rdL+gmX53Ljqf8+Lo9mMcQ2Ut3wOkqCq5dpXf9MTcPyoIEbB0fseclX?=
 =?us-ascii?Q?JWLp7+jNy4TXikgwf3Z5TMhEHepjU6obygioX4hjqc5sHj8jkXVzmhftYcCV?=
 =?us-ascii?Q?jBxmo02GxXcruE3d8LIBmb6Yv2kFKGHkydeM6+g90iyxVYyvn/ZhyzFfITFo?=
 =?us-ascii?Q?Ebnkj7uldBiKqkWo55LaR7GSwaEsz8SQOXYgObUHxd/ItfK1KeADVtGsFBtX?=
 =?us-ascii?Q?Pv+HTJSHPtcWpshKn1lfVXmSrPrHgM9U31sEqA7mVHyQMkTSfNTsbBvB5ZRh?=
 =?us-ascii?Q?Kj5ECDZSpGy3Ntq9rH/bot62/VEFLxxWEw8/Rt2atLPnMCBTtZm3ItAFaDcs?=
 =?us-ascii?Q?XH+KiJRXVEN8I/ESeSLBHFqulkHNHIskUubwMMZYrPe8apBQuRtctWuIby47?=
 =?us-ascii?Q?cQDcddthJz2Di8k/ve+UkwdmqR8RLeX6HxBrQ+be87G9jMbPlRbpUQQoeXf+?=
 =?us-ascii?Q?sEfSzf34SMsK6Iyj6nb2DprHafNrrwDpmlxbpkP7oV+KsViLlGU2fmxNjSIq?=
 =?us-ascii?Q?k6XPy5n9TJwdBm1D3WdkxHUc0KQ8W7cQG3+uXYQPmsBay1HESdpywD0a0vaF?=
 =?us-ascii?Q?IcVJ0A+5yZjv8CD3siU1uySwXqBq2maetSSBOpBJdsU3YZbT8PpM+kSBKp3I?=
 =?us-ascii?Q?2HZMpdOcsWdfEMwrNubphRrDzuD/bsSF8O8pC64mw9319bTIXz7EeprurNI4?=
 =?us-ascii?Q?tOTVNq6HnCEL/76ku3EMUhbUG92COAyTqoSD6Z+13DRiUWhsHhtKzgd1A0Zb?=
 =?us-ascii?Q?ePpIeUinfvtiw8P0dnp0nCNLB9O3hRrrwC3EolKpK+EyDXRShhs+yxV5qR84?=
 =?us-ascii?Q?GuBlHP6F7Md3322f9irOGMACk/wK8f+6x0h1BDFhgLDA3WXeL7emrkyMH1jK?=
 =?us-ascii?Q?nE/E8e7BzGMuRRDW1z9mFjly4aPHCVhQQXaPkoDNlxufOpZLVtfY2xPjxBfN?=
 =?us-ascii?Q?Q4jMoE1ErZAGtf0AINWpDxvbmyoGgzNDeM7N9qtjr9Wgg576rXyOl/8NUF7b?=
 =?us-ascii?Q?4uwLjysc5cMsQZ+BlqQTIkpi3oZnZnuNTM8x9sYxxnwUlXf+e8hhwbS/xOuH?=
 =?us-ascii?Q?A8M9dKali7l6COKswcvjmHe6bLvB7vtZwvOJuj9tkS5pISzjOQWyQBOBQpC/?=
 =?us-ascii?Q?vQo3BDE2a7Wt6w3YbNMJhwznzEOc0ZYIZlwskQdH40YfvMjJBS636xIoZ5CK?=
 =?us-ascii?Q?zNEJP+B6GwA8DYkdJBQlZkChTzWzI7e30zmyH3BcYoTF/tyO1WbXek4fSPEy?=
 =?us-ascii?Q?CmQ/vNByPqpiiOe/tiHUyarwyU0SMPy20FjWwBQDF6R8tXKWe128HtJBqvIa?=
 =?us-ascii?Q?job9L/yjfwPxrPCAnNTYhM0uvj1r/11yR4CuSZWjAsPFbPBnjvpv978QRZ8/?=
 =?us-ascii?Q?CJA0h0Nh73COA8mReFajbxFW1AClzhNFrIBQbjV4waH3cJOCTk/W7xSI3Dhx?=
 =?us-ascii?Q?6+BOZVrM2OGt4hBcL+KjXyYdK+bgDPKskoAtwxnzZqOx9VvG/0ktkxCNuQLJ?=
 =?us-ascii?Q?bH2B6v//kg1uR8H0mXsobWzUkN7XEFsj6IxKEpc3kRycq3OiiSQbBsbAO2uC?=
 =?us-ascii?Q?85qMoKulpAHtrEp2KlvtU2Pb86QEkf1CfRXKyeZYk8+oJyZo6k8Z3QAYua/p?=
 =?us-ascii?Q?gXgJtEglbSQgFC9jYvXo07lInWW34at73cvDrc5H0KStnSC5HFha?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa596fd-a54f-4173-d748-08df3bb321f9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 03:07:46.6560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1JGSoCXj/ngdsDQOBPFcX0ll1Z5Obk2qhA8eGTlwsh5wPHTyuQW0hSqq1fOwltNa+TBX0i+66kAxpisBpXNknZwaR5e4+eH9M2FV4/OLMfsDWDbzrflpiwYMnIJBSQg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8703

Hi Greg,

Can you pick this patch?
It's reviewed and pending for a long time.

Thanks,
Xu Yang

On Mon, Sep 14, 2026 at 05:39:23PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
> 
> The usb_power_delivery device tree (pd, capabilities, and pdo objects
> created by usb_power_delivery_register()/_capabilities(), and add_pdo())
> is a pure sysfs representation with no PM callbacks of its own.
> 
> TCPM's state machine runs in its own kthread and is not synchronized with
> the system PM core's suspend/resume sequencing. A Type-C wakeup interrupt
> can resume the system and let TCPM register a partner's source/sink
> capabilities (and their PDOs) before the parent device's device_complete()
> has cleared its power.is_prepared flag. When this happens, device_pm_add()
> observes the parent's stale is_prepared state and prints a spurious:
> 
>   source-capabilities: PM: parent pd1 should not be sleeping
> 
> This is harmless but confusing. Mark all three device (pd, cap and pdo)
> types with device_set_pm_not_required() so PM core will skip dpm_list
> tracking for them entirely.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/typec/pd.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
> index 766c76d63328..a200d1f50977 100644
> --- a/drivers/usb/typec/pd.c
> +++ b/drivers/usb/typec/pd.c
> @@ -517,6 +517,7 @@ static int add_pdo(struct usb_power_delivery_capabilities *cap, u32 pdo, int pos
>  	p->dev.parent = &cap->dev;
>  	p->dev.type = type;
>  	dev_set_name(&p->dev, "%u:%s", position + 1, name);
> +	device_set_pm_not_required(&p->dev);
>  
>  	ret = device_register(&p->dev);
>  	if (ret) {
> @@ -579,6 +580,7 @@ usb_power_delivery_register_capabilities(struct usb_power_delivery *pd,
>  	cap->dev.parent = &pd->dev;
>  	cap->dev.type = &pd_capabilities_type;
>  	dev_set_name(&cap->dev, "%s", cap_name[cap->role]);
> +	device_set_pm_not_required(&cap->dev);
>  
>  	ret = device_register(&cap->dev);
>  	if (ret) {
> @@ -715,6 +717,7 @@ usb_power_delivery_register(struct device *parent, struct usb_power_delivery_des
>  	pd->dev.type = &pd_type;
>  	pd->dev.class = &pd_class;
>  	dev_set_name(&pd->dev, "pd%d", pd->id);
> +	device_set_pm_not_required(&pd->dev);
>  
>  	ret = device_register(&pd->dev);
>  	if (ret) {
> -- 
> 2.34.1
> 
