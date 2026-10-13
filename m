Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012056.outbound.protection.outlook.com [52.101.43.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694F33F4DDD;
	Tue, 13 Oct 2026 10:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885871; cv=fail; b=tiLh9LK4O2znMwszXQVttusZidV6tYP269avuWOY27wK4FejIJWULuRghT4y2gETVLcJK/hEMUCbQIzVUrssI8OICG35esCicMlIIBmgpMBM0hwwOoPciCQyMRNFilfoPe6kgMhglmsXJo38o29C1ptZ4ip631GOZvcbffRqqeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885871; c=relaxed/simple;
	bh=UrJLV5j22ucMTTkqxzRN3/ifOVkUnncYOyVaEaXU5Oo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fktNMu/ddgDnBzUJGqF5X+SkFceQlE5tbhjI8EgGosHvzBkqWdVPF1VgMyEXIg3NCjhIWpqUBRPEe2EPvAq7T9RjQbWukJLDQ9jHOpj+llQLBZrEznbT7sTe0qPMxnGe8qq6Wh36kpurnAUOcQqIiNb7bXJ2YNqPhcugeXMiz6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qqqr9PMY; arc=fail smtp.client-ip=52.101.43.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qqqr9PMY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AoyOgyE0QRHo+Y+/DLTfVIaFqT7ZrnjVEuaLtLcFWs170cvFH52vNppEX0wl58Xv33+NI4wqnFlwAtwOcaYgt7wBaKoyanJ6t2Q5BIDVIUJl2Wk7RZsJv0DjdiKOJHVo5V58lpGEvBrpfGsBuNffMYTFdNikZ2LtyMwh6Kcp9HF8GacC265ra7/aVk1t4613feK+oHuDKGzPLTl0guUmUdkNr7X/daeHaQYdrCUQcapnixgcaCIVeBeOrlzqfa8+fczRLUDnUlzg9sWn+23TrUKkS6t80voBu4qpLi6pmqGF+GoY1EPBa+DrA4Ff6na208Bzv2uRT5576yT54+ox5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aa1yFdGIVC5IukFuOHlA2VCb3GjKpZFAkPuHbsg5pko=;
 b=kXvW6khtlmuHyyq89CpDIp90RI4QVuunMYJMcaFoWPt/ESXxE0x+bG/Yn+xAmWNKr9pvCvfJ8whlc4PPAvM1VkDT0XoNrPylctIz23IOrgbiFmbtKF3TIfdbh8xb10oM+VIX7U90KfPfOBbP5kGwdgsfJxQXgb54AG6U18cKPK1WzW9FxjcCHl2NtO7eXagsg1zKQrgr7faRGhrKHSu6Fnrblh/WP0mM45MvzmSTSKee2s5q262+VCG7uohQ8fRbkfqGE8GurGWGdF1dCB4nr5MTkssXZB2vPy7CaY7uVb76LbexrloAy9BklFIT2ZMHOem3c+Useb1VYB37fjuhvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aa1yFdGIVC5IukFuOHlA2VCb3GjKpZFAkPuHbsg5pko=;
 b=qqqr9PMYzxnuA+YqX3c2CYy+esu2GZzrWuHbfwhLmU8Y2xul0IdzCxiD4qt6NnYVrrZoqNDVgKNjQJyN9YqNJiDKq9uUafOA7aIR8+5rKxKAiATPt+RlWZFDz8vr6R19qtlC+sEICffX1s5W29AUJM4QOXk1phdXYg8t93xoqyM=
Received: from SN7PR04CA0192.namprd04.prod.outlook.com (2603:10b6:806:126::17)
 by SJ1PR12MB6027.namprd12.prod.outlook.com (2603:10b6:a03:48a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.19; Tue, 13 Oct
 2026 10:04:25 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:126:cafe::46) by SN7PR04CA0192.outlook.office365.com
 (2603:10b6:806:126::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 10:04:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 10:04:24 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 05:04:18 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 05:04:18 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Tue, 13 Oct 2026 05:04:14 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<Vijendar.Mukunda@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH V2 5/9] soundwire: amd: remove unused AMD_SDW_MAX_FREQ_NUM define
Date: Tue, 13 Oct 2026 15:28:51 +0530
Message-ID: <20261013100306.2921771-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261013100306.2921771-1-Vijendar.Mukunda@amd.com>
References: <20261013100306.2921771-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|SJ1PR12MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 576d5974-e45c-4d8e-a3bb-08df29115c3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|18002099003|22082099003|10067099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	bWud1jZ1wETS8B44PFNMarXd53i1ag8CE+ekltpFjscCjf+lsB11oz/yJD3CKDmO9462dZ9JCMqbxILYYNItXrheTLp7T5EHcgTp2Ryq75lUF/CcgMmVnvor7CufsNa8Z4jkjvPBG4hbTjSA5qnW8SAmjINw3OQTZv3CQgNL3XsHCk+EmdcQvo92nfOgkLdW8TeUy5Gdq376ismLtkkR2LsvwXYIzo7BkSHb/A98LRxXPWHTSvnJdi+SOW9ei644UtoNr6/o4ZWq3gBpvQXKpeAw8a5vKLw4csbEvSZ0lbaSy2cJocevsj4o2IPS7tvY1lB7GmH+eckhChnIFDR9ko6EcvabH11jsPJbSMPctjrOXVKW7hU20rlrr2p/KGzUKQ6VB1i7zhEbYtBFJNq0QIvjXpm1V40T9KCL+uaG8X9MpW64FWb6ma5oCtulyhkSMR0tgay51p86KhOruT8BrOYuKgAt7acC0kOkIBvZZ0Aev/JI/HJS7Au/kwUeV4xOrtkCm4VjArsMcBlYAyIZbZDKgmBVyGOpcYBspet4OnWVI46t2hDl1lymBN2avkvfDMBmXXivi7RfJUpCW6lC+iAzJq7gMvXW7rqQiliwZ5M8kb9FNpRQN8+OYBUG2fzNRYgjyCQPikrGUr6cBNEN1Hw2TZpWaeVb8lP13QyFRCf9Ak4D3NhjzIS2KDT9REwdhLX41rVnSh/s5qXHYy4yFA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(18002099003)(22082099003)(10067099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rp0u4HVvRr1gf/a7USgFPBfIZdNa+PDlddNNF+Mn9l6iokZgBqhWr7f+iPT2ktDGtMSMKYDLgZDhBVr3lZqskR+4HuqbuFBtFtSjsZwjaZwW4fWWrSKtL9twnraBIxvZFlLxxAdV/wXzS+45wa/7P4tWMtDriYkJDSoLpqlIHIrNabYkdYYVESPG6j+elDZMovIPcuKyJZJzBpHfWfe5EWjLbx243NLcpWhw0u1qBVACpk7P7NiINTrnojCTLZ8iM9JdRkr5IKkNIaOPgGh8yUXkwmv3VbWPnDYjzk9uacDCEDF/aWLBZXdSgZYLy6bf1rmPdELtgcyoqBXoYulvbEYKWIVLEj2BF++GLVO6sKuUCX81fFvxDnPpHPl6YkU5JkZxU3uqYgEEkkQMJZpX4RaIxO35M26PkmiJSSaZhDF2ZYs7fFxGLj397awjSFSf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 10:04:24.7888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 576d5974-e45c-4d8e-a3bb-08df29115c3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6027

The AMD_SDW_MAX_FREQ_NUM macro has no users anywhere in the driver.
Remove it as a straightforward cleanup with no functional change.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index adde192f61fe..63fecff62079 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -159,7 +159,6 @@
 #define AMD_SDW_IRQ_MASK_0TO7		0x77777777
 #define AMD_SDW_IRQ_MASK_8TO11		0x000c7777
 #define AMD_SDW_IRQ_ERROR_MASK		0xff
-#define AMD_SDW_MAX_FREQ_NUM		1
 #define AMD_ACP63_SDW0_MAX_TX_PORTS		3
 #define AMD_ACP63_SDW0_MAX_RX_PORTS		3
 #define AMD_ACP63_SDW1_MAX_TX_PORTS		1
-- 
2.48.1

