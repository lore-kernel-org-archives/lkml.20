Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794414316;
	b=aBsp9jyGab2WUA8Vz8V77S2Js2au5bCWEay/g/sAgmtiX7HIzm/oTeBUf+Zx3uUF13a0
	 7lx4AQud5bPyfQ+9yOF0xl5YlstxcYFsoM1MQfKk1E02PET6TEgWF0/K41OMZueXDLZ8z
	 Xqy5OW8KZk5t5N2gmJAS3TqB7SNgn0nAmQcPR2tb5KWylCt1VHGbk5nXO8SYVt8RfuAnC
	 0WnzI0xnQwVR/9AaXYpqcODMvSzK7IgH90bb1aQXDYL+lVzj/hHU3QtACyoDq8Pq3xx+a
	 nl8vwi80rchyWl0Eq+0QpCun+DJC/HjzOJsRMLfhdkxtNNklfx+OGdHddDHRx0KREoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414316;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Reason;
	bh=j9Vp3IeU7sB/6UPNH+KEMeAns3RXAL8HJvNiIIoi3Wo=;
	b=oDW3mjaaYH+kkSHBwusyfR11Y8tLVxTwh9EMkRMdXcSkOkaa5Gx2mKSI9pWxsx4zvDs2
	 ee4mCAYEr6F4wxXYE0mPr8GdQuTy5fdKz0HwJCMLC4jcGQhtC4GgmE9oEXigQXaqbOXTp
	 YSqPLjSjVM1v/ZAkZmMKy/cyalGUJBPmXKqbvdcIkztZpZLa2CL6lad2+WOu7jn++sS8L
	 sOlyhdiVCmaZvS7wW1Q2x0q9LVc4c4qJvInCLtnjIKcfkcKahU4jYGphyqw4DSVOZDwgb
	 f2kb+swF5+R86lJQFIdzVw7TBa99a019VABKFGN1NLDJTGVldqIGFQHIuXvIRenW3vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=awatOGTb;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=byfMziYr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BCC606A33B;
	Wed, 11 Nov 2026 16:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81BCC606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=awatOGTb;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=byfMziYr
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABFx8Ym3144134;
	Wed, 11 Nov 2026 10:24:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=j9Vp3IeU7sB/6UPNH+KEMeAns3RXAL8HJvNiIIoi3Wo=; b=
	awatOGTbHcpsULr8azw4H+ewPUSnzC5eeUOQhjZOSNNlIUVfbIl9PwmXSLYk5S98
	Piz9HTNN0PiegQ2tvaExaQJNkWedkJFY01cpnW5nOlGfyZI51U0boP610d0RKY/W
	ok0JxVa/tsRlgh81q7FBrJ8DF5DsqXP9U8zSTV93w36hpPUo4tZXMFLjiQ76dLr3
	3K3tW4HLJ9iY7s6xlzWNYov59hyvqG2xvw2XWUI3KQh4Do0QN1W5GzLKfCy9yBf2
	7/F8wSPtGe66YWsIcaouFbG3iVoiRnn0UyUgtEzP4xuW0bNukpo5naMzTFI8q0+V
	bPA834pDxXu5c/2ygat5Jw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022089.outbound.protection.outlook.com [52.101.48.89])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hv7rf9mja-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:24:55 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Szx4LdzpSAf1xglf+S+4kPkwNTmqVPiligGGuQnchCPic4EhJk27ReGVx2CZWsLqsIz9bff8S+jOj8jo9/HsIUA2k6I778SXiT8tvH6Eex63jjqDO7j2tJ120Cwlc9KAmjyKCgfpQxzCRuqvTE2prSVmecV/CoHctVlqzGcXJiN6bBvqgvGbi8IBjXnc0o+Xve9ycZCHjhyHgjeYJ0GP7o6L0Kslnk8nMqbRXus63z9NdvMEoZaRVbU6FZxlnHVfKRaaO7ED2Sty+WH97vQysF3MPvS61LGYy1qt9UIZEjDjC/8LuWJ1hz2L8DUeS8KcfSxzao1vlx39HnId4WsI5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9Vp3IeU7sB/6UPNH+KEMeAns3RXAL8HJvNiIIoi3Wo=;
 b=t7Ww6Qgb5adGs+F28y0nEAFEkZWWxD759t8wVw5ko7lnODnQhv8BJR+TN3x1YV1r71i6mTUp3yKBxcHKcrO7Bj3XrSRy8mUbS6/dk+onEKU8uy1eJVZcDJZ8nmkcDrnvFrASJbUVSODYWbXsh6y3bK3+RzzKsxUzmSZyEpYUZI85EKcLE4m+Pxl7xwsDNiu35c6sEt4Kkf/jVyLOzCAe92enBOQi/27oTB+emv0qXDruFxzMMaX9qvHc9Net6j/Q+EpZE2PDF/iRi/cHb9xTZk8ezk8ain2fF3Q5ZwlZbjwpvX2JpUtTJSDtbQHBgqpnv4YldJbjMTY0IA9QrTjiow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9Vp3IeU7sB/6UPNH+KEMeAns3RXAL8HJvNiIIoi3Wo=;
 b=byfMziYrhZtQh1ETgE6adADgAMEG6Ae7wnrsYiUQu1s5BNdNnudyfg0ORnK6pL7hfTwk4Der8xtS/ci+wuq7LWUhZC0LQLWsogO5W+oHOnb1UUHuscDkUyQrbFtgXuksaWzA0tdXk/bQKWcAcLi5KCcTYs1Poa2S6ekPBWN+rvs=
Received: from SJ0PR05CA0160.namprd05.prod.outlook.com (2603:10b6:a03:339::15)
 by DM4PR19MB6415.namprd19.prod.outlook.com (2603:10b6:8:a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 11 Nov
 2026 16:24:51 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::21) by SJ0PR05CA0160.outlook.office365.com
 (2603:10b6:a03:339::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 16:24:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 16:24:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 90F42406566;
	Wed, 11 Nov 2026 16:24:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7B641822540;
	Wed, 11 Nov 2026 16:24:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 1/2] soundwire: Improve channel min/max comments
Date: Wed, 11 Nov 2026 16:24:44 +0000
Message-ID: <20261111162445.1371853-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111162445.1371853-1-ckeepax@opensource.cirrus.com>
References: <20261111162445.1371853-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|DM4PR19MB6415:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a4cf15de-c58b-48ac-fb51-08df40104f3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|61400799027|18002099003|22082099003|16102099003|56012099006|11063799006|10067099003|261102123227099003|261009223027099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	Led1x86uW7NjD2Tdwo0G8pkclxBr94UZKAHWvZ1BNJmfN8tZkMIDZrICeiEjQ1DVHMmz+nYQ4nEjgMJN90FB612Wc54OmwXSmOLatjA66Zlyw+x0jii/Y1QoOpi+pet29Z2PMV/ZRb1j2reAvyEWKGczCfJb8OqcEUhr5ucgatQwJx0uc5pVh26T0VBdUqkdW8yxQQS5kQPkxlWmzZj3viy2oVpUucnTJikWwExeTQcQWYkNXfzcRaRJdBFtNNTiXcnAP664RgczhndQaMfDkznqsc2NHR6nLfpj837rYsMzKH2qBIbnzu7RY89rHmvBUspU6ThhP9yfXd3aDnwWPHNNQ3fT4catMJhixi/hF3GlDhJdZIbGJmSvZAYKYAwG67+OXDiXwMokg5n81LALp76FEP+AzAYS/ZMXO5LUzauYYguzGU2gfT++o7zi/daAHNTkf8cPkq2a/IcbsKmoIc6NF5PT9e4XgakjIbmSY2pcywIgo3bbWnUvuPbiJ42FYVYGNXgXNTmMO5uoP9qFqtJ18hofhvG0FSHQlccunkHxqdo7txZ39zqLWCBBRxjWFSxIPzEM5DyHhIT7N1yoCiuQeAEanc86EvZicTw40HNFS0FgstA0p880ufSo/UDwyP6Ms2RX8lZewyq6Sa7bhbPKEUeRN8nuwF8ACPpkSuO705RxxkNWZx355I5Fhe4evXLGsO6Ps55OcCEsgbb9og==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(61400799027)(18002099003)(22082099003)(16102099003)(56012099006)(11063799006)(10067099003)(261102123227099003)(261009223027099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VZ6sbA34sEyBuvgXWG4yiljAnTr1sUXKh7mazAC+ULriVDgPGrprwf2JzfNly51kfj3cbyMYJ27vuO7ad5K6QLX7iSbKv9GSfEcvuFheLkjYOnRG3/cbVPKB+DbTi/bozMLz5KJtRIaCIm1hpHzYiOTa5kXNAsUjVbx/VGpFGnGV2Nr7UW3EG9Fw/shKcY2/WPnXwztoJrPhXA+FZsoF6H3PEKpBul1Wi/90FpTvyRphgJznM81N6k4izV1c1ugg4lLkg4tuB9mmI4gf3sPIvbDeFpFDQ74i3sdAeHGJ0gqp708MtfH75H8pIFweE0OHagF+485l0mZwkSXJhJ1rFqu/ivuKDeC6UBrDEvrQMefPJgrZb1T03ElM9ERYnkw25gA273MUfXhE0XZcbMdgiawZbMhrDbcR1hTKdDa8vP8VT1Pqwop0CpMtXFCm3zVI
X-Exchange-RoutingPolicyChecked:
	bpGRakvjuo9wUWsRRq6V73nf8IUursw2MtNy8nbhX52g1//XmDJuAqJwCojDHXPSUuZm3BjVO9dd72KlYw9Y7WQ/yS7AgQ9cK0q4PuYRaT0yn+vUigJnS8Po2kvVipKDehgvPa61VSAOD0TVsslaQBSyhEy4qyNGiDJ+BslhAGC+EW7e/ANfS8Z3AZFF6az1rKP9nmSyG7persbrc+DPEQKVK470EFpOhjiQ6cGSfoCGiyPoYNKM8HLy40IILWZYWwIAu5gnSlHFfZ1+JHZktvQScxBXb3NaWrXOB/Uvs+abpWKOlSmEM/maOHI/QTumRG3lfa11vi/qkSsWm1KnMA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 16:24:49.9655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4cf15de-c58b-48ac-fb51-08df40104f3a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6415
X-Proofpoint-GUID: b4A1zXRkB_mS9x-8S_c0qFREkmBrB4py
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NSBTYWx0ZWRfX5KTuAuSpWaFQ
 RSYTaKML+DJ0N97yYVRslQb6GSF5+Q1Ltb+MHLRYb8U3EIxv3XUE9qtBghSlesShojl24wPd48O
 w0RA0+cMLgyeVUUJikJO1jfQxo/9rLg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NSBTYWx0ZWRfX4fXZ0i6NRiWU
 FMeMq7z+XuvRidFxS/8F+GvA4zEM/R4e2VJqv7wqhLjSptHiQJzRB/HReqYPU055yB8QOTBewL8
 rJbxL60lYgHnGZM1qUZsle8GDMW6K0v9/4G9ZUSkW3AikK2dAW/oO5dk75TqneN0kyWsl4kEfdi
 zwGRQby75hprBT8g9QThn+tslSFP4qhWCaA6z2N5fK3zjHeW4Nb2f9P/qeUyQzrWYnreLRgSqIS
 qjEfHw9lOfHCPyD4og5ehVM7cmFRmo++qvw44agBXpKr4mUuTopZz7/WNjVYaRhNB9CPru/23L1
 fZe+e9E9qTpHPpbw5LPpz5tt5rpQjaTQ0sLFHzcWakqFQ7OV0fbzO1MfaJzPtDeEgEQgOQ54joc
 8ySo5SguvFBWDTbjG6bpOvT56ZGwd9lRf7f8kNHKsT+100AlUcp1j8yL/RaDkV3OLn4cb+GzegW
 NENSnxizvTS9fckRuKQ==
X-Authority-Analysis: v=2.4 cv=I6Hw19gg c=1 sm=1 tr=0 ts=6af496d7 cx=c_pps
 a=88cenwDluC1K+zw7ozncdA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=SIj0_KyXEq0NIwT9P_sA:9
X-Proofpoint-ORIG-GUID: b4A1zXRkB_mS9x-8S_c0qFREkmBrB4py
X-Proofpoint-Spam-Reason: safe

Presently, the comments for the minimum and maximum channels are
misleading. In the SoundWire/Disco specification these are actually
channel indexes not a count of the number of channels. So for example
min_ch=4 and max_ch=5 means that 1 or 2 channels are supported.
Update the comments associated with the structure to make this
more clear.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/linux/soundwire/sdw.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index f710e5932b4b2..b8f5ad39e9b37 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -289,8 +289,8 @@ struct sdw_dp0_prop {
  * @ch_prep_timeout: Port-specific timeout value, in milliseconds
  * @imp_def_interrupts: If set, each bit corresponds to support for
  * implementation-defined interrupts
- * @max_ch: Maximum channels supported
- * @min_ch: Minimum channels supported
+ * @max_ch: Maximum Channel Number of this Audio Port
+ * @min_ch: Minimum Channel Number of this Audio Port
  * @num_channels: Number of discrete channels supported
  * @num_ch_combinations: Number of channel combinations supported
  * @channels: Discrete channels supported
-- 
2.47.3

