Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792657285;
	b=QHy5vXkWjjSbuGJMwbZIRMHsRDCRVPUdbYUiy0j05YI3xUussF/Z04xVleeazoIH0axS
	 cT3XiY8xWPRX5GuIAURZ+cDj3JBV512K1RBrxPoQ7WugO3HezZIOQv9vqxf03XIsdV/BZ
	 l78eZm6srHGnCz1+pCuZ1AZ3PVDAByf+W018UP9LaOcuxDmCmtSk9wwUEkyht94ZI/T4M
	 w3MZ+FrXeZ8xqmKu2gupd2lfU62tcy638I63rwPItodpPSW7n9D6lGcJFv436kiP7W1uD
	 e0ofz0AmdNVQ7gu4cN/NUrACsWYpKvV3TF11e6Wsjs1Z9cuqXoZaOFyjHt/DLLmiUTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657285;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=h9OJwcG9qRi0xsB0YguRb+3oNU+Aags6NBzXoSejx/8=;
	b=0GEvFhdIMcOoEuMYSmGdUq5GgVUS95QR/1qwU7tdew6CE+rf9gxMLiTR1MfyxPrWw+sS
	 XkDHT1ibn6SMMNHfIjuQf55fBLNsRqdG5QkmqW5zqvUjSE/z3DHfVa1eXehiUV991HXEa
	 OlT1c1PjW2Ps8CS50khVAs2gv90Bk8drON35pqGC32Olrg4c1me9EzI7hDRxj4lPmTBQn
	 b0crgTx2UmyoRH8TNivQreBTs7kG5wl8ARaUZ3bWn5vJLPfzmRJwioeoIUWZuVX6pSO4q
	 rJa40IjOgBnFz8UNh99kM6Ir19e1Z3cDEjnNL4JyaoY38rTwLs8wqCMz7pQQMvLMjZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valinux.co.jp;
	spf=pass smtp.mailfrom=valinux.co.jp;
	dkim=pass header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b="f991l/F6";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.75
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021075.outbound.protection.outlook.com [40.107.74.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FF5606A319;
	Thu, 22 Oct 2026 08:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12FF5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=f991l/F6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZouIXADgrPMAkphFJdrUtrizXfSC4/wTKU4Wuh3dK+tZrEa2FZ+oT8yyB/rOD13fHS3pdr7lTQTx9idD/qOMQgE3NQAWcstbU1C8xpkoGF0PD2NMpVwlMEgTOa0TWyGRjxAhlPV2bNXBN2teXH1gPJUNdrjv/O2ile0tffaMy8EK19ezD9v4nPbTvf42XKevmBB7mCVG5PTup/fhY9gUVnoIAN7EajZZtiUml+8mLE+lnhsW7P+0AHJhaM1DHj1qRB8s5XD6SJ9/jlbaHnnpdLGhQRR3QV5ciLFYzFO7LciSmU1S6RniZUTWTxAjTnU061jbS0CKxmJquneMwjEd8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9OJwcG9qRi0xsB0YguRb+3oNU+Aags6NBzXoSejx/8=;
 b=VCV8kHY/zf7du1QE8DFuSzYbT3JgpCMrjJ5qBAJ+MIOZgg0zZPQtI1tRZMVA4+sdjySVonROOUM9trCas5M2CL6oG92O+nGbws1zGpJq/bEEGXTntY5TM0hk5tFqLbEc4Ii77C6B0OEAKb6i51SxK9jMWDx6BrZyruaXVCdolIpqf86Q6uJdwUNBbtI3yjt90kdHKd9mRatEcgsJuyUbF44UPrfhliYtn71tPkY6gI++WAeoUk/Ke/brN2klMooZ4uWYWOnrX8+P4hZytMnkG5yXEGzl4t4lVU3EzToBFUEOYDPFWPIFY9u8EDu9NqDj/dN4NWzEHyz+xpsOaOg7+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9OJwcG9qRi0xsB0YguRb+3oNU+Aags6NBzXoSejx/8=;
 b=f991l/F6mjkGDLAL58BbwvahytUH2ek62+1/Rr9auzvF5tqzB1LXt45bqn+54uygD9NEuU/+NsErWqbrReqCH6b3x4C7wGcFUMNZQKq9kmXIDFZFQc17+6UCnIHhI+h0N9tlPlY0Yi3fpBUd3yYhoerE2208qSJ6lm2mSH0TTMU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:325::11)
 by OS9P286MB7221.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 08:21:20 +0000
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9]) by TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9%5]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 08:21:20 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: spider: Add overlay for PCIe ch0 endpoint mode
Date: Thu, 22 Oct 2026 17:21:13 +0900
Message-ID: <20261022082113.3163666-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0077.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::9) To TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:325::11)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB6866:EE_|OS9P286MB7221:EE_
X-MS-Office365-Filtering-Correlation-Id: a1388b28-5f15-4e8a-f38e-08df301573c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|23010399003|1800799024|18002099003|10067099003|261021121427099003|261021135927099003|260925021911599003|260925021311599003|260925022911599003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	vUk0U47ZpHPpV4/4eZ6Qd1aKs6zYBIh9h0XyhuDqRb7QZxpZVxUz3tmtaBO4sTYe/oNyg1Rmzaj1YrqiQ+XjZ6rMoP2jafSJr/rXPqqfADwt5PgklT7g6/QLJsVpZAwJk/i0vXYgRv6L5QfWotG40Mv+XmC41I4emtAroF3lxOMLmzp39m4We9VJU67bC92U7/ctCVQjzj5y2K1RCm9um+CnhAOGVXftIjzItfbyfRcc6K6KUH3rHaQfFa5FTFnO/3WAVq/ZNSekbD4+LCVElAgIsnIr3wMLkGVzgpMLW6+j04tRBcdrdEOECrRjSFPVfuV3wQGxffLse0btBoiWweT89uuVQJWmJbP8uld8C2tX2L/VwhF6gxcMJmiyc2p3xS+rGutu9fDvDEtxBb5J/1+qJZJqLU6pNdxF9hNPUf/OFOq6KLJJV6LhM0qmWeY1BhYIOlStS3oHqjUVi3lTmGGR34zPoRhQ0dS2CjZijzuXGV6mlKlQ1TSM/aG5gbdUadOc/xy4mj3FHJJpiM0YEGKFSy7975P2Hys4PvxoVKkKVr0y1qHBIesVghZFDmMwpZHSiqmNy8id9On+sZ6nK+I+hz45R/nBHAUMS5F9LbdxFw6+g3MJyGUTs/E+CDQ2WQsLMPW2NfL/hgQR6HCioySj5MWrsom0J2mJl8CqaZw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(23010399003)(1800799024)(18002099003)(10067099003)(261021121427099003)(261021135927099003)(260925021911599003)(260925021311599003)(260925022911599003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QNLfkCC5SacNaT5iHLH7DLf6LvRmf6NGXbyDTILz5krQ7cE9UUbWIUoPGcLD?=
 =?us-ascii?Q?eCatYcxLfLLzpuFTKDcPzaj+5UymnVHxhBQgRw0PtXvCh1FJRuGuFSseDoFy?=
 =?us-ascii?Q?J9srjbTfVrYr5s0GWZ6mOTbtNJHzelCbUYWbbdRLapQpDllnpACpM0ueStWj?=
 =?us-ascii?Q?2HV7qj5GnlJRwvknGRL05zf/9n1E4d3tmyEa37HhMOhYbZUgoh5PJVp2ppkL?=
 =?us-ascii?Q?0XDljSB+rsSVfn9G8OBMjBmPGKvWLj3hrgAmfJsgBiyfnTj4iA66vZYCyzwu?=
 =?us-ascii?Q?c7Wvq/rpZpBpbZ1gRHBj0Rro5t+0SNBMPy6jOhYagOgHBjxmB86AZ1oekNnH?=
 =?us-ascii?Q?pmAw53iwGRkOF/EJnShEpBgrvbtdFXC7XJc4eihqAS+KN+kGXQOVx/55hWmC?=
 =?us-ascii?Q?Pe3cgfaaROrtM7WER2mBPM5kSchxb+KBQhaGyd1pHOp3CC+/0NL9VSBQvRLU?=
 =?us-ascii?Q?aERB+NUcoErUtoHfMSMuf+ObynVnQtDf9xt3rw2NMkzG60D6+mF9ctSUwWzF?=
 =?us-ascii?Q?O27AgSbPeMdWj1Tw0lywQ6cR05k6zNI7A0MFY5lU2iYxHO+yqsPDiepdf55r?=
 =?us-ascii?Q?p56c+4lvd06QhqVm0h4wDxjcaOmOPVk3LUPbRH/2CwlqclWdd/LESLHlXdy5?=
 =?us-ascii?Q?CF2XbIdPkJp8G9KywNzgIMnbKlPrwSkPDtxTY0bj8SH5DuDVSAgpcOnjxImh?=
 =?us-ascii?Q?fT8ngAWMHemUr9ApBaOVUXIWAdp0gapr7JHKhGXTptaNKfNsQBb7iwMKE5KR?=
 =?us-ascii?Q?WfVVruja4KDMu8mTFRdoE1YXgVNQIxdzD0uRGzmn9PfGY96KKwPoIGTW2dQ8?=
 =?us-ascii?Q?0OUjFuny7E+4D+XVJPT0CyNEIf5liGhK83ATU63XfbPwyj84JIjpiOfBw0bP?=
 =?us-ascii?Q?rMohqir6uYlARzSFofTBykfmEdy3YTZD7UMkdaUTNz0tXea4DFcLw6+lwRlp?=
 =?us-ascii?Q?k1Fmi5gJPcczq/ivk+U5YTxmNaV0k1ii0dnIqTlnJGKHfhrtiEwEPe2kU0pF?=
 =?us-ascii?Q?Cx0cCxRiHPkpzcbPbT/aRmF6H6Cf+TSnjY7kwepBIDerG1zPQqXJRfJcVMrx?=
 =?us-ascii?Q?9AXZOdKwhWvhrctU95vi3ch8w88aLOb4jKFyAk/aUrx1OTqWrSmFbHMvqDtk?=
 =?us-ascii?Q?j32IgY+iNVrvetN8CNhrLZynDXoc2cfLAR2lQRjDkwpkGJ3HVM1XpcmB5I8y?=
 =?us-ascii?Q?c/Vzv7AKLpFvnAPvDZle4C1Qj201aUQPDNgzGetjsgA1kLRbyt/COExdPaR0?=
 =?us-ascii?Q?CgheYTKjCT0rr9dYTAOgF/c6kzdgUCi51ae/wy6U59tR4FtjXz9ku9rt8csO?=
 =?us-ascii?Q?tFqEBtRHbjq2+y6vLq0OPj04KFIMOAZYoGrJVXHQHmYnR8W082+HD7ZYxB/i?=
 =?us-ascii?Q?uRJgtZw7+w6pMLh4cP/4DZMNo8fDYxYivOjwTaM9YLHfmLsiElOGvOPA9XBy?=
 =?us-ascii?Q?q7IvTKMRHA66H/007GH9HtxYOeO/IKBtesvubcvLgOZj6BFIpKvIaWM6DWUp?=
 =?us-ascii?Q?9VbP4LnuovaFfVaWYKBghKzPTeA1DXnkTADaRKKbRZjPe0+eoK0YyEtPTjDF?=
 =?us-ascii?Q?ZnsO+i8yL2rnkarxgzJFhFNxopkETS9MZTyUOFhJtx3h7J1KbO3ZzGTHBQEp?=
 =?us-ascii?Q?B1XfReVBWk7Tqd7K6YlbFLBTp44et4xJnVjb2RVBu+8QOO46ppkNhhFvyuAw?=
 =?us-ascii?Q?Ee0JEGdP2Y3qM8n1hXQOcnlVii4dQM/wfNHNnmR0z5TSH+v4nyKBMbzvhJzg?=
 =?us-ascii?Q?Q0UeozjibpPdldqRiJypMTPqlyCGMq/Jq7FbK+yoMJoD82/Vo9l/?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a1388b28-5f15-4e8a-f38e-08df301573c3
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 08:21:20.6055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4flfaGvvN6zX/6juIfmtmkdOkD2cAhRH7Qz9RToECvGV+3nu37aKOGkM2KmrZetTNTi4Witc5T5sUg8Dsb3YLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB7221

PCIe channel 0 on the R-Car S4-8 Spider board can work either as a Root
Complex (the default) or as an Endpoint. Add an overlay that disables
the RC node and enables the EP node, to let it work in EP mode.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 arch/arm64/boot/dts/renesas/Makefile              |  3 +++
 .../dts/renesas/r8a779f0-spider-pcie0-ep.dtso     | 15 +++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f0-spider-pcie0-ep.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index c6f3718cd19f..2b0012118287 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -86,6 +86,9 @@ dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak-panel-aa104xd12.dtb
 dtb-$(CONFIG_ARCH_R8A779A0) += r8a779a0-falcon.dtb
 
 dtb-$(CONFIG_ARCH_R8A779F0) += r8a779f0-spider.dtb
+dtb-$(CONFIG_ARCH_R8A779F0) += r8a779f0-spider-pcie0-ep.dtbo
+r8a779f0-spider-pcie0-ep-dtbs := r8a779f0-spider.dtb r8a779f0-spider-pcie0-ep.dtbo
+dtb-$(CONFIG_ARCH_R8A779F0) += r8a779f0-spider-pcie0-ep.dtb
 dtb-$(CONFIG_ARCH_R8A779F0) += r8a779f4-s4sk.dtb
 
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-pcie0-ep.dtso b/arch/arm64/boot/dts/renesas/r8a779f0-spider-pcie0-ep.dtso
new file mode 100644
index 000000000000..0dc8aaf7a3be
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-pcie0-ep.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&pciec0 {
+	status = "disabled";
+};
+
+&pciec0_ep {
+	status = "okay";
+};

base-commit: d99e991749f3b12a3a8b23224725dbc1ca15f6bf
-- 
2.54.0

