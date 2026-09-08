Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010025.outbound.protection.outlook.com [52.101.46.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33AA1E260C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836180; cv=fail; b=r0AGcG7OCY1hhgLKhaQnoiSrkR9Bp26zh9tzEVNVxCe907haVrkyHMLDGwYFb2f8BT5jlThYK6Jll2hCHL0Q9z+SjKbUm/b2v8WDHG+kypn/7m/XC+wtTUvrd2dChs0f2GlcEucceMcJ4E1VipvM5qymA5IDe7W/IhvWES9eeeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836180; c=relaxed/simple;
	bh=p/8HpmD1ObgtX0eeq7zNkk0EmFm1a+5h+qdOqmowB3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ejaA9/Q+WqNBcvLdhIE9vjab18R3NAigakUaijN/4UqJhDtwN26KVmPnGFOnxeLAULGgCVACq5OY9b7UPc8A2ubwSdxMzciCcSTgUsUGtWZC62bROO1I3dC/iDCyynATeR4P7hX1i6hfGXroVleBlE8VOKBVIJCD9f4fscDsAn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2JyDrDgL; arc=fail smtp.client-ip=52.101.46.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2JyDrDgL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JhMAHI7BlREogWAziVTGH3jqQnaJDNnD2c0nT2cp2Wpc7fqSzmTy81xZ6HcqrEljojRuDAPhXbaiieJ5vfJdbzF/YEQTzYZzTCbz0Er3cUa6He3S7GSjXSN1ZU7v51o+kbIAYpBL0MYWJGBCOC0Pv04d//VMdSDLF7bj1f7FxhXQ4pENriRcuz6MplGIoCQstCJJuVoT/Ri5+XBs572M8Bg6JvNdZ9lnotJjV8jAsFZwN55ODQWdpM8FBU6AKrpVkHbM/2hLPCZUAp5ONUDMa64WmBZVpIwwqLU3lDTC6j37qzvB7smqIZm99I0+1mi9Zx7sgaNTtmUgv1+dog0foQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQQXJjgYiJuqUm5mwkKIetZ1ppMCZBwGDjYkFlBfN2w=;
 b=WvOH2cGSbOgFd7FTkl7U4H9r6rI2NzVRL2h6byHHhVflq3AmULn2X/nqbQ0LRnXszPjMyeOlDn/5cixLWuYIFbDy5LmIgIe9g7y6BDm2yqQBlHAkH3VUzgMZeLwMHFTKn2iS1065SaROX1FK/MJxXCiExMcxkhQlcMUZFHq3aVWeEYoEENujGGZXjf1TbgtdrzM0Wj3u754GkikAY5F72YfOgBlvShmRO+Qkm6o+fR/bUMgCTpdLn/h6Ii144F1BiPLUGoe+OXJ+vxEyjm9+EWp5IaYhJr8DFzEVL+wEknBGu+Difq3QsWGlM2EOV+dJXlQbjamHWtw/e0fOHEASxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQQXJjgYiJuqUm5mwkKIetZ1ppMCZBwGDjYkFlBfN2w=;
 b=2JyDrDgLRd/Y3Mhzp33cHHvnHo3EI5YdxQl1FSm6uLd1ZnFaMjJzLgR03PpFEf2vQMfWYZ15+pfJygc7+CWuwCIE4XpoMBUlGQl0haJYgwQtMJ9ZUU0vlGk4OFooFZENRpiETRXdUvXjjeQ6wHrJjNwvlgTiBAgtM871M32IdH8=
Received: from BL1P221CA0036.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::6)
 by CY8PR12MB7492.namprd12.prod.outlook.com (2603:10b6:930:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 02:56:14 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:208:5b5:cafe::7a) by BL1P221CA0036.outlook.office365.com
 (2603:10b6:208:5b5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 02:56:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.0 via Frontend Transport; Tue, 8 Sep 2026 02:56:14 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 21:56:12 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 21:56:12 -0500
Received: from [10.136.42.177] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Mon, 7 Sep 2026 21:56:09 -0500
Message-ID: <a6fe8f72-256a-4374-a1d4-daaa70ed6882@amd.com>
Date: Tue, 8 Sep 2026 08:26:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/eevdf: Fix augmented max_slice
To: Vincent Guittot <vincent.guittot@linaro.org>, <mingo@redhat.com>,
	<peterz@infradead.org>, <juri.lelli@redhat.com>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <linux-kernel@vger.kernel.org>
References: <20260907123855.1297976-1-vincent.guittot@linaro.org>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20260907123855.1297976-1-vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|CY8PR12MB7492:EE_
X-MS-Office365-Filtering-Correlation-Id: d5544438-ebc0-4adf-59f5-08df0d54bf1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|82310400026|1800799024|376014|10067099003|18002099003|22082099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	5yFtd+btNNSH8a95ORrzCAOiy8iy+/yHs9W/a4oqVE2qYSHhxFbynqciGVZS1m5LsHLe0q+gcKhlWEvjQtppKoAw/m01iQnsdyficgeep6R2ls62PLwiyGQHJAE9QrnE+xqQXoOgMOk0cJDkT0KVx61OkPJOBE5OmIPG/g3ZadeoMdYxTOudS6504Tjff5O06yX+bXGodWaNP3Yvlg309RGc4fZmfWr/ZeDwoMZtMEtBhEGiS0JqWehnaUHh1v6ijqKyWLf+ZHreTsoJ5gdl+O9UvAwwyqqex+injsfaAjH5UvwMw30nsODuPxnlN774mDFF0FTxuHwJ2IOBiklVgL/zjZ4QYVmT1BThhoTEjcxHgOybC8fdGOFmMP9jWTSMoU/5e1OwX5KsKp+1+ZAiyMapa5LXO6jsDdwxFj7DH/HfMjx6I8QvTiUojLtjAzOEYXVeIbIYYX/WLUm659Yy1mQ9zvf+0uhRYSrDP/H16qNKOAyjvEZOIiNyn2WcsDsNhDSTEqbKLqrUzipbsyYw6wUyF6NJU8inUm1ZQseXX++B7Gc4M0WxHOvtK20TBk8JDosE9JYlo7H64RlgtCCHUa+7YEl7apGOO5rV71uM3w+GeQPDqpwSZi9il2s3ieaZrsdWf5PzLcDrMJsLb99tjKneazFqbxZ28BanS+wnDNpLLa99DIUhFvdd+Fb9K6tYextWe4uMHn6ty+8dw+ErWf0lSuJ/oPyEzGwJwmVYD2o6bt/G1GG/v8x7AXNBS9L9
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(82310400026)(1800799024)(376014)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f2FywSCTnLTDusPv1DsbTaUYgiqh+eCyePhkgDi0H0PBC9DfSMaZmcUXyO7Ul4gxdMTr8h0pde3t/+t+ZjYYhd3GbMVXX6QB71xqkEYrFvyMFVEahqLgdrQ3J6HZdLAGvzY7E8t4GScCIerlgf8AEGotC/Z2wQiRVNk6fyG0JaAZpXHq9KsIVNWkgCpfyxco5ZkvRmbEZqnOGQT1/KBwrKT/lLAk09Tt98MFBpTpO6uq3+LziDCGAD4J6u/VpshgvS2z5V1QLYHwh/0LrJ5kmndmmLNmOZYv5PzOo+/oJ6AF4H1MtR7HM8DI4XFVFy/NYMCBcjDRkwRO7oAXUmmMjED6qPR4tGBT6KdmKd/h+a0VMTirlKoo9uWr8R3MIJoPTjGM6B4pxT7pzc+l6MSrF+1xZAVvATtDcq+0YA9LpbIvLMJjUZ/h8F4XapO5HvKC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 02:56:14.4121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5544438-ebc0-4adf-59f5-08df0d54bf1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7492

Hello Vincent,

On 9/7/2026 6:08 PM, Vincent Guittot wrote:
> Similarly to se->min_slice, init se->max_slice with se->slice before
> enqueueing the entity so the augmented callback computes it correctly
> at parent level.
> 
> Fixes: 6e3c0a4e1ad1 ("sched/fair: Fix lag clamp")
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>

Feel free to include:

Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>

> ---
>  kernel/sched/fair.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index b8bd308c2d5b..5d819918e870 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1073,6 +1073,8 @@ static void __enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  	sum_w_vruntime_add(cfs_rq, se);
>  	se->min_vruntime = se->vruntime;
>  	se->min_slice = se->slice;
> +	se->max_slice = se->slice;
> +
>  	rb_add_augmented_cached(&se->run_node, &cfs_rq->tasks_timeline,
>  				__entity_less, &min_vruntime_cb);
>  }

-- 
Thanks and Regards,
Prateek

