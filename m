Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793868898;
	b=AKIPg0OdtuTsGaMOxjBrUisYVaUNNP5n5OE2tMkLZCExLZFhnk1UgZFRfKz0ugFecDP3
	 ETNLeniKI1U+c0gpJLVOxFlq90zcxEQhr3+Q3DQPMIeOPZky8HERayxLYi5gif4pecrrq
	 6OQ+4vJ6bhk6suW4mZyJtmsP+GGXszSM1BYwiLmQt4+vvi+d3FTiicV0iP+NaFcfSH4Ab
	 eP11Q0vvdXKtAFurm0gpjfx7G0gM0IzimroshBMN15KeQXBOcJGPa3Evil9g9LGkF8Hnu
	 7SjYuKOc/tNsvFKw2Adkow1AnvpT57NHdr6UJZoD/ZNlp3AZkOfV1bj9kaj1U8v4Pkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868898;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=asJewU2/b3egR9ubZFd7BqtOwqChh+1O3HRjSFkYFYE=;
	b=tlGv7KvcQzIKO3q5+Lh9SkYxWglqs0x+Uu0hBE7EeJKQQx9LXU3mUsNrMqF0BlBtsIWU
	 wLjGWm/K76cYHmk4BxTteYc2kKA8sCcFt70mVaIhmzQ9b84IBikzzm5NanuehluwVPv7U
	 gtS6l6rLnjukyBFDnUCmSedFSaef4KJKQrV/Vzfw3SNWh6ggRXGPXEL/kc9u0axuWlbZE
	 Z8uhAZGmidOYVAQPLWzhaV00QjkTNR4KGrOsYhSfa8DeHRBlg8OdeiBR5wAWE4EiPdpzY
	 FOnpVvclF+x7RRBQzJEYWsQ8cgp+eaxuUx4i9NjXXuHEeBnwYa5u4qwfteTIotLUmGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TPoItz7u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.23
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012023.outbound.protection.outlook.com [40.107.209.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52018606D839;
	Thu,  5 Nov 2026 08:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52018606D839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TPoItz7u
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrO6Bqv80VtX3pSCb5UluRey7oOBmQP2VHOio1F9UgI8EAEPGxd8Rdu9DqdH/yl+2NZ8cO7RTrtt/KolB81JJsCwcgyQ9EAEYzvgFqYYlP/1yFv75n05fjkamchc2zyASg+Q1ze1fqlT/hdhf+RVnegbWXo/QJ5gD5iavHbF5f8omnJyUWnx3DCkCD6GOixiMFs1Z+EIh4+p2QRcnsSBUNzZSndURb7ymAU0vnCj3wV3j/fkG9537z6MAJYE6guHqtIDSU1jf+/N6JOmyJV+EFOFlrQmEYIueA0MseRoi6n+KqgC3FOfk/OYBBJO9w1o0TNWPNMR766FYTRA6r4tZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asJewU2/b3egR9ubZFd7BqtOwqChh+1O3HRjSFkYFYE=;
 b=IyorEacC9W3GP2x6KXnKZA+BX83imaBWQjS/rNBBba0FU2CpJBfJqKvzbPzOCQBmf8kuVHVfNvDJT0YfYuvCtjVqi57cvvLOVmIXr55K9pCxYRiVVviasCF5UQXo6kc7e1fT5IsndRAAPnEloGIDo6uIWwhSKtFNnSl6qpBQ43oMW8TXsiQ3Q7oTnGfFd1y1NW/ZYq1inpW2eUcXc/kzlkg3dl3JSTBaeyKyu+nY8qB046YEx5CFsncmTUkoPp+BzJYPRLwnyycZKFkOGVZ/UWmNreKVWb/DWd+cM+RDqbcKMWXzUjqt+eDuHFn18q3s/FvuIc5B76t6cd/BaPAMlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asJewU2/b3egR9ubZFd7BqtOwqChh+1O3HRjSFkYFYE=;
 b=TPoItz7uhs0cVRuzQodgNDr5tmWLDZzSUOZcLZIRlXS2U/MPr8B4w5MBqNiSljPwgYuMWR7UX6kRAdhOc9/sYQO9siQBTiKhTRN4z8gYW+HWBkNM1imlqqoZx0fqVIwYLuYfW4nRO5ipgJ1rM1kpNLTkO37eBLHz/gVzfKAT5sc=
Received: from MW4PR04CA0371.namprd04.prod.outlook.com (2603:10b6:303:81::16)
 by SJ0PR12MB7066.namprd12.prod.outlook.com (2603:10b6:a03:4ae::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 08:54:55 +0000
Received: from BY1PEPF000264B2.namprd02.prod.outlook.com
 (2603:10b6:303:81:cafe::2a) by MW4PR04CA0371.outlook.office365.com
 (2603:10b6:303:81::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 08:54:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B2.mail.protection.outlook.com (10.167.242.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 08:54:53 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 02:54:52 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 5 Nov 2026 02:54:50 -0600
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <meaganlloyd@linux.microsoft.com>,
	<git@amd.com>, Shubham Patil <shubhamsanjay.patil@amd.com>
Subject: [PATCH v2 3/3] mctp i3c: Clamp transfer lengths to the controller limits
Date: Thu, 5 Nov 2026 14:24:25 +0530
Message-ID: <20261105085425.3418230-4-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105085425.3418230-1-shubhamsanjay.patil@amd.com>
References: <20261105085425.3418230-1-shubhamsanjay.patil@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B2:EE_|SJ0PR12MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b1fcd0d-f770-4511-e7bf-08df3b1a75a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|11063799006|5023799004|56012099006|261022105027099003|261021121427099003|261022113327099003|261022075727099003|261021123027099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|261028144727099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	VwDaPVvr+dAAR/1p3LgwrEBVhSMuGMb5nL0Qvklpb3E85eQPlCb5NQKMKdWnsZ+mhODWbt493/sxe+eZoWq9PLJM/QOZ2muh39CNHqeZUaiioRFnhBadwmSj+dK7Qib6meWFO8kNvkaRysiLZ1xaGwuqvMgyEQrIuiGKREfUphMBtXJGxpe4O2OlIp4zO1XafUBfoK9pchg6fQarsQi3MHshuWEjvREt/cIwfc605eadDUoW/CDxJqvl6jmBUqFe6XlrBG4+JI6G9tjQRa+kcQDPW7Rma9vBsZqOYj7653dc8xUa/1adnp4nbpwNb83xcBBi234HVY+pm30hs2iY2PHhuKmEk+KQ/oUSRIZzjyFqzyP+kal5qHi9aa2VqWEFa1fFZYSICnxAK722Xj+RMFwXIwOL071sS6B+RujVv4n247W4qbKtFNhIqjOXYTJN5b1vFr9o/f8iMCkIhH3Z8PpP7jsF/qW8D2Qevs0Amls22AwoLiET/JwpOsSeyp7ET019ZjKQXtFRXIIUcNWmfq19lj2z1+B7DdJXUB1NwZ654yKKa4Vg0/LK2UiSLpTm2dUjW2Z1NB5iY2Jvwk4GE9hwcES9oWMrtMPTIAgxmtFKBLWpJlsHVbJI5rxgfKnT/vW4JbZ45/MMGYa2CnUEVB4JVH5cLERAu6sSXTbIykBp3qbNHED0rbGl+k/YdrckTjzY/gYVz3kDh0k3RzPEKw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(5023799004)(56012099006)(261022105027099003)(261021121427099003)(261022113327099003)(261022075727099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8c1zGagK3BvsNt4jwZBG4/axuKc64DVkYLgJ9d5lKFglpT1LeA+GagEMsAPymA7FBBMPqVUcEfZoreSqp5UkkV60IcqGp2hhZyKH/8EZsc9yMxZH7RDWmGQ0Z9ENBCFqUiaS4k4f195aOM/xpWfS9sbgE8kOkkZSQSOeB2PVQtn/aywIsOAJVRw24cUZ2cgspqNUKAuJX/TefMyF1rGRibJjMQl3eJ1zaz26EPtlIDuS1VQ5brsoLjWkbhs9B+gg1nHuyjXsS0Zsn5gDYZXCkaOX+VcMLTUL88qxA0n0DMbpNaC2WyS52Cgc2CDRcbHDjFEdxilrWsJNxa5xb/R70dVX/qxszf/Pv9SoNmP5O6Gf5Q59Vklju/3lTpgE+2+3VrQqDtDFUUQKEsBOj541ImuAI18xtN7NMcOWs7d9ZUeYiGSphEy/2NLWXfPksDia
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 08:54:53.7282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b1fcd0d-f770-4511-e7bf-08df3b1a75a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7066

mctp_i3c_setup() takes the maximum read and write lengths straight from
GETMRL and GETMWL. Those describe the endpoint alone, so on a controller
with a smaller limit every read can be built too large and rejected.
Transmit packets can similarly reach the controller even when they are
larger than its transmit buffer. The receive path also allocates an skb
for data the hardware can never deliver.

Use i3c_device_get_max_read_xfer_bytes() and
i3c_device_get_max_write_xfer_bytes() instead, which return the smaller
of the endpoint and controller limits.

Behaviour is unchanged when neither reports a limit, as the helpers
return 0 exactly as the GETMRL and GETMWL fields do today.

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
 drivers/net/mctp/mctp-i3c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/mctp/mctp-i3c.c b/drivers/net/mctp/mctp-i3c.c
index 88d9e36cd4a2..6d08898e1d21 100644
--- a/drivers/net/mctp/mctp-i3c.c
+++ b/drivers/net/mctp/mctp-i3c.c
@@ -81,9 +81,9 @@ struct mctp_i3c_device {
 	bool have_mdb;
 	/* I3C dynamic address */
 	u8 addr;
-	/* Maximum read length */
+	/* Maximum read length, limited by the device MRL and the controller */
 	u16 mrl;
-	/* Maximum write length */
+	/* Maximum write length, limited by the device MWL and the controller */
 	u16 mwl;
 	/* Provisioned ID */
 	u64 pid;
@@ -214,8 +214,8 @@ static int mctp_i3c_setup(struct mctp_i3c_device *mi)
 	i3c_device_get_info(mi->i3c, &info);
 	mi->have_mdb = info.bcr & BIT(2);
 	mi->addr = info.dyn_addr;
-	mi->mwl = info.max_write_len;
-	mi->mrl = info.max_read_len;
+	mi->mwl = i3c_device_get_max_write_xfer_bytes(mi->i3c);
+	mi->mrl = i3c_device_get_max_read_xfer_bytes(mi->i3c);
 	mi->pid = info.pid;
 
 	rc = i3c_device_request_ibi(mi->i3c, &ibi);
-- 
2.34.1

