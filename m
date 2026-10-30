Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793340315;
	b=TtrDKuSEv+AmH4/bpZkHq7I2Ib3c2fN/HVXn2vGCkh9rX/yuLUOg9j/p6V/0SuRk1GKA
	 TC9NQ1TwzJD94y+PzeVRgQww6arQnWkBg9hTgkXP8k/KXCHrmI85ywu3sQ2rPRKVHT+VF
	 9CZrb7vU8ykLo1SfouM11nmunq6E09X0zJYp84g3LsNsA5133YZ2bqmDzF2Dlq+Gu6S2Q
	 LqfhDdO5EB4nxVWjl0/by0jSGXuM6qzdRIxstybl1LQyHWKeA8OWhcYXc/YEUzzKzVKBs
	 wzag9Dbq/KZ6mJoL7GtH5cp4ej0kzO9/EOd55IoqewCOCMRDHC43+T0J0BGQRzL8Dmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340315;
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
	bh=C6IeU7vEjuG6AGa28AdZajY0t4WzRs7laTkC+z/NPck=;
	b=okwUI8MmBAp1ZEY9IzlNXhYFadc7xWXijw9fZQeXS2VKBXjizOexFyu6rXdfgQyU68Mi
	 5qALYi4DIbXnZ+yygXg+7CrKEyB0utOemzwSuz/G5Q63dcgeMn8MYSQmHKH3y0R8uo5qu
	 P3QxVFI75lAHhzLYVPAD4Kno/+RjI0I3lh+uiHWJP9Tmi5U39xRvv0HmH0X6A1XdyO3Aw
	 k6AUrwNk6RNcmuNEFNlT73oCgr1pIRg69FwpebXiYQa6b4A5gPHmTZUp0Cr6Zp9zjvCAa
	 Wj1oZZfTXdGo0uLxTvDMrGUoGLivptPAJSE9QCRDKTGOwYhvj+i0lD6AD6RiJDNFvmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BLtwBEqT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.46
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010046.outbound.protection.outlook.com [52.101.201.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD10606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FD10606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BLtwBEqT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjc1BuSXXZxWi5baNLmzlTzF3vheQ249EXjqUV0hExm7O5QfnKqiRVlhN64bIv+NT/HqfnT83S4aIDCxCSUqF44ppJMjlR9mwxWcbrTj9VkREkAC1vEF7UNJ9WhAkzZli8ak3MQdCKbdA6exNeUjky14iKCggzNhvHQPvSQZlVhitShrww70wS/pBzxf9rXKNtsaXHD2CtrRV6FArF7FDZKtbTsrrNvT8y1GWNFIpn+GXqWzlVZ3N+K1meN92son+e+PoOUSYcYHKCnvTcJxWckxTZ3fZWH0kVAtx0XbZChTwP+GMNaKZqyszOj/r+gqBoSMmn0TvuZoORvtkkzy3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6IeU7vEjuG6AGa28AdZajY0t4WzRs7laTkC+z/NPck=;
 b=QFhO37ZvHkI4FszPTpdRphIy5WjW2w0//85sIm7yT/qU56d6rc9PP9Wil4iFQZipzaSWlupSiZZG72WnnbDX1rP5REXXznemUCgHrj+mvSoZ6TWElCVrIzYVDQCGkatV9Tf2PiETYgWUglrVNurFrG1lkt7haBe55KFUK5U+lPufdaHMmS+lCtfzkNZI1b2GbgGLiJYd5gioPFYp3T3bakae+JYSJ2Biy9PcrWDCq91zdLlFLLoRMwb7g0UpTvAgIJqv2K7TLCQPZJ8ViwjzSGPCazKUkO3FNtQ0gg/Buqp2QteoqeKuq3KtjhppPLKts5cQY3zsbTgGZieRrAwVcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=atomlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6IeU7vEjuG6AGa28AdZajY0t4WzRs7laTkC+z/NPck=;
 b=BLtwBEqTfqnHWJz1n7S9FARviMwnjgKOCBbLBtVHoXLSC4Q4wj0ZaNW1UGfMTxwkQf7M8sClK6F77YLUarorOFh0t6K+WdDMY6NSQrMirm82s+A7O5Cfz2i1DiVE4FNmnksDkf/eGI2zGUvFQOKDLFLkMW3NYu/Nb5WQo8QFyCg=
Received: from DS1PR04CA0012.namprd04.prod.outlook.com (2603:10b6:8:44f::7) by
 IA0PPFB6B4D32F9.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 06:05:10 +0000
Received: from DS1PEPF00053453.namprd04.prod.outlook.com
 (2603:10b6:8:44f:cafe::3) by DS1PR04CA0012.outlook.office365.com
 (2603:10b6:8:44f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Fri,
 30 Oct 2026 06:05:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF00053453.mail.protection.outlook.com (10.167.23.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 06:05:10 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 01:05:10 -0500
Received: from [10.136.33.84] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 30 Oct 2026 01:05:04 -0500
Message-ID: <5ba8f652-6f82-4384-9343-1ff093880c39@amd.com>
Date: Fri, 30 Oct 2026 11:35:03 +0530
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
Subject: Re: [PATCH v10 tip/sched/core 6/6] sched/debug: Introduce per-CPU
 debugfs files
To: Aaron Tomlin <atomlin@atomlin.com>, <mingo@redhat.com>,
	<peterz@infradead.org>, <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>
CC: <paulmck@kernel.org>, <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>,
	<bsegall@google.com>, <mgorman@suse.de>, <vschneid@redhat.com>,
	<zhanxusheng1024@gmail.com>, <neelx@suse.com>, <chjohnst@mail.com>,
	<mproche@mail.com>, <sean@ashe.io>, <steve@abita.co>,
	<rishil1999@outlook.com>, <linux-kernel@vger.kernel.org>
References: <20261030013817.753804-1-atomlin@atomlin.com>
 <20261030013817.753804-7-atomlin@atomlin.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261030013817.753804-7-atomlin@atomlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00053453:EE_|IA0PPFB6B4D32F9:EE_
X-MS-Office365-Filtering-Correlation-Id: 4926df89-8148-466d-95a5-08df364bc151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|32650700020|23010399003|376014|7416014|1800799024|6133799003|18002099003|22082099003|56012099006|11063799006|4143699003|261026140227099003|261028144727099003|10067099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	woGDUy8GJiVSdyYFdWpqa4LsmqU1zTDAE9bVwguSxBWr5w98g/JT70vtRBOIEaO3iuBntrsGcLsuivBfR1n0umG0fIGasV4ah2JAe1e0/XsseBvYWzVPWhAfW/PqjcUsLJxEadr92gYe1LVx3Q+zcxKPNV+7vexGWFOSnIXTVCU7GzxrnRc3+nAHvv0YDhKEUOMu83OYQbWUmOsIGnwyebQx2XnOiA4+TyKv31tyZD0NmEY6zzbqk3JTHFU0NV39goEkaaXnWhu8S1DZIBDLD03mVKIHQofi/liee/OP1JrOwDwrkJoJbzL/2KMHklgxeZe4SbId/WPjJyRzyd0FUV7U3OYtJjxNsQsRJniRk4Ple24iCtQJqNeAOeBE7M/OL84qJBaJbLPw44x5iosJoQe+5u/L1xZIeHfNOkrInv1qZI1iFy35w0uzvw/kB+kHGGTdbm1CQFfLTMvj4ghBGergmmZWo+xsuetKmtYfkSlO/LMgKDOqtuNEPwJbkQCAzKeQ4t511dNw4OEKbflyNwRu+DULbzld98tkpxmeFccuNe2tF5EE2HgxYFSZQL3ydcFJu64H7q4snKOnIrw2y4SnC+LutRU+TLFxrspjemBem1yvz5pPy4xj1FrR7JpZOeSUck6V25tHTqN2GkzT6HChidB/zYeDsx7jgKkOe3rjNiBwcPmuGOq96UAVKzUTheRsmco1ii4gk6rjiOD2RQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(32650700020)(23010399003)(376014)(7416014)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261028144727099003)(10067099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w7cCdgOScXH5CQUUjt/GI1JTvWoNAEPflONIfy80q0+Z2KtpS0OVdYwriBNyLEpbBlIyfxToFaDilMKBSV5ygEIsdvVVBzzJS43lzX+ajRp3OJli3Dx2F8KAo8s44kj4ceErF0K0CbFBBQDprtmVveJ8z+3FM4sY8HSCh42xG/zB8ukgEtDvMqEjIzgnYuRw+RN7rqr7vxOAVB9NQaUd28q6SERFAUSTLV4fjz97A9CAqLUetmt9bILRVAIsTaBr9ND3qcXV+op7bc8s+Ov7xvY9/j0IYpyvTN64bxmaizGXTDB7r9gvguO2CkfoI6KzmMeU3lvBDWWMmS10uhJdzk/N6z7YBRJ72QoWJmc+lCp4HEStgy68LvXzZyN271z9Py8TXq2oBc8xuAKELzFbcPw70DLOTSoLCAcVJ0C69gKSdbB2hgUaGtlZuuANgPUI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 06:05:10.3084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4926df89-8148-466d-95a5-08df364bc151
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00053453.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFB6B4D32F9

Hello Aaron,

On 10/30/2026 7:08 AM, Aaron Tomlin wrote:
> +static __init void debugfs_cpu_init(void)
> +{
> +	struct dentry *d_cpu_dir;
> +	unsigned long cpu;
> +	char buf[16];
> +
> +	d_cpu_dir = debugfs_create_dir("cpu", debugfs_sched);

Missing an error handling here in case this fails?

> +
> +	for_each_possible_cpu(cpu) {
> +		struct dentry *d_cpu;
> +
> +		snprintf(buf, sizeof(buf), "cpu%lu", cpu);
> +		d_cpu = debugfs_create_dir(buf, d_cpu_dir);
> +
> +		debugfs_create_file("debug", 0444, d_cpu, (void *) cpu, &sched_debug_cpu_fops);
> +	}
> +}
-- 
Thanks and Regards,
Prateek

