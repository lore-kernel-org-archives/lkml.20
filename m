Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297621;
	b=vhjxNfoCK9CAw7KTYZppX3YugCr/Z1IkRZqXwyAl3UDEr8hX22Lfc1bMz5yWU/RmpIL/
	 mZEec+XKTJzaCmpXyws7y/wRTSvaA4jAuHl4JEGzr2RhvVHKMIxaFjyhbaMNUU1CzziYz
	 fWa3wnn/xBQtaRQu3ld3KK5Txbtdz/7JLcoyA2e3XR9nywGlJoFJ8U7I1bGW0I1X97zMX
	 UAZjIHMFNhbHDc5M67r+V1GqtDTWTDMTJ4sbHPZf5fHHPZAWnqJv2b207tG4xshMuwiMk
	 /jHgILV6iDeORHuSz1gY3+9wS5GEdBtHeumk7fyePZoMwJNIgwWaeK7kCi6PN6Z+qdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297621;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fvc9nFckQKuT/d7gFxqskhwOat92LoRtRjW+FxN9O5k=;
	b=JBR0TVVsa+Nc9RiYnh28Ycy7o4ps+ubPGXGzV62OBVj1ePp6JtfiA53pXfv4/OMgg0aK
	 QEsCr75oM2IPLGSGG6VId46Lncagpv/2H6vB9RE0s0siISKA7KWNNFBkk4BBdudYSy2oo
	 3n/KaYMu0uHPD8RMOG5JQ6OpNsdMFCVtwgrT+RxnJlTlDnkfZi0yoMZNCUavfz9A8hoMH
	 7oBymfyjRd6Bh71hxB7PHoej4p1el36n63d3VtRVy6l9Py1DeX/Lh89PKmMUJlChB2IjB
	 H94pKMD2XaPk6HI5nOe58hhFA4wR4CFQYp/KGYFEbxt+1lZOmnj1GlJAbAkOFTxjGAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=ZpIb2b08;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=dOXaTCJr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FDA60A260F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26FDA60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=ZpIb2b08;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=dOXaTCJr
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69TGDVcQ1079174;
	Thu, 29 Oct 2026 13:13:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=fvc9nFckQKuT/d7gFxqskhwOat92LoRtRjW+FxN9O
	5k=; b=ZpIb2b08WLpUCU/lJqweFJa2018wxVw6dqTQFoeAhpGPAz0Em015Kl0aM
	AxTrzvRcv+YcXInoVsZyShIS3j0qpZmxa/iotvNz5Py+VGxMqIRxum5NnZo9zFXc
	DxcGX1gmAYtKqDnG5uecYiSk51sKjptyMUgRtCOgvYXW/XphUiaiF4/pBdXIs3UW
	822GEBGe7+fovyYZdab4hKwwXAZ+Wrs8qdMP9jdRaZVxFhwk7XiegbilPNJTTBxU
	pd5VOHLfgtTXfUcUlfuMReMBRMT8Sv5tT7XSn4ibRlHY1BbLbDiqCMNiBlt5Oe1m
	IVSCOrzg+ilhdHtWMIOIpYB4bxeoQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010008.outbound.protection.outlook.com [40.93.198.8])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hkurvxaqe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:13:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLyhLN47P1jfPOtrDu2R4xLn4T6X5s2a8Fy5jYz8b/9DgvuV3kVqya8qqxwiHSIoLkjd8GVbRZ7pbMpmDdi3WEPf3CtQZvILNSiDWJ2a0+Ah1f4Jqwqi3XMEpE7WQ7WpsrXhKtA4E83bRlNSQ66MKuOESy+VwOQi4RZa3xIOjeKd3wQO8vq4z/AXoOyScHq6kOavLjCnFK6QhrVxgHkAXqQ6WhcLcloKAGJyK4FzH/bxHLwg3ezDFmPyLBEEmDGlXjOzWwUpvFPH+CTDKJHXUhwTOcf4fUM2zu9K7Rd2W3d8zvsnandU9RVmyH9KV4LqRffEz9RrtdIlyF++nWehUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvc9nFckQKuT/d7gFxqskhwOat92LoRtRjW+FxN9O5k=;
 b=zCKof+uolckHiZ9WSnOviW1fF7B34Ammdv0Htd3JP7jLlc282X2n9WP4uMAQm18ZnROQluiptt9ILbi5js7rvhdZFR9W4VKaFg8Io0X2+O8WL/c0R8dtwX/6a9TCRGVNA0DSLKpx+vMyA5ezccqCOj+f2kqMYa05PG2zHKa67u3YahHQyqZhliO8xH0WVw8V5Sy8eRlyOOh09Onfdh9XIyIW1XX6T34/zK/CNeiQHGhWpPesg0I5cBQ+bnsWZfUJ77m/urmRrLtbTQXm1tQq1wWhuFLVsfnK9bF3xLXbqHK23s8X/41zRtoCRZv07LmkEknZIu4ZbWme4EDlkknuKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvc9nFckQKuT/d7gFxqskhwOat92LoRtRjW+FxN9O5k=;
 b=dOXaTCJr2chXVKZfo/4x2ZFoeBMUToooV6GL2VlPKh8HvfUf+aSW4gxdcEIBsOXAINnXJBovPkEU/IMhqY8ez8z2OPBVs3UeJ/KRX8jLXXD9Syo/qtQ5dExDcf8LKCl4VMt9RrbwQEwi4mMX9T8qbWTBljvJrGpc2q05v4Rg5UU=
Received: from CY5P221CA0151.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:6a::24)
 by IA6PR10MB997563.namprd10.prod.outlook.com (2603:10b6:208:5e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 18:13:18 +0000
Received: from CY5PEPF00000E7B.namprd02.prod.outlook.com
 (2603:10b6:930:6a:cafe::a) by CY5P221CA0151.outlook.office365.com
 (2603:10b6:930:6a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Thu, 29
 Oct 2026 18:13:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY5PEPF00000E7B.mail.protection.outlook.com (10.167.247.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:13:17 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:59 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:12:59 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmMM3408718;
	Thu, 29 Oct 2026 13:12:56 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 22/22] firmware: ti: ti_sci_proc: Move processor ops into its own file
Date: Thu, 29 Oct 2026 23:41:47 +0530
Message-ID: <20261029181147.266771-23-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E7B:EE_|IA6PR10MB997563:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e826daa-d378-4693-47b2-08df35e84ecd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|261009223027099003|261026140227099003|261026121527099003|261028144727099003|10067099003|261022113327099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|18002099003|22082099003|6133799003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	ffP8rl7U33cmzheq5ZcDTijhYGS5M8IhhNUliKA21rI2NSph5y9D/lK9n+8MEhUkP62Df6IVjqFnCuBMnnZE7zIU5hhsn7QFBfOXRxmgF2qhNVSm20rUQQqbpAMkVX9Nyw9xwZ5QGyT6mx7ifOnf5XXZNyzHoYc/DLn8bcAA6VdVGi4t1hvNxcInmFGsw8AVhr8ma6Uk9o+UFK4slzFerUwMsfKm0LSPqehL64x0aaxhJeNicI31wtT0Ug/1u65hTKkntNuccAaKjN8sUxP1j0CAteP6qlEON2bD6jcTvEzfYsadiCaAvcqbYy3l+IR1dE6EsJiWxfzhsJy20HVVwH3Dffhp/+zJGzcUql5tVxIW6xrrweBxxKzkXstgzv6GAX/VudExBmGxtLxrWM2zxG878OEp4nVr3gEf2Vf/OxBZP4db+oWTzH+ZSDxbjxUCLnJlSbG974pdoXrZFlzmd/EvSFrzQo/9UICtWRnxpATRu5MuRYMo5loM5OVZPh7sevnUPiKmDW/7ZsXsyONYleC/HL49f2EHl+OvYF1WwecUaiM0xQs3nFWFNYJ6SJ0vlyKZElBb9GodJTCX3Y8cVuLSe2d9WM0z6ZRRzWc2TR/4b17tafHVlCzF4vyognl7CfFV64IJDyc01134LxOvMw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(18002099003)(22082099003)(6133799003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	J0rYXqMaiMzcY+7tScef/cHj6K+MwgPAxxNdUVYyE+5pNskadqQWeKTQn4QiunR6WFk1RpjMUhnZHpKhU3bkNo2jIWOwGzEHLAWciyfWlObfyorTvjnCxPUvvJTFOh/j6PC+6IMgN9JzsbNWRsNX3seYRN8bBNzftPbkjNn36KBmqMa+fX50LiIlzpzOWsr2JF9396fs3T0z74VW2Kkol1IlIQw4+tKgLEgGe7XENprVRoI64qwIb31UcGtvkfL65oWkQiUEx5pEIj8P34NUFgo70W0zCkLGQY5m21IefgiNM78ElaGy/S1dj3MKO0p30pLCgEgLfANPf2hgziQmeSZhJJhLlv/kLyyr4ys67pFfLhionEVvGKhov0bWMVqckSntsEp0rV/WIHInpydTwmVDfWT9SrqlUuEI/UlDG5IWyLSklArmEHFMW1PPKcY1
X-Exchange-RoutingPolicyChecked:
	BPOUxaKu8rBvoZWRG9vGg/7vTb2QXFbcFzONtMdx/fSMQfPxni5yfMk44d3rethvAbPjWGAaw2lhmJBex1GuxV7xZFW2x2wZXkczl+Qp9dnyIPn57hI8STMp3G6g58ZXt6UeZ0piFOs7YZgb1sAG1hC+1LJPpHliXiHeyfacnGg8Jmbbzr8hVPX74RXBflJcKNwgEk34/YGmLNRtXph8AQIjD/dvtzlo490mwbofIVqhe/6Ic5oxkbA5z7oPUOwOGDPNMq3eW/GqAxx++ydslEay3o4xYaR58tvje4dKlusXklx6Ko3Lnn0WHq2RP91sfWat5GEpdxzzptjBR0Ih8Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:13:17.9846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e826daa-d378-4693-47b2-08df35e84ecd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E7B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997563
X-Proofpoint-ORIG-GUID: 2E9e_T0FfDRON0xisyRzA5GJe9G3dVh1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX7D/08dw+RErR
 mqF7/OdeFMHgit3GEKFB5ZU4mPeMNoaVqY0qStnCdwMSv3IZjptoUYOAdo/KvUzun5TGIwNGh9/
 BmyKBeqrjmMahforeQPuvmeXbvJ4+eaHcQxF9pNxz0SOLhuVVvFBzOHunoJPJE7zZeob5dI3UA1
 7vLMkjD2yFJ0rJQeehaDa1JNcg7avb2J5cx/yNurADeY0IA+1X5F+G+C8uoMtNJ8xHgirE6re3D
 HaoZXudy3J96rQetreeXoMivfOi9SNCzhqABzMjaRfSnkdcWw+kZ15vabpdWy1rwfe3T2KlTmNg
 eNvrywQ645DD/+iNveovVR7nnBqvj8YW+1jh/8Kjhtk3ssddLSejCp81HUlsX4qoTEAK4Fx9aNe
 AgjXQTqZ1NjyZ5kMoL2NZHnh754qo5ueiKGSvVr1hhQ7SUHGPHsQYJFRC7uJ1BFk2hr+K1pqvHd
 UkaQ/1cRIlCQaUlHhlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX0IF5RufLFKky
 2g9qPBikw89iA5j9Xb5rkjNi1GSdX5cn40ImOXYupK/+/pDrD4bdXhwqBjkpPUp2K9OZq/mBqSD
 0nZPIA0FQwqCvK75D7yKrekPiE0sQ68=
X-Proofpoint-GUID: 2E9e_T0FfDRON0xisyRzA5GJe9G3dVh1
X-Authority-Analysis: v=2.4 cv=DtrDa2/+ c=1 sm=1 tr=0 ts=6ae38cc2 cx=c_pps
 a=ugQZG2M6WJJQC2vHgpB33g==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=DwFzR0z2sfOMQUobDtkA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290071

Extract the processor operations related functions and services from
ti_sci_core.c into its own file. This breaks down the single large
file into smaller logical files for better readability and maintenance.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. None to this patch.

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-23-b-padhi@ti.com/

v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-23-b-padhi@ti.com/

 drivers/firmware/ti/Makefile      |   1 +
 drivers/firmware/ti/ti_sci.h      |   1 +
 drivers/firmware/ti/ti_sci_core.c | 197 +--------------------------
 drivers/firmware/ti/ti_sci_proc.c | 214 ++++++++++++++++++++++++++++++
 4 files changed, 217 insertions(+), 196 deletions(-)
 create mode 100644 drivers/firmware/ti/ti_sci_proc.c

diff --git a/drivers/firmware/ti/Makefile b/drivers/firmware/ti/Makefile
index 7d9c2a73bf5a6..8a32cb65b6fa5 100644
--- a/drivers/firmware/ti/Makefile
+++ b/drivers/firmware/ti/Makefile
@@ -4,5 +4,6 @@ ti_sci-y			:= ti_sci_core.o
 ti_sci-y			+= ti_sci_clock.o
 ti_sci-y			+= ti_sci_device.o
 ti_sci-y			+= ti_sci_pm.o
+ti_sci-y			+= ti_sci_proc.o
 ti_sci-y			+= ti_sci_rm.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
index e8d6589eec0e9..8f9f0b1aa767d 100644
--- a/drivers/firmware/ti/ti_sci.h
+++ b/drivers/firmware/ti/ti_sci.h
@@ -1687,5 +1687,6 @@ int ti_sci_manage_irq(const struct ti_sci_handle *handle, u32 valid_params,
 		      u16 src_id, u16 src_index, u16 dst_id, u16 dst_host_irq,
 		      u16 ia_id, u16 vint, u16 global_event, u8 vint_status_bit,
 		      u8 s_host, u16 type);
+void ti_sci_setup_proc_ops(struct ti_sci_proc_ops *pops);
 
 #endif /* __TI_SCI_H */
diff --git a/drivers/firmware/ti/ti_sci_core.c b/drivers/firmware/ti/ti_sci_core.c
index b1345e06341db..1f7484b118375 100644
--- a/drivers/firmware/ti/ti_sci_core.c
+++ b/drivers/firmware/ti/ti_sci_core.c
@@ -620,195 +620,6 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 	return 0;
 }
 
-/**
- * ti_sci_cmd_proc_request() - Command to request a physical processor control
- * @handle:	Pointer to TI SCI handle
- * @proc_id:	Processor ID this request is for
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
-				   u8 proc_id)
-{
-	struct ti_sci_msg_req_proc_request req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.processor_id = proc_id;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_REQUEST,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_proc_release() - Command to release a physical processor control
- * @handle:	Pointer to TI SCI handle
- * @proc_id:	Processor ID this request is for
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
-				   u8 proc_id)
-{
-	struct ti_sci_msg_req_proc_release req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.processor_id = proc_id;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_RELEASE,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_proc_handover() - Command to handover a physical processor
- *				control to a host in the processor's access
- *				control list.
- * @handle:	Pointer to TI SCI handle
- * @proc_id:	Processor ID this request is for
- * @host_id:	Host ID to get the control of the processor
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
-				    u8 proc_id, u8 host_id)
-{
-	struct ti_sci_msg_req_proc_handover req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.processor_id = proc_id;
-	req.host_id = host_id;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_HANDOVER,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_proc_set_config() - Command to set the processor boot
- *				    configuration flags
- * @handle:		Pointer to TI SCI handle
- * @proc_id:		Processor ID this request is for
- * @bootvector:		Processor Boot vector (start address)
- * @config_flags_set:	Configuration flags to be set
- * @config_flags_clear:	Configuration flags to be cleared.
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
-				      u8 proc_id, u64 bootvector,
-				      u32 config_flags_set,
-				      u32 config_flags_clear)
-{
-	struct ti_sci_msg_req_set_config req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.processor_id = proc_id;
-	req.bootvector_low = bootvector & TI_SCI_ADDR_LOW_MASK;
-	req.bootvector_high = (bootvector & TI_SCI_ADDR_HIGH_MASK) >>
-				TI_SCI_ADDR_HIGH_SHIFT;
-	req.config_flags_set = config_flags_set;
-	req.config_flags_clear = config_flags_clear;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CONFIG,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_proc_set_control() - Command to set the processor boot
- *				     control flags
- * @handle:			Pointer to TI SCI handle
- * @proc_id:			Processor ID this request is for
- * @control_flags_set:		Control flags to be set
- * @control_flags_clear:	Control flags to be cleared
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
-				       u8 proc_id, u32 control_flags_set,
-				       u32 control_flags_clear)
-{
-	struct ti_sci_msg_req_set_ctrl req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.processor_id = proc_id;
-	req.control_flags_set = control_flags_set;
-	req.control_flags_clear = control_flags_clear;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CTRL,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_proc_get_status() - Command to get the processor boot status
- * @handle:	Pointer to TI SCI handle
- * @proc_id:	Processor ID this request is for
- * @bv:		Processor Boot vector (start address)
- * @cfg_flags:	Processor specific configuration flags
- * @ctrl_flags:	Processor specific control flags
- * @sts_flags:	Processor specific status flags
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
-				      u8 proc_id, u64 *bv, u32 *cfg_flags,
-				      u32 *ctrl_flags, u32 *sts_flags)
-{
-	struct ti_sci_msg_resp_get_status resp;
-	struct ti_sci_msg_req_get_status req;
-	int ret = 0;
-
-	req.processor_id = proc_id;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_STATUS,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	*bv = (resp.bootvector_low & TI_SCI_ADDR_LOW_MASK) |
-	      (((u64)resp.bootvector_high << TI_SCI_ADDR_HIGH_SHIFT) &
-	       TI_SCI_ADDR_HIGH_MASK);
-	*cfg_flags = resp.config_flags;
-	*ctrl_flags = resp.control_flags;
-	*sts_flags = resp.status_flags;
-
-	return 0;
-}
-
 /*
  * ti_sci_setup_ops() - Setup the operations structures
  * @info:	pointer to TISCI pointer
@@ -839,13 +650,7 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
 	ti_sci_setup_rm_ringacc_ops(rops);
 	ti_sci_setup_rm_psil_ops(psilops);
 	ti_sci_setup_rm_udmap_ops(udmap_ops);
-
-	pops->request = ti_sci_cmd_proc_request;
-	pops->release = ti_sci_cmd_proc_release;
-	pops->handover = ti_sci_cmd_proc_handover;
-	pops->set_config = ti_sci_cmd_proc_set_config;
-	pops->set_control = ti_sci_cmd_proc_set_control;
-	pops->get_status = ti_sci_cmd_proc_get_status;
+	ti_sci_setup_proc_ops(pops);
 }
 
 /**
diff --git a/drivers/firmware/ti/ti_sci_proc.c b/drivers/firmware/ti/ti_sci_proc.c
new file mode 100644
index 0000000000000..6c0430f7b444a
--- /dev/null
+++ b/drivers/firmware/ti/ti_sci_proc.c
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Texas Instruments System Control Interface Protocol Driver
+ *
+ * Copyright (C) 2015-2026 Texas Instruments Incorporated - https://www.ti.com/
+ *	Nishanth Menon
+ */
+
+#include <linux/soc/ti/ti_sci_protocol.h>
+
+#include "ti_sci.h"
+
+/**
+ * ti_sci_cmd_proc_request() - Command to request a physical processor control
+ * @handle:	Pointer to TI SCI handle
+ * @proc_id:	Processor ID this request is for
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
+				   u8 proc_id)
+{
+	struct ti_sci_msg_req_proc_request req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.processor_id = proc_id;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_REQUEST,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_proc_release() - Command to release a physical processor control
+ * @handle:	Pointer to TI SCI handle
+ * @proc_id:	Processor ID this request is for
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
+				   u8 proc_id)
+{
+	struct ti_sci_msg_req_proc_release req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.processor_id = proc_id;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_RELEASE,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_proc_handover() - Command to handover a physical processor
+ *				control to a host in the processor's access
+ *				control list.
+ * @handle:	Pointer to TI SCI handle
+ * @proc_id:	Processor ID this request is for
+ * @host_id:	Host ID to get the control of the processor
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
+				    u8 proc_id, u8 host_id)
+{
+	struct ti_sci_msg_req_proc_handover req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.processor_id = proc_id;
+	req.host_id = host_id;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_HANDOVER,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_proc_set_config() - Command to set the processor boot
+ *				    configuration flags
+ * @handle:		Pointer to TI SCI handle
+ * @proc_id:		Processor ID this request is for
+ * @bootvector:		Processor Boot vector (start address)
+ * @config_flags_set:	Configuration flags to be set
+ * @config_flags_clear:	Configuration flags to be cleared.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
+				      u8 proc_id, u64 bootvector,
+				      u32 config_flags_set,
+				      u32 config_flags_clear)
+{
+	struct ti_sci_msg_req_set_config req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.processor_id = proc_id;
+	req.bootvector_low = bootvector & TI_SCI_ADDR_LOW_MASK;
+	req.bootvector_high = (bootvector & TI_SCI_ADDR_HIGH_MASK) >>
+				TI_SCI_ADDR_HIGH_SHIFT;
+	req.config_flags_set = config_flags_set;
+	req.config_flags_clear = config_flags_clear;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CONFIG,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_proc_set_control() - Command to set the processor boot
+ *				     control flags
+ * @handle:			Pointer to TI SCI handle
+ * @proc_id:			Processor ID this request is for
+ * @control_flags_set:		Control flags to be set
+ * @control_flags_clear:	Control flags to be cleared
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
+				       u8 proc_id, u32 control_flags_set,
+				       u32 control_flags_clear)
+{
+	struct ti_sci_msg_req_set_ctrl req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.processor_id = proc_id;
+	req.control_flags_set = control_flags_set;
+	req.control_flags_clear = control_flags_clear;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CTRL,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_proc_get_status() - Command to get the processor boot status
+ * @handle:	Pointer to TI SCI handle
+ * @proc_id:	Processor ID this request is for
+ * @bv:		Processor Boot vector (start address)
+ * @cfg_flags:	Processor specific configuration flags
+ * @ctrl_flags:	Processor specific control flags
+ * @sts_flags:	Processor specific status flags
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
+				      u8 proc_id, u64 *bv, u32 *cfg_flags,
+				      u32 *ctrl_flags, u32 *sts_flags)
+{
+	struct ti_sci_msg_resp_get_status resp;
+	struct ti_sci_msg_req_get_status req;
+	int ret = 0;
+
+	req.processor_id = proc_id;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_STATUS,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	*bv = (resp.bootvector_low & TI_SCI_ADDR_LOW_MASK) |
+	      (((u64)resp.bootvector_high << TI_SCI_ADDR_HIGH_SHIFT) &
+	       TI_SCI_ADDR_HIGH_MASK);
+	*cfg_flags = resp.config_flags;
+	*ctrl_flags = resp.control_flags;
+	*sts_flags = resp.status_flags;
+
+	return 0;
+}
+
+/*
+ * ti_sci_setup_proc_ops() - Setup the processor operations structures
+ * @pops:	pointer to TISCI processor ops structure
+ */
+void ti_sci_setup_proc_ops(struct ti_sci_proc_ops *pops)
+{
+	pops->request = ti_sci_cmd_proc_request;
+	pops->release = ti_sci_cmd_proc_release;
+	pops->handover = ti_sci_cmd_proc_handover;
+	pops->set_config = ti_sci_cmd_proc_set_config;
+	pops->set_control = ti_sci_cmd_proc_set_control;
+	pops->get_status = ti_sci_cmd_proc_get_status;
+}
-- 
2.34.1

