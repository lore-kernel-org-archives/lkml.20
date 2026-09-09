Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022080.outbound.protection.outlook.com [52.101.66.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A1A4B66C2;
	Wed,  9 Sep 2026 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948843; cv=fail; b=Jo0clTDHHgFhzCOsab24PZ0BAU9Y4pzTpYNszoKw5v4eusxY4ftkWT3JDvO/MKyv9sALaRKtiBU7zuAUmlq4lbGZ9eC6KZ0vBYp8lcYXbxlYqYdycXui2SwzT+X0IqvZFoVE6CD3pb1AWkizpB0SRxBtQCZ/fA42J8bKs2PgdQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948843; c=relaxed/simple;
	bh=Gr1YAJALi3AouD4e5XuzJ0v8KAWvpwPWlcL6zTI5+54=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BVmfGhuLl+Aw5E5ys8FTYq+xzTeLFKUMRV6Q0q3bdJ2aJ2nNuYPgipCXlSVI51VZfknkSXt/wCJ/B3VaOrN4ozCtS4yiRw4xNNrOt2KCXS3HQOvEbLXyBK2Jn4bZgs1llOk05H34UTLDCC7ZPvIMrE++I7WCjuTyne4arBtKjIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=DM9UbdnI; arc=fail smtp.client-ip=52.101.66.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="DM9UbdnI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzNENLB7YkXXHJRbjBIh69q8Dpw4X/34/6wxzqq7dASWfb9QWKJvN9jcd7arRuSufSoADCMnWyjC7nuGY2hYTXbk1/hZQ0hy8N3WSX+XhKKZJgR1pSXSPK6GaONpv7mXiOiSAIiwyP1v43D2wK6pi8j09TyoFw0OSRXXuHY9PGA0FGrV/kf4IgTxpniYnT/6m+iKZ9mnBm2B9yduSTGA/1SOHq34GUQxJpSkXEbbeuukWWBlGcohC0avtJZH6rZVBjaMaCMzaOEmlkcXSw4Pi8CA/4dumE2Qs2Ih89gFuQMDer5xzRCIoPN28j0vYicapdzXcjW4hQjeEXVDqWFnwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FomJC/bDvIu+G8jOMN4BGbvG9MVjlFR4kAKl2WreOzs=;
 b=M+r5yThMfNl9xb5Dqpv4ItNtqFd86m5ALy2CvxDS2aaQ0RzDR/zuUkvAc28A9zPchOaIIyczCAGGiP1UcbW/uQ/stiYvhetIAfL2axv7QWrKAvIqqlqCsy6zIWTVi/a1pk8QuQN7w/2qwykAIWis92YCyI1xYxcpmcVBWh7ctrLRgEOYacudO0wyvv4XUTwfqFxwp5B2dtmI7Lh+L101YQW0GviwAYr8Eqx68ba61xaOEgm5HmBDLoETGbstF/Z/9tbFaqDtPzBhghe3H7KcBBTX1hf5F2PSkScce2+xoaY9i0Cjrunvpgb9tb7v+QUJlw2tFr9FGwHiE+A9PTGxrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FomJC/bDvIu+G8jOMN4BGbvG9MVjlFR4kAKl2WreOzs=;
 b=DM9UbdnI9kXJfWwENBihKvuGsuAnt6/jtomhuqLtZ8oQ2q05U6UDAhWL6NqNT5VePJNyrznuRTsXNDY3KWIlxU49rgZ1TFdMXwVyc+5t2DD4vzdWHcVtDDxqpneCHvIknnyzLbwrw5i4p5rS7vXro3pygkjVrnYl1ECgd6TRunhs0fwlTA18pvpF5xV/c4oKtOcWmFvU2D6bvRc2Mz1vkPZIWb1D7+5AUZGNt0UfA3htd15u9Tb5wGN8ro2faT4YvqqM1ezJmhD92L1XI3tFF3KR5o0n3ejuxLDFKTFWaFy22VFShVJEw+v+H9HJ6HhZf7dv4DKPVfr4l+o5oCeIEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::23)
 by PA1PR06MB9209.eurprd06.prod.outlook.com (2603:10a6:102:465::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 10:13:46 +0000
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17]) by AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17%3]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 10:13:46 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Date: Wed, 09 Sep 2026 10:13:31 +0000
Subject: [PATCH v4 1/2] dt-bindings: mux: gpio-mux: Add enable-gpios
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-add-external-mux-enable-gpio-v4-1-3b12a767bb94@vaisala.com>
References: <20260909-add-external-mux-enable-gpio-v4-0-3b12a767bb94@vaisala.com>
In-Reply-To: <20260909-add-external-mux-enable-gpio-v4-0-3b12a767bb94@vaisala.com>
To: Peter Rosin <peda@lysator.liu.se>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788948825; l=2577;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=Gr1YAJALi3AouD4e5XuzJ0v8KAWvpwPWlcL6zTI5+54=;
 b=4z9Bj7dC1pVctXuyodk3PqLPVJPulBOIgdfV2IMPA+fj/ZZtJmVukLHMEv8im1R/U9Y5HQKEl
 5l5WWqNIiHFA0izRztR+L2SItnXsXJs/ZC5KwmabHhp5SWnPbpRNYKB
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: GVZP280CA0009.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:273::7) To AM9PR06MB7907.eurprd06.prod.outlook.com
 (2603:10a6:20b:3a6::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR06MB7907:EE_|PA1PR06MB9209:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5ff2d3-032c-409d-0257-08df0e5b08f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|38350700014|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	OuOLGZge5BH3ZnNb54YKQ7atY7jO4w8pEgiiYqdTD3fWbGU+684/AgvFNFwqp0qwveaixRmuxjGsVc9wRAwSNaHcJ9lu3KQ91xhg3U/pY+/gZpb2dRUBVJqYvSZhIbvDuMXoD7AfEt2r/J749TDYS8LygUp6ZtW+PNlwS6b8L25q9b3eatwj62C5MJcLkBa7hiCuTLAspc96B3LO63FYfSflYXmzwPn7WVYbdnFR9SgRzCHJbfGtvZNu+ySvfbHhm4RGOGIeCSMffZSJWn2SpqIMj+RMQFR55sKv5VyjH6qLX+3dwE9ZwsjvQpFh0q6BNNokmh3UND/TzJPBEKic1DzcC80GqcMGmi6ibFN6mdosUlQx1AP8nXZ0iPi0kep3lCvYPMUokmQY7mh8y31bVN5bKgW4YAehT34pqbaExrHZCsxlVpdxj9ioAXisco103KX/J4Wjic0AgZocDfclCpHZbvJaojbMen4FTR1uiD3Y+KnGZEay03y+Pn1C3amyWWIuWHN8VuZamQC+/rWaQeidE9KHcb0jyKtqYzc4ehCAn6Fp91n8zxisCg1WogKm88AI25BOMwr0O72Ri77LZHke+Fdgo9BOvsawGc/T8RuBOgxajgzKpYAaQiuyatHzdNQUG8oJXJLxjU+v7CsfczST11Am3jQA32MmJaNjZeSvwpnWPoRzvB4FurfYhLHyKvJKCW7ETmOXgkWoZ9wn3w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWtyWmxBanFwVjVmUlQxdnJCdVVXVUtZTW5OMHlvRGt6TUF1cE5maGNUWFpI?=
 =?utf-8?B?dXNCWUVsdjZIS2RiUFVNUEU1eVNZYWowYkVkb0pERXdJVUQwUE9GdHcvbVVo?=
 =?utf-8?B?aFFMQVl4YlFiRzl3Qm9pdVdBeTZpdDgrRDlHT215NWdwK2xxTk5May9sWWNy?=
 =?utf-8?B?MElmNEdMUHQzZ3U0VkJsMGVqVmdtTmJHdFZLRSt0S1ZEUThneFRvQ21kR2pQ?=
 =?utf-8?B?T090OXF3ek1qV2o2WmRuSUlkcVdhMEJZdThBVzBCWEFpckc0TlVHeEt3aExt?=
 =?utf-8?B?aDVnSis5T3BMSUl4VjBFYjBwWGJ5VkZzRy9RUm9oOFlIYlRhUVd6RzVOdjlx?=
 =?utf-8?B?L0loMThJL1BJNHRMSy9kNUJ0TlFtSEhvWEVWNXZZWUROdWVvMDFPY2ltNHhW?=
 =?utf-8?B?c3l1ek9uSVhXcGR3djVtOEdleTkxNTMvL3M3M1d5UGtJUGk1RkIrQWpUaFIv?=
 =?utf-8?B?dDZ5T2MvNXQwanBrMDF1QVhhakFiOEl0dXVMYWtlZ0hHSmtwQlpCbWxLTm9O?=
 =?utf-8?B?akxmUEsrSnJIb0xRNG9UWlVIYmdXNVNRM0JFUWR2TmNHVEVKMytGVUNSUmNX?=
 =?utf-8?B?enZNaFU5bzdjYk9tcXRsa1hRVmdseTBMenUrTkxUSkdZZ0p4Q3BLTlVtME91?=
 =?utf-8?B?cGtjZ000OWlKSWt4RGFJeXV1V0ovYnkyT3E5dmFhZk5RZEhJK0pGQ0NlRENp?=
 =?utf-8?B?OTdCYncyb1cwdk44MURBblpwUVhXeFhKaE85QnZQWnYyeUUvZnpOV01lVFZ6?=
 =?utf-8?B?TW5KQUc5RDJFNjVoMHh2T3N4MWE4bGFjWnBlUHNoak5Jb0xzTmxRYzRveW43?=
 =?utf-8?B?VTZrb0p5MWpYNW5zbk9PeHJDcGY1eEJtamthbGg4S0FpeCsrZEJFUkxjNEZQ?=
 =?utf-8?B?dVBqWmxyK2lqOXdFZkJvSUJKeXdCTGFJTzFZVkFDL1FydUg2bG8ySWhCOXdq?=
 =?utf-8?B?ci9XeHNQM1ZmZGpMY2J3V0pEcXN4d0RHcVlvMVE4S2lxMmNkYmpENzE3d3JJ?=
 =?utf-8?B?Nks1czFmMGYwNTFoWmc2VkQvOG5KbVhscDNkRzBxT3JLMlJIL1pDdW1odWcz?=
 =?utf-8?B?SWFYRWNMa0pSK1hwa1ZDODZHZHErOXpKbGNpSEZMMjAyOGV6MWlHY092aHY2?=
 =?utf-8?B?YnA2V3Y5dktFUUczY0k3YUFHYXpMUjBzMW44NXNHTHhWdWZ0RkFoNm45REtH?=
 =?utf-8?B?VVNMc1BJVGQ2eC93Z3pVVEY0L1ozcWNnYld3MWFoMm9Ka1pneDJSRWZGdDF5?=
 =?utf-8?B?c3FBSGJ5WjVPeCs4KytqV1BXZUREVVlrTmNNZGEwVk9GSWorR3RuMEJyWkVu?=
 =?utf-8?B?YkxJQ0syNDJIQ0l0YktxeVJ0cVErdnRuWnVFVE83VE43UFowUVZvenB4TFl0?=
 =?utf-8?B?YWN2V3A2Wm80dGRpVFp1TzFDNFgxZUZsTnNMUnFta1hJYlF6VXBmVkxTaWhs?=
 =?utf-8?B?enNIM3Z6dzd1UGJTeGNDTkZmUXo3VzVtME9qd1dsZnV3cnZWaW9RblRpT1dZ?=
 =?utf-8?B?Q3plSTVsVUZnd3N5akRCeS9vajRmKzV0aTBGUUFGMFk3MkZoQ0VRb3dHYUQw?=
 =?utf-8?B?dWtkZE82UkVTVnNWRnBoT3RZUUU0L2YzaTJ5TEk5MXFWQUJvVmpxMWZmR1Nt?=
 =?utf-8?B?RkxCNkU3elhMd1dVQlNRQ2Y5YWNhRFVzQ2NDdk1QcFB2YlhXQXlZZnJCOWNN?=
 =?utf-8?B?ekQwQ1BiVDloUUdrSnJ5VDFXa0lvQmd1LzVPQzM2NUdWNGdSYU9vbS9qNVlU?=
 =?utf-8?B?Si9ZUC9IWkt1MnlLM2owTWhLa25rUDNLWmRPUlZEOW9ZckdVVk4wNHVXRVht?=
 =?utf-8?B?bk14TlplU3JESTJwWG55R0Y2V2lmYVJTYzR1QmNPaTNWRmZXSGppbStnOWg5?=
 =?utf-8?B?M05YSkJyd2VibXVCZjVTY3BMdVdpMXFCd2lHRlpDU0lNQVFFKysybmZiYWZN?=
 =?utf-8?B?c0tPMVNoUnZPMVBUUWwrVDBEVy95RHBXTnA5TW9jQjl4RjVFOHZ3b3l0d3p5?=
 =?utf-8?B?K3FObW5DTWNqVkRWM1lpK3VvTm0vb0pLS1hsSEJVSHZ1Y3J5MmJUSHBReDhT?=
 =?utf-8?B?WUw1dDZ2MUVwQ1lTekcwaVZQNEE4UmxTdTdBbVlETXVpOWdmcFVZQnJGMW1h?=
 =?utf-8?B?Y09yNkZ0NDVhaTF5a0xoWUphSGhTMk1KR2Z3bFYwOGppV1B5MDFwNHZlMnd3?=
 =?utf-8?B?aUxwUmxRcXg3d084SFN1QnR4Z0owUmxOd1ZjajhMZHlZR2pzeVpQdmlwWEh3?=
 =?utf-8?B?Nm9wQnYxYWhJSG0xOUN4RW0vNmwvS3E5WWJzN1o3dTZZclZNL1lueXJrVEI3?=
 =?utf-8?B?SkFVOGtZZTA3UnJmWEgxcTJ0bTM5MGt0aDhUN1ZWbXh1aytLK3dyNkhVRXFP?=
 =?utf-8?Q?DMeN6UKXzdVgVCtE=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5ff2d3-032c-409d-0257-08df0e5b08f2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 10:13:46.5444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXyh+/69Af8PtopwHTXWZh3aXeBXf4YM5sCBojyTJkdiViYFJq0aobMzUAm2A8xPD9VRzoqlOzUMNJiuaI03Ibp/WEyL8Z1Xi57VyT7teu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9209

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

