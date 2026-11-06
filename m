Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793944964;
	b=O2ngYBclZx6qpe5kWKTBGjiUUCNzojyK1IhPlW2PRE0c4unn/HWvUOfjKBSO2RX0mkF4
	 bv04V1fnhLjs5HqVcDMc3FzleZWuoi8uEGlPkTwUa6zAsefiN/2SoAa8o2VgBByNVbq8M
	 ovERWkG45mxjqqH8Hs+WNjYhxN59FmULiTQHu5OqFOo73WkvH4FWFsfs6mkaSfNhXtPuV
	 KiQDtkGIzx4ccWaTJcCnLgPkmO/YmD1/BXdGIclCLOGRFGqr59yaLO1jBlj36XwFL5bBi
	 4dcIAB7cvHZRYQ0RDC89Ba8wlCzJwKtUR2BzqDOiOEc7la+cMFa6xGmT0QUEPxom81A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793944964;
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
	bh=LchTTiBu0ptdDwFUr5uSzxtSwgJQvLJZPi5H2r98tIY=;
	b=g4nlGdBSnOG4vzviGbgaWS2YIKZwZKsySimwAK1K7Vpc1+s1IWrl2++5YC2wFwsJXPFA
	 n9WpUdFmZX4QpIzWf09Z7WYua3DyQljZahOamzF/OSSP6OT6v/7rUXHLbw0ipZN5DcRNd
	 wmD94d9moa3O0O9p8etqLlaqUfWfQEuw/4MK8xIup9L0PmxdcWdVP5y+kvJD5JBx2SKz0
	 YPvYpu2jsEVMOmWVC6P755DH2CBnGjRRkTxNg8GbroURywWtt89fEdAzi9VZK2J1HLCn8
	 aL+rkvUowlEDgAF/Y0gIMElxS0XkXc7IjkE4EaV2YHk7uXN0LEeFg0aRu4Yw0wktLig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ZKziSRF2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.6
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012006.outbound.protection.outlook.com [52.101.66.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC8E606A328;
	Fri,  6 Nov 2026 06:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CC8E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ZKziSRF2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvFIXmcUfqpxNUSeqFg/77zy7hXgw7WsdlSyPxJ14DY5LzPRGyyYMniFNsg/yGtIglHbB9GRpWgwc4aUvKe5zHY2X76IvKaapzcHx07RZOAK97a2ZT3vdstxwga6fEBYWmnJqF8oYpkpNhYOOUvL1RaJYT9ypb6WTMi1BwoAB9lAt8XFeCqpY5F44+mWKLjApfAMZivmWH21hP/c/KySWae6fcowl7tT4tDr9Hxhz2tL/l4UYHnGvvI3lVW9aXItMLkrAaDwDitwH/2wJ34XlSq1CoWW5mFL9LjI0kxUGjhL+FKJEVKDT846EYJ1sNQ/ILeWN1iOtWin9+3evL41Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LchTTiBu0ptdDwFUr5uSzxtSwgJQvLJZPi5H2r98tIY=;
 b=qLb9fuy63PMgSLE9w8WbOu7Wz2KEhAoQoGfCFnARCxvvdN5apyHUq3EQvfWY3H6iEjCQZTS3vC8TX/CflBdxHPEL2NK4KtY4y+z5MmixA14+o0li0EFVkhF9rTI41gIeA8OvCuZ1hHRIluS1i4OT5bISit7tNu9HnbqkvFHs8cJc7P854WgjEK6zbgUA8vPGiY4dygrO6EWzQzXeEi7RiMApfjbCl5BQWi0uCru8i2PUKS500kI3Y12XhX6babqWQDHjPINJ8BYZ33ooyvgluhK/qlA9xuMdYeZoSKg6PeEPywvRFZ/2a7+tXKIRGzlj8BQHE6gOjdzJHhZ2Hj8Fnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LchTTiBu0ptdDwFUr5uSzxtSwgJQvLJZPi5H2r98tIY=;
 b=ZKziSRF2pamVM/6DgXYX425MtdyWMHvzi7EsckrwBA+zIQ5/gkORusfDSmn/4oz8G0MydjICV5+f0IA4PWdSTTRckJEW3NJWpqTOxFcfqgqUboQMC3hiuNVNnEWhjv31bfXUtNz8PRBkPkYo9nwb7eSsxudEitIOmAb3cHXLhliS7NRJ/Anht7ax4PngifIcT/3iBY0FmOO4ObN2RTlc0jQh6ue1EHwVYWKIZYbKqxkqi4vsccYwTubedvUhiXfeteOexdQ2t/+WTIgachziB9BGre9nFa1WFAUNNrBbXzeTIry3X8SdF9m0WVDFHSNcVUJZrJCrHc6VdGzUprbUmw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by DU0PR04MB9495.eurprd04.prod.outlook.com (2603:10a6:10:32f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 06:02:41 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 06:02:41 +0000
Date: Fri, 6 Nov 2026 13:59:41 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: zhang san <shunsheng1218@gmail.com>
Cc: badhri@google.com, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, linux@roeck-us.net, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpci: free IRQ before unregistering TCPM
 port
Message-ID: <kspvzi6ks427p42lgkndbu5uqgzztmx5csn4wae4jepexlm4uo@tljvcewgu6ly>
References: <179378589227.74015.8259496684787732118@gmail.com>
 <bklsnrvgleshngfc6vpc5kzb3feaxbl4qmaoti7swky2yqpnse@eyboedx6duxf>
 <CAGTEBTaFvEK5Tr2fH=WiLA9+x-S4VnuMuhk3cJz8cOc71nx3sQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGTEBTaFvEK5Tr2fH=WiLA9+x-S4VnuMuhk3cJz8cOc71nx3sQ@mail.gmail.com>
X-ClientProxiedBy: AM9P193CA0017.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::22) To PAXPR04MB9422.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|DU0PR04MB9495:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c257a5f-8b5f-449f-97a3-08df3bcb90ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|366016|1800799024|22082099003|18002099003|10067099003|56012099006|11063799006|4143699003|261026140227099003|261028144727099003|261022105027099003|261026121527099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	E1gqFVmyKlFzYsNjQL96IFMfeq+ftGvtNDj8UYllaGhx7bvUvKzLRThN3JUlTwV/eAB6RpCU/Y5PYZAM5yG90WvwAISvVoa0wJ6+XwTkFvX9ZMd0ZdwCfcnQpBTGEvtCH7VjmzWtlcMjHgKQrvJ2c541ZqEf0M1suvTuKoC8aZDAJTtSipaBA4Msvq85ggWY8rwdDLLsA/OTrwKil8SPZgUyqpcLo2SysF/v1vy/WdXM6H2kF007/GftaLxNwMPu6J/37USUPy2z7v5hO5ppqWJQIxqnPKTzDlRoYY6eL1DHKGkNtUEdRGdZRQ4Mv3l8bANk+711aUyctwUnHnGyPa+BDx3edGTZRr45bm6iI1uVALDeYNNG+6dC54iDcUpT9OeGSvSFaRzOd82qo8kW+7CMLgmkQn4+zcCDR2XV9/U+B9Bdo7U7UQm+IY4JOmJjO0DNJggpIamETx376Jh3fYoCe93KxcKZZ44Xd6+L6jD/izDiMNP9kFbCQjsrZGDPnRp+xCvArXwg/uW8Iw+yI56QSxYdKvjrtCqXD/hHqRK/MPPZ7P2v79kxzErPH2EXRRiye/V9XNEl4KW9Xr6iIXvjo1msZKnQQXNQ/SEJ4l4JIyreF/NW8ehS3c3y69ED1u895ZUfnXTP/XLbF9rWOnfdj1ZkmdY2a79dLOjNL3E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261028144727099003)(261022105027099003)(261026121527099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CJuP0ZdbTCpjgMJQ65Ah5dwXIuNovC7jHMHiFSu7hQD+CXsYz1EYyxTk1M4S?=
 =?us-ascii?Q?D6JfmExqiEoTzqWFkceRcMHIUXCZ8FvBWtzXAUS62bU0KZ6lS4Ti3rseNuZh?=
 =?us-ascii?Q?+WDONHZQ9vKoQJaxYkXdHzR+x5koJ9QPQQcBKFtAMfuZnkLVlIHFOArd2TF9?=
 =?us-ascii?Q?XHyi+AMOaMlFTdsuXudZO5BhzttZIgwlfHoC6obXkrROytl8hELWiwfWl8fh?=
 =?us-ascii?Q?BdvcC0ieoul7ulVyZO6K1AalbAFBW8Hh0Q9B2sODiq1Uxmhpg9rbuPkyUs5Z?=
 =?us-ascii?Q?EKlHDM+4HsGBQxbx2MSxiqSAjzXHKrImgSsLLZYaHIbiKwwBM3Pe5BjX8vtu?=
 =?us-ascii?Q?slj02vNwnIgn3MYC+qxI4wyMbUG/6a7dGee7BP+VOOtmETYd7RVFJu6xdxki?=
 =?us-ascii?Q?vmLaV6uUeq64usaYM58Zv1TgcmSbTx+ClzmNWpPb1m2eeJW3HwDaWDr78nTp?=
 =?us-ascii?Q?u6ey52l7pCoNz/LPMwziPCuviW0Nc0zEM5pwnr4c1PFtMtExL6jFaV43AHe2?=
 =?us-ascii?Q?2OC/bhYizSK36nW57vyBCh8QF+sL09Ti8z8kuiTrUUVQjrdkVXOr9/Df8H2W?=
 =?us-ascii?Q?+8Ie63UeGfCiphoYwP2OeQt47VyAqzfrjunAXW5jZu1VGuUJsLSWw2MWWWWK?=
 =?us-ascii?Q?12f9DwEq+TZE+cvHq/wfTrqjSP2Yv4KPwyIKITNzblzuJu1bMl5vnbWzPDpE?=
 =?us-ascii?Q?XxKT1UUIQDbRPcWF/o/y0BlyVNuJBfQbmfS8k/0jgiBevUHccJMN6faR0HwK?=
 =?us-ascii?Q?+eg0pcObmzy2nnZoLWaytSj/Gh6DGpsFEHwdIDTxJejm3AJ0K7ccVHaF+rlY?=
 =?us-ascii?Q?XEhUPDRxHDvN5gq4oLTzYMs/5WgEj/I1UpC/RoUWKdkNcoN81JJwkdeWfuNE?=
 =?us-ascii?Q?di9lHvC7yhQt4gI+mGHjRcPfVmJIrzZ9Iq648xzx03e1+EpMsTeFL6NKnvYr?=
 =?us-ascii?Q?LVcFKJ8uk4dYu1cQZVfUdGkS4H4H7oJ+OKwoJGyo7EwWA7sNW5spRK+oIUMm?=
 =?us-ascii?Q?YNDPg92DcpQBU6uSjD+g7HWFk2lxAF6UvvVQGFsB5SmbVyIG7Fw4RpzqvyRq?=
 =?us-ascii?Q?x4tEXQsi0n48DYdB1hi4gwIrHtoCWGUQA9mwAy183wRYoluvn6IMMKuDuXsn?=
 =?us-ascii?Q?mgYWfm8a5l4jBQvGak2QYEI0bg7b8vHnHsFZsEnSHwNhYwOlD7f86KLVOILq?=
 =?us-ascii?Q?YaQXx7n4f/BoniTRHZVuwMCcmZYOmDwWbggMpXo+KbT6QYG6IH/SimVygKMh?=
 =?us-ascii?Q?uGcMlqs7t9V/NLtkuEsBM5G59beubhPTrTk+tuF+HssM3HmZu5hVU73AR71t?=
 =?us-ascii?Q?sWAa2qbTlrPS5jBHGsTLzUiMhOh249FXHY/ix5y5WWHLDbs+Ik5O8WXHeHpE?=
 =?us-ascii?Q?swaNQJePbm/1q+84qYTWvzbnsyuUhe23LDL6KjcQ3LzmuihYAJQRyDBWGp12?=
 =?us-ascii?Q?wXP7OIFEECl07THoGfToA15LP0GOvZ1h65GdHC+ONjOeEPXIUQeU5F7andxe?=
 =?us-ascii?Q?TEEtwzdz8maJYifC+w4VcxCcZ5BQ1mHIyhjN34i5YeyyoJJBH+m/yKQ7bW4v?=
 =?us-ascii?Q?qi+sMk/2KPWNpq9wipPWOkl/Sy6grMhTdviRjC8+THwFqMFjiFKe56fH3VxH?=
 =?us-ascii?Q?Q+C2zT1WztVPpctWq2PzyikSF+Ro6oV2aGzM6Hd6nOJ3ERO0Keui2munZnLb?=
 =?us-ascii?Q?yrOHWmvPZi+gj+5V9MI9nzOmvTY2vM0rtAyKqzSSJfTALv2siolrSJyV3rGN?=
 =?us-ascii?Q?et4MufmVetUxk1NOLj0EVQX9p2oWnN1qBYnao47sUuX3N3cQFbVK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c257a5f-8b5f-449f-97a3-08df3bcb90ee
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 06:02:40.9883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2WDSU50H84m3esIjkEnkgZhWx+KbkSQz8tJIZN4IIlpuAKE2QrhkufVAlnQHdlu83VUbcU8ud6pIEgVtXIoNndQ6Zl/Y7quwVtSCxICyw+5Sln6tRoG8lAup4ihIiDSh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9495

On Fri, Nov 06, 2026 at 12:45:48PM +0800, zhang san wrote:
> Hi Xu,
> 
> Thanks for the review.
> 
> You are right that tcpci_remove() clears TCPC_ALERT_MASK before
> unregistering the TCPM port. However, this prevents subsequent chip
> alerts; it does not synchronize with a threaded IRQ handler that was
> already woken or running before the mask write.
> 
> In particular, tcpci_irq() can call tcpm_cc_change(), which queues
> event_work on port->wq. Meanwhile, tcpm_unregister_port() destroys that
> worker. An in-flight IRQ thread can therefore reach
> kthread_queue_work() after the worker has been destroyed.
> 
> We reproduced this ordering on a KASAN-enabled 7.4-rc1 kernel using a
> simulated I2C TCPCI device. A kprobe paused the real threaded handler
> immediately before kthread_queue_work() while another CPU unbound the
> device.
> 
> Without the patch, TCPM worker teardown completed before the handler
> resumed, and KASAN reported a slab-use-after-free in
> kthread_queue_work().
> 
> With the patch, devm_free_irq() waited for the handler to finish before
> tcpci_unregister_port() destroyed the worker, and the same test produced
> no KASAN report.
> 
> This is an injection-assisted reproduction, not a measurement of how
> often the race occurs on physical hardware. It demonstrates that
> masking the chip alert does not by itself exclude an already in-flight
> threaded handler.
> 
> I would be happy to provide further details of the interleaving or test
> setup if useful.

OK. 

I think synchronize_irq() would be more suitable for this case. Otherwise,
using devm_* would lose its purpose.

Thanks,
Xu Yang
