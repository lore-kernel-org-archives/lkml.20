Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011042.outbound.protection.outlook.com [52.101.65.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC005472798;
	Wed, 26 Aug 2026 16:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762226; cv=fail; b=mDDvIa2JXiZtFX0R6Gr8VIVKFAZpXGcATD1Wi91c/cTpruilVkNaZdBtEpNLgHh+LPTrlY7yqrnZAXxhTIj5gPdOjPRiUlRNjKPfXOarr4rY+4GVEAkrsLwHe0+5SM5VJ49gwEpzGyAfTEosHPtv6muUGfsQeoZuVbIwMUqlQUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762226; c=relaxed/simple;
	bh=jLjJDtKKELiWbu+UGT1La4cHAsN11aE4mPBQ/D5jTeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ImLGK/k4VDQOyIaKPKMhc8VJbEtrMRRINPqeHj/TA5HNtX0L9eJJK88JrNvDqEHqZAbq2rHYK2myfu/a/rmyrGtIrgvhsP3ldrux6xGGKxyXuLbNYFj6ofaJsYnd3U+uc5quWB32yxGrDJXgf10uPYqFpkeHX8Rbq7oVPenf1kI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HU2J3wXG; arc=fail smtp.client-ip=52.101.65.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HU2J3wXG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjcKb+ZdcXwth5IO1ogzZNoQYDJzZvvhbz/Bxs4PcG+0UejplexZeRREMQa2NNZQTlC4ZnFXkM7Sw2twTd2GdRqDmLETGZ6/5gmKmmdnxc6SB7AnVrZRs0epQi5CVFLIJNFoPktWhDzd31wHliyPih3TIbG2TEShJpsWIUrK9HF1zfl3rDe/I0p0Nim1vo/j2XO3QXig/p5UiSr7l/oskEeibMaAnRjhjs1OaSIAUjhXWD8iup8UnMNfrcvWohG6D76tHApHkrjLXI+6LUSf77qmg9HGU0Zkfx7lai7KN4tS4n3mWHoglSEeMe39cfEeY8zuuJAxm393vH5V504RLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGJ71KWRTU4QUg3Td2j2OetWll5GcEL3IyxI8QwoAgc=;
 b=Vzd65qSU0cpIvWMBONfmiVmJbnyd4P+1Z2jQBKbB0WHPVr3fSQo8ezIzOBPmAghictGeKJshtJlb7IJDMtfVbq9/PlXd1MzxEJeUQq+nJhhXja0YO70T0AY7I3Q4uVD6dL2VcBgA9us48OPJjiZ3ljPYxSmt4MdnsJ+glMFXq5vtA47af9Juj7D4w7reCEfGZWeEo828g0ko/CKjDWqcHMDqHNXKEC7fHFjKVJB5A0joV3qeRd8KW7XOIwwfygNVaSJM4ZMIp4vvt3mOE6IWUdvhmS0c0SD9N/ARagW57Izc99trGuYTY+5AW5pfFegGTdiPf9++7GAYN7ctn0nTaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGJ71KWRTU4QUg3Td2j2OetWll5GcEL3IyxI8QwoAgc=;
 b=HU2J3wXGuwT2A9Xy2IU7EG8bSYTf/CYUurtzC+opIpOWHswEBZ7I83dngSyK34bgLdmevKANnlD2VPgoTme5K7rZ3b/k6sYlUxMY7WRpoAQ09PNc8UCErYj54SkBJneLJ8zMIZiZ8dD7pp0j7HJ+4LuYzegeGZJcWvd10T2gWmAup/zOzhB2ixQMr2D7KJf45wLhaUzidFt8Ua+L1jZh51fZaiEaM2knB7EOvgMMI4jf8UEjWvlqVwCNhQJRFJKAlrDmDsNgnRlqoME5wk6upBfnfPwtVtEYv8Cp3+pHbAIWlVpQGoDSvNBpPn76Xe4CVS4QtYe1lkCoazSvUX2LQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12) by PAXPR04MB9569.eurprd04.prod.outlook.com
 (2603:10a6:102:24c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Wed, 26 Aug
 2026 16:36:39 +0000
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953]) by VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953%5]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 16:36:39 +0000
Date: Wed, 26 Aug 2026 12:36:31 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, Frank.Li@nxp.com, lgirdwood@gmail.com,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com
Subject: Re: [PATCH v16 1/8] i3c: master: Add APIs for I3C hub support
Message-ID: <ao8WD4Ql9Zdo3nOh@lizhi-Precision-Tower-5810>
References: <20260826103819.1614843-1-lakshay.piplani@nxp.com>
 <20260826103819.1614843-2-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826103819.1614843-2-lakshay.piplani@nxp.com>
X-ClientProxiedBy: SN7PR04CA0174.namprd04.prod.outlook.com
 (2603:10b6:806:125::29) To VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB11784:EE_|PAXPR04MB9569:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6b6b89-985a-4bcc-10f7-08df03903384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|19092799006|6133799003|11063799006|10067099003|56012099006|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	P3QEn75zkqAV6CWGbGdanuS4mKmLJXEL6YPseg/oCpLBxJiXdBjDdrPE87tQYA+CPe+YH4D15kY0WyJcNPTGMrni009CGl8QGvIGhSn8kfvkjSDuTuIeMUfs/bxfS2wL7NqY2avhQJrUPmTYVr+V4/uvLHfKPckgXIdE/2Tn3g4q57SzdMEDsSy4bWwTuVMYyp77KnQ56HQHtUvQWCs2M6UKiRLd2TO4EccT8ncpbXqPBQNxViNrQPR2NMZjsQ/QPBzQs8TyQljgjXnU9Hyn2B1D4HQgj99XPawAY3Ul+3XgDZUbsVY/OopdZuvBJWaFWpmFtGgIR2b9oW9RfvB+63To8F8fLnghAvNZL+dnKw8TqXGjNAFLwcaQ8B+mfY6EglvpBLSq3pQMck2CwEd11V62YEMXKArIgohPyMmsG5L+5dKfWGwu3a7CJ0krAXpFdIHKtOGCsc8VLaEIMt3Fe+fYZxk5fhKKJEWL2j2pck4uH7lwu1w4y+QNqB64X87fv2LE9jmPvFUQyPP/Cdhfmj77Mxr29TQW0ks1oIR8mz74sCIKCTbG0oj3zcYvVaYtZcmbMa/6qVjOxvIvlsTVXAuBR/ZaqCSKUwWGDYCz28tWfvpoi6P7H45tjopT8vGcqGQeMn2XGWV5qUyMEywfDC3FGlMfhEo/dlSuTvXXYvY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB11784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(19092799006)(6133799003)(11063799006)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QMq33S09N3Fa3QJrlSGpEljz+kKMXXVp1EbDgfouZQxie/B9CQ86tvQg8uzI?=
 =?us-ascii?Q?W6gMRWJV8GhVDSFu35rksOQjZDYibN8MQAGn6Vb15euH8oymwng2+W+QOIK4?=
 =?us-ascii?Q?J6PLQd64aksQzOgPy4lXVIjq/Yamlp8RbTQ9pOoayVKhuNDENmqKCfEsvlAW?=
 =?us-ascii?Q?skuk5KyJ6vc9jaeJ8LpyCPBAX+OJPiuzkQsEEMDhDLE65fHrd6UC+GmozCX9?=
 =?us-ascii?Q?tsFR+ihbru/j1t0Y9rME+bpB6HCtldTBxdi8dGSu8yDYdRBLFZag3qgoWoiC?=
 =?us-ascii?Q?MewH1sF3pCHgucggLcFoa6pVcNJgYlhLBIabHCmTgwtg86NvbXnoJt28kd5+?=
 =?us-ascii?Q?pezkwFDsL+xpud16H4wTzMkuIdRgXEIxO/S9CAWt+DmrDg0swYMhPKI0Oek5?=
 =?us-ascii?Q?Dli1d099aCi7l0JcXX/rv6cKBZsX+x6j08BENAH9FKoPpNVWS+j2KCsktKkN?=
 =?us-ascii?Q?Cd4WER+x5/EUxwHbuiHA9OC0NG8+iE3MCg8rSLOo6CcjR0qLSSm6pS0WUmel?=
 =?us-ascii?Q?26zGIG01nSWaezt8bg+hrxxZLTJ5utXqu8dwwJQwPrqXGrC5N8Yw19YYV2lE?=
 =?us-ascii?Q?kXpKha4XzExSdFifPPjPHLIiPywfEny9yGT1Nj9fvYE+eEK89WjYPPcR6gES?=
 =?us-ascii?Q?BPL6tOwR+ID+yjA7nijdaOjFtbBcpbXfYngWG1Fi/6IWU8S6oVCDYOcHOrM3?=
 =?us-ascii?Q?2IWbP1Qs98o2/My3mUYhzfKLuYcZ7KGZmddKejXMsSJGTF6hc/7MhDZtTTQP?=
 =?us-ascii?Q?lEKlLC29yLXCzuKGYgt9lDa6GWfgWj1Ro/zJgqmqPTmTJaYSPtTz2LQwxaOr?=
 =?us-ascii?Q?V5AFKgrYQD5Ifz5iQ0S1rGrUlURjvDGaIlGeufJA5Ip02lDUoMaU/XCHAg42?=
 =?us-ascii?Q?AeV1nCbXNARUg9FIDdRtABJuEP+8ex5v5Ch7Yu0A60B43sxHt+CGVNwyIqdz?=
 =?us-ascii?Q?4luy+CjqIzw7X/ApSoKKL2Pc4c2aiNZk/6g3o48uMtzFJVlaaTrGYG86IW6R?=
 =?us-ascii?Q?ehzlxTHP8K7YOzEkTpoBj+WR7TkdFGJ7vu3/IZ9Rpw62hAYwC83/ro+gKmq7?=
 =?us-ascii?Q?KLjocOebpFJQdaazYrS6Br9yIXsz3qh6Sm+81ex/N7hGHvfvYhEznZZl6aP1?=
 =?us-ascii?Q?mVxzTbhfZzJPIzZDQW9O9NcMUgAXHNSgx45hkIwdoMuB1ZP3f/ojWiOjEMQS?=
 =?us-ascii?Q?9JvBeIz2PGzQ+pvpx3O47dpiK9wmqdAUkQLYrJpyRg2zujEtz/C0KoC8vIRI?=
 =?us-ascii?Q?dE9UIDXXTEY+1VA6lKahNXVijnNpPLup5uC40WLA8SW0VvtPHYsVvfkvkgqo?=
 =?us-ascii?Q?cUH9GAWQWwTmn3aHVZ1+KbaFuZzJh1I8QTcgC8OJ4AvrcB1Ym9hMtxdkq/hJ?=
 =?us-ascii?Q?A2rtuS/YZPzOBZGK6wNm5Jq+IVCsHAZCEiRJdNxfIWG31GXcOBm/k30QCQOM?=
 =?us-ascii?Q?FHpB1QMdFrdhWnvYJmg/b7TXSjl4Nfdvac54K0ELJYsdko6vRxmxVaDuu9vf?=
 =?us-ascii?Q?EFXF9cQeono0by1Mbn3pxg4DgtpHgjA67KTeaOwkAzuPNLU5l0G5L82HJesv?=
 =?us-ascii?Q?xfqkxq2F40fpBoXZGo/N3vfzXzojq3A4k2NqxX3YJ+mT2n56i6THjMDW4AOk?=
 =?us-ascii?Q?Nrn3wccDWeVMYroczQr2kgT4qpVoRPc4u8rhU0Sh6GY+mRYL8zhOo7NMPXM1?=
 =?us-ascii?Q?5kIvLhi+q8R4xObSVxWcgWZaAIjWXBqwVzbsn6tjUBIc1qwZ6C/mSp727X+l?=
 =?us-ascii?Q?JPzsp5jaEHX1U3+ubRj0GrN832WRj4mPMqEQ3wWJKH9vcl1OGZvB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6b6b89-985a-4bcc-10f7-08df03903384
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB11784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 16:36:38.9450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fjyObuWBwDpjQ+rZkJXXN1FS8JsZvp5gY1dzuezRVC+zYuoG4MFxFBFxedBnU76LGOmR6Xw0sGbmA3xvNhFfmumguRV4uspGCjerGMBOeVnVbbweQxDTJdsJp3WECb1u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9569

On Wed, Aug 26, 2026 at 04:08:12PM +0530, Lakshay Piplani wrote:
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> Add CCC helpers to check CCC support and send CCC commands, address slot
> helpers to query and update I3C bus address slot state, registering virtual
> masters with an explicit firmware node, and exposing the bus maintenance
> lock helpers.
>
> These additions prepare for I3C hub support. A hub driver needs to reserve
> and query parent bus address slots, forward CCC commands, register virtual
> target port controllers using the target-port firmware node, and serialize
> operations against the parent bus maintenance lock.
>
> The hub also forwards private transfers via i3c_dev_do_xfers_locked() and
> serializes its IBI and private-transfer paths against the shared lock, so
> the normal-use lock/unlock pair is exposed alongside the maintenance-lock
> helpers.
>
> i3c_master_register_fwnode() allows virtual I3C masters to register using a
> firmware node different from their parent device node without temporarily
> modifying parent->of_node.
>
> The new helpers are:
> 1) i3c_master_send_ccc_cmd()
> 2) i3c_master_supports_ccc_cmd()
> 3) i3c_bus_get_addr_slot_status()
> 4) i3c_bus_set_addr_slot_status()
> 5) i3c_bus_maintenance_lock()
> 6) i3c_bus_maintenance_unlock()
> 7) i3c_master_register_fwnode()
> 8) i3c_bus_normaluse_lock()
> 9) i3c_bus_normaluse_unlock()
> 10) i3c_dev_do_xfers_locked()
>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> ---
> Changes in v16:
>  - Rewrite the commit message to match the code, It now describes only
>    the helpers actually exported
>
> Changes in v15:
>  - Drop the direct attach and detach helpers that also modified address-slot
>    state
>  - Export these APIs:
>    - i3c_bus_normaluse_lock()
>    - i3c_bus_normaluse_unlock()
>    - i3c_dev_do_xfers_locked()
>
> Changes in v14:
>  - Add i3c_master_register_fwnode() to register virtual I3C masters with an
>    explicit firmware node
>  - Export i3c_bus_maintenance_lock() and i3c_bus_maintenance_unlock()
>  - Add runtime PM get/put around i3c_master_send_ccc_cmd()
>  - Make i3c_master_supports_ccc_cmd() return false when the controller does
>    not implement send_ccc_cmd()
>
> Changes in v13:
>  - Fix address handling in direct attach by using i3c_master_get_i3c_addrs() and
>    adding rollback on failure to prevent bus address collisions
>  - Fix detach path by clearing master_priv and releasing addresses to avoid use-after-free
>    and stale state issues
>  - Export address slot helper APIs and add kernel-doc for them
>
> Changes in v12:
>  - Add address check in i3c_master_direct_detach_i3c_dev_locked() to skip
>    detach for unaddressed devices.
>
> Changes in v11:
>  - Convert i3c_master_supports_ccc_cmd() to return bool and align
>    semantics with CCC support checks used by the I3C core
>
> Changes in v10:
>  - Rename i3c_master_direct_attach_i3c_dev and i3c_master_direct_detach_i3c_dev
>    APIs to *_locked, as these APIs must be called with the bus lock held in
>    write mode
>
> Changes in v9:
>  - No change
>
> Changes in v8:
>  - No change
>
> Changes in v7:
>  - Update commit message to clarify purpose (prepare for I3C hub support)
>
> Changes in v6:
>  - Split the patch into two parts:
>         1) expose the existing API
>         2) add new APIs.
> ---
> ---
>  drivers/i3c/master.c       | 155 +++++++++++++++++++++++++++++++------
>  include/linux/i3c/master.h |  17 ++++
>  2 files changed, 149 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index f1be38a640ca..03fb41f0786c 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -44,10 +44,11 @@ static BLOCKING_NOTIFIER_HEAD(i3c_bus_notifier);
>   * logic to rely on I3C device information that could be changed behind their
>   * back.
>   */
> -static void i3c_bus_maintenance_lock(struct i3c_bus *bus)
> +void i3c_bus_maintenance_lock(struct i3c_bus *bus)
>  {
>  	down_write(&bus->lock);
>  }
> +EXPORT_SYMBOL_GPL(i3c_bus_maintenance_lock);
>
>  /**
>   * i3c_bus_maintenance_unlock - Release the bus lock after a maintenance
> @@ -58,10 +59,11 @@ static void i3c_bus_maintenance_lock(struct i3c_bus *bus)
>   * i3c_bus_maintenance_lock() for more details on what these maintenance
>   * operations are.
>   */
> -static void i3c_bus_maintenance_unlock(struct i3c_bus *bus)
> +void i3c_bus_maintenance_unlock(struct i3c_bus *bus)
>  {
>  	up_write(&bus->lock);
>  }
> +EXPORT_SYMBOL_GPL(i3c_bus_maintenance_unlock);
>
>  /**
>   * i3c_bus_normaluse_lock - Lock the bus for a normal operation
> @@ -83,6 +85,7 @@ void i3c_bus_normaluse_lock(struct i3c_bus *bus)
>  {
>  	down_read(&bus->lock);
>  }
> +EXPORT_SYMBOL_GPL(i3c_bus_normaluse_lock);
>
>  /**
>   * i3c_bus_normaluse_unlock - Release the bus lock after a normal operation
> @@ -96,6 +99,7 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus)
>  {
>  	up_read(&bus->lock);
>  }
> +EXPORT_SYMBOL_GPL(i3c_bus_normaluse_unlock);
>
>  static struct i3c_master_controller *
>  i3c_bus_to_i3c_master(struct i3c_bus *i3cbus)
> @@ -385,11 +389,19 @@ i3c_bus_get_addr_slot_status_mask(struct i3c_bus *bus, u16 addr, u32 mask)
>  	return status & mask;
>  }
>
> -static enum i3c_addr_slot_status
> +/**
> + * i3c_bus_get_addr_slot_status() - Get I3C bus address slot status
> + * @bus: I3C bus.
> + * @addr: I3C address to query.
> + *
> + * Return: Address slot status for @addr.
> + */
> +enum i3c_addr_slot_status
>  i3c_bus_get_addr_slot_status(struct i3c_bus *bus, u16 addr)
>  {
>  	return i3c_bus_get_addr_slot_status_mask(bus, addr, I3C_ADDR_SLOT_STATUS_MASK);
>  }
> +EXPORT_SYMBOL_GPL(i3c_bus_get_addr_slot_status);
>
>  static void i3c_bus_set_addr_slot_status_mask(struct i3c_bus *bus, u16 addr,
>  					      enum i3c_addr_slot_status status, u32 mask)
> @@ -405,11 +417,18 @@ static void i3c_bus_set_addr_slot_status_mask(struct i3c_bus *bus, u16 addr,
>  	*ptr |= ((unsigned long)status & mask) << (bitpos % BITS_PER_LONG);
>  }
>
> -static void i3c_bus_set_addr_slot_status(struct i3c_bus *bus, u16 addr,
> -					 enum i3c_addr_slot_status status)
> +/**
> + * i3c_bus_set_addr_slot_status() - Set I3C bus address slot status
> + * @bus: I3C bus.
> + * @addr: I3C address to update.
> + * @status: Address slot status to set.
> + */
> +void i3c_bus_set_addr_slot_status(struct i3c_bus *bus, u16 addr,
> +				  enum i3c_addr_slot_status status)
>  {
>  	i3c_bus_set_addr_slot_status_mask(bus, addr, status, I3C_ADDR_SLOT_STATUS_MASK);
>  }
> +EXPORT_SYMBOL_GPL(i3c_bus_set_addr_slot_status);
>
>  static bool i3c_bus_dev_addr_is_avail(struct i3c_bus *bus, u8 addr)
>  {
> @@ -2548,6 +2567,59 @@ static void i3c_master_reconcile_dyn_addrs(struct i3c_master_controller *master)
>  	}
>  }
>
> +/**
> + * i3c_master_supports_ccc_cmd() - check CCC command support
> + * @master: I3C master controller
> + * @cmd: CCC command to verify
> + *
> + * Return: true if @cmd is supported, false otherwise.
> + */
> +bool i3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
> +				 const struct i3c_ccc_cmd *cmd)
> +{
> +	if (!master || !cmd)
> +		return false;
> +
> +	if (!master->ops->send_ccc_cmd)
> +		return false;
> +
> +	if (!master->ops->supports_ccc_cmd)
> +		return true;
> +
> +	return master->ops->supports_ccc_cmd(master, cmd);
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_supports_ccc_cmd);
> +
> +/**
> + * i3c_master_send_ccc_cmd() - send a CCC command
> + * @master: I3C master controller issuing the command
> + * @cmd: CCC command to be sent
> + *
> + * This function sends a Common Command Code (CCC) command to devices on the
> + * I3C bus. It acquires the bus maintenance lock, executes the command, and
> + * then releases the lock to ensure safe access to the bus.
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int i3c_master_send_ccc_cmd(struct i3c_master_controller *master,
> +			    struct i3c_ccc_cmd *cmd)
> +{
> +	int ret;
> +
> +	ret = i3c_master_rpm_get(master);
> +	if (ret)
> +		return ret;
> +
> +	i3c_bus_maintenance_lock(&master->bus);
> +	ret = i3c_master_send_ccc_cmd_locked(master, cmd);
> +	i3c_bus_maintenance_unlock(&master->bus);
> +
> +	i3c_master_rpm_put(master);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_send_ccc_cmd);
> +
>  /**
>   * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
>   * @master: controller
> @@ -3195,34 +3267,31 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
>  }
>
>  /**
> - * i3c_master_register() - register an I3C master
> + * i3c_master_register_fwnode() - register an I3C master with a custom fwnode
>   * @master: master used to send frames on the bus
> - * @parent: the parent device (the one that provides this I3C master
> - *	    controller)
> + * @parent: the parent device providing this I3C master controller
> + * @fwnode: firmware node describing this I3C bus, or NULL
>   * @ops: the master controller operations
> - * @secondary: true if you are registering a secondary master. Will return
> - *	       -EOPNOTSUPP if set to true since secondary masters are not yet
> - *	       supported
> + * @secondary: true if registering a secondary master
>   *
> - * This function takes care of everything for you:
> + * This helper is useful for virtual I3C masters whose firmware node is not
> + * the same as @parent's firmware node.
>   *
> - * - creates and initializes the I3C bus
> - * - populates the bus with static I2C devs if @parent->of_node is not
> - *   NULL
> - * - registers all I3C devices added by the controller during bus
> - *   initialization
> - * - registers the I2C adapter and all I2C devices
> + * Only OF-backed fwnodes are supported for now, because the I3C core still
> + * stores the bus node in master->dev.of_node and populates the bus using OF.
>   *
>   * Return: 0 in case of success, a negative error code otherwise.
>   */
> -int i3c_master_register(struct i3c_master_controller *master,
> -			struct device *parent,
> -			const struct i3c_master_controller_ops *ops,
> -			bool secondary)
> +int i3c_master_register_fwnode(struct i3c_master_controller *master,
> +			       struct device *parent,
> +			       struct fwnode_handle *fwnode,
> +			       const struct i3c_master_controller_ops *ops,
> +			       bool secondary)
>  {
>  	unsigned long i2c_scl_rate = I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE;
>  	struct i3c_bus *i3cbus = i3c_master_get_bus(master);
>  	enum i3c_bus_mode mode = I3C_BUS_MODE_PURE;
> +	struct device_node *np = NULL;
>  	struct i2c_dev_boardinfo *i2cbi;
>  	int ret;
>
> @@ -3234,8 +3303,14 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	if (ret)
>  		return ret;
>
> +	if (fwnode) {
> +		np = to_of_node(fwnode);
> +		if (!np)
> +			return -EINVAL;
> +	}
> +
>  	master->dev.parent = parent;
> -	master->dev.of_node = of_node_get(parent->of_node);
> +	master->dev.of_node = of_node_get(np);
>  	master->dev.bus = &i3c_bus_type;
>  	master->dev.type = &i3c_masterdev_type;
>  	master->dev.release = i3c_masterdev_release;
> @@ -3352,6 +3427,39 @@ int i3c_master_register(struct i3c_master_controller *master,
>
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(i3c_master_register_fwnode);
> +
> +/**
> + * i3c_master_register() - register an I3C master
> + * @master: master used to send frames on the bus
> + * @parent: the parent device (the one that provides this I3C master
> + *	    controller)
> + * @ops: the master controller operations
> + * @secondary: true if you are registering a secondary master. Will return
> + *	       -EOPNOTSUPP if set to true since secondary masters are not yet
> + *	       supported
> + *
> + * This function takes care of everything for you:
> + *
> + * - creates and initializes the I3C bus
> + * - populates the bus with static I2C devs if @parent->of_node is not
> + *   NULL
> + * - registers all I3C devices added by the controller during bus
> + *   initialization
> + * - registers the I2C adapter and all I2C devices
> + *
> + * Return: 0 in case of success, a negative error code otherwise.
> + */
> +int i3c_master_register(struct i3c_master_controller *master,
> +			struct device *parent,
> +			const struct i3c_master_controller_ops *ops,
> +			bool secondary)
> +{
> +	return i3c_master_register_fwnode(master, parent,
> +					  parent->of_node ?
> +					  of_fwnode_handle(parent->of_node) : NULL,
> +					  ops, secondary);
> +}
>  EXPORT_SYMBOL_GPL(i3c_master_register);
>
>  /**
> @@ -3412,6 +3520,7 @@ int i3c_dev_do_xfers_locked(struct i3c_dev_desc *dev, struct i3c_xfer *xfers,
>
>  	return master->ops->i3c_xfers(dev, xfers, nxfers, mode);
>  }
> +EXPORT_SYMBOL_GPL(i3c_dev_do_xfers_locked);
>
>  /**
>   * i3c_dev_disable_ibi_locked() - Disable IBIs coming from a specific device
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 4d2a68793324..32c686ae5d62 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -627,9 +627,18 @@ DEFINE_FREE(i3c_master_dma_unmap_single, void *,
>
>  int i3c_master_reattach_i3c_dev_locked(struct i3c_dev_desc *dev,
>  				       u8 old_dyn_addr);
> +int i3c_master_send_ccc_cmd(struct i3c_master_controller *master,
> +			    struct i3c_ccc_cmd *cmd);
> +bool i3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
> +				 const struct i3c_ccc_cmd *cmd);
>  int i3c_master_set_info(struct i3c_master_controller *master,
>  			const struct i3c_device_info *info);
>
> +int i3c_master_register_fwnode(struct i3c_master_controller *master,
> +			       struct device *parent,
> +			       struct fwnode_handle *fwnode,
> +			       const struct i3c_master_controller_ops *ops,
> +			       bool secondary);
>  int i3c_master_register(struct i3c_master_controller *master,
>  			struct device *parent,
>  			const struct i3c_master_controller_ops *ops,
> @@ -752,4 +761,12 @@ void i3c_for_each_bus_locked(int (*fn)(struct i3c_bus *bus, void *data),
>  int i3c_register_notifier(struct notifier_block *nb);
>  int i3c_unregister_notifier(struct notifier_block *nb);
>
> +enum i3c_addr_slot_status
> +i3c_bus_get_addr_slot_status(struct i3c_bus *bus, u16 addr);
> +
> +void i3c_bus_set_addr_slot_status(struct i3c_bus *bus, u16 addr,
> +				  enum i3c_addr_slot_status status);
> +
> +void i3c_bus_maintenance_lock(struct i3c_bus *bus);
> +void i3c_bus_maintenance_unlock(struct i3c_bus *bus);
>  #endif /* I3C_MASTER_H */
> --
> 2.25.1
>
