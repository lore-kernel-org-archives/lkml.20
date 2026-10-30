Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353583;
	b=5g2iwYBWESHhUwtthTNS/Xx4l0RwEVv4L/i1CwwJX/JNXdtUg1gwrC7MpIgTjJZUTz4Q
	 2uhcsULh1/gxEWjFQHQPFdoKaKmM6v+wG0oLDATvmmcuAEyFUc8QNPxLeC3JpDPZWl6CF
	 AZ0JdNtbqgIE1z0atFE+KpZu0893PoLIlvIvxRtKUfVBHFIyKuaq+4DrlzDlvOpA1Tkvu
	 5ceXnlg3dW/rthRB/RWKQO5RrW94fmHeXC48HYNVy/g+8AIPjq5q62uaBn38tPajq2LbE
	 Gy//nNgvo1m1KkzoK+TYD2Xg4a2GG1lYPmQbAvyPYK5Ada5ET2KLYjGyVXrkqiTe0vQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353583;
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
	bh=OKsmsgS3q8pHa3B7KS2d/DunuGVotvDFcbZ21lhW+Js=;
	b=oMWgXna8buL4fVTgYWg4W3Mma+ym3GeVfKYk+gj3V6mqb/7m0SCKT2kWfzrjKJRgRxmi
	 Mbvip3Az3iZt+TsYjub8k7KUbRyw5bpexZVDB7RZz4HPp28uJSTF2H4w4e7KwapbcdO/c
	 sMcxooa8+DDEAw8yBVh2wMosn+VJJkmGcGPy5xj/d4e77z2SEhIWWk4D1hqwSpRwCmw3t
	 gtTUI7uZJALqYQ1yCuXW34uoz+WYfcQVrDBj+E6IqrM145rDX5lOhL3agdOB1loE/dibT
	 3POL9hYxYXgqP/RUdCOkz9eCnBBoSHGAByQi9Mrhf5gLqcxsc8B6/mNYbS6O0XQlOrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CjaMDp4C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.56
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012056.outbound.protection.outlook.com [40.107.209.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF16606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CF16606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CjaMDp4C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S8iMWUfUKe5vSzwMwqR4AQszkbvmPApBFeUd7KlOoX+sfiO2KhIBw1xjG7SB+hYkdKfgTRYulxWFx5FRbC6UXb7ZEnWrjOqFVQx9F/428o4ktuRuqF13kJO4ofdU+wkF5U3A80rtsXe1c6dyqDFQkib6JpuzxmjwFkzZMT+SD3q0VpcvIWYLeTdRJ0pWL1Nq2QXJn/LkylKytKaH/kcGiK9a4+V4zuVQNATP6/vWo34XpFoTXMKOOd9FptjGGSF4DBirzT9oQzW0u65JLS1XEMwbn08Cb2MiBbJxW8yLFVVkJob8SHKkHL/3sWE8YtzRFWj2JTCkj99CwGC/Fy3yJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKsmsgS3q8pHa3B7KS2d/DunuGVotvDFcbZ21lhW+Js=;
 b=J93dFWZ5tyoRnBs5LAVZFw8j29skPTHqW5yN7AsnFUzTcoCIoSldtSoW5VdOKwMrpmVf2f8MVZUfleGr1Ml3ZlIBwZEM+ifwS0yrVamrl5YDogQp5kf8JlfX9zEObKiFdU7s0s6C129rVRn9vq+cT6PazibfKDeUGGpC/dORTKJsyOJu7DTyGvLvOlvm95orhlalDDtrXGfoXrPeagAd9UGxG7bfciux90XeVE7E7XJfoQv3K/mx8vozr5gVra/DkGewSk/jwEdhSztkP3RB9DlN8jqkygHmWgJnr2o3fmHeF/b7E3KmnPRth27LWdwHTDxEeAZitgIKMKDWNCmTSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKsmsgS3q8pHa3B7KS2d/DunuGVotvDFcbZ21lhW+Js=;
 b=CjaMDp4CLVcW1905QA8lhwHDnybTTVwHxHViiA+UA7w0IYgNDIRFYMDQArBtgARerv5uNgEN0twI9J9FskGYa91VPypYDO1MmJReV3BmqlbIrZhHb0VmhB4RaqxFvbGdicLioux6UU+wGLWLJ+CIQVGbkXm5P0X7aWmbPnm87GQ=
Received: from MW4P223CA0005.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::10)
 by IA1PR12MB6603.namprd12.prod.outlook.com (2603:10b6:208:3a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 09:46:19 +0000
Received: from SJ1PEPF000037B7.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::2c) by MW4P223CA0005.outlook.office365.com
 (2603:10b6:303:80::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Fri, 30
 Oct 2026 09:46:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037B7.mail.protection.outlook.com (10.167.244.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 09:46:18 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:46:18 -0500
Received: from [10.136.33.84] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 30 Oct 2026 04:46:14 -0500
Message-ID: <a0dc959a-a05f-4725-86c9-1b7299d9b2a3@amd.com>
Date: Fri, 30 Oct 2026 15:16:13 +0530
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
Subject: Re: [PATCH v4] sched/fair: Replace random newidle_balance with
 Bresenham accumulator
To: Qing Wang <wangqing7171@gmail.com>, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>
CC: Tim Chen <tim.c.chen@linux.intel.com>, Chen Yu <yu.c.chen@intel.com>, Davi
 Chaves Azevedo <davichazbh@gmail.com>, <linux-kernel@vger.kernel.org>
References: <20261030091946.2498870-1-wangqing7171@gmail.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261030091946.2498870-1-wangqing7171@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B7:EE_|IA1PR12MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: cbedc5e6-8467-4be7-0209-08df366aa5f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|36860700016|1800799024|82310400026|22082099003|18002099003|921020|10067099003|11063799006|56012099006|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	WscDkQRU5hTEAyCbuPlQK8vVc1g7HyHLUgaxUUMF3N7UCppL5ZdNWiK/pzJ+O1zgdoRDwtqED9TBIfCEfH5h2IYOcjoXVUAkAKCNDxn0AjXJwMlQf8Brzd/or6AlkyLqAVJn7cQOSt9LIsca6e2DcZZzo/EQTtTA3sDd6JI1qfH4++XrZRv1rQY3iESx+tu8SZmOm1s/rQ2QNOjautpyVlsP6cIQubyVFOD0fzXyD/cgBsMot3uEWAMhHDKOtIwlZcSixtGyx8YIxPVDwtuPvl1UBSkru81xulm0mHUK9MpUHuR92aH1LocUmsfmWq+G4i4O5wRP+MdlbJjfy+jbNxGL0UYkzNN3HSE02EI+13jR82tyVd0/saF9XGV+tFNehoMRLAUYYmoKA2DoZeZychU9f3nzkPIbBCkXToWKsSRKrDRrd43iVF6R9SJDFkvZnjkkLlMtG27XU45CYxc2N/u6PRUhbdA9CRE0iNynDseSOPqQ2ZX1CCezcHJDy/wd122ys53iqdB2gcG/QX/jIBsP6iZBmaISjd4aaNOpupOfn6FfUGMblck2IZiobAHYkjFuA9216co6l/wmMYCFZSudiW8eCHc3P+qwTHNRKCM80SFpgOjWOk55GTSYojQNwJNKPgjGtnOx5Nfhyy6ULKPaywZl8T3RTDVvHyJ4BAoElvNvH5hdSdwcKn1iPC4UGd3d4PolBKD+feeL7DXguIwUgTk03/i96QiyTuRTpk3hYU3sh4P0D+cNud7XNyw5
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(921020)(10067099003)(11063799006)(56012099006)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uRXSDLMkcuOYvbvspog/qErLEqSi1ruhHJ83hBfoSZc2K/Ev5pUSpBLI566ETm/TUCnT3YlmKY9jDPk2FnuGpzktCaylQQdh+BgSSNkU+2/hYyFB8fQv+BRvYALUbbICzLKFs41kS4LNOmkL/KwUpnHrX8hUYY8rq/WqfjzvvT5Ns7nrBEWbFetwHkNyu2NeEgtNBEzhVDAciIIJ+EAz71ClLGN/EHjW6bVVCttROEzaPhn0Eh84WGwihtN1tQMOtIbWMUUSrB9spZoXMZV21/+0vTVtYWgsFrebx+Q+fZg/jymKahM7xipKIkjQXO33eZyTT8CJyhPNlJwND9b1Gf8+ijllNLwh5t94Jl7YneQej3hwdwygPCu6q8rneuPU8Y8+GdESyxOWHSrJhihbSxg2K6qHu2yEYd2B1FP6v4TTzZHgBFS5AkxBxt6xrr3Z
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:46:18.7462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbedc5e6-8467-4be7-0209-08df366aa5f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6603

Hello Qing,

On 10/30/2026 2:49 PM, Qing Wang wrote:
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 919d0fb00bd9..79c477b47510 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -2002,6 +2002,7 @@ sd_init(struct sched_domain_topology_level *tl,
>  		.newidle_call		= 512,
>  		.newidle_success	= 256,
>  		.newidle_ratio		= 512,
> +		.newidle_window_pos	= 0,

nit.

I think this value should start in a way that allows newidle balance to run at
first attempt and then stabilize. Maybe '512; is a good number if not higher?

>  		.newidle_stamp		= now,
>  
>  		.max_newidle_lb_cost	= 0,

-- 
Thanks and Regards,
Prateek

