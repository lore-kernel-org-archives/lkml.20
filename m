Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012058.outbound.protection.outlook.com [52.101.53.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CA83A7F52
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788151325; cv=fail; b=PBJo412n3D9hOhLUPa2xLIKIH/GGCvHSwUp3gzJM3jTgIUBhwXNe83MTMZfXz+ONAi8xY7mgmQ3ASERYnl0yuOPdVT8cYaCQfXB/f23geWK/uOaR9JoM/51MiaZDO7bwrZ2zjfquzem6A52gbWvR+GgO1LQb1RcvL//qMT+50Y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788151325; c=relaxed/simple;
	bh=k52llfnqHkkHSfxeoXJexSwaOu4ZA8Uio7jHyulerC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QXF9z3LtAREgkbSXy0Fqyj7Xq8xoxKvxQjt4ZXbGmk7hMDt9IpJZ3qjTPK2Rs3KtAIUAVJPjrVh/GtlgSClderXEo2L+ftQGjngmXcbV/Nf6q2zrAvLooHNvsXzULQt+9D1FS3ULCYEDnpakJq9Z1ifopJYUeCAM5DN1cTuzSE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mjJ7aBw3; arc=fail smtp.client-ip=52.101.53.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mjJ7aBw3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXToM5GXfv9+PxupOZ36h6yUNbu5SC8/+MbM4xKb1P1cvZhlx5VJKoznQTx/L8ly664RGpKIdsxJXyniBkKg5AyqBvGzrq071hE3cWfasHef001hVnC/a+70DLyl9MBH6EVGC0++oc/WPTKAH9pbHX8e1/lYyWbWtMJHRQD6WyhWVEkbpZHJaKjzA8xWkDLyo3Qrc75Icl5MdC/VbnOs0bB/whMQEqjZFF1INUsDC3WEkUBce4gEvI6TGA2cSKGZL8H6LfjB1lH4Ku4SMo08b4IGYubZhRQrCP0tNXX+JivAd/apzVrjXXg9hGcVH9N5Crn2tbOmBEDHk26Xv5Zrcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZODQJA6acrMEoF3+ocDoHmL+tlJ4HeKUW4+9YfCFVDM=;
 b=r65dFxVMiePQYaxTLiUEMULT9+p+/efAgcQ0hNx6gUKUeDxjLdDITmueHtBOi6HRtQDIfOpggOiDMF14trg3u/5xKxrpWiK6NzvdOuRLSw3mdeCLFhC8rvxWiOp5N8bhYjixt2Ufag1WRhG7AXnyt/iD2DcfzjMo4gSqHq5BBOXHGFu+PyEdA0FvcvkYSPBKNT8n2yAwu5YnidT3gfxBIPJoY3iDlyRONs204VNEJzTExePYiBR223Y57DBE0DUFUREkvkFqVJ3b+12tnhlDjKNP2RDSnGR/Tc0JbD7KEemR1l3qBoZf005PCqhzNmjwwDcsyLI41IPDhph/tJlzVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=enjuk.jp smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZODQJA6acrMEoF3+ocDoHmL+tlJ4HeKUW4+9YfCFVDM=;
 b=mjJ7aBw35XRfo16KZ32T6i0UoP8qw/fUQGVtqq2QtqkuOmD05tUz29JRXyiSq9IzGdGAdf+9hldrgig7/A8It6Dnw2zNvvC7Q3RlhBSo51Y9Cth9vbiTU8kcZq6AjPjdsamg//5WNc2EuKG7Rk5uZkcZlTXfn/udoBA4nSsoVj4=
Received: from BN9PR03CA0792.namprd03.prod.outlook.com (2603:10b6:408:13f::17)
 by DM3PR12MB9435.namprd12.prod.outlook.com (2603:10b6:0:40::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Mon, 31 Aug 2026 04:42:00 +0000
Received: from BN5PEPF0004698D.namprd02.prod.outlook.com
 (2603:10b6:408:13f:cafe::81) by BN9PR03CA0792.outlook.office365.com
 (2603:10b6:408:13f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 04:41:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN5PEPF0004698D.mail.protection.outlook.com (10.167.245.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 04:41:59 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sun, 30 Aug
 2026 23:41:58 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sun, 30 Aug
 2026 23:41:59 -0500
Received: from [192.168.0.102] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Sun, 30 Aug 2026 23:41:56 -0500
Message-ID: <39970168-cb5e-4c1c-9899-cf21bd38e66d@amd.com>
Date: Mon, 31 Aug 2026 10:11:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virt: sev-guest: Fix lifetime of message descriptor
To: Kohei Enju <kohei@enjuk.jp>, Tom Lendacky <thomas.lendacky@amd.com>, "Dan
 Williams" <djbw@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>
CC: <linux-kernel@vger.kernel.org>
References: <20260822-sev-guest-mdesc-lifetime-v1-1-b489d434796c@enjuk.jp>
Content-Language: en-US
From: "Nikunj A. Dadhania" <nikunj@amd.com>
In-Reply-To: <20260822-sev-guest-mdesc-lifetime-v1-1-b489d434796c@enjuk.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698D:EE_|DM3PR12MB9435:EE_
X-MS-Office365-Filtering-Correlation-Id: ca3bd305-0940-4254-6dd8-08df071a3184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	AH6B5tG/pXuDNXWzSHydXIvmdUNSWf5EoabHXd4GG4v4R+UTDAB6i70SUbfuM5EOq3oOp4BepWWTKQiYnowy9dOjqSDxMszP5c6fFNtGcZ+vZ+SrInn+VxftIr3mb9evCmxEr3akUAaw3hdcoRFuy2g51AH4QnamXeMOHzuKC1INI4BGQZ2LH0fwUuYPJpLRS1QIllM4J/mO5oHgeYY6EkXAmIuOn/3HKyG47hjjMy71cx4khxfGXm33pfCm+DqkXiT8pvZn0R4KYWcn0K5/tZV8dfrOYzGXugzb3u9//Hje+w8lfynA7BBXCLkfoUpMlbSNfCjDJPJEqh6+ML1sgQjq07ShPmFIt+a2cwMkuAthbGoKMv2Cv24wyj5WqRz/nqpkKprwanErZ8/DrFwvvpm2jfAl2KK826EbwiNhVMr8fT75lXeRXpqN78TWcPEGyNBWvlGlw3Jq0KwKi3tC3HYdpMVnC/alwdBaTusATm8Sr77XIUtWttwlM9JtNGSjk+Ptk0UzzoaNSajnFIR5XcPd33igG6RVpK44kdm8oxbPoCS4HMUX7Dgi6i+oXIHkxv8i4/Pdabt6eFIp3vayOeIhbtm3zMzVxum7/1DkAgfY4IUT/27y9/TSBLuJeqYgkBU3ZgIWwnL1qo6ls4F/wLv0nzoKRyJ6lSqH+NY7FhCU3h3rJQiWaYecRAbTXdpFNoasrO4lUMJyOaXyQ7L+Xw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ga7DXIYCo5J5iOev6xdflx/pkewCP+Za8ibChu5+l/mhBTVEvMQEBTolOnv4ERqJhYAoqmCy61DBL+vSqe4ejHc97jWYNq3P6mQr9YPqqXczpAQ6wYvOD62liVxKFdRv/Z4o0UQ1a/EEYGeHf8LUj6Jk1DWjgoKQXdklqokBtsmcF4TnGW9ZkBfKUz3Mh0dn4hVej+mnI2JSYmHmC4uFej/j6Ilw4MFPO7efnECDECVu085W+17q9HwL1B4WZJ0u5dV72RNtitN0+QNwVQ1OuwsbjX4UmdjITp+UHgWYlnnLUcrNyMxboi1ixD4Ksloa/emj1M7IMQvoRHoBKh7/N0lyBbG0xOawyFzZj7S+FPw5V7zMUNMqDyk+sDD0OCxnUTP6cAvma8IniBLc8VUhPAx3jdciGiONoqw1XdGBM5i4UkaGlQFaGxLMWcxwirLD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 04:41:59.0770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3bd305-0940-4254-6dd8-08df071a3184
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF0004698D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9435



On 8/22/2026 6:05 PM, Kohei Enju wrote:
> sev_guest_probe() registers the TSM provider before assigning
> snp_dev->msg_desc. Once the provider is registered, a concurrent
> configfs report request can reach get_ext_report() and dereference a
> NULL message descriptor.
> 
> Additionally, sev_guest_remove() frees the message descriptor before the
> managed TSM unregister action runs, allowing the provider to access the
> freed descriptor.
> 
> Assign snp_dev->msg_desc before registering the TSM provider. Add a
> managed cleanup action for the message descriptor before adding the TSM
> unregister action. Since devres actions run in LIFO order, the TSM
> provider is unregistered before the message descriptor is freed both
> during probe failure and driver removal.
> 
> Fixes: f47906782c76 ("virt: sevguest: Add TSM_REPORTS support for SNP_GET_EXT_REPORT")
> Fixes: 0a895c0d9b73 ("virt: sev-guest: Carve out SNP message context structure")
> Signed-off-by: Kohei Enju <kohei@enjuk.jp>

Reviewed-by: Nikunj A Dadhania <nikunj@amd.com>

> ---
>  drivers/virt/coco/sev-guest/sev-guest.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
> index 935537a41469..458c96fd82f3 100644
> --- a/drivers/virt/coco/sev-guest/sev-guest.c
> +++ b/drivers/virt/coco/sev-guest/sev-guest.c
> @@ -618,6 +618,11 @@ static struct tsm_report_ops sev_tsm_report_ops = {
>  	.report_bin_attr_visible = sev_report_bin_attr_visible,
>  };
>  
> +static void free_snp_msg(void *data)
> +{
> +	snp_msg_free(data);
> +}
> +
>  static void unregister_sev_tsm(void *data)
>  {
>  	tsm_report_unregister(&sev_tsm_report_ops);
> @@ -644,9 +649,15 @@ static int __init sev_guest_probe(struct platform_device *pdev)
>  	if (IS_ERR_OR_NULL(mdesc))
>  		return -ENOMEM;
>  
> +	ret = devm_add_action_or_reset(&pdev->dev, free_snp_msg, mdesc);
> +	if (ret)
> +		return ret;
> +
>  	ret = snp_msg_init(mdesc, vmpck_id);
>  	if (ret)
> -		goto e_msg_init;
> +		return ret;
> +
> +	snp_dev->msg_desc = mdesc;
>  
>  	platform_set_drvdata(pdev, snp_dev);
>  	snp_dev->dev = dev;
> @@ -661,32 +672,25 @@ static int __init sev_guest_probe(struct platform_device *pdev)
>  
>  	ret = tsm_report_register(&sev_tsm_report_ops, snp_dev);
>  	if (ret)
> -		goto e_msg_init;
> +		return ret;
>  
>  	ret = devm_add_action_or_reset(&pdev->dev, unregister_sev_tsm, NULL);
>  	if (ret)
> -		goto e_msg_init;
> +		return ret;
>  
>  	ret =  misc_register(misc);
>  	if (ret)
> -		goto e_msg_init;
> +		return ret;
>  
> -	snp_dev->msg_desc = mdesc;
>  	dev_info(dev, "Initialized SEV guest driver (using VMPCK%d communication key)\n",
>  		 mdesc->vmpck_id);
>  	return 0;
> -
> -e_msg_init:
> -	snp_msg_free(mdesc);
> -
> -	return ret;
>  }
>  
>  static void __exit sev_guest_remove(struct platform_device *pdev)
>  {
>  	struct snp_guest_dev *snp_dev = platform_get_drvdata(pdev);
>  
> -	snp_msg_free(snp_dev->msg_desc);
>  	misc_deregister(&snp_dev->misc);
>  }
>  
> 
> ---
> base-commit: 26260251022fbc2f248a3d747a9b2b961b18d2d8
> change-id: 20260822-sev-guest-mdesc-lifetime-e08772b010d4
> 
> Best regards,

