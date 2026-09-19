Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DED366575;
	Sat, 19 Sep 2026 19:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789844600; cv=fail; b=kxMBZGrQLNnFXCnJ3iZ+t1qCYZjGhj5PnxtJJSFrPCZqRGIw5meyBIN/UoHoWSCWXa/E1ujs4j7SYx2iSHAS55xzfIXEu/I08hKP1/aN5vvMpKlRYU0esY/vRBCM+UiFmOO/hTPShs/g+noEwkcAHwTYhLsMuswkth/UzBT/GCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789844600; c=relaxed/simple;
	bh=erCFrFr0ENf5l/4FrpTMjhVVr1U7bqQgwiA7RrqIaCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SgJ71X+LsoDe+0e/UHnH83mqlkWp2pYfQKHpqZT2DDTG1PbXX0CrWO6NghMsEv2KnxoKxawBSiVR4d6ABH3XGM72WiBuMpLYL8a81tMLjoLMgREDB16YzBQEKxj2ZNTXDACIJ5UQUf8B1ObV490CsNbi3yNZ7dxtKoVGRIx0drM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=elvH56Gn; dkim=fail (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YTzrk5d8 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="elvH56Gn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YTzrk5d8"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68JGKbZA3436177;
	Sat, 19 Sep 2026 14:03:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=HHXuibudIhOyYD4IOba6/8j/CW+uKmDS3VIuA3CPP
	hY=; b=elvH56GnUeZB2K7WGWcjlcTtDpC5cS5hbJwSXwgaDj1DWMw+Dr3FOp18N
	LGbM+N6Yw6ISyybc/4uIK7AK4TdImU2bdBfQ2OTFhBsOr0r354b9XGrFF+d6/MjD
	K5zajaOKlDeFvWpW9ofnYni1a1nEPcso4lYt3DJX7cmUPDrB8RQRxTgLpI8b5ZJG
	ihWybOh8Cb4dUhbNG7KeGRht+vgjdafZrC5X7JDHVAQfaPqiJpM2bsGaPkXGwSes
	cB+l8hGrR4p1jVNy9CmOvY8SHN7r3j/2sMZMQwRpB89zv89NxtzbcZG1PLVD8n4c
	kj5AXPqNibByfllO8z6MajT3rQKFQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010000.outbound.protection.outlook.com [52.101.46.0])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gssbu1cmd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 19 Sep 2026 14:03:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GdCEGKlZTnzx+0/Efc9sbDSqG/wz1Bo1xhuh6Z2TWjiownvGturZ+oT4REa8DIRLxcSGvq7Q3nP2XEOrjEhvQyj+09fs2UPyR7KroWJgmVKcSemfKQ7aSkL/hGOQxWf9llaimm9lRtlegtKU+hq+fMzyV81H/EZrky/6f+2MO0m3AsLN5cC/JwOej3aE2trzJPzphtTcmcog+y6mpmFkddqIDOm5LqU5Ozi8bhk6FIqZQ7hT+vV7shOPzqKZX+MKT8zE5B72jYoKFfT4EQCxSLwON6QLPfZ7emF19GeETc8R8e4X0Jq7JU18nqjN5YzaTkvC0P8xbFdHu+Jp2q6t4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBGb8NTjkJ2RaXXZQs+sQWXSIJoF0kMsyRdt8+hk6Jo=;
 b=kyX4UCKjf+nXH2RgkpVmTp0iFxAfgnGGxYFTNOFbZjsbtMWmCp9+K4jSVu1BHUE8Vl8dUeHI0wTZ/J8ZfigllO5oxdjvN7iXsqd4UzpdLWXkfMw9OnK+RP9qsS0yc8UxWAmtk7G3JPC+oKGrtFpFQHhDw+TIYyZ0OZtuGYTue2UalG81zr0jCZeoqBNz9LdQdbDT58sC5j17tZJOECLrKb6M2G+lFySnWoxXjxpS5F8AyvGk9WksG07EqfcvROVnkgYQmL8/ChwVcMslDbH7uf/+RIQj9OsUKoWEtnEMiYue+dPTL6ZDi9Ylje3gCgI6JpVF4/g0ioMBGrXHKHHTcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBGb8NTjkJ2RaXXZQs+sQWXSIJoF0kMsyRdt8+hk6Jo=;
 b=YTzrk5d8f273f55FxnDg5Brt/bC4eCrL9mOOA6dWs7/A+ONlsmPu5XbpffyZfwvKh0TUWWkiH85jv8k7i5Gxor4DH9DLca19k5wKSRxMp6UyYF2Pz/WPDUfxG02pwqe0Hx4pmmfrL27z6jiajliiAv3++eh3xxf2/XypuKfuCNM=
Received: from SJ0PR03CA0085.namprd03.prod.outlook.com (2603:10b6:a03:331::30)
 by DS4PPFD91C619EF.namprd10.prod.outlook.com (2603:10b6:f:fc00::d4e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Sat, 19 Sep
 2026 19:02:57 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:a03:331:cafe::5f) by SJ0PR03CA0085.outlook.office365.com
 (2603:10b6:a03:331::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.14 via Frontend Transport; Sat,
 19 Sep 2026 19:02:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sat, 19 Sep 2026 19:02:56 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 19 Sep
 2026 14:02:19 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 19 Sep
 2026 14:02:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sat, 19 Sep 2026 14:02:19 -0500
Received: from [10.249.128.199] ([10.249.128.199])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68JJ2FNG3075981;
	Sat, 19 Sep 2026 14:02:16 -0500
Message-ID: <c62bae97-180d-4496-8539-e6b7899beeec@ti.com>
Date: Sun, 20 Sep 2026 00:32:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: Re: Re: Re: Re: [PATCH 1/2] dt-bindings: mux-controller: ti: add
 binding for event mux router
To: Peter Rosin <peda@lysator.liu.se>
CC: Conor <mail@conchuod.ie>, Conor Dooley <conor@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <vigneshr@ti.com>
References: <20260828100615.1700223-1-r-sharma3@ti.com>
 <20260828100615.1700223-2-r-sharma3@ti.com>
 <20260828-goes-scrawny-a5cf40c9514d@spud>
 <bacf61ea-91b1-454c-97aa-8c6e4ca07b16@ti.com>
 <20260915-shredder-liver-219bbc18dd18@spud>
 <62194a7f-5b7e-419a-8235-9eb46f2f2e7d@ti.com>
 <8724E360-7B38-48E2-8A5D-9BBAA69EAD06@conchuod.ie>
 <1cd03e37-a9bb-4c21-b8f6-557a1fcacc5b@ti.com> <aq4l-dCW_dqvisj_@gryt>
Content-Language: en-US
From: "Sharma, Rahul" <r-sharma3@ti.com>
In-Reply-To: <aq4l-dCW_dqvisj_@gryt>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|DS4PPFD91C619EF:EE_
X-MS-Office365-Filtering-Correlation-Id: add8fd47-c332-489e-5569-08df16809d83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|4143699003|56012099006|10067099003|22082099003|9063799003|18002099003|6133799003|3023799007|4133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	Wnah0HPntq6VeNjzz/ZRSleDOrFDFBzBhyn+d35E3VFIIX/ODousWLVOljwY8GFfi/b/oqZnd4wv3pad6bZTr6a/9a+svwXage+xwLjLlJ3zl4RD+4fffnrrWc3Sdjsw7EJdQryWG8sHEaJh1zsd0Bms+REsZKiWWne+yvIw3uOZtEofFhfC6v5XVBZHyNcJpCGIGKg+wpCKU6R86/Jvag4TgTpCMpeCLDBHy5hlE655gR79D/KMCeeBk89rivgpRGssH0gQ86rktLZfqws/0M4VuqIZoDJMOcVvzMo3o56ahPhOdwMTloYhZapDFRdWw10KLh1TnH3gUL8MwRDE89U7lcs2blNYpARFpzsZ2Cn5qtdsL0W8I0lWIbOs3AA7zeFcTAD0ECrRWl8uIkmvQuY7bOWkiW84SrDT29Z3jflHjONlQx8y6DES8V9cbK4dKmgcBiRZCwL2vVDin1oDTxvvKuAVo3tO+wwK0s2JEB6f4Yd0+0ZqWiTy/5D6wMPVVY/QQs5C+3njMtcfbQIwpK+T+wjtH5NBWDHdakWk9G04S91bSGjAJ8SHCilQLQw+mG4neySFhfx6zaytX7BvRfRya3nesJb3OlilvDxiC/Jb09zJdKt2xSqCF+DPW7BEWHzyVv5GsIjv6osAk5MK/g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(4143699003)(56012099006)(10067099003)(22082099003)(9063799003)(18002099003)(6133799003)(3023799007)(4133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	20GfDPbRnEodnHftYpShUsMKHQPYdSN9DyPA9fwtvU9kYDrQAhiuBIGeX5tv4wL7POblAtkCajObjuIQSAyd0Ctgxw5ezSA+ckNIoXjD0TlUC5gGLDRH0vy3/L1EdJX+smR5k1ONB+R2Eb5xdBrpB+Wx/pcTVMPmEKmRYx3XqLKN8WMnygjZd+aMVxiQ+sLpbReybXwD4ZSPyttoCPj36O9x5WNMX+hk6onwRlApJWnIEwkJZ9DYP7NLwl+c5wnbdbHYn2ry2JzrSCoz6vRhnag2CN3uR0DrUUF2yzeYtIgw4yzD4udpqdozrfrZ2tohVXOMc49xwmVzkyGC/zdvTNEqokNghy5PsxZMepA+Sp/P0xtlXMGtR6AOrsIccnjtC7w/XoNCmTYE5fN5rPxKC01huXb607+rkCrJ7UUTWTZz/zZlplRctASFR57tDuy8
X-Exchange-RoutingPolicyChecked:
	ekdae+lFMrxDi7i+6YpwSijTRRzrmxvvYVX7FSfGcO4UBfc03DTz+V6/awYgvopWOrcTwIbCUxHTDC9s2NhJLmat19Y7fbg23z+Nn/aiGyonk5yBcHXKPfrAMpWEMN0YSE+YAHNPZPvjvfXNXcd6aXMsQErH79+veWUk2pfkpuVlxyEmUZeuunHhiJvTU+V9T9sH3GDd6qpY6ql9s/ZdEbBWXKynKCd9A3eX1r2BFAUB65f38s3bHkOjTU3bAvKOtclBwX4mBNokTkINgXsysV3WplsndCxXc1xtwDOI2adSj9JegtDx5Wvot5NiaRijQLFQoMeJQ91nnzb9mrMWWg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 19:02:56.2895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: add8fd47-c332-489e-5569-08df16809d83
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFD91C619EF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 1RRfwrOG0b3PbPe7VC6lTdfHx8K15_gg
X-Proofpoint-ORIG-GUID: 1RRfwrOG0b3PbPe7VC6lTdfHx8K15_gg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDI3OCBTYWx0ZWRfX6z9ymo83kvL1
 DZSFOTWo364k5x8uoD50Zwb6oNMs3W2NeZ5cSfvy11f9SYXYLn/JrO9fr6d/SELhmtmD7Yoc+V+
 /3lIDhujtczmO7pQXdo3tcIMJc8TdcU=
X-Authority-Analysis: v=2.4 cv=VrK2kO2n c=1 sm=1 tr=0 ts=6aaedc68 cx=c_pps
 a=fUX3CcU6CI0WA5Nw0mDYKQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TXF05nYbSb0vizRg:21 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=RpNjiQI2AAAA:8
 a=sozttTNsAAAA:8 a=uherdBYGAAAA:8 a=gEfo2CItAAAA:8 a=tVLB-G3gUWUS4aS7d1MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDI3OCBTYWx0ZWRfX+37kkYbM4WVz
 3i1AO0Tmu69RXuFS8XsQVOitu41khjPrRfOVi7R5EsQ7Kxm6NbWDMngdMCcGt4FTox9g0gwL8Dk
 Cd2unCFlwfFD8pd2wplKu+us3uxY+4Wx7N0l3opQ5fs0mlg/thO6Vz2vcdXkqbDYOcLMlr3Sb26
 DDOY4hQEPqPpGuoNeA4rPr1AzP5ffA+Dp8sS5I4HHaDRHn5YAGeOf4kyEiTLe6eVDeQ3Mu1O3Uk
 J5iEcep1tvt/b4GEBM8So+H6nNZHahrzHQXUhUh5zsM5MvvBpH/z814S7P+UJ2AIBRWdK63aLZ/
 BNZqIjdOdG0Gcq0N/jS8FJ+p6LMHv4DWxt+gCV2D+J8zHlV+WJACp6GywJ2Z9zyB4vBdviF5CQ4
 eRn6NblAdik9IeJJRWCmwUxVUPYBI4amaT0YSm8q+TzQlLl5KROsmkg36ZGBFRNtDWOyWI0sijA
 N63Pk1Rvsmx3n2k1upA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609190278

Hi Peter,

On 9/19/2026 11:34 AM, Peter Rosin wrote:
> Den Fri, Sep 18, 2026 at 11:=E2=80=8A35:=E2=80=8A28PM +0530, skrev rahul =
sharma: > Hi
> Conor, > > On 18/09/26 03:=E2=80=8A40, Conor wrote: > > On 17 September 2=
026 17:
> 44: 21 GMT+02: 00, rahul sharma <r-sharma3@ ti. com> > > wrote: >Hi Conor,
>=20
>=20
> Den Fri, Sep 18, 2026 at 11:35:28PM +0530, skrev rahul sharma:
>> Hi Conor,
>>=20
>> On 18/09/26 03:40, Conor wrote:
>> > On 17 September 2026 17:=E2=80=8A44:=E2=80=8A21 GMT+02:=E2=80=8A00, ra=
hul sharma <r-sharma3@=E2=80=8Ati.=E2=80=8Acom>
>> > wrote: >Hi Conor, > >On 15/09/26 19:=E2=80=8A19, Conor Dooley wrote: >=
> On Tue, Sep 15,
>> > 2026 at 06:=E2=80=8A10:=E2=80=8A45PM +0530, rahul sharma wrote: >>> Hi=
 Conor,
>> >=20
>> >=20
>> >=20
>> > On 17 September 2026 17:44:21 GMT+02:00, rahul sharma <r-sharma3@ti.co=
m> wrote:
>> > > Hi Conor,
>> > >=20
>> > > On 15/09/26 19:19, Conor Dooley wrote:
>> > > > On Tue, Sep 15, 2026 at 06:10:45PM +0530, rahul sharma wrote:
>> > > > > Hi Conor,
>> > > > >=20
>> > > > > Thanks for reviewing.
>> > > > > Apologies for the delay in responding.
>> > > > >=20
>> > > > > On 28/08/26 21:57, Conor Dooley wrote:
>> > > > > > On Fri, Aug 28, 2026 at 03:36:14PM +0530, Rahul Sharma wrote:
>> > > > > > > Add binding for the event mux router of TI's K3 based SoC AM=
62L.
>> > > > > > >=20
>> > > > > > > The TI K3 mux routers which route the GPIO input events or T=
ime-Sync
>> > > > > > > events b/w peripherals instead of routing to a CPU.
>> > > > > > >=20
>> > > > > > > Refer Section 10.2 and 10.2.1 of
>> > > > > > > https://www.ti.com/lit/pdf/sprujb4=20
>> > > > > > >=20
>> > > > > > > Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
>> > > > > > > ---
>> > > > > > >    .../mux/ti,am62l-event-mux-router.yaml        | 79 ++++++=
+++++++++++++
>> > > > > > >    1 file changed, 79 insertions(+)
>> > > > > > >    create mode 100644 Documentation/devicetree/bindings/mux/=
ti,am62l-event-mux-router.yaml
>> > > > > > >=20
>> > > > > > > diff --git a/Documentation/devicetree/bindings/mux/ti,am62l-=
event-mux-router.yaml b/Documentation/devicetree/bindings/mux/ti,am62l-even=
t-mux-router.yaml
>> > > > > > > new file mode 100644
>> > > > > > > index 000000000000..a5ba7f78a156
>> > > > > > > --- /dev/null
>> > > > > > > +++ b/Documentation/devicetree/bindings/mux/ti,am62l-event-m=
ux-router.yaml
>> > > > > > > @@ -0,0 +1,79 @@
>> > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> > > > > > > +%YAML 1.2
>> > > > > > > +---
>> > > > > > > +$id: https://urldefense.com/v3/__http://devicetree.org/sche=
mas/mux/ti,am62l-
> event- > <https://urldefense.com/v3/__http://devicetree.org/schemas/mux/t=
i,am62l-event-
>>>> mux-router.yaml*__;Iw!!G3vK!VJUh5A8cDCko1ZAGtTQ8V-
>> > LL1vTj1BNr5NNBonzfy5GnFCQkP4Oc-0Kkq4xVdCcEA5bQcDckFu6UyA$ <https://url=
defense.com/v3/__http://devicetree.org/schemas/mux/ti,am62l-
> event-mux-router.yaml*__;Iw!!G3vK!VJUh5A8cDCko1ZAGtTQ8V-
> LL1vTj1BNr5NNBonzfy5GnFCQkP4Oc-0Kkq4xVdCcEA5bQcDckFu6UyA$> > <https://url=
defense.com/v3/__http://devicetree.org/schemas/mux/ti,am62l-event-mux-route=
r.yaml*__;Iw!!G3vK!VJUh5A8cDCko1ZAGtTQ8V-LL1vTj1BNr5NNBonzfy5GnFCQkP4Oc-0Kk=
q4xVdCcEA5bQcDckFu6UyA$>
>>>> > > > > > +$schema: https://urldefense.com/v3/__http://devicetree.org/=
meta-schemas/
> core.yaml*__;Iw!! > <https://urldefense.com/v3/__http://devicetree.org/me=
ta-schemas/core.yaml*__;Iw!!
>>>> G3vK!VJUh5A8cDCko1ZAGtTQ8V-LL1vTj1BNr5NNBonzfy5GnFCQkP4Oc-0Kkq4xVdCcEA=
5bQcDdyRJuLcg$ <https://urldefense.com/v3/__http://devicetree.org/meta-sche=
mas/
> core.yaml*__;Iw!!G3vK!VJUh5A8cDCko1ZAGtTQ8V-
> LL1vTj1BNr5NNBonzfy5GnFCQkP4Oc-0Kkq4xVdCcEA5bQcDdyRJuLcg$> > <https://url=
defense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!G3vK!V=
JUh5A8cDCko1ZAGtTQ8V-LL1vTj1BNr5NNBonzfy5GnFCQkP4Oc-0Kkq4xVdCcEA5bQcDdyRJuL=
cg$>
>>>> > > > > > +
>> > > > > > > +title: TI Event Multiplexer on K3 SoCs
>> > > > > > > +
>> > > > > > > +maintainers:
>> > > > > > > +  - Rahul Sharma <r-sharma3@ti.com>
>> > > > > > > +
>> > > > > > > +description:
>> > > > > > > +  The TI K3 mux routers routes the GPIO input events or Time
>> > > > > > > +  Sync events between peripherals instead of routing to a C=
PU.
>> > > > > > > +
>> > > > > > > +allOf:
>> > > > > > > +  - $ref: mux-controller.yaml#
>> > > > > > > +
>> > > > > > > +properties:
>> > > > > > > +  compatible:
>> > > > > > > +    const: ti,am62l-event-mux-router
>> > > > > > > +
>> > > > > > > +  reg:
>> > > > > > > +    description: Register base address and size.
>> > > > > > > +    maxItems: 1
>> > > > > > > +
>> > > > > > > +  '#mux-control-cells':
>> > > > > > > +    const: 1
>> > > > > > > +    description:
>> > > > > > > +      Number of cells in a mux control specifier. This shou=
ld be 1.
>> > > > > > > +      The cell specifies which mux control to use (0-based =
index).
>> > > > > > > +
>> > > > > > > +  ti,reg-mask-val:
>> > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>> > > > > > > +    items:
>> > > > > > > +      items:
>> > > > > > > +        - description: Register offset (relative to reg bas=
e)
>> > > > > > > +        - description: Bit mask for the mux control bits
>> > > > > > > +        - description: Value to write when mux is active (s=
tate 1)
>> > > > > > > +    minItems: 1
>> > > > > > > +    description: |
>> > > > > > > +      Array of triplets specifying register offset, mask, a=
nd value for each
>> > > > > > > +      mux control. Each triplet contains:
>> > > > > > > +      - register offset (relative to reg base)
>> > > > > > > +      - bit mask for the mux control bits
>> > > > > > > +      - value to write when mux is active (state 1)
>> > > > > >=20
>> > > > > > You have a device-specific compatible, why do you need this? I=
f the
>> > > > > > active setting depends on the device or w/e, why can that not =
come from
>> > > > > > a mux-control-cell?
>> > > > >=20
>> > > > > This is a boot-time/board-fixed routing decision, not a runtime-=
selectable
>> > > > > mux that any driver ever calls mux_control_select() on.
>> > > >=20
>> > > > 2/3 of this property appears to describe the register layout of the
>> > > > device, that's not affected by the board or some boot time decisio=
n.
>> > > >=20
>> > >=20
>> > > You are right about the mask element; I will move the mask into the =
driver since it is constant across all entries. However, the reg-offset mus=
t remain in the DT, as it is specific to each BCDMA channel's trigger line =
configuration. This allows the DT to define the unique routing offsets requ=
ired for the hardware.
>> >=20
>> > The reason you cite here for needing reg offset is exactly what using =
mux-controls from a consumer node provides.
>>=20
>> I will refactor this to use mux-control-cells. I will drop ti,reg-mask-v=
al
>> from the bindings and instead source the reg-offset and value from the
>> consumer node.
>=20
> Since you have this ti,reg-mask-val in the binding I assume you have=20
> different setups needing different values. But, since it is obviously OK=
=20
> to handle the variation in the mux-controller DT node, it should also be=
=20
> possible to simply enumerate the different setups as different=20
> compatibles. Then all needed compatibles could be handled by this driver=
=20
> which would use the compatible to look up the needed values in a table.
>=20
> The relevant tqble can surely not be all that large?
>=20
> I prefer that over passing values in the cells, whixh seems a bit=20
> convoluted to me.
>=20
> Cheers,
> Peter

Thanks for the feedback and the suggestion.

I will move forward with the mux-consumer approach and drop the
ti,reg-mask-val property to keep the implementation more generic.

While the number of compatible strings may be manageable for the current
hardware, we are expecting a new series of SoCs in development that will
follow this architecture. Using unique compatible strings for every
routing variation would lead to an excessive growth of strings in the
driver, increasing the upstream maintenance burden. By allowing the reg
offset(or output channel number) to be defined in the consumer DT node,
we keep the driver logic generic and avoid unnecessary complexity as
this along with new SoC series evolves.

BR,
Rahul
>

