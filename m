Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D1647C11F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093124; cv=fail; b=gF0Q15VZPsbord6EQAoRfPwMwLu0Z0W1OkUMW9eJUD7bB/kRFV9lOoQ17DwVsvQfihUucYjwmJ7V+x7cr5CXow2YsLm5E2FK4UBCOPJqerwgCBnjPhGfBzhnC6lPUmnHfYj1LBL1HUU3LZEdZ8x1TmKkN1vvUgfcPoSnPRa0sWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093124; c=relaxed/simple;
	bh=GUZfBip6MNnYKa2nEx/TtIcidse+4OOa2w8dRSVr5JQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JwFJ2rkRso8c2uLoBLT+Q3CwgVw6MfLhH4bso6r/10CH51KgsRsATSxvS0m0JNIOQrRxKG5I1V/0y9+Z6es+Lkgqro5BP7FphXNlZAUYqCh4dHY1w0N9WjESXp+tPzdmSe+uHiLlWGhB1bnjwKc2zV+yhEigHj43knF1WhKVl3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=gaB4HYg9; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CEM+6WN9; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="gaB4HYg9";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CEM+6WN9"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68MEkFZB3829676;
	Tue, 22 Sep 2026 11:05:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=aDTli+qY8ZTFMrTPalOHhl6Bwh9YLMt/HpYMrKLZJ
	KA=; b=gaB4HYg9YZYDexHEO9+ETti9mt7PUOeUU6+1i060UlEU6pewBUc22O9q8
	5CdApltHGd59csIVVovUqlMP6xT2u+8yKZxuMBRvIB24NSDrrYszi918qbsrvOi8
	0rcpSrwmbDBz6nGTj+1kJQr8EvdZPPqmPHynKiDhYxZbPXkzaVqKqTQWij1Otl0L
	fWT473vUMg3PVgkGMciU1uBOJgKj2As9sOqMyBchsYhHKOHp9X2AaUKLofSjZ3fk
	j4lYsNm5mHYXL35sTrMlVKOgHIx2LI7msKGQ5PCN/7lVDM8hMhMk2JXXb+ji0zsC
	zKP/1ytHlSGMsa5ayR591HL+mrjSw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013041.outbound.protection.outlook.com [40.93.201.41])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gupea2gu9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 11:05:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rryh85OC4mJwJId4ClDdIZznfUEP4cFUIGhNWPbSQMUIIyO4RkFMZBdf5d1TSnvhKV/4nmKqtJcP0JCLle5BMxwug134h05YZOxrkHDpeqbHKLsSRVqeiabD7WpEh7Pm7Wj03/DKzQmFUxJgBxMtignGH0FL4+Z/veTKm9HKeBDMLqhZkBavk+BtbYrsZ8jsBJH5i30Qnv2+RWcLVuPZ601W1jgPrf+XqWmRI1l3Mavc4B7isN5v8u411DQeFxq3KHhk6hXb19a0m7wWpeaWAe9jGQwNtFWzdsO5PQkzu+XNMJEWYo7lGpH4ir4Smgp/idW/k8j/M75g54hmh5QfLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDTli+qY8ZTFMrTPalOHhl6Bwh9YLMt/HpYMrKLZJKA=;
 b=K6r6US6SJZhSNyVCw+pdQ9b7vBgNu68PZxMShylu88O1kXWYlyUH74juJZkmi/EvVUWNqcCNWk2NfPqN0vEm19LP7hSWYPY7nCFd7DF0zzr3mW/yriaP45qVpGuwoS6GbQz1E1JJksqeDXM3C6PQNpxNzQ1mht8WgTQ+q5+C3efG3o4874UxB97ptjM4Q0tXxODbq68sDKADufx34tWanUO3doQ4w0Asn8gZXeqk9Krq/YWY1Jkl0pMl3V/Px3+sNOfrz8vLf1F+r/k/7WP2hghiUHeXu1WawLO0XHG0yfoyljrSBlPj2bv4z1CotTrXqzTTA9iJhXWpVNWp7WA7hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDTli+qY8ZTFMrTPalOHhl6Bwh9YLMt/HpYMrKLZJKA=;
 b=CEM+6WN92K+ds+CUWLTb+u7OydtKrKzJ/DKIkyvWNWx/DGkExGfnZ+sEjiABNpH3KeR0OhlB0e3UMB8VLZSOKiSELTKtU8OZVmIp8l5s3Ez8IEoZHGKkqLsiCJfJ9j7qG1EWez5GpiCIAO3EgLp9DhSlW16ugR7a5E2Sk5XUoIU=
Received: from MW4PR03CA0056.namprd03.prod.outlook.com (2603:10b6:303:8e::31)
 by DM4PR10MB5992.namprd10.prod.outlook.com (2603:10b6:8:af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 16:05:11 +0000
Received: from CO1PEPF00012E63.namprd05.prod.outlook.com
 (2603:10b6:303:8e:cafe::5e) by MW4PR03CA0056.outlook.office365.com
 (2603:10b6:303:8e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Tue,
 22 Sep 2026 16:05:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E63.mail.protection.outlook.com (10.167.249.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 16:05:11 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 11:04:54 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 11:04:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 11:04:54 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MG4oXf1187658;
	Tue, 22 Sep 2026 11:04:51 -0500
Message-ID: <6cf8cc99-c2d2-43cf-bcaa-bd9cfc8679d3@ti.com>
Date: Tue, 22 Sep 2026 21:34:49 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: ti: k3-ringacc: Fix DMA ring initialization
 kernel-doc
To: Karl Mehltretter <kmehltretter@gmail.com>, Nishanth Menon <nm@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC: Grygorii Strashko <grygorii.strashko@ti.com>,
        Peter Ujfalusi
	<peter.ujfalusi@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>
References: <20260919163721.89044-1-kmehltretter@gmail.com>
 <20260919163721.89044-2-kmehltretter@gmail.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260919163721.89044-2-kmehltretter@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E63:EE_|DM4PR10MB5992:EE_
X-MS-Office365-Filtering-Correlation-Id: b6fab8cc-e23a-44c6-90e1-08df18c347c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|6133799003|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hYHZVfLlCqDSyaOnjIciP8tirlOtcMntWGFRZMIx1LyxvM2tmeMVvr6AfucYk+joKA0ztTugXs+pUJbsMihrb22T28LsrzDlxczVX1dIj9Tlu3l9dQ9WY5rggGWsCjECyOgwaVjN36CUADbOZLDK7bubej76TM2Phywn7Cd7+nM3s1S5emYR8KSSGxjY9WEUP6wq6n6ESvDLSgpWkpOlw6i+Z82c2w+x0m6LOC3cgQ8Iu90acbTvc/SMXMyJLKpBxNLTKhyMttl1qi7itxKLGPktL1HJJs8QcUVdp/bNabImOskKk06KJgGDko9pVZcoBcmdVQhReb3+SjVaFPj/CR4yIFdKkXYLOZg98E4/aHUptscq+YOvnaHTmjA89g/nJr+c+Iwhz7b9ffAnXjTTNc1pePnBxXOQ0aMHsUw5+Gx/n3PwWK+VmeNwOEN3DMqmnSFckWf8uMmFjjIf4NWx6G73HFy2ylLgTAQRqhhomE7GyUVQinHxhpzB441zaXzke/NAbGn9W2YTRjMColDewE4kEi1m5ejWPfrbFIE50vbBOincxso3pW6jHFeAnpMXtoRidbjMnE4LpE7xKlBT21ymLK5FhlglvFG6r7gQChdhTsU2lyZahUW3qYwBzCoNlQq6Rt/TDry8Ho/G/E27+KlHEXAXnZX41QaJJ5BP36H0Okffza+wpoABeDTd0uaM0DyRa6I0jK8hHoZMIWAiPQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(6133799003)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JXtW7rUhVUqMzQbSRu+50k/8gL6re36T8JPp+Vzdhoz8C2+gmMwecnsz6o1EzsqVWl0INmUj+RnJpfGU4bKq1bpG5OekNOcE5xKXo/N4txlKBv1MbzbQXZBoqZ8nS2PoO0K4xGaJHUpQFNdjGTVToFYeMJz0hBBlc0N1ouT97Rlb2K3nfpl1LG8M8BoZ7Pzswswd4gvGc5ENOCqMM5dHSPFeDomGFez4xBHGOO3xwMdtSXIFdpXNmseRF3KiUpBRSPv6nHcpHQi4RCgDYMQm8c3akmKFygYoIL2m7LEEP6i3p9HEiHt59fQJ7XCRfbqXys4cxCUek6mqABANDNsT/UbTcq1Q2zL5/mnoopbas9RfWwdXKFv58SRmO2sIkak+cs/ac3FmYzZ4lKPXtIDnlVTc77RkusoB7pG0L0KC7TUveVEPsJKniZPOhnQcIBEv
X-Exchange-RoutingPolicyChecked:
	wRogOVCCgy4/I2BLLfb2pvhjvfx2/gnVuRkgIyeK3t5kIjGThrlxgLcuV+HXprLlV4BR0IcZCDL8uuKuB4TB8Ze1Vb+hXyCsU4iJXtaZ5qckpiC2zspQiXG638K6kV+joqLknEBDGW+3dRjnDGkrWyIM+kpM7/claCI35a+TtSfN//djhpEyD3FmEJvgQs5gQt8FfXM2+HeYTE5kopr/bHWwO/skNGZ9B8EdIUnhkeLAmitXrFcA2ec0mgCyTCHQGz1jiNhbqKWSOfrNxo+R7c5nlAho5X6bSCLMJLl4tg16WVoztozW9CVPztOZ/POGKsyuzke2blNVoa8Dok3s9w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 16:05:11.0097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6fab8cc-e23a-44c6-90e1-08df18c347c1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E63.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5992
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzNSBTYWx0ZWRfX0vvQ17G7JPt8
 7zkOSu/6NxwhE9h2lpKd9R5QdxHfgu7PogtT/ImF0LPgqzoXzXUT6qRUkmFm/OPA2VFRCUwZpee
 H0reKlZX94Fsz5sM5BIbU0ye4CxQVZoOHqvmSo9cuBRjxjzfPS2aWjfEelYc/Ky4/2nuxI1CvQg
 d8THT3qr9q5akyPSAk3grjqZMj1lpVBucEdLw0EQIc31cRN2cjPBwut/FP4in4FEnE5ZuPaInZj
 bgDmIql6viiG6tLcTB+I2aSvOxaW8ycAWEFx0C7u5cjEt2zrGh4SPjQndFr8XskzLdO8DyvhBYX
 7qwp/AHCZHhVYI16EHH2HpGojX8aVQAeUUxf7nMUqoRv9lHuXDHrYbg/kO5HENh/h9zitmbEqVr
 f2kquPlgGIdwxKE9OSfRS44PhnkC3ZKc94INnpYwlhgt0IueVUEIZ2Jf5i9g0N2Xr1KJYYQNeBj
 Wj2EHcgz+qRSMLZV3GA==
X-Proofpoint-ORIG-GUID: ylHzQEJga8LJGkfrIbaynZBkIiEhApp5
X-Proofpoint-GUID: ylHzQEJga8LJGkfrIbaynZBkIiEhApp5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzNSBTYWx0ZWRfX5z0Xjnj6JFSD
 scYesWlL2h2FfXqBXo8UaQRiOLazyoUtX4GkJz1eUgbAHD9E+m79liud2pXuP0WyXb2DIXTEFku
 /QnmDFo8PocQg4FOmHPBT9qfqYoQrME=
X-Authority-Analysis: v=2.4 cv=Mdz5KJ/f c=1 sm=1 tr=0 ts=6ab2a73b cx=c_pps
 a=7YeuQJ2t1o+NR7xo1DCA9A==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=pGLkceISAAAA:8
 a=GccGiEDsLy1DcE1PndIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220235



On 9/19/2026 10:07 PM, Karl Mehltretter wrote:
> The heading for k3_ringacc_init_data repeats struct, so kernel-doc
> cannot match it to the declaration. Its three fields are also missing
> descriptions.
> 
> Use the structure name and describe the firmware handle, device ID,
> and number of ring pairs used during DMA ring initialization.
> 
> Fixes: d782298c6f6b ("soc: ti: k3-ringacc: add AM64 DMA rings support.")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  include/linux/soc/ti/k3-ringacc.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
> index 2de6031b9424..37a333f9a10b 100644
> --- a/include/linux/soc/ti/k3-ringacc.h
> +++ b/include/linux/soc/ti/k3-ringacc.h
> @@ -254,7 +254,10 @@ u32 k3_ringacc_get_tisci_dev_id(struct k3_ring *ring);
>  struct ti_sci_handle;
>  
>  /**
> - * struct struct k3_ringacc_init_data - Initialization data for DMA rings
> + * struct k3_ringacc_init_data - Initialization data for DMA rings
> + * @tisci: TI SCI firmware handle
> + * @tisci_dev_id: TI SCI device ID of the DMA controller
> + * @num_rings: Number of forward/completion ring pairs

Sorry from where you got above definition of num_rings

>   */
>  struct k3_ringacc_init_data {
>  	const struct ti_sci_handle *tisci;

