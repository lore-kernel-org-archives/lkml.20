Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011028.outbound.protection.outlook.com [52.101.57.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E7D446C18;
	Mon, 12 Oct 2026 07:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791343; cv=fail; b=jOYUcqw2gXoN0+V8eR6f4RcHiT2SR4kZK2navzYAUXukLyWW8EsoUoI5czjg4105EhsYlqVWoSKAT9ByhKGZKMy+qI/PAf5BpXGEo9XSpnZqdHvO2RVoOYRhOErAPcFUQN3lSvkTH6U5Tp+rw5MiPBU7jNDrSIUMKX/SMiW5xOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791343; c=relaxed/simple;
	bh=5tmegsUL+JNOdPS6x8h8n36JePGL0QkUdRDhmM9XyAM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZIxkDlhQhD1pjadCeOPDMxz7k9EEHzR3JihFqEDdEzKsfafgZJHzdf6l1h6VD70YETSnLUs4LuZCFlg37rqioMR0PNHusyncxLASEgsKd2dYlK58X3sXVtx7DFEQopWbVZsoWKJ/KTuJzbLpFKlR5LKuwiJJ3gTuSkpGIkdMgV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=ry6jYwlm; arc=fail smtp.client-ip=52.101.57.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="ry6jYwlm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHAwgY5maAMD0xKKQgeChqJUHdO6T7s0BwGEHgU4TPkiXTngWj9oqCPoUXVObRlzUgaSSFfNmx8zG1zfUg0wQNAd3/kfvXpPRuV7eFsegGcXbYLxEOFDEo7THm2R8R6sw8Bv1u2AzRk/bN8avggH1eIDiYjN7rN54fWSxb3/mr3J9CFhc+97Lq8CxkiWU/SeVpT91AqdnjUQ1O+W+nZaK4YOi199gOPzDgSo2NSjqK8uK0OO8UX2mMs9uEZtTrXKRoQdhz3FYUZ5qmyL2hHC/hAmhF+h51yuhXQyw2PInXN3Y4XC90dKeSbTI77n3zQbTZgl+4CIIwTGFBKkiZjWgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VEZV7qBzbt9LgsNqn3EjHW/D6hW8FWtTkfgIntF+Gls=;
 b=G8BaE/xxtJ90mZTZOioyw4pZjMTw5wceljoOGAIogQhA4qB5lqfvWUYttg+Mesh9kRCISBoOv/+yaDTsEsf7B5bwlAHkzl6w11e/BTc3CHdcBwXVF5QmRowamlq15iJ4ZUgfV2DJWVew6sbictpr59qkB7qhYVhL4ij5SR6hJPMEDcS31dQzil2ePkPhvED7FzIfmhZMeJSWdxXIvfYIULB3EEZUjA6hYwAKxz2ZvlZqyIb3uGVGBv5kAICHXtRaR3Kz8jBECGeCXuVIgB1sIkrxojTSYIsp8VR4Q1Zy7YLg3v23kQ18D4PU5LR+BnrkBPCA3Vi1QmHu9wXgPb6oCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEZV7qBzbt9LgsNqn3EjHW/D6hW8FWtTkfgIntF+Gls=;
 b=ry6jYwlmwtqj8a9Qhcsu+IDLrFI6wSr/xBIjz3DEqOiUKVPmWmb2IGJKM2IfWNyAJ+2RUd8tsiuEw/dXY5SM5scQr61RWdp+0JdkjU/sdwgwUKPsEsCexa0C6GrNYI2LJvhzmnFp7AF6jG86kHe68M9qFEXVl2O3q/4GJ6tMky77NXr2ojlAnMgUcY8JT8gTAiYAfIUNQYDYyDqsg40tpOJJxWGy57ftk3m31ijUxD67pvJmUoiYawPSjwxzCkJOgs/HL4U1Nf2A9IUYJ0yNxeTfYUf2NTijoYyjmi5wF5IJqEEnqBhLMWWEmI9X1nhpRWGT9Y0yZbVOILZXp7LwrA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13)
 by SA3PR03MB7233.namprd03.prod.outlook.com (2603:10b6:806:2f5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 07:48:57 +0000
Received: from LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982]) by LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 07:48:56 +0000
From: genevieve.chan@altera.com
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: arm: altera: add Agilex SoCDK multi-QSPI board
Date: Mon, 12 Oct 2026 15:48:44 +0800
Message-Id: <20261012074845.18039-2-genevieve.chan@altera.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20261012074845.18039-1-genevieve.chan@altera.com>
References: <20261012074845.18039-1-genevieve.chan@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::18) To LV8PR03MB7398.namprd03.prod.outlook.com
 (2603:10b6:408:18f::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR03MB7398:EE_|SA3PR03MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: 08dbd080-700d-420b-0864-08df2835451d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	FQ0PAO70sFkgXzmaPFdERg/EBl6UiE5Rgv06U990aG4oel2mvX3QP+6+9IXX/wyZsdlsBxuV+qfkRwwg7rqWK/noXktAPpWj+6Qjw5VZApkrx8NjR2VOZ2Ud2YX1U8sRooPWGEC7lfqRsfJEhaETolZ4ICCaLR4pUg/ZzES3bPys56fEf/Q6bNSyHO1QNbLroWEQ7HonbN7jWoJ3XvtBOsgDxRB2FyxaTMALZnILT8IJNRKjiw3nfbIOr6cEk1VDv2tH0DcKPjND/ApBg0zqkePKetQFHGvfwX9oHQeeP7e3QBeqAB42z8AnY9dUITI1Fj2LI6uNF36qkUP9J2PDpcxPetE0sO6xK5DmLJTNI8neR/ogI9AOms8k/MQX2LLO7jfPDtYVGYQi9HKXpJGU7JLd0JvsVU5mkZuK/vw9/0s0Upy2R5hcZXkYLab8iKODO8Hh6rq2owy4K6CvvGbWM6T/CuuOx/V8EEJUttVcQDsJbxxYp2K4DoenhBBq3t8Rg/HnK99bcrKM2bo5zyyqG4HHyiwQCav31WVeqkkZ8jJ2VHGIdDFM1/xUqmmMV4rQ6nclnuLT2w90S0LS86nqEktkf1IyMvsihOn7Xdd/7WR0RF857pI0z/PXY8WN5xVuvBYQMg3Ym/9ApgNL2PVdScZ6BHjZksRufIb+aEFDxYg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR03MB7398.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wZBcN8AnqU72mDABiaMviHHJzk+lQ1C2B3hBeeY1scDYnVNsFGGb3Q1LkiR7?=
 =?us-ascii?Q?Vl2J0QoWP1Z9b5fXPTJZcTrgIRNQp+EbsUcybA6Y8pgWZCdJU6xjYy7vfCq0?=
 =?us-ascii?Q?Ju960S91CWqspsh+p0WMI64GEURwvW+eQCzsdhdRYocusDAsx5NnYuiOxCB8?=
 =?us-ascii?Q?gXVbv2/OsKPtl4Wcmbf7fIj4T1xJzB7XigW/MQ30x5ln0FRyYm+WSJka8ko5?=
 =?us-ascii?Q?oswQzQEhYRHnJaff3U5YTWyocQbi5NeHfBVAc4HknR557ym88PTwiQ4MOFyQ?=
 =?us-ascii?Q?qnWh6jQaVmzJvB56wdqGb1/6tveqbWir5b17Kcw22Hho6vILeaCOaqEPDA1r?=
 =?us-ascii?Q?c75veLgUDTx9VQ1besSF5uth5j0yK2hLKJLSRlEYscd2oSoCptUyQp9GGgeD?=
 =?us-ascii?Q?u0erI6XTRZgpMaesY3ssak/gXk4mffSC5pnttUer5OSTfr3dKriHalsbh8+A?=
 =?us-ascii?Q?kfjxwz54yn8xZVx/cmbh8yPSebcbpDJhHwlHOKX+T/tlSmC58BHTdBwj0uHe?=
 =?us-ascii?Q?jGbg2HLqOjhfHhQ41dVzNZybvXeUcuNsXArRaJBzXnWLcCdjUxc1/OmLfWBU?=
 =?us-ascii?Q?xWjcAbWFbtLQ6U5zZC6fjMZ/aSSiTo2a/9OlPqw1dsc8ZmWHjJL9FwSpu9Jb?=
 =?us-ascii?Q?xTH1frPgAXkkchBooZgxUIkp4aE8sVLN1SGQe+5pJIl5IaWdVtQ3uY6wOEyF?=
 =?us-ascii?Q?dVOtiSe3zVhSHRvuROwVVOrmFXD64UFJZlfCLgN3XXQSgycKYDDGdu1596p9?=
 =?us-ascii?Q?AL9u6ETwJ6vjkkZFc+dLDRXnyDNeteI44HXn+gZCaHArHZdwl/azCUXH+38U?=
 =?us-ascii?Q?PXR1K3G+5gzYjMoHix3qAvP3B0AK3uozQIMXQ2iLJjTF47NiL9mRrJ7MQ1PO?=
 =?us-ascii?Q?WQ8qTS6RZ4Ou333TaOlzxoJvYINd/D52on5hkg+sqxRA0uWc2b/Ap4JttRvi?=
 =?us-ascii?Q?hnbsPtyESBiXhrv5aMNisWkI2bxE2XOwx34Iioae2GZyXqSJfQmJJtRyDjbY?=
 =?us-ascii?Q?FdN3WW/puWStMFIdk1X82wT6hj9BQfkHUOgromEmmGLQQ1EMR101yHyC8ioj?=
 =?us-ascii?Q?Vgdr9qR6tPj5r3+h8MEeT1M2WESxq1pEoipTDFbg8zGV/Snd8u97k4ihIT1z?=
 =?us-ascii?Q?MQNVPHCdGo6MOCCKamHEYCJA97TSHfQIBthoDn4dvJHbROruXFHB4JyjZcDw?=
 =?us-ascii?Q?Y+x1BUKZC7s2aukB+whLfseUaHq8ckZmLj16ulzBm0MvP5fjeBg1PNHZMGKT?=
 =?us-ascii?Q?QX7qHb1xYUkppQzMogIc1MpXI64yevhw56tW/KVbteR7BHoJfpkkcSQbmgvd?=
 =?us-ascii?Q?GHv7iTe8Bbx00ECIYgTDjug4WSKfC8zQB5IGuFbQKzyjABm84hDzs0qw6tCZ?=
 =?us-ascii?Q?mVffhp6QDBMjwQBoqAnWq2T+t1ahnDbiHEkeCx3pG52KJupAlteAvGjMbLZs?=
 =?us-ascii?Q?7PrCF0aOLzP1MgX/TMVoHBHd4s9Rp69swbbR/aZ101Ol7CerzNlgQOD+SBMz?=
 =?us-ascii?Q?2qZXrbU1Z2GNesBu6G99hBPjpFZze6w6WlttW6fPmrMAZhhgg46GPCGQlEFN?=
 =?us-ascii?Q?aHbhaTR0bLXQ3wCpkRLPsgakpmMgNsGrSoS0fzkLu7149a+2j0SI/WGXYDrS?=
 =?us-ascii?Q?sRj9CxALzyjif9kMzeJi9gLXd9O5p/YeFY64nyLw0mt0/6Z2GySYRzZSjGLw?=
 =?us-ascii?Q?RIw8zzDXAi8b9SyKiALpp+tcgjFUMHEGCT7idFT5rymlWxLVY+0MkmHKs3QS?=
 =?us-ascii?Q?5CAfcrrsfqiw36iZJmEl6AseNMkIGrU=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08dbd080-700d-420b-0864-08df2835451d
X-MS-Exchange-CrossTenant-AuthSource: LV8PR03MB7398.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 07:48:56.9082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7rh+8qisWG+4KdAYhfHdlJHCEtgFYsvqJGv3boa4fq1UCAUMLXD/Ang8h4zDL8wbeQ1v7plzulZeMbLhp+HqWd/uc6pQjzAV3OJbWYB0GY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7233

From: Genevieve Chan <genevieve.chan@altera.com>

The Agilex SoCDK can be fitted with a multi-QSPI daughter card in
place of the default single-flash QSPI card. The multi-QSPI card
carries four Micron MT25QU02G flashes connected to the HPS QSPI
controller on chip selects 0-3.

The different flash population requires a separate board DTS, hence, add
a board compatible for it, following the existing SoCDK variants.
The board uses the Agilex SoC (marketed as Agilex 7 F-Series), so it
falls back to "intel,socfpga-agilex".

Signed-off-by: Genevieve Chan <genevieve.chan@altera.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v4:
- None.

Changes in v3:
- Add Conor's Acked-by.

Changes in v2:
- Rename compatible from intel,socfpga-agilex7f-socdk-multiqspi to
  intel,socfpga-agilex-socdk-multiqspi.
- Describe the hardware difference in the commit message.

 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 5fce1161210e..01f6323b9a6b 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -97,6 +97,7 @@ properties:
               - intel,socfpga-agilex-n6000
               - intel,socfpga-agilex-socdk
               - intel,socfpga-agilex-socdk-emmc
+              - intel,socfpga-agilex-socdk-multiqspi
           - const: intel,socfpga-agilex
 
       - description: Agilex3 boards
-- 
2.43.7

