Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013025.outbound.protection.outlook.com [40.93.201.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AF0423A6C;
	Fri,  4 Sep 2026 08:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512027; cv=fail; b=AZKYDCI31EFy0D4jx9j3ljjY+XCijIzUiNGJ2U09X8O+4Gkht1ewTHYBrpVdzU6lXRParsVkvSc5Hy/fukjh7xD2aKQsP9lW3quaK4OaVWeb87lKGOk9nLfx6FQAWoAfUpJGgEhfA6rPR/kOt/jHOmSGWkDg4MOh6MX8Jdm/m0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512027; c=relaxed/simple;
	bh=8XG+oWRMJQ164B8zSo6nkO785ckqjt+45U2RBhzGspY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ardrzCekGLodD5rh8o1cvb0rvcafkEqtNnqSWR8o8hbz1GK2Mzy2i9Ar+b8pTD+PiJvn7JxoHVkeuX2boZ7i458IMdM8q28g5mA+kQ05htx3r0xwqKe6yjSclyF8lInUj3ModkOjGSFBhOnnvIb90wvFJhoI3fU4EQB0KCHddW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=VcnBKChJ; arc=fail smtp.client-ip=40.93.201.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="VcnBKChJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDru6pvAIR6T/UIGGwNDFHWy3zL5hSLZ02pqJDaPAZFgl8P26ENUhLZq90Nz4TuvK0bqrOo75zPfw1M2xz73DHQUvHfSmXmGzv/PtlkOg4P894yZTVTjeH1e7ORPt+COkEORbPtr7x7iGf5EEpSDvABKphSJrD+gdlwSHsGaqCadnYyPG3QLwb4wuCoLU0ncpTBAEaex2avbVTUWnK4GjkxohGu+BP8htQI3Srq01Toj8cxDOCnS7hN6KAGrDjoDp0tWG+BUdICYBY40OZx4+wl+jiTIEi0yIyf+izM2L+Sx9D7prjo6GCLBB0o7uRUefBF58FGiRa0HlHYAVg82gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toik+hmkxcvUj4xJ3Xm2EiEFAg4neokMEBO0iUWxuyw=;
 b=K2GXbo26VO8H0o1tVGAN8faUdKFIsk5ywmvufjsR0VKLhgJvty5G8NnTwB808O3v5AICNQvLMInB8T/wWRnAY3E5XTZhHMTcPluW4ONZs5+8BJ14KRFIfol6KwsfLwDh889UozrZOlyn5RxN2EBisOzrpeGjZU0LRGZoSnijNoXfcz90Qn4JuXZOBQuYYUhflzf+DDk56EKbK09UembheN6nSNIvigHFhN7W6G7yRDjQbkx4thwyclf4g8TB5WnDugaI1gHBzCKFY89oqGiW4fcXxz7AZ/AU4cPNmPUsNOMKCTMvJTkZOnpTwwhqN5DpeACmv0VpLq7X+XCGhOcvIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toik+hmkxcvUj4xJ3Xm2EiEFAg4neokMEBO0iUWxuyw=;
 b=VcnBKChJp8oeT0X6r6cEeOiKpIajsp0SNjY9cPpkPbafldC/iXkngbSod7jqUV+BmKy3uD3Sg7AOj/uvwcRuySDF9eSA3lVC1NJcQoWXgvdb/G88AyRvSdiddiNmm7laW5fHhqpAJOIqtSsGQH+enuN4dYW96G1llmkv3AiscyRrmwZ/4MT9EttcP0fEaSnEePB+ybasnwCLnPCFPhMdnXlNGs4GMg79O6jSlzViSGkypzfWqJci7fE8eep2rXadXPBH7mvHFex5Inkw55BZ6k9R8Stfye32myI17lpbIApc/6Zq5I40U6fgyWKHfjx/DiUDHzTeVE2yNeR1xQ6JdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Fri, 4 Sep 2026 08:53:42 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 08:53:42 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v4 3/4] arm64: dts: intel: agilex5: remove usb0 in Agilex5 SoCDK
Date: Fri,  4 Sep 2026 16:46:12 +0800
Message-ID: <59d9ac8d873b3792339b6ddf8681dec8f963f24f.1788503540.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1788503540.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788503540.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|DM4PR03MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b56f09a-5ce6-42e0-6fc6-08df0a620570
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|6133799003|56012099006|11063799006|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	b9g8hlRO3sS+UXUQsq7WPl/drl6VPrCBLRJmNfkzswIg+JgGh7YlkesRb5FqYx3d1v+E+IVlEakHCbakTjub7wcnExXBqesNdKJ0C2LBFrABdOu8GH8M4vwSu37oTmAeYbaSScrowCC5SryagJhk9VmHYm72ywpRMly6mOc4y9UZNFUr+/w9ZE/l+/Mya/KuN64h4gLfIlUG2MDYlVcvfrJw5HLGFnusQiMFyYzH6+znAZVARKqxHvnM1Ai+ePXDSOiH1kMX6qfsk4DG/Vo686DB2a+lxzndlqEiUFHGlYdiAZFRV+oMnEfTacAlXM5GyTsP4ZuNlmCUNndoMbRKYgI+Q5UPsxz+9RNpW6OKLpSDF+/scJDGPhyzAOy9fBy8/gORevJY0iLV4/A3uUlN5+TtfWcf2bGWj+/I0NAWY16Z70UPKS0l8U7EuxadWouxzy5jrUWs+XY/zwdHK/GMDWcy21pzkSO6NWwAJM2VLzlK1ejCM2lOHmLEOPp6pNElfb1ZxY0B40rRbvWpRiTckjetvnAygiiNYV9C9k6OMihmMZQzNCLFhMxXdM2U9DaZe8zEwqzSCXgv7s05VFN04ntTKavJJBGHCvUG/TVziSDvL716t5Nh2VWZsyU/blilyulPfuT92DU8W5E/p0CBgS0hBA83gTKhaxhaJEoQ/Pc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(6133799003)(56012099006)(11063799006)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/dW6zEtWu3e+v/sxrjmVJ9YvmLbzHFLLJUM70fLelTnCLb95/58x75dTOX52?=
 =?us-ascii?Q?JQpVMFyQwGvKVb7pzxpxcthLjb4fnOEiZJTrM4PfxIYqh40MQlOxVR2oGe5d?=
 =?us-ascii?Q?syxAZ6c24SZOuBGv/8YtQyTW2kNHJA8FEOBLwJAxKps6rIrPgSWyu9paVf5a?=
 =?us-ascii?Q?tRlEO1nvaA/rDoQrmQIsKmjLEe9Ia66BPKjBa7WZDunroxiPdMzizr9wR42A?=
 =?us-ascii?Q?SilrQFIfxWwdRoiA0AsafOSyEOStAcj/UJYzHME3kwBPVpm+eYcqKfAWhjbV?=
 =?us-ascii?Q?wqsjjpmxeh5pI0Qs0rEk/5SMf+dUOQmRf9uqoW3VUJhFg3fd5vjaqGk2VRHZ?=
 =?us-ascii?Q?CKTQjlCY3H1ywGxj1awNxXHUfpuXINGsl9cinxFQR/nrrET3gCeO0Yv/6622?=
 =?us-ascii?Q?x1YMOT7GOjtpLbFRtIZYzvHdHnaTCbVmUU1hL7S7t9IINJIKRifXNNDlH1H7?=
 =?us-ascii?Q?+3UYFjquUTiKG+cR6bF0vFo5XSuVb4OTlwLqRiJN2oFlbWHaWQRw2m5qAgqy?=
 =?us-ascii?Q?n0a5ra+T0n1zwrCgtIIoE/oOk2R8r6gAd0TjxXMwDnURrrOWqrNJ08s3/Ege?=
 =?us-ascii?Q?vaMHG6KSLGOPqk8i9qWNfdkxXVAvbHKG/6JXV9hhZae6MqYqOU0l+uue2jAR?=
 =?us-ascii?Q?+b1My8AxXc6ZI0VYzLBaNIlR3W9kKw705YmKJibrLozk2O/dh+d+oKNjderS?=
 =?us-ascii?Q?2xcrYSMSR4pMmvFTZu8sOHpAVBClVxWmESoXn2CKLW5rV+jqVLOBsRlpsnY0?=
 =?us-ascii?Q?D7Q2mrKY51Gkl4+iINuBso1TeRxyI+mzzyjhjgQfdUvuSfeKjD4sBy8X7PwI?=
 =?us-ascii?Q?2MZM13AeodwLIYUwHS3nqdMz8s140er9pmM1exmKH8xnBA4lvpVeih0boYIN?=
 =?us-ascii?Q?vS9kBKHyl6M3ID7Kxh0VxU2+tDUcejR5FDV0GvRxGr+6ARM2bDnytku+4Rkn?=
 =?us-ascii?Q?jbb1LuiujWs3PQmzhnslCgb7zlwK9KyR/zVE2/iwWAZpmoEWl/ZtSScLKpY1?=
 =?us-ascii?Q?flCnHpWoQms5XSXDQY6+rk+2jpII0/6t5Ek7pd1M1gTKL1pFaISadaYNC/n3?=
 =?us-ascii?Q?FuPlSYy5lC5YopJokJlk/mLR+cgs+sdEbJUfVLE+GNFk+beCfUTgYu3rNZos?=
 =?us-ascii?Q?3Es+S/Vr00PXM4QBV3A2DkOPiqS+0QewFnbWIQ6tuShZt5ka2/idNiZ+Yrqb?=
 =?us-ascii?Q?lh6PKGucgj/POrNmRyyyJGm8Po6yuq+hc8W3i/lgNu+zMvkfJ6srbKck5Az7?=
 =?us-ascii?Q?xSoDUI/opntIzLa7Gq7rEh/SSFuy44Jcv5KpTjEjX3hDoy0CiHoPZ7ckPKMs?=
 =?us-ascii?Q?zHUKRUJWOSTWCvC53V8SWYTv6KWEI7APmBiTcSnEQURk3aSFKaU1vG5Qgsmo?=
 =?us-ascii?Q?4vHILbrp/ItmwdeM9KP2LwVx+AszpEhGil4qt6DnLJr/aTQnAt64yV5lTJlw?=
 =?us-ascii?Q?e9sBzHqEwXat+3W5YWGITIkfnfUMkMvgcXbTMyvcLQg/BHz4M+CXXYrV/5hI?=
 =?us-ascii?Q?GV8ceZV6HJ24PAbJWrMTH7r4s0lQ3RJsWJN/jpCPKaqEgPYhogePr2AJWEdG?=
 =?us-ascii?Q?5ouwcn4mXRTsjNdaIBFh+cpwcwTAAO3V5A4BtPLgVXqDeiBgxsjcyFyYBoJG?=
 =?us-ascii?Q?7UCG83MVIwiCbPxzRwpyMQScvDV7DO8plV1SkpjtD6uBT0LL2l+Q7JSwIagl?=
 =?us-ascii?Q?yyvRsOKsKRfbxqFbAdDyXw8UTA//JACDuIs0PRP5Ct4PvLkXHv7OtDiLcMid?=
 =?us-ascii?Q?5MVS/YzrGjOLaHRs6lqWdctK42pkvgw=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b56f09a-5ce6-42e0-6fc6-08df0a620570
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 08:53:42.7513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddUvcEHO3yBM+7VZUd77Wlrsc+V3Mi2P9V1bSuH/Yj5bUx/YvYZpBmKKXqm/BB/vvANHsKkXQ7AkRvOz4fjAlI5pri9eVV+mQGyYWKdwhxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5981

The Agilex5 SoCDK daughter card only provides a USB3.1 interface (USB1).
USB0 is not connected or used on this board. Remove the USB0 node to avoid
unnecessary initialization and potential resource conflicts.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
index aa9294494421..c48867cc3043 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
@@ -104,11 +104,6 @@ &uart0 {
 	status = "okay";
 };
 
-&usb0 {
-	status = "okay";
-	disable-over-current;
-};
-
 &usb31 {
 	dr_mode = "host";
 	status = "okay";
-- 
2.49.GIT

