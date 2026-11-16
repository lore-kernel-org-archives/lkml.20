Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794828607;
	b=MJRAximr/2DPw/O7xHnAGj7KsP9XGfgVEBVWdil0TAT7hBAmFpdEbq8odJi92kejISn1
	 4wSda1I+wgxBLNk3NoXZ7ZhzUza9l35iww95UfgEhTCMD/HRD/r/NX93QFr6AazuLPVwy
	 eHYI6EdasFpOgioBY1TNVPKaMi2HDJLthBqL5QN1G9DGK5nPzh9Ipdn3Xd1V9kcOCkQ7b
	 srgy7mn6UxigfySyJs6+4CcbR5lGUwBbVknDlT5y23EoN/P6FAPCPc9RA6yRp5U30vVAG
	 M+Hl2QltWwRrh8V8SRo8yUUXv8Cye5E3IGtfyAzVU5QUmm7Tmaby1rd2Pr8NEV1UHYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828607;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-EOPAttributedMessage:
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
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Reason;
	bh=pszfIBqKJ5cOlGB91M1o2+6uw052LAtKFmM3aAj1Mag=;
	b=2AxuGZw1cPypgsxFd58W4mAPpcLbiPUwyaXP06jve2Da3REsV/Ai5dsc+Ap1QD4Ekzvh
	 qc68XHF/+C6qR8qlzzDbG7UaNzfJWCoxaIaJaPdQai0spJMSDzqq84iKZA96RgprpPXDJ
	 QG7/Yj9O+YA9VeOLadnrr0lB+UHVhFkBYv6y0dYP4rRHCudG/QZUPWRB1eBvOvcC3qBp7
	 PTV7WJL+SxMBIjnMYSblJBI4oZWR0QGiDbl8/IuK1PxxM2aPGRQPZHpNDYj5RifaVriwm
	 rAIPuzUA+4ixMKWf894fcv7+s3T+xCvoGxf6wANBuVD/IxRbrmos8FisJbag8QAJiZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=YgnKBndM;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b="om/6KtJL";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB04606A7A7;
	Mon, 16 Nov 2026 11:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FB04606A7A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=YgnKBndM;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=om/6KtJL
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGAblxE1643381;
	Mon, 16 Nov 2026 05:29:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=pszfIBqKJ5cOlGB91M1o2+6uw052LAtKFmM3aAj1Mag=; b=
	YgnKBndMdhpx1pbR8ITVu0aNiiI7h6UdzQ6KgxHsxxtjwitIAf/1MLDm2zi9xQsD
	t8bMxV8oQ1zGJI3bhm3HyVeOR3CZCjQAPSL9SgEs98pzpiLPIunrABQYjmxJ+yPl
	BnuRQrF8tFvaIpK55i2EdoR3Qe6Lk+B8MGmFqKgeMwbU4DoFyyWtEV/qIFx3vpLW
	MWQyjUVN3UzYO6dE0xdKD6OSExnlpXX+n8EQBXD7vkZH4Huo5/ag3cVLpLiTDdzp
	L41VcPLRwGbBvY6qrJhYo7CkdjMvx0lj6XqzN/f9aM2+uQ2YVVeh4KWUfbwHgD61
	1iCc/AaghP2BaqSQAMHPgw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021143.outbound.protection.outlook.com [52.101.57.143])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hxnxej0gg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 05:29:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CiF8m7Sd5W6BogKqP7FSvCnd7l8Driyc/ASbJVW0tJIpy7Y0nTGIDfqGpOZPyC4Bx7DXI0xebm1KqT14HwqZdWbCzNegkI/ArTi/WYciF2gbBVKzFGtKfqtZXQuauPiBRs5HzxbSy6JrDxOoHZrlHshS69qkvG8e2AJ7UTQWiatrLHubzNrPInGO3YfaptmJ+DuvAhE7zb+NUFIs0D7ccXZCZdJSMnZvYRhm8Dti/XS3eG8IfId0SulJZJS4kU68NQjjPGezksHmg3Wm8peVrx2eGbz8NGezzUbT/Ayn+0ZVz8cvKuGw87Z9S/rA3EWTYkfC/wFhYEQsSww7UohGDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pszfIBqKJ5cOlGB91M1o2+6uw052LAtKFmM3aAj1Mag=;
 b=J2JoyMK02/f2LX66Se6bZbsgnOL0mDWVL4xN/3OCznJcCJBEuzG2FVoCbaqBN3B+clLV5WUIqX9xQ+LySAK+J9yj2trEb5lsPVVHYcQmhqr3WYT4Uo3aovBql3Qv71BFchOo/sJrqRwIzUFCwLPiUjThyoj7Q3d3Qa+8XdZiu13gbGVGQVOUcjbr+26qlCBTC6ZOLKMpU4sFg2+SpVbFDKn7gNURnbo+ju3mT2SQUosYnYk8m6JOKcuZRmcvHiylTfu53BOMkAoXd3PSjfKn8xrGiCzRwxb+G5XlpsSVUJvGVujRBKZTDr6gCnq4phCD8NXc9uC6vp1eYbPTOnz8dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pszfIBqKJ5cOlGB91M1o2+6uw052LAtKFmM3aAj1Mag=;
 b=om/6KtJLqSqkL2IJrvAfw/uRhPjDh8LSgCv0NGmuhXGA/5pUZ4qL6pSgIM4uxudp7jb9vwg3Ft590uO6Kb/TX9hslNpsK8dtwZIUhSbHyyYLa3czpJZG2zWrNYaOSYpHFWf2H/gbkLaiiaYFTC+cThT0WlRTXtT60f626aSYy1U=
Received: from CH2PR10CA0004.namprd10.prod.outlook.com (2603:10b6:610:4c::14)
 by CH2PR19MB3766.namprd19.prod.outlook.com (2603:10b6:610:a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 11:26:34 +0000
Received: from CH2PEPF00016D4C.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::8a) by CH2PR10CA0004.outlook.office365.com
 (2603:10b6:610:4c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Mon, 16
 Nov 2026 11:26:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00016D4C.mail.protection.outlook.com (10.167.244.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 16 Nov 2026 11:26:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 10CCC406541;
	Mon, 16 Nov 2026 11:26:33 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F0A3B820273;
	Mon, 16 Nov 2026 11:26:32 +0000 (UTC)
Message-ID: <575412a7-9f7d-47af-83b8-a0933b4c729a@opensource.cirrus.com>
Date: Mon, 16 Nov 2026 11:26:32 +0000
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
Subject: Re: [PATCH] ALSA: doc: cs35l56: Point to kernel.org firmware
 repository
To: Marek Vasut <marek.vasut@mailbox.org>, linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>, Jaroslav Kysela <perex@perex.cz>,
        Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260914031252.98932-1-marek.vasut+renesas@mailbox.org>
 <fd865483-1485-4042-b938-2012eaa65043@mailbox.org>
 <3b620222-ba1c-4c6c-a06b-2dd5fb391fb6@opensource.cirrus.com>
 <49f749ff-8d34-4806-bca7-403005600c0d@mailbox.org>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <49f749ff-8d34-4806-bca7-403005600c0d@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00016D4C:EE_|CH2PR19MB3766:EE_
X-MS-Office365-Filtering-Correlation-Id: 5803b889-ecd9-43aa-81f3-08df43d4787a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|61400799027|22082099003|18002099003|16102099003|4143699003|56012099006|11063799006|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	+79RTXi5cBcqbYaSDGNLY5lsEmu3Ofq4fLT0XCy51flZZhCsfEzGhRuQCkgpo3UHAuzC4sbAcGJF5YUY3ZP2b30U2JtC7Qu1M6DPssbNr2bpUTqMuDb7jJYkq76xjYjlXXkh2nhFKsC7TRJBJXKf1vAU4YUhsVZlj/awljJgAVCBQ3DfxEDzk+ONFxChKgiywjohic8qQMDfXf9JMxeEfweDXOrLsnMHwqwKSq4+OUxyWeoZDx5fjp68Qijst5zCx4BMYFjAJ92lvVxclLjqCcAI1/hUBKk9rlW/Y4zzGfr6tc8xkF7pHk5MnSWor/QWUw7UraewDdHNbSxfwyG/QYqtgI8Je6oOi4I5nm1G9L9Du59wpRSqXY67TcoxDPTAUjsIivV+0kqogt7qiqJFKlHGhMeP416vJHNarP5LdEPRD7HK1d2Ls8MQC+CRf6rR8rsP6xI6iMVkJnnvmnlRjLlTncH41xFTF1dbTj+qkWJbiuESEDPHlZjLD9qOpD+FXhOv96GBo3mzzLoxDzRZ22MPjI7ydpc9OSfrRxYfCqfeskl2iIFkJHarQzHcuxQ9GlHNYQ4UZ7hThc2klEgGqeTjV5anGTvnc4wksFXqhAShh31dsJu6Sn/SybB8eqKcDc941pDJ3YSsj5L2K84KAGLyt1WaWGqcpo++HLYdPVVBjOnuE2OEUUxiSLeotB5yoIIw4QqeRMZbMDKaPgaTFw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(61400799027)(22082099003)(18002099003)(16102099003)(4143699003)(56012099006)(11063799006)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hWYL43h0NbymD3KrIhw3N157YAgRBn+ogkNLHqF9LrRe7O1Dy0WB6PDUz4hHm4/csPh28i/kXTvgv3NZ0UDNW540h8ggM7v6hdWcjs/C6anK1PuAFHbr/K46vAZj/AxzaiKBrdAJc7aes/MkQzRXgX2DeqSw+YiKxPWnSocJ9CpzKoHSwYuZzcofTjxLFn4i+urGpdC/cmB5S+9dBd5N083lS6mCirZaAOloDu8gndzXVa0AqhBuYhT3znmmNbLeguBuNLWNzEAV+roR7JOkC9iRc7CR9TNkj9BM8SEvr3cexE44DrF61rpuzLgyCZS8UlFyWJZa4JzxVvLFCOezs6byxcl9YnFSMJYPOAfMbpfx5heqHgXhbs8WLkx9+o0RY5DcCoIA6ig7bnN1sCedsxWuvJB14DShrJvDM2nJLpUduKdJsqfrPTE3Ue27K8Tx
X-Exchange-RoutingPolicyChecked:
	YFMVvwZ3SjNKpV1RkWSfs/3/3ctm+Cr+Y4NLfxIQk0xk1as5VyXtqQr0ewY9pqYz5j8Zv7pprw+bbA22Zmf7v3cfrbM0s3DP/+rbzMau6O+4yRIQWQySEXaIsNeodS/VE76yN23dfpP4siH/AUN4X9ZdOlMJy1P0G0PWEF69q7Ei57Peh2cRfepMA4yO2xoueayEK74XuTiyj5P6vYSyB/+4q1duz8PCWj8adV5JxLiPOjvY1QZrPBY83D/vH6RffL+/BUkfNcGYCfN2sSFmIFTGmerr8Gtz3o08hiEpdHkrsCKFcBE8hOgDj8+X5/ulDsITF+ZIclAzwwK0KIc3KA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:26:34.0935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5803b889-ecd9-43aa-81f3-08df43d4787a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00016D4C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3766
X-Authority-Analysis: v=2.4 cv=KNbPn1Fo c=1 sm=1 tr=0 ts=6afae924 cx=c_pps
 a=pCScd9Md5F2Oib7HHR5gBQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=VwQbUJbxAAAA:8
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=b3CbU_ItAAAA:8 a=w1d2syhTAAAA:8 a=07d9gI8wAAAA:8 a=JfrnYn6hAAAA:8
 a=ag1SF4gXAAAA:8 a=iox4zFpeAAAA:8 a=AKw2qs2-w66Y8sInf28A:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=e2CUPOnPG4QKp8I52DXD:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: 2MJoONZXR_7DaoFhgacNeVyzJ92Z1CmB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfX35CDqPJz2haV
 4vK7OKyZxxU0nyI5f6f8juCjyU0Rm6NHmSr66R8LT7jbENp5LdfuKwzJHwkzUL2LpTvRRbXn47k
 xtMLw4zgcAPRPEv291R3gEb0iSYGBfJk/jsaS05c4RUUMT3RQlpz3dyL+GWWZmt2You7oM5TtSv
 /ZkWn6qKfpXmFGrO8RBHjqihojPdZxOmO+7Yt93nSmSD9Lg/11nuVTewNljQBseQn/4M63tRVpJ
 Myuaa1z+2rKLuG+UVGDzu0lY+2Q2XahijcHHZZGiUHpOGdP35sKwbHJZ0sBrXKmKAVpF89iUuwP
 J+NAnJD8aUeW0qoBZW8iY8IC6pUPM3Tbp1DLv+uFN2l4CcQOa301cno20Ekynu1AUc02Eun8obE
 MGeIgfQEL6moC98vcYsUIhuh7VmQW1906J9s6n34FCj1zaCDbt63vcPYAuncI484qWNywTZXOY5
 euJ9GyuioBjqbTvKGmw==
X-Proofpoint-GUID: 2MJoONZXR_7DaoFhgacNeVyzJ92Z1CmB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfX0sBCWOeTSRsN
 iBpIRYjzkQPkAevGNdGdRW86o47XWxrjl+oDbsOR9QHiVsAbWhZInZyxqigDFSxEjCSXMbriFxR
 GJjRTQvlX6MA3nOhOwRqM+gEKCXc5OI=
X-Proofpoint-Spam-Reason: safe

On 16/11/2026 10:57 am, Marek Vasut wrote:
> On 11/16/26 11:14 AM, Richard Fitzgerald wrote:
>> On 16/11/2026 9:22 am, Marek Vasut wrote:
>>> On 9/14/26 5:12 AM, Marek Vasut wrote:
>>>> Use the primary mirror of linux-firmware at kernel.org.
>>>> No functional change.
>>>>
>>>> Fixes: 088fb4ee17fc ("ALSA: doc: cs35l56: Add information about 
>>>> Cirrus Logic CS35L54/56/57")
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>> ---
>>>> Cc: David Rhodes <david.rhodes@cirrus.com>
>>>> Cc: Jaroslav Kysela <perex@perex.cz>
>>>> Cc: Jonathan Corbet <corbet@lwn.net>
>>>> Cc: Randy Dunlap <rdunlap@infradead.org>
>>>> Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
>>>> Cc: Shuah Khan <skhan@linuxfoundation.org>
>>>> Cc: Takashi Iwai <tiwai@suse.com>
>> ...
>>
>>
>>> Is there anything left over to do with this change ?
>> You should send patches To: a maintainter if you want them to merge it.
>> They are not guaranteed to see it if you only CC them.
> 
> Who is the maintainer in this case ?
> 
> I used the get_maintainer.pl script which should have done the right thing.

You have the correct people but you sent it to them CC: instead of TO:
Takashi would be the best person for this.
