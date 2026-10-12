Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012023.outbound.protection.outlook.com [52.101.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC8C23D2B1
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798371; cv=fail; b=nSoo0KNsIrHvi9SEtsxm6FwjK2hZF43E/IDh/TPWVBJa+RCBAJwjreL0IgcgF08mYI1V6Slh7htutFk3R95TrOJ4qRX3YA4rV/JltCWu0OEHKK7JQADTIQIWjhmTtYRJChqi8oIwzSV32LPjR9mVQK5RammD8zfTGx+JurFLbxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798371; c=relaxed/simple;
	bh=2lZOqxLZj2Aro0tIQAwICOFS9v6eRU+wRSBrPgeOcps=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GzApVFoCXWlwAdYOYvYob/KN0lu3D8vj12Lt5C1HB1+7TJ9E7DidgFFksfCva/Ys0V5Ox8Z7S+j47dN7dcCbVQbg0RRzd7UIQ/8Hbk78PF8THRu11liaWeSAZHVRLnhVBuOAX+MYOerF4emuo45yL/L1Utnk189kI+5St3hQbJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3MBCoOg+; arc=fail smtp.client-ip=52.101.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3MBCoOg+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mC1VLPcFo9WF1LxMPPxD9gJF9pGQPvBFpiVlD0UVoraXgV8RlkXZxTH9jxwleiuukdseYNcMwyf+KAk8UKYO8kHCXtnTAUNNCkdt89FsGxfLKGCTlCNckQ0YefHV1oWqP+9OQn71mR/Aj7LgXpRTNJIS3AWv8BE7rX4Iz7ymASGfNbQUqKZyZdPMJYj/owwrj7S0MaLXJYEq/Ep70NRGWH3coGntoTwMZ82KbVoeKSPlHBzSggPtPMS72nGxKzGZTRdWutfFIcpqnL7a5t44CsAO0ccQl1+Mola9IopAkiMuFreeF2orT6mvTstYH1/WoFyIHB7M7YbYK6kcboHchw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=558iKlzAWilWD0n9HQ1o9B8NqWDkNvls+YpFK0sKgck=;
 b=lvWukC5t3E5zhRi9WmNBhE6xunHSAC6HpOzDB+C8bo6Y/1VEcq39CePaK2RLATkky80CilcNOufjXpKXYEKGETtqU+FlhwBUOckXg61Er0hzKxnrJk47FDeEL569iBCyQnOsVhO/PNd6CEo0gcFUkKNSchmmXTpND1vvcZb43JGMWG4TmDEJswQen6jh76vr6WnCUkLn4DiRi0EBclIFaSQuMGKte9PGzYYTaagjL2FBqj+X49EQc+BdbFaoSBYhkDO9YT7iWodKSfbdfJG3qq7H1tyYDfhOvsSMiBnf7NP5UrW0javNLMIIlEgPQTvJR7AbZUkDgjQc8c+TL/jqRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=mailbox.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=558iKlzAWilWD0n9HQ1o9B8NqWDkNvls+YpFK0sKgck=;
 b=3MBCoOg+UlAe5PeawMOgSXRSZ/A/VVYRNS3W4X6AYP7rwPMnLbwv5N/U06mxFjCbHBMB0mUJASsBuyKlpsrt215XzF35ugNhsfeSZPjNc+Q00O/pGpEbvQNVVPe8XDivBrhirC11W2bOJ9Q/luLLOrVpjdJZ3emXLjOkWbtb1Nc=
Received: from DM6PR07CA0114.namprd07.prod.outlook.com (2603:10b6:5:330::29)
 by DS7PR12MB6214.namprd12.prod.outlook.com (2603:10b6:8:96::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 09:46:06 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:5:330:cafe::23) by DM6PR07CA0114.outlook.office365.com
 (2603:10b6:5:330::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 09:46:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 09:46:06 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 12 Oct
 2026 04:46:00 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 12 Oct
 2026 04:46:00 -0500
Received: from [10.136.45.168] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 12 Oct 2026 04:45:57 -0500
Message-ID: <0c57bf52-2c28-4379-9c1b-4f35a8540c3b@amd.com>
Date: Mon, 12 Oct 2026 15:15:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] sched: rt.c: kernel-doc warning
To: Manuel Ebner <manuelebnerli@mailbox.org>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>
CC: <linux-kernel@vger.kernel.org>
References: <20261005072738.2902503-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261005072738.2902503-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|DS7PR12MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 65756146-959d-4b0e-5b30-08df2845a33b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|7416014|30052699003|82310400026|23010399003|921020|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	Hzpn6xbgqz7X63SAF4cM8zF4/R6OWjrdi0h+3smKT2sd4C2+WMv/ndtxHA4ZRKzptAarc2WqTfXWMMX+jepPZ0ChAuTKiZSbkHg+L6SSrlQSzErLwoZRs9Gek36QeMkFOi6pQwuDXuDUgLi5oUVRYTNFujvSjz+Cchtaix7CM/ZY2lPPilObJv9ZdaH5zdKSwRdNE/odDcz+oI8cDXenXskS7shka38D8u1RBfqt9Is5OpKiugXJ+QhgBXYb3hdl5OOicNs5HstSU0OJTBcvmY5RMLWqx9BDKp3wJDPrONdO0BUdOexMhHkEgClLHx29Kp8L1yNAmtmMv1lFygXbOsrXsTI9nthRQW4LmExI90sRX9XAyW8PR/v5VYRai3FQk/6NgOy8nP2BRtYCQ3Eke6mfJsErSq8JQ0XMm3aOQ3Tc5s69qXwSZurLcPILbfAbARgVgOM5Tm+P0ZciWDuMBy5csaT3EdKwb+Hbvn+HFbG2u1QgS1dErk5omA6pDRt90OOX1Vcy1WGQPbQS8zZrFa2sASC9WMCD/em4zx4tJro/7qWOnxsdRRohEnu4kwkiUwJtnlhx2wE6HIhyvV7Tk/N+xnqK8owdclXRezZ2jaCELsIbE7ILH9Ti0Rk5eecE1QVaToFxa8iv3D7eRVvmtGE70BoS3BrMkg/Vro/cZxFmCFtCoMtO5chqI7qTU5EBbb/s+Ixo5RMNc3KsKivw1vqLtcW73Fg3gXoxBYvn98Q=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(7416014)(30052699003)(82310400026)(23010399003)(921020)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yyhzk+JMeHKTfTLyFqdPupPAu6cUhAJKlCcdEYMoqo/0AKUkeUFwhK4m122ojTG3+YaccrZC6eolWIuVJOUucDvQCMu9KGN4KuGv+gT3iEOYGrk+f32NBoYh23fVqNIs3aL5zFek+8qhKyxUX21Cbrnn2kDhquJGHnGRskRh+xy3iJDJgVazSYI+nzrHVZMmjyLMiUHJs1viOct6WY9vefpteO3WxGsqTCTV5lp5Zkl87AwprtOv3SqOKAP6zOXc9Iuj55kO1JUUibiKHohdo2TiOQHTvXkJYS+ssopUPutYgnLRdlpcsNyqY9IjkmKPpPTKTWIKNvM1HsDgpadse9S2S41hGKe+rk5PAnUpcFVs8o5xVEIjubR72s3jOc6mZKTwLnNG/Z5Mrin9O7JPzbxktUPx12mGZjzqafB1m03pAbaTAE3eTG50T1N3xjhn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 09:46:06.5537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65756146-959d-4b0e-5b30-08df2845a33b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6214

Hello Manuel,

On 10/5/2026 12:57 PM, Manuel Ebner wrote:
> [You don't often get email from manuelebnerli@mailbox.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hi,
> 
> I'm trying to fix built warning and stumbled over this one:
> 
> $make W=1 -j8 > make_output.txt
> In file included from kernel/sched/build_policy.c:52:
> kernel/sched/rt.c:12:18: warning: ‘max_rt_runtime’ defined but not used [-Wunused-const-variable=]
>    12 | static const u64 max_rt_runtime = MAX_BW;
>       |                  ^~~~~~~~~~~~~~
> 
> I just can't make sense of this, because max_rt_runtime is used later in the
> file - see diff.
> What am I missing?

Any chance you have both CONFIG_RT_GROUP_SCHED and CONFIG_SYSCTL
disabled in your .config?

In that case, max_rt_runtime is never used by anything that gets
built in and the compiler complains. You can annotate it with
__maybe_unused to keep the build happy in those cases.

-- 
Thanks and Regards,
Prateek

