Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794222934;
	b=NN7SSTpAbR6x0r6smcImD1ZTwr/N1foGm32ccILE9sJihwHcC81sPAQnxNZB4GqFUi9Z
	 6NbLkoK6IXTlQ8ZbzEtw/MYBuJnWjAeVxvuPMVM6yKuixictygqDM9PbRnhqVd1EHnLcu
	 JGNTl/1z/ii2LmQ8NhnzdaaCSX76tAF5Qn/nuF+WvOE37ujTY/g/ZdID3JcK5egk5+79+
	 JuUXAGroNT6doKdUpX54jgIXVQXUVQJxIjLplKBQlFsKJW1lZ8fnk7xC/h7GLtVwy8f2v
	 dcySfC6DFsQbrpRgbKTO3ul6mN9wqmkdxuM6U7FbPY52CYP6XtnW/3T5mugHiNGOBew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222934;
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
	bh=MpFZOw5O4V1YMdbxC8Y6c/+wgwXJoRrfijISKcw7GWw=;
	b=fGNuhAY/x3PEGbaf4bpcNRykpp0iAmlGg2vmpcM1JtFlpSwEnQQEGIZY5JFDz9N6UJNW
	 MH1rsEob8sQM4Q8pPeJHwkBnUK5mhkC9QAsyvcLmZe1Xb83pf7d0TtPm/LhXAMljFWSZt
	 6gzVBohM1nsbqX0HK/TbFwIP59FjHdXKfVO22z582Vvw/R9t7EXPUUIbMg1i7T7ILWy0J
	 zF1cfi7eIWKk1FnlG2W6NDkb/f+NEb3bAdkScCQvVa1lbJeZEC7L+k6xSqTbDrfchsw9e
	 wYv/5WbNVyN13IlGkZu2JgaaNBquZe9ZpnduJTN640XZpXuxFxbvKvbIx7vpFXfH3TA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WjELdV1i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.10
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010010.outbound.protection.outlook.com [52.101.69.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD379606A326;
	Mon,  9 Nov 2026 11:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD379606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WjELdV1i
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gn8qrZGqaCCCvz3zirUGd/r7WgDIEaAJTCyb2RCbujAoz5rUzyVwPtPRXNQrHakkARYVyX5Wkhbou5++rWj75x0AicAcba3T9sYekIDz4P4Fgzn8tH16N/fDgfygEFY8tj8NbwphyPHKwWwkjRHL+NPlTIvA0ZnyS9zXvg9m/BaxHDd0vQO/U2JWoje42JG1cZXcKS7iWe9QqdYFSRR/AJUfRIHBRHVP00bXHekReY0DOPBYd5fn212dDMbBvoEl12b6BbISIUaAzK6Kl0drQb5ApPqOTyRtf+fCmk7OTgy4OilGCIJO/Gtf17uYuzFwrK1g6+WjmEfBelbMUjKx2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpFZOw5O4V1YMdbxC8Y6c/+wgwXJoRrfijISKcw7GWw=;
 b=JbtxuOOODqxoovTqYLn+AMBtdbuy/NiWuL2AZoMyPbE/fuHv3j8yFFBpdwUikGKg3br5cOnXkExlJOlPSqHf288J/0AjXpbrGjOXutluY+222CqM6AG3UHjsqZ7dRbfkX10gDMX+6ga01M9KW8e4qck5I8BA4+XbRincAsr90rHNA/3kjFjZdvFgq8RsKNQSq3hUNcO4QWfzJ3xxRmVPBw8C/yqpfy8fE6ep17fvbR99PKla1pDIj63tcAx8u2cVKKYmbylUj4rvHpUK1wfuWapS1vJc9gy94Z7F3FyDAj1MVE9yWSAxzm+9poNP3I75V5ywzmR1gECHmR7NBgL25Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpFZOw5O4V1YMdbxC8Y6c/+wgwXJoRrfijISKcw7GWw=;
 b=WjELdV1iF+lXs2JtI/wXil1vKfNatjsUCGIxyBVWfpNKFNrIUV1KRYs6EXcsRWxwlfPl1Kd4VQCzOFQkWamM7dcv/X3Mjy9SQq7LFVUM7Seqt0WkUd/qRzXhbohFdc2xMAOh43eZNBxM+IiOU1FPN3sL8aMqPH6KoeFP9bgwaY4izh9oV3nouM9KpR9MBqh6QskYGwzf9Bs/2Hr0oreZCoNWJ8vVCqnd+oiSMaIlhDBXxyIh28XaTc1sKMjx/ofowl9USH6UgCqZArHc2CLVxJQGy61gTRDpWxFx038lVJLcrq+EaoVAJH6ZHBuI6eHFlUhBGw+G3mSibfZRaQpfAQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS8PR04MB8053.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 11:15:28 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 11:15:28 +0000
Date: Mon, 9 Nov 2026 19:12:28 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Yaohan Li <shunsheng1218@gmail.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	badhri@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: tcpci: quiesce the IRQ before
 unregistering the TCPM port
Message-ID: <tiszwydkunhgdxmu2lucgxntzbcosncxxzrzgggudhtnvubkcs@lcllktxpuwrc>
References: <20261106091725.1334097-1-shunsheng1218@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106091725.1334097-1-shunsheng1218@gmail.com>
X-ClientProxiedBy: SI2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:196::23) To PAXPR04MB9422.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS8PR04MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: b1499779-c655-44df-b042-08df3e52c2a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|1800799024|22082099003|18002099003|6133799003|5023799004|11063799006|56012099006|10067099003|261028144727099003|261026121527099003|261102123227099003|261022075727099003|261022105027099003|261021121427099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	VZSUCNXv+VgiZU3SxWJpNRfG2YUgJU6IRHfn8fIxePUF6isT30fH7WQKBousG58EMnkABsFmPCs6Xzso7ZJEGJU9FSvrNoCWPhuRdGBKie0vpDSzANBJVk5oAZV+pO3I4KjQpROuKQkApHBJKwfv4syW3DRX6r5zCUzlGy9U//8quS1gK/oqjlXPyhUEDeyq9OOIEgY2apVSewtGe3R3CNb7w8EE7OVy5RqvtKox8FcGeNpXn8KQlj6T8VAcSEhotu88kBBFiCBDyz1jEZhkRhk1uX5LqzOrQeaznyAW9IYgI7ARVJmx1WZUeBOumhSoUiVqQXUxz4y4GK0VhpvIEiTmotRI6dlxyd+/aAB/bsn5W7+Xb0x2jqWwtACLcKS9oCx0+YvrC//rdBAMpdwJ9o2UVSKTpMEnxxb67MwGhnlzMEZrrQNZ/0Mc5f9wwR3RmXvWqWUQy5vY6HzYgPU53BFAtHUDUe22qDG0a3JafMz7UMWCa4mcQMx0Q5wRTsje91DtWMTa/7trylZBHXGdfGCnQdmVDG2WGUYElzknfJe9cUc60QgzCVO3rTUXLMJAMT80j3LDacQKp3LqYJ4c+MGiuv8IOnP6fWm3HO+alW9Ss8+h47aXPqurXo09pOlBz4WDdpnM1jvI1AIqkkTdY6dx3iGrt0ORfivooyJVsao=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(5023799004)(11063799006)(56012099006)(10067099003)(261028144727099003)(261026121527099003)(261102123227099003)(261022075727099003)(261022105027099003)(261021121427099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T2A7ZNauvKVj35xLEJB0BaEqh8jsXe6xvoNHxxUHv92JUberu87RYHBCJYW4?=
 =?us-ascii?Q?Fx/gYB709ae9wvIqlaUxeUOTirVOVroq3LB4q6Vn7Q7ggGrS/DuZlgBVJ0EE?=
 =?us-ascii?Q?wro1AFgmUf3US6WlavlZYt7tg0jG9EsQri1syg7AA8XnY9qkkMcn5ejZmiNP?=
 =?us-ascii?Q?j1icrIL+GtpzBWFqUwrMOXu00zqg2LZWfYXT2LYu+OlHoEVBQ/Pok92hlO9Z?=
 =?us-ascii?Q?ZB6HjsWawbbURxiJuFsCYsj41cqPmeHdEES6AN+Z0pcTNa1yZJw2xIDeAh7h?=
 =?us-ascii?Q?15j+jqiMzizyjQMZ/3NJiBtIvieES0OlNdiQwkerzLwyP140OrI1g03nQy+o?=
 =?us-ascii?Q?/wssuypITqchBVw4MNBrxOkTfjgqzW3rgDfbaP543CgoFkNW+ya9ZyaiN6xO?=
 =?us-ascii?Q?qa1Sday2SUEpKRy9AAPLvwttHAhhGGpqyJCh2iVaWhN2Qqi9Gi+9Qf7jmTqh?=
 =?us-ascii?Q?9y44zSNbQleWBGLWBQFejdl7pd8ONhUzd5FD59x30VVsp2r9g2Av+KgAzfKG?=
 =?us-ascii?Q?lAJWrpYUklfHyrdFgEM1oGs31dIb+nY2U7daGlR6FHlxxN63ok/btLBHF5xD?=
 =?us-ascii?Q?BZe5yOH7J0hw78Hd8cVTi+bogDKDJa+0lwtLVfOUQPHzd83DYpcV8HNjiLHY?=
 =?us-ascii?Q?YBhdUscjnVKEsEZrSykhYyztSKESDtl4iO6N8N8H6WCaKeazgE30UqjErH2Y?=
 =?us-ascii?Q?v4/E9IVNJyBg8UqRjbFVe8ZAIw4l7aBwUkK0xxdaa5AW56utJM61hWwNm9R+?=
 =?us-ascii?Q?ZH76LqSokQot373OgX4RNa79Y3TnV5IfyFk5vgkS309xQtH8YqCQcuCbDItB?=
 =?us-ascii?Q?1cTDoxgdIUrbyi9/IC5J/Ep4kzD+3RL3DpYj7nKH/cdlhS9N75FU4g0tOOM0?=
 =?us-ascii?Q?R+/bm8S1wzQXdhQNUmncfXUAoSkZsisF20VhxJlVYQvBVB2B8aiMXnXuv+Ml?=
 =?us-ascii?Q?JKPsjJVT0YJAJ0UNyirf8T0LAjQRtZ5/JeCygwN47VlTeUo4yy45ysMiFCeu?=
 =?us-ascii?Q?womyg/lZqkmjr43rppyLitv8g+gbNX2naS9Z4bbkG3pz96gFIthJulBPE3xr?=
 =?us-ascii?Q?4iWirHfAsp2ZUEQyY6qjaj3ntVTF2akB925Un9YHpPKnaszZLAEcBUM+QJSi?=
 =?us-ascii?Q?vRQ5RS9itlNhK2WDZFAHjEfkgohIVxDNjpoPQZrjb5UKc9W00LyBu6iF/Y25?=
 =?us-ascii?Q?E24QBFWMsthaYFgFoOmfLJexHMqEgg+eodDzKf7pUp66sPJIdzeO1ck+EulR?=
 =?us-ascii?Q?SjQx0vOadu8IIL7ECsf0zzz4LeD4Ifso5lRfD4X859fsFgK2oZj4RViLZyfL?=
 =?us-ascii?Q?aRBnBoOZU1thGZ7qiKxUqaT5t5Jh0IqU69KNd6cwOI6C192BiXXd3tmz83Y+?=
 =?us-ascii?Q?+4vGLdGPk0PzjFjvH5l7usHRvEvarICS4HgWspr5QJM/4/4o5xVJhuxZHrLv?=
 =?us-ascii?Q?BL/lWI++i+Ot8jgbZOpDBIdeuHbvkypSiATMyNlXw/FfHw+mAKa+6iz/tXEY?=
 =?us-ascii?Q?kWYzDh5bUXsahhvGCD1lHKB50g5EKJ4GJh9oQYinOIorC+rA6cgzo6EZhjij?=
 =?us-ascii?Q?9ybYRTfXMUEhfaC0VtXTW877QzRyO0xWtMgi+4vSjRiX5/vCVGoeVoaZV2V/?=
 =?us-ascii?Q?DrlrYvZuYh2umTrCCcydC6foZxgPSSpXcVvJp0DtgMXFyefjTJDEsGzl2E8N?=
 =?us-ascii?Q?VrGPe9EeNnG0K5h1Puxk0QLaUrBXdLk29uqTWWcY7FA21YTSdvdUJmVBTtdj?=
 =?us-ascii?Q?x4lXU0UlDkyE6Fy69PsnH+CNmrMOn93KijHQvnCt5gZEaCraAqjI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1499779-c655-44df-b042-08df3e52c2a4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 11:15:28.5685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: haGncCc7emj53y2W6F3IRztL+yMBPUogIx75GLZ2byUAPmVXkuHT5Y+SprQLrT8SbO4DuwZ7wKu8H8lsaDStaM6VPnI7TqKggpC8vuSyvtgIuwK/ILnorWa15sJ4/JAM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8053

On Fri, Nov 06, 2026 at 05:17:25PM +0800, Yaohan Li wrote:
> tcpci_remove() unregisters the TCPM port before the managed threaded
> IRQ has been released.  tcpci_unregister_port() destroys the TCPM
> kthread worker, while tcpci_irq() can still call the TCPM event entry
> points (tcpm_cc_change() and friends), which queue work on port->wq
> without checking whether the port is still registered.  Writing
> TCPC_ALERT_MASK = 0 prevents new chip alerts, but it does not
> synchronize with a threaded handler that was already woken or running.
> 
> Quiesce the handler before unregistering the port:
> 
> - Set chip->stopping before synchronize_irq(), so handlers that already
>   entered tcpci_irq() are waited for, while handlers that start later
>   return IRQ_NONE from _tcpci_irq() without touching the TCPM port.
> - The IRQ remains devm-managed and is released on driver detach, as
>   suggested by Xu Yang; no custom early free_irq is needed.
> - synchronize_irq() alone would not be enough because the IRQ is shared:
>   another device on the same line can trigger the handler after
>   synchronize_irq() returns; the stopping flag makes such late calls
>   harmless.

It's unnecessary to add chip->stopping to return IRQ_NONE, because the
ALERT is already masked at this point. In shared IRQ case, this device's
irq handler may be called if another device trigger it, but it will do
nothing (status will be 0) and return IRQ_NONE at the end.

> 
> The same ordering issue exists on the probe error path: if the final
> TCPC_ALERT_MASK enable write fails after devm_request_threaded_irq()
> succeeded, the error path unregisters the port before devres frees the
> IRQ.  Route that failure through a quiesce_irq label that sets stopping
> and synchronizes the IRQ before unregistering.  If the IRQ request
> itself failed, the error goes directly to unregister_port.

It's unnecessary as well. Firstly, TCPC_ALERT_MASK is set to 0 before it
request threded irq. If it fails to set TCPC_ALERT_MASK, it may follow
above behavior if this device's irq handler is called in shared IRQ case.

> 
> This issue was investigated and the fix was developed with AI
> assistance (ZCode/GLM-4).
> 
> Testing with QEMU, a simulated I2C TCPCI device and KASAN (7.4-rc1):
> 
> - Remove path with a real threaded handler parked at
>   kthread_queue_work() while the device is unbound: synchronize_irq()
>   waits for the handler before tcpci_unregister_port() destroys the
>   worker; no report.  Without synchronization the worker is freed first
>   and KASAN reports a slab-use-after-free in kthread_queue_work().
> - Probe failure path (the final ALERT_MASK enable write is forced to
>   fail): the handler woken by the injected alert is rejected by the
>   stopping flag, and the teardown reports nothing.
> - A shared IRQ raised at tcpci_unregister_port() after
>   synchronize_irq() returns enters _tcpci_irq(), returns IRQ_NONE due
>   to chip->stopping, and never reaches tcpm_cc_change(); no report.
> - tcpci_remove() with the ALERT_MASK = 0 write forced to fail (the
>   driver only warns) while a continuous alert stream is active: the
>   teardown completes, no tcpm_* entry point is reached after the TCPM
>   worker is destroyed, and no report appears.
> 
> These are injection-assisted reproductions; they do not measure how
> often the race occurs on physical hardware.

Above words should not go to commit message.

Thanks,
Xu Yang
