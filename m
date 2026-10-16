Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011024.outbound.protection.outlook.com [52.101.52.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FEE231836
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138590; cv=fail; b=oLSd/8SHc6xuQU+RPTOiteGW7zZPwBcz/N3MRwiDvV42LQn8KRgSo6HnXaQSwE5kxcQQxrwqnIwPHHuZB96ZcjlCa+11hnOHJo2eM8Of2Dt47RhL6o9RGHwxaFd0Fqd2nlJ8dZqGivhfCyVyXCx3Vm5P0HTqR8U9WCXCgq4aHp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138590; c=relaxed/simple;
	bh=VbopxEM/R8F8LDHg9hOS2QzUE+yjI5JaKCCV0Q0VkNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=r1jxYW5uMdQAwHzEaPqNlqybwmAPcM7dUewnNEZ+J5KygT0DH2UJFxdf8txYb2XaBM0le3GNnZ1MsJJd9Zlv8vCTYjGUXzBL/u6atYrZm4IauFJw5hMiR/wZIW2uaTRpUT0pTBp96l97Y6gvSbHuZ55NgDa+hBkDCFm0hVCY1i0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZgslhvnT; arc=fail smtp.client-ip=52.101.52.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZgslhvnT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KP6cZOS9+RZxijxGPK9dLEpjbJ5amxRKW8VVnE1+ZaMvMjjtebYM5f8pmcp6TIPKvWxxhqLnUdckJj1PGDB9rADnw5eSBfp7TR4sODGqUZPNSHBJxWvEp0+LnW9EuthuSkYrFgVNPM0EJAshmGDw9HgrK8VZC9j7dzhiYHJJH1699HGGhBdxxUMZjInk53UZOfEj0RM8Gc0zxGGcZqxQvA7BLZeSmHWneXI1qCwYQcAEOElqhsekwEKEQ6HsVBTdZW2DExKdeW9bFOEv+imZrntKaIebC7P6eL7GJhO8GBQbDHUVG2rQRNth2iEEA77X46/kbIyWwmUsaCeanUZASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9U2YXtBMgtRxYXPK4V3SW3xP+Iv6afRMY8/tWV6CnE=;
 b=tmSJlQ0LhkpOq8FehXoTdQUxMzRkdGw/CM/9B+TFm2tdrDI+gKCd+x3m//Rw8Zh/hASlppo53nPm8HN5HeoSfKOKwCGrRTN2qdVyU+ZWCZCoWtD00+vKwvzYuD236P4dObsBFVTNuxbDmIuHd5gS8zRzX2CWqHCPLd8krCy62smzx8jhWLXGQFtvJgo8ovuHO0tRELg+vG7VGVDyQHMLrAO/mZO8oJcefQzAkiINsUkRCWQIrUc/I+TsNSer/UkyjK5xY02LBP51jcduZW0onb6OIQi6S0EIVzdX1C0bgp6Wc1X88drt6KVIqzS9OCNImBNrPfXK3rC6hb7nk5cOnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9U2YXtBMgtRxYXPK4V3SW3xP+Iv6afRMY8/tWV6CnE=;
 b=ZgslhvnTtJCwGMtFD+JLenVKtupsJhmL296b5QvSlMHkLhagUVwrcXlv/1aHnpQzgITF4+De7akvFrDC135FGVTVsF4BrEjZnCu9Frw3xz3Otn/u6HzCh6oXUQzgWAjJzi+K9TPR+GKa6RwI74nxoyPrlOmUUA5Ey+0I0DERZVo=
Received: from BN9PR03CA0411.namprd03.prod.outlook.com (2603:10b6:408:111::26)
 by IA0PR12MB8351.namprd12.prod.outlook.com (2603:10b6:208:40e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 16 Oct
 2026 08:16:04 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:111:cafe::6e) by BN9PR03CA0411.outlook.office365.com
 (2603:10b6:408:111::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 16
 Oct 2026 08:16:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 08:16:04 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 16 Oct
 2026 03:15:57 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 16 Oct
 2026 03:15:57 -0500
Received: from [10.136.45.168] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 16 Oct 2026 03:15:51 -0500
Message-ID: <067742df-adf5-43dc-b939-ef5530001614@amd.com>
Date: Fri, 16 Oct 2026 13:45:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/12] futex: Switch PI futex to use p->pi_futex_lock
 instead of p->pi_lock.
To: Suleiman Souhlal <suleiman@google.com>
CC: Peter Zijlstra <peterz@infradead.org>, <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Darren
 Hart" <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, Juri Lelli
	<juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, zhidao su
	<soolaugust@gmail.com>, John Stultz <jstultz@google.com>, Qais Yousef
	<qyousef@google.com>, <ssouhlal@freebsd.org>
References: <20260917043339.2093426-1-suleiman@google.com>
 <20260917043339.2093426-3-suleiman@google.com>
 <20260917153831.GL4121339@noisy.programming.kicks-ass.net>
 <CABCjUKD60kEn0BZo0r3zie6QE8wFh-0V=V6OG3nfa3b1evjVKQ@mail.gmail.com>
 <644b5845-4a3c-4f49-abfa-edb4fa6ed89c@amd.com>
 <CABCjUKB9ntxrEzJQcd45j8dUde+91i--MCSW49RWR2Zr40QTCg@mail.gmail.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <CABCjUKB9ntxrEzJQcd45j8dUde+91i--MCSW49RWR2Zr40QTCg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|IA0PR12MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c4c1664-3cb6-4911-967a-08df2b5db8dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|23010399003|36860700016|1800799024|18002099003|22082099003|4143699003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	nYU5sDzHxiUFRTP0DLOZPpT3UHAIfephD7/7YmpX1ZHyyTMMhbftJ++rIcrfNLsQx36L+JZYaV00USGMucYmkqUwzUGIzSvIRLp65gGyejefXF+ZU5xIqXzhKyJXZ8+jJ+1lYmbshnQJC1Fbxqm5Q44eNbz1jnTuy1C1NElKOl4AfVeqUXyB/5wlfruGu5AXT4yr0h+rSb2+OmlMVGmFrBLgt0ydZBJ0ITqQ9m1GMG2IpGHXBLRMrS/3cgccFkiAjwdFCaUsr8PTN4jOIgXV0izFmEO57wlRtKXUOJFtcdzqen+1xyKGnanmxrYDkn+7kDWqGaGISIeuYgq4DOoBfrJWpG8fspQT+jaZALVjUhl9qbuAfIBBc9EypbM7/FoATLnVsoCVyOWQmXuXRizwzPGBBRIvdRtrYHX+dlrrCuUDJBrXdTh84536A6VRoMepEcIfE8Tl8SeIalS3jcVOkka/PWid6Y2N8BOVEEgp3MTy9WYpeC2eVuyR1oPJItCDHR1KWfXNlMQbnyXMWJvdIlJBDix9RDmeVpGdSvG+169GDgqJQE7YS+djE9opqDnpUQ88p0oB8y0zYw99jhjpSLr5lPYs2ML45q4501M6xh6kvnoxqcbc29tttdVXcXJabTsWTUXOlnZHruQDrLb78MMScaYagid0xy06dxesOFzbeIRItAlm8zNsIff6VQBlPWtGvLNJezsHY+I0tTvO4A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(23010399003)(36860700016)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hT2OyI1LPq+Ags6LM+IVwgaucCbrJq3M59zf2X0NAG4vnoGf0W4eo2Td9w9+d5YZHzTwFJtnJTcTdzKSrjX6kPamqGyN8aVvo6PbRiXgSPddhGpK1wpCzxx+mJVtCDYfc7G1CyQ1QF0L2+3gXnHLs/n9JBoq/nCvZPdeOzis93dqr1H7xuizDX2+UYZtoLPIjKrAvlUprcPDDGnpNHcqRM5M4Skak9pCCdqWMCx+UQvSTbPeeQp+iyiMY4O4dx4nyBRm8iUfpdIiW6+YF/u4qI336U7OqU/p51kZQkKBgxYvOTLs2jXxwImPPiHY1aJCBNh7cORwWPSzGUJxbBxoBzsuqVS+fI8u4TZ5550foIkaXX9PC07wp6PO8WrJXBbrqGj+mGJf8K0dCfE5gRMkTl7eU/3kjOhHU7HYEn2hZKQ5V/t060Vq50IKIuRRkKZ5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 08:16:04.2875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4c1664-3cb6-4911-967a-08df2b5db8dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8351

Hello Suleiman,

On 10/16/2026 11:29 AM, Suleiman Souhlal wrote:
>>> I suppose the alternatives would be to either figure out how to
>>> un-nest pi_lock from wait_lock in futex code or un-nesting the
>>> blocked_on lock from pi_lock in the scheduler.
>>
>> So the only time we try to grab pi_lock + blocked_lock is during
>> wakeup so I think doing that should be (theoretically) possible.
>>
>> The ttwu_runnable() handling is extremely painful unless we block
>> the delayed task fully. Since we have he new p->is_blocked state,
>> we can safely retain the p->blocked_on while running the task -
>> it is either cleared during unlock by previosu owner or will be
>> same as the lock on which the task blocked on.
>>
>>
>> Based on John's tree at commit 06ac43db4d8e ("[ANNOTATION] ===
>> Needs confirmation of functionality past this point ===") on
>> proxy-exec-v31-7.2-rc4 branch:
> 
> Sorry for the slow reply and thanks for the very quick patch.
> 
> Unfortunately, it doesn't seem like this approach works in the end,
> because there is still a pi_lock -> rq lock -> blocked_lock transitive
> relationship, which deadlocks when trying to get the pi_lock while
> holding the blocked_lock (when fixing up the pi_state owner in the
> futex code). :-(

Ah! So what you are saying is, since we have:

  p->pi_lock
    rq_lock /* ttwu_runnable() */

and

  rq_lock
   blocked_lock /* find_proxy_task() */

relations, doing a:

  blocked_lock
    p->pi_lock

would cause a deadlock via rq_lock. True that.

> 
> On the other hand, Peter's suggestion of moving the scheduler's use of
> pi_lock to a new lock, p->sched_lock, seems to work in my testing, but
> is kind of a scary change to me.
> 
> Maybe an acceptable alternative would be for the new futex to use a
> new lock (similarly to what the original patch does), but keep regular
> PI futexes using pi_lock, at least as long as they are still based on
> rtmutexes.

I guess that should do too, yes.

On a different note, why do we need the p->pi_lock/p->pi_futex_lock to
modify the ping_state->owner in ping_state_update_owner()? Isn't
ping_state->ping_mutex.wait_lock + owner->blocked_on locks enough?

Note: I'm still wrapping my head around the PING implementation so it
might take me a while to appreciate the need for the pi_futex_lock.
I'm using proxy-exec-v32-7.3-rc-tip-sched-core from John's tree at the
moment to jump around.

-- 
Thanks and Regards,
Prateek

