Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010066.outbound.protection.outlook.com [52.101.229.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9E43EC2E3
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791135700; cv=fail; b=emnAnUBHJdAOet4Ysp/qOTtXLBg2v+4JGxsslcD9m1hPuU7tBXaq294vMqPyYM0KEqmraxmeXaujHS3X6SCfxVqdhbmkmOzi5U8V1QrL6tMSMt46x/iuwl4LLv9m6/nAz9dPDaiTvrTVZRRqjOR6SOR0P8vT8UEdXfw7pe14Kco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791135700; c=relaxed/simple;
	bh=zFRQyGsFbgR5LANnjLF7+G/xFckaqP/iz0uvnfEItuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NVkdw5sBlnROMLK2DBX0m8H39C57O/dnw21ir/KUN7Xco9o9g6+YLx3i0S8XepeqoB1va5Wv3sXB1guewxeJSm1zU06+PqBM9G8Z2suljIyOouknTd9maLHZLgcH8xgj/BTbp/vs1pwT79j49oNvkIiHB91YEwbpkrfAIkg0z68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=V7xUUCL8; arc=fail smtp.client-ip=52.101.229.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="V7xUUCL8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UtVm/uC+Vu0XyEwGWMy3rxp8tl/N6eTYJFJh5iKmcaw9mQHvLuwiUbbAvt5XiwznOP5VV1VWJugbgny541kXBHv8RLx4s4te7dSLP06faWFaGh9hVPvrzqlPneguzD37aRCViyP339D/WkOJqtgMAo3kn2WZqb3CImp2Y5xKvxg5MdQouCD/yIBz2tLHhtUaXodwSgBkndnKK0CY/IuIxDsyUakZGh0gCrGcc5N2zq9CjQPVIVIg1vMs4qvvsOuoS8ojxabByyaNtOQgp3yOkSKjqe8RLrCbgc2NJCj51UFZzFJkrE0XVzpkOFSeUTtiuzmRVMjQmGi9x3AFJOaAUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xj0Lec4+TyrBoEmKl6lokXca6TJFECTOfTDc0HhPAIA=;
 b=dpEkFLRKTh4q/XWj6iSYS2hkf7B406JtW+mhkEccLlpTPEuUlvDqPVRpqNkAuo6zygH+qc0D4DvTjevh+YlFCx3yCc2D8T9dPfxC2QY8Gu2LHXHybwSx0I9Za8rvnducamjyMPTqtycE21l7mT2dbNbLvQp+XKFXCCKyfQl1WbW0gLDYziEKxR/htc/3plnbSV2HgvRCAAkNjqSAac8k4Yda4jwB19tNwP9oIv8Fy9MVS83Zu1X3Fbx0jRoMFpjbXply+dWINMKL7lJlOQzH0a5UUBwVVRhcp7tJkw0jsxTrtepQuYUt2dojgU7knfFt2SzFrjch8SACNYShfQVYWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xj0Lec4+TyrBoEmKl6lokXca6TJFECTOfTDc0HhPAIA=;
 b=V7xUUCL8lOzAXq4X6GPtOYas7u0FxoAeUvNDHJ6TjMuaCOh8euVLix+YnMeAEp1PgwCEhkubxl0rqdlgpl7PddhGHGme70b6fP6auJtZR/B7hr286poh1UbVZBsKMBpn9CkdUokanECDZUMyhRhMNlKIRysWQrEz04YL2Si6y/c=
Received: from TY4P301CA0095.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:37a::17)
 by TYCPR01MB8343.jpnprd01.prod.outlook.com (2603:1096:400:152::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 17:41:34 +0000
Received: from TY2PEPF00005622.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37a:cafe::20) by TY4P301CA0095.outlook.office365.com
 (2603:1096:405:37a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun, 4
 Oct 2026 17:41:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005622.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Sun, 4 Oct 2026 17:41:34 +0000
Received: from demon-pc (unknown [10.226.92.36])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 96748300024E;
	Mon,  5 Oct 2026 02:41:32 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH v2 0/3] MTU3 MFD improvements
Date: Sun,  4 Oct 2026 20:40:21 +0300
Message-ID: <20261004174024.502949-1-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005622:EE_|TYCPR01MB8343:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 837658bb-44e2-4e7a-49a3-08df223ebbaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	SGpiiASgRg1367u6EY4gx+xmxO1ZNVZFG6gt5n3KgobrX+f4CzbZj7zDBMO81rHSxkcTNtarwPUuX0101RcAByo6v5O9AVTIuVl3IiEwvdd10X0Po7euiUFCfNqi/Ei4zn0VaGfRbg9f5SUcin7xDD5SIFG5/6PFN9zVhtW1Mv9paFVHi/pA88EV2V2K5qDrfJMDPrHeGK95vwRggMintGblyjKaR0mfvEs47eKwZTi6Rit7X8QjnwL9WoX+dyJvee+qVginWvCVe7hwy9mDClQ+C0bpuL6Wy1qkExj4pS0A0F4TXBNgi77fOeAmUhGJXFlmjCUaAD4gnGuRdS4QF6bFnEHHeaxdpvRC8JWFbnxniopihVnF3KuL5vpLqWRUMmHltdYe2cXtUEguWjxU5GYY7Rk4H6N97CI+EeVnrEoGSbSp7gFiAEtYkyqKta46iXAIf9XME2O+7y5XN/WjRC+blGSVzLt08npecrMcskeXQASazDsNhqA9LaPNrMyjwky4VzjRXxtwcTzXbqDeSYRADi/hr37WiYKnwGW3eUHEMpRpXx26dN/wO5VNZCuEt8yT8aOpZLv4cFgef3SR+2KivZHs7ROYO75kH1dIUZy5WrRUp7W+mXJecAAdb7K48iRGNQO8y3KsOcU0OM8yE3YzCpS7ws9CfdWHgNZ+Gjt0bVi72rQLiU9nZnDJpciohdr1Lq6BfECxBlAshV84Hg==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zXgF5fvP67OnnqWfg++HlnnSLLb/Jyu49kG5Ia5l7WI1sJIcHGN6GGTW/uHOkUlAZJdZbzLQZdatHFd6dk6cMVTyttc1X4/Op3qB3C1RQoPa0iXl3PTv8O/OSAwPTfZ3B3LzhyYI2+ldivK0yiJISBcB9nj3aT6mw2LGigQP/9dXJ2oDQzxMA9UkzEILBofxpsJgCixcWC8j7SIPTqPaA+Va4pDQ40ws0PKL0vOkHAOhobxwPVZXQfS75ujNRbOoLXpVe0i0kicirbNbK4hJBnoBVTzNzzFrZKb19ySjjwWxAfrmBA0GxyvBAKi+zYReMfFAFlrJEOHr8igZQuJ4aPLG3jnsQ85uKvRYZWOj5cceW0RZnS7UODECmVfjRKvgotwll0C7UBkjHNOONWYpE1liWk496JFnlhp8Pa72AIkYRUneDsR3mN7HePx3EHC3
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 17:41:34.1209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 837658bb-44e2-4e7a-49a3-08df223ebbaa
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005622.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8343

This series does some code quality improvements to the MTU3 MFD driver,
and enables runtime PM to allow simplifications in the sub-drivers by
relying on PM domains rather than open-coding clock handling.

V2:
 * capitalize subject after prefix
 * switch struct rz_mtu3_priv retrieval to a back-pointer stored in
   struct rz_mtu3_channel::priv
 * remove struct rz_mtu3::priv_data as it is unused now

Cosmin Tanislav (3):
  mfd: rz-mtu3: Do not use struct rz_mtu3_channel::dev
  mfd: rz-mtu3: Reuse shared_reg_update_bit() in start_stop_ch()
  mfd: rz-mtu3: Enable runtime PM

 drivers/mfd/rz-mtu3.c       | 70 +++++++++++++------------------------
 include/linux/mfd/rz-mtu3.h |  7 ++--
 2 files changed, 29 insertions(+), 48 deletions(-)

-- 
2.55.0

