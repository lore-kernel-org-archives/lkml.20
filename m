Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794839097;
	b=fXkqescBpwRyClGOGQogJehDUfQ5lntC4BrMQ+p+KZNP5N6Wbb9r17oKQO/1lxKjb4p8
	 s+y6w5oCCdBFHLTlR810q18GtjMkAjG0hZvXTocZtS0VPs8P4OyEmrBeblYKcWuJrPsxv
	 TVtGjCrmxG0c6ISNwOKg7kUnxcF7i4ghPGtrxrG/AMc01v1OCzWGuBmgZPb9X0AtLv1Fk
	 KAqhJ6n14n44h9QhDBQIfhv1+qg1YJNCbVxdCMHp8MUx364arX+hoTtCB0YOIJCacYQvv
	 1nunpp0FbY5Q+Mf9cV3DSYBvFqX55Y8Wb0ExTPpYa62YY1PbsFP9Y5o4JXqkIp8nj+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839097;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=fnREEuyV5QaoU5mKWdJE2Q+/uazTMor3uBvoYz78gSc=;
	b=aXtF09JeNrGGrjKodLJQfL3U5UWSBopLky4ss3YJRXfSu2JRSrd4FiqnXn8udX1M0sLq
	 TeaxTbnZIMrkV77JfW17XfGW1/2z6tfjcRmNPgATev5WqeWzLzilfQfk+RprfJeVCXbnD
	 Z2WFD3+021SsFZxoHp61gqLC7wAV8gj3VF+ZXEqDV0VoPIVQLMkBrdttoyXqTKNWP9ka+
	 tW/3BAcbv3CoOOIkoxXGkDbNtzdi87yGByr8MuldcK6maWMXxuBlEoGrr23hh6mFfk+eQ
	 t7ZlJMmXg3VD3sTsWakaNAjE8Tz7TGrXOEqNAVQJdOj858RQlOMgdYjxdlDRUsXNv2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=aJJb2EJ5;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=pI3uaQAd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3F1606A330;
	Mon, 16 Nov 2026 14:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C3F1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=aJJb2EJ5;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=pI3uaQAd
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGCFHXZ1801104;
	Mon, 16 Nov 2026 08:24:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=fnREEuyV5QaoU5mK
	WdJE2Q+/uazTMor3uBvoYz78gSc=; b=aJJb2EJ5k7IgeytrSIA4TtTuKJEzhAx5
	07HYgAKxnbwzIMusI92sitxnt9D7FeewzQb3hrHJfZxYoYWbJ4XBnG3ogpCG8M1M
	mwRUtrnTnwYLJIjVBjGKBgzwpP9rlXhgBmtRQUfz2UWnc1dCT5p49jEa1E8nvRly
	GQ8clM9116SV7geAci33Gh01xnXXVMSeXBxTsi+XqTY1OZK+JTcxeZK4GE+vN7t0
	tAUuJGY4Ip/N+I1SmSfD1CCedjuIWad/dRHLUxbGJc+XKDf48g7Rv5CFoUUb+y4e
	XHWnZ8KoMtXAiS233bqrwFsmGFjQJGx0GnPZNFS0v065w/PgLVL2wQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022096.outbound.protection.outlook.com [52.101.53.96])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hxnxej90f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 08:24:25 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNqC9UC+ytwCffFVzgVe934JsoA3KWZYkQ6UPuGZcniHE75n5hbzF2hqMbpV7/LPtdeHMricNCg8cLyG2n/KxXrhiLI659lXLdulRdMOtayq87iKT2d7MnaitCAiRpavI1ILo5UqSuIVNG4yFAxKSdjiXOvsFE/TpDtqSQgF5I8dj6CDWh1qNlYxyM0yuqQYefpHUImAXxS3sIu1UiApta6RdYaYQhTCRdYRXA5WCA8F+F41q7MPdd79L+XrhyEUKoFug5NhOUEsWkwyiynhJN+uIdBWmyoHnMnYcMqtAZgm85fMdHsJ/004d5PoyeY6KYnzJD757ETH7buKqoDvNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnREEuyV5QaoU5mKWdJE2Q+/uazTMor3uBvoYz78gSc=;
 b=uINFhvgIS+L+v64MMjxIWf7qNKrBJ1iGpnQn9ZIFt0EtiQY4TpUsveJ4kR7QJxDMli7sfWU+wpOC6gwhaDxB07rYfsndweqLcJNxfDOvK+q89wdpUoXxuR38L2XjfKrOItaY5fZrllLkjojrgGdY524qcVPnMCMCX4yX6o27CO46F2+DhkE5cka83YQlhtknDldnplrr6pW6rGw50DjDO/ZUbe1V4jQtpuUkv3x6Gih6/EHvKzhCkeKqzisKU84zaOyeKNuUMRVLvFk4GPut5P3tmkhUydJNYNIOH2GiGXJzni8Ay7fQJLohyA4wtF25POJxV0wBxZ6KTf+L8sCxGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnREEuyV5QaoU5mKWdJE2Q+/uazTMor3uBvoYz78gSc=;
 b=pI3uaQAdqqyOFWZhfWIquZQ/BLDhhXeNSlJLDBjkKQuqELkpV++TpXSmLMgAjr2Wsf55TzLcZfWZvO4/DGqagohe8P+MTQXr7tqv6vEmiSlUslOKUPl1mLDA8AfVVZKT8Ng1O2Nnfx5tFCgLlPFNvRKJdiSqV2SnJuqmPvbDXUg=
Received: from MW4PR03CA0359.namprd03.prod.outlook.com (2603:10b6:303:dc::34)
 by SJ0PR19MB4812.namprd19.prod.outlook.com (2603:10b6:a03:2ca::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 14:23:20 +0000
Received: from MWH0EPF000DD311.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::40) by MW4PR03CA0359.outlook.office365.com
 (2603:10b6:303:dc::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 14:23:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000DD311.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Mon, 16 Nov 2026 14:23:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 27F8F406541;
	Mon, 16 Nov 2026 14:23:18 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 16F0B820273;
	Mon, 16 Nov 2026 14:23:18 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, ben.dooks@codethink.co.uk,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2] ASoC: SDCA: fix __leXX types in find_sdca_control_range
Date: Mon, 16 Nov 2026 14:23:14 +0000
Message-ID: <20261116142314.3702643-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000DD311:EE_|SJ0PR19MB4812:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0be323ea-33e5-4150-b11c-08df43ed29de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|61400799027|376014|23010399003|36860700016|82310400026|10067099003|11063799006|56012099006|261026121527099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|16102099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
 sPqiXcj5yEPK5XJ4KRjDe7GshrkPMStXPuauoI3TJ83VeMakTB145tWATmE8M3JHwHqiTXFP5/uJLvbOQU73wbh3RfgOSHSbmfU0T4aZhz+/VjoosBVS1Wpvw1bVjpS+uKnUwcP/bq70pPQtDV79cCsggpUPlTJ16q/XYW22VQXg5o3vGZnFJYs/OG3dokVcARK0CFleArxbxjPNlp4sl/GhHwe1j/7CY8A0qQYYs84gEXvvbsXqtvYeB8kk88IF0wII4kbIejlQ/T/PkfUsgPX+KmtgrlChpJFX8QgjGFt0QL8eleU/LTXLhjNe2u1KIqw7PZuF9HuP3/uzNCHfwhKXJRHMuT1AwiaFovvEYIIVowndqLQ9ztHpiN/ghIQoj6RQFuvDEVGsDqU8wHn1SbAZnPk7vZ6NwJjx7xnpZAVsLlBr4/31GpitjCtkqgzJXbcKFYxWQjrds+FrlSdMzdr3JITBPwvFFSUz15yRj/Xm6jCBwOfGw+iZjeEl2r/pIN3naW+7ZJePOsHz0VFpWkShjV3+orDwWWmMOZ/LNgtrwEjzQf83pTG+DV5m3RGiF1mCPPVpVQNbSlEigs9DCkMpvGcoYxNVapdKMdq2jke3C6D6nvYbnEa59hCuXiqtMMa/gUqR3yPCDgP8XsZr902yqmteDzfqu90bgY7jxUEtmP2iuRU2IbmsyB61MFLLRWnm6O0rOOv8vBQobS4Nzw==
X-Forefront-Antispam-Report:
 CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(23010399003)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(16102099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 XDzGz3VqP1/lvNSAI/30jv9vV7/GAqLXxivk6ktgfGoQDqUSsIydv588vxWZZaPPimNrhjcnXIojEILwWqgPrIWu4STuYQ5TZf3Ugm1jIm8pzMOMpe6ytcKc9FiZHargdd1vkdsQeDimvHIlnIuGRqmukAVXiOgLx50mi9cFU+OIZxFGgu5F0WDIklTFrtPzW0WE+sFSftsYBwg++J7OJEtXFj0GMk5wnsr6WNnGULJE7LoDy1ERL0vJrq0JNWaIGzS1PRC39B0vJEnDV3/lIyl3GPsTkkIj4BqEPo7Nxje8D6MUudyX8d0mEqADY3CGM6lvviBPaEM59EKDOzz79y+SVeI2sNr6YfGme3Jy51B4KPEueRGB3LCnzZRTsik0mgp8lQl3ZHGfV/cs/iGEZs4+9Yf825qsuPeqShYRPPJNlgFwhH5cZIFMlys7L+Zu
X-Exchange-RoutingPolicyChecked:
 H+q4hdEQrnRnEEWcnuMzo9Rz7j+YHuVesW7jgsJsiM9VisAZvt3ZpDkgT4Yf5louLlpynKnlNFVSneczqjIjp6y/smPhzNvPDy//6PA0Wc8dV9fF51CV7u4ViN0Sys/hJmBM/JlEwmtj7XMqivWDctpPSouneu86qwNRQYN626O2jo0TFsb0I7R72UjxHiMEOJEn7b3+/4fRDIU1+Cnew6nLL4T0zMHq7+qnAwXp3eI/xxa1XEXKvaXAfIR0jZRzyFNVpwUPV2G0zixqtQi7xXfzyoMn6ukZQ8MUxBx2OnUFFEgb5EFonN91R0tLAoaS1R2uQALKTUyDoFMYQEHqaQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 14:23:19.5517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be323ea-33e5-4150-b11c-08df43ed29de
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000DD311.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4812
X-Authority-Analysis: v=2.4 cv=KNbPn1Fo c=1 sm=1 tr=0 ts=6afb1219 cx=c_pps
 a=6BO/oEg3A5udCF6k6mmjlA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=1EsaE_6oAAAA:8 a=w1d2syhTAAAA:8 a=-pyHTMjFriRFSco1W6QA:9
 a=3ZumFrijQQ-2J9H5h8ct:22
X-Proofpoint-ORIG-GUID: Ao77-TULhbTnF9SYTQdL_vd3bNawbojN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1NyBTYWx0ZWRfX2uAS7FMCHJpP
 a13nZZHQcTdwLVTxuR13j0OEDtYZJTjE8oMEHdX0XC2/he/K2KIn5Anj4TC3r0Cokl2uh9eLqsY
 ZQsSQ1JkEsSQAvaWqtKQAURLBrgDMdl9SxqudU+2Q9jOsNYtg3vH5QFUNdBwyFSWv7D9BM92+Xp
 aeqadqQ/6BH9h5DDxmhELGRkY/4o5Iewz14FigwU2tjVKw/Pu7+kp+6cfZNey9A4NPz9PEgLdJ3
 2u/xnW9c/5CNBHnO+mA5Uwde3syrT7M0coxGEIIZw/1fkgVwAlcrMG8y0nXrnlNm+fvYGvwOd0E
 uz8Jb741yLImNksOfg94opeYJvfJ/7Dat5uYVz9quNlwznJ/MJN11jMKzPwFuxhbK7/QIP9iPM6
 9OUiGGievN6Z7fzHYomWCmKR1Q2gTpDGY3oK5MWWKEcguNKOsu7h6sA2BMh9T+3Rw0o5xcz+sAX
 6OZqsTqW5K78pk4CMJw==
X-Proofpoint-GUID: Ao77-TULhbTnF9SYTQdL_vd3bNawbojN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1NyBTYWx0ZWRfX6WkP4MyH1Nyg
 SxgZmcgfqWnNMcVughyowIgEIfkcLUsBj5xX/NIp00/oW/aOxSl1fQLhEshvQ8kO23iAWgOaqQt
 Ew0Vr1VO7rGjBXjLaPtLFaiKpqCCHmU=
X-Proofpoint-Spam-Reason: safe

From: Ben Dooks <ben.dooks@codethink.co.uk>

The find_sdca_control_range passes u16 and u32 values to the
leXX_to_cpu() functions. Change this type and for the data
loop use the le32_to_cpus() to convert the value.

Fixes the following sparse warnings:

sound/soc/sdca/sdca_functions.c:868:23: warning: cast to restricted __le16
sound/soc/sdca/sdca_functions.c:869:23: warning: cast to restricted __le16
sound/soc/sdca/sdca_functions.c:877:34: warning: cast to restricted __le32

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Updated the data loop from le32_to_cpup to le32_to_cpus

 sound/soc/sdca/sdca_functions.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 1eb6418e132dc..a051825d61589 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -851,7 +851,7 @@ static int find_sdca_control_range(struct device *dev,
 {
 	u8 *range_list;
 	int num_range;
-	u16 *limits;
+	__le16 *limits;
 	int i;
 
 	num_range = fwnode_property_count_u8(control_node, "mipi-sdca-control-range");
@@ -869,7 +869,7 @@ static int find_sdca_control_range(struct device *dev,
 	fwnode_property_read_u8_array(control_node, "mipi-sdca-control-range",
 				      range_list, num_range);
 
-	limits = (u16 *)range_list;
+	limits = (__le16 *)range_list;
 
 	range->cols = le16_to_cpu(limits[0]);
 	range->rows = le16_to_cpu(limits[1]);
@@ -880,7 +880,7 @@ static int find_sdca_control_range(struct device *dev,
 		return -EINVAL;
 
 	for (i = 0; i < num_range; i++)
-		range->data[i] = le32_to_cpu(range->data[i]);
+		le32_to_cpus(&range->data[i]);
 
 	return 0;
 }
-- 
2.47.3

