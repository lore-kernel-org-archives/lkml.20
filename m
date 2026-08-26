Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012013.outbound.protection.outlook.com [40.93.195.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EE9394793
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787779275; cv=fail; b=QbuFaoiD4eaxxWeRsAL6qMVWtKkhhlU7fXcLlYytNvJvYMJGtnHWvicvSyxo6CH94YRCN2R5mZk2JuW0c56TenBPV3ZO0XLub274kRYDIP2VWsRFPttggbjmfcS0zDJJ0EpQdo3wOyHLcWa3cVtOluWEslbFIsqdf2B01q3jz38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787779275; c=relaxed/simple;
	bh=Kql//vCq69EjMJLoxv0IhtN6JymoWcBizamteq+i6P8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UdsWVJGjx2swOBLnVF3MQjxG/isKyPX9OdK6QaQbWEsNq7aCS+guNQtCeTy/elVblAc67ZJvT5qFI7d6YQLh7rz8twQ0OKE2m9enk4yJhXUDnoc3TZZf+zEdc56VDPKYyGCiUQpWwScD/qvTODk4fQQiI+eKJTgrnspSuGsT6FI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MIFShBRN; arc=fail smtp.client-ip=40.93.195.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MIFShBRN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjW1GBG2pQmAFX9UhjAREwF4FqSkKzC1eVnzST8BDazJA+P5+/8MCEAegvDFeK2MDAXsYbR3v13cIe2qCIXoLzQFc9T+KRHctXoGHb9jfEau/+8wypguTu+SUKIrP8GgHDVIJJwpTe86D2NmGV2Kljn5CkIiXZlUz182BgRh7xiMn8zeWsFsmpq6+/JQKLATBA3GV+o4QpGqXH3RVsvdlWQQGVIFYfjZ1ZlIPVyaJ5jvJGWgQ/dCbrMWSGehdsfQUWZPPZcEnwBMM3FILfE1tMhuc9m5IbIwQnTl6wvywr7O7qpLapiVnmaacZm8oCg6YEWmZAvN3q/toxKoxxfWpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfVZKJlRyOcVe3YiJc20fbRQ6Q7qMDsCcQfWMemE0to=;
 b=xpJbp/jOgBpb2r/U/+w4u+8miRTvpeXCuj9FVM7vkB9qrS0lXEzT0VXmLpePLwayh47dZ8wY049dcKc/WGdrRGsbNgFwg6JVEOTKNq/W7XC7j6IrLr/chRc9m+CJv58eWXhyvR2IXdPbhj3Yl6goUoMXKYiZic6Y0ZHYjQh1cK8DDy5zQMH/z6Vn6i8HV3phGHV9VuWbrQ/5ZBUEOjnp5OxInwp+gvari7I5nAHTrrRAUrvlZL63VvairkR0H5NsavuNqjNAA6cirBrd+/CsExgelGbCvZ8ragIRi2m9rTQZktqCGbRxZOK1wwtip21Quj8wlaUZfg3DA7vvsjeJaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=kaitmazov.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfVZKJlRyOcVe3YiJc20fbRQ6Q7qMDsCcQfWMemE0to=;
 b=MIFShBRNCtBhVSZUJAylGvkiG7zlhxVkvB1MAJl8k4UpDFbK5mBKz/hAQo3tkaSIQhBdftvu+4dNFnSJJkhFhaLdAgqYfwXKH9+gB03aJnvjfuoL6oGLo1I9a/DFl5Rv3xakUgrDoF3jAQ5pTMDhh3BX+s7hFdaZlc1FpUIpNvs=
Received: from BN9PR03CA0666.namprd03.prod.outlook.com (2603:10b6:408:10e::11)
 by DS2PR12MB9590.namprd12.prod.outlook.com (2603:10b6:8:279::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 21:21:02 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:408:10e:cafe::74) by BN9PR03CA0666.outlook.office365.com
 (2603:10b6:408:10e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Wed,
 26 Aug 2026 21:21:02 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Wed, 26 Aug 2026 21:21:01 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 16:21:00 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 26 Aug 2026 16:21:00 -0500
Message-ID: <f1cbc1bf-2904-e0cf-8fc6-07ce41dad2a2@amd.com>
Date: Wed, 26 Aug 2026 14:20:55 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: Bound the page count of a user supplied
 buffer
Content-Language: en-US
To: Taimuraz Kaitmazov <taimuraz@kaitmazov.com>, Min Ma <mamin506@gmail.com>,
	Oded Gabbay <ogabbay@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20260826195736.358579-1-taimuraz@kaitmazov.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20260826195736.358579-1-taimuraz@kaitmazov.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|DS2PR12MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: f4ec7af4-ba1e-4c3c-b382-08df03b7ee19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|56012099006|10067099003|11063799006|5023799004|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	EXPI6gb6DqadBWrrB/qtOxHa6zi7k7PeSxq3W9LTmWQWoNUDjjTqSJh1r8T+mpXrIFmMuaeaIOEYe0kFGQXrsRwwp46+eWbs9pauqinwcGPqdK4rStJMD5iPggDNbk4a6Woxg6hQKD4m2UaDQAvNY8gOmUh/jP8Nhad4T3VQNFQRE7uCImlm+WVc3V0yHVXh2aw9WYicmyYNKfq+dh/MaCpYKAhIaByUvHuNdfx9Gi4+Wp19IebMfqwYgkRhoOrsTle2kfLJB1Gp+6sxGRNGf2dU3Cf1oWhPWsrdP+QCc7lzXRsWK798Cp9lZNXugHdf67sDk8izuot2140N9YwTPMFnyG96v/qcWJFgLOL1/bX234qXuRTX9ZsUZmhAriG0iwAgBcSf55/Vcej+yUpU5pMIOOd59pKBbrH0AO4e63ZP7VbEowRceLl9uK6v3u84xsy1zVqGNmYoxYdELbieRImthqQWL5ZPtPxjXQ0X9PfH9EXjpEvLJ7lpaIc8rLkCJvhEvknGHVSjY2yp+9tppbvN7sszPpCDaUqxGvDDkEC25A82sfbjC0qbmn/moVwk5dgf49GnhXSWR/c2sbiURXUXONyVXLYB19miLS1jFqJxXSD2ZtXJ67InoQpHA9lIdLhNv/OWDUGdbLBfltUvTSux7aup3zOFsQtIov7b9t/qasaycEzNbwbR5AQ8A4hG91y5Bo9JzclBFc0idl8bUA==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(56012099006)(10067099003)(11063799006)(5023799004)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o03tgKFuraF0yQv8xHMIghnhpOC6T01DB6BpZMgeiKjef9VS7haYkCMkqwDQZQ5tSdI0BGaqGRNrjQSxkRyXE8hpTBNB2jPWcpv6iWFiV7RprghYV8Bvxvb/CPFWwMK/dUKcir2JJwvn6YOXlMAMDcoanfLd6QEd8CpPISe2NVqOOHFZNEcszPwinWnI1Cg/8N4a39f8JT6AjzJZ/PdF1losBhRjAm9g4tlpWc5Rpf/Ww1jTjdA4eW2jYq/vIQIS+vLugykCRGRKrijRzb+scKWtocnE+0qzA5zAvERymZrXlCk27dRPU9JzD0czav64tiZiETTreGY6iMs0S8TkGg6T7PdfDQvss+aRDDHWozYbuJbvOWvbHwAwlE/L7CwCYbqSsR7O8dv4ko4gt8oBsTRFCHRnL7UjKtBb5OPtZ6ogtwV8wNI0BPtlemXe+OJr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:21:01.6691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ec7af4-ba1e-4c3c-b382-08df03b7ee19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9590


On 8/26/26 12:57, Taimuraz Kaitmazov wrote:
> amdxdna_get_ubuf() puts a per-entry page count derived from a __u64
> va_ent[i].len into a u32, then passes it to pin_user_pages_fast(), whose
> nr_pages is an int. An entry of 2^44 bytes truncates npages to zero, so
> nothing is pinned, the ret != npages test still passes, and ubuf->pages
> keeps whatever kvmalloc_objs() returned while ubuf->nr_pages describes the
> untruncated count. amdxdna_ubuf_release() then walks all of it. Reaching
> that needs CAP_IPC_LOCK and a multi-gigabyte kvmalloc() to succeed.
>
> Reject a total that does not fit in an int. The lengths are page aligned
> and summed with check_add_overflow(), so the total is at least as large as
> any one entry and bounds the pin call, the offset accumulator and
> sg_alloc_table_from_pages().
>
> Fixes: bd72d4acda10 ("accel/amdxdna: Support user space allocated buffer")
> Signed-off-by: Taimuraz Kaitmazov <taimuraz@kaitmazov.com>
> ---
>   drivers/accel/amdxdna/amdxdna_ubuf.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/accel/amdxdna/amdxdna_ubuf.c b/drivers/accel/amdxdna/amdxdna_ubuf.c
> index 0e0cd69cd1fb..da8e32566ae0 100644
> --- a/drivers/accel/amdxdna/amdxdna_ubuf.c
> +++ b/drivers/accel/amdxdna/amdxdna_ubuf.c
> @@ -125,6 +125,12 @@ struct dma_buf *amdxdna_get_ubuf(struct drm_device *dev,
>   	}
>   
>   	ubuf->nr_pages = exp_info.size >> PAGE_SHIFT;
> +	if (ubuf->nr_pages > INT_MAX) {
> +		XDNA_ERR(xdna, "Too many pages %lld", ubuf->nr_pages);

XDNA_DBG(.... %llu", )

Could you also add the boundary check sashiko suggested? Maybe something 
like:

         for (i = 0, exp_info.size = 0; i < num_entries; i++) {
                 if (!IS_ALIGNED(va_ent[i].vaddr, PAGE_SIZE) ||
-                   !IS_ALIGNED(va_ent[i].len, PAGE_SIZE)) {
-                       XDNA_ERR(xdna, "Invalid address or len %llx, %llx",
+                   !IS_ALIGNED(va_ent[i].len, PAGE_SIZE) ||
+                   !va_ent[i].len) {
+                       XDNA_DBG(xdna, "Invalid address or len %llx, %llx",
                                  va_ent[i].vaddr, va_ent[i].len);

Thanks,

Lizhi


> +		ret = -EINVAL;
> +		goto free_ent;
> +	}
> +
>   	lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
>   	new_pinned = atomic64_add_return(ubuf->nr_pages, &ubuf->mm->pinned_vm);
>   	if (new_pinned > lock_limit && !capable(CAP_IPC_LOCK)) {
