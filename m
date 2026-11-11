Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794368095;
	b=qJMqefa04sfY7phwcNorc/iZ/IVFf+mbKoQyuJXc0cJJ/PNXLV+Q/p1M8Q8PyEljjGzx
	 IsJXTX3tfgbndUQGt++C3C07RRZPpEAFUiGQkKj8FBe7eIw87saulcUnlPU7aNOHudNr4
	 rVm9PJ/TfPol/hGXgzqLHbnDfhU8vAfkQr38NI06MHCxlILzlBY12YUYyQS0UtaZOZr6V
	 3sUkqQTPbCTN7vYAzioP36UZULinjvNX+W5bulR41p0LAEptXBlTvGftA1Zv6SZFiDdHH
	 HugzTmzHS8stReknWWcDvXc+n0wbSuRgVg0U3AluoP//+X/jfCc7aB7uBRyThnITzsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368095;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
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
	bh=enokiadHO5dXxABbBcazqdN7iexetKJszb/hMskTV6E=;
	b=qmmNzIf0QjCSvWW/EhbYN1juImtDoSZSHCxuTN7JU+7JhR+Kmi+fjtc5wT5Aa/pX8sXU
	 2F1g6GAFLy+RSxVWwBnzWZLfZGHI2UInnsvKy4ETo/mMMNfT8xaWkoyBJBAuzsSiF5oWB
	 TjTFBLi0j+NvJbccjPOhtF73X8i5Qx456oYHHw7lIQYaKNcWl37GStmnpvTRLj9gCws/f
	 Y8U7ckK52koVZ8e3bp81RZ9M5azA9llQNyzNhIvNN5MagPPRqRAxvvIWrU9Xv3bwp+cWB
	 9lyCzBrpIEywM73vsg5lJYCbXpo9nQN3UlDsJggXCTPeAlbdxZDRqr3JdXrZNF2+qJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MfPZk956;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.62
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010062.outbound.protection.outlook.com [52.101.85.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C439606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C439606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MfPZk956
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G48enS5LcP1u9wFBZJxL2VS9lflph4Q+M7qFYooRDUMvXCgq7HrkcCDikQF5Cs9RmsTF91Y21jU08YLa5OTW7uENWP9v8SvQWu4QlwGkSJGDIVb1MHP2wAd8quo6AL/a7pNYNQ21SSlqs6ENtMKWgzy51+GQuhOer10bW4fWeW+/Q+ZmbdWi1ZWnQB9H1VlXU9n679J76P3xj7Ur7myR6V65hK2beW/PJYVrGgCMlTmz9LqKJevlbHOJSnvmJCuS9tLAZQGvsxdgHli0WLzb+765zvSrlf+0Fg6pNZ7wGaj+w0mIxGi52k4G/xcxuYFR+gKXfL44ekWtfPQLelpXPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enokiadHO5dXxABbBcazqdN7iexetKJszb/hMskTV6E=;
 b=c7759iThad0e4DXfGNYJGjJ3Io2C6EGVMhwVOzksBs9xv+1qdfJ3LwejIK4cGOH7uK69YVZ+aot3jYLvLZ/n+2lE5sVs8XcqNGla9biUs2+AwiyIZsXaYRBlZt2s+bSlMYBRWBiaWtjGcf79BQP5zJs1uF2fH306FLN9uyrAwAMZl8n77CtxhJjH9GZENARM8E5lWnJj/MlAktCTOiWxaGiU5ntI94pkOECW1T+kPIQLftgH7xk34DwoHfRtAmlcldF7tEEBv/GuR0N+cQ6StTYHn35/80YKEeaoS6UuARe+2wUTodW16EiTKa748imxcL0X2E6oyBcyR8/zgj6fpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enokiadHO5dXxABbBcazqdN7iexetKJszb/hMskTV6E=;
 b=MfPZk956ReMxha2tL+yV5mDm2YJ/8+lluyatbdz74IryN+zd2aZXhwh0AYrmsaEx6pHkTolY9KKDERDkwG+j3qRge+FHCBPyNh2gQjnZcBkxjslVtpn5sZrdFdpHw+Zi7T+qHsZgHdk3IFfDRVC5fBwgeuT/+oqYgBHWOsMWNRw=
Received: from DS1PR03CA0023.namprd03.prod.outlook.com (2603:10b6:8:233::11)
 by SA1PR12MB6800.namprd12.prod.outlook.com (2603:10b6:806:25c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 03:34:51 +0000
Received: from DM3PEPF000265BA.namprd04.prod.outlook.com
 (2603:10b6:8:233:cafe::a7) by DS1PR03CA0023.outlook.office365.com
 (2603:10b6:8:233::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 03:34:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DM3PEPF000265BA.mail.protection.outlook.com (10.167.23.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 03:34:50 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 21:34:50 -0600
Received: from [127.0.1.1] (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 21:34:47 -0600
From: Shivank Garg <shivankg@amd.com>
Subject: [PATCH v2 0/2] mm: remove unused vmstat and folio refcount helpers
Date: Wed, 11 Nov 2026 03:34:32 +0000
Message-ID: <20261111-unused-sym-core-v2-0-3edc7fb8581f@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ5AMBBA0avIrE1SJairiAXtYBZKOqkQcXeN5
 Vv8/4BQYBLosgcCnSy8+wSdZ2DX0S+E7JJBK10XhTIYfRRyKPeGdg+EqrWNcZU2ZT1Bqo5AM1/
 /sR/e9wM4dVIrYQAAAA==
X-Change-ID: 20261109-unused-sym-core-08c79d42936b
To: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Matthew Wilcox <willy@infradead.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Shivank Garg
	<shivankg@amd.com>
X-Mailer: b4 0.15-dev-47d62
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794368087; l=1164;
 i=shivankg@amd.com; s=20260518; h=from:subject:message-id;
 bh=a7rfllFB9pEo73S9E89qz5htRD+ZCafRKGzOwhMkzrM=;
 b=MAdbXqYsoTmqU4JEoYzUYunALKCOkAT5AJe/2aA8282DGXr4m7XcHZ/h0XeVHSsdI6e+F53m+
 XkxmPiYOmkWDF/r8yR+8nNdz7ONZO5+ZNTHx/CK+NxATkjSGx5RJU0y
X-Developer-Key: i=shivankg@amd.com; a=ed25519;
 pk=2l2QGTeXuGkZTtfmx0nPQU8iFZfjYmX/ymMojitevx4=
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265BA:EE_|SA1PR12MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: c0144346-ec5e-46f9-927a-08df3fa4be51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|7416014|82310400026|13003099007|261009223027099003|10067099003|261028144727099003|261026140227099003|261021123027099003|261022105027099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	5dYbRGXWkoZ9Q5yDp+TEgzqq0jBJCSG271vwqOkaKLF8KT9G3fI48C/pI1Ltc3VDmoQgX6yQmKcvZ/XwCcz+3nVerj9/LXPmwpJ/xQVJvPWPA2q8+CEEccc+oPQr1/tr5SXf0Gw81cOaMBC6EQII9Nc+H92YT/RWyZvDGBWKFt90oFUmC6SdMUuRDicyd2b+tHWb8eqUWmRYHouXwg8K9vuAM/EKR+NIxLFRH+s1vjdEi35Ys88h6yQOYaMbt9sn4tmUZ2HEVnI+E914EaQcw7M8FwfpyYkCbvD20M6yuMsLyhIJiELJsbeNQzrfwH3TjmrTAZojncnUzWZW4mr+aaky51mtoYEuFQJKwHSIwJeJXZnMO+6aBaZEliKDel9vQy/zgjQEnKi7DJLOaTsVOB2LyyEWCiuWxN7H2WDx/QfPLgopR+32oah9DrKbE//FddPU6FY3vCWzePgNtKxUkVkWy9Vm4Yz3qh1koCNsItAookZhbOyHp9pgfYCq6EfoJWpWrZx/iNhRR62Yx0DNrTGCVMi/WXGq0lO8jrFdEsSoIXNifC8eGoGsikjB4oSHU4butXeioKHOf5tylocEIhGsuccBbAPnwZ3sgbGTUi47BrFmlx2VBG6o+tq4A5iWh7SVdT0o6W7TE2dXuZCYryo9AzuoQKpyIxrk5IWzXhQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(7416014)(82310400026)(13003099007)(261009223027099003)(10067099003)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YeIsnSaVLUd6HEPmM8D0wFgWJ3E8QJ2B7wbI/Lg5ZaaR+Xx1qBlvVLBA+k3b6GrxLB3PXc/kNRzcQsIPhvmwo0ribXuftsiKbUIHtVYq8TuQLEGbs3HkSPpcwfE6IL59StYPmYsLAJRtpy4FmFpxVXM3qZvKyDrMhvkxkFcqZ30JSTNvl4l9kiLT6P2nICpfY6Y5WBQfTnoXLCsZrtYJkiosHkhkDLTkD4KBQzQulFsdw8/UUb3hQzximxaiyWw5XT1d6p6XTjgZRarsS489wlxF4WYpCPpdAVXwGx7QKDpN1LRkNeVejtT1AQJviJFshzEDfyYzRSPJ40KRA+gYPSaQ1XW615LnDro5DJeGs3IP8TjLNKLGcLTfjnTiznSkymZaAA0KWGI3euKpUwUdF665mfOKDESCC+S5DWRV4ILxImWbQZSsU2sdEaAtBL3+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 03:34:50.9704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0144346-ec5e-46f9-927a-08df3fa4be51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265BA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6800

This series removes ten static inline helpers from
include/linux/vmstat.h and include/linux/page_ref.h that have no users
left anywhere in the tree.

I found them with the kunused scripts [1], which I wrote with LLM's help.
The v1 cover letter [2] has more details on the scripts and how LLM was
used.

Changes in v2:
- Split v1 [2] up by MM tree, as David suggested. These two patches are
  rebased on mm/core.git/for-next. Remaining patches will be sent
  separately.
- No changes to the patches themselves.

[1] https://github.com/AMDESE/linux-mm/tree/shivank/kunused
[2] https://lore.kernel.org/r/20261026-unused-sym-v1-0-82ca2dceabe1@amd.com

Signed-off-by: Shivank Garg <shivankg@amd.com>
---
Shivank Garg (2):
      mm/vmstat: remove unused folio stat helpers
      mm: remove unused folio refcount helpers

 include/linux/page_ref.h | 24 ------------------------
 include/linux/vmstat.h   | 36 ------------------------------------
 2 files changed, 60 deletions(-)
---
base-commit: 94c0b03721e5a7187b7a017a18f58a50cee4f29e
change-id: 20261109-unused-sym-core-08c79d42936b

Best regards,
-- 
Shivank Garg <shivankg@amd.com>

