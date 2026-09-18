Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012014.outbound.protection.outlook.com [40.107.209.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5307F346A0C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715137; cv=fail; b=rJpghv4gvwLBJsYpZZChruqwk/3+yFpDGJkOu1uS/xkLOh1Nx8ZZOSZ4oePBtv6an+ndJvbWH8AXBAsiBiGrprSP03YAX6qiMgHMPkI8rDED1Y6FP42F0izdlhE8oILqoYQJbPONj10SISgARBb+P7YxcakCI825MnrbjbyE2i4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715137; c=relaxed/simple;
	bh=1qElVmVKPur5sSONkmkJRoJnjJeenv1FZgy3oeJCJ1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XTWuab3mMYsihUqiHs0BGW6L7PBYkz57lKfJCJb24Gir8nIfOnypIMGGXrnDbEYyugkSUF5Z120V9z0wCw0YA0xWBBZfOHFww7zCb/Xqu2yWo/hfVFSYGr0+7lSy3/PWhsJsDFFTNhMs0MVi7zccShkxGM8q16xwb2KVmgIx0oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LTndxetp; arc=fail smtp.client-ip=40.107.209.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LTndxetp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTfEhJCFgMYw5doezl4mni5+8FyOH5fRDzvOGxIo0SlJ5SbU1Hv2eUkFkhBYAjEOg86hXBJWCbDhwl3LyjKsh/8wiwMWPK95JK5u8aT1hnQ0tS+IhIidhFGXMKXMpJWC1HmNTEKTIt9xWQA8vGHY0e1t0B8o5esMTsQetYjlgn0KAv2gdK9EGt4ki2xx05hQF2+4U37it94O/l6Zg5IEAPl7eyjtOW9UC4ZQKGexbUI3vdsiu0Sreyva76SAfbOu4qc4YDnDiDTfaOHe0u2tqdpCoZ6HFFX+WnKf+eligGL3fG0F/lZwSFEb8IpvGJufSWJH9votJGgf4MJogXE9Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGwChgckseB1Z5IF54G12+7MVMtJfezVmJ7YPnKw2LA=;
 b=IeVHW8VcOW9F1EeeRH3CdEPEZFAVO+CkTxWqm0cLTmXdW6dwtvdK91Z391C3yvae37amBN8RUv45NR1QwenbD3mUqcKby2t3hUtqQ/W0CaTfof+d7K2cJ3/OWFF6XIGlJdvAMc/nxrFhZcv3FZM1ktQX20nB5vFGvp19FPwElfjMvf8Dk61mH1GUobbi3viNvvSuTMVp8YNIU5vLV1dA0KRAWZS7wmbACmvKQO8UzpZB2XemPwIe2aC78F4giMIBdR0vFuYp47/oMnV5tLwS7Sn7p9Uh2GAyMze0njo+9dVEn9cout8yotJIdIR3JtiQbQ6tT8Xo6mwN2r2aWJtEdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGwChgckseB1Z5IF54G12+7MVMtJfezVmJ7YPnKw2LA=;
 b=LTndxetpYNSnxIDChLz3HKXEHBcHZRKznxiE/7gVCcLWhfVRnmCciGGWNXgKXZygn0AVLbKXLyHfMAT4EANcUekqcW4+8pFzWXijiTO7Kn6WqM5+JzyQYwqSgzYPYH9IinkHhpPGpvQZYDuaSqzsjUv2zGiXLnTQSMnoa5wKz9w=
Received: from BN9PR03CA0683.namprd03.prod.outlook.com (2603:10b6:408:10e::28)
 by SA1PR12MB999228.namprd12.prod.outlook.com (2603:10b6:806:4db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 07:03:26 +0000
Received: from BN5PEPF00046988.namprd02.prod.outlook.com
 (2603:10b6:408:10e:cafe::ab) by BN9PR03CA0683.outlook.office365.com
 (2603:10b6:408:10e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 07:03:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN5PEPF00046988.mail.protection.outlook.com (10.167.245.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 07:03:26 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 18 Sep
 2026 02:03:11 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 18 Sep
 2026 02:03:10 -0500
Received: from [10.85.43.235] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 18 Sep 2026 02:03:07 -0500
Message-ID: <a064f4fc-51bb-4802-966b-2f09d3009bb2@amd.com>
Date: Fri, 18 Sep 2026 12:33:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4 0/3] x86/apic: Add support for additional AMD
 EILVT registers
To: Borislav Petkov <bp@alien8.de>, "Naveen N Rao (AMD)" <naveen@kernel.org>
CC: Dave Hansen <dave.hansen@linux.intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, Bharata B Rao <bharata@amd.com>, Manali Shukla
	<manali.shukla@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, "H. Peter Anvin"
	<hpa@zytor.com>, Ravi Bangoria <ravi.bangoria@amd.com>
References: <cover.1788425679.git.naveen@kernel.org>
 <20260915002940.GDaqiRdNKYpyKgL2_B@fat_crate.local>
Content-Language: en-US
From: Ravi Bangoria <ravi.bangoria@amd.com>
In-Reply-To: <20260915002940.GDaqiRdNKYpyKgL2_B@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF00046988:EE_|SA1PR12MB999228:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b55415-fd0a-4d76-ba1c-08df1552eff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	a/EsdnxVa68gbbaRXMJQVwZ4QlE4rlp810J7Iw1NmjsA4f4egmXo/Ck3msvDIByAFlkUwGlaACe8+XAsAgWooY4ncvpSpABrvUpq0bz3W9Fcs73EsppLCDNkinKs8cky+iehkNC8o7T3alCWT59ws8ZsqOpxy8e5d6cHUmfm5S6RuLRG2fxJrJpAXttVqqbbHzPToeQT/NJYmOHWOjOfv2SSs6MNRcr7VnqhUW4xgDaJqAf8mfY2UyzUU9eFT8o+WoZbgVN9LB4wInw0J+rNWs7tMHz/igoVvXy/XKMnlSdS46XMk0BLf08z/5XwVxjEVbROpd7CCL/FV5vDuBfx2YWSZCuR1BHqRlCXuSR8JCdDvKf9L/i2ULi2B5Xuwkk7fapcDO0Ezk5kRGixbxYtgMl/5YAKhdUFwRUpU+X6hcrdzLV/QCCeNvG1kOz50Fh+zeBKgWAUmNwjaU+IHOVHMeR9fbDtwkOdKRYZ4oBMLU1Y+Z/rbuJywfNKhKLf53zwqQbax6dZVQ6Zon51YFtP+5LkEr0RXz5CRWBjm9hpv18Lk4zFFZYL+4ZkkPqfoghQ1PiI1xN2i0VVu4Yl4fo9qET4LI2/xSUJJSFcgSwDo0H10QfVmQd2YNY8s10CRFoh+AdeleNvLMS2/g6SoMA4mQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+P0PVJWelGii36lKsQJZumV77aWh7MXpnveaoZghjNpQOAVZ3zy4Qc2pnUAk/WtPcuKwOXEdmTZRJZHAi81K+UAAY/SxBxJ1tCoI1O7C906QgGS6xUsbMUnyT2uucX29lP1RUapRLPdygbM1nPu/dfcGbLYwANXGJNI/F4QEXeMMs5MICN6CWKpD0e97j9XK+bW8dmGuB/wE7XdzjYgpBTqkbNZy9xJmYis1swBXKG8uYTC0i4C1C5TKheC+WlmxxO2md/QsQATKOZD/uBahzzGNmx2WsmWpIy/Lp5iwA97rRd66KOko2SJ76HGjCijdvMy+EJ67hNzUH2cn+OMajifTDEJOsxwD0GRS0rmyt8M9YFicdJ5++nfUEOYMncP9OTKwUw1NjAWrIvy8bx8A9kke5d+dP6Rby7TNBpWfKzFu8Csw+bS9/wxIaNMTVAIQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 07:03:26.6747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b55415-fd0a-4d76-ba1c-08df1552eff3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF00046988.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999228

Hi Boris,

On 15-Sep-26 5:59 AM, Borislav Petkov wrote:
> On Thu, Sep 03, 2026 at 02:58:38PM +0530, Naveen N Rao (AMD) wrote:
>> Add support for additional APIC EILVT registers being introduced in 
>> future AMD processors:
>> https://docs.amd.com/v/u/en-US/69205_1.00_AMD64_IBS_PUB)
>>
>> This is a resend of v4, rebased on tip/master. Previous posting:
>> http://lore.kernel.org/r/cover.1784785046.git.naveen@kernel.org
>>
>> Since then:
>> - I have retained the macro name 'APIC_EILVT_NR_AMD_10H' since I felt it 
>>   is accurate, and didn't hear a preference for anything else. Happy to 
>>   change if needed (Ingo)
>> - I have gone through Sashiko's findings on the previous versions, and 
>>   none of those justified a change. Other than the pre-existing issues
>>   reported by Sashiko, there have been 3 findings:
> 
> Except that someone should address the preexisting issues before we pile more
> ontop:
> 
> https://sashiko.dev/#/patchset/cover.1788425679.git.naveen%40kernel.org

All the preexisting IBS issues reported by Sashiko there are applicable only
for the very old family 0x10 AMD processors. Given that, it may not be worth
addressing them unless someone is actually running into the issue in practice.

Thanks,
Ravi
