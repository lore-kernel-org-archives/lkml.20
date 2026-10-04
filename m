Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021094.outbound.protection.outlook.com [52.101.70.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E67442391;
	Sun,  4 Oct 2026 12:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791117038; cv=fail; b=Dzkw/0q6s4FAAiB0wpSnxAkP1S8C3gPSXt7+OtoqJHkjs5OpVevKbBccBf1tic+Wnfq224N9Gj/OhdChHVjaKiWNo4IcB/0LSKiwt/AYCdrvZvDJr2zvBomsvhfuZ5KYahwonoN0/N6zMe5jCI04PgoHaT9FZbOvNVr0or4oRXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791117038; c=relaxed/simple;
	bh=80JtJW8xTHaLDQ5QvucXt2XalGNOGtTjQT1zfWKlWnM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZnXaGcj32DUtYZi3vk4EuE59VZHa9CVubSOVru6lssrgmizA0PTs+Xdv0fSOLvX1EmPrAuPnSjSF8cC6RDaavySgRysiydWKziYax3OR1Xe2EnCW6ebPzRGMr0/FF+CrMJEffctXRz5EOGuAJa5q87/NDy22w7s2yqELREnwecg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=hWziEikX; arc=fail smtp.client-ip=52.101.70.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="hWziEikX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROa8HW+NURl6RwPIUVlTrHWzbR6qc1IjYjAFm6ur9jJ6sHJo4ScmgyDIvH2ZxDatFZ1L5FqvFS/BazwKL5A/W5ZZdEjKGAA3fTuJsywjaZvWoXqQk193bvhBgzsyTKF0ejwE5+kHRM8/Y9Ay1N92yF6Dkwyn5+Nub/LXclFfrKyyM7ks6ezl93ySVJsx8TAJLIJ2KbnYBDRZzy/3ZJJx1t30Z1pfMZMXPw/iSFBxVDHqK8Mnk8ydGBWMA7o+aiEjoKgQEzO/SoBoX01Zbw5RQ8R3p57KcHETQ4/zK6qVqoXtsoYaS73p1QzjTIrdIGgTnBok7DuMhcbbPS7bF57CEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Dg1r/eqW1yNi8/LfFC1s8WoFZcgBhUKmYPHcDcDzqg=;
 b=GPxo+jImkgN/clBly7tGV1r6auLmXLw7bU7dtF9a9TNZN3v4w+EKCVUhBTM5M/RyO1T5Bo2kjIc5Dhwl4DgLD4M20yICApBF8wzsSHd9qZkTnAe+kE6deu9rmGd2Dhh/ddEE88HKWuLu/1p8Ap5IQo68OHnTtiHBhcBleHWcJTqyvmKhSQ4QRR9KkxrPWfwhQE15BikAuoMngB+b3OqF0Gku6T48nolQv2JNoewyOtmvjAaqN6sLb1zMSEzYVgzzE+I53VQ0AQ3QqPqaYKZIqEe7doPO6AcAb9bMEDQaKbqM3olaViAv9JQb77wiFRTZAhzsGlFEwdZupegghlGkxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Dg1r/eqW1yNi8/LfFC1s8WoFZcgBhUKmYPHcDcDzqg=;
 b=hWziEikX6VPUvup6qHQfxV+V07ZdqBmcir7izChI8ZliNVjkh0FNpTicn94eBSiynFpUKR7wB+hGL5PbQrw8cQNBP+3iHIGVGNgX9cPon00TRkcurcjLcBn6qrI2IIwjK+agDgwGdzH1qTSLFGYShLnyD/nhndGqfktWrrD5ao/+UBwAUVB7G+BmOHFr1ZYuisf+N31WQNlGgNtFtsW4UziiJ/RLlQpZvbd69j2KjEwdioKRebzRYKrK4cLOikGD8fSvrSO945uwIyZDwLG2VJhnRdXeEyB49cgqGV3K6RGc0A0XT2NeI/sr2Ne4IsaYMXghGmkt/lN4ctpmIjKD9g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::23)
 by VI0PR06MB10637.eurprd06.prod.outlook.com (2603:10a6:800:2f5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 12:30:23 +0000
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17]) by AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17%4]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 12:30:22 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Date: Sun, 04 Oct 2026 12:30:15 +0000
Subject: [PATCH RESEND v4 2/2] mux: gpio: Add optional enable gpio
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-add-external-mux-enable-gpio-v4-2-e9393660feed@vaisala.com>
References: <20261004-add-external-mux-enable-gpio-v4-0-e9393660feed@vaisala.com>
In-Reply-To: <20261004-add-external-mux-enable-gpio-v4-0-e9393660feed@vaisala.com>
To: Peter Rosin <peda@lysator.liu.se>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791117021; l=4168;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=80JtJW8xTHaLDQ5QvucXt2XalGNOGtTjQT1zfWKlWnM=;
 b=Vu8IJAYZkMoSOtntHNcCc1miCGD91edpwOQVFiLPBF0hAxAut//s12GjCPPIqjxKEErUmVqys
 igKeVKMbyMUAlYzS6G9oWU5JywAEyD0wH1559318WWPuCIEXzOeVYKb
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
X-MS-Office365-Filtering-Correlation-Id: f4919ef9-7d89-4581-e73f-08df221342af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|52116014|18002099003|22082099003|10067099003|56012099006|38350700014|11063799006;
X-Microsoft-Antispam-Message-Info:
	iKJy4E4l7G729NfgXiwtdnJfnVpjOamfcvx0KQa0F3POm7M7Ay+sH/cZoIvJ2EiKSH9ENO5UFYYz10bTglyn7uFrqMRcJ8sxij55Dk0mxySgJreRiWJLTVu6peECoerNWRaEQWpr0XpwupF+OFEO9xBXLixFvNXy9+XYqJGlwmwSAjX7i8v2UKFE6RWD2nJX61r8CW51TPsANEBfpeXdqnFFXqGvrjOaYBNBZGKoizAY89qEcjq2LCSz1fQ7AiZLGW6zDnatpiSZOK9qOLKz+rzmVmF++JxtMOmOb2K02SsSD8k4OqFaBG210D5gPHPXsJnyqvONnnT8azJW16gqBK1lPTuC5/FnHMf4AD7RGyzv62C0RT2ShbGURBNbX0Z7KtxWtE9DeUbbsRC+vzdgcs+Amk3CCIlTKsxR/ixeVHVg8jIISSLBl3T2yEmAO84g00CSFzmeFYO0PuCdJ+uxo1awiAVcu1H8a7J6S0SdwElY4wrBytSl2KQrXnyRhpXOzpARP9VPdrdf+r74TUihAZb5oyireWu9hUSZ6/qFPq/qY4KnSSs1V6ZVpKZwyMlRR+AjOLMZnYB+NKnxaKR6Y0X43uGSIf4ootTwBVH+xPQehN8CF5VNMduFWUH5lxOqoYkhqwAEo7GwEVEA7EkGEwTAuW+UTXk06+3QyY25Fou2/4fUVKs//+gG0F4F7D3atnNG8lHjMkH7Q7ew/NQckMvSWEz9BK6Bf053r91K1TI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(52116014)(18002099003)(22082099003)(10067099003)(56012099006)(38350700014)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEZEMzJnbFMrSjI3Q2NxOVhDbnNlcitid2tVZ3NMeUtCR1BIQm5RT2VKNGN3?=
 =?utf-8?B?aVZwVVJicUVmSjVrS1ZXbmlKODBEK2Fwb3E4UGNIMk0vb08xaHJnTDd3T0V3?=
 =?utf-8?B?Q1hLODNXYkx0YlNGcWpVV2FNakNOM0VFVExSalN6QTJIOUh5RjVhenNldjJq?=
 =?utf-8?B?R2tXdUtTWStLM3hrWXlZYW5QYjIyRmNtNzQvUUwrUVlvVEZSL0tyY3drUi9E?=
 =?utf-8?B?R21Md09weW04VkVjRzY3bEZmbVJHRWlxZ0srUWhVOG9QT1NEMVFTZnlEbC9I?=
 =?utf-8?B?eWRBdFJ4TXBFTzVKNmRvNDg1blpWUytsdE9QMFBTVUtlVzIyL25HRmxvQnNB?=
 =?utf-8?B?ZWFsWkE0aG9Lb1VZVmZkaWFyKzU0SGM4RmRxNUdZalp3OXoyaDY5RkFETWJT?=
 =?utf-8?B?am44NTNSUFUreCt2c0dQZ2VTY2RYUnZHU29XMXVqRnhpN0gyYjVQRWFLMlhD?=
 =?utf-8?B?UGk5V1lOeVFSSzJzNkdEYytNR243a3ZObEFhemh5OVNsREMrZzllTG9zQW5B?=
 =?utf-8?B?VjNNS0dFSjdyZ2xGZ1o1cDlJNUdDUVplY1o4V1JxUXlBWW83aDI4SElCb2Zh?=
 =?utf-8?B?K3dCRytSZ2lvMDVrK1RaUzhLajA2L28xcTVLNHJja2FaRngwQkwvbWMrdjZ5?=
 =?utf-8?B?MWhjS1pKc1NLRWwzd1ViNUxWWmNUdFdJdkcvY25EWXlYak1BYzlFS3poSnFw?=
 =?utf-8?B?L3YyU3dKdUZabjFZcFBjbURreDNaeHE1YmVxTGxvYXVlVkFSK1oxRXcydk5M?=
 =?utf-8?B?VG9CSGlvK1lvQnRlQVY1YkdMOXN1VmlOVlVGL1A4dzVZOEUwZExweC9Gek5t?=
 =?utf-8?B?WU01dDdaM3pLTTZKdHg3NFZjTExuM09rQmJ4OTg3R1c0cldnbEo0bkZPQk92?=
 =?utf-8?B?Wkg5ZnEwQ2o1dWwvS2JBV1FtR0d1VVFSVWdTNm9zcStWMUx0K3dLbE9Ybm1U?=
 =?utf-8?B?Z0FCa3VnR3BFbXYyYURuRjFVUi9qWWkzWnB0R3h1ZlFYSnRsTWtucDZOb1lx?=
 =?utf-8?B?M3pVZjJoRFMwTDNFbVljYmNVWWpDeEtoT0ZyRHVZS0wwWTZtbXdsRzNrNUpJ?=
 =?utf-8?B?S2ZaRmdFZmt3OC8vMms5eWE3eFYwSVJLQndHNzNFZ1lGOXRnNmZzWk05Ky9z?=
 =?utf-8?B?emNnS25qLzVOYjZ0ZXhkNGFIbmdndEc5dzF6bFQxTk1OVDk1L1M3bXBldzdQ?=
 =?utf-8?B?ZjZGckNPSWhrYU5NQ0YybThGZE9Pcjhwc1c0Mkl5ak0rMTVQa0hSR2NTSXZL?=
 =?utf-8?B?VTBQLy9jNE1rYlpHNkZ1cDMxdVMwZDNwR2poeWkrcFlNZVBRM0tpYVJXT2Yx?=
 =?utf-8?B?WURzMEpxRTBlTXp0dFl2a2pHa0xVeFdGMnRUNk04VkJwYU5IOW91M2F1Nzh6?=
 =?utf-8?B?b0IrUVlSWFBsd0JUcWdIbVpvdWdXRnRPdW1BZVVrQXlXQmlQL2xtYkx1UjF6?=
 =?utf-8?B?aGdUYlUrMGgwZ2xSY3psOE0veXBUODErWGhNOU85WWpLOEwwWWpzUmlLbXFh?=
 =?utf-8?B?TWkyUVMrSU9BQXRmVHVUSVJ1cE9IcVd5Tm5sVlRXSk9HaVBOajNTY0cweWtv?=
 =?utf-8?B?R1RlUC85dzRtekpwUjc2R01SbGprLzg4RTdUSHJycEVqdVhiTm9LdTFNMERr?=
 =?utf-8?B?MWliWnBWbUdxK0E4SmJHdzdodzVWNkZ4OTE1TDJDc2VuRHgvTWtLcW0zcDRT?=
 =?utf-8?B?SWZVQ3F6V2xjdjJreE9PK0syTmN1T3Y2b1diQ1NCZC9KN1Q1MzRqWEllS2Fq?=
 =?utf-8?B?TE9jMkxoeFIxWWwwZXkwSFRjRUxKcU5mMlpNWWFkeFE1aTZhOGRpb1NadmRV?=
 =?utf-8?B?NVdTWkxRbFN1RjNHRENkMTRvMEZOWDhNZWh3dkxGdE5TY24vZTFiZFk1MG9z?=
 =?utf-8?B?YkN3YjZxdVViTVZFSW15blZSY2p3UGNzdnE4d284bTFLWmhZdVVVenpYcHRI?=
 =?utf-8?B?VEFGaWtKUE95NlpRZlR4ZU45ZGkvb1gycExUR29wQ21IbE43bjl4WHpGcFFZ?=
 =?utf-8?B?cWVybEtvWlgzaTUzVllBOTlHQWVheXcwWTJEYWRtS2g3U3IzT0pZTzJLZkx4?=
 =?utf-8?B?RjdVNklScmhFRUpJTGp0MUVhTzcvZzZXRVJSVEoycG5nNU83amlYU0pDdnBW?=
 =?utf-8?B?WlYveFRMVGxrdVdQclVneWNVQkpLb0JFa1NxYkdVNGdnVGRwRVRLK3B1R2lS?=
 =?utf-8?B?VHhuTVFKNUFVaDRXeUJ4Rk1nNStNeGtmMGtnM3N6Z2ZGU1ZDMGJUa3dFL2tn?=
 =?utf-8?B?LzFnREZsbVFSTnRnblBCR2tnU3NHTytwQmFaaTZ1M0RST21YVG9PemxRQlQ3?=
 =?utf-8?B?cFVyU1dtUFRFMnVOMkR5UE9meER0em9qdFVXYXk2UklMaG5BelFtTVdUTmRD?=
 =?utf-8?Q?W1D92G8WnUsx2wro=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4919ef9-7d89-4581-e73f-08df221342af
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 12:30:22.9338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSK1EPIDSryvCaL+Ryuc/nLILhqZnI/Uift4hJ7yndlx/GqNWnWtpQN5D9S7BjkY7I10IgsMbbj0KhFHPlklTUsX45Gao94jw7QIGg8vP4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB10637

Some analog multiplexers have an enable input that disconnects all
channels when deasserted, independent of the address inputs; on a
74HC4051 it is the E input. Add it as an optional gpio.

The mux gpios are not guaranteed to be updated atomically.
gpiod_multi_set_value_cansleep() groups them per gpio controller, and
only controllers implementing set_multiple() can possibly update theirs
in a single write, so a mux with its address inputs spread over two
controllers passes through the intermediate addresses on every change.
Deassert the enable gpio for the duration of the update and assert it
once the address is settled.

The enable gpio is also what makes an idle state of MUX_IDLE_DISCONNECT
possible, which the mux core applies when the chip is registered and after
every deselect: it leaves the enable gpio deasserted and the address
inputs alone. Refuse that idle state without an enable gpio, because the
address inputs cannot disconnect anything on their own and mux_gpio_set()
would instead drive them to the bit pattern of MUX_IDLE_DISCONNECT.

Return the status of the gpio writes instead of zero. For a gpio on an
i2c expander the write can fail, and mux_control_set() only invalidates
the cached state when set() reports an error, so a failure reported as
success would leave the mux on the previous channel with later selects
of the same state skipping the write entirely.

Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
---
 drivers/mux/gpio.c | 43 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/mux/gpio.c b/drivers/mux/gpio.c
index f9c7863e51b82fb76ed03cf17308fae74716cf6d..2fd8c83dc22e10ceeb0b402f1a2fada9a3032319 100644
--- a/drivers/mux/gpio.c
+++ b/drivers/mux/gpio.c
@@ -18,6 +18,7 @@
 
 struct mux_gpio {
 	struct gpio_descs *gpios;
+	struct gpio_desc *enable;
 };
 
 static int mux_gpio_set(struct mux_control *mux, int state)
@@ -25,12 +26,26 @@ static int mux_gpio_set(struct mux_control *mux, int state)
 	struct mux_gpio *mux_gpio = mux_chip_priv(mux->chip);
 	DECLARE_BITMAP(values, BITS_PER_TYPE(state));
 	u32 value = state;
+	int ret;
+
+	/*
+	 * The gpios might not be updated atomically, disable the mux
+	 * meanwhile.
+	 */
+	ret = gpiod_set_value_cansleep(mux_gpio->enable, 0);
+	if (ret)
+		return ret;
+
+	if (state == MUX_IDLE_DISCONNECT)
+		return 0;
 
 	bitmap_from_arr32(values, &value, BITS_PER_TYPE(value));
 
-	gpiod_multi_set_value_cansleep(mux_gpio->gpios, values);
+	ret = gpiod_multi_set_value_cansleep(mux_gpio->gpios, values);
+	if (ret)
+		return ret;
 
-	return 0;
+	return gpiod_set_value_cansleep(mux_gpio->enable, 1);
 }
 
 static const struct mux_control_ops mux_gpio_ops = {
@@ -70,16 +85,28 @@ static int mux_gpio_probe(struct platform_device *pdev)
 	WARN_ON(pins != mux_gpio->gpios->ndescs);
 	mux_chip->mux->states = BIT(pins);
 
+	mux_gpio->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(mux_gpio->enable))
+		return dev_err_probe(dev, PTR_ERR(mux_gpio->enable),
+				     "failed to get optional enable gpio\n");
+
 	ret = device_property_read_u32(dev, "idle-state", (u32 *)&idle_state);
-	if (ret >= 0 && idle_state != MUX_IDLE_AS_IS) {
-		if (idle_state < 0 || idle_state >= mux_chip->mux->states) {
-			dev_err(dev, "invalid idle-state %u\n", idle_state);
-			return -EINVAL;
-		}
+	if (ret < 0)
+		idle_state = mux_chip->mux->idle_state;
 
-		mux_chip->mux->idle_state = idle_state;
+	if (idle_state == MUX_IDLE_DISCONNECT && !mux_gpio->enable) {
+		dev_err(dev, "idle-state disconnect requires enable-gpios\n");
+		return -EINVAL;
 	}
 
+	if (idle_state != MUX_IDLE_AS_IS && idle_state != MUX_IDLE_DISCONNECT &&
+	    (idle_state < 0 || idle_state >= mux_chip->mux->states)) {
+		dev_err(dev, "invalid idle-state %d\n", idle_state);
+		return -EINVAL;
+	}
+
+	mux_chip->mux->idle_state = idle_state;
+
 	ret = devm_regulator_get_enable_optional(dev, "mux");
 	if (ret && ret != -ENODEV)
 		return dev_err_probe(dev, ret, "failed to get/enable mux supply\n");

-- 
2.47.3

