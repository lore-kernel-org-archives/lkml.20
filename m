Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011036.outbound.protection.outlook.com [52.101.70.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60794908B5;
	Wed, 23 Sep 2026 10:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.36
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159734; cv=fail; b=K5TbDJnq9tAnzWrVBwrlSF9pN5w3yQFhIGyBCM01LPrta8Px48j+QbNUk8cyUSca8WABwZ/P3F6Vlnuyjm6G3aRtWrkjHTK++mffnhZgX0mhbo9LCxVewytx9wuDJBFSQ2igx1PaPVmICuezBgNIgYvarXpeVD9CxH4ZDXtnaME=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159734; c=relaxed/simple;
	bh=qI+hpkEPJG8wCBP2D5N4PMiuGd3mtWRkovmKKXHsP8Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HS7ghbfmDMNGdM39hYwnU3OoIbmKkV/ufW19eXCMUzswsu0QodH6VHPnwkksOcilGPZDEcf7Ar8FW+AVWsu99P3qNw4Q6P6l+MLiZYWRHTmBo6BwsyGWgE+R9ln6NyP7HZlP/4ctl5l8TJ/YhWlrz5rrBpQGZyBfOJRc0kOGpwI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=p8DL/aRk; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=p8DL/aRk; arc=fail smtp.client-ip=52.101.70.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="p8DL/aRk";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="p8DL/aRk"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sqU8koe+85qzps80wSko0kRJohG7cbYMG0E+u+biZ0h+gp8dD0zoL1Xo+ykkku8ej7xSGjOF6q0ejFo8BqP/P85VkF/X04ZzsYvTvWgwPwGgotszVQIaJDJhNCqU6pDTQdYJWjLPpAKpiA9eRWy4O/GTVaxtcYvNz48/+nnmub01SK2cP6HxE/LtWUT6RYtUjCBK32aFM8xv4fOf3ZcuoYVK8mi8/2KBwblNbhCEWIu6JasoqHheKdxm+iFtqzkYMkRo6ig9ssJL/IyS/npkurbM5QuVQCKppmDs9Ka1UPaFrnC+E0pCrM9HvRD6ZRVjB6DNrdkzsxkQTbKr9o8hxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDaleYJsOypFTf7Ra2zrtK1dFOuH6E6WqLVmKuNEffs=;
 b=h+VvdSfgwdc9+hep0nimNo9mLp8RlUEAp5f+u9LZKBhksWAyJ5uyZRPGB+iE6asc35x5PxLfQffaGvQ9Xx42mNhiaZR3cJKrwkdlNFNN/V71ikstUbN70akwqK2/hmt3SaUxwmC07rgWzIpLoEQurpSw2btA0HQLA9cRNUzJcEjqYmYDwHzUpMv7kkRs1q3qdkzZ6ZSbGl2cwLwx3PY8dxoL6MOUxmlFXSjWUPyO6hohYRzGxh8cyKQM2+ByVBLvjeZFZlm3bn98hxoKWytQqh5j5ooEKoa6kXC5oBOxBb1g8g2UjqvdoTkOpViF577zAUZGkbzJIPZh9A0vkPoYdA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDaleYJsOypFTf7Ra2zrtK1dFOuH6E6WqLVmKuNEffs=;
 b=p8DL/aRkVGuxxE8wNg2oY9EzlyzwIOtuiW7qHAbrHw9KNL5GTMGUOfqSw0AZu6nar8O5M89r98RXNuaaUCByp+S+TgjgtkQd4f0NhQWqV5/Wz996PEoEGgBqMh9JuJycOXIyG4Zyl25jw2USj2WB54Jk91sn3Ny/24zQNED1VXg=
Received: from PAYP264CA0025.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11f::12)
 by AMBPR08MB11963.eurprd08.prod.outlook.com (2603:10a6:20b:77a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.4; Wed, 23 Sep
 2026 10:35:08 +0000
Received: from MI3PEPF0000855C.eurprd05.prod.outlook.com
 (2603:10a6:102:11f:cafe::2e) by PAYP264CA0025.outlook.office365.com
 (2603:10a6:102:11f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 10:35:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF0000855C.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Wed, 23 Sep 2026 10:35:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAsv0dx0ekpkyTGNNDfIUbfLly4+kuwxS1yEoMrO4wT/z8cHt084gQRkNm2NbF2RwiI8Tc4LOQTPbt2Pafl4upyH999t7+G2uXPsrY/ilQLB3e/Q1lclVwlcfnsCS6g7ugvHBWLGG3XDQpvBJbNZGe3K/qZLWAJayrcVsjrCpxkdLsI/QAOyOtMI+KPlUaGDrLERRUYB0brawNeDpQcoZ6kZueOlPf90WbvXqXltBsTAkedbKWxlqXfQ+7zzFQOA96z+8FKp3Fg8W7WwJ3JSxKD4xvPJ5nss0KapfqmVCjodC4D+SDVVcWdLfJHGsosZM9jVDGWeXJPKonKoFoXPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDaleYJsOypFTf7Ra2zrtK1dFOuH6E6WqLVmKuNEffs=;
 b=vAhol0Rrm8DDU1cbfHO43ZeOVGI3ZL/dDPHzVbPNgfYqzNhjY3WOLsUTcO6iID8MyYR5TROrN277PNycj8nl1GT+TOMVNtQErNXRPJzraNfcC0D8cVexDsf2DHX34uHofV/hIHRHgDchud/xkC2a/NS6Qv8cOrDqk2iIxjdxzyKedcW8prNBWmYY3DzfauxUmROWSZnChjE9+Z5wODCpLJ12GWyoo6vvtiJ3YEixhT3Not2Kr4WrjGzqsvRu8DbrPRqP6qWlAFRsjQO9MEuEDZ/v1HLQGPudr5l+edp3snAezvaZRlT+1VuJhR/JQ6bEqDybdWFf8LrD6MXWPjADwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDaleYJsOypFTf7Ra2zrtK1dFOuH6E6WqLVmKuNEffs=;
 b=p8DL/aRkVGuxxE8wNg2oY9EzlyzwIOtuiW7qHAbrHw9KNL5GTMGUOfqSw0AZu6nar8O5M89r98RXNuaaUCByp+S+TgjgtkQd4f0NhQWqV5/Wz996PEoEGgBqMh9JuJycOXIyG4Zyl25jw2USj2WB54Jk91sn3Ny/24zQNED1VXg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by DB9PR08MB7700.eurprd08.prod.outlook.com (2603:10a6:10:393::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 10:34:34 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%5]) with mapi id 15.21.0451.012; Wed, 23 Sep 2026
 10:34:33 +0000
Message-ID: <6f30e580-6ef6-48cc-ba3c-f6c48dc72b38@arm.com>
Date: Wed, 23 Sep 2026 11:34:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: Fix CoreSight CTI Kconfig symbol
To: Rob Herring <robh@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, nd@arm.com
References: <20260822081912.88774-1-kmehltretter@gmail.com>
 <20260916195703.GA1353861-robh@kernel.org>
Content-Language: en-US
From: Mike Leach <mike.leach@arm.com>
In-Reply-To: <20260916195703.GA1353861-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0101.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::10) To PAVPR08MB9674.eurprd08.prod.outlook.com
 (2603:10a6:102:31d::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAVPR08MB9674:EE_|DB9PR08MB7700:EE_|MI3PEPF0000855C:EE_|AMBPR08MB11963:EE_
X-MS-Office365-Filtering-Correlation-Id: e0085ae3-fce8-40bd-e0a8-08df195e56b3
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|6133799003|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 Hv5juJZB8bwRCHRMShwg/R7QZUZSmrSZw9T9oAT7XaBwlh/xODjiLRT8ymr9pI6F7yvXeuz5PIUrBO1Rhuc4v4uBIp94Hatdlw+s4xqh/P9SOlQq6FQeUaH2QsrhPabIbetMBNLU6U8aRKJUX+6JlG8qx6AB/Bfeoz5sFybUxeLUr3CsCiHu4vMx50sawG3PFNBqOXOg0AMfKPfiQlOgafMjUh/QCvjyQN7l+hz3WmdYWHUHxU9R4x4fbWupzwKmJX7kRg9J/8r9RIIy1jDgSnVmZtx6jI6UtQKfg0DgflSZe/go37Wj1pHxsgZsplqsNsqFOdpCEHwn1mDtFnscNW3F9kCnxCLXwbT3uWcUDtn9hxebsDc2TVEwPiz2S/IcfcCPo7SFckD+I4kmoWKKNkBIv6Sx3n0Cyw4CP1KZAUHqz7AmaF8u7SjmDKFxvIZlVNA+CSJjIiAEdq167VmeUaF0s44s2GbHRM9kGnMH1TCdTcdAiXGkEbJGcIBLPgpZbvrW1Ecx25ZTHOB/+jXM06u+yL84FKi2WStQUcne6NI8FjeDTfo1zi2fWLrPQqcAmKU1OiEQBfzS3nWwDrlrW9Pm1OEsale+rI0C+oQKF+NNyjgRaGnq8tRWwGlchvdyhRHzyahBlqdlc/E+i1SSzbcsWOFyaV3Lkwu3MdHrGlc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 xchRf31awua9jTM5ar+urcNzckryhpp3D9zqU8oCms2b3BcFn0b69kU6HYY2p/kmFpoOiZWhAkBHC4kZ+8UWU21SdFrugmzVlmf1vFCTETjiVp/0ZgsmOS/n1tAFLa2dNX7ewzIWDIU4wF87mEuoEFdIYTKe7SW2c2gj0kDkANJdILsUhb1dUfCfZlGCYVsKQr97dnaAKvCckVNH0kqt5G+lIz3NfUJUABVsYvnQ52uCh0OJ2lCzLfBfOFsNzk9/k6s5zqLpH8VjC0E6FCHcNrWJ06h6tg6glUMb6Pbwc/2MJu5t1Y6fgxzEQpLYb/DTRAUO/TWYqIAMByjT32RV8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7700
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MI3PEPF0000855C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	beb0c864-1304-4f7b-9110-08df195e4226
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|14060799003|1800799024|82310400026|35042699022|23010399003|376014|10067099003|56012099006|6133799003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	y/98WoGFde1v4nDhiJlNiG2sxoALdXSsMcDY+AM9qqYS7jcGFm+5jp/H6qlVkhMEy2hRs/3e0dhLIlAGfkrzpBlWBq4+rD3R9kFjOJA7aCj0cSzhO2R427PqjC8r74kuTQyCUM6uHcagXWaFrTpmWfpF+SJBj0oV4lGlWe2+7MH6UhovAEVljYpg9locdPnmYSMEGdb7gPzaBvzNCSAHGZdJOr45ehaEId0uM/w2QRIeH0Q2x3qhqK+uyMLGHVCySP+P2s5fT6HtmcDFwmfyL1Tx3F2yHq5Q4ON/WVAA+vr0aKz7D2ed2p7ETMwa0Kg14v9PvOeV9loWA1kqASSKCkFt+hpKs6jSanbS+/EAHKXtp/0oWxfgNHepupPQbJwodGoMdadZr2XEa/mQBu8mEqnpJBFSxVFZFlUjOrRHegSlEikCX73zcOkFfL/z6uQMfdlf9lUfyWWkZOlbtz832M4EnvBY1fvCV0d81LsqdkNwXxWbZrju5lcAidddIxby1JXkq1VEf15S4JzCJx8z4goEMcyuU30zgwdeNg6ElAxNzzWPPhxn/eNl0ckaGI+tYZPG+TJ2XGXf5ql+zEwHLMlsuHcf+BwPNaIt70MHV7Vf5EImPfNWSnJC9w/K0TLHLSdcQwpRjiDU5Suie4yQu0x4az8k6/1Cx6I/NdMG9pdsFwwGi4OUFdkuo59y+8dh/UdRreFFhVinYVemLvdurA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(1800799024)(82310400026)(35042699022)(23010399003)(376014)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	netSg2mX4lKfZGIhOUZjaGrDUYX4sE3lWWcM7/ORlYVsJ1FeNa1Uv4iuNYn08St7JeS5BkzSdmLLQsaK+yFrNN1VxKXcOwgErr9LmS9/xLvHmqGSC3vHMKD+hZo3kctsjWyVjab4C/uk8oUgYqMG2zg891zrOUZVNlAwFRHZrw1An+V7RpIjpcZ6lRLKxRLdmAHMIVacOfl7VRPlIRpEm5FziGRPV3neTSs9H5XlnSU5DuVHe2IhHOuPV7SpOuxXaCE4pJCusxpQZzz7qg2xGtjFOWhFZwVTe+XuyaofY65AhDAxbM3MyMBi671dyAcGnyeRRonALEFtEj6yCtFFLZV8ZPsO2kUUWJed1pxm78et0nYC1A7WfJObgLaqIlyjR2VltLL9biaY6K+0nSjtRDeIXqKeBbdkluB6NgjaswwqyqXDcXdR3Jp0S+wzIH7L
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 10:35:08.0489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0085ae3-fce8-40bd-e0a8-08df195e56b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000855C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR08MB11963



On 9/16/26 20:57, Rob Herring wrote:
> On Sat, Aug 22, 2026 at 10:19:12AM +0200, Karl Mehltretter wrote:
>> The option exposing CoreSight CTI integration registers is
>> CONFIG_CORESIGHT_CTI_INTEGRATION_REGS, not
>> CONFIG_CORESIGHT_CTI_INTEGRATION_TEST.
> 
> DT bindings should not be referring to kernel kconfig symbols (or
> anything else in the kernel) in the first place.
> 

Agreed - the comment in general is correct but the last sentence in the 
paragraph should drop the config reference. e.g.

"This information might be found by using the CTI Integration Test 
registers to explore the trigger connections between CTI and other 
CoreSight components."

The coresight/KConfig file itself adequately documents adding this 
support and the perils therein.

Mike


> Rob

