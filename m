Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792983754;
	b=5eDz2w8CRSAm03jYKUc4Yj9HcVTOuowDaU/+a+3yf3W0hH3SnplJC10Yvj2bJjWD/deY
	 w9fUebSHKVkYchUzD0xXmGM25HxPFTakCiopO3mniB0WmFv8aGkO0wPwMBFfHynaYFJdH
	 uPo1JwSzAcJPvqs/DdfsISMhFlA4QC3rEsBs0mL2CdpATaDlpW6s69GLSncdqgeE+QYwG
	 lgappYXG4btYY9GAh+Dp+gUi4NYfMaC4LIUDqCx7nr0durbeQXTDSSWuLtFZTGyAXed6H
	 k8x/s/67Am6VlDbfZZIEc8x4+AV/8HM1FqaO90xuI0VspdTq/9dK9nd2YXsvzfnupvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792983754;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 CC:References:Content-Language:From:In-Reply-To:Content-Type:
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
	bh=rLFATG+w0mqPlOlTsqDR5HR4AcpWq5cdxTflIC4ai0A=;
	b=y8I81bq9IPsQfLXnjVvjs8l0BVmSKCIWcpee+n3VnKJkSf+34y2MFw//XkmV6C0Do7Zn
	 PuMHlhKIQUKrlA38+PjoK6V9dCZSKt8ER1YHz4QCdor3F004Txei1olrHjh4CxHB5WiGC
	 FMib/2E8Hy5xk+TSuMUfC5w0M05lizdbEqDFWJHQxEWwHl/S7+oVWTG3zl3hkJE5X99lk
	 7zQgFnurVLnV7DKGrCXOvtPSg9K5TNopLT56xGb5sCCV8EMhSckEVutA7cH16srjQJD2K
	 q/A+tCZ1lkzsh/tZ2oImVKmCmkvALVzj7ffOgkOjsvwwjdIPh6MpbjivFHnIbZOeK+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="D/tUjgvg";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.53
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010053.outbound.protection.outlook.com [52.101.46.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BDC606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02BDC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=D/tUjgvg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4ftc/lkXDNkzzNx5WDFgKXqD/VCpSmCjGEHETve5HB/IuKrrn2dKLJjVNEAfy5kxsAhL32+zOWoGinRu4BmvgSd3OlkYI1RosSN+hKGxKKCbQH9oGF6Qf/LQHkPIeuxo6TnElAbSWN1Mo0kHpIX/BfJI67f02F95bwYmIYSDiYBGxVEEonUenyZMBZu/K1HlDPrCNBSM21lkGTLky1QXm+GJHIczHK0JFwc+YS2FC7vPbyVFnb4ZjIiRsRnVQEA8ae0cInlgCshjvVW3r2H6+SRkf4wYcHD+2oLgl8GykZ8B7gjjtQEutqED/4UKruf//J8nJUcdDRWyYrvOdsMfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLFATG+w0mqPlOlTsqDR5HR4AcpWq5cdxTflIC4ai0A=;
 b=PYMPElgKzpMBv5RtoandlsWvfNdFVvyR07Mexl0EOh3GzjglAXK+u7dRYaIqBHYexzbCZG0i2VI+/T6iprc5snKLUckQxLt8tPxWKk/YsE/xcPWgTw95aC4Md0zIP8ltBznWYMQb97ZMiKVXBSfKInI7whHP9cW1cHBqbvy0KmDjtRuYbDbIkPp8tB8MfnvAnczVtejMSgX0tTm0F3E+G2hLYa1s1DMHsFjNfdpGB+luVo0MIQVDrosRKBgzU/6C2WyiCNr6pHs52aQpw6EYLPPm97nW4eDZyqvzBAdgM6bmhY14ACKzpDc+hHxBNzwQQlhcr/MbKYwrnu1OUonEoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLFATG+w0mqPlOlTsqDR5HR4AcpWq5cdxTflIC4ai0A=;
 b=D/tUjgvgx4GzAAEz2W6ZVhzu+m7V/O51ZO7wWr14eRz1mEmOVUQhD1SAjOSXyzGEUSk8o+VJBm9mgN7GszOzj7iOHBrKuPMqpByMVi+MoaxdcBYBeq+RIDg1v4wUaA167flETYVg4XiGjR3lyN+1EDLCgFSZ0qLWx5qyecudvAc=
Received: from DS7P221CA0033.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25e::13) by
 PH0PR12MB7791.namprd12.prod.outlook.com (2603:10b6:510:280::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 03:02:28 +0000
Received: from CH7PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:8:25e:cafe::14) by DS7P221CA0033.outlook.office365.com
 (2603:10b6:8:25e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 03:02:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH7PEPF00000016.mail.protection.outlook.com (10.167.244.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.0 via Frontend Transport; Mon, 26 Oct 2026 03:02:27 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 22:02:24 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 22:02:24 -0500
Received: from [10.136.43.232] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sun, 25 Oct 2026 22:02:18 -0500
Message-ID: <943cc0a1-1547-486b-97fb-7000ae8b8190@amd.com>
Date: Mon, 26 Oct 2026 08:32:17 +0530
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
Subject: Re: [PATCH v33 3/7] sched/core: Activate blocked donor when no owner
 is found
To: Andrea Righi <arighi@nvidia.com>, John Stultz <jstultz@google.com>
CC: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra
	<peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner
	<tglx@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Valentin Schneider <vschneid@redhat.com>,
	Suleiman Souhlal <suleiman@google.com>, Metin Kaya <Metin.Kaya@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Zimuzo Ezeozue <zezeozue@google.com>, Waiman Long
	<longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney"
	<paulmck@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Qais Yousef
	<qyousef@layalina.io>, Xuewen Yan <xuewen.yan94@gmail.com>, kuyo chang
	<kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>, Zhan Xusheng
	<zhanxusheng@xiaomi.com>, "zhidao su (Xiaomi)" <soolaugust@gmail.com>, Hui Su
	<sh_def@163.com>, "Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
	<kernel-team@android.com>
References: <20261023220431.1106611-1-jstultz@google.com>
 <20261023220431.1106611-4-jstultz@google.com> <atxtWdx0nqTRAAYw@gpd4>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <atxtWdx0nqTRAAYw@gpd4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PEPF00000016:EE_|PH0PR12MB7791:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de2ad37-3a91-4797-2308-08df330d9181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|7416014|10067099003|56012099006|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	2pEv6spOO54VF8kAdMmVEiYRkGi0z5r1zUQqzZrtLchX+6n2qrl0OxWKEje+tMviffWW+eFG1HvekRSe5NlxdBk/fIUzblD0BzegguUXLLxTyaQaBrSQ8GlBaq8JmHAyiYjrRnS8DTTOCqgFaL3o1WEJDfzVqaAb8m2lZrGFNyVfJEGlyVaC5f7CjM3545RCGDUl1ZcaasnxZ1Why9G1CFaXAdOFWyGujRE46ruGYd++XOSswFjwlRIKNsetZTHUsnhGI7XcYUg7dLfzaQUDxnUGNqztKGPHi0/WpLSeqcuxL8f1Cxxx6IOiiWguCHO0VW5+KD7SikDBtEgpte7DiYRzGuc77ns64t6lfuGynhhXe8fROcIkkeq4aYvBDpHSl5S7iIUCqe7ZnItCOjjaivrt+JqsZUYHzydwt3WR/FtihrGr6liYOK6+R5cgNn1aLFlgxPGzwAk6n8EP0N0dcMhCflnL+f0Bj+LVbdzS6ahOmCqncFGvulg1YOgRa8GNUBTnZAcPi6uwHgYHfKbeSaCLXNIcejW3iDK+qDzR1fnGKhMa2AQB2+mOIkCaOuQv1vHgbpzy0KyR39voQIZ3GRRzm3PqP2oJ3lPhKtFv0uxaqbAo3MBUczSwzXlC9doCENkAgRvXE+nW+Aa9smJU+PprWZtuBojV3fo2GjWsBcT5y83xam6iald/Ox3c/Z6P4Ec6YZOXpn35jOJGyEWFdg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(7416014)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bdR2d077JMn9Uzwq8y6Tk1Hax6cYU650Cy8RF9St9haEpr/CUDxbRU8SrnDr8G1DR7LGWdnla96y/ZF0F/4syhA9WAFci1uH7fVWwmN5Vp/or+MV/G0HGEpn8InmwTkU74ZavGyjO+Sy0CLRPNf9Di+xtzC8OrQHcRLRK9uFv2cJq0J9OYmjlu67pE/7cSX8b7tJ5NRb2bY5ao0XTjNwJKGIbnnNwN1WgPnlw7UuFhbungCD7QlXefZGCkmUToz/tIpmgevBZUbxYA/QpEjRSyTLjoiwZOlyYdWUlGaGeJsXrMrx7fHz6vcqmw76iAcBSfYqbTW3Ybs9mh78gzoIFqGHVM+mGTg/wHr99DNBi/VaDYqe9B83jFFzDHM+ZMGfJdJ1uaRrLMI+eGFAaubDTYu4BdAM2VfXU4QxYF8BgxQ060nkOKAbcD6JN+dVrl+M
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 03:02:27.8031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de2ad37-3a91-4797-2308-08df330d9181
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH7PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7791

Hello Andrea,

On 10/24/2026 2:03 PM, Andrea Righi wrote:
>> @@ -7013,11 +7026,11 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
>>  		struct mutex *mutex = p->blocked_on;
>>  		if (!mutex) {
>>  			clear_task_blocked_on(p, mutex);
>> -			if (task_current(rq, p)) {
>> +			if (task_current(rq, p) || p->wake_cpu == task_cpu(p)) {
>>  				p->is_blocked = 0;
>>  				return p;
>>  			}
>> -			goto deactivate;
>> +			goto activate;
>>  		}
> 
> IIUC, p here isn't necessarily the donor, after the first iteration it
> can be an intermediate owner that is queued on this rq and blocked
> itself. If its blocked_on was cleared by a handoff (or its mutex has no
> owner, below), we now return it when p->wake_cpu == task_cpu(p),
> skipping the sched_cpu_cookie_match() check at the end of the function.
> 
> So with CONFIG_SCHED_CORE enabled, are we running a task that was never
> cookie-checked by the core-wide pick?

You are right! I guess we should consolidate all the "return p" bits
to jump to the sched_cpu_cookie_match() check.

-- 
Thanks and Regards,
Prateek

