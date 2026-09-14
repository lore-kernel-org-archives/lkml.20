Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E169480DF7;
	Mon, 14 Sep 2026 16:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403104; cv=fail; b=rIFBbMkuXfVWvqctU3N35L8lk2zX8FpLArW99cTToOEp9OnIcfc2aAN/8wEi4l75/6TVwL3BRqERoTLvewhMxgaTG7Ccrm73qlV8i4CLnPUzcdMKzb2e/ViUjuoEyrZGQRypiFuaIpiLFvbKP5VYhZNikENNPb2GCsAsTZScscw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403104; c=relaxed/simple;
	bh=H2NyFLcikGO6P5r3us6HvN4mRoT635VkFhdXvqnTBLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FK8+osKI+mKkcpleVfzzVRw484r9A3BTf1QzfnlTxXrarU9xuVEnX+DmI7BRjbpy3RHK39KSTTBOYWOiPiaGiCkSN6gutFqbyCCLJKBLO7JUKUaRqhiVN+CnjTbbxxkIQL5gmVGrUla7NYx+qzS5RW4LMqaQ5VYV9LJKB+oWfj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=jtZw3E+m; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HRWOFgZ5; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="jtZw3E+m";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HRWOFgZ5"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68ED0jN43343233;
	Mon, 14 Sep 2026 11:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=9hCMJ85fFz73N4dDQCzGJwHbsVhFBknXEcqaSVR2R
	bs=; b=jtZw3E+mIIxjPFmgdD/7KrbCMh1XFNK/hzeiUnPth2cG8cVhMkXMqhUzb
	Sxx90jhzNOiYtLm3+58Z1ihqhaq8/Q1rtSPGnswNLgKHv2T0UgUzdP8U86s1YMKW
	3cyQ5kf6YXpsQkUCHFjlzeu5185B7AEA2o/dgh4ps9suoI3FtLVp/PxLbSfKjPME
	sjRynahlWWyzf7dnvA/B2g6yM57aYX/a6tuqU9sd0AsM+3Bsecf5hS0oHHIH5RUS
	nhZapO4uBjhRTGG1OlL+/ZgZ/CzeXVd9+73jjThSMwF7npYRewcXO9byV9eQmyY2
	FRjbirx2EN2EmD8pS9Z8H2OzukFXQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012061.outbound.protection.outlook.com [40.93.195.61])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gnrpng117-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 11:24:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1c3330DvpK3MfC1lPWUIsD/Awo0FjWD9y/0GX3iKxrAILJbA+MR6tyKPjYYStZg4wFthRCi0aWlBXmVeKgmwrjk02N+NWRWyFZ2+jjLcHYHteOYuHc5yIHQC5q+akvX+7GOIvcHZRf6LdG3lF6wf3OU7cFABvgitVQxnmD8eGOa7CgKZVjtGhFdHTLyZDedK1gsRR7dp0mAaHYntBjCSS6yXdO9K/GuGAaTWUXdQfKkhUZVlCvcGaU3g2BSr3i/Ojybp8cx2WG5Cz5hFC8RFLshYeC+Bb8W3fP0H/o3dZAC1OSOWkm2ludzWWfrwGNHmM5WGYkSIUA8JD9hyw3uCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hCMJ85fFz73N4dDQCzGJwHbsVhFBknXEcqaSVR2Rbs=;
 b=aQdcF2x4CVGlqTg3mSKLL7KYOqjQP8E8+FbpQqUJA21OdKsyBlAd6+lyCc+jHbolPBgBHhWeg0VtOzDn+3wxd3KvuRrZPwRFoPG6k/lAf013+F4g7y9jcjNjaZvQBsqE0X6uHIgikKSGYHqzvKMYfKB12Ph42QPRs+i6RCz30ENOndJPPGHpjSjvrNnjMQ2WqlSgsc+jhrYFKEF/0KbpimWIxW6e8BYmSBW5/R15gvydOm2RhfcRhLtMlvQS16zho/WbXnknzp6uDyIYR6YzGgNeCeGs3X0Fn+9JV/pjfAoQSl8odaI44mKaw8Wii8G0UsefN4lkOrkR+kuIi7MYoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hCMJ85fFz73N4dDQCzGJwHbsVhFBknXEcqaSVR2Rbs=;
 b=HRWOFgZ50JTUjbU7KxjppHVl1jel8iiBiT5fFwKaqp3hyku4dNqH/gt+R2wh/hEeXkyrtZQnwpdImeGvk14YTnQLMUO5BdiDn9wVtcekktm45nuTdDZwyosL0JelU7aS85l59NCA9uAp/DpbUPluuMTTeoDQwJIrKXryLYQL1H4=
Received: from SJ0PR03CA0042.namprd03.prod.outlook.com (2603:10b6:a03:33e::17)
 by IA1PR10MB7114.namprd10.prod.outlook.com (2603:10b6:208:3fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Mon, 14 Sep
 2026 16:24:20 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:a03:33e:cafe::5f) by SJ0PR03CA0042.outlook.office365.com
 (2603:10b6:a03:33e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 16:24:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 16:24:19 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 14 Sep
 2026 11:23:57 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 14 Sep
 2026 11:23:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 14 Sep 2026 11:23:57 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68EGNqbJ2498962;
	Mon, 14 Sep 2026 11:23:52 -0500
Message-ID: <d96034c5-7c21-48f8-880f-9f335dc50939@ti.com>
Date: Mon, 14 Sep 2026 21:53:51 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/15] arm64: dts: ti: k3-am62a: Fix MMC0_CLK register
 address
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Garrett
 Giordano" <ggiordano@phytec.com>,
        Wadim Egorov <w.egorov@phytec.de>,
        "Robert
 Nelson" <robertcnelson@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        "Nora
 Schiffer" <nora.schiffer@ew.tq-group.com>,
        Stefano Radaelli
	<stefano.r@variscite.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>,
        <u-kumar1@ti.com>
References: <20260909214743.899477-1-jm@ti.com>
 <20260909214743.899477-2-jm@ti.com>
 <9a1146e9-0c00-4348-b1a5-31be7c597eea@ti.com>
 <134505de-78e1-418e-8cd0-855697633696@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <134505de-78e1-418e-8cd0-855697633696@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|IA1PR10MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: c10f04d8-7d1f-428e-a96c-08df127ca125
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|1800799024|82310400026|376014|36860700016|6133799003|22082099003|18002099003|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	f2nJeiUl6jJsvTAYkUODI8+2b15mtFry8nk+cqn1uumMT4Vi2KgENXKK4hH/ffaXqomcJkHOVEhI9OIpOkAHyhYqUWwJao4z5fTTCHaETxXKgkNXe3oANvV7Gzz/f/Rcxzmq1J1hzQCvhEC6fUBDUHBFXsZk03HB8izZCkB5FM6iEzWJXy/kDz7BG8tc1kca1igrXbxKbVnKNEonHgY2Q5/n6AWt1BJMzUTwH7czFzoOM9BhyENRN7FxzMUL+brRvaNraqdct72/75a3isy49aPOu6i+toLwL9MERHxgX3yWw1zsS6BI98zKOgSHmRmZ1p/W0vbFyTBLVI/Hzh3k34CHB3F+ysWXkzl2rQlXEJ3IbB/dBFcKj7bb/hN0mlEs4+zBmQJwR9xZvPk4RIDVzlFacfLEW3qEpNXBcJA7hHAZv2EGiOKFg9XpEfgvrR3COyGJqLB0whgri+hRABOfv55R035sTt+/3pmmdPTRR9z8d/VnJsss6jWzcmfEGquyFYsRlLljOQQtpYMbWgRhc3Vg+iXR0EePYx7FhXcwvcMF7/MRdagbLSDeTwkNa74Plfmp8nx3nf1Bwm2sLdm5egEK6OQ655mX9izhxYN5jA4IrDy9gDCGFKe7885rRsvNoaccSb+HtieyUzZ8uf00NCmyr7qc1YueQw+3nhX6S+yfbWt78FYSvxh63Qnwm+N1Blvgz5myDSl+BmZ7UF32AQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(82310400026)(376014)(36860700016)(6133799003)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bOJQ0fwiYK+x+Z3XnOqMJ9gKdERW7SxhMCKI/RxtENDtVM8DAoCxhVBzh7izh4KRQqsKhY5dypFnCz5OFj9JvMOnkoxbqmoDz3mjQir0ys5v/RZqkQaqMjg4nukhNU+Gt+iUsdbB4GjCGV7X9Uda2+wsmFe1p+GnKd4mp2xZjekkAFsmxTLBLfO4vdEQkcQ76Kr9MUC8aR2eYDzZbRfjknFabH9fhPbz0fYwphPGP1DFVX7HzVbuF2HgGBjUDjrHEwbEquxMABFPROsWYdepfyaA/YTpiXqUKNs9+UK8KfcgkXSQa1icAm7MmZ3xK1INR6XtXJx+0hezZbLQLuB+q5vcFVXgkhGmhbxxSwnCd7Dp8/yRedjrcFbd4CzhAXI3euKEPcz+iF7VulSeGvog/kl+/4O0X+xCP6lpddA6h1wtE8A8BTH/Ukvl2NNwguyk
X-Exchange-RoutingPolicyChecked:
	wq4w706i3j8qb/wunRDkZEWLupSVuGapHRobNAKaILjciTiE9WEuq2j8UUIVCtTMM71gVOmYD0caCNt53e4zUOqW69folOgirCAj3JpTQ7xLO5hnephis2jq5xcO9afjmG6kIaflxHUExw0RgiBImpO4ioNzTR+jW5NQbRufeKeRAn0XgMi8Z+ZTIjAS+39J4AafGxbP9dsjRwR8V6vBn7rDD+LiC4CQSLYbC4LsqFlT9F6C40iSBZlEU3KjpWimU8oRkZWRf8XNzqibIGt6RzttIZ9Bd8ssUmxYdh4Yw9wXfRIRNbOuJ/bkDjjN40JRbiqEu7sCK6266bmYIOqdFA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:24:19.7345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c10f04d8-7d1f-428e-a96c-08df127ca125
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7114
X-Authority-Analysis: v=2.4 cv=GfOCDgXL c=1 sm=1 tr=0 ts=6aa81fb9 cx=c_pps
 a=N7UEZcGu6nKKiVkixTDHSg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=VwQbUJbxAAAA:8 a=IsMucyyhDqdeddx0T-MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: SkTJr9HK9wFkaGG2euZh4k9yBQeWqaOI
X-Proofpoint-ORIG-GUID: SkTJr9HK9wFkaGG2euZh4k9yBQeWqaOI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIzNCBTYWx0ZWRfX+drNSpu+JekC
 jDdNmexedQxxhnh0KWVgYLtqwc1BGid/icAo1IWBKjZHU+t2g8dgX/FBiKktwheZrpB+2AQ43Zv
 gFE8909INOBtL9efZ1hINZwVLGNx3AY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIzNCBTYWx0ZWRfX7A2P1rz+VtY2
 V6UQPh67CNrms0Sq3W5QdderxM5CwcWuU+kH6laBSTIeJ6tCaRpUvj2VBlu9ZTb1CXyrTm2niIc
 20nvw24RSchSCBTiyWiXvjdbzaFmHD7U+RWJ5VXE7zo3hl8ejfVd4aaBl9Lq9AGRE5TRyN4VPgm
 ASXDu/aU9kZoGVlToj3u73GeCWfQCjGrEB2iG3kawmqjwB6kJi+oyj63WaMJZpQyA116RkUUQnW
 ZDTTtjasBcVaB9LSfJSBXCCglc7a2LZnkIGroocN2Lh9v8AN6H4RWWqFk3YWc9gnktcBAyDeRQv
 oQRlbIs2zX7YYLLtWdOsDz6X6nCZEgyt5xKH+wtsKnPcaW32A+OvKytPXs+wA+x7XDJDEPfqolK
 Lfb2IjwO9TdC3ABM4N8vkje7MC29Dv/uVbkOBT2k4NCZZQiYlnjCa2xW1IMi7IZBTuBNw9ANdzv
 Vbct4X+Fvhev5ZIRpLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140234

Thanks Judith

On 9/11/2026 10:24 PM, Judith Mendez wrote:
> Hi Udit,
> 
> On 9/11/26 2:57 AM, Kumar, Udit wrote:
>>
>>
>> On 9/10/2026 3:17 AM, Judith Mendez wrote:
>>> MMC0_CLKLB and MMC0_CLK have incorrectly swapped register addresses
>>> as per datasheet [0]. Set the correct MMC0_CLK address and drop the
>>> unneeded MMC0_CLKLB pin configuration.
>>>
>>> [0] https://www.ti.com/lit/gpn/am62a7 Rev. E: Table 5-1. Pin Attributes
>>>
>>> Fixes: e041ec6e86e7 ("arm64: dts: ti: k3-am62a7-sk: Enable eMMC
>>> support")
>>> Cc: <stable@vger.kernel.org>
>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>> Reviewed-by: Moteen Shah <m-shah@ti.com>
>>> ---
>>>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 3 +--
>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/
>>> boot/dts/ti/k3-am62a7-sk.dts
>>> index d3b3675e7a8fc..b04636cab71c7 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>> @@ -328,8 +328,7 @@ AM62AX_IOPAD(0x0b4, PIN_INPUT_PULLUP, 1) /* (K24)
>>> GPMC0_CSn3.I2C2_SDA */
>>>       main_mmc0_pins_default: main-mmc0-default-pins {
>>>           pinctrl-single,pins = <
>>>               AM62AX_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
>>> -            AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLKLB */
>>> -            AM62AX_IOPAD(0x21c, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
>>> +            AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
>>
>> Shouldn't be MMC0_CLK be o/p, instead of  PIN_INPUT
>> Similar to patch [0]
>> [0] https://lore.kernel.org/all/20260909214743.899477-4-jm@ti.com/
> 
> Yes it should, and it is in the same series as  you pointed out. This
> current patch only fixes register address as per commit description. (:
> 

I see. These can be merged into one patch,
Anyway,
Acked-by: Udit Kumar <u-kumar1@ti.com> (for fixing offset)

> ~ Judith
> 
>>
>>
>>
>>>               AM62AX_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
>>>               AM62AX_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1)
>>> MMC0_DAT1 */
>>>               AM62AX_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3)
>>> MMC0_DAT2 */
>>
> 

