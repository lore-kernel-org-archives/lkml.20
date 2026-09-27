Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674E823E342;
	Sun, 27 Sep 2026 05:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790485732; cv=fail; b=FX0MneRjOW5T9cGm9MMWkmcTIvDYOrm3Tk20H/ayGVLGqUjf2NWl+GXci114zoJfXRWXb/yuvgRqZh1bLMC+brvzfLFfCEi6Bs9dcweZHkO2UGs6aGV+VKSoCcioamcjzIT9HUz7zTvcIB6Zb6Ke/bJwekEfw39QLw0sw1NkOco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790485732; c=relaxed/simple;
	bh=sC2XOlfZGT/uheMCHZ1BUSRTqABQotXKj+PgmNq3zfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TbjV8rI8ucz8jf2/bLPtnKfdSI7dZHk1otOkHVhfJTjc1ZYv4EPOvp+6/c6/Fi4YTiNjH9CfEiAvbvJT8xuyRpycX6/7//W6LtNAGoPDm40skIAhgMBZRapTlNVByekEUf+hi8fGRmA0kXttCFqZ6GIKZDmLgeFpwdyVISIxDN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=I/RDPxkG; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fZgpLac+; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="I/RDPxkG";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fZgpLac+"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68QH14Ej1205526;
	Sun, 27 Sep 2026 00:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=J6wu/bjgnHInMC0MuxTm+tB5fd96wxkJCd0o8PsPd
	AQ=; b=I/RDPxkG0hz2mmfRuJ+Yt0yT6mjIbKo+vYrAyktn69o3rz+3hjSDTyxVt
	/CH6HgSoSGrBs0pkXB7/4t2wYoYwprR9C0XmMJz7dHbXKUWbIa359WA7ctLFy2EQ
	YwQGNYx331STZL5xDhuOTc+Lvb90a93H8Ea3uLcvEyQpe+w1vDb7Nbe3AeYmgL3I
	2hhS8iEWev71pwMJT24Xa76x/9scNKvyATpEAO/Xv61ifKn5E3Wbe0j6dwQfkGhC
	3T/NH7CVyuw/2CPxwj6ZGQlJ7WYLTlc6fBml8IMzRIuIimuk49j65S4kMKSJC1dU
	wbTnMxer/OZ31SRi+LhIhRhlaCbYg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012070.outbound.protection.outlook.com [40.93.195.70])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gwybrnvey-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 00:08:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HULOOMf410dbpFB4S8d14KYOAYCtqmfiqNEgbCvrA/DRhavGAr7s6IBrnMznKn+AnEiFwf9yFXmI8NE5Bmo/jDG7oAp1JiGNfF/hcyOoSQbwwRophPFNAaFfslvz/YBkyUTRYercbdHEx52Gj1kudYldLIMqTSjOXgriwXNP5EVBZKee59bi6jIql8RYk5756BVcmMtzVf97mH/3Dt8E9gXyYFn6HXT14rM2o+PpDorrm75VrPKwtMxLd//paG8jjP0gRXJAx9/TL6s1C1+VJkE3r8bI8Q6X6yal9vcvd9iQsROkhq9eMqz6aC8FBwJwYDRltZV/HNxzLA+fEF752g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6wu/bjgnHInMC0MuxTm+tB5fd96wxkJCd0o8PsPdAQ=;
 b=jXkSyDIK8IC8CJswwoVFCkI/khyJ3QBacwyQb/Uso18PYLrWxZynxBTm/iB1Jsohcwlq+wqZzsc1vr4kOL26/T9IN9mhbLkO4pjnkNgszuRf3Cje0Z3blzA4oEKhA6BKVZ1heyrCVEDNLhE4xBbCbcD3AzJGoPkr1EINxeBMqFK7m2zNpzbjHryHDhkQyrTCb25Gc2i9zB2T1O1hFEO7eU1tzotnI28X1Dby1lJ+3AWB1LcxWRP3hPvjU9+gZ3f3B+VUtzKsXdezKI9nF81MiXlJsfcLrQM02j8gyYWVjFFZYwyIlJKkYFohSWjns0njYPyE2PGqu73vuYwmbDfVfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6wu/bjgnHInMC0MuxTm+tB5fd96wxkJCd0o8PsPdAQ=;
 b=fZgpLac+4KYvYNVbo+pEDlp5u2RYLMj2pHyUHDfCI7vs05cIy0M8eRSgXsZNOA/BTs4F4PG1dU5JFy//Z/JHGajH56Xd7cZBYnwsL5Um+E4H0WnloTADoHbdOnR/3tJyG5MXe/jsAfOpgWMeAKnfh3oir3Vn33qqyoOZy2XKf44=
Received: from SJ2P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::12)
 by IA6PR10MB997586.namprd10.prod.outlook.com (2603:10b6:208:5db::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Sun, 27 Sep
 2026 05:08:22 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:5da:cafe::59) by SJ2P220CA0001.outlook.office365.com
 (2603:10b6:a03:5da::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Sun,
 27 Sep 2026 05:08:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sun, 27 Sep 2026 05:08:21 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 00:08:13 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 00:08:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 00:08:13 -0500
Received: from [10.24.52.125] (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68R587fq674405;
	Sun, 27 Sep 2026 00:08:07 -0500
Message-ID: <81dbeb60-2531-4a1e-ba04-2add8e819e0a@ti.com>
Date: Sun, 27 Sep 2026 10:38:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/8] media: v4l: Add 10-bit RGBIr formats
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <mripard@kernel.org>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <mirela.rabulea@nxp.com>,
        <laurent.pinchart@ideasonboard.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-3-r-donadkar@ti.com>
 <arfW_sncBRNsyP4L@kekkonen.localdomain>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <arfW_sncBRNsyP4L@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|IA6PR10MB997586:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4e54db-834c-4aa6-747a-08df1c5559f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|7416014|376014|3023799007|4143699003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gEo5WXYSI+lXmcAHa3s/lfNGpE1YZcgyqKdjtSasBOvDdecBh4cTrzvbEC/6A+fSUUlFaqNTMH00594cdjRLuy8bOYixEpFe8PixtmVBgh/ZgBPttVSb8OsnL5uieHuoqAgyamin8e5+mo+2h/aA5Vx/aYoY5HQWYeu8wZBWlcDP5QvsULnwVCTUwv5neL+9cOc68EyBEDxg2g5r2YDlSp83NS/SYUcQlSEbsAeDvvszb1KGDkEbw55nFIBBVXPEu6hhXJF16Oa0YyMk0GKH9Y3awihtXGFNtkHx9/vVFPlZ7zn7D60j9KtZKxbpb7slLo6fVQ5GMFaqmV88NDy/EEf9v8Sr9eFBxRq/Gw6DblfqfAB6Q/AwWAfpD/6fIpcN5tzz87R/Vn0ZrK5F2UIKVbknaPIYpVf7zHrJD4Ho68lgSXgT3Wa3aHzGRnAn2GlPMN3ag7D4lf21j2fC/dn6GpgCKbrkqdDk9df06/ZA4jipw77T05yiEuGROPtRqq12ie8rMAovcqvTUePGcKtpzySpEzpnw7ni5/ZseHxSVCpEAcrpgKM77kkklTNAHuByb5fpuvDo8S1ueZDZ4Qcz22uR1NM6vjXqU/5pcllJPB0YPjkhOONzANmmoqfiO0dxJcIKP2MziBKZJOeAQ54apOLa/Wrye4kd9I9K+Mu+IBrjAJJWsakVRrbddisrTu5ziO14RWLGNLZMCMVhvQUQ1w==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(7416014)(376014)(3023799007)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FKeZ+XLb+75dZuHY5TZn641V2O+RWWrVCoeDuMHUqv3nqoO8KoQNBTN0EKYCGsH8dMptaZexNQhms/WzyWpRR2Ju9Bt5U0n/ZO4j7YPqux37J/6q1X+1eZMYkHXURVp27Nf8PMasIVUPUVLTkNr6VDB359DVmNnwM4DGZf1GQMZaeJIN5dVmZmjb7cKGeCvJSCNskyL28sXKIc4burvMbaUD//0x6Ty0NutwDrGLfTXpKM+eDvlLLOolKx130xYy6w+R/nYbmtA1D/cxatjh7s8oOtIrRvBFoKjCMhk5uPFLwXX62JylY3MzeascL2HFCr0nxMGCH3YnBnZ/YQrvxGGjKkQfXcI9c+5k0HdZjqqco/VgSJYtM8QP6AkdyIKLJPzc5gozryzdeDyCHt8kCShamQCeemrXfoGvBcpimvzJGK350uRSLho9puUU0Xl1
X-Exchange-RoutingPolicyChecked:
	jyB+f3stHrn8fOSKngclE+pb70GU3MU4XxviatBhh6In60pQiMzS2L4oP/WhtGzuQoj8CsEbUF6d0271PBZWlKG83t6McYrAqx/WqGjdagBELRW9bOtLYvfVB/6K7uQVB3CBAzqzoxR3QcE9GNx0nmR4D2MBfo1FhDUgok9gxxbfqoiQKbAS9If61zMoSCTePnCxe0ppNUv4FVoXwPE56e6LZG+d7uJo1vipu7iG+o/at5zFbturRpMylfx2YmKFnkvpty/cxbgkrdWCjlMVzxXxjSnC3bN4MHGyFAeQlPTMFKeqGlCPPvzgxcyTg9X3etXUZUsJh7oPsDhYf37ISg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 05:08:21.5651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4e54db-834c-4aa6-747a-08df1c5559f7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997586
X-Authority-Analysis: v=2.4 cv=PMKaavqC c=1 sm=1 tr=0 ts=6ab8a4c8 cx=c_pps
 a=bGC7MwCPNpf+Sn14ocfQJQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=xq3W2uTSAAAA:8
 a=sozttTNsAAAA:8 a=L9BjFGM3hW5MZg63a2UA:9 a=QEXdDO2ut3YA:10
 a=P5L7wpMTXyg1GfFA3Gwx:22
X-Proofpoint-ORIG-GUID: -IgIlLkoz5obT-bwSYmVbseCbUq1Sjdu
X-Proofpoint-GUID: -IgIlLkoz5obT-bwSYmVbseCbUq1Sjdu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDAyMCBTYWx0ZWRfX0DlND1ZHGvWZ
 wPP7/L97AzlD81TjcVbrv/8Eap+e4UWOGlZrK+6sZ0ux6pPKwZANbqhHIaM4S6fasIg6iOoXrBO
 lYVwlRtdHzyYnVcdLvBN2aX+gzcH9bY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDAyMCBTYWx0ZWRfX1eAhHFqXGBOW
 rQSqDPB+kVGrTxv+8YyRT52fZtH+2kePZM3yGt9YxghFfHYHejVkWpwg8E09eU9U8KVYINQDjYL
 OuZU3MNWHYWaSA/Fbb9bd3BIrLLgryByXx3dcCTbKeJU2ddZDLlQaCWmqoA9BqK/jeS1/FEI8IU
 SiKNOZ6rJdPahJH5i+vLWguCfC7mCwSq5cvbnGbxCS0HxsXCf/GVdXYZrrMzRoY3vtMDtv7q74J
 7ouP4fkDnFKXWau8YBGxNUhjymh5azB53qr6+DyIs216vCev1jkOhiFYb0RNV98mR4dihVL5W1Q
 5/bLou6yPYSQ9oS/lagPqFSwrucumtaNM+DcztWm2nm0i2FP7plw8T7aX3ROIG3VddC895Pg1lN
 HsIuLFqwZPbPUGHOzC7HFrvOlYSrjLqVPWKSJ1WyALfGQ7e0BhF4WLH4uSe/r/BRYuB8z1eqttq
 IXxG6rgprB7GEsxdjJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609270020



On 26/09/26 20:00, Sakari Ailus wrote:
> Hi Rishikesh,
> 
> On Fri, Sep 25, 2026 at 06:59:55PM +0530, Rishikesh Donadkar wrote:
>> From: Jai Luthra <j-luthra@ti.com>
>>
>> Some camera sensors now use an expanded CFA pattern to capture near-IR
>> light along with the visible spectrum (R,G,B). This allows capturing
>> light in both low-light and day-light scenarios using the same sensor.
>>
>> Instead of having a 2x2 repetition of B,G,R like in older bayer formats,
>> here we have a 4x4 repetition of B,G,R,Ir where the number of G pixels
>> are the same, but half the B and R pixels are replaced with Ir. Thus
>> instead of having 4 total phases, we now have 8 total phases or
>> re-arrangements of this pattern.
>>
>> Co-developed-by: Rahul T R <r-ravikumar@ti.com>
>> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> 
> I think we need to use the common raw mbus and pixel formats for the
> patterns that have IR pixels. See
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>.

Sure, I will use the RAW mbus pixel formats.

> 
> That's mostly pending on userspace support now.
> 
> Can the sensor output Bayer pattern as well?

No, the sensor give only gives out RGB+Ir where the CFA is a 4x4 
repetition of B,G,R and Ir.

Rishikesh
> 

