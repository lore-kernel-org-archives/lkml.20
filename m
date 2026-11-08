Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794181643;
	b=wugGk1FXBnDa2i3ZUwiVUwnsFgs2KbNhDJUGe9Z0wYy6anl7lNmOz5wcpuSGLmo1dUPl
	 LnF0zQtpekZwdj1VVIj5OtNtwcOC+edk+aZFnQuwkzo26rKkwhJx+/pp9T7RRpzH9umvk
	 88Gv+HLoWzFs2swrKsl+yG1S0wjOfPu7llGIqSElUs0vnXiSmCIsWCJ5mQ6V3E/WhEKH3
	 QO8kA36vQ9kXMUelKxPqqgVg4gx7ImAMKr5giTQhlz087EM7e9rYMWUtlPS+3NEhPJwKK
	 c2Uq7f09Z29fvDRzllq5pB8YL4VICN+xEOO3umDKaBi0qlSeBeIymD+Nuz4PV2eYi1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794181643;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=qeuEK2M1n78QDUZL0uPtWXnsxo5z6VrJbxgDuIdRb40=;
	b=eHfZUg5642i6i5REFqfdSsnNefqmXtKHFnp22SN/viEdwYuP/ii/OeMTrRAIgmpNX0qU
	 PyzUqj1OKAxt6MzliqkxrtTNxnGXzKDMnv0yXjuOPSq83PplIfFpmiamWbVNwYaEx6zz7
	 gHznGQ60h8W1rOu8sQMRs7zkKZ1AeHYfy6SNd9BNGMoH7ZtcjbngbDA6G/Lms1M3qruro
	 w8QALnbaZGyk8dikM3c8KbziYU2V9YpTTfuyxAldCMhaeVSKn4OherLCMjDKpbhiw8pzE
	 Wdp4G0Kni/5uD8dFbqJTcmsHOiz5sG7xCP0NP+NIyD0e7Rf3GnohbLOPd1/+etnVIWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OUmHzXHG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.21
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013021.outbound.protection.outlook.com [40.93.201.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C073606A333
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C073606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OUmHzXHG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFdhrwc7HpGOG0LI+mKleUL7g25h6+3/0Yjm7pIp2FiwhWAsWD2VNA2Sljb9hyZIou8DZoGV7nc8T9Q+bKKiiNnu+JRVNfKd6kaeLBoCXT6XNFQCBl/Z5iN/oySNh5uBQsFZfApGHV0IE2yI7jlWX2KX68Lm1JLlRaT5a6UTBXHk4drSelgXa45ZoNKSoVC0g9Bcc8K6cN2hfhjUeHEVpieiKQfIKXYN0n3S/wZ4QSe2xpkaLVRgpnYhUxj5DfppRC7vAWCYBLGWp82WSI9JLR/tD3IK/okslqafuSSLLTeh9Ajc7zNK8uhM/e6Y+LD42TeVkZQq7jaHHxgm5k0Dxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeuEK2M1n78QDUZL0uPtWXnsxo5z6VrJbxgDuIdRb40=;
 b=kQJy1pIaxQ4RyuMYn0tI7cgTT9VMNSL8x8G499UjEhWs64pGsufjVakGTTArGg7vTKwy21w6zSx5stZ/KriTo1G++EOlXVSlMonaYgbtOWYOr11j9DmiIHpO7s5u3yoCk9uV2P9FeN8GVhFWv7p2m3+V9XJ3uxheRVFfZHxSWrTADm16xiWAoji1t20RPHxLzRz8zlSCu1KGj9xadkQX6BzKKH0oOxZexA3paXpE9R3tVGC6brW8UTkEuQiFgvzeu0Ww9agk/wsx5DITYyEy3n/5zLbhWrsdkaMbwQuVL1i4zr6++owtl3S3/lPlGZUG/88EsVGNSAFuop4MdUE2Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeuEK2M1n78QDUZL0uPtWXnsxo5z6VrJbxgDuIdRb40=;
 b=OUmHzXHG6Sle5uCSWpp8C8tv8ckVYOc9rxjw2zlh5n1ZtarUMrryW2vT8sKEZljaPUK0EX++xqLLZaK9qcPoW7q/H2JniLqJimpq1NzDb7G0jgNkTeghfBBYBekL6vwjkgktd0CWWkI2vLQfxAqf1W2yiSPYr8qLRecpoXdhLb0hctKVwUqcOtTfEk6NL08wcddABEAk/g8CULxOxi0dXPYYR/L3g1BpD4CPCg82cVWKiOU1hfn0NXNpu3GBr606HO0+Qx/l7hZ029axBA6qZ+vOUXO0NNxx8OwutR9xfkxIoPcvCv3FmzmU8jd+y/IzLTAqKMDyPs777slv00KLhQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB7742.namprd12.prod.outlook.com (2603:10b6:8:102::18)
 by IA0PR12MB7579.namprd12.prod.outlook.com (2603:10b6:208:43c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Sun, 8 Nov 2026
 23:47:21 +0000
Received: from DM4PR12MB7742.namprd12.prod.outlook.com
 ([fe80::8df:c519:298a:94f6]) by DM4PR12MB7742.namprd12.prod.outlook.com
 ([fe80::8df:c519:298a:94f6%6]) with mapi id 15.21.0592.010; Sun, 8 Nov 2026
 23:47:21 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH 3/4] scftorture: Protect the initial affinity check from hotplug
Date: Sun,  8 Nov 2026 18:47:11 -0500
Message-ID: <20261108234714.3713501-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108234714.3713501-1-joelagnelf@nvidia.com>
References: <20261108234714.3713501-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To DM4PR12MB7742.namprd12.prod.outlook.com
 (2603:10b6:8:102::18)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB7742:EE_|IA0PR12MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c729df-55e3-43f5-bead-08df3df2a1d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261021121427099003|56012099006|261022075727099003|261022105027099003|11063799006|261028144727099003|261009223027099003|261026140227099003|261021123027099003|261021135927099003|261026121527099003|5023799004|261102123227099003|6133799003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	JXnq0CltVuP2+0lRYQtnx0ELjXYswM1xdJylvqEMxb5sAA5+KBwGDCTkTcvx51UKlwMhs1/tcMN0/B/wlFT9fGYhaJiMj6R6dcqMlLzSB54gj2NX1mDaLlcywrvrz6vRIz/452XpwcSliYVuLr/Yg2Z0V/GebU15JO/NfwX/FguQrFsfCa0uAB+7O/j9QyWHY2qlQcS03AlPzG2b/1rG9Z+TJv7+Q7TXHnrUsjMe+aDRJC0quwkTZOrdzh6+bQnDxpToTMYArKcPCy1nHO2PKs63NCV9u/8mUOAZakNRRHltsKuX2hlxk7kjtQFWNVEr6x8hZG4gX83Lt883gsCny6f+Xy1r5OTvEufsdSvx2mHWDGZwauOJjalYqKrHxh5EHZgM0CUf4O9yqaNz+uCFu9H8+/9W+mVSZZxxH49/X4jNvSN74qVwQVVfdv7v3tIvfiqsZUSpzVXVFr8Ztgkpu1Gbggajdr0+t624sXHfdhii3vubq7IrcYDBiuKbHuSS+MVNaYZMpIdbkMAScRyV2yXkKPb+Yl5VXm528u57u1J9adNNrjydnBs4Zo+vJQOWgn4aTAa9VWbaky1KlWXG/U7WyOZ2iyxr0LeGd1hxkhpmcTCj3g9PsPQX9nA+PRO/Y+0XbKYO5+Z5RR+kxq4+yD9Q5TAvVhoj9kBlpIEblQg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB7742.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261021121427099003)(56012099006)(261022075727099003)(261022105027099003)(11063799006)(261028144727099003)(261009223027099003)(261026140227099003)(261021123027099003)(261021135927099003)(261026121527099003)(5023799004)(261102123227099003)(6133799003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?01HzJXEBnIR9n8xiMtFsNvsSZMhl85FpIBC6KWDQVl6UgrtREDwPy0FKZtXu?=
 =?us-ascii?Q?aayPoEa24QftxAGGoXpT8lBXV17D8qoP6EoT1VbQZprT5CuBljpgsq+N2Jka?=
 =?us-ascii?Q?ieOEtNPj0rRrEgIxYcPcDqMTVBsc2mT2Kl0eIOoa3jz2UEbJzTPZMLoi8IDb?=
 =?us-ascii?Q?pgVHrCsRr24FuxU63jOyKqFkoHgo3z6UTC5C/ax1IQ2EDTICGm7UQvwtYvCg?=
 =?us-ascii?Q?MtYFRctut9dt51YBwjcHMgy3ezXnYnyCacwNlh1WYwDYnnoZu6s5YdD9Uy/7?=
 =?us-ascii?Q?ONjgq/kxXQ45aTFdBqR1lBWUwRu0gjIxAn8+Y+DE8ekhlnQOdsfjo1/dZBVK?=
 =?us-ascii?Q?foNlI4tQHNsHD9dn7Mj8cVfgfx7d85+pz7+TZ+KAN2nlkiVncH4HF4HxttKV?=
 =?us-ascii?Q?Nbi2eE5Rfm79a58o99cW9Jzedi2dFcpgo6lbfmaJe/F5SPkTnxJFjlE4DbtT?=
 =?us-ascii?Q?XPDPNYbAa2I8wo9GhibXToBHxoBFblb1qwg3CtA02YNob4hFrPGjBWpvLGwD?=
 =?us-ascii?Q?etDuY9ypDpV5vbw30ma98/MXr2sZzjeWnyJWd95xUsB74r2dbgW7kH1s1E+l?=
 =?us-ascii?Q?QSTiD/fYuu7mboKhcVsNz9prfPUKeEs4Jx687oGOsgbSBJgwotD6ETC9gKLh?=
 =?us-ascii?Q?sooOY1Cb8N7M2QYb4e55ERIVVs71w2FoxP8zk/OGSTB/UOzWzgn7tQ4HdE6V?=
 =?us-ascii?Q?qxNuYZ5nd7cM+553yq1DzwPClxwKgj1evCKKrIweQA0wDMaMdmbtro2I86c2?=
 =?us-ascii?Q?fG2/rV6/nQrRWyh40KnfbSR1hoC8I/SMHomcCwi0K6OarfwqWRW73JKOMfwd?=
 =?us-ascii?Q?vFIsM0XZVFKeeUQXa0pTDqN8/4/Ao0CWMojd/zR1c3AaGEgC6eIhJusBi1IL?=
 =?us-ascii?Q?yr61B3pt1mloPrbCP4ZAJFhzeZ0JcQwTBeO2J4d7s11WM7teUiUYADy/Ej+z?=
 =?us-ascii?Q?qXazLFVRuc6plwUiuTr4k3KqXiTo1DaVOtdw+39fxikFq9SBRLm+X6KpW6DO?=
 =?us-ascii?Q?78fBiwvsBTwV9sJFu7ZlszpmVR+bYLYxcwrLyMoCYm+YdodJXWvdyTyr4wUa?=
 =?us-ascii?Q?hZqSClc8KWZnJ6vzdM8UwT9cDq9ZUliTnTnkm2YLJnaYzkamnwkU4YrX8sUH?=
 =?us-ascii?Q?DZqO1rmAeaUOZ/h7nd49MHhTQfgDE64j5yFvnw6J8t1RQsJ/zB6EcdmElI/t?=
 =?us-ascii?Q?0xWZHfqdSF5HQDQwvcBIFpJcN1fBmeNLaLMZoeCC2j4F4RPavl/5lrsmCQJL?=
 =?us-ascii?Q?8rCWM+uWsiC9ba29CiwvS/aTU3Dt2+wmPOTcbY8F0BdiuH0YuFArymVnagPk?=
 =?us-ascii?Q?fxqKOKUGWkkr5z7tzwGt7vVXKx63UGmf+v9TtkUqmROrh0y3yB4J8iRV0u8K?=
 =?us-ascii?Q?VYiUrdhFqDUim1I89nqKt1tDeQ7Fltx5oal15Y7+TeweHVzHZqArGhhkzk7v?=
 =?us-ascii?Q?2xO3jqu+08uEyyKvsW0FJrS/Mvur7v+1HbuyevUUEKvPWbfDQhXd1QcrWP7n?=
 =?us-ascii?Q?Lbq0G8bRdIK8GvsaCqvUz7x6Em1iZdz/DjsgL0XCY8NOefzICqjDqJJYOLhD?=
 =?us-ascii?Q?4bUiid7E/XEjbF/IrBVrE9q+QP6Ch6M7r5kdirb5I8Ei3vXmQrQdW+GoEmo0?=
 =?us-ascii?Q?MhzD9PtRRoilNs8BqdgAHc4ejTHb2phXLW3jASkHZ3bziiyYHmWPnajF8pEl?=
 =?us-ascii?Q?640XsgppZQfnlikFleUhJT79ILnokSe8LwMyxZtUnf3CeKR+IfV8BjrhF4Ru?=
 =?us-ascii?Q?AJg+4G+j1A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c729df-55e3-43f5-bead-08df3df2a1d3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB7742.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2026 23:47:21.6966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EtzA+6IFqE9C842ZGd3bZYcdeIwrAAxj9zkZWwj6wW4QgzCPuqHmQ8vc969dWgFMHBbgEP8L7H7/M4U2+KjyCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7579

An invoker binds to its target CPU, sleeps for the holdoff interval, and
then warns if it is running elsewhere. CPU hotplug can offline the target
during that sleep and legitimately move the invoker. A built-in test with
matching worker and hotplug holdoffs reproduces this warning.

Check the initial binding while holding cpus_read_lock(), before sleeping.
If the target is already offline, let the existing offline/rebind path
handle it instead of warning about an impossible initial binding. Release
the read lock before the holdoff and test loop so hotplug remains tested.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/scftorture.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/kernel/scftorture.c b/kernel/scftorture.c
index ff9a8271a464..64ee2c5cf51c 100644
--- a/kernel/scftorture.c
+++ b/kernel/scftorture.c
@@ -479,19 +479,24 @@ static int scftorture_invoker(void *arg)
 
 	VERBOSE_SCFTORTOUT("scftorture_invoker %d: task started", scfp->cpu);
 	cpu = scfp->cpu % nr_cpu_ids;
-	WARN_ON_ONCE(set_cpus_allowed_ptr(current, cpumask_of(cpu)));
+	cpus_read_lock();
+	if (cpu_online(cpu)) {
+		WARN_ON_ONCE(set_cpus_allowed_ptr(current, cpumask_of(cpu)));
+		/* Check affinity before hotplug can move this task away. */
+		curcpu = raw_smp_processor_id();
+		WARN_ONCE(curcpu != cpu,
+			  "%s: Wanted CPU %d, running on %d, nr_cpu_ids = %d\n",
+			  __func__, scfp->cpu, curcpu, nr_cpu_ids);
+	} else {
+		was_offline = true;
+	}
+	cpus_read_unlock();
 	set_user_nice(current, MAX_NICE);
 	if (holdoff)
 		schedule_timeout_interruptible(holdoff * HZ);
 
 	VERBOSE_SCFTORTOUT("scftorture_invoker %d: Waiting for all SCF torturers from cpu %d", scfp->cpu, raw_smp_processor_id());
 
-	// Make sure that the CPU is affinitized appropriately during testing.
-	curcpu = raw_smp_processor_id();
-	WARN_ONCE(curcpu != cpu,
-		  "%s: Wanted CPU %d, running on %d, nr_cpu_ids = %d\n",
-		  __func__, scfp->cpu, curcpu, nr_cpu_ids);
-
 	if (atomic_dec_return(&n_started))
 		while (atomic_read_acquire(&n_started)) {
 			if (torture_must_stop()) {
-- 
2.54.0

