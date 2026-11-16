Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794824227;
	b=nZEd83L6nJ2THmoWf/WkCp2j9IYrr3X2nONzIqeamE9BhgGHhwna8cO82EdJ/GvL+6Ky
	 +lNO03YGmi2WhVBh7dI4uA26SxO+V0+J/88HN+QWWU0SWFfy4OEd4PFy78wzABwEEiw9m
	 ykYDIvSyHcLU4CNm0oCeET4a2rAZ9QrFc54okVgekMwg27CUlrdkFaes//CEJ7/YelOTE
	 R206NeLc1FTyy++juLHX80xB270QC+fiT/eyNMJmN7kJtN5qX5sD0RHphvJZV0gorFn3u
	 JKWPA0QT61/A6OYdTDdgO0/jKhMaN04wk/ZMaDPEsZz5N22mXw1SgALo61PEUkIKGOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824227;
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
	bh=M/SK6oYZHFbr6yKcA7C2W5xMHaHRaZilPwLoONQUZBA=;
	b=F59T4JLDcYO6WigB4qorAF8zg8Ukj+RWX/wy8HXsLTJR4mqzsjxv1lNHs+1U4WEV2gwD
	 9F/vqWTiwv/K7j48qKhLDHfnB/EQ6Wi7i32s4QvdbS9TeVItwJnAN5uK8m++0NjDjzJtK
	 G464uuwMzKRryHc5Fid7s8BvmhgOA2wswxeZRbhhmmdX7HFRlWyZcJ8xZ0ggg9wZqBoaV
	 QB1tPZ68Faftv3+A+VmnW8pDVrRF22lLCgu4uL55v5fMK86n/caf8WQfMArig5YqFA4c6
	 T9OKWaCjvH3N7QgVqF5cFp7bB393oOXmyhr/5KXdjJmaVzEkp4JYQ7uV3kmdhp5Iilg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=YSDeNFyT;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=ldyXXZBd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C31E606A331;
	Mon, 16 Nov 2026 10:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C31E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=YSDeNFyT;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=ldyXXZBd
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGA2SvO1585422;
	Mon, 16 Nov 2026 04:16:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=M/SK6oYZHFbr6yKcA7C2W5xMHaHRaZilPwLoONQUZBA=; b=
	YSDeNFyTuNh036QnYWANi+G9NUKDm0dWb9wFSGqQDlkJvRdpCJNttMpgaxqzgho/
	1F2K4St+rMOtjlzcxucml+8F9F7TB5i208rAuVaIyczjCg9Y7510zR6OLhkZB4ip
	y/LIcaPy6g1F5QqZFW1Rouv3OzZwsRuj/sX+gFdSWl+DQrmBxvvTVAl/PQTmUVIV
	TIxd9OJZabYNBuaCgjQlFl5t/Zuo+2rCvMa8gJEOnKFTBVj+oQVN2nCL1pKTYOgG
	TgonYHqRIl2XqmJMEmeKp8vJCAF2id1Xws3ppcf/j0psNQKIQ/rckQxutCmF8Er2
	Nul/DM/Hhie1+W/LkqSG0A==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023117.outbound.protection.outlook.com [40.107.201.117])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hxnxehx0w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 04:16:29 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNECW3ZiBLnHkKlgAs3R+bxqFVHKTMdUg3A9SR21oVohe3rn1YSv+UfwUzVz7qub5JoO5XmJsxIDI3XdONpH0U9pvoFVudfPpzRHM+8lwPXB3ZJT+AWMjvoa8dhD9LFStX19Wqz0zGA6oLoy7BwXVNjyLABJai29Ufj4GLx8UZureNLnJrrN4nXkBPHxaMI785TwctY8fBUSMGtIfT5XpEWoJ42LF11N44AiW/9i18yLU2RK71FXFWuK3694WfQucSzW6SRBQd+gUseAR5vI9SShT8vKAefUoAQga884z8OBhQw03F/lbVmqIJC8rVn1G97IqsIAu8bk3XDjNt0Utg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/SK6oYZHFbr6yKcA7C2W5xMHaHRaZilPwLoONQUZBA=;
 b=nJw3ILrN7ef0KLlcu4x7K1nmYHfAExTpCvBFh+r1RtiMCWBeCHm2JNIvtg8PA6Kr5EFglc9kkK46KQxPhG0dhCQPnTHjZ0yedVE07YF3UArJKCpwF6tj1eC9GHCk4W1qelt+ZvlirOgQsOgpIZ4LYEOBDeNZrS7c67889R1Boyd3lHMEa68M8iAKd4Ik+JxbCdCRavj/UhhjqbjYTqY2KorcihjdYgqFHwgHOWYgaQbqytUVDYGb3Bl/5y2y184RG/I4GX+LwecpsRfv5+Zs4NsQen6CSn+WBcxzlPhwERhlOeeiefyr4wEngzz6bHiR0LAMZhPOEDEHANO6gWcNKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/SK6oYZHFbr6yKcA7C2W5xMHaHRaZilPwLoONQUZBA=;
 b=ldyXXZBds0lNiclOtYaR+Odj2TL2pJDB8ReizGIu/W2sMZHQ8hYM0XHeGpE9Zciy9cxS5QzZVkxsrFhhi2J2h6aHLLyGSxjblbqR1acY9RQ/e7kAv4ifw46VzzX6/uNjgWmP5Im8hq2JStcV5X0Qz0irrp9AgKrgrZz1EqkWxPU=
Received: from BN9PR03CA0232.namprd03.prod.outlook.com (2603:10b6:408:f8::27)
 by EAYPR19MB466967.namprd19.prod.outlook.com (2603:10b6:303:2db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 10:14:25 +0000
Received: from LV8PEPF00000067.namprd03.prod.outlook.com
 (2603:10b6:408:f8:cafe::2d) by BN9PR03CA0232.outlook.office365.com
 (2603:10b6:408:f8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 10:14:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 LV8PEPF00000067.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 16 Nov 2026 10:14:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0DF7740654A;
	Mon, 16 Nov 2026 10:14:23 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EE6AB820273;
	Mon, 16 Nov 2026 10:14:22 +0000 (UTC)
Message-ID: <3b620222-ba1c-4c6c-a06b-2dd5fb391fb6@opensource.cirrus.com>
Date: Mon, 16 Nov 2026 10:14:22 +0000
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
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <fd865483-1485-4042-b938-2012eaa65043@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000067:EE_|EAYPR19MB466967:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e80720a-f2f1-49b4-4fee-08df43ca63bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|61400799027|82310400026|36860700016|10067099003|4143699003|11063799006|56012099006|261026140227099003|261026121527099003|261028144727099003|261022105027099003|261022075727099003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0GZFtUkthfKFoqkAsIAAuEuPeSdM5RWB8QZYzTmsXEIDpPQPzF2CV8WDA6loaFs1weCjzjrDOrHez4mPsRyzFBVYBx8RatiVYtj6Pe2UlrwCmtIhnED2I+G55xqn71BQTSpcMPB0cqNoOIfwvWoahqoSzyWOgpQYRqNa8UvrNVV/KJ1n940pngU8jKyBr/tt18VBej+NjpW25lgHbM3TnWmN8VsM/5tsYWcTQL/BWWKgdMxBvWHRaWAKb+2BnQUOW44AjDBlLI3qcIJxwK+Sd4OAMAmNva7q+jB+sTNji96gUjqrM/vlgorWLKUFlaMbtaGgh5bZnYjuoH4kOeIutqyP168pDyUrl149CNGxQuB5B+Do2LMgpsqm5/lsVupY9xkEB8LRsekCcUTLElrxLKrMK5r82oOzYFEB86DSoJmIHfzk5aZd6bxXIMiI+WXoiAGZxTkjkNRZQ0zEtStImYLVEoPPrDr8SKpsPF9sQ2aTmNusjAcy2sajTrAtRcjpv/o+bF3IpZicijaXxnfjM4FgTr7VA+VpPl5PNvA5Zvm9OiqpCBMcxR6KDNUApcNwHHjQPssAD3xh/ubBu89b7Hv4NWTtQ7wBD2wlrdW2XSBhLeOSSiBreoAFvcHMj2aqN5/zL3CKiiduhhq/emBvUAxSYjREjzwwGqJOcFlLHFlAxXXXsY2gX1KcEVIdMLwTdbc1OQrUJV7k0xzwV5VKJw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(61400799027)(82310400026)(36860700016)(10067099003)(4143699003)(11063799006)(56012099006)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261022075727099003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mo4AJ4inBl5kgDRCfKuVBJBkW4CSeinaJnruiF82H0TthaLCRfzM8HetTotj2WDjkXWJbFiIjeJfxXWk0qWrUIznD6x6aExS4gGLU3x2RzKfdH8rRRnfuvlR78N2Q8jc5BPSUIlsGgN+gP6AeNYQ3VLiN+tob9Z4/ndRVE0SJwC2h2BZ0g56z0Z20Q0FufcM00gWZvmiK08qySip4OL0n3KJy0y7vo1JULYT/qrJGmuScT4zQhgqEz2nB9M7iZYUqKfjhdTmXSrM06F6CMnGheGIP+n88QdHRhQ1HpdtVO7Zo9C7WskR3xL81OLRFoEPDgm8Myd/AuOEPwd33oKibrXAs0SINuAE44TLuEfJwGmG8bDyx5kCtk+5DU832CTwlWrIzfofoCN30I9NMQuj3qxXRtX+VmkrwgUSooYMk7TdVF6/9QYaQBH1bUmBlGx9
X-Exchange-RoutingPolicyChecked:
	4Otpzkk2Rf+GpxmiH0vSQc3FgmF03vMjS5MPY0tnfETrv/u+JcIEOrf9jzr8yrjH6HyC4va+GqDeMFoL0Krg7QAal7J+iKPTGtGeXm05GilHtcqMR8HinSA53ndfWOTi2L2AZWI8Xfr+sQ8mqmoxFbPOAF+YDDcgLtOFfplty7nhnKb+JSleILD89LIAKy7ZfJ27qEhCTVYUzmNbEvp7VpKdxquk0Ss0O1L2iSRL2GWJd1LnVUWC7MJ4GWueS0EOCGj+MQUadxxUKLln8XZOJjrmBIi3mu7GEgX7sH2ej4B8/RFZtmZZNJ+OdsQtDzpfl229l5oflx8GmGePb5lBfg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 10:14:24.3575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e80720a-f2f1-49b4-4fee-08df43ca63bd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-LV8PEPF00000067.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR19MB466967
X-Authority-Analysis: v=2.4 cv=KNbPn1Fo c=1 sm=1 tr=0 ts=6afad7fd cx=c_pps
 a=czckzaKnCwXpY126n2X5rw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=VwQbUJbxAAAA:8
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=b3CbU_ItAAAA:8 a=w1d2syhTAAAA:8 a=07d9gI8wAAAA:8 a=JfrnYn6hAAAA:8
 a=ag1SF4gXAAAA:8 a=iox4zFpeAAAA:8 a=4YGUvj8HmqbaNNdTngsA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=e2CUPOnPG4QKp8I52DXD:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: L-tgOMQp9N4Z7ddUe7w_4Ug_hY62150i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MCBTYWx0ZWRfX7l5RNB9kyuIj
 NnGGkapDgD6i68didTt0eZe9pq9pHHXBnNp/Z5jcGf7jJX0XJXP++f1itQTDU9LABpwIuYFn8XX
 Tdmmk7qIU0wygBYrsKjl7xmt9xrFuRZ0jWBcBuGg1uyxRWfjvOHKEntIFtmHYaK8l65uWSDcLku
 3xLnxsVaSXhtJt0RH/uYUmv/+q59vI5K/dCQ6gVTkQTbj92KVtR4xVHtJJI/7qPWB7sXOr+dvvT
 q/BIJThM894hw+DvvC7Jb4QOaLlowG0JXva6ri//YJBW2hmEOluHEHvmP9QPkFEWHfF0DOEQ7Gg
 EJJK1R7Ct2NJoBt+sKL1juojAD9Kea47QZaut5TQqjPEAA8iFf4DJ8UqM5Nws67+ZwWIm7Z3HBv
 IGnMkN2lUG1BSdvsHnxK5XH0Bay40DknT5JebmwVY/OM5zh1hBTedTp49EPHwo7bwmMK4jq+sv6
 rKgeevTlf/bbgJ62SZg==
X-Proofpoint-GUID: L-tgOMQp9N4Z7ddUe7w_4Ug_hY62150i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MCBTYWx0ZWRfXzCfByOIypd6W
 xw8/+Koq5fP0Sh9t5rk90E7FeDdDn7X2ef5D1zsK5+vyZ3uRnrSOJ7bRA0Yn3T5JpGPVsSm2yDV
 LEjIi0VNkcd3ldmikiPwobWu6JobyuI=
X-Proofpoint-Spam-Reason: safe

On 16/11/2026 9:22 am, Marek Vasut wrote:
> On 9/14/26 5:12 AM, Marek Vasut wrote:
>> Use the primary mirror of linux-firmware at kernel.org.
>> No functional change.
>>
>> Fixes: 088fb4ee17fc ("ALSA: doc: cs35l56: Add information about Cirrus 
>> Logic CS35L54/56/57")
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: David Rhodes <david.rhodes@cirrus.com>
>> Cc: Jaroslav Kysela <perex@perex.cz>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
>> Cc: Shuah Khan <skhan@linuxfoundation.org>
>> Cc: Takashi Iwai <tiwai@suse.com>
...


> Is there anything left over to do with this change ?
You should send patches To: a maintainter if you want them to merge it.
They are not guaranteed to see it if you only CC them.
