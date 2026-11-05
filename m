Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793868885;
	b=BRI4WYQwRTKYAWLZBPtrBw2VzfISlv8buwiJazfZxagWXYHggOXrGvusKURdCVCjymmJ
	 Jg2B4Q4l18pjeur+EzT+Z/dYRNLXhh3tlJBj4qI6zF0+QGecBTTnFjGPVlz7Fjgol2a7U
	 R5cqREOEA4iXDOQ+7wyCqdBQyUmSz0T3qtH+rtS5AIM//frNiglvxFfmz5dpB701AMrQ2
	 IHVPpUhA5PZA4RokSp+bqzCV++14Y/qjeR4yTmVGKkuuFK2Xst72yZEcAsRQdCbkpIuqk
	 WukFQKoZjA96i9OTQ3fVr2h9cHGuzbNYiJSDeMqw+IGfvwMs0nEUuzfRiynaoEJbZVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868885;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=d0ZiYk7OpAH5gGsJwV3f1hEgWR+crJAlPrmcNxDorTI=;
	b=SqbiH/YTShfBDuh3WfRCZGpBLaFZVG8cgruMqv3zBi7W89KdhjKjChs2V9LUfzrO7MFl
	 b9KrP+sdH+ncljlE4HvdTPCq4ikdALAFGfaMkOHCn7tmoTLRZYSVZFbCyEuYbIusycTa+
	 LcQSZKPdGNJAc57bjESlvoprlv47KXmIBdAw5iBJoNwfQ97X2FVD0bH4FZHAVegJVROWR
	 vqIWDADGEIevBknTvlbwDl/JtaGglc8QRKyzQuLeHrDhxjtqU7SxH4kePtwXoC++bJZph
	 ct94UfaSC7S4LJNMAmVvqForMh+20laj1FDMzap+HVmVFaRzT7Gd9R6Nmf/gMPGwJPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FZjSvDxo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.69
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011069.outbound.protection.outlook.com [40.107.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B438D606A326;
	Thu,  5 Nov 2026 08:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B438D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FZjSvDxo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5wLJBBNFpmE6q50Y9+maicjuXgmbfW/lMBmSSM0s+DBZ1WDK6/fWHlj3pNbnadjXDbAvDoIAfdt1pIXi2wtZpv3zLxEaoWG6CH42B+lV9fzTovEWbWg6Ueo4FgEG7pbvBn/SouUnwe1626i40GuGiTW9wvv2FmTqf4ABdECOYIOumhzZKZ6jqCLigipYAk9htT3yPel38B+yHktBbsXXbtnw/uzSPS/t4kfr+2CFHw4oFdUj7Hb8vE94SqAzSrNEdayVmCecxHIprrsNg7Mb6mix9i19IfT3TzYR6dQwGeP7Av0B/RrbalSaSTvBnABrmynVWAc9iqkSqHGaLCCvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0ZiYk7OpAH5gGsJwV3f1hEgWR+crJAlPrmcNxDorTI=;
 b=k/oAU3qEtB+f5OqEk73Y6+uCLZZ2Q82b+l/EYTlJDw1w5CMqaEudk4lYsyvmL24MFIiy1y9aWgKC25nCshtSrDvhAuNiUA94mG+LCxSFM2wjzopPAsltpX1ekLARzQ6RY4jJDRVexlAYmYehejyspIsBZ9aC3XNbiIH8z5lxJJcJ8/zD0e21ZQ9x0Wwddy5OKo8g1yFU/HIAz+rcYZN8xdArkU20wX95raLYlvb1WaEUcr1tYdXw89/IcADtH8Xvz2DJrheMhYb34l4UAgls7LSph5VRFaepsSIe6zjipik2jDaHmr0nWRLjGuzwcTnKetITKwTxIVsQnL9yy24L6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0ZiYk7OpAH5gGsJwV3f1hEgWR+crJAlPrmcNxDorTI=;
 b=FZjSvDxo3gj1mz2RKLKAw7jITKzT4KoU/aM7tarbsPISAawFBLkniH3R72e9ZKPc70wGOhJZM3/Ulz5lUHc80rT6jN5PqCO+VevnMJuPZAwHDNKMzRrVGN70Lc3XiCjP6UADHErjZqGLpmESCfOykym81mX5xgyNlB5I/4bagsY=
Received: from PH7PR03CA0008.namprd03.prod.outlook.com (2603:10b6:510:339::34)
 by DM3PR12MB9326.namprd12.prod.outlook.com (2603:10b6:0:3d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 08:54:40 +0000
Received: from BY1PEPF000264AF.namprd02.prod.outlook.com
 (2603:10b6:510:339:cafe::7b) by PH7PR03CA0008.outlook.office365.com
 (2603:10b6:510:339::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 08:54:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264AF.mail.protection.outlook.com (10.167.242.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 08:54:38 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 02:54:35 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 5 Nov 2026 02:54:33 -0600
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <meaganlloyd@linux.microsoft.com>,
	<git@amd.com>, Shubham Patil <shubhamsanjay.patil@amd.com>
Subject: [PATCH v2 0/3] i3c: account for controller transfer limits
Date: Thu, 5 Nov 2026 14:24:22 +0530
Message-ID: <20261105085425.3418230-1-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264AF:EE_|DM3PR12MB9326:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fcbebf5-0b12-4dbd-ea05-08df3b1a6c69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|6133799003|18002099003|13003099007|261022113327099003|10067099003|11063799006|261022115727099003|261022075727099003|261026121527099003|261028144727099003|261102123227099003|261021130227099003|261026140227099003|261026130827099003|261009223327099003|261021135927099003|261009221227099003|261021123027099003|261009223027099003|261009220027099003|261009221727099003|56012099006|261022105027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	YdOEAqWpoAUUYngQEGtN05ZMKkwU0LKlK1k1Ao+6pC3msQuRtvufY67uVl4GLsoCrHODv8ValHu3/G6yaECfSildO9F3lQVEG4LRKuQ2Ro6pfZdDSxKZaXkTrfSAE9STHxr6I7dym8sOyHpbmRR5JxNAHZ5enUgf/aBjiqCrsucirMG6TQVwpDnFcjnWBQGAB82MAoz7ySPbnvNOrt2jaj+PIBzfOeetn5uW5sy8D5nJGH9SAJlu2jS9/N5+/Clyq4sUdZlUt3Sga3lo9+MRf3kLxxmQ9G1tIeUekgOGaXvrlzBcqnTMUsc76Sx4ZWXnj0LrzHacRIKDFquW9U2X6SamaR6tkBcgh02gih2oeMeL6jn/u9+nSySpFCks8HHN0TDNl5EhSKpewEjQtbCvRyTCXXiI5s0OidC/wq/onGjZIU1LgOzZSGDVWnRn91w6JRByO7VTFHYU5W0yKAWCf/3l1/B9XIxox4dGOhEIhXUmINvdqHPAATdCPTApQfVgU5UEJD8/++5RcrrxtQgCbwmeX++1+TdRbu7gE7o6+3kDIzHt9BdJEC3EXtD9wFQ/DECqQrP+9riy5uTgHUOfn3TWpuM3UNKjToeX3aVWgGEz5+ikjoTerCKmv2khu05yQzoW9HrAiLSLMcClMHDG9Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(6133799003)(18002099003)(13003099007)(261022113327099003)(10067099003)(11063799006)(261022115727099003)(261022075727099003)(261026121527099003)(261028144727099003)(261102123227099003)(261021130227099003)(261026140227099003)(261026130827099003)(261009223327099003)(261021135927099003)(261009221227099003)(261021123027099003)(261009223027099003)(261009220027099003)(261009221727099003)(56012099006)(261022105027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jJIfClddhZq+6ohGOfWTicy/2IQTGMAJKaMo2yMPMS+g31HNWBouv3n3lCI641a4MRs+RFKbPubVk+shKntR2APGEUDRE86YZtMRGzlVJOrHerQuWbXqiYRtnrEhwjSDHqfZEHH5yhPDqqjpk6xL+TJCUGpfgO5XqyzpYqRCzWw3R9Xyyj0L6wMGXeYZMULJB7ZdLGBxReCAkjGGf8JoumDPUohiW3YVk5WPN3fTK1Ul5j6vcfVWy/V15opK78g3LAtKv++FczfvMSmQ+pyDOyLfiphjvAvUMR9RINrpXjw0WBr9ZS3jMTLyVC9nh9PEAeXIh0NLLJUxoN1bZtYkhMmIO+HyDKMsWZUSd9ozsvZ7pBiP8sBJ8+DbLaugjofUMAovIBTsAqs9yIeEM6JaBxwalzuGzJk5uT09Qrp450pOErDxX7KYv1I2K/xmF0vU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 08:54:38.2694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fcbebf5-0b12-4dbd-ea05-08df3b1a6c69
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264AF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9326

Targets advertise MRL and MWL, but these values do not account for
smaller controller transmit and receive buffers. This can cause client
drivers such as mctp-i3c to request transfers that the controller must
reject.

Add controller transfer limits to the I3C core, publish the independent
DesignWare transmit and receive buffer depths, and make mctp-i3c use the
effective target/controller limits.

Changes in v2:
- Rework the solution to preserve the target-reported MRL and MWL instead
  of sending SETMRL/SETMWL and rewriting the GETMRL/GETMWL responses.
- Add I3C core fields and helper APIs that combine target and controller
  transfer limits.
- Track the DesignWare transmit and receive buffer depths separately.
- Add an mctp-i3c patch that uses the effective transfer limits.
- Drop the unrelated IBI payload-length clamping from this series.
- Split the original DesignWare-only patch into three patches.

Link to v1:
https://lore.kernel.org/all/20260908102724.3232660-1-shubhamsanjay.patil@amd.com/

Shubham Patil (3):
  i3c: Add helpers to get the maximum transfer size for a device
  i3c: dw: Track the transmit and receive buffer depths separately
  mctp i3c: Clamp transfer lengths to the controller limits

 drivers/i3c/device.c               | 49 ++++++++++++++++++++++++++++++
 drivers/i3c/master/dw-i3c-master.c | 22 ++++++++++----
 drivers/i3c/master/dw-i3c-master.h |  3 +-
 drivers/net/mctp/mctp-i3c.c        |  8 ++---
 include/linux/i3c/device.h         |  3 ++
 include/linux/i3c/master.h         | 13 ++++++--
 6 files changed, 84 insertions(+), 14 deletions(-)

-- 
2.34.1

