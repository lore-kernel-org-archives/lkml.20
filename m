Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794389397;
	b=rxgOUW2/0Okl0vjPadtwn76zPooxor3IfK5xfjoUgL7pJMQnet8WBf8WQ1a3ouu5T27U
	 nsymSNpe+wD18GQGd4lQYGvtYAaHvHVu76BUfAQvIVKufJGCFlpXq56jgKL5yfrWn+Luv
	 VeLC1yNtoW7FCbYZg2W5KIMQkkWCz3aiQk/eQHFb9995DKg+f+fGvXf7EZen5e1EmTtwi
	 t7lnxYFOMLYQN+T00QJwJBPVKnBMM+Q0AN44JiFCb8/T+kSyYIzK0ThMQ+iX2D8lKbtRU
	 STmDr6awQDpdRQvC6G0Ud8W1cEOTjL1Iy2b+87rqmugX2OHIx99M+PWBQuwp0FQWLow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389397;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=sV0Tc8/+t9d2UKdTv0+KDyGV9Lv2eFT61QEtLhMXr9A=;
	b=BJ7PArtr9TGmeAJ0a5LnD6SLvNfUeDxHzypwiUmRgZQoagCrh5eZxLUC5mwqRtkot6rA
	 vMMtJ0aYxVOtieMqY5aDHFUGqHvI0U41RtQ0XVb8BFEqI1cK5kP4Dvm1/5RXBfLYDkXnT
	 10/myQi9zvGAer8U6tyZa9VPGigIVpqjWD3ZuDWaGmRLyQIh66J5tMawWMDfXAkfxvXp5
	 LKANck8vcGLqb48LfWccjL9evXhcgz9G0upZmoh8+9sbbrYXgousJm0d5UWIVmcYZO2+b
	 N65x7FnuR4rkF8vKwMsiqsYooMo/6d2t8nRYrX29j+MmjbHE6j5gtzjhm28FHasdKPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=J7CqR18k;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=s6Wl+Ae+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C338606A324;
	Wed, 11 Nov 2026 09:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C338606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=J7CqR18k;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=s6Wl+Ae+
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB9TjZF3414213;
	Wed, 11 Nov 2026 03:29:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=sV0Tc8/+t9d2UKdTv0
	+KDyGV9Lv2eFT61QEtLhMXr9A=; b=J7CqR18kA5q8OJpejfboXH0RNv7yCKjjcB
	+/NPL7ULNqb/HUfkVjmYs1aIupwof6hqdmCKGmcvhQn7FzZKKX5NFq0tPy7n6eOf
	dCrpArUo/PVRyubBzP8kW10sAVqCc30/Nig/o1dx+rC8KpLAKY2a6tETxjGt8ZLE
	4zpvflPiCBM/XBwQzoOMQ4+yyZ4/zn3nDjSPI0KNHQ5c9DsLmfk5y1kxyaTkBBoQ
	0eiSYvR9RIU+tKrUk5xJmYNMknmSscm4KIaKOVVURqVQhZV9UPBLEpDXA/j2TDIr
	m/277HQbu2chiP1vh4LO2w1M+lWYkMZFyLsp6w0IV7FUJuREUweQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020133.outbound.protection.outlook.com [52.101.56.133])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hv7urs75j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 03:29:50 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZAS1f+lx3MHLgHOmGwDNmLRCtRtO14tqh5E3HVJRWFjh9HE4Sp0y9YlHlgGH7z0Iclw/AfrAZkXD4VupwGUzSI4JAG0rTDgFk1ycU7P9rTTF6PWK3wRKc3w6qrOVAUxRRoBhNOfUpUQMMi5mxPnvkcDw2+J2HaFjEJHw06rEIDkTI8M2jPQqS8JvrAXPi7h8jFRztuS43igN9oDZANOvf/bR2S0UjjT1voE70pGqgDWoFQe2Dn1BwOZqwShT1ou902LVZskQK+/jyEtDQ6ktGxeGH1l4OjY1KJilBiV7tevVsXQR7py/zQo6XQUspYsKTA5b4g90EkYsdnWWBhvYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sV0Tc8/+t9d2UKdTv0+KDyGV9Lv2eFT61QEtLhMXr9A=;
 b=wopz4aeyRZK7hHAvI4hCia3vPdgh2u9HQQxMeW1SQaNeerFXFIVzWV7j9Rzz0tqQfqhlxU5+eU/Bb6Z9HpCWcA9tcz+/0J3veoCWJykb127YlxkcUjXpHjz5e9SsYBvjm1cNATuDfORF/y1TWXmryCI3iIzr+D0Pz1iZVfDRmQnZk1dUi9QhMomegCDC2KsbjMZmInV0dzrqi5ZnskBov+nVrsnqXa0al+mATkBbtH8Pyx+uI+Z0iuF46fYcqg7x6uQO7OBSGRYxOFonj8e9FMwCztaWQUEvLlclarIDf3ceyAbTLiAKNuqnz0YRPo0oRZ6ZPpHrXoy7cQ3iwLWcEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sV0Tc8/+t9d2UKdTv0+KDyGV9Lv2eFT61QEtLhMXr9A=;
 b=s6Wl+Ae+RtZpO6hkWBhPltON/9SrcK9o/DyskimRhXJam5T9JXTwRaW/bd1AlmoWEgWl9nRXZtg24UZoKJTrqO7vb0B8BS8fKGHgdpwAKxNTMpiNFuqQeR3DAnahsT0RZZZLtK/WqXYs3npOIC14yQ65RlAVrRC1ne++GRoh9Ps=
Received: from DS7PR03CA0153.namprd03.prod.outlook.com (2603:10b6:5:3b2::8) by
 SJ0PR19MB4398.namprd19.prod.outlook.com (2603:10b6:a03:286::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 09:26:48 +0000
Received: from DS2PEPF00006E21.namprd05.prod.outlook.com
 (2603:10b6:5:3b2:cafe::22) by DS7PR03CA0153.outlook.office365.com
 (2603:10b6:5:3b2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 09:26:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00006E21.mail.protection.outlook.com (10.167.23.214) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 09:26:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 55810406559;
	Wed, 11 Nov 2026 09:26:45 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3B582820273;
	Wed, 11 Nov 2026 09:26:45 +0000 (UTC)
Date: Wed, 11 Nov 2026 09:26:43 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v2 2/2] soundwire: Assume default maximum valid channel
 if not specified
Message-ID: <avQ009LpCFfgDfBl@opensource.cirrus.com>
References: <20261110113842.347883-1-ckeepax@opensource.cirrus.com>
 <20261110113842.347883-3-ckeepax@opensource.cirrus.com>
 <105b2b77-7eb6-4b96-821d-51af94a2e21d@linux.dev>
 <avMziZ9tYT5lg0Oa@opensource.cirrus.com>
 <c477aed9-6b9c-4db1-8549-e1a407f55e43@linux.dev>
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
In-Reply-To: <c477aed9-6b9c-4db1-8549-e1a407f55e43@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00006E21:EE_|SJ0PR19MB4398:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d2e1637-2477-4ae9-268a-08df3fd5e84f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700016|23010399003|16102099003|18002099003|22082099003|261009223027099003|261026121527099003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	T+mD6d/8SSNcRyRCdBnwANScEAMYrsmA3axG8cNXRy+SbrFxRfE6ArGyN7Db/0t//7mu+xmSh6NM/wa3RVAtzNOYApnFdMjdKqa7+gBhMfF0X1yLLTzsD4FIJKmtv7xQXzRnGAQGumdptQ7Tw5p3Y8H56VKrXO3CbnZASJvHlTklcoMC9XBUbYNPjrxhRObjilhlif2/gRiyzHQuX0eiP2uNYmP1rXvIpWZa1pQBErWZarPf2e2+S0aaa34euZZKiYrNn0tmJWYY1OXJCOlaitIFVnjc2Nd9wR0weMhVB4iS2AXFWAZdtd/7OLWovNwqtj0VBJCy7iZdPDopIXedh6IBul5c3MCWo4G3PgrB/mm0FEH0wOFbqREor29bC8GuykzPPw6JNcXxNC+kQEBQwTYsDiBBCxwAawGYSVglkBUA6eFCGLd26t2tbfi8x08aK2VmdSm77k8WPmE/XHrXJ07SyWLPYlfXuKrkK+V6FiPHcvGuRNDdD6hKMDTAGBMG9lJDPXurS8PxfqJWsiIbmqCE8h05H7zq1+r1RnZmUVxAmHgpEcZ2iCQHE7NTRw36nCanu3Aa7YAV3NulmWryXk1XHSi7o20/ECBwvzDl2VfQgjJm0r7GSVxsypeus35PKCSr/GmuLNrgPSpwrJP576g4t3vwarbS/WRjr7k9uwiw/taJAlFWSKpGu6M4O4ANwEL7U0NHbhJ47ZKb83YXfg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700016)(23010399003)(16102099003)(18002099003)(22082099003)(261009223027099003)(261026121527099003)(56012099006)(10067099003)(4143699003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OIoQpg97/UKCD7iwnmy1arqOmIitvIUnaIyTa8eQ+o1lE4z+vXPTPENa/rfp9/Tb58Kxxr3FQfMrNW06wuYZI/4XfvMlasG7XW9/n9EoNugoGZkLtO90mVywx6sUTRfTa0aWWceEnEtl0+8Udmd3STuFoRg2qBblyqkcFxmrptaIYH0Ejst+iSuIPo0eBeJruRgQGrXS22w3eeU2s5va+qyUnXWPNhJJSyXVRMuHFz/MmldEps8XRd6suSxu06YMkDk3inyVMBAXxZdIIwQ16s3oy4AWzdO5XZLOgsIN/ByLt4hG77MsI/3z9NT11nxLplJwIbCt7qlM4VUJUjGy4qSZZ7C3oSMuZjnkgTTouOzKSMa7rzriWaYNdRpfYATM90+BZnIJaF72kyGzEmKrgi+XiI54I+YS1xpwVgCy8DY2JJxSmseqwVN9ZkUPvDXH
X-Exchange-RoutingPolicyChecked:
	5SjJLWBEITul+ILHTaCBFRdIY1mRoG+gNgPnzihOnXRBESTMC3vmSynyLT/7Y4/NDIINmKBlT31KD3djWnRI/UT0lMC2DQQT0Kb2dQronU2sXqBzuA/3hlmFZ/90WScCMnpOHsNG4GABzxTcGrCM/OAmU/GCKox4LBkLvNUS1RIs/uAw/wHdsCDaBgRKb/bxNPZIMDNpKqCeqm59C9FaPyw0Zoyi37XuBnx2Udhlq5veSvcdXnGJTR4Ni3J7L2VlrI8K1YDTbF6C/TswtDgDSfp2XhTkljkqX6vhrKL/UCyLVtRbOroEeVEyx8CfrG4n+F4I5x9nBE0/q8OXbK62Sw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:26:46.5109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2e1637-2477-4ae9-268a-08df3fd5e84f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00006E21.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4398
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNyBTYWx0ZWRfXyftHEv2xiwWF
 pXpQJw9XeKhWMve9LaUkedodB8lJTL9xsJDehVXKERwBfzhShOTm8n8DX/BxdV7d5bn4odFbN6x
 gKnuod5PSJeV6d9BzoKA4t8+HEtxWNDa3M5h20FFSU6+lbJlDNs23mDjuL8Ims3md3VXAqNZmKh
 EdADDTOZ57Zrn6TCf43NZSI3l/eIKUhXqJ33T94psbTa2g8Tbf3rdLmgeD2sRXPUUnqQPRt2M9A
 6bsXvRk11qJGSrzhrql2+9bBmkWtvGD2x0mI5WCOB6URwoglpCS9wvvDAAoky546d7x51nUUMfg
 wDRfv0ZoiQiH8uK3I6BSTYWt1eL7eZVqGskaxE359oHqefCSkfLQ0GxKRTFodzfMfWn6xg0WSET
 +II5ZvNP9VuoLCMvVMZqBKbwSWXXLjh9B0eTV7Jqifx2dUcOUG1aCFSByNYGk6aSp4rlpg9ZEOF
 fgjoXykzskYNDN/LO5A==
X-Proofpoint-ORIG-GUID: 4ATo2VcC35h1mnsEuN4vguSK4AzglvnF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNyBTYWx0ZWRfX3X+2L5PnVdqz
 xmo2FuxuhDqqF20Z/7GxZigcwBaKumCgWma5tsicjfKXtXBskFxdQ8t5oL6NFTCz5IR/xEIrN5J
 pfS+XG6z5Xy0bobmpZCRoLOz2CtYxiI=
X-Proofpoint-GUID: 4ATo2VcC35h1mnsEuN4vguSK4AzglvnF
X-Authority-Analysis: v=2.4 cv=JagpPkKV c=1 sm=1 tr=0 ts=6af4358e cx=c_pps
 a=q7ul7JX4f8a5wKXmg0eXeg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=3-cu2pGj93GlbvPsAm4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Tue, Nov 10, 2026 at 06:11:13PM +0100, Pierre-Louis Bossart wrote:
> On 11/10/26 16:08, Charles Keepax wrote:
> > On Tue, Nov 10, 2026 at 03:30:43PM +0100, Pierre-Louis Bossart wrote:
> >> On 11/10/26 12:38, Charles Keepax wrote:
> >>> +		fwnode_property_read_u32(node, "mipi-sdw-min-channel-number",
> >>> +					 &dpn[i].min_ch);
> >>> +
> >>> +		ret = fwnode_property_read_u32(node, "mipi-sdw-max-channel-number",
> >>> +					       &dpn[i].max_ch);
> >>> +		if (ret && !dpn[i].num_channels)
> >>> +			dpn[i].max_ch = 7;
> >>> +
> >>
> >> this works, maybe with one possible improvement: in theory if
> >> "mipi-sdw-channel-number-list" is defined one can ignore the min/max,
> >> the two approaches with the list or min/max are mutually exclusive.
> >>
> >> Something like this:
> >>
> >> if (!dpn[i].num_channels) {
> >> 	fwnode_property_read_u32(node, "mipi-sdw-min-channel-number",
> >> 				 &dpn[i].min_ch);
> >> 	ret = fwnode_property_read_u32(node, "mipi-sdw-max-channel-number",
> >> 					       &dpn[i].max_ch);
> >> 	if (ret)
> >> 		dpn[i].max_ch = 7;
> >> }
> > 
> > I am happy to do so if you feel strongly. However, the spec
> > doesn't really appear to rule out both being present, it does
> > imply that the channel list takes precedence. But given it
> > doesn't rule out having both, I quite like parsing both and
> > allowing the driver to make a decision about what to do with
> > that information.
> humm, the wording "Conditions: If Property mipi-sdw-channel-number-list
> is present, then this [mipi-sdw-max-channel-number ]Property shall not
> be present" is pretty strong.
> 
> I don't mind keeping your existing code but then we'd need to add a
> comment to say that we discarded the 'shall' to cover potentially broken
> cases.

Nah, its cool I will update the code as you suggest. Should be
able to get a spin out later today.

Thanks,
Charles
