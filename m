Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792523764;
	b=FpIXYVMpmHPPkHTOXhT9oM2/5JuIxKaZ8VuAeaNbu65RKyXuraiDjeUKp55LH+hHOPIj
	 ZpPRkzFAPmlUlcEucORnjw1m9Yml6OshZ8rV9vZrtW/gggVOL3LPanT5OtyYz4w8QQVWS
	 ul4K9g2wYdeeepM4WewvM642DH9NsIjldVbkKpGwV+Cb/HdiFpX1us4LwHgPHecv2RZgm
	 UmC65PTG+1AnxMDcBQiXm8qe/tL5eCLF3b6YFdnEOrL0B3P55fiEdrCPRNjMuBbFovcix
	 iUpc5KqJ38+V+9iWX5zuC+/VX1pymMGlNVgcHcZpy9MgVLHsr859OHXzn20FKkaJaTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523764;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=rtFSEmDaO2BH9INsik6bd0U//v8wiu2o0a3kDK0q5EQ=;
	b=fyntTnMBZbhW7bH0pcdvTapi5YIEzZRo2rXXraX85fS5CPIv7E4daAM7BNPoF1YyeV6/
	 Z7Ag9tNPT4hDDBwq4c1KQTdcL+O6rIHHFi+bJPxI0CafFHOTwqAHtV1Ezi+9dMdXu2oIz
	 KW98F/BAZVc9EKSVwdJyVsmWpdMwGg+Tb+qKTSnBqxNQZAiJEOq+AtTRVRDQ8j/fXI1py
	 VWidfd6j7lSN6jSSMlcEJII2tlicu1gqyB/d0H6oja51vkhxLR5RK2REvga0Oi25PiM8u
	 QDcWHHQXRVMl3m0ecPIcYe6+xdKGTJVJGyzmlVaX4yPfOof1ffIouAzoj7hgsNoqoaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FiNBAek2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.59
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011059.outbound.protection.outlook.com [40.93.194.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA17B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA17B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FiNBAek2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1gGmlfiWk3rXhn93RkxbN9V313F0cRpfZ4G3bZ5auqXby2lAtB8tuJaGF1fvrcy9KKKQrZlVUG/DwCxiIZHw4780iNtP1zowUkOubOOnsr3Vj5TINJjMGR5g1pVmh7HkIcHaHSvGBA9N25n69jWOS2WylmzZgBzRFp30rAhLQOVBA8X3GCH+HjxwOSmu52YI8a2zjbpfwMXOXkqSEtgsyyRcgMPA//9DMWgSxwOyeea5iGe2oYFeouGlubQKDYNEEnicxVeu7PsOb7THaVnJcbNAnxSc5xcH9tZ/MBBaPj5Q9oNlIRN0Oe3Ku72GLu7DNYHtlFBuuBYRYY1ZfAu7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtFSEmDaO2BH9INsik6bd0U//v8wiu2o0a3kDK0q5EQ=;
 b=zTSvo4+lttaeBNnW2Uamg0sNL+B0pcVRjLS0JTkYGUrbNLAGlFPrneGBLrS3mCHNk7dBIJ/LJwiZXJs26/Eb3p39eLQR/Hh8SBcaqeBGkzb85qn2q/zp3W2NPk9MPNaCwJjyP2ibjQBUhluY07zOaUZ9Avv0n+qQsYDbnYNEwABQBirHiqbsVG5U/6aYdAiTM20yGqMKkQS6yDB3LGk+3SddMewOFsCVhPH8o0SSMgqRURO+EkEIF9nTkbrYWwg/wcHHTtyndm94pjeWrRinxzCdv2VCh5Sv6C8Bb4xaIyDyN9ZYEgESiFTfBjbMTkbozE+2xYmR3qkkb+oawkLexg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux-foundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtFSEmDaO2BH9INsik6bd0U//v8wiu2o0a3kDK0q5EQ=;
 b=FiNBAek2N8cPzBaYLyuXYX31dpBa5AAm5I4ouK08t9pnUmlF48/fW5ASTwD6BKZkwVooR0soF0eG2UZftjhXteXWCFsRsM7yTL2rwNhtntIq63314cE5qZXnSlWBcAgURxsEQZLTQGkRJFy6SVp5NeQsPl+YonIQ4uu8ROuT4xfv9qvi2BZ/gGzk25pP+F2FAb3dJ1UCA5f5247yfOw5UeAybieHy07tXtT2DSfPeAwctnWKlheZssi7GVpaPDZumM/KLs4QPJqYbshxXRTPCQDmtpwyFdmL28LaqVA3uRiJlW59klTuwhtKjrM9mPNaFna/26ljcM0aCa5+W8ZrtA==
Received: from MN2PR05CA0063.namprd05.prod.outlook.com (2603:10b6:208:236::32)
 by PH7PR12MB5927.namprd12.prod.outlook.com (2603:10b6:510:1da::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 19:15:48 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:208:236:cafe::22) by MN2PR05CA0063.outlook.office365.com
 (2603:10b6:208:236::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15 via Frontend Transport; Tue,
 20 Oct 2026 19:15:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Tue, 20 Oct 2026 19:15:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 20 Oct
 2026 12:15:23 -0700
Received: from 717d7c0-lcedt.nvidia.com (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 12:15:22 -0700
From: Dipen Patel <dipenp@nvidia.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: <dipenp@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<timestamp@lists.linux.dev>, <runyu.xiao@seu.edu.cn>, <panchuang@vivo.com>
Subject: [GIT PULL] hte: Changes for v7.4-rc1
Date: Tue, 20 Oct 2026 12:15:05 -0700
Message-ID: <20261020191505.3080042-1-dipenp@nvidia.com>
X-Mailer: git-send-email 2.25.1
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
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|PH7PR12MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: dde2f594-cab7-4519-9c4b-08df2ede8c0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|13003099007|11063799006|56012099006|261009220027099003|261009221727099003|261009223027099003|261009221227099003|261009223327099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Falb3KV1Mtxej6JT9JWJdsyRYAMqJ+uFK64zZLmOGY2k/PeEbYDJXnIa4PAqY2M23XrAvmSuiDB7GSBX8wnS8VbUCslO+FNd7AXW5cZZxPNaWn+zPCJ0YUlUUTpju6lmJv3vt50BdCJ2bPsiA2IDQ6vFQZQO3RzXzS6wtZtRW9TjbJe5W+tJ33AqE2xdhsNyNLu71K0xoHCKEY7MNRLRnU2wi4/VM5a7vX8W66W+jfUrmDNIrW82s4gZUP4iqTorTOeJ00rHQiHSdh/ZX2/ikWvFnpSDbmsjx9knOLvGWIeB5QVN2IrOiBnPoP3aMd8c7FRmgAHOys4xIsEebriZWQHwB0mr5w9Gl5Lm+WdLWYZC1tpX40B5ud30XVLarV2Va+h0HBPC142BEF7nOMe9nFDtyFkxqn92ljOhKK2E67pYovUttWMC+Jn/iPKdvMVGg1WAZY502uWYlpiwgFyp6EbrmKJ4zjKvSeBa/ycu0fN2YXxAamg61Cloi2UO8xKcYPpPvuCiJIiatxbCwJtlYC/oqE8gukz4QkWms91m0UFso8FYWZVBjw7e6Skw1mga/WihnJ5I3eA2ZD67ekCEZ4PZ3iFc5LSv7tJAOBOdzvxxQx1F89x609F6r/HgNw2QqgCi3v6Dr8UGJqCeDgRsXWLa5qlHcD7q1BpppphRXYZ+bVuAorBtSNpMEITNeyToIFeQNkogXDnMIjNYAswrbg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(13003099007)(11063799006)(56012099006)(261009220027099003)(261009221727099003)(261009223027099003)(261009221227099003)(261009223327099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hJmvPdRwqph9YjkOk35XQV2m+T9lqGwq8lX0HPIgdAHAQosmNpW9pQ/2/R1HmnQ13gMIrL7fMcoPcBqBu5LuA/WSEjlScYl6+IfziVL/mG6OZ0/+cuZJsLdGtvnbpeXKkOLryEWeexQsOLC2Xbn7XBQaHEK7gbdBbETqrwqlsPK5KO8oB9yxedpmfIsFwwMduO14nKoAAOzAW1m9xCoFHqY28vXhxQ0ENEuUnDYA8r+1AuAyu+DE+cuwTkEuEU9bCnXIWr+oC28gfOr25JUO9JjMPpBfwufN5dPeoRRi/8bcre7nND3u+vC6eSSHt1vPIV6G4Zln78Fg76Ts/aSHZifdvKyn+JxSYRd+HiCBpGCUWGy6eF8T7zIIrpIqlcrORmHgHmR9iqC3THQ17Ob/7t9+LqizBeo0n9QcJvb7aXK80/eYGHvssMx/Way24zeQ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 19:15:47.5162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dde2f594-cab7-4519-9c4b-08df2ede8c0b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5927

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/pateldipen1984/linux.git tags/for-7.4-rc1

for you to fetch changes up to 30167fadbf87fa901a2fee49c30a5c5a506a43e8:

  hte: tegra194-test: shut down timer before GPIO release (2026-09-09 11:24:13 -0700)

----------------------------------------------------------------
hte: Changes for v7.4-rc1

Updates minor fixes as follows:
- prevent releasing GPIO before time expires in the test code
- initialize spin lock before registering the chip in the
provider driver

----------------------------------------------------------------
Pan Chuang (1):
      hte: tegra194: Remove redundant dev_err()

Runyu Xiao (2):
      hte: tegra194: Initialize slice locks before registering chip
      hte: tegra194-test: shut down timer before GPIO release

 drivers/hte/hte-tegra194-test.c |  2 +-
 drivers/hte/hte-tegra194.c      | 14 ++++++--------
 2 files changed, 7 insertions(+), 9 deletions(-)
