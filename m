Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793715555;
	b=H46IABehbjd+5gHDXW8QDebTO1tlYpHJttbvyt31jGir+nVwP2EFgzcI2UjSPLCm47uq
	 ip4HjBC6zdDzs/oHGnmBGoLB0VlBKtQ64wHgfP1kaava4/kuu2Mo6kLfE6ukmLqPgnnjP
	 R9yhi6l51te21IKzmzrL3UhUOKs8EmlhaOoLMW9Il3nwgS1sWEa68RxTaxarB0AamauSC
	 T32u812Zgw51zHtykmO0cy2l2duzGSVE8YFTmy1VVevSK0nZm6JB7KeAuAulJb4ZKyf07
	 OzoqGlNYanylEcCqu7f3d8gfTX7UmIwLAp/pkFUQx3WOb7oWGs/mgiQPtkbLV9+jaTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715555;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=w+1jNDWgTV+R1E30OYiVsCItO9Oi48qxA46cuYCzD3c=;
	b=r+t7rbXWySNbnNQpUVR3pzHXmbxQhqq7hIVXLL8wZ+YFcm5PSVtXtfubNg2hY5IIcegc
	 zNKQCZLk5DzFajNDcCMZkUanPBm5N7dlLvHEyrSSYuIHlzeHpiJZ4Ne6v3HG3ooVWi/3u
	 uX8IFAHMIb65JS/Fq6DSjXzlkKALi6nUcVXhDaqTFHRfzrON+U4CqOEwUWaz2A4SHN8Js
	 QS6LxgdPVVdZfrS5athsXCciwF58VNhr2BP5oXppZdO86Q3wnvTBY0ZUpY+LmHxaWIFjT
	 47Ct82ogd0QMd19I5WYLzCI230njknCXWefFKrmFn9FXdOGVgHh6gG0ImiFIuinvsiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Qvhll2YP;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=AY2tcuBO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B2D606D81A;
	Tue,  3 Nov 2026 14:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4B2D606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Qvhll2YP;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=AY2tcuBO
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E5NQw1103002;
	Tue, 3 Nov 2026 08:19:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=w+1jNDWgTV+R1E30OYiVsCItO9Oi48qxA46cuYCzD3c=; b=
	Qvhll2YPTooYBemvBWRBB1kykuUM/Z+uI9+4KX8I5LxgYa7A8Ebnt8UN5nIQ3ghc
	w/v/286N8Smz8FK4c8Nz8FYzL0x8LqVErunkdnvu7ugPnsqaDp3RQolSLtIaSw/x
	TcZYiAUrRstNV+WnrW9G3ut1qd6ClRrz/oEOxT1mC9zWIZ9wk8N8Dt6x6pea79DG
	guMCtBzXqQP9Pw34risM+zeVTOYz08rEW9v7DuVya29nAlh4qbIQDM6O7ao/ifr3
	plxbzyv36bj0SMurJocE4RT76Ejt6nvU+qSFOQSAFUkx81neKjFEku280+cI73bj
	+lG3MGsWZVAZy2YFGr5bpA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021135.outbound.protection.outlook.com [40.107.208.135])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hncrfuu60-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 08:19:10 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlkYrsBjrV/zQFROM3aMAEy4FDJKemg8tJNo677mtOyvUpxcwyjrxoeHMCEtqspSP1qSEgHO+2ld+u7PfI3ZIYwGNhDTLS7SsP0e4UIpw3sloRONZUg4/KPw2lAo5+b9dTnDqjR03Z5NdKowaPmKMdcB8ZbYTmjxiKSsdpGHe11fvckE1h3g+z2Vy1jdNal6GZp5w/iSsbUsEPCNMZHwXb19t86XO+2aRbnkGJPCPYfnH8mojKmEwwAQuFHcMNlawETQvpYETkB/iQJaUrTU3buy8stHjnQytKT08f977ByjPcMKSycgpm1DVV+Fdq0DBz0fNVTcluomQR5PqOOkKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+1jNDWgTV+R1E30OYiVsCItO9Oi48qxA46cuYCzD3c=;
 b=jLBErNhqnHwMxdpwSStaAin0I9aHfarZF8qdbXdtDP1piEf87geQZufZXV617hH6AQz/YbH0634CxHzy+yhZu6ufOd05NLQFSeLG+u/nKJ6J5lL3ihNCvq3dK7K3plJOEEzEPNJCJO5T1sNbLVN83rySFF+Xe+ChnUwWG3H9qCsP97fCzJAIUlhMDDr3Sq/tnRWsindhFdz4JMRO7nyg1k5wkwG/T2vxNtmj7AYi9rlqstXcmfqGIkkTfYzSvz+sq9VoD+rZPuGxZbOcgODu9C5RKW7HKjGdrhh62Ghjw0bB3dXGCIZdGelHH3kHCMV/zu1qHvLEKFHhtEc3w0ZuNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+1jNDWgTV+R1E30OYiVsCItO9Oi48qxA46cuYCzD3c=;
 b=AY2tcuBOkmt3JeJJQkx197vDZCIgg0MdSf9OcqFUYxXhJ8ti2pa7GhCnxAY8II0mMfqkzFpXKPgglTXFLeBsESyW4pi7D6VpJfnVykEcDLq3JkdGyePFWTwmmfbW0oQoTYs+f8nTsjIcs75TZPKvAZtrlph/R2CjdLQmjEs0FMY=
Received: from BLAPR03CA0096.namprd03.prod.outlook.com (2603:10b6:208:32a::11)
 by DS7PR19MB8832.namprd19.prod.outlook.com (2603:10b6:8:251::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 14:19:06 +0000
Received: from LV8PEPF00000065.namprd03.prod.outlook.com
 (2603:10b6:208:32a:cafe::3) by BLAPR03CA0096.outlook.office365.com
 (2603:10b6:208:32a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Tue, 3
 Nov 2026 14:19:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 LV8PEPF00000065.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Tue, 3 Nov 2026 14:19:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0157D40654B;
	Tue,  3 Nov 2026 14:19:04 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D6167822540;
	Tue,  3 Nov 2026 14:19:03 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 1/3] ASoC: cs42l43: Improve analogue mic pop performance
Date: Tue,  3 Nov 2026 14:18:55 +0000
Message-ID: <20261103141857.672537-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103141857.672537-1-ckeepax@opensource.cirrus.com>
References: <20261103141857.672537-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: LV8PEPF00000065:EE_|DS7PR19MB8832:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a044d7eb-3e04-484e-b03d-08df39b56aa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|376014|23010399003|18002099003|16102099003|22082099003|10067099003|56012099006|261102123227099003|261009223027099003|261021121427099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Q4UD82Sv0mIJSDcsY/fZI2o4LwM8L9OfjZ7zOqd21Y+z5bQ4Gt/I4eTOFuzZf2cRRoySUzSTcWRamBTAV0doI7tyTOBOLKpUG5QohnnTZqlmAjF7lLbdPL+rSUrPwjmRtMTNyUKjgKzX3vjBOrplCvwRP7l7cD5aiDMmk7rRuasqF67TJ6asiXKwM9G5FNrBhff21/6E7CYuCrR58QBqUHTEYvBU2uI8umfOtoyj22fxM48In7jpyxZV2cEO8H/SgPMzUtJjSCtKE7UOgNh1E5RrUlsEshb4wOHewx0aZXySMSDaQcOBeH91P2Ftz86x4+IVu7w4EzQoPswgPIZleeFKezjW17qWGdnaTkC8jatMa4lo02MLQ4rORKlIJLxiXZD3nB04sGpQ2w0c+4HTVn7o2/fMqztF9K5JFKtvMotySKACY4MEb8ObXq2vh5+rCfqrXxKVbYA4JV5ROfbM0juTrtHDSwVo4LUeIG1MRmm5TUWfChjfL/iHvZhSywPNf7xeMcz2wvHGgIZLDmPgwT0cxyCFASImgTjsqDG4X7xtaHuf5mv939A+MnI3Qd1wcl18qRuuDlikTXit4RobjusrgwdAZt7UjBh+5C81dBMAr+MKK9j0JmXiD+KqXDPj4vosK8EiH7VD3AfFQS1ujv7terJaBDKxT+wwBj5t88944QfSJZ5stqJJ0zdQ5lB7+1BXHVkzmbEuhE5YOWU6bw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(376014)(23010399003)(18002099003)(16102099003)(22082099003)(10067099003)(56012099006)(261102123227099003)(261009223027099003)(261021121427099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	38ALSUAQUBWOWbN1WCc44CeXgu3GAT2P1bkzZBOi9dizp3iSK88A1xedmmNFBb8hisj8bJBkKm+LnO8oavj04gzw9+aH08PBdHy0+14qKDqrMjdA9ufu3i1E9WLrZ580YuOvsrEwhf0Yoestq/DNcS67YvRzr5iS9+P3HgqR8fNuR2Vf5JKG55Lt5IpR1CmwXfvprC1U3Qj6WQDqSazqiNGjAPtabuSDjmmd5pMo17uBuTcVXn6grrc1X4ayYLKRdVaD6i0Ji+huZrs582muJTDsz0SblCsLA91V+DwxVTJfPro/m7+x47VCO+X2oeUkeqHBgGXUEQW8aevkyhrF3SoM8urjBzwyxaugTHz7QNtzNS7pgH46Ys+MktvPxsinCjimNazo+e//FShXShbYy5MegDSidGC04nq9mmcXdkl50+wpJp6NI/i3vjBnMizb
X-Exchange-RoutingPolicyChecked:
	oIruyDOut5deewQyFGlyppbJuv5VsR35DiVcbxQ+anjCROU+RWmktWYndYRN46mAkHLHoe1QJEaQF39uaq3KFN5UjsNtJV6NpqY71EB9UbUVXRAo+aLzUoi9NMxwu4tdfXwzAEs09iPbQ7JHJUnQLYF5zB8AHSQJAgUKkC1nhQaeKb3ZX2CfE9DOCQKo0Gcvo6HdpGe33J54P5sNPo9dKtXkyIdLNtKZTU54Gfm7oDYZ/Rc+rE7fkYARWMH1TJM3f+SUvbyyVeL4qfxtN21Dlcx5WUj57ZNAWQ2TscmqTOr3LA7t5IWLxNEOQFFpf42O85AGpYoxZxJPBaYB0jscsQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 14:19:04.8739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a044d7eb-3e04-484e-b03d-08df39b56aa3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-LV8PEPF00000065.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB8832
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX1Q8AwJ9SE5YG
 qpe/n2n9uJ99RF3Cuu8YcXYlh4Y4+lv1UddNkvJTpLSTaPfJbFtW4bu+xtdW1AkYwg0wc08w1PT
 P/lm06YOOl0q0dVSJZ3XDdyYy73C9HGUL4uVxIAd9GCMW9ZJ0Z6r7FGGsbI1D3gHIucD+E9ffzx
 uIBP85ApE+UHNvNyUgfF6evZRBh3cLjnePEuX1fYFuHnLTiP5Z4JNbOiOwA3Vf/EDsfMt/smhzB
 LU6ADubmIgxA7AEoKskbcBnPJ0O0bgWMG6y+u1RFwajtkV56+QsigKLaRhsbKttzUgV3t8CkLvP
 iK2hYXPmJ0TlR4K3u/P+gmQJvt5ZJJfFBcJwxruUIvS3SpRytAwvP7wgZQpwqOnrQ6QnOOfhD71
 vKvutJMA2mhpAv5X1nkspok8CKy3UElIOviQ6mkJ8zBqwrwUAYZ7kJMkbn8Y6nOBTzfB6enPtUR
 Vg6z9plMQ4ngU/w4GUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX7ECu00pReJ3m
 pCd0QPvHA0HVeO8Zzl7jWiHYD6Pk7rm6zzMUvfA/hZOY+71ouaPKtrRVAr5agUmtaojQmTBVRps
 p8nld/Dv89//zcSH9C5CGgrUcjHVUYM=
X-Authority-Analysis: v=2.4 cv=LtgHWXdc c=1 sm=1 tr=0 ts=6ae9ed5f cx=c_pps
 a=49tiPNKudA41XY8u0CHlaQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22 a=w1d2syhTAAAA:8
 a=Kzb5pRUq5U0WMVXxPpEA:9
X-Proofpoint-GUID: MtzHqZ34TiLKPfTAiQaWLCLryheIkIh9
X-Proofpoint-ORIG-GUID: MtzHqZ34TiLKPfTAiQaWLCLryheIkIh9
X-Proofpoint-Spam-Reason: safe

Enable the quick charge feature of the micbias to ensure the bias is
more likely to be up to voltage before the recording starts. This
greatly improves the startup pop of the analogue microphones.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/codecs/cs42l43.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index b6238f89c789c..90c83bb33d69b 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2822,6 +2822,10 @@ static int cs42l43_codec_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_pm;
 
+	// Enable quick charge to improve analogue microphone startup
+	regmap_update_bits(cs42l43->regmap, CS42L43_ADC_B_CTRL1, 0x20, 0x20);
+	regmap_update_bits(cs42l43->regmap, CS42L43_ADC_B_CTRL2, 0x20, 0x20);
+
 	for (i = 0; i < ARRAY_SIZE(cs42l43_irqs); i++) {
 		ret = cs42l43_request_irq(priv, cs42l43_irqs[i].name,
 					  cs42l43_irqs[i].irq,
-- 
2.47.3

