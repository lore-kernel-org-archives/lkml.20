Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792437007;
	b=4DXHL2519V6Iul7MY7jALs2Wk3/wCwSoVJP/Kx+mclO85e/5cqSE4Mp7UcSB7xDV+DNL
	 qPmojrUZo8eqg58HFTU1UILaxq2oQTej/0+VXkk83wBDq+xAz9eQscHZqzTKuLPjCLFSR
	 aSS3x7OImtexSUKrTHmXIbUoP5ry3pY3FLnjudaa7OzxyH2RcMHiPDdGdvqwCV6oWmjgE
	 RhA44fA2DFo2X/1A+feNOQ4L0Z+XysX0YJ0khYlkKrfxnsBfe1oUtxyCHulb16PFbFJzg
	 OONZYOZJMObqyzH4S3DMv4rp7OaZZva6wL6u+4HMqbyRw5mE/g3uRCarZMkw+iav1vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6470PVaJU3ktw7c2vsZ7EbxiF6c1BPCKPP6Y5+8T0m8=;
	b=2WZcOQvXuLwtxsnT+PkQ1+7IP8cV9gAL2+reURAWIrPN/oUoqnBD0DHCHBqnhXB4bzZT
	 o8PfuY50ZNh9AvBNaC922Jab5si6IrS+UzIRM1CuIymUGN53gY86inEvoHVsFSWeDiPsJ
	 RlQIkvCYtrigf0lq5g8tBDD8Q+da4ySWkk7OvlIQBPe0pmQPU4yKeVfBhZ0ArNTdtfuNp
	 eudcFFECWACRunH9di/1L1EO9oGO8v9rDPFMKEp0VMuV0t0tCRybbb0o3Tik2tczLWKri
	 KOGKMIx1cgIVfyjNhh5Y48AZSD0VHayzy9ofg1QWUHpO1nSwrFeRxTkYpi4RPmxwZ/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=XWUkUFp7;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b="ZOWvEb/9";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDA0606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BDA0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=XWUkUFp7;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=ZOWvEb/9
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69JJ3awI859493;
	Mon, 19 Oct 2026 14:09:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=6470PVaJU3ktw7c
	2vsZ7EbxiF6c1BPCKPP6Y5+8T0m8=; b=XWUkUFp73BwJ64DIou+YfLQYIGb8XrS
	jcZFYy75h2IgDeYXiW1mfA/FVzxyqOik1p2YgM37Wcq4IQZfDp1Anvxb6C7z73Eh
	gntAnO/g7rvsrUhbEGkWWEpmeo/8z7QrUr02yEsNcw4+co1EmcF1W/UcJFQjq75h
	uJnba0w4miAAXq2QIFq2uVBkNdklP0O1N0lzewTVpEJuDn4a05uJraQae/K/LxXU
	jxo9isN/sRdmcRKBLAFzsnlBLKL3mu4SsZYtMl8HRw+IKFAsAdmOMJPuvMZ/5Ofd
	9/IZqeHx5NeBKVESmHsiX625PAUznIIIx5b3PJpLK5AThe2YCD6gvDg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010014.outbound.protection.outlook.com [52.101.201.14])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hct1jr7mn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 14:09:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqIi9RAxk+8vWSP5b0yKvzuYHgnYQOWhdz5u+5XsUB2oMm00J4Vh4d5kY0MriNLY7t1s2F0fVx/NxYGYm0UwRRhuq0+4HhMg/Kp1xv26i0JOpMirvjt+clHOwjLSwbgBH7yJHLUbaergZbIcTapQFClfFjNmUMPoi9C57CicDx71v2ZtxhbVhphxAKIjpex3ghS5OrmHsDrDLCyOeR9mmjc3zHBri5KugLefGZPJWvzENbQPf2xAS+ZhxkrNy/2/nZLMjHLc59FoQnNpkT7qNKRAjCZoSFRgaZH0WiXjcB7LF8/wZfQ2HmtY1QB1ixvsjKJgxdhxxSvHHVS/wDRXnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6470PVaJU3ktw7c2vsZ7EbxiF6c1BPCKPP6Y5+8T0m8=;
 b=DrfbQCyxswKnjfDNWr1vK3nTZ00NaHOAFfg6nNIDxNK2M+fVNXo6QRj3mNMwFotRZ21ywjem1pxAy4CqVBIBtv4OV1v5CHDEzI7ReWEJNw+KPsd3ZGBC0Z3Mbpywp6rO4FDtzR0CjNLhGzudv+WBQHyqpfnbmWQpvWTSy9F9nPpVPB7JITSuZx3aZ/nEyjUpEd92zjfP5n7VzGf6yqlJZrQt2qL8Ds2wWUJBVdl2tbRjQC27fcf2qmNARXU76x/moQ6U+hw3Q/JMN47+JcYSU1dRokWDGYuaQAWReFeHfS6I9xGV3ZarHKKtGspQXiLHrKYsPyG2tBAUZDAzlcqokA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=toradex.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6470PVaJU3ktw7c2vsZ7EbxiF6c1BPCKPP6Y5+8T0m8=;
 b=ZOWvEb/99cu8h2CNjIXqMpNEw1stNLf2/stPQMus1HIur0JD9qFwxUvQU6g2Drgz/MGq8nNG7mayYXe+VDRrbv5MI9zlZTfGV0NWVOhyv8xDuq4OX0HFmTdA+VLzzDrfmJU7SOkwmm/UnW5LtJwGRCuCA3tPILTxuHSPPITT8pw=
Received: from PH8P221CA0031.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::7)
 by DS4PPFB6B52B4A1.namprd10.prod.outlook.com (2603:10b6:f:fc00::d43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 19:09:44 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:510:346:cafe::5) by PH8P221CA0031.outlook.office365.com
 (2603:10b6:510:346::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Mon, 19
 Oct 2026 19:09:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 19:09:43 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 14:09:30 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 14:09:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 14:09:30 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69JJ9UOj3390494;
	Mon, 19 Oct 2026 14:09:30 -0500
Date: Mon, 19 Oct 2026 14:09:30 -0500
From: Nishanth Menon <nm@ti.com>
To: Francesco Dolcini <francesco@dolcini.it>
CC: Frank Li <Frank.Li@nxp.com>, <imx@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        <linux-kernel@vger.kernel.org>, <linux-bsp@toradex.com>
Subject: Re: [PATCH] MAINTAINERS: Add entry for Toradex boards
Message-ID: <20261019190930.eqev72zc7pkzrc26@mummy>
References: <20261009064705.10116-1-francesco@dolcini.it>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261009064705.10116-1-francesco@dolcini.it>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|DS4PPFB6B52B4A1:EE_
X-MS-Office365-Filtering-Correlation-Id: 6df1180e-87fd-4c0b-fc98-08df2e1488da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|261009223027099003|10067099003|56012099006|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	h5/UQNgmt6Rqt2enImUQOWH6jf7+k+RXhqITu4zWqTmneTe897zYdj9mEJ/L1swtPdv0Fo74cIL2hR9FJCa8twAu3unlGE5z7iKJA7C9qt/jezCpqYm6dmyhHbP0HMdX3TLWtMfZ6dqccbonA12bMKBje/iwIUd5wtHcvBJyP12wqtpSzHd2j3TDndTM4h60ELhcuvRiMZEguyGkHjLlLt+WNAlNfGwriZVwlTEzrA1To2aYtPZc6bYSi4/rQsmgR1TPMfqNJCBc2/iE4YUnDbKefuPYL6XsDmCXtbdmPfo1lcsfv1zWpuVLliMZ1Op75CLk6HtyQ4FL5uxHQXA7I0pYBhn0AVGqh19gfR1Pa7Z42ALr9lhfj2APz34GakkCfeml8HSFSpb4vgGAwkRhZQ2i/vM9+hpXZb4jzxdk8cUV3Si3iwD3IsMxqxPmCSf2OkIvMp7SeEYLjzCNR+d/5iL5kWyjET616+1xYUCu1qrAbRtEdZOhY6f2caeMkK41ms5/dHSl8nPX2LLAJDoTshFM4xd96BZ1O5SXUH2ecWfGT+JiDK/9xgOJBCs+P/V+WCUlDEQ3R/P6rlsgFTSBVC25065yf794Hw3rOKlqvqlALNPmMOowOfogQuZxb0VUzVNUk9Q4Oq/kiIuyrKvy9GRvhLnciCCZeFOH2AvzNR2DEguesiP7FAL2HZ2HkWg8gV2BtQZRsLDylPAfVsqY3w==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eFO/0PQjUFbXfS/92URTSCmwU94+itVoHcCxUnycaRXrUVCiC4nvqG9Y6wWqXYYAPA/+aPxNJFQIrEIQ+oQNONGXC0WbqMJB4AoqdUGkzklKcMTvHozMGap+KYudAChgosZ64FqKfQ6P7k+6KiqUxq95eoPSPwIJ7K66rdac2qqOKoYiLmJdYikZcnIWsQSJP2DCI3Y3FP4nrLimp5KA+npHaMWD4JT7a0qHMNPQ6O2LFcSCRM7TPnRVphUvMkGFj0msHA1Bmd2NYDH6uAHq88Ya2UyPGmr1xq030P2m3x7FgfNkMNFgX/nOJWs2p4+j+LY9acN7swmjpM0eKNd3tW3PjNjOfCqH449byr5SFqhBxDHmyFfUt01jV/6fRti0yydgVDes+wYI2hRn4ICK5PTHvzDbGKj2JduTv/Ge9qn0Ww7MAGkr9MpLCpvfRAaE
X-Exchange-RoutingPolicyChecked:
	q/TyjvimlVBRfWPef60nt4uHgmtRD1EG5svJQSkSH2R/DGiGPViruASP0GeNGGYbGxOJVTTaYk6wArKVxHyWjdDivb3/n9JGpn+PV5oOQj8YLZUFDkYahkd6UMNrY6insNtJGYd0g0ae8yNSD2ZgySzaJMSFXrDTTXxBHM31f+L8ZGq6q/sd+NZWG9Xe1x4rt4muQic11FA8cVHDnk6WppvJkw9Z2/o6pZoyYbCzO6q30cETfpIerSNiJZmJrlibUmwxdt2EGbzVc89bpCtM06XrL8TXPloyK1D7s9u6GN4g9g60yPpSKK0oHpzq7SwegbOUe7G+GPM8xbcp+rEc9g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 19:09:43.9378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df1180e-87fd-4c0b-fc98-08df2e1488da
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFB6B52B4A1
X-Proofpoint-ORIG-GUID: Ryo3RT4kRRA4CdnlrJz9WRb5DsNLZ41g
X-Authority-Analysis: v=2.4 cv=ZN9CCn7b c=1 sm=1 tr=0 ts=6ad66afe cx=c_pps
 a=n3jZDpZxtfjojidyQ1a5Gg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=m8ToADvmAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=12pGLBjBETO59SXaPX8A:9
 a=CjuIK1q_8ugA:10 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA3NSBTYWx0ZWRfX3evvCa8rfqak
 +3XBQGBdbj0M+uaJr1LrXHz44+pmwajgdCDd/m+Br+FwK406zlNjFNxIpsCzeHgCXoZPPfsHqd+
 4JJ7zwhVkYDT/5VwFVqIKCm3SeeH4BfOwu0RMg0dgryGTSsXPm90Fv07THJFiJ11urUcs4JBKqI
 CoYqX17P7qsft7CyCXxhS3UI+F4QpmwrUowyFeAN7JHQ7IAa29F6DnlQ4Etp0VXQoJeMsE3hpgR
 vJqFj3X2myNltVK7E8xCnnP+GPu1LfPr57/6ggNpK92dWI8iQRTnUsqSEG4Z0mQNBXKzov8guGm
 ubaSSYeC4shlwGQ2rjDne9QFGvFOZvwL4DNbUO1uNA5cYwiVrLO8j70zhB059yAFvDs34V/TueV
 SpKV2/v2ASGx8y9nv/aZN9wIi/Fomv00eMvAH4ezDY37xKfJiHAN4IzsUawcxQhiZGOFQyJZ01u
 2cGYCiAQQrOsRyCeOOw==
X-Proofpoint-GUID: Ryo3RT4kRRA4CdnlrJz9WRb5DsNLZ41g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA3NSBTYWx0ZWRfXzZTYn1VRbkXu
 YkIggioC+3IOLCMvsbsidEVzQuZK0PjW0H8u/0JI6tupIhiMkYoff6yN5oQE/iDavi003wG6aFM
 jtE0mZwoM7IaXmEEIS9MTiUjTchw7Zc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190075

On 08:47-20261009, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add a MAINTAINERS entry for Toradex board device trees to ensure
> that we are included in patch discussions and can provide reviews
> and feedback on proposed changes.
> 
> Toradex has been developing and supporting its System on Modules and
> carrier boards for many years, including their Linux mainline support.
> 
> As the hardware vendor, Toradex has access to schematics, bills of
> materials and other internal hardware documentation, allowing to
> review and validate changes against the actual hardware.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> Frank, Nishanth, Vignesh: up to you to decide who is picking up this

Reviewed-by: Nishanth Menon <nm@ti.com>


Frank, if you like to take it via your tree, I have no objections.

> ---
>  MAINTAINERS | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 483415e46217..fcc2e429bcd7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28088,6 +28088,21 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/topstar-laptop.c
>  
> +TORADEX BOARD SUPPORT
> +M:	Francesco Dolcini <francesco.dolcini@toradex.com>
> +L:	linux-bsp@toradex.com
> +S:	Supported
> +F:	arch/arm/boot/dts/nxp/imx/imx*-apalis*
> +F:	arch/arm/boot/dts/nxp/imx/imx*-colibri*
> +F:	arch/arm64/boot/dts/freescale/imx*-apalis*
> +F:	arch/arm64/boot/dts/freescale/imx*-aquila*
> +F:	arch/arm64/boot/dts/freescale/imx*-colibri*
> +F:	arch/arm64/boot/dts/freescale/imx*-lino*
> +F:	arch/arm64/boot/dts/freescale/imx*-toradex-*
> +F:	arch/arm64/boot/dts/freescale/imx*-verdin*
> +F:	arch/arm64/boot/dts/ti/k3-*-aquila*
> +F:	arch/arm64/boot/dts/ti/k3-*-verdin*
> +
>  TORADEX EMBEDDED CONTROLLER DRIVER
>  M:	Emanuele Ghidoli <ghidoliemanuele@gmail.com>
>  M:	Francesco Dolcini <francesco@dolcini.it>
> -- 
> 2.47.3
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
