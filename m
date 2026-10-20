Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792494701;
	b=1gQ6Y/m284v4OcKjyT2opm2iJQQ6s3UaXGscmZ2NrtPYxXzaJi9qYzM4vygbrhoNA/P8
	 tgSDgv9eMBG2tqHIcMgpGHJTJz4H+nGCduK2lD/VbcVQqkOILmaHmlP/EX85oYXiMRHXX
	 dKvOn0dX0JcFS+PV6DqIlvmm75fihfmIOUaVmS8hXGghXi3/PsDVfQg7VUosIR/vxqqiC
	 97HJZ3y3wRgIBn/bG1jGQOY+vGFJplbyTdCHba613JahLuK8hvDivCbs7PvQOolB6JPPW
	 WKeMwASmvwWjbnM/GyRsR1WVJ1i8S2NLN7PxygiMrlE3SykqYupXLebuzOx9ixGg7Hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494701;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=uFeI3eOzn9Q8PN8lIwYRj3dAsVx+dzVqgUHf+UMhBGg=;
	b=EXIqbw7BGeEwslhgQdZOkCQOeQ2I5M8Bb35Hutb49tCTf2WxCyy25aqHJuirqO5MmaP+
	 +Sf/dpMZAXZxdsT7neryW0M3fryT8g0EgcIiEFgIaE1BfL8vBdfRvepY0eMBB/gsamdNc
	 R3G8wLLMcMaNGyrK7aiyPblswxctlxHwaoYLkNxVXVffVm0Dk7XdhmLxi6EshTyXmvgjO
	 IEIrSDRcsbzehWSH8YkJdlJOjmVRYpvUQOgQPOA8C2YPG77O0cBG4/5sRB4Gt1W9etjHg
	 JMciLZZM8wD5fu9ufCcmqeDeWhYHDGNWg2HA3eiG0/VktRX2+v67JhiXR+LKEPv9fwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=crGhKwZu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.46
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010046.outbound.protection.outlook.com [52.101.228.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8810B60A3809;
	Tue, 20 Oct 2026 11:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8810B60A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=crGhKwZu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3kyTTrH4uODD8ZDco5aB4LZvqdh9qFjeEl772LRU2qbzpI9eN6jEybt2ASHE6i8G2ebVBdNB7umAUOz+aX0KwixdR3QAV7/sbsOARynKF8GarRFWZ1TAY1m9e8L4Dv7nEvcy/Ec+6rJ/RJrTvVKZVzMwxX1ZnzIctbQXlCouZc6g/NE7vNcNI5xL0axk+fzfg3QAONX3EvK5VB8QwiGLu3RJVPIFf5pgwc5/uORV85j5Uj+LWgnXQ3Qdi/F529OPlbxQOGa2vUp8RJjtNtOlwPW4/dC0HUYV5rUy6ukkz2vTxOcBnOJRQpHiBkMXftgfCE/igwGJioejy3JCcPjAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFeI3eOzn9Q8PN8lIwYRj3dAsVx+dzVqgUHf+UMhBGg=;
 b=HyvlP870e1Spx3DQ0f1mcJgxLoWZbYn8H+T9claXizfBvxwHX89HKyMLYgdvpCjY7fNcbbR7VmBBz7djgAYsClDQU8RG+a5IybfCdSR/42uS1DQyHibvBCrAfNJPpC/Hloilpexz9EG+wl07/zdrXZAa/2t+xjivDWN0DsWTNI2NN0dwjmZACg1aLHUwV/GEpPvuvezp4y1sCZYlg2IIvlMZ1lIWIpcEg2YoycRLYE7/Z2tfl8l6DJH1BLzmCg29n1rMSivMG2AojwCli0vBKTcqj0iX/OkmZcmf1zKoEkSNKOvFa5PWttEUPC+3lafOTxdLkOlxp/mCLCMZfs36Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFeI3eOzn9Q8PN8lIwYRj3dAsVx+dzVqgUHf+UMhBGg=;
 b=crGhKwZukKNV2fQU8XLzVQc/Frv+3F5ogoEKV/gxrLCARnp/CnrRoz/l2dUKOKBcepcg3QQ4YufdRX0SO39f33FA31DTl0+TBS2QXTTxF2n9N0NKWkbH3Tp41PmRFzAJ1SXP5FXBJ0DNpzYoARzLI26IlJfGeNIC8EC+vkE6Xl0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY7PR01MB15038.jpnprd01.prod.outlook.com (2603:1096:405:244::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 11:11:38 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 11:11:38 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: renesas: r9a09g047: Move #clock-cells to the RZ/G3E SoC dtsi
Date: Tue, 20 Oct 2026 13:11:06 +0200
Message-ID: <1b8094e6af35d4844646bf2ab58f434874f863ec.1792493096.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1792493096.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1792493096.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VIZP296CA0004.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a1::11) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
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
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TY7PR01MB15038:EE_
X-MS-Office365-Filtering-Correlation-Id: dff13a12-f0fe-44cb-1062-08df2e9ae92b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|52116014|22082099003|18002099003|11063799006|261009223027099003|10067099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	Sk5vH7Ie16ztDY/eEmo9Q67BC8TYMWkRMAs53zB8IH7FSCYYWr/qgMTrYIaJGjdGVNIvZIpf725E6dQzEscIlENtXgA7ldgr+reX2mqmhI0UEq+H2fd4kWCO+VryTsQuAqjVgCmX05OyNzb9UNaLszu5heK7EjqJW1D5w5ww+oLWmIZtkbHQ6nUhv+JEe4L1hPtsbjTxmCZBamlSynEU6cBzv8ys3qrrW+ar5EXjQziS0GOoGvW6AOR39OY8N5jMun/UAfUQRfNM2aCTJf6zBCW/55HiPRhaCJmmtMOrYlyI09iW217H1HyIqa8jqtLWsbvgrDEe5ZYTQCmpMj5QNE4vmMtm+0KjmOvBkug8sZRmkZGM9+ESPB3zZcJUAURUr9ZErJH2KdT47LugzwwqCIz82YMfbTcwf/JUFGg+V0m8fyv8jUwI8wMLg5jNKoMtGt7yZ9KWbsfZVHdrPKv8f3cNb49X4W9xSgNm9EDlKuP+q6mJsc0UMk9aIE9eMMIY42m8Ti4dMXjs6nART64qA8IvWTX43bX4+OaI+wS/X1iyFpCoSlSXbdPxf9mtrwHwYp4KKPftZdhSuuHzJOHAgbU5SuBPjKMVaG7NKLKyZLxcZf7/5F5gvW4bd1auEygDtwUbYDWxTKtPYlfKcYfeCtwHOUHCUAgc4Jg669xgpYK8uaCE7DZAF4W8NPE1Yk33t+6dD68Ly4E3GFgT9SY8mHf3rnA/perOvwBQjonH8Ek=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(52116014)(22082099003)(18002099003)(11063799006)(261009223027099003)(10067099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u6sXXEcNdfaPhwbgAbP0w1CrmPOfcHjzb3h4NSxRqwYpKxC2nrf4a3i1uOa1?=
 =?us-ascii?Q?qJvxvFKjPoUHJ71lTPL+90qk3PgfIqt7ZUb06IHrx4RwBAsdvJkyQ/v/vO2N?=
 =?us-ascii?Q?0JMUduOl4pauGCwRIuv/1e9OLb7NZl705PrA8k++Kza43h5Dg1+9ReLmJDwh?=
 =?us-ascii?Q?M8e4MUShG3hCGbldXLVvksmplJlP2TzUugn4S9qeLb0hcdpVNFh+E9mRWtWE?=
 =?us-ascii?Q?DXpuQmK/trF0P0Wjx3ckN3gu7Ceja4w8Z0TxFd6ExYR4vjsgG452wNvxiR91?=
 =?us-ascii?Q?Pku6ekhQTI5xV2JuPDAe1PofyMXS5EqzqtAx7PBNQ1UVYLhhDiRriQGVdTYF?=
 =?us-ascii?Q?kv6AzvF/2bhKvTjO/NXe5NCiCwEt3pvHHRmP3ypBaLCp/2Y2kMxTdydMkFgI?=
 =?us-ascii?Q?ALubcF+SGQeAG0c5ofryzDlHduKcI6Ii1B9MwSqHub6JOW3U7WSddS+2sdi+?=
 =?us-ascii?Q?uW8fMt6QuBwW7waopVfM2LojTZ0K85pbNE+gZb9STgaVuqaEJfVS4KKli+l7?=
 =?us-ascii?Q?3/NuH5Qp3ofJhaGo6Yp4rfKmyn5w3PxUMb8Q7gS5LxxiH48VVkp9vSwZD1LE?=
 =?us-ascii?Q?st9Y8QzGOlY4XStkYsr6F875dHL4PcAQF8Zm9JYszuNzNqLxyx9a3Zl3vBxl?=
 =?us-ascii?Q?QHdMVIFUecgRAB1HcmuM/MzY8L52Na/GezkQt8pU1N22a6uY/yMSQ95m9kzz?=
 =?us-ascii?Q?l3iM4TupiGrL70rnZCTHFPudaHO452Kk30hzuaEMC4sdCeLHwuEgnT4f/9/u?=
 =?us-ascii?Q?1io0tv5pt5Wel6TwPMtPo/oIlcrirLE0N/agkn/dBwJKx7CC5CBO4IECwTMU?=
 =?us-ascii?Q?jmFXWhqyPufyDkNGmSFEkaovZbqlcLP7359bsbYPYT0olQFPThbZDZT6yc9O?=
 =?us-ascii?Q?uB8hsgW9LVnK0FSNQH8zAUXA0BSuPeW3AptliVNTDZhOjGOWGCvPpA6sWYFj?=
 =?us-ascii?Q?RA3vzQlez0CZJHV6uW3q92gNEiKv1olFVkA4Q3BDXHLflfOG8W9o5Qs30ULf?=
 =?us-ascii?Q?Ffmi2v+iYn+SJH2CUOjFyKF08m2YPTp2Fa+vZoCMzEn0FwYgyNFP4ONxv/1F?=
 =?us-ascii?Q?Bm2k/EVHzd4iDYWYK/sLSsPGcXzA5bYQ/sH95oaU3XjzNwN6oky76lZz+YYn?=
 =?us-ascii?Q?n1YS44NaePHB9QUHInxkZlBXlwuMl5PGj+zM/Qxa6q+mooQPMKWNxHxUQhVD?=
 =?us-ascii?Q?7jEYQKZ4H9krDmxOJfeGqyrw8esEUH0wKJ+AkW0t0XZbAKWzdHW41GzOfOFX?=
 =?us-ascii?Q?Sto4mJpekESKudj2+j1Pc0Premc9M1wPC3Osh4fMSHpTpPqtavdToLLG79+V?=
 =?us-ascii?Q?g9gKtumC/0mcCsN0u64k73xYkKJbAkisgrKGdiSb0lIJaxZAqLHITcPXt91z?=
 =?us-ascii?Q?MXDtaAOdTRX+XMeLu3LJxoY5WNgW4cxGIFxNg3f2/e7Q8dAp5cuG+q8tkrKd?=
 =?us-ascii?Q?ALJVdLuj5xzvmyEPqvh4MXCK6rER4EzE+zCUsUWp/4FPvrEhUDr59sDenAv7?=
 =?us-ascii?Q?BioQlvk9/nQKWtl6Kb9his8BqyBEulsQhYDfHL0m1aoXzkkIDwjzgSh+RdMz?=
 =?us-ascii?Q?0n25UalWoR6NJ2Iac5qL03G+jOnwwLlnM99O6ECYnDoTrwPMBX6YaX6c0nzS?=
 =?us-ascii?Q?E5wdReRZU7UcQOIMfucfQslKKxYRvC+RPENwtGcwRdCPZTCudJp6F21uZI1+?=
 =?us-ascii?Q?g8tWul+xV5gkLO8KHfF5RmwREyuYcw8BDuO8qMfWwkQId1qnOJRXn4sF6vwx?=
 =?us-ascii?Q?sVohmmc1FVqHY0r8VlCL2DZBsl46V708s6Dw0zqnUDCpQrhlajFo?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dff13a12-f0fe-44cb-1062-08df2e9ae92b
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 11:11:38.3285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2Xkh0GwskuNW0NmjDN3s2HGd9NtdzFCPHnIjp+MV0y7H+WYLMUlwPAYfTtFR/O7Pz4vQ7aP1r4Gr3QJFDL8zPLhFK0i+lSBJooDens2ppF1dV/B+D32Vn50if9Biw27
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB15038

The renesas,r9a09g047-sound bindings specified #clock-cells as 0, this
is a SoC property rather than of the board.
The commit 3e23d2548ddb ("arm64: dts: renesas: r9a09g047e57-smarc:
Add DA7212 audio codec support") place this entry into the RZ/G3E SMARC
EVK board dts which is wrong.

Move #clock-cells from r9a09g047e57-smarc.dts to the snd_rzg3e node in
r9a09g047.dtsi.

Fixes: 3e23d2548ddb ("arm64: dts: renesas: r9a09g047e57-smarc: Add DA7212 audio codec support")
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - New patch.

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         | 1 +
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 737bf1c60451..314298a6996d 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -970,6 +970,7 @@ snd_rzg3e: sound@13c00000 {
 				      "adg-ssi-6", "adg-ssi-7",
 				      "adg-ssi-8", "adg-ssi-9",
 				      "audmapp", "adg";
+			#clock-cells = <0>;
 			power-domains = <&cpg>;
 			resets = <&cpg 0xe1>,
 				 <&cpg 0xe2>, <&cpg 0xe3>,
diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 095acb87c20c..d242f2976296 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -379,7 +379,6 @@ &snd_rzg3e {
 	status = "okay";
 
 	/* audio_clkout */
-	#clock-cells = <0>;
 	clock-frequency = <11289600>;
 
 	/* Multi DAI */
-- 
2.54.0

