Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794228780;
	b=PuPrnnZZELtm7DfGGzl8+FKaZoD8QhOogzAAJAGRtweZ1tB09bEiqCdQduYa4RVrzK3q
	 zwk8WDnORU0hclj8fmfHXSyQ/pUAdsW/E7rUFGIcrvVq58b7oUCY95geshqMtbttmJpsB
	 iq+JKYYDkEVG+Mw3lNYrLSnO0TugaoJQrIYGFVRdABFtB6HAvRt96Q0kwPteAGxqDzwMO
	 0N03UiIOKIxEI0bBBgLXSKb5IOcQlGk2JVNH9fpmh4KDhEgJ4wo4EmFgKkEsS2i2pXzxg
	 UkpTA1Pyh/yJ4MawlIfJ/BwCaSvnmogORUGuUq4HNFXeQVoy3MpT6YyFb8xv4NowI1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228780;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Reason;
	bh=ejCKLA0Jv2Gzu9Vlagq+I3gi273qw+mWmuDuavPvVVE=;
	b=2UDbBkOQK/G1CZzuYuZ0AE3S3vCj/NdeRlt6XtiDwITDU95o0Oe33OBqEKO2o0lDXqSA
	 MeT45UFJFEeMtibYeIL8ZbsUaSnNh2710qWCJwlCTTXtVT7xnI8xtP6agTwtJEkxv3/fR
	 wncJ056d65TcfebPaAj0TN/Lp20oURjPr3zRG1by4MI/GBBp+kBAEV8Tkk4DmyDa3mu3D
	 wGLYWinNm7Jk4qsKFBtTjD4topyZgiEC6/hY+JlQa1XcgnX6XEPzM5AiZU1UXwNI2L0yi
	 owfe3TwUbwRD12K75aCaj7SsFbZSaLIR5wW74mRBYaMsR/GiYLIBSSnCk+bm3g7bv1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=dSsv4B1f;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=WFvYZk2o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2911B606D807;
	Mon,  9 Nov 2026 12:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2911B606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=dSsv4B1f;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=WFvYZk2o
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9CFbZs2985747;
	Mon, 9 Nov 2026 06:52:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ejCKLA0Jv2Gzu9Vlag
	q+I3gi273qw+mWmuDuavPvVVE=; b=dSsv4B1fpAHTExsGgz9NtZB++I8Btto4Ou
	VGC5nz5NqvLiSw6Qrf7jJINVtS8CRiP+CvtX85n0xn0l1tRXwpno3psyBUyHsS4o
	V+P8ejYQ1PurgAqnOM5kGMbqfuP13F+w+iW5SYZ8mAq/FMtRj/xx/On7mBDMo2j9
	iiHvkC+MyvRYGTmDu0+UNQE8W/IsyGzH0KCfk1LmgMGwHRAY7kpnDR2lJfUbZ/RO
	C7m7T8pHpe6q12I0ofEjGibAxnH83JkZNnEiypqVGqiuSlEycft0m5JAmqGHkS0y
	CqGcKqOZ7N9oDZzq7T1GA4BKcSaQ9uC5SntFWQbIsxVTi2ppDFtw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023107.outbound.protection.outlook.com [40.93.196.107])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ht19pa3sc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 06:52:48 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZIUeyxz6lcJF93zv+JBbYw/RJ9fYNnbFapTfviGH4ZE+RP1FlhyBnMBhSMSrKPj7gfMHUpbOPtOqNvu3Eoo2uVsHHdKmJBO6iOeW/Ffw8tsLjQr4Y6M185gEgC/021CmYfZdX6t+JZ/k0Es3qtr7/9n8F25slSe53KAg9rtTKBOY3zIOz/10cXAVZMuTvO+6TyNfwi8KV2/rx/k9/4dMv5pGLCBcyehwdzs/tfaXxt52VZXrclncjnl2qk2rLlw1ezNuyk349z81X0PAPankwy3bBoq3Fj4U80KZWFeyXqai/gvLoP1oQgAYgg00FfYl80rN/ywiabYmTFzVcwaw6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejCKLA0Jv2Gzu9Vlagq+I3gi273qw+mWmuDuavPvVVE=;
 b=rxaRXhUr27OB/jgOWhhy4KmT9Vk3XC3kbNriBKytqo/5BUqfKHn6qfdpQE/vzN2IVnDCfUXmfJQeufKVjcMH2Vp73wJsKjKSLp47E3qA4sbU0w5pm74mx6M2AIYHKvKcVnTM3hqdFpRO62hb+C1ddfHWnH2Z/mlXag3nZ75jNTv1C2TB21ObdMgEfMG+HzHDCA62aRT5fF0M8wOmTuxTI+fIVCjp/vL3tiZTZrBIxNL/KFh7TZUlL/vUw1ovV83IlhZzMO7Q469JxnqlV8h1TME+fBQ3SN8+9RugNRpiia3DaKXjgKwltgRZ4YHcyQyPnbXHzxRyT5V8gQw6RWHW6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejCKLA0Jv2Gzu9Vlagq+I3gi273qw+mWmuDuavPvVVE=;
 b=WFvYZk2otNDmr5nYB0hzAD9cPVaic32iE9tYmoxIBZ78DTX6dMVBFIe/dypLJl0v7MspjLkegN/a4d+Q+wM5WiS9/dgNkxuatmjYkW60Bx8Rwh0i4E8p72tGKk09v4BQP0Slj6dndWzir9vuczm9NK1kFkNO80wZbmBWNU+AlO8=
Received: from CY5P221CA0114.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:1f::34)
 by PH9PR19MB463493.namprd19.prod.outlook.com (2603:10b6:510:3f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 12:52:46 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:930:1f:cafe::37) by CY5P221CA0114.outlook.office365.com
 (2603:10b6:930:1f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 12:52:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 9 Nov 2026 12:52:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E7FAD40654E;
	Mon,  9 Nov 2026 12:52:43 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C3EE6820273;
	Mon,  9 Nov 2026 12:52:43 +0000 (UTC)
Date: Mon, 9 Nov 2026 12:52:42 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 3/3] ASoC: SDCA: Add port constraints into
 sdca_asoc_set_constraints()
Message-ID: <avHCGt1WfQsP7qjy@opensource.cirrus.com>
References: <20261106150926.2587108-1-ckeepax@opensource.cirrus.com>
 <20261106150926.2587108-4-ckeepax@opensource.cirrus.com>
 <179413707633.3630016.13654136728294242171.b4-review@b4>
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
In-Reply-To: <179413707633.3630016.13654136728294242171.b4-review@b4>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|PH9PR19MB463493:EE_
X-MS-Office365-Filtering-Correlation-Id: 5201be25-b1df-4203-53e9-08df3e6059ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|61400799027|376014|18002099003|22082099003|16102099003|10067099003|3023799007|4143699003|11063799006|261028144727099003|261026121527099003|261102123227099003|261022075727099003|261022105027099003|56012099006|261021135927099003|261021121427099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	uJMLY+YICPXAonHoZ+leR5tc8zyCRDu88WLVa26WUKHcjJ3KrkWiVRHoDTOWN6+o9oY3Imqr9R2ibzWja17pSRODFjsibwUcvnQuaeG7WSQ/IkBPPZwHWEvxqb0SNorZacq7sLgJN8Fh/dhAWjvp1qEu1e1Bw93ibMLyIo/hzZ2aNVrZDnCqIrbCNVBVbgr0Iun2LD25CXjALteyevNnCTks6Va60ufdbaYPWXqiTRKQFpAPw3+EWeoA04oWuLQlpr6elfRjF4y23jNitQE9UT06xadTVJHbIoseeT5P0sNPsozS/o/khp9aYa+QYZRuOFe3uKAbyzhw26kHBuSNX/bjjf2RSPmFv/U6VfXYVp2d6m5QEdnOh0dATDfM7mmKfjtjwsbCuRlJ0ToXu8wtfhvScOFM6EwKg8gSOlHBjSm5Mlgmq84r/yKXrk07vE6g/Mx05F2DUeKa3wVoTDT0gsGVu5lMaYHAg+XWZN5XgueA6mhQCE/n/XFasUGNTjHzM0q8LgyHkQIqLNLukEaCCsdjyqIuEWUKENo0hbv+UhN+2sFS4xNoAh+V6EiM4mX5S3q/gvHit22gJxHh4l057xbRnKP6rgjFyELG5wPzYiWEVL6lq8yzyZy6HhcmDArjLGT7//cEdWnZbXOKIFGZOQ9K1v2OsEEX4gUAhC4w1ohym0OpCwhCIJ7k4JX0hlLcJy/mvkfbELKeR9n+MIcqQw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(61400799027)(376014)(18002099003)(22082099003)(16102099003)(10067099003)(3023799007)(4143699003)(11063799006)(261028144727099003)(261026121527099003)(261102123227099003)(261022075727099003)(261022105027099003)(56012099006)(261021135927099003)(261021121427099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Pcw08d9ODOBohTLX7jRxA7p/H3+BOdDRrIVJf62K3igX9GvDJp2fUzno4zyHeCrig04q+W7PUGKLE2OJCalqEAseX1/gQEQN3EpZny7nuaqHnaiTSfLCvph+x0eCxqpatguADbtv11nX4qaH5Fo2E6hl/lqtK6is5bKBIrRiO8C1Gfe3gL35wzONkioreLB6FGoWZV2va6dL+5Cf5vC460hv7XI3YuhdjmrukSpozSQozLFuWufXfb8k4Fjq1zqqJmPxXDun74wBI0q5joPJ/jcb+yEiJeDWK1cx1o5Yfgl5GsDfmLk7Y8eJeDz9m368dOmrNuEPjqc8SzYU5TQJtbP07BzMVzvVUcYbPi4AeX4wK5gwIaq81/DTBJcvYD+4T+QvNuWBNRqzOnMLbjW96mP6cfvF/QX6UbDBQznBoUsJ/mNV4rYmfNNNo7fkryYT
X-Exchange-RoutingPolicyChecked:
	Ezh2XVaDrY5Y+nlVETQyaEJw4Lth/fP4l0xkd0leZU7ntbijwljLKtSA1Ex5XeKmeFrS6+QKByiRM0vWcw/PwGNjla5Qlkihsbp6qTgnm40M/B5Zh2sMPH3mhqj3W6TYpZjXoU2kMma9ozY/d5yJbqE0lkIbjCDsSowycb+dif+lHqQPDOEvh4L3qvlJ6dr2LDfFJs+lcZ8MOOLTPN+sZsK+5gasojk+tRJrZB9TaAVp9eC19XBiuANNgMG4QaAcNhKZlib424SB8q/cagPTqhkCGprg83bjaD+KZniKzGVlqCS9+waaGyHzhlDUN1mV4rRo/DkOlaKR/PdO3715UQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 12:52:45.1233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5201be25-b1df-4203-53e9-08df3e6059ca
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR19MB463493
X-Proofpoint-GUID: 6-jHsxYhtqq8tI4Zes9zpuGDfUn5g-gC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX/Mlr6TWIaWFE
 mElmn/ZL7G0ZjQ/+4uppvht39S+mSt3ElZu+JFc1xlfdGJ8+cSF8AarhYKAmY7VT0OkpmwkN/Jn
 Q5PqCjWXQYfn1z0PdBNzaPlfTK7dFAA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX8M2e+33pPHCv
 zuKmxRFUKbaaLy73Vr6Fr07zpUaD5JFDZM+IpgbMO210lIFIBmFkAVRgt30pF+jdf7C9HkG3pq9
 SlzcboFfd1ESvE7q11kOQwhcpJtyb1aa3Z+e00Bb/NLRVf+oaoPeZCPo0Con+hfFldeVO1sqzfC
 oyoVMf1LOstSQzDA6BsrHi9Sv82yyqIsQLJnZMPMpHiww3hSHptjGzYVL5PIRk91VQiPBQiLPRx
 MX1RWGU0GibnxvmR43qSzy/Jf9WUvqDZw9OYxzvhw4wtIAP8iNnVUjYrWVtFoSGZRujvbjKADma
 grKMAR6nZvXoXwWUf43SkQ5C3hqO7WAYJvHxOzYAIwnFKJ6b/2rmFkNXhN+Nmf8bjrL0WnPf4Cb
 OgMl5AqY1aYfcuwv+0CuIFK0+mCtVzOKsQmeVL6terNKxZqd/1C7qobh6K4mqxTMaxvOF11MmdM
 UPNvUkDA5kE1SB0iy/A==
X-Proofpoint-ORIG-GUID: 6-jHsxYhtqq8tI4Zes9zpuGDfUn5g-gC
X-Authority-Analysis: v=2.4 cv=NK5AaE6g c=1 sm=1 tr=0 ts=6af1c220 cx=c_pps
 a=slu7Q4BvoA09i0qrEz4xsw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=XuXfkrXUYTa76uAZlkEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Sun, Nov 08, 2026 at 11:24:36AM +0000, Mark Brown wrote:
> > Currently the SDCA code constrains the params based on the DisCo for
> > the SDCA Terminal used. However, it ignores the properties of the
> > SoundWire port, which in some cases may further constrain the allowed
> > params. Add additional constraints to apply these restrictions.
> 
> 
> > +static int get_port_masks(struct sdw_slave *sdw, unsigned int port,
> > +			  struct snd_pcm_substream *substream,
> > +			  unsigned int *word_mask, unsigned int *ch_mask)
> > +{
> 
> > +
> > +	for (i = 0; i < nprop; i++) {
> > +		if (prop[i].num != port)
> > +			continue;
> > +
> > +		if (prop[i].num_words) {
> > +			for (j = 0; j < prop[i].num_words; j++)
> > +				*word_mask |= BIT(prop[i].words[j] - 1);
> 
> The shifting would be broken if there were ever any 32 bit Soundwire
> systems, and I guess we might get warnings on coverage builds.

The minus one should cover us for up to 32-bit audio, although
technically the soundwire spec does allow upto 64-bit audio.
Pretty niche but I will add an if to skip things if the bit
depth is too big probably better to be safe.

Thanks,
Charles
