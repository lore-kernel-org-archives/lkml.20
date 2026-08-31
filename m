Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020136.outbound.protection.outlook.com [52.101.195.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C196B463B60
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200169; cv=fail; b=sPRP7RWriS2ribmpns7mgiNv1JnORBHnfRAtohWgW/x3VV35oiBtG8koj4d1+r1wKzP3ank3It48MWQWZuv6mj6Nm1LdGkdAKKRF0j7SUluasVYA19OKKaHM4EYA+VBW0WlRtRTA7X5j/yfEQ27++nTDSryR74IHxcUkdbWENAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200169; c=relaxed/simple;
	bh=Z3Pt/ViOdSPCQCW5eatzaWhRoYr7ayf2PgGAr1N23bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VP528440RJ0Kk83cco0tMZni03UI4nT1CjMFs8Nr15/1RtiIWSR9N/c7/z+ebIoNbEPByURaKDD0Y9qiB8QYig2MHiK+acjhpgT5wRzsfwscXDFC7oVttvH12PvJSApyTyCoH8i5BIpyr8r5D8i7dx6JFifEIO87hsuuLLDRZl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.195.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOU5dpgeKUbTieacdGaxKAwDZ/3aJGFudBalenOKqeWEIJ84AEkTYBL7IF26RgECUanLS8CSgM9lXrbPSjHe/D5sqdf8DRI/Je9mTsZgAvT7D3ptESUteKJhb/lWpBAnWWZUri5uQe4SpWzRGGaRQsZMKLcYcBAIIGHFlvHiBJs34CttpbFE5D3AyskIy5BUkc8CyUHBIlohLJsnjQRiaG6x+/+9UcTtwaPhM+ceFS0W8zBBq8aKG4966qo8T6uXm1J4xOeRKiiwKFuYw8/aRzly3n4UQTjx2DUYyq/oFQFUAkZ8PEjEHc87pyoJ3ti6r7cm5KQLujp0ZD/TIpIsnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=ADXmVPuEb003R1aM8g/hKSxvgm4AHaoi/KKxXLl7Qz0=;
 b=xvTAFF9Yxi5d52qruojc41ynpCstQudiFuUHh8TQDNwKqQ2vDnlQr6Hsmite+uBtSPB+kmd4IpLDpWZgBHrrEqGugopEMplzSXa6w4qR0dJhE2LBfBWtGPb/NzUMk6ci2GCFBPEFKQiL5MihaDK+L3K6T21yTH4LCfqnd/L/hRFH6VawO4K90Tp2luefJxnNkuQZZeNGoUCiLvOcdhLbZsQQh+yCvoRyu2aMDYtMlCyUnOcE7K+7yffGuJWSuDPotJ518xRIWjv34qGHaJpRF4bq1X2Tj4+qeNmnvgXcbnZrSUxEurHAhbBr5w2I/ZsXFhPmSNfyLMqdVlx/1tDi2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO3P123MB3339.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 18:16:06 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 18:16:06 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: tj@kernel.org
Cc: leitao@debian.org,
	atomlin@atomlin.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] tools/workqueue/wq_dump.py: Add busy worker inspection and BH pool states
Date: Mon, 31 Aug 2026 14:15:54 -0400
Message-ID: <20260831181554.117795-3-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831181554.117795-1-atomlin@atomlin.com>
References: <20260831181554.117795-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0053.namprd03.prod.outlook.com
 (2603:10b6:408:fb::28) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO3P123MB3339:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eba45e1-3a89-4f05-fcde-08df078bec78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|22082099003|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	xYm5Xx2gEsra8uE4hFQtAJt0aCBQWWsUpJi6IQLUSLSDKK2Q+cycJLnSIrlXIYFTAqMKJ2x11j0lnL2BHMIPg1OE2IBDUaOZdyrq5Nrf64N6QE5gl5gbfvci9+0r8v9TIqoEeXaV7a/rVRHbP7EonVebqBgqP9FVsB1/BdHsltk69f0dNmjy8rSt4DGhyaFtZZafKHGjBxLANUou5IfSUJwjqo0C/dF9dcCBCnIwAUAK6k8MbQsVIWh7UkqQuKzR8rtvODgBEhXDl3dn2toQplNn50aMpeF7PqEGQReg/SXORvbwZu6XwkjmPpfTbrO97U9d9Fp5YVuvvHZaJAv1cUaW0N+3FZfCdTOTyRX9RBs4OD3Vvp9LQKK8q4dIIkSkPEhOy9eHMeV1xnPPNJ6oiASWLTh6kMQ4eL1K8jFC2nbDWgjgDgenfPMTVgX1AP6QHpJk3MELvBMRLy0fQm+9mQcvrabfAAJ+KHa1l4v81wCPjGzJbmS79k2YCsImS8VUTv7NETAaMYBTzUMcB7ntWkr7IR2EcTzOUAIpDYhO0RfUgKoZ8d889Iwd3i5xL2UyopOUSSmzxb4Pyllp1wEDXVxqA/0U9e5DMC2k/njk59t/o+bueW+FoHE648pO22uGNbY+xKitta4uW81TlH+/J+td6iaQXc9S39MUhpDGoJY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xpWRPF/jFiNF0MgUs0y8AqqBRXkAQX8cxCziagDdyI6195QhnM62ePywAYBe?=
 =?us-ascii?Q?9hOQyNG1gtfuQHly1yfjdGEUNc45axcJIR9/8JRBDyQ0CFrbe4CDPB++tpqE?=
 =?us-ascii?Q?AsRLND1YATW/OpVrNqYpnpt02EK8V+tXe6paP6SZuSn+tIw3RTG3lxttY3Kx?=
 =?us-ascii?Q?oQGlFqJs2/09PhnbR0lBw08nSP5/7Tn44GkciLMELPL+O+6fc1PPNaiaTDrt?=
 =?us-ascii?Q?TgkM1PSDb1vX1rFgq91nOri/B3IRwYa8U5eN+qemyvEUMHh2anja92nkoZbV?=
 =?us-ascii?Q?BXUGUGQX4FCJOTnC/HXdoDHcVMVttAeDkM/LI/pnXK+J8b2wvFpecMJuTuwZ?=
 =?us-ascii?Q?3ENIwhQfy4xmZRF1x/Vpjj0MSf/Z5kZqlJOLKj1w3/YYkxKwnFflQMoPK6Ru?=
 =?us-ascii?Q?gybHoWIBWpOCY10YiofmQ7kVL0Xcm+qT+664Zq+NDDXpBDCGGAjx0pN0Rbqm?=
 =?us-ascii?Q?DnoZZ/sIffcqBSU3GwzOqO15ugatcTbZVFdl7zn6ruMvhbb71tHqr98yIN8p?=
 =?us-ascii?Q?iMDrpKTZvrXEMF5tALWturRx2F+Bjxr0W/CUgei4qbyKCadIIYCbJbyIm7z2?=
 =?us-ascii?Q?ycYn+adDkocSYZpNUvsK+srwuTVz0W5/W/VBakKleE3A7AWK7WhmT41ZUP0V?=
 =?us-ascii?Q?0p6oX1GKSVg4I0VtlILflIyHfoy8aacb8efE2fIL5TJueErvpBsIyDelirwB?=
 =?us-ascii?Q?xqiZDEtLosh27jgugXEDbJWXaAtfkNayWrakPOV27QMteGzDVc5bfeUXS1a+?=
 =?us-ascii?Q?y2ckBR2xOYH69WFb3thsRvWhTkSk4/i2XQuxlcmt2NXhXnLkl3zl4l36rhYx?=
 =?us-ascii?Q?OKAK6jHNYMvGSKm1CaIxqb9rmNEVm96nNPeUcT4fd0ND7y/fHQ87dWffehDP?=
 =?us-ascii?Q?G3kRTgDxfkpwmaH1JKOfi2vtkBAsGadOlAC6Gt3sA30nfQH5cI42KIvdaAIj?=
 =?us-ascii?Q?Qy01KgmpkR8nuwa5QuXMevoXAj+8Cjy1XGwiqacBT9UYl/PvyHa577MqmoAy?=
 =?us-ascii?Q?6cie5XGxrYpn7BBOAo1p7mcSoJgGsGpkN6vzdnBTUkAthKR7Ya1VHtlK0aqj?=
 =?us-ascii?Q?UmWK5a/EcTXmP9XuiFXqSP2mSymBkh/IPlHH7eS/dLUYR2Xl86K9Z5ccRWWw?=
 =?us-ascii?Q?C1xIBSHkMopZsbCWgDJYQfRntriCUXUX3PehpELJZjaTwpyDYmIpdQbZehLL?=
 =?us-ascii?Q?B7SuqcXWa4qZn1svgNcEFQ3Bh+YCyzUlif5aybOohRS5XIDRRN4jsweeYXxA?=
 =?us-ascii?Q?6HHKoRZ2DPa+3pxhq+lNBk7pl4M5dG1mCSFDxnNKWZd5h2RjshCBa0DSDhMi?=
 =?us-ascii?Q?RWmeau+Q+fZm93gPFk8YD6+P0NRzxkonJiq36ooApG8zmnWuMRmV+pW+TMRh?=
 =?us-ascii?Q?LUAJutlc4XOTeia9t0AMvr//+SzG1mlcHfSYXwxx+zgSeXJzKA2LQBoOjp+d?=
 =?us-ascii?Q?dZyARTIad+eUU3N0KJMCUDujJakU7MGOiDhgkPL1CkmVPvw/2ftagwbq7z8t?=
 =?us-ascii?Q?niPJt3sjz228sAX2iXV1KIAvvMGNqGbDQMrZ0hk7c7tnVmGcL8sRRmf3r6vO?=
 =?us-ascii?Q?yfMyzzSpxp4yM9hnUH9/DmTzlxNTAHkIB/v46YTJhCMEvgpLEDDh7UrprJuQ?=
 =?us-ascii?Q?cCHdDt39DVaIUwUka3IEj2arSVzAcM6wR8enwC69/gknmbkgwY8wuyCWu/f7?=
 =?us-ascii?Q?03N01hmfzshJ+4eC9kmt55PNX37yzo49W04jywfY/s5G/HjRG9a/DdHvUOWQ?=
 =?us-ascii?Q?h9H81XO4+g=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eba45e1-3a89-4f05-fcde-08df078bec78
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 18:16:06.0839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnGjoZJBDd7EXcRQ4BzxhCi8KtDkttbgDAwCliy1IXEzWBFTA8uRdRwyX1Ow1n1ChTc7zsox9GDPeroYolMCxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P123MB3339

Currently, wq_dump.py displays static affinity scopes and pool topology,
offering no visibility into in-flight work items or transient pool states.

Enhance wq_dump.py with live busy worker inspection (i.e., option
-b|--busy) to dump active worker tasks, callback functions, workqueues,
descriptions, and elapsed durations.

Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 tools/workqueue/wq_dump.py | 50 +++++++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/tools/workqueue/wq_dump.py b/tools/workqueue/wq_dump.py
index 9313ebe0c525..1659bba6c0dd 100644
--- a/tools/workqueue/wq_dump.py
+++ b/tools/workqueue/wq_dump.py
@@ -29,6 +29,10 @@ Lists all worker pools indexed by their ID. For each pool:
   workers   number of all workers
   cpu       CPU the pool is associated with (per-cpu pool)
   cpus      CPUs the workers in the pool can run on (unbound pool)
+  flags     pool flags (bh, draining, disassociated)
+
+  If -b|--busy is specified, lists all busy workers currently executing
+  work items, their task PID/comm, workqueue, callback function, and duration.
 
 Workqueue CPU -> pool
 =====================
@@ -49,12 +53,14 @@ import sys
 import argparse
 parser = argparse.ArgumentParser(description=desc,
                                  formatter_class=argparse.RawTextHelpFormatter)
+parser.add_argument('-b', '--busy', action='store_true',
+                    help='Show busy workers currently executing work items')
 args = parser.parse_args()
 
 import drgn
-from drgn.helpers.linux.list import list_for_each_entry,list_empty
+from drgn.helpers.linux.list import list_for_each_entry, list_empty, hlist_for_each_entry
 from drgn.helpers.linux.percpu import per_cpu_ptr
-from drgn.helpers.linux.cpumask import for_each_cpu,for_each_possible_cpu
+from drgn.helpers.linux.cpumask import for_each_cpu, for_each_possible_cpu
 from drgn.helpers.linux.nodemask import for_each_node
 from drgn.helpers.linux.idr import idr_for_each
 
@@ -62,6 +68,10 @@ def err(s):
     print(s, file=sys.stderr, flush=True)
     sys.exit(1)
 
+def get_hz():
+    cs = prog['clocksource_jiffies']
+    return round(1000000000 / (cs.mult.value_() >> cs.shift.value_()))
+
 def cpumask_str(cpumask):
     output = ""
     base = 0
@@ -118,9 +128,13 @@ WQ_AFFN_NUMA            = prog['WQ_AFFN_NUMA']
 WQ_AFFN_SYSTEM          = prog['WQ_AFFN_SYSTEM']
 
 POOL_BH                 = prog['POOL_BH']
+POOL_BH_DRAINING        = prog['POOL_BH_DRAINING']
+POOL_DISASSOCIATED      = prog['POOL_DISASSOCIATED']
+HIGHPRI_NICE_LEVEL      = prog['HIGHPRI_NICE_LEVEL']
 
 WQ_NAME_LEN             = prog['WQ_NAME_LEN'].value_()
 cpumask_str_len         = len(cpumask_str(wq_unbound_cpumask))
+hz                      = get_hz()
 
 print('Affinity Scopes')
 print('===============')
@@ -168,14 +182,44 @@ for pi, pool in idr_for_each(worker_pool_idr):
     if pool.cpu >= 0:
         print(f'cpu={pool.cpu.value_():3}', end='')
         if pool.flags & POOL_BH:
-            print(' bh', end='')
+            bh_type = 'bh-hi' if pool.attrs.nice == HIGHPRI_NICE_LEVEL else 'bh'
+            print(f' {bh_type}', end='')
+            if pool.flags & POOL_BH_DRAINING:
+                print(' draining', end='')
+        if pool.flags & POOL_DISASSOCIATED:
+            print(' disassociated', end='')
     else:
         print(f'cpus={cpumask_str(pool.attrs.cpumask)}', end='')
         print(f' pod_cpus={cpumask_str(pool.attrs.__pod_cpumask)}', end='')
         if pool.attrs.affn_strict:
             print(' strict', end='')
+        if pool.flags & POOL_DISASSOCIATED:
+            print(' disassociated', end='')
     print('')
 
+    if args.busy:
+        for bkt in pool.busy_hash:
+            for worker in hlist_for_each_entry('struct worker', bkt.address_of_(), 'hentry'):
+                wq_name = worker.current_pwq.wq.name.string_().decode()
+                fn_name = prog.symbol(worker.current_func.value_()).name
+
+                dur_str = ''
+                if 'jiffies' in prog and worker.current_start.value_():
+                    jiffies = prog['jiffies'].value_()
+                    dur_s = max(0, (jiffies - worker.current_start.value_()) // hz)
+                    dur_str = f' for {dur_s}s'
+
+                if pool.flags & POOL_BH:
+                    w_id = 'bh' if pool.attrs.nice != HIGHPRI_NICE_LEVEL else 'bh-hi'
+                elif worker.task.value_():
+                    w_id = f'PID {worker.task.pid.value_():<6} ({worker.task.comm.string_().decode()})'
+                else:
+                    w_id = f'worker[{worker.id.value_()}]'
+
+                desc = worker.desc.string_().decode()
+                desc_str = f' desc="{desc}"' if desc and desc != wq_name else ''
+                print(f'    busy: {w_id}: {wq_name}:{fn_name}{dur_str}{desc_str}')
+
 print('')
 print('Workqueue CPU -> pool')
 print('=====================')
-- 
2.55.0

