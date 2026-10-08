Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010052.outbound.protection.outlook.com [52.101.85.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ADE38D402
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791476602; cv=fail; b=ub0lDiGUW++r4WUuBtLD9KYF/HNO+Zu8PyvGi+8ermhQLi1yORm+ANRQdqvqZIs2h/KzbmkSXJAjmjGsdU1rz1cD2UcqVelRuwcRJrLRg/JqNWQzwGPqmrQL/If9UIC18o+iNexLiuDlfuQ+3PPDnz1UNgT25lZXIMhSP15LBOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791476602; c=relaxed/simple;
	bh=Eli59aGIR1Eis9GHrKYExW7bGhlxScUncEZvD6RwfJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sqswGGfW3fB/01gCcSscR/ACRkRDV3xt0vqIWyXo2CosZgydAp8pKvsAkoIgtCvTp2sdEvYUmS326+2o05OF4p01pi7xZNYD5eevV1xNHnIHuefHE4m9/qsMEyHwNZ2/epwsPs6+PFa/GaCJPJs4QtEUECFtST03t9212RBfMzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uuB3GeMG; arc=fail smtp.client-ip=52.101.85.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uuB3GeMG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FM+ftG5cj0NbRFv2YODLQoWIK69w7nPUH9Svn6O4e8GXLqKOMPIRMDGhxdx/5/2PXgBQe3LoQTc7m53He0rT96CW0f8UTUol/rQUb3eloYdvi9exQTGquZfV4fHveXPSc/EyAJrXoIIDUDmN/s1VVVUTmDCF9LPRUVfgOqLca7HB65iVsTZtJuUeQ2M+ytaL8wYELghb3rNOJp3aVZdh2lIiAQ0jLuHhuG1LtkQkeCoVMXAYsLzdOTxmQpmW1u8131yKJFDQ5f3J13qvRw7GmZmrkIwWnk5hwgJHePKI+mtGl455mbcvGq8zvk1NL+zqZImqNsW0zODvjPL0sRW0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EP9DGHRJr5DNgI/LD50lufqcCHdAChY7WUOip4F5GWQ=;
 b=dkpBm/HWJdgBvd3zFOFpbAxTE/M5nMCbl1UPI4G+91xyS0ogcxfGI9c7Zxb6t5dCCeljGQhBNqEg9lf2sLdYIYMLpp1cVgxBNXUmIJZzUeN177vIb/OBDO4hfoYzQ+5/zCPC3RQCZGZQNq28ARBArqr8wCxop0C/Ee1ETGOo3KrAjM5DzS5e9zGJ03JWo9eI5/eZqjuyQbv1+/hpxEhqcrjFKC181BEJMrjBy//65/hoqy6+4fsl4S4momx+nOiqKwISkuAeiQoDhdlHXxkQDaB7n6WZsxzmqvMH43nSkAHSWSHntDm4qg251kg8hNWXoRmxAWvR9xoKI27Ut9F2wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EP9DGHRJr5DNgI/LD50lufqcCHdAChY7WUOip4F5GWQ=;
 b=uuB3GeMGK35TSp+eMB2hduxZSWDWit2BQGY27plkdj72eqVDJThfX2iM3BsA//kL0qBBkvHWjGw3OcECc4O/LyLuZ9444Yuax0wTlTA+NmL0isP5aEOOiqO7t52U4t68//9Ll0RAVQMyewx8RCKCQ4UdqIlNE/tY7bGZ50RMA2s=
Received: from DS7PR03CA0251.namprd03.prod.outlook.com (2603:10b6:5:3b3::16)
 by SJ5PPF3487F9737.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::990) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 16:23:06 +0000
Received: from DM3PEPF000265BE.namprd04.prod.outlook.com
 (2603:10b6:5:3b3:cafe::56) by DS7PR03CA0251.outlook.office365.com
 (2603:10b6:5:3b3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Thu, 8
 Oct 2026 16:23:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM3PEPF000265BE.mail.protection.outlook.com (10.167.23.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 8 Oct 2026 16:23:05 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 11:23:00 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 11:23:00 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 8 Oct 2026 11:22:59 -0500
Message-ID: <74b4f7ac-ea02-ecd8-f943-1c5abb5a030f@amd.com>
Date: Thu, 8 Oct 2026 09:23:03 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 01/19] accel/amdxdna: Rename NPU3 firmware files
Content-Language: en-US
To: David Zhang <yidong.zhang@amd.com>, <quic_jhugo@quicinc.com>,
	<karol.wachowski@linux.intel.com>, <max.zhen@amd.com>, <ogabbay@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <sonal.santan@amd.com>, <mario.limonciello@amd.com>
References: <yidong.zhang@amd.com>
 <20261008032348.2044667-1-yidong.zhang@amd.com>
 <20261008032348.2044667-2-yidong.zhang@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20261008032348.2044667-2-yidong.zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265BE:EE_|SJ5PPF3487F9737:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a638a2-549d-4f0c-e9fd-08df25586ec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|18002099003|22082099003|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	/TDhB3IDfj6pA4vYMMQ7Qqc3n/0xUI3KPOa/Y1K6uTJJn5OGg5kd6kP9f6+1Q8CoCKRiEOOOyhIgxMHVgZsnpHrzQYnKZqu1KSpAA1TVFypx/d8L9xczY3Hx1lPpyfXiXU0Hs4GGyy36JcrLt/BDvOxmzVQoh7u2GGT5anvRaFbiCW9hgwn1fU8wYyrXK+B/CROdTMXsWhcYrIDSJAA7S07wU9Ya0xa/4Dn5KWddwsXhrOsdvwsaGdIiK9IB+/qxoktd0EcBmwpGoqBwUvhemazrzbziiApw5oKSlS1KGqarT3/VNqofa2zm4Iyd5rQE7r5jEG4CzmXWBn7n5fZdJqHac0vO1cAYUW40d0Gh1siEAs4tMgwYg/ot2DU+f1j0hnPSMJh/tTQU5GhmKeYUYFazNtuCBxIv6KKan22umK8z48Sgdb32q/JUmPGh7vswjl3ELlfS/P+rQp1fFns7xxVHmad0tH+p4WdxSPVja1z1FoNFkXjbCpLgjUHUcuU+4J+QBCvgPNO9fOhs3eYuIvUhPqB8CQjgAAOl3KEDTGDxBkgVpD0XIcO9bCD/I/MJe8zqET5A+n3qiCm6Z9Oy2HuM1HFlJnadxYZyi6lIjgPv/iAA5gupt2VbK3d8xRf9udA72iDk7pmOLRZEs23VVyaD28PnC0k+p2QpQHW5f2+XUcltHMaBFpTon7wumgGDp5yLp63U25GQtM1b4wluzg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kFCnFdy/Bmj3ZqVq2MDzvwv9MNA2RFDZgBSKJRJvpjBnFyP2zchRBnX32fcgXPyUFL1lwx5PbbBwhuItrqrHTkRuKqUHDgnyk4XML2C3QnxlbPzVEIv3qt/Au96/6XonhLVd3PM5mhYePLI/1wjbLVWSv/CC+MTe8GkTQAUCpn6S43FO+aVsE6o8U9A3Dd/oKeriTIOCYebBiekSuZqwaqzlFkGH6oQ5HP6y9w1zea7KQ0DJc92KU1pLYzDLp853xBE2/o6IuFrAxPIMCvWnJB3uK9VyqI6fwaTRy9zkhpkrSg4cHtngDrzPOObYzL91Gz0fActknH7j6SSgEPXumGTzCy74BjzjrfefcVb6VovSA4VtRfJS+ZjNFS4AR4Ds/ggx0hjR4Iii0U6MXVfjsOpsXGzi9hY8+50BsmfsI6WS9Q9uK/JDOcJnC8mNHS0P
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 16:23:05.5505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a638a2-549d-4f0c-e9fd-08df25586ec8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265BE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF3487F9737


On 10/7/26 20:23, David Zhang wrote:
> The NPU3 firmware files will be released as npu.sbin and cert.sbin.
> Rename the current firmware names to match the firmware release names,
> and add MODULE_FIRMWARE() declarations for the new 17f2_10 npu.sbin and
> cert.sbin names.
>
> Signed-off-by: David Zhang <yidong.zhang@amd.com>
> ---
>   drivers/accel/amdxdna/amdxdna_pci_drv.c | 2 ++
>   drivers/accel/amdxdna/npu3_regs.c       | 4 ++--
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index bb339e641416..d9e2e71d3e05 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -28,6 +28,8 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>   MODULE_FIRMWARE("amdnpu/1502_00/npu_7.sbin");
>   MODULE_FIRMWARE("amdnpu/17f0_10/npu_7.sbin");
>   MODULE_FIRMWARE("amdnpu/17f0_11/npu_7.sbin");
> +MODULE_FIRMWARE("amdnpu/17f2_10/npu.sbin");
> +MODULE_FIRMWARE("amdnpu/17f2_10/cert.sbin");
>   
>   /*
>    * 0.0: Initial version
> diff --git a/drivers/accel/amdxdna/npu3_regs.c b/drivers/accel/amdxdna/npu3_regs.c
> index d76b2e99c308..8d287ef32fff 100644
> --- a/drivers/accel/amdxdna/npu3_regs.c
> +++ b/drivers/accel/amdxdna/npu3_regs.c
> @@ -43,8 +43,8 @@ static const struct amdxdna_fw_feature_tbl npu3_fw_feature_table[] = {
>   };
>   
>   static const struct amdxdna_dev_priv npu3_dev_priv = {
> -	.npufw_path             = "npu.dev.sbin",
> -	.certfw_path            = "cert.dev.sbin",
> +	.npufw_path             = "npu.sbin",
> +	.certfw_path            = "cert.sbin",
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>   	.mbox_bar		= NPU3_MBOX_BAR,
>   	.mbox_rbuf_bar		= NPU3_MBOX_BUFFER_BAR,
>   	.mbox_info_off		= NPU3_MBOX_INFO_OFF,
