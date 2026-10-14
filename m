Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010031.outbound.protection.outlook.com [52.101.201.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80C31B87C0;
	Wed, 14 Oct 2026 11:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978359; cv=fail; b=ngQpOwzn+aPjSAPvrPV3hLVAY2cqX/bZGlTzd1I+07iMGqA7vpNEjlYo1EPt01JS4XxG41ETFLGSYHDyilJz2h+cbpkci9BrTr4OTRgvcl+Rt6MeT/BaWT5jJZGfJOt7xBE3+oxjAM3aUJyIkSDYN/+8ZFTOO6a/dPKFTGjno7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978359; c=relaxed/simple;
	bh=mJRqdIUI7xlxw5LHD1lTd3tyPT81uddUcJT3xKXbsFo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V/ZMCEFj7cVZNEjpTvovo6JIBa2/501iX1adVXdyCaLVl4nEwPj0OSR6wA4k4F/qsv1pilpUuM0yzyVXnRWd48mLavz/bWfaCREQQP3KC6fnKC5pA3IWcUrY3SC50B+SSL/q+T16V4oSgY4k9YlnkCtyg7Ygcb6p1zYGWPPzvrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Bk+PMdFL; arc=fail smtp.client-ip=52.101.201.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Bk+PMdFL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCv539QrMREEnGexIsKCui/iyGIGgB4xtoZEd7AZNheecVmEivE+Vk5PJek5BmfAkXqJzAeMWsFLe8Whxeva7TTfmqrruH36LWqt4eVPN6SrLlgfNTy/EfoWSOYqdak///fUn/wXHmk7dtPGUMExwF5qajsClAlnyKypN/i2PkPdmVslg9f7T60BfYcWT3EuZtooz125s3QfTPdbakpiUDRYb7FwZ039jdHLosTiDNoTQW/VH1FMcn6ziLdjYTrltn73cBEQFs2ujtExPyUeb77reIMuyGJ5bg7Ry/uixaGhODkxv0b6qS8aX/xYJbQwMNUnTwOy/RizEBXQi+M0cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hogFGO7iDd/wXCBwhm/2Mpf3ODQJFZtej3AGG47it+E=;
 b=insECOFXTKxyZDZlMMNlfxWNh+rWVRv42k+nQ4Sv4fRL1cQq6NODJla9KWrro5au3VGasCgRiTfIkB6Jz92U5YgepY5QaLfr01AwqGJOHIE/j1Fw2SeRMy7rgkW1jT3UaQPI5Z4PIeyvSi/nRzZZofgbQHZ7fcTsqtCoQjAfUI27bB9aopBmy5fXsTJ/XEN4gWAAiWWKG0U1l5MQeCKSwTv+z70COYEcfdgqjaDQ7yj+go7JPKj5UB2alYXf4hBArESeRQ53K5uuKJtkI0EIrd8mHdiP+ndr24TmLWyTNJYLy2Uj7p9xgX9eAjV9BYcbUCyzC9tgz98qKXmdyyw4sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hogFGO7iDd/wXCBwhm/2Mpf3ODQJFZtej3AGG47it+E=;
 b=Bk+PMdFLbbKsnVOoTCkaZG0CIIGziGShV8PyW28fLBIWxezgiNaTsWIEqa9yxmUCba56DWKWqQwb50zGLbmf3CevNysVmGRsLFxxM8wVab7XaZZ0oaKjIFzQ9e7AcpoStKmCg2sxeB/bvA4/jxYaj2K/lJcmvhdjBEsnnosaks8=
Received: from BN0PR02CA0006.namprd02.prod.outlook.com (2603:10b6:408:e4::11)
 by DM4PR12MB8500.namprd12.prod.outlook.com (2603:10b6:8:190::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 11:45:52 +0000
Received: from LV8PEPF00000067.namprd03.prod.outlook.com
 (2603:10b6:408:e4:cafe::90) by BN0PR02CA0006.outlook.office365.com
 (2603:10b6:408:e4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 11:45:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 LV8PEPF00000067.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 11:45:51 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 06:45:45 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 06:45:45 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Wed, 14 Oct 2026 06:45:36 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <vijendar.mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <Syed.SabaKareem@amd.com>,
	<alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>,
	<linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<perex@perex.cz>, <sound-open-firmware@alsa-project.org>, <tiwai@suse.com>,
	<venkataprasad.potturu@amd.com>, <yung-chuan.liao@linux.intel.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 1/2] ASoC: SOF: amd: fix trailing blank line at EOF in acp_asp_mailbox.c
Date: Wed, 14 Oct 2026 17:14:45 +0530
Message-ID: <20261014114446.1476489-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261013154644.3788064-10-Vijendar.Mukunda@amd.com>
References: <20261013154644.3788064-10-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000067:EE_|DM4PR12MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bd6fd68-19e2-4fab-ce27-08df29e8b2c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|18002099003|10067099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	rLrKOSlDzLHVUyIei5XbuYW3pwVpfjKV1kbkP3BSb+dkI8xGMY3gxhMPg99Z4on700Y84Ag6Lm6SPDrysi32BT6Mv+JC2hGh6B/7WrZeAcIdkZO0rneoC6qHszibe7Wavj4nRIIEyuLASoNmf8UOsYA/FhG5RanmVI7MfLeGNLweWEhC5xEv5+X+qUQ7KnnQ/TuUJ18bC4+nUFpayPjPEBzGZn9x+QlKLPGINcarfb3FOrrwGAdYOnFrii1axTcFaOQAGHIyHafwzjK49vd7Z1b20ZWMTg2dHTFjLePQ9bUWTFO7JDBgmIX51yBVinU+jMdQi/LdHSTmcqbkJyO/DV+hcLm5rTLubwKFFgMsz7bxRGRtXGA8yqlG3G8f2q5hhjwYXsFKh6AzEzA1DGypE0AohBUwkKHdAGZA005RnKPw3H0DO4bX+F5fuMLxiLfhvjG+aoqVp2ncDeDz6mVKrLiJqSUuTAwKqREuCMvnXM7hRfjny5bdRd4VR1u7m6Y1UtGf+a9+MgrxzBgswul9SOXqifO59JwHCtkodHTNGpDCBnLxrTD7PlsTWof1tIdhXbT+du9QHcxFUJ/hO2+HA8FE56jvsG8zR1emPJjE+p0irqg8ebmblfszqdq21orqqQ277769w3BmtVxELh3wBbA8Gmcom+Zsphnl9M31/nNky3kZZJwd/S5dV1uHOK3TT1b4dP1xPEQEMZqxGCsdSg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(18002099003)(10067099003)(22082099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qXlqqAArS39g+H+KHNSEvyXJQV1hPLwGHElecJYOqZYjUNkMDlUSd2/73b8CchHpIF/io5rrWupQtRQFm+3plE/QsMHY0ia3oUpOJzHHfS9C7bTmctDlEWEfM/73S2Y6tZxJCgsWeqroAxX4iEZyURFUyv4OdIEXSCyG4tMNTJ6JoDGqhVcfpoUvVm2yOims57TOszvNVb0vRBpw19UAeug4P8H2LPDi1H5YfQEmSGIW7ASn9Uz9jF2kvslsngKNkbZshDRWheXI4hmfj4WlFTU0iUQy3oaKtnRPqtuJePjYYVBdnZsfhO1Ef2W+2adhqsN5B8lZrkX0vyopyrOhC1GCJF92SN5WwTGRp58FjngoPb2uCfoQpcDKeMsDW9/+Qbw5cMNsDXzHxCilYDnPpjvm3MBOqJ9njbzqwnZVWJFz3tEgKU2HkXO2BaUIlul2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 11:45:51.8089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd6fd68-19e2-4fab-ce27-08df29e8b2c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF00000067.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8500

Remove the spurious blank line at the end of acp_asp_mailbox.c.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/acp_asp_mailbox.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp_asp_mailbox.c b/sound/soc/sof/amd/acp_asp_mailbox.c
index a9c0edfe0c3f..bc183814b973 100644
--- a/sound/soc/sof/amd/acp_asp_mailbox.c
+++ b/sound/soc/sof/amd/acp_asp_mailbox.c
@@ -556,4 +556,3 @@ int acp7x_load_firmware_carveout(struct snd_sof_dev *sdev)
 	return ret;
 }
 EXPORT_SYMBOL_NS(acp7x_load_firmware_carveout, "SND_SOC_SOF_AMD_COMMON");
-
-- 
2.48.1

