Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE983B774B;
	Wed, 26 Aug 2026 12:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787746564; cv=fail; b=SJh0tY//V8HofTjYC9jxlp2MhsdrRzMWV1dnZ+IreSFtq1XJ8dma+65FFLSEPZ5Zte020Yd4XkiCW3rF9YS/iOjN7t06aIH9mzklXgrpDKfFf9/U/PCPPOuiiTf+TkMXD+s6Xu1WNnQRxICBQ4JzWkUIZ5DzG0/iAYc9aZEBIaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787746564; c=relaxed/simple;
	bh=V7C9lVGJPBs631brkwGevEn+8ujSNMS3nUNSYoMTNx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bM8v9OCfitmyPGJSqA6GJAqtJwGg7aE2aaxdyFCsYjXkGFyzK+MIG8lRH6vDGEB6tpjeToLG9q5cLsPnidz+c2xRquguadYiPxLjBLbTJvogSHeccFobaUcB7jsaWqsXrgo1Y4eBQdLKMsGySPiyNWt1EzIt5Z+Jh8rrxTM95ZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Rbl0dssx; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Zc312XKv; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Rbl0dssx";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Zc312XKv"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67QCAtXr174284;
	Wed, 26 Aug 2026 07:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=/AaRltMxx93u8AVWcaRqnxE7NAF+S0HZV0YBjG5wq
	Iw=; b=Rbl0dssx4M4I5LXdvA+W0v6Lz6gEs6Mpeis+7aKGYZic3NdPAHvp+e5AZ
	aDbstZut+5Rodw0+sQPQ27K0cMEe7anmd2Vhct8GRLpYSIVoH2b9k3PKF6SyyxO/
	Qf33fHnkIhNLuq9Jompte3lb1IIocJRWnAuPZ6KPobchIoEWWwnd6be6djnQdjPj
	ptK/08VQC1GojlxTlz3wMs5trvlSB8EmHuuU3Fr7/c83gl/dwivYEuXzP9jaFxth
	bNaGk0arvYi+6dGRpJSIWhG7whsGSVug2fyoUuolO3sYfNOiKre5NAVayF0Dd+4l
	vRVd6S92AFx+l6tPhxfYt9QedNs7Q==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011035.outbound.protection.outlook.com [52.101.57.35])
	by m0380145.ppops.net (PPS) with ESMTPS id 4g9x3h8g92-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 07:15:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzFdoLG9Fz1SfYUK24ixSRFdwBZDbCZ7tVij/49xtivOcyHdil73KZNNZuMrrA/gP1KGawC/voqXyRIUusApjFpgzPhkCLpauLb9uY6CGfFrZe+SqjadlCcwu9eayPlQ1dq0uoTIyR0jIw64Lsz502IKGxxt9I57XGgI+8g9/aSM6fS8VYDQH98WpxftalpGOsy8nOdGOVwbXeQ3I6Da2kjiRnS/ttaYAktFI3tx2MGOEnkGedp3HaI0c47l+li8JBIaUlam6bgHQ7GtaE9MOiwRqJjo0yRucGf5jce7ZfvGCci670EN1SUuqXs/Bn6nUTg7GL/cDyivK6q0T0qRdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/AaRltMxx93u8AVWcaRqnxE7NAF+S0HZV0YBjG5wqIw=;
 b=lZ6EywEXBa/SBiOFeztiSqA4FAgtsC7jZfGQJgvJzJzMN7lQyzzD40MUogWmwim+Tcm3vCLUflRBNL5XuWBKjCxlqDC2TaxgeCaO0m5RJBKeaSkkjhfwud71nRDBl4U7u4wxj+GWJ80xOxAYCc8VAkewIUJO0fpei+1aHDtqGRM3QSmPxGXrJ2zTodxpJo7sLtpcQYYvzv+6B4/Ir0XwYHKzEcVCdB95nnGzPhWhDXzex5F0phYAtuxGS71oK2pLzKoAMOedIFrqbmWNjQMDnWYWLhr4Nx7MCGTIkyZ+1e0fZWTS4DPg4ZN5/nRkKcsKsJvSAucmBnY0dcxkKfEc+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AaRltMxx93u8AVWcaRqnxE7NAF+S0HZV0YBjG5wqIw=;
 b=Zc312XKveNarQ2Yl7jU0ctwNgfrbbuCfu+/a08qS9ENz0S5q48AZo3pghapTjMN5Sfg36/5Zgrj4DFyXpC9p52bsyn7DibRiohkEbzs7wcbgM2MHwoxbqBUo50L9tpBR7lXQW62RbGxDa+vmaxs3pSL83kShSFMOQwk/vSbWG6g=
Received: from PH8P222CA0029.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::7)
 by SN7PR10MB7032.namprd10.prod.outlook.com (2603:10b6:806:345::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.7; Wed, 26 Aug
 2026 12:15:27 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:510:2d7:cafe::87) by PH8P222CA0029.outlook.office365.com
 (2603:10b6:510:2d7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Wed,
 26 Aug 2026 12:15:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 12:15:26 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 07:15:10 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 07:15:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 26 Aug 2026 07:15:10 -0500
Received: from [10.24.51.219] (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67QCF3Qn2966739;
	Wed, 26 Aug 2026 07:15:03 -0500
Message-ID: <07ed28b1-8ff7-47bc-acb9-83f76dca5739@ti.com>
Date: Wed, 26 Aug 2026 17:45:02 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/18] arm64: defconfig: Enable DS90UB960 deserializer
 and DS90UB953 serializer
To: Krzysztof Kozlowski <krzk@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <andersson@kernel.org>, <geert@linux-m68k.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <arnd@arndb.de>,
        <ebiggers@kernel.org>, <luca.weiss@fairphone.com>,
        <michal.simek@amd.com>, <sven@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <r-donadkar@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20260713113423.2310443-1-y-abhilashchandra@ti.com>
 <20260713113423.2310443-19-y-abhilashchandra@ti.com>
 <5e02e6be-919f-46ec-8475-d1190339a84c@kernel.org>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <5e02e6be-919f-46ec-8475-d1190339a84c@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|SN7PR10MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: f1ca9008-0578-4a52-a70e-08df036bb662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|1800799024|23010399003|376014|82310400026|3023799007|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1DNnA4LhvEy9/2TgaqzotVj7vpn/XNSjhEfL8AuU/7Hy7fUIJcFpXyVFWiCoQvb72y0KKxfSfMFDFm6mC8nYczMb6zKN4LbrPxgpB8wPBqteTv/Xf7O0l1AytmFUGnfpeQN8VcjVBjtoMMiBQ7chaP7hfZeVFjVFpZpW7PmbZfIluVYVidtNNVWJ2UjvJCBZawUzInVlHanA5bHyTCFbJmJLSy36zyUkOUhtz6fCatDJxJz+jxKTU9Df9263l96z8z2UzuEoW6G6rCEfIkwD9Bsh+0aCzvupPbQQqfJV7eljIbytRHQ7RF8p454aN7IQHtmN6mxfLQMhuKcaZsaIDwB5WMN3IfGiA1SFlqy5mKQr4Goi3abFldrRQvdSinaHUsxcedGmfGkn4qfc5S4HMv684v7c1HH1bMQBTYv5pPLrm9hCVW1m3GdiZn1S6y02uTqEx7go19hyrrFILk9zHbHO29gvRQU3z88mAQjyTdWirUrZ/mn33vFUV44bOD1x/7xNZ+etqA1XfSIlMwShCD6iL5+kz6GgkSpP6N3phidpgm46jQkNIoxghbm3F44baRG3K5FlsQZYn4xttHtDy/IQTSHGbY8iZpNDg0Pzq+uyEIWjVLAzhMQrCfrx42VrW8iD0mD4WiVua+sJF/OjCjTHLrF1VMjABeEGflsXZO/s1F6FysL08XebkbV2g/TcmIovD7TqKPf1a9aF/8CjPw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(1800799024)(23010399003)(376014)(82310400026)(3023799007)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QJ6PXSpcXdbfAxrpgFKkNoNaKAs3WF7EEszboYpCiJ6jfr58lm44LoxkgPJs1E1H1ORIPEYfrjuxag9iEfqRjartg3WvLzMbhZt5aynJMEivT69+CUreTZ1fFAHBeO1SCpfNb+sbYmR0G+NHSbbOMQucwcfqARTN5QcEIQtuQh7LNM/1Mc6xyXAZGduyjoQQ3jFRvmHW8zwtSJsURlFKdnM1iD0uTWtKwSNXi1L2jiIzKQiVPGNu6mTofm+zEpBV/PsAlq35TvOMddxxT01UD6gROpi8xIrGebSzzBoM6poj8QO5x5XywpPL+24au7+eKcyUHJ+21q4swC466qCfKlHLHCT8+EEVw4O1KtSRfLa6u0zt0gV2fpi0KSzDAkVN8ryX9dfT7YCXp4qaDl+8AIUlI3D4ffEIqIk8a+anmoOvWB8f6GM380Rdw9DXNjg0
X-Exchange-RoutingPolicyChecked:
	T26s0Y6c5UHWeFmDAaQTW50v5CNIaVcSmYWMMQKSaDtBO9OoZp4ivc1A+LznIfW+P9m7fWb2dPQC0haw8YriO20QSY2EfLdMS4KJnqr1Ujr4CnHJsSr6BMaUoLxSx1DCzeKg3Jgw6p9nNSjtPXIHJiCobVCEaxeXNxCO+pjmwQ9jvnnIiYt1vneRytJfXTPEM7fYbZ/mny5UtPsChtdrEa22FnXbN16PtJ/wNReluFg9+EsROUqmkMndNGG9B/v6162OShoYAIYPA49jrbOF2DVBefiqgxfFdii+/dV6gGcCX+ADITKonhTEPEgt2RyGGZSUUKrC04us9yhydkNLUw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 12:15:26.5363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ca9008-0578-4a52-a70e-08df036bb662
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7032
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEwMiBTYWx0ZWRfX2eRNUljcrNfS
 M0dhp5uc0T8yce6qLfaPa6Y809NdAeSbgoQyPaTFtFaUPSL5ZvFKlt/PbakQO6tldZOJXecTLoj
 FYwPEQD5XTFP/JQ/iAZ4na5HBqtVsp6FS/1Yk/lyw1n65vP7T6ZNIZ/5WYM+SBZdbE92OwPAue/
 fG3AoO23GBgX+k3mei3XN6ol1v6847Tc2WDOaiXz76zqj8g+ATuInL3XQpwRjvc8CNh0cjulMcR
 UP8TRiATEvfes4KeVLpFB5zmjaiSqdl5YWwxlNHZz3rDcAUmww3IKcrhgxVpDJuVib6POYRcKwW
 rcMze/rXbMOi+JrqaA+hFr5lXewfA1L1Ui2fna1FcLqk1hVPC5JSyNzSvixjRaJLVmIVYq2WyMi
 QJvsISyxTC6Yo1/8Kuaf/6XyceFCyXb+9FgV0vnJF34/mN8mE2KtWX5qdunFMmoBWOreSx93Yf7
 J0cRp60K2nFZWFtp9ZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEwMiBTYWx0ZWRfX+L6hDp2tMkP+
 AyeZ1Ksn2UTjojUGNKG79kPn16ALMhashDwDNxvY9RoBbpBjuZyrE/9qECUFZU/hABjDdHjerqg
 GK0wKVHc3qyWqvnDHhteYhvl2U+ahYo=
X-Proofpoint-ORIG-GUID: VwB0gawUKK7Jkeew2UAJYHvnETBF5ZMi
X-Proofpoint-GUID: VwB0gawUKK7Jkeew2UAJYHvnETBF5ZMi
X-Authority-Analysis: v=2.4 cv=aZhRWxot c=1 sm=1 tr=0 ts=6a8ed8e2 cx=c_pps
 a=MvJzBjTJNBx6A1eu3kpgJw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=O9LsO-An3-boCupVGZIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260102

Hi Krzysztof,
Thanks for the review.

On 26/08/26 12:18, Krzysztof Kozlowski wrote:
> On 13/07/2026 13:34, Yemike Abhilash Chandra wrote:
>> The DS90UB960 deserializer and DS90UB953 serialzer facilite capturing
>> through multiple camera sensors on J7x and AM6x platforms. Some of the
>> supported platforms in upstream are J784S4-EVM[1], J722S-EVM[2], etc.
> 
> `git grep J784S4-EVM` gave me zero. We do not take defconfig changes for
> non upstream boards.
> 

Sorry, that was my fault, I used all caps in the commit message. In the tree
the boards are lowercase, grepping on next-20260825:

➜  linux git:(next-20260825) ✗ grep -ri "J784S4-EVM"
Documentation/devicetree/bindings/arm/ti/k3.yaml:              - 
ti,j784s4-evm
arch/arm64/boot/dts/ti/Makefile:dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
arch/arm64/boot/dts/ti/Makefile:dtb-$(CONFIG_ARCH_K3) += 
k3-j784s4-evm-pcie0-pcie1-ep.dtbo
arch/arm64/boot/dts/ti/Makefile:dtb-$(CONFIG_ARCH_K3) += 
k3-j784s4-evm-quad-port-eth-exp1.dtbo
arch/arm64/boot/dts/ti/Makefile:dtb-$(CONFIG_ARCH_K3) += 
k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
arch/arm64/boot/dts/ti/Makefile:k3-j784s4-evm-pcie0-pcie1-ep-dtbs := 
k3-j784s4-evm.dtb \
arch/arm64/boot/dts/ti/Makefile:	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
arch/arm64/boot/dts/ti/Makefile:k3-j784s4-evm-quad-port-eth-exp1-dtbs := 
k3-j784s4-evm.dtb \
arch/arm64/boot/dts/ti/Makefile:	k3-j784s4-evm-quad-port-eth-exp1.dtbo
arch/arm64/boot/dts/ti/Makefile:k3-j784s4-evm-usb0-type-a-dtbs := 
k3-j784s4-evm.dtb \
arch/arm64/boot/dts/ti/Makefile:k3-j784s4-evm-usxgmii-exp1-exp2-dtbs := 
k3-j784s4-evm.dtb \
arch/arm64/boot/dts/ti/Makefile:	k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
arch/arm64/boot/dts/ti/Makefile:	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
arch/arm64/boot/dts/ti/Makefile:	k3-j784s4-evm-quad-port-eth-exp1.dtb \
arch/arm64/boot/dts/ti/Makefile:	k3-j784s4-evm-usb0-type-a.dtb \
arch/arm64/boot/dts/ti/Makefile:	k3-j784s4-evm-usxgmii-exp1-exp2.dtb
arch/arm64/boot/dts/ti/k3-j784s4-evm.dts:	compatible = "ti,j784s4-evm", 
"ti,j784s4";

➜  linux git:(next-20260825) ✗ grep -ri "J722S-EVM"
Documentation/devicetree/bindings/arm/ti/k3.yaml:              - 
ti,j722s-evm
arch/arm64/boot/dts/ti/Makefile:dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
arch/arm64/boot/dts/ti/Makefile:dtb-$(CONFIG_ARCH_K3) += 
k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
arch/arm64/boot/dts/ti/Makefile:dtb-$(CONFIG_ARCH_K3) += 
k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
arch/arm64/boot/dts/ti/Makefile:k3-j722s-evm-csi2-quad-rpi-cam-imx219-dtbs 
:= k3-j722s-evm.dtb \
arch/arm64/boot/dts/ti/Makefile:	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
arch/arm64/boot/dts/ti/Makefile:k3-j722s-evm-csi2-quad-tevi-ov5640-dtbs 
:= k3-j722s-evm.dtb \
arch/arm64/boot/dts/ti/Makefile:	k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
arch/arm64/boot/dts/ti/Makefile:	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
arch/arm64/boot/dts/ti/Makefile:	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso: * DT 
Overlay for 4 x TEVI OV5640 MIPI Camera module on J722S-EVM board.
arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso: * DT 
Overlay for 4 x RPi Camera V2.1 on J722S-EVM board.
arch/arm64/boot/dts/ti/k3-j722s-evm.dts:	compatible = "ti,j722s-evm", 
"ti,j722s";
arch/arm64/boot/dts/ti/k3-j722s-evm.dts:		simple-audio-card,name = 
"J722S-EVM";
➜  linux git:(next-20260825) ✗

> Also, you still did not even mention which company you target.
> 

Through this series we add support for these on Texas Instruments 
j784s4-evm, j722s-evm,
j721e-evm, j721s2-evm and etc.(All these are supported upstream). For 
simplicity I just
used the two latest upstreamed platforms i.e j784s4-evm and j722s-evm in 
the commit message.

I will also include the target company details in the commit message, 
something like below:

"Texas Instruments DS90UB960 deserializer and DS90UB953 serializer 
facilite capturing
through multiple camera sensors on various Texas Instruments platforms. 
Some of the
supported platforms in upstream where these deserializer and serializer 
can be used
are Texas instruments j784s4-evm, j722s-evm, etc.

Hence enable building Texas Instruments DS90UB960 deserializer and
DS90UB953 serializer drivers as modules."

Thanks and Regards,
Yemike Abhilash Chandra

> This is not your personal defconfig.
> 
>>
>> Hence enable building Texas Instruments DS90UB960 deserializer and
>> DS90UB953 serializer drivers as modules.
> 
> 
> 
> Best regards,
> Krzysztof

