Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4FB56E057;
	Tue,  8 Sep 2026 16:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884749; cv=fail; b=ZfxdSNruXn8y4yKtKZsWw+s1MqOSDHQG4Md0D3kmMIpmbf9zbZYHreJPfSjDY+CYDxG3kNARB5tGEBpXaMDyVKBSmnBnFq9RkEcRMVi9/13cV+zNQL26AiFHYMggg2twGY4PK/aHKo+CMdS6rQx1BeXx7Kr2XSV4GJTAnQ1HBRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884749; c=relaxed/simple;
	bh=gzK5VpsEuaPSPEpgeCGY6Y7JAbdWRhhbhkdvd/aKzNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btse/Rd/BF9Qdhn21pxLrF0dZ3WOg+sG98gAIzlAGhV4OVhlEJBIIsuRwoNvcMUIGPsQZ35K1hPywYSDocw4ykUKRJlByLrmNbU+goh25AoUAV2KLOGbvHI2CQeDcSnOJ8W5L3nlP/TrhjZuKOvZoGpE7pdgwyybVTVy8I4dPMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=l7CQ/i/7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=fmB2KfUH; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="l7CQ/i/7";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="fmB2KfUH"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FWgPA3528173;
	Tue, 8 Sep 2026 11:25:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=TlDUQ4JHzwho8wtI16
	WhC5Ou0h3CLh2krVQ8NNnuiU0=; b=l7CQ/i/7OraPVzLhMPQLWLRXHth8BuEwcq
	BH3kB887DBaqOrUgxEoy+/gm93UHbDWGnLtn++UsqDveykaELCFAk0zYWloQjV4N
	ULtonqlpLa0nJB7JGS1OWyIHqDBMyUcAp/jpCIol28qGVQz0CUzLB55ttLlPcU35
	fOtMszWd9Zz74nK2OHJ68nmz2ZuLWzTiY31LGFHW8fZeVyPAnZn+2emENihvv2Yl
	VXzU81dRCdzwjz0kkFe00lFujjOBIs5TEE9FfSIWl5KR5XARwj4DTBRpxN4I1jXD
	9f/bLz1qnAIgWGHs0mgHGWVE5V3Xdr6jVE/CG0xZE4IGwLwxN6Fw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022113.outbound.protection.outlook.com [52.101.43.113])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ggfgjuqsr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 11:25:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0SW7C01quAJGJ/ogDHvw4Mk+QjOMuf+88qI4Y26FqYonvnDqG/TK2hHMwQJFN3XYqJ03p+4d3oXt96XGFJsH0GaaN7TpCzm54U+fiDz+zfltfjGUQeIf/CYp6ddbphdKsFZ7H67qfneszVn8FT2VlLutMYhKe8oU//5kUqnuW91vTUeClGtoaOUSYgF8M6q42DGISa41AN15aDai7QtwqW1bs9Z5DT4HKIjZOGNxExOUH4cDh18Wzx689MgiBw50XjITFlTKOlOj0SazeweO54/3tTjM/yEA3rHGs235CxNbD73VnXtm3lRqm2nGsBuEJl3bmkSE2CYMOJaCHCACQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlDUQ4JHzwho8wtI16WhC5Ou0h3CLh2krVQ8NNnuiU0=;
 b=ARf4W7rq4lg5X89DU+89Tm/ULQanGybDNujEaJG1iSvzdrFOxPouWTAFzXLQU0ZdvVNpSd93uz9/ubPPwTT2y2DcTNSatfRoqxTgDowDtr9kWOibuOWj9na1PHU1+EalYWicHD7PYyz6KaEjieHwknI3ZYC5M+BNgPaRSZOfy7lZpHnU0VK9u0NsI91oOVokgGHA66rquBaEgtXb2Dqx5fHoHZbFeW2Dg2bHYnYfP6DliUys1IaTtJTto+Rr0QlA+BsJEaYa5w7sw2D035THzLLBcze7wKZ4pvT3f8EnApwdrfSuohTYlCOVD9tKjiQFS9JHdXVS5t/D+vtO0X9/BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlDUQ4JHzwho8wtI16WhC5Ou0h3CLh2krVQ8NNnuiU0=;
 b=fmB2KfUH/hwZujqGk5eC/0W9ehWL79jmCuinoZaJU40DNQnp7NgKXeiXSyOsndpsDGzt+A7Sfp2JrRuWIRGVqpJDuX+R5dOpDcndpoglhD1aNbWs8ipjrs1xE+0gzaNNseTj/R1UORbgmu7d7m1PZpkdYs6pm6IgqsfeWLfl4tg=
Received: from SJ0PR05CA0028.namprd05.prod.outlook.com (2603:10b6:a03:33b::33)
 by DS5PR19MB997168.namprd19.prod.outlook.com (2603:10b6:8:33f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 16:25:30 +0000
Received: from MW1PEPF0001615C.namprd21.prod.outlook.com
 (2603:10b6:a03:33b:cafe::6a) by SJ0PR05CA0028.outlook.office365.com
 (2603:10b6:a03:33b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Tue, 8
 Sep 2026 16:25:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MW1PEPF0001615C.mail.protection.outlook.com (10.167.249.87) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.1
 via Frontend Transport; Tue, 8 Sep 2026 16:25:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 033D3406543;
	Tue,  8 Sep 2026 16:25:28 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DE198820247;
	Tue,  8 Sep 2026 16:25:27 +0000 (UTC)
Date: Tue, 8 Sep 2026 17:25:26 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/11] ASoC: SDCA: add populate_function hw_op for DT
 function data
Message-ID: <aqA29pv18mXzTR0G@opensource.cirrus.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-6-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907083727.733705-6-srinivas.kandagatla@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615C:EE_|DS5PR19MB997168:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e9a641e-28ee-4dd6-fa96-08df0dc5cc3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|82310400026|61400799027|376014|10067099003|6133799003|22082099003|18002099003|16102099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	N7oO6UkvT51oX8fL4bri9GjlHat9rLpiEz9anKpP+lb7Deir6REE9uunKO8NOBGuke7b5hCUWPUfNZ2SdLbwlf6AHM+auJylPhR8wceJ7IHYn2gQ2HJcUzR4DCxescA08AZfa5ZfdrGDoPaZhbftiiCDLN60qUkFh0GrAIvzqkEh3A2Ny/3M7xseSeI40ytouq0Wgs43VUF3C20yGFuX9u+E2Lu+dF80kEsZ6OYB57MNbGaOiVDSHBCURp1QNwsBbYO6Hm/TLFB15qP4ZfS7GVux94oN9cYHD3+VsYhcsxdscKc/wgOWyQ5l0Gb2r3+cMw5Ga2gJfVB4Spd3DANYsWOmvKpQNb7idjPf/dBD7aSr9jA5ulCR05q4UUPfL5yS+qiKvDa92ERL4XgLG4tIHshf41ELmt+XCrUp4eBvP52pFWF5mNdZCNugovLpCHWR+Vz1LigyUFYKO9BNezjhmnVpjYlnCZjXsILYwP0R6cT7dkFd82dpsTJjfeVse8PssuJYEi8HWIhZLm0ObLxj9xWxGMcdZfxUWAYSwWkvt+3nbEPvfIIAi8ywQ46/G1Gq1cxWVYBPRVVJmOmCOx9639dgXxiKiLC/YeCU4QQjYcAPDWm8c3fE8XUrjkIN5BzDCWBQx74UKV0EqXLh9Q8spf0DEaAtNgQv6tOonpIxltRjkKH/6djOMp3exyppGWshCun21e58KQhOmV32J6PUnA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(82310400026)(61400799027)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(16102099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	05pxZ93Y4AFJPtkouBi8ZVbWGkFhNy1JPpfUuhSst1sNWtcq7rMTngLKRy3O7VHcGAK9uc+R9fohTqGW4c/mmLWw/1DDLh07pGAxh3VWnHI31jJJRIHeedQHTEBto5oNVPRV1P3yCTXodeQkjCYiinrTctxW5xOFiYZ4MBhPRAYK8YgXAszCCHAtjzSJlMxK6sYLMsdGw1cM1kwEtg84HkFQMS8zB58Eg4azJYYZRJZKPuHiweuQVT3tiYa4T2zAqUj8Rd0VAvbrWnc/fWMUlBHvedeuUvKC0QKygguLEQu8+PeJ3nFSroigMYUb/F8Ys8SgksCzH6Mx+XyTRmu9gSwfZewQzljb+L+EE81c4jxn7cz7Dqe3IU8RaKTdT3LqQJ2ypEjC++uuwC09embIoiAr55sr3b51RBdMPsue+ZnYmivrSnQ5ief87yz5J98Z
X-Exchange-RoutingPolicyChecked:
	kaoTvi2b70fd2lblimAAFFC99Q2zZNreZ+7jGG4y4/G5jWsuPtJKKFiqh/c4PSSN+xq9z4bQ897ex/KqVSCDCC88njHTSRW6ONgnjdeiMun6T8v4DhTNNNlyXtMd84TIJnvli/esjGVJflcXaLJvQZ43ctgc0tMYN4/fxl+E7LdjP3zrM/6yQcWF7deiOiAH0jHVMBOP4yrXXfyWeclxCtIZL0MR4EQoAbZSf/GsD/qHfmADWc8dJ52NCxIBhLnFOXmTLfULBMKtlwEFXzt3Tza0lZDZJzyXpA4amQkVPHNOFZDf0KNAXQMz3GBzS6xAtpbaKt2WCtJ7sSUdYzfqJw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 16:25:29.3164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9a641e-28ee-4dd6-fa96-08df0dc5cc3f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW1PEPF0001615C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PR19MB997168
X-Authority-Analysis: v=2.4 cv=bpd8wkai c=1 sm=1 tr=0 ts=6aa036fe cx=c_pps
 a=6opEo9M2fWe+N/0KKLrvTA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=EUspDBNiAAAA:8 a=MKSEwaW6bXnTWDGCzA0A:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3NyBTYWx0ZWRfX6OsKNAfxpky9
 J2PqP2P5a0p+gMSS6UPC/tT+akI+tbVKspY/HAP1sN2GBtEMoO+aIJeDJ5THnZ3iilLVl8XjQ4V
 mR7FD+fml1LPd0VMnfFJ9xcLn5wk8lTCYpsqBSQ/CLULhggCdfbcyszamHw0/hHr4Gp0Rd8QwiO
 0mWrRsbXjRu0A91hzW3uhNmOlc51fMhLT0sB6GsAUJIIqkSdObrUfz2oOTQfHX6LyD+obujuZOE
 JRQDNMTiD3utJukBsBIgSFumgObwpaW9PvM3Ku6YRO71OVqy3wDFB3PS5ewrc1LIMkZXd0nAGui
 wSi+mFai5Ukec2nPpBdl7UV6xLJtg7/eMX4j9x5F37c+Igmb6UjQ0eKIMsio0m1bjfi9g5/YPJS
 0XyABjDz52pYG2UUiFtGxT8yeMwDjg9DktdiRM9e+L9OyeDTTe8onACJnivuWo1WumpK9xrrmY+
 e9MOdKxkNKLuCIIq2Xw==
X-Proofpoint-ORIG-GUID: qJuxncC3LTeOMk1lZCEmSRqE3FDBTUyF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3NyBTYWx0ZWRfX/whZ/IgPjz5z
 tOcngo8/3GODmyUjZtx5CdAmZtI3sR0/T6vbM3gONz/naPRashZsl7UWy1YF9cz+QcamoS1Rn1S
 zqveuOkJ9eQjRuSy7/Np677x/MPixAM=
X-Proofpoint-GUID: qJuxncC3LTeOMk1lZCEmSRqE3FDBTUyF
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 07, 2026 at 09:37:19AM +0100, Srinivas Kandagatla wrote:
> sdca_parse_function() walks a firmware node, but on DT there is no
> DisCo node -- sdca_lookup_functions() is a no-op and the SDCA
> function descriptors come with a NULL fwnode.
> 
> Add a populate_function hw_op that the class function driver falls
> back to when @function->desc->node is NULL: it fills the caller-owned
> sdca_function_data (entities, clusters, init_table, delays) from the
> codec's static tables, matching by function type.  Leave
> @function->desc alone -- the framework owns the per-instance
> descriptor, so devices with more than one function of the same type
> keep their per-instance SoundWire address.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
> diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
> index 10a2b031b572..8bca88865a4d 100644
> --- a/sound/soc/sdca/sdca_class_function.c
> +++ b/sound/soc/sdca/sdca_class_function.c
> @@ -329,7 +329,14 @@ static int class_function_probe(struct auxiliary_device *auxdev,
>  	drv->core = core;
>  	drv->function = &sdev->function;
>  
> -	ret = sdca_parse_function(dev, drv->function);
> +	if (drv->function->desc->node) {
> +		ret = sdca_parse_function(dev, drv->function);
> +	} else if (core->hw_ops && core->hw_ops->populate_function) {
> +		ret = core->hw_ops->populate_function(core->sdw, drv->function);
> +	} else {
> +		dev_err(dev, "no firmware node and no populate_function hook\n");
> +		return -ENOENT;
> +	}

Is this the right logic here? I feel like if we have a
populate_function() callback we should call it regardless of if we
have a node. That would help with the use-case where this is
being used to work around bugs in the firmware, and
populate_function() can always call sdca_parse_function() if it
wants too.

Thanks,
Charles
