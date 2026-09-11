Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012068.outbound.protection.outlook.com [52.101.43.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79BC471265;
	Fri, 11 Sep 2026 09:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117783; cv=fail; b=qfsib6k442LxdImAh7J2W2AgTXhpXI+4IPUZGTxtjBhj3A7KMru9bNe5YjRrnfM9RtNQqpoC/d69OX7SuIiYZDmDvXLB2ZVFSfTIIEmwZmhtaxtzClMMOmGO7QLs6+WTvGjy64ZxW+Qy9zbcLU3+cWGmBSVpDbuX/I27eBUVQ/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117783; c=relaxed/simple;
	bh=JK8baM6FlgpFAWd9HUaG1893rLEV8NeJjrtJPxUVDTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NlTujzAhMlWlmRk4AQAil/vAYX9zob9ZPmSzCPT1u93uut7JtuZ4MWJ2ZD6S42vmkAecUu1UxCECC6XMsXvQ24Mc8bv5gou0ZAVu48K+4uxTMGTzOHJ0kys4Lmf+1upvhvPbb6eC+3LSYWnG9TiW8iPfw/DlSWgS1GKktC354iQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=kdcrSLTn; arc=fail smtp.client-ip=52.101.43.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="kdcrSLTn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3GrxNwI3o7bjNEqlOAixIIGhwAuIkI4O1wqVvxJ1o3TZ4iwitcX6v6qJfsWp7+BcfGoi9lVT2JfieSdWm7ntsuj8+qg7Cf4fKmIaIyil9OX+H+Dg3MMCtZpwE5oQR0UsD7WUEF+qimOZ/h705xz/sRoCP7MRqml2LNL0t++IEP6WZkoRHVEVEHXMzY/NP2X65OVqbD3npgWxEZofl2UkKvHha/ko/iJLt+3aDoAfMGjRAvMI5BM0LPAPOIyhLPGhB31b78nrDVd461xCfDZSFMLlrPX+3a2Cji6QOcCD7F9wtruYy4W2JO4BstRLqPVguFdCKqKsBhlGtcBB8e66g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhlTqQ5WHH9XcSq0tIxxh6Z3iSZN+yYmUcKDgZB14WM=;
 b=SFIPSis7hw7hjHwg4A7Wc0NI/QdhISZrravLvDcJf1YyjuH8qdSScOw4/Ypn4Cbzm9Hg765Y6t4TbkbufY4MkHdYzPVr7eH7d0RaiWhLy2NtuTf5TH/wd5RdLxI5T35K072lefqMZOYmpd+0Pw9jxI6q55qgHU7NBOd+WhjllgsKh0vJnajU5SjjDnY4c1L+ykTzIdeJKxrp3zKTozGYhXrOJ/JkGqlnFFeDuXz1YsJ1uqRDMIxR6ZIfSwYOSRtWMBj1vG3e6jMpHmTxKJSuyKvHX6rX26/opBFXeG27i1+uj87rGIgGhzU3e9I3LDSSDE7AK1j4NSb8kFc7ZBPlPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhlTqQ5WHH9XcSq0tIxxh6Z3iSZN+yYmUcKDgZB14WM=;
 b=kdcrSLTnF8ae3C/PQ8oXM+fg+aQtXQ8Oup0/PauygJTuQxuNkTih/yZ4sz/MuLvrWrw09quwfEWi/AjlhQ70HIrg2vNmPhdYIEKMn8zMR+aaXUkoJB8APoZSL7RE0celnho7q/KuuaCsZF7M0Z2qwRrP00H0sUumAJG2q5xYe/xvHcwLf1p1UKqf4lI1L1FWtLjGh9gFpEpJ6+j6g+1+yt4bUW9MbKJLmoSsRXGXe048d8ow7e+K6LkLQeCxpUALQ3O/xD0K5qpMDH/r5SEZUgsDSLU4hmn0hGrnadXSnpW0/3wGGoBu79sgrV23moQZrz+QvPyJbRzSoup1L60zbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ2PR03MB7140.namprd03.prod.outlook.com (2603:10b6:a03:4f2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 09:09:39 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:09:39 +0000
From: adrian.ho.yin.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v7 1/2] arm64: dts: intel: agilex5: add USB3.1 controller node
Date: Fri, 11 Sep 2026 17:09:24 +0800
Message-ID: <dba41aa636c6db86be9e0e2a3e2ae1a03095e1cb.1789114403.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1789114403.git.adrian.ho.yin.ng@altera.com>
References: <cover.1789114403.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:194::20) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ2PR03MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: cd23d6f7-ca32-46a2-4949-08df0fe4689b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|55112099003|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	1XtMN/ckksUkSsZcc8W9OB9xpOf8wzq8ybEfjxI3lkjsnumz4wGI/JOxkXk7TxgFSDxXjPWO4baNvk7SYgbcSAOJjmp37Y1Jv/WF+JXt12bAHgRmRcOB5pNqfXFcTu/i5R3BUYDjTcIg5VPrQO+A8GxNRy3HKT5qFmd9Ra21t34A2SyB6ZTTOet/y9uKRC+wC5Xo/Xkb+g0F27A5brEzzsvsUIv0JTLOBvxH3etohx83liJYEBvm2DdM/DAaDO9eswuRLoYLXzaDY0dIS/wTxEk7ZlKWcr7piT8KSn2Aqmzra9Vx8vhh+9lonp+4+ERIKgdYrfVkkqy6e5u1/gL8A1PasYTCm1/7cK9JPP+jHPiiWKSug/UEXvqh1e0XUh5HsBDTRxZT3D0JQO9pjKHG18JzlmZJ9tVg7NIrKvU27rE4aVtE5b8StUp2BN0UZlAiHmVmNnvSUSwJlGWGjlF+0tY4DJF+W8WR0KXkbs2LeajNTS5+uwj++Y+nYtdzyL80amsdWTKiH2Tikd52ChZldrgZgfuCmtBn6u2jqy+jxaOPJsbGHPtVGvrRAxFcERdHdux+SdLjb7QgHJVHFqJ06dDVtEKlwvG9m0Y50TYFaTTuVlyLNP+8OKqwP6v5NsXAA0Z/3HiJYjOCUC8JwVR0Bx4eqXIbzXNbZu6MjgpXmG0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(55112099003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VugLFFkYD/9yhlAlQqra1qzjmxyib+nhT/xizb9guvjbGwnzwSW/15SuHBv0?=
 =?us-ascii?Q?JOAQ+0cFRFQ85pYJ6Ens+3qZ2KqOj0tlVEdHeL1bGm72oxbS0bz6WBymJ6df?=
 =?us-ascii?Q?TsXTgGydRNUHOVAnS41Ui+62pIdr9ABsDsE5v2epyRARJS6LCNsiymph9Spy?=
 =?us-ascii?Q?+hwRfiZkJczbTLZSlElWJ2L0YE0xWzY3b+Au8cHVj0VIhumGln5qqJ+5eYOx?=
 =?us-ascii?Q?PYkKzI5XTu058tGKOR3TR9Ne1GiveQFbGICfST03DEjyVfEyOQ1gdI8SQ0xA?=
 =?us-ascii?Q?5yEMF3xBdGidDePa+W4+1FmWzgOEgBWjlEnxmoTFVSEOgglyuRoJqqfctY2c?=
 =?us-ascii?Q?jsaiynnlcVb76pOp9kZD/tBDbpp5B3ax758UwkciZP4nGk/JA+da10iGv4xt?=
 =?us-ascii?Q?akYwHQpoGP3m6jg+tJaXgcHCK+UJS/sJoaHc0n+mtgMFiHba7EBSdxZvuZpD?=
 =?us-ascii?Q?fwSEWOML6vO17rX+UI1cI9iCMXDeLsniJInjSKjBZ74jmEx50yB+1fuuoyFy?=
 =?us-ascii?Q?bdnQ1OqLg+x7Emsm/i/FLc2gZRPDtEFFjWgmXCQ63Jqf8JtRXcMtyeQWc2BM?=
 =?us-ascii?Q?Z9xTOYYV+lUKee5Bt3d6c9slH6cRR1i8PmVHUfn5XMDwD2lBcaoI39h4Z+RM?=
 =?us-ascii?Q?vIbIiu8PXOK85NsgO9lR6I5nO97fUIJFIyba3J564Mal6TeDkZVFnAg+T/nT?=
 =?us-ascii?Q?VzAvOkRnT2eB8tdbyb/v4oBC25m75bzKmzUjgGtbOy/Xr67qLQ0wVEdw2ncM?=
 =?us-ascii?Q?yakPTuTVx1CH2u2iDx6k0tidrtlt/Cn2ONiJDgU9H8JiJUVWC6w0CQoCcOEd?=
 =?us-ascii?Q?IsznJp7m1Av0EiQUcZQeObgwsThPFbd4BYr7BSQIp4oaFah6GfGBsbnLuBAn?=
 =?us-ascii?Q?zVLtNa4lj6XCc8wqjLAbiIWHnqZ1Dp/HRMDnwoYuPKhTTV7Ly4teiQ1o9kLn?=
 =?us-ascii?Q?Rq+OXQJQg0OIhuRUO/JmF5sj5v8Zos56RUx7dxGmTIZvLe8ScQGrPjUAj/8n?=
 =?us-ascii?Q?Xc68nODNLoo85xhj9Xax4Zne8+FgMs8r6kpZubz8S18AzScZhv4N4FX2ULgU?=
 =?us-ascii?Q?wRNTwEFlqwhcfSVxDSkfhy/lJopunMDINz1Ige/mE0kMh90evI3hyFuVXoAb?=
 =?us-ascii?Q?GXuK0JDkD8VCowN0dPJxmKrAmjomNbo5y+rqVyL2rtWhg8wm3s5mqJw3Owlc?=
 =?us-ascii?Q?szvPDCJH3gjzRoYoMoX38KVF5kjeRnlIbcNph1T2If8QpzF2iZDqx8H12gOA?=
 =?us-ascii?Q?ab2pWgnEVNBbOelwzvNsfwViV38srVM0bAWGrnk2vv7v/pMYq8Toms/xHPqO?=
 =?us-ascii?Q?31QCnU8dCQCJekcAxn7Wk4MDXDqjXRw6Fz8G2wXECxe/6qQI727KMO7JyzJy?=
 =?us-ascii?Q?RBIgcRIqLlve1oXqxfwc3sDMIMPqWS3veJPJ2vg8lycB+arF9sgeI0kVJKkh?=
 =?us-ascii?Q?hQbCeKB4AAa2uhu7nOn4uWpaalx6oRhaRp09sy7TBXtxs2+osoA7JEYVn/An?=
 =?us-ascii?Q?A9dsLoq79p6UGJdjp0jXl3bvQs1OdD81UXQ+msOWBnxab1ph/vVqGFWx4iAk?=
 =?us-ascii?Q?wI6R/oK4TPCMJQzgoRXHjqa5dc/T9g1aruehXYp1XCcQArGP+/ei1t4bpyNn?=
 =?us-ascii?Q?jOej1E7mA7s+qZB1SQrgjTSMrkdrt3N0fcEpBg7Q6DrUy7mtsFtekdV1PhRm?=
 =?us-ascii?Q?VOExWtTe8J/ZwU5dDS845JfbzjvMkeIa9bspR0Tx5lTZ5Bp9/aQwnBY7G2O0?=
 =?us-ascii?Q?l/OFWqYoU1CBY5jnYwr2eDgXPucuQfs=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd23d6f7-ca32-46a2-4949-08df0fe4689b
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:09:39.2779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZ730tArmQjARUmVXA9oFgQ3YDlpbQ0QCovxCPSJdnZ7HDdON2fhS1cQ/XnBEX1LfIebsvhmQwegc8HgzH0nOIAQ6CjGnhPNjWlQjR0jD5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7140

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Add a DTS node for the Synopsys DWC3 USB3.1 controller on the Agilex5 SoC.
Place it under a simple-bus with a 40-bit dma-ranges window (#address-cells
= 2) to match the USB DMA address width of the interconnect. Enable it in
host mode on the SoCDK board.

ref and suspend both use AGILEX5_USB31_SUSPEND_CLK because they share the
same hardware clock source on this SoC.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi | 35 +++++++++++++++++++
 .../boot/dts/intel/socfpga_agilex5_socdk.dts  |  5 +++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index f54767d1526e..523f722a2a64 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -493,6 +493,41 @@ usb0: usb@10b00000 {
 			status = "disabled";
 		};
 
+		usb31_bus: usb-bus@11000000 {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x11000000 0x0 0x100000>;
+			/*
+			 * USB interconnect DMA is limited to 40-bit addresses
+			 * (1 TiB window from 0).
+			 */
+			dma-ranges = <0x0 0x0 0x0 0x100 0x0>;
+
+			usb31: usb@0 {
+				compatible = "altr,agilex5-dwc3";
+				reg = <0x0 0x0 0x0 0x100000>;
+				interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+				/*
+				 * ref and suspend share the same hardware
+				 * source; reuse the published suspend clock ID.
+				 */
+				clocks = <&clkmgr AGILEX5_USB31_BUS_CLK_EARLY>,
+					 <&clkmgr AGILEX5_USB31_SUSPEND_CLK>,
+					 <&clkmgr AGILEX5_USB31_SUSPEND_CLK>;
+				clock-names = "bus_early", "ref", "suspend";
+				resets = <&rst USB1_RESET>, <&rst USB1_OCP_RESET>;
+				reset-names = "core", "ecc";
+				iommus = <&smmu 7>;
+				phys = <&usbphy0>, <&usbphy0>;
+				phy-names = "usb2-phy", "usb3-phy";
+				maximum-speed = "super-speed";
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+				status = "disabled";
+			};
+		};
+
 		watchdog0: watchdog@10d00200 {
 			compatible = "snps,dw-wdt";
 			reg = <0x10d00200 0x100>;
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
index 1e9b87d96765..aa9294494421 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
@@ -109,6 +109,11 @@ &usb0 {
 	disable-over-current;
 };
 
+&usb31 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &watchdog0 {
 	status = "okay";
 };
-- 
2.49.GIT

