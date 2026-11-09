Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794247862;
	b=TdaxbnmtUeqS4ng4VUMi0rJK2Qm6vj9QXIkK4ReujDHRq2qXwTaOVHzMGURP2Mz6DEVp
	 UXDJrZAFBak4C7kl8DRBLfwfb/Nox3KKwa+Ffsro+PhJvE7aV1omwOs9ctv2GyfIS4HYj
	 mHcM0X3QZRW3fElEvoAB7Hwod8yjIW0iCmXqiWnOdj3POwN/Nm4IUS5/L1NI9Ylx2ghD7
	 k7vK73izaTmDBI40qqjmHaKBF/OmUECVdQrPjxAOSOL8LkeNafjzU0aRd3yNsPonAswBS
	 aKGtO667N2Md2gs0womwOItC9wIml2zkUh2zeYWhKiLrTGm62igeW1RE7naJIYCDpZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=x0KbJVYhHdsyjOhEkb5na5lN2iHLxMsBfKg4rmRpzPs=;
	b=inS9Jvfa8fFrJoJI7KtTpC2g6r3Y+ezrfIh0gbDSHO2P5NF8rmyyKN+hNTBU1tOicHpW
	 549WlgJ6KIhYircASfc7GC2sn3hotcS6vZXSUsSxiZBjiIdTXfPwZlie34Q4fXQbSfIDZ
	 ySz10o/rwWTwVDCeGWhJZn+z6PFDMNyAOh1ZUjqLvPT6pwesSwMwQY3vy8wvSmPoO3ecF
	 9jYm9uWLZya7kFpV3cHf8lBdS6sRioA3+g7i3BInOLZ/qqpa02ZJooIX7d/BB6Jvomwfq
	 TSMzQiEFpzQLMQGMbtqyvxrmcen+dZESN3Dc1N0Rn7qYyHM4dW8KGS6l3sTiKre6XWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=p1hXL+yq;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=kabio8NA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558D7606A321;
	Mon,  9 Nov 2026 18:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 558D7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=p1hXL+yq;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=kabio8NA
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9HI3973293889;
	Mon, 9 Nov 2026 12:10:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=x0KbJVYhHdsyjOhEkb5na5lN2iHLxMsBfKg4rmRpz
	Ps=; b=p1hXL+yqlbv0XASV1McGVXoFG9zfTGEAWhjanwNugSUxNVz3OUN6lWA7+
	obO2AnVgN4gAPaxHbMgueb9fEFBfac5NUJlIQBc4M3ljDKD603ICFuwhvscI/jmq
	2+ydYbDReQYQIlHFFTXuW+Ix35/NZOTkoLE3+XS8y4DO5WF0agneF9J1rXYwhKCt
	9W1N8JeOMqz9IMi0gqq4iwRVwLyScWfsnYXm7vwFHBx76xfTnZX4uizWkx2L3CVL
	nGMdG6r9wawjUOJT6/j3lHm+6SW6Wv1ee5zny5NrCokXw44mO/WmZIWrHDoL6p5X
	2rH8mTV9TOA+2Z8Ov8qZhzAkotWqg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012055.outbound.protection.outlook.com [40.93.195.55])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4htm0t02gj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 12:10:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FRO5U4aXqGs4S0tJsQSwJi0ReKxk8EVmty+ktr/z0lC2oMwd0/QXy5SjKtSt2/ChB6CYBHsH46t4p+0k+zkfJFg9zaxbTy6CZXCQxKCABcg6DIY4sb+pjpUeg6Wh1hCNroVgDi8PSkzsdMJL1j4uuVVw38EDnID/Xu0VvkOjdrzM921p1zUUJoW/845ccnNgn31IEvvc8Ek39c+hHf5DgD2bbl1237WwfodTJUF8zCGnXY8bUGPT7B0Ekl2pyV4hFQUnRfVLhB9gU5EIM3LDpl5NVO9CMZrZ9ntGB2Z9tINx8y+NrLF15ul0/quvSxUnpcCz/T7fPZNG4s3m6S5V2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0KbJVYhHdsyjOhEkb5na5lN2iHLxMsBfKg4rmRpzPs=;
 b=UzFNu/8HPjFDNG9nMOYRHgX4ybhggcfY3Dbg0PYQlelKEHbihxJt6rjRxZn53DvOeXy92sfySxLhNw8w1nIzerB1PfdnsUO61SVXJHaMiJnU0wxZydyi27G27xUYpqD3GrXOCusGqiyU1KfSW+BZ2e+L+4rARNM1hCOJyQHi+WZPB0lgcBmFIiCuSWxOh258C6mN9XI+R5OARXmsUvqZK3A9JpY+YyugTdvg5EQ5+zqigThhYVnapziQNgQpv4eWwj7TfT1xztKrvFccGoOiOJBdzqORRa4DeFP4rJSWUN73VextjbADDSOVgcLsbHZ8GEeDXA8QKrt22zD4PPWncw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0KbJVYhHdsyjOhEkb5na5lN2iHLxMsBfKg4rmRpzPs=;
 b=kabio8NALFTlwYYgy7wdOh7tS0QzwRfKRhqb7oQFYEqiQvNUFAKaD6dJCV6J47NVUzsPbVvxWNh1UixRTPtHHYl+S8jULgk8RceRmVrEpwSLsMK2JoEkEw/7pqrpM8mIB+ohn+kKS3bOGHK1bByREw928WBAWrmKnZYRNO49hN8=
Received: from CH0PR03CA0203.namprd03.prod.outlook.com (2603:10b6:610:e4::28)
 by DM3PPFFAF8DF58B.namprd10.prod.outlook.com (2603:10b6:f:fc00::c5a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Mon, 9 Nov
 2026 18:10:46 +0000
Received: from CH7PEPF00000019.namprd21.prod.outlook.com
 (2603:10b6:610:e4:cafe::33) by CH0PR03CA0203.outlook.office365.com
 (2603:10b6:610:e4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 18:10:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH7PEPF00000019.mail.protection.outlook.com (10.167.244.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Mon, 9 Nov 2026 18:10:45 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 9 Nov
 2026 12:10:10 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 9 Nov
 2026 12:10:10 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 9 Nov 2026 12:10:10 -0600
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.75.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A9IA8xK3363147;
	Mon, 9 Nov 2026 12:10:10 -0600
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <linux-arm-kernel@lists.infradead.org>
CC: <b-brnich@ti.com>, <praneeth@ti.com>, <r-donadkar@ti.com>,
        <devarsht@ti.com>, <kieran.bingham@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] arm64: dts: ti: k3-j722s-evm: Add orientation to IMX219 sensors
Date: Mon, 9 Nov 2026 12:08:59 -0600
Message-ID: <20261109180859.4139929-3-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261109180859.4139929-1-t-lannynd@ti.com>
References: <20261109180859.4139929-1-t-lannynd@ti.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PEPF00000019:EE_|DM3PPFFAF8DF58B:EE_
X-MS-Office365-Filtering-Correlation-Id: 9decd084-5cd4-4fe4-8ec3-08df3e8cc62c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|261009223027099003|261021121427099003|56012099006|261022075727099003|261022105027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	kUARiSNJfsBM7lJTBv6YmM8HI4KVUCkjp59YEx29zTHyAjNMnaFosNuLktIlRVlmqIeoNPpqJquRXI2SfpfY8GQ9GuSUXkHRzTXD0i3lxKta32vVF46hzCAlumdpPrncPPlR6koHt9f2x4y52hJv+rpUocpNcCIjymDMiMj1dbJ9vuMMHyj6BFAj5o014E45I1BRgU3eIxwO03i1fYzJlowVIppRJXEmKhYT4vMEI9gHYeojCAvV+f3UbkVDIbvC48ILz8Eaa+uQ5XvqzYAgzZe5zNERJsWa1l4GJFzlRdb71eotWBgF2379vFXNydz/y3j1HdPuwRCjZ8Kz3mGYyrLrNwAZH1toivNJF5947W9EqM5d8yjb74FGQyRuUc0aScqAK2pMC35cayjU7W1ROJdxgulWfSyb+K4TC900ITIZNC8HojF1SadrHFPlkbTv8xlhAPRWbYKWOj8N4urNKd+0GsT6D1Bp6dxD1fCzRtXkYuZEG4k+V2EceLE8oLb31P6NXyVe8T43Gid1xxHYH4DfQeK9k3XhfgP2ZUI+XTd72W+a4lXP9bbP5Z8Cu3GjVe9OQ6sm4p+KSsBdAr+tV8t/JX0lE/LojVmX+TNZvtLxsqFpRwHaFZ/L0FUNMaSyb9wyP25f+2WDeh9rqS2HfxMfiIVy7gesSS1SbdLug79Wk3XfybOlEJ7rP8FBC7u84LMdFUOsf6Tc33kmK51VZA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(261009223027099003)(261021121427099003)(56012099006)(261022075727099003)(261022105027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ASFTInvUkLcMMIH48DHuqZVe6O3jz/oDLY3U0brsfS4ucBrYXmPJW/j7kf3WtXZ58BP1oHfjYyVnHN3CO5aKeimn3PTx0P2UImvrDO8o948Mt3Fw6Cl9USPKWT1nNcDP2WGAFefp7S6ayApynU78yn18aeIDk7uhqbuDky6EX57RUcng4jlZr+tQ9LHr1sZMFk+jwwVvpYBazberGjTkkN2L32L/gN2JRChPGM+NwpyVaDYa1e003CZ9d0PknBzyWrQk5OXkfzMSrBI0bEvO72i0GwKqUVlIiTEbecbAodlZcAuPoSnTevziEzkYtrRD+gr7paTNTY/uXZoqtqeqK47aqcxfwpajh9zLvz9k8soUiKH/tBz3LFthJhr6Cjzi4+UYbZiyzioxG1B77FrPjWQmAogjmwkGRQB67SLG+iXo2jMKFd1OgtxzOrk2Wk6t
X-Exchange-RoutingPolicyChecked:
	rQ/M1SzlgSuUF28m6F9NKaHrdE26Y6wEq26TXJOKVYS24bfd40NWmvpozxNGkW5EC9GXDUSr1TgSSnnLsOcDatTpRR3dzW9ZoBCndmj2Yw5fc7J+KQfGVFPSyQW+0S2TIYvYENJ2NnWDYxSTq+Ur2EJafs8ulYkQNf3OPNqlXf781q23dUkoNrMaEAG6uIO9NlBKNW6YS2tT8aRkoSZbXlGll5hNSQYSxPS6mWqhRT0MKz948YQ3HYs/UN7QCwVIslXMV7hYCz8+qILSUvFVYa2abp/hBqiBfYX2nRTKuRyniMrRELpxTCiJTjQldwrOHu8xuqIUXQ/ocCnJ5vPpaw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 18:10:45.0042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9decd084-5cd4-4fe4-8ec3-08df3e8cc62c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH7PEPF00000019.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFFAF8DF58B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA3MiBTYWx0ZWRfX2zkSDKWpLcfd
 jTopmaUrz+bLcx7BjHGte8tylU0EUvd5ehvjNPCQJhRxgZdB/lZlTMUMiJBOCIauppNruoyt06W
 zoLqW94x1A1pTP84peJPc/GKnmWGdPM=
X-Proofpoint-ORIG-GUID: gXq8sP5UKjk_gh8BtVh4djJHRSblJ7T_
X-Proofpoint-GUID: gXq8sP5UKjk_gh8BtVh4djJHRSblJ7T_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA3MiBTYWx0ZWRfX83I6OPTtA3dM
 3LrnEPH34Kf9b83pdGdHsJsru/Ezws22/jVOXzCPJeZzSodR37jHhMcy3l+yMaxAnkhMMhvQG4R
 eS/LYHTzzKa1IV+EayaGgV0SKSbORS7gBNKhi/M+8eTuX8YD+0NsXWDh/RwUtXftWg9ZufzFfcH
 G6BaqK4QzKx3k8+jt/Seuu7XfX2g6rDquQAbzSJkqcduRm6KhS3+wVkp+YkT2syZBtZ8ntG9XlA
 9XaWW88LxB2/0wlal9wtrW06ybP5xpefkpFxy2PYhWz6pOQnr8PvHb0xMP+ifXVy+P0aZmtVkuu
 Fnp8Qt4ur3Fz5t1UlOHxZ7vdplx8TkviKdvR5EQFOEWJu1MI3Na3WD94Br4DeZU4oxp165+yJGs
 IodWOk9uvyrIyQ7OTRvpKWkujTkWFilxfYVUo7IIAXMUKl00XeGhSjwgKE9BxFvB0IuajiPRchT
 GSbdLi1HykMRWGQx3+g==
X-Authority-Analysis: v=2.4 cv=Vt62kO2n c=1 sm=1 tr=0 ts=6af20cae cx=c_pps
 a=QXY2dPTpL+Q+r2h5MCHSUA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=xv0VltNXehICBi2KSN0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090072

The IMX219 CSI2 expansion modules are externally attached. Without the
orientation property, V4L2_CID_CAMERA_ORIENTATION (0x009a0922) is not
exposed and libcamera fails with:

  ERROR CameraSensor camera_sensor_raw.cpp:465 'imx219 4-0010':
  Mandatory V4L2 control 0x009a0922 not available

Set orientation = <MEDIA_ORIENTATION_EXTERNAL> on all four sensor nodes
to fix this.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 .../boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso
index 4107ef8c7b74..5d03e199b321 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso
@@ -11,6 +11,7 @@
 /plugin/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include "k3-pinctrl.h"
 
 &main_pmx0 {
@@ -106,6 +107,7 @@ imx219_0: sensor@10 {
 			pinctrl-0 = <&cam0_reset_pins_default>;
 
 			reset-gpios = <&main_gpio0 15 GPIO_ACTIVE_HIGH>;
+			orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 
 			port {
 				csi2_cam0: endpoint {
@@ -138,6 +140,7 @@ imx219_1: sensor@10 {
 			pinctrl-0 = <&cam1_reset_pins_default>;
 
 			reset-gpios = <&main_gpio0 17 GPIO_ACTIVE_HIGH>;
+			orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 
 			port {
 				csi2_cam1: endpoint {
@@ -175,6 +178,7 @@ imx219_2: sensor@10 {
 			pinctrl-0 = <&cam2_reset_pins_default>;
 
 			reset-gpios = <&main_gpio0 19 GPIO_ACTIVE_HIGH>;
+			orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 
 			port {
 				csi2_cam2: endpoint {
@@ -207,6 +211,7 @@ imx219_3: sensor@10 {
 			pinctrl-0 = <&cam3_reset_pins_default>;
 
 			reset-gpios = <&main_gpio0 21 GPIO_ACTIVE_HIGH>;
+			orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 
 			port {
 				csi2_cam3: endpoint {
-- 
2.34.1

