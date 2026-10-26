Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792989978;
	b=VmBwsJmHRv+4qKonky3LiDLKUauXYhmElwkWCsdhU8OUk8txPLscriTF8b3FgqzDT+na
	 ldxV9EM7ZE+DaiAlWCer739Hh2F3xQBpeF2JaRqHUd+fYeqEtHPTb51H0Cva4LnEBAiDf
	 RwpkktdJ+lotOiz5YujxPQe1rcSVAbniUMwtzXrycxiCJEISGg8gIiRVVtlAr+B80bIGH
	 1mVZU6I6K2b2icrQKrtS734EbJVq1LEFswUhHt8jWv3bi1EKkZc1JERZ7u+DoONI4ITz1
	 lyM+GjXgSzqwsm2tDAWCswPBJKXnmZ5N8vNMmw5cEbaKabbyGysFGdodsJ71MT2N3fg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989978;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=tadSLqGUqKiUCsfYr9eax88RGnZU9R0VqCHVwAt/z2A=;
	b=HILGFYYXccjK3eVDwRhgY1Btu128FIWDUZ+OJrmBQEdyTpSIPUQXNaVrYqByPsMWeAMX
	 rQnaXUCFyERZMdvjmYsAQap+1VaZiJH8ZKSsTx3M0yT0A7vzynQpU/Jd7nSTfJUspNXE2
	 65d0Zj8t+hN6vM6u02eOZbZkH0E9c4aZq93MXwtCXPFODxQ+9y97LkZYqVLeGltRB/6rG
	 fiBrR/mJhlfpXe7G9sOZERD5Y3qnWk8UEg+b7WVlfT8Vn+mFWQK4ydxAyYVfLGXS7eaYU
	 pVn2l/LF/ddxVlHGyeboxiiZLpi3A/clijgCCcl0PwTawuPg+PFkchqjFUFRVpSe58A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fGPqytNf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.9
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010009.outbound.protection.outlook.com [52.101.46.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CFF606A32C;
	Mon, 26 Oct 2026 04:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3CFF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fGPqytNf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNdO870x9UJNns9O6tO2stVG8Mme8iWYUHOSBJ2gNJZPAE4r+V++r0CqhbofPwTMjkYVdYEHl5sOZhoChQQDZi4LqidWyUifnxCpl3GY2rwVzoxTwPAGe6cg+iqoSxYVeFj/k8eRoxHG4Z/1sOegRyOWRApY2aAkY82R6+RF2F8hdXs4alEbxmL8boDa475s3t34MIw+viMvbuMrDD2/DQbwGWJv7mL4TD9TmqKSNEQwxcSUVien4nIhjriSWqdMm9aNwg8Eurmqb6fDJxbNOPwkKGfouL8jNO8RDdRksAopMOO4VtvZ5NcGqwUmRN13ixIjxo/pE1+next0cI1NCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tadSLqGUqKiUCsfYr9eax88RGnZU9R0VqCHVwAt/z2A=;
 b=j7duWF7NE4YvPlo6ou2VMdSYz9mzklKuCjZJk84pVP5BLK6f1j+mXst20o5QG1pzFQn0iddqrf/pBX6k+zYzfbVs7a0wyTOal6kdalhFeMeXv9MQLedImm27vcu0Ylt5vzEjF8zyyhCwf54NhWR5Qran9i4KEthSaFOPArcuYUWGPsgIKjgv+1qO8hGzU2yxvR8d9avbXxG1pCgokutrQO+IjbBJXkDvEmMbxWF3mDp60lRyIaeipJK0p9kt9i/om4yKhL+CS7+lotQl6X1mm7+L0XI42uZRXr39WexjiXzBVqpLu5kZMBzuaxUgMJDyIVL+5dvhmm6nJLvIV1KgdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tadSLqGUqKiUCsfYr9eax88RGnZU9R0VqCHVwAt/z2A=;
 b=fGPqytNfe9G5Z8s5GZ7mk+XdE+D9rR46VN5v8fzPw4SB1f8Nd/qg+4E6aUy74KZRDjuLQTSU086d8cezBkUTm5iQYheUE27P8lCbXMz+WB4/YnPOLBIGvhoHOwTD1LDX6kP6RCIMZceEGZ6eVpV4r725hyQOwOddMda40GF6/jo=
Received: from BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::11)
 by SJ0PR12MB8165.namprd12.prod.outlook.com (2603:10b6:a03:4e4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 04:46:15 +0000
Received: from MWH0EPF000C6190.namprd02.prod.outlook.com
 (2603:10b6:a03:59d:cafe::41) by BY1P220CA0011.outlook.office365.com
 (2603:10b6:a03:59d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 04:46:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6190.mail.protection.outlook.com (10.167.249.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 04:46:14 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:14 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:13 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sun, 25 Oct 2026 23:46:10 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 02/13] soundwire: amd: return response on IMM status cleanup timeout
Date: Mon, 26 Oct 2026 10:13:33 +0530
Message-ID: <20261026044507.2310694-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
References: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6190:EE_|SJ0PR12MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: 7836b38d-1e05-4386-e9e6-08df331c1128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|18002099003|22082099003|56012099006|11063799006|261021123027099003|10067099003|261009223027099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	FcUskiwQwXsBpjKu7N3WjqnuaGxGTSf1x/qfAsbnpgAOpgQ2ZlnnGwmf9xBYMg4WLXCQpeCftSiHg6mOLPeUqLnYxFSBTn/fEEhhbDp0PNPRoMjkEEt3RiGVWaGt7orBjnxwtvnOHtoC0CaviivWJdqij542I8Lf/cnFMZCMFaK0WBBTBy1RcE0YuGB1C3+R3gfBrA3QE5r7Nkd6BxzOcbPmFL8vlk6VrxSWr/K9k+3l4ysDXUCxtxPamoD18Y59qpkULFW5SyaPuT5PymN1fm4ZHnroFQtQcR9GNiqtqBXhAsKlKyuSNq7bxIjJp6mVINzFxs08+FKnwrGz+RNghbSfrdYuAwIbOCJuvr5kW/R9maqW1DiWQXoR1qK6VLteG+PT2uFgBhu0DHyz7GGVPuRmN7cChmvY6Q2Xc1gU6fHmNx2MkKEhgWADtUuT6BghpecIuLzUqOnhHtKlBAAhpVwERxMVAI6nFpURjwujBl1x611pGGjpMFnstkwtsbj9XP2/Ig/07zK81RHUWn5tbcAqU5zs/sgJFDgxYXPozjFrKce6T/Qcz5riE50FYWgWhubt9WhAWLhhJysVWrZg40v0KbvkxkGDD4+7gJtPmcmtSXU9N1Dlz+e4icVji2KqLxbqsEl9oe3VhSoszltXtkA7Yu+kjPW4YDNpBaLccl49R+JM+7gXLhZkB3H5anBCsMhf3pDS8qEeskYKfF4TDg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(261021123027099003)(10067099003)(261009223027099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Wv02ZiLbo5K31AyTsfdfMmKTzV2gdaxqpFMLoKpJhVa7usSULfTzTdPfsPQNXWs9ch9YBCfYlkEPlYgxA4PmwM5FjYG2DfFouezQ150fJAE2JnpnM3D9jLK9Nib1TTDpPrWFHgxN66Kzy5iDbgJgjB9jjF9MHtijX2xt2W5r7yZ/l0h4W+O8dCKkXByf/iwS+gb5QY9RrmxbxILVpb+g0XcoE5JUD4ZmUrCfIWbP2vdQhCVPW0ZjKhmVx03aWJ6lw0++EI0BsW59PnybpyfpoMvxQBUwFVRKDYAT8lVsxGG32nhIV9v8q6JDzOzkU5xlzcHUUiSdJoOEeVzGrMI0zTfkLPSlKHqXAMiB9BJzYg+b4sVDQkYujwEigoe5kU9G6SficdBeiX7rPSkagxHE4ws1FhMoIGfrHpBZTquYa8rfvNScM0pcUZfQ8Q+FkgEr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 04:46:14.9173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7836b38d-1e05-4386-e9e6-08df331c1128
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8165

amd_sdw_send_cmd_get_resp() reads the hardware response after
IMM_RES_VALID is set, then writes IMM_RES_VALID to acknowledge and
polls until the bit clears (status cleanup handshake).

When the cleanup poll timed out, the code returned the error without
writing *response, causing callers to report SDW_CMD_TIMEOUT and
discard a valid response - upper_resp and lower_resp had already been
read before the cleanup write.

The cleanup timeout indicates the hardware was slow to acknowledge
the clear of IMM_RES_VALID, not that the command exchange failed.
Log the anomaly, then write *response and return 0 so callers receive
the valid data. The stuck IMM_RES_VALID bit is cleared at the next
invocation by the existing bad-state guard.

Fixes: d8f48fbdfd9a ("soundwire: amd: Add support for AMD Manager driver")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 307cbfdb9442..0b83126b5ce6 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -285,11 +285,9 @@ static int amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lo
 	writel(AMD_SDW_IMM_RES_VALID, amd_manager->mmio + ACP_SW_IMM_CMD_STS);
 	ret = readl_poll_timeout(amd_manager->mmio + ACP_SW_IMM_CMD_STS, sts,
 				 !(sts & AMD_SDW_IMM_RES_VALID), ACP_DELAY_US, AMD_SDW_TIMEOUT);
-	if (ret) {
+	if (ret)
 		dev_err(amd_manager->dev, "SDW%x cmd status retry failed\n",
 			amd_manager->instance);
-		return ret;
-	}
 	*response = ((u64)upper_resp << 32) | lower_resp;
 	return 0;
 }
-- 
2.53.0

