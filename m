Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010046.outbound.protection.outlook.com [52.101.61.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118133C1D7E
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788019091; cv=fail; b=IpG/qZ0R6MgK9ADYFNlnZm/QuwXLXUW6HPrytZ3JYJgNRYWBgSAzuJlH6Ac0Dsbm2cdCGvn2g2djE4LRV8DkeJRyIJpSnMk4WEt2Mobs4dvCr51QU3ywcH42qAku4/umfSnxzygZPj7tulbiaC2NQk8VQjD4MUVj8hrqttCyUwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788019091; c=relaxed/simple;
	bh=t6huyOK6qidcCKDouuZ6EXM4LSPATqJCWDzAb/GCjig=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=i5T/2/E7K3VbqM3zKx6WG5LVzdSMADAa9yvhNKE9biM06mqWlUVJk3qQ5SQaqd2E7dS6vfHOqR6wFxJzjTYSrG/ZB4tjV6SwkJ0JW8Rh5Vn8+VO+/vQOUy0YLg+B2EHoBdaIE8H6Y9F7SKdqWpCtY7IMB2Oj0ArPbF7wSc1FS48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tyOInEDV; arc=fail smtp.client-ip=52.101.61.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tyOInEDV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbB2ou1f+ew74Irk7rmE0/7p6Y64OTOO3l+phuhquXAGCTTyD45oQG9s6X2mq2fYybRijhWbxIFDp6mTs/dXPv+wSpvg0GUAkkxOCYU6/aQjiZ/3hDu4XmIaGw6ddKZR5MhL0sk66O1KRwKYrVoyfIiVGistC1HPKWBR6ec88rR6dePEfRa3JBcvG9F38zL6NrCFShQcCk1OHEvKV0JvgqcQidunQukD8jK0udHiqOKh+B9UvTI4d+WJsQgO6sWjkOFVf+u8JQ1zUEuuvantFZHPvmjuvBQETYaLUw8LBnCOyPWTO8Mu+Cy0j9WrBtKURrJmF7nSV7JM/I5lrWMHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAcvh70LPrdtjgzxRd43l4haJjb1tQe8ow0yAX/7JzQ=;
 b=OOp1V5uyfjH7xXn8yieghtf/qxnfBCzmYEcCgz6TXmYcqProeG2JDIzKIRN89e1qf0JQeuxyEaMRytIDXgz7NBaOo+vZnqV25i2ay+QZO+DXkai5t0jINJigYLP6oz2ryUYRmEX77lGKzW2dzztk3APksOAyWjwtul2+Y/JMQfvEfjZ7tdiGaIWrRTQMnnILCd+i3dFBm6K9zfymkJ+jFcWtwyd+gUBVMCODtFo8lzDBtXbMPoasb+KXVk+g3d4/LMv4WWwvW62hJcaYi19pJufEWyUynbbLwi/AtqAJrVS/F2zNTVrjbt1JOsCW9LelFZByF0Ur7lTheTYhJoy7PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAcvh70LPrdtjgzxRd43l4haJjb1tQe8ow0yAX/7JzQ=;
 b=tyOInEDVVMN2EMqafR9w7YRX8efv7hWL3ObA0pZTQaPYr87EkAz+EhlGBMo+lsjSlpvv4rgHQnXIBw1A17fGa8Z/OEbRYonMohJs7GlwckKLChtOGKiMtRGVD8oP68+boG1+7I2TKTtIns9FotIcso8oZwGW7cCzlp5G4Eca71c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB8131.namprd12.prod.outlook.com (2603:10b6:806:32d::12)
 by CH3PR12MB9022.namprd12.prod.outlook.com (2603:10b6:610:171::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Sat, 29 Aug
 2026 15:57:56 +0000
Received: from SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46]) by SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 15:57:55 +0000
Message-ID: <d3ee909d-9bfe-41bb-95e5-d90abac8cda5@amd.com>
Date: Sat, 29 Aug 2026 10:57:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virt: sev-guest: Fix lifetime of message descriptor
To: Kohei Enju <kohei@enjuk.jp>, Nikunj A Dadhania <nikunj@amd.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org
References: <20260822-sev-guest-mdesc-lifetime-v1-1-b489d434796c@enjuk.jp>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 WiyqywZI5g==
In-Reply-To: <20260822-sev-guest-mdesc-lifetime-v1-1-b489d434796c@enjuk.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR12CA0004.namprd12.prod.outlook.com
 (2603:10b6:806:6f::9) To SN7PR12MB8131.namprd12.prod.outlook.com
 (2603:10b6:806:32d::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8131:EE_|CH3PR12MB9022:EE_
X-MS-Office365-Filtering-Correlation-Id: e45086af-6c16-4308-725e-08df05e64a4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	G/7dSPXUBpinCfHWDgil085eCEbdC8R7Q6W0bjzH/6op14NSoGa/zS+zWvP8lTj+7QnzWKDTrY9Zqm1fll4L7NA1dC8z/cHwWWZD7LeAm2LjHaOUOrdT5OM4kh117TFk7E2uwrE6vhEsAIgu30h/gSwkzNTPEEykT02X7JJz9pmMVUSKC00znp2fFJ2d9lbpWrdgnNZW/EPdq/AD1oQneuGeGQDyrYENn2uiojDu3rLakyGiLqK75s19UmtVbXTbnoQZU23OY3UODOMXI6XR7s9oBy2aLvmuaDY0av6tYOTlyH+p89eVugZTCtIObsoOoIKn4zK3IOGm/oE74Nf+U6vHzCQcZoO84pNIgspU4M1vnmm4TRV3HUzskJLKKd8Lpii/ikCtHxnWAOVFq6RthEssUzcxeUHyWHatlWpq+lDGjfco5vFana5fIMb+7zOfWGQDFMnuBwc53DnjJYE6xdUXR1MGaC+0xqdRa69SLemHrhZAEkI4c8D+ed79ZaOwL0/QjnaPWgsN0v5d7D6o8StEonannzn5spTE9V7Dl4GVEPe0pv79j812g2FbHOQlZ9/u1QblSp9NYWkZYBxYQQA29UkLnYcaxR6d7Gjfmc/vSzhiCYZT96UcUyViiMdop0Qt4RxPNNM3Y0pfkJEYFwrfZRXYVIG6N2X3IEtlnd8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8131.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDBhcU53QXVPcVVVYm1ESS9tblJHZDVENHRUcVJyUXZiWUlheUlXa3VlUVIz?=
 =?utf-8?B?ekIxMzliMEdvdnN3UDBZZ3J6R21HMW1lNTl5N1lsR1BhQ0pOQVA3UU1uTW5h?=
 =?utf-8?B?ZVEzTDQreWRuNEtpZUlRVERNWXVmMEh2enI2YlBFKzdaWE1yUnBqYk12VDVL?=
 =?utf-8?B?aFJ2TnJ3TzZUYzhiK001TCtmYlBBSGRXVEltS1hsbnlBRkt4SlpoM2xUam5q?=
 =?utf-8?B?Rm5JSUFoQ0d3TkR6SU5FQzBvRm9BYjIzYStYbjQ1dzc5Yk0rRHU3MnA3eUpP?=
 =?utf-8?B?S05yV3VxZUNTYUNhVnNVdnI1SHdjcVA4T1ZUK25PVFFwSTdhSDVoQ09OTjBH?=
 =?utf-8?B?T0ZMU3Q2NTlKR0VUVGlKdFp6ZmhOeXpHVVU5WFR3ZjZPZFI1Y0EyWUJlN2NE?=
 =?utf-8?B?M0xMbUwwMXU5ek9JM0pNN1g1Tk1SN3FINDJZL1R3RzY3c0d0NFZIZzJwOG51?=
 =?utf-8?B?aWppWDJkOGI2ZzFHbXNxTG9LSE5GREdCZ0NCeFY0Q3BCVWlUSGZoSTJuSkpo?=
 =?utf-8?B?WkpMWW9wTU9WUkJlSkJPWEFQbmxuNE1aV1MvcWRyWEZDQkQ0K08zNE13Qk0z?=
 =?utf-8?B?VURmTG9jQ0xJbStDY1VhaG5rdFREbktCMVAwenNZWDlHamlCQkhXdzYwQnJE?=
 =?utf-8?B?RDNzL1NjSVhicEtaZThvZElIVVNEOGhXM2dRTVFadWFESjBxNnBvOWhlQ0o1?=
 =?utf-8?B?VmNYbnR1WEJDSEpWRmZEUTg5N2JsbkhjWjd4Y1lZZWlmcU9OcTFzUys0OWYv?=
 =?utf-8?B?N3hrM3B6VnBxK0lYeE5rNWJTWTZvWnlFVVpUYUFudEFJTDE2QUJ3Y1R3WGNa?=
 =?utf-8?B?dEw1WVFDYzFFYTdiSWVQNmR5QkhqaWZva2NEV3UxT3pEempBUXN2VEVQZUhp?=
 =?utf-8?B?Q2NiQllldmd1N0YyWEZDaU55S2t1TklWUmNqVFZrcGZTeUxDciszaGlFdHNz?=
 =?utf-8?B?THRZYW9xSmFVaFk2SGg0bEg0dDU5NGd4MmdzSms1VHRFMkVGcy9ZeVpIdXlh?=
 =?utf-8?B?VmlOcG53Vk4vWTk1bnplYmNCUDRKY2d3T3dNamtVRmg4eTROTFdWMzBzaHlI?=
 =?utf-8?B?OFpJSEkvQ3NuRFFWUS8xbjdrWmtCcXFFUXkySlk3OXhvb0VVL1RXY3BkbXFv?=
 =?utf-8?B?ZG1JY2JiTll4Wk9UWUlxNWtlb01sYTk0ekJWTDNIK1ZFQk1PTHNwdGFzQjgz?=
 =?utf-8?B?MCtoNVVGYlRHTWtNNktQZU1WOGZHMmowYncvVWtrMFRLZ09vV210dlJwNjAw?=
 =?utf-8?B?UDJVWHlPdWtVZG40eitOc0dySEMxZ1FmNEpLU3ZOWG5mOHRJM3FZVzhlbkRh?=
 =?utf-8?B?dXJocDdXNWdaWUV0YXhvUGl5RTgwSU11MFM1VHk2Ykh0NWFHdW1ITVBGNnZs?=
 =?utf-8?B?QjliaGZiVStNdUZUTjRubHBTcnJvMXFUMzI4TDBWMytRN0tVR3Y1eDBjc0xu?=
 =?utf-8?B?WjRMbEdvb1B2RzBRM2J1d1NJdkxrZTEvdjBEeU1TZTlrb2J4SmlDOWtoMmFG?=
 =?utf-8?B?NE50YThVTUlJWE1sbENZaWgyOGxTYjVPSE93K3RHV2JEaDRkTzZTdGZPRkJ0?=
 =?utf-8?B?SlFsV0Z6RVNsWTk4bG9PWXdKb3MrenpjajZWQlQ5YWoyV3pRUGFTdmQzbVFo?=
 =?utf-8?B?dk1Qc0dIWHRHcGVJcXlQbjdTUTlzNEdGV1pTQVNYWFhrV3J6cXpwTGxpSzlk?=
 =?utf-8?B?d0QvWjEySm5OTExsMEg5STdqWUFIK2VnZ3dKODlHclJZN0pjOGJRWVNySEdu?=
 =?utf-8?B?dDlUcmxRQ0pQM1grcVIrSlR3WWQ4cUdmaFpJSEh4Q3JJMVZ5L0tVRDh6Rzk0?=
 =?utf-8?B?eU1pNlRGQlhGRHZZT2tqSFRHMnNraHFFSEN5YzZPdWowY2FtRTBvVFVJL2Ex?=
 =?utf-8?B?b0l0MzVtNGxHSXdNV2k5bTBFZnVFUWFBeEhtQkhFTzRYcnRRSWFEYzgwbkZ2?=
 =?utf-8?B?RjNHK0FVUVprd0pFSEY2cXlpQVFNdFVYWS8rQ0lxREpkR1Y3Ynhqbm4yTzVX?=
 =?utf-8?B?M3BVNmgvazFWZCtLMFZIS0RVblF5SmFaaGlxa1BpZkF5VnFGMFFULy9Zb0dl?=
 =?utf-8?B?Y04zc0hjc21URnAyVlZhL0FCell6aEFkeElCV2N3aE5LdUYySm8wLzBQS0tD?=
 =?utf-8?B?TzNQRzRUWUdUNER2S2M2SVZLZUJQcVJUMEVuY01WNDdFakR0dzRFR3prTmd1?=
 =?utf-8?B?UUQrQ2tFZnBmUlRVendORE45YkNYeTNOWWVSdTNway92QzRHRWpMSi90aUpH?=
 =?utf-8?B?TTRsN1hTM1VkQ1JKcmZYdWhHd3d4TXFBOHdOQjJkY282Uks4dWNWRlg3OVdL?=
 =?utf-8?Q?UBvyR+C2r7ex60APkG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e45086af-6c16-4308-725e-08df05e64a4d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8131.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 15:57:55.8284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwYQESTKf/IYRFCLuF6hWC5xaAYZvujpxVPdmtWR9I5eR3FBIEZ/CCO2Yfwae/EZXyNVjoFz6XLytNDbWJS1dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9022

On 8/22/26 07:35, Kohei Enju wrote:
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

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>

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

