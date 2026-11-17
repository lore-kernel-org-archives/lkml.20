Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794930436;
	b=3t2Bubz0uK9UQNgzh+mXEr3+qgEePON5QPmgAS1vFmpMRtZ2hrmcZYXAADTwPt4I+sYl
	 yCjhm8rqgRS2M6veBDuLpPZ8qcyqT4Jo/8CC74ssLjWwhexwn+3RXi4LFC35Iv+OIgXtc
	 rXVrtA8+y8oWu8nZoArHZfi5MGBQX7jZMbmRywYnEramXDAHjHX1I1miQ1XkJJknFhScv
	 PLzW+2dcSjKfgXjHF2IMrpX+kq5vMtJ7JQ6sZwGCC/24hGiZLBskekUZKaCl+8jS2M0sh
	 mwjsqWACCObJf4Yq4cgFRhzsiAVwOZZnkgiZhoa44sDzD+nWzsrJbssSD/Kb2pzHAtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930436;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=bC8ZI+I8dasGyoxvPz3KRExjBqKDU15yRjVX6B7vMJM=;
	b=Wj2dege/VEOxdfvvrKOBVnLl+tXf0i7yibqIuCNRRdBhhYV2Bv5evdmmbYICH1SFnVOF
	 Eo81AWFYOEsFN+QAL6DJobytR4QOp9DCtFj+WS253sgRUmAvhPZJOUYBpLclKawjLRh+y
	 E//QrfPCwg+Mo63w0JwYR1DGOHR2dttz9iT37t6K5WkzCv48tXzzq1omTngUeXhkXM1b/
	 nt4OUxBT3XM4SJ8se6Jh2XmmiahBIFUSGXZjO+/smncAfH6fPKjL5TiLzgANxbs+Eelqa
	 FLmqenHhB+u5IvU6Q0BYngv/3oaR83TG9fleP2FDcnFAA/z86zCAQSQJTmRNXPAPGBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=lwT9tPu6;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=xAhdgvkR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B74F606A31C;
	Tue, 17 Nov 2026 15:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B74F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=lwT9tPu6;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=xAhdgvkR
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHEVxM61769784;
	Tue, 17 Nov 2026 09:47:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=bC8ZI+I8dasGyoxvPz3KRExjBqKDU15yRjVX6B7vMJM=; b=
	lwT9tPu69imTUudT0edHBwWpPfljJRbduO7CeZTDaWHw7nOGJZZWyPcXewP4p0QC
	l2dqH5PYVjE9UkOqaIxqlIrz8/7H88tGsn84iX5pOiWdnD+Swebe4OhsSdYHFoUB
	4H+eDtK0PKyvL7CUbiisld4jRxk2to1aTKUlHrbR4WfuewzQYoCoMu1eHDVnhAaA
	AtnsgBiXTelqZIuYwaHJxeBz1dbDi3iO32Isp1Blt/oevDeiBBBuF0fL+ENUu8dU
	g9f3zRiBe7Nqpfw3s4+Z56CWVjEIucJ0PyXp3BFvpHQQNbaUw0CErb4rEZLfVkRi
	GkWrZxZ1Li66DVfY6JjgLA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023075.outbound.protection.outlook.com [40.107.201.75])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hxmxs4gg8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 09:47:11 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8hcWx85kF862yI6WPkxL73WT7jWZ9CUuoNBNfs9KEgOvHkQdl4c8jlQRP93O1T+JIBmj0C6Us25V8q2K9m334yShCTONlDQT3lbiE3V8RHpflMhN8qLhYXjnIg1pj/e3q7w74coeTKwjuizNNNYRT96nC5cWNCMzWlWR2UCuNqAER3dvph6vuX92NRqUquHwQCdEQ7AG1ppWbZDD6mNAB9zI00c4FDPQQK7rYhxkqV1TLYE6Ek+9YgYa6Wmi7s5LRqH/RDHntCj6MhDhZxY36Uczbe2aE35e2ap6+6XyiLsv7A/rFUM7KiprxCNCXelCgaxph6Dqdi/mRYBozxafQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bC8ZI+I8dasGyoxvPz3KRExjBqKDU15yRjVX6B7vMJM=;
 b=E6Yp92XTR1MY611c493QMEEFqwItPM4L3AAWZls8O/L1hFJzfh5iAIftLA4eHA7W6srxJMAzxuYmbwDG13/vnBxAnTjr5JHv1Y9VIuZd2DoAlXRNlKskA6pkF3zF6+rhSXlDeuVork+zG6ZzfJBRYaOJVp4HWf8JUizaiZge7t6vvqBUABu58iqRruv1iX25+5YWCcdt+klfkkFYouQkinplkr6FBU/Gu+ogjomzIC40Z4i02wT+YOverdP5LD3XXMyhPlpVorPVsnO2ksdvF/79AeCQQQyRvcJwn4lUDjIwq7iuvLUfrDQK0huczVRgHFyaG28otCz/9ragYB0g1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bC8ZI+I8dasGyoxvPz3KRExjBqKDU15yRjVX6B7vMJM=;
 b=xAhdgvkRxUp1+kdJEPCqLjaKvkMMl8+Y2iwYEvQF/VsMYQ/RNslH21fqTqzeqD0MmPxIuWd6mC5a40NP9OJpU52fgIIQW5qbbsgztnw5o+tYScqeAMadEJhh56y5n6aD72w9Kqz0s1POB2b8OGP+XVmqxFMr07u9X0Cdwrgm8ho=
Received: from DS7PR03CA0168.namprd03.prod.outlook.com (2603:10b6:5:3b2::23)
 by PH8PR19MB6997.namprd19.prod.outlook.com (2603:10b6:510:22a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 15:47:03 +0000
Received: from DS4PEPF000001C2.namprd21.prod.outlook.com
 (2603:10b6:5:3b2:cafe::39) by DS7PR03CA0168.outlook.office365.com
 (2603:10b6:5:3b2::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Tue,
 17 Nov 2026 15:47:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS4PEPF000001C2.mail.protection.outlook.com (10.167.23.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.0
 via Frontend Transport; Tue, 17 Nov 2026 15:47:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 79AEE406543;
	Tue, 17 Nov 2026 15:47:00 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5ED56822542;
	Tue, 17 Nov 2026 15:47:00 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 1/2] ASoC: cs35l56: Add KUnit test that widget init doesn't write ASP registers
Date: Tue, 17 Nov 2026 15:46:59 +0000
Message-ID: <20261117154700.840631-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117154700.840631-1-rf@opensource.cirrus.com>
References: <20261117154700.840631-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS4PEPF000001C2:EE_|PH8PR19MB6997:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6866545d-e6df-4556-67fd-08df44c205da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|23010399003|376014|18002099003|22082099003|16102099003|6133799003|261009223027099003|3023799007|11063799006|56012099006|261102123227099003|261102130727099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261022105027099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	P67vWt+w8voftWbtL+hXHRTZt6lDOLznqYr+oEkZezaMG5RxBaMovxSPTu4mcXmVhgAiGc4vpUwixVw1WfMOs9J1kGnYRFX8s3C3ufOzNOcttS/tVfwgI+jenl624sE4d/v5FPNPy2m9G9F1TaVDeaG+9OxfSbCzGHSE7UwWU2MsylzwZngDgjK/Yh+BcieHMcSHCMe2O5OBBEPizHW1lb6yrklBRZ4FtP2zxxRrDBdoCzo2xbAzEtKV7D2mMXmPCn8oeRgl7/1l23ueh8M1NGxbJxFMi3T+3Y0coSiN1x539f/8vqOMfOtQWGXzuQL5b1WWhAN06irWy+mwwfaqwyYWP1Gbk/l/vxGEDUBXs2YY4KnH9pugsypL1MSDRpnmXFujyT1KoSLJypEIzXDoEZyi4lfZlOmNlJsZFT9TTQtWu+AJwchjDGs9uFg26Ghhnttkps+tl9KLTAYBzeJmmfW9xUD+HK2+D3cHj40LLlgVw36/a0n8Q5rh6mZDlVtjrLfswHi5mjFEWtiKRRQr8HaF33mVwW+XtBu3NmucrEiSLY2QW0bBNOVb77vZiJFKtkxD2w3I2YOM08hUvHZruKNRS95cuaOI+3+fLFyAfE2OPIho6QgYDoO4I2uCpOSh2dOH28RPR/UYOVmghTm0WRvtzvtkC+hZTd+OKfxJqq9OFVJeGPPSpiDHgBEwYygSTD61fkIl2OSPgJEmnpmQtA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(23010399003)(376014)(18002099003)(22082099003)(16102099003)(6133799003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261102123227099003)(261102130727099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+MJXjiuMLMw7QlT3BhM879pG20xxi3PyvkABo0ZNa8sI1LKOOnm289TVSW5EeiSelA9Pih5R4mJnJ6ND5k3UDO9iY2Lr438oJZeIsbhrEtjn2MInTelTgvW6xwfNMhWpX2JXSGl4OY3fsJGVAbI0oOVGfuhcXmhcXuD35AnkKRdt4zMQKjPtBlFIVd7IeN9awbcGAAUUtcYIUOW5Hinfb2OXjJE8QLK2chqvLP8FbKKWMYAviyByhy4eSiuxCvV/qpaClW/HBak6UKDHvAc0TWoAIrQBIl33bC0qQKIkVB5/UQ7MVBpknx1Jd9SL2OSBYdaSOgBaSAwmWRD0nftdk71OEFyEHb3hQ0Z4byBwTgZw1hXiN8HbgZ7NNTGRX2O5r9TdM9b7pnYYKvleGBpS8VDQu618a+1TTO9UUyNUW0CiRJoTDv8LvAhPXjzHJ65D
X-Exchange-RoutingPolicyChecked:
	h4H3aiFDNsUddU5iZjmizEWSIXg17AlApaauvk6KOO2vMe4BUro9aYE/ZboPu0vJXD8qmHYODyIy+p5cXyIPfZJ1ujvMhIrrMf1eojOiuRYCUhuguXys7APSos8E1bBGEK8qn3P5tIQ8gbb1AEvgzQF1kpr2Lv9YLpfyvctuI08W+xk61SoGsVlajHfrBNurc2ofmEQlFwvtfchXfd8GTEqasKPd+4Ss27Fbc0XIxbPpcLRVyDj+DfMKcBN0LqLX1x1tw4l/PaQM9Lz9Ly3kzxd9vkH8ntqrRB4gg0f05wTHEND2UfJedRDgWJn+pInjzdhjRC6qjDe054tpHu3jXA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 15:47:01.9885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6866545d-e6df-4556-67fd-08df44c205da
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS4PEPF000001C2.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB6997
X-Authority-Analysis: v=2.4 cv=bbX+w+PB c=1 sm=1 tr=0 ts=6afc76ff cx=c_pps
 a=CMChTFI+x3L+VPqXLnm0rg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=4QJCjbKnueoU39JN8KgA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MiBTYWx0ZWRfXwGSw66vPEvBj
 4LHqObxZUe11jbd+dudPbkrBOkTB6WdyUJHGWaFN7sHp1yD8mJpc40ZRzULJav6IyHPFXWVLfqe
 sJg2N04LLH8uLw3zZW5TsGUFe2c0y6U=
X-Proofpoint-ORIG-GUID: y9DX2f87TEh_aBRgMby32m6MgggGnqRW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MiBTYWx0ZWRfX4fgTgtFsp0J6
 a6HCcQKpfzwXb1hqwrS8v4J1ydlVl4439vrut00weslDwruEzCqm1nic3QK0NYErPlsPqSUYt/N
 2Jc0AJTa24cLTLvqFk/dBZQTIyF2l4YLxXUFM0aA94DkQYA4bqMD4mAGSYQc6GmEF7IZ//1LjyW
 WJsrc0rJhm9TcMqSVATm5o6OfSmcBLubhiLYCoZx66UYwRhnuAm5rFZsh0vCjvdex+nwx/7XnSg
 CoAnEFI2OOYrvzw8k9/V+idRsaRV4k9MnXSbUPVaas6/g+Q9yvLiwaiRRlYCadGrUQPfhruEBL/
 2XHVREAwLIIkfCpyv4yHYrGIC3RMCtUUwJr6gwBNBFSbBumcOayL8Ohuj5/TMyv98Hp6z2jXhJq
 pJ2aboCGwLupWATysC0pMtHfWuX4qw==
X-Proofpoint-GUID: y9DX2f87TEh_aBRgMby32m6MgggGnqRW
X-Proofpoint-Spam-Reason: safe

Add a test case to check that the ASP config and input mixer registers
are not written when the ASP DAI is not part of a DAI link.

This is to test the fixes made in commit 0085428e834c ("ASoC: cs35l56:
Only write ASP1TXn registers when widget is powered-up").

These registers have multiple owners, so the driver must not write to
them if it doesn't own them.

A write can be inadvertently caused by reading a register, which populates
the value in the cache, then doing a regcache_sync() of a dirty cache. The
test includes testing direct writes during probe, and writes during a
subsequent cache-sync.

Some mock infrastructure is needed to enable this:

1. The test must supply dummy regulators. The automatic provision of dummy
   regulators by the regulator framework is a system-level decision, not a
   Kconfig flag that can be depended on. Not all systems can be relied on
   to supply dummy regulators automatically.

2. A simple simulation of a set of chip registers is done by a regmap that
   is always in cache-only mode. Around this is a small regmap bus wrapper.
   The simulated ASP registers are pre-populated with zero so that they are
   readable.

The order of creating struct cs35l56_priv and the faux device had to be
swapped in cs35l56_test_case_init_common() to ensure that devm cleanup of
the faux device happens before the cs35l56_priv data is freed by KUnit.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Changes in V2:
- Populate the ASP register ranges in the simulated registers so that the
  cs35l56 driver can read them into its regmap cache.
  
- Don't use KUNIT_ASSERT_*() in the mock regmap read/write callbacks 
  because if it fails it would immediately abort the test without releasing
  the regmap lock, which then deadlocks cleanup.

 sound/soc/codecs/cs35l56-test.c | 342 +++++++++++++++++++++++++++++++-
 1 file changed, 337 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-test.c b/sound/soc/codecs/cs35l56-test.c
index b58df099bf72..b422d19ba0b2 100644
--- a/sound/soc/codecs/cs35l56-test.c
+++ b/sound/soc/codecs/cs35l56-test.c
@@ -17,8 +17,13 @@
 #include <linux/overflow.h>
 #include <linux/pci_ids.h>
 #include <linux/property.h>
+#include <linux/range.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
 #include <linux/seq_buf.h>
 #include <linux/soundwire/sdw.h>
+#include <linux/unaligned.h>
 #include <sound/cs35l56.h>
 #include <sound/cs-amp-lib.h>
 #include <sound/sdca_function.h>
@@ -39,14 +44,25 @@ KUNIT_DEFINE_ACTION_WRAPPER(device_remove_software_node_wrapper,
 			    device_remove_software_node,
 			    struct device *)
 
+KUNIT_DEFINE_ACTION_WRAPPER(cs35l56_remove_wrapper, cs35l56_remove,
+			    struct cs35l56_private *)
+
+KUNIT_DEFINE_ACTION_WRAPPER(snd_soc_unregister_card_wrapper, snd_soc_unregister_card,
+			    struct snd_soc_card *)
+
 struct cs35l56_test_priv {
 	struct faux_device *amp_dev;
 	struct cs35l56_private *cs35l56_priv;
+	const struct regmap_config *regmap_config;
+	struct regmap *registers;
 
 	const char *ssidexv2;
 
 	bool read_onchip_spkid_called;
 	bool configure_onchip_spkid_pads_called;
+
+	bool asp_config_regs_written;
+	bool asp_mixer_regs_written;
 };
 
 struct cs35l56_test_param {
@@ -79,6 +95,231 @@ static const struct software_node *cs35l56_test_dev_and_af01_node_group[] = {
 	NULL
 };
 
+/* Some mocked registers need default values for driver init to work */
+static const struct reg_default cs35l56_test_mock_reg_defaults[] = {
+	{ CS35L56_OTPID,		0x00000003 },
+	{ CS35L56_IRQ1_STATUS,		0x00000000 },
+	{ CS35L56_IRQ1_MASK_1,		0x83ffffff },
+	{ CS35L56_IRQ1_MASK_8,		0xfc000fff },
+	{ CS35L56_DSP_VIRTUAL1_MBOX_1,	0x00000000 },
+	{ CS35L56_DIE_STS1,		0x00000000 },
+	{ CS35L56_DIE_STS2,		0x00000000 },
+	{ CS35L56_DSP_RESTRICT_STS1,	0x00000000 },
+	{ CS35L56_OTP_MEM_53,		0x00000000 },
+	{ CS35L56_OTP_MEM_54,		0x00000000 },
+	{ CS35L56_OTP_MEM_55,		0x00000000 },
+	{ CS35L56_DSP1_FW_VER,		0x00040710 },
+	{ CS35L63_PROTECTION_STATUS,	0x00000000 },
+	{ CS35L56_PROTECTION_STATUS,	0x00000000 },
+};
+
+/* Trap the entire ASP address space, not only particular registers */
+static const struct range cs35l56_test_asp_config_registers_range = {
+	.start = 0x4800,
+	.end = 0x48ff,
+};
+
+static const struct range cs35l56_test_asp_mixer_registers_range = {
+	.start = CS35L56_ASP1TX1_INPUT,
+	.end = CS35L56_ASP1TX4_INPUT,
+};
+
+static int cs35l56_test_mock_registers_read(void *context,
+					    const void *reg_buf, size_t reg_size,
+					    void *val_buf, size_t val_size)
+{
+	struct kunit *test = context;
+	struct cs35l56_test_priv *priv = test->priv;
+	u8 *buf = val_buf;
+	unsigned int reg = get_unaligned_be32(reg_buf);
+	unsigned int val;
+	size_t i;
+	int ret;
+
+	/* Don't use KUNIT_ASSERT, it would abort without releasing the regmap lock */
+	if ((reg_size != sizeof(u32)) || (val_size % sizeof(u32))) {
+		kunit_fail_current_test("Illegal reg read args\n");
+		return -EINVAL;
+	}
+
+	if (priv->regmap_config)
+		reg -= priv->regmap_config->reg_base;
+
+	switch (reg) {
+	case CS35L56_DSP_VIRTUAL1_MBOX_1:
+		/* MBOX must return 0 to indicate that the value was written */
+		put_unaligned_be32(0, val_buf);
+		return 0;
+	case CS35L56_DSP1_HALO_STATE:
+	case CS35L63_DSP1_HALO_STATE:
+	case CS35L56_B2_DSP1_HALO_STATE:
+		/* Driver zeros this and we must simulate the firmware rewriting it */
+		put_unaligned_be32(CS35L56_HALO_STATE_BOOT_DONE, buf);
+		return 0;
+	default:
+		break;
+	}
+
+	for (i = 0; i < val_size; i += sizeof(u32), reg += sizeof(u32)) {
+		ret = regmap_read(priv->registers, reg, &val);
+		if (ret)
+			return ret;
+
+		put_unaligned_be32(val, buf + i);
+	}
+
+	return 0;
+}
+
+static int cs35l56_test_mock_registers_write(void *context, const void *data, size_t count)
+{
+	struct kunit *test = context;
+	struct cs35l56_test_priv *priv = test->priv;
+	struct range addr_range;
+	unsigned int reg, val;
+	const u8 *buf = data;
+	size_t i;
+	int ret;
+
+	/* Don't use KUNIT_ASSERT, it would abort without releasing the regmap lock */
+	if ((count < 2 * sizeof(u32)) || (count % sizeof(u32))) {
+		kunit_fail_current_test("Illegal reg write args\n");
+		return -EINVAL;
+	}
+
+	reg = get_unaligned_be32(buf);
+	buf += sizeof(u32);
+	count -= sizeof(u32);
+	if (priv->regmap_config)
+		reg -= priv->regmap_config->reg_base;
+
+	addr_range = DEFINE_RANGE(reg, reg + count - 1);
+	if (range_overlaps(&addr_range, &cs35l56_test_asp_config_registers_range))
+		priv->asp_config_regs_written = true;
+
+	if (range_overlaps(&addr_range, &cs35l56_test_asp_mixer_registers_range))
+		priv->asp_mixer_regs_written = true;
+
+	for (i = 0; i < count; i += sizeof(u32)) {
+		val = get_unaligned_be32(buf + i);
+		ret = regmap_write(priv->registers, reg + i, val);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct regmap_bus cs35l56_test_mock_registers_regmap_bus = {
+	/* Always in cache-only so no handlers needed */
+};
+
+static const struct regmap_config cs35l56_test_mock_registers_regmap_config = {
+	.name = "cs35l56_mock_registers",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = CS35L56_DSP1_PMEM_5114,
+	.cache_type = REGCACHE_MAPLE,
+	.reg_defaults = cs35l56_test_mock_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(cs35l56_test_mock_reg_defaults),
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+};
+
+static const struct regmap_bus cs35l56_test_mock_registers_client_regmap_bus = {
+	.read = cs35l56_test_mock_registers_read,
+	.write = cs35l56_test_mock_registers_write,
+};
+
+/* Populate simulated register ranges with dummy values */
+static void cs35l56_test_fill_register_range(struct kunit *test,
+					     const struct range *reg_range,
+					     unsigned int fill_value)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	unsigned int addr;
+
+	for (addr = reg_range->start; addr <= reg_range->end; addr += 4)
+		KUNIT_ASSERT_EQ(test, 0, regmap_write(priv->registers, addr, fill_value));
+}
+
+/* Simulated device registers using a mock bus backed by a cache-only regmap */
+static void cs35l56_test_create_mock_device_registers(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+	unsigned int devid = 0x35a00 | cs35l56->base.type;
+
+	priv->registers = devm_regmap_init(cs35l56->base.dev,
+					   &cs35l56_test_mock_registers_regmap_bus,
+					   test, &cs35l56_test_mock_registers_regmap_config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->registers);
+	regcache_cache_only(priv->registers, true);
+
+	switch (cs35l56->base.type) {
+	case 0x54:
+	case 0x56:
+	case 0x57:
+		break;
+	default:
+		devid <<= 4;
+		break;
+	}
+	KUNIT_ASSERT_EQ(test, 0, regmap_write(priv->registers, CS35L56_DEVID, devid));
+	KUNIT_ASSERT_EQ(test, 0, regmap_write(priv->registers, CS35L56_REVID, cs35l56->base.rev));
+
+	cs35l56_test_fill_register_range(test, &cs35l56_test_asp_config_registers_range, 0);
+	cs35l56_test_fill_register_range(test, &cs35l56_test_asp_mixer_registers_range, 0);
+}
+
+/*
+ * Not all systems supply dummy regulators for missing regulators, and
+ * this behaviour is a system-level decision, not a KConfig symbol we can
+ * depend on. So we have to provide our own dummy regulators.
+ */
+static const struct regulator_ops cs35l56_test_mock_regulator_ops;
+static const struct regulator_desc cs35l56_test_mock_regulator_desc = {
+	.name = "cs35l56_test_regulators",
+	.type = REGULATOR_VOLTAGE,
+	.owner = THIS_MODULE,
+	.ops = &cs35l56_test_mock_regulator_ops,
+};
+
+static struct regulator_consumer_supply cs35l56_test_mock_supplies[] = {
+	REGULATOR_SUPPLY("VDD_P", NULL),
+	REGULATOR_SUPPLY("VDD_IO", NULL),
+	REGULATOR_SUPPLY("VDD_A", NULL),
+	REGULATOR_SUPPLY("VDD_B", NULL),
+	REGULATOR_SUPPLY("VDD_AMP", NULL),
+};
+
+static const struct regulator_init_data cs35l56_test_mock_init_data = {
+	.constraints.always_on = 1,
+	.num_consumer_supplies = ARRAY_SIZE(cs35l56_test_mock_supplies),
+	.consumer_supplies = cs35l56_test_mock_supplies,
+};
+
+static void cs35l56_test_create_mock_supplies(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	struct regulator_config config = { };
+	int i;
+
+	if (!IS_ENABLED(CONFIG_REGULATOR))
+		return;
+
+	config.dev = &priv->amp_dev->dev;
+	config.init_data = &cs35l56_test_mock_init_data;
+	for (i = 0; i < ARRAY_SIZE(cs35l56_test_mock_supplies); i++)
+		cs35l56_test_mock_supplies[i].dev_name = dev_name(config.dev);
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test,
+				     devm_regulator_register(config.dev,
+							     &cs35l56_test_mock_regulator_desc,
+							     &config));
+}
+
 static const char *cs35l56_test_devm_get_vendor_specific_variant_id_none(struct device *dev,
 									 int ssid_vendor,
 									 int ssid_device)
@@ -611,6 +852,83 @@ static void cs35l56_test_set_fw_name_preserves_spkid_without_onchip_gpios(struct
 	KUNIT_EXPECT_EQ(test, cs35l56->speaker_id, 15);
 }
 
+static void cs35l56_test_dummy_dsp_work(struct work_struct *work)
+{
+}
+
+/*
+ * Probing the component must not access the ASP1 registers. The driver does
+ * not necessarily own them.
+ */
+static void cs35l56_test_component_probe_omits_asp(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+	struct snd_soc_card *card = cs35l56->component->card;
+	struct snd_soc_aux_dev *aux;
+	struct faux_device *card_dev;
+
+	cs35l56_test_create_mock_supplies(test);
+	cs35l56_test_create_mock_device_registers(test);
+
+	KUNIT_ASSERT_NOT_NULL(test, priv->regmap_config);
+	cs35l56->base.regmap = devm_regmap_init(cs35l56->base.dev,
+						&cs35l56_test_mock_registers_client_regmap_bus,
+						test, priv->regmap_config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cs35l56->base.regmap);
+
+	KUNIT_ASSERT_EQ(test, 0, cs35l56_common_probe(cs35l56, 0));
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, cs35l56_remove_wrapper, cs35l56));
+
+	/* Prevent real dsp_work */
+	INIT_WORK(&cs35l56->dsp_work, cs35l56_test_dummy_dsp_work);
+
+	/* Simulate first attachment and re-attachment after the soft reset. */
+	regcache_cache_only(cs35l56->base.regmap, false);
+	KUNIT_ASSERT_EQ(test, 0, cs35l56_init(cs35l56));
+	KUNIT_ASSERT_EQ(test, 0, cs35l56_init(cs35l56));
+	KUNIT_ASSERT_TRUE(test, cs35l56->base.init_done);
+	flush_work(&cs35l56->component_register_work);
+	KUNIT_ASSERT_TRUE(test, cs35l56->component_registered);
+
+	card_dev = faux_device_create("cs35l56_test_card", NULL, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, card_dev);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, faux_device_destroy_wrapper, card_dev));
+
+	/* Bind as an auxiliary component so the ASP DAI is never probed. */
+	aux = kunit_kzalloc(test, sizeof(*aux), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, aux);
+	aux->dlc.name = dev_name(cs35l56->base.dev);
+	card->name = "cs35l56-test";
+	card->dev = &card_dev->dev;
+	card->owner = THIS_MODULE;
+	card->aux_dev = aux;
+	card->num_aux_devs = 1;
+	KUNIT_ASSERT_EQ(test, 0, snd_soc_register_card(card));
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, snd_soc_unregister_card_wrapper, card));
+	KUNIT_ASSERT_TRUE(test, card->instantiated);
+
+	/*
+	 * Flush cache to ensure there aren't cached values for the ASP registers.
+	 * The first case without regcache_mark_dirty() tests flushing when
+	 * hardware registers have not reset, and requires a dummy write to
+	 * the cache to make it dirty.
+	 */
+	regcache_cache_only(cs35l56->base.regmap, true);
+	KUNIT_ASSERT_EQ(test, 0, regmap_write(cs35l56->base.regmap,
+					      CS35L56_DSP_VIRTUAL1_MBOX_1, 0));
+	regcache_cache_only(cs35l56->base.regmap, false);
+	KUNIT_ASSERT_EQ(test, 0, regcache_sync(cs35l56->base.regmap));
+	regcache_mark_dirty(cs35l56->base.regmap);
+	KUNIT_ASSERT_EQ(test, 0, regcache_sync(cs35l56->base.regmap));
+
+	KUNIT_EXPECT_FALSE(test, priv->asp_config_regs_written);
+	KUNIT_EXPECT_FALSE(test, priv->asp_mixer_regs_written);
+}
+
 static int cs35l56_test_case_init_common(struct kunit *test)
 {
 	struct cs35l56_test_priv *priv;
@@ -625,6 +943,11 @@ static int cs35l56_test_case_init_common(struct kunit *test)
 
 	test->priv = priv;
 
+	/* Construct minimal set of driver structs */
+	priv->cs35l56_priv = kunit_kzalloc(test, sizeof(*priv->cs35l56_priv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, priv->cs35l56_priv);
+	cs35l56 = priv->cs35l56_priv;
+
 	/* Create dummy amp driver dev */
 	priv->amp_dev = faux_device_create("cs35l56_test_drv", NULL, NULL);
 	KUNIT_ASSERT_NOT_NULL(test, priv->amp_dev);
@@ -632,11 +955,6 @@ static int cs35l56_test_case_init_common(struct kunit *test)
 			kunit_add_action_or_reset(test,
 						  faux_device_destroy_wrapper,
 						  priv->amp_dev));
-
-	/* Construct minimal set of driver structs */
-	priv->cs35l56_priv = kunit_kzalloc(test, sizeof(*priv->cs35l56_priv), GFP_KERNEL);
-	KUNIT_ASSERT_NOT_NULL(test, priv->cs35l56_priv);
-	cs35l56 = priv->cs35l56_priv;
 	cs35l56->base.dev = &priv->amp_dev->dev;
 
 	cs35l56->component = kunit_kzalloc(test, sizeof(*cs35l56->component), GFP_KERNEL);
@@ -653,6 +971,17 @@ static int cs35l56_test_case_init_common(struct kunit *test)
 		cs35l56->base.rev = param->rev;
 		cs35l56->feid = param->feid;
 		cs35l56->fev = param->fev;
+
+		switch (param->type) {
+		case 0x54:
+		case 0x56:
+		case 0x57:
+			priv->regmap_config = &cs35l56_regmap_i2c;
+			break;
+		default:
+			priv->regmap_config = &cs35l63_regmap_i2c;
+			break;
+		}
 	}
 
 	return 0;
@@ -902,6 +1231,8 @@ static struct kunit_case cs35l56_test_cases_soundwire[] = {
 	KUNIT_CASE(cs35l56_test_set_fw_name_reads_onchip_spkid),
 	KUNIT_CASE(cs35l56_test_set_fw_name_preserves_spkid_with_onchip_gpios),
 	KUNIT_CASE(cs35l56_test_set_fw_name_preserves_spkid_without_onchip_gpios),
+	KUNIT_CASE_PARAM(cs35l56_test_component_probe_omits_asp,
+			 cs35l56_test_type_rev_all_gen_params),
 
 	{ } /* terminator */
 };
@@ -942,6 +1273,7 @@ kunit_test_suites(
 );
 
 MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
+MODULE_IMPORT_NS("SND_SOC_CS35L56_CORE");
 MODULE_IMPORT_NS("SND_SOC_CS35L56_SHARED");
 MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 MODULE_DESCRIPTION("KUnit test for Cirrus Logic cs35l56 codec driver");
-- 
2.47.3

