Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794417100;
	b=jDnUDXmiKVGcVIT2850Pv4qyitJ+uYWcn8Vr3SUa0B0ZF0iaMt3bGXPVv+HdlJkjiI4c
	 hTqnhM+Ino+KE1/y1Wek0EHVtBDszesq8EByUsFA4ILA8zNUq03wb3yNBzo5NZuNm4Ewh
	 CaiLUsxVnB245pWZrB4BaTSLvy8843v88wLDNY80nCrkDuRvNzV7b9pfElTotF0wv2PCB
	 iIFaavRoVUfGBkXx2+yY3kiRed9Z8oeNc/mR6WAJ0jB5lJK8AaE5/xV73eoe1aDUf+mKZ
	 TkRyOxKCYMXnVNpC0Bs+usxR8ibZSXduSxPOqu/GXIa9Qrcio+ncFKSRLOvJEPnDKhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417100;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j44swFNWreQeP9wiM8B85prMtqbDh7ScyUkYkb4cdqc=;
	b=AgBubgwiuS3CW2MjoyLphkmISY/+ucKEe5k1eBH1GFWjlXpXzHLAQHcHNzvsRu+jzqGJ
	 YZfSxpqg6H1zPZ1aT+zBnL7LfXsQft5WnOn1udWLpBUR6CnBjDZm5dRHDScZHgofYVY1T
	 5hRAW7ktBKUM+16Xxp2SbQ/PCpl+52aYe72nE7fa+YJ14nNQRuOmteRXCk9sYw4HcaUUS
	 0QLC8XqvWXpt4POCAUv62elzLVbhCnmmz4aXxLkgjiW1KM1ZEzsG/tGc7HX3EC4A8pkwW
	 wQch+6/LnOk2K2vXWxyU8sSn898SoLxVobviqE+K7i69zIHLpYXl2v6KICBOSF66oyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=iEpukxrF;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b="kdvft8L/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59688606A326;
	Wed, 11 Nov 2026 17:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59688606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=iEpukxrF;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=kdvft8L/
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF2ulf981001;
	Wed, 11 Nov 2026 11:11:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=j44swFNWreQeP9wiM8B85prMtqbDh7ScyUkYkb4cd
	qc=; b=iEpukxrFbAnajmie5cDBC/xN0t6Yo3jQG1pDRsX9/umMtN6b/dRwkKUSv
	XYWPfn3Oomec9gdV/F25bGr6cPQZ7tl4XZbbbHdfZ3/UD3148rcnI/Z7GRqFQyaq
	Domk/74CJ2oj5bjddWOxKfGC6x/ebqDHar6gB6z+q4AKrdc1sds3NKXjP97U87Td
	+uA/a1EDcklmpztu/BshNr9btl7LA15a9yzFDY1tXqQmnK87QvEA1HL8YkyeDF6w
	P2zCxktPJDjocDzgFaCvnsEXvkZPLQ038lOvEO+NPsbBwUhoUaML2UN9V2gWuwEu
	6nDEoj7Ohwb52UQGk0Cp9SfqAXOsQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013020.outbound.protection.outlook.com [40.107.201.20])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hv9pjxd0h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 11:11:33 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PRA6M7F8VArzmiSOJ1xWTl1m70SkG7aQqKb4n/z4CCa2ac/UKqrqzZ5+lqCQRh/kvfuDk1CirlDecR/eiZ7fxd77mbKM1x5nbeUHrkDEeQI2arzWQhr1+77yCN2Q+mOiTtr6QUoN7IXOc8s0aPZVIkJeF25r0A+hemBBKOGlfIg6+r5MZdXzqYIHuxy4eAR7mQ5Jwj+6NFNpUCtnLZSiOFRlbBOXc1XQaJTxnEE8MaE11gkhZwa1wGqgswOeANh6t89unxj5JjpBxc4jRReybhSoR4E2LSDXU/k4BjpJOQwH4lZSElxVPRTLYI4L6cNSD2j5Qbuvu4CZvl5yPTQOoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j44swFNWreQeP9wiM8B85prMtqbDh7ScyUkYkb4cdqc=;
 b=Bq8rD7U/rQRRjAYscv7vT0yBo83K3hSQhS8SylK8vgD/j6xjpRTi7HI1vDIxLh0pfQoHnuCyMrCdF6r5ZcXpgPg0e+My6wjqbc/+/pPRxHg6LcdJJa6SLMHb4C54ZIDpw89TTqznBTLimI5w4OQjLb3KcvTHcezzf1lhQchd+PfiBhB3oynKnd5M2zjzx0kQfE4K4yg6pm6TvCsilt249JDzLJJXPyqPhYfvgSx45QxwobpmoMCzNYHqV/8SlI3JVmIA3q6SF6OUy0OsK46bqla851CvC5f83FXUELH6N7IQLLcjj1ZHAO4xL7YU01tpYhB7BuCTRnK5m60HTh/eJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j44swFNWreQeP9wiM8B85prMtqbDh7ScyUkYkb4cdqc=;
 b=kdvft8L/Y5+0XHblNoMfbaYgI2TmhSjjyykHA2NDYsMhLytaqH5aBNoFcCQ2tyP0IyD/mAw7YeemwLUavlz6bDtvCu7RCxPENIyyO2m4EG/n/UGtlLWWVgw/3AHqneRsWVT3yNfJ/oP7KDBo3yncTiMB+qFRrJemGkc3xMratoI=
Received: from PH7P220CA0091.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::10)
 by SAAPR10MB361405.namprd10.prod.outlook.com (2603:10b6:802:303::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 17:06:30 +0000
Received: from MW2PEPF00014675.namprd04.prod.outlook.com
 (2603:10b6:510:32d:cafe::8) by PH7P220CA0091.outlook.office365.com
 (2603:10b6:510:32d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 17:06:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MW2PEPF00014675.mail.protection.outlook.com (10.167.249.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 17:06:28 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:05:33 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:05:33 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 11:05:33 -0600
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABH5WAt123833;
	Wed, 11 Nov 2026 11:05:32 -0600
From: Brandon Brnich <b-brnich@ti.com>
To: <devarsht@ti.com>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
        <benjamin.gaignard@collabora.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <k-willis@ti.com>, <jai.luthra@ideasonboard.com>,
        Brandon Brnich
	<b-brnich@ti.com>
Subject: [PATCH v9 4/4] media: imagination: e5010: Enable autosuspend for runtime PM
Date: Wed, 11 Nov 2026 11:05:30 -0600
Message-ID: <20261111170530.809226-5-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111170530.809226-1-b-brnich@ti.com>
References: <20261111170530.809226-1-b-brnich@ti.com>
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
X-MS-TrafficTypeDiagnostic: MW2PEPF00014675:EE_|SAAPR10MB361405:EE_
X-MS-Office365-Filtering-Correlation-Id: 03a2ddb8-b3f2-4ca1-5811-08df4016208e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|18002099003|22082099003|261009223327099003|261009221227099003|261009221727099003|261009220027099003|261009223027099003|56012099006|10067099003|261028144727099003|261102123227099003|261021121427099003|261026121527099003|261021123027099003|261022075727099003|261021135927099003|261022115727099003|261026140227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	QeKq0gErXwraTiIB12uVvf/lc8SHKyrPSphnInXDj9l6PF+EkldMhwv8rMfx+wv+l7p9/hfDky+AnFYT6lzFIDoGb/J3sbIt9MITkEzrL9bqCLjIqRcgrqgB7yW4B+Q7BJ6OmoK6P5yWFOYZtROuk78lsrElxa4acIxhvTndVc6AGQZzF7mxTZ6xK017E5mUoJ8fxF+Ktw1ENqUdrro+2Zvj9u1203PPByG5BXtapoQpnNfTlyintOxs33Sx9qHdf+gXuVRHUJhWxQLm7zdA/VKDeCL5H+nxaTXD3tZtm2XC5Ed7csQ8yDi+WKkkhak4zm3hLSUQMKKkT3Toz3yIwbYo41jiaqHPUef6bqGVlpzPzlE8PsDtKldhaniZF7sZBiNP05UW4up3r96fVAXSuh9WbbKyPDD2/DDJcgcMcovknaXl7XHBMSdosGrXavRX5w5GqSYv3Xjjcw0emVWBFmSUszCOssw1ZCvZK9D7mVWkSCJ/WwhvyabCOyQuWaxrdlJTep04TrBaB7iXln1mhdMkrh13Xyfi6ixrD9Hi/7+Sz8y4LxDAHeT8sNhLGw+DefLrwVD42G7ucX6m9gHi69xU5hkdU/QaXo4UVW0lJDwJ7+3uWLKOU9XehlBYBjbmvftvX8DFWoa6jn8+df+5ZP0+AyzT5rrHdzAnlveC5YhtIUkJgc4JZbcxirn8Oh5Iyru00m5bGK3nSnUpjYJeig==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(18002099003)(22082099003)(261009223327099003)(261009221227099003)(261009221727099003)(261009220027099003)(261009223027099003)(56012099006)(10067099003)(261028144727099003)(261102123227099003)(261021121427099003)(261026121527099003)(261021123027099003)(261022075727099003)(261021135927099003)(261022115727099003)(261026140227099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jz5NjxKZwBxQs/Y6hv1JndKp8yQ/XLEDoamlxFDIeX4zqBVmllXQC1R+Bkw28YQEQ/bwd3gGgXiV3d8ummwhUbYSjV2bXnDHt4n5oxTTBdtzPjbL248eCdl82wjyU8k7+dcFWKF4k3Vj2L5ZFUgwWOsHC1rJGzPPMfx6BU15uyTUkYIDrXAodArARnndfAmBufLvLoog40HqcFjUKETp/hek6zxKbz2U0h92AuISUEBdrUIVQxiO7ZAc08V7WtOI91RhMhWEoG2au4Fl2KNpSE58FVwQZyJwYCEHfok0NJ+PN4bHXbStkdAlg47+mcPoBmujp4fWL6aCS9AW0M38R2LEK/5WeamppCeXmaVhb3rLAeaWWcBfKjQdnlddfVzLI+WxwP+2kaFifhTjxOARocebrF5ev6DcMywQN6qqupu5rozxakniw7lu1AGXeNv2
X-Exchange-RoutingPolicyChecked:
	zipcfDLxIiMxYAQonZRE8qohTCPhLIeE4CNHlXVDcRvEhdGg4Im13ars8KLW0ml1Z7xJwqFUGXQPk4y+OO8Z8P418JFjvasMBPCibcqdsBx5/WfPyukuPA50m4XuS/bRK689FQkZWxLor6xdQTk69bPiBSGiRAPw3Om9RjmmJfS6VT8Uy9ECaYBhJUB3L+lXUvUPWXAeNhP0jDb8neX3cqtBSzjOpghY5+1LgMxi54WtAuRmvZ8qTSspXAv/t5DiS2/Q0SZUFGt+3JlC7I09clSCYdTKAq93kt9TyB/bNTP3TjVBfleo0nLdS8ohKOHCZWdVHFnzN8Za5F/ogsr+ew==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:06:28.8225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a2ddb8-b3f2-4ca1-5811-08df4016208e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW2PEPF00014675.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAAPR10MB361405
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfX3gj+1OEwDHOs
 fBkO8FykE22/xM5s9J7B1tagZy5pQKL7E+BDxtXFwEs9RE3i8lpK2CGX6etG5BaMfz9T38Y4DiH
 igPNfk30qp4VtuF+f/8673eQa78fFgYcNQVmHZ2B9VR52cKSrnsI7lHR4JB3X3qr7ckE/1P4X+M
 1XZYoWYHZjMjIGb7hiH1is+HdwO565xu4AlHFM7UWFFjuNs6ke8R/rlOeHf6FM0E3oTbB1B9jPP
 awhGHFM0sfhdr/K91it3oPLFSidORtyRqL/kEPh0x5pPP/omB9rfP2S9IpmwpeNxyKA1pPrx/iM
 Dq2fXKpUNo7Pxk/ulIUk7jy73FxXvTtHHY4GUg+5wFbPJVOfCZB2Kk6MXICUDgQHsUAkuNJ+sKL
 MRCCThWEAMIb7UwKV4ydTiUgfsOsozAliixyETU6R4BgSeNh1ygnZlj9H/5tYtYKxkQumobq7Dk
 lOeixsBlnehA1gyZkZQ==
X-Proofpoint-GUID: venhiroW6zkh1JaPmSJulEEa0pySKmqx
X-Authority-Analysis: v=2.4 cv=ebOo7LEH c=1 sm=1 tr=0 ts=6af4a1c5 cx=c_pps
 a=YVy+1Oos88+FgPqksjWX8g==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=tgKt1I_ZsljtpmWdy5MA:9
X-Proofpoint-ORIG-GUID: venhiroW6zkh1JaPmSJulEEa0pySKmqx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfX1FpGUZJpYlbn
 5uYFjubY44auEXPseTO2tjIYZfHBD4NAke+QB6WnYC6EhRfQJ7E2h9YgORdRYyNpAZFWHuy8Fjw
 H1ez/kjQF9TcKVlcYodVwflmEfi7aSI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110068

Current implementation only has one call to turn the device on -
start_streaming(). This can waste power of system as the device can be in
STREAM_ON state, but no buffers are actually being submitted. To address
this, device_run() will obtain a PM reference and will release it after
interrupt completion is handled utilizing the pm autosuspend framework so
device can shutdown if no other job is scheduled within 100ms.

Since e5010_runtime_resume() now initializes the hardware on every
power-up, drop the e5010_init_device() call from start_streaming(). In
the case where PM is not configured, e5010_init_device() would no longer
be called since the only path was in start_streaming(). Move this call
to e5010_probe() if runtime PM is not enabled so that the device
registers are properly set.

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 .../platform/imagination/e5010-jpeg-enc.c     | 47 +++++++++----------
 .../platform/imagination/e5010-jpeg-enc.h     |  1 +
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index 2da43c14a25c8..3c7c5f121a32f 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -976,6 +976,7 @@ static irqreturn_t e5010_irq(int irq, void *data)
 
 	v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
 	dprintk(e5010, 3, "ctx: 0x%p Finish job\n", ctx);
+	pm_runtime_put_autosuspend(e5010->dev);
 
 job_unlock:
 	spin_unlock(&e5010->hw_lock);
@@ -1101,6 +1102,8 @@ static int e5010_probe(struct platform_device *pdev)
 		goto fail_after_v4l2_m2m_init;
 	}
 
+	pm_runtime_set_autosuspend_delay(dev, JPEG_AUTOSUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
 	if (!pm_runtime_enabled(dev)) {
@@ -1109,6 +1112,11 @@ static int e5010_probe(struct platform_device *pdev)
 			dev_err_probe(dev, ret, "failed to enable clock\n");
 			goto fail_after_v4l2_m2m_init;
 		}
+		ret = e5010_init_device(e5010);
+		if (ret) {
+			dev_err_probe(dev, ret, "failed to init device\n");
+			goto fail_after_clock_enable;
+		}
 	}
 
 	ret = video_register_device(e5010->vdev, VFL_TYPE_VIDEO, 0);
@@ -1123,10 +1131,12 @@ static int e5010_probe(struct platform_device *pdev)
 	return 0;
 
 fail_after_clock_enable:
-	if (pm_runtime_enabled(dev))
+	if (pm_runtime_enabled(dev)) {
+		pm_runtime_dont_use_autosuspend(dev);
 		pm_runtime_disable(dev);
-	else
+	} else {
 		clk_disable_unprepare(e5010->clk);
+	}
 fail_after_v4l2_m2m_init:
 	v4l2_m2m_release(e5010->m2m_dev);
 fail_after_v4l2_register:
@@ -1143,6 +1153,7 @@ static void e5010_remove(struct platform_device *pdev)
 	video_unregister_device(e5010->vdev);
 	v4l2_m2m_release(e5010->m2m_dev);
 	v4l2_device_unregister(&e5010->v4l2_dev);
+	pm_runtime_dont_use_autosuspend(e5010->dev);
 	pm_runtime_disable(e5010->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		clk_disable_unprepare(e5010->clk);
@@ -1306,31 +1317,13 @@ static int e5010_encoder_cmd(struct file *file, void *priv,
 static int e5010_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct e5010_context *ctx = vb2_get_drv_priv(q);
-	int ret;
 
 	struct e5010_q_data *queue = get_queue(ctx, q->type);
 
 	v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, q);
 	queue->sequence = 0;
 
-	ret = pm_runtime_resume_and_get(ctx->e5010->dev);
-	if (ret < 0) {
-		v4l2_err(&ctx->e5010->v4l2_dev, "failed to power up jpeg\n");
-		goto fail;
-	}
-
-	ret = e5010_init_device(ctx->e5010);
-	if (ret) {
-		v4l2_err(&ctx->e5010->v4l2_dev, "failed to Enable e5010 device\n");
-		goto fail;
-	}
-
 	return 0;
-
-fail:
-	e5010_vb2_buffers_return(q, VB2_BUF_STATE_QUEUED);
-
-	return ret;
 }
 
 static void e5010_stop_streaming(struct vb2_queue *q)
@@ -1346,8 +1339,6 @@ static void e5010_stop_streaming(struct vb2_queue *q)
 	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx)) {
 		v4l2_event_queue_fh(&ctx->fh, &e5010_eos_event);
 	}
-
-	pm_runtime_put_sync(ctx->e5010->dev);
 }
 
 static void e5010_device_run(void *priv)
@@ -1360,7 +1351,6 @@ static void e5010_device_run(void *priv)
 	unsigned long flags;
 	int num_planes = ctx->out_queue.fmt->num_planes;
 
-	spin_lock_irqsave(&e5010->hw_lock, flags);
 	s_vb = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	WARN_ON(!s_vb);
 	d_vb = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
@@ -1368,6 +1358,14 @@ static void e5010_device_run(void *priv)
 	if (!s_vb || !d_vb)
 		goto no_ready_buf_err;
 
+	ret = pm_runtime_resume_and_get(e5010->dev);
+	if (ret < 0) {
+		dev_err(e5010->dev, "Device failed to turn on\n");
+		goto no_ready_buf_err;
+	}
+
+	spin_lock_irqsave(&e5010->hw_lock, flags);
+
 	s_vb->sequence = ctx->out_queue.sequence++;
 	d_vb->sequence = ctx->cap_queue.sequence++;
 
@@ -1492,6 +1490,8 @@ static void e5010_device_run(void *priv)
 	ret = e5010_init_device(e5010);
 	if (ret)
 		v4l2_err(&e5010->v4l2_dev, "failed to initialize device after reset\n");
+	spin_unlock_irqrestore(&e5010->hw_lock, flags);
+	pm_runtime_put_autosuspend(e5010->dev);
 no_ready_buf_err:
 	if (s_vb) {
 		v4l2_m2m_src_buf_remove_by_buf(ctx->fh.m2m_ctx, s_vb);
@@ -1505,7 +1505,6 @@ static void e5010_device_run(void *priv)
 		v4l2_m2m_buf_done(d_vb, VB2_BUF_STATE_ERROR);
 	}
 	v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
-	spin_unlock_irqrestore(&e5010->hw_lock, flags);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.h b/drivers/media/platform/imagination/e5010-jpeg-enc.h
index da57bc1baa464..807821ded127e 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.h
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.h
@@ -23,6 +23,7 @@
 #define DEFAULT_HEIGHT			480
 #define E5010_MODULE_NAME		"e5010"
 #define JPEG_MAX_BYTES_PER_PIXEL	2
+#define JPEG_AUTOSUSPEND_DELAY_MS	100
 
 /* JPEG marker definitions */
 #define START_OF_IMAGE			0xFFD8
-- 
2.43.0

