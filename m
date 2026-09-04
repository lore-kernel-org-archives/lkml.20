Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021082.outbound.protection.outlook.com [40.107.130.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A59841D104;
	Fri,  4 Sep 2026 06:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788502681; cv=fail; b=r+9BMKvx+x2HCCgZucdQTjqBtHgaXNt3Hs3oLyp/44jmRu77fY03BPJvlqpEp7cnXEkwNJtyVu/kYh6kTscUhGf2HLFMLCGTUJmqoPZapXGbBX1opNTvWLSasKm8LxLhuUU9lefPyOW/NcAEIy13xF211bXfeeoBX0z4qUbHpSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788502681; c=relaxed/simple;
	bh=YJnSnI4PKVHrNXPOc0Og/62sPL5Sb/ejiKQkPMVdMZ4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mHvTRkBR/9jGtJltnLMFTJRRKchO4lCGHzj/nfZ4uezQZTj0r8qN+820vb69UMgYp51NL+KAII/Kx2bjqB5chOecLKn5M0uJDLU7pHHRpu8h6nw0EJD7FBZdMnq6UHRaQsdpdtOQd6Hp/HvYbltPKu4jSIafZooA2nmaO6vYKbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=1Ogn0c2S; arc=fail smtp.client-ip=40.107.130.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="1Ogn0c2S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLnoSIIubnSTW+Ll4ga9BEtXgnfN5zjDitxj+UMeCTmopge1XyRNRstOmkWf1NV3952Vb/6FEExl3hpdcq2Om5rO9pIYnndll6eR3/M7vS1l7oXu1r5kbpn0DEd8b8pLNqT9KDTQU+WH0wIq+ACOzem7jt4o9qT1nsxdTf9eV1ua95DtdUdtsPH/6r5FuiGPzz0Gc8bNJ9otZfLwofAII1b4lAEr1hD78Szg2EISD1b0rD3iz6SvjBFAPnDyK6TpHpdmFK7l7WLrAOLtNW1Wx+VM3kbPGe4wJyYtlVFLejPCbsZ8hSb80pg7sjFUFG7Qi1BVrAbtsuDSxAdyTW1rIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9b/7Jdnvpj5I5+EQZxn32pFDWV88L40jUiBug886KM=;
 b=N9VBrNXUw7Z9bf0zI8IAiqzTE5ySCtya8+nCmzgPI8XmnAyKu8g5V8n7LvWeN1W5GF/NW1caJ23YK6rhmAs+06/Fa9CqXKk91REc3K7tCahwb59LRs5UdupZGWkLqLZx/wq+/gKXH0yiowSa+Y5PmBnVkMVyJdNEAcEqLOhAdvZ7V3xYmNkbL9aVqBKiiO8LmJyrDZA9ZaVkCqRMRLCDGr3hiBQf5pWxL7yU4mJmhSQ9RJKgeQfGQLfIIc0l0dSU5gGcgq9yC3soiXD6For3Qx8+1eWpPxONS+ETfXrJFQUpuxjeIWfkg6RDxvE2VeRpm0q8HI+k1h3xaBNQUMvwhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9b/7Jdnvpj5I5+EQZxn32pFDWV88L40jUiBug886KM=;
 b=1Ogn0c2SrcP59lu/J3pweru0I10hK3orzy+aLf3/wrY60dVZbAz3p+z70cOSpUSikXChYny6y4KyI2cky8fFbm9RB8iTWnV96Ez31LyJKxhJC5kX9xcxxc8lQDgdqf4qaqBau7z8eQMbf5gXXhpIGS2EuObLgWiRY9KY/1p3CQxdxeAabyZq44pDBXf5x+6D5psaQJ7NA7pW0Duy/uDvXIxxAqVMOSfu18S5JGlS0WsQMUdn0kKI6j/ye77OfjfSsOflFgzmmeIGzmxUJK+1kOnVPe97LHhv4+LnMID+cGhtt08iJokEd4xpZVY1JsBIh02GsbOFMCvBKuKk7gvDRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::23)
 by GV4PR06MB10345.eurprd06.prod.outlook.com (2603:10a6:150:2df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 06:17:48 +0000
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17]) by AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17%3]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 06:17:46 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Date: Fri, 04 Sep 2026 06:17:36 +0000
Subject: [PATCH v3 1/2] dt-bindings: mux: gpio-mux: Add enable-gpios
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-add-external-mux-enable-gpio-v3-1-1b868e669e43@vaisala.com>
References: <20260904-add-external-mux-enable-gpio-v3-0-1b868e669e43@vaisala.com>
In-Reply-To: <20260904-add-external-mux-enable-gpio-v3-0-1b868e669e43@vaisala.com>
To: Peter Rosin <peda@lysator.liu.se>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788502664; l=2524;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=YJnSnI4PKVHrNXPOc0Og/62sPL5Sb/ejiKQkPMVdMZ4=;
 b=y9HkMAcT3Dnv/x5cSHcjHwNMvf7fbXEVTCG0YT3LcNc/U27J7j5VsCr19ZUoVUJ9qpL7cU+pG
 /mc62FJwaXLD+fNmvXEaynVRxdaml8Pd7Tzo/rYSs5pATJJCYglEEze
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: GV3PEPF0001DC2D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::10b) To AM9PR06MB7907.eurprd06.prod.outlook.com
 (2603:10a6:20b:3a6::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR06MB7907:EE_|GV4PR06MB10345:EE_
X-MS-Office365-Filtering-Correlation-Id: 328170da-5b80-4560-5cae-08df0a4c3ce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|38350700014|56012099006|10067099003|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	i0yyaBjAiST2xbx4XQAcps+16wpdZxnpd6EmQ+Km7SxsMBTiXAceAF7V7BhoHILhwcjO+l5l5qn8x/8VhPSB3lrllN066PQPLSJHnNeObp8Ep/WcFa3Ip8YcvzQwNCXlLsUses/PEVNjkhlBizyGhXmC9v1qU0RxoVli77CDtTJhyCWonhKMgqAfD6z0z2uGx4BjgQI4mpslzRX7OTuY+KTgPI6paRR61l/jHxVEqPyjVUkmetFujsqQd7WL2tlaKY5WRxbJGeimZUsIYyCdPImpO0wT8LD1gszmYe78ErhcVVtjnQBQLCz2dVbcSGRyTv4qRqE/EcHOZJUDf8c2MYRg/6TkeawQGH5LL+QnK6lS1JPjv9eYFhaaKdSwLZuEYbqb91eFzziI1IKlw7FBxBnfXoRL0K0zqF82a7PyP1Rgpqa3zVrh9khRtl/im+akcNlWezFfE4hXmY+jsIsn7n40LCcexj2hg9FF7SKvisIakvYfRCjLqhi7BLLukOLcT5gv1YsiGNZFBGbpjuT5S+9NZrjgPHxVvZrHaZGvMZ27i/XxYUcMsQq4+E848w6lSCSqVRYyJbq85Hmdl1ZXYUmS+QMdMsz6tPkwNtFE+TqXJoJqyII8VKm2dFBYgXPgA++8+LQMfFAP6xmWZBau+IJG4NlyVj2KoFBuPx8JGSkN1f+snhP6B1+c/7B3OzQkq4+jH1s2suzLYXyb44v5gA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(38350700014)(56012099006)(10067099003)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1d2TkpRMWFBamJJV2V2RHU3MXZkMHVSR3dNNm55T2JaSUZGYnF0dmdDNGl0?=
 =?utf-8?B?YTJTeUNSSDVBWWVEMDVpTHRDSXZtNFVBZmtEa2plNE1Ld0VISFVqd2hKZGdX?=
 =?utf-8?B?Ri9ZbjhTYTQza3BVY2UyUGNDSDhFWTlZNk5FMFRNQnJ2TGE5dGNjellheUps?=
 =?utf-8?B?dnQyQmE1NkNRVjhhWVpTcFgxZ2Y4QVArMFJXVEE0Tnptd1pPUXE5RjhqSDRz?=
 =?utf-8?B?ZlpGbnBzR2hTWk8xVEk0YnFrbHFCZGRnREZ5b3l0SzFPV2dHV2s2QzZGMnJN?=
 =?utf-8?B?VVVINUMvRkk1d0d2Mjh1RjJ3aHlEKy95MHcvMVBaai9yRmtWMDJLRUlacmhC?=
 =?utf-8?B?YktqQm9pRTBlQU9lSmVwbG9KejBKWmdsdi80bEhkN251TU1hNEFiWmJFTHNJ?=
 =?utf-8?B?UTJJTDFvYkw3a08zR1AwdXJUSHA1ejdJMEpDZDN4Y01MM2Y5YkNKUXlNeDJz?=
 =?utf-8?B?STZpeDNGWFJhVTBaNytENHBlcGRnSFY4TC9aN2wxNlhVWVJuMzYrQXYyK25v?=
 =?utf-8?B?TTUycSt3Uy8vbTdmeDBuNUdDSlllL2IwckdPOVNQbTNtS1o4MGNvNFJZWUdF?=
 =?utf-8?B?RWtFNldGcVNyRDVmS0dXaDdKemRiTzh0SCtZLzNrVzMxcHpLcHNRc3RCckYy?=
 =?utf-8?B?NCt6Rmt3cDhtS2VWanhzcFFXTXRWZjd5Zzh0N3FCelBwdThSN25yZngvVzVP?=
 =?utf-8?B?M3dMejBwWWdxSEdDdHdLK0x6dzFndnhjdDhEdGxZNFdpN3AwOUtRakdmTEds?=
 =?utf-8?B?Q2hhUU1nS3RIZXZjR1hMTGxoR0I4MkpJd2FOSVU1ZG5LdzA2a3R6WEt2cEZ0?=
 =?utf-8?B?ZHpIYldUYkZyY2ZqcGVPZ0tLU0NsUnl5TUJCUzRpOExNVUg5bUN6T2c2cGg3?=
 =?utf-8?B?Y2FQcERrZFhEYkN0a3oxdXFmc2VkVmhBQ3hwK3JhdWV0aVE2TEE3d0RlN2xy?=
 =?utf-8?B?S2lqUUhNWDdRZVRPUVVNWVIvUC93ZnhvTERSQ3dWcXNibk5NbVl6NnJPNHAx?=
 =?utf-8?B?cmtaQStHcE4yakZ1TW9PU2w1RVMyWjFyS1V0RmVCS3pCZVFVUVJXSE5CTDhC?=
 =?utf-8?B?K3FDNzk4SkFSN3pyT3BSSStVSWNlcVFxMFArZkV1OFZlSnM5ZUNicDlqL2Vm?=
 =?utf-8?B?dm5hNmRhWUt1Sml6NWJET0cvN0xnWUJISFhEYTFqOUI0cjYzdHptZUFQaStC?=
 =?utf-8?B?UCtyTFIxdGNselNhcXkwdHdGYklSd0RIZFJEajJvL0tGUHRnK0hiZHp3eE16?=
 =?utf-8?B?bWQ5L1A0R2NGTzRVWkF1QkFjNm9SUUlPaE9GRTU1WkhLSEllZVFxMG9haVU2?=
 =?utf-8?B?WEdzbWZVUjl2TnREVlgzdlR0dXhkUnlFakFwNGtiVnprVmIyS1drVXRqZnhn?=
 =?utf-8?B?WjJaZVF1N0VSL21Odk9SbGpYdjNuSXNuWXAwTWxZcm1zSGswWUpWNm9BTUVU?=
 =?utf-8?B?R2pxTWE4c0RMQW1BS2NnTU8wVTJzVFdhckcrc29sZW8xMHlybjJZYTJFVkhI?=
 =?utf-8?B?Wit5eS81UFFVZkNRbHFaek13RWJNT3pxcGZ1MklJU3djQkRLY011dmVrU1hR?=
 =?utf-8?B?NjRtWGc3WGJlQW5ZWWhrQm9sbVVCUGtDVzNzT0loenFVajJrWXpYUG9UK1V1?=
 =?utf-8?B?ZUx2T2s4aHRZOG9nRldnSXpMNWpjL2RveTVJNi9WODRBZUFKOGVzRGhmbTBH?=
 =?utf-8?B?MGpPTC8zR2ZxYXpocFZyYzNXUU5YY0liVlp0MXRXQ1FZeUhsV1hxK0k3MzIv?=
 =?utf-8?B?RG4xVSswUm1VVWprb2JHSkdKN3JxcVBkeXJOVWlZU0duQWIwSGJ0U1oxZDND?=
 =?utf-8?B?ZUtXU3o1aUE4cjlVcFVNQUJHbG95RVB2ODZ4YkRlZXZ0TnZwN3djNENQc0tw?=
 =?utf-8?B?OVJGblEvN3lDM1NhNG5tY1RDZTRzK1F4WktDT1NxamtCeGJuZ3Z2NGlJdU9C?=
 =?utf-8?B?WUw5eE9oK0RwZkd3cGFOblRwOWg1STI5K3dhelB0U1ZWRFhpMlgvOFUvS3lr?=
 =?utf-8?B?eFM2elJQdy8rcTdrOTk4czBjdVY4Nnhyb0JZWVRXTlNzbGNNUWoyWnM1aVd4?=
 =?utf-8?B?QW9sVWJSN3ZiYWdkUmNYMXZBVmwyRXVrdjMrZWw0QW5TNUxONXBVcFhuSnpG?=
 =?utf-8?B?WHRjc3NMaHh2aHJEVlJjdnJXWk9yQ3djQXRybnpZR0hibzJDNTdTekRZd3B3?=
 =?utf-8?B?b1RVRkxRY09TOEZrTHJvRjJjQWpOSUFPRGJ1MkRtZ0MwN0VqcmtPY09PZ2Fu?=
 =?utf-8?B?WU9MV0c0UTBhZFFuUXJJWHVrU25WZGlxMElQeU42dDFuK3NmSXBCMHRZb2c3?=
 =?utf-8?B?K2RuSnhwTUlFQmZOb2plSmlOZDlSemZKK2RnTkcyaGxsUGYxZnVZZnYyRUtK?=
 =?utf-8?Q?DANSWR7kLsxaOtno=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 328170da-5b80-4560-5cae-08df0a4c3ce5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 06:17:46.9669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: civuap0GNeyWQj+jA5fiYuqRwxrWSL2grdHiYZpRadux/2Xb84rkJbOqXHOODV7xHPhOQ6A4reoxoYSC0K338P7XYHVDQ49xFZhaVSmBkko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR06MB10345

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

