Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021094.outbound.protection.outlook.com [52.101.70.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469D744160C;
	Sun,  4 Oct 2026 12:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791117047; cv=fail; b=iUsiERHRSf+PkKtvhg0i0W5ZVNtUpm2WuWejbtT0853V0r7zU6Qwqm/JqvUxrov8gZpWzHB9DTzL9wA1o+TuRVYGdUbWfKsLL8ST3aGttekEmcHL6PURJoa+4KNtzgt59rZAm5sC40sASuvfAOVN9Bsxl727FPXUbjCqyaAhd2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791117047; c=relaxed/simple;
	bh=Gr1YAJALi3AouD4e5XuzJ0v8KAWvpwPWlcL6zTI5+54=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Zo+3x7gWF+cYYgyrUecmABjfznZDImbo72dA3J7Sw8D9DPKEZQHKzArqoFij8zheprgYpNkKyWKI/hojBxdfeZELF8chyEtCMfF/UJQ1v8hactrG3Zwp4t3NDPWwwfmYSEirUkqBGJIxw3BCazNFYSfVql5oFzVfJ5zyUMgTtVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=MmfEP/X6; arc=fail smtp.client-ip=52.101.70.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="MmfEP/X6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFggwCHFHIHWi3ysqxMAEhaq4eBVAARhoiPin9Pxon41xRPWRa97gS2SOqDXlnLe9er1Ux06/TnLuFa/EfxAT10oPxhppeja41TbYcGyKqfzOdmogoSabfEKpevxbUIct0DTlRh2kVODZts1yDAkF1K5uONtn9VB7PoPtqCDYR3V5Vu/okVgdU6cpWLscBhXy3Kgj2m3T6cQti6Z4WhBpfbRcg4Evm0V+0PbxZQvGrMJZmwUxjDNk1E5Y+VAMxrtuv5O5YaOr1yWYkH2jvT5Hq2GvTGBtAKbYVrGCTIR8keU/LEO1F7ZNk8GqizrOD3gElH5h6d+2bw6kppKZLsY0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FomJC/bDvIu+G8jOMN4BGbvG9MVjlFR4kAKl2WreOzs=;
 b=pZFAFVU29FvKM+OMSHQfCOd6g6HJ4TMlJU7SXj4XIOOBuPNG6a35iisj5F4WbsJNXMfxc+Vs/B6H0lOtLXU58AM8kODpaNBtf3+jmMaESk5oZYDn/XiM1QO1+OpJx8o9YAQ9RhsIEKbQpdPaVOp5s3OFj0iX19k9cFipkK8KgwqP0EtZjR8O9HrRNakZ4UXrmKN1/g7Je8KUP9nvvcly0p02f5wr2oy5bCRoLsbEqjFCz0Kh/QJeh4VZXcDK/4dsWzLS/xf/NOuFLSWqQADlqu+gtJVDm4NaAZ8ToT6j/8R7fCFaviJg/4dwH8lJyan1KMO+zCgx6DXPYpri0LWLxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FomJC/bDvIu+G8jOMN4BGbvG9MVjlFR4kAKl2WreOzs=;
 b=MmfEP/X6wA3lprgz1QzDq6M87kT6jfkP46FhZaezq74R42e+z5r59DksEyit3ysZ4pmAkrIUP3LoAltGbTJhR8Cn+YIskAmV5hI5TjZc4a9N6pBCNRZMMsKp3SkJDJQ9TIT7ptKkmzmINRTAT5Pvi4UCl0Xkjo6n4dgzlw80GpaIuvg/FL72RvhVLeXD6a9zcRGYFzz7Zom775dA6VtrACvnYiM8QfFXQSrO5gANnxXnCaDLFXbGnxoHApPAKrFYpAiB5CZhA5+CXtV4ypSGuC9HTENbrJAYgsi46jEEFzqOSKK8Srm+/rNriDk+4EYU2rHdREEi9Bv6jT+isJH1pg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::23)
 by VI0PR06MB10637.eurprd06.prod.outlook.com (2603:10a6:800:2f5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 12:30:22 +0000
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17]) by AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17%4]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 12:30:22 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Date: Sun, 04 Oct 2026 12:30:14 +0000
Subject: [PATCH RESEND v4 1/2] dt-bindings: mux: gpio-mux: Add enable-gpios
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-add-external-mux-enable-gpio-v4-1-e9393660feed@vaisala.com>
References: <20261004-add-external-mux-enable-gpio-v4-0-e9393660feed@vaisala.com>
In-Reply-To: <20261004-add-external-mux-enable-gpio-v4-0-e9393660feed@vaisala.com>
To: Peter Rosin <peda@lysator.liu.se>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791117021; l=2577;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=Gr1YAJALi3AouD4e5XuzJ0v8KAWvpwPWlcL6zTI5+54=;
 b=847gFAyvjiGwH8THsGt41Jfsj5lPOu1Zb8cWrPxA/aF/APlxXWhc2ZNnXZS6y4oDW8uTavdIZ
 eR6d99y9wStDMP2xCRXdIU6zFpR5pivyBuezEaFvOl46JZeWYW35hz7
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: GV2PEPF0002394B.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::34a) To AM9PR06MB7907.eurprd06.prod.outlook.com
 (2603:10a6:20b:3a6::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR06MB7907:EE_|VI0PR06MB10637:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f1f38d-5f04-42fe-f4a0-08df22134259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|52116014|18002099003|22082099003|10067099003|56012099006|38350700014|11063799006;
X-Microsoft-Antispam-Message-Info:
	sivIJsKIVjZjPRy/Pq9j1NcswPA3DNcuHAx4YBifTsGa9s2ReBFbwDFK3z8+voy8FXHbXkTrYcbd24Y/QiKbOZF+EAWxrcs8AtzxrsL5IFKcC8BU/W6vLciZsPXmgbTLI3DqkWZQywtO7y0HLZA2+qyKY/PmsFKMJmFSOzcnVSHwEN9C05jhbjZf6m/NlRggK6R0nCPUPaIWYhlrTiJ3G4cec8ZXPpOD8Y7HLmppMQA0lEGYyncF7F1JagmmkBTo74+AyTNuI05BSI1ZsMFMM0mOY/US0MLgUBjkEUs07GjKoZX8eT84an/Y+HJjV3MFiFKyapTOEr3oD2XrLA1XULRsvDcfkFouJYl6bjA9KgNNH9+oJMV/6tqhAztxTgXsFiWuSrHYgM834vu2CUtdQgYgm5xetOcGKwjmzBoI4FvYBArKE1WYf5+vRFtnr2RbzdcKGoErKFJ/7JqfSztuYqtkZKFgfYqZfP7WOcwjLiVS11midpQBPtwV3ObrnIcmHxFCErnkuyLkCwwSonYz+HcYdodtwx4UtFfCx9xCddyE3nkZfb3e3M+wuv1Az++xHRUNEm+h8QMuatJCCXS4TMMYJdTb9M/prumuWSWCyFQlVzGCSy4RObS2Nf2SXFoFP92T/M1UW4ThXz3gR0Oem5EBFTvNboVBzwMuVXiiDyUCKr/GLuhqRhJ+lnxCA7amTdd2GeCk9gWNm0h0nLq6bQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(52116014)(18002099003)(22082099003)(10067099003)(56012099006)(38350700014)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RE9VVE5KVFM2L1M0V3hUOTRhWXhOSUdIVTdqTnZkZ0diZytjS0NBM21HWXhs?=
 =?utf-8?B?SHoyR2pCUHE0MDBHR1F0TUp0Tis5cjNKUFlyU29jc0duUHJmRWRVVWJ0bnZS?=
 =?utf-8?B?TmFORUZDQkRiMitIcE1pRjUraTZBL1JNckt3NzFGOHlMMnJYOEh0REw1Um9G?=
 =?utf-8?B?V2lrSk5qU09jWS8zRGhNbFcrT0xxYWN0WXZhbmlzMU11cUhiZDgyQy80eGVS?=
 =?utf-8?B?SmZxUTd4eVYvdnBCbjdtRDllRXMvcWVMRlR2NmdaQW9Fa1NvUFBZcklnY2Q0?=
 =?utf-8?B?Y0hMRm1uMTlXZ2NtNUVScHIvWXUxV09udDFBMVBEVkhCUjJhV21jTUlOVHBT?=
 =?utf-8?B?OW0yU0JUbTRKek5WUTM2RTZwRDEvWEIwbElySmVLanN5RGIwNEJWc29vM3E1?=
 =?utf-8?B?SGYvT3pPVWJjTzNQcVJYWlFkV1VjYmIvTW1GOXJCelVkMFQvaEFGRE4vcWJ6?=
 =?utf-8?B?cW5kZWZBWGk0aU1EZFJoSWUyTHFUQkcvSXVGMzdxbjFQV3ZLeEZIM1lYM3Rj?=
 =?utf-8?B?cjdYMGY0U3gxZlZ0aklCQU95Y0prSzF3S3ZLbUd5OTQvVHhtSXJEcWpFNzJm?=
 =?utf-8?B?cHdtVkY4L3BZOU5qY3FhaEl1NktHbGM5dUR1K3A3cDF0c0JSMFJZbDM1dVBN?=
 =?utf-8?B?d0ZiczRHbFd5b2FmKzZkaldObXFpZEk3QW1EcWt1ZGFBM3RSVk5TZG4rS2FP?=
 =?utf-8?B?REt5T2d2aXZ4QWx6S1ErOGt4VjdyMXI2bmk2YnRWSXZGTWFDeS9pdURJZ2Zw?=
 =?utf-8?B?dm9NNGtpNTZCLzc4YUZWY01DMkc5UUdZTktTdXR0TytYSjBQdWJ4WnFEbkky?=
 =?utf-8?B?RXlYTXovRDdIQnF2M3oyZ3VnRWYrZE96dUR2ZEtBeU9JZjJqd2JhT0dDUHFY?=
 =?utf-8?B?eG53ZGFqNStHNTRjLzR2cUEyZDBsNStYN0t3WlVXZE5TVWNYVzMyT1J0cjhP?=
 =?utf-8?B?UTVSVXpJeWZJLzFXTm1Qc0pmQ05pUDJ3QUx5ZnplT1psQXRQM05uaGppcmJM?=
 =?utf-8?B?d0dUQmJUMUpFRDdiZGlRcm5sNmhxeU8vb0pWZWRlZ3BlZ2cyc2M4aU1jOWhR?=
 =?utf-8?B?bmgxTUZkeDFBMHo3R2k4SjMramZMRHpFcnBYVWh0ZkRrZnhvLzRSMllReFh4?=
 =?utf-8?B?Z25vaXZzV3IxMkxFazJPUUxhd1VRYlprR3NJdmlaanAyUHpjWWZzSitDSkxU?=
 =?utf-8?B?WHNLRk52WlNKNDhUVXBSbmpqTmJzTUltMUFRTGJERXFpMkwvKzlZcUZyZkxJ?=
 =?utf-8?B?STFUSDVrUFBjM28wblZ2ZDdLSzBIUDN2QXBtRmFIbFJYN0pCOFRLRkx3UGg4?=
 =?utf-8?B?TEY5UWxPUURNdVBnNDVtbTdBeUZpU3AxdTlublVpRU1sek1pTlJ6dUw1ZTNU?=
 =?utf-8?B?c1VpSDNwY2NTL083ZUl0UjFiZ29DMzlBME1rbFBxUVRNOTgyRFVBc01TMEhZ?=
 =?utf-8?B?WktEQmJyVHgvNWlWcnVqWmhMT0dWL3RKUzVQaHhnNlBaeFd3Z0x4dG9kMkJ5?=
 =?utf-8?B?dlZUR0RIdGtZZkNHUGJOVDlTQmNqNTFsb0s2NDN0aGhLRCtUVVIzZGQ3SS9s?=
 =?utf-8?B?WnY1RFlXT3JSWFluNkNhdGZhOG1DbGRjbUpRM3E5ZnRQQnBnMThvUHUyOUZM?=
 =?utf-8?B?WitTTE1mREZ2aWRnNUdIYzBFY2JnTGY4UTZXZ1NKdnNndGhTNDFKZi90Q1Ex?=
 =?utf-8?B?TWlqUTVHekFuNlF5S2Z2MkF3NVpNbllxVmtQd3d1dnFYbmNiQTh0Z1NRL0FF?=
 =?utf-8?B?eTRFNE8raHFrTlhlM2QvZlcvSmYzYjBOVndGaFdRNjZmT1AzT2h1eWtZMkht?=
 =?utf-8?B?ZVNVaURwZWMzd0tXb3pGd1FtZ2NwZHV1RmgrdTY3Ty9vZU5lR09PejJtaDA4?=
 =?utf-8?B?b05udXNwejhtOUd0Wm9SUFdYYXQwVXZDZThNVGgza1NSTlR2ODNiME15aUk3?=
 =?utf-8?B?RFdKeVlNNVZURGxlTHpmVmsrdHAwaVg1R1BGZHVJOXE4Szl6NU5tdUhrbGNQ?=
 =?utf-8?B?MUo0d09iYU1uZFFLTnRBcVBEcVZmY1dPQXlrVmdpakRVNU4zVnVrcUk5UUpn?=
 =?utf-8?B?dGwwZ3BwQmFpUHVjRjIyL0tveTRiNXVVcmF6MTRWQ1FaTXVNL2RXeEIveUVl?=
 =?utf-8?B?STJXdlkvUXdraHZTUUhrZnNZRUNHZ1p2d0N2SmJMa1pkc0VIWFV6Q1Z4NnI1?=
 =?utf-8?B?Um5lWXdxMm1jV1QvVlN2RzdpRlRUK3dhTFJ5RFhnaGo1ZUdZTnpNN2dHUmNM?=
 =?utf-8?B?akllUlo5b2IzanYrakxUZG05bjFwZno3RzNIUmZPMm1XN2ZDWHVRbTlkNkJY?=
 =?utf-8?B?YmozekdzQ2E5NGt1eFhUNTJUeEJScGNlMkgrekFqd2JWcUdWcGZoTHk0NkRs?=
 =?utf-8?Q?11427UhQrlMlTbPI=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f1f38d-5f04-42fe-f4a0-08df22134259
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 12:30:22.3717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7C8eLYvP8TZUGsciIluqkUpmMGRc8KLRuELi/Ac3YDCdGkV41Fzl7HHGew+Z/Wn0/5I8hFnb1riLIU9KLuadDiavdKTxJoX+B+PLC9H7iM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB10637

Analog multiplexers have an enable input besides the address inputs. On a
74HC4051 it is the E input: with E high, all eight switches are in the
high-impedance off state, independent of S0 to S2. A 74HC4067 works the
same way with four address inputs.

Two things need that input. The mux-controller binding describes an idle
state of disconnect, which a gpio-mux cannot reach today because the
address inputs always select a channel. And the address inputs are plain
gpios that may live on different gpio controllers, so they are not
updated in one go and the mux passes through the intermediate addresses
on every channel change unless it is disabled meanwhile.

Add enable-gpios to describe the enable input, and require it for an idle
state of disconnect.

Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/mux/gpio-mux.yaml          | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/mux/gpio-mux.yaml b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
index ef7e33ec85d479ce57c5fe4a780f81a08a6ab6ba..2dd94704fd7bde238af4e84af87c2ad8e955eb14 100644
--- a/Documentation/devicetree/bindings/mux/gpio-mux.yaml
+++ b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
@@ -29,6 +29,14 @@ properties:
     description:
       Regulator to power on the multiplexer.
 
+  enable-gpios:
+    maxItems: 1
+    description:
+      Enable input of the multiplexer, which disconnects all channels when
+      deasserted, independent of mux-gpios. Deasserted while the mux-gpios
+      are updated and for an idle state of disconnect, which cannot be
+      reached with the mux-gpios alone and thus requires this gpio.
+
   '#mux-control-cells':
     enum: [ 0, 1 ]
 
@@ -47,11 +55,23 @@ anyOf:
   - required:
       - "#mux-state-cells"
 
+allOf:
+  - if:
+      properties:
+        idle-state:
+          const: -2
+      required:
+        - idle-state
+    then:
+      required:
+        - enable-gpios
+
 additionalProperties: false
 
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/mux/mux.h>
 
     mux: mux-controller {
         compatible = "gpio-mux";
@@ -59,6 +79,8 @@ examples:
 
         mux-gpios = <&pioA 0 GPIO_ACTIVE_HIGH>,
               <&pioA 1 GPIO_ACTIVE_HIGH>;
+        enable-gpios = <&pioA 2 GPIO_ACTIVE_LOW>;
+        idle-state = <MUX_IDLE_DISCONNECT>;
     };
 
     adc-mux {

-- 
2.47.3

