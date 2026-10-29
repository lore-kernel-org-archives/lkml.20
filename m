Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793268563;
	b=PZzhiJgahwOueA+zRVgPvAwS2dN5SRqUQgwGicIl51pcigtDlNOKCM7eIXmVUAM6sR9u
	 eND00WMkLsSn2PHPPh/3dWfs4iRrsZg7oNgWKV2qgl7lBPVKbbHvn+hR9bsuj1tyQO8Lm
	 CjmiRhO60v1ljFp25rFd3uPMFsKdvU0DOV/p7W11puhrZeNVLtPbymBS1Jxq2T8ENwWJS
	 OPP3g+pH89hts2Z5da/Cqxno6S9Pfy5USC4Ljt4H2nU2ceTVbWoZ+SsJ9gmJ5aQbAqQil
	 p9pMIQ1XgBRD/Ii7s6gEf5rVlik2TcP3KlcMgEAKlK8n6uakwwUFKXJ9o9qBEQAoyFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268563;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=KyuIfd4+/d2h8FuaDCuGD4pNWtas/JVLM3EycuWpWC0=;
	b=Lco4FMnzY3zY+IsPYEeEdzFs/Bv7xxkGZkkTaf5T9d/2vIgDPBSxSX/ZxsfdynJzN1lz
	 Aa0y18c9TKB93jVsYA4J6dQaztYLtJ3h2FXi/wZy52fO0BcwVNXiDBScfEcSbzTfkIalu
	 RYAr+k0r/IufGfv6aZn9l2qJSyUEYNUqydHxGikXwm3STfrq75CUxZHAsOTSKvHS2JkqA
	 Mp4cYRIhLgGTQamcAu2iurSHxhOumbJOWgsdUFN1ovovk9IKc/agH2tCHkzVw07Q/2kIh
	 mkp3/wgaKrC/5QCtbKFd9t2ZiLgZBdHx/b0Q5dUn+Y8Mjj71ziJHR+faea3zw5ZdwGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=MYCRSkid;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.69
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010069.outbound.protection.outlook.com [52.101.69.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44CD606A323;
	Thu, 29 Oct 2026 10:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A44CD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=MYCRSkid
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aaF8QE2ommy5D35aL0/ymetV7KnDqzEmpQrLCA06pUIdy9NmBrye79qRr2ViTHPHpLrIkXfLQZifr4nwVaDKUz8vhiGijb6XQNLYBcu8pk/k679eRotq4ADajenM0nWKdOcFAE1Z0OxXOltf7y+EQbzkDZ/m6UQ/JmtGozOPd9WLJuBB6/r9uv9uidG3x7Sraxn95nI9Yz7lQn2gyYiGryFTD5PDO9XyT8jF+QZLXgN7TLCr/edxZyo+9vu2sOC/NxPE15fhAonJmumDQSxciZfMoD27rtr956PVgw5QCgrqf4QsMqpRctzvFmFWtcrmZJUDNJyHcLZFOW/myQgQ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KyuIfd4+/d2h8FuaDCuGD4pNWtas/JVLM3EycuWpWC0=;
 b=A0qF1qoJHoXYLqj+r5nCj7Z0r2AYys0WPamsAhPXorkchWrzXpX7vwaYgQZKC1XAzWWboAmwBDN3q4XEl5BRiB02ZPLtLJIWptt1s9vyf0rp/+/W10uKjEJwOjqWlj16hI6f5PSqq3NkOVRXCd3u/TDHFiOUnIF9tabLHqNC4qx5PMoXIZCEALoNt/0RHXjo6qEM2pHhLC+dYn6qStmR1qPRAoqIGKqLTqWGXRpusPHcVBRqt+bhbpCAqRTCWoN6mra4rAb2LZ5787WYUIKPlDmuZF6v/LXSQEATFeJ1jlptTCB1ASZ0K5G1/MmtAM+JTifzrti1gQEQ9ezGndwPow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyuIfd4+/d2h8FuaDCuGD4pNWtas/JVLM3EycuWpWC0=;
 b=MYCRSkid5qs40B6pLDrDqJeagnKfNPP/+r8v8/CsRyu8lpPMU6s9qBA1+xwaZgJWpaWBqj2oIeATyotO6Qq+X9Up8yBBhVCAdCJAMMwRH0a5CqhnDugBf+tLWC0suFtbsbuvoxVJyOhwkBCUGIQWaVBlcMUHkn1aGQxHEOssVWudziVIyNJ6LnEaJzqgfNUAr1I1zwVS9aVbPiVU+jBvUDRdQVjfpSTRb0640QQDG6dBN7BixFleTaSxhPfSzS9UlW68x4UB7R847sy6EeXOsx36VmyB0PY5wqCG2YvwTJKcOB4mPJ3gJ+DJ79xaRBkKyXZDanM1F6+/g8zYA05XKA==
Received: from AM8P189CA0012.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::17)
 by AM7PR10MB3190.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:10d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 10:09:18 +0000
Received: from CPH1EPF00000522.eurprd05.prod.outlook.com
 (2603:10a6:20b:218:cafe::8e) by AM8P189CA0012.outlook.office365.com
 (2603:10a6:20b:218::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Thu, 29
 Oct 2026 10:09:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 CPH1EPF00000522.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 10:09:17 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 29 Oct
 2026 11:09:42 +0100
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 29 Oct
 2026 11:09:16 +0100
Message-ID: <b8103168-c440-4650-92f1-45eb8f855521@foss.st.com>
Date: Thu, 29 Oct 2026 11:09:25 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: i2c: vd55g1: Mark the AE lock and bias
 controls inactive in manual mode
To: Fernando Rimoli <fernandorimoli11@gmail.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261025154031.27083-1-fernandorimoli11@gmail.com>
 <20261025154031.27083-2-fernandorimoli11@gmail.com>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20261025154031.27083-2-fernandorimoli11@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF00000522:EE_|AM7PR10MB3190:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bbce4e7-537b-4b0a-a884-08df35a4b173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003|261028144727099003|10067099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261009223027099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	GZa/r4K5o0bMpotg3zDSFEbCxzaHMUVOavjtILo4Cxs696tmtrcNGyeR3VWvFxKctCG1wxYtaURkoT63DuKgCFJp//PZPC2acyhxDzau94trYxS2pvKRo650NTpy9LOdUf5I9PXywv90vw0UJrG/tpTRh912OKmLhgSgnNilsFQpRZ7qvpwuAJel7wKweCe3cEO4frRFyQ1zWDZCn4tC4U1eD/rFDP2SPRozibvHZc4chhMHvth6GjbWjaNIh1HQMB23BAgdtqOjKRiJBUHYdv5EJXvFk62VGH2uEd0/rxVEAQN+FEHGmHhuMNsE60QKS/xXQ1ABUUuPSdWSEybKVJpIJ2wuIhFTDwMKb52WzB9QX4rckvFhTGAXREpJImnwkKrCk7bLhS4/jJ9GQNIpOw0VLHZVKC/j3PVKlvw38wVPITG2RvQo2wypwmlMXtnTacGbgOcdOATUgDK8S30mrt7rFaBWEgDkYrXahFEzO92ERxVrLUdqBfXzh+OXr8wCsKvHxt1qbp0xXzPFrQJTz9ifblZOjhRd5Rpu2RV3eRokRnRYz0jQ+AqdF65Tuw/xh2s2Br2XYl2ScJHoYcZG8DIjg+QFojhAt1uqosjnW1WE8ba8QZwVeXH6BZ7MSsrTvarWdrFxXWnuwf/LAlh2bkaWu1ABYZbaqTXLZan4b9iYcrU961a4lAx8fGh8F8iDH+rufYI+txEA/xT1BqVZ6w==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261028144727099003)(10067099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261009223027099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SFBmxSLl+E0JkzEI9F77QSXK93oQLyKOsLZcoQrrwSKvxpEiAlLDSAdU3CICV3OKIU5dM88XQ6BU840Tf99XIOoQRKa+WRWKwlFHqi/CA4i52BTEOwc7PpHlMdG8nq1IcJqGas/ZMRHg3CYXO+FcySgBCwd5X8RnCcHJyjlmjruCXUUJoCQVDCZ3/ZbGtyw27vVj1lDvlts1+gQK/GDCAnXyCtLx9UVqBMuFXO612USbC6t8hHuZOwxZrV0lfw0l17kUg5d+J2SnXOklZINdgiIj4+H7da28YnsotfhC4GYcRKR+60sROJ5tNqsug+YbVznM5PUdr7Nh5ndBSNihFGYwccDRR2852F9Tfr0GepJ38YD3jYRF96Ova9quO3WPjy743UT4U5hS160VUGu/PW9xhL/WPgaWsOeUeoWu9N5JnbrFokq+PbtaTdgQduiL
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 10:09:17.6906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbce4e7-537b-4b0a-a884-08df35a4b173
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF00000522.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3190

Hi Fernando,

Thank you, both patches LGTM.

Le 25/10/2026 à 16:40, Fernando Rimoli a écrit :
> In manual exposure mode the auto exposure lock and bias controls have
> no effect, and the driver marks them grabbed. The grabbed flag means a
> control is temporarily locked, for instance while streaming, so
> v4l2-compliance fails on it while the sensor is idle:
> 
>   fail: v4l2-test-controls.cpp(134): GRABBED flag set
>   test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL
>   test VIDIOC_QUERYCTRL: FAIL
> 
> A control that does not apply to the current configuration is what the
> inactive flag is for. Use v4l2_ctrl_activate() instead.
> 
> Setting the controls in manual mode now stores the value rather than
> returning -EBUSY. That has no effect on the sensor:
> vd55g1_lock_exposure() writes only in auto mode, and the bias sets the
> auto exposure target, which the sensor uses only once auto exposure
> resumes.
> 
> Fixes: e56616d7b23c ("media: i2c: Add driver for ST VD55G1 camera sensor")

If you add a Fixes tag you also need to CC stable ;)

The driver should have passed v4l2-compliance at the time I submitted it
so I think it's better to drop the Fixes tags from both your patches
instead of CCing stable. I see them as improvement rather than fixes.

> Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
> ---
>  drivers/media/i2c/vd55g1.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index e3939bb..69ffb3a 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c
> @@ -1503,8 +1503,8 @@ static int vd55g1_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	case V4L2_CID_EXPOSURE_AUTO:
>  		is_auto = (ctrl->val == V4L2_EXPOSURE_AUTO);
> -		__v4l2_ctrl_grab(sensor->ae_lock_ctrl, !is_auto);
> -		__v4l2_ctrl_grab(sensor->ae_bias_ctrl, !is_auto);
> +		v4l2_ctrl_activate(sensor->ae_lock_ctrl, is_auto);
> +		v4l2_ctrl_activate(sensor->ae_bias_ctrl, is_auto);
>  		break;
>  	case V4L2_CID_HDR_SENSOR_MODE:
>  		/* Discriminate if the userspace changed the control value */

-- 
Regards,
Benjamin

