Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.138.35.140
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793387976;
	b=x5zpWGu7zDLRwGssnTOJ+nu6nSDjvkOhHAM3Gym+o+0FNn/8aZ12UafUb//+p4Zhk+rd
	 IHQPOy4R++ULlAtnUUDF19vrOqg2CYSSRlDUMIWggTopPGJeedzY3upFflYJ0skA4JHp/
	 7CZZH6eCxe2jC4tDCFCS5LBu3fJyJ77xe5hX7QaUvWmd2A8Crz5v4x6qvYwjbAPCgMnBK
	 y2xBUGvE0L7FgMvjHG2TQfA1KOjoC+ZhCtJlyAb4t6dQzecy9zofzBqNcT6iPFi/OrrS0
	 zme9vwfdfCCUst5oR8t0uDPK/wuRK+mrkpoaJEuiw4Tm69upIDsORTO69bGIvgiT+yA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793387976;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 Received:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:STX-Internal-Secure-Mailhost:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:STX-Hosted-IronPort-Oubound:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=HehpalulkoLTK0sY1HL/24WpXJbf1QKekOImofgn6DU=;
	b=W9mu4f1bDU/O6cXaPPD/l5eEZ455epynGFog5gJYUAD/8I5cHuKHINagsmAUn5C0mrfq
	 OGpKUb7H3PzoaLZIqg9cf4Lj5fcuQYOsI2YanElRmt8haT5Xy89xtK5oPPbUjBZ4qo8rR
	 mve6VX5I0eSJ7Cr2MDbbWDhYTT98upF5Rn47bm9zfXoRtkStntvcuPSYEczDZ/PSzdLrm
	 XQqFolC4KclFT0wayAAAFe+/ruFCKBM7mxyJfcNsy4B2sO9jT4Ck7t7iS+9KX6gOq6Tj5
	 xvIFa5MsiH0NmMi0KSkJGlAXeY7zV6JjpJP//Dkuou54XMGJ5vBMyPDk8RspL/O+w7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=seagate.com;
	spf=pass smtp.mailfrom=seagate.com;
	dkim=pass header.d=seagate.com header.i=@seagate.com header.a=rsa-sha256 header.s=stxiport header.b="pZUi/Rfi";
	dkim=pass header.d=seagate.com header.i=@seagate.com header.a=rsa-sha256 header.s=selector1 header.b=LDBGJNqS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.138.35.140
Received: from esa.hc4959-67.iphmx.com (esa.hc4959-67.iphmx.com [139.138.35.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E018F606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E018F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seagate.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seagate.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=seagate.com header.i=@seagate.com header.a=rsa-sha256 header.s=stxiport header.b=pZUi/Rfi;
	dkim=pass (1024-bit key, unprotected) header.d=seagate.com header.i=@seagate.com header.a=rsa-sha256 header.s=selector1 header.b=LDBGJNqS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=seagate.com; i=@seagate.com; q=dns/txt; s=stxiport;
  t=1793387975; x=1824923975;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HehpalulkoLTK0sY1HL/24WpXJbf1QKekOImofgn6DU=;
  b=pZUi/Rfi8cz3yR/71VuRMru/N7g0zAI44a1sAZvu1sjV0Dk5AG3ixmDq
   9Ce+QLs6IKlOWgr0E7aZqr8V7YphnSbZnABumu8pjIScJ2RoOjvHSOX5m
   HZAkXuzHQqkro0bWaM4NeNU8bHLVaUKe0mg4Wzjekb4c+KDaetjuvH2Y5
   0=;
X-CSE-ConnectionGUID: k3dQde0QS5iEs+AtCWSdGw==
X-CSE-MsgGUID: sF/aoIX5SQqsD2Qvyi1JNA==
Received: from mail-co1pr07cu00105.outbound.protection.outlook.com (HELO CO1PR07CU001.outbound.protection.outlook.com) ([40.93.10.93])
  by ob1.hc4959-67.iphmx.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 30 Oct 2026 12:19:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEJulZb+Piu9o5ii3KjuHPO65h6EYSNfuTYrTQPennA7jmEIEry0Gm+09dLrC3xFxKFWU0yJpeotrJdPm6Xw/Q7j4k6wS43BQsFawmPySqTAguN+JoS3L6VLoUaOYRXlC6DHF+T1zH3oNWXe993oHD+Rea81H1kcm0fI6+1//15nGaI8S6AA5P8aV822PlsOFrKlqpAxTQvmhz4UYGP9o5u+3zdR09GDzkO3gebcRplA/jBkoirH1Tw1BeEF8weSXgAxPxKVJWveF9MzYbseg8pjGcuSDZpEIY8NM67hbDP7iB6D6vokQPH9J9Rx9TzAPLCAMWI7rpGMRshbpJEIXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HehpalulkoLTK0sY1HL/24WpXJbf1QKekOImofgn6DU=;
 b=AazuwAS2l7xG/iZJiL86ay/tN86UbuoQilrW5hWpZl70GOHU9dZGLB1Irsp8ieN+C423d31nKCZRYSUqtnysCN9SrjR5p9vmBSEkcwAUFtTgn/kzsAnK/XlqgFKLh4zHWxeylRs2GjC8wOQyceuZNe8jMspFSNVBB8WBxTkavxsL8BKDsb5KDDn1ufiiPN7/E1d2sSosHjIinZxe9hrAUj9MuTxIAyUB6r+Q98l/ggcAeIldlVoQp1cIQRrYG3NPc6utGY/rxtfrUrxU6YCaMvD8EwtdxxhhOwKWCGk80tmqFIkAK8tCoCBd329OBVDHJnsfWbpVCsIvLjFOZyqEbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 134.204.222.52) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=seagate.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=seagate.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seagate.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HehpalulkoLTK0sY1HL/24WpXJbf1QKekOImofgn6DU=;
 b=LDBGJNqStftMCPj/sKXHnS5+QzMFGcpKGGQBkJ1xBc3wgJcO44qHrjsYF0uVKX+a7nHu3rvVM9iLN0sczdtNlL9nA+z2VE55jOaOja2OhDugzdKXVNMwkWMhHU1CVV1FJrd060nTqokOacafWJ7VyH/LuJdvmhJiBNeW4YOSZ2U=
Received: from RIUP284CA0011.BRAP284.PROD.OUTLOOK.COM (2603:10d6:10:17b::17)
 by SN7PR20MB5507.namprd20.prod.outlook.com (2603:10b6:806:2ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 19:19:21 +0000
Received: from BN6PEPF00000076.namprd03.prod.outlook.com
 (2603:10d6:10:17b:cafe::9b) by RIUP284CA0011.outlook.office365.com
 (2603:10d6:10:17b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.10 via Frontend Transport; Fri,
 30 Oct 2026 19:19:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 134.204.222.52) smtp.mailfrom=seagate.com; dkim=none (message not
 signed) header.d=none;dmarc=fail action=oreject header.from=seagate.com;
Received: from lcopzesaa001.seagate.com (134.204.222.52) by
 BN6PEPF00000076.mail.protection.outlook.com (10.167.248.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Fri, 30 Oct 2026 19:19:20 +0000
X-CSE-ConnectionGUID: 7BYP+D2jSLqA5+FeqrqOQQ==
X-CSE-MsgGUID: vKBhWmmrQ92P952w6Tnwvg==
Received: from lcopiesaa01a.seagate.com ([10.230.120.56])
  by lcopzesaa001.seagate.com with ESMTP; 30 Oct 2026 12:22:01 -0700
X-CSE-ConnectionGUID: E7pRxbH4RS2WFQkpuKIr0g==
X-CSE-MsgGUID: WtBeoHltTEOgtW7m8lh5rA==
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2047095"
STX-Internal-Secure-Mailhost: TRUE
Received: from col-l721190pt001.colo.seagate.com ([10.230.88.101])
  by lcopiesaa01a.seagate.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 12:19:20 -0700
From: James Fantin-Hardesty <james.fantin-hardesty@seagate.com>
To: linux-nvme@lists.infradead.org
Cc: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	linux-kernel@vger.kernel.org,
	James Fantin-Hardesty <james.fantin-hardesty@seagate.com>
Subject: [PATCH] nvmet: fix arbitration burst field mask
Date: Fri, 30 Oct 2026 13:18:53 -0600
Message-ID: <20261030191853.1777683-1-james.fantin-hardesty@seagate.com>
X-Mailer: git-send-email 2.56.0
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000076:EE_|SN7PR20MB5507:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a60ac881-2786-4487-f6bd-08df36bab317
STX-Hosted-IronPort-Oubound: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|10067099003|18002099003|56012099006|11063799006|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	3Ni5w4gt0xZx60xQELCHwG9tdYmPlGUXgiyUg6HX7M2P2kgp43WtPDCVmRgEsn5oTfrwB37KEqjzc56p7sNHR0ZjDxJCuuQ2MTWA5P9TZhLiOE2omaC6FZPLsYaDNttiCc57NCrhhhL2io7QvUz720p68r6vVRaS9eEZsZsqmuK71jzvB5YFhcgAatgx/RgOThBwS7LYkg3+FJRR0QIvUkjRYS6c4L7kku6fz0xjnJkz8gglZEs0WzQ/9p3g/zb+gmosxytRViFdZoOJ9jKKABvghsoX+GL8xjhILYnDGrC7IqTc+8A5oGHVw2Azw0Ov+3OGyvfqlnVHNFZ+KXzt7fQg2Bi13qia8TWdEQSEWTfBJG0ecTQF/K2BFNaydh2AdeiwhWLvo4dL/ELAYYxEpOt29d2Fbkp3++udGnaoSJ9/wPjkar1EGAlGlftgG433qNzcIyAEb6GKvWrLO2Qbz2cPUpAIFt+XcQY3zYGQ6BFf+y+oBfQzR1lOwWaTsGC509pq2Bds6EhH8Ze+fPFyS8JUreG7SyfIN5S4Ea7IDHEWhed6M7xB4mU1n6tBj5k+8XbEeFktAd0nSmEvkN5ds1xVN0ZzH8QkZcHmJg+w0ojb21cr+9nG25tOHWpSx/gD40Cwnptc2yFaKl8Xjbo2s4hQEpkuCHvcLYnDeWsRsm0tCrbcvjJtstQ4DqsBCUifF8LKMTc9Qoa4RHk5VpW0BA==
X-Forefront-Antispam-Report:
	CIP:134.204.222.52;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:lcopzesaa001.seagate.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	29Hqo2psFPtzG5J/OaJCt6q4VdBqCa/ni2itnDV5778CK3631NiubxPKXJRBCDIUQgzwHiD1w2Y8kalIDGzR11iS/JBfrFd+VQWdEFPo+mWLyas3pZ3qdwUb0npLeOMyJi2l9Z8Uu+7GZZLH7bHoJPWNnffGFS78Uybjp6FM/A2NbdCFAmBFJOhWuOglTe36xoHVbGGU8YwQtjG7mOxutuPWabIwMbHaA6jqY7W6OGf+GzcrpkrQ26EYYkbsQybr25Xx9rxDMpk/6eFK2YC+QZlO9BbajCcL4oczqlc4cB1bzi6C1+7hs/R0lvajWJ8+S/Fo10wp7De3qTJP8lS8SLzJ+7cE/Wt145wugufmWwbKDuVmwvaQBKQzuAlmMlTBY4gHk54dFliglKlgieJ5W/u09wrzNjo7MCD7/0j1X4CXri4O0aucicUPcrQjR3V6
X-Exchange-RoutingPolicyChecked:
	ZIqRCzNw/jLcO/Swbv5AxlCLwBMznsHiZ9Y67ERAz9dOCOpVbgIVnNHDIYFQL73+mcta9GKT3+SRBVQs5KnPMBXrQzFWB63TAOScqQ+We5b9QaNuKifqaYXdCmfb0cCbu89VOH0KkS9CKFHsa/tgEhn17yTcI0qRgdtBcfPgBWtLwMLEm2RH9uIznKA28TW3JVIPgtjwiGfT4Ec+RK1rTf3PzrLU1Zkkuf8SCUwW34qJ98IaPwXpPgNyb8vYtJ9EeX8FWtlTj3KUsb5o3cZJHcM/htUn6GFz6mIAkacT6U/qwJkJqhoQ/l07cHpJA6xQYEaN8i/9W34wgQUBsJynNQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QYvSVeldyYVNKnbgOFyXUju3zgMZpZaPDVTB1z4FNbZUhLCPJo5XDBorFF6ZsJ9ubt4Rd0EJQeNxAfvdPmlC2brEVhDayJLcrkkHXhaS6ty1YTPKBQpXFAxARBhAsvDybtsKAn2kAhRf0ORQ3jWAJXaTNLetk/Pqau37o9vbwgAEKoZ2kRuIfJpSzphtGjlItM8YWVNM+iSVg0SFkf2UFupx975lIWEmOjfGgobJpH8nQMJv1oNNzX32G3lB02vUkcEyrpidE+mPU349XuGmlMQNtDyrc452YjploN89lbf/yNmk7wHjQilwF4gjsw8YSm/gutJUh1KcezCZEXOAeaUiOXK37COQTpSvAy8F99ykAFQVID1DjSOU0b5B1xbXlUjMRldMBhsAoIKbpjhGYSmG+0mp++/dCP96h/BDcBPQsJi7x07g8jFcpAIH2cJXtf1pKgYuqL2bpl/qA7sHlLGKGwwrtFSsOiZ3THuAHn9w1wgacPFviVL7m2GMSHPfsMXRBE3LmHbBnNgtu/QLK8ufCpTwv4/q8X3o/ysNp9KwQFOMKLyy5vmpuqSalKJhH6GsusEZ1GnElYtcsS/91UvyHcVQJfCAum3i/YDwTsjXI+9vUr34sKx/+0Ig0fEs
X-OriginatorOrg: seagate.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:19:20.4542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a60ac881-2786-4487-f6bd-08df36bab317
X-MS-Exchange-CrossTenant-Id: d466216a-c643-434a-9c2e-057448c17cbe
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d466216a-c643-434a-9c2e-057448c17cbe;Ip=[134.204.222.52];Helo=[lcopzesaa001.seagate.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000076.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR20MB5507

The Arbitration Burst (AB) field of the Arbitration feature is
CDW11 bits 2:0 (NVMe Base Specification 2.1, Feature 01h), but
nvmet incorrectly masks it with 0x3. Use 0x7 for both set and get.

Fixes: a0ed77d4c9a7 ("nvmet: Implement arbitration feature support")
Signed-off-by: James Fantin-Hardesty <james.fantin-hardesty@seagate.com>
---
 drivers/nvme/target/admin-cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
index 26028be8fe4d..6cb59a4f233c 100644
--- a/drivers/nvme/target/admin-cmd.c
+++ b/drivers/nvme/target/admin-cmd.c
@@ -1326,7 +1326,7 @@ static u16 nvmet_set_feat_arbitration(struct nvmet_req *req)
 		.hpw = (cdw11 >> 24) & 0xff,
 		.mpw = (cdw11 >> 16) & 0xff,
 		.lpw = (cdw11 >> 8) & 0xff,
-		.ab = cdw11 & 0x3,
+		.ab = cdw11 & 0x7,
 	};
 
 	if (!ctrl->ops->set_feature) {
@@ -1481,7 +1481,7 @@ static u16 nvmet_get_feat_arbitration(struct nvmet_req *req)
 			 ((u32)arb.hpw << 24) |
 			 ((u32)arb.mpw << 16) |
 			 ((u32)arb.lpw << 8) |
-			 (arb.ab & 0x3));
+			 (arb.ab & 0x7));
 
 	return NVME_SC_SUCCESS;
 }
-- 
2.56.0

