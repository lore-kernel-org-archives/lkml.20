Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020119.outbound.protection.outlook.com [52.101.69.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42643B71D7;
	Mon, 31 Aug 2026 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788172121; cv=fail; b=dYIgJTfuA6kK358Zi7jVXa8rlkhMQunvEQ+0Km7jJmv4JlqL/1IfH13/BVqB+jxC5g8oyNB8MA3aR+SXm4jNTGjhpgjLb7liJuZiN8fLUDNR2CAVaZaP4Uyw4sWE8CjAkRX/987A5d4ImlQ9iCnxl1FBUw4rJJeemlqW7O/JeO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788172121; c=relaxed/simple;
	bh=Zt/pIlkvJEtVjitirDnuR8TQT3WSQMypzAWM2V/AtNQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=q5s9WsbQ6tfLqax6h0tlgzV5buvHbLqDkspXlitqkVmInT3FM3mFRST8i/Qq9tjqB813Lr+kkx8BfvClqcOpQTgCbGBfqPfNMI+SbwH99Ik1+85j454PQp/LdKMLauM6aqX7NXxOZT0e5Vj2fSx8ftUbcN3Pamzq2GvNHyxCneA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=fSfEHz4Z; arc=fail smtp.client-ip=52.101.69.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="fSfEHz4Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXJvJQgKAoTmZgg6XvquLmIkULkxb9z7tWtvyyzrX0j/1UDnEtTfyGhL+Dx/vDrjjRQP+kIDOyCemt7B1PrPBsKmnxcHOy/NJScLyuI8APZq+CU/1DjAx1WtPxRx8kBgLvL+2OAT0PfiCE8beYNmB8+LLzJ4EP+9RDUmlvb9BoroqnFs64fl55KhbZsdUzVWrFg1AqNUy0tZdqi4ugnzQAfj7gIzsANCW+MwOzC0KqR9hDycl7UwOxA2JqUXFzixKs1ZmuOK7UwPunp87hc1JpddfMGBrjChEeyXlSAGCL90NQxX3UVq2ycYysQZeJ/0u3v8XXqdYHu+ndIKroEgnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EF3dzLBfwzwvPwznr/502IBeu2ZmqLJPLpQbt6JwO6I=;
 b=CHwOlbPJUb55g0ANLC4kM36ENhodQ61w2EF1E4cGSrMeimNfHSRGu2xLxnEpBbBRJLFd25APcm8cHkklqo9FgWapMOyKSQw4qCNDCday74bO/vRhHLgsHntqe8H7hlYH6m/nVqC71+9asP06Kp87Ga9pUs1g9IxL2n9nMOtVcf1nAUUHsuXcLYCXDcIWDmgX4JuArIJj0+kkaB5/zF2AkFLtqjJkFkKvMJJiWmSz2zF7xOVvJmAtreN5F7S6MmlfjIHnNGd7t8Eb0D+jy26RQUmJb5yvQIlfkxa6rd8JpHuiAfIBCou/h98uuwWoNt4CzvidHmmpjamAby4pFHtaVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EF3dzLBfwzwvPwznr/502IBeu2ZmqLJPLpQbt6JwO6I=;
 b=fSfEHz4Zy7DNXEoEoITFSPFQvwNPEDWZSwvvZNJdHAEBnL2xDHNoncAbK+BemCyuU4jmKbFrMBGd5bdQzMPTRSADif9lq/pK4nGeFyFtd8Qm94dqMdt1eAXNBrqZ4sXZZCDCrXjU+VNgTrIsLauBRFwr3cP3Z5hL4Zn4pAcyA5Wl7UkO1JrkAauaskSK3xIlOpPiK4NVC0u3/2XOGpQpYEHyYURjZU52nwshUZq0V3Z59XPRogA7gbmt0Cvu3+zXrTQxQpJ2VcTQDW2bBwX9FsA6LTcC6jelQ/Pi3UvMGtFdsTrOOhwM+tkqeCfgeGb6ft5Lh6sOpVpvzJFW3FwZpg==
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
Subject: [PATCH v2 0/2] mux: gpio: Add optional enable gpio
Date: Mon, 31 Aug 2026 10:28:23 +0000
Message-Id: <20260831-add-external-mux-enable-gpio-v2-0-f6027a4afe61@vaisala.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEdXlWoC/4XNQQ6DIBCF4asY1p0GiLShq96jcTHAqCQKBiyxM
 d691At0+b/F93aWKXnK7NHsLFHx2cdQQ14aZkcMA4F3tZnkUnEtFaBzQNtKKeAE83sDCmgmgmH
 xEaw2qAw551rNKrEk6v128q+u9ujzGtPnfCvit56wEPwPXARwIKWtwVuvqb0/C/qME15tnFl3H
 McXPtnu3soAAAA=
X-Change-ID: 20250925-add-external-mux-enable-gpio-c9ba5beddd49
To: Peter Rosin <peda@lysator.liu.se>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788172111; l=2545;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=Zt/pIlkvJEtVjitirDnuR8TQT3WSQMypzAWM2V/AtNQ=;
 b=dvoKRPE+EA4JjvWq2Hiaj4BZjksEHNuZ+PF5CQjaPh84WWpGKq0y6s3MZD15B+ZZZbITsKiVt
 tJjvfiIhYxCCCUncBWGBCkEbFSjWHnEBQiNS2EiOi35m4qlghqwwI7Y
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
X-MS-Office365-Filtering-Correlation-Id: a300c371-910c-43d2-247a-08df074a9b0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|56012099006|10067099003|11063799006|3023799007|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	AJQn6PDIBHyu2TRM9Do0H+x7X72+XVQn5o8p5TKkjdg/UfdiEPCiDeED1v2zDbFq/j1TncIFIWQDEFwMI4C/xWRDzWaXZBf3Afq2fSMjTLqA+C5coiEwa3z/yq7S3tHfGMYjkgAN2QNOiP+HSSpRwOnubsrHT51sjZNE6D1TMUWXhAWdX3vu4i3zatJVJA/poi5l/i/30/gQZSPtcFrYimaqTnPD8VmnZ+KmCQZQiKwbBHK+s43T9YIKnCBPlCcN4fcZGONCCTN8mzfZtGfGlwgRDcKmf+W3QE8a4OytfJrnwW7G8t2DDjSLopa0eIN9yW2IhXdnQKlyy7jzbCvvAR8e63gp7S3OHeUqgAsB7uAEhaDKbZ5mYMBpKc0TOVV2lDoMv+R5LQocWggyA0/Z48CmbIPcmX41R5OaHYEW7VuaLG56Y9ferF9SQG4RWQKp1EBlxnxvhyKyOYs7TIk9Tz+kN8V6RJLWFMaffJ9pKJM5uWDPWsZ8BCUyrAC5DBNzpfbq4c4D7/GvoK804l1n1SM3+AVL+v6AKx2iBew74xsumUUj7bTVn3eaLFETlq9Qf4FpZ1HTzvjafHsIqFbdt1sWw5PW+GixYVpFfkeMb71+5eKyYVQVX4MMTnqPctsCeJCHSjoKnqvNtsucHzNCUdR7egUAeOnWPHRxc0/Pp8D2eUG3/PMGMeowW9CSou0Cc7CE6TdpZQ/dL+4liIYBAA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDNucW9WN1ZhN1Rkdko3NmFRTEp3ZU5LR2MvelBIRjRFMlE4ZEprd1NiT2dP?=
 =?utf-8?B?MGU5MGR1ejNCQlhtZllDYkt4b1p4dFJVMkhWTzZ3azBCM3pVU0RLVm4zUitB?=
 =?utf-8?B?RzlCRWJrYVdDbnNHemE2R0IyUDZrL2c4bEE0RS9QRTRHM21qM2F6eVkvMm9W?=
 =?utf-8?B?WENRSjE0T3VnZFlSaDJDRFZha2F2VVRUdzEwUEIxd1hXSEJiVFovVlNubjVB?=
 =?utf-8?B?dWZ4b1ZxU0tWaXFvblhlZGc4VDlJYmg4YW1WRVNWUmsxYk50MlNXV1FLallR?=
 =?utf-8?B?cDNVWEZZdmdCVWthVFBoRytXOHAybTBCY1VzK2FNNFVlSC92QzJZUGtsV1VY?=
 =?utf-8?B?WE1JdU9TL1o1TU9qSENTaE4xaVNBM2k2MXYzMERaK2kwY1JCTjJqb0FZQUhm?=
 =?utf-8?B?TVptT3hGbDZTUWYzLy9RWUhQb3lKQ0ZCRVJWYithL3JJQWtVaGFxZzVqNm9T?=
 =?utf-8?B?OWEwZU84dCttb2xxTWpObEUyMU5xM1V2ZkVQUEhKRVRET3RiQ1JUalBnVnRJ?=
 =?utf-8?B?K0RaQVl1TWMzVGM4b2M0YnZiUUpuNzBxUElCWHY2VVlNNXNOb1lMQjhSc3V2?=
 =?utf-8?B?VDRya2FLeFF3UHh0YkNBNi8xVE96Q29RZG9jbnphd2NOSk1sdXdTV1ZRbVBh?=
 =?utf-8?B?cUIwWXM1RFUzdU9ZTVVOQ2Vicklja1cvZzVTNWwxRHFtN0JOeE5KbzJrdUlQ?=
 =?utf-8?B?alN1OXpQVHlDQmVQTExZaUNkb2Q2dXhhWlU5MW9PUXdKNkVITEFjaWd6S1Zx?=
 =?utf-8?B?Zno1cks2YlNYVm9uajZFNXVGWlFJZkw3REdQclV5d2NmME9nS01xRDM5R2tm?=
 =?utf-8?B?ZlA3T2lwMCt3UW0wR0hvcTNHNVFUNFgxUjRjZlBnem9Cdnp3cXVVZG0vcElT?=
 =?utf-8?B?ZUhqOXQyaWdySlFSeEdhalcwNkZOaG9VR0ZzYVAwam5KeGJSR3V0cUMxRGNQ?=
 =?utf-8?B?Zi90cVdHaXZqZW1DZnNiNEl3WlB4SzJQV20zOENaS0N5WVh5VXI1TlI2SVVL?=
 =?utf-8?B?WWNIYkZXc0R4dnVYUGRkRm5UQkg2YmZ6TXBJQnp5VjF4cmtMV2lReS9jRXZW?=
 =?utf-8?B?ZnJsNTNuVmZKWU5wRGM4d0xqbDZEYXRGd2lEaWxXaHB0TXZ4TytDNWhqcTdr?=
 =?utf-8?B?UmhVZWRRSklvUE9mSzJXWGRpNkdnUTVsS2kxRk5YM1dheHAyMU9TaitrTTVO?=
 =?utf-8?B?UWlKOFNBdUJ4WmgvQXIwZ2h0ZmVkQ29PSmZLWEU5aFhhdnpKQUw1YjdHWm0x?=
 =?utf-8?B?dEZUaTBqODdYMzBsM2NyVHZmQUhUaFJTcml4dE9nbW9mNitKU0NQYUwxdnQ1?=
 =?utf-8?B?ZVhqbHJSc2wrL3AvRjk3QmpMQVk2R3g4Z3E1U1JiZS9sc0ZyKzZtU2UwYW5T?=
 =?utf-8?B?aUcwWFpFZlViTWtNa1dpZzJDOUgxbFdaSEMrZ08xekpka1lld1RnV2tCVmRE?=
 =?utf-8?B?Z0tYVGIvSmt1dlU5VTZMZ2sycG5zNE1ibys4cEhvemVFaG1KRDlleHdQTGtu?=
 =?utf-8?B?M3BnTUVHNlRFU0FmVjJZSHJJUlFvb25FWXY3RFp1RXd5anY3VE9DSDZwV0lH?=
 =?utf-8?B?cE5nc1RpbVNSaUxDYU56d0Z4NXhzRXNxTHc1cmVhR0t6ckQwY1BRdVZyenQ3?=
 =?utf-8?B?WHpCVW82WEVYK2JlcXpaYjd4ZUNQY3prS0NHQ0tVOFNHK1pYZkFBVDR0dCtP?=
 =?utf-8?B?VmZSUUpuL3FlVWtPS290TjREZi9rRkh1UDUzYTlTTHJhbFRlQXpoZXkxcGQ1?=
 =?utf-8?B?QXRrK2p3NXBaeXQ3cmZQMXZaMFJ3cExTaThjbTB6WithSVlZQUptS0FYWW5S?=
 =?utf-8?B?OGhxQjFjZ0Juc29hd2FHK3B0OW5zclUvVVAvTDlwS3BpMEJuY0dpQlg1ZUM3?=
 =?utf-8?B?dHcxdExkOEJiTXhDRjFaWGRNcnhiZDZTNnNTbm9SWlpPRGJHZ2toeDZ3eE10?=
 =?utf-8?B?dWI0SXNHUTNqSVZVTU5pcHIxaDNxS2dCQkVRRHhac0tvK1B0V0Job3RnRUhI?=
 =?utf-8?B?emxWZWpIK2Q1djBZM2JGaklsVjlsSDVlbjBKWHV0OVVNTHdKcWk1dUZCTHV4?=
 =?utf-8?B?K1RUTG9PeXdLUUVBVnZncVlqSzBUOFRPU1lIT3ZXZjQ0Y1k5ZXRLWUczbjF2?=
 =?utf-8?B?U3RkTHVvK2U5dVUyZXMxU2dzbFp6LzlURUUrV3dxekl5NG1nc0dGMnFyYXJU?=
 =?utf-8?B?TmpKTzJrM2t5S04yak9xUHNGWlpRSTQwekZ6THYrU2dJWU9WZ0YrdFpNQUc4?=
 =?utf-8?B?Z1Bua0NBaXo3YW51bWhkclJWQnVSdTFLL25FUGFpQWlHWkM1MjA3V0R6OEJN?=
 =?utf-8?B?N2gxcGxwZ3k1QlJTazIxUGxOOGFucDRyZXVvcEJndUFSaWFCdC9pOUh4ZEZM?=
 =?utf-8?Q?gnhMM4Zjg1ak0y6c=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a300c371-910c-43d2-247a-08df074a9b0b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 10:28:32.0875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nka5rotZTafRm0ldbAO3Sba87h/JEAlkbPd/MfBEKGL4A0BSRquFCVoMnjhczjokrUWisjWEEZGkveBdClrli3N8m6n2CqIE2oHwTgWgNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7950

Analog multiplexers have an enable input that puts all channels in the
high-impedance off state independent of the address inputs - the E input
of a 74HC4051, for example. gpio-mux has no way to describe it, so it can
neither reach the idle state of disconnect that the mux-controller
binding defines, nor keep the mux disabled while the address gpios are
updated one gpio controller at a time.

Add enable-gpios for that input, and use it in the driver.

Tested on an i.MX6SX board where two SFP cages share one SMBus behind
DG9411 analog switches: the address input selects the cage and the
enable input gates the bus, both driven by a PCA9501 I2C gpio expander.
With enable-gpios and an idle state of disconnect, the parent bus scans
empty between transfers while each cage stays reachable through its own
child bus. A logic analyser on the enable, address and bus lines over a
full boot shows 97 enable windows and 82 address changes, with no bus
activity outside a window and no address change inside one. Dropping
enable-gpios while keeping the disconnect idle state makes the driver
refuse to probe, as intended.

Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
---
Changes in v2:
- Describe the enable input in terms of real multiplexers (the E input of
  a 74HC4051) instead of repeating the binding text, and say what needs
  it, as requested by Krzysztof.
- Add the missing gpio-mux: prefix to the binding patch subject.
- Limit enable-gpios to one entry, and require it for an idle state of
  disconnect in both the schema and the driver: without an enable gpio
  mux_gpio_set() drove the address gpios to the bit pattern of
  MUX_IDLE_DISCONNECT instead of disconnecting.
- Deassert the enable gpio while the mux gpios are updated, not only for
  the disconnect idle state, since they are not updated atomically.
- Show enable-gpios in the binding example.
- Link to v1: https://lore.kernel.org/r/20251105-add-external-mux-enable-gpio-v1-0-e59cba6f9e47@vaisala.com

---
Tapio Reijonen (2):
      dt-bindings: mux: gpio-mux: Add enable-gpios
      mux: gpio: Add optional enable gpio

 .../devicetree/bindings/mux/gpio-mux.yaml          | 22 ++++++++++++++
 drivers/mux/gpio.c                                 | 34 ++++++++++++++++++----
 2 files changed, 50 insertions(+), 6 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20250925-add-external-mux-enable-gpio-c9ba5beddd49

Best regards,
-- 
Tapio Reijonen <tapio.reijonen@vaisala.com>

