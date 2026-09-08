Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96608581257;
	Tue,  8 Sep 2026 19:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894127; cv=fail; b=ZHZiYOAcjIIoTLiZ8ZeGYMZFDgsZq5Y1o5Q4H2Wg7v1KgcbeiEBMSLG7W4za8RXdPDTgxQaKG2krcJehGLBsQYvlme2rTi7Tkk/y0KZnWTKv9L1SWFV+PH31IfI/1QiS8xjDK/H5mspvGdvr9kRjB6SPZMwx7GjytnGj8DsJbYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894127; c=relaxed/simple;
	bh=HDmqotqMveorzE0FTW52Hd0/OeOTCI9/lr5cYPdm0Zk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gun3/SC17KIMeXpUu19Dso7RN5sKkBJQYkX7LPkmLEIfKB1Q1bwA1BTv0A62/Y1j54mB6tkQKyqhpmAQzvncvCrYcSjZG4lCFjErjoB8mPjODdMiR49sq7ERNJb94Szh/X4xu7+mQwJLhXakqEFJT88ftFXehkppP1P7z5wwnQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=dNYVEHVf; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bSMkV+TB; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="dNYVEHVf";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bSMkV+TB"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688HOJQb2220558;
	Tue, 8 Sep 2026 14:02:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=33BSVXk6/RVxmp8XbRA1t+B39pFxzNw/RBdTEltrq
	yQ=; b=dNYVEHVft3jTamf8ZSyb4IUEhswYuP89I0r/Vg6p0p1v/69T5W5XfVLSV
	6pLkYM+h2li3FIQmKYbtcCH4odFkk48tYs0M/st3WcVqgbFWhHm0gtwFMDQg6g7O
	jVNhkohJCQamDUp6dI0ZJCwSaLkl9JlP9OIKzJKbTmxMwzNFAWuEIxTnAI3ka3SY
	x/e0Pin2hCgKOLlJ12ImHFtLAxiy6GdGyJo7zrlkXkR8kNCTLhNvM0v59JGzmeee
	9jRCjufCYimq2khRXdUcjYzn6jUSNuwQ3CXpERi1LhM1STBsxM1pUTCJWA0o+rJ6
	N6Wh5OVrhOiohKgyfcuCOR+XLUMQQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012041.outbound.protection.outlook.com [40.107.209.41])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gj940qc1s-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 14:01:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sg6IfxpF8DZ2cvjeN7gaJLFIGrMCUuvTqcXH7zDLeEUlgkXE2QItU9kGK8YSMJ9NrtueAHies+HeGeu7JZ1QXPX2PoXZUYHv3n+Ouarj5Qg2vDSNWzoeIkmfELlRIi8lPm3tc338uCau0KCkhB3wdepx090RFtFt8Og9NYfL+U6uMFE4dUF+NwAWOnc25wQiDMEO+OYZFoRaYLmxWljxHhIOlGETa63KUUHq4YVfHqsLCsfm7357yugB9qojjVUX67tiYadkMxF0Lz6fYUuAwQfjpNO3686RSGrPsti5TP/YlBnxIaW19K8UKLzzAxCqwT5y8R7NDbA8T5gQ7/NO0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33BSVXk6/RVxmp8XbRA1t+B39pFxzNw/RBdTEltrqyQ=;
 b=bOHtY9a5n4yuOSLoeBRAkowh/Yq0NMFaUbREEm7NSt2T7w1CaG3cruI0UZxSdJ6euaGj17IndREazBi9IKe6PXz6b8GpZM8d2uZiH+ZdXZAFAvrOJ8XKMsdu6G70q2P/Kpv6VRe8sO4t3ssumZqHSdl3moumt+rlty49ny/qKBFt6eNTJmooOAg6Et8IPfh3hGAWO2xGlqPK/pcoY0b4Qc3AfbnbMNpBBmrpQyUFbv2so7m0Uey0WLtMSdnPDv3sJe/MqgfAr3t7xNTUwft+ugCDmB3CZzhJWeviDndkY+ak2TVycpwAzSEzwhceON6yseWsLxHHMbvdn5x/EVOO5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33BSVXk6/RVxmp8XbRA1t+B39pFxzNw/RBdTEltrqyQ=;
 b=bSMkV+TBhIFpoKNOEQCpwifFoLL4k2bJt2h5DlH8+ol1Etqx7yoJf7zpEa8OhDbgEFFoPwX/C+1kkmThmEzPHDgDFSi1SYUNJFogUtFN7n7i7EC9f/Wa5Urok3nWrOX5sz9hCLWcuILx4NaGSReGaiGm/jWCHwUUgV4a7mlu+fg=
Received: from CYXP220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:ee::15)
 by IA3PR10MB8537.namprd10.prod.outlook.com (2603:10b6:208:583::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 19:01:55 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:930:ee:cafe::ab) by CYXP220CA0008.outlook.office365.com
 (2603:10b6:930:ee::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Tue, 8
 Sep 2026 19:01:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 19:01:54 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 14:01:33 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 14:01:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 8 Sep 2026 14:01:33 -0500
Received: from [128.247.81.65] (uda0499903.dhcp.ti.com [128.247.81.65])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 688J1Xvi4006524;
	Tue, 8 Sep 2026 14:01:33 -0500
Message-ID: <27180a0b-fd1e-4304-8aed-8f2dccef2d63@ti.com>
Date: Tue, 8 Sep 2026 14:01:33 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: ti: k3-j784s4-j742s2-evm-common: Set
 ACSPCIe refclk to MAIN_PLL2_HSDIV4 for pcie1
To: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20260828195140.3476062-1-j-mcarthur@ti.com>
 <9ad18c6d-979c-49ad-a96b-c835ea2188f3@ti.com>
Content-Language: en-US
From: Jared McArthur <j-mcarthur@ti.com>
In-Reply-To: <9ad18c6d-979c-49ad-a96b-c835ea2188f3@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|IA3PR10MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: fc2cafb8-8262-4faa-f721-08df0ddba5f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|10067099003|3023799007|22082099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	1D9/jdeFzZ9hy8iUt3USpar2RQjC//Ko05FDEhIRBxWEykYeRLh9rTSa8CtAxV1VOVNPJQVAEYe+KRRU8lSNMG+uyIBkzh2YgiQ/CPNT0sb8fLuFjpbiz6camo9IO1MpKnb7gOpFeqOImbk6q8vAZf3U3flf+H+9lXmCn729nlfUE+GH/jFkDcg85AE87zvaq7xjlgye5oqnyqaIM2N4iuRtph/13YhotcoCTCD/YOeHoCNsBq+2CKg09Bnx2/P0sjtnz1xDRvl1YVLGOW/hHdG4vbUWNsZ6WI3l6nCBQjrebu7Yqq3k414PEJxy07Q5n14VutBV+ZE+TEUr1RgAMrqIdlQ/SOjeahQVgovJ6FziE4lym3KUzGmHY80AioTkR9A65C+nUs4TEOkD6qG37BU4RMGCvTfDZ3DGBu3ZpwSVpinFwr7g7P8wC/TrL8q7o1InQkpdcbOf6G1WBt8BVwf8gHFGCNtmW49MLAcM/S2zyjjN6FBZnblCkpiImexHUQ4oH0qZ9NUtjr7ei06eNv/zPODiTfpNUXk11msidaE9lTcQtbGO2dEg28wfN+ASt+XMwZbnZ2Je3hggM9rawbhuvAJocPVk3hlIZ1wLNBFR4MWUwyAacdidXucQpXAYoBC5MtVhhtqCLHAfuN3jqoAH6Z66C+zjJhoTo/yCV/c=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s7r6zipHNzyLug+oC+b6BNfOVCQtlazP7QDmYCxOqM43UhQ8TBukitkpihsF6LwiRfLT5gNTCRc5NuZVbGdbgKy81Fkh0sZb+prB5x1X3nxAErt5z9hcFwvOgDkL9eO/X8R6YpxcFPA2oCCrImAjigtKMAPcZUqJYkKB79sEh6o/CocOLM1iJ6uu5/1X2XTBQVOcy9MzpgIvytG80GYEkAjrDkDPh2qFkLl47DRRJPj1QUscu9jhjUKdB2eDbbj7r51FQMossjfauY8ZTu70rSIGM0SVMmwzJHCugrcFiIcr87AIk6WUF9XTdKEnd+Wa/nezbUxcdJKEkfyCZburn+KJoorBOf6G/I2saHfgXpz+F21meJydDCqnqoII/07bHmIkvbwi7AuMIgte1fWLbObvsr+lQE7btxIVhMyS8g/TNkvTRjfQFWPeYoiQS085
X-Exchange-RoutingPolicyChecked:
	WiXNKzAerRR2cgmashjGalibwDaeTLqJ+aqDxFqNGlYOX30h95MXL6SUW44v1mt2O9QL+mio43hhaakzCYqYshm1tPErFbo6RCVkoT4TOHLueAnU9ofl1wfY4Kv8Ov5dN+PvKh3MGmOhYc1uuEhnSGQqNlQMSPeXpLMCxWJ6gR6TcYbUgs/zX/M0uf8ZLmTp1IxK5vDkrJItXMcB81HeDbX6QxXqH/gMakZ5WQWIr+u5A3gReIaFPpRAnM+YbEzYCRgsAKa2JGJfOj1K42iY5rjjjUvfv5AQPqxDi67X4mV+DpyXPny59muLIVEr0MyZWbJYpfSB40n24n8G0e1yxg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 19:01:54.2577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc2cafb8-8262-4faa-f721-08df0ddba5f7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8537
X-Proofpoint-ORIG-GUID: _XnwhkD9MElmS0uykIGM2aB3fm56_bTT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDIwNyBTYWx0ZWRfXy+c3zqJde9ei
 eohXjnUYMquQD4a81SInfDXlIA+PXNMmsIdqxPyqr1HsnJqrd9EXaErjuek5b6HvoLuKf49vTi9
 Rb6DTNfXJzcmAHTup/cyDrlllc3Ojs21LYD/1U/XzEvl5lL0vR4wqWMCyJiZ0+3nFBJ9nCTeCb7
 kP3QNORXp6t2YYJGNXUyGV+ukrNJeHW6qL++MP9W6R27Mo0p8vKOTM/Te2bG49YDf/Fvam9rxW7
 PjxRrNCO1LmDPg4SruqpFbUFyOJq/VAC639GDWdIA2SHg7LBydDNwqDPj7PHZ//n8mQUcdWzCjb
 ycBVa5MzSXQlvSI6nKyLE4hVrnu0zJYDKRTZlwG9BbpjdJr1kz8OUPQwshG4iW75Z7K5Fp8fxnL
 A5XHEkw9cWTsR2D/a1qKlfbmf0/xjXllwEodXKzo8DJdgXopsFnzOB2uKvW2JTfthtUF5FoibKI
 p308iPaAqsfAB5IDW/Q==
X-Authority-Analysis: v=2.4 cv=UrNT8ewB c=1 sm=1 tr=0 ts=6aa05ba7 cx=c_pps
 a=hT+s7xQkU6anaY/BUKCaTQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=VwQbUJbxAAAA:8 a=vXi5wjW-Q2-MzzAcjrAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: _XnwhkD9MElmS0uykIGM2aB3fm56_bTT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDIwNyBTYWx0ZWRfX0feLmZuhtV6R
 0cQuZqJpBPihCtB6zLb3RSnHYYF8MLSA9m+nGzQ8xYRtDFJuDNyExVYsCeolxINwePEJVeOUUuA
 EfjGil8FGxI5/2PWm+pkGFYLDETFqac=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080207

On 9/6/26 23:54, Siddharth Vadapalli wrote:
> On 29/08/26 01:21, Jared McArthur wrote:
>> The ACSPCIe buffers provide the PCIe refclk for external
>> devices. The ACSPCIe reference clock is muxable between multiple
>> sources: SERDESx_REF_DER_OUT_CLK, MAIN_PLL2_HSDIV4_CLKOUT, and
>> SERDESx_REF_OUT_CLK [0]. On reset, the refclk is set to the
>> SERDESx_REF_DER_OUT_CLK. In the J742S2 and J784S4, "the SerDes PCIe
>> Reference Clock Output will be temporarily disabled when changing Data
>> Rates to or from 8.0 GT/s in Derived Refclk mode". Some external PCIe
>> devices cannot tolerate the reference clock being disabled and will
>> therefore fail to link.
>>
>> This advisory is described in more detail as: i2242 of the J784S4
>> Silicon Revision 1.0 (Rev. B) document [1].
>>
>> The refclk for devices connected to PCIe1 is provided by the ACSPCIe
>> buffers in the J742S2XH01EVM [2] and J784S4XEVM [3]. Work around
>> the advisory by setting the ACSPCIe reference clock source to
>> MAIN_PLL2_HSDIV4_CLKOUT. Use the TI SCI clock controller to assign the
>> clock's source [4].
>>
>> [0] https://www.ti.com/lit/zip/spruj52
>> [1] https://www.ti.com/lit/er/sprz536b/sprz536b.pdf
>> [2] https://www.ti.com/lit/zip/SPAC001
>> [3] https://www.ti.com/lit/zip/SPRR458
>> [4] https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j784s4/clocks.html
>>
>> Signed-off-by: Jared McArthur <j-mcarthur@ti.com>
> 
> Since this seems to be a 'Fix', adding a 'Fixes tag' and copying 'stable@vger.kernel.org' will get the fix backported to all LTS kernels.
> 
> Rest of the patch however looks good to me.
> 
> Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> 
> Regards,
> Siddharth.
> 

Thank you for the comments. I have added a "Fixes" tag and your "reviewed-by" and sent a v2 with "stable@vger.kernel.org" cc'd.

>> ---
>>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
>> index ff3a85cbc524a..7c085663c8880 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
>> @@ -1206,6 +1206,8 @@ &pcie1_rc {
>>       status = "okay";
>>       clocks = <&k3_clks 333 0>, <&serdes0 CDNS_TORRENT_REFCLK_DRIVER>;
>>       clock-names = "fck", "pcie_refclk";
>> +    assigned-clocks = <&k3_clks 415 0>;
>> +    assigned-clock-parents = <&k3_clks 415 2>;
>>       num-lanes = <2>;
>>       reset-gpios = <&exp1 2 GPIO_ACTIVE_HIGH>;
>>       phys = <&serdes0_pcie1_link>;
> 

-- 
Best,
Jared McArthur

