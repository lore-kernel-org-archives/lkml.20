Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794329302;
	b=dMgynrrdAmAR241RyCbvcsP5+9pqNrNLsnWfidnVfMoXgiw9cahBe8sQ5j/hsXOjCLRS
	 4Od1g53pJnYJYur8BH6fvp8WT53ptUO/btPwm3kwwmcl4x7ArCvmmQvUWx/MHsi21Jn2I
	 mI+POpqzGnZW77Y7QVyq8EbZ+0O+eE8qUFNQs/3n/IGpFxqMQrlXeh3fg9I8JX6ZvAKh4
	 IpnZvB6a7wfCs/4iVtI/KPAJpWfbM0v5mn0RFZ6XT/aFvwNr+YgDV+CTM/AsMAiywIQ5Y
	 hpf84aM346jAFDCDbySLBRK5OJK12gMB9s9BPK5qsTHY0yGXKGoolMSYiMOOYFKSBgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329302;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=0BB8wNl6+Aj3DlX10tCJAtnv/S45w7A1oiJCcS0O0tE=;
	b=ldhJOMKeVGhFMPT+QI2QTe1Sl8rmZiN9h9oOztKUKVI1X+NUP/Xc/PYRsUuy4SCzsqvk
	 rsA8mavoKiqSKj/aH9HuPf4hywYCLmY5vQ+Ek/rVZw+g+9FNkv8AvSY3VL4hpJ2ucJTku
	 ULTt/kNK62PS1M0+xmIMwZenE7ZF8lMhyYQRSXsjfzWAGEDdxuzqNlEFU29qgEr+tibTr
	 thKrJyy8HW4YOsUZHRghFLROExML2281VoFoxMhLw6TgTOU0R22NpPv3KCwFTNR1UVJ3d
	 QSISRvImHFmiWJB8EOS5k21u0dUm4F3Uob7/9Kf139xYACsjTvCBWZur0yDkZd5KPig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=c9M62MC8;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=bnkF0iMK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0931606A320;
	Tue, 10 Nov 2026 16:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0931606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=c9M62MC8;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=bnkF0iMK
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAEx9Q1721585;
	Tue, 10 Nov 2026 10:48:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=0BB8wNl6+Aj3DlX10tCJAtnv/S45w7A1oiJCcS0O0tE=; b=
	c9M62MC8/+0rPkgKh6jsUekVz3FLZlvRKzGxxXUHqQuXkWWLsF1mL3EAytMbAl+Z
	MY+yB3NdNkEo7XJ5kOX+JlT2V+pSAOsHG3q0Pr+GIutGXk8cDVW2/Se7VvFD7CYO
	87hwKnDBMxnmvOhRP1/x52t6Jrxjr8drONsAsc7tqrqxXdNMaTKfWXOYBmIRCRPt
	+pF84oAki6FP1sX4PLHCxrSUnZ8pjMZ/H6bdaTwEaIEbdJo0YTVgE+apoC0WyDEg
	1LSkaFj9xOcaLbBgeutZ3hFnwWXYgCgBGTCL9YZEoR7KIhJ5g74h4KMiPOKOvtI+
	s0vJH1hB+yvomPLErwbNWQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023127.outbound.protection.outlook.com [40.93.196.127])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ht29hc2yj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 10:48:18 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Omxpkz0bVQwgWO4Q8JeAVOVvCS6J/XmSu43WUwMgLUAR0/M9Wg26q+0YzpjtvM1d8s6b0HIwcKpTmfTDm6biBxE0VM9xu+TH+56dcAGBavejzRIwP5CWxHagsx2zAfeVAkGFahmPEJm0G68nYphOT7r8CeLReX37DMJkmgA5t2J6C/uFTRYd8l/CAV0RTbHOolYMEU4Oul7Y9ubwEKb/F1vE0KsFnI4AQt26TTvm1mhk+IEcwo6VLO9VeqPuBeIenrIjTpQaK6BJxclZUvoLgePztL7cNdzm9Qub2GtzVIf2z8zw0B8ST2MVQen9tUaet+r8OiyTVOhC0Q9z7Y/nKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BB8wNl6+Aj3DlX10tCJAtnv/S45w7A1oiJCcS0O0tE=;
 b=aaoLwifFmKJMFB+BQJK/5qvuYEFZ7XUTigKOb6S0lr8mmepjFNYEj/z/8HuAXqC9M/iqdElTeVCqbzcpjTCF/qaVcBAufio4INHJ0bIhJ8nJw0l9GuTET+jD2uR3DuAxV72KvNckSXZAQhaJF3YM93XEaNiqjXe6LtEVqRU4jSU/SlWSzzundvS6CQW9vuu2Pcl3lnFqR6wLhjgQSRyVBTRLVgi0bSsZIAYjtPSYc87e1DKXFLYhgyIiQbqBTXbjq4bpVOUmJ1PvawX4rFv3Z2PwAyh0q+Ramt2cu3gw4ipyhCiSOT7OSZkIu3v4WyjbteFN4IdmKfrYOsu8tf9yig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BB8wNl6+Aj3DlX10tCJAtnv/S45w7A1oiJCcS0O0tE=;
 b=bnkF0iMKkwgMTXIISBCL3n37c+xXumn2/594RUTNkqXcupKK+doO6zl31ARYJ2qSysYn4pb55GJZr1fAuBoPRxE9IvycBViXjHs4r79eQq9iv+Orpcn63mNF3JVL84K20zHuOb7uqHbzvKhJhm7bB9E/i+4XujyPg2J2K3Zoq2w=
Received: from PH7PR10CA0019.namprd10.prod.outlook.com (2603:10b6:510:23d::27)
 by PH0PR19MB7601.namprd19.prod.outlook.com (2603:10b6:510:26c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 16:48:11 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:510:23d:cafe::3d) by PH7PR10CA0019.outlook.office365.com
 (2603:10b6:510:23d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 16:48:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 10 Nov 2026 16:48:09 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B8DE740655D;
	Tue, 10 Nov 2026 16:48:07 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 979AB822540;
	Tue, 10 Nov 2026 16:48:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/2] ASoC: cs35l56: Use Disco FEID and FEV to qualify firmware filenames
Date: Tue, 10 Nov 2026 16:48:06 +0000
Message-ID: <20261110164807.1671681-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110164807.1671681-1-rf@opensource.cirrus.com>
References: <20261110164807.1671681-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|PH0PR19MB7601:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b45446cb-4817-444a-0dcf-08df3f4a66c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|61400799027|82310400026|36860700016|261102130727099003|11063799006|261022105027099003|261021121427099003|261026140227099003|56012099006|261021123027099003|261026121527099003|261009223027099003|261022075727099003|261028144727099003|261102123227099003|10067099003|16102099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Z1jI0Bc/pPFVnN0gK5khMwIQoSZe/IQqquJzgVm6uSSMjlPBqhpGWgp1UBbH+N4j4FAEJMBejmkaKjPvpzd4TMy/1Z6Mh+wMcI1zsM9V/7zpOhxLhuNCBNEg9nzeYz821f/Y3e3pTfcuoQuTu+LTXrdKVE3ux1KRtvzIIz70xUHc1jJeZpzvSKqmIY03gqXT/0Jw2ed025ysiW0i+qhrohAQTFjHio610IrvlagleSUkTinrPJ+mfgAGLUpxctwiZpwm4aehZ5AvcYm4GCXBOHO9BvQzZT/rS5vMdFkp7oTRzxyzTiS+AywhiMoyX1aeBok5iyTKLV52/BD2UD5wC738rcc0bXOVZ+/KeM0f+fuRGZA1HKTOpjtsNCIYjHVQ7KPZBtHETdhw6Q+s+vHInjcXgTkV/MpAuaql0XqjzFUVSlzoe/753hmt+9lLt/DTNaKBbCnO34kxLr21Wnd8f9krJGeRk5ibEs5UoCo7QA1OgBaOPxFJ3ZmJbznfHfvalsRm3ChHsfMDjr3UYf5W4IUNiufcONCG8vQPScHQ5i4f+MhqUQeSYnBhGjyYf1cO4hUigmgiQ25GCgr7nRjya8vHA5HqcXUtnehN4YaC3/2Sw8GHhxGODgudaJxowPVrA53yG6JbBESJyhYPHHMKiiNl//jYbSV6mCBqMuzek4W6gyE9feFCRGwchZ1DUqfdQ7qr2Ostxv58i2g+6jxL6Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(61400799027)(82310400026)(36860700016)(261102130727099003)(11063799006)(261022105027099003)(261021121427099003)(261026140227099003)(56012099006)(261021123027099003)(261026121527099003)(261009223027099003)(261022075727099003)(261028144727099003)(261102123227099003)(10067099003)(16102099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kCCwv//RCgqvCtFW/FTHmqW8YWyXhCtb8Cbt3IawhXNau/mv2QxACr3r2NU5gp72fmDC+U6jLIoflD/TJ0lVO0EYSiekbz8YL4nCVVsW9B3sV1seqcv0Vijd1/yydNaSamDKmFyO3Q4WkTZuupw2p06HUrVti1C2kl/0YSTCmJ4swlfhIVlm9jW7OPQLH1oUmDBmw3KuWHfenDY/PQCQajXskroavH8UYy74Wjeepj4WcpyjvY72/BhpE9hNXdV9/XoM/iDgqRWOUGY6H0yfIrxBAz9WlqE8ZFcnwk2MG3PnqWtgLQCrOguqlwnMItajpubB4BY4DbUAXKWnhT1VvVbbtlDtUwK/DZQoiO9AWi5K8NvHg9WD8rN+1DhOo0vq4RKG3ol/cRFP7MBa21/67LCoQlCw9UkJwz4FIQAOh2HooNnQBrKuWTQ0NEw/8bfS
X-Exchange-RoutingPolicyChecked:
	R5c6O20lFoyZSS1cJvrQ/vE9KtiosCCdCW+yBZ2jbRif9RwrJNpRAUA0CTd+Uvd0434wg9GYsLzMnYQ9aivfVr8HdMHiXwTuraR0RjV6KES09h+aSsd8SXAqyluMr/A5u17Qpv3RBn72DEk4zjVG14gxDmR1WgN3+QX9/KQv+69iiM5xD+jmprvayOrotd4CS1AS2SnqQytxmxK3iuSw03ldhRrGa/6UOqxhQvEBFIeT+gYCWXo77cnhJQvIU37ireSsJVR0YQDZTlOWE6t6OIAxrV0xy9fMEEMAQCjr2J7cn+BKTtc5J9l+j/UYJ+zerP5xGasIyDY6ptNNKcRpzg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 16:48:09.1071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b45446cb-4817-444a-0dcf-08df3f4a66c6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB7601
X-Authority-Analysis: v=2.4 cv=PO2aavqC c=1 sm=1 tr=0 ts=6af34ad3 cx=c_pps
 a=wzgbdcG65ZVbW594nUvNmQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22 a=w1d2syhTAAAA:8
 a=Ss7JtY-9jOKR3hP5VG8A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX3OjDkfP/zhAG
 mLOaviVXv8BqmftdzKTsI9Gn0M0VrqTCeoj3qkKTh9m7CU3hUo2wTOW3Y8nXwNttZDx+rhx9RQ3
 rGoEY547/xSagGGaf1NMckqqY8sEJYg=
X-Proofpoint-GUID: YtPXGOYa1huZrVNajM9bQ-zg2SX2QPVd
X-Proofpoint-ORIG-GUID: YtPXGOYa1huZrVNajM9bQ-zg2SX2QPVd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX+OjO6PtdRsBd
 tDpWTyWk3pOafy0e2ex5TCwy46pG92xtwjTgThldlCxhIeFInf29mRrbzVgOBJ1uo1hyzRuEXfe
 UtPhvPywSaN76x9U5jzJaHukOxkR+cE5R/S6Y3XOOUTStXCfRMEIyodqDizNYLmHnXnYzRJQPp9
 qTA8B7nrAW+UXila5hmHib+6NbUXRgX7Sw+H7lQ7gRgeekQLMun/dAQd+gSsVwLxUPWc8H2cQjD
 l8ic1loL7ZyJDS4uiUeQxdSrJ7wxsLme+fMjYRZXL6TYDCG1fJ6yfk9XNgzW1u96unEpBm4tTQV
 /kN7wIWtBOvBzLccl1daGPXdt5uOve266JUG1o2gAdww3BwJFPJHHsgkwiIqyWsUDRP49M8kFt7
 KPjt0mmTNToh+zvIaCsWSVQmfrJtdaCc7P1vYYYebUpz+21Kfo75lhSZXdgvwC8J9PB9xXL2ymC
 q4LGNDzw9y0eUiKONsQ==
X-Proofpoint-Spam-Reason: safe

Include the FunctionExtensionID (FEID) and FunctionExtensionVersion (FEV)
values from Disco as qualifiers on firmware names. This mechanism is
required to support new products that use CS35L56/57/62/63.

Some manufacturers are starting to re-use SSIDs, and the time between
re-use is decreasing. The SSID is therefore no longer providing the
unique hardware identifier intended by the PCI spec.

To ensure that the audio hardware can be uniquely identified, the FEID
and FEV will be included in the Disco for new products and must be
used to qualify the firmware filename (unless FEID==0). For products that
require an SSID match, the combination of SSID, FEID, FEV will be unique.

The implementation is backward-compatible. All existing SKUs either don't
have FEID in Disco, or it has a value of 0. For compatibility with Windows
behaviour the value of 0 means "ignore".

Behaviour is:

FEID missing:          Legacy behaviour, SSID qualified firmware name.
                       Firmware system name only created if SSID available.

FEID == 0:             Legacy behaviour, SSID qualified firmware name.
                       Firmware system name only created if SSID available.

FEID > 0 and < 0x8000: Firmware name qualified with SSID, FEID and FEV.
                       If SSID is missing the system_name is left NULL to
                       preserve the existing fallback behaviour.

FEID >= 0x8000:        Firmware name qualified with FEID and FEV only,
                       SSID not used.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 163 ++++++++++++++++++++++++++++++++-----
 sound/soc/codecs/cs35l56.h |   3 +
 2 files changed, 145 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index a4d25c287941..b44964a13111 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -9,6 +9,7 @@
 #include <kunit/visibility.h>
 #include <linux/acpi.h>
 #include <linux/array_size.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -19,6 +20,7 @@
 #include <linux/math.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/overflow.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -32,6 +34,7 @@
 #include <sound/cs-amp-lib.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <sound/sdca_function.h>
 #include <sound/sdw.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
@@ -1387,6 +1390,9 @@ VISIBLE_IF_KUNIT int cs35l56_set_fw_name(struct snd_soc_component *component)
 {
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
 	unsigned short vendor, device;
+	char ssid[9] = "";
+	char fe[10] = "";
+	const char *separator = "";
 	int ret;
 
 	if ((cs35l56->speaker_id < 0) && cs35l56->base.num_onchip_spkid_gpios) {
@@ -1406,20 +1412,38 @@ VISIBLE_IF_KUNIT int cs35l56_set_fw_name(struct snd_soc_component *component)
 		cs35l56->speaker_id = ret;
 	}
 
-	if (!cs35l56->dsp.system_name &&
-	    (snd_soc_card_get_pci_ssid(component->card, &vendor, &device) == 0)) {
+	if (!cs35l56->dsp.system_name) {
+		if (cs35l56->feid < 0x8000) {
+			if (snd_soc_card_get_pci_ssid(component->card, &vendor, &device) == 0) {
+				snprintf(ssid, sizeof(ssid), "%04x%04x", vendor, device);
+				separator = "-";
+			} else if (cs35l56->feid) {
+				dev_err(cs35l56->base.dev, "SSID required but not available\n");
+
+				/* Don't return error: allow falling back to default firmware */
+				return 0;
+			} else {
+				return 0;
+			}
+		}
+
+		if (cs35l56->feid) {
+			snprintf(fe, sizeof(fe), "%sf%xv%x", separator,
+				 cs35l56->feid, cs35l56->fev);
+		}
+
 		/* Append a speaker qualifier if there is a speaker ID */
 		if (cs35l56->speaker_id >= 0) {
 			cs35l56->dsp.system_name = devm_kasprintf(cs35l56->base.dev,
 								  GFP_KERNEL,
-								  "%04x%04x-spkid%d",
-								  vendor, device,
+								  "%s%s-spkid%d",
+								  ssid, fe,
 								  cs35l56->speaker_id);
 		} else {
 			cs35l56->dsp.system_name = devm_kasprintf(cs35l56->base.dev,
 								  GFP_KERNEL,
-								  "%04x%04x",
-								  vendor, device);
+								  "%s%s",
+								  ssid, fe);
 		}
 		if (!cs35l56->dsp.system_name)
 			return -ENOMEM;
@@ -1868,31 +1892,128 @@ static int cs35l56_process_xu_onchip_speaker_id(struct cs35l56_private *cs35l56,
 	return 0;
 }
 
+static int cs35l56_read_subproperty_control_dc(struct cs35l56_private *cs35l56,
+					       struct fwnode_handle *node,
+					       const char *subname,
+					       int width)
+{
+	static const char * const control_dc_value_prop_name = "mipi-sdca-control-dc-value";
+	u8 val8 = 0;
+	u16 val16 = 0;
+	u32 val32;
+	int ret;
+
+	struct fwnode_handle *subnode __free(fwnode_handle) =
+		fwnode_get_named_child_node(node, subname);
+	if (!subnode)
+		return -EINVAL;
+
+	switch (width) {
+	case 8:
+		ret = fwnode_property_read_u8(subnode, control_dc_value_prop_name, &val8);
+		val32 = val8;
+		break;
+	case 16:
+		ret = fwnode_property_read_u16(subnode, control_dc_value_prop_name, &val16);
+		val32 = val16;
+		break;
+	default:
+		ret = fwnode_property_read_u32(subnode, control_dc_value_prop_name, &val32);
+		break;
+	}
+
+	if (ret == -EINVAL)
+		return ret;
+
+	if (ret < 0) {
+		dev_warn(cs35l56->base.dev, "Failed to get dc-value for %s: %d\n",
+			 subname, ret);
+		return ret;
+	}
+
+	/* None of the values we need are this big */
+	if (overflows_type(val32, int))
+		return -EINVAL;
+
+	return (int)val32;
+}
+
+static int cs35l56_process_feid_fev(struct cs35l56_private *cs35l56,
+				    struct fwnode_handle *node)
+{
+	int ret;
+
+	/* Either property overrides default of 0. This matches Windows behavior */
+	ret = cs35l56_read_subproperty_control_dc(cs35l56, node,
+						  "mipi-sdca-control-0x9-subproperties",
+						  16);
+	if (ret >= 0) {
+		cs35l56->feid = (u16)ret;
+		dev_dbg(cs35l56->base.dev, "FEID=%#x\n", cs35l56->feid);
+	} else if (ret != -EINVAL) {
+		return ret;
+	}
+
+	ret = cs35l56_read_subproperty_control_dc(cs35l56, node,
+						  "mipi-sdca-control-0xA-subproperties",
+						  8);
+	if (ret >= 0) {
+		cs35l56->fev = (u8)ret;
+		dev_dbg(cs35l56->base.dev, "FEV=%#x\n", cs35l56->fev);
+	} else if (ret != -EINVAL) {
+		return ret;
+	}
+
+	return 0;
+}
+
+static int cs35l56_process_disco_control5(struct cs35l56_private *cs35l56,
+					  struct fwnode_handle *node)
+{
+	int ret;
+
+	/*
+	 * Don't fail probe because of a malformed property.
+	 * It might be a property we are not interested in anyway.
+	 */
+	ret = cs35l56_read_subproperty_control_dc(cs35l56, node,
+						  "mipi-sdca-control-0x5-subproperties",
+						  32);
+	if (ret < 0)
+		return 0;
+
+	if (ret != SDCA_FUNCTION_TYPE_SMART_AMP)
+		return 0;
+
+	return cs35l56_process_feid_fev(cs35l56, node);
+}
+
 VISIBLE_IF_KUNIT int cs35l56_process_xu_properties(struct cs35l56_private *cs35l56)
 {
-	struct fwnode_handle *ext_node = NULL;
-	struct fwnode_handle *link;
 	int ret;
 
 	if (!cs35l56->sdw_peripheral)
 		return 0;
 
-	fwnode_for_each_child_node(dev_fwnode(cs35l56->base.dev), link) {
-		ext_node = fwnode_get_named_child_node(link,
-						       "mipi-sdca-function-expansion-subproperties");
-		if (ext_node) {
-			fwnode_handle_put(link);
-			break;
+	fwnode_for_each_child_node_scoped(dev_fwnode(cs35l56->base.dev), link) {
+		ret = cs35l56_process_disco_control5(cs35l56, link);
+		if (ret)
+			return ret;
+
+		if (!cs35l56->base.num_onchip_spkid_gpios) {
+			struct fwnode_handle *ext_node __free(fwnode_handle) =
+				fwnode_get_named_child_node(link,
+							    "mipi-sdca-function-expansion-subproperties");
+
+			if (ext_node) {
+				ret = cs35l56_process_xu_onchip_speaker_id(cs35l56, ext_node);
+				if (ret)
+					return ret;
+			}
 		}
 	}
 
-	if (!ext_node)
-		return 0;
-
-	ret = cs35l56_process_xu_onchip_speaker_id(cs35l56, ext_node);
-	fwnode_handle_put(ext_node);
-
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(cs35l56_process_xu_properties);
 
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index b46f410f0e09..f55dab899f9d 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -56,6 +56,9 @@ struct cs35l56_private {
 	u8 sdw_link_num;
 	u8 sdw_unique_id;
 
+	u16 feid;
+	u8 fev;
+
 	u8 ambient_ctl_value;
 };
 
-- 
2.47.3

