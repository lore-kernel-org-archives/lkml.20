Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB2D379C39;
	Tue, 29 Sep 2026 16:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699982; cv=fail; b=au4MtMa3SK+lZdEnhmZGEuIDnw/rcXdRSfcZydk/ALO5nxNpSsfpjcHzbhyUTHKey3rdt+TZHu/3vBHgKJCpIrU9oelNeCg/JZ/1jASghgvVRcwEBPnFzkgY9G49dWxcntaCR7QCB549MfLe2VkpQmBDl85VRZryCd1m51qNihE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699982; c=relaxed/simple;
	bh=tPOHpGPVOPZ2DOFZ5/KzhcBfR0jgY1hkBubjM5vVv0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CrQdJRgLNcLXGr3AIV0sPyKx3D+fxbwgxgo1mp/vY6ZGXwpQ1Gkgz6m1NWzb1hzCT1hZu28mhT8PkSGt3xGX5+Ys/6gDVaPXzuRrCvugxxt8reUBlB0Dn5OAbf8+ykw+Wjzb+QM7ab4zs4S78oxr242byvHR/lzei6ka8/uoji4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=qNZdGXjs; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=sZP5Disv; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="qNZdGXjs";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="sZP5Disv"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TGLhHK486829;
	Tue, 29 Sep 2026 11:39:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=fxei8CZ3dccdyHBN3tMYA+zKwwqhGFz7HHMtswEdd
	Ck=; b=qNZdGXjsQ7ImsMVJJK2MDgjA5vzz4q/mcT2GKMK0/+dvQLZtNbSrkv5en
	kK4qbGmbSL5S7jzMqAP0OyNUABFUXqWHI0UBuZQH8LP5ZXX67MU52JR8BZ4fanIB
	VzP+DRUiuHvtUxEKdZXqiQuPPq5V3TKZgMPsGpsszaPWOphJEL85+mDKj0LGgn/O
	XHsc7ySbZqyLuN4FQPwKV40Y4JHLPpzjajz9fVvbFnno3U7ijKmuFlF5ikzC1HEL
	NlJyxPWI6qFjy7dS1nnX+lqjsWh7mYYbXhPOImirmS7LkQcH9criOVHGA0jkkEfN
	wpWa1tWUZMPXd1qCscDRYLsiEEO0g==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010054.outbound.protection.outlook.com [52.101.193.54])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0cpc20qc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 11:39:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ax/aeyEdCd3R98jnrPCiaTXuA4Ecps7U3kUM3wxiPlx/iq0ntdreCDV/YJG32FEza/v5aJdSI6FIP1cX6i7usk8snnDAoThl/NU87NTyofEp5/iCxP8VnnFKcec3Ixz/HZF0TC9YAZZAmyjjiPqQQcljRhdJ62EE3dpZOVknUdeTijQQnnZY0V3RD1qvRvoP3imS9MnPqeQUJQtD44wmuzW+00MoZWurBWDSaYBO0sG5BSB/t2tJOMHNLWZ6gg3GRn64kf1T6n9H4P6Yi7Uf5f4uR3syCBTY6P4wzCZf6QXX+6HPZ9CvKsEbgPDvT2DrqhT7ZxtymxCFc2mvpagbOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxei8CZ3dccdyHBN3tMYA+zKwwqhGFz7HHMtswEddCk=;
 b=NUCgQR6IgH4PqCAGCeKAnmq+DIe/RSJMsUq8LFmj2m9GT1YmbNnsQNBr3n6FHBNyMh1IOAN2DV3Ci3XpJQQbOWf5Fb4kOfmETd4+ZdgWh4cGDQGD2gHbh1bPizY10aqQjNpLn6YqNZR/Ry3TOcF19oCMLTddgBcq1cEd0rhBmfVVgBLjkCR0FXcH1nn0AU02hoU2oB/UGNlWT21n9vIUs+eglh76wjKVMlyD+4m5TopTZQ/C2SlLIgSWk6KGrtp/Po+YH+41IMkg9ZMT72cm1Qx53i9AUiK854MNvnL3LS70DsEVviNlNsMnqp5lw8JuWbT1IK9leQtbrLTUrS2aWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxei8CZ3dccdyHBN3tMYA+zKwwqhGFz7HHMtswEddCk=;
 b=sZP5DisvANBW5BJoSvo2TF/UDFZ/wneOf6zeKPuVTX+2c/Xc6LmOoBpI7B4lgR7xwnHmsep9n0sefL613xUMYFc/FgKsUOFlVEEEjyPlEQcAcyvS/VAjDC0UiDXR7jHpJoCsoxMdbx8qS3ES1U6J4W4M/BEAQoA0WnpqYK9TjhA=
Received: from BLAPR05CA0036.namprd05.prod.outlook.com (2603:10b6:208:335::17)
 by IA6PR10MB612690.namprd10.prod.outlook.com (2603:10b6:208:5e6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 16:38:03 +0000
Received: from BN1PEPF00018547.namprd05.prod.outlook.com
 (2603:10b6:208:335:cafe::7e) by BLAPR05CA0036.outlook.office365.com
 (2603:10b6:208:335::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 16:38:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00018547.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 16:38:01 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 11:37:22 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 11:37:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 11:37:22 -0500
Received: from [10.249.37.61] ([10.249.37.61])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TGbLXi1364286;
	Tue, 29 Sep 2026 11:37:21 -0500
Message-ID: <8cb23b44-027d-4d81-b342-7eaca0248f63@ti.com>
Date: Tue, 29 Sep 2026 11:37:21 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62-mcu: Add power-domains property
 for M4FSS
To: Siddharth Karanam <sid9.karanam@gmail.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260922171942.201947-1-sid9.karanam@gmail.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260922171942.201947-1-sid9.karanam@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018547:EE_|IA6PR10MB612690:EE_
X-MS-Office365-Filtering-Correlation-Id: 04713681-6a21-429a-8d14-08df1e480705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|13003099007|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	AORueN6gSjXg5CNBN+xs5rRUaHLHOiEDvpB78X8N2WWjWT7zSJ1584nGyfY03WQL22gitw3mz72HSrmMAYH54up/EoogalS04vBVCskiLVZzv+KMKIwCYYKhY4WoWnny9kQT5Bq7+1bVMPGt83eiI5KuIS30CsV42LKgOf/HvK7bvj0Rc0jRfKHKLnw+h2a4jaGe73cPJctRyDAYhKYgRa3gJcVIg5n5vJUz6Hu9h3MVkIcPMpO/kI9HfhRPlQIP7jsGkA/EY7LRzKazy849OOxyJf93rOwl21bIXIgLwwPdgJgeLYbwF5657PVX8KQwM5pxqrtOEWEfyzz6IGjn8ek3+2e/aPK4+IyF70IwYOQcelSgGHW/0TCuDYmDZ6HbqWlWbJnflIGZfy5uNlEtdgyh2HkMNgL1Ey3isFswWZKN6YGDlkOfzSCHyydVvDP1/mKiCk+IsaYdDfMYmMn6LPg2pkQ1MY0sDyTQcN0rprSEG0YqJ8ehw/FSlmfd1h2UoA6YIlkHGniVpOqzccfSdrz+/D9FHj9dD+W6W9Ip7Fc1eiK1DZ+ddBkfPZrMspsK/kxp801Ez9hlHEJp3laWSZD8QkBNGaKbkLFRqHJTb5M1aHNtMmfTZUXoBiKX+LfGBXfXLShcWFkasGipG0KkjAKDSlewG4QMRhvUINrbMSw=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(13003099007)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ESlM6SQ2cZ65l/3MoeTgyQt5sTjdzMrYdOkKoWf/l6FgRwp/nUgMAXW1sHA4cKutQJFMoLp4oarZsoYw2G9Rh01VFJbAE5R+lnY/s176AMahfhXmAYWCOCvHN3tv3xKlDqtZ618tzEnBvJADu0I3JVnLUke7AElPheYqx4vAC58h00P3OvSqQYtGNc1DzBt+o8BPSogCJtDqwuE53dGDVJsSFlbo5ymz7zp4JmwGeidPHXaiH+mASg4opmSODC2UCYd5VR1i/SyUiyZhRJIpNpsz9j9kNnhet9GBGagIn8mv/tku9QUVKhBelRLK2aOrHCn/N9b68nDSrTk13Amyo/dK5AO0e8gtvlu8aW7Fs7Tmj2odJFSN0sXz8k9L2YQ4ojvVyPwZtkh6mKYMO6f7rOIN32sV6l3kkfkwjLGlgdoHIOo/bbYzj8TV+oTjrBNc
X-Exchange-RoutingPolicyChecked:
	EmOVnsSfajMKteD5t5frssd86It/JxVSyLH+f1TUfuL/TMbv7Po+JuaBjV7xjeHHKTxR058yFJrW79oBkzP6/DfcChLdSicL6mFGK2Pfv6nzPG33bkaq4II4tqobjrecDnACwQ8sEXH2bKU74x5xQfnYs9rOB5GcYsUHBwgroREsjjGY8tjE8Gh+lJhDQIdPk9zSkMLyO8JK0nmAw+HXtgFofc3fOz2RQ0Au32wGNLWsSjGNVVqHTbX3oO5QmFcbGLSv2zgASz6QhwFRdoVCwr+9GbhqOqN2WP1KiWI961apSQQHWqh4MuM18F6T3LLEYD5e0xIO++f0nd+gkZNtOA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 16:38:01.3025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04713681-6a21-429a-8d14-08df1e480705
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018547.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB612690
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NiBTYWx0ZWRfX6cSbi2QhroGg
 Q1LkpS9kxOsMyWBF61ZFFJOwUyXNLCm0GGVciveRj4WAlk9tA93E1668y9fUrSaCYpyJ0Ieur5K
 E7+5/84D01kovNI8iH0rFaozulikef4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NiBTYWx0ZWRfXw1FoulRDPyJX
 +IgDNnpwNGRt+a4RBt7OLMe9qshWVZW6Js7q6qjPLTt5A63fKh0ymMHiHjsqe4CbXCtwruU/iwg
 2NG0FueRdnOS4h9qxyny+7JyCeWZs/S7tIdfgvskv/KsytX04VVL4wDs1ZWP7gJCtVfw+sZ1Av5
 6bbs5wltEAb889G/6skVbsk63e1VltW2Cc+FOyEW18FFCe3O0ZZ6JBYb4NQHQkfnugTXTAs3ad/
 QPFyy6NsJ7bNXubSFEK4BDZXAQDzOGYBkdoB8OIRzsqiAxHX0waL+SQ8B/bEawfx74kOQTR7w9f
 LN3rxWNZebY/bhgIvf46v/tIoHq+LFxoru3h80K3waOPxtWMEr38hqQMkHYXYi/fYHph5k0PQ7o
 WuBGGiVL9asZSG1U/2oEsIh70wpAQZmID1CMKLnLnNDA7A7qnqWI7JA9UetZ92vrppV+1umVEEj
 zfrPz+B5BvWUovDy2tA==
X-Authority-Analysis: v=2.4 cv=Y4xtIReN c=1 sm=1 tr=0 ts=6abbe9c3 cx=c_pps
 a=Wb2dZV0zRm8mlnqfvkE3cw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=9AdMxfjQAAAA:20 a=pGLkceISAAAA:8
 a=u9wA2xlm4y06cb_9Z7gA:9 a=QEXdDO2ut3YA:10 a=bn7x_FpfJtc3yKQXRW3z:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: XRCWstIk-QKH1iOJqACDT6jfbutx9UIE
X-Proofpoint-ORIG-GUID: XRCWstIk-QKH1iOJqACDT6jfbutx9UIE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290066

On 9/22/26 12:19 PM, Siddharth Karanam wrote:
> Assign the power domain to the MCU M4FSS (Cortex-M4F) node by following
> the device ids info published in TI-SCI public documentation.
> 
> This will be useful in future patches that will attempt at abstracting
> ti_sci_dev_ops's calls such as get_device and put_device via pm_runtime
> calls.
> 
> Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
> index 68e906796aefe..1ae0870893c16 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
> @@ -181,6 +181,7 @@ mcu_m4fss: m4fss@5000000 {
>   		      <0x00 0x5040000 0x00 0x10000>;
>   		reg-names = "iram", "dram";
>   		resets = <&k3_reset 9 1>;
> +		power-domains = <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;

The surrounding M4 subsystem's power domain is 7, but the core's power domain number
is 9 (see below in `ti,sci-dev-id`). Enabling 9 should also enable 7 as it is a
dependency. We probably should have modeled the M4 in DT the way we did the R5[0].
With the core being a subnode of the subsystem. Then 7 goes in subsystem and 9
goes in the core's subnode.

Anyway, the reason we don't use the normal "power-domains", and instead manage
the power using `ti,sci-dev-id`, is because the normal power domain framework
has a nasty habit of unconditionally powering up devices before the driver can
probe. Which in the case of remoteprocs can cause the core to start running
and executing random data. We have to do things in order,

  * Power up subsystem
  * Set reset line for core
  * Power up the core
  * Setup the core (load firmware and set boot address)
  * Release reset line for core to start it running

Andrew

[0] https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi#L178

>   		firmware-name = "am62-mcu-m4f0_0-fw";
>   		ti,sci = <&dmsc>;
>   		ti,sci-dev-id = <9>;

