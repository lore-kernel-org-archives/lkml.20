Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793886735;
	b=EIXcKmaXsFgcMKQZAp/HsBU9QdtIpZQ5QDw1qvAwf5nUf/rAlTaNfQGR86kLLr+WqsQC
	 SUMPXB5oQok6pk/q5j3gupUeK9S4IpKSI5XcT/ZszzNJNMoHkBJHvpDPtLhLc8XQVv/E0
	 Ph9+KXTKqhfwNZGJg2Fllgqa5TWFIKYuXRtAgGQaFhEJn6nnuJoAkE9aThkYKVBVnMai4
	 WC1CYOg2jyxsXOx0dl5vboJcgbcqK5m2ArUumX3yzteitr+j/g6eFK/T0B34jaf4lahjl
	 oL6J3PdsRoo/Yh+Y1ou2fA31l7B+WMiW2rCutaPLk8lx6QYXW1X8sjnw1omNU/ZWy1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886735;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Reason;
	bh=9v71cuBj9DnNrKT8G8Ir4syD260TgUiw1lY8e8+7uMk=;
	b=0jngrVUD2RDCAarVPkGFvLSa3xbEaczYIW71uLrSMZhnNyAFFWOnAePF8A7j/16VlxqP
	 n/Lra8xF7dziDtGkPEboteg0NUQY03ebhOKh3KVDCaW+VBuISlvzExDdopNxuqeLDCg48
	 Qu7PWvs6vNvrNbb9ODEXeTN4V/BzuKNRAkfeWQXZfjvIFPQjsZVKtksj/ekD2GrbaJ3QH
	 zDd4OAo/HxQ/Hb80aQ6045Q5nB6tKf73flH+g9zNp+4MpETgFgeeVzvGvtqPAfMVzSIpn
	 /NHxuvPz7qME+trF69VwC5xyNRht1S47SlR2RNTehZwQYrP4hypHyFV5Gq9jAybGVKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Ghbvtmbg;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Z9vGJFH3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5320E606A326;
	Thu,  5 Nov 2026 13:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5320E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Ghbvtmbg;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Z9vGJFH3
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5DIZaI1741977;
	Thu, 5 Nov 2026 07:52:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9v71cuBj9DnNrKT8G8Ir4syD260TgUiw1lY8e8+7uMk=; b=
	Ghbvtmbg45R5EvbuttuviLyoyK6+z30OFp6zqe+Bw3HvMC/ypJxG8EpaJXkgWJ4+
	GOh4+2L4DZlZSc2LW8CzNKyJ6106XurhEavzvJfrm4Y+fIaZFv9rrsfjc50vSjnS
	cGyzDferTf/lpwIeYAYESTb/i71LeFnIznc4pwKb59GEg4pWIzPvC2DINYsM+udS
	IUpq4KcBb7OufaTQ+Dp6l1duAV4WHTPA6YezbFoco6CWaoFOJwsRxt8uCqRpGSUY
	/Xwy7tCFblb8fawvCEU0QiJjzjXcRrDb55Ch3s3zgimbtWGYULzzTm45FLXlfQPw
	vMl+/f8AOmbkSWfif3I1KQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020107.outbound.protection.outlook.com [52.101.201.107])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hr73fhvw1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 07:52:04 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F72m9qbrFWYBnezVOgnCNRIlHKhgORKR4gW8Db4Gvj1DPzQWH92EONOPkp4GZtxcalVpxRc1dTbskgvblEjTQtD9K2sA1x6mAUwiOSFjvwMB+eJIAgW1ywsnuZ2SY5IEGzlWK2O3eWyZXsw6rf4oMHbObjKhPLYLGPRQ4ree1aBnFHmyftyykh06Bvxtl9lywD2l6PoohtWI/Iw8DOmwnZyM61qr3gnHLEpttKUS5/oTHlr0MU3JOoeXZcte5IaJ+5TbY+B1x2yeKHJSffWlfF6x9Fl+hzU/l6qZuSA7h0PwH8bf7wn4LejgqLMMZPTRD64KNVyLbNNaQP19Xf5pWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9v71cuBj9DnNrKT8G8Ir4syD260TgUiw1lY8e8+7uMk=;
 b=P6vz/19Bqb57Uv8FIxbj8Z3qkQk2p4i3fhKNkhLMH2Iqh5WiSXvq2RHkPcQ0HAUhITT8Ftk1J0HSHhyPC4BGpeqRPfQQmBovMypuKalrTlUkOW36QTXqJl+og+wxZE70sx8nf2SstgHdwqwMxiLVCPaWVlNRuqu1g1ti3GAKnWIPWv9OxAtqh29RpQ4XeKFX5yiJHa3Ewtf/XrvrgSykCCEGu4bLa9RSGdPDfbBZlSUwGhtGncyKWdkX4lxPpmFwLno5vcWk74TF48igAJN+NI86bQ9ihlBDnUvJsGvNZfYKi+MzQqUZsYpu2WrdCXlp3WBcIyC1bEGsqZBo+sNkyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9v71cuBj9DnNrKT8G8Ir4syD260TgUiw1lY8e8+7uMk=;
 b=Z9vGJFH3BSb4O8XB0KMuXfaWqeNeXPpsW7A8hG0iMYRNvNDF/lhfLdf3BrIEVUkh/ehcKFIFz/2KuDvdfe1DM16o2jFPm6YiZbhAbi2PMwSdIkOq4wx6ADoUQc1mXn20defMPnmfw5cB6g1YYjRWE2yrlGz10eD8ybXU+f3mrro=
Received: from BY1P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::12)
 by BL3PR19MB5323.namprd19.prod.outlook.com (2603:10b6:208:346::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 13:49:58 +0000
Received: from PH4PEPF0000B60D.namprd21.prod.outlook.com
 (2603:10b6:a03:59d:cafe::94) by BY1P220CA0010.outlook.office365.com
 (2603:10b6:a03:59d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 13:49:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 PH4PEPF0000B60D.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.2
 via Frontend Transport; Thu, 5 Nov 2026 13:49:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BBD3040654E;
	Thu,  5 Nov 2026 13:49:55 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A1675822561;
	Thu,  5 Nov 2026 13:49:55 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: SDCA: Add port constraints into sdca_asoc_set_constraints()
Date: Thu,  5 Nov 2026 13:49:52 +0000
Message-ID: <20261105134952.1728147-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105134952.1728147-1-ckeepax@opensource.cirrus.com>
References: <20261105134952.1728147-1-ckeepax@opensource.cirrus.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH4PEPF0000B60D:EE_|BL3PR19MB5323:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4ca12400-49df-4063-b2ae-08df3b43adbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|376014|36860700016|82310400026|261026140227099003|11063799006|56012099006|261021123027099003|261021121427099003|261102123227099003|261026121527099003|261022105027099003|261022075727099003|261009223027099003|261028144727099003|261102130727099003|10067099003|22082099003|18002099003|16102099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	q+ONuFtPh8OoX8tK8nIfW7F7FV9xwpIxAeIceKZ/DzjtOEICJOnd/SUJBNZoOwe1D68Em/yVwGXuW0ZLMyDmqKwJPRqmmMDtsvPDKg4Gg6uKqrJTuC0TXoWt0zLtdisIFwSi5Ro9Ept3z1s7g6wCZQLRZ7gVPPKUYKhLT8I1wemJ8/uPe38b9OXkG05D9/EkQ4kB3WBN4zlZSrGx5qTOLiNzK/cb60X7CUAes2jej1neu4vy270fhw7ST+OhoEFTi9il5+19o9H6T13iHbejPrTEag0V9DUWtkxN8Eg3cvigM4X1zeXRXlVB/yqJ/ZAnvg32lvQSrhkMTQ2D6p2S+eYldUXZtQH/rxpVyiafnhmXD7RiOu/N1nJwLPYpB5qOKSjiWCkHib/PmrGKRfmQvzInv8/qO6Lom4zyJWyER/LLlBzJJnnA8/dOvBM8k4feGWWdcTpTQhgM/lBqe/VvWkQePqDqfde+vSdLLDjKoSeaVIUhk4I5CJwe1lS0YfTvXks1zcrjWRKeLig4btQx+prEHGlBXyea78QxPXZgQccOCHCfVOZsX8fqeLcqV+9j8jFEr+9pcPjAvUwo91OOt8dRob7NPHbV02pyTH+PjM8CGsAivozP8JCSlHTTWqVdz1jyK4r0zbFhpjOP8CfPubc4tsrUgtll8cuLjXjbBaJQdCWYhLrptkQvoJzKtxy44zgXhmNBeHR2dJS6y/Ef9A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(376014)(36860700016)(82310400026)(261026140227099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(261026121527099003)(261022105027099003)(261022075727099003)(261009223027099003)(261028144727099003)(261102130727099003)(10067099003)(22082099003)(18002099003)(16102099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/IzxK79BrEr9q6wcYGaC+72YKopiIxPPOOJq95+2ZZ6A0fNY9APW/RQyOHywq1c5h+2iQPtvKhkLEFSuhwW/Huf/t9MxOuu/MqIDTAIoCT3OavtuwC8qEgFsMZKE1P+YKMTfijhd5MJ9Z7k0efaGyLOPaI7vHRe+VNjGO+ySE9ECw7nDSWol2kK1Mb8DwF2peZyVtomBVEw0dvui/v8tHMvy8Vs/Zd3bJEcrceeygFNryahh+XlkyZF1okPxxit5NtchNv/lENBuYmkZaOiqmaPqB/ApByRpfqdlm7ly16Up1YzarQ76AieS/Or9dqFCyLqiG8gpHRekCeByfTRLDtENJSRHvJAeg8piLxGY5MLPiOfhg2zWsq4s2dBHmdkNWgj+zrQQhQYuWoNzhF35U7ZjpKrh9Uf2bLID2GuHJo1FSu6NgoHaG9dUZsHKu2wd
X-Exchange-RoutingPolicyChecked:
	DhyuFOYaRvjOXzn3EzFVATnc4o57a1GdjaLRH2kki/uB5QQFcPCEm/jMuLfkslibpyckH/cLM21p8Ofah9B8mJE1JpzwPMZR8gEatSS9mDcKlQL/fRUf5LZwkGEO19GBg0NqYqFmgpECeMwWEfq3Hiz0s9iRGYuD8688O0fBWUrtZTIjj5d3vZ0sQqC4C0rj9ZkNVp9WdJJH7c6eDpPpmWFIFlKvGp3HSw31nvRbROhsOMRnvCw1Ab1bv8qDiSXKatfzM8dHBkH0EHCRovqF8NBiy3NH5T9xIc0Gnyepgis5A0+HSSUwEJagGN5J5HLU6ctGTHALW4Gk8VvjLRZ8kA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 13:49:57.0701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca12400-49df-4063-b2ae-08df3b43adbf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-PH4PEPF0000B60D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR19MB5323
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NSBTYWx0ZWRfX6wmJ31qk7/Vp
 n9C58DLJ9tY2d8rTkbedSl+58HlLwGNsq+NOk0fDALvNoHkMfioesGS08gTecboQ/koXquQ/DBu
 o6BSUsYYzQgX1+0d1emkGXJ2eBeytOY=
X-Proofpoint-GUID: cVcvZjSbd10IYHCy0_OCTVbCUfAGFMJQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NSBTYWx0ZWRfXyTAl10WC4YUL
 Ojj2HTnXVnI8JzFLJSKDuth7N+9BgjQsZ7lfOLyJMpA0X1KflM+YwRfKOiO/1jsXeMWuyH8iPZc
 vFsTfh3sEZwW9sK2P0n/IbZHjUZwANcdb5o+8D3fPcRFMlQ4iw62U9VtNVlMhmdiU1H10ZpCX1F
 V10XCRR0BZ2SB+Dv+Nj8Y3Y0Sx2i8LBKDW9fKtYUO8B7JbAURfEF2EionBZ2b3VNh/guGWKL35K
 mHhmHUEBzgAcVLHWgNz5o7vz+4b8NP5BAHK2EEwq9LitzxsUFcGm1KFsD5yKYHowrfN1cAag8Eu
 NC435TJV19tJcxQ626l89uzabTRdNR+HAuKiGsD79/Ct7RmT5/N3D/2SQKJnC/vyOeyQPWYXUzf
 5dmx+1jXxbR6eVNT2rZcg39W6NXyZuxl0ctETbtw9bSY4d1Tgmqxk5wttNQ7bu5Dp25naOwX7sP
 jeET53csuzzfZS3/RMg==
X-Proofpoint-ORIG-GUID: cVcvZjSbd10IYHCy0_OCTVbCUfAGFMJQ
X-Authority-Analysis: v=2.4 cv=K6S3jCWI c=1 sm=1 tr=0 ts=6aec8a04 cx=c_pps
 a=hXZiUtiVoVCKrsLoS6Demw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=Y9NKhIelm0NG5JGs-SEA:9
X-Proofpoint-Spam-Reason: safe

Currently the SDCA code constrains the params based on the DisCo for
the SDCA Terminal used. However, it ignores the properties of the
SoundWire port, which in some cases may further constrain the allowed
params. Add additional constraints to apply these restrictions.

Some minor additional refactoring is required since port constraints
should be applied for both Input and Output Terminals, whereas
currently Cluster constraints are only handled for Input Terminals.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_asoc.h            |   4 +-
 sound/soc/sdca/sdca_asoc.c           | 122 ++++++++++++++++++++++-----
 sound/soc/sdca/sdca_class_function.c |   3 +-
 3 files changed, 106 insertions(+), 23 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index 599a72f335153..965ca5ce06a77 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -12,6 +12,7 @@
 
 struct device;
 struct regmap;
+struct sdw_slave;
 struct sdca_function_data;
 struct sdca_pde_delay;
 struct snd_ctl_elem_value;
@@ -89,7 +90,8 @@ int sdca_asoc_populate_rate_format(struct device *dev,
 				struct sdca_entity *entity,
 				struct snd_soc_pcm_stream *stream);
 
-int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
+int sdca_asoc_set_constraints(struct device *dev, struct sdw_slave *sdw,
+			      struct regmap *regmap,
 			      struct sdca_function_data *function,
 			      struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai);
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index b801cb92cc3db..4a96ec5d11743 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -13,11 +13,13 @@
 #include <linux/delay.h>
 #include <linux/dev_printk.h>
 #include <linux/device.h>
+#include <linux/limits.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/string_helpers.h>
 #include <linux/types.h>
@@ -1465,9 +1467,56 @@ static int get_cluster_mask(struct device *dev, struct sdca_function_data *funct
 	return 0;
 }
 
+static int get_port_masks(struct sdw_slave *sdw, unsigned int port,
+			  struct snd_pcm_substream *substream,
+			  unsigned int *word_mask, unsigned int *ch_mask)
+{
+	struct sdw_dpn_prop *prop;
+	unsigned int nprop;
+	int i, j;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		prop = sdw->prop.sink_dpn_prop;
+		nprop = hweight32(sdw->prop.sink_ports);
+	} else {
+		prop = sdw->prop.src_dpn_prop;
+		nprop = hweight32(sdw->prop.source_ports);
+	}
+
+	*word_mask = 0;
+	*ch_mask = 0;
+
+	for (i = 0; i < nprop; i++) {
+		if (prop[i].num != port)
+			continue;
+
+		if (prop->min_word && prop->max_word) {
+			*word_mask = GENMASK(prop->min_word - 1, prop->max_word - 1);
+		} else {
+			for (j = 0; j < prop->num_words; j++)
+				*word_mask |= (1 << (prop->words[j] - 1));
+		}
+
+		/* Only handle the number of channels for constraints. */
+		if (prop->num_ch_combinations) {
+			for (j = 0; j < prop->num_ch_combinations; j++)
+				*ch_mask |= (1 << (hweight32(prop->ch_combinations[j]) - 1));
+		} else if (prop->min_ch && prop->max_ch) {
+			*ch_mask = GENMASK(prop->min_ch - 1, prop->max_ch - 1);
+		} else {
+			*ch_mask = GENMASK(0, prop->num_channels - 1);
+		}
+
+		return 0;
+	}
+
+	return -ENODEV;
+}
+
 /**
  * sdca_asoc_set_constraints - constrain channels available on a DAI
  * @dev: Pointer to the device, used for error messages.
+ * @sdw: Pointer to the SoundWire peripheral device.
  * @regmap: Pointer to the Function register map.
  * @function: Pointer to the Function information.
  * @substream: Pointer to the PCM substream.
@@ -1477,51 +1526,82 @@ static int get_cluster_mask(struct device *dev, struct sdca_function_data *funct
  *
  * Return: Returns zero on success, and a negative error code on failure.
  */
-int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
+int sdca_asoc_set_constraints(struct device *dev, struct sdw_slave *sdw,
+			      struct regmap *regmap,
 			      struct sdca_function_data *function,
 			      struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
-	static const unsigned int channel_list[] = {
+	static const unsigned int constraint_list[] = {
 		 1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16,
 		17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
 	};
 	struct sdca_entity *entity = &function->entities[dai->id];
-	struct snd_pcm_hw_constraint_list *constraint;
+	struct snd_pcm_hw_constraint_list *constraints;
+	unsigned int port_ch_mask, port_width_mask;
 	unsigned int cluster_ch_mask;
+	int port;
 	int ret;
 
-	static_assert(ARRAY_SIZE(channel_list) == SDCA_MAX_CHANNEL_COUNT);
+	static_assert(ARRAY_SIZE(constraint_list) == SDCA_MAX_CHANNEL_COUNT);
 	static_assert(sizeof(cluster_ch_mask) * BITS_PER_BYTE >= SDCA_MAX_CHANNEL_COUNT);
 
-	if (entity->type != SDCA_ENTITY_TYPE_IT)
-		return 0;
+	/* FIXME: Currently only a single unshared port is supported */
+	port = sdca_asoc_get_port(dev, regmap, function, dai);
+	if (port < 0)
+		return port;
 
-	ret = get_cluster_mask(dev, function, entity, &cluster_ch_mask);
-	if (ret)
+	ret = get_port_masks(sdw, port, substream, &port_width_mask, &port_ch_mask);
+	if (ret < 0) {
+		dev_err(dev, "%s: no properties for port %d\n", entity->label, port);
 		return ret;
+	}
 
-	dev_dbg(dev, "%s: set channel constraint mask: %#x\n",
-		entity->label, cluster_ch_mask);
+	/* FIXME: OTs should inherit cluster information */
+	if (entity->type == SDCA_ENTITY_TYPE_IT) {
+		ret = get_cluster_mask(dev, function, entity, &cluster_ch_mask);
+		if (ret)
+			return ret;
+	} else {
+		cluster_ch_mask = UINT_MAX;
+	}
 
-	constraint = kzalloc_obj(*constraint);
-	if (!constraint)
+	constraints = kzalloc_objs(*constraints, 2);
+	if (!constraints)
 		return -ENOMEM;
 
-	constraint->count = ARRAY_SIZE(channel_list);
-	constraint->list = channel_list;
-	constraint->mask = cluster_ch_mask;
+	constraints[0].count = ARRAY_SIZE(constraint_list);
+	constraints[0].list = constraint_list;
+	constraints[0].mask = cluster_ch_mask & port_ch_mask;
+
+	constraints[1].count = ARRAY_SIZE(constraint_list);
+	constraints[1].list = constraint_list;
+	constraints[1].mask = port_width_mask;
+
+	dev_dbg(dev, "%s: set constraint masks, channel: %#x, width: %#x\n",
+		entity->label, constraints[0].mask, constraints[1].mask);
 
 	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
 					 SNDRV_PCM_HW_PARAM_CHANNELS,
-					 constraint);
+					 &constraints[0]);
 	if (ret) {
-		dev_err(dev, "%s: failed to add constraint: %d\n", entity->label, ret);
-		kfree(constraint);
+		dev_err(dev, "%s: failed to add channel constraint: %d\n",
+			entity->label, ret);
+		kfree(constraints);
+		return ret;
+	}
+
+	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
+					 SNDRV_PCM_HW_PARAM_SAMPLE_BITS,
+					 &constraints[1]);
+	if (ret) {
+		dev_err(dev, "%s: failed to add word constraint: %d\n",
+			entity->label, ret);
+		kfree(constraints);
 		return ret;
 	}
 
-	snd_soc_dai_set_priv(dai, constraint);
+	snd_soc_dai_set_priv(dai, constraints);
 
 	return 0;
 }
@@ -1537,9 +1617,9 @@ EXPORT_SYMBOL_NS(sdca_asoc_set_constraints, "SND_SOC_SDCA");
 void sdca_asoc_free_constraints(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
-	struct snd_pcm_hw_constraint_list *constraint = snd_soc_dai_to_priv(dai);
+	struct snd_pcm_hw_constraint_list *constraints = snd_soc_dai_to_priv(dai);
 
-	kfree(constraint);
+	kfree(constraints);
 }
 EXPORT_SYMBOL_NS(sdca_asoc_free_constraints, "SND_SOC_SDCA");
 
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 13b70f0f0dbf7..d7fba834601e6 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -121,8 +121,9 @@ static int class_function_startup(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
+	struct sdw_slave *sdw = dev_to_sdw_dev(drv->dev->parent);
 
-	return sdca_asoc_set_constraints(drv->dev, drv->regmap, drv->function,
+	return sdca_asoc_set_constraints(drv->dev, sdw, drv->regmap, drv->function,
 					 substream, dai);
 }
 
-- 
2.47.3

