Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855CB286D5E;
	Sat, 10 Oct 2026 03:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791602048; cv=fail; b=FilBQ0h1bzLx3DUuTaQTQkqnDUF6iEIySvZLj6l+esSzn1dRP040rDZuc7dIdE9K2PQD9VJ3GeMRVOQUGcO/rPQXF/l2bExFfYe4DuGGdqG2HCPRO9T2EEDA/uGa9npaZoiN5Xfff0GKefCzXjBLuYUFdfZ9JYtngIykfF+hGFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791602048; c=relaxed/simple;
	bh=+rVNRP7nVTHx4SL/Xo7VSZLQB7OWT3rYO6i6hZPDGkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eIhis0WHqnGqYPxzFpUOEg0o9CUcl4VBg210auRwvO9YwDHxanalnE+z0P7nmGczKDCv3LQIVEn0INdl9T7Fc+dnscA2mOy7X8fpvYqN/whtUCjLP/9+GFMjM8vOji2Qb68KintvL8feXtFdfV2BWJT6GH4/60gYCJVX5j59VEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=CO7ADsHi; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=oY9oAnAD; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="CO7ADsHi";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="oY9oAnAD"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A2gs4q074061;
	Fri, 9 Oct 2026 22:13:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=+lPfn7oigMgMYIJCDZCStbX+O4hBMhurlxogPiipR
	4I=; b=CO7ADsHiLrJU/tIwL5ZZHt3NfV8mul2z14bvLibwIU1Ff3l2TfSyPImQc
	71yDc7KHfHcanLtzZic9O+pmRmcoyxwb7KwvTFgBoDyqNZ0bvaEqFVkwhaMu7tMH
	MVkPNyUyhKJrrYT7+8QjX/HRbeC277Vwp4csutZrpzbQ9TR9V5+kP0dXHIQQOH3O
	ypmMHEZrIPf6VH7jbjISTipB4Z/Lxcc0Lwx1aSBCPp+UtQK0I0U6TnnthqONNmfn
	4Sn1VJSR/YHUmqRL1aZ6SPzBdhyn2TFbIzB40LTSdWPXoFHWY2Yj8d/Vp7IBkF+C
	4xddfXsCoul8NRbzocSH9zXM4DGDg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012017.outbound.protection.outlook.com [52.101.53.17])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h74uj2d13-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Oct 2026 22:13:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMigUVL/LGLzEqINnUnis/ZxIAk/12/QPIoMjBKvzY8PZew7jPSYx24AmRNogxfF6l+mBN7VM7Ep1wHoICUHPPmjMUCl3lAx9DfQqrfzr26Wj+vlg5YsBP5taLF9nt4afKLp/AofG9hRF46Le9iBIgPZEZHS/lHCW5dRHOWcgXl8MXL1Z3MrohuWte5OT9SfLarY6+zn+cyVjTR2JfKU4/A7RNKUTCt8UaFDkaUo6VqWrzXRs1LDLYkIZETRGHyh48+BzbT6+DvwQgUNjkzS3eRtX/vNdF9MimkeJ0MZqCQU8AZE7ni9OqmvtfOOnxIfP5HMcs0FBXd/ITvW0I1aIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lPfn7oigMgMYIJCDZCStbX+O4hBMhurlxogPiipR4I=;
 b=h97Kj1wIGhS5Sy35Rj8e9s+WJRV6DEBsvFmrndStDjNvwDofeVw3uqm8MZhsOp4ULHR226n3+0xoaPGZC1Zc1ARVwCp35Phcrzh+FxoO02hlqTzBW1/Em5ekshTdsjLQ/5Ge69u5GoQFqGidISUxse8A0UwKDabnE4I9q/fevL7OSfFmItxztUDVbLrNnsZmhULZNMBZxTpYP1qLCQVqzIzgEIQzK0200mhtoofvePB/u4rt6CRtG3xa31f4tYCuElIclh+LsmBZUZFoRPAanmykHgRD9LppmNpJSaODxkilxhy1oTmtTjw0l/+9vcFbPZhuYWXOyPrQlAmXodWEGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lPfn7oigMgMYIJCDZCStbX+O4hBMhurlxogPiipR4I=;
 b=oY9oAnADjxBN9V2wFsd95wszACLdVPhGobyZF6/qaEd46SYqZtXOMnBfRegYkmlYeJKyczQkt4X+sg2DzAzkOkpQ48BVxFi8laTSt7mUzg1dJ18SQ+y9J7HCcBZcO2uVr5IJ9Wgfm+YCNeQ1Z5WyTCbrXqhN1rd5RN7HwbPdLgI=
Received: from DSZP220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::9) by
 IA6PR10MB813812.namprd10.prod.outlook.com (2603:10b6:208:5e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.5; Sat, 10 Oct
 2026 03:13:53 +0000
Received: from DM3PEPF000265BF.namprd03.prod.outlook.com
 (2603:10b6:5:280:cafe::64) by DSZP220CA0008.outlook.office365.com
 (2603:10b6:5:280::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Sat, 10
 Oct 2026 03:13:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DM3PEPF000265BF.mail.protection.outlook.com (10.167.23.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 10 Oct 2026 03:13:52 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 9 Oct
 2026 22:13:35 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 9 Oct
 2026 22:13:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 9 Oct 2026 22:13:35 -0500
Received: from [10.250.144.147] ([10.250.144.147])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69A3DTEZ2329897;
	Fri, 9 Oct 2026 22:13:32 -0500
Message-ID: <fe9c1452-5f64-467b-b183-bd1c8bf39e30@ti.com>
Date: Fri, 9 Oct 2026 22:13:28 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] ASoC: codec: pcm1681: Enable the PCM1681 supplies
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
 <20261009-nord-asoc-driver-support-v3-v3-5-0c1897f21ccf@oss.qualcomm.com>
Content-Language: en-US
From: "Wang, Sen" <sen@ti.com>
In-Reply-To: <20261009-nord-asoc-driver-support-v3-v3-5-0c1897f21ccf@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265BF:EE_|IA6PR10MB813812:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ea4dec6-a039-4b52-eb99-08df267c830c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|23010399003|82310400026|1800799024|921020|4143699003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VSOOumPypS14c6Aa35uwf/SWplzattJ+sxn9ZrE9Z5YmY7H6FgMbyb2MJJ8zQ8F3q7Jp6teK7Qi7g8LQOd/pQ4XjtOpkEQdhOA7nryPTUb4zbDrTfbg+hl/OQ2zZBV3rkWGk0KIS2lr2t/hR+r8zGWieslAd/rJIIIRCEZpKeeWMo8kf5RnGdJz4jS085IXDDGhLTs4Xfy1eZfowr6aB5ERRcQNgM0B/GH7vgZuftWps8KAKZRneXvf+LBr/RGOEHMFucY4QqD8aV4/gzEblCZW/xN7+nF+1EfAWp1on6AUUpbecIIkEnFc6YHagjIdOfKD4byKM/JWerlKk5o6+lVAjp1iL1kfFxjd3LwBVhDx0L5Ix7rMe0g8/vEJ1brMOA6ktyggeatJfrD4yNJbZuKyJEQENcCPgNWOmPyI9824NwT259v0/BTP057AxZcqb6OkVkTTDt9xNa5HcWbArw7QS6QYqohyONbF/BX7mOG/TuuNZ/rzN+Yu+24upgXLDmtD6RvSSZXEadJnlTl3haiUXm1/1/dKzrHjELoPzGrTh0ChiEWxU+EA1l18DBTLHOpZi6ksGi2iUVAo8HG1QpmqXkCwGgoiamsm8mf+sg2kWS/6VHdJP7/vN3m0YcZmPcpxZIgPC2/zlvdu7hRJRi1pPfBrS8oswRv8svGCCeyGTV9HxBb12ifaksfqG6B+Zmak1biLpK63fL4QjgEoZdDnVkwJNknonaOftAHzWbajeK3Sx8BugSYxNAvEBzWgq
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(23010399003)(82310400026)(1800799024)(921020)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qQN2rIe8KmfNJOCYouYiLjtoC6a40ORjIJwP/zsLpBsjX8QfA57iA1FJcBBSkEqNkQtTg1tYM7w8j6RO6iX0q5XESpBhdXm1A7g+GKQWC0Y7s/z2NUrnCt/jWtzFnsfz8sb1dHbW+puDYZj36mysX+3I2n9TAs22GbAxjRyraK5sxGFV7Awydl6pBsM2tRfWxZlIUnPd3CmaCdq21qappKFnnHy5QY9oiv4q9Zp+vKvwWtZ0RWLYB4JJEWTGkkvxmLqKsi7I8NO+lYNclcnzv5TkV8xkNWEG8owq6MAhLUwXuh9KHW8RCGTjcZRyqo9TOBQFGC40SXG40QeF0leqTVzJUy7arlaWDRQjW8SWZ8IvUVWqtOzCdGGi407VMM0iKAq6v6DiZsbjAiUYvZYJ6mgu062UfKVuSXZtYvBDhOUlr2vqs7Ge+QFjHx3LKboD
X-Exchange-RoutingPolicyChecked:
	HIgGWgBP5sAi6v/P1DSMxk4p5C3g2ZaTTVVbdLvvtYYnFsAHqvIwWluPr5dR3ryoxnRrycMgGyPbR0fcUhhkTAvpzZKhZEpIcH8r8y6Hq1Plx/R8aacKc3dFBZspS+oqLNGIh3vmG1lc1tI505YJBKro52ee9mybyhwFToW+qzwQY2jt5VCvWSieBL8xB8B0nyYD+X0edAQhN9oygOznl7nLtKAQNhyq0AqgV8nBadbAe0CyLloRjCjbkxM1LHP2JHPY0/xCy5gpdTbRqGADYwv9kUuMH9j5HtuvPUXLo/0dQimWlHwIHYPtMFd5x8Eqv5L/r3xVV9PRCibgKbUXcw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 03:13:52.5370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea4dec6-a039-4b52-eb99-08df267c830c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265BF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB813812
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAxMiBTYWx0ZWRfX8JuEf26HsSyV
 HRQIQszG1BTXYaLYA1I72pU7Iu+DUKbusWuxrKkM7hL2PnGUV8HIs6MwZlbloqOGii2yj8ETlYj
 VX/EHoOE60fxE90JCbNWY2ljPyIDXPYYdr1g0v48fzx6P8cPB2iim33u20PCeNcgjPSx6Ez2ftq
 9oxdj6Vth5JlYdWrAM8f8/oZKxha1vlXZ6GDU2i9anR/tVZ+vAMyDq6YhxhqfZuVLTdsQd0eIdF
 clsk8a0XffhgVEPl2KXBkt3nvbipQljXH8Oay8INZv4dCLScN/YC0zkAl8Iek3FFB1muCea7uyh
 hQl5XOmvw9NjyotMtBJqt8ZpNbFx1lErnFd/PtTaRSERKveldOZX+CsTOEV15EjyoCceLZFZph1
 eTWtCvE7Hoq6o2CxOK0w81vx7WCcNuvKlnoP8BFUUqhSqDifQY0s+l9Zfbg18hT/1nm24iZKeVC
 p9uLXudefn5krrsmWSw==
X-Proofpoint-ORIG-GUID: WeIKRTaLfCUpaG3M-UIr-oWKn6h9-k-7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAxMiBTYWx0ZWRfX1fW3mog7GAxD
 g/5XfGzTQjmMCns53o/p/iEWCPXyEy8Clgou/0u7JxO881bvftzNl38CBODitiMuBrqQBB2QNBZ
 VDjNPCdWUDxMJS+4RidZJ1DPPXNup3s=
X-Authority-Analysis: v=2.4 cv=B9AsQ+tM c=1 sm=1 tr=0 ts=6ac9ad74 cx=c_pps
 a=8SVoR3TXwnQnu/Z+5+8XkA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8
 a=4bi2fCxGlKlBJFt3H3kA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: WeIKRTaLfCUpaG3M-UIr-oWKn6h9-k-7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100012

On 10/9/2026 8:12 AM, Mohammad Rafi Shaik wrote:
> From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> The driver assumes that the analog and digital supplies of the DAC are
> already up by the time it probes. That only holds when the rails are
> hardwired or left on by the bootloader. Boards which gate them, like
> the Qualcomm Nord RRD and Ride, have no way to get them enabled, and
> the first register access then fails.
> 
> Enable the VCC1, VCC2 and VDD supplies before touching the clock or the
> regmap, so that the DAC is powered whenever the driver is bound. The
> supplies are optional as far as the regulator core is concerned, so
> boards which do not describe them keep working through the dummy
> regulator.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
Reviewed-by: Sen Wang <sen@ti.com>
