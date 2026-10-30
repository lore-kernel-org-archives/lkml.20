Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793380280;
	b=zq2ut5MQqwXorboJXxRhZfoSDqegKY9bxuO3PZwl4ivmQGkUYA3abVKQxG9J20YFeEgF
	 eb/9FsAIWneL5gMnL3RIRadFL6HxCK5PPxITijqwZPzwZcbp8IN8AyDL8VhG4AWRjM4F6
	 +NsepkWiMHMmXDHBhOymyj2jvpfZ3YQA4BsjdOcmI2qTJu8H6IpJq3RBK+4Wltog53ggV
	 K98YROiszMoQ/5i3RGrbMOP20Qv2SKv/hXs4OgxYDmKq0wuEsUaxQOgnj0iY+cQE7+t83
	 YiUbnaVwBTU7M/Ggqe5T66VSAnTe7bCzK4V83tyEo8qHEqj5Ezg6TasklJ3fhc2OSIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380280;
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=GYkqaziM6ABwoiE/qSGgd7c5nXH2Qztbkgi5CZdyIYM=;
	b=zm6WKZELkhs5rmU5mqdXG7Mu2ie13QoY3Hdj3XvFIgqc9H/Cmn5saI50PK0gKc1HAzuD
	 awuZwAxtM8xw8PkngqIrKo0bZoJTNg4Xfam1nlfO37rXLdjXynptu/fsDkFtwFiSL1+4Y
	 TsclqDuzLSMweUektn+MFTaXVfCg7yASMQ91Hwi48SlLSrUH+jO7XQH3B1in7YXG479OW
	 G+8rdmZbfy63u4nzhgoEHxxGXA3o8cHqRI7GizM7Nk7U0uKBP/E7Ra6EyFueHHPyVthVo
	 xTr8SARbo4eUx/nTT3bTX8nGSyxsWWv2KoMA6qjN8DJmIpqculwreeJ42obFJ11izQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=iY23qkyS;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=h1+I4YmV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC50D606A326;
	Fri, 30 Oct 2026 17:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC50D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=iY23qkyS;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=h1+I4YmV
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDos4D3947722;
	Fri, 30 Oct 2026 12:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=GYkqaziM6ABwoiE/qSGgd7c5nXH2Qztbkgi5CZdyIYM=; b=
	iY23qkySY4KCpWxWr+dvYFx7OrsRU7mEnUxeyj/3D7S8LsIDpdhPIBiv91bP2/Ed
	Fx/ANL8W0aT4A1CotOAIQi4VtGWHOr9FilVLyz/fMrLR6gcTmmR4sxn5oITU9CSy
	jT9A58S0C874JKFZY9NV8fyL37SSytpMzcvO8zXuegz3NfYbqgh8QqtgRmMN3bZ4
	UGyQ301Kjrrn8+mXYfZjXaGlm/DE8AL/Si0iIwh7a8D2BxtiACg6Z+nAZ6aGzpXV
	M/d6U/4ER8zienICdlVQP74H59fWQndmCsYxJnIK8jtvvkXQid83QVM7+T6DMe+j
	EY7NTagzn1dIkZegrdjkXw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023093.outbound.protection.outlook.com [40.107.201.93])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hme5yhawv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 12:11:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzDIf3aG532H11BXjMcEnFkAiQaoKFfWNDtNyQUIctxaw0ipmH2rCWpJa+d22v8Wqe7mUDUccpgIlcFQCjLBwSFEpA8y7nko3rYxTFs8qKTSSc3epU60K+czyVVPuz0uGsxFy3y9MGK6VVo5prIyt+/iBsAhIFX0E1i3kzxhJELgMgLi66FTVAn5l0T7jwXGgdG8QRM/9VKIFfkd0GqxX+yTNc/fySjsXA+eWAnDcJCQHGsCoxxlAKCcId4yYr1OEnv/5bgCFhfkScdCBJG/oO/b3VsrviK5k4JSATwguy+zo5ygHPNZM30Mo3Rj4f5z9iMvMc4Jnb06bUvyI8UKkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYkqaziM6ABwoiE/qSGgd7c5nXH2Qztbkgi5CZdyIYM=;
 b=U0BUME91xg93u60L4o+6WRm6HhkaOeCID1LgIZf4nmaTxWSO93mtX5liP2NHLfAY873QgdOPXr231vJdSaG3JUuHNZO8VlV/cwTn1oKPiAGMo/oyxYnh2Ze1Kyb/1fNuydeSA6kr5DAa7JsazaQnzHIEbAUMi/47N/LAcqys9GWismqeKnt5tIxb9RRRpqBA46Jw1lPMIeWaLvTUCZbpUBYNlq0duWKQl2ZYblT3UKpQKHTYWW/Cn/O4MRifwde7UHfnpLTbwzPKswgIJ0RBfkJMcE7v4N932PzCu/r1Xd+3WJBWjn2IxG9GoaFY0/z3hK9tY1YMa5SPTzSmLkscJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYkqaziM6ABwoiE/qSGgd7c5nXH2Qztbkgi5CZdyIYM=;
 b=h1+I4YmVURMqZuG/vBc6SoCY3ikzK6kOkYmiZI/ohEAIM2Cm5pRpJe+ZlPgjRvvOxd6kTaowDJvz2HsF1Szu5gEb+NEi4fR+jAQzJaHu5Rzxn25s24I/iWMGaFYPiDlKO6nT7p3H6zrnf9dO53dWxq50RpQTSw+OpkiruakqrS0=
Received: from CH0P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::13)
 by LV2PR19MB967150.namprd19.prod.outlook.com (2603:10b6:404:302::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Fri, 30 Oct
 2026 17:11:03 +0000
Received: from DS2PEPF00006E25.namprd05.prod.outlook.com
 (2603:10b6:610:ef:cafe::6a) by CH0P220CA0011.outlook.office365.com
 (2603:10b6:610:ef::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Fri, 30
 Oct 2026 17:11:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00006E25.mail.protection.outlook.com (10.167.23.218) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Fri, 30 Oct 2026 17:11:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 95AD140654B;
	Fri, 30 Oct 2026 17:11:01 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 66381822563;
	Fri, 30 Oct 2026 17:11:01 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 1/2] ALSA: hda: cs35l41: Add common wait_for_boot api and reset_and_boot api
Date: Fri, 30 Oct 2026 17:10:14 +0000
Message-ID: <20261030171045.469944-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030171045.469944-1-sbinding@opensource.cirrus.com>
References: <20261030171045.469944-1-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00006E25:EE_|LV2PR19MB967150:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 538949c7-cc56-4275-72f8-08df36a8c6e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|61400799027|23010399003|16102099003|22082099003|18002099003|56012099006|261026140227099003|11063799006|261009223027099003|261021123027099003|261026121527099003|10067099003|261022105027099003|261022075727099003|261021121427099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	I0p3VrGrzZ/5YupBEeyMlUqrmQF7W+d/nTW1utVySYIlvV5GbUFMVG7YHBVhUeLZtaemzPLbH871Bp72xEVHw1kD/wjjIzBa3bt/5WHCsFRrjUT9gzyJJhveKQI//z8Oyz1Tm9W/DMKJBptpYAFv9YZLVsk+H/rG4Rg7y79QdrZ+av+Aj8K8Hqdh3lRbkbiWLnQLLHSRnXV7yvmugupT7+WvBdDGe8VZ9BelfMS00FYSt0ceuiE4pr7xP3iKDiKNW1UYcvISoJfWV3TRoI0d0GEnBKnpRaY8LkL3dotkrpQIoSZ+W0SYBdUBGvE8KPts8DlLVOBFmJPom9weW84G2I/YDdYJBAKN6EL8C1EC3iFtjhJz1WWGP2/DLLmbI74drQdt2YfsUCeQUeXLPL8xwlXEFWkhbcbvttKpKE/HG80YD7okNroBe6zQ8ss9NEeiyKP1+aPLWZdfhlC8H4ENTg9mXslnrRw28Z4/frT+kYIRw2HmkMJuuCtnVyvDeniDULmsqtrWnAfzHYBSjASBIJjivkmjLtwYMXgMd5YMVsFGQHLZ7kXR6/1wdEHIQlrF4H54AOdxgk3RDgCYv+HCu2gOJ/PeLLTNh9UEali3Ng2CUQ4g/Rw1ilAOymb2EK5BNONvrZmygv8/H/6L9ZIItOF3nlbDrsNBGJItXUsX2jSBk+kbOPqa3EADbblR7YEZsqu9hDk5nREJGwWWndqnjQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(61400799027)(23010399003)(16102099003)(22082099003)(18002099003)(56012099006)(261026140227099003)(11063799006)(261009223027099003)(261021123027099003)(261026121527099003)(10067099003)(261022105027099003)(261022075727099003)(261021121427099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3sU7KVfWu2gdPzEdGulquIrjjgJrHiAwSawJ/fg4LGcZ0Zsujtsiv7XG1hiMYGvOf31TLvN9PTZI0tbp+uVY0Ddo/rwzT7pFoqbgk7QocREq/3/jjIme4oEnncKhRiq758fMGHhwk6kwpkd/ycrn02rHqL8KIjRTfevVZsl7dlKmdZwHRnUGVBMXL8yLwnlnN4EtW10Lp2LITUdLB5xd3AskijvEcB0UcYTktzXfUhgYDXmzDkOAY29JgTrXnFOFv09j287EFO+1La1cyXup1NLcmTWZ59UoQ8W4BMbtIKkHKm6HoksYXnh1hnLz4NLODt9AfATNemHbVX/CcFd6LWab5WHliLQ36EZKPB4R1bLLj2A0rB5L8qDL5ZFLhmE3NwP4d4ClvyyWMLyFrhHC3QlFfeKwA/HGbZnZMOOiPaRCefcwuYTjlljqt2I5vHJ+
X-Exchange-RoutingPolicyChecked:
	Lpx0QjGPEbutJSZSaNSNzhDXt1onDx3RTslVzKBvFlCLw9N44u8YkIBsnpD9S7hC0dYsVzsFTeBXrtay1c/PfaLJLXGl4jNnT1vfxHN59vxbT4GMxn0p1OdUcPzkbTuq0jNvc4/qOXX+D2eXah+OgyEVS27syY9n0UQkg6+27/9/RqsAB2Mg0X/FhwSl0uBWmrHxXuSZ7re/9DuJF7wLQkbYYYwSi2Bydrb01Gg2DVYa8IktMqfkVY3VfIdFdKb4N0nFq57f2Y7nxiTfMZzGBnLyHoHfEhIzoIfP+DCjo1NgSu52dJioGkMDH/xnXGoH9kUxuEokKX12M5itkZ7ReQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 17:11:02.6356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 538949c7-cc56-4275-72f8-08df36a8c6e3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00006E25.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB967150
X-Authority-Analysis: v=2.4 cv=co8OAF4i c=1 sm=1 tr=0 ts=6ae4cfab cx=c_pps
 a=oX9DDLBFzmmLrgrYpmrGcg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=720dKBaSUy7j0WpPq90A:9
X-Proofpoint-ORIG-GUID: RWnaWtfKzrEHC4Jz3Zy64WeefkFx0jq9
X-Proofpoint-GUID: RWnaWtfKzrEHC4Jz3Zy64WeefkFx0jq9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfXwHHTAZhmDpjU
 soKnzbbfRIk/cgdWnX00j1XNEFg7eieALX32H3zfRU7MQsgbghoiTQlGFh66DCgowcrqyF5xiOY
 j3bGRwXQDSVlDeRMpgvLmUmEDW0Y1EM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfXxeMtQJZcb/DV
 2StT6koAEqzhnrIRfAqrpapoMG89oY39ugDHDmd+2n94vCSMKOslpt8SReCQ03eWrFSjhmigXCM
 HjRVO1Vmk/qmbFVh2G2IX+8Ej7mv4M5QE/vVVkkXzi5CSc+YLZ38sgmTr245MrmwquYHxcRYYrl
 WQ7Aa08cwFeNOmPd1VzhokjY+GpIigZlb5ECBRpxmXqebT8WLbTid2xaLPF7AuEw25NVwXyj7bA
 +Sp1C2PCBRU5zdS2K8OU2wayT26rVEXctEoehW2KeZcvfrYILa50lJ9cpJcFaKYJaXdnduJBdJ/
 Aj36bJ/AejuPnKMAUouoFRuCRyjDUpKhMB6lxuqyirMhVj7ZO/A2D3vwhUWZLUNwTzVtPHsXNqD
 Dobkzl/rSQg62Pll/3m+/zSBqGc6HnoyR9OA9jpRYc7Qm9cFBr7VsoLdCtSHLlXEdc9tKSGmE5j
 xTINa2sX4tMYloxAe/Q==
X-Proofpoint-Spam-Reason: safe

Both the ASoC CS35L41 and HDA CS35L41 drivers currently use
regmap_read_poll_timeout() calls to wait for the chip to boot.
However, this macro will exit immediately if one of the regmap_read()
calls fail. This could be cause by the hardware not being ready yet
after a reset, which then breaks the loop early and leads to probe
and resume calls failing.

This patch replaces the existing code in the HDA driver with a
function with a loop which does not break on regmap_read() failure.
Since both drivers need to do this, make a common function in
cs35l41-lib.c to be called from both drivers.
This patch only updates the HDA driver, a separate patch will update
the ASoC driver.

In addition, before the call to wait to boot, the HDA driver also
does a software reset to ensure the device is in a known state before
probe or resume (for example, if there is no reset gpio). Since this
write could fail for the same reason, add a common api to do this
with a retry mechanism.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 include/sound/cs35l41.h                    |  2 +
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 33 +----------
 sound/soc/codecs/cs35l41-lib.c             | 67 ++++++++++++++++++++++
 3 files changed, 71 insertions(+), 31 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index 7542cabfa726..b6b338c55ff0 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -924,5 +924,7 @@ bool cs35l41_safe_reset(struct regmap *regmap, enum cs35l41_boost_type b_type);
 int cs35l41_mdsync_up(struct regmap *regmap);
 int cs35l41_global_enable(struct device *dev, struct regmap *regmap, enum cs35l41_boost_type b_type,
 			  int enable, struct cs_dsp *dsp);
+int cs35l41_wait_boot_done(struct device *dev, struct regmap *regmap);
+int cs35l41_reset_and_boot(struct device *dev, struct regmap *regmap);
 
 #endif /* __CS35L41_H */
diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index f879e3ffbb53..23582f23a880 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -974,30 +974,6 @@ static int cs35l41_system_suspend(struct device *dev)
 	return ret;
 }
 
-static int cs35l41_wait_boot_done(struct cs35l41_hda *cs35l41)
-{
-	unsigned int int_status;
-	int ret;
-
-	ret = regmap_read_poll_timeout(cs35l41->regmap, CS35L41_IRQ1_STATUS4, int_status,
-				       int_status & CS35L41_OTP_BOOT_DONE, 1000, 100000);
-	if (ret) {
-		dev_err(cs35l41->dev, "Failed waiting for OTP_BOOT_DONE\n");
-		return ret;
-	}
-
-	ret = regmap_read(cs35l41->regmap, CS35L41_IRQ1_STATUS3, &int_status);
-	if (ret || (int_status & CS35L41_OTP_BOOT_ERR)) {
-		dev_err(cs35l41->dev, "OTP Boot status %x error\n",
-			int_status & CS35L41_OTP_BOOT_ERR);
-		if (!ret)
-			ret = -EIO;
-		return ret;
-	}
-
-	return 0;
-}
-
 static int cs35l41_system_resume(struct device *dev)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
@@ -1020,10 +996,7 @@ static int cs35l41_system_resume(struct device *dev)
 
 	regcache_cache_only(cs35l41->regmap, false);
 
-	regmap_write(cs35l41->regmap, CS35L41_SFT_RESET, CS35L41_SOFTWARE_RESET);
-	usleep_range(2000, 2100);
-
-	ret = cs35l41_wait_boot_done(cs35l41);
+	ret = cs35l41_reset_and_boot(cs35l41->dev, cs35l41->regmap);
 	if (ret)
 		return ret;
 
@@ -2003,11 +1976,9 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 1);
 	}
 
-	usleep_range(2000, 2100);
-	regmap_write(cs35l41->regmap, CS35L41_SFT_RESET, CS35L41_SOFTWARE_RESET);
 	usleep_range(2000, 2100);
 
-	ret = cs35l41_wait_boot_done(cs35l41);
+	ret = cs35l41_reset_and_boot(cs35l41->dev, cs35l41->regmap);
 	if (ret)
 		goto err;
 
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index b0fa80705be7..973713626ebd 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -17,6 +17,8 @@
 #include <sound/cs35l41.h>
 
 #define CS35L41_FIRMWARE_OLD_VERSION 0x001C00 /* v0.28.0 */
+#define CS35L41_GLOBAL_BOOT_DONE_TIMEOUT_US 100000
+#define CS35L41_GLOBAL_BOOT_DONE_SLEEP_US 2000
 
 static const struct reg_default cs35l41_reg[] = {
 	{ CS35L41_PWR_CTRL1,			0x00000000 },
@@ -1586,6 +1588,71 @@ int cs35l41_exit_hibernate(struct device *dev, struct regmap *regmap)
 }
 EXPORT_SYMBOL_GPL(cs35l41_exit_hibernate);
 
+int cs35l41_wait_boot_done(struct device *dev, struct regmap *regmap)
+{
+	ktime_t timeout;
+	unsigned int val = 0;
+	int ret = 0;
+
+	/*
+	 * The chip could NAK a read request while it is booting so ignore
+	 * errors from regmap_read.
+	 */
+	timeout = ktime_add_us(ktime_get(), CS35L41_GLOBAL_BOOT_DONE_TIMEOUT_US);
+	regmap_read(regmap, CS35L41_IRQ1_STATUS4, &val);
+	while (!(val & CS35L41_OTP_BOOT_DONE) && !ktime_after(ktime_get(), timeout)) {
+		usleep_range(CS35L41_GLOBAL_BOOT_DONE_SLEEP_US / 2,
+			     CS35L41_GLOBAL_BOOT_DONE_SLEEP_US);
+		regmap_read(regmap, CS35L41_IRQ1_STATUS4, &val);
+	}
+
+	if (!(val & CS35L41_OTP_BOOT_DONE)) {
+		dev_err(dev, "Timeout waiting for OTP_BOOT_DONE\n");
+		return -ETIMEDOUT;
+	}
+
+	ret = regmap_read(regmap, CS35L41_IRQ1_STATUS3, &val);
+	if (ret || (val & CS35L41_OTP_BOOT_ERR)) {
+		dev_err(dev, "OTP Boot status %x error\n",
+			val & CS35L41_OTP_BOOT_ERR);
+		if (!ret)
+			ret = -EIO;
+		return ret;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cs35l41_wait_boot_done);
+
+int cs35l41_reset_and_boot(struct device *dev, struct regmap *regmap)
+{
+	int ret;
+
+	ret = regmap_write(regmap, CS35L41_SFT_RESET, CS35L41_SOFTWARE_RESET);
+	if (ret) {
+		dev_warn(dev, "Failed to write software reset: %d\n", ret);
+
+		/*
+		 * If the write failed, it is likely because the chip is still booting after a
+		 * reset. Wait for boot, then retry the software reset. If the initial write failed
+		 * for another reason, then either waiting for boot, or the second write will fail,
+		 * So we can return the error then.
+		 */
+		ret = cs35l41_wait_boot_done(dev, regmap);
+		if (ret)
+			return ret;
+
+		ret = regmap_write(regmap, CS35L41_SFT_RESET, CS35L41_SOFTWARE_RESET);
+		if (ret) {
+			dev_err(dev, "Failed to write software reset on retry: %d\n", ret);
+			return ret;
+		}
+	}
+	usleep_range(2000, 2100);
+
+	return cs35l41_wait_boot_done(dev, regmap);
+}
+EXPORT_SYMBOL_GPL(cs35l41_reset_and_boot);
+
 MODULE_DESCRIPTION("CS35L41 library");
 MODULE_AUTHOR("David Rhodes, Cirrus Logic Inc, <david.rhodes@cirrus.com>");
 MODULE_AUTHOR("Lucas Tanure, Cirrus Logic Inc, <tanureal@opensource.cirrus.com>");
-- 
2.43.0

