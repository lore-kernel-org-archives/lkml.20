Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45BC368D5E;
	Fri, 28 Aug 2026 15:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932060; cv=fail; b=XMa2nVP2e4GCg8j3DihHogPu6oJJyrYrHV2ijj8h2xEGk6UDeXB+7eET+07f92zJU8uH24J4cCzgr2CQEVpruOhFO4nBCZ8Gdl0XKWJdIsurQMt1lZIl0G3QoBFGVhHynsTbCl97yb4ZUlp/0BuyE73hSO0OrvwYjB56G0fzdcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932060; c=relaxed/simple;
	bh=PDGR5rRULRXxNlVVoSpGRe/CZhzhG2yn7P2XVYJvbhs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LEgvlpL6mFy7n3t83E4og+b7XAckLnnDtrFLxipvhdtwryfZwJIWCc4zuJ0GS7gtAWyv/TqLirKaP3CSVMqtUXJIoLpiC6uqqnbJ9q4ZXsP3A9OK4QcKHIQkhidDEQHdvgOkRTcAqQphpx6ls+KHHoJLc+N5aeDzltHiZjpxFEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=i6U3ZG4m; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=umnkvMNu; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="i6U3ZG4m";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="umnkvMNu"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDqCtj1781129;
	Fri, 28 Aug 2026 10:47:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=TaRhs/p2seXv80kM
	wMEcWXU4y7X1F72QxLPd/Gexyag=; b=i6U3ZG4m7sD9BUB7Nwglfm7UnHDz6Jad
	5m2w7hC/36CRUU4HivFFSwaTNDTempSyLfE308q1VXFyFJz5Uv+gRaxAk2E3cf8Y
	zTqz3Icc4jXQar0Wawqx7Yz1p5ioTd45preIs1nyNMPLmZMuX1Ymd4TzigRejyO/
	bTgEtEtbhKJ+acBelljkL3oVKyAOimNzvD5t//J2hgjt9G7lEm2c/fS7BINwDaB1
	Mv3StOZ2m+U+QVue7jzxdjmwFeatMhOKY5VaLwbBdhGU0aoLq117+CKJKXD9hHwL
	ReZqNE2zQDl2XmqbDV5vBJG+hV5jaBk/fj3TmV9xIANGsGGOxcKBTg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020126.outbound.protection.outlook.com [52.101.61.126])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gb53t0hqg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 10:47:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAcRG3wH/PiJaOg50kPMC1ofyrZmtcPO7gG/7tvYRFpGIgAJWn+MdDcijzVALnOvsFnCA5kTjzcqMrCZcbQDe9Ueak7YzZdHRRR/BDW8J6PxfkLA5noOmXVzTZ85+vbMImA9+COGZoVANz0vggA8pBXzaGM/T/ixzl35K6RdFCabr7FrFi/axw9v74lwVNss8cHShr7ih36VbWlA0f5wgCBtkro7o21cyWKK6JEwvIAXw8Ehy9wilqh+HIC4pJwzUPXIQiILrQgWl+X5C8Mr3kas6kFYQxT8XKqERwCHTZKqPHi9Be/em6h0orzEVpP29iLF/N48ZMSwzb2ylzk0RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaRhs/p2seXv80kMwMEcWXU4y7X1F72QxLPd/Gexyag=;
 b=wmxwWVb0WvDsjwT1VHBT7ZJVD4WuGn0zPsKs5QL8bIKX7gz/5TlYk97NH5hLi3odW22iTGHqh/aRhyDIt05hPBa6sR3R3kkihc0DUm6wwRPeUy0frF99IeGhjO3tjKRYJ/mSVWpeqkN8hXn7eTnkXqXopx3g/NwKtIK9M1QjpxCg9TzqPWDeyXFPlaJDsFSEL3e7GVJtr+rGcotcDKRrF0IIFAx+nAvfTFt5UPuQHBXBHXWZu4jdKzfJsOHHJn9XMz7Xr0p4b/Rd7XhCLAulaqtkF+cjpEc8Vi1L+6V88OmWwgmVgV2oYj4ifoU5rBxM6nd3K1NRlanjlO4JtMBSuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaRhs/p2seXv80kMwMEcWXU4y7X1F72QxLPd/Gexyag=;
 b=umnkvMNuuj2T20GRKponp8LT9Unc/wLEGUtNFjEcVsZ44/0+5o01UvOgxSNNotD8gNYZ7Vb+9PjIABG2Bq0c+sZCG1f3Ax83ZsuvYgDT1xyIh1njcUw0N3ngMG7UIvEZoY2OPW+6rFK8tDRC99EolodV7LZcJx4gwNHxiRBr8rw=
Received: from PH7P220CA0044.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::22)
 by EAYPR19MB280971.namprd19.prod.outlook.com (2603:10b6:303:2e3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 15:47:21 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::6b) by PH7P220CA0044.outlook.office365.com
 (2603:10b6:510:32b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 15:47:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 28 Aug 2026 15:47:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 85F14406542;
	Fri, 28 Aug 2026 15:47:19 +0000 (UTC)
Received: from [172.17.0.2] (unknown [141.131.156.117])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7D5C282024B;
	Fri, 28 Aug 2026 15:47:17 +0000 (UTC)
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Subject: [PATCH v5 0/2] Introduces MDSYNC support for CS35L45
Date: Fri, 28 Aug 2026 10:46:25 -0500
Message-Id: <20260828-sound-for-next-cs35l45-sync-v4-v5-0-fe3feba709ff@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFGtkWoC/42OvQ6CMBRGX8V09pLSP9HJ9zAMtb1IE2nJLRCM4
 d2tbg4mJt9ylnO+J8tIATM77Z6McAk5pFhA73fM9TbeEIIvzAQXhjeihpzm6KFLBBHXCVyW+q4
 05Ed0sChwwhhlD1evpWFFMhJ2Yf0ELm3hjtIAU09ov7S14UdlqqMWuoEaiMKCZIdzGjGWIjmsX
 CCac+XS8Pb2IU+JHp/fi3rb/75YxkFwLy0/OHlt/I9Ku23bC7Bt1I4gAQAA
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787932037; l=2255;
 i=rriveram@opensource.cirrus.com; s=20260821; h=from:subject:message-id;
 bh=PDGR5rRULRXxNlVVoSpGRe/CZhzhG2yn7P2XVYJvbhs=;
 b=A058an3yPItKt987KemooewAvJ/2jBGsiXIcFHrV2MaozXuPjHG/Ff05fMWIXo1A7nvHmY0KE
 xbPeirc8YV4CwkHyPF0uxagWonpZxg6qUb01mYXGjGw5aWFJIcrDDD7
X-Developer-Key: i=rriveram@opensource.cirrus.com; a=ed25519;
 pk=PWYAqW73jQepp6ORjx3V81remQilskf6ccMx0Wc1wUA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|EAYPR19MB280971:EE_
X-MS-Office365-Filtering-Correlation-Id: a252230d-3166-4d40-1b87-08df051ba597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700016|23010399003|376014|7416014|16102099003|18002099003|56012099006|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Imba+cKQhuz6q2X1ZH8YqA0j4wqPp7zwstuRry75rx4YirDxpqRwPDxIGxbSXoPslKfQWUzZh53A7yXvg//YN5SaOXaPu3bPgY1Xxp83LppKm2DOA87rM+G1EXOB6PHRN8eqCMORYelGzKLhUdHAzqPTF2kIdZA3R5BzbwPJYmWH6bx32yxCgSamzJJeoLSBjplskBqvWWiC/XX0H2a9mcawrz+RNCjMSQIBqjwC7rZc3gcU+fG1U5gaLO5XRsz+WA4JKbW1IFVUgQPKABAw7n2ST1ivxhR1CNXOgH2wWO1pDUUCNPVZ2kBWsdQOOCOwanABD6EutiHDxkZyHLy3UmOwyRMGo6x7OcWwdFvLEUKg57uWVBmXRgsUs2GvwMe0S8nUkmnyvCWLmTqPtMlOyfMIjTDyVRB05dgnQr6lNrdEkaa508lP730wNyNlYhzdMGr9JWkxSOdI/KLYB1hGDUBDRvNCEacUqjsy9vPL6CurjGIW9mt9wNpsBIQD67NXB5cunt1cAiGWVvCq+HXQ0AFh1DCvxG6CcpvoimKjTJzLJV5QuoeskNPMdcYWoKO0bEFekMI6lOISj5B3mH3UNOimH7NfCMqWTyq786a2apRpzfdEyyUYXkD4i+eTddxMYAu002z/7gzdBCpeVzA8eY5NEcr820j+A27g6+d2eZf7gEFLjXTiVgsn6+Rt6yXvaZmVcPP+pSJ3ezGmNSxQ6A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700016)(23010399003)(376014)(7416014)(16102099003)(18002099003)(56012099006)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	axx7KQZAzj/4fNm6+hgBt6eQV51dM0wW04m6U4axjPu2paNvJ2DhinlktT7sz3EHLbNv1mFI4IZSdlcY301r9MYYmTMZQfFmbOnG8AueZsiqWDhIypj2ZTW0wmZ/KxgfspC7tSOdC8+dKk+51D2sel4AMVr/qZ+vSFsxp9S6m+UtEYOJj0gMA0FXwZ8e4H5L01P6alMY29tomNzlCwHKZDZQs1w7pVEoTOisnxAM8vYQzvDacBXatxJeRrzIykI5DK51UNIKPXsixAI1dg/WvLwsxUl2BbFogGHtaLToTbTD2taF81ddcxlWzB6PnVI6zJE8M3biBczNv9taKbCn8XXDI35TlLGzgzVTgL0ags4wR62ZSlJJgji/FlCJF5DQ5HNQTs7Cw3ok2Gm6Sk/eJNbaodeGMvp99P6/xk08wT6vdc4VpGOvRHSeYng6hlUD
X-Exchange-RoutingPolicyChecked:
	bVtOZnNgo3x0NFholes1DUs8pGHwaE1+qlAauOl5qwKbE5uwM1Bsu4mloa6qH55KPVykj22iyzQ5FhNnsCeal9/llGkY6ywxkzqAh+boAPAwhv/QEhfp/ed8bDgjGRZT1u0gnDqpq1u6BDquPiGPFBWVwwyoTFWHUUUI1HEehL/TnpzAMXqpKJnW9i6IZAsxSw1epDi0fQW8w3jceRZB9bN9CwcrOodZl3rOcxFJoZVC9xZJPZzVn6HJU4NR+RTWKOZzyT5hOn/g7PW7wtWM13NevogIRLRtceAcIve2bWlKB8VcxjolswqvCTMseIfg4A8pz/bgBtJqsqfXGneqPw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:47:20.7399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a252230d-3166-4d40-1b87-08df051ba597
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR19MB280971
X-Authority-Analysis: v=2.4 cv=La4MLDfi c=1 sm=1 tr=0 ts=6a91ad8d cx=c_pps
 a=+K7kHGa/lm5mlhWRmKhmBg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=sf_Viwz64WJH_MW0MpEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEzNyBTYWx0ZWRfX6Cy+lNuMkVev
 5jnhoMxkVHeaL/19WGIhnR8xvgDMndeoiKD4WSDjQD5FhbvcVbrXl2YT6srYkr3PTDdx+BDgKps
 nYB/Dgb7PDnKBhGWx26j+mjr1w3VX4fQbiLmYlzjmuka80PD/t2xh3s6RAvTUrsbZ9UJ9c9FwAf
 cvyp5YqMGkk1lqNcbB+a7d03w8mteR7EGrVARflqjeTnFOPb8fo9DrWFQ1wsY9AgOoVyzLnRCeC
 q79WHfCTnyIheYyt4eQ/kMsCqUTfYSZowSTInczmC9rsd2/LwvJW8ekdXmyFVXsRznCOlmKiXFg
 OaRdacDSza+mIVGnasUAoLVTsovGh/zzRdhwoJ8QPJNlHXI5j/jCT6R9dncE/OcycVc0z7gHwks
 hON5zFa79UwKppaxIY+xpiNLyWuJ/SclE0o4IiN4k0Lb/lzdtLJ/w80/3JK7wgynvJvu5kOvz1q
 T2YECCiINI+8Cgj0Smw==
X-Proofpoint-GUID: kQCrFEMCnGPuKpg5BzW2vWR9VJ1-isxH
X-Proofpoint-ORIG-GUID: kQCrFEMCnGPuKpg5BzW2vWR9VJ1-isxH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEzNyBTYWx0ZWRfX6rZME0n2jhPy
 O+WGF8kqO4ohQijlnblZ4NWYUqhR9hpjnse7PLyFy2FKZQtq4Keaqq7VedCtW0FyXE0EENJXCiB
 oBvSE5Nt7Z8EgMdo6SZEWltX2PuLuWI=
X-Proofpoint-Spam-Reason: safe

The CS35L45 has SYNC pin that can be used as a multi
device synchronization (MDSYNC) bus. This pin can send
various message types between Cirrus devices.

This patch series adds support for long and short DSP
messages between CS35L45 devices.

Each device on the SYNC bus must have a unique transmitter
identifier per message type as the bus arbitrates message
priority via this identifier. These identifiers are set by
the introduced devicetree properties. The priority
assignment is intended to be a static system integration
decision.

The relevant receiver controls are introduced as mixer
controls so they are exposed at runtime to be configured
for the appropriate use cases.

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
---
Changes in v5:
- Flattened sync node in favor sync properties directly under cs35l45
  node
- Using device_property_read_u32() now that sync node has been flattened
- Apply sync config immediately when GPIO1 is configured as SYNC pin
- Normalize SYNC Enable mixer value when comparing and storing
- Link to v4: https://lore.kernel.org/r/20260821-sound-for-next-cs35l45-sync-v4-v4-0-20d3a07c3b8d@opensource.cirrus.com

Changes in v4:
 - return 0 when controls are unchanged
 - adds locking to cs35l45_sync_en_put
 - Enable -> Switch

Changes in v3:
 - snd_soc_kcontrol_component -> snd_kcontrol_chip
 - only register sync controls if GPIO mux selects SYNC
 - return 1 on cs35l45_sync_en_put success
 - drop | in dt property description

Changes in v2:
 - Fixed property parsing namespace issue

---
Ricardo Rivera-Matos (2):
      ASoC: dt-bindings: cs35l45: Adds SYNC properties
      ASoC: cs35l45: Adds support for SYNC bus

 .../devicetree/bindings/sound/cirrus,cs35l45.yaml  | 20 +++++
 sound/soc/codecs/cs35l45-tables.c                  |  4 +
 sound/soc/codecs/cs35l45.c                         | 89 +++++++++++++++++++++-
 sound/soc/codecs/cs35l45.h                         | 23 ++++++
 4 files changed, 132 insertions(+), 4 deletions(-)
---
base-commit: ab07442c27d0f9fa3aee4185fcb3dbf521fac746
change-id: 20260821-sound-for-next-cs35l45-sync-v4-c2664a7bd536

Best regards,
-- 
Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>

