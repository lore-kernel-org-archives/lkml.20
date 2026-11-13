Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794589320;
	b=pt3ZBC/NLHdsSTjCZbdGIr3k81sOsobp104QvBow7kaJ0WktzEuKRoGdkFigQ8SHOMAY
	 fe5BEKK+ov0p2tv06wUxck12Myri0/0vqo8I5ceVulwLph67L+T35h4o5eJWY0pDckmZo
	 NLoNvilsYWmHeVu+eNRyIEv65bEIuQEm0sLpyy97jR8z2+bLeGs4rF1B/3TGIjq2HodW6
	 5ofTb3iLaXZesLNqrwj//KlvgAz6U2LIKSFGh6Axe/JyA1At7qPR2Pkz6n36I57PgtY+W
	 AF4bJ7BDwNmZMXOD8w4iJ9GxmrStZnVC8I9zIEUwHghlUp4bc0VbMpmH7zQ5Hu4fP9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589320;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=kS/U4SqcBIIO9rx5Z+/ZEX/OpNsUqToCQkBMh+G5gqw=;
	b=Y+gMa8fCoodMbfRiMIqoo+uZyx6KapCA5GZYsvsdN8lh9+/7juOVENui22m2pjJXQ6zJ
	 BTYApEk5thGWcwZVTleXyDNQL7dGwIEDADhAmW9ORkVWFDFo8HiRQZcq8GCUSLs8yHztU
	 Mo2NtOzulWclrsnZ4KYb33O5YpzYcECqZGEo3LDVygOYGsQErzyT68ewqNgR8/KlkSZld
	 RSzvndbUU0fW3PC0Y8gpFs0Wi6IVuliyrHluFTF0CWKhlbA/7bumdHWkseBoEXEZ1zLiM
	 QyHZE2uzO1nMQbmRMmSr3CwpTqwtsDJclmNlcjTtAUWFv/3g+7/edisogMlDg1XkSHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=nlnd7LTy;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b="g/bQRIbu";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E12606A334;
	Fri, 13 Nov 2026 17:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04E12606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=nlnd7LTy;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=g/bQRIbu
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFsn3b589497;
	Fri, 13 Nov 2026 11:01:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=kS/U4SqcBIIO9rx5Z+
	/ZEX/OpNsUqToCQkBMh+G5gqw=; b=nlnd7LTy7cP8zsqi8e1bgaV+w1svSBmfbX
	1GZGRfJwBiXysnnKd3ix9mvxyCnB91vs1orqvZd7noP4oFzKmj0F6GADXN0UAJA8
	6RxKrI+77X+6lQKOw/q1iUo60o9BTKVXFoJsgN9+sSFMYb6/d/pePCYXNynnPvEO
	ThExyFqTWKSQPfk6ryopDQhwfMKyDnkVwd6IgXGO0Io3SLyv66i5bViM5iuXzxGq
	qOtPfIEx+Xd8zKaBNkqu4Yjiv3q8lE4ChmkOrF7+2ZhqwiwSRX+74U7aTVz3ZOCN
	O8gKxbP1xf8M5t/LKN8k8Dp+zPlXdWMWhls28x9IcM3ndhrgyC5g==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020085.outbound.protection.outlook.com [52.101.85.85])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hwcfpj730-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 11:01:52 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBWRcllL01/z4UNBq+mqu5cfOYpXP+HbXuq1L2NMAwj0dBjBc4nTzh94+qJ3BqiPONxv1MqhfmcNQSvb4tlVO6CxUI5iPvpmkVjDT3aPChsnCW6r+Upq0tlkCxUrvoN0jE6s9rafM34uI+WhGD2DKDtDnWhekrOgqumvsFUbiTfPhx46IxZdx30HnUUJebHdWw4LgLsLlFfdmxHlvXBYs/JETbpYD2FA4sKdaPxNc7OISJHm3lu9qixu3YZKD+KWIuRsc1u0HUwvUS4+c+5MuqYadc1jD/uzYxRUC2IHRFDto1DmHgt/9gJhm5dd6P9t5pVGCkn9MPKy3ruas7Jkdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kS/U4SqcBIIO9rx5Z+/ZEX/OpNsUqToCQkBMh+G5gqw=;
 b=nTo19kwppgIWvoy+paQMR3eApXM8VT+k0uS9BCdW/CcVZCtWvRwhpNYWKmb2cbHe3uNg48ns1r1TtgcCnH6sPc6spCZjpUSm77+m9euN9OwQ3tYN4S/S+ehVQMdPDD65wngm3wckQK9A3y/u6PVyrJ7xhK4lcUtBzRcdgyXKYwQfUtNxxBrnHoCRCa6wIzvNBtcdgDQpDb71HjQy2Dykt5UhKEbZinS6apLYjEHEW3AmuIJNGc8eVqOSTzeZxZDG6G+RPxWzCLFRFw95dy4TEoAD1sB8BNeMFBTZz62glIRBc3fTHzp+khyEqO/XquVxmGnmi3E8vlpxppVpQREAMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kS/U4SqcBIIO9rx5Z+/ZEX/OpNsUqToCQkBMh+G5gqw=;
 b=g/bQRIbuJK5JY/npsoS+t+P2iutBrfLzI/XvDft6odtVwVQxBjHz7vXtFmwEtDQRd5+7DqT9bG0w0P6v/ggY0xRf6PHDx/ref6jIiVURSyIElD7Sro1AE8wLGi0F3Kj4EgpLdlbOyhoUVGqoH6wGgD1TOex3Ik72a4ATKey8v58=
Received: from SJ2PR07CA0014.namprd07.prod.outlook.com (2603:10b6:a03:505::7)
 by CY8PR19MB7275.namprd19.prod.outlook.com (2603:10b6:930:9b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 16:53:50 +0000
Received: from SJ1PEPF000037AF.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::92) by SJ2PR07CA0014.outlook.office365.com
 (2603:10b6:a03:505::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 16:53:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000037AF.mail.protection.outlook.com (10.167.244.187) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 13 Nov 2026 16:53:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F26CD406559;
	Fri, 13 Nov 2026 16:53:47 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DE4C1820273;
	Fri, 13 Nov 2026 16:53:47 +0000 (UTC)
Date: Fri, 13 Nov 2026 16:53:46 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/10] soundwire: stream: Prevent m_rt_count underflow
 in sdw_stream_remove_master()
Message-ID: <avdAmj5dWyHjcNGy@opensource.cirrus.com>
References: <20261103095445.81414-1-lee@kernel.org>
 <20261103095445.81414-4-lee@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103095445.81414-4-lee@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AF:EE_|CY8PR19MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e0bc689-a092-47f4-8d0c-08df41a6b0b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700016|23010399003|22082099003|18002099003|16102099003|3023799007|56012099006|11063799006|4143699003|261028144727099003|261026121527099003|261022105027099003|261009223027099003|10067099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	2X0XQeWNf1ZuN06Ygiek/4dh0/+oReBs5XrxVnB1hWhgDgn2XB7mJk+xPeLdQvmvcUuGDIeqjeQQIW0CBFF9qcxD0EdfybkrfXAcvkWorsso9ZghaZds9q/ZeO3O5h5SThxVePYEbUMz/QDMeWu6NID+OXUF04MkjP+592dovLbUSwkOZqfviDjUsAaCNub4/FJekQU1U2TO+X7w1HiXeDqVDcbISqyWV8w1oWKqiHTa5rdvtP67jyOV5RAdjdueawxVCgFjuaPtK5semmVECgGmAeQnsj103qAC/Ob5EqWcITvJSTWmDhiqdjEio3i0/UJo+nIJgh7d3ArAizfz3K3Dxd9zF0drQ08nKr2+fhdg4MNXNQfP9iWun33drUVFEqfdNlCnLo7xMuq6IiG8LBZv57f0JJsvWLBgpjpaAXtcY3dk3sSIM/i+n1QntAX08qFq4ZG6Zdbgw86bUNTfXG5EYaZ+THq9hevxnD+zSqFPZbtvAqWGX4pFxShtYtipZ+ncOVICaUKRE3eUTCjLDK1VooeudCDFptpveISYrgc5lgA0+HIJmtZpCIhN7tMRR3DB/Ow40hab1mIo+p+/5Yvz/ugyeeovqrk42j8AIrt3MAsKmvBo2wC5rEI8czPm4z3xr/4n6J0ZieoKPMLI2g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700016)(23010399003)(22082099003)(18002099003)(16102099003)(3023799007)(56012099006)(11063799006)(4143699003)(261028144727099003)(261026121527099003)(261022105027099003)(261009223027099003)(10067099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5ItxAI9dp5LrkLKvDpqL2OVViDzYjWDfbgHNaDJXbW9Fn6pSAWd5u6v8fbZYxb1PF2SD+/rwPpaHUlePnf0yObXqYN1Fj1oRMZv5UN+2N6jc5/imsz/DT8WVkz6nR+oIQv8Ld9qN65Qw6kP4FKT2zkH7q7IPuoauybD1LfQY2w8gN1zSQkim0znhfP2wheEnmPDft/x6L/wJXW6ydIRaMYZ+VICOP8ubZJWgWUzoXHPu6OALthGvHvdxO52F/JBxnxawDgtGUMhiK5Qni9rPpo+PdKpbSiI8vpTzqShwX3u9cVEDME4392cgCfTl2FjnbdmveGR3gBArEeG/EJvQxd4fq8B4rlfdjsWujjHdO4IpSeKV+TnIsp9muIjyywvgRR3fekbRV4mNo0GTMO6AIcnXa4t73NXrMJ0aH9wCNecdqZcqYpSFNvkrv2kpFINE
X-Exchange-RoutingPolicyChecked:
	pTvMlfHVvkM5X+FsoAaHqQzUHwhvHLXLvy4SYzzjgeu1/9C7k8o74Js/BOZd256aSZccvdxr9AiWxBfpHYVNqhslZG5gOaDpta3syOkhuW4TGmY6yg5UByYszy+NJpmEu/NXQL5m3XuYdz1VtEwdB2eepr3EgL8rOpOR/HuMnCnTrp3nTfSZdsqDn1RtFamoucZtOIzDx8/ELxjqQPR1VD27Mm5u+xDygGXrMGlffUTzKfBcHzOOnDGeMYLHcOOaTXsSVkyt/57YsrtFC3Hb5umiZBTtT0UEHmwmFvH4eNNiG7TQoBGl6iKBNUNRw0VAPr7PHyoIGLhQcLTk5DFBLg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 16:53:49.2055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0bc689-a092-47f4-8d0c-08df41a6b0b9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000037AF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7275
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2NyBTYWx0ZWRfX3hSeFiAKQmL3
 iwG5Xd346XElBT5WLhEYU5SAnPKdRnNWtaNDAhzrfdrIuHZTurGLlQN31iHgFvIvwJcHdcPXlUz
 s7DeDv7Ju9Odj5OmKmz7y+ry4+PzU/svWrWxxUUrVE493QVxi9UOSFyoLMFbG2jQ/tPZ0CCo4O/
 a1BW0bd5m/jUccsZed/v6bV15XUQ4Hj43lTEsnZTjJXtr8Wu+oUR6/2fo/ewVbjjRMlggYCVqW+
 UDoshZrRDX53CGlsrRKDl6/6gkK9qKHyvGRc2KVQRjS9Q56qIA44n/9R0r8tNUyv7/J2PQkAHDR
 hILzkrW6bPGrlPnpmvDw3aK+eFcDvbOppcOomBjfsEUE9tu+kbQJhON1QYMM5GIv/K32WuDwOiD
 3UbKxxx4m2hWRp0+o6sofh5KfRJ1xu/BY3B21vkIQPzX1hv6mevQEqpWwzfCXGJqUKiXtET8V/d
 t9wGG1dy+LIiGPkLLfQ==
X-Proofpoint-GUID: 2hGOkA1ca2_P0dgPYpMoMqKETDf7wyhk
X-Proofpoint-ORIG-GUID: 2hGOkA1ca2_P0dgPYpMoMqKETDf7wyhk
X-Authority-Analysis: v=2.4 cv=Woi+otfv c=1 sm=1 tr=0 ts=6af74280 cx=c_pps
 a=WcQbdmje/HnKHP6F6rQghg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=sRb2ISfdXO_hjJ1XLuEA:9
 a=CjuIK1q_8ugA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2NyBTYWx0ZWRfXyuEzKAXWteZw
 +pSexJU3ItZXDuBXVqbE/Wl2ruLnTocnNWL4d3P4wbJvTurwjkEoBM+g9+NyGKOWFF/SoB5S4ha
 meMusm7PuztpBiukuiX4wTqfDQKnvpM=
X-Proofpoint-Spam-Reason: safe

On Tue, Nov 03, 2026 at 09:53:47AM +0000, Lee Jones wrote:
> stream->m_rt_count is incremented in sdw_stream_add_master() after
> sdw_master_port_alloc() succeeds.  However, sdw_stream_add_slave() can
> allocate a master runtime without allocating master ports, and
> sdw_master_port_alloc() can fail after partially populating
> m_rt->port_list.  When sdw_stream_remove_master() subsequently tears
> down the stream, it unconditionally decrements stream->m_rt_count,
> underflowing the counter when master ports were never allocated.
> 
> Free any partially allocated master ports on allocation failure in
> sdw_master_port_alloc(), and only increment and decrement
> stream->m_rt_count when master ports are allocated.
> 
> Closes: https://sashiko.dev/#/bug/linux-bce288e6-c97f-46dd-9fc3-023c33d56f36
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
