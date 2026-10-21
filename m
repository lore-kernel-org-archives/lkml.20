Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792557047;
	b=xn1jINo9tXwiPibK13RROLw8LpZanaYxzmm7JwsIcdrP4ku+vfv9gCCuIyaF4/ZnpNu9
	 tQXdbZ6gxoYfEq/FMg2AQj3jFFgSgE4DrEA1LF6V3L+CWvGSztWZVRXELb616t/uuzSZH
	 cNG82UN6DwlvcSaZUAU8humOO+vP1K6LYUFEXqOrDYqfrv1OhluzNnrdpN6TCrxIa1P2b
	 BdtKqfOyJTR1pNjgvWa+/VQ16YtSAYMguev+BsPM5203lmjemPX8C+G5mNhLWLk0O0ZLL
	 gL5ZFzBXnbaIfdp3SMV0hJfNWXxnIB2DVa9XypRjOc8k2C2UCZ+Ya1bn6q5IXPnzweg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792557047;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=n4k4Qj5XTRQZP3FclQeV5KNSHIGFhgCodpqRiin8YXU=;
	b=2LR/Prg4A/bbAuyiA33kYBz9XQ7lRjcZMPgP1riB7yx9e+X54FyhZxq4Ix8L8oRbVItX
	 kpEsw1sr+0f/DQn01uxwl/5URPbUIjdjSW96jpqhJ22+zbK4SeYxva/lDTmvxUKPjv3AR
	 MIRIc4gqSC7uuQ2sB0Naykx2OtPrGusaHrUCufAfpeXoqHYL7CSlzcMhn1Bcj/jRwiR1Q
	 4iON9WopYQtCeW+AS+PoSuvSrtFpBJTCZ2Aap996cNYLR85PRSFkoPpf+bJy04rk9zXpx
	 QQgFhE/krGfBOHN2Dc3fk5v3Z6alyI1lVjW/Q2jKb1jGxbZjk7a9jzJpDhpsJOy4NLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="Yhsit/4I";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.64
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011064.outbound.protection.outlook.com [40.93.194.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA58606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EA58606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Yhsit/4I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4z7W/m38qscR0aN39AQlMabZoyX5EOl3O7mITKXovy1CwGGbFAKISsLCegJ94vxNCiEXzHpGI2SkVN4IZazULllKadSqlzEWdP8r5KzpvrDnEd8N0ahSbrSipNins/l+hBgC1HOLyQP1AvshsJAR8n53Y3Ypzr0OSsTVxXJMTBTFtJs813Ob3mh06WDHQ0ep2RUVQ4vABTSk4tLCOZm7S5jde9h0OeByfVLwgYqs9JV9XOl6DToBtc9+bbkiho6xSVnusgw6AI+xVLqqxcb+8TVbmTZekFhi7lsKi18TANAp+R3fqL67xWI2UIG1rfysfBS1NYYVBB/AqyfiWC6pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4k4Qj5XTRQZP3FclQeV5KNSHIGFhgCodpqRiin8YXU=;
 b=fkPAHV9+16IZAwL32mqw6/0gX6AvX2b1zrZeayc1RSYMTHaO9jX+DmS9hqyWVHs1Avn3vs8YiyHFS5CUUuYqsR9YrEpwb6Nf5Kesb3Ps0vY7BZCseqzejsyEkW6NkfL64aD98c0luuznGZsY9Js2co5CF2AcuYH1M9FQDZ3jky0n8GZLkCZ5andOrJcziGt9t4RV5e4dMny0rAgg6A/tyKk695AlLGbJhsLt345fbM6eo/tE8bRi+qMVaCO3WvB2FKtTGHSgv3zTBAI9MJHj9Ck5AJ8Qa1IGOgRBbr/0XxR5ucA5s4O8ZXTt0xcod/A1ldV5R2VheoGAu8DMDxoylw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=huaweicloud.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4k4Qj5XTRQZP3FclQeV5KNSHIGFhgCodpqRiin8YXU=;
 b=Yhsit/4IQ0hWAjCDeKrhCdSiuVVR/+XJSgfS7DotdwZtubv1tQwXwVomKD/rbuzQ7LxM+zdijrBWx4KtFTZsMgsFojIoOlA30D/TWW9p5UBC04cR4p3t+9Yj95FaiwHcna5m6bJs46LLiAhYIatNJj9H9zgfVdpJUY6K1bwE9kM=
Received: from SJ0PR05CA0018.namprd05.prod.outlook.com (2603:10b6:a03:33b::23)
 by CH2PR12MB4165.namprd12.prod.outlook.com (2603:10b6:610:a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 04:30:42 +0000
Received: from MWH0EPF000C618F.namprd02.prod.outlook.com
 (2603:10b6:a03:33b:cafe::4a) by SJ0PR05CA0018.outlook.office365.com
 (2603:10b6:a03:33b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15 via Frontend Transport; Wed,
 21 Oct 2026 04:30:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C618F.mail.protection.outlook.com (10.167.249.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 04:30:40 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 20 Oct
 2026 23:30:39 -0500
Received: from [10.136.41.43] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 20 Oct 2026 23:30:34 -0500
Message-ID: <1e9259b5-0758-4387-a572-37e2d32c47c0@amd.com>
Date: Wed, 21 Oct 2026 10:00:28 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/2] sched/cache: Reduce the overhead of
 task_cache_work by only scan the visisted cpus
To: Luo Gengkun <luogengkun@huaweicloud.com>, <peterz@infradead.org>,
	<mingo@redhat.com>, <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>,
	<tim.c.chen@linux.intel.com>, <yu.c.chen@intel.com>
CC: <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <linux-kernel@vger.kernel.org>
References: <20261009032943.95091-1-luogengkun@huaweicloud.com>
 <20261009032943.95091-2-luogengkun@huaweicloud.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261009032943.95091-2-luogengkun@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618F:EE_|CH2PR12MB4165:EE_
X-MS-Office365-Filtering-Correlation-Id: d84e4f27-c60a-4033-3257-08df2f2c1036
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|23010399003|1800799024|36860700016|4143699003|11063799006|56012099006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6iJ75sdUtlodo3H5hP3IeYZJmz6tbAMxtcc45Ph0kqbDvdMnor/kIifGOgQGDWHTZYP8nERIMAxxJvIpuu+2rWBQM2lRVgCAEao0rE1rWur47NZy6BcHSzkmH+DA5ZTMkt27p13LJc1l0G1L4LrvjsDL+IAG65CLQdUCANM6c0j1ViWKy+eindMpWehLTPPO0n/r6t+m71FUrQww6oiVVmP8Oy8iU37FR4hWxckGOaRAziI6/WWZp4stBAJVa5NtOUTtTFNhHt8PCDgrE+G7CoBoq9mrrPnI6AUUZDXzLEDC+eP3WLZgQYvCuZWSRb/L2myihvyV+4RJTF+kOEYomNF37nWK3o0L1Ukx/vSkxROOsIO9HsnVbfZnlI9SiGnvEZJciWnxjEosGHG63YPa3ONDMHKRSd/t2G9jKn2PSTPbC9Ye46rbsqXh43Dcwb3VhZQ+1SoS4qHpzy8tIntku6ViUO8NVs0SnKzFn0LZ5W1ebZTt75VT/z9itIuIp1Bm+6XL8mbOh4AwyzcbsfZENVIUwb3JjldP4KFub136grELgLFubDczTpRIN9o66iTYX7eKUtiCAJd85x9PyMshLHKR9IReNHliDVArV8vcpjCWj7O0rpg1LYVOTkKy3sFo5fn4edy0KicIj9qix57bPiEJqI6rtQsm7dCoRWSugGYqZ1RgQ7zgK+2RI2CYABigP68bDG2hJCwyTexhUAfkXA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(4143699003)(11063799006)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5vGe6EBRCCPp2DTwsKZbT2PgteAvcRejz5iqrSjKpHPQXKyOIFvwU/NE8n/z1dTeRApv/4HP3fe+bUvaw4DucaueC96cVPEPgIhq764HskH8r3OWYKbY9zInHSHojmFs2ADILx+ENe8sdJG9GV7f5ARa2hgV4U4x5u5QpvM4kjibe5cRyDGKa0ySqOSzqjWkrY1CUHngEjKI1l0fV7Cm8QAiD8ifDwYifIdL9IAaNN2Nz2c7/IHr13/GRPA/033ApG/JDEEdXdFt2yN7TxWWEA67WWTO8rjv1ETgZtV6KzMVfuWW/mOzQqay6eqvEf+A+OR5x4+thNgM4sEC9RYoVh/7KlQgePWkcntgPbGmpKUmG7JiZPgmNVY0JtVE8tr53lZ3Ngxna+nZpeiZymuEQXCxoExh/Re3FHLNr19MdP8o/VXhmwPVQC2U//NMKdxK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 04:30:40.5526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d84e4f27-c60a-4033-3257-08df2f2c1036
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4165

Hello Luo,

On 10/9/2026 8:59 AM, Luo Gengkun wrote:
> The overhead of task_cache_work() is high, especially in multi-NUMA systems.
> Currently, task_cache_work() tries to find the pref_llc by scanning all CPUs
> in the system. However, most of these scans are meaningless, such as those
> for CPUs that have never been visited or were accessed a long time ago.
> 
> To address this problem, introduce visited_cpus to track the visited CPUs
> and evict them once they have not been accessed for a duration exceeding
> llc_epoch_affinity_timeout.
> 
> Now that we know exactly which CPUs to scan from visited_cpus, we can remove
> get_scan_cpumasks().

nit. Could you include the performance numbers from the cover letter
in the commit message here to keep it around for the record.

> 
> Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>

I gave it a spin on my 4th Generation EPYC system (2 x 128C/256T) and
I could see small improvements and no regressions greater than the
expected run to run variance. Feel free to include:

Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

---

o Full benchmark results

  ==================================================================
  Test          : hackbench
  Units         : Normalized time in seconds
  Interpretation: Lower is better
  Statistic     : AMean
  ==================================================================
  Case:           tip[pct imp](CV)      cpu-track[pct imp](CV)
   1-groups     1.00 [ -0.00](14.00)     1.02 [ -1.98](11.49)
   2-groups     1.00 [ -0.00]( 4.92)     0.91 [  9.49](11.67)
   4-groups     1.00 [ -0.00]( 2.01)     0.99 [  0.51]( 2.98)
   8-groups     1.00 [ -0.00]( 3.13)     1.02 [ -2.16]( 3.25)
  16-groups     1.00 [ -0.00]( 1.52)     0.99 [  1.03]( 0.83)


  ==================================================================
  Test          : tbench
  Units         : Normalized throughput
  Interpretation: Higher is better
  Statistic     : AMean
  ==================================================================
  Clients:    tip[pct imp](CV)      cpu-track[pct imp](CV)
      1     1.00 [  0.00]( 0.27)     1.01 [  0.81]( 0.62)
      2     1.00 [  0.00]( 0.22)     1.01 [  1.01]( 0.70)
      4     1.00 [  0.00]( 0.36)     1.01 [  0.65]( 0.13)
      8     1.00 [  0.00]( 0.23)     1.01 [  1.15]( 0.41)
     16     1.00 [  0.00]( 0.17)     1.01 [  1.04]( 0.17)
     32     1.00 [  0.00]( 0.16)     1.01 [  0.95]( 0.12)
     64     1.00 [  0.00]( 0.16)     1.01 [  0.64]( 0.21)
    128     1.00 [  0.00]( 0.04)     1.01 [  0.83]( 0.40)
    256     1.00 [  0.00]( 0.14)     1.00 [ -0.05]( 0.25)
    512     1.00 [  0.00]( 0.25)     1.00 [ -0.12]( 0.63)
   1024     1.00 [  0.00]( 0.31)     1.00 [  0.46]( 0.29)
   2048     1.00 [  0.00]( 0.41)     1.00 [ -0.20]( 0.49)


  ==================================================================
  Test          : stream-10
  Units         : Normalized Bandwidth, MB/s
  Interpretation: Higher is better
  Statistic     : HMean
  ==================================================================
  Test:       tip[pct imp](CV)      cpu-track[pct imp](CV)
   Copy     1.00 [  0.00]( 0.33)     0.98 [ -2.41]( 3.81)
  Scale     1.00 [  0.00]( 0.63)     0.98 [ -1.64]( 3.10)
    Add     1.00 [  0.00]( 0.49)     0.98 [ -1.56]( 2.58)
  Triad     1.00 [  0.00]( 0.46)     0.98 [ -1.87]( 2.66)


  ==================================================================
  Test          : stream-100
  Units         : Normalized Bandwidth, MB/s
  Interpretation: Higher is better
  Statistic     : HMean
  ==================================================================
  Test:       tip[pct imp](CV)      cpu-track[pct imp](CV)
   Copy     1.00 [  0.00]( 0.42)     1.00 [ -0.50]( 1.43)
  Scale     1.00 [  0.00]( 0.53)     0.99 [ -0.53]( 1.52)
    Add     1.00 [  0.00]( 0.44)     0.99 [ -0.56]( 1.19)
  Triad     1.00 [  0.00]( 0.44)     0.99 [ -0.54]( 1.23)


  ==================================================================
  Test          : netperf
  Units         : Normalized Througput
  Interpretation: Higher is better
  Statistic     : AMean
  ==================================================================
  Clients:           tip[pct imp](CV)      cpu-track[pct imp](CV)
     1-clients     1.00 [  0.00]( 0.03)     1.01 [  0.86]( 0.17)
     2-clients     1.00 [  0.00]( 0.16)     1.00 [  0.47]( 0.31)
     4-clients     1.00 [  0.00]( 0.32)     1.00 [  0.46]( 0.27)
     8-clients     1.00 [  0.00]( 0.45)     1.01 [  0.55]( 0.26)
    16-clients     1.00 [  0.00]( 0.24)     1.01 [  0.63]( 0.27)
    32-clients     1.00 [  0.00]( 0.76)     1.01 [  0.76]( 0.69)
    64-clients     1.00 [  0.00]( 0.73)     1.01 [  0.79]( 0.89)
   128-clients     1.00 [  0.00]( 0.97)     1.01 [  0.53]( 1.28)
   256-clients     1.00 [  0.00]( 1.13)     1.01 [  0.64]( 1.21)
   512-clients     1.00 [  0.00]( 2.23)     1.01 [  0.57]( 1.74)
   768-clients     1.00 [  0.00](11.06)     1.00 [  0.04](11.12)
  1024-clients     1.00 [  0.00](11.42)     1.00 [  0.03](10.77)


  ==================================================================
  Test          : schbench
  Units         : Normalized 99th percentile latency in us
  Interpretation: Lower is better
  Statistic     : Median
  ==================================================================
  #workers:  tip[pct imp](CV)      cpu-track[pct imp](CV)
     1     1.00 [ -0.00](25.85)     0.76 [ 24.00]( 5.26)
     2     1.00 [ -0.00](22.30)     1.17 [-16.67]( 4.41)
     4     1.00 [ -0.00](16.86)     1.10 [-10.00]( 4.58)
     8     1.00 [ -0.00](16.43)     0.88 [ 12.50](16.90)
    16     1.00 [ -0.00]( 0.97)     1.03 [ -3.33]( 2.48)
    32     1.00 [ -0.00]( 2.40)     1.01 [ -1.16]( 2.90)
    64     1.00 [ -0.00]( 0.40)     1.00 [ -0.00]( 0.81)
   128     1.00 [ -0.00]( 4.87)     1.01 [ -0.80]( 0.60)
   256     1.00 [ -0.00]( 0.89)     1.01 [ -0.77]( 1.01)
   512     1.00 [ -0.00]( 1.41)     1.00 [ -0.00]( 1.64)
   768     1.00 [ -0.00]( 1.84)     0.98 [  1.65]( 1.62)
  1024     1.00 [ -0.00](13.59)     0.92 [  7.57]( 4.64)


  ==================================================================
  Test          : new-schbench-requests-per-second
  Units         : Normalized Requests per second
  Interpretation: Higher is better
  Statistic     : Median
  ==================================================================
  #workers:  tip[pct imp](CV)      cpu-track[pct imp](CV)
     1     1.00 [  0.00]( 0.00)     1.01 [  0.59]( 0.15)
     2     1.00 [  0.00]( 0.15)     1.00 [  0.30]( 0.00)
     4     1.00 [  0.00]( 0.00)     1.00 [ -0.29]( 0.00)
     8     1.00 [  0.00]( 0.00)     1.00 [ -0.29]( 0.00)
    16     1.00 [  0.00]( 0.15)     1.00 [ -0.29]( 0.00)
    32     1.00 [  0.00]( 0.15)     0.99 [ -0.59]( 0.00)
    64     1.00 [  0.00]( 0.00)     1.00 [ -0.29]( 0.00)
   128     1.00 [  0.00](14.82)     1.00 [  0.00](17.39)
   256     1.00 [  0.00]( 0.15)     1.00 [ -0.28]( 0.64)
   512     1.00 [  0.00]( 1.40)     1.00 [ -0.39]( 1.73)
   768     1.00 [  0.00]( 1.81)     1.00 [ -0.25]( 1.56)
  1024     1.00 [  0.00]( 0.17)     1.00 [ -0.32]( 0.76)


  ==================================================================
  Test          : new-schbench-wakeup-latency
  Units         : Normalized 99th percentile latency in us
  Interpretation: Lower is better
  Statistic     : Median
  ==================================================================
  #workers:  tip[pct imp](CV)      cpu-track[pct imp](CV)
     1     1.00 [ -0.00](33.20)     1.21 [-21.43](25.04)
     2     1.00 [ -0.00]( 5.00)     1.00 [ -0.00]( 8.94)
     4     1.00 [ -0.00]( 5.53)     1.00 [ -0.00]( 5.53)
     8     1.00 [ -0.00]( 0.00)     1.00 [ -0.00]( 0.00)
    16     1.00 [ -0.00]( 4.43)     0.92 [  8.33]( 8.13)
    32     1.00 [ -0.00]( 4.84)     1.00 [ -0.00]( 0.00)
    64     1.00 [ -0.00]( 0.00)     1.10 [-10.00]( 8.13)
   128     1.00 [ -0.00]( 8.15)     0.90 [ 10.00](10.68)
   256     1.00 [ -0.00]( 3.36)     0.95 [  4.91]( 1.68)
   512     1.00 [ -0.00](36.88)     1.01 [ -0.85](35.08)
   768     1.00 [ -0.00]( 4.02)     1.00 [ -0.00]( 4.99)
  1024     1.00 [ -0.00]( 1.61)     1.01 [ -0.78]( 0.87)


  ==================================================================
  Test          : new-schbench-request-latency
  Units         : Normalized 99th percentile latency in us
  Interpretation: Lower is better
  Statistic     : Median
  ==================================================================
  #workers:  tip[pct imp](CV)      cpu-track[pct imp](CV)
     1     1.00 [ -0.00]( 0.14)     1.00 [  0.26]( 0.00)
     2     1.00 [ -0.00]( 0.00)     1.00 [  0.26]( 0.00)
     4     1.00 [ -0.00]( 0.14)     1.00 [ -0.00]( 0.00)
     8     1.00 [ -0.00]( 0.00)     1.01 [ -0.53]( 0.00)
    16     1.00 [ -0.00]( 0.14)     1.01 [ -0.53]( 0.00)
    32     1.00 [ -0.00]( 0.14)     1.01 [ -0.53]( 0.00)
    64     1.00 [ -0.00]( 0.00)     1.01 [ -0.79]( 0.14)
   128     1.00 [ -0.00]( 4.56)     0.99 [  1.48](27.76)
   256     1.00 [ -0.00]( 0.13)     1.00 [ -0.25]( 0.13)
   512     1.00 [ -0.00](28.11)     1.00 [ -0.23](25.97)
   768     1.00 [ -0.00](13.36)     0.99 [  0.60](14.72)
  1024     1.00 [ -0.00]( 1.46)     1.00 [  0.32]( 6.83)

-- 
Thanks and Regards,
Prateek

