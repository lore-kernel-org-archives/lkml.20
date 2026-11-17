Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794935780;
	b=5NnZZ6jmh82ucucw8ZABMJizgkrqcXGi829BuGa/phySf5XEEUU6c1GQFXrLn9jxWhNm
	 zTNrDCCUPEZ8Oc5+17oKRpZnV5XbAIewF5DZKRC+cWC0JwFEzPzXwchrGgpgUUr15aVib
	 3Z2kngAWE2GgYegN7vAnX9MWVGtG1Ejy/oUobQCHLIz5S5VNFOqnQaxkl3oJTIRSY9z6h
	 XDSIwAO/OnD0H8rf0eAwMeQN81zJqsSl6/pbUAhh4CSRHFPznKtggWc32B1nIMkCsQnCq
	 xlu9LZcZI2O2CHTFEH6gxBf1HI33g5s/kp42bc965iUg0xMUqLpuS7ibv1eZ/JgOAQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935780;
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
	bh=R3A9giksTUV5LFhw1F+Tr5DCtnXk+5+Vagtc4saPJKs=;
	b=chzgeQMucUEB3JdrOcRihLwj6iC4rbJurr/N6yNlSF9yDd/ILBmsXI60194yGewARNek
	 lCBHz4NZ4S7X3Lo9OLRS1sx3qAJqs87NuQrnGUrCZ5tFW50biNMrAuEGl0pzKDhqmgpkm
	 PyPN0WuZLq6xzRROTxxn6PAx+fS4E9sqnup0QfI5cD+eNWtBTbnvLYTUZz+svebm8zX73
	 /lf0mSzvU1Pa3Al6jlClTFQVHZEVIeRLs3rhoLDyaoee8jbExzycHNECjr+l91+4pyg0C
	 fYZDZiLM1xpyumPmj3bOyr2KtWojDreX6eyK8BcS3fCkeZnvmSZy2Zuy4WN+kvqCK0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=nazWXZnc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.41
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013041.outbound.protection.outlook.com [40.107.162.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FABB606A32C;
	Tue, 17 Nov 2026 17:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FABB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=nazWXZnc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PE7UoyBx8RRcL7RanQGVx8YoNNiISEJc9ZvLBSHsL4RAh+4s2LUnLxFg8IIcLe5JAnp3Y6mpT88CJS8CmuTTL0c513bNNJodZzJcST6Tl8TKZnHk3a1wEx9Kxto1kKTHbAtGWwXZiq4JxWwS0YQMdVOzLi2iNZwbLoVj5H1+OpLD1kvs3hIjtysMkMFEQhIyv5zbk7MBPNn61vxVhP3KWletGc2RqAkGCOmI1r2j2jOU/l9yJKcyDoQIRFRs6r3oNVYddgkXyACfbC90AWXHgAkwXq4374S2CDOXAredlf3YAVMj48LrC6x/dKW9n6edIE4Ce1TErQkSQzvEuo9iIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3A9giksTUV5LFhw1F+Tr5DCtnXk+5+Vagtc4saPJKs=;
 b=bzyKKUyEivWDuFJJAbsYbWEBwZiIMTPA0jnUEACg4uD9QE0h+HRgaKJvyexwI+EjdA+9GvPUn4exfJ8df/sDQlUwg74J/ZFuH7Y5HI1TGmKT6wfGUbU52YkeyWbklLh1omjWhRbotMro51WJtvldiagaC4syO8Yyrbb6vAXogthjCbfv//u5wl9NVf0rLp8EBt0JTvpMg4mbUuGI1+Elm4jb2oqxMb4JENcQeckFa9453MbN7RTmGB68Rm81uU7q99nYynrAprgPgH78G9QZXhmLWeDwnLftG6CQynCnHu0ZdFDDHWF489cvEN0xIPVjDLidGecje0DDpYEwkP7j5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3A9giksTUV5LFhw1F+Tr5DCtnXk+5+Vagtc4saPJKs=;
 b=nazWXZncO1N8SxG//gN43eDrv3fzW8+XiD0/Mbce8mOVmB52s1IuYxKJH02vApPjjWOdrMetPfdYDAcpJmu1VvwmiUOt/JFen84wY71ROfruKl/MTvfAzpacRxsVi3t4nnpHYVgtMcpq9nTweHQV5TFzDUx19AzVUHU4Fwy+NgVn0Xl2+R14H4a699PNLnF7KEuXbm2t4/yEMzCoI0hK6cAVinChbMNs9O36rD02T1XdUFDDIxOIbQGLIgetXs+5+b8isLYMJMXtw6K9pTyCjTid+lTK60xd8yv5ItdaJE+uH/cP8dL8Yuiqwv2zWXC215bT4Kd5G50rYD21dkGxNw==
Received: from AS9PR06CA0231.eurprd06.prod.outlook.com (2603:10a6:20b:45e::28)
 by AM9PR10MB4102.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Tue, 17 Nov
 2026 17:16:16 +0000
Received: from CPH1EPF0000052C.eurprd05.prod.outlook.com
 (2603:10a6:20b:45e:cafe::7b) by AS9PR06CA0231.outlook.office365.com
 (2603:10a6:20b:45e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 17:16:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 CPH1EPF0000052C.mail.protection.outlook.com (10.167.241.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 17:16:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 17 Nov
 2026 18:17:00 +0100
Received: from [10.48.87.100] (10.48.87.100) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 17 Nov
 2026 18:16:14 +0100
Message-ID: <760d2b16-935b-4a7a-8554-42c95b99e6ea@foss.st.com>
Date: Tue, 17 Nov 2026 18:16:14 +0100
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
Subject: Re: [PATCH 1/3] dt-bindings: add STM32MP21 regulator bindings
To: Conor Dooley <conor@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Linux STM32
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261113141342.557258-1-patrick.delaunay@foss.st.com>
 <20261113151038.1.I3b816ba92be5ff94cfe86a2f1c643645416cdb2b@changeid>
 <20261113-crafty-quilt-2a9b9d3b0754@spud>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20261113-crafty-quilt-2a9b9d3b0754@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000052C:EE_|AM9PR10MB4102:EE_
X-MS-Office365-Filtering-Correlation-Id: ee641ff3-3303-4b15-3f12-08df44ce7cec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|82310400026|36860700016|4143699003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|10067099003|261022105027099003|261021123027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yHgBk3/5oHNHA+pgBTo1yfJfoYOpJB1Mqkrebe2Ny2VwE35Egl4Ppe0RFEBEPF0gj1CLHq5wvoMSFwiLiICU2+3Y+fzm91NtqPL5dJ6lYxfUJ1/W/mkRHJT+T5rt9ADE3PiYqe+TafGhPjYcbsZ+wN6O7I3zADkbbV2ksQeSWQpTy4at0fPE5dUWzxmKm/uvV0nUe6aNF3+gFBo75CEn39fDQNjN2rroeXLhxPaBlu0GO5ncxVyQ2kyduJZJuq8/IinEKZB+Eoj/QI4DhRvQf5+fDN4nGGcXlUGW8Yv+mt/yvU9vf/EZYVgPpfVsql/UYFD7tT7lspoFoUMpFLc/JE6LvSAw6onj+Cc/SThLD3Yo80LqHPwEOnAsG3LGoSb8gYCuqUA8HZL3Lw7c4hVWMIq/wPVgjp6xd1uIZmKVpMOVcSlnMQdwPImuFv9zckkJ8wUzNUtqf8nWcCyb9KNy55WHVX+1JRsxe01b/UphvXbiMH5a1e8TUTBlpadv4kAy5IO1GnY62dMzNE+yhRwcHCKZuB39/sziAapjEo4oMOCbH1WFWBtCaxjfenxNEgLIKoyLiG3GgmoPLb5T+d6ixNZyGKJLAmUT6BoTd0HXLJSdsou3msfJJTHXwncwYSISalm/BVP32YJIIo94tG+e5MuMytbLdctxyFazLJMfKaNZVr7vkeFbor88XtzKTYuLq8+2opZrjDj+a/c/aufBEA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(82310400026)(36860700016)(4143699003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(261022105027099003)(261021123027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9ZzyoAOJ3LbDT+2jXtZp/m2kEPMGjMJR+KtOL4hTQ+oikw9jbFphbK/H//UO2FXqQ4+22FBqVTzyCe9w1Zz4Cf3h8kDm0AhVsGxlZNwiXjyLoj69nmEfMHdYhsGxXlEIxynhLewEOkOAjKrYsfnBHlEclplK8ubbN+HFCwUMXIfaQhlarQEWj0XdHDVadbZGYT3tIKz6hUZ7g2q0e+ocAnurtnclbHI5mGFO1X3N1J2joeT/uzi6nj2xWM8i5ozjTD4cjnmfadOmki01ZFHztmj9SKkDdrwblEw80Bjo37P/SKQNWkQ3BbKOUfAJuUjVRXSoHiyi95+56itchTkvgwIklwuepEGCO6XHIn/oZRcHmbcNfJlr1oNmkJkMttpzIYgh/O4WYqBEkeVkYiakEMnNLBA5QClF7elvKtxzxV76b/oT5GLgwD+neiDT4TAX
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 17:16:15.8800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee641ff3-3303-4b15-3f12-08df44ce7cec
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000052C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4102

Hi,

On 11/13/26 18:12, Conor Dooley wrote:
> On Fri, Nov 13, 2026 at 03:10:39PM +0100, Patrick Delaunay wrote:
>> These bindings will be used for the SCMI voltage domain.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> I don't believe these are bindings at all. Where is your software that
> is using it?
> They're no more bindings that interrupt numbers are, since they're
> defined by the firmware, rather than what binding headers are normally
> for: inventing meaning for numbers so that we can have an ABI.
> These numbers arent even fixed, changing the firmware can change what
> regulator these IDs represent, although anyone who would do that should
> probably be taken around back.
>
> IMO, if you want these definitions for your dts, move the header to the
> dts directory.
> pw-bot: changes-requested
>
> Thanks,
> Conor.


Ok, I do it in series V2.

thanks for the review  and the advice.

Patrick

