Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D3C45D906;
	Mon, 21 Sep 2026 09:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984271; cv=fail; b=UDZvSrigJtoFIffy5shpt03rBy3YzHk8laf8pstNdXHVGzg/ybWLeiUFtjT6+/gE/7b59DLuvy/HLPfqVwor3wcwppRaKK5cndAdeTuWthakxXMOKf6B1F2HRUx/AqtChpVXomvNgDgyyQcnKrlCrQVHm5Aq2h+qEc9P8UYX9Y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984271; c=relaxed/simple;
	bh=QeDAqYuKYu0MyDvyMll4X2m5QR4WefMyMan11BlZBfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyH5g7gGtSGOG3uLeRNgyhR2M6zFCfcQ+BitKo0qEPtklMMyK7Tq+9t5z/LrUfvtIovv1U/JVoi0DPlc/Ihh+xnRwUoDGbt9WzXTGFKbNQk7l2eaxMLbCgT2bikZgPl+Bc7JyNfeqN5Ov3aYrTYNvxv3wKs/Ug/2TJOpCezYMJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lRmnYMRx; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=eSWrh94/; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lRmnYMRx";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="eSWrh94/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L4iMwS538252;
	Mon, 21 Sep 2026 04:50:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=mK+sYppSZLaESD3xnd
	H98/EjCJMQUeALCSM4ExwdwUs=; b=lRmnYMRxKDc+x0lQFz/zfw2L3o8OZPFIQg
	VZq7Yc7s5fDV4evW/tTte6E3xD/dqA6f4oY8Y9Zy9Q4n//Ii7QUZyIhZuDkb9Hqz
	Rjj4q8ydbHVlc2edSOn/NDXUKoKWcmnmfHUo1uUXLwRVyqQWZulyWOsz7wy3/d0c
	ir0MguJN45PnSybSbJSqe71LD+6ln70olDB5SrBCOji+mNxdJv7j/n2++yNZhU+Y
	q5PEoKTHC89rhhBnxrVSZtaBOr2ySFplSLcGbHqCxAMP8uQjlJN6QJ6nw27gG0SR
	/OPZ+8zm8biNLC86VyTtpTNZ46E9F/KLBsu6fAnNNqU7qv7I/eWw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022113.outbound.protection.outlook.com [52.101.53.113])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gsqt09rkj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 04:50:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=favqmJtR+mfFEfYjQVw3m6bVM83wPlror6FAteHmVC3pAXdP2mpuIbQl7fTut8v3jcPKbVfzZGb/PwDMp0lcFYiwiGnW9SMw4X1zw/DleRTOe8lt6Qq3dFbPqx2LFjFQF4+2qyyKpW030EWMjBx11Xo7ofPjsonRhELA34N1lJElpMbyfY1iFrZdp0N+ArJ+4aFDA88fWGSBIlHxcjSyp4DqD4TwO6RKDAm5RQZPXx8+cwMGPfxLqGatWYO8HI35374FzvkkQyFuJ7rOiio2wI4XAy5AUYvgDjj1lUoCVEVNfO3S77AUMD1O9rxpKK3CGhteW8JlTFLRY9n3dUqOKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mK+sYppSZLaESD3xndH98/EjCJMQUeALCSM4ExwdwUs=;
 b=h4466aSPMymTSCP3ZaF0oUJ6OHHEjxER5jM2uhqT9e4J6S1+wGYxrQKKLBQ6GB72qGzYjJTgync/vVDpnoCp7KyFayqeSDJxc3PxG5/uouUYf6zWZjLBZoK7jOjaH2q/XD3eZOJc/yEFoO9MURXoowcvHd3TAuGs9sG6QmhxpeADeUeZKLYveibdG2E+cd9nPDM2uKNQ5TmwVSEi85mMuftmqv9+UqDZAh/hh0kyiHzKS0PxN4iZYA4Z+KKZPoHVzJ02oCsWkz3sYwc39LI33honV635jPTO3xjjrWTgeR8dT0h9jCI/IB104m+hBPNbs4k2TZwOkNYnogdG/PUaWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mK+sYppSZLaESD3xndH98/EjCJMQUeALCSM4ExwdwUs=;
 b=eSWrh94/1Y2XEKbWDY7kNnqlBeDNnpWSyTNCoYBrW2BC0p6hzYjV91mZ3aXrABgVrJFFxTrKgb5/e2n9XRhK/HG0leIblt2jAfVft9dimJ4hLTWo0KxeoWI5qxklNSabglgUpe3/lHr9rnIsp6cSq0MDxtPOq/8WvwYg3o/IQuE=
Received: from BL1P223CA0009.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::14)
 by DM4PR19MB6343.namprd19.prod.outlook.com (2603:10b6:8:a6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.15; Mon, 21 Sep
 2026 09:50:53 +0000
Received: from BN7PEPF000000A0.namprd04.prod.outlook.com
 (2603:10b6:208:2c4:cafe::8f) by BL1P223CA0009.outlook.office365.com
 (2603:10b6:208:2c4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 09:50:53 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN7PEPF000000A0.mail.protection.outlook.com (10.167.248.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 09:50:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DD634406541;
	Mon, 21 Sep 2026 09:50:51 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CB9B5820247;
	Mon, 21 Sep 2026 09:50:51 +0000 (UTC)
Date: Mon, 21 Sep 2026 10:50:50 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 2/2] ASoC: SDCA: Check return value on a missing
 FDL_Set_Index Range
Message-ID: <arD9+rq5ricxcptK@opensource.cirrus.com>
References: <20260917103400.2032913-1-mstrozek@opensource.cirrus.com>
 <20260917103400.2032913-2-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917103400.2032913-2-mstrozek@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A0:EE_|DM4PR19MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 97dab19a-7828-4445-c19b-08df17c5d32c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700016|23010399003|6133799003|22082099003|18002099003|16102099003|4143699003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	QbQYDnk2w0la/l0WxmAgl5dK2nADb5lQQp3xV4oS9fOcetBFDRdf6Bv1ZUMGI64hYGYAxqr2mTLVE09pfIAsSM/ZV9HDfRvGwjCZqsWIE/Gd6FeLOvgfIP72nvfMKqLRBo7yKhSVPiY1hU/W1puJ0ajpifv22/yAtaX6xcn+Qxu05vfAnAPIj1fhRHkao5sK7JufE38cYBZFVW67v8U0TZ2Wk5moNXaShmUEE/u9xSgZyUjoCXe4dhaV+jlce2A8jzgvxQ4LXksIpkDzvSJ2J1+sm/Luh9ADsJeZ2apJH85RarZSwOvmVfVTYMHCaB8eHP3WaxTMIYfpunOiWoMNBs9wwV2nZHCnnW1Tckf8AS7h922/d/vnqaefClhrHlC/8XzDyQig+qAC5qAqyffiQ6ucFq9V2LaI06wagz+2yhCCWF0Kw/8u8RJx+TnLsMNc5aWNknqEvnG6iq7ewH0xrozmQjJE6YXlHLfd3uXKNRDOHK11fWiUps6+381hxujuU9C3YwvULIs5d+bJoq0KqaigqgOFDxnxjH0sQVfuv/4P4jzKV2hmbEFh3jDJoNXqF0tXrFZe7TuXq3Bv81v5e6o+iMbdEgMvXF0MpEBt5lQ/WoNDQYWW/ze8kzzm0tY+L92lf1N7KSI+VxbTWDaxN8DJ97dqdz2B+aCbxqnwBQDQdyHgxQ+I+MPSTpGY4wRb523oZI6B3SlRERJSRmWhPg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700016)(23010399003)(6133799003)(22082099003)(18002099003)(16102099003)(4143699003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RgbEWGu3SyIJF3mqMMTsUO9COvB9U1p90lRC0ygffPCcB/3CMUyPBquvLu+v+J3cSTXfgc2Tre4I7MzWenYJ3MqWf/mIg9hGRP8Ln8KtXwdo/2eRlJOkyR4pldxHDdAVVEmnEDXApSttS1fn10p9neJUVZTKW8IJq2zvD3iKB/k85BianUZW42Ml2umq6NsWqZZebJHTFQ5RJWd1j7DfsClHFHA6S/zsMZzAS5uPLjKuP2UPc7IXNbPSoVKM93WzIaW2Mvk+2QtTE+5ZBgG17ImYXTB8RWF5fguodsXJQ4PMXWNs0/8H/5auR9SqLRm43sXjpnEQnkX+cptSVG7iCPK/GqcVkLO6XFfkKi9osAMNZDRRnnk2mMC5YKL0d4/Knhj6RSbNQLV0b/AWyCTR48OSY3NTgg2PiECd3CmtKIyBPm1GrYENGhMYK0nKK/3B
X-Exchange-RoutingPolicyChecked:
	OVr8dr/9Ym1S3GTgEQNGezzATYZ4Q3nGzh++RSbbDMwdCIwk4o3yMuCUVP10Rhl24xQiaIHS6+7pr2/EFAW5leAoI9pJ4vkcSl3qBviRlj8m8MgFd6NsKdTajCBoJqwiPSvEDh0csY4bltkSBzbyIR+t6EEk//LfyFNeps9XGzEifrTBxz1QUOjM1g5GbBJCQSAscVde126X7lizHFBhzxrIpY505HiYaRw1sxQXIhuv0EU3P9GtQkTXf4k1jUYs9J5SU+rGPh4S2jdElDSHNNa/EoMFgOmJgaVXCKqIuK6RlAwk9xfr2a2koAm/K14M34iDGe5HGh0kCvPhSUpJNA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 09:50:52.6682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97dab19a-7828-4445-c19b-08df17c5d32c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN7PEPF000000A0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6343
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE0MiBTYWx0ZWRfX5dPhFruXQ5kN
 Zwbty8zJE//ThoUu6FjVBWFWarJl+K+K7v/P7Af99kZxa0deJkCjd86BcC39kJmQKyRwU4YIgyS
 DOBA0LDjW2NSiS2swdjlQS+UBiSL3z54zpgrl3TyTiGbtAfTOLTB0fFZVsrJPptvxRtgjaXXfsJ
 71wquRtYkR5MGHD8xWy1QmCjYMSC0njvRtMi5cbJopFNhoI9VKCXTEwQPV78XCXLkCyL3uClwa0
 FbwyqVErLwTKmPISNF2vUGf3eylJOy+q2InuC+l9Vu9M62EdLDdxOHH2GA94/i9jShUIzvEb8KT
 02Xn0yBFPeiTO55mrBlzM3x+d7XsMGk7iJaLJ4o/XVJdfQ8O8IaPINOGPFq4N8n35sIkLrGm07l
 oYFhTSvU2PFMT4f3k5jzTPrTq75tXv0KWDl39Dg/e+nUlvN42xBctUCEzIORCCaF9Xzhf8rCE/f
 nkVuwKOV8uU+0TigxJA==
X-Authority-Analysis: v=2.4 cv=TPTQ2Fla c=1 sm=1 tr=0 ts=6ab0fe03 cx=c_pps
 a=opNks6lJvPUjoR/Ci7CsCA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=srDoHaXkoJIDN2wfDnwA:9 a=CjuIK1q_8ugA:10 a=0lgtpPvCYYIA:10
X-Proofpoint-ORIG-GUID: MjJbTdFCiuBpfpOJeAEPMd-WRABtskzm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE0MiBTYWx0ZWRfX0Ze4dEl6gqUf
 +gTwM7OT+0R3pd34gVM8u2OvNP1lf+b7T7sTNf+dqUst9KRYs/P2FiXhU0Cqg+unlSUaW53NCge
 d02MeinG9tKRG1Ytat3XwfgF/fZtpus=
X-Proofpoint-GUID: MjJbTdFCiuBpfpOJeAEPMd-WRABtskzm
X-Proofpoint-Spam-Reason: safe

On Thu, Sep 17, 2026 at 11:34:00AM +0100, Maciej Strozek wrote:
> In case of a missing FDL_Set_Index control the return value can be NULL,
> ensure the functions returns before passing it on to range search.
> 
> Fixes: 71f7990a34cd ("ASoC: SDCA: Add FDL library for XU entities")
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
