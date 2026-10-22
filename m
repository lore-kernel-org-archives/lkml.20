Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792683038;
	b=0wsl78amU2lk152BXX0m9HloqNB9lP5Tex49PzIVGQqPbHqbIHqewU2TVFQ7SCnXrMCK
	 AGeKEi6sqvt4dJNBGcuZbwqVIJw+PZXMtjGEeC3P/6tlzXTvXB70Fq7j/JyqgHsaZQJqD
	 CbXqwexhdlN4rPXK6JUtWYIWafwwRP0mzlkW+l3JAlxkwibGIONAFXQFZxNRx+I4sg1/m
	 +EGldfG6TEGHD4jXRBfqjoGtKIlib0aKJ15kAr59agmgMU6sxdry7vfzIPks31+WDMbfi
	 Ft79l3BA6UZj5I2EeSLI1swWq5rVxRnOO3Mu0ylgra7BhGUWSFDA3hvhOZnCmp2Np/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683038;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sN+I3M8LiVI0rz86WDdESYCxlDIZvyD6wj6KHh61WR4=;
	b=xER+ggqzGEnt+aQ4yDlcBCx/IK35p5z63uFe+IBfzhPpWcPBq9PwBJWLtbiKMzcorazE
	 Zxh9P5DAJC/8+i/AMPLzpAH9QCawBwi8iuVG1iaAKZJ6/LjwIQV4NbpMYBgB3pli2CnTv
	 eLWECOGMF7N1Nz7ZFa+/nAqbR3lK7DWXLMAr+eUmu8Lrp2VhB468xwa1ur2tIOmpGNMe/
	 E/2UKRkrXnnyS1n5l0IOs0D8KLfSramLr4p/cGFv6K5Npm7OXw/oGzyyMIKKk4zwfRp6f
	 jHGn8bXNiDcIVipXSR/qGjAZinte6LnJLyhd66onzdDidkeVPTZ12PHJrnkkV1ggAkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b="GT4Hsl/J";
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=MgyFJNfX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5E3606A31A;
	Thu, 22 Oct 2026 15:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A5E3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=GT4Hsl/J;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=MgyFJNfX
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69MEgNcp450288;
	Thu, 22 Oct 2026 10:30:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=sN+I3M8LiVI0rz86WDdESYCxlDIZvyD6wj6KHh61W
	R4=; b=GT4Hsl/JcmqcdsI6DTNLOfZIi4P43h8w7uFep6yy9PT9fFtqfE3r6nzWQ
	XERBF+EHTmTLDkSfj/iQMep0csOu1W4rWgf3iU6yBzYYIrO3Xgyw/I6lMJCdJ2vq
	iDZj4Z7EhDtDCpr/B5Dg5b1YlAlJRhnsfPdFc9AkyM3ppOMMbuZkbRZSD8VZv+nA
	a38uOyZJtgycpwUnGeW/TmiPiYIl8YPNny4n4MiYnO5981pSvtJfivHXFolqVb06
	XD8DGwugJTrXTt6VChgYsgiuFBf+wzaf2ZZFuoz5T0B9bH/2PfbElzS2OVwjry2x
	kwz/Vtt2vkwT/dPBfX4ndMCvKlozw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010048.outbound.protection.outlook.com [40.93.198.48])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hfmg20bn2-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 10:30:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzglZCQ1/Ef+aFlWunL9KIdJsGZ7QHEvO1DdFPEsIALmmwtWUsRehItuzCIyudxy4cv25XS6xOCVH0hgSCC7tCaENWMXv0EThOmmtkYQmKLzCh7yj6UYnXsQAynBBPAsESDYRP75jJQmtMQ7NzJkctc762oVZngoczFiGG40jCRdDf7tvG5owEmpyNIacflzkVl448I2h2qic6I8H36snRqt98yB9F6tPzfQ14XVAqKTB5vSY6h7wPbMOeDh3mLaT0dd545NCKXi87HPpNtPCY62BjD77LRg+Yhcaakxey5/OO0jMkN2veN8nhUg11jpHS9U2+QZh73iYGSSQCe40A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sN+I3M8LiVI0rz86WDdESYCxlDIZvyD6wj6KHh61WR4=;
 b=C/4dW2xOsBFdWLjBfzvHQB+hz1P52kYRb1baRGJfTWUpXjhdQhTg7nMUM754IuoHDz10hjhYSVOsYdJa7CpX51jfaE/P6+2rIIvV+kZh4eXvHvzCg1d1FKnQL7fjV/bVGbQN3U/MbzYjGtMRcCapG0UpqVvtjSYkfc/79bQYxPxfNSCcZ2R5R9FBwMb+FlvT+/nU0dV4Cu5Ex0kzPgW46eNc6BLknieVpHUE/ZVmgrhuQGG+ylQSqW0AcyZEZPw8e44842WslsAD5gQCJD5YF2ZIbksUn3obi2hA0ElSqUhsMI2OFxqzDw73vzjVyEfGgx3YvGp6fOyDHY8BXpf3FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sN+I3M8LiVI0rz86WDdESYCxlDIZvyD6wj6KHh61WR4=;
 b=MgyFJNfXJgxBp5DX1cF/pNIzgAbljRNQrrtUWVokgnJFiU+ezZY9u1Lcn49BtF2zUC9flg1nM+zhhwhie6c78gvBmsmuKVvpFtslsM7hNlqCagmgfxJBV+X+3VI/EZ3kBUV0Kp1q7SvVS2GiUdilgbsCmIypiVjgBMKcl0T0pDc=
Received: from SJ0PR03CA0101.namprd03.prod.outlook.com (2603:10b6:a03:333::16)
 by DS0PR10MB6846.namprd10.prod.outlook.com (2603:10b6:8:11d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 15:30:14 +0000
Received: from MW1PEPF0001888E.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::77) by SJ0PR03CA0101.outlook.office365.com
 (2603:10b6:a03:333::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 15:30:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MW1PEPF0001888E.mail.protection.outlook.com (10.167.249.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 15:30:12 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 10:29:23 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 10:29:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 22 Oct 2026 10:29:23 -0500
Received: from [128.247.75.1] (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69MFTNsb1635301;
	Thu, 22 Oct 2026 10:29:23 -0500
Message-ID: <5be7bd39-c5f5-4906-ba2e-55908bc5cee5@ti.com>
Date: Thu, 22 Oct 2026 10:29:23 -0500
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
Subject: Re: [PATCH v3 1/4] media: wave5: handle remaining decoder runtime
 resume failures
To: Jiale Yao <yaojiale02@163.com>, Nas Chung <nas.chung@chipsnmedia.com>,
        Jackson Lee <jackson.lee@chipsnmedia.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        "Hans Verkuil" <hverkuil@kernel.org>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261021151552.428590-1-yaojiale02@163.com>
 <20261021151552.428590-2-yaojiale02@163.com>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <20261021151552.428590-2-yaojiale02@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001888E:EE_|DS0PR10MB6846:EE_
X-MS-Office365-Filtering-Correlation-Id: c81d0fd8-97f9-42f3-38cd-08df30515d5a
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|18002099003|10067099003|22082099003|261021121427099003|3023799007|261021135927099003|261021123027099003|4143699003|261009221227099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
 Rf3TfFkOayPURbqpYzw1vo7hlYT7wssC7M5MWs5UxGavw6ARM/PPevhleVSri0DNP9PAzX9mhLTpzgIkIPE7xY5fYUr1spO1DsM1nW8xbT6mkCT5O2zjMLxDVJ95AVVbceON11bR3WEMOWf+t6WiCbnlf2X2ntDOdrjjD0LYbOyYaS5VVoajbU8HkranaZjkrm/hbm5/xC7sCfgrTbQnHkpDnEkGZMXIbnYD/dQ9JAnTdEIUj/S3PhxnPndABULi549XAcFsiV/gnCh0LFYdJ9kglJhy7dEBZOFfw+iXCLWTwoXiDb9XfCRHUjiQEbTmNYANvbrPX/7sdV0AyNCAhgNFLLDWOxAtt+TjcLFhlC3V6jRnQnnygZc0eiyNrTOVvmcFxURvvaExskbVw8rKF/k7Wtzn2hzu26P4HYy/NQRUF40qLMC2FyzyEFUDcywiRo6tZx2vUnh6lFW/04HMrgsIV05zYRIGeCwtSYnqfAlKIINsQ2x1JzSBt94t32W/25HLv7v/sXNNBtbTdKGb1brhzqBxBeEZU9RPS30Y4/gb1heJhM/xqdZGBOZRzN+lyoXuekgj0H/QtfSOl9hbM4l3/48/h/ONjp15gy5O9yvkx6xFVHShNA4ei+ZgElunVIrwpGBqv8dZ7yAk3nxQdFN/9lbxQQUgnB6OO/WElc6tJNOJ5duJPTO76GheK2DcvwR2HBbFAWQMp7DmAZePYw==
X-Forefront-Antispam-Report:
 CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(10067099003)(22082099003)(261021121427099003)(3023799007)(261021135927099003)(261021123027099003)(4143699003)(261009221227099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 Zp8k3/JO+4/97uqfUx8nuEcO99h+FoRvp63LVXC6mpnIfXyk49BehnxI9OF1pPpFe9CjhQvaSPBAc1h0Db7e4MZ0cNZFwgbgfr5TJGiA+MIcMC93Xyf3zvrVAZBOZhJNtkfCSkRRk2/O/95Ib0kebQfQGN2Kk0D2ZbZcf4cQvYPuYA6MmyIIURVtLlDliVBWdrapn/Tg0njNVcaS5miZAahqfz0qdRANfZ4uqRktK9M5fcYebNw76YilviMDMJ/RZfVW4DPuEIfcc3fE+tkefNkZByH6heJEg84nvPEADh74vvCqLpGDpCkDDO1by/MUMo5Q8mlex9ltymwTbMHTaJ/pgRiE3dKSOQmKF6eS5o8GuMZA+a5GwplS/jgVcPRjfZfQ0zEI94JoPgqj6yUJ4tSNiHPi3zUtlS65+E3tVU/BHeIt+zxu6B+CZVbISPM+
X-Exchange-RoutingPolicyChecked:
	rOyTrLdOPUPmnWfQk/FLLXBFWarBwmMT8Iv5vwSUzn3/VNwwZ5BbZlPlpwCORXdLCBY1PLSK6acdAI2m1LVpTci+O3DVp7TXWbYPs8wuz6PkanXNx5eku9xYjsAuFNFUZXR/RIpLPROV7RmAIbg2dp8wTWBeW9TvjRkhsbebxo6yr5LKzbQbZG6nR0kj1KR2EnOHkiamM56UdFcw2AP74DLpo4IopTz/rnaH6VsdYomrnilKsPeMRJcGDHGTv4prKieUNDj+EBp+fRIZmxpmHBTeiMRxARMPxpVnyZ/IEkuQISdFBKxcZ2HYdCOwXe8wHGWWKJaktyURRH9RgI1XNQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 15:30:12.5771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c81d0fd8-97f9-42f3-38cd-08df30515d5a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF0001888E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6846
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA2MSBTYWx0ZWRfXyTzdQGdBO8NE
 kiqnjz2CSwvwi5593ZpOyWArCzrUbfi6eGV6aTzvNOhb3vJJle88zpb6CJnIyW4Rm+Txf/1pqCE
 R4LAEj/9qfoTHL+VNjj9CEIP2gTn7Mw=
X-Proofpoint-ORIG-GUID: UZRi5NdUAuH8GWZE8kl1J7W4JzYerFcz
X-Authority-Analysis: v=2.4 cv=XISl2ghE c=1 sm=1 tr=0 ts=6ada2c0e cx=c_pps
 a=2TFapuF8m4VBt/+2R/0yYQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=Byx-y9mGAAAA:8 a=E_qGvNHcwxqbOWWCvasA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: UZRi5NdUAuH8GWZE8kl1J7W4JzYerFcz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA2MSBTYWx0ZWRfX6pKaJPYk6pxK
 jIt/YY5rkw9KooFbzF8fwoI0jW8G+msAs+glwiJQDyEYnCdBtmC2u0nTvQdNp4F5HmtJOMMuyNn
 KVfL11GIqPhA3n32ziLf0bxfyGmSam+LXaZFja+T+JET9g8Ou9eMY+vOib58t3fdU2K4RhG08dU
 L+CjlOtfRh+k+FwzTz1f+pIsp7Gzvkr2iPDUoqa6lWeUxFzt+a1J62Ou6Qt5Nu2R0cqQqJzi54e
 8g02A4oqylYpzZ63VOf4K+Q3hGBn15j8DYp06DWMxJQT7XKq9Iri4NN10rGJmpgKtGq1K18I359
 OXpDRvIb31hau9+pFVN8i6sti1m52FCPNUI38o4BuKTEAVztShs281ldE1mF43HQCxjlC9bPDTQ
 cqD/4wBG1+ibTg5LTGfi7k7/Nivg9dmNOqmnXQDOu5rhNpJXaY36fLqOSsBCLznE/efL4vdqwbh
 suh8SBi+YPD8ie32f/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220061

Hi Jiale

Thanks for the patch.

On 10/21/26 10:15, Jiale Yao wrote:
> Several decoder callbacks continue into firmware commands after
> pm_runtime_resume_and_get() fails. The runtime resume callback can fail
> while enabling the VPU clocks, so those commands may access registers
> while the device is unavailable. The matching runtime PM puts can also
> be issued without a reference.
> 
> Check the remaining resume results. Propagate errors from callbacks that
> can return them, complete buffers or jobs from void callbacks, and avoid
> firmware access and unmatched puts on failure.
> 
> Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime suspend/resume")
> Fixes: cbb9c0d50e47 ("media: chips-media: wave5: Fix SError of kernel panic when closed")
> Fixes: a52e6f7923c1 ("media: chips-media: wave5: Resume device before setting EOS flag")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>   .../chips-media/wave5/wave5-vpu-dec.c         | 47 +++++++++++++++++--
>   1 file changed, 42 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index 86bc36ee17..320b40581b 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -829,7 +829,10 @@ static int wave5_vpu_dec_stop(struct vpu_instance *inst)
>   		 * accesses VPU registers via send_firmware_command(), so the
>   		 * device must be resumed first to avoid an asynchronous SError.
>   		 */
> -		pm_runtime_resume_and_get(inst->dev->dev);
> +		ret = pm_runtime_resume_and_get(inst->dev->dev);
> +		if (ret < 0)
> +			return ret;
> +
>   		ret = wave5_vpu_dec_set_eos_on_firmware(inst);
>   		pm_runtime_put_autosuspend(inst->dev->dev);
>   		if (ret)
> @@ -1392,7 +1395,11 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
>   	int ret = 0;
>   
>   	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
> -	pm_runtime_resume_and_get(inst->dev->dev);
> +	ret = pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0) {
> +		wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
> +		return ret;
> +	}
>   
>   	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
>   
> @@ -1556,9 +1563,28 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
>   	struct vpu_instance *inst = vb2_get_drv_priv(q);
>   	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
>   	unsigned long timeout;
> +	int ret;
>   
>   	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
> -	pm_runtime_resume_and_get(inst->dev->dev);
> +	ret = pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0) {
> +		if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +			struct vpu_src_buffer *vpu_buf;
> +
> +			inst->retry = false;
> +			inst->queuing_num = 0;
> +			while ((vpu_buf = inst_src_buf_remove(inst)) != NULL)
> +				;
> +			inst->eos = false;
> +		}
> +
> +		v4l2_m2m_update_stop_streaming_state(m2m_ctx, q);
> +		wave5_return_bufs(q, VB2_BUF_STATE_ERROR);
> +		inst->empty_queue = false;
> +		inst->sent_eos = false;
> +		return;
> +	}
> +
>   	inst->empty_queue = true;
>   
>   	timeout = jiffies + msecs_to_jiffies(VPU_DEC_STOP_TIMEOUT);
> @@ -1675,7 +1701,13 @@ static void wave5_vpu_dec_device_run(void *priv)
>   	bool cmd_issued = false;
>   
>   	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
> -	pm_runtime_resume_and_get(inst->dev->dev);
> +	ret = pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0) {
> +		dev_err(inst->dev->dev, "Failed to resume VPU: %d\n", ret);
> +		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> +		return;
> +	}
> +

Wouldn't this lead to an infinite loop in the m2m scheduler? looking 
around other drivers (rockchip and hantro) they handle this case with 
failing the buffers and then marking the job as finished. Similar to 
what you did in the encoder path. Maybe you can make a helper so both 
device runs can use?

Best,
Brandon

>   	if (!inst->retry) {
>   		ret = fill_ringbuffer(inst);
>   		if (ret < 0) {
> @@ -1818,7 +1850,11 @@ static void wave5_vpu_dec_job_abort(void *priv)
>   	 * device must be resumed first; otherwise the register access faults
>   	 * with an asynchronous SError.
>   	 */
> -	pm_runtime_resume_and_get(inst->dev->dev);
> +	ret = pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0) {
> +		dev_warn(inst->dev->dev, "Failed to resume VPU: %d\n", ret);
> +		goto finish_job;
> +	}
>   
>   	ret = wave5_vpu_dec_set_eos_on_firmware(inst);
>   	if (ret)
> @@ -1827,6 +1863,7 @@ static void wave5_vpu_dec_job_abort(void *priv)
>   
>   	pm_runtime_put_autosuspend(inst->dev->dev);
>   
> +finish_job:
>   	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>   }
>   

