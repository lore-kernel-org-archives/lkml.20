Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5ED488763;
	Fri,  2 Oct 2026 09:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935038; cv=fail; b=QXBcH3iPvL5EMfmTMA3ZQtdb+UXlRYEyzqAbNuk9xWpUhupjdU8XlxrrGnaoXXbdvrufp6BitQ74EsL/3mO31j5OHEwXz4ZRWiNkb2jiy3KS/s2iFOzP1GJziREEzSlCGr0kvH6wTpzR6f7Dkug8PXLffQFg8/BdrlKRRLTiLTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935038; c=relaxed/simple;
	bh=iiXsQHXamGzitUSb15iRicXS9eFbNbz6akFM2VjekF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=t5M5r0wydBQl5lvAMPZYio2YOrNf9eWs+0hYDa9GB4JUDHAGcEPbaZQyeIF1PwUGdNG55I2BPMWuG044fr9tiaNXyCsPY3PBCEXHuPhN5pTrLdL99iZs+gHOCysKWgaQN2iLP4EJJLAKc4yM7+/pFcJnAfXfo4t80IGbgR5/yrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=eqHpJW2p; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=hvGlGuXf; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="eqHpJW2p";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="hvGlGuXf"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6929lnkE374067;
	Fri, 2 Oct 2026 04:57:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=wwUbl20GLDeB2InvSSXalO8LSqIFIDpO52nAdBiBQ
	ik=; b=eqHpJW2pJzmcwI0tADJYZzeJT5lb2vFz8QT6+6tclFRqa5bDXZgBQRisO
	I1U37zbzM5c9HF3NUQCJh6O3lvLqNeGKmU9LR05PJwTKNPjVgRA6eFeKHf9AAHj7
	z4AXwdRyBB+bFDV+6eRl43l5P8cnJpSHaalndZ0b0cFF7G8gERuKFH/ie56IMjuF
	P9xbGqGPjMiMLFo5A5M84oXEQQ39D6KjgjcebNWiIoIn9AOOXJMBIRpHIs/eMs92
	i4itlnyHtm8ADGrgCRyS9H4N2eIe8yxKo2X8bLvJMZ2Ht+Q43kaS1GdlFPMJDXtz
	5AX32LGiKorilQfobvY6iaWvXUviA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011068.outbound.protection.outlook.com [40.107.208.68])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h27p3gupw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 04:57:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5agUBI9RNSEz4+JNyaDNn6OzNGVJeuaLYtdJPDApBoQJ3yvRB774UZSsEceDqjct8gmnQ2qRBijRayFtyivZmv3FkPGSCww4V5vIwPjywBJGQEXtKHPP+hRtSmzz3uKAkd192OYFAtyel/faR6wGd44rpPMWXJvAHlPlAuMcNKhMzTwDpxVPFoeTf6oB258sO3nEtUCox1dAUGDqGGKg/wcWSswiJGOMC5hYJPjnTirERY/eNlgHj1JWNKPHAVwuBhJuhrfgAD9GSUM+wy91ape7J6Xx72Y+n52QTX4pVN2xPpyzHXlPgMHxsOPN2awAKDlKmw/XGUrE7asFvEMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwUbl20GLDeB2InvSSXalO8LSqIFIDpO52nAdBiBQik=;
 b=MnlvB/5DW7O7sVrp1GBt4lDOobx+I1dE543eb2pmL70z1Ih0jM8o+T/M/S+ynMGYoIduLXAYnmPqlx0uQlEH/wlLBfsZLlkO4kE2Oqu4gzJkUI39TwQoAPZaH18JHEFBRMarK51CVIAg6RmV5uoBCDReM5slRbC60HNz/BCQD9i6U+ITSy90rC8fywrDEK2MCodBeI+cw0quVetO1M0MZAsDR4ynqjABCVU2ZzcY2PmIxGjd3Leww/zesFSHju7yus6RbPDOtMETc8RpRMvphIHLSS6GtZrvnLVH0+5VSJCsPi8eKqJceO1G49vdEwWJKBUkGZf58i4RHvDp+phehg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwUbl20GLDeB2InvSSXalO8LSqIFIDpO52nAdBiBQik=;
 b=hvGlGuXfhAf1YkwozP24XeEL6e70srspnNKYG2LaGGMVa5SFuwUOgzcwVGwtzWYPO1yjC9+fIPIwrENTwW2j/1D5zy4y7lxwdCH7vuxdiq2yN+lS7Tc3T/Hht/6lpG0Sy+fqARArwTnztEzQXYkdzF2knzcxWYxxkzsACIy9KnU=
Received: from CY5PR15CA0011.namprd15.prod.outlook.com (2603:10b6:930:14::23)
 by DSVPR10MB997962.namprd10.prod.outlook.com (2603:10b6:8:3ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.12; Fri, 2 Oct
 2026 09:57:09 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:930:14:cafe::98) by CY5PR15CA0011.outlook.office365.com
 (2603:10b6:930:14::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.19 via Frontend Transport; Fri, 2
 Oct 2026 09:57:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 09:57:08 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 2 Oct
 2026 04:56:34 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 2 Oct
 2026 04:56:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 2 Oct 2026 04:56:34 -0500
Received: from [10.249.144.74] ([10.249.144.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6929uS3L2828403;
	Fri, 2 Oct 2026 04:56:29 -0500
Message-ID: <73326965-527b-4de7-85f6-ce3b458c0401@ti.com>
Date: Fri, 2 Oct 2026 15:26:27 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: arm: keystone: ti,sci: Update nodename
 pattern
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <afd@ti.com>, <u-kumar1@ti.com>, <vigneshr@ti.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>
References: <20260930194131.117129-1-b-padhi@ti.com>
 <20260930194131.117129-2-b-padhi@ti.com>
 <20261002-rugged-nondescript-cheetah-8caa9b@quoll>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <20261002-rugged-nondescript-cheetah-8caa9b@quoll>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|DSVPR10MB997962:EE_
X-MS-Office365-Filtering-Correlation-Id: 17cc2a14-6504-4331-19d7-08df206b8570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|4143699003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ci94h8GYySYnMyEtlB4/MIMl6swDesSYHItpD6495Fq4caniKGEn8hzOMtJOzqYLbYCgWJFByhy7PCcBg7FCi/2XGBLfpuVoUwSiXZQTt1UBieUdxnsWVYDr2qBwcwfKLJy2EJo9iyodu6DBFDxkBO9j2Cy2DL5obwyIjzA7QnDq7KN+d0Ij/O0QC5XS6KsbZv8EnMB+vGsKkAZFTzPszi8id2uaqUuFAlcxR8xeexpfDDYemvsruGIF59RsN15IjAIvAnetjPSUpqL933s1toXuMvS0VuAXpEhMos2byaqog3LIsYusv7mog0HlCbqGCgfYyKggu7CS2e/3FXJefNHcAfVR9W0v/c8cNgAxtU0sXwxRmGr7hS+uKNrq4QmLORthIt1g0wMvWEtdm4vsxkQLGkV70Mgu5209BX3Eu9VlsLCGu7pno4Z8LmmFHTDkSrav7wRhdL5ctSdPEEPCpLU8FkYh6845BojB9TBIWsxXTcHHZmuI19PRwdF0t8zcmZxnXtasFF3tZu5KswRtVqtdUpf5ljO/6bmgyiT+s5E0Kuthj8yhKTWsVQJgLRkt5v8HEW8m9gVbgcliA73UZVmPU5wwUSnCf+cGLLJpWoZvEbZqfrtc8nlamqt2zrhS15XH22wAPIKJaz5Tun2lQ3ShfSPrMioJDLWuBaUYBCGPbOrJW45Oc0jebG8gBJKwqElcMe8ALVajiHZQ5wKWyQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1APlF7HpXO3qKnnZ/c2MN6JLlR3X4Y+Z60KZrLIltnd7zI5WFuG0/Au87Cfq/Uacn8wfGy6a+oUiFvuLygjwMfBAdrZvYPO9MkHFdVL2T2w/n5ly8vpPcMCY3eZDjeEwfw9/b2ueMO4OcdXBz0J3OsUd/1VfmCJqPzwaCsDZ2NYykRa5oIkpiVBZy5ni+vOa2HG7RIx6s0TLvOsHwoAz8nQiuEopVHKWfDt5LtKTDicakwfVLfdWOpCscQKb3hScsWUq2HgOn0GoprX829Awld/j0O3/IDWbursrcLjl/fE9A1119sd2XBVZ2H2ANUkGHKBrgS0R0tD6y/oyechJavfr54R8oKwgsEppdL3X170zTd5UDUOHPTo7wzNyA2Nx+GkAeccdmF+iHM1F7ORQjCzU6+DovZg2N0iOk5ZMziYUHqU+aSis/eUVBgBA+8Za
X-Exchange-RoutingPolicyChecked:
	jctkc6uaOrMyooeV5nVizTMYgGcedZS1hkpdzqs9o9rr+xuNGpaNxmAWpj34K/r6Fc2GCNUhwJmR5v+qNDkpZ++yKtIupW6LY8oeVVetAM2rZwvNOC8kS9N99Q+7gFsj2zQOh6H1DcFjBG4GN3GAtWhkznHVRVZW5UJov7llFGYxvIpFHXkIFXIcqK3lWpoHNZ/omxgPuXv9+XH4kT3Pu/407wOFglF0V6O0WE4hTdA9Bd3Or6rOIKbCqFyYm1gnin/GJ9nlvncHgQjOW3PmNXYT+WCCYVy9xUPzdth2VDlWBs/eEcHuC9RwHfjIjJA02ok0c/FjnkrwKPJMtgNu/A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 09:57:08.1430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17cc2a14-6504-4331-19d7-08df206b8570
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB997962
X-Proofpoint-ORIG-GUID: MlceroscoLLNeAYkPmt3K-0jpH9BNZgg
X-Authority-Analysis: v=2.4 cv=edKo7LEH c=1 sm=1 tr=0 ts=6abf7ff8 cx=c_pps
 a=vivBcqwirDOV8GiKLGAusg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8
 a=VShlAP7PljsLZm2I1LAA:9 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfX75k1rFtn+DeJ
 PCaxVEXKMr+DHLSi3bVbAsy5MB8zw1Ey55m9HF3WkatvxbGhjAiaRyPq7WUFgjhoyTcLb7mrCiI
 B1eSwIvIolJtadnHnlJbg7X3S7H90VE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfX0yeFfiZR8xJo
 LTh48m/FsanDihV9Oo4RzrVGwE3j8ppo9MJ5o1PpTuwn+2lK1Pw42s0Q+3Bxj9RiDi7eePIvDFg
 /dkqfr7MjOF7OHlJSrNAGpq/bLjeP5JD+j3HieTKSbGi0FLmwJxnUP8hVDEK4cfeXTZl1xMcUEz
 BSS1039v13Byq6wYO07sHyH8QT4g0SugZsbPfUvzjoe5uAaRz+4wO+fIP2eOBPfpdT0U7rwrnIK
 h9p8Qr1H9xEX7MGgj0IghhToqAiix3fN3UesB5ELbz6Al1RZXgt9jG6OeT5vFJJStNpuJmAYH1K
 OB6SB3CbPA/a+ZjbJ7Df7f3dJX4r6N47GTsxVbbhmb7nKIC2UQTu133A4Ny5X2py6KW7GD/CUMa
 zlt6nrsAHiCrE0DIqaOnh/01UwEQeFiRA3O26vHfK5rapXag2UXG3cbYrSc5wXhafHqsPafYoyj
 u+k6N3qka7HH82JBv+Q==
X-Proofpoint-GUID: MlceroscoLLNeAYkPmt3K-0jpH9BNZgg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020039


On 10/2/2026 11:57 AM, Krzysztof Kozlowski wrote:
> On Thu, Oct 01, 2026 at 01:11:26AM +0530, Beleswar Padhi wrote:
>> The $nodename pattern for TI-SCI controllers mandates specifying a unit
>> address, which in turn requires a 'reg' property. This 'reg' is only
>> used to describe an optional memory-mapped debug-messages region.
>>
>> Some controllers may not implement this debug region, so it has no 'reg'
> Which ones?


TDA54 PDM System Controller. I will add this in the commit message
in patch revision.

>
>> and unit address. Therefore, relax the $nodename pattern to allow the
>> unit address to be omitted for such controllers. Keep the unit address
>> mandatory for the existing ti,k2g-sci and ti,am654-sci controllers.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>> Note: This patch is independent can be applied directly.
>>
>> Cc: Nishanth Menon <nm@ti.com>
>> Cc: Tero Kristo <kristo@kernel.org>
>> Cc: Santosh Shilimkar <ssantosh@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>>
>>   .../devicetree/bindings/arm/keystone/ti,sci.yaml  | 15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
>> index 25a2b42105e54..67acce8a559a1 100644
>> --- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
>> +++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
>> @@ -30,7 +30,7 @@ description: |
>>   
>>   properties:
>>     $nodename:
>> -    pattern: "^system-controller@[0-9a-f]+$"
>> +    pattern: "^system-controller(@[0-9a-f]+)?$"
>>   
>>     compatible:
>>       oneOf:
>> @@ -84,6 +84,19 @@ required:
>>     - mbox-names
>>     - mboxes
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - ti,k2g-sci
>> +              - ti,am654-sci
>> +    then:
>> +      properties:
>> +        $nodename:
>> +          pattern: "^system-controller@[0-9a-f]+$"
> Drop, not worth complexity.


Why? We want to make sure dt_binding_check catches system controller
nodes which have a debug region but omit the unit address.

Thanks,
Beleswar

>
> Best regards,
> Krzysztof
