Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9204F38B157;
	Sat, 10 Oct 2026 03:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791601972; cv=fail; b=EJ9giwOhezNQF+8MayALCRo1+2Mdk3EjvxZ5XhasQwjABq2RXRt/GKnmCPEpeQz3hhUjFqkoWvgVnYp8qVhGHfGLe3Uo6WfPJo8ff7IliV5hMfyIANIRg8hveB6ArmNUObMjW0HhrkQ5xS4pJAya5tSs9n2r64Lo45cGIGLqIbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791601972; c=relaxed/simple;
	bh=ttS9Un/BTdMlB6iEaOI/pl2GVRHI2H1upq6rpNFUfKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gIKbEVseFo7+rng+lO3rDAI7PMw5FPBKYNPIEWpLYkXkOtaTbWYWhsiu6g7EeImJIjKRtpuDkuCo9U8932ZXkiJT2Mpbn9+QByDZUtnlT7+pYjOL6jC0jaMJ8RzQUSQcOhYo5IWXRzr4KogfcBsd/rCzOl5OLMjmDolqePWt+gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=f6nOyI1J; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=bV7IoXqy; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="f6nOyI1J";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="bV7IoXqy"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A2gltA073952;
	Fri, 9 Oct 2026 22:12:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=+/biYimO1IFU5r4BeCKg685N0GBCwGxd9YXaEp1iL
	4U=; b=f6nOyI1JASqeDorVQ+Agu2F8c2uEoMx2I5M6VqNqKfp99FWqz0BoCM1BS
	1ojkmeLIEua2FTa+dolNSnCHRtmqw564qw19VlK03Z1hTSNg7dmjuhtolW/8iDYn
	iABDl3Syd503nWKHRkyFupm/dtdVQMBiLzdnNyQYwRSB7Mgfiu9GgxeSxvdNs2tc
	oA59o1oOKlBT8eRnCmmi4d9l8Xwrlu9V6dHdN4YejCOgS/azDaOoKB6gVT1E/uFq
	1jnjBP8NKTdI4G8sTkMpgMXtBqSmO+USTdkrYIujWdS3tE26baPGv1LFV0ci/pqf
	mj/1ipel9YMpycA82akvLKlQsnyzg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010020.outbound.protection.outlook.com [52.101.46.20])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h74uj2cv1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Oct 2026 22:12:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMhkQmC94fsN2lZuuNTEMEyqOj0qmef6hhqaCdPc5esxE1WtxygDOpIcmzBtAkfPq/IsDhN6NeHo2ja/mbW38iuhgN9yjUDCU0IzLIkNsX3ocVrDNzmE7qOfTNszp3MDmAa45jm7kaBaMgQ6OhCDh6OAHG7nWSnXJZNBvMLhTrFurOQPHP2jDPrk/TeoE8d+43MYTMVsUiinWfpUgkfW8zEycXV0CnlCayoXSVCQNGGTqNNZPeIBzyhgyyrIO44sDGatBlzzIAPKs9SWekaUMb4yXIu8a8deA1uql6Dj+pDCwCEbId7uiFbOoj79J+j859jw3KsHHsC2diFNenDXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/biYimO1IFU5r4BeCKg685N0GBCwGxd9YXaEp1iL4U=;
 b=A6FwGB6LdsraHmCsXX2n0q9iRrekCh0Uy7IJuidttIqPEKzwST+C7Kn88Dng8fov0rP0/xGuNSusb09P4ugGXm1EkSZxjxWpQ50dmjWyTy/LXL74WdnJCADXjOSwQSODP3LA3PMr12PoTVXF0PlXD4WAv7yD2c6U8uj+uTtWrlTJOBK6NVVj1J1zrUvL/9o6ZWyXbTZc+oxR7pUSzJgwoTwNLzCL7PIcnVziCySe4GOhiDkmMjx+5cRDaCkBXK9eDN9WCBzxIkz2jMgJuxixQ81Xq7ucOxQLqoqwivM+EHB90PUnP33jTD3qHs5qgWTgpqwsyKBBYmBa2EeCr7f1OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/biYimO1IFU5r4BeCKg685N0GBCwGxd9YXaEp1iL4U=;
 b=bV7IoXqyDnmcdKNfUEc1sPbm8NA3Xd5m+ALaYr7Y4WM3eH17qwS2f/ZnjbQIubIv9K5va+Qzrm9kloIlEQfBZd06BjbsgpY8yC7h9c5TW0ygpSrInQm269lcS9BjmKnXzhE1Oc2KP1kA5mI1H8kYAvjWrk1Uh2QJ7qpbNFVA544=
Received: from BN9PR03CA0206.namprd03.prod.outlook.com (2603:10b6:408:f9::31)
 by BY5PR10MB4243.namprd10.prod.outlook.com (2603:10b6:a03:210::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.7; Sat, 10 Oct
 2026 03:12:36 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:f9:cafe::40) by BN9PR03CA0206.outlook.office365.com
 (2603:10b6:408:f9::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Sat,
 10 Oct 2026 03:12:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 10 Oct 2026 03:12:34 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 9 Oct
 2026 22:12:06 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 9 Oct
 2026 22:12:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 9 Oct 2026 22:12:06 -0500
Received: from [10.250.144.147] ([10.250.144.147])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69A3C2Rt1380652;
	Fri, 9 Oct 2026 22:12:02 -0500
Message-ID: <1c808c2f-64c0-4142-ab83-488672b1079a@ti.com>
Date: Fri, 9 Oct 2026 22:12:01 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] ASoC: codec: pcm1681: Add TDM support
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Shenghao Ding
	<shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu
	<baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown
	<broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla
	<srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
 <20261009-nord-asoc-driver-support-v3-v3-3-0c1897f21ccf@oss.qualcomm.com>
Content-Language: en-US
From: "Wang, Sen" <sen@ti.com>
In-Reply-To: <20261009-nord-asoc-driver-support-v3-v3-3-0c1897f21ccf@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|BY5PR10MB4243:EE_
X-MS-Office365-Filtering-Correlation-Id: 5676a9c5-a773-448a-c053-08df267c5491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|36860700016|1800799024|82310400026|261009223027099003|921020|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	F9C9Z8pTdfXIU+SNs/tvNIWIOJNMoNF0utfAHPZLCRm7pzXEfwjzlyrY0tXJ/q+092Bjhnkr4PqDg4bR+ZAnbudcWroRSrs9p+eLQby717DjMve4ONdcd8Q9OCoI9/olUtA4bONMJYTdXIq/f8U2GQKaJoT96A0KsKDSyAEglTID1FqmCTmfdvsJq52WmvU2MgL7XdiDQ+PTiHnxexIcTwR1FPVB2zuZTS07WwvEtW5kp7OYWORFsP1h4I32ZRIN8BDPrklN930bctXb/D7jToCNtIU6536/JdCglN7jixwrpJmSTZsk+why/Zfz8Wb/vo8sD8J/nxBNWZDJHiXZd0xkbW+DdV1ZSztgAoDB0aHlkMBZb6+snL0azlDpc9NJUz8jgz4y9jBQkcryV4fm9O5sOr84m1/XNb8PXaMNqJyKgYR1JMFHmcB2Hhiv/QGe2ulaTSHsQda+8AEjeSWMN6PfTbE7V4+mCFIWyjYx38L+GKYT5fl2Q+sKzUtkoLFtHT5l5kHdjx9JLAnIpIEcFG+tw86+JSrhWigDdv2rdcADjG/ADNY8hXGwxWQ2E8Oxb+0o7ALFTpqZ7b0oxqmjz6QB+GNcz2KXHfDgOFcRqb1ClSKFl74l7QPGLTSI412MA1HD0xfiQiHONnmrj0n3mEHjLjFj8J1FcljvJTiJVomhUbJWPuOu0t3qwykHvnaUDg6s3CFWKLZSa0LvqPNCy+x2CFnBKCqo2mfJRRnEjCrsKF8DX/m/vH9IMfc77XUw
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(36860700016)(1800799024)(82310400026)(261009223027099003)(921020)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ydtveXwxsMTQ8W+yIfrKbEA7MUsbJgcMCOuB6vTQdfLJhX+laoh+H44jiGnMxS/hKY6Y8kbthJAjhXJtKJYuhq+ldrjwhIt+5seh1M0T1xhA9t5NNkguGWXIJX8d2bTljELSRLajsFFyZmy6NMx5fQPCnR0fjUo1bDcPMp1RiAg5jHSRQ6k7yWffbWpP5dP0nsy+5JPIXhXmDz932X2ohzMCMgbbahLBxrK6/3LxFuKNE0FypQbosQ5xeCJ+a81//gZoAnH5V0e8KT26ypLYfv70NADLkypx43eaci27Z7jxe13iKoHGAcwKw2OUf/bB27cH2Q0LcwnPU1ilT8R4HAnzfBxcF4U+727isaRVQNIYn4YX1pRu97d3v3opyhTTw0BHgmgR/Y8yzKl+aItJRrMtDFeNhrjWU/FfOJH9fUFd+unuZcNs9fNHiXA+GnmE
X-Exchange-RoutingPolicyChecked:
	LnnVoQngULMhXe9wvj0p8CSJ3vcPIiePbbsYXI9Uwcycdu3FYDU9PptZwvXyHGzVAMUHFr5Ju98TM8L1VQt6pNg3peQBhlbdaFOfBPMj5RmUBoVqJyHs9R2hvqvIGRl+SJvTR+KbmLxhJlGkF0XLruO9oj7agOYPJIFESiaNP3W51d5upWny1ExmkH+zcF+iqtKbz08cRAeadYmltaz0Bz12lnmrhexCJCJjKAGwX4NMvNJzBfUxa2cYddQb9XKGEZ4EYRnKsu4jt5NFgSOFBA68w89zFevpLD587sUCK1kfPdxUnkzbty3OlmBY68mh5hInbx3eQeOkZQ7YDpoGMg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 03:12:34.5437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5676a9c5-a773-448a-c053-08df267c5491
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4243
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAxMiBTYWx0ZWRfX+Sxztnq65J8Q
 Zv0lVXNyJf6sBjsEDTKV3PqoMAUi0Kx+vbmhxTAMb0ix574XRvmJzBKQN6jyx7GxFmgEzmv+ajQ
 r/ni0xuM99Cgo2fOv+ZcNLpUWSJTJ5XnF8v4IzMIzedgJwOl40/3xF9U1h2fKmOr2PSyeD96r/L
 OLWq5jXJaM8/Pd9jIntOcy5IkeqPZgQ3p5nKhB5zbfOzqpOkMZb7+NbyJPLV1Tn7t7E6RWT0WOx
 GcYypO1H3xt0o2VKFUSGEBhsHRg8LBRnqAYLtEM3BL4yPQUOkI9r9DBfncWltSvwDA0w3KcHpvP
 RKqatpR3MuDT0tk2Z0EpvHniOeEelCscbl1pfvGEuQ4Mul2fesmDKocQy9D7Inr3fNIlXG559IW
 71XESfY6OyfFEQ19duJ/eYjATZYETw408n+SaBIR3QSWw1WecPa1g2tM4qVtpX0bgEqi58Zob8F
 Nwk+0yvuDP3Mm5af7Lw==
X-Proofpoint-ORIG-GUID: np53E1QTxqCsunKSxaAZB38OdzAMROBz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAxMiBTYWx0ZWRfX0vLgh2uHjM2k
 W1uI4PVrv+T2MEWj5f3nihnRp1Z9TRMfdtmH1HjGffzWrRlynexCyQGFjjTpnNIQUcovXbIPWxJ
 SPjYCu8mMFk4HNVGI7psfFdID/e9lcs=
X-Authority-Analysis: v=2.4 cv=B9AsQ+tM c=1 sm=1 tr=0 ts=6ac9ad27 cx=c_pps
 a=VvAZzv+PhNtEUaR8E1V7rA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8
 a=qotVYiWP7RDpOdZpJmAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: np53E1QTxqCsunKSxaAZB38OdzAMROBz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100012

On 10/9/2026 8:12 AM, Mohammad Rafi Shaik wrote:
> The PCM1681 selects the audio interface format using FMT[3:0] in the
> format register. The driver currently supports only I2S, left-justified,
> and right-justified formats, preventing a machine driver from selecting
> TDM mode.
>   
> Add support for SND_SOC_DAIFMT_DSP_A and program the PCM1681 I2S TDM
> format when it is selected. Also advertise DSP_A in the selectable DAI
> formats.
>   
> While adding TDM support, correct the reset default for the format
> register from 0x06 to 0x05. The current default does not match the
> hardware reset value. Although this has no effect while regmap caching
> is disabled, it could cause the TDM format write to be skipped if
> regmap caching is enabled in the future.
>   
> The existing I2S, left-justified, and right-justified formats remain
> unchanged.
> 
> Assisted-by: LLM
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>   sound/soc/codecs/pcm1681.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
> index a1ccf1edf..3675b2236 100644
> --- a/sound/soc/codecs/pcm1681.c
> +++ b/sound/soc/codecs/pcm1681.c
> @@ -53,7 +53,7 @@ static const struct reg_default pcm1681_reg_defaults[] = {
>   	{ 0x06,	0xff },
>   	{ 0x07,	0x00 },
>   	{ 0x08,	0x00 },
> -	{ 0x09,	0x06 },
> +	{ 0x09,	0x05 },
Let's group this with the patch that has regcache enable instead, otherwise:

Reviewed-by: Sen Wang <sen@ti.com>
