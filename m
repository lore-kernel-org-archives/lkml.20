Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA11756B85E;
	Wed,  9 Sep 2026 13:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960968; cv=fail; b=fiYyiOBXviAuP9/HL2VEJHaBbuVpOhETcQon10TgXTA0YUPjGe5Y3K1eEf4xryv55FRDkF762/KplYk6s7prcL4u+DN/8DCNoQRDzVAV0Iy5bqL8GCUKt6T3Ewn+YqMsMj9b7Y0sq3dVkjfnvDZziBelVc7UxRo8gC7daxo6sLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960968; c=relaxed/simple;
	bh=iTOgpdKwRrYm7g1gS6xPpqIRBJRtJ8P3ugfdhoF0YuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=I5EbZMtT7SWJegl1XPM0z4Au5n+mGOLvLOIz+v2hIlo1O+0GN4yodwkzFMeShMEe9OSy3H6xacKJnsz6LHfw2En87xrXTra5g+hPrlicwbfUJkpBICeq3V6RsQwu4vtDJtS5JXctR3/BFCWvFDEgB7kqF7wkWslaA8ilaP/GLVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=LxKASXjG; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=obTqkEqv; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="LxKASXjG";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="obTqkEqv"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689AogMe389524;
	Wed, 9 Sep 2026 08:35:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=B1UKGD2GxBvivDXrd5e3/idDVBxEBroDA7w2RLzsy
	Y4=; b=LxKASXjGbA/C9apRxjp35ww/wpwGYXTe06rMpC1V074k1pcJI6OcddSBY
	T1gvlTwslBWa54XL8L0qAapwYhPlPXcGy28vo0xKcAwXjOZCw8EhVX8ZbXjpZxMW
	4B12zpmwZ7SlC7Ey8vu/IwBN3w0Rm5zH54y7pAdrwzJE86hq5SNdx8ygL9X/7Wi6
	d9Yi9ECYxt1Fn5tRBFW6r5Rz/yZLjGp4NBWuPTldJSVM/pZKjPD6EsisEeP6mk+G
	f38Lu2s554WwQVl+BYeKtgLrp3q/31fyYi88Z5UVvISvZi7evR7xAKqQXwKCTqPp
	OCWk1evwdMVF1AmK7WFGRVhNRCY/A==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011059.outbound.protection.outlook.com [52.101.62.59])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gk4aasbvk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 08:35:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAqeW2jh7LrhfQT9/6iLGT5kKrqROinzGrslNpUFaHTlnAC185PTLOnww3gffvxKC3B4jMonGOoaXK8dAmmzbND1dRSZOSo0uEqIqHmEUzQqKSnNEIpq8/ScZtKYgTcGTAWcCEgsdTsCLkShJQgxZXKNcELzujuqU+RkasSD0eUmkE4TMLKTPhlhwzgLJj8vHZwTtvT/XO+dTx7yHdeW6ZYCj41yPwkmAauRgkpq/wMZJaVOqTemDIOCi/SUJWXeSdqE/+qZZ/+ZkwpqdHOCFdq5nT65PGKwFbNF0yx6+jMJSptViRTNK8qDbiYjb75Jhs+c6ipRWEP7iQxH5cZj5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1UKGD2GxBvivDXrd5e3/idDVBxEBroDA7w2RLzsyY4=;
 b=nsQKKKjEjL3PNaUH79TB2H9ZhCjNPwPhENxIySHP1xBT5GW2EIqyvVbUeuuIiG9TOmkAt4XikntuE487ukPkaArQlBi9EUcqKhy7LK+mHF3BvzJ82qhm1frDCuGWZqSaOjFwGK9O6/r0vcAlfQMsRaTTuUElMvjTjMGEBLdaGeTVSFWQomz8kVRJCN3xt52Wv7wCpkGLKytSMnuvqpQPJLv+HvSC3opOaQVA2FnT87V/4r1AbHytpyjVsd0NVfbfuqCfioc587h1OWsNn65V2F/RHTm2mne+a2zLqaKQTZ7git9gAl2sMaIhjP+uVmTdccNNhQzBJfWKM9MVS0OjHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=toradex.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1UKGD2GxBvivDXrd5e3/idDVBxEBroDA7w2RLzsyY4=;
 b=obTqkEqvjDEh/98APaZ9qw3M7VoYW+Pmm4IoJyso03mPwYDhEBAJwgksAIVso9AU4nTxdnjZkpdE8daFm02ceny0GW4efnvgvP70Q15w7MC5Fud+S/bT+fK3kpaAtHItAEynebAHMfvYaSG3T+1p8JDkAMoAX4UuxYKyyTFEwbM=
Received: from MN2PR18CA0001.namprd18.prod.outlook.com (2603:10b6:208:23c::6)
 by SJ5PPF87E558B7D.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7b3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 13:35:52 +0000
Received: from BN7PEPF000000A4.namprd05.prod.outlook.com
 (2603:10b6:208:23c:cafe::80) by MN2PR18CA0001.outlook.office365.com
 (2603:10b6:208:23c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Wed, 9
 Sep 2026 13:35:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN7PEPF000000A4.mail.protection.outlook.com (10.167.245.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 13:35:48 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 08:34:59 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 08:34:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 08:34:59 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689DYtxQ379855;
	Wed, 9 Sep 2026 08:34:56 -0500
Message-ID: <685bb5f2-2a45-407e-beec-b5fbdfeaefe6@ti.com>
Date: Wed, 9 Sep 2026 19:04:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to
 LVDS adapter with the 10.1" V2 display
To: Leonardo Costa <leoreis.costa@gmail.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Leonardo Costa <leonardo.costa@toradex.com>, <u-kumar1@ti.com>
References: <20260803173705.2268792-1-leoreis.costa@gmail.com>
 <20260803173705.2268792-2-leoreis.costa@gmail.com>
 <29aaa2ec-c1fe-4f60-a6d1-f8c797587986@ti.com>
 <btthxxtvgma657mrvcu5ledxu3fedlf3satbeu6ppn6jb3o6cr@wfffny6ucxck>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <btthxxtvgma657mrvcu5ledxu3fedlf3satbeu6ppn6jb3o6cr@wfffny6ucxck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A4:EE_|SJ5PPF87E558B7D:EE_
X-MS-Office365-Filtering-Correlation-Id: 332066c7-2437-4a50-083c-08df0e774295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|3023799007|56012099006|10067099003|4143699003|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/zfJNV+RrFylhUnyyJADmCMntn7fp7hmDuGLTS3KGAeGNYvzDAAsoIQfRkG3D8LA2dgfGok7+aHRXPfybYJu/mMj3ZJzOwUSMSqVl0OMyUcIdWWXvPYdfzP4PaPPLkm/wiXVAnAKUJ5VrdbjwGQICDt7ZeJlTr/Sqvn7D2/drUF+Ku0m3Sg8nVFYcfhiNgmGhxnlJKCO/IqC9w0gB4FeLaq6IBz99WrCf7JcUx2852wXUXPSXm/M0v5noMyEv6YakmJbesU1c9MmcwYP0Xy/kl0ZMsaz3XJXdPWf25UptmmJE8VU896zUAWhDtvWWDvcFAld5zzoaa4VtBj5j2x15xqK/muk/KBqrX0xpp8OOjcTIOZRYz/9LfTk2BnnmumUNTjNS7WSrhTLBbBt7c+5TlFl0SGmtA1bbgkDpJUTX6/OKiYVqIwRqtjAHqUo1cXapCD6t80AXgcPDxfR/pK60qWwiACtuD94kkAyVEVDEcm7EXTe/i8WAV3zd6OB2woxPY9sv19+g26uhdCRAmRZQrmV5QG99XPeBtGw/HjYruZCxXtV2cMnNhIzVVsq8axiNjkVgLWEL/EFEqL2MjCotR7fXe+jJzxEXtUhho9W1EEXEkdOwQS8O3Ch3gfX+UtibKQzRZGHG+TV7knE7euIzA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(3023799007)(56012099006)(10067099003)(4143699003)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MK5dYLhf1vi62hn8Ev64bVAJcZt3F07o0kmH1nlY9Uu53L3GGgKFaYwQJKWPimdwvKjs/1ADjFCK6KQVM1lG4wVTpFK5a1TNo3cIKjxSNKCqHVdZs1Y47DWKuKe9v5D16F8n+v82N2QW7FC5gFe8IayNUa5wobTNIJcI2ld+zdCmJgW30z2KVLwK1mmJyExwy4wCKNNDuWIQUX6J0U6owiPnPVe1ZCbWX1Vzz31h3euC4QsY+Aqlxxv6EjmsaehNpm2YodansiuTyZ70FL47pAmuJivOhMSZeGYay5raLaovNYh/fdksDFdQoJM4BA5PGXsCPk66W6kdQygDbuMCu/0j2Y+JdnQQzBYrxbeOuYmBAwDwsAKInLuAREvdrUK1LVNyFc5A2ySDzJ+DfmUJQbNxjVWQMr+q0eDrI++SEuyk6K31kfNLfw0E2Bj941yG
X-Exchange-RoutingPolicyChecked:
	blXCIutNcdKWccd9p8DSAzGjsu8f163Q0jZ0ShTv+9Z2OMuj5SZjhzH8CvDulNwFdxx7fMQhIx4Unzbs7jxyknecrytCED8NqzF686BL8wesckxEhSPPYDqn0yx1eagSj92p7xR54Fn0hhc8iepwlf+a/0Ahia63AUw52F1Xy5VzqfuItYPQucHlIb+tvDaDszB250XUlgvnvDKrjHgsVwpTylC7/gosrvAjfV3ntxy5H4vqxVgd8ri11W6bOpXYQ0jlxuX1nKN191Ecc06jG3SHUXWJLDJPsYQtsZj6sp4o1+52wPdbSP0ml92pv3yyQ8aa9BXLzXLGd781ZklPdA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 13:35:48.9630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 332066c7-2437-4a50-083c-08df0e774295
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF87E558B7D
X-Proofpoint-GUID: YOckTnfZicn4H4o5xtueYF32ewLkx0i5
X-Proofpoint-ORIG-GUID: YOckTnfZicn4H4o5xtueYF32ewLkx0i5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE1MiBTYWx0ZWRfX+TLkJewlRda6
 Xmuy5O339l1AJS9QTUnPaQa1Ege4kNML0iMhHVom3uT9jbmAHGGPSW6O9DSGypJokQnggTuPmeG
 sv6NfeOPHa3Hii62NVi2RqbYZjAz9gQ+UQ5LZvh4fxUn0NFw9CGW7+Rp0qdMfs/4SG/3kfbeW3R
 ncCvKq6c4M+oZvZpnz23BFNxET/dseoPy7+yGKrt1JAw12KJtYzh06oP0Z3PWz5W8sYhjxG79lk
 LGnez6n/225r8yNTPpDkd5MV1K0fP84a93xQogN0zim2AiDyyi3Gp/83EvtWr6ZF1mL4pAQ50WX
 m6jSbH4fG7MkWGkPXsgaTMDVoySzRfDJRM0Zm3Lmt7t1UmOS8qMFfoSYnKY1FQ/pfOOmJz2ciOd
 vOjyaGRU1JjqtwbjJqpp5RuJ2JZzPUTBS5ohmes57F9ZaT8bPQk3iyJD9vi7rqdWdDNrKUFsA6m
 78NBGelzWwzHoPI7oQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE1MiBTYWx0ZWRfX9vtm3+ZSpL8p
 0xqz2cZ5Y3KyYrJX5o6nYzUvx5fpOkopjwU/3NyeMg9ncR9HIc4H4rk/slr9KbF2dmW0Kfvxh7A
 SRjpZd9dW0t8CuicMCL7OyV4T6hTeZE=
X-Authority-Analysis: v=2.4 cv=DfEnbPtW c=1 sm=1 tr=0 ts=6aa160bc cx=c_pps
 a=huIvVN+S9WGU6koxVvae6w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=m8ToADvmAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=FmwQItJgsPVX6mGfJjQA:9 a=QEXdDO2ut3YA:10 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090152

Hi Leonardo,

On 9/9/2026 6:46 PM, Leonardo Costa wrote:
> Hi Udit,
> 
> On Sun, Sep 06, 2026 at 10:49:52AM +0530, Kumar, Udit wrote:
>> Hi Leonardo
>>
>> On 8/3/2026 11:04 PM, Leonardo Costa wrote:
>>> From: Leonardo Costa <leonardo.costa@toradex.com>
>>>
>>> Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
>>> Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connects to the
>>> Aquila DSI_1 interface. It is based on the Texas Instruments SN65DSI84
>>> DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 10.1" WXGA TFT
>>> LCD LVDS panel. Touch input is provided by an ILITEK ILI251x capacitive
>>> touch controller.
>>>
>>> Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
>>> Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
>>> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
>>> ---
>>>  arch/arm64/boot/dts/ti/Makefile               |   5 +
>>>  ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 153 ++++++++++++++++++
>>>  2 files changed, 158 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
>>> index f4d109ef6798a..8a59fc597aede 100644
>>> --- a/arch/arm64/boot/dts/ti/Makefile
>>> +++ b/arch/arm64/boot/dts/ti/Makefile
>>> @@ -218,6 +218,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
>>> [..]
>>> +
>>> +	panel-lvds-bridge {
>>> +		compatible = "optologic,scx1001511ggc49", "panel-lvds";
>>
>>> +		backlight = <&backlight_pwm3>;
>>> +		data-mapping = "vesa-24";
>>> +		height-mm = <136>;
>>> +		width-mm = <217>;
>>> +
>>> +		panel-timing {
>>> +			clock-frequency = <70000000>;
>>
>> Looking at
>> https://lore.kernel.org/linux-arm-kernel/20260623195741.495734-1-leoreis.costa@gmail.com/T/#mc4ed25e5253da6dc635fd3eddc317dac8f447f3e
>>
>>
>> you are using three different clock-freq 69500000, 64500000 and
>> 70000000 here.
>> Could add some comment here, why freq is adjusted.
> 
> Just to confirm it, considering my last reply, do I understand correctly
> that you want a v2 of this patch that adds this comment? In the end, these
> are just values that we found to work consistently with the bridge, and
> we're not sure if this comment would add much value.

Still adding comments will be helpful.
If someone taking this panel code as reference on other SOC/Board, then
they will be aware of clock-freq needs to adjusted.

Thanks
Udit



> Kind regards,
> Leonardo

