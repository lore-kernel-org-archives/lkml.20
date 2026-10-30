Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.139
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793356481;
	b=gM8eh5sTs8OUgWQvssgmC6ZOtX5T+tVVKfkM28BKVnwMDS92wMcgEZCjZ85PfLfcvrtx
	 u2li0F3Lzvxig2sOfNE1M9Qac6zO8uL+2xN9+5BX2GUpUajd1iJns+7UnHIsI214WQSA2
	 0HfWfJ33AUZopAKwgIAGI82hor8H7UtCKgxFVmg56QSzMB2Yzx/5+XMRxnhpyxEL8vf4a
	 jPVdOAGbdkyymhStytZdjAmrGfJukitV5nFUEFb0pkPyAwfCEBsSe7hfxs5BVXok9J+Na
	 TX6Kdou35PFGzfG4l/5ZP0miC9X4wlSGDlSaQuSP6oKdG6ZNAKRlpsWRILICOEoJWDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356481;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
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
	bh=2SMNnj5nRpOiSEZBfZcZ2EZmtZ27OnVQPeWaiCcMXE0=;
	b=ud0B0ENbbeFdI0RnWbInRWkCqgdQp5BVJzfvSGE2pi4lfQ1AvEONkdq8nbPxCiqeIthp
	 ZEKpgQoYMTOK4Y+1Xo/Ej0DZQeViIqET9snx7T5zoAL7olFnB+ZwirVjLoOQ9b8Lm0DLL
	 0I7pSuBDSAqV4GnV+C436/U328K853j9cSEz5bRTNrzyBSoXSvkMYuFeGDxq9IcCmPlZ1
	 aA54wyfhgGw83H+fT2m76NrqS5/dq1kQklgQ2cUaacxuVJHBb9wTDdd7kB2dOUrzxDPMG
	 yjYxCcKt/emleP6tVE0813pRc6gfMTyFu1NoS2MYl9T+uEjCE5OnuJ9JTojbSGVQtLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=c6FRKOmv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.139
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020139.outbound.protection.outlook.com [52.101.227.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC7360A6F65;
	Fri, 30 Oct 2026 10:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECC7360A6F65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=c6FRKOmv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dX3yeiE0Vc18mtMWbvja7zcrohHzs5ErqXMy68GPRZgtLZM4Ep68AA23ryMK9Nq3Yc4HA22HL4vLEoe0X2d6qN10rNs9XpXnYuEi3c/QXoIr7sfqeiNAU7wjpSEuWTuVk9U5MkCgtsHWRYIgXIjBeOlvrNe7GoOaNGK1M/hhOTdIW0JKlslFwx06cYPlKCcwN/uvk8p3LUTjV9rHK1VhVpgbyOSjlf/f7qnVIY637gJrPEH+N0OQUudrIS9curw9akRmNXKQX8Zj0e/vrlHCjiZGVgTPA/hOFOatTib5CGy7DsPK6SObV/4uMxY2m9S21STEEKDMi8ZrzfNEOTpwmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SMNnj5nRpOiSEZBfZcZ2EZmtZ27OnVQPeWaiCcMXE0=;
 b=CuPHBHWquD3il4gK5ecm//v99VfAeQVUmRO9gT+5hz5HWiJ4F1qUABc9NBQ8lgRFDkllS51TG43WjvLFVoVQXFn5dYXshI/cRrD7VHuT2/rsKXupKxezVZp3UGQN0yBipByCT4rIoHlrALFXnZhnB9juTQl++xAQJfCUpIceJV2gN9dluV0VJQP1MK0xdkWRyFJktxXoIpOuA0MovRj3qm8CE8H7VIFWVNAkj1/EbaXQJS6tBGHNXIN/zLkgI2HaaBWb8Mmajb19bWJbUhtUeaXf+8iWtlheaESsJXf9R3nrwu+WE7h52b+8AFNduS+dDo7ExzB2axFDkZ4imD/CCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SMNnj5nRpOiSEZBfZcZ2EZmtZ27OnVQPeWaiCcMXE0=;
 b=c6FRKOmv0ckhNuf+IQ9BjQNP4jWdT1nOruT9HR4h8NaXgQxyF95aKOi05Rq7X/NZcJnfubmDXBVnMfkTpah4BVcsMCa0FuMABzGa4Jd5LVF0Z1JC80JyGyVW01vdCEMOTOpyFFx+mYh9jZSn32jlYETpFs4uACvHBwSjKvYBy/watFSr2fNsVU9EdAdScrZKrcV9CyCXw34dbHLK/9GXnsQ6kEXb9TPd6LMiLHgP9ABw9WcVDaOh3nsHZePK33t+JilumMyaHDZNXW6qhOg4w9BClZliWh51ZTTYN0d7HO5fbdkdETlpps20kC2ACiFnQbVedsF2vD/ELTgZfSKJCg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB0311.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:34:35 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:34:35 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 12/15] media: i2c: os05b10: Add 1080p and 2x2 binning 720p modes
Date: Fri, 30 Oct 2026 16:03:44 +0530
Message-Id: <20261030103348.1222201-13-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030103348.1222201-1-tarang.raval@siliconsignals.io>
References: <20261030103348.1222201-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::32) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN0P287MB0311:EE_
X-MS-Office365-Filtering-Correlation-Id: c7e098e1-e971-4ddc-286b-08df36716429
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|3023799007|10067099003|18002099003|22082099003|56012099006|261021121427099003|261009223027099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 MlywF8tua0c/tvdCCKcBE+MMoDBI/8Dt7sS21BgnDJzEYJ+iNtXQvA2NhBAqq2XdsLb+7M5/mQVP/l91iXN7S4Ohb8mWOKgAz+RfRxUlFiRwJseKJiq4NJovyKa1/q36UgQlBhlpy/XgIiJQBoZKfoeBFiJLa3U6NV15vZ4loFWP2s78YgtB6lrKAZz5Vt//D6xh2vVszfyzVifI3W1CDdrLD+ZoyCcafbTJNLUghOexQMKCkWyWy25nV0FRrhRgSzbdTW+zz2vpSAqFKslRVJDW9Gm3GG0M5hafcDeVwKUuFiNrcwFssDZXvaZezCNldZD/iHSFdaU8NKYecRD38z5OVDNHWscE6IJxZynBQzXQxl8qCHVkGsq0AfF342tvQyI/P6mgz1WaS4b0tq9/kjtD7IH07RvG5E/l5rA+ZW9oLPuAuHiGFn1Q6qcBLCVbcIBllP0LBRLKPjxn5vlLNBW9QqRyGrLXhQWPggI0zWdUty+S5v8dOMGIo3/8dpld5SQ+qws1F/oSUuZbNVuvOnsNH33+5Py/jjIdl1+gZ/kQWoj94un0hfvNbIw/RuW8Ov6PB6QDcBmdSxxxl/c7/dY/w3++6jKmbp2CjEeTUtx7S3FbCqgMmbQAlxvuA2aiTeVuHOw8ikA2F7D60v+mIPWBso0mq3hH9jopFHhUataEsHaFz2VnAadUqC1bFF1O3MzA2jstDyi99KusBiDMWZVqGXxWvpeCoaDIdAvxibU=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(3023799007)(10067099003)(18002099003)(22082099003)(56012099006)(261021121427099003)(261009223027099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?dpDxdUJj0vCbxi/p47vbqQ1XrKqSQCNGN0mf6tk3W2fBx75C1j4guk1trL/l?=
 =?us-ascii?Q?oAlHnzvcAojd5+mootipqXp+pp8grDKhCoj5ZXBGmP854ow+JRHzRrYq70xN?=
 =?us-ascii?Q?ti1EU+kwL7FyZ4YLVcaAOkKYn6ZJlAqpb7eQPAzAHo8nXwbSg1cUgrv7bUI5?=
 =?us-ascii?Q?L/V7SBYpONDUbZxEXBuWrzeaRypItPAXknZookgdgRM0E8KW2HtHNZvIVsD/?=
 =?us-ascii?Q?6oMJH/syQ4lApJ/c4uzoms5QyQrCAuXvbawovd8Emw9ZFMl4gT82tZOtWU5p?=
 =?us-ascii?Q?osXnCiZJznWoQNi7l0l8eSOezI683b6MNqejhAmab69TWIwg1gw39cdPnS3k?=
 =?us-ascii?Q?mIB5w378ve/4OeZocciLol7N0JPVNLQqKnKoxLnmxTbbTpe6p1gom0yrS4ei?=
 =?us-ascii?Q?iNgtXhuTftmkLZimguWIVUYu+DPGah3+mjKLz7vD9ehOqvwV4dfh2wQV/xyO?=
 =?us-ascii?Q?j9/yHztSfukHLQsQlMur141Vo6O3/D4zIbspZUtjMljyA6QKmrUKKS9nsvAZ?=
 =?us-ascii?Q?WN7Q/syyU3a0pvHJ0NLBh9UDC4IBUveVNpJCwd6G1geYUAk0nMqQZgshrJmi?=
 =?us-ascii?Q?QTaz58ZaA+1cI2LpTuS9PfSvrzDEtg7Jso8qiZYJ78Cl0rFKabEvOjgmOtsM?=
 =?us-ascii?Q?d+oWl3M8ApnnjU2IFZd4F8Rijc+CbZTfD4GU38jefWAL4xeMej94Avp+oobO?=
 =?us-ascii?Q?JV3+4wMhjZ8hKH6VruXX+5hA5MaF+An+fZ+8TFoa7zWl8tZuJ0U4U0+ujtw5?=
 =?us-ascii?Q?k6vhAcvqMp655f/IISwogUFvdlfQx+L0te1JKoVYT8rQoF66h9UFI9BAWH9I?=
 =?us-ascii?Q?NdtBW/iIbfe0rRE/p0DAr8KEP3pt41Q004IGOT1TDd/iP4fcQ1jugG8opusq?=
 =?us-ascii?Q?wwFL1ZXQ99jvXglrLncAh4k3UZq4gYVyTxjmEzzrcYKhUJ8r0upkoDT+fIqH?=
 =?us-ascii?Q?plvS4E32u7aRU543zMY65JmF5/MO0MWCdVPXlYVaR6r6t1/fCs1+sx7Ruowz?=
 =?us-ascii?Q?uNOE7fr+p03IUL8Wi3R0LXan+sccmGwAsmGyvg0YGTv2lvgjo9Vsw0vnSaXY?=
 =?us-ascii?Q?/15rHowRi6iPRqW5HgF/Uv06G5UXhSxQ6oqReF1s7eJN764DzOIrbxUG1+PG?=
 =?us-ascii?Q?qDrbB+4TSrZz9QeO7vudfdlUy/usN6/C1ZXS7fmyda7F6q3QAkqUF7GO5qlk?=
 =?us-ascii?Q?veJ5ljbcYR1/3VGSaYxM0Ncze5R3jT26xPrSIBVh0ND6OTWEuAE8X3N8ipaY?=
 =?us-ascii?Q?vT810Htt9RjOt5Cg8sIRaofFeoblka6QWSWIgivrlEaPiT6yUiEgL08dxgJu?=
 =?us-ascii?Q?pn0KJAc3hyF0VJldAhZU7QDagMszl0LEKhJQQaWSc3WkstRC4GEhu8CLv70M?=
 =?us-ascii?Q?I8Sjl4uDIDspa1USqmEb/pGZmHKhPvoyEKJFbYXOtXyFDUPjwG3RKctDMUY7?=
 =?us-ascii?Q?BBlL323OIGqwKah2AMI1XaDo3ECwd8G7yS0LcMITS/EF2F59Cw0lLmHCn166?=
 =?us-ascii?Q?82GIDN1s5bioz6dq9yCPQXI5D7Lod1okUB9quDMiVS2xugNM83UcWMq28fOw?=
 =?us-ascii?Q?I03xmi31ANB0CaGVDCIMQHfBtTNeAOJuHxnDYAATxfuq9dHGH4WpzhNyDSMb?=
 =?us-ascii?Q?VwnhVWxd1A6TuCXlEskHu6BCF/PSusFYkPUugehNl38sOKH2XqduTfZi18Rc?=
 =?us-ascii?Q?U2aGHttIFn9npQ0luJQt0/LgnHX2+qTM4usXAfCicLkLoNGVunGZkPOyHpKW?=
 =?us-ascii?Q?j/WLqqQ0dSEFBHkDlBgM+fprrM3AO9A=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e098e1-e971-4ddc-286b-08df36716429
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:34:35.0713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cURDHTsDukzg/gqRng5kFMUX5I9HxnMgb6Z1YhxV/89VP0ASHCzwXwGp7sn6bPL2saGOpz1nAIZ3tt1yPJ2Cj7jcAsS8ih70gT+1lOK9zv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0311

Add support for 1920x1080 and 1280x720 resolutions.
The 1280x720 mode uses 2x2 binning.

Both 10-bit and 12-bit pixel formats are supported.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 120 ++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index ba6a22ced3db..48c406b2e544 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -456,6 +456,78 @@ static const struct cci_reg_sequence mode_2592_1944_regs[] = {
 	{ CCI_REG8(0x4837), 0x12 },
 };
 
+static const struct cci_reg_sequence mode_1920_1080_regs[] = {
+	{ OS05B10_REG_X_ADDR_START,	0x0280 },
+	{ OS05B10_REG_Y_ADDR_START,	0x01b4 },
+	{ OS05B10_REG_X_ADDR_END,	0x0a0f },
+	{ OS05B10_REG_Y_ADDR_END,	0x05f3 },
+	{ OS05B10_REG_X_OUTPUT_SIZE,	0x0780 },
+	{ OS05B10_REG_Y_OUTPUT_SIZE,	0x0438 },
+	{ OS05B10_REG_HTS,		0x06d0 },
+	{ OS05B10_REG_ISP_X_WIN,	0x0008 },
+	{ OS05B10_REG_ISP_Y_WIN,	0x0008 },
+	{ OS05B10_REG_X_INC_ODD,	0x01 },
+	{ OS05B10_REG_X_INC_EVEN,	0x01 },
+	{ OS05B10_REG_Y_INC_ODD,	0x01 },
+	{ OS05B10_REG_Y_INC_EVEN,	0x01 },
+	{ OS05B10_REG_FORMAT1,		0x88 },
+	{ OS05B10_REG_FORMAT2,		0x00 },
+	{ CCI_REG8(0x3610), 0x87 },
+	{ CCI_REG8(0x3620), 0x0c },
+	{ CCI_REG8(0x3662), 0x10 },
+	{ CCI_REG8(0x3714), 0x24 },
+	{ CCI_REG8(0x373f), 0xb0 },
+	{ CCI_REG8(0x37bf), 0x05 },
+	{ CCI_REG8(0x37c2), 0x04 },
+	{ CCI_REG8(0x37d9), 0x08 },
+	{ CCI_REG8(0x3832), 0x08 },
+	{ CCI_REG8(0x3c86), 0x03 },
+	{ CCI_REG8(0x3d8c), 0x71 },
+	{ CCI_REG8(0x3f03), 0x08 },
+	{ CCI_REG8(0x4008), 0x02 },
+	{ CCI_REG8(0x4009), 0x0d },
+	{ CCI_REG8(0x400a), 0x02 },
+	{ CCI_REG8(0x4041), 0x07 },
+	{ CCI_REG8(0x4505), 0xc4 },
+	{ CCI_REG8(0x4837), 0x0d },
+};
+
+static const struct cci_reg_sequence mode_1280_720_regs[] = {
+	{ OS05B10_REG_X_ADDR_START,	0x0140 },
+	{ OS05B10_REG_Y_ADDR_START,	0x00fc },
+	{ OS05B10_REG_X_ADDR_END,	0x0b4f },
+	{ OS05B10_REG_Y_ADDR_END,	0x06ab },
+	{ OS05B10_REG_X_OUTPUT_SIZE,	0x0500 },
+	{ OS05B10_REG_Y_OUTPUT_SIZE,	0x02d0 },
+	{ OS05B10_REG_HTS,		0x0368 },
+	{ OS05B10_REG_ISP_X_WIN,	0x0004 },
+	{ OS05B10_REG_ISP_Y_WIN,	0x0004 },
+	{ OS05B10_REG_X_INC_ODD,	0x03 },
+	{ OS05B10_REG_X_INC_EVEN,	0x01 },
+	{ OS05B10_REG_Y_INC_ODD,	0x03 },
+	{ OS05B10_REG_Y_INC_EVEN,	0x01 },
+	{ OS05B10_REG_FORMAT1,		0x8b },
+	{ OS05B10_REG_FORMAT2,		0x00 },
+	{ CCI_REG8(0x3610), 0x57 },
+	{ CCI_REG8(0x3620), 0x01 },
+	{ CCI_REG8(0x3662), 0x08 },
+	{ CCI_REG8(0x3714), 0x28 },
+	{ CCI_REG8(0x373f), 0xa0 },
+	{ CCI_REG8(0x37bf), 0x05 },
+	{ CCI_REG8(0x37c2), 0x14 },
+	{ CCI_REG8(0x37d9), 0x04 },
+	{ CCI_REG8(0x3832), 0x00 },
+	{ CCI_REG8(0x3c86), 0x03 },
+	{ CCI_REG8(0x3d8c), 0x71 },
+	{ CCI_REG8(0x3f03), 0x1d },
+	{ CCI_REG8(0x4008), 0x01 },
+	{ CCI_REG8(0x4009), 0x06 },
+	{ CCI_REG8(0x400a), 0x02 },
+	{ CCI_REG8(0x4041), 0x03 },
+	{ CCI_REG8(0x4505), 0xe4 },
+	{ CCI_REG8(0x4837), 0x0d },
+};
+
 struct os05b10 {
 	struct device *dev;
 	struct regmap *cci;
@@ -506,6 +578,30 @@ static const struct os05b10_mode supported_modes_12bit[] = {
 			.regs = mode_2592_1944_regs,
 		},
 	},
+	{	/* 40 fps */
+		.width = 1920,
+		.height = 1080,
+		.vts = 1504,
+		.hts = 1744,
+		.exp = 1472,
+		.bpp = 12,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
+			.regs = mode_1920_1080_regs,
+		},
+	},
+	{	/* 2x2 binning 120 fps */
+		.width = 1280,
+		.height = 720,
+		.vts = 1003,
+		.hts = 872,
+		.exp = 970,
+		.bpp = 12,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1280_720_regs),
+			.regs = mode_1280_720_regs,
+		},
+	},
 };
 
 static const struct os05b10_mode supported_modes_10bit[] = {
@@ -521,6 +617,30 @@ static const struct os05b10_mode supported_modes_10bit[] = {
 			.regs = mode_2592_1944_regs,
 		},
 	},
+	{	/* 40 fps */
+		.width = 1920,
+		.height = 1080,
+		.vts = 1504,
+		.hts = 1744,
+		.exp = 1472,
+		.bpp = 10,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
+			.regs = mode_1920_1080_regs,
+		},
+	},
+	{	/* 2x2 binning 120 fps */
+		.width = 1280,
+		.height = 720,
+		.vts = 1003,
+		.hts = 872,
+		.exp = 970,
+		.bpp = 10,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1280_720_regs),
+			.regs = mode_1280_720_regs,
+		},
+	},
 };
 
 static const s64 link_frequencies[] = {
-- 
2.34.1

