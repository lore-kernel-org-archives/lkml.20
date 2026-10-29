Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297602;
	b=i3YTHXP2320KJ0VHbKbHfHmc9Xccudv+jx0dcaR2KLAAUzBowcGwNA08WQ27e9okqgjz
	 /bhCKCXrDVqbOuDSIIQ/MtqJuqmaVvP9+FqaExL55y+tucZAdoHwKNoraS44RIKF9nxM3
	 nS/Ni5COlBx4nZwCxqi3TvlPVO57UeH12OaqmvNqqr64OHlemmGl5IksKT6EC7c49ZyN6
	 i4cyIDreb541DWbKyynjIXF03Btl8zIc5+1+tZF9qJsmZqivGFVadvhCm80u+r/E7g8lB
	 n9Udye5ZinGEFGd0NayAB/ILF/ODM6IYlEnhe3oII/SYhsDv9UrsYaWUA8AQefVx9Rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297602;
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CzDW426DxTtZFUL81MFSZ90xVqtjOWw2PArftkLqjy8=;
	b=LGOBzx7xngWNpac4BcYCroAWa+1TYCXasfCwNgyOEUZr/G2mAPbIiRgvaayg8Izg47Lw
	 ypsRyADZvxYrNX/2pxefJG2Nz6RenHBlE/zu3Zd9X/AvMyBoeS1/qL5mYsZTMcmwlDZp+
	 ujTnYQ3T/sv+whT4Dka3cjdaNknL5xS209esk6pxcouc1BU9P+ZMp1AZ6mObNuzOClhWG
	 SuCt0zygLZkDKsJ5xBqZ2pV6sxMnIfMACUszdsA64pVkbvWyhmAnRvadVYx3EMxOM+O8+
	 HJAw2bIOSvUBDzpcRBmw9sJAvncfYeuEneQ8gmXAucnTpbGb/Lz/0sg+KZV668z8QUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=HIdsTAl4;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=Rp0mRwM4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E50A606A325
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E50A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=HIdsTAl4;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=Rp0mRwM4
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDRq13224646;
	Thu, 29 Oct 2026 13:13:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=CzDW426DxTtZFUL81MFSZ90xVqtjOWw2PArftkLqj
	y8=; b=HIdsTAl4ZSEczi986FOiQDgQxGJsI0dPVXBMp9gN2zwlx3Z1cOV81qaTw
	1PQZ4RSawC2AYf9l1jwbY1qrO9O4E8ptr2ywQadt52CbjoqrooVISosGc6d4XKcJ
	FKFYE4Afzn+MpifPGFVdDURIzlSuSX1U+CsP0xEVfEcsGdct+6TwV9XHdTTwE26Y
	op4IP74jhKaMKXM4RhPLrjTTCp9LcJLVk7KZbvFoBg112UwAJd1tmfMzBAdShpMO
	SlSf3DLFI2JWQOKZd9U+CqYVpn5fFu85dNCeKrv3eNGnbReuDZ2W1mOICBq6/iP8
	yF+w7KfzdUWML+BeozWt+wFGFKBSA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011009.outbound.protection.outlook.com [40.93.194.9])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hm3h7kkk3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:13:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ApBw9vqwtVf+TF1YuGAJx3P7AQuoALhUTyfGsJe/Rp1nvEb33QpetO9ffpyTbkQHi//0iDpkGVRQ4jcqaX8GN6VAOeQWbh3z+CxGCM3rLD/pmDKPPjNJdgVIRK1EK4ZTUWmt+xVDrt80zQH9EK4AQQYFlJ/ZPiiaGPjG34QZOpp2yg+y9zxkxbk5ae5J0dMd6UOZWDNvUBHvWf++A+KuZYAwc2xMA2C8pP9rJmYGCB/J3lcR+fBCVzsFXGkP9NCdmWsvHmfNN3Hesrs227KMHd2Z+OOXHvzCxZZxdrPAl2hKCIzSqloBGz01W7IdAmDW7kyAR22/C+inZfE0xGPwag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzDW426DxTtZFUL81MFSZ90xVqtjOWw2PArftkLqjy8=;
 b=k44w3r35d2oy6pg2bALu1/6XLi5VhtiKyMvb1dZjzGYUm8GvI9QSkgaZyXB7FhteQsyhby15JoOCOvmXyEd1Csc7Sra6N1cbJMzVVvFmJ2IWFjvuUEbqbG0AQUWGxAPYhdKup9gouG8Oc4Qd4uPf+u6UWb3mq0t14xY6J2LvLIlN7cUOPdWkuC9cFQYwX8GB2fnPULh3VfyluHCt89C6vFr0S3+CyZ0A7kYboB+J1jdkP6pbBdi7ISIxkVGDbyrCG0iLMAMVVOzULE/+QyZgK1C46nksUc8wLz1zOcz+yWP/SSNfIkrZmCmEIod4hw9mBmNMwpO7ormYF33N80j22A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzDW426DxTtZFUL81MFSZ90xVqtjOWw2PArftkLqjy8=;
 b=Rp0mRwM4dxLyLxw6BQ6VqeE66cYZ8J7U5wDm0iVO3Nmlk9IUFPwFAjQJppPQYyE7qHk361S7CoK4wtJvrwcwuroo8lIQAmJyRqNKBhtu5tesB6ICV8Y9Fv7xdt1Uu8q1VY2yEaQVmrBe1+iDs+o03N7wROWAJjidw+q1lM2392c=
Received: from DS2PEPF00004559.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::512) by SAEPR10MB936126.namprd10.prod.outlook.com
 (2603:10b6:802:203::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 18:13:05 +0000
Received: from CY5PEPF00000E75.namprd02.prod.outlook.com
 (2603:10b6:93f:fff6::c5) by DS2PEPF00004559.outlook.office365.com
 (2603:10b6:f:fc00::512) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4 via Frontend Transport; Thu, 29
 Oct 2026 18:13:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY5PEPF00000E75.mail.protection.outlook.com (10.167.247.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:13:03 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:31 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:12:31 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmMD3408718;
	Thu, 29 Oct 2026 13:12:29 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 13/22] soc: ti: ti_sci_protocol.h: Add missing documentation for structs
Date: Thu, 29 Oct 2026 23:41:38 +0530
Message-ID: <20261029181147.266771-14-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029181147.266771-1-b-padhi@ti.com>
References: <20261029181147.266771-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E75:EE_|SAEPR10MB936126:EE_
X-MS-Office365-Filtering-Correlation-Id: 927160a5-dfc9-4535-a3d5-08df35e84608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|3023799007|56012099006|13003099007|261026140227099003|6133799003|22082099003|18002099003|261028144727099003|10067099003|261021121427099003|261021123027099003|261022075727099003|261022105027099003|261009223027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	MOpV5fFU7fclp2Afoaf8Ehil5x8DHFckIp3ACzQ4uzvkPHoeaOnnUXGjLn7KER0CfB3zlrYnA9u5beWQC+K4mdPhdFumTrqBUP0V4Mha4sOrfRzeuyzxeaURRuz51uQeb+5dBETu2hTVycC9u8aCd/djB+gsxKhinMiEwvQmQ/TdGqbjuNyQMFOkLwGEykhmxsGyG9Lq2tflmRF64kBHDJmXWoYIBQgYawQ1IJKXfchtIBxBtL6XjtVYeBMkBh8KNDm8o5OqI15AADxQwnns1k7WkbJNUsarDwkUZurwcqzzr7/gvE5XEX8CkzhODs7QOI4fi/qje6sYAmRfh7+ni0VgqXw0QIZ9Re/oldaieg2t+ibYwqY6F4Z8JXe91x6V1HVWzWw4MfzYDHReAqe2RxCE9miQo36kLTtD9YIzqmYS4uvdoyYbKFpBKL13sDvfN2WEQUcDAG7ED+74daS9BZoBx3J8CFqd7kkbKZYwDiVDiRsnoB3WqU1zRbDNnsAWv8tmW+XRT2XBI/9Dvfv5xJm54Oxt5iby5/CK1WDd5uUa6thOq0UhxQ2cWucBA/owHb9qXtjxW0SoITralnAb/2ALVQXc6wfXYUG+YNX25wkqXn/NqGEREi6mjHCD3+XYSzPUf0reCFLc87cPGi/+EDPIZZvFVo8jXsLX5i3f2mQ=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(3023799007)(56012099006)(13003099007)(261026140227099003)(6133799003)(22082099003)(18002099003)(261028144727099003)(10067099003)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7Mx5HbyoHiJkWtkE0IkMRq5B9eRDiKnoYgWe1m6HTTfKUzJMpN26moMEEGtzCe+tI8IodPnBR48wshrwUGiBz8uG1vNscoU0oNSq+R3h0zV+dcewngLbpcruIlVlExTrvLvJnFLXMXOkkSjXx8EWB/Lawfi2fkO7TnAeX2+ntY9tZD6nwfF2sJruzaQwV1yV3HwADBZYMYJQoZgWCF4qRasa3JhiZpFClotz65vFDGdXfurDnffwjVBSBC2E0bTaztSo8nbhlFQLBjXuM0qB0lj8ynhSoLMp/aH0gJWdsSf5XPAEP/xVHHLgPAZj7ww0W0mL0iF5xs5tt0L+Ia80FI9zzs0jpJg2+dbiX7SNRhVPcxNxcKZjSMKxJp0h3lDdmAYdKGv+QyKgFliK72h2/6KM16gz46gHgcjAKhH2/yGQAzA8mr5aboZh2+Z2ieZt
X-Exchange-RoutingPolicyChecked:
	CcvgviwYiSWrJygDzDrwg7G3hXq296IP4pb94wf+hYxBXluhf6pMb8UjO8ci/sIvmNjGUMKUsDB7KUHYKzQtDS1rJNsu5rX/AjURpqiEiRoCTXNmd19yypP9kfuUcFJ0qLYR+bCtygAu+x9GH/87b7CoK0raxnXFc1GAEJn7EWPmbh7xZdE+U5coIQ/U0KScso3N6QdpW4fJN7OnX58PT3WRTUbEq6zsyez4LOxS1WvGXdADNVO056IYueeQKu6A9QieJVRJDEL2Q4xO2NeSUqBXlHZuNfSwDP+yW84NGVUcq2+p2hjZF14IOFXZsSIiejWxIDXQIqkylCH2MYho6g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:13:03.2748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 927160a5-dfc9-4535-a3d5-08df35e84608
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR10MB936126
X-Authority-Analysis: v=2.4 cv=fv1J914f c=1 sm=1 tr=0 ts=6ae38cb5 cx=c_pps
 a=9d+VVJWglIGFt+56pYWlLw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=OrHHYe0rJBWiAmqXVPgA:9
X-Proofpoint-ORIG-GUID: r2GpXJyNo4FJmWP04ZSiW7q4DTU4lE5A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX0WGzwyzpHask
 V9RfDHoxjFoLz19oWV43Z5+s0ANDZRps2ZEypQN+nr+2UWnIEyhm49RnzExrkNW0s0ytJq7diTJ
 uAeSs0cLMCKW/G+lT0wsSx/VoNt2qmnHjvi/7Ks8fm/OqDATkuiBnB3zfWRqOWe5Vx6bU98YV5Y
 i67EmwbBn66U0Qhp6n2p6vTJpR01UnWyAheiRtvuMKf032UuNHx3xUp2Yy6sIbWDmEqhDeNoquM
 lvEr/hRZf/IMUe7W2eR9u9FLU3WrUEukyD8brDPS9QraKqyYO9gLkBNt/2FXU27nWYMuwG4A7oc
 Er7U754uOpx5lCwg4PUwKLS98+QcUkKpoJxfkXPfBe0gPTsTyP/kTKAWZwMhmwymstKUnsPbAKL
 LcOFfkVTNMcr7df7KKcxrjtS73PB+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfXxekoPPf8Bays
 KjyY2KRcJXyvWuismVl2TDLqgZRghBB+Ks5AWXE5108AzNTNIE16IsTAZAoZLAE5XHwwRZSNlkX
 5McHQhgH7o/62O/Tl7bUugHd0WYBdtg=
X-Proofpoint-GUID: r2GpXJyNo4FJmWP04ZSiW7q4DTU4lE5A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290071

Some of the structs defined in ti_sci_protocol.h were missing
documentation and some were not in correct style. Clean these up to
resolve static warnings.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. None to this patch.

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-14-b-padhi@ti.com/

v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-14-b-padhi@ti.com/

 include/linux/soc/ti/ti_sci_protocol.h | 374 ++++++++++++++++++++++++-
 1 file changed, 363 insertions(+), 11 deletions(-)

diff --git a/include/linux/soc/ti/ti_sci_protocol.h b/include/linux/soc/ti/ti_sci_protocol.h
index fd104b6668364..471f5580787cf 100644
--- a/include/linux/soc/ti/ti_sci_protocol.h
+++ b/include/linux/soc/ti/ti_sci_protocol.h
@@ -42,9 +42,17 @@ struct ti_sci_core_ops {
  * @get_device: Command to request for device managed by TISCI
  *		Returns 0 for successful exclusive request, else returns
  *		corresponding error message.
+ * @get_device_exclusive: Command to request for device managed by TISCI that is
+ *		exclusively owned by the requesting host.
+ *		Returns 0 for successful exclusive request, else returns
+ *		corresponding error message.
  * @idle_device: Command to idle a device managed by TISCI
  *		Returns 0 for successful exclusive request, else returns
  *		corresponding error message.
+ * @idle_device_exclusive: Command to idle a device managed by TISCI that is
+ *		exclusively owned by requesting host.
+ *		Returns 0 for successful exclusive request, else returns
+ *		corresponding error message.
  * @put_device:	Command to release a device managed by TISCI
  *		Returns 0 for successful release, else returns corresponding
  *		error message.
@@ -243,7 +251,7 @@ struct ti_sci_resource_desc {
 /**
  * struct ti_sci_rm_core_ops - Resource management core operations
  * @get_range:		Get a range of resources belonging to ti sci host.
- * @get_rage_from_shost:	Get a range of resources belonging to
+ * @get_range_from_shost:	Get a range of resources belonging to
  *				specified host id.
  *			- s_host: Host processing entity to which the
  *				  resources are allocated
@@ -322,6 +330,35 @@ struct ti_sci_rm_irq_ops {
  *
  * Parameters for Navigator Subsystem ring configuration
  * See @ti_sci_msg_rm_ring_cfg_req
+ *
+ * @valid_params: Bitfield defining validity of ring configuration parameters.
+ *	The ring configuration fields are not valid, and will not be used for
+ *	ring configuration, if their corresponding valid bit is zero.
+ *	Valid bit usage:
+ *	0 - Valid bit for @addr_lo
+ *	1 - Valid bit for @addr_hi
+ *	2 - Valid bit for @count
+ *	3 - Valid bit for @mode
+ *	4 - Valid bit for @size
+ *	5 - Valid bit for @order_id
+ *	6 - Valid bit for @virtid
+ *	7 - Valid bit for @asel
+ * @nav_id: Device ID of Navigator Subsystem from which the ring is allocated
+ * @index: ring index to be configured.
+ * @addr_lo: 32 LSBs of ring base address to be programmed into the ring's
+ *	RING_BA_LO register
+ * @addr_hi: 16 MSBs of ring base address to be programmed into the ring's
+ *	RING_BA_HI register.
+ * @count: Number of ring elements. Must be even if mode is CREDENTIALS or QM
+ *	modes.
+ * @mode: Specifies the mode the ring is to be configured.
+ * @size: Specifies encoded ring element size. To calculate the encoded size use
+ *	the formula (log2(size_bytes) - 2), where size_bytes cannot be
+ *	greater than 256.
+ * @order_id: Specifies the ring's bus order ID.
+ * @virtid: Ring virt ID value
+ * @asel: Ring ASEL (address select) value to be set into the ASEL field of the
+ *	ring's RING_BA_HI register.
  */
 struct ti_sci_msg_rm_ring_cfg {
 	u32 valid_params;
@@ -397,10 +434,102 @@ struct ti_sci_rm_psil_ops {
 #define TI_SCI_MSG_VALUE_RM_UDMAP_CH_BURST_SIZE_VALID		BIT(14)
 
 /**
- * Configures a Navigator Subsystem UDMAP transmit channel
+ * struct ti_sci_msg_rm_udmap_tx_ch_cfg - Configures a Navigator Subsystem UDMAP
+ *					  transmit channel
+ *
+ * @valid_params: Bitfield defining validity of tx channel configuration
+ * parameters. The tx channel configuration fields are not valid, and will not
+ * be used for ch configuration, if their corresponding valid bit is zero.
+ * Valid bit usage:
+ *    0 - Valid bit for @tx_pause_on_err
+ *    1 - Valid bit for @tx_atype
+ *    2 - Valid bit for @tx_chan_type
+ *    3 - Valid bit for @tx_fetch_size
+ *    4 - Valid bit for @txcq_qnum
+ *    5 - Valid bit for @tx_priority
+ *    6 - Valid bit for @tx_qos
+ *    7 - Valid bit for @tx_orderid
+ *    8 - Valid bit for @tx_sched_priority
+ *    9 - Valid bit for @tx_filt_einfo
+ *   10 - Valid bit for @tx_filt_pswords
+ *   11 - Valid bit for @tx_supr_tdpkt
+ *   12 - Valid bit for @tx_credit_count
+ *   13 - Valid bit for @fdepth
+ *   14 - Valid bit for @tx_burst_size
+ *   15 - Valid bit for @tx_tdtype
+ *   16 - Valid bit for @extended_ch_type
+ *
+ * @nav_id: SoC device ID of Navigator Subsystem where tx channel is located
+ *
+ * @index: UDMAP transmit channel index.
+ *
+ * @tx_pause_on_err: UDMAP transmit channel pause on error configuration to
+ * be programmed into the tx_pause_on_err field of the channel's TCHAN_TCFG
+ * register.
+ *
+ * @tx_filt_einfo: UDMAP transmit channel extended packet information passing
+ * configuration to be programmed into the tx_filt_einfo field of the
+ * channel's TCHAN_TCFG register.
+ *
+ * @tx_filt_pswords: UDMAP transmit channel protocol specific word passing
+ * configuration to be programmed into the tx_filt_pswords field of the
+ * channel's TCHAN_TCFG register.
+ *
+ * @tx_atype: UDMAP transmit channel non Ring Accelerator access pointer
+ * interpretation configuration to be programmed into the tx_atype field of
+ * the channel's TCHAN_TCFG register.
+ *
+ * @tx_chan_type: UDMAP transmit channel functional channel type and work
+ * passing mechanism configuration to be programmed into the tx_chan_type
+ * field of the channel's TCHAN_TCFG register.
+ *
+ * @tx_supr_tdpkt: UDMAP transmit channel teardown packet generation suppression
+ * configuration to be programmed into the tx_supr_tdpkt field of the channel's
+ * TCHAN_TCFG register.
+ *
+ * @tx_fetch_size: UDMAP transmit channel number of 32-bit descriptor words to
+ * fetch configuration to be programmed into the tx_fetch_size field of the
+ * channel's TCHAN_TCFG register.  The user must make sure to set the maximum
+ * word count that can pass through the channel for any allowed descriptor type.
+ *
+ * @tx_credit_count: UDMAP transmit channel transfer request credit count
+ * configuration to be programmed into the count field of the TCHAN_TCREDIT
+ * register.  Specifies how many credits for complete TRs are available.
  *
- * Configures a Navigator Subsystem UDMAP transmit channel registers.
- * See @ti_sci_msg_rm_udmap_tx_ch_cfg_req
+ * @txcq_qnum: UDMAP transmit channel completion queue configuration to be
+ * programmed into the txcq_qnum field of the TCHAN_TCQ register. The specified
+ * completion queue must be assigned to the host, or a subordinate of the host,
+ * requesting configuration of the transmit channel.
+ *
+ * @tx_priority: UDMAP transmit channel transmit priority value to be programmed
+ * into the priority field of the channel's TCHAN_TPRI_CTRL register.
+ *
+ * @tx_qos: UDMAP transmit channel transmit qos value to be programmed into the
+ * qos field of the channel's TCHAN_TPRI_CTRL register.
+ *
+ * @tx_orderid: UDMAP transmit channel bus order id value to be programmed into
+ * the orderid field of the channel's TCHAN_TPRI_CTRL register.
+ *
+ * @fdepth: UDMAP transmit channel FIFO depth configuration to be programmed
+ * into the fdepth field of the TCHAN_TFIFO_DEPTH register. Sets the number of
+ * Tx FIFO bytes which are allowed to be stored for the channel. Check the UDMAP
+ * section of the TRM for restrictions regarding this parameter.
+ *
+ * @tx_sched_priority: UDMAP transmit channel tx scheduling priority
+ * configuration to be programmed into the priority field of the channel's
+ * TCHAN_TST_SCHED register.
+ *
+ * @tx_burst_size: UDMAP transmit channel burst size configuration to be
+ * programmed into the tx_burst_size field of the TCHAN_TCFG register.
+ *
+ * @tx_tdtype: UDMAP transmit channel teardown type configuration to be
+ * programmed into the tdtype field of the TCHAN_TCFG register:
+ * 0 - Return immediately
+ * 1 - Wait for completion message from remote peer
+ *
+ * @extended_ch_type: Valid for BCDMA.
+ * 0 - the channel is split tx channel (tchan)
+ * 1 - the channel is block copy channel (bchan)
  */
 struct ti_sci_msg_rm_udmap_tx_ch_cfg {
 	u32 valid_params;
@@ -433,10 +562,96 @@ struct ti_sci_msg_rm_udmap_tx_ch_cfg {
 };
 
 /**
- * Configures a Navigator Subsystem UDMAP receive channel
+ * struct ti_sci_msg_rm_udmap_rx_ch_cfg - Configures a Navigator Subsystem UDMAP
+ *					  receive channel
+ *
+ * @valid_params: Bitfield defining validity of rx channel configuration
+ * parameters.
+ * The rx channel configuration fields are not valid, and will not be used for
+ * ch configuration, if their corresponding valid bit is zero.
+ * Valid bit usage:
+ *    0 - Valid bit for @rx_pause_on_err
+ *    1 - Valid bit for @rx_atype
+ *    2 - Valid bit for @rx_chan_type
+ *    3 - Valid bit for @rx_fetch_size
+ *    4 - Valid bit for @rxcq_qnum
+ *    5 - Valid bit for @rx_priority
+ *    6 - Valid bit for @rx_qos
+ *    7 - Valid bit for @rx_orderid
+ *    8 - Valid bit for @rx_sched_priority
+ *    9 - Valid bit for @flowid_start
+ *   10 - Valid bit for @flowid_cnt
+ *   11 - Valid bit for @rx_ignore_short
+ *   12 - Valid bit for @rx_ignore_long
+ *   14 - Valid bit for @rx_burst_size
+ *
+ * @nav_id: SoC device ID of Navigator Subsystem where rx channel is located
+ *
+ * @index: UDMAP receive channel index.
+ *
+ * @rx_fetch_size: UDMAP receive channel number of 32-bit descriptor words to
+ * fetch configuration to be programmed into the rx_fetch_size field of the
+ * channel's RCHAN_RCFG register.
+ *
+ * @rxcq_qnum: UDMAP receive channel completion queue configuration to be
+ * programmed into the rxcq_qnum field of the RCHAN_RCQ register.
+ * The specified completion queue must be assigned to the host, or a subordinate
+ * of the host, requesting configuration of the receive channel.
+ *
+ * @rx_priority: UDMAP receive channel receive priority value to be programmed
+ * into the priority field of the channel's RCHAN_RPRI_CTRL register.
+ *
+ * @rx_qos: UDMAP receive channel receive qos value to be programmed into the
+ * qos field of the channel's RCHAN_RPRI_CTRL register.
  *
- * Configures a Navigator Subsystem UDMAP receive channel registers.
- * See @ti_sci_msg_rm_udmap_rx_ch_cfg_req
+ * @rx_orderid: UDMAP receive channel bus order id value to be programmed into
+ * the orderid field of the channel's RCHAN_RPRI_CTRL register.
+ *
+ * @rx_sched_priority: UDMAP receive channel rx scheduling priority
+ * configuration to be programmed into the priority field of the channel's
+ * RCHAN_RST_SCHED register.
+ *
+ * @flowid_start: UDMAP receive channel additional flows starting index
+ * configuration to program into the flow_start field of the RCHAN_RFLOW_RNG
+ * register. Specifies the starting index for flow IDs the receive channel is to
+ * make use of beyond the default flow. flowid_start and @flowid_cnt must be
+ * set as valid and configured together. The starting flow ID set by
+ * @flowid_start must be a flow index within the Navigator Subsystem's subset
+ * of flows beyond the default flows statically mapped to receive channels.
+ * The additional flows must be assigned to the host, or a subordinate of the
+ * host, requesting configuration of the receive channel.
+ *
+ * @flowid_cnt: UDMAP receive channel additional flows count configuration to
+ * program into the flowid_cnt field of the RCHAN_RFLOW_RNG register.
+ * This field specifies how many flow IDs are in the additional contiguous range
+ * of legal flow IDs for the channel.  @flowid_start and flowid_cnt must be
+ * set as valid and configured together. Disabling the valid_params field bit
+ * for flowid_cnt indicates no flow IDs other than the default are to be
+ * allocated and used by the receive channel. @flowid_start plus flowid_cnt
+ * cannot be greater than the number of receive flows in the receive channel's
+ * Navigator Subsystem.  The additional flows must be assigned to the host, or a
+ * subordinate of the host, requesting configuration of the receive channel.
+ *
+ * @rx_pause_on_err: UDMAP receive channel pause on error configuration to be
+ * programmed into the rx_pause_on_err field of the channel's RCHAN_RCFG
+ * register.
+ *
+ * @rx_atype: UDMAP receive channel non Ring Accelerator access pointer
+ * interpretation configuration to be programmed into the rx_atype field of the
+ * channel's RCHAN_RCFG register.
+ *
+ * @rx_chan_type: UDMAP receive channel functional channel type and work passing
+ * mechanism configuration to be programmed into the rx_chan_type field of the
+ * channel's RCHAN_RCFG register.
+ *
+ * @rx_ignore_short: UDMAP receive channel short packet treatment configuration
+ * to be programmed into the rx_ignore_short field of the RCHAN_RCFG register.
+ *
+ * @rx_ignore_long: UDMAP receive channel long packet treatment configuration to
+ * be programmed into the rx_ignore_long field of the RCHAN_RCFG register.
+ *
+ * @rx_burst_size: UDMAP receive channel burst size configuration to be
+ * programmed into the rx_burst_size field of the RCHAN_RCFG register.
  */
 struct ti_sci_msg_rm_udmap_rx_ch_cfg {
 	u32 valid_params;
@@ -463,10 +678,142 @@ struct ti_sci_msg_rm_udmap_rx_ch_cfg {
 };
 
 /**
- * Configures a Navigator Subsystem UDMAP receive flow
+ * struct ti_sci_msg_rm_udmap_flow_cfg - Configures a Navigator Subsystem UDMAP
+ *					 receive flow
+ *
+ * @valid_params:
+ * Bitfield defining validity of rx flow configuration parameters.  The
+ * rx flow configuration fields are not valid, and will not be used for flow
+ * configuration, if their corresponding valid bit is zero.  Valid bit usage:
+ *     0 - Valid bit for @rx_einfo_present
+ *     1 - Valid bit for @rx_psinfo_present
+ *     2 - Valid bit for @rx_error_handling
+ *     3 - Valid bit for @rx_desc_type
+ *     4 - Valid bit for @rx_sop_offset
+ *     5 - Valid bit for @rx_dest_qnum
+ *     6 - Valid bit for @rx_src_tag_hi
+ *     7 - Valid bit for @rx_src_tag_lo
+ *     8 - Valid bit for @rx_dest_tag_hi
+ *     9 - Valid bit for @rx_dest_tag_lo
+ *    10 - Valid bit for @rx_src_tag_hi_sel
+ *    11 - Valid bit for @rx_src_tag_lo_sel
+ *    12 - Valid bit for @rx_dest_tag_hi_sel
+ *    13 - Valid bit for @rx_dest_tag_lo_sel
+ *    14 - Valid bit for @rx_fdq0_sz0_qnum
+ *    15 - Valid bit for @rx_fdq1_qnum
+ *    16 - Valid bit for @rx_fdq2_qnum
+ *    17 - Valid bit for @rx_fdq3_qnum
+ *    18 - Valid bit for @rx_ps_location
+ *
+ * @nav_id: SoC device ID of Navigator Subsystem from which the receive flow is
+ * allocated
+ *
+ * @flow_index: UDMAP receive flow index for non-optional configuration.
+ *
+ * @rx_einfo_present:
+ * UDMAP receive flow extended packet info present configuration to be
+ * programmed into the rx_einfo_present field of the flow's RFLOW_RFA register.
+ *
+ * @rx_psinfo_present:
+ * UDMAP receive flow PS words present configuration to be programmed into the
+ * rx_psinfo_present field of the flow's RFLOW_RFA register.
+ *
+ * @rx_error_handling:
+ * UDMAP receive flow error handling configuration to be programmed into the
+ * rx_error_handling field of the flow's RFLOW_RFA register.
+ *
+ * @rx_desc_type:
+ * UDMAP receive flow descriptor type configuration to be programmed into the
+ * rx_desc_type field of the flow's RFLOW_RFA register.
+ *
+ * @rx_sop_offset:
+ * UDMAP receive flow start of packet offset configuration to be programmed
+ * into the rx_sop_offset field of the RFLOW_RFA register.  See the UDMAP
+ * section of the TRM for more information on this setting.  Valid values for
+ * this field are 0-255 bytes.
+ *
+ * @rx_dest_qnum:
+ * UDMAP receive flow destination queue configuration to be programmed into the
+ * rx_dest_qnum field of the flow's RFLOW_RFA register.  The specified
+ * destination queue must be valid within the Navigator Subsystem and must be
+ * owned by the host, or a subordinate of the host, requesting allocation and
+ * configuration of the receive flow.
+ *
+ * @rx_src_tag_hi:
+ * UDMAP receive flow source tag high byte constant configuration to be
+ * programmed into the rx_src_tag_hi field of the flow's RFLOW_RFB register.
+ * See the UDMAP section of the TRM for more information on this setting.
+ *
+ * @rx_src_tag_lo:
+ * UDMAP receive flow source tag low byte constant configuration to be
+ * programmed into the rx_src_tag_lo field of the flow's RFLOW_RFB register.
+ * See the UDMAP section of the TRM for more information on this setting.
+ *
+ * @rx_dest_tag_hi:
+ * UDMAP receive flow destination tag high byte constant configuration to be
+ * programmed into the rx_dest_tag_hi field of the flow's RFLOW_RFB register.
+ * See the UDMAP section of the TRM for more information on this setting.
+ *
+ * @rx_dest_tag_lo:
+ * UDMAP receive flow destination tag low byte constant configuration to be
+ * programmed into the rx_dest_tag_lo field of the flow's RFLOW_RFB register.
+ * See the UDMAP section of the TRM for more information on this setting.
+ *
+ * @rx_src_tag_hi_sel:
+ * UDMAP receive flow source tag high byte selector configuration to be
+ * programmed into the rx_src_tag_hi_sel field of the RFLOW_RFC register.  See
+ * the UDMAP section of the TRM for more information on this setting.
+ *
+ * @rx_src_tag_lo_sel:
+ * UDMAP receive flow source tag low byte selector configuration to be
+ * programmed into the rx_src_tag_lo_sel field of the RFLOW_RFC register.  See
+ * the UDMAP section of the TRM for more information on this setting.
+ *
+ * @rx_dest_tag_hi_sel:
+ * UDMAP receive flow destination tag high byte selector configuration to be
+ * programmed into the rx_dest_tag_hi_sel field of the RFLOW_RFC register.  See
+ * the UDMAP section of the TRM for more information on this setting.
+ *
+ * @rx_dest_tag_lo_sel:
+ * UDMAP receive flow destination tag low byte selector configuration to be
+ * programmed into the rx_dest_tag_lo_sel field of the RFLOW_RFC register.  See
+ * the UDMAP section of the TRM for more information on this setting.
+ *
+ * @rx_fdq0_sz0_qnum:
+ * UDMAP receive flow free descriptor queue 0 configuration to be programmed
+ * into the rx_fdq0_sz0_qnum field of the flow's RFLOW_RFD register.  See the
+ * UDMAP section of the TRM for more information on this setting. The specified
+ * free queue must be valid within the Navigator Subsystem and must be owned
+ * by the host, or a subordinate of the host, requesting allocation and
+ * configuration of the receive flow.
+ *
+ * @rx_fdq1_qnum:
+ * UDMAP receive flow free descriptor queue 1 configuration to be programmed
+ * into the rx_fdq1_qnum field of the flow's RFLOW_RFD register.  See the
+ * UDMAP section of the TRM for more information on this setting.  The specified
+ * free queue must be valid within the Navigator Subsystem and must be owned
+ * by the host, or a subordinate of the host, requesting allocation and
+ * configuration of the receive flow.
+ *
+ * @rx_fdq2_qnum:
+ * UDMAP receive flow free descriptor queue 2 configuration to be programmed
+ * into the rx_fdq2_qnum field of the flow's RFLOW_RFE register.  See the
+ * UDMAP section of the TRM for more information on this setting.  The specified
+ * free queue must be valid within the Navigator Subsystem and must be owned
+ * by the host, or a subordinate of the host, requesting allocation and
+ * configuration of the receive flow.
+ *
+ * @rx_fdq3_qnum:
+ * UDMAP receive flow free descriptor queue 3 configuration to be programmed
+ * into the rx_fdq3_qnum field of the flow's RFLOW_RFE register.  See the
+ * UDMAP section of the TRM for more information on this setting.  The specified
+ * free queue must be valid within the Navigator Subsystem and must be owned
+ * by the host, or a subordinate of the host, requesting allocation and
+ * configuration of the receive flow.
  *
- * Configures a Navigator Subsystem UDMAP receive flow's registers.
- * See @tis_ci_msg_rm_udmap_flow_cfg_req
+ * @rx_ps_location:
+ * UDMAP receive flow PS words location configuration to be programmed into the
+ * rx_ps_location field of the flow's RFLOW_RFA register.
  */
 struct ti_sci_msg_rm_udmap_flow_cfg {
 	u32 valid_params;
@@ -516,7 +863,7 @@ struct ti_sci_msg_rm_udmap_flow_cfg {
  * struct ti_sci_rm_udmap_ops - UDMA Management operations
  * @tx_ch_cfg: configure SoC Navigator Subsystem UDMA transmit channel.
  * @rx_ch_cfg: configure SoC Navigator Subsystem UDMA receive channel.
- * @rx_flow_cfg1: configure SoC Navigator Subsystem UDMA receive flow.
+ * @rx_flow_cfg: configure SoC Navigator Subsystem UDMA receive flow.
  */
 struct ti_sci_rm_udmap_ops {
 	int (*tx_ch_cfg)(const struct ti_sci_handle *handle,
@@ -558,10 +905,15 @@ struct ti_sci_proc_ops {
 
 /**
  * struct ti_sci_ops - Function support for TI SCI
+ * @core_ops:	SoC core operations
  * @dev_ops:	Device specific operations
  * @clk_ops:	Clock specific operations
+ * @pm_ops:	Low Power Mode (LPM) control operations
  * @rm_core_ops:	Resource management core operations.
  * @rm_irq_ops:		IRQ management specific operations
+ * @rm_ring_ops:	Ring Accelerator Management operations
+ * @rm_psil_ops:	PSI-L thread operations
+ * @rm_udmap_ops:	UDMA Management operations
  * @proc_ops:	Processor Control specific operations
  */
 struct ti_sci_ops {
-- 
2.34.1

