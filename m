Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011044.outbound.protection.outlook.com [52.101.70.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A925C50EBEA;
	Fri,  4 Sep 2026 20:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788552377; cv=fail; b=bN4Za0Ycj92YFeX2MyRKJn/6dKQPyCpx7PuVjhpH4gNBjtXlTb/FSKLEzBSN47EB3H1i5y6uTxGUA9kVTbYcC6kh8VmCThTj7YZlLoxpxnTw4fXPBprSxmiiwHA/6ZNtUfKKsLefAJ6W/MidId5soenxMTMMhh83EiL8ZS73OPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788552377; c=relaxed/simple;
	bh=eBRONwHQD0U0YHZe0WrgVm1zhcFjqjyblibWJtbOLOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=H/NfWyBo5KXwdO4mT5rQ+xuYOxPq2+PfX6hol2YEg3n7Xx617uwKIBm57HxvyItoZR483/qbvUCR9gNaVjVz/CR/N1sHss8nx2KO+TE9dSZt3GvSQSqd3cmgx0oU3+980fWXFgKXjq8QBUYqtg+RlO8lr1rrw1IX5xS/t/wBb20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DZuv2q18; arc=fail smtp.client-ip=52.101.70.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DZuv2q18"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/zbkdeOJdQQDEXbN7LV7j4OwwrIzKOBNB4Tt37BCWFrlQaenb3L55A3Gkk1NYb/wT57iqmCGgWjeq2POBsyTNDPJg0sh59EN7dsr7dWZURr4E9rE5BFCxVBoKG5FGtVrswEdXoAhG69d1/FsYgPtCotCbozYhss1ODsnI8InVNAIemOIJvzntRGuaKWuqw8yLY9lIIVyUTe16wX/ffffTlYC+bdaVbAq0Ef3cW3YfLkvPKtXMAAshHVM5DUYRW3ZowHTh3QfnoiV2DqDe9jNxC/ONbROMJvh7vBaAoA1JA341SUKYQRxCtBjiBsB9e2OfQqVPdOdt4XsHhLBJXIUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CmdDcMmnm65ikD5AXe9l3ZwbY0STDhoUDpm7ndoYD4=;
 b=vuFD5Df24cxhiFH9kF4aCDO6aJETGEkR9M/PScLq3YAooCjaDjdrJoOD1qHIcJh6iS6pLJdsk9dZR3yChNKf460+Q+tjlNVmbl3ckJCWcgNg8cqVCHW0CVsG+1+OR23MKBaUEGs3eispXfbc8fM3hkTPCXbsb1Im3xIUHKytjdABwnmd9diZQrN3+bhgIkmqLqUMZnOkWJtXTqdmOdnRsMXVNE6GkJELZnFh0CNExrf1Czq4FKql1tf1gSbwyWTVy83XW3GsJG96Ryv/OFFUdUzWTv0gz3Bnk4gpmDHaByVJyPALVRlkpCynZcuCIcnvr0BcecXq+DLgjxj+U1jh3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CmdDcMmnm65ikD5AXe9l3ZwbY0STDhoUDpm7ndoYD4=;
 b=DZuv2q18XOwF5aDmE5hE5bhieyen9Q6k8FpIT2DjKhBJ59niMpWVmJPtbykuIckg/CoMHjecl35LRrr9xQ2A8aAGuHfwXofM2dq/aV+D77waFHJUyOhta7zjKxGueXr+CZKNSbAIIWAPzTtezw4aIW9RwdFlTDa1DI0K374mG2/7o7VvwnQOi0By+wPQfVz+2nZThrZJk5/zdT09x8a1L65M+L5mwR1NtfEc//+SuTHdjMnUqZdsZe/i3ZamOIsMUFifTJ4YvDJfv0kOxGoyBCoE0BNoz7pKWMxJ6sQ1O3ULeru4d6lOnGppO376AkV9r5L2m83PZS51lv0tNTPYqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by AM9PR04MB7602.eurprd04.prod.outlook.com (2603:10a6:20b:2db::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 20:06:06 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 20:06:06 +0000
Date: Fri, 4 Sep 2026 16:05:37 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, Frank.Li@nxp.com, lgirdwood@gmail.com,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com
Subject: Re: [PATCH v18 6/8] i3c: hub: Add support for the I3C interface in
 the I3C hub
Message-ID: <apskkQ_E8VgFNAvM@lizhi-Precision-Tower-5810>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
 <20260903062108.2712296-7-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903062108.2712296-7-lakshay.piplani@nxp.com>
X-ClientProxiedBy: PH7P220CA0095.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|AM9PR04MB7602:EE_
X-MS-Office365-Filtering-Correlation-Id: 28adf87d-32a7-4beb-36a4-08df0abfecef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|7416014|376014|6133799003|18002099003|22082099003|56012099006|10067099003|4143699003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	SJJ43Wdk+Fgo2tEfbp9s1ootAJ0pXI7gTnhoi6R+1fIZGM2et2fv4yVaCvJ3wqenNvsK5/g6QBUmR9tgvEZ3Uhrdvo+MjO8mASSkpDrUudRcvPXsya9xQFkmgeQPAciGvaOF8j/7ZO4rDg3bBJLV1YD/k1L6S/7FunXxgaVWi127No6beWSgZvaAUJ4b3YBvBsdkS+cFi3nN0rm2sjDjEKEtOXzHnSjAeL/C9H0x046+DG/qk06r9+hYpuUSBX48mH6d31+mIRhQbzA51g1Qi4eWgWbNXQCGzvAOgDAmJ+3F1W1VtL6BxWg0OgEG3uj54Y/XVki9IBc/ZotlXGp/60r5jEKUvbmv47Q62uO3To0oSo6YskGnEMTSx/0UZnBSZ9MR+hAnJ/dhgu6z0/OIhbUquNqSxLyJFMXY5yO+8pPyEklRaXjP16dE1IPEY9tiNYj1oSlMa+DybWFw8EJFdOWmTSBJAyu9LgrLue4EorT+FlKmVyC7WPKrTJMiKvoW+8lazHGFNLqTUkiQxX/iL95e3smUeer93SDoKt8qySaKX16WISf3n+AAEmsNhUF75nSNM30xuUVGX4P2WUHGn2Coif4aNlWf8E3ZqQV9O/MoAeADbHJrnpxacoZMHtS+reB3ilzDWRhgq6Rg8iCDfKvlK++NUPJmNy1QsHI22E8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(7416014)(376014)(6133799003)(18002099003)(22082099003)(56012099006)(10067099003)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uYU9Sv0aY0cBFOJPo/FD0ynJoJfwiY0Ab2squeY45Quir/N45sQ/iJOlmPJm?=
 =?us-ascii?Q?/VzdcQ+jYsB+A3PBNJF8lybaEBR45AvcAcnd+3gm0qovL/+N9U9fdrtbiDVy?=
 =?us-ascii?Q?cA4fjvp5TIR3xCVa4VQPQLw8te+0vO4eZH0/W9Yr415nw0J1X6wKs+TO/Hiq?=
 =?us-ascii?Q?JyZBbm7ipqhjWF0/NjEWNy09G5E+6s/To80FahsaQUD3/HipFM1o5L6blyOM?=
 =?us-ascii?Q?k9SVUVMEeFF8EXNzB1M9Nf8H+C3hypn5v5pvG9KpZWfuXwsMPK0gaLxMex/t?=
 =?us-ascii?Q?gTrngdCgqi4EX/3vG/0uGO4AziQs0Qb+5uMOI4g4VgjLir/Lh77JyaCMgRGz?=
 =?us-ascii?Q?PbY9PvkEg8P/QS6ySuIC3ycU7nO+/jrHr2T68r9anS1L5quzW7knV16gSRpf?=
 =?us-ascii?Q?0hm9isZEu6q6VjodwlgpIrEjb1hon2qfSJgmGOzZNmCpZ3sLCqC4q4GpYsK/?=
 =?us-ascii?Q?kHHHOAxLweWQ9bAhNlJ7AHGLKOvNs1L5YUNxqmVXT6s4cRyK8zWl46P5CRtK?=
 =?us-ascii?Q?nzUM/7zQ/KWw+G2p95z3IqqJvTMhEAMjNw7Q4Kc5oU5ybYh03tWAh7iq35Xr?=
 =?us-ascii?Q?/vtX/5BJZH0PK9RTHV2Szf4GkfrqyS1EbKWGj/N1Vkh6sANbB+SV7fH/9xvr?=
 =?us-ascii?Q?jv3+GlSNWB6EotvZL+0NIDT95YyJc7HCXDur06qjspKSDfVVQnCa4YT05FNY?=
 =?us-ascii?Q?Ez53Dw7QZ5GfUJGXFxD8uGqfKSn3ayqopOpQCQEpmPbA/CR+FoH2/De266WF?=
 =?us-ascii?Q?pEPrgwNB1fcl47esLml9kGUcNwUQFaKvwgEQ78rP3T+/QjHTcmeLP4xvby2b?=
 =?us-ascii?Q?yfvova5IsEGjf05mGz7jVSGBmyScyBlx7B+y4V4pD3Fm6kFjJL3k1nVwnWd5?=
 =?us-ascii?Q?FFXx0xxAuwy7gorUCjgBMq2cIThlaNQRwU+KebpERgjxMHaVXjKwBBLl+43G?=
 =?us-ascii?Q?WFI7O4TWND/1zIzg8iQgLdBhttZIvbNP1Omf/nJq+PfYLYJuN3lxuuYUhw8E?=
 =?us-ascii?Q?6Vxok2Uru8aN3N85R6J9PDeqC6qd/Z1Yc1a0jzuGBJGckXcA+QSXc10443+6?=
 =?us-ascii?Q?2ijnd0knhBjQ5krqQ//0HKmbd/tCbZ6tuiN9m73dYRbXRojcXC+rPDErnraU?=
 =?us-ascii?Q?JNMtyQj0I/z2/RQ83QPTTE4UG0PJWOlOxyxVXgfn8Wo5Y9HQ1r29hrRSVJLA?=
 =?us-ascii?Q?RnTHqrpci9x0LnQ5AhyVPN2zirkLyd3aGRsFvVtHAV7zLohepZ1QKA4/CwGG?=
 =?us-ascii?Q?jiwFcHKeQyBfWWA9PJFHwqchMl2kxaqY+n+jyQmr90tXqOiNSesuXrJ7TVeU?=
 =?us-ascii?Q?MQ/lomc4ld4RLUQBFC/7tkhJ+EMjecp0YCDjqvxFoS6tzC0pQ6FrOnqqT6Dz?=
 =?us-ascii?Q?GlOAbeIQ+UqhKUsP/fSjlhRW38LftP2/iWmv3Fbr/sAYqPlIn0HMDuWGl9BL?=
 =?us-ascii?Q?Iy5SaCrEIZw4DfiodPwSCsxlb+1fayCtc7zbIvDtwpPNsBT6ixwkAV8nCqE2?=
 =?us-ascii?Q?XaFVOBRsPKUpBzCasC6cRjJiHNPUTeJf0+UHD11MgylPAQPRnTm1KQSygod6?=
 =?us-ascii?Q?D3LT79JlzSKoBZnJWxbfl6INO17rOgwGOeNQ+m6DSKejim5Sa0Y8Qbu+4BOx?=
 =?us-ascii?Q?mhuZmXsuph+JIsj4+j65C4JWWwS5qtH15BT0y0W8A8KlUkl25czCnPuXDe1+?=
 =?us-ascii?Q?dPrjGSvTjnhagINLrKdngh3kV8+E85z3u8yssEmNyxGLIH4QpqE54KPc36Ri?=
 =?us-ascii?Q?xczygg8s/dYgCInJJxDMQbv0ZBK5kR9V1bEBRX23ktBz74vPPRe2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28adf87d-32a7-4beb-36a4-08df0abfecef
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 20:06:06.1717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /VGdlHCheHCdJ91zKdfr+zkn2ekifqUymt5M04Vod50t3rPC0pVxKVb+UpVVPfbZCYNxIP5Tlq2KBpIls90NgUWL7wHfo88frVb/rue0D7RSV9wEV9vMj2B1w0m/02Jg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7602

On Thu, Sep 03, 2026 at 11:51:06AM +0530, Lakshay Piplani wrote:
> Add virtual I3C bus support for the hub and provide interface to enable
> or disable downstream ports.
>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Changes in v18:
>  - Rebased onto v7.3-rc1; no intended driver behaviour changes
>
> Changes in v17:
>  - Move the lockdep-only routing-lock class assignment into a dedicated
>    helper, leaving hub context initialization unconditional when
>    CONFIG_LOCKDEP is disabled
>  - Document that hub_dev must already be registered and remove the
>    WARN_ON_ONCE checks for its descriptor and parent controller
>  - Export i3c_hub_master_ops as a const object and reference it directly
>    instead of returning it through an accessor
>  - Document that downstream ports share the parent controller's dynamic
>    address domain and that independent per-port DAA domains are not
>    provided
>  - Document that a broadcast CCC on a virtual bus reaches the parent bus
>    and devices behind other connected ports; directed CCCs must be used
>    for per-device scope
>  - Document that fixed-DT address reservations remain allocated for the
>    lifetime of the parent bus, are reused across driver reprobes, and
>    that downstream hot-join support would also require reserving static
>    addresses
>
> Changes in v16:
>  - Fix the lockdep "recursive locking" false positive on the forwarding path
>    (holding the virtual bus lock while taking the parent bus lock, both
>    sharing one class). Introduce per-nesting-depth lock_class_key arrays for
>    the bus lock and the routing mutex, computed via
>    i3c_hub_controller_depth(), assigned in i3c_hub_master_bus_init() and
>    i3c_hub_init()
>  - Fix the parent-bus dynamic-address reservation: reserve by
>    "assigned-address" regardless of the static address (the old
>    static_addr != assigned_addr skip left addresses free and risked ENTDAA
>    collisions). Reserve only when the slot is currently FREE, under the
>    parent bus maintenance lock
>  - Make the reattach info update atomic w.r.t. asynchronous IBI: update
>    parent_desc.info under i3c_bus_maintenance_lock(&parent->bus) and reject
>    reattach with -EBUSY (WARN_ON_ONCE) while parent_desc.ibi is live
>  - Document and check the detach-time IBI lifecycle invariant:
>    parent_desc.ibi must already have been cleared through i3c_hub_free_ibi()
>    before the parent-facing descriptor is detached and freed. Add
>    WARN_ON_ONCE() to detect a violation. The underlying generic I3C-core
>    unregister/IBI-quiesce behaviour is a known I3C-core limitation
>  - Document that DAA is intentionally run on the parent controller because
>    downstream devices share the parent's dynamic-address space; broadcast
>    RSTDAA is intentionally not forwarded (would reset the hub address)
>
> Changes in v15:
>  - Replace temporary descriptor reparenting and hub-address switching with
>    a permanent parent-facing descriptor for each downstream I3C device
>  - Keep the logical device descriptor associated with the virtual hub
>    controller while using the parent-facing descriptor for physical
>    controller operations
>  - Implement downstream device attach, reattach and detach using the new
>    controller-only helpers
>  - Forward IBI slot recycling to the physical parent controller
>  - Remove the helper that temporarily changed the logical descriptor's
>    master pointer
>
> Changes in v14:
>  - Add hub route serialization around DAA, CCC, private transfer and IBI paths
>  - Add comments explaining that downstream devices behind hub target ports
>    share the parent controller address space
>  - Use i3c_bus_maintenance_lock()/unlock() instead of raw parent bus lock
>    operations
>  - Hold the parent maintenance lock across temporary hub address reattach,
>    transfer and address restore
>  - Rework IBI request/free forwarding, so downstream devices are temporarily
>    attached to the parent controller for IBI setup
>  - Clean up the preallocated virtual IBI object and workqueue before forwarding
>    the IBI request to the parent controller
>  - Avoid NULL dereference in the core IBI free path when the forwarding
>    callback has already cleared dev->ibi
>
> Changes in v13:
>  - Reserve parent I3C bus address slots for downstream devices with matching static and
>    assigned addresses by parsing target-port DT nodes
>  - Keep broadcast RSTDAA blocked and add explanatory comment
>  - Add TODO for empty IBI slot recycle callback
>  - Add comments for intentional no-op callbacks
>
> Changes in v12:
>  - Drop redundant depends on I3C from config I3C_HUB
>  - Return -EOPNOTSUPP for unsupported I2C transfers instead of reporting
>    success.
>
> Changes in v11:
>  - Fix virtual hub address reattach handling
>  - Fix parent bus locking during address reattach operations
>  - Improve transfer and IBI request error handling
>
> Changes in v10:
>  - Remove unnecessary ibi_lock handling in request/enable/disable/free
>    IBI APIs
>  - Remove redundant parent pointer from struct i3c_hub and derive upstream
>    master from hub_dev
>
> Changes in v9:
>  - No change
>
> Changes in v8:
>  - No change
>
> Changes in v7:
>  - Convert Kconfig option to tristate
>  - Fix signedness issue in return value
>  - Fix kernel-doc warnings
>
> Changes in v6:
>  - Add support for the generic I3C interface in the I3C Hub
> ---
> ---
>  MAINTAINERS             |   2 +
>  drivers/i3c/Kconfig     |  14 +
>  drivers/i3c/Makefile    |   1 +
>  drivers/i3c/hub.c       | 832 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/i3c/hub.h |  92 +++++
>  5 files changed, 941 insertions(+)
>  create mode 100644 drivers/i3c/hub.c
>  create mode 100644 include/linux/i3c/hub.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bdf54313bc5f..652ed83d2dee 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19771,8 +19771,10 @@ L:	linux-kernel@vger.kernel.org
>  L:	linux-i3c@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> +F:	drivers/i3c/hub.c
>  F:	drivers/mfd/p3h2840.c
>  F:	drivers/regulator/p3h2840_i3c_hub_regulator.c
> +F:	include/linux/i3c/hub.h
>  F:	include/linux/mfd/p3h2840.h
>
>  NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
> diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
> index 626c54b386d5..7536f3740c94 100644
> --- a/drivers/i3c/Kconfig
> +++ b/drivers/i3c/Kconfig
> @@ -21,6 +21,20 @@ menuconfig I3C
>
>  if I3C
>  source "drivers/i3c/master/Kconfig"
> +
> +config I3C_HUB
> +	tristate "I3C Hub Support"
> +	help
> +	  Enable support for the I3C interface in hub devices.
> +
> +	  This option adds virtual I3C bus support for hubs by creating
> +	  virtual master controllers for downstream ports and forwarding
> +	  bus operations through the hub device. It also provides an
> +	  interface used by hub drivers to enable or disable downstream
> +	  ports during bus transactions.
> +
> +	  Say Y here if your platform includes an I3C hub device
> +
>  endif # I3C
>
>  config I3C_OR_I2C
> diff --git a/drivers/i3c/Makefile b/drivers/i3c/Makefile
> index 11982efbc6d9..9ddee56a6338 100644
> --- a/drivers/i3c/Makefile
> +++ b/drivers/i3c/Makefile
> @@ -2,3 +2,4 @@
>  i3c-y				:= device.o master.o
>  obj-$(CONFIG_I3C)		+= i3c.o
>  obj-$(CONFIG_I3C)		+= master/
> +obj-$(CONFIG_I3C_HUB)		+= hub.o
> diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
> new file mode 100644
> index 000000000000..539028768084
> --- /dev/null
> +++ b/drivers/i3c/hub.c
> @@ -0,0 +1,832 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2026 NXP
> + * Generic I3C Hub core implementing virtual controller operations.
> + */
> +#include <linux/i3c/device.h>
> +#include <linux/i3c/hub.h>
> +#include <linux/lockdep.h>
> +
> +#include "internals.h"
> +
> +/**
> + * struct i3c_hub_dev_data - Per-downstream-device hub state
> + * @parent_desc: Permanent parent-facing descriptor whose master points at the
> + *		 physical parent controller, used to forward controller-specific
> + *		 operations there.
> + *
> + * The logical descriptor on the virtual hub bus keeps its master aimed at the
> + * virtual hub controller and is never modified. This separate descriptor lets
> + * the controller-only core helpers resolve the physical parent without racing
> + * concurrent readers on the virtual bus.
> + */
> +struct i3c_hub_dev_data {
> +	struct i3c_dev_desc parent_desc;
> +};
> +
> +/*
> + * All i3c_bus rw_semaphores are initialized from a single call site in the
> + * I3C core, so lockdep assigns them one shared class. When a hub forwards an
> + * operation it takes the parent bus lock while already holding its own virtual
> + * bus lock, which lockdep then reports as recursive locking on that shared
> + * class. The bus maintenance and normal-use helpers use plain down_write() and
> + * down_read(), which always acquire with subclass 0, so lockdep_set_subclass()
> + * cannot separate them; a distinct lock_class_key per nesting level is used
> + * instead.
> + *
> + * A top-level hub uses depth 1, a hub behind another hub uses depth 2, and so
> + * on, so a virtual bus lock never shares a class with the parent bus lock it
> + * nests under. Sibling ports on the same hub share a class, which is safe
> + * because they are never nested against each other. The array must stay a
> + * file-local definition: lockdep keys are identified by their address, so a
> + * single set of unique objects is required.
> + *
> + * The depth bound is generous; exceeding it only loses lockdep coverage, not
> + * correctness.
> + */
> +#define I3C_HUB_MAX_LOCK_DEPTH 8
> +static struct lock_class_key i3c_hub_bus_lock_keys[I3C_HUB_MAX_LOCK_DEPTH];
> +
> +/*
> + * The hub routing mutex (hub->lock) serializes port switching and forwarding.
> + * A child hub holds its routing mutex while reaching a parent hub that takes
> + * its own, so it needs the same per-depth lock_class_key treatment as the bus
> + * lock above, keyed identically (top-level hub depth 1, and so on). The class
> + * is assigned once in i3c_hub_init(), not per port, because all ports on a hub
> + * share this single routing mutex.
> + */
> +static struct lock_class_key i3c_hub_routing_lock_keys[I3C_HUB_MAX_LOCK_DEPTH];
> +
> +/**
> + * i3c_hub_controller_depth() - Count hub nesting levels above a controller
> + * @controller: Virtual hub controller being initialized
> + *
> + * Walk the parent chain and count how many stacked hub controllers lead to
> + * @controller. A top-level hub attached to a physical controller returns 1.
> + * The walk stops at the first non-hub (physical) controller.
> + *
> + * Return: The hub nesting depth (>= 1 for a hub controller).
> + */
> +static unsigned int
> +i3c_hub_controller_depth(struct i3c_master_controller *controller)
> +{
> +	struct i3c_hub_controller *hub_controller;
> +	unsigned int depth = 0;
> +
> +	while (controller && controller->ops == &i3c_hub_master_ops) {
> +		hub_controller = dev_get_drvdata(&controller->dev);
> +		if (!hub_controller)
> +			break;
> +		controller = hub_controller->parent;
> +		depth++;
> +	}
> +
> +	return depth;
> +}
> +
> +/**
> + * i3c_hub_master_bus_init() - Bind controller to hub device
> + * @controller: Virtual controller for a hub port
> + *
> + * Associates the virtual controller with the hub device descriptor so that
> + * transfers are executed through the hub on the parent bus.
> + */
> +static int i3c_hub_master_bus_init(struct i3c_master_controller *controller)
> +{
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_hub *hub;
> +	unsigned int depth;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub = hub_controller->hub;
> +
> +	if (!hub->hub_dev)
> +		return -ENODEV;
> +
> +	/*
> +	 * Give this virtual bus lock a lockdep class keyed on its hub nesting
> +	 * depth before the core runs the first DAA (which forwards to the
> +	 * parent bus and takes the parent lock while this one is held). The
> +	 * lock is not held here, and controller->ops is already set, so the
> +	 * class can be assigned safely. Deeper hubs than the key array
> +	 * supports fall back to the shared class and may warn under lockdep,
> +	 * but still function correctly.
> +	 */
> +	depth = i3c_hub_controller_depth(controller);
> +	if (depth >= 1 && depth <= I3C_HUB_MAX_LOCK_DEPTH)
> +		lockdep_set_class(&controller->bus.lock,
> +				  &i3c_hub_bus_lock_keys[depth - 1]);
> +	else
> +		WARN_ONCE(1, "i3c-hub: nesting depth %u exceeds lockdep support\n",
> +			  depth);
> +
> +	controller->this = hub->hub_dev->desc;
> +	return 0;
> +}
> +
> +static void i3c_hub_master_bus_cleanup(struct i3c_master_controller *controller)
> +{
> +	controller->this = NULL;
> +}
> +
> +static int i3c_hub_attach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *controller = i3c_dev_get_master(dev);
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_hub_dev_data *data;
> +	struct i3c_master_controller *parent;
> +	struct i3c_hub *hub;
> +	int ret;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub = hub_controller->hub;
> +	if (!hub->hub_dev)
> +		return -ENODEV;
> +
> +	parent = i3c_dev_get_master(hub->hub_dev->desc);
> +	if (!parent)
> +		return -ENODEV;
> +
> +	data = kzalloc_obj(*data);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	/* Initialize the parent-facing descriptor to target the physical parent. */
> +	INIT_LIST_HEAD(&data->parent_desc.common.node);
> +	mutex_init(&data->parent_desc.ibi_lock);
> +
> +	data->parent_desc.common.master = parent;
> +	data->parent_desc.info = dev->info;
> +
> +	i3c_bus_maintenance_lock(&parent->bus);
> +	ret = i3c_master_attach_i3c_dev_controller_locked(&data->parent_desc);
> +	i3c_bus_maintenance_unlock(&parent->bus);
> +	if (ret) {
> +		mutex_destroy(&data->parent_desc.ibi_lock);
> +		kfree(data);
> +		return ret;
> +	}
> +
> +	/* Link the hub-private data (see struct i3c_hub_dev_data). */
> +	i3c_dev_set_master_data(dev, data);
> +
> +	return 0;
> +}
> +
> +static int i3c_hub_reattach_i3c_dev(struct i3c_dev_desc *dev,
> +				    u8 old_dyn_addr)
> +{
> +	struct i3c_hub_dev_data *data = i3c_dev_get_master_data(dev);
> +	struct i3c_master_controller *parent;
> +	int ret;
> +
> +	if (!data)
> +		return -ENODEV;
> +
> +	parent = i3c_dev_get_master(&data->parent_desc);
> +	if (!parent)
> +		return -ENODEV;
> +
> +	/*
> +	 * Reattach must not race asynchronous IBI delivery on the parent-facing
> +	 * descriptor. Once IBI resources are requested the parent controller may
> +	 * use parent_desc concurrently, so reject a reattach that arrives while
> +	 * the generic IBI object is still live.
> +	 */
> +	if (WARN_ON_ONCE(data->parent_desc.ibi))
> +		return -EBUSY;
> +
> +	/*
> +	 * Re-sync device information after the address change and reattach
> +	 * under the parent bus lock so both updates are applied as one
> +	 * operation with respect to parent controller state.
> +	 */
> +	i3c_bus_maintenance_lock(&parent->bus);
> +	data->parent_desc.info = dev->info;
> +	ret = i3c_master_reattach_i3c_dev_controller_locked(&data->parent_desc,
> +							    old_dyn_addr);
> +	i3c_bus_maintenance_unlock(&parent->bus);
> +
> +	return ret;
> +}
> +
> +static void i3c_hub_detach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_hub_dev_data *data = i3c_dev_get_master_data(dev);
> +	struct i3c_master_controller *parent;
> +
> +	if (!data)
> +		return;
> +
> +	parent = i3c_dev_get_master(&data->parent_desc);
> +
> +	/*
> +	 * parent_desc.ibi should already be cleared by i3c_hub_free_ibi()
> +	 * before we get here. If it is still set, the kfree(data) below frees
> +	 * a descriptor the parent controller can still reach via un-flushed
> +	 * asynchronous IBI work (use-after-free, not just a leak).
> +	 */
> +	WARN_ON_ONCE(data->parent_desc.ibi);
> +
> +	if (parent) {
> +		i3c_bus_maintenance_lock(&parent->bus);
> +		i3c_master_detach_i3c_dev_controller_locked(&data->parent_desc);
> +		i3c_bus_maintenance_unlock(&parent->bus);
> +	}
> +
> +	i3c_dev_set_master_data(dev, NULL);
> +	mutex_destroy(&data->parent_desc.ibi_lock);
> +	kfree(data);
> +}
> +
> +/**
> + * i3c_hub_do_daa() - Perform DAA via hub port
> + * @hub: Hub instance
> + * @controller: Virtual controller for a hub port
> + *
> + * Enables the port connection, performs DAA on the parent controller,
> + * then disables the connection.
> + */
> +static int i3c_hub_do_daa(struct i3c_hub *hub,
> +			  struct i3c_master_controller *controller)
> +{
> +	struct i3c_master_controller *parent;
> +	int ret;
> +
> +	if (!hub || !hub->hub_dev)
> +		return -ENODEV;
> +
> +	parent = i3c_dev_get_master(hub->hub_dev->desc);
> +	if (!parent)
> +		return -ENODEV;
> +
> +	/*
> +	 * Lock order: hub routing mutex before the parent bus lock (taken here
> +	 * inside i3c_master_do_daa()). The depth-keyed lockdep classes above
> +	 * keep this nesting acyclic when the parent is itself a hub.
> +	 */
> +	mutex_lock(&hub->lock);
> +	i3c_hub_enable_port(controller);
> +
> +	/*
> +	 * Downstream devices reachable through hub target-port routes share the
> +	 * parent controller's I3C address space. The hub gates access to a
> +	 * target-port network, but it does not create an independent dynamic
> +	 * address domain per virtual bus.
> +	 *
> +	 * Run DAA on the parent controller so dynamic addresses remain unique
> +	 * across all downstream devices, even when they are behind different
> +	 * target ports.
> +	 *
> +	 * The current hub model shares the parent controller's dynamic-address
> +	 * domain and does not support independent per-port DAA domains, so a
> +	 * DAA result does not go stale behind a port toggle. Addresses reserved
> +	 * from the Device Tree are held for the lifetime of the parent bus and
> +	 * are never released on a port toggle, so enabling or disabling a port
> +	 * only gates reachability and never causes an address to be handed out
> +	 * twice.
> +	 */
> +	ret = i3c_master_do_daa(parent);
> +	i3c_hub_disable_port(controller);
> +	mutex_unlock(&hub->lock);
> +
> +	return ret;
> +}
> +
> +static bool i3c_hub_supports_ccc_cmd(struct i3c_hub *hub,
> +				     const struct i3c_ccc_cmd *cmd)
> +{
> +	struct i3c_master_controller *parent;
> +
> +	if (!hub || !hub->hub_dev)
> +		return false;
> +
> +	parent = i3c_dev_get_master(hub->hub_dev->desc);
> +	if (!parent)
> +		return false;
> +
> +	return i3c_master_supports_ccc_cmd(parent, cmd);
> +}
> +
> +/**
> + * i3c_hub_send_ccc_cmd() - Send CCC through hub port
> + * @hub: Hub instance
> + * @controller: Virtual controller
> + * @cmd: CCC command
> + *
> + * Enables the port connection while issuing CCC on the parent controller.
> + *
> + * A hub does not isolate the CCC address space of its virtual buses from the
> + * parent bus. A broadcast CCC issued on one virtual bus is forwarded to the
> + * parent controller and therefore reaches every device on the parent bus, as
> + * well as the downstream devices of any other connected target port. Drivers
> + * that need per-device scope must use the directed form of the command.
> + */
> +static int i3c_hub_send_ccc_cmd(struct i3c_hub *hub,
> +				struct i3c_master_controller *controller,
> +				struct i3c_ccc_cmd *cmd)
> +{
> +	struct i3c_master_controller *parent;
> +	int ret;
> +
> +	if (!hub || !hub->hub_dev)
> +		return -ENODEV;
> +
> +	parent = i3c_dev_get_master(hub->hub_dev->desc);
> +	if (!parent)
> +		return -ENODEV;
> +
> +	mutex_lock(&hub->lock);
> +	i3c_hub_enable_port(controller);
> +	ret = i3c_master_send_ccc_cmd(parent, cmd);
> +	i3c_hub_disable_port(controller);
> +	mutex_unlock(&hub->lock);
> +
> +	return ret;
> +}
> +
> +/**
> + * i3c_hub_master_priv_xfers() - Execute private transfers via hub
> + * @dev: Target device descriptor
> + * @xfers: Transfer array
> + * @nxfers: Number of transfers
> + * @mode: Transfer mode (SDR, HDR, etc.)
> + *
> + * Refreshes the parent-facing device info (while no IBI is pending) and
> + * forwards private transfers through the hub to the parent controller.
> + */
> +static int i3c_hub_master_priv_xfers(struct i3c_dev_desc *dev,
> +				     struct i3c_xfer *xfers,
> +				     int nxfers,
> +				     enum i3c_xfer_mode mode)
> +{
> +	struct i3c_master_controller *controller = i3c_dev_get_master(dev);
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_master_controller *parent;
> +	struct i3c_hub_dev_data *data;
> +	struct i3c_hub *hub;
> +	int ret;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub = hub_controller->hub;
> +
> +	data = i3c_dev_get_master_data(dev);
> +	if (!data)
> +		return -ENODEV;
> +
> +	parent = i3c_dev_get_master(&data->parent_desc);
> +	if (!parent)
> +		return -ENODEV;
> +
> +	/* Lock order: hub routing mutex before the parent bus lock (see do_daa). */
> +	mutex_lock(&hub->lock);
> +
> +	/*
> +	 * Only refresh the parent-facing info while no IBI is requested; once
> +	 * parent_desc.ibi is set it must stay immutable (see i3c_hub_request_ibi()).
> +	 */
> +	if (!data->parent_desc.ibi)
> +		data->parent_desc.info = dev->info;
> +
> +	i3c_hub_enable_port(controller);
> +
> +	i3c_bus_normaluse_lock(&parent->bus);
> +	ret = i3c_dev_do_xfers_locked(&data->parent_desc, xfers,
> +				      nxfers, mode);
> +	i3c_bus_normaluse_unlock(&parent->bus);
> +
> +	i3c_hub_disable_port(controller);
> +
> +	mutex_unlock(&hub->lock);
> +
> +	return ret;
> +}
> +
> +static int i3c_hub_attach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static void i3c_hub_detach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +}
> +
> +static int i3c_hub_i2c_xfers(struct i2c_dev_desc *dev,
> +			     struct i2c_msg *xfers, int nxfers)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static int i3c_hub_master_do_daa(struct i3c_master_controller *controller)
> +{
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_hub *hub;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub = hub_controller->hub;
> +
> +	return i3c_hub_do_daa(hub, controller);
> +}
> +
> +static int i3c_hub_master_send_ccc_cmd(struct i3c_master_controller *controller,
> +				       struct i3c_ccc_cmd *cmd)
> +{
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_hub *hub;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub = hub_controller->hub;
> +
> +	if (!hub->hub_dev)
> +		return -ENODEV;
> +
> +	/*
> +	 * Do not forward broadcast RSTDAA through the hub. The hub itself
> +	 * is visible on the parent bus, so forwarding RSTDAA would also
> +	 * reset the hub dynamic address. Downstream RSTDAA is not supported
> +	 * by the hub virtual-controller model.
> +	 */
> +	if (cmd->id == I3C_CCC_RSTDAA(true))
> +		return 0;
> +
> +	return i3c_hub_send_ccc_cmd(hub, controller, cmd);
> +}
> +
> +static bool i3c_hub_master_supports_ccc_cmd(struct i3c_master_controller *controller,
> +					    const struct i3c_ccc_cmd *cmd)
> +{
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_hub *hub;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return false;
> +
> +	hub = hub_controller->hub;
> +
> +	return i3c_hub_supports_ccc_cmd(hub, cmd);
> +}
> +
> +/**
> + * i3c_hub_request_ibi() - Request IBI through parent controller
> + * @desc: Target device descriptor
> + * @req: IBI setup
> + *
> + * Publishes the generic IBI object on the permanent parent-facing descriptor
> + * and requests IBI for a device connected through the hub. The parent-facing
> + * descriptor references the same IBI object so the physical controller uses
> + * the logical workqueue, pending counter and client device during
> + * asynchronous IBI delivery.
> + */
> +static int i3c_hub_request_ibi(struct i3c_dev_desc *desc,
> +			       const struct i3c_ibi_setup *req)
> +{
> +	struct i3c_master_controller *controller = i3c_dev_get_master(desc);
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_master_controller *parent;
> +	struct i3c_hub_dev_data *data;
> +	struct i3c_hub *hub;
> +	int ret;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub = hub_controller->hub;
> +
> +	data = i3c_dev_get_master_data(desc);
> +	if (!data)
> +		return -ENODEV;
> +
> +	parent = i3c_dev_get_master(&data->parent_desc);
> +	if (!parent)
> +		return -ENODEV;
> +
> +	/*
> +	 * Publish the final device information snapshot together with the
> +	 * generic IBI object under hub->lock. Keep the parent-facing
> +	 * information immutable while parent_desc.ibi is set and the parent
> +	 * controller may use the descriptor asynchronously.
> +	 */
> +	mutex_lock(&hub->lock);
> +	data->parent_desc.info = desc->info;
> +	data->parent_desc.dev = desc->dev;
> +	data->parent_desc.ibi = desc->ibi;
> +	mutex_unlock(&hub->lock);
> +
> +	i3c_bus_normaluse_lock(&parent->bus);
> +	ret = i3c_dev_request_ibi_controller_locked(&data->parent_desc, req);
> +	i3c_bus_normaluse_unlock(&parent->bus);
> +
> +	if (ret) {
> +		mutex_lock(&hub->lock);
> +		data->parent_desc.ibi = NULL;
> +		data->parent_desc.dev = NULL;
> +		mutex_unlock(&hub->lock);
> +	}
> +
> +	return ret;
> +}
> +
> +static void i3c_hub_free_ibi(struct i3c_dev_desc *desc)
> +{
> +	struct i3c_master_controller *controller = i3c_dev_get_master(desc);
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_master_controller *parent;
> +	struct i3c_hub_dev_data *data;
> +	struct i3c_hub *hub;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return;
> +
> +	hub = hub_controller->hub;
> +
> +	data = i3c_dev_get_master_data(desc);
> +	if (!data || !data->parent_desc.ibi)
> +		return;
> +
> +	parent = i3c_dev_get_master(&data->parent_desc);
> +	if (!parent)
> +		return;
> +
> +	i3c_bus_normaluse_lock(&parent->bus);
> +	i3c_dev_free_ibi_controller_locked(&data->parent_desc);
> +	i3c_bus_normaluse_unlock(&parent->bus);
> +
> +	/*
> +	 * The outer generic IBI free path owns and releases desc->ibi after
> +	 * this callback returns.
> +	 */
> +	mutex_lock(&hub->lock);
> +	data->parent_desc.ibi = NULL;
> +	data->parent_desc.dev = NULL;
> +	mutex_unlock(&hub->lock);
> +}
> +
> +/**
> + * i3c_hub_enable_ibi() - Enable IBI via hub port
> + * @desc: Target device descriptor
> + *
> + * Enables port connection and forwards the IBI enable request to the parent
> + * controller.
> + */
> +static int i3c_hub_enable_ibi(struct i3c_dev_desc *desc)
> +{
> +	struct i3c_master_controller *controller = i3c_dev_get_master(desc);
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_master_controller *parent;
> +	struct i3c_hub_dev_data *data;
> +	struct i3c_hub *hub;
> +	int ret;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub = hub_controller->hub;
> +
> +	data = i3c_dev_get_master_data(desc);
> +	if (!data || !data->parent_desc.ibi)
> +		return -ENODEV;
> +
> +	parent = i3c_dev_get_master(&data->parent_desc);
> +	if (!parent)
> +		return -ENODEV;
> +
> +	mutex_lock(&hub->lock);
> +
> +	i3c_hub_enable_port(controller);
> +
> +	i3c_bus_maintenance_lock(&parent->bus);
> +	ret = i3c_dev_enable_ibi_controller_locked(&data->parent_desc);
> +	i3c_bus_maintenance_unlock(&parent->bus);
> +
> +	i3c_hub_disable_port(controller);
> +
> +	mutex_unlock(&hub->lock);
> +
> +	return ret;
> +}
> +
> +/**
> + * i3c_hub_disable_ibi() - Disable IBI via hub port
> + * @desc: Target device descriptor
> + *
> + * Enables port connection and forwards the IBI disable request to the parent
> + * controller.
> + */
> +static int i3c_hub_disable_ibi(struct i3c_dev_desc *desc)
> +{
> +	struct i3c_master_controller *controller = i3c_dev_get_master(desc);
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_master_controller *parent;
> +	struct i3c_hub_dev_data *data;
> +	struct i3c_hub *hub;
> +	int ret;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub = hub_controller->hub;
> +
> +	data = i3c_dev_get_master_data(desc);
> +	if (!data || !data->parent_desc.ibi)
> +		return -ENODEV;
> +
> +	parent = i3c_dev_get_master(&data->parent_desc);
> +	if (!parent)
> +		return -ENODEV;
> +
> +	mutex_lock(&hub->lock);
> +
> +	i3c_hub_enable_port(controller);
> +
> +	i3c_bus_maintenance_lock(&parent->bus);
> +	ret = i3c_dev_disable_ibi_controller_locked(&data->parent_desc);
> +	i3c_bus_maintenance_unlock(&parent->bus);
> +
> +	i3c_hub_disable_port(controller);
> +
> +	mutex_unlock(&hub->lock);
> +
> +	return ret;
> +}
> +
> +static void i3c_hub_recycle_ibi_slot(struct i3c_dev_desc *desc,
> +				     struct i3c_ibi_slot *slot)
> +{
> +	struct i3c_hub_dev_data *data = i3c_dev_get_master_data(desc);
> +
> +	if (!data)
> +		return;
> +
> +	i3c_dev_recycle_ibi_slot_controller(&data->parent_desc, slot);
> +}
> +
> +const struct i3c_master_controller_ops i3c_hub_master_ops = {
> +	.bus_init = i3c_hub_master_bus_init,
> +	.bus_cleanup = i3c_hub_master_bus_cleanup,
> +	.attach_i3c_dev = i3c_hub_attach_i3c_dev,
> +	.reattach_i3c_dev = i3c_hub_reattach_i3c_dev,
> +	.detach_i3c_dev = i3c_hub_detach_i3c_dev,
> +	.do_daa = i3c_hub_master_do_daa,
> +	.supports_ccc_cmd = i3c_hub_master_supports_ccc_cmd,
> +	.send_ccc_cmd = i3c_hub_master_send_ccc_cmd,
> +	.i3c_xfers = i3c_hub_master_priv_xfers,
> +	.attach_i2c_dev = i3c_hub_attach_i2c_dev,
> +	.detach_i2c_dev = i3c_hub_detach_i2c_dev,
> +	.i2c_xfers = i3c_hub_i2c_xfers,
> +	.request_ibi = i3c_hub_request_ibi,
> +	.free_ibi = i3c_hub_free_ibi,
> +	.enable_ibi = i3c_hub_enable_ibi,
> +	.disable_ibi = i3c_hub_disable_ibi,
> +	.recycle_ibi_slot = i3c_hub_recycle_ibi_slot,
> +};
> +EXPORT_SYMBOL_GPL(i3c_hub_master_ops);
> +
> +/**
> + * i3c_hub_set_routing_lock_class() - Key the routing mutex for lockdep
> + * @hub: Hub instance whose routing mutex has just been initialized
> + *
> + * Give @hub->lock a lockdep class keyed on the hub nesting depth, so that a
> + * child hub taking its routing mutex while a parent hub holds its own is not
> + * reported as recursive locking. Does nothing when lockdep is disabled.
> + */
> +static void i3c_hub_set_routing_lock_class(struct i3c_hub *hub)
> +{
> +	struct i3c_master_controller *parent;
> +	unsigned int depth;
> +
> +	if (!IS_ENABLED(CONFIG_LOCKDEP))
> +		return;
> +
> +	/*
> +	 * The routing mutex has the same hub nesting depth as the virtual
> +	 * controllers this hub exposes, so the parent controller is one level
> +	 * shallower. Keying it once here, rather than per port, avoids
> +	 * reclassifying the single shared routing mutex from a later port that
> +	 * may already have used it.
> +	 */
> +	parent = i3c_dev_get_master(hub->hub_dev->desc);
> +	depth = i3c_hub_controller_depth(parent) + 1;
> +	if (WARN_ONCE(depth > I3C_HUB_MAX_LOCK_DEPTH,
> +		      "i3c-hub: routing lock depth %u exceeds lockdep support\n",
> +		      depth))
> +		depth = I3C_HUB_MAX_LOCK_DEPTH;
> +
> +	lockdep_set_class(&hub->lock, &i3c_hub_routing_lock_keys[depth - 1]);
> +}
> +
> +/**
> + * i3c_hub_init() - Initialize hub context
> + * @hub: Hub instance to initialize
> + * @ops: Vendor callbacks used to connect and disconnect target ports
> + * @hub_dev: I3C device representing the hub on the parent bus
> + *
> + * Store the vendor callbacks and the hub device in @hub and initialize the
> + * routing mutex used to serialize port switching and forwarding.
> + *
> + * @hub_dev must be a registered I3C device, so it already has a descriptor
> + * and a parent controller.
> + */
> +void i3c_hub_init(struct i3c_hub *hub,
> +		  const struct i3c_hub_ops *ops,
> +		  struct i3c_device *hub_dev)
> +{
> +	hub->ops = ops;
> +	hub->hub_dev = hub_dev;
> +	mutex_init(&hub->lock);
> +
> +	i3c_hub_set_routing_lock_class(hub);
> +}
> +EXPORT_SYMBOL_GPL(i3c_hub_init);
> +
> +/**
> + * i3c_hub_reserve_parent_addrslots_from_dt() - Reserve child addresses in parent bus.
> + * @hubc: I3C hub controller for a target-port virtual bus.
> + * @node: Target-port bus Device Tree node.
> + *
> + * Reserve parent bus address slots for the assigned dynamic address of each
> + * downstream I3C device described in the Device Tree, so that parent DAA does
> + * not hand the same address to another device. Downstream devices behind hub
> + * target ports share the parent controller's dynamic address space.
> + *
> + * The reservations describe a fixed Device Tree topology and are kept for the
> + * lifetime of the parent bus; they are not released when a target port is
> + * disconnected. If the hub is removed and probed again it re-reads the same
> + * Device Tree and reserves the same addresses, so repeated probing does not
> + * consume additional address space.
> + *
> + * Only the assigned dynamic addresses are reserved here. A hub that supports
> + * hot-joining downstream devices would additionally have to reserve the static
> + * addresses of every device that may appear. Supporting runtime hub hotplug
> + * would also require tracking ownership of these reservations and releasing
> + * them when a hub is removed.
> + *
> + * Return: 0 on success, or a negative error code.
> + */
> +int i3c_hub_reserve_parent_addrslots_from_dt(struct i3c_hub_controller *hubc,
> +					     struct device_node *node)
> +{
> +	struct i3c_master_controller *parent = hubc->parent;
> +	enum i3c_addr_slot_status status;
> +	u32 assigned_addr;
> +	u32 reg[3];
> +	int ret;
> +
> +	if (!parent || !node)
> +		return -ENODEV;
> +
> +	for_each_available_child_of_node_scoped(node, child) {
> +		/*
> +		 * Only consider addressable bus nodes: a valid "reg" is
> +		 * required to describe a device, but its static-address value
> +		 * does not affect the reservation below.
> +		 */
> +		ret = of_property_read_variable_u32_array(child, "reg", reg, 1, 3);
> +		if (ret < 0)
> +			continue;
> +
> +		ret = of_property_read_u32(child, "assigned-address", &assigned_addr);
> +		if (ret)
> +			continue;
> +
> +		/* Skip nodes without a usable dynamic address. */
> +		if (!assigned_addr || assigned_addr > I3C_MAX_ADDR)
> +			continue;
> +
> +		i3c_bus_maintenance_lock(&parent->bus);
> +		status = i3c_bus_get_addr_slot_status(&parent->bus,
> +						      assigned_addr);
> +		if (status == I3C_ADDR_SLOT_FREE)
> +			i3c_bus_set_addr_slot_status(&parent->bus,
> +						     assigned_addr,
> +						     I3C_ADDR_SLOT_I3C_DEV);
> +		i3c_bus_maintenance_unlock(&parent->bus);
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(i3c_hub_reserve_parent_addrslots_from_dt);
> +
> +MODULE_AUTHOR("Aman Kumar Pandey <aman.kumarpandey@nxp.com>");
> +MODULE_AUTHOR("Vikash Bansal <vikash.bansal@nxp.com>");
> +MODULE_AUTHOR("Lakshay Piplani <lakshay.piplani@nxp.com>");
> +MODULE_DESCRIPTION("Generic I3C hub support");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/i3c/hub.h b/include/linux/i3c/hub.h
> new file mode 100644
> index 000000000000..a368ea9e5ef7
> --- /dev/null
> +++ b/include/linux/i3c/hub.h
> @@ -0,0 +1,92 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2026 NXP
> + * Generic hub definitions and helper interfaces.
> + */
> +#ifndef _LINUX_I3C_HUB_H
> +#define _LINUX_I3C_HUB_H
> +
> +#include <linux/i3c/master.h>
> +#include <linux/mutex.h>
> +
> +/**
> + * struct i3c_hub - Generic I3C hub context
> + * @ops: Vendor callbacks for port connection control
> + * @hub_dev: I3C device representing the hub on the parent bus
> + * @lock: Serializes hub port routing/forwarding; its lockdep class is keyed
> + *        per hub nesting depth in i3c_hub_init().
> + */
> +struct i3c_hub {
> +	const struct i3c_hub_ops *ops;
> +	struct i3c_device *hub_dev;
> +	struct mutex lock; /* Serializes hub port routing. */
> +};
> +
> +struct i3c_hub_controller {
> +	struct i3c_master_controller *parent;
> +	struct i3c_master_controller controller;
> +	struct i3c_hub *hub;
> +};
> +
> +struct i3c_hub_ops {
> +	void (*enable_port)(struct i3c_master_controller *controller);
> +	void (*disable_port)(struct i3c_master_controller *controller);
> +};
> +
> +/**
> + * i3c_hub_enable_port() - Enable hub connection for a controller
> + * @controller: Virtual controller representing a hub port
> + *
> + * Retrieves hub context from controller drvdata and invokes the vendor
> + * callback to enable the associated port connection.
> + */
> +static inline void i3c_hub_enable_port(struct i3c_master_controller *controller)
> +{
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_hub *hub;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return;
> +
> +	hub = hub_controller->hub;
> +
> +	if (hub && hub->ops && hub->ops->enable_port)
> +		hub->ops->enable_port(controller);
> +}
> +
> +/**
> + * i3c_hub_disable_port() - Disable hub connection for a controller
> + * @controller: Virtual controller representing a hub port
> + *
> + * Retrieves hub context from controller drvdata and invokes the vendor
> + * callback to disable the associated port connection.
> + */
> +static inline void i3c_hub_disable_port(struct i3c_master_controller *controller)
> +{
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_hub *hub;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return;
> +
> +	hub = hub_controller->hub;
> +
> +	if (hub && hub->ops && hub->ops->disable_port)
> +		hub->ops->disable_port(controller);
> +}
> +
> +/*
> + * Controller operations used by the virtual controllers created for hub
> + * target ports. Hub drivers pass this to i3c_master_register_fwnode().
> + */
> +extern const struct i3c_master_controller_ops i3c_hub_master_ops;
> +
> +void i3c_hub_init(struct i3c_hub *hub,
> +		  const struct i3c_hub_ops *ops,
> +		  struct i3c_device *hub_dev);
> +
> +int i3c_hub_reserve_parent_addrslots_from_dt(struct i3c_hub_controller *hubc,
> +					     struct device_node *node);
> +#endif
> --
> 2.25.1
>
