Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011047.outbound.protection.outlook.com [40.93.194.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E4337106E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 05:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788758202; cv=fail; b=R6sAYP0/0N8enisoqaxDBQ514OA/bWENQ2xV45OTpz7KpPE3gqAVxYSnz3zYrfg3gd6Hv+btuo3YTl09ZGxaHXZBlxoriAyA5Lfzq88yIcn37d+ZizdP5vA+MVo/nRrMTl5j+Z6n9MnrJCkZuAqbg6d4zJI3fDzdGEUDEMJtlZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788758202; c=relaxed/simple;
	bh=T3j80cFIo94f6isnw2dwYUBgShKP52ZWl2+5CuOeStI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=du03F80vAwRhCScfLNdtVg6HlPUtTcejuMgZCMc6QUGtLnmJnxbkqJN4UJcP6W+gYezAkjBDxgQr0qH58G3Ji0skoEkP27HV382XYsx9yZFozSXo+Q3LxenOvdTSIrpLu6VmMrnmg0gw2cwkbwMXUyLAsSpS6WtR4GxzJUH+ZVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cslZ8/Ky; arc=fail smtp.client-ip=40.93.194.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cslZ8/Ky"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1ge5A0ZFoQg+LrwgGOas6I11IKyRAJDcNYuii562hGON9bOA7fNaFwnSFpLbnv/rbdv9lb80h035FphtkdU2BOHR9LSSJss4BIffP+VM2kO1cnoLCnQIEDtSFaSInzy92Vl+qg7VHXMYkoWyFhLECmIkAuNzzy6tfv2Ia/wKI0VXhXc1DSwA8hEiXvp3YbZQvR1EEm/f8GoxVssTylX7h/JhEJJZLfR3/J9PT7r9r8g8WGRGuwBNMeL9jEy0o9/A/NI/EULALsud5uExWup4dqwxiqRp9bWOvZi4iyNlAc/kllZXlB72ba0Rd2iJwKw73Pv8aWHUp0dyRpg0ah9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJ7m4P1cB4/Z9XHqOkS/SvuMelPSWFeXATTX6n79OLw=;
 b=UhnQkB6Rnj9fm1RXBQ656iKr2DjB3YVGe9R+r5Kk+u66qaX3f1bskYCoXZOInMwt0p+gz1RMllkoGjE0VytCjHj7cfGxs7KPQl4vzntDA8EGRXIRqq9Guy5IhpuH55HghGaZW2bq5Q6MFSVIlU+dT8xNQHSX/z/2ETxnu+aFn7rWHd8QlyGfq+6nAUmHEGFt86sF4l0BSuh4V2CquSl2M6iTrJ2fhUseyxFc3piOIIQ0lAhzVousRAI2AmrDsnE2H1w27lIrmxs61dR8by+tIu6BD42qzx2JCNIg5mDruixLU+y7Z9JuhSCpw0zpUAFdG3khnjQmUX2D+pvukPLs3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJ7m4P1cB4/Z9XHqOkS/SvuMelPSWFeXATTX6n79OLw=;
 b=cslZ8/Ky7aEVSjGjOM7U5TAvjlUAGgpP+yPuI3nbVMFyWrcfskZ+BwohZqKFkZAk+WWxFQwiEFQg2A655u5I5nRfziAyrH4tqpejiVS5Njc+QbgzkbqUFN9MI3fdWy1aHJuuiFeuTlHMU/du2ugIZomrRxak8di62OMU213PrxE=
Received: from SJ0PR03CA0353.namprd03.prod.outlook.com (2603:10b6:a03:39c::28)
 by SA1PR12MB8641.namprd12.prod.outlook.com (2603:10b6:806:388::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 05:16:37 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::ac) by SJ0PR03CA0353.outlook.office365.com
 (2603:10b6:a03:39c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 05:16:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 05:16:36 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 00:16:36 -0500
Received: from [10.136.47.225] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Mon, 7 Sep 2026 00:16:33 -0500
Message-ID: <765afc29-db88-4f70-9189-ab2532ad6439@amd.com>
Date: Mon, 7 Sep 2026 10:46:27 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4 0/3] x86/apic: Add support for additional AMD
 EILVT registers
To: "Naveen N Rao (AMD)" <naveen@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Manali Shukla
	<manali.shukla@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, "H. Peter Anvin"
	<hpa@zytor.com>
References: <cover.1788425679.git.naveen@kernel.org>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <cover.1788425679.git.naveen@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|SA1PR12MB8641:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d19e9f7-c19b-4c10-51a2-08df0c9f30e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|13003099007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Dr+O/UpV+1aHgIc5Z6GPzWXgbd6+/8sogdx/i44RE4Znac/CvhHOXZ4KmOdcdIaqCzqiVWo5kgpJIHp1DNtgfyQIvkvRZMx0YP5rV8NYi0KC2RVxtKe7l3A/Zo553SCppAL3HrOipT/t1q5B4ay8UIqYfEbKaMyjRSigKRT0WHxBay+9o4xXOHCMtRRqpvO0wQFCjIZhMNHv7I9GVz+dTLRip5mhCWMOWGuQ0FFGu4et/KBg+Yk3YbdlRwWOlG/fuH9G929i3Z84UpSfNTEpBpQGINEi5CNye/bd7jgkMrr79F9lL9b83jqX8drqWcM86wSEaTTuqn9GnWZOcJw608xUXIjMFEjA/d5soDapBkvHm0zjZt9c6qH1fQDX44NduFHvAd4sDVqtKzXBf2xqXlJ6R/I5Xiu0mqApLpbQLha/nfYaGNnWHkt0KHRSbvIOS1uSpf579PF6gG9nG4Z5rElYwh4BTPC47AXt4NArjbFBqhGF/cjuHQHUsCfHsgXDypiQFALW+WmJR4l5utRu+JvQercymFKY6MMC6T86TvwVfJXvUCdnjkk8KltqxyNH2sl94hdcqOI8Suq4ZyZTF9lpLDzWPRC+E7cOeQJJkiKXaUfcMyxpEGDrak4cxdBTaffEkrA2uSg4SQCwLUsmqEqkGGGT3zsvkcSyh/gUzTCQFveJRJvxgYjzwxdBbQ65iQOFwL1liIRUEZRzLSDqKg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(13003099007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gNegXzjLcZ87VdmX3i3YmECdiiphj2xYqbDvrDhrsnPUlou5VoZqxCHNCneGc3vaixvIBU95HWyKpy3/286n4E53vEzoF20LoMzpXHViSVefBzivPlqM0xtFg8Y5AAAUOokN3oWLe78E36TbWL5SJC13LfpNKUNB5nF2XhPqIGGiZ2tvqeveOZfaAOG1U9fnDmXddH0g/fN0UXYARKSSqlFvO1bmjheT91hdmmLj3Y/udlE/fsZmb/2q1TgpFxCaaWiAwdYkxPj/uJ/9x2uHTrnjbH6pjTEh+ReNV5e2mEb2okEbGGotJDMi7ELbfGlfC7J0UYaFQFdroT7bfki8ZYNFgNOa/tt7lrHAioYNReJdl2ifh/qv0HZMM8Yc6GUO/LoRF179p+wuDyxT7OKlmOGz9f1OEb8kS13w146n3+g5bkr/UFpZBfdRvyHaepU1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 05:16:36.8207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d19e9f7-c19b-4c10-51a2-08df0c9f30e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8641

On 03-Sep-26 2:58 PM, Naveen N Rao (AMD) wrote:
> Add support for additional APIC EILVT registers being introduced in 
> future AMD processors:
> https://docs.amd.com/v/u/en-US/69205_1.00_AMD64_IBS_PUB)
> 
> This is a resend of v4, rebased on tip/master. Previous posting:
> http://lore.kernel.org/r/cover.1784785046.git.naveen@kernel.org

This change is required by IBS memory profiler as well which is being posted as
one of the hotness sources in pghot patchset
(https://lore.kernel.org/linux-mm/20260728054356.291998-1-bharata@amd.com/)

Tested this series with pghot+ibs memory profiler.

For the series, Tested-by: Bharata B Rao <bharata@amd.com>

Regards,
Bharata.
