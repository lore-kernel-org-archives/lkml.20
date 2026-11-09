Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794246045;
	b=iteH57nYKTv7pIV6H2S7Mz3m0jYc5J86RXXSCUfPH9PXRi83Ue9cl2peqb9RnHr4awkK
	 iYcNOtOLAjgqZmWfhIdYEMrw44yifpqw7RN5cw2nsRPs1ukLDkwR+84uX5wuNQdffGrjM
	 OnkpmTSIFIDSXobfLDXPC18JmfOwu2Kc2XhaDm7QpQjiW1jS1n/v0jgTJQOp8+V0/iJa5
	 i6WBUNZ+lM1hRzBJanoroN8M0vNIYhYUYRDyPBdO6ewcwrAt+rsXD2G7S4E+zd2TntNKg
	 v5KnRkYYIfD9vJ3MjPJbaZhfIyPVZdhwFo2fHf2cLacyq+MW8fdzh1q14fUYYzOqU8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246045;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Reason;
	bh=vAPNP7k8fRTJNkljGqCt8tGKj8NJj3EQLHzOti8QkZI=;
	b=Z4WofEakLZBgO16Cwx/moa1XvJnfCj/aTuMEWpFW/COv/ZH/rhDjR+ROj1qwNwmfAyaj
	 7LqK+kBBCItd7xw5HAQlBB6/7yA2BK5T+kfbfnNbwG22agbPvclCJ/IfdGo57G8Qyyx+G
	 T74jcJ19NmKgjXlogsDoDjBUDoOYfYgFMenTWIpYEWLRHrE4QkP75/JBW+sRM9NjJ8wyw
	 gsnegmjbwA9UrC5jJm5iv1inc26gDvbrCEke5PiVIKjaD06iEUXDSII0mWNw4qDXpLaOd
	 E78Iycnnrcid3reQP4VXBGaStp/o4MCANJOQjZ0WPVaR0JWFfZzWcLRbDAB4E69lKRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="C8FkQQG/";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=cFbaUdan;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF078606A335;
	Mon,  9 Nov 2026 17:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF078606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=C8FkQQG/;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=cFbaUdan
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9HbpoP3535529;
	Mon, 9 Nov 2026 11:40:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=vAPNP7k8fRTJNklj
	GqCt8tGKj8NJj3EQLHzOti8QkZI=; b=C8FkQQG/XeUbA3S7Ri97EJ83wgS/i0Hx
	bxDBHoCaSBk9l9xRwdN/mqNMhrszaJ/oThbTtVoERHTH8ChC9aXijDAQ9CQvjLgM
	rak35KWC2AdIEB8WwgDRjUNx1aXSzvqtdQMbm6k/L9EdQsI9ZnYpfDSqDldpjxyg
	Aa/qMC7AbUu/vyz7qzZ3G569SAX6BnqS4nAEAGZ3hqRUWrvCOK0n4psqyxhQHZU4
	iA+tlWl0yHdRAl+7QSZB6SgYhUP1c0/o2GGvHJ5Mcti9HVEcPNAkXg9DqjpcsxPJ
	BrTKEkTrLkRbPc5JHcYLDo/TkYyS8omYd1pUXlZLSKKoztm6QM2QsQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022143.outbound.protection.outlook.com [52.101.43.143])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ht19paj0h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 11:40:38 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gcpQozm8e57874ZsWr/oFLVwBBJu+d/dBQYHQnnO3zB5fSMbRPiSrLD0KQB3T+ckmo+SViIbxV/lNqP07P2+HpLasO9htbk+tn1Ld+auhak6IJWcZp6mEIOaiED7GcYK2rJGERhX/YfiExgNnq3Fa/8QY3eRUXmcjCaLLoOolXoXQ9jnXJEr+QaGaB+b3Si78eSr3tzSEHBZhheI5YiuwKpoqc6hRQBm4JhfSKg/KD+8EThm19HRGjQSgiIWh0fXbtZ838ICbrWMFuaF/hoSe1JT5sy8uz/e0WNdbE3wvIaaZpJQ7t3lrvZD2S9zCmXU/ZrbW4dc5akXoLOEdOwrKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAPNP7k8fRTJNkljGqCt8tGKj8NJj3EQLHzOti8QkZI=;
 b=WOwP4WzDqBFjeoqL+cPivPzHll/+NI/Di7IQXbBcmH40oKXTIWvm6PRmBROeI9SrfAVAPI6LJcC5DOPjxlPwwk+IdoCA7rXzKF3lZ2g1GO+C7Epcd5CKtLXtNczZa2gVAUwShbbrGtIQ8Wn8HYKDUKgI6T7olkyKh0bqwS2d0HMthHEctnikUkN+0G2+gj+yVX2KbNl7C7myBlAgkmJ+WKMumVPF8lncegmQxDwJJRB5mw3oKvQ3nKRliXKusl1cnkUlGcnjDDVm43JA1JCnT0g1zLw7mVXxcRc0e0t8Iy8fomzHwDWB1u197CjN2z94c70TpJjxRpRNoiSwBobGAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAPNP7k8fRTJNkljGqCt8tGKj8NJj3EQLHzOti8QkZI=;
 b=cFbaUdanINbr41ZQuE3oDMUtdyp1fM0xmKyuyvUzjy4FpY0XuQXKiG6PiKgW8DHXkx1iwQg/sLCR9NmfqX06csYzCzM28Zb20Q/P+AtOEA8k5t3KYdSCMaCyAJeMigjF8rd7HZZhCHoefvZy/FrmYOF/OFRrx6bHVz4Nn1MSSEw=
Received: from BN0PR07CA0028.namprd07.prod.outlook.com (2603:10b6:408:141::27)
 by DM3PPF7326C9180.namprd19.prod.outlook.com (2603:10b6:f:fc00::736) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 17:38:49 +0000
Received: from BN1PEPF00018074.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::66) by BN0PR07CA0028.outlook.office365.com
 (2603:10b6:408:141::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 17:38:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00018074.mail.protection.outlook.com (10.167.245.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 9 Nov 2026 17:38:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0CA6040654E;
	Mon,  9 Nov 2026 17:38:47 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DE7D582026C;
	Mon,  9 Nov 2026 17:38:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/2] Update handling of min and max channel in DisCo
Date: Mon,  9 Nov 2026 17:38:41 +0000
Message-ID: <20261109173843.4184154-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018074:EE_|DM3PPF7326C9180:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1dfc3f4a-8799-47d2-d731-08df3e884fec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|61400799027|82310400026|36860700016|56012099006|11063799006|261009223027099003|261021121427099003|261021123027099003|261102123227099003|10067099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QqfEQc9u+farMCX26tDTQNMmZ4Xt+PTRmBNlViG3SYY1VyRyeqTtpsf4j4/jNvlMMpJl8r3BYaK6UILl1ZufWjW/YpLFglmx4CZk6L+kX+sIm4FtysuLt3/Dw3HF2/12Z6frVQsxDydopV0l7LLjXGfhFsgwnACblAC0q+LbW4kiE7deLSwJKIF6XXJ4Ha8w3TFRqiHaBEfev2+pVtCkVuzvNatXv2wq4pso7FpMiBNWPgIF69gNS+qya23zZoJxapBl6cqrmBXVrIi349PZSFAwI9Ms9k/BcRXSxV0LM4my6n0bxCE65P4DsaMKKVUH2y6SNGY2g0kyvv13jAnXT+6S3/imdIl5BZndzvexAr/Chol3KtBSr/DfW7iAyzMf3rcoKTc22lTwH8IB3QamPr6YTfM1xemcYcKd3JZyqUG4VIwEVawI2er/zwyEmBl7p4LJA8f0dMwnJk/wiL5ReIqcL9RJS56RFcSAMN1TDfEkdUXeAfpqUvQOv7wLQhi7+Drbgy9YZ8IcgR58ymzIMHSzXbL5sJLyPRfaxNEG5k1JPWlOt9wiU7yv2qkmoqyZlS7GxVE3WBYhIYjUcR7AevG9QUHk5TGW6XvbaMFRBuXoSqDULqRXOzbvWKplbeb5K9FCp3tuK5JY/qraaQr89E7/JE0fqceyyxDNbTt0u/RsUb9IU3QV9cCRTFlxCKbW9PnYIKgTKZsrEzKS7QCOuA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(61400799027)(82310400026)(36860700016)(56012099006)(11063799006)(261009223027099003)(261021121427099003)(261021123027099003)(261102123227099003)(10067099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hUmwvR7Kmqzuc0li1XO6Ui1ob5iypqKAKDkgrgSeCEMDv2uQfBcKg1a2qIVW9DS+iLyqcuPvYPkuGSjDzEUgPXBQJf+aPgpVP0qSyKUHl0TZoeXdMDLEXN/pbOouxuVxl2BakK6Ig+8/qwKJoFfIErhupUYtST0a8F3YjJX+5pI0j5Pen0baa5P30skGBHO/HxAPJK0MA+mdFKJ2EayhzWvZfznpmBvd4LIQRsw7Yto9UfERmcQ2Hm3maM10M+iL1jECTI2vSKasAtuCFR0XoPCYKOh/ooij9ZDMbE8o0TSGt9JDitpin0JXnDEsH4CkrJs0MgmSo3ITiaL50JFZXk664bOD2V3iOGEViOO+TU+UJNRjRAdOs/HiIwHdg97+iEJKRTiqixUdyWPQTq6BoWh1hFM4q59/JFTRvBl0DSTLjhl2ZAGO+ouqIm3UsZ1y
X-Exchange-RoutingPolicyChecked:
	0NzozHMtH7XokVTpRu9J+B9CoWoGAbULJpzhSS5wsUHuXAZM6Ral++IiGPlUVEznfy1G3MFV+6oloJlXFUquKetrJJSzALGI6hLWUbNE5eUXMx6drtCVrAWbFgUUw524jZc7EPonmKrZOQCNyeOX79Ss9yal89H2xGfULGZFXZ5ygILaZ6aDPpWuVVrfQpPftBcyi2gktz8uzGQ4Y+wz76hFdSImvQQAPQPgkJnx80qzaN1/f3zOcmEg8tMSRRA2gEIi7OWs4jKfJwYi9sx7V7IHbM3aAbZT/E1+N/9qO4wFVscOnKyMdQMIIRH2Gcg9DHtGlFGg+4Qi5iXBRGShIA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 17:38:48.5087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dfc3f4a-8799-47d2-d731-08df3e884fec
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00018074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7326C9180
X-Proofpoint-GUID: DD-wtVkdQ1aww-tR9PevbNyn1TAXFRMN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA3MCBTYWx0ZWRfX8SCVIzUyypBj
 kk6fJhbp0zcmP0kMpiibL5Y0ewEKAO6Y4lENXJyQme33y18wWWdp2M6sbjt88BUwFs9qqD9eiPp
 W7DUCxCnK82Kq5mViRtwcEE5Cn7NKvQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA3MCBTYWx0ZWRfX7OBhi43lYdXe
 vYM0/coxZWjq8lMMIREeFTEM5w8Z4hPcJPxC9UvED4zILRhVVWNAms5hxOmzB82Dq3vmdRvmgy+
 jCqIcEG7EkX7tlwsQnROQzief/eoxDCHL/ZB1vhmfSdruJADFFxeunccbYdlR7Q4qwhtJskKvLT
 8dQ6eOl1y3uovC19585bH5rGZKPyLcdy2lgxI9hvkquaMTHudsRdB3gogvnhng89T/mv45jYCWX
 cndZjqB2kXo9MRM/4ogaAdkoRfHG8Bp4qFI3g/2o0/I7EAdIZlM/DbihXFnZmgtvJPF1LI3Fwvw
 6mC0h2PmoTcpMzhMYzllurUfN1nfcAv3J2gcy3K8d9g7kV97MdqHDDJBFgjWy5vU2RYYQepN0zZ
 91/OmJw79kYtesV6V8mJVmLg+2EJxi+Ylc0lz/4KNZLRhKXqCtfSBV29NdjWNqsMQjAblWU3JOS
 nCL4WnPx36SZ0FUeyYg==
X-Proofpoint-ORIG-GUID: DD-wtVkdQ1aww-tR9PevbNyn1TAXFRMN
X-Authority-Analysis: v=2.4 cv=NK5AaE6g c=1 sm=1 tr=0 ts=6af20596 cx=c_pps
 a=ofxP+VRvIeXlqxG7dm9PvA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=Ex7ijrhSia6b-u4GVK8A:9
X-Proofpoint-Spam-Reason: safe

The DisCo properties "mipi-sdw-min-channel-number" and
"mipi-sdw-max-channel-number" are both channel indexes rather than
counts. Update the kernel code to more accurately reflect this.

There are a few Qualcomm drivers that likely specify these incorrect,
min_ch=1, max_ch=X, rather than min_ch=0, max_ch=X-1, however these
should work fine as the number of supported channels is equivalent.
If people feel strongly I can send another series to fix those up.

Charles Keepax (2):
  soundwire: Improve channel min/max comments
  soundwire: Assume default maximum valid channel if not specified

 drivers/soundwire/mipi_disco.c | 14 ++++++++------
 include/linux/soundwire/sdw.h  |  4 ++--
 2 files changed, 10 insertions(+), 8 deletions(-)

-- 
2.47.3

