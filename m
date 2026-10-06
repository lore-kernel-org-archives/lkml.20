Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2098.outbound.protection.partner.outlook.cn [139.219.17.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C2F3C8700;
	Tue,  6 Oct 2026 08:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275668; cv=fail; b=iIPJALjrswf+JPcnzgjuQjdcDuIrA2RDw/gbqU5sHALAhx8MvRmBdHN4PfTnwlGWILn80srwQwXM3k5NUDA+cUrdAaQrxulkjXXUhjQ9IVytLxMxLKMpkRs1ERlyKYLmxf3f0oqYrSt6SWrU5dFNvVER4W+4aN3yNc9BKY4dPE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275668; c=relaxed/simple;
	bh=gX67sP/DvsMujlY4P05L7W3x/Lf+nX6TWlUjb7/sy0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i1CI/cmmd+IgB4yYrlRM3u5BXz/OI15FjuGE9/dFLGHyWKwroAdxM1OVmpkDB5pyd6+Yzv4Z5Ng/Sqr8kXuQgWdw7tmUa7yjibACMne+1zo26EGfFcpb4LIkyvs0s7gNg9U0B21sucYVlh4wGPdXqfu+MrEjKQLcRpifMX+ixqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbYwprbQ4YcbAwU+5QSLOsTi5EHjY88b3cH3b7AZrp6D2CIMZeYTffyapqYLJK9wChZWa7IPL96Wcfa1KiBhZ+/Ne+5RBkffMDnX4BOB/IrL2BdBv1jYo+KNArxfD1V1iCad2w+Jo6Q2cgVWYITdrJlSJ4NAAQVwsJ2vh3zo/gUKs3sDIMceJOEa0bBkPEmjWir1hu+/DzvynrbZL6vsh/uCeNferEGfRjedJTAqoC0LJzia08A5KqfIKpW7VrcCngG5+ln6iuN5oxtQLZlle4NZnX5boT6SLoLwbsO77JUqMEHRXavKrDmPenJg8e8leh7q/cb6nO6/LM7huKrWtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNUJsLwUdWwBQo9CHUeRSd9wmc2H4fQt0rhhRfHIBg0=;
 b=CK/N4w46c5UprwpH9EhTcKT0O+W3NROkwRxNsyH2q8kiF/XOVSTBIz3XbxUjQtOSGdeYhKRYo42hx2s8moFz6Z/716Cy0bjbX8QyRSDI27mF+lYqXv++Szun6OZ+SSaXYmdv+Wi3aRqD56PUUHjfMcbeqBQgS4ehSJvu15qEjI+l59/f6nyBbKXmiXeVikIVe6GAhvGK6lzi8zRfT6N7SKO51f9ehAqSXd74SyRbwbqcs6EM1bw8TBGHoxOxrwUxgCu51CWCMcSIkFHrztevtKwB8HARt7TSZl29BP/1vPnQhOoTE81rdwKL+6PFHEej7rheXc8WWa3uyyXLaXfxzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0556.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 08:34:18 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::435e:52b5:c524:459c]) by
 SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn ([fe80::435e:52b5:c524:459c%3])
 with mapi id 15.21.0472.016; Tue, 6 Oct 2026 08:34:18 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	rahul@summations.net,
	anup@brainfault.org,
	lftan.linux@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	joshua.yeong@starfivetech.com,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] MAINTAINERS: Add RISC-V RPMI voltage driver
Date: Tue,  6 Oct 2026 16:32:59 +0800
Message-ID: <20261006083259.2206001-4-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006083259.2206001-1-joshua.yeong@starfivetech.com>
References: <20261006083259.2206001-1-joshua.yeong@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0008.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::13) To SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SH0PR01MB0841:EE_|SH0PR01MB0556:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d8e0980-d682-4eb2-24cb-08df23849cb0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|23010399003|366016|6133799003|22082099003|18002099003|10067099003|921020|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	9V5ShwFYI7WIL+zFaECgi5IA9GQB9096ijKveeHkasZYSrIjAYs/B2ngZJok7lyUBU3kQH/cjSCpd1KsLJfYkaLLDnUvC5AzqtTduY5jwlpp4YpcZ1ay7iw4qE3XMGJWaxba5N1WcpsEKOwNlhfwBGSW0i9DbBgKJ8uxo6LG/L2vlwy4Qy4O8qhPkIggHXjTXYq/SX9d+i3Tc6rW5f5MpOKSsJmnSomp0+9JajjrD3tVUkFDPkyIzEtJHfxOE1h6+MWR5nD59dFXKSouwrcEZ9OuNPGy3VzR8aD8TijlOtXhk64YVVym6yd9BRTEDhfzzQRQbVQi1iUJRIkd5lqJQ/aT8AX5DrEXAx8VFvyOQXSsiK6BdnLdjQFWl3pcQVZo3orpky9SOes5aeZz91xU4T+wwtu7WoyvMYmb96lS+2SBfHWlGxM7l4jhYAtmijfp/kE2UU/KZWKxdpsKnDcUbUeX2fzKkQTZHX5kgGI/9ip+EbUJLF7kASvcbnqP/sD1sWbtLI1fN+bocM9GwAT/wWJE9IeMv7p7Z8regZbTtuhDNC3JCKsuozQRg2C7IBbyiD5BlfhtxVtakmMrrzlqnA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(921020)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lRk3IR5s8dy75NPdyCqW8kRQnIJawsDvB8W6EnjzbwuFJguzyK6N80XosBF3?=
 =?us-ascii?Q?JCYo2x4ujJE0/rlS1VWY8tUffRlys1LYuyrDI6EwE41ccLQwqJcbfRnKaOG/?=
 =?us-ascii?Q?XlLH7WkC2ONNYAiFNzMerCT2gB8u+t0yk0YE1CXhiRpbFY8g/ZkyKyr0iNIp?=
 =?us-ascii?Q?87mhALoQfIq6RHUrJkNvgBVGSPp2RUba34Xyuquj0IVw70Y2+bSIhA9ldpAU?=
 =?us-ascii?Q?4dRPjl9UEbxT8ueuAk3JA2/yoM5dEgA++6mfc7fFcT+gTogI/RTMBSl64JgM?=
 =?us-ascii?Q?SpbHgcIgx5b+NKjEtSkJbZXVmzpJjKATEP4VLRGrZer97TCAUFdRcKr6otBe?=
 =?us-ascii?Q?352b30ZadlNolgN+iUDJPGtqoJeKCcP8YLmcilScIMUllRJVqvHSqvzBCajS?=
 =?us-ascii?Q?4D17H9lh4f6196cqG9t/IPPyfYLzI8GEWi4uqtXXSV9C0nch88k3n11XU7Jr?=
 =?us-ascii?Q?6VQDZ/Rs3syKsxps5giIfzItNkN7E7U/HC7SMN5R7LCZz0nUOMaMt9etjYdS?=
 =?us-ascii?Q?CNJJFBcouIaB8T7L1+ikdNkBL+dGDKVGHWlZam9YHcW7KlcQhvz5kQMx2hPP?=
 =?us-ascii?Q?jKgk0JQZIVf1sMQr3sOd4exBvPvB1VnPxwktfnGLCtwcBAhftJHXbmLo1Yzs?=
 =?us-ascii?Q?bSz5gHI05OqVDUrHJwDocMlD3wA9SDyacgD0iJav/yfqo4XYtTyzQWA06dyu?=
 =?us-ascii?Q?1mUxkIsNJjgSz5iQi5GgzuvlKJLbyH8f0gVma3TE3RG/dbE6nh3Vak+KQ82j?=
 =?us-ascii?Q?Oy/nsmZguV91pkZ8D58Bb/kUwvlCQK2WgcgrZCfnHxTaOuEkrGicQ5UAxlUk?=
 =?us-ascii?Q?YkOrMVi3X8MeNTmyBtwx+av5U5r+gh4Ulu9NEU+LkzWdRlPwLXK17J+3/JvB?=
 =?us-ascii?Q?ZbdZOoCJk2BO5ts28IYWJ3yKkTf/1dXlLCK/jYfX1FgrnvuVhDgh17PDSv+J?=
 =?us-ascii?Q?LS4NDRO+xKYIEfd2XepruU7M8oWH2vCLafMYBT1sJRFhlNbNaZgEB+/M/uLJ?=
 =?us-ascii?Q?mkqy8lQ6EHrD8sLrck+aCE09un2OwBmeO/dV5a27+m53Sln9COWqbrjTpP/3?=
 =?us-ascii?Q?EeexKM6cc+Vwk9yJgAfC9W66nNxit/ueWORWPASF9ID3E03VzJIuXWtwnjyS?=
 =?us-ascii?Q?tVhEFPiQQ8OWjxH5JZ2x+jQ7R0s7a+njvNSxCVopGoEsWR7bVyapEPWCvipA?=
 =?us-ascii?Q?3AkXZmd5uDP4mCADpYi2pDkNaIMG25wGjaL1xz2igzGS1tHg5l/v4kFh7PMd?=
 =?us-ascii?Q?BCV5i56Y3B26lpCvrAVPIjXIzgnWK94+NgSjq5hGorE+Ok6iHJHex7RHr5hI?=
 =?us-ascii?Q?gWZ6ytgmTJsEbTZooHFYtf+O0prl7SPnvhlCfqgIWrxQuamMy8qgjVDq8BrO?=
 =?us-ascii?Q?qv6cMXQsGXqnwJ/PJL/t3dGxRJQb+zVaWEU8yIT6Cuup2b/92SF131ptBlYq?=
 =?us-ascii?Q?tLq7yoKBoJdSt3CakWZbH4hBsRzUk9IbFJSTnFWdW6lffUyrqUt46856Sxum?=
 =?us-ascii?Q?tIfgR98rNkdcK0bFshRFYQxK77CuDFlCSqcIn+EEvvEFIGcRi4EIAISALj7j?=
 =?us-ascii?Q?QbbnfNiByxYRSP2GPeoph/wKBXhjMtbGCZ25OQNMLLHn+BP/Pa4gBEItUzw4?=
 =?us-ascii?Q?Fu4hBldZwQuV+gqmOt6bVi2w+S6WUbwuJASPiSM7HwsjGFdJiTpRWWnz+e3b?=
 =?us-ascii?Q?Njxk1V2Sxi4QBHww03H76vjUSaScDCT7BuSRIjPh71SQn/5U9NtfsmlPyuIo?=
 =?us-ascii?Q?W2/I0cIaRPGYYEtmepkou9c+jLYG1UY=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8e0980-d682-4eb2-24cb-08df23849cb0
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 08:34:18.4263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dAFJzYJ/s8gPMJOkCwbvYHDMRhrpieyw0LWuj08JatpHqM2CJT4b8nrbTLzzsTSnpjcCvHDzkrwB5GVgl2lPYOnRFTdhQtj6+ithOq5O+3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0556

Add the RPMI voltage driver and its bindings to the RPMI device power
entry, renamed to cover both, rather than extending the existing RISC-V
RPMI and MPXY drivers entry, which covers drivers maintained by others.

Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
---
Based on the RPMI device power series ("Add RISC-V RPMI device power
service support"), which has been applied for next. The cover letter
links the mail saying so.

 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bdee5c7ee83d..cb4072f7b309 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23600,13 +23600,16 @@ F:	drivers/irqchip/irq-riscv-rpmi-sysmsi.c
 F:	drivers/mailbox/riscv-sbi-mpxy-mbox.c
 F:	include/linux/mailbox/riscv-rpmi-message.h
 
-RISC-V RPMI DEVICE POWER DRIVER
+RISC-V RPMI DEVICE POWER AND VOLTAGE DRIVERS
 M:	Joshua Yeong <joshua.yeong@starfivetech.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/power/riscv,rpmi-device-power.yaml
 F:	Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-power.yaml
+F:	Documentation/devicetree/bindings/regulator/riscv,rpmi-mpxy-voltage.yaml
+F:	Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml
 F:	drivers/pmdomain/riscv/
+F:	drivers/regulator/riscv-rpmi-regulator.c
 
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@kernel.org>
-- 
2.43.0

