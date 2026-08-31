Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020119.outbound.protection.outlook.com [52.101.69.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D260E39184B;
	Mon, 31 Aug 2026 10:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788172126; cv=fail; b=K6nNByLiqCD36P4tctxqO+0TLkpEQQxUv9i1LRmXbhgphxakaNzJq5MRmVb09m6WgfYbeq149j7GHqo48wm/qjC9aNqhx3Z91zVXz8x+5/9Nu8NSf7XjERSdlGV+3bn2kmDqqAtItcyyshTEM/x6wZ6asTIJjxRmzLXW3jA4664=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788172126; c=relaxed/simple;
	bh=YJnSnI4PKVHrNXPOc0Og/62sPL5Sb/ejiKQkPMVdMZ4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZdRfjMZSaLgouHgFxKbk8Qkfd9QWmlEvdVT5ruqGm5Mjbw91GrMflKPa8CWPRvyRnY3s46lIhn4fUl633Q5oKHZ0F2aIgbBUbowaHA8+c/f0x+9C+7mpjEHLxdJsWgayYKxfsdMlNj61ZeOJOfCvt9+tVufK1DO5PTrCSf+2W4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=mTMOZnp3; arc=fail smtp.client-ip=52.101.69.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="mTMOZnp3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGB6hopz7P0XOUwzMxnIb8HLxaZvNVza1QnRiSBmoFTKIlZW35Q5KsCGKnAFEWN0APKC5mK3JHsqxZrXhKg89q1MaYxFMPK4lx+S4QjSAEaBHbjEE1tVWwFzBck8tCbLSHPlhI1/8AXXXPdAb3kDG1LkG0iP0l2CrG8BqfoFfzQmk7DRMvCwNk01Wp8vzXnZpXU43XGX2ghm8EDBZ22+3aDasf+jkK78a1FzovGexoRiQhNAn4zFaijZ7GYZTnuc/Q/4dM4NeNqR4J+0r8IUXhF3GH3wLqNKdHmg4b1L7lUdKIArvIrwrkDNjP1Reo8QhVRpQ+6z1nVeGBiZph230g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9b/7Jdnvpj5I5+EQZxn32pFDWV88L40jUiBug886KM=;
 b=mz9aRMeKZcx+AwF/JcIHINCreQxyera7ZC8oDIJnh6NRqe1lhZnOkgh3Q2Ahyhpr34ONI/iG8acC5zr8GDanAg5L/81BzifDcsTPI3IkLga+l1TTe2G5i2OwQbUK//n17s4Zkpt5+XPRhws8K3+cKkqIE94bw8Ixch7nyAvjl6J1BepkK3TUutsLFn9hB1j6R9Uxi0c7pvmkgRa0CTgMg3r90Vao1fRlHTr/A9L1FB+ERO+hQWryCLcpMMCWeyUuryHoINlzJAopreJ4jFpBWfgML44BZV4G/Rv6SDisxtgY1hvbDrifrpL++ylX3YUF9ZpYzt5z6wQZoFaEt06LXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9b/7Jdnvpj5I5+EQZxn32pFDWV88L40jUiBug886KM=;
 b=mTMOZnp34ZugKWD5xp7wyqt8Bv3PqORfi4WakUbAe+gbfrEwNwctHwlj2ZkHF54U3sU8w1mh16tOWfjBdcMifiaqgbXV+gJkuPKIZbyN0EG55nbwU5EpJVQM07b/O3tfyru09BK3rQyAs8PWr3tdeRAZx6s9fS5G3F94pTL9qBzVHck+WAHwM/JFb2zxIEIv1b1nWRM+vTACebGzfxNdVX9hIrSPH2KczwR6MscBLap10sBsd5jby1DOj5+xv6P8ylyvYkNlOuA91RcreB9MISZnqXxX8CnLwCujopb2dg2xyLr5S5YezIXIf1qSngwqAnusj5hSMuSRMESjaufqKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::23)
 by PAXPR06MB7950.eurprd06.prod.outlook.com (2603:10a6:102:1a7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 10:28:32 +0000
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17]) by AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17%3]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 10:28:32 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Date: Mon, 31 Aug 2026 10:28:24 +0000
Subject: [PATCH v2 1/2] dt-bindings: mux: gpio-mux: Add enable-gpios
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-add-external-mux-enable-gpio-v2-1-f6027a4afe61@vaisala.com>
References: <20260831-add-external-mux-enable-gpio-v2-0-f6027a4afe61@vaisala.com>
In-Reply-To: <20260831-add-external-mux-enable-gpio-v2-0-f6027a4afe61@vaisala.com>
To: Peter Rosin <peda@lysator.liu.se>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788172111; l=2524;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=YJnSnI4PKVHrNXPOc0Og/62sPL5Sb/ejiKQkPMVdMZ4=;
 b=I+7ExBOxT4laX5BfBaGhGzfeDMR0NFrmLy50nQCXkWUbcclfRmeP7HnPayif82HpKjrB+D+22
 4BkuTEjVxfzBVJ0Vdh7MNr2aEI8Q7WVTwl2PRl9EUw2ktftasHnAce7
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: GVZP280CA0090.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:275::12) To AM9PR06MB7907.eurprd06.prod.outlook.com
 (2603:10a6:20b:3a6::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR06MB7907:EE_|PAXPR06MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ddfd106-2b3c-40d5-1a26-08df074a9b69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|56012099006|10067099003|11063799006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	TIvwQU/sK26O6iI3V8VYFlqKQ+ajzUQhK55ZUXogG0ywxxR62YAH0+n2yhwwsvYvs9Iqwvbny9w4isA4kdZPuNrwzDiFpg6vQ8vy6XnuJHTY5VKfVZp/+bSBe98QGaoPaxPHOsEb2kFAevcTeJh890YL38ls+XF1Kj9XQlbOMfss6wNbOdx+8VNhvCxbuHF49INmMj/CgkXKTzmLioTqQ3cG6v4d43ux9VUiigpZIJe7jeOZXYifP/b0O26Lkl1AR2G/7ycS3HEQd/CdBI6fIzuoPuTzo0IiKh+z+7HXfO6kcbxfLFtKijTWeIzxJcXB9KshR2k9G5TH7lCEKONfB0ZBGvBvIzcSICD7MgT/rwth1DjJL0lB+EWLvxlk4I3tgAqpM5tHejNOS33ROnQIJFfMwLFu24nY0mESOif/R6pR/3ImXJQx3ZAo6YVEbvZazxZso4EheeEqwkuWceDXKJdD+uyf/fk+Sja4qMaZ3eaHXNldu7Eexi2hjctQI01tpPOVzOu+2kXi3xp+BsHSeq3kNBPM/mKUllbH8cxZU3tThNQ1BiThWzva79HtV8pf3wGCNj5jZNtMIc5UwUAXZLlIVsi6JgzMAhrXxn7pb8PJW9d4txluF6IeLQoojfmDNFhuc58KYLRUIhbXeXvGLXVg5gMFdAwbDgxIv9O47OJXQuL+gHaVzJ38ddD/SZ6hk1WGaTQLDptRXPHlBeBs/Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUR0RkcvYzVtZmpoNUxMbEFPaHRRZmpHSVR3clozWUpOZldIazBHL3pObnZa?=
 =?utf-8?B?WmdSdVJRME1XZ2Z2ZUNVdjNZWFdnR3gxRlF5THNnQ2JxcWxldWpCQzFQNjgz?=
 =?utf-8?B?TUY1UllDZS9OcXBQbGNzSjMzdWlBUUMrbEIxSEJTdXFTSkM5eENMTjhVTDhR?=
 =?utf-8?B?YWs5MFhQMXdFRXZwNmxSeUpIL2RNMmU4UGxaMkRMN2laK0tsblRZM3B3MGFa?=
 =?utf-8?B?MThCZVR1bmZ3eXI5RlBBZTFJUFJWWDd6T3ZOVkk4RG5HdVVBeUQzR2tmN0p4?=
 =?utf-8?B?WjlKR2UwTlA2aU94RWZpSEJ4enBmK2pUcUVtSWpFVTdiWkR0UG44Y1F3T2VK?=
 =?utf-8?B?ZForenA3bmlEazc1alNOWXFRd29xNzdQVXp4T1Y4MDVueWQ1REZtV1o1ZGZU?=
 =?utf-8?B?SEpnUTBkbytzd2VLZ3NqZHcxeHpESVhCVnl3WStIbzR5ZTV4QVkvRWhOS2tB?=
 =?utf-8?B?NFFZbU5XN3dMK2VwcWlVWDRPWXVyd1FtdlRMMVRmTzJ1ZjB0MjNOK0c4Yloy?=
 =?utf-8?B?aXF6eUI4cmh3Z0FOWC9ZVEE5NEp3Z0lkT0dZYWpDSXh0WGlZYVNPb2xxM2pV?=
 =?utf-8?B?eEFQQ1pHcWF2Nzc5RjN1VVo4RDZNeURLOFozMzRzUm1zVEdQMzZyRjFWcFVN?=
 =?utf-8?B?UnBxN3YrYmJtR0RzN2RKdDMwbHdjMjY2RVZqSkZQWHFjLzF3aVpRWGFOajRo?=
 =?utf-8?B?YktzVlFKeEM0Y0lhejc0OWJoVTkyNFdCV255NHB1K0xNanVIWEdWQVhZUG1N?=
 =?utf-8?B?eW1uckJ3RVRxNWRqOXMvMUExa2hjVjM1UDhybzFRZGltczc2RWVGMlhxQlc2?=
 =?utf-8?B?N1dadlN4ejhXRzRUTUZwcVh1SWtUbGJRSVNIeVJHZWhEOXJRWFdDQ3hhTDNC?=
 =?utf-8?B?S3hUUlVOcnBBd3hSeCsxdlcrVnp3ME5YWHdtbkFyVW5GOWUwU0p2Zi9jSUl1?=
 =?utf-8?B?blFvSktuckdmSUlFb0V0L2RCSitDeEE5VU1hYUFDak1jNTBJSFdWZ2VwQjRN?=
 =?utf-8?B?ZE5iaXMxa0hJeFRacm42Sllnb0N2VFpsc3k2MVFTUEM2VVlaUzBEdkcrd0pN?=
 =?utf-8?B?dWxFQ1FTaHM0SFNaQ0RpOTVJS29NWDNNV29KYjU5ZUIvbmlwMFpKMFVoS2Jh?=
 =?utf-8?B?SXhEa2FzUWtpTTg4aExTV1ZESjE4am16bDNNUnNiOHVzYldmZWNDODlzK3pP?=
 =?utf-8?B?M0FjTHNENHl5ODgxQlBXT0ppZWxOVHJudVBqVnozQ0lzMWxxYVhrYVNVVDNI?=
 =?utf-8?B?RUZuQkxiM0JjNC9UR1FzSERGLzZ0V3BYeGI0WlBQMlUvWVNxKzhtQWZWRmxW?=
 =?utf-8?B?ZHNObDFiMDVkT3pGMC9WV1JNUUxscGQyVEJlSlpUc1FzaUdzaUJYTTdRTWdu?=
 =?utf-8?B?Q1RvbHp6YnVOcVVsM1UzZ2NJdUMxTkRVdkk5WTJnUmFKY0RtTHhNeWlRMi9C?=
 =?utf-8?B?bnRLT1dSbnQ2d2Iyc0c4bGoyNG55eS8waVViVVEvNlZxclpqYW9DREd2MjJx?=
 =?utf-8?B?aFplSVNLdm9ZRExieS93cEZKNlRDblRUeGpLVGFmdEpac1paYWhPTVlGLy9K?=
 =?utf-8?B?a2RUL0JXeEdsazFlanFxb2k1QUpFMG8xTTUxZEdkalNDZldGMHd2KzhSaGc5?=
 =?utf-8?B?Q0VHNVAvbWg2dCtLV00rSnlNdjhhYlE1RGYxQkhQV2pwVkZMV0dxRXMvU3Jw?=
 =?utf-8?B?bDFhY2p3RlhCUFpTSkJpTFRIeGRMRG5yYlFoYllSbFdHKzFuMEl2akxKWjJW?=
 =?utf-8?B?KzRmTkxvb1FiRHJQOVlUZlp3bXl0R0RBa0xtZFhCZG50QVdXeExETXFhWDRa?=
 =?utf-8?B?QmE0SHZkeGtLblZzcFNpdWdLanEzRWNlSG5LYmhDM013bWRLUWhUc2Q5Yjd1?=
 =?utf-8?B?ekc3SHQ5SS9KcXdIVGVnV0dBRXBFaW5IRzZrZ0V3SGd2eXVSUk9neE5sb3B5?=
 =?utf-8?B?dDR5eTgwV3B2OWQydlJFY3d3Z21jWlNWN3RESzQ5RnBoTVhTNE5wWEdKNERT?=
 =?utf-8?B?M3hIelRkK1QrS1BQVkRNaFpLcVpscXhBR0RCTGtHSzE5OGhpUEtLZ05FQTEy?=
 =?utf-8?B?U1ltdENtZm9BUm1YaXlIUEVZbHBvTTVoRHkyLzVia3JuNU9IMlEvb2h1V1JN?=
 =?utf-8?B?MW9hL3JGN1RaSUVtcnBMQm91Z0pxN3cvU0pNRjg4MUhQcUFzdWhWLyt4dDZo?=
 =?utf-8?B?cmdTNFE5U3p1Q2hRa0M2eFpBbytIZFYzSFlsZkxmZHZjTDVDYzNySW9oQW5v?=
 =?utf-8?B?U1VWM2ZJd0o1eU8xNVF6bDhHRHArcHZUS0xocmNXLzFlUEQ1WDRsSlpTMHdS?=
 =?utf-8?B?TkVVOW9aeFY0UmhYamhVRzJ0cmhGcXdTVjYzNUlYdk9LOFBEeHJNT1hGQkpF?=
 =?utf-8?Q?1Pbv04fQWFQNp5A8=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ddfd106-2b3c-40d5-1a26-08df074a9b69
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 10:28:32.7343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wUr2ZP0+isAaWjTs8SSLcjXW/fn4H/9IJ4OyPg5bNSxfkQ0SeYvyGRps1O16OazDgWd2Wh6WkgAs6Qv9WRL+e11+G1JsBbbPzETskjLjK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7950

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

