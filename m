Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793354697;
	b=q3PZIgrlEBiDuoue0BrADlML3lZ0sHXd5IEx9AEPcDpaiovv9wikkds3q+fLaqcNVRCL
	 m4Wem0n0dvvrvmqHWhwf1eXP8+UIvAndE+mea0UFccbhm0s3emAwMn6UnAKQPYXxqMsod
	 tga6U6HFnk7WxzArJqJ56vmZrYs92lH6xod+b8xkdXIleW4jfqtT1wsJpLPCxH8ufZ6lI
	 eT4oint0kYOjmaaMGkK8OAJKix8s82nRltNTZWrRLy5A9pBrHd5pOR8a0BP0fGN2Zt7CC
	 DtvGdOHgXwA+vCWogpLViliFPWmiM3H/pQnkcNKtPEXaJzKWPbGcv1N3YRXqb9qzxhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354697;
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
	bh=FQP0HllwggutWWw9yH8MpVuIDMg8fVliSf9COtrhg+Y=;
	b=FTX1pT3tjEppr2m8gz6uVYMfU5Zg3Prcs8hH73RZwhRUsD76Ka+0CkVZLF1YdiP1uEFi
	 qk0mEWv+yU8OlR0Z8h8fKyUUpn2hQBIjhiDMvHiH5YAC3pbM+0XaqCswmkC0husspF6vL
	 IfStiIyRw6PA4IOV3mn5DDyk3MqLzZ4XKvnartqvgzW9IeWp4BrOujmelrgEl0zu9pnKu
	 3cFt8SYi4q9Dlneov8PJLgrD5Xjv7P8UfIYafiM8NJQ8pivgpbdnqoRYYRKeeQiSRB3RW
	 LqmABSMHQm/kvy/OXolfEaM1qD9pTRvWfittBxnV28h/QKujsnfC+LPcF9cD2YELVQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=aoNVylxW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.48
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D06606A32F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54D06606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=aoNVylxW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqtf6UxB5puSZO8AbG30r11IQU0ZLoiBCSQ0qJYFJs75ARbuq4D7mfJJSvSr0EikTJr6Tj9TVSTirzJm4Pz13Z3iXvaCrq1LW1EeMIzMkr1lrhMOBxvZC0vpDmBZU1hQgd0YK74ZweqFR4q2nQb/2Wj3SmEBaBYthnUG6KkGDSDdCp4BNks3dBXy7O5JY8ZV+yL5E71vcXnloC5kmHb6XyWaEMiuBV0m3dVFPgeUHGxVLgL9HsdyNRmwnrYL9Zgzw4fP+3QIKrzWvW6tlcON0A3PH4ukKeFno1RSHFj1O/xyS46T9ldYCU9L9U9Jml3/NskizItir03N2beF4P6IxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQP0HllwggutWWw9yH8MpVuIDMg8fVliSf9COtrhg+Y=;
 b=fN/7v9hYGmUCP/g6wcSlAA+KtAJ5Cd3OUn7fkE17C8DsavH8neh0x5AE8C/GMmMeDf3C7O9HcCrzCfsPkh6x++eSQ0ZZFgsFwEjYaszrV0Cmbg9XukEHTjWnwMRf92SXLNCnKNsIaZc0/Y1+gUWzmbx04fJWMYg8bZmUJYdYXvVCM4NBYD48VBCqGD67RUKThQRN30LzJ9JSuP79uvqW/lupqckQ1g5R+0wNTKxImGCy+ZNtnBbpVSkBtyg2+f4Vm8gEr7e9Qc903BdB6oSDgvz8rLe8aWfzcPEITTJ2wcr+qRejPwvxeykawp9wO6kJyOoSSR0tdn2d/zXCk3GaLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQP0HllwggutWWw9yH8MpVuIDMg8fVliSf9COtrhg+Y=;
 b=aoNVylxW19lwD5pniBF2z7r9ZT1yxEMQw/eJGl6BRbJcLOLGO2vH8SHgdJCZVd5jKjbHGxKqmNwE2hmi5W8vQLT2ZNQ0Lc9jHFuYvxqjyT/WSjtvlu1lnXlNf4p/TdIoFs8oFR0Dx5rZ1r4REcI9LqheacuIeIAFdE/5Syhs4gihBzMj08TQ3bqq4lmE0WWTIKa27NAlpQLztnctPJC2iZr7JLYzj1UcXMxl2K/ikI9tUUWqOpgCQN714P6Ftb3UfGoU3SYZ2DcA4fGmIkEiVYst3ZRUJqzov9LwWK4CMDEwJx+PAo3tsYsyL+ApBebScYBVMo018Ju9WKyS4rdlww==
Received: from AS9PR06CA0083.eurprd06.prod.outlook.com (2603:10a6:20b:464::27)
 by BR2PR10MB992260.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:2c8:1d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.5; Fri, 30 Oct
 2026 10:04:52 +0000
Received: from AM2PEPF00070CF7.eurprd02.prod.outlook.com
 (2603:10a6:20b:464:cafe::28) by AS9PR06CA0083.outlook.office365.com
 (2603:10a6:20b:464::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Fri, 30
 Oct 2026 10:04:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF00070CF7.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 10:04:52 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 30 Oct
 2026 11:05:33 +0100
Received: from [10.48.87.100] (10.48.87.100) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 30 Oct
 2026 11:04:50 +0100
Message-ID: <4690f55f-dc13-4e43-82f9-d508253f6c64@foss.st.com>
Date: Fri, 30 Oct 2026 11:04:51 +0100
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
Subject: Re: [PATCH] firmware: psci: handle unsupported SET_SUSPEND_MODE in PC
 mode
To: Sudeep Holla <sudeep.holla@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	<dario.binacchi@amarulasolutions.com>, Linux STM32
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261029191624.1.I5f8f3d75a566b72250d629ac6f43cf0d387c0218@changeid>
 <20261030-origami-tarantula-of-contentment-a70ab2@sudeepholla>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20261030-origami-tarantula-of-contentment-a70ab2@sudeepholla>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF7:EE_|BR2PR10MB992260:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2dca98-9b72-43a8-097b-08df366d3da7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|10067099003|4143699003|11063799006|6133799003|261009223027099003|261028144727099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|56012099006|261026121527099003|261026140227099003|18092099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FUkkZ2jSrfnrYjMhMrRpWkyKgS0RSmuNoHUqaL6agixlfV/NiZpbmOtXUiQjlAYoCDm0oWjN1oI6vFOL6Emueb6MyazSonOHqpXo9ZBAUMMGHKooRZNliqxWrO9gJUikVSOhJc/PnjKDwXojsm4Ne5BvEl+6PBjf2HQVmhoqQxmU+sN8XiR8piH+kQcixiZ9IH3Sj/ECsS2dvP2KffLl1O1Fj5a1ZW98Gg16mcmYClbEn+kYziYP7UPtqggSToIqEiu7EYBO5eefvZ45SKlC5OG6vluCAhTo6NiZN1uHr1nXYabGtDXySRyQfRpEtwLMkK28Ui1tr5aIIg7MrvGNtpWvULYurQwnwg/TyiPHPn0KDJxRVQbljok5duhpP74B33BBjUSqkXVDKrrVfSyr5e8HF7rlPRK2gGWqXlequibFpnmDKqQf2L4JEW0QGT5u6Gd4lTLQeLs8vMTm6ShtNbJ29wdFOyA6wTM5BW0TuNw3ftW+HXi2j4rXVGf9n9xBOe/8P5EXAi7qGW77/Hdmfy38yBfrbNRiNXnU1QE/foTf5tYw45zyfu2LOyzkEyzE8uz5vDKBrpjDNSBql+PYFhntQIYysxF+SI0MG1nrYrLBZRWgsjle76lGY1jNQ1QqfniOdPYGoZOqXl/tpvZlsK7iEuz4vQt3yVuGmfCnFg2GmUttppJnJDSbgQESmQ7U/3yHVJkmDER2XEeih3Cv1Q==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(10067099003)(4143699003)(11063799006)(6133799003)(261009223027099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(56012099006)(261026121527099003)(261026140227099003)(18092099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JhDvJAOxt/OZ7Zvx9OTbHgxPbB+yC6dgu5UllP3zQyVWDJRfuhdDWLg4glSwZY2T2JqCq5hqWQ5tRUWA1WNPLHgfXfgGkV9y4az98y0E/3S+l/3xWpvYEXuT/3XZK6fBTxVZrm1kg0avc9r+YohB5X2+7nIbsrZiZMbJVKrWMBT4iqrSQ3gO6FWkK0vCHT4xPtjRxNioR085dfhzc5nVW5D1WLkKTvTW4Q7Bq1PdmdGKRAeumQcRW4/n0VQ5VXDZY/k8UD3vupNQsymV3iowYUueedqQQtGvAwvbFX+r1piGifwPnb3akedA0xu0d7ZaM0KU8MTLWYGJA+ZOfe2VmxrXIPmgArAFBVtJIoGRIHfv69NOtKRrI57YuzABviszsdgTG/s8HzE+ldfD20LV9u/SzjHnndYv0blIxchryZMMpATmR9bCzrtppRFj2BDv
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:04:52.2807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2dca98-9b72-43a8-097b-08df366d3da7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF00070CF7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR10MB992260

Hi,

On 10/30/26 09:32, Sudeep Holla wrote:
> On Thu, Oct 29, 2026 at 07:16:25PM +0100, Patrick Delaunay wrote:
>> The PSCI specification makes PSCI_SET_SUSPEND_MODE optional. If it
>> returns NOT_SUPPORTED when Linux requests platform-coordinated (PC)
>> mode, Linux can assume that PC mode is in effect. Treat this response
>> as success so PSCI power-domain providers can initialize when firmware
>> does not support OS-initiated (OSI) mode.
>>
>> Continue to report an error when OSI mode is requested but
>> SET_SUSPEND_MODE is not supported.
>>
> So, your platform advertises the presence/support for OSI mode and yet
> opted for not implementing SET_SUSPEND_MODE ? If so, it is indeed a
> firmware bug as reported.
>

I think it is no realy a platform bug but a too strict management in 
Linux kernel,

for PSCI power domain.


The OSI mode is not yet supported by the STM32MP25 platform in Linux at

upstream but I introduce PSCI domains in device tree (but without idle power

domain) just to prepare this activation in next steps.


As the PSCI support is not activated in Firmware (TF-A BL31), the 
firmware correctly

expose its capacities (PSCI_OS_INIT_MODE =0)

=> PSCI feature indicate that OSI is not supported 
(FF_SUPPORTS_OS_INIT_MODE = 0)

=> PSCI_SET_SUSPEND_MODE function is not supported (optional when OSI is 
not supported)


in Linux side, the power domain driver 
(drivers/cpuidle/cpuidle-psci-domain.c)

correctly check the support of OSI:

     bool use_osi = psci_has_osi_support();


in STM32MP25 platform use_osi = false, so the driver request

Plafrom Cooordinated mode (PC mode) as expected

But here  the GENPD driver try to use optional function to set mode:


     /* let's try to enable OSI. */
     ret = psci_set_osi_mode(use_osi);
     if (ret)
         goto remove_pd;


And the problem occurs here because the optional function is called but 
the normal use case

is not handled (OSI mode not supported / PSCI_SET_SUSPEND_MODE not 
supported)


With the proposed patch, the Linux kernel can have PSCI domain in device 
tree even when

PSCI OSI support is deactivated in PSCI firmware (or not yet activated): 
the domain are

always ON (GENPD_FLAG_ALWAYS_ON)


NB: I hesitate between the current patch and a patch in PSCI power 
domain driver:


     /* let's try to enable OSI. */
     ret = psci_set_osi_mode(use_osi);

+ if (ret == -EOPNOTSUPP && !use_osi)

+    ret = 0;

     if (ret)
         goto remove_pd;


but I patch PSCI firmware driver because I think it is a more generic 
place to handle optional PSCI function.


Regards


Patrick


