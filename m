Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAFB3672AE;
	Sun,  6 Sep 2026 17:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788716697; cv=fail; b=Hi09M2+gwmShYZFvSrKnX5WfK7CMv4bY0ltfjoE9trxo53ZH5j2GoqeWiirl0n0UAayCfTfodm/QxUrFEW+hHqjCalEqA+JOzsr8M5w2ubyZ825VjR8RKtmlDToqsFD6c+x/YqrBwJH/Zyrp1dDvwSi+5pwXxs0QEpwuBrgCu00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788716697; c=relaxed/simple;
	bh=D1wF8VdR8Fq1dMCBd/K7InOpPYFnYqk+t6G3b6KgafI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BkQdoyyn9KXJiUP1xQpBmrJ01nolr1IpWqq7mraVuoRTxdc2fdT4jpm8HhBiL3Q0kW4nDbgdbv0b02ifysJjaGDWnpSBrpEX90PGo6xZCMfBGR41DVJ7rUOgi8wH3Ybrza/uU0Jrd2B3PCPuHofx/jeH4NXssxCr7dH3W6TKKB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=UthMM+Ct; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OSiSkLh3; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="UthMM+Ct";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OSiSkLh3"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686EXnZm584907;
	Sun, 6 Sep 2026 12:44:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=XtPwgkw1ptvqVMAfhFiDHxrXH3SZj4I+L5q2zMawe
	IY=; b=UthMM+Ct3YAaW05sjFsRwYwXcKiI5vPsPJcmP+c008E/ojlrHWJ37+RW4
	UHxIOrs5aAsWuU646T53aXiznw54dpTFYecETU/oMmFUVraCRNAy0aHsKg93klTk
	6h++T/jAxQlr5vco9sNiKEoBaLtUCDdKZpQoCblImLNEtdyHaVTSked8q05Ir9Zt
	mJiaxTB1Gve6lWl/16+HZ2l9a4dESeQ8zeetEUAGzVuZ4OojEwhczZSsdlxnVxya
	E6/ANxpDbDObF5r2PzROfOaGaiv/3gqZNXTVrQN+PqmYKOaqCdBbiFX6uYLjkGlD
	wmbZw6/yyaQOVcOEku5ai1g+3jDRA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012001.outbound.protection.outlook.com [40.107.200.1])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gh27q1kps-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 06 Sep 2026 12:44:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scwiKcA8cQ5dwvWKjG564aE6zvRzIhdQ+CL6ORDgkdjM8USsk4h9U98eJ6DM3GsmMyGA7uYIp3zL5b/Jxo+BzuoAnY8+TF1tUtXwO2bMucsKgq5SbjpMvEmmlCf+atgDwQk3o76tu6s+BhJGB3u88hVeLw8GRgxFUfMKIdVMJpy6mTZ//JDIcrv/6kFWuw5n9veAU6GX2WZU8JnMA17YfYgpD1aXNSppTBIseeeiioWDiBBAkR3hXKLWahy3mmIAouZMkBvVEzM4f6WQsC7h1+7Aj73VoaOzWAQ1qhDZDZqVTONCKzXtpeaeNXjW2RB3MWgoez1vKr3v+Uk/7GY9JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtPwgkw1ptvqVMAfhFiDHxrXH3SZj4I+L5q2zMaweIY=;
 b=Ymlc1QKfDGBX12MIyHtvJGjq+SvV8Ep54BUHr0rlxnU+LQvpydyrm61D5qrQ5OzfXTc0IrWpe+kF0J9otHsnJTR+xtqPbJSOH7lwXAlSZziL0AS+heCqgO6LoIb5GU+sdpzhrbEzakDkcrAu57cMS/ypr00F1o0Yc+djXmhWQgXOLnsqsetD8YkIoRIik3PgOmfDkSiAYF1oOrJpy4ww6uuTSHenpDLKOx2yr0pHD8Hd3gvqkXKZXYkPwaTwQfnZxjVMIBo1xbOyksZ6vL+5tjnCqQg4ulB0dJgMfjadN44cgyAfNqpp1vJu6aIgSu6A0vc0O0PAK6JPkNU7cYkUiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtPwgkw1ptvqVMAfhFiDHxrXH3SZj4I+L5q2zMaweIY=;
 b=OSiSkLh3U5Eb6wcMkYddPgoapaXNG32nIMSQxmoqzNjoBnqXGqI6ask4/vOdmh8ANmnZ+/vRTeZ4tyYCHFpvi/aJBWW6l63QnhuRgYTFyEHARrhQqDbgrGSmLArUpDTCzufDLfvQpx+JvSnXSGueQJz/cX45Rr+T7g+8rcO4Axc=
Received: from SJ0PR03CA0360.namprd03.prod.outlook.com (2603:10b6:a03:39c::35)
 by LV3PR10MB8033.namprd10.prod.outlook.com (2603:10b6:408:280::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Sun, 6 Sep 2026
 17:44:43 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::a8) by SJ0PR03CA0360.outlook.office365.com
 (2603:10b6:a03:39c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Sun, 6
 Sep 2026 17:44:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sun, 6 Sep 2026 17:44:43 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 12:44:42 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 12:44:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 6 Sep 2026 12:44:42 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 686HibSt006517;
	Sun, 6 Sep 2026 12:44:38 -0500
Message-ID: <6f8b015f-51b5-494a-b306-ad0f0025b5a1@ti.com>
Date: Sun, 6 Sep 2026 23:14:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-j7200-common-proc-board: Add
 ethernet alias
To: Francesco Dolcini <francesco@dolcini.it>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <u-kumar1@ti.com>
References: <20260811061351.2538688-1-s-vadapalli@ti.com>
 <20260811061351.2538688-3-s-vadapalli@ti.com>
 <b7147489-00bc-4f55-bfe5-2c9cb675c7ec@ti.com>
 <20260906153114.GA3576@francesco-nb>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260906153114.GA3576@francesco-nb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|LV3PR10MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: f54974c2-86d7-4f7f-71a6-08df0c3e88ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|10067099003|6133799003|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	sYHYluF94bg+o4KJqZlZi45sd9WDaZlnwmxo0xCRo8panlmtF1ekwRWZlfuMY29s6Ag+U+oJjGAty98i02uD1s5uDW+5nQfhGMkDvP4xVGtBfiy376cdzAW7BKg3mgmlYKPuHeVzZ8mbnSPE7BFbaawOaFVrPpS+3U5hW18GFvxwFcnWMyuPtotCDy54NB2+YQ+aVfx2nmLpXHNegtViJG1DFie8g74eVYt0R+WySk6AliCV4K2jz6jxgnnf3TDV7eKOvk96geZDreGIJRrh4A1rLHLPLfyEBm1/w69atz9pDpgdoi4KmigXLEg7vOs00sBrgkGkXv1Kvz+7Aj1c72g8QUdsidCTDUOr4xQGKzLuMyivDQ3TbSIWVVQGur0TWATW2FxdMU0hhtyTmz3n8bKakHBT9r9QnRUhF6Ne6LwmSXxojEBKwusmK7F8wuaiBPUR7TVer9dV37rICIBR5v3v/HbGkA3Z50I91HOlwY4VzY4nsbbFuOPKVirASy2GMWYAVmd/tE9khTL2CJgS/riZHHywPOPYluPrbKak3vCV0yT2JhSmtsMytVlxtlNlPssZ+Pjc+kOmQvM24wPAYZOEPS1RSTv8e8B8f9v/HFXm96sCwfP5Mu35plWX6+gcsapBWP3k3OurD77cq0AsVLnmTblfBP5AzoXpFQRfsFwEZqlIijWo48CQMoZ4hxRZs8ZlFcIwdGcBdevPbu6SSA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vRhO/cak+gpFq0ddN35vUca+4e0ll9RjGb9FwXPfojNatqUPPHM4/SJ8vbCa6yS+TsPwwwzHq+wLoweXSysvqx7qeH5qtlZrscMnzLS5BBtPdo8Jc4gNuCna47jnuRCJOxdPxiynUq85dc9PxBu0g5LnaIJ4pYVwql68kBGntKHOOgawCH4t55I6pDKt+uTYUrdHnwFFMsO1uLk8igPCjqn+xAlYUnjpoGckpyviDzLciEWcK010T+ZFqYOjCZfSdq6eWnlm5LTt0jQUl9puB/moJrhobC706n0V1zb0y8FHff911ErEkMpZVdrdWD535pzIAEWlICT3TFP/jbE5qKRntV61yHnk1I+M9jcgPz/lMCXZEXqtull3LkqvItOPSBLPF4RbBSaoEoO7Bd8StWv/gNZETkP0If5vvLpJCQ1Q1cVnrJXXAMn9wS/tA74p
X-Exchange-RoutingPolicyChecked:
	mZUfL+8h/2K7loUz079o80iLGudIh6/BFNlIpZeYTN01b05TAuUi64rlvj06I0MmyVW2E2ycgn9xffKbZdNPVvweYveyOFlNFHN26vEbulz+4LDEnBRomVtd9Y/ZUybSRahGzGJjuuaCy2EAdUhrqNaMxbRXip9bsC1aq29gRTgnsJljDOdf7AP9iCZdxGfTd4TPDKxvSgsCM3UG/Qvxuw4Q/86QfM17UBHtlo2JKU+DDlTZ6/LcGYSsZP8Bp9lnDDrT34DlmDMcVz+xsgttX+1Qvj8Coc67nUBCzhHUH+l7jdhWvqOwsWEik0FzObutWx3YSSsBGJEW1EXUZQmQUg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 17:44:43.1074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f54974c2-86d7-4f7f-71a6-08df0c3e88ca
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8033
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE5NiBTYWx0ZWRfXz6bOJc7PWkch
 E3K04cnaOUiN+6ycuIbBgIMWx1lXvxvT8qmQbbTf1P2bA4fKJekvCXwWs9wsvzLVF0bU5fhdXmO
 e1gIfswvNuIFK0+vuzGMduIZgRYhluBjWzG16utpTcGAELthAHHHO3Da5SJEp8IKQbo4Ui8nTrq
 i6MgPqT6DgtA6dbnB6dD9gvBon33GQKqpyOVy7GC/IpEKWv5iKCBNlM9cHf4EvUSd973weGff7A
 ex5Az+iJCrylzOI/QMpSm+IJ1kCY3eXO3Q/CPZSCPMQvzWEUFfkLOzVx16KcJ9Wod28A2rz/EOr
 64ovin40sfpy3SDFlzo+bh2hmY/6t1k1OrieEJatT/10ekYs72eHuJRRM998KAyHBa/Ow/Xw6d5
 rLNPMfpjEEa5Cy7En4NATas3Twe4at7yEBixl4LVQCiMNNrSp5oesxV87spZFaCroni7EjXLBVX
 r3MdKrw+pgqR2P/OSRw==
X-Proofpoint-GUID: PGyVIxykxhttMW4o_dOcJEQr4bZfXmqp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE5NiBTYWx0ZWRfXxyncvsx1gfMr
 vS2oWsJQlPZ1e7ipBhzPwLMNJazujO5UaXP+KNGU9R05KfX3ajgBLYsGnddrfWLcTeX9hT2lCnb
 pcBlgKrgWbaeu51jyktR5lko7pzP7nU=
X-Authority-Analysis: v=2.4 cv=e/82j6p/ c=1 sm=1 tr=0 ts=6a9da68e cx=c_pps
 a=c79N1uTKLHxLQxOLln6vMg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=QGCHh0WqCkAsZBx7XOwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: PGyVIxykxhttMW4o_dOcJEQr4bZfXmqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060196



On 9/6/2026 9:01 PM, Francesco Dolcini wrote:
> On Sun, Sep 06, 2026 at 11:13:27AM +0530, Kumar, Udit wrote:
>>
>>
>> On 8/11/2026 11:43 AM, Siddharth Vadapalli wrote:
>>> Add the 'ethernet0' alias for the Ethernet interface corresponding to the
>>> MCU CPSW2G instance of the CPSW Ethernet Switch on the J7200 Common
>>> Processor Board.
>>>
>>> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>>> ---
>>>  arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
>>> index 54dea36b153b..ac1c1ffe40b7 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
>>> +++ b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
>>> @@ -24,6 +24,7 @@ aliases {
>>>  		serial5 = &main_uart3;
>>>  		mmc0 = &main_sdhci0;
>>>  		mmc1 = &main_sdhci1;
>>> +		ethernet0 = &cpsw_port1;
>>
>> Hello Siddharth,
>> As default only 1 cpsw port is enabled for all boards in this series.
>> So ethernet0 will be cpsw_port1 always, In case you want to enable more
>> port in default config then having aliasing will help.
> 
> I do not know for this specific board, but in general having the alias
> when only one ethernet interface is present in the DT can still be
> useful.
> 

Could you help me, how alias with 1 network interface will be useful.

> We might want it to ensure that the interface name is stable (`end0`
> with systemd), or maybe you can have additional interfaces that are on
> some discoverable bus (PCIe ?) or you need it for the bootloader to set
> correctly the MAC address or ...
>

fair point, interfaces like PCIe can expose another network,  with that

Acked-by: Udit Kumar <u-kumar1@ti.com>
 > Francesco

