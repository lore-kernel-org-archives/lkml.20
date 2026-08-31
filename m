Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020136.outbound.protection.outlook.com [52.101.195.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D65463B79
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200167; cv=fail; b=ENotYoYElw1Dn1rBumDmg/YF2qhEM20zUV0nblwmPRZ3iK1aTYAJjc+soS34543p2cBSy9lR5oTxxiNtrpvqM7Yn4+YW4qpQOzdlCBL4CNeyqgk3c516tEhmvTFNhvPtNn69pVNGE/ADqLOdmscylWAjU0eZF6Y4WTeegekbp4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200167; c=relaxed/simple;
	bh=nsjHhYmXZN4hzlgMkVyJKl82cRbGUqrKfqXybFeNbsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kQ8pAx5ibGpJhVT5sJBQtOgx6cIBfDyU3im5ddG+3HDfbktf828DIqpFBqMRfAXSSWwHe4iJe50lVinwliUgC3gqiqqNHDXd2kCn1d1j/0Efq1HKPMSBj9M4s1qY3+dhXDf56LiEOPGzIJ2Q21UhMtzSd7w4XPK7vqJm/Kgj2FA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.195.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGgTlCcpCN5X66SNI7JhN0HsNLGYgqMybdMtKmDAzLsRlF7M6W+0sWRs18/93RwGaKbAlT4iumQphzjfSqb0XaX5ZF0aaYTubQiDpLrmEFohELouH4yCejNGMkDvttGAK/PD/YFBzJH4EzuUCc207p30E9VlY7axuDy5Mo311nlRNPFdysWlExwZTr15YEqIgYgMf/V6hbJAnoPRJfwBNxijfKwg9E2zN2E3sJu9B6ulFWoCH8Cup7U0WwrhyhKuYNv+XPxjg1UdiXJPSdgCxWyV5bOUWujgo27auiDfkzdfdGXsAaGa+m3HW6ORa3YmfpNB+lFHlnxa7jV7clW/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=wofrUf1LNJlgQBmBIXLOM/IDN2ezCsqRS71TGhhPVFg=;
 b=POfLh6d7KmR4aOpsaUqeviCxj0qIDyV1TVEOB4mSYKOWsU3JTisXUgsGiQhUQivwSaf8z7PmBZS/IXXvLTAi7eRbkCriSNRhUnPWM5CwLnMxCd45DSErqxby/qgMn/LiSyooUGep3j1Jfe6vVFZw2YfBnxkO5rFQOEgdGSq1ArYqv8hb6Hqc6r6ExwNmh9FRwu880NfONSRNfaH4AVF6i7sLCi5A97ereTxPhcsLVCWJ6axBRiQq6v/tpKo0iFOjIfxm9SO5nhMghohUyz+FhEKsBm2YUrBB7y2OWzXGzGtVnBP1cjXG9HjgAXoJPVzbGxhs2AXyg1TroLMysaaJAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO3P123MB3339.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 18:16:02 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 18:16:02 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: tj@kernel.org
Cc: leitao@debian.org,
	atomlin@atomlin.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] tools/workqueue/wq_dump.py: Support backward compatibility for wq->attrs rename
Date: Mon, 31 Aug 2026 14:15:53 -0400
Message-ID: <20260831181554.117795-2-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831181554.117795-1-atomlin@atomlin.com>
References: <20260831181554.117795-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR08CA0024.namprd08.prod.outlook.com
 (2603:10b6:408:142::14) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO3P123MB3339:EE_
X-MS-Office365-Filtering-Correlation-Id: 25878bb6-b142-46d0-edf7-08df078bea56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	cRIbK2o3+qc0nsI1mS+zMieexFvGf1+ZDuMNZnF7cYhiujQrjheVzrsJxNFb5OD9cfS5ZiJy3I6VTsbyYQY1eq5ipBi42L7ZFn+qxM4DMikxrcBXQhANyOQJ6LEzU+JhsnMQTAZUYpvxCTb6nPs4s2+JOzQ9vwGbhTQNiuQAEJ+MmzAXn85gCL0G3T7VR1irl5hVfruE2vPlKd3Jnss7RJBIyET/H9UjbSWR3R6p2lEdgy6kOQeMHBd2BOLFqwrMi69BzestzfpGmJiLBYwjyVHE1VOqxA8JLG9qgkV93WLffR5oQ59SBMZWmFlvXO/j/9JMZEOigpoYvcuWh42Is6YM7wXkxKoeS3y4N/x6euFrXm+fNkns4BdDZ0OVaqMmb5phYrM3J0LKPx8YhqYUm7oh6Nj8e4tI17CSf9AAy03tNDEOvacuTxmkGv4Sn8MKj/L4z0LyBFqcIy/FVsZFQ0e6EtPLkSrsDE6zfXKjp166MFimY4DiatdIq1/1+ATm69rh1xvZPS+shyeZITb/7UbK2M4FkNoJyYFPh2QJg9/RGy3d9GIkzr2m3TDfFuxctoquR8O2U/hQ6AdfSOeG63CTbcbGXg9g9FMZMvFSVjekgGLL/UBQDtoxRsaZxk5zj4sYqj3Cer/4OSomDYnWLLKo/SDpsmUwJh1rpWaZr+4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cwpra8hi1kz72OrSSe6bhJJbiT8BtLU21GPt8CA787ap8Mhppz9D5FOomBJ+?=
 =?us-ascii?Q?2z48PrdZFHFQWHnzMs8JviBzxDd2NHHniM3VCPV9cusEtTEFUu7KvCvp5MRp?=
 =?us-ascii?Q?/1+xfAc6SgidKTpgLI0tJfbxK7HMV8A1QJ1sNg18mt/MpG3yYhbljRaeYZbq?=
 =?us-ascii?Q?iStFsy+aIfsA8a3j1Gx0Nh2C2nXm83PUAW6NZHslCzpYHZIZCPRrVn9Rbkdh?=
 =?us-ascii?Q?6BmH5Ve2KjfsCzE7rjs8gsVslupu/6vAfk6Q0uzPYf694caDxfn8KZLjrTgI?=
 =?us-ascii?Q?LajFXELzFdmfvFkVJ65uYE0j08dC8kEEklyfbOA1LGqooKYrJdv6s0kLYigf?=
 =?us-ascii?Q?4LzhjR6lqVr2euoiz/foMoSE2VIIYnLS/ishX0CXsdltYutqXMjB/AotjcGl?=
 =?us-ascii?Q?dhtEuojSIsr6/hWvx0/EOClwBLcOLrpmRP4EorQAZiH7v9DXN1wUgT8Qt0Ci?=
 =?us-ascii?Q?djnRpFqfRLQNFvX7biXQyKiGYJbDruPutQl789lFub9FnkJwS0McYrrj2nYZ?=
 =?us-ascii?Q?KiCJ00b5wusNxxJoApgnXBpTFZwrhVqdC7k9jGzeo0rCjwe6QQCTUM75d1sS?=
 =?us-ascii?Q?LfPcf9LSFKz3RHMfPvcsrcR2Ajx77F9s9jrlwfikw+vu28xPxdBFXAoX+ORa?=
 =?us-ascii?Q?yAgt0nO9/dbE8U9X6wd012hS6ejewJ3cJ5hGeHc52j3Nhq31AE1HCwc1/hkl?=
 =?us-ascii?Q?BpJzXUXodh6Jh/zfM880cWBND6UF8v3qSrCnn+nd/rADxbdnx0UxGchHndgJ?=
 =?us-ascii?Q?senWzJMuLZnLqn7t/cVjZP0VDZhHyZR14jLJD1ivAJX+e7G923W1CWj4cM/G?=
 =?us-ascii?Q?sdlp154WJvQmncfuEZISJ56O2JHNq14o3jUhLOebrQxzXWxELoFxgBCqQxq7?=
 =?us-ascii?Q?5Whcj4S5BI31u/YKPIX0yY6QKO3oYjl30Fw1Ah5Ksu6rUopjHSbcQi3ESmpX?=
 =?us-ascii?Q?1wSNSLmmqT6ALuX5evT38GWkqQN9kci+hgpzN4Ghx0XcVS2YA6JRhk1usJP3?=
 =?us-ascii?Q?fkN8V9e2oxVVb+e+EeOpSqMk5bLMq2RfpJnOcirU/5b8GDNcP34AjlhAwLJh?=
 =?us-ascii?Q?q8b2CZm12GiHPEBZMab+4Wewr3R88FqQocJO0qtWy+lKQDPb47CnUXmGm0RG?=
 =?us-ascii?Q?RxbHfZOElELTYubjUd+bDtTeu4EafcBM9ANjjFICzNWv2GJQ/1U78efIcAjy?=
 =?us-ascii?Q?Ue/wqnwnebw595eX5eFwDzlRHMgK1UsoDbx5N4RC4rJcrefShNeLyOFN+KOQ?=
 =?us-ascii?Q?30Jk1kAPG5p6nX3JaEGb0ZtgPOfSHDCdwVds/aJjHsoYWBj2VWz5f4uj/UZc?=
 =?us-ascii?Q?lk3O2m8KcPI4opJgx50BQGhISOxsQxeUiI1WFE81ivHWRVkZMneP0hV2IfPl?=
 =?us-ascii?Q?C4BSPSrBUy9qDP9LY5N/c+hpDlVWxN5njqFyFy5HmCeWq3Ohw+fl+ttVV3yH?=
 =?us-ascii?Q?085zKWy5w4EsKXXppJotSgHjAuBlyVOZK7p0Kju0Bd9iMmqeYrEkWgWUXkEx?=
 =?us-ascii?Q?cuBcAxHEvIkr+wfS4CN52RayMndgXIQ52o8p7VFbiftbVA7Pwt3wcqo7fThV?=
 =?us-ascii?Q?UU3hQ6fQil7lybyD+fCAgA+d45XpR9CkffQriTjQdvwOKVxskvvUbuyzFzCN?=
 =?us-ascii?Q?7wYtSSXGWRG0SWN2vA2bIt+5OetKd35aBM3nz7TOysC4uU07hL5vaxXiwatm?=
 =?us-ascii?Q?IHRIeAZrPAMRmMamClZgHTbNm8c4ocJo9BwV3ZGjL4TFng0TcIETfVxl2KQr?=
 =?us-ascii?Q?JMq/C/yN+Q=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25878bb6-b142-46d0-edf7-08df078bea56
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 18:16:02.5176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ExG8EMudCZpChGMm0nD9yyt7SCL6IICxPfARB7IO72VtElP6KszXwHgV6VmaB5/5ogzxFe2OkNgksVA4SiLjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P123MB3339

Commit 464e454e1cb4 ("workqueue: rename wq->unbound_attrs to wq->attrs")
renamed wq->unbound_attrs to wq->attrs. When running wq_dump.py against
older running kernels or vmcores where struct workqueue_struct still
contains unbound_attrs, drgn raises an AttributeError.

Add a wq_attrs() helper to allow wq_dump.py to inspect both older and newer
kernel versions seamlessly.

Fixes: 464e454e1cb4 ("workqueue: rename wq->unbound_attrs to wq->attrs")
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 tools/workqueue/wq_dump.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/workqueue/wq_dump.py b/tools/workqueue/wq_dump.py
index 31afc24ef17b..9313ebe0c525 100644
--- a/tools/workqueue/wq_dump.py
+++ b/tools/workqueue/wq_dump.py
@@ -78,6 +78,12 @@ def cpumask_str(cpumask):
 
 wq_type_len = 9
 
+def wq_attrs(wq):
+    try:
+        return wq.attrs
+    except AttributeError:
+        return wq.unbound_attrs
+
 def wq_type_str(wq):
     if wq.flags & WQ_BH:
         return f'{"bh":{wq_type_len}}'
@@ -85,7 +91,7 @@ def wq_type_str(wq):
         if wq.flags & WQ_ORDERED:
             return f'{"ordered":{wq_type_len}}'
         else:
-            if wq.attrs.affn_strict:
+            if wq_attrs(wq).affn_strict:
                 return f'{"unbound,S":{wq_type_len}}'
             else:
                 return f'{"unbound":{wq_type_len}}'
@@ -206,7 +212,7 @@ for wq in list_for_each_entry('struct workqueue_struct', workqueues.address_of_(
 
     print(f'{wq.name.string_().decode():{WQ_NAME_LEN}}', end='')
     if wq.flags & WQ_UNBOUND:
-        print(f' {cpumask_str(wq.attrs.cpumask):{ucpus_len}}', end='')
+        print(f' {cpumask_str(wq_attrs(wq).cpumask):{ucpus_len}}', end='')
     else:
         print(f' {"":{ucpus_len}}', end='')
 
-- 
2.55.0

