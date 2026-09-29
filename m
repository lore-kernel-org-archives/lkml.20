Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9AD4D2EDE;
	Tue, 29 Sep 2026 08:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671777; cv=fail; b=F4BwIqlbouTXoJ0P/xW0h5Ck+GqYOg/qIRbo2icf15k/x+y66O+TTKR9lrWXE50ulgHYnDCweNUOHi0OWRu2IwqLrF3uc7veRP0NX8ylUyugwwNkjxn6aX84TmaUqxef/4+wfPwEY9ZMPGOmH7/G6gkWQ4oKaYe3NsO4R4rl6Xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671777; c=relaxed/simple;
	bh=thA0ZBpRwncmgan/z6JT7nXpLV4idR1q/e5164HOWLE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NWp74lR8mUjaY2KSn4OHfrNqYNNBckv2UiD4cq4ohnpoahmMfVR7GdnbVAAz3iWVbgP1dpKamBlSxroaOdLDFlfpnO+PNPlVTGx/kCV1yBNKolxbTnalqguTxOzzWF1HprWWz7R7nofvzezRC4+zp6KrzjL1f3TUjwZNPxcU058=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vhJyeXlU; arc=fail smtp.client-ip=52.101.70.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vhJyeXlU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJ2jMSlGv0hdbTYKhTiXYkg+oisMLBhuB3Dp6O08x20n5/6S68XTQ878mMl1MQj20FY9S2+k3QC6e8TUksBtxnDaz7EFMEe87E1vgaUvtkDZRBbRiICvkpBQLDVV2RUDlEUf3+s8/lkK5JPbH6fnmJC9rEBX+mnt+T5i5E4fBth7UkXlVFDw7Gwu+zXEfkHf6kVZ+oiKm9MYPaolwE5tqArs5pe1BtEKITo75dbYN+i38hkGIM9yAtHnf26QIUZ57bIQSzvJM0ojngNKUjHHhnBRN47M8KbN2GKij3XpP9YyuDPZgM05reMRoJU7yFqLMhkIxap+u7dmY9X/s3S5yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFg0REveY+ZR4Gab7mXtp58koIpRKz6HFzrci6DOgd0=;
 b=V7zcIbUxIR/w+I5SYKkEVVsJ0oC02mEPVI+zTBet4dLB5hedR7zKy8n2n0SyeZP3FkO2c2pjFPel1E6/M3NZerxGWNqHGi72oROyhRTOyKB91+QOgnWOOh6WnbxcDkYi6OR1M0vI5eUG0bQV4AO1wJuXl7t8VAOPa8xTdg476dFCAgIRi7+w75jXibY5WFOjGPjm1HJ1qdP0oHwIDAKzgX2HT1MeZcWeiIMGDwaQB4czA00r/+ppSsYjblu8vS4Qqpjr3ldTX+8qubUj7pGj9fOL5lFF3O5sKwp9ipjI0K78o9ym2WHARJWkPDvyaIyM05yN3m6NJblAXV2lI0zxHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFg0REveY+ZR4Gab7mXtp58koIpRKz6HFzrci6DOgd0=;
 b=vhJyeXlUyCMxXPaHkvMq9wF5pID2SpwZjdZ7mwkn42GTEhUh4+XXdIJWd1lbG3rcR5ZBlLUMsRGXSGVF2amp6BIeLdF8KMqg3RX8jH8sK4CEC6U5hUNTYUhQJFRqEDbnvB2ckrSL+yeGLo42LgRRba8uxVotZbN+jPRETkiOThYBiEoZKAq0vVw0bIf92yDSl02WeAkTb8t96VLBvWrd94XwaN1gYLwv1B94oTUM2lqs3Yf5DtzCCKk6Y+6eOVInXsRurXUnrnEf3IpwE7zeuLDErgcj24I2SXzX4vv7Re5oZmdf/MbEQ4las47sp46gvd4ZDn10+cvL2cCmxctb1g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by AS8PR04MB7815.eurprd04.prod.outlook.com (2603:10a6:20b:28a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 08:49:16 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 08:49:16 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 29 Sep 2026 16:52:32 +0800
Subject: [PATCH v4 11/11] media: imx8-isi: Enable RAW10/12/14 output LSB
 alignment on i.MX952
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-isi_imx952-v4-11-e69f89c7c651@oss.nxp.com>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
In-Reply-To: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790671948; l=5553;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=thA0ZBpRwncmgan/z6JT7nXpLV4idR1q/e5164HOWLE=;
 b=camBimK4r9Togi7BMTYXpKKeTuXfqNvV+WXjZUHu231NrLIVMYAesM3zXPfE5HWZwO9U68vke
 WYQaj4mXtIeDmzmJf0fMtHjGy7FJaQX7XSl+QBR17eaTd3uJYdCW1Wq
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:195::13) To DB8PR04MB6667.eurprd04.prod.outlook.com
 (2603:10a6:10:10e::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|AS8PR04MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: d71d9d09-f23d-4acb-9eea-08df1e068b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|19092799006|1800799024|10067099003|5023799004|11063799006|56012099006|921020|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YKzKo0oVF1vL4+kJx18mqMA4Kkeu0SYPBVhvWcA32bMO/asFPm2URgWdLns332yyy1gc8yT7hDlTSX6BkibObQDRaQLlO+B9YZZ6ztgGRzLbU3Br2ucL+G+TL2/Gp1BgT62Xa2Cmbq8ZoechZhxWSymPaP+NuVt23Zvi5tImyk5ZqyzBT/pIbQHCBBEqHIOnGlLyHmwdSUql+FepewycYNIAOzQ848TJMe2YlCAp3tW+Q4dnkM82KdxIwgH1j3tPK2EvnBiKXJUj60oQm4VObRLZfU2+jX3pxaVWmhKqk22H65etGQAdjEYmv2svw5qJ/5Ow4hmz0jXAxgiFuf3aes+qGyKxd272+C82EQZEIbErkV3wTT4/u4DrUEDLPySemU6i283BLUOrJG6Bmp9o7fWIZK6sn9R00rn+VYyCho/P0T5RpiypGJioidWGYNl4VkdIwga/g/3efB8640JWCcRPZrSk4BWeVPkbBNZt4cFw/FmlZWIo/N5w1F8OLN3OkBHnisYTiw0c1tKcJeW4iJrJXSigY4AhxF+iVspxRcwrR5GpmRrWCdhDu6ywUQvl3TDuV658UusaNO+4xsQLuvkJgqpe9JxaTv569t/ebXl6pXQ7rGTKx9CIprDTDV9YqWV4FmS9ZFpCNnOhAOQU/IgK8AYu7fdDhRWZKS4G/4l+iSW/Lnhn6j/Lw9MLlenMRIsKNLYANIFuIuD32l04jg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(19092799006)(1800799024)(10067099003)(5023799004)(11063799006)(56012099006)(921020)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1FEL2Jjb1p0M0VkMEQrSVNIaUtMRzVGOUQwbEF1Rlg2VFpqdEFjeWlQU21S?=
 =?utf-8?B?NHJ3eWtnUldXWDliWU5za2w0KzJrSE4yZmJMYUNxd1RxaHgxNkVFTGZTVERS?=
 =?utf-8?B?Z3pKanYyVGJhT2hqckFlRkRNYXpTUTlWVnlaVDIreGVGM3FpOVFWb21aWkpK?=
 =?utf-8?B?UWdxN3dkMUtWamZkVEhnYjIxOURTdnRhWjRMdk16UG50UFB0Z28rdGc4TVBn?=
 =?utf-8?B?RVkwdWhuR20xK1VTN1RPemVrVVI3V1hMT3hXMWhVWW56TTBrTTU0WEl3azlo?=
 =?utf-8?B?bUxnNE1mZDdTYVE3eERNZjVCYm5YLzEza093djFYb2V3UTZOY1J0c1N4TVJu?=
 =?utf-8?B?QWFubmZpTVZ1WURXYVVPSUh0eStXWTk4QUUvOG1ZbklVUVZIVC9ibTFnVUVi?=
 =?utf-8?B?eHhIczhIeGQvRVhIWHlzLzVTUFNlYXNWOVFkZi82YmJqRnllcUlLLzVZTyto?=
 =?utf-8?B?NnFPL1VXQ1NaNFFRYXMvZGhHd2lYN09GdnFycTBaU0lIcGNYRE1VeDZNUUxm?=
 =?utf-8?B?NEl3NEZWaDh6Sm9GRm1uejg2ZXVyRWo0aU81ays0ZkpNakM5ZHBYMVlaOERm?=
 =?utf-8?B?dnBqSzljN01pMUVabzZkUDRPdlRMTlhkSndFR2dzVVRMYXMyaWdXZXpMbk82?=
 =?utf-8?B?aHNnZGd1VTFmbnc5N2VLaVdFVXoxK1pSMWFFeHNUeVdSbjdrVGE4dkJmZG16?=
 =?utf-8?B?czBVMFE2T2QxaWxtc1NmY2ZNTFlrWDJxTVVxOHNnSmtqYUtneFliWEdqVitQ?=
 =?utf-8?B?elNWWlo1QndmSGY5VXdMTERZMkhHcTJ0MVFHUUNhYkhFL3VZVGdIbThLTGxI?=
 =?utf-8?B?cDlSb1d5RmdoTVZTeGppQUN5NFhQMlM3Z09JSDlKZEg4OEFMTVRlZmlrWXpB?=
 =?utf-8?B?U0FFNTh2S3JqeGZINXdVZzdxVTFPN21OdXpmV1VycWxPTkdvQXJ2Ky9SN2kr?=
 =?utf-8?B?L2paSkhBdUFYYjFpcXdVUHhPak5ZMEhIRXFyMlhUK24ySXhCc0d6Wkh1RnBM?=
 =?utf-8?B?VkF2NWYzUDhEd0NIRGpKNWU1NzZERXdobXZvbStaVzh0OUZmREZwdG1rTWE5?=
 =?utf-8?B?V1VYUlllbFBOQTNUU3d0S25WT2lSRnltTFA3bHUyYjRxWlVubC93MUZKSGx0?=
 =?utf-8?B?c3FTd0ZiT2dGTHdwYVlaSjhKcVJJUXdPeWI4cmF2R1h4M2I5SXVqeE9CWXc4?=
 =?utf-8?B?SG5OV1pRSHgxWTBVaUszaVhFSXJZN2o3aVhkNEloVUdVekR3ZTY0UDV5SzMw?=
 =?utf-8?B?SDA2YkhCVnozamx1Um9GVUpub3NHVzNPdlgzaDd3SlI3V3RPZ2xVSmM2ZnA0?=
 =?utf-8?B?L3g5Y1duNUF2K0RYdmVZc0NydEVLdVQzMzNROEM1VHZjUVhDanpNM0h1RWh4?=
 =?utf-8?B?ZkI0bW5rb04vTG9TOE1OZFN3UzZUTG8vVUtvSU5JaTlETFEvRGQ3MzNlK1VO?=
 =?utf-8?B?bUtxcXhjQk40RE9nTVlYMTBuSUNFSkR3NWxwTVZlWVkwR3h6dTJ4Qmpub3du?=
 =?utf-8?B?eXhNOVlaSjN2TllJTnZhNldNS1J1Y2QxdjVsK3JwSlNwQTN0K0Q0Qk1TUTNa?=
 =?utf-8?B?bzdGUnl0RWl6RTk5bWN4UVlDUnBsRjZuRjlpdC85dGZsN1c2R2VqWDZRNWhs?=
 =?utf-8?B?WFNjQ0tSWVVZbVpQSWMxVkJpVjgySjQyam9JTWxOM2ZPM0E1RmRWRVU3Qlhm?=
 =?utf-8?B?WjgwUUEwWVZ6NVNTSEpMZ0hYMS95WDVKMG5KMm9ML3RmZjJ0TFJ3ZzBwQXFi?=
 =?utf-8?B?ZFR4b0ZzbUhLa01CYVlyOFU5a245dEVUbGthZHZDWmxIYk1UVVhkZVA0WHJy?=
 =?utf-8?B?cU8yRzl3MVRkWkxlak5INkRiL3RTQTExS09yc1RoRGRlekRleVc0UTgrT1pr?=
 =?utf-8?B?S2VzTXpRSkdjMlhmdS91Ni9wS3J1OWdDRjRZOWRLYzFVUk5sNWxFTm9nNWpQ?=
 =?utf-8?B?SVVDaDI1TWdIQTJtUFEreXZVVXFEb0lzVUJPa28zY25aZ2xEUWl6THpPSHI1?=
 =?utf-8?B?Wk1GQzlUSjNPQXlpaUVZcnZ2YTYvU3laNjk0REk3Zm1EdGFSRXYxUi9VcHJ6?=
 =?utf-8?B?dUZJVFgwazFlT2NZcDRCTzFIVkQ1TmxNTnNBVnNHQ2I1MHRiMllFaWlpb21x?=
 =?utf-8?B?eW91N0Z6cjhuYmtwMFNwcGRCRnZkampKbm5lLzVETXJ1TUQwSEZ1TG01amhZ?=
 =?utf-8?B?YUo0dWgzaGJmRlFzZmFjWG80bjNxbmhQbVlVQzdPT3dhaW1QZDBwc29YekdI?=
 =?utf-8?B?bHJPYlg1R3VOanVTbmczUE5laXUwWWhXTktnenAxaE1vKytUcjV4QVNvendH?=
 =?utf-8?B?ZkI0UndjUHlsM0ZJVkIzNXZ1ZE1iYjVMcUhlT2R3NHRjQ0lXNitxbXhWWmkv?=
 =?utf-8?Q?3PT225u9y3iC4FB5lY0zELrJ59y/cJq2R/42Y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d71d9d09-f23d-4acb-9eea-08df1e068b36
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 08:49:16.5066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wiep6wGneWDsgxiQfcP9MtymsYjvdyRjvW7na+hVu96xGEqyolLUk/ThqZprVPXzh8V2Ll/OEhr2ZN200ADGygaKkbz6jiJKxXI6g3lL536b4NUiSN/SX4UJZGdNJmt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7815

Before i.MX952, the ISI RAW10/12/14 output formats are always
MSB-aligned, which is not compatible with the V4L2 RAW format
definition that requires LSB alignment.

From i.MX952 onwards, the ISI introduces CHNL_CTRL_RAW_OUT_LSB_ALIGN
to select whether RAW10/12/14 outputs are MSB or LSB aligned. Enable
it so the driver produces correct V4L2-compatible LSB-aligned output.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v4:
- Split RAW_IN_MSB_ALIGN into a separate preceding patch
- Split RAW format table and RAW14 changes into separate preceding patches
- Move isi_out_raw_shifted() to regs.h in the preceding workaround patch
- Rewrite commit message

Changes in v3:
- Use CHNL_IMG_CTRL_FORMAT_MASK instead of the removed per-platform format_mask (Laurent)
- Derive raw_out_lsb from the model field instead of dedicated platform data (Laurent)
- Clarify the CHNL_IMG_CTRL_FORMAT_RAW14 comment: the format is
  documented on i.MX{8ULP,91,93,95,952} but only used on i.MX952
- Update the mxc_isi_channel_set_output_format() comment wording
- Rewrite commit message
- Add Reviewed-by tag from Frank
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 37 +++++++++++++++++++---
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  5 +--
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index b3f32b9796d5..6733776e72aa 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -311,12 +311,24 @@ static void mxc_isi_channel_set_panic_threshold(struct mxc_isi_pipe *pipe)
  * RAW samples from either the high or low bits, as both LSB and MSB
  * alignment can be selected in the gasket.
  *
- * On i.MX95, the CSI formatter provides MSB-aligned RAW data, so the ISI
- * must select RAW samples from the high bits of the Pixel Link bus.
+ * Starting with i.MX95, the CSI formatter provides MSB-aligned RAW data,
+ * so the ISI must select RAW samples from the high bits of the Pixel Link
+ * bus.
  */
 static bool isi_raw_in_msb(const struct mxc_isi_plat_data *pdata)
 {
-	return pdata->model == MXC_ISI_IMX95;
+	return pdata->model == MXC_ISI_IMX95 ||
+	       pdata->model == MXC_ISI_IMX952;
+}
+
+/*
+ * Starting with i.MX952, the ISI can output RAW10/12/14 formats with LSB
+ * alignment, matching the V4L2 requirement. Older platforms lack this
+ * capability and need the RAW16 workaround.
+ */
+static bool isi_raw_out_lsb(const struct mxc_isi_plat_data *pdata)
+{
+	return pdata->model == MXC_ISI_IMX952;
 }
 
 static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
@@ -377,6 +389,13 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 	if (isi_raw_in_msb(pipe->isi->pdata))
 		val |= CHNL_CTRL_RAW_IN_MSB_ALIGN;
 
+	/*
+	 * Enable RAW10/12/14 output LSB alignment to match the
+	 * V4L2 requirement that RAW formats are LSB-aligned.
+	 */
+	if (isi_raw_out_lsb(pipe->isi->pdata))
+		val |= CHNL_CTRL_RAW_OUT_LSB_ALIGN;
+
 	mxc_isi_write(pipe, CHNL_CTRL, val);
 
 	mutex_unlock(&pipe->lock);
@@ -430,13 +449,23 @@ void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
 				       const struct mxc_isi_format_info *info,
 				       struct v4l2_pix_format_mplane *format)
 {
+	const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
 	u32 val;
 	u32 fmt;
 
 	/* set outbuf format */
 	dev_dbg(pipe->isi->dev, "output format %p4cc", &format->pixelformat);
 
-	fmt = isi_out_raw_shifted(info->isi_out_format)
+	/*
+	 * Before i.MX952, the ISI shifts the 10/12/14-bit formats left
+	 * by 6, 4 and 2 bits when using CHNL_IMG_CTRL_FORMAT_RAW10/12/14
+	 * respectively, to align the bits to the left and pad with zeros in
+	 * the LSBs. The corresponding V4L2 formats are however right-aligned,
+	 * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left shift.
+	 * Starting with i.MX952, the ISI supports RAW10/12/14 LSB output
+	 * alignment, so skip the above workaround.
+	 */
+	fmt = !isi_raw_out_lsb(pdata) && isi_out_raw_shifted(info->isi_out_format)
 	    ? CHNL_IMG_CTRL_FORMAT_RAW16
 	    : info->isi_out_format;
 
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index d2b8a26b7c21..075fc6848213 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -20,7 +20,8 @@
 #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
 #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
 #define CHNL_CTRL_SW_RST					BIT(24)
-#define CHNL_CTRL_RAW_IN_MSB_ALIGN				BIT(22)	/* i.MX{91,93,95} */
+#define CHNL_CTRL_RAW_OUT_LSB_ALIGN				BIT(23)	/* i.MX952 only */
+#define CHNL_CTRL_RAW_IN_MSB_ALIGN				BIT(22)	/* i.MX{91,93,95,952} */
 /*
  * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
  * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX{95,952} only
@@ -90,7 +91,7 @@
 #define CHNL_IMG_CTRL_FORMAT_YUV420_3P10P			0x3a
 #define CHNL_IMG_CTRL_FORMAT_YUV420_2P12			0x3d
 #define CHNL_IMG_CTRL_FORMAT_YUV420_3P12			0x3e
-#define CHNL_IMG_CTRL_FORMAT_RAW14				0x41	/* i.MX{8ULP,91,93,95} */
+#define CHNL_IMG_CTRL_FORMAT_RAW14				0x41	/* i.MX{8ULP,91,93,95,952}, used on i.MX952 only */
 
 #define CHNL_IMG_CTRL_GBL_ALPHA_VAL(n)				((n) << 16)
 #define CHNL_IMG_CTRL_GBL_ALPHA_VAL_MASK			GENMASK(23, 16)

-- 
2.34.1

