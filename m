Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2118.outbound.protection.partner.outlook.cn [139.219.146.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0688049D5AB;
	Fri, 18 Sep 2026 07:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715494; cv=fail; b=L1pwlDtxSql7Yf2YlpOLI/WU0oZzgX3I0uqzEzfQi2IwheOpujrlngdxRW5P1Z07Fzjq+C2LU1G71HzHG0+1M5IuAKuneQcXhyCFX3giEcPIOQYIfTDpPhXeyqv5ynHU/6Gsq6hfdY/n2+oSrGNMKpw4ZV4cH4tERajq6+qQx3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715494; c=relaxed/simple;
	bh=XDD0sVoQiRO7kNL4FfTT7f80Tpnq1wof8Ajx7xMZSzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IJgzdmMvyBIxnSqFhv1hGU3IQzKx6joPEfAyIzvlnYOPKgZ9xORyd9QG0GIPdnQV/0dX0znkqKOrl6EeDxp9tMWQ6D8aMVvJrvjfAskEtswcKhuLB+gUgdpYKOVhAhzkGc8wMFGtDZzDbSrf3pAeaB7RRGGf8n+coESBne01abs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkGiLSgpBzRIe5jopwdHMVUYPMkYystloSenLgbkW3tz7zVrTqA/qzVcXPst9KhlmIb+d/8Xvk+3BRUyhBDfEFZJfERlxDWWSWBOiQpf61/u13NMSAY2p1EgLDw+vihgTjCSlXq+bkT8GmkNUbdbC25Xo0T8RmS04WsTIsem7/I1PiDt5xXGUTpxbXrFP7ydeEF/unWEehp+og+ISrf5a2gEatNe+dRvPhnAngk43JeE53ondNB0SkHzwFU3FLIyhWVKdp2AP+cOSU+9T3Y72t0nREHmTovlEJ5wOxi37foDTPYymdxa0xuDMCDDKa4vCZDvIEKCuOOl4Mx/k/eImg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vvi8Gp+VBrAGaHKPHrupPkx9wBUj6UGHarnGvZ9UPk=;
 b=kaKjGSUeL6jKSB9R02gLJZeODxWp0oaYzvRlvhQ1YJPoDKBRQBU+ATMMD0+kkuEhlX9yI0m8VJ72lz7tfwC2AhDQ1GZL7V0CY3EZtcTQqPe2UuWVu9wvbI6/XxtwiO9A5wiATrSKVW6hetWsVRSTp2nkkNlunjv0Dst1zTZguNlh7In38r+7qA7MBEaZS0PdnuPqXKhcwJQ95GPi/3KRTDru5d2jWho1ugTdyyoQdweV5+jIHDlaisqCjfXvcY2l6YsaB8XRo0Jc7wKrLlCuBLEUCOVgSNhkBjTBtv0C0ZF5lYiF9VcmGvxpdgxWF3bK57SvrR5tQvcVAF6Q8lFPUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0893.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.14; Fri, 18 Sep
 2026 07:11:14 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%4])
 with mapi id 15.21.0339.017; Fri, 18 Sep 2026 07:11:14 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Minda Chen <minda.chen@starfivetech.com>
Subject: [PATCH v1 2/3] dt-bindings: usb: dwc3: Add JHB100 USB device clock number limit
Date: Fri, 18 Sep 2026 15:11:02 +0800
Message-Id: <20260918071103.24482-3-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260918071103.24482-1-minda.chen@starfivetech.com>
References: <20260918071103.24482-1-minda.chen@starfivetech.com>
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0049.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::16) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0893:EE_
X-MS-Office365-Filtering-Correlation-Id: 263d7818-4c84-4d32-4f79-08df155406bc
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|52116014|366016|1800799024|10067099003|22082099003|18002099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	N2zBezvfYDB4GIr+gvgcOfmMRS8xwwNV4ytJtvKGcXRcURGr5UAUYgeTZyADODYw7zyHEzhTw1jEXSewnm4KxRKn6FNAe0BIW5d8T3AHq5uFwPUZ2PC25BFvthE6lAYDjXTGN010G2tHVSh5FzRc039NoP5wpHCbf09mrrpY8Qo5TBTOwBuEpq0A0Dpa92KS9iqx48jKwlJhYVvSykGKOrldTy4xkqSsULSac8ruyxpTkWsu/Dd+1kfZciO6+vATGKzAnAIyeoAHVw+AZjLc3kIchZgep7j+0uXGYdN05J1fkVZB9OEArCHzVGeSShpelzRCgf/2fmLluehDqvRnLS1SRfV2jDVIW6fxbj+PjMlxP1uoaN8NBxGLVHJyIVJ+stHdb6hL0Iy3ia1GHF/s9BbnBbTVWpZQkBtuhdYDlBljGmQRBn+94Jn8y3YuOqaQhHQuziE4ruuBlO/Ts/PAOLquiHHswuJ9yUQaEL9sMm/7XcI7TgRQrnwO6uuhNvVYtN8oVN1uxUFdXWA248og9z+aKaxAORGewkafDv3+SLJXTL67VT0WcWU2BOhoI8y9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(52116014)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5V+kSGFZiUYqCl65Rn9rsGTKvX87VsRdG3C3cPLxA4Vxxg3uQh6GzAnoaCov?=
 =?us-ascii?Q?pQk2h0JhfyaUW/x16iA0vWcbmY8fN5wFUYKwUT4XZU73OZge5cvL6SMuwG8R?=
 =?us-ascii?Q?1OONX6bfEMJEQCnI7No5osGQnqucs3nhavxilmEzri4GzD6wVibKLo5wVX+Z?=
 =?us-ascii?Q?Z5TUs42NR8TBCpIvIh8Vl0swSkjB/w6P3hwhz1+EAwJfTbTHheMf1AY0kzfm?=
 =?us-ascii?Q?QydYAR/6m/C7Lk2P3yrEH0I/NVYWN7nBK5eLJv7zLJTNztEHuYGloD6RdHub?=
 =?us-ascii?Q?zYV550Mae5ByydmTBSlqgd6XJcPkiaqSfIHUENu8wdGePRpqjSIi0+NZ3qSJ?=
 =?us-ascii?Q?Qj5sKT1PvseT8127rki0fXXeWuY5NnJdOKBVThI/KerBfdbe5TKI12J1otUf?=
 =?us-ascii?Q?M24J3mObOx7RIr/WoMl2D7aB2+UZoiqFux21jxMn841677bHGOpQwfmg77kQ?=
 =?us-ascii?Q?msm957FZqCQeqcmoManAEcwtjm3uf6HbV6FEJVRuc/gSxzymPaLz82ZMFDcl?=
 =?us-ascii?Q?ZTuwE70Bad2BcOkXP0ZcFQKeDLV/bZLQL+YuR1Zsx162VewWjrJn0UyJz6Zg?=
 =?us-ascii?Q?IvXmhbfHq0HD/orZdNC9W2daAOkxaSGstpDUNY6CCn1bDvWUVZpLVQFQ5j4B?=
 =?us-ascii?Q?XjAmIFRFuRbbok8eblviDpOw6c4PeWJi7Dqln5zsV05UsFyCdKDdEzkW20m2?=
 =?us-ascii?Q?yxvGhjSPa84YcfbeVAZl5YTu3sVMzjL+wcQKRZJKZUhzKmFqOKVgfZHtUAcg?=
 =?us-ascii?Q?3eR3jqkbceYtchCb94QDjjUBSLOLxE6y4gDFDBBcIscN6ci85j4v19SJR7ij?=
 =?us-ascii?Q?zyVC964MGOAwYfyT1IfWnjOt1RBzoSBm9ufPdzpqRjke1xfupAyysAoUTiI8?=
 =?us-ascii?Q?J9fAZF431cfVsurhziqLRjv8WlnQ74I+Vh0nlIapLdUEXZXgmFpbXm6sRugY?=
 =?us-ascii?Q?AiRvf2ozYnbOqIfNuOtfUkZm0VMjHRiCH4NDru869CJpkZ5OEEmDxNyYiNnj?=
 =?us-ascii?Q?oAQhWAsMKtPC02Yf7ugrKbRT0vO3kMCKriloVyOOrz+OqnxkX01WkuqempId?=
 =?us-ascii?Q?v85k2Pcry3aZ6WcPjHnyicOnwNAnDgSIRCB4BtYuoGtBWYJ8vuvMP5BYLfpi?=
 =?us-ascii?Q?s2Tt/CF3T2T09iYxKI9+nE6LzIS46y4stIkDz0OVHu+eARXgnLGZBlI1b7Xh?=
 =?us-ascii?Q?ygcVrpIyhFxDB5W22MW2LzB0Oj6r7Z+LuEe+Gw0cKCrbsjI7M9pwmZulMWWn?=
 =?us-ascii?Q?vgTJS1U5ZM2hRDRIHlFcV8orSz2JWH2yKe6qWzln58FnHF0yxpd3M1Rm7R/K?=
 =?us-ascii?Q?l4PsfiUGBPkeNEKY1SElnfX/G4NpHa/yZiUjzm1EfJ1x3MSr+7YuOfVPtZU6?=
 =?us-ascii?Q?kQ5eR9oVu7KUYxCnQltEUTA/6Pt5KCrWuM8owlRFkQdGTO2dzAEFAFXX4gve?=
 =?us-ascii?Q?H1/kLmd/UhPtiFolmkaiUSAiPSXHGsRNFrz7jRv9Hz5N2Z+RooGO4mIABSyk?=
 =?us-ascii?Q?ymrVbD7Ptskpua4eIA9lcxMhHJev1gCF7h7vd99YrkyaHEPfxCnClbM8EAYt?=
 =?us-ascii?Q?NF0HRBoIndLiFJxnz9C1Aet+9YHn3iPJHuh7DToH4a6TlBy5PksrrSHsh8Pm?=
 =?us-ascii?Q?m/UfcGS7w0qfKb52CTKBYn1Uz0CYn/UUTzHGkubhK1/LnT8SbWwOm6EIGoXf?=
 =?us-ascii?Q?YrrzUtdbohAab6O+Mis2+r7eUUcMNUX53dz/BQx/QJB/+v6o22nRR1TzdBUK?=
 =?us-ascii?Q?LfX3zrX5fB9BuIkM9/ohhYimi/s8UuI=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 263d7818-4c84-4d32-4f79-08df155406bc
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 07:11:14.5683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1T6nbwOnzYddjLLnOWBSd4cV8OmrB3FZRqTQFW8NHCi28WHWqcG4eYL7n1dU1L1YFwTDaipnK8z8Qpx1QZyMBFYzToiRDNe7yXvP7hXCFs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0893

StarFive JHB100 server host virtual device controller do not connect
with PHY but connect with digital adapter module. So it do not
contain core reference clock. So the minimal clock number is 2
(glue layer main enable clock and dwc3 core bus clk). So Add
minItem 2 to clock and clock-names items.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml b/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
index b2fd98c06ba0..3d0c248dee71 100644
--- a/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
@@ -35,12 +35,14 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 2
     items:
       - description: USB main enable clk
       - description: DWC3 bus early clock
       - description: DWC3 ref clock
 
   clock-names:
+    minItems: 2
     items:
       - const: main
       - const: bus_early
-- 
2.17.1

