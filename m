Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D88447CA9A;
	Fri,  4 Sep 2026 15:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537472; cv=fail; b=ez9lYdWfooo5l+PaT06raY0EYa5sJUrz3L98kK2P0WzS2JzjpFB2sI0EupQH5jAErvu9UQiw6cieLO/1R1a6A+7XAfvsOOluS+XagqugbflhqoxYo28Fmu1Q4hfUdwZakus4QNn8R1LDNpr62kmFhUvMpwpczboTSH30qh9qYvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537472; c=relaxed/simple;
	bh=d5F+H9p4Kt9cGP4d5THhaiHxL7LRGrFHthkrGoQmqxE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aJ/QOQukbvk6eISj9qJ+7DlRHTHc/3aY0IKuxryi1H1ue1gM6bpPDhbPcy4qL57UIO48aJDeK//l/9zG07fdJykr68KVl6+fBR1VY/xT+ZA9D0MkOOqZGyrXzourA41yahixyqh5fi4zKq77p/VZVFYxFovYRu7kYkmaF7SIFOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=MQ7R3qdn; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=eVCLBd4i; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="MQ7R3qdn";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eVCLBd4i"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 684FtnWB4122603;
	Fri, 4 Sep 2026 10:57:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=VlXBoAqh+RTqEYgRssWztSqxUkjbQ/mBKGrPJ/JKV
	7w=; b=MQ7R3qdnAwyJL6UpHQmli23m+e8mVYzLm+3BKsoatbiy0G60qXurp3fvM
	BHtYavgvJsHDkhOQMPXwjSFZHPnCBh+Uye2/oIncE8tg8sTggqf+j5sZBUwZ7uB2
	Hn6Ej0jj5/2K5TEGPhPhcEqut0Z+YMekV7pnKHWdfPm8otpQfbtsRwHaztM8mhMw
	p2k+JCDXRfSsUhIy/eEpKzQDpRIduXrL+7oinOHMqDovg7GeC6JXmAFTrW+XGV8l
	NvVMS111sbSYyalSaIGxkDPpPJD9aS8tGQE44cfz94vV1gbtFb4A5SB/qS12gE26
	DO58RdtHPI/k2kzeKT3zJnP3Y5jYw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012011.outbound.protection.outlook.com [52.101.43.11])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gg02srhpy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 10:57:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQ08/b+mU0zh1azhbQ6dDSccYpb0qyqiO8IoVJyVkNn4uhs2kNZIiEf2cRnA6BFbBlJyFpfXbGScqn7XvqQIH972+YQsQsmOC6HOFs1Acxhzxsxflx9z+MRiAf2eC3qRl3ZjXjgQckBMmJctODXQnR9FC3KQZBxExHuyPqiJ2N+EToeXt1Bg1YrucZKBK7RmMRcqUUmeTyforzZEH1EbKjQlsv4HBZQh3zBzbXZjy7OLgmXj5DSVNK7vdd0lGkNKPmc7gzYP9WvPH7/G60nDux3yMEPTFaB2B4aEcFatFnoBLYVpRf2MHBqAS0ASAXSuCwxjdhKndHfs0SP/tEs+Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlXBoAqh+RTqEYgRssWztSqxUkjbQ/mBKGrPJ/JKV7w=;
 b=E9BnazHneZIgt2jRDAyhIgD3WmtuGixxieO1xAGSiUW/tv+l+2R4vnuQ+u9FOP8Fd9sbvYZG2CrvWYshYPzPxP2/LZfqtKgMiDjfym+cfhDv2PdAZ0+IoxMH97SRgLm9I9Ta/GlHmQGGF6S7C3m/MVrZAZ6dukmZWzMsbKdkyz8NG+HXS4iI5KO7X+ISeqrbvEBLzoSgKybnRfnufiYfwfw5d/94GqrB+1Orqs9X5xbdxJ18H7ofI+E+bd1Q46cKgv64fkk5HUgisn2D1N38NMu5We8sJ/onlQOtnROj4FfSzb9E4NUyYJVNsU57lYBzjE2dkkwRUmqlVWw+Dn9SRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlXBoAqh+RTqEYgRssWztSqxUkjbQ/mBKGrPJ/JKV7w=;
 b=eVCLBd4iIZ9YiLEmICQHufWD9tYp3mCz1Uk9YSXlvpjBKoVlb0zEvHAWBGIfDSdmMJyWNfqrQtetAJJYYeBJBHkn+MKgtQ/XaXOlffksx8RiVlEQzGesHdm4Zt7QEzCLo3Hi1jqzhOz6tZ1IyLsxOWyuqYNS8H/ccdt5LM2WKBA=
Received: from CH0PR03CA0287.namprd03.prod.outlook.com (2603:10b6:610:e6::22)
 by DM4PR10MB6134.namprd10.prod.outlook.com (2603:10b6:8:b5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 15:57:42 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::1f) by CH0PR03CA0287.outlook.office365.com
 (2603:10b6:610:e6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 15:57:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 15:57:41 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 10:57:34 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 10:57:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 10:57:34 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 684FvYBE3777719;
	Fri, 4 Sep 2026 10:57:34 -0500
From: Nishanth Menon <nm@ti.com>
To: Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
CC: Nishanth Menon <nm@ti.com>
Subject: Re: (subset) [PATCH v3 1/2] arm64: dts: ti: Correct white-space style
Date: Fri, 4 Sep 2026 10:57:32 -0500
Message-ID: <178853741346.2994296.11300311801618916978.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260806070245.40219-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260806070245.40219-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|DM4PR10MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: 65c41ad3-5914-4948-2982-08df0a9d4053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|921020|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QssWl94u9Ojxmf0sHCuFWe+lbqXup/0z6EDdBhjbbu0U3j9Qi5n89Rv++kdQxJ/ZQaVr1H5/2RIKxItHYx5tx4DbNw6WiN4ZUfmD/9JxbTNu15TQgv5d0ljOTl8/pWze9VlIyZx+N+bflb9MQ1U7sp6LibEUtwEksoKG6meklM2KyjFzz4MmKfUoJfxIKP489Aq+H64vzUD0zxbP/j7KWV2GeJd3HrgIC3NbDfKcSgQPBVySZp5drmTGts1DLa5fDmmYXjgFhdzvkmgHPITGa4ZbMdFMYBrFYt85KNQJMA1if6mH1reJOp1pujzg91QG5AGq4ksJFqJ7EcSk3eFQWcCe0mdOdswPeJWfApeWfy/wcWWaJmUkR9HPCMf12ytoDiRKB9sdznRMajW7+dpoj/8qmlyNT0x+TQWCj+N0saqh7Os9+iWfzyy58BkxOrefjI2UXgfFj7whlgTmhDpzE69Aw1H8AHjFY9KSirm+JgA8XS3w2e5DujctHnyZRRWWfheLvScVCate08z3wJfasQpHCym0etVokAbPo+lEh0BZE5qf1jZroeVuiwsn2PHXn7x3De3sVyQoPS2udF+g/65iGJHcckXjBrK4OhLl0FmCq0xUdbhlO+w1K7GOpxHlKwKux9jQdUD0wIlnLe++uFX6higvibtNrNe4wh7dsoHDygilUyCPms3lB5+8ZpkbS4I6oQbhqMzFmZmC8F/Rc2ocSblEOgg1eYeXyi3bbKozAWSXX2kMBMUlAtsZVhVB
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(921020)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lPlL+A9chmSROvCqzeABjFVU/H3FPph84QFpRcoOk+44z/RuMHVtxnOqxsN+N2MsRQE9r7DUlRtdVNE9cqh76xQ3y9R2rqzMNur666nyjbLqQqcyfMqWVI9CVC/E5HzfMT+GnuqeKwPdQq3tjm4eLgjoc48vE1/wiPJr8zC7waoaFoBNAELOJeKW/xwNHCG0VUmHa6obJlqf35Dy0Pjdu0hydMmP3IsVQAFZGb72MyEC82SbxOPN6giZfgcnwSy2oDhqRNsB5sg1ZktZEyFv/FanFe5aH1YJlzcWw8GXYnZyMFcyxVuvnDYM6sCLxfqmMggP1kONSx5TkOlTtHN6pejATAa2BW2dXOBpztd23mYQSxiH8GX1XPViwjdntvTl/EO+fL0++11L80pYaGODZUfMz5VPeJyAYuWPxAakzrGFZB5dZL6rRdVhv23TmXjH
X-Exchange-RoutingPolicyChecked:
	tk/QOxmxGCwp97XLS9uQIYZt7yZ6JhkP7Hcuwq2vN/ty56eg4xJHJN2AeEVPa4cgytk91Ou27Y9CvX2YH/SoqbfeDGqfoxRKkkk30TxHhSIab3albcJ5c44ZWjkaMtnVPiTHvSDfvyp/f84ke5B+dY2++8jjvUfFrS83ds/Jq8av6lgAa0DR8z2YZbO/gXiZARCKhIhzLMnjm9BXQj7CqjCCZaOFp/wOiXyUFjcux6cyDykNo7HibwT9K3sCPYLrIsObgf0rt4Ml/FRaCFNUDBGpTbZ5pO1eNhOV8BvYQAUoxMhiKygiT4VyjMkKWCcPvZBeMMWOYGi4qIYtr07ciw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 15:57:41.4265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c41ad3-5914-4948-2982-08df0a9d4053
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6134
X-Proofpoint-GUID: LWcYXEm9r4hMu7ZePuBPSFmyj5ujFdu4
X-Authority-Analysis: v=2.4 cv=GZMnWwXL c=1 sm=1 tr=0 ts=6a9aea79 cx=c_pps
 a=/yS4kdDgObtqNMJizKN72Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0NCBTYWx0ZWRfX+xeZ5T7+CqQC
 SYvWRwjAFzuvX9aiua0JHXPnWBdmSNkN8qhaOWkwO1sJAp3VLRybyTK9qArQkazq2Rx1B8fPgnE
 Krn2qwfnFKl0n3b/RL2Bfex6PtN/a+E=
X-Proofpoint-ORIG-GUID: LWcYXEm9r4hMu7ZePuBPSFmyj5ujFdu4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0NCBTYWx0ZWRfXx63HoidRH0tf
 0VcsjKe9fHxL4j7SeDrdE0MizuE14FpqdXApk4dSP6hioRfKBAwuCa6O9B7JhTRs+w62/Hp4aXm
 jJ4LQD4zJTM8SUtRLlZDH6JNp9Q28upPn55H6YUQyUw97LkWEbr8mm0dTOI9NOz9Nvx9VWI0Ih6
 a6489M0WOcYU752XGCvDzVkMXWr4cBOOFxuwftTLcKVA6Ks3kHb0RoW6K7MKmE/rMzqKcbPEbyg
 UPdQAk1SvoxvJWaZbdm47zCAHMgXiTWvCZPbUgJR3xxA49IGM9rPYz4Ex3+aHzY3OxLyY0Q/0rR
 5q714+O8fnkfM9aF/abuEvjl9lK17Ib2mvE9jQcBsGjV6waM2fbVP/gJWZ7jzMM/2D+zb67TrAB
 cYfLaZrWdX0DCByFw0M2eJDbin/32xLA1bXzAdSqSLNpZ1ke5k5NpXE9pv8JnpXuxwUtYBr+6Z8
 +BGFFaJZs6q7vmCzJjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040144

Hi Krzysztof Kozlowski,

On Thu, 06 Aug 2026 09:02:46 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.

I have applied the following to branch ti-keystone-dts-next on [1].
Thank you!

[2/2] ARM: dts: ti: keystone: Correct white-space style
      commit: 1c45010718d3e04a1f303dbf923569573c00319d

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

