Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011016.outbound.protection.outlook.com [52.101.52.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C119149BD8A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791302228; cv=fail; b=NsVlE6m0Sf1rZkn5yd3GKttV3q8u+oMHcyH4DK7ywstxm9JV3SIfwhzVQHld8q6zP6sx3UJeJhrC5MD6aDBh5n7V76EaxsEAEiT8W9rsdP+0hFwUYaU5OgYtW0UHemN0cEN0pSIXGYaFClHF/awat7DuSpgmWraz2DFchc2ADBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791302228; c=relaxed/simple;
	bh=iV3O1SOug3ihUtZHTKqT7+H8JEkOqlwrMXTJruvr8a8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JsNUuYZwHl5nxBbUDVLLRNMKfH32bbrRvIfTIzL0LOia3ZCLofypnQzTjznlhZAp+57qGOEhHYnPcJYtp9IWcsttEnooOKv8O0QwmZCAlyQAYMB3l80eBY8d27C9mHmN//wRYha9NStpjTgP1ZsEVukg5wtaE2oQ40xdZFxpG1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AkNYrV1k; arc=fail smtp.client-ip=52.101.52.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AkNYrV1k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTyBBdAYJKUoYSYNWs3nCEijA/M4RVgRp4n+29P3e4UtLumrUapL78SfurLtQnq6hGjExjLh74XETXbMw1iMvHL8fY/siRb9vhUXzr3ab8rmNDperhKSHzG45WoIO83655rIb1+qi6p9/glwJaqZqoGRi/+9eFnkZmnYWl8srkNOfYqKAp/rH/S/Ys/VQtoFzRFJF4+Z/HmN03Ny3H00sRgOvkInnVRQNJNiHvpNESax3CBvrydzbot2XgSOCmELiQXjxp05uqMQJPsm+DHTK8+rcunu40d8JJ8tAsJh/juHtHpkpX1Qgg+tlO+KPiBRDbBbNmhLLGmNz/7cZTE+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3x6QsDtfBgT/syfzVKOUmxNRmpoweoGRLK3eWbW1cU=;
 b=ijphS/vj8+4gdq/Tg6khuzMHQOW7DKOoeOfExDYlAzjXst3vylCTsDDK5NT9XDanM/k41ggpLG50yGhEqKuLO9vCUa3s+8FjKUpK0UCP3DtQMdAy2lumuSwUt3g7VFvHs8V4cPymcRS9vngEFhJ3PJvUmb0ePv0PXK++FkogbmEGhkr78CffHQ4Vrjo8hjDfgEUzb20TdA08vW7CTMFQtqBiRrlpEPdAsKhT2LOBG05symlhW9+pb8ANGgE+EZF4FTHO+ZjZBHr5/bYLW5Ft+IVzKZdZvBGXWzIWvW3uFhMUiWLFXOWCnciRnRdaLi6BPrZXiXrugwqBmsUvrZ2gJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3x6QsDtfBgT/syfzVKOUmxNRmpoweoGRLK3eWbW1cU=;
 b=AkNYrV1kIIvo8ScbVYtgE8Cr2fDGkEVSRiKujGcbrCwiF8qBc+u0O1iA0lr1Gl6Cpg8XoYUw1KBLsO/F04w5FFCj5TqaW4mPDpsEEoKSj3ehZmHtBVHSKuXL69xuc2BSt10gmdZpaSGN1gYvAS1ajIn3WsYpWJbpJLrIZnBTJxk=
Received: from SJ0PR05CA0094.namprd05.prod.outlook.com (2603:10b6:a03:334::9)
 by MW4PR12MB5666.namprd12.prod.outlook.com (2603:10b6:303:188::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 15:57:00 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:334:cafe::94) by SJ0PR05CA0094.outlook.office365.com
 (2603:10b6:a03:334::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 6
 Oct 2026 15:57:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 15:56:59 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 6 Oct
 2026 10:56:58 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 6 Oct 2026 10:56:57 -0500
Message-ID: <7caf722d-79d4-8cef-bbf2-4aedfbb1e1c4@amd.com>
Date: Tue, 6 Oct 2026 08:56:58 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: document trusted mailbox ring geometry and
 drop the power-of-two check
Content-Language: en-US
To: Eva Crystal <0xiviel@gmail.com>, Min Ma <mamin506@gmail.com>, Oded Gabbay
	<ogabbay@kernel.org>
CC: Max Zhen <max.zhen@amd.com>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <sashiko-reviews@lists.linux.dev>,
	<sashiko-bot@kernel.org>
References: <67698952-6394-44a8-01fe-3e3558b7cb4c@amd.com>
 <20261002205814.178031-1-0xiviel@gmail.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20261002205814.178031-1-0xiviel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|MW4PR12MB5666:EE_
X-MS-Office365-Filtering-Correlation-Id: 75e6cf85-8e6d-40f3-8051-08df23c274d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|22082099003|18002099003|10067099003|13003099007|4143699003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	PMcQ6Zbuo27zM3okRSOHwtmMzHD9w8agUZloh2IDxQOfyGCZ2ny+A4Hqiejh7bJJOvhv0ZdZo9CEe+o0Ul2VeItLqTU4mkjyvpZW8wr9nyJH2CUtBUhOLhq3YCM2Ywwwy4c5KBmZQWvmYI16d79RjTr5yj4kSOduN6WE+YmBIn0zRBuqCg9U/wMi9zV6oEQYa1FZiFIpprYmNVkPcm1NV5iPnC7Mz/QKXsAH65rdERbv29WpTMGJ63eb5pJ+gyT8WUP8HRcPaaRmZ5+Ld22X5CXl4pdJi/Xum9dYSGR7Ggwq/XKDpDXLDYswEY1GbvlpDncqHWTKaMbSM98bonNVC8eFnr6ZJZ9Xtf+ilLYreajlA5ldj+foJ1gzV5/AsqfSpid1cRxJ3N/3laXkBOKEXNfFYkOjOgfmDHhJkjSKtZkZQxcZ3lVchQYYAAsbd7J2bC/pzhm5y38c9yeBPHE/d8tJQCFzQ4LoH69LBCZpFiu9Smt/LBtYME8Oo3BYpEKrgT6cZYVqxEjIMA60P/pOnZ+uwmM2m5Vd8N9ioaMViqjFrwk23VbFkInfzXPQFuAeBCkpN0dse+bfIdKW5fSSdoo1P9OoZIKJtPxTyJ4aZT7owjzIX3EfPq/bFlLG085TAP8sXdKZ6CccPZqavqlIna6212H4i9K3/+s4rANyLsE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(13003099007)(4143699003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	48CElgeCcNkyLfdWDY5A7b+Ywl/mxZc6Es5GDf9ZCV864tLqmzODc3WhRHSCsMAsFztQTishyDT8bytRtKrPWQeuM8t5Y2qar7TisPxOQldg36BNsYADoFIEYrSYmqicZJHuYRNu4Zpg7AuTdcd65j7d80YdvZGH2rXHv5Ie6whBnOBfx5VAHvELOuvk54YwgpjXcFnz9r8pF1QW9t6syOCHMI0NTbnopsCWiM6bTpSmHp67KjrtD2wqGXinGfVIELdmtpbjmBprVT+9j6XB1HAH/pWeFLVjhMrwmIrFxTeZMcmtILTIBPluBr3h+mXTqsM/N1jk5swPboiZwBvmfGcM0b9p+exa+bSYVBvdNNg+fyavszzV1sE9QBx3xuIXi6pjmqIRUXaZnWZM9RmH6HXgihelIDmsrQgwSUEV8c1ZzABXNxiWo0Cog3cox2qg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 15:56:59.9142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e6cf85-8e6d-40f3-8051-08df23c274d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5666


On 10/2/26 13:58, Eva Crystal wrote:
> The mailbox ring buffer geometry comes from AMD signed firmware, through
> the management or mailbox information block, or through the CREATE_CONTEXT
> response, and the driver trusts it by design.
>
> The power-of-two test on rb_size was a firmware debugging aid. Nothing in
> the driver derives a mask, a shift or a modulo from rb_size, so no code
> depends on the property it tested. The ring index wrap is handled by the
> explicit comparisons in mailbox_send_msg() and mailbox_get_msg().
>
> Replace the test with a comment that records the design, so that
> automated review does not flag the absence of a bound here again.
>
> Suggested-by: Lizhi Hou <lizhi.hou@amd.com>
> Link: https://lore.kernel.org/all/67698952-6394-44a8-01fe-3e3558b7cb4c@amd.com/
> Signed-off-by: Eva Crystal <0xiviel@gmail.com>
> ---
> The pkg_size check in xdna_mailbox_send_msg() is left in place on
> purpose: it bounds a driver-supplied size, and with Max Zhen's pool
> patch (20261002161122.1350075-1-max.zhen@amd.com) it is the only bound
> on the write into a pre-allocated message slot.
>
>   drivers/accel/amdxdna/amdxdna_mailbox.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
> index 05c3786de135..c4a36858668f 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> @@ -513,11 +513,13 @@ xdna_mailbox_start_channel(struct mailbox_channel *mb_chann,
>   {
>   	int ret;
>   
> -	if (!is_power_of_2(x2i->rb_size) || !is_power_of_2(i2x->rb_size)) {
> -		pr_err("Ring buf size must be power of 2\n");
> -		return -EINVAL;
> -	}
> -
> +	/*
> +	 * The ring buffer geometry, rb_start_addr and rb_size for both the
> +	 * x2i and the i2x channel, comes from AMD signed firmware, through
> +	 * the management or mailbox information block, or through the
> +	 * CREATE_CONTEXT response. The driver trusts those values by design
> +	 * and does not bound them against the mapped region.
> +	 */
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>   	mb_chann->msix_irq = mb_irq;
>   	mb_chann->iohub_int_addr = iohub_int_addr;
>   	memcpy(&mb_chann->res[CHAN_RES_X2I], x2i, sizeof(*x2i));
