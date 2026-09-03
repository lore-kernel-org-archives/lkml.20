Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFA144AB77;
	Thu,  3 Sep 2026 11:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434652; cv=fail; b=sWMUlGJIV3aDVSSw+8AfEHQ8wLJ2rTF/C+cdGpODE8mV2SlNOuPxzpGuWB9TfgrLwkN9P/3UPoQwmAGA0CROxD59XF/6YTdOO1msMOa2o+owN9Krn2abk/+lAtcs+GnigZaebBRjN9ZN0wG2VUrS42SGGd9i2IbqWodPxinHU38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434652; c=relaxed/simple;
	bh=6wfIxcuK2sGF+I4NwNKc3Ty6QSQ/JakBEiqJsgYQ50c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=I0rn2PyH0eG7F7iBpOwBFAsLKWxzqbC/0XKL6CUgzq6ue6Zt0zhsI88f2hciZZgTaAYXLu1Cagnatxg2+8HWem+RMQMpZUNc1NRs3hUaiuhfBppdMVPD1DOe5tqwidQf+TGTuM5OTIkdmx94AuIdQ1d0nNtThFWmVVZ7XSGk9hE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=aBgptqOz; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Bssn6b/S; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="aBgptqOz";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Bssn6b/S"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 683AGZ5i677987;
	Thu, 3 Sep 2026 06:24:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=0zbJPufInnKC2HzAN5qadUn2ZN55mzIBJGZC35ESp
	9s=; b=aBgptqOzU1M42QikqUuEsPaDri+mMnSZHKZsS39xdk2rlIdNlVXlPend6
	AlNSEaLIcHI36u58X4G0qWb48kwLqd5Yi3RdIlWCaYRK2q7A6j3h6s/d7bnVBhJ5
	nNbvjldQFgbc/Nble1liAeos7UAl9m5mbZE109Ai3l8uC9FByMa0hBac3rov7h8E
	/XP47PQceuxsDlJ4aYDw+x7DO3Pncmp2Q7RdTlyycNs1RbBI8XiPPAqlHFapgbwn
	JK6G0MFg/d/SN3D9ZwCSogQCx8ZZvt3ci2hY89hVKi/UhgFXsfGpNNuXqBio/aWB
	Bv0+E1D8y8fhRi1bo+npoNjsaOi/Q==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012060.outbound.protection.outlook.com [52.101.53.60])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gewt8k9wd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 06:24:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2ucqlApmPqf9OZl/hAxjNFW1irNadKaw7P043QN6Ql5RVWfF7mlbzuoaQbgDV4WNJLlRSOwr7o8mm1HJnvtaL3+VxI0BVX8LYaNnQWn3jLf95/+qil5IC6kJmz6pUljv97nVwAPwr7lzZu4cpa58Zikxita0kNGcejuQ/yjNicVXv2BNndnHP2XXfG18Xegm54FEBL9pr0eui/vlcEiiB5XAhz+A9MLXOuQ0/0Fni89J+9mN+oP7azfSir3tySCgRLY7T8GXMrObBzUfgOiSPLFBG01qytLbyuQ2xAA8Uo/drkREJAvjdUH7uxj9Db6Uto3g/WWJg8Fj3kZ2CSiag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zbJPufInnKC2HzAN5qadUn2ZN55mzIBJGZC35ESp9s=;
 b=oYiiPV9dFSZGX7daa84VP5NT60JcnekroUEpiEBNh9yXwwqgmvnATWAAjQ1uBMkMXoaZ+VBFisr4VLmkhudROiOX43IigGRjcTo6I+vbNxnS3tUpP6hOgkRBz3z9ROl0XSL+Qiu/MKjxrh4OJZjOZEgZdLJPLTSK/xIP3kiW+dErTUgkby0co01xGciFZNpMy7vvtGNuk2rWFPLkg+Gv+hUxHGhhwivS68Uz8Xo2vK+r+XeuAJFSiS6kDbNDEJGi1B/BhVwdHaiAGUSRuCSp7Ywt9zH5dYRd1S8JW2j/dEpbtvAW2YSsfbyRANJ5ugq9nfkzbnmIPhvBb0bRwTsElQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zbJPufInnKC2HzAN5qadUn2ZN55mzIBJGZC35ESp9s=;
 b=Bssn6b/SuxVkRyOIm/YyY1ldou0t1zwknakk+504pa6uUOcEeCH/zg4MbMXGG0kpT2ls0M0w94P1II6Rgdz0/1iVPNvmMnNDdUqbL3VJb2EtGlH0usuMieRq60nfbVDyVgdM8XKHjxmOi41skJkfvNhJDim7HWGqJ4XCgldUT3Q=
Received: from DS7PR05CA0099.namprd05.prod.outlook.com (2603:10b6:8:56::20) by
 BL3PR10MB6115.namprd10.prod.outlook.com (2603:10b6:208:3ba::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 11:23:57 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:8:56:cafe::1c) by DS7PR05CA0099.outlook.office365.com
 (2603:10b6:8:56::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.3 via Frontend Transport; Thu, 3
 Sep 2026 11:23:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 11:23:57 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 06:23:56 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 06:23:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 06:23:56 -0500
Received: from [10.24.51.219] (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 683BNr1Y1441331;
	Thu, 3 Sep 2026 06:23:54 -0500
Message-ID: <b8ec52eb-2bbd-4e8f-92c3-39625b6f4ee9@ti.com>
Date: Thu, 3 Sep 2026 16:53:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Support RAW12 bayer formats
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <mripard@kernel.org>, <jai.luthra@linux.dev>,
        <sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <r-donadkar@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20260625151756.221096-1-y-abhilashchandra@ti.com>
Content-Language: en-US
In-Reply-To: <20260625151756.221096-1-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|BL3PR10MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: 794c3a00-6897-411c-0c07-08df09add83e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|13003099007|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	u0YsrfYUNdVflOHMmpkICC7blfjgC1pHumjyteGQ8qfLpKaBjke4UrdUOYc0vKVuBo5fccXxk6DMTjvXfZmIiaiKvgwPy0nixJZA+aVh8kC6iJxSGP95fg4gTiWCgZPR8BDY2xB4yKn124oJSzoyehDHFKT9P0mfe6hlLNf/cvRiLZIDnHyn7MdLVoDcXx3qJbq9PqME9BoLc8RqxxWnEZrpWp3nHG0ba3pB863fXYaxaiv9S/t/6G0kk6D+ol0wPB2XHNKT0IdHRzHshTkwS0kfFNivz6ao4YR7Suamb2YWmUNCqHKMsf8YTjhNryDP2zHa3SEhIgfpeyHbDcEVL08eKg0WoMpkdpgZlyy2ALNB8Owy3Jtt4jB9x8sNQVP5mBpzi6f98IoZLxVHftpOlxDi3z7AcnLPKZkHQEDJDZaYIZX9XM9xM78LC+fPm5H+vMJjL74ZS1FHp7OkoGQI9DiQiLJn4s1Fhqy5jBtiNoQN4vbU7F3YuT3va7KKVaRuGxjrvGdQNAq2zLYG6W9ayLXIvu1l265PIOrYp3qqYwgi2qLqABV59P2Dw9yUJC9dRO+i3CqpBqc5PkQlU12JD4b1+lPLjYmzy/vkby5xUYXuZmyCaXkVYcDcQqEgnRqeLjDZkhbbyQj5eupo5sh5S5pl27chnRL/8H9UMZXVZBl7W9hy1GngJExUFri5PBNJkoQf7Y7rKDh1po+mQ+SGtw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(13003099007)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zJ+vZsSCYE1drMhNWGW9R50o2cJRp+RpwfhBZFurNx3Uoe63uDNQj/dYIf04gGaA/ymuNr+ab0XgmSvL/CltVFzHD+hqyP0GeJ423RLzSD32y9ZL2Ki9wcomjSj/+9ysdrCwwYjcJtlIvg6ZvLLbY5pQU8Z25FozQiMxdalSLrnon89tH8hrj8kjJGHsreBTUUtKRgMbguOj9um1fuF8YpyrTpUv9Fezi77HTMzG8kewfzK8P/GDhK5VgF0yxg5xTee7QCCwlTmUqLPuYa9nEKoBFeGiLAIy03AwzTIAbAfsfoV5USfQJUVaik3Jlvn1XpO2sJmz++Vmhr/8eXuPCawnn9/VQN/7Yd3klSv+C9IG7KaQXfQS0KF2/lukIRpWWx3iOW+QLKyKNO8SZI6VxHPIKTUzkgRfc3GzPWxXA7U5OFQSL6tkkqtBFeNq83Jn
X-Exchange-RoutingPolicyChecked:
	giCHVokkV8CXOXWCspzfZSRrGCamky7ZI4GUxueYYbfppA0CEf2Q1wIwBdBxJBRYokceQqJOacqO4pknHxGMU5dhLOW5mX0tySdOavWunDrxt/lac5PiR4nCHgr4tX2kF5a8iTPw1e0Pp2IMS9PiW8d5upDQAm6Y49u6MkWaO7TE71QtYGOXKwnMxwLZLUzQXs3o4U8mS/cS9Nmouv/7Pj5nfMlo9yLsoESZkfOdLtxfuKeKq3Gpce5qqzxVRmZbaLtw0nunOEkTKJt5PzJWw7PsV5vDQdU2o7lX1Ej6wWl9AqFBtdzFcwJPwYK8JcEp1s6uz8bmvkc948s1pT60fw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 11:23:57.0814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 794c3a00-6897-411c-0c07-08df09add83e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6115
X-Authority-Analysis: v=2.4 cv=de+wG3Xe c=1 sm=1 tr=0 ts=6a9958d2 cx=c_pps
 a=yaJUXpcFNTkE3gTvo4ZtIQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=NEAV23lmAAAA:8
 a=RJaHbvJJA5o1k_-59LkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: qVT_YS5GJGhVg9SrUC-jWl-bvmyqy6EM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5OSBTYWx0ZWRfXyStKFrOGNIil
 tbZiD9AgIQvOzeEpV7lYyeDYSaor86jWdeDWNZUN1a/CTN4woDbrHAgmIoRpsCg5Lpw3QVN++XQ
 UauEBecjxVTZBinFkBIGR8/QI7JcSAE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5OSBTYWx0ZWRfX62t22CSRI+7p
 GNA7UXMJvSPwiqS9VselfJhR0IyjhImJoUGaQukoOI5+4n06T0aL2xNNVo5hZOMrKUmIbJTGqNB
 Rm4KCaMYkYKLU3V0SoIX84fAISteFXpOUXPNRVeqhGgW9p6B0YzLdCreGGGo0L9/yTmLu/8+R+S
 Ae+xdtByLdD1fb8TyBB74fdGMf4MeNpATWLaJDfVPpq/JZbGIM/CWn7YhpL+zu+mVjC30rw4/0T
 9sfzz3Xil+MmBzogzwCy3bASmXLHYoAA/K+1Jp3OJPDUh4kbNV53nWvPhYZhcIeOEwx7bsYspPP
 YjaamPHNdkwmHAxXVeEEqWP/riQM1oz3G0teW6aVoAH1OOA7Q9TBpwSbVqyrVO82NzWc8ufDVMH
 hFi5RdoNKnf3ZTIbrgsbNVmkMBrvv8hn0nP3wxGL14g97+B98asr4/uuu1eJWHJIu8Q70Nbt8AW
 HfPN02YQrigqzL1f1NQ==
X-Proofpoint-GUID: qVT_YS5GJGhVg9SrUC-jWl-bvmyqy6EM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030099

Hi Sakari,

On 25/06/26 20:47, Yemike Abhilash Chandra wrote:
> Hi,
> 
> This small series adds support for RAW12 bayer formats in the j721e-csi2rx
> and cdns-csi2rx.
> 
> Testing details: Tested on j722s-evm with v3link + IMX390 downstream driver
> Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/805ec4662b60ad925e979d55a9515f89
> Testing Branch: https://github.com/Yemike-Abhilash-Chandra/linux/tree/RAW12
> 
> Jai Luthra (2):
>    media: ti: j721e-csi2rx: Support RAW12 bayer formats
>    media: cadence: csi2rx: Support RAW12 bayer formats
> 

May I know if this series is in line to be picked up in this cycle?

Thanks and Regards,
Yemike Abhilash Chandra

>   drivers/media/platform/cadence/cdns-csi2rx.c  |  4 ++++
>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 24 +++++++++++++++++++
>   2 files changed, 28 insertions(+)
> 

