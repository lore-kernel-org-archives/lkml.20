Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020077.outbound.protection.outlook.com [52.101.225.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61515476CF3;
	Tue, 15 Sep 2026 09:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463402; cv=fail; b=HUm5TZEfTt7Jk8wQf980D6OltYLKclLGLf7Lxczd1n7tHSaV8DAH2I/gdirJQwpRN6/9cxl93B28NaSMu0tqKggta7lRFYgZ1GewWihwYVelrzBE1tWLiHLpMJwC99KH4QLGjXG7iFv1mkaKVuYRpW3D5um4W5tSDVzQIsY5kfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463402; c=relaxed/simple;
	bh=NuvyL5SyLx2PHm0xBRl0y3nWYaRcw3gXmyJQPovShTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H6zj0j7iquGNuhLyMM+k6Hv1BHmgnjuaPh358+YmmT0f2WqEOPj2qpqUurHmQQMb8/qmuGGF5dUBgArdqZfmkfxFN/+Z4CVNFzd4HCOOmP0Uxzoc8UGXQGTKmO7ekZ3DsDxlDLYCdAafyLSFRwnozHVPMzzvpLKghhBUku1Mv3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5w/Tv8DxeUOK0CDUiNMUaAFN1n3/F6K5V+Vrw0+UKKpaYG4rbP8ZI3s4JTliLDq/u16CXBIr1WZ++LFhWMQS378pEb1ZGDhfR6rDiyBmb5a1hKPHWzNnUbtY5mlaummk0q6zgQEIVxzZo577nMzeL+1b8NYQs7BRfQvfyQwImQMC++YVdSoWwoScrwP5I0pOwgCaCtUv98b+77FccmnDP2F523O/ayvDJFQ4C0XgJrrOD8JRdHexrV1+ESNlzE3R51Si0m20SpNryF1nexbHMccYZ/892O2186wVCCUBednm91yLwoVC7EnRDDJic3n2/XoMfztYS1CCUV3Q4BFJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuvyL5SyLx2PHm0xBRl0y3nWYaRcw3gXmyJQPovShTM=;
 b=xOerf6VThQV1+r7e8Pcq4E1RrTTWqmhPrG/QMmOq0DpzPycfSaQywMKU7fWaM2xU9DYcm5NqCSQWyHpOgxzF8aUd2rMbYX81SkEnTmm6eLtakLuNKPrd+ptPqmpjmI7HRHrKVsCjPxwTrRX8G/TiLKeCkq84Ux6Wcs9XP9z2w8n5JSOTh3VIsKKJtHCeNfU3T4Q5+l3AldZHnObBSH9q+H4oZBO5f0FQug2elwxJlLPZGykR5pilPio34TA/+HODwxAxnAMui9wvbPbZjFVyT8RkAd/J5PqsBflIkp62DD0F9Y0qpVaLkNQaKKyDz3CVZNAGVQRYtMeN/ieXcLj9CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB5156.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 09:09:56 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 09:09:56 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hitesh Patel <hitesh@ebytelogic.com>,
	linux-media@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com
Subject: Re: [PATCH 6/8] media: qcom: camss: refcount streaming on the shared CSIPHY and CSID
Date: Tue, 15 Sep 2026 14:38:42 +0530
Message-ID: <20260915090929.1284112-6-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f9c2a736-d7db-4d7f-9fb3-d8cd77d45c0a@linaro.org>
References: <20260914133416.1030231-1-hitesh@ebytelogic.com> <20260914133416.1030231-7-hitesh@ebytelogic.com> <f9c2a736-d7db-4d7f-9fb3-d8cd77d45c0a@linaro.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0086.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b6::9) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MAUP287MB5156:EE_
X-MS-Office365-Filtering-Correlation-Id: 99621dbb-debf-4788-afb7-08df13091c45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|52116014|23010399003|1800799024|376014|10067099003|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	oDSDnd5ohuK3UaZmtqO0j1jI+lu7ht+aPnu6XJPSjbxKfMZIHyP+JQ/3Pof8GvUEootkMsjHBD27+SEUD5Moj62m1EAlhfk1gJAtr4Rm3gp8Lvg7RWRReeE9JKizNH3x+3Rpnlq+6+Irg2yCdPHfT7XV+U+FYrN6fTsmu0p49aU7y1lE2BkH6eygI+CdKx/cDYqwKCCapfAHH4K+T15j1iiD4A0Z0W1eHD27WysVzcsOLSVAWdBBHvSfPRGJZvczVrjfS2BjaKGI2H5LI2zQnT/jKMt+hN7Ji1/5VcBj/jPuTwdwHVgyREa9RhklzBjr406os+iChXCAjFFApeXZrjuozMa7+0hDxcxFPkzctIWiXAIOsOXX3/KZcftADfPoQnhOEX4ImdG/Xm+2UCtdMe24dzYhWN5v67eeCpSEtEIBwd48fgDVfxswszoZUqiZ+6g0lVVzFnncvg/gcNQxkR6s6KW3WGZxfdF188P7Os07FoOkBy6gZpea+jckwDEz+eUwudaOYmSCW+0hDOF0vrkbplX0LEv2V6n6su2mKvvcxXq8CtzoxcIn4nmchUBNWzoWNGsNFvXO1g2OTmMXdx3FWF5S4dduAH2bqK0njfOjZDOuRfAG9eWTJ8Xv5qcSo4MBMved6ueyQSvA4QuRug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(52116014)(23010399003)(1800799024)(376014)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CWfrXRRWkCtmlkEIaL9SZEHS/Pj074yhwXROKzRFeEoMyChItzXhdtGLTi/B?=
 =?us-ascii?Q?2YpE4aaeYe5i24PrL/thtONidYtQU5AKCG2vOhQW1ATfEqard8UThh4cQ5DR?=
 =?us-ascii?Q?GqPfOaFLnY2PesXT8o8F6usJHbBBoP2Bfkokmam+/9lYPsr1eeZ17w6vgUBB?=
 =?us-ascii?Q?W6AWV3J7k5nBaUgr262jtOzAzvfozYqMr0nlXIP2cv1bOGW9LNPRv7dfqJHq?=
 =?us-ascii?Q?GQkQ2b8AtruExUFpLypg97GvXqUmftVnd/AnhedY6HW1kAgeVhnTW+KKI2G2?=
 =?us-ascii?Q?HlxqjW1N4DoDmgGC7NPW4+vIPJ6hNcnL8tS8QEmKrMzRgMv4o4TaTfbMYE6E?=
 =?us-ascii?Q?uKFY7N1SyQzrYstKQVvaWS5/GvMJOFqaNdv25VeEcDhB5cEVt77JsG087DHS?=
 =?us-ascii?Q?0OAEeOzHB/PxRnEWy+5zIYw8pM4o+m1mtyo+eo7fzIWSgacxMFtmBOlsnLV3?=
 =?us-ascii?Q?3mjDi7kxMNmVHdK/Qn9uLKUwB03ryqRA80FfadspsC+Y/i5YqKcvvIC/e0th?=
 =?us-ascii?Q?5r9TeHFPgD9/CqVk5aOFZxPQP3CYwQJcEv4XpCoQK28cBN6ohLOcyM9z/7Bc?=
 =?us-ascii?Q?q156SzV9HCY80HOk1ActYilGp+c9Hk6+Fdo/6HxpY78i/2LLB7tOvpEgiyEP?=
 =?us-ascii?Q?5ABFmpseple2yKRhnHD3Vyx5lrC2MwErApWVW3haEFy3d94PZqqkXqeufl8+?=
 =?us-ascii?Q?+6nHb/PmkfKr4eTPZNbnrWpKxP41BuyLC6QNDun2uUrcw0OGzM90CV0p25OY?=
 =?us-ascii?Q?tnP2j63SN2FYpziHmVBK+NuJdx8/cuwZ1kMAdr9ELeM7+QyXMo44OAN8bh0F?=
 =?us-ascii?Q?Es2tfTzFg+stvQPny4mH08M6EnRlrqtNk2/hh3UzuDG+yX3/Xj5DUhdpVDW2?=
 =?us-ascii?Q?knrZT8B+Kh9Jgr203ilh8YpI0jETr8NmJ2qC1s7+dTEILi3jhBXf1iP2qwvL?=
 =?us-ascii?Q?Bhs8SGT5l5Y4aibj2Hr8ClFVK6xr1w64pB3VOrYam/iVTuBwQBTOiBbydhP6?=
 =?us-ascii?Q?479DcvwVs7PmN2q55X1t68NyDUtI7If39FmuF3VKdZm/i0+nBK8pFqswExYC?=
 =?us-ascii?Q?WItnJ3wCF1inyXGji8FLIN9P85N8QicbCs53p0PeT2RWgsyDBfel3J3zP7UB?=
 =?us-ascii?Q?5pR50e+u1HEG5RYWOZ/bZ8XpVi9YpbwW4Hb8rw5/x5mBPPFVjq0vDJ3pcX9U?=
 =?us-ascii?Q?ofD1P4stminb01wQPYWLpE5p9oQfHkaycDs+PoSgEN1ZehOT7vWo6D5OfeYJ?=
 =?us-ascii?Q?GR/VAEXrYPa/PBB1TAAXIlRULRiK1sDHKcJ5tm2C3BFU9bGaUFMS/73uxUe+?=
 =?us-ascii?Q?K+XBB6SgPuxVH21uT5qdJfUXLUMROfuDVwnwsX7u1iavbBTyAZXRU3SSfOIz?=
 =?us-ascii?Q?QggzBq19FFyU4BtAHL909vkNnrZheSpVoFQy+FTMZADRvHinbFN2SvkObibL?=
 =?us-ascii?Q?tdn2kF9R9u4q7W1gY+gCYE9vmYm+je7Hx+QAuenpnREeGrwBo4HqaJ/Jrx2w?=
 =?us-ascii?Q?Qfxu0qrQaRDKeuvrmvYtP++QXlrgw36erQD5ZddC2bWilDiRI2OHmoU6m0er?=
 =?us-ascii?Q?Y7EJJH3tR0lhX9FzIJiGicXOg6gl9pIeqeiBgYSivoM3onEC/ZkuRAiSueeq?=
 =?us-ascii?Q?66CM+TeTAlTZ8I001XfJNXrg+N3YOWS6XuHxKmsT256jJltP9QYGwlUnr26g?=
 =?us-ascii?Q?7UB2XjnUVCdCIzfhlaMsM3WFhXdfPLZam3wPiWm86/qTY653aNTf3qXR+Hog?=
 =?us-ascii?Q?baOsAL+Xl3IjW52Et9Zaw8VqJguz3MfuJKHoRDjHMJA1GdRMv/9xgooVVOe0?=
X-MS-Exchange-AntiSpam-MessageData-1: 64nMbHdgkUlwgg==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99621dbb-debf-4788-afb7-08df13091c45
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 09:09:56.2957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5jJuz1W3ZAMTl1/uDod+1jrdmUYCgmGX/yx5EKXixzLpKUzpuZBz4Psmxl5zgTmfzOCMqbZ5PRIU3jJs53XLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5156

> This logic is mad and genuinely hurts my head a bit to read.
> ...
> I have to say I distrust locking like this and its racy.

Agreed on both, thanks for the test program. Given Gjorgji's streams API
series covers the shared CSIPHY/CSID case properly (refcounting the
shared upstream stream inside the CSID rather than in camss-video), I
would rather not respin this patch at all: I am going to test his
series on RB3 Gen2 with our two-camera setup and, if it covers the use
case, drop patches 6-8 from v2 and work on top of his series instead
(SC7280 enablement and whatever fixes come out of the testing). See my
reply on 7/8.

Hitesh
