Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113B2582B9D;
	Fri, 11 Sep 2026 19:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156325; cv=fail; b=rYjrjuzCpbtm9Y/ZH2OX3gJ5gHZ09gX2twjtrqDgrSjqMOkdw135cLfDwjs5dA9koGDIe5t18JCFHwVfTGpKEE+iGd6FdXCywMHVLTL37C+OPV82PgKgosNX3+XhCmUu/9Qct50+gaPPiv7gnEAdE7s3TuNd0k1GjLAAh4+QvWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156325; c=relaxed/simple;
	bh=4fQzsVLq5S3jZ5bPRLDo6rlwR6mX7xDGOu+1y8WbpQ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WGBAX78nVFwfdm9IzEr+qUieU7ORu4pA0FAxh6Yo8g/miPD7fqmqmlhiTCGABEtBMDAnWRuhnvOaun1NTSr0wpi8/JBNRW0gibVGdh/SdcCR81jgmcYyrwYtvc9jXF48SZxaVmDx2qPcXLyEDgqqMMF8QOHw8K7uTpOCEC07H8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=G2712xmK; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hBC2KzXe; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="G2712xmK";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hBC2KzXe"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BJ4PTe2451787;
	Fri, 11 Sep 2026 14:51:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=54EFiv7icSjlghD0rZvfP5qqlUc8POqiFA+uqZpQr
	6U=; b=G2712xmK/NHJeot+HXMTC5GtKf7CQj3ei12OsyYLGeoFoqVSBjgo7i+0s
	/bOhDUT4KWrYNwSasX8+XxQeehDppU9PHQLjS7M5BwMrv6IhfIQ7pC37PEMS1gx9
	D2tBfCShiLxSUcYAVLfkiV6iz2S5ONE9tw+n4K7gkN1v0FOYRrEaKEqEtgniqoQf
	QQ4M0pcwhP7hicFhndJcjk8Hbll6IbLUwkyjxwV5qOILGx9aF2fMbWZJRXX3anC8
	R3x1w4ZPOgoqjaZsuiZaA2wi2KfYa9alJu87jjPU8RQm1WAz6aPaVajHVxfZadPu
	po1lZp2pDAxaCLw3FC3+tFyt7Tmvg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010024.outbound.protection.outlook.com [52.101.193.24])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gmqfwg71a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 14:51:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQDiPonaaz9Jn1YKTNgWX5sdJRaCs6q6lTPmpHuq/4yNvD20VnDQ7S90flMXoBw0hDu6sRfn5l+jsm6CLTcVxRpk8i6nhXmHqooerIveXaY5q+aH/+auaqdk27+1sw2/9gdAkmJhCB56b80hd5tu2tbGaLrpCqK1DMnLT8ufRbv8WO29AYJZ1YmxZH7sIG3TWwktHwkk/xTI1jiq1z2u4pdC7c0koNLtA+3GnPOuIU1L2es3E5+5SyCEayzdKV3n9c3AiX1eTuvd9XBHBryXkEyOZ3QDE83Dnc66Pbos3tp58Durfa2UjcMpf2BSsKxBHiBYP2E5wJqqTXsBZD6jCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54EFiv7icSjlghD0rZvfP5qqlUc8POqiFA+uqZpQr6U=;
 b=WINXCoDffc1H7U20MWHuy1b8sSURWJ9g16VeqoV46qw5pdj+K4rbuKDfJjSUhk30c1a6yyn0PIYODwxH0kOWvQkASgz1LTtBMKQJS6GZ9nBtxvkv5u+7jXK8sT+ue82P2NquaidS9edK/682Dv8u4moRkpBEL/GLRM8QnbRv3ypUUyGTwNzDNmXAOzs+IXKbLYUhs07xGl6GsgsnJMlT0h4KVqk3g61wXlh+ORZ7Axf2sZooKBdyXYBr1Jsp3zlc0zCHUOT6sk38fiSBJjCvAV1gjMslfNJmlZBorQwHgWExcxJR9g/PsIBh+qOh1sO+2e/utIrqlYXueXG2wxB8ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54EFiv7icSjlghD0rZvfP5qqlUc8POqiFA+uqZpQr6U=;
 b=hBC2KzXe5rb/6s7Ysgk/QC5cS8LFptQ/AOwUDWQFfQhed02/pyZ+TNrgZ3Mz51wUQpEhTi4KvtOBqGEe9SuQOLkkrMGPcZ8mjBFSdbeSt7+fb+4NY2VmMHxujmt0h6PvbzVFyXWTQR9tKW+ZzyhGcTNUEZClNUmWt0wpMCiq4Go=
Received: from CH5PR05CA0013.namprd05.prod.outlook.com (2603:10b6:610:1f0::26)
 by IA0PR10MB7133.namprd10.prod.outlook.com (2603:10b6:208:400::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 11 Sep
 2026 19:51:36 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::75) by CH5PR05CA0013.outlook.office365.com
 (2603:10b6:610:1f0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7 via Frontend Transport; Fri, 11
 Sep 2026 19:51:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 19:51:35 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 14:50:44 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 14:50:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 11 Sep 2026 14:50:44 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68BJoiES1694738;
	Fri, 11 Sep 2026 14:50:44 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am625-sk-common: Add non-removable flag for eMMC
Date: Fri, 11 Sep 2026 14:50:41 -0500
Message-ID: <178915622397.2343656.11388334559142563308.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260806202106.671328-1-jm@ti.com>
References: <20260806202106.671328-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|IA0PR10MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 8323a91c-f201-4658-2b20-08df103e160a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|56012099006|10067099003|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RO4pZnY0SpI/HGln329LQoYTd2JDFyiNRUIGjyqItid/dAlzRsSZTMtabzr6NLVZ8eHghW41CaukXK6XIphca6Kx9xohd3peeujsAoIfC8rBerSZsGWGklhVTF5PbAjag3YniyxsBrbB30/2zertm/qxLVzh+je/UgbNZY15vFVWLG+F7gZsiKPn3CHwQogSybEh9pAvOMf8Q2MFnOL29+jY3wMpK4B/Jgbg8FF1vBkeImfi3toFoQPQkh0ZYrxxwLtnEk7UMvnSY85s9hBxfGlhSvziUqnr+6gWVVfpVu8hkAPZf9ByFLBObvQnwpxy6Q6SxCYfWSu4+ND9VW82O8hfPbN+aEXjDfc9UJKV9GwdA5c7LfkXF7Kg1HQFluIsacjME8/ZOCVz4kc+dqEnf8DZuYHKcMRhOuFo6pqgSVdEefI/aqaDfIJGPa/tpzOqIqyad38o6sMBNjwJKJ2YGD8IDpxLoXQNWYZV4x/r1I9RDQACPedWXJU7Eh3fZ+klDtvuCRDAWXDpcB6m8JmV1RlVDi8DeChyp/hsnO8bMJQvjdlXPCiQgxaDuNqTh4NFfmDg8Y5cIe2bfygWyJz9rYtxBf9iaB2x7hLT4UPlbUetcjC2vcFhJIbVsBziO9BLFuk2lWoN+IwKPjHY1GiK/g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(56012099006)(10067099003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CAQ8yomw2qo8Und6RSYpgDoxp+ZxKXNRpZV/fnwTzlU/XFzOhXolIh6fkKT4RtU1JxA7kuTOzw2sNeD+dKrl7S9Zj4JrxsRhdvsH2PSTz9I9c1+Bhhmu8zv+cnwljrpeqS0KFqu1nUxvfneQcOqPaddYSbVBUWaPcgW+dZ+D6OIYgWefCQRquH+NcEmIjpm0GKqRaL5DkOarEXp1Qc9HRnjJS1B4syh3YjpNbRZIyI+sSz3yRd0kVmZrQx7Yh1WyXtHwqvvhvhZSvj61ZOag/SmvLRheAg/ZngAlfnPlX1NnN9+7GpPAZJ1pwMQFuwQbs+sKEPFoe4SpKqGjylk+gSVAYSaerC4njWOtra3X77zvpYp0R9H/GoFiZRK5aoXeSxW90DHQpY7bKspnLXscm8i7Mt7drdG/irwiW6q08pdtMAtmpiDHuCi8+jc3/ja0
X-Exchange-RoutingPolicyChecked:
	c3Y7TVwe9sKYBV+qSsJCqAFED2AUNOZ2uZhMnvFh5vS5VMVBRUfrq9AM71O5j2VIZdtuDRB21HPArWewYiQkxq6rNQWrZOLPmA7SrW5w8WQF4LhCB1BgTUjJU8kHpEBaAhL+6lZWRBZ4nR0pEBt/I8LC+LpImpQRfq76zwXxMbCz6onhA8qQbvd3/Src5gyUMjYIrMtXZakmlFr4pqekK3tDtgaOtuP76M7UEGGdFTIRntxq9f2q/hwh9iim+EXvLvg60ZOvEbYmQ9QPnSri/UL6XilTYxBBprsXNp2m4dpDEGzuVJS6LezBW+gIx5iB1L0Pn0K0rC6IqRVvlSFXHg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 19:51:35.2974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8323a91c-f201-4658-2b20-08df103e160a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7133
X-Authority-Analysis: v=2.4 cv=GsjXaU1C c=1 sm=1 tr=0 ts=6aa45bd0 cx=c_pps
 a=T1Ebi/dL4O4Qy7Yf5tf31Q==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: sjrdbdUhNiWNNf2sybCGuXmTTRRWDRtZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI3OSBTYWx0ZWRfX3l1mRAI3vAsa
 FM/pQw8tYVf82xfZCuhWK+p40YpAbCEQEKPYxMj5H12gZvT2XJOeFJlNcO9kr7/x1AGViiGPnXL
 dZmIzJzOsDNOO9b70iIQjVSfqC0O0ohbOMUaznF4rZR3lNKKi8dLGx0akM/9/M9LhQceSslt+4Z
 oOska+/14JgLoe/C32nTz/w054Ym0oPj1zauvaquasejDfJQzfB6QGgl2SMp9gF0gNYekL287G7
 pUwTZ9MDl24ULRBozGUrZZd5z8s7u3UgVY4vAdKclU/1gmQdega7xZMV6o/qKMEztp8UUxA4BgG
 WoOSifDjx+01wEKeJQm3VKUG8mGicDWI3IiLM0Y5cdUNxFz0uOhF5gaPPh9UhDQdOF+vVp0rWCZ
 Ym7E1VqNrQihdz1PvgufJTZSa+2c4iQq40FoV0V3q7A72vkfCNwDNmhvnd9q0EzxeSH/siJMQ2E
 rKq6+89KHDnhFFn9GIw==
X-Proofpoint-ORIG-GUID: sjrdbdUhNiWNNf2sybCGuXmTTRRWDRtZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI3OSBTYWx0ZWRfX0xlfypZQWmlt
 YCecCfPGYXFQ9hT5ZXpLHfT4sGjOMSdE+611PKKyzQveKWlLkawiXYMKaIT7B20LFqaE9kko2Xu
 bvCQBgtKCrNKNrEN07sAC5uKwaR3lEk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110279

Hi Judith Mendez,

On Thu, 06 Aug 2026 15:21:06 -0500, Judith Mendez wrote:
> eMMC is soldered on to AM625 SK and AM625 SIP SK boards, add non-removable
> flag to prevent kernel from attempting hot-plug detection.

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am625-sk-common: Add non-removable flag for eMMC
      commit: 8adc78cd226e95700edb30da756d15a514a639d4

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

