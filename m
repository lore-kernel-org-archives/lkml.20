Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.114
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793357404;
	b=hmqeILP/0wBNakyIaHdyfY26A6//C4MkCBOR1O4AT+xmdM4pyLZPM1O8KF0Xjymshoui
	 gLkNvBClfUo/cz9wVYUNZSol86PG+sf/2yIFpLbLkGlM2QzV7YyWCnrUymXTKlWjiq4m3
	 0afnUMUg8z8ATzg9JL7JDiBqeV4H4Ef682JY6xsM8gZbO7uAoYxwli+ZP/NuMvvgNYFH/
	 9EdYVio7q69DLAi68DPk4/8MvLwjFDbxUnYL370XkaPdjlNR53XNRUor8geXKm8SIwGpa
	 NVZTUZdfS+8KZCN3N15b/jfFByetF3DeaVfeg7h5WuvYEi24aCASS/6aoLRY+/o/4Kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357404;
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
	bh=ZH+sD9T4of3jSMlnS9hZ1u2ceZOAPUeGZdT84zHyXDU=;
	b=eC1SRTYAGD5KSFMZLv/+9wafDqVBt0YTaCKeAaWPTk7MsX0dzIkwJHkJHMjy/RXOXHJk
	 cd2zRkiz1QeRLD/mmuk8vrCDhu/SKmKpMa8qMKREWAv47n6F9mbfNWXk5DQIbvT+HmZZe
	 2yIguXRYG08VvNaiZONXh3LOuJ4Y0tiUHykxiu9qFiHRaSmQXOlYKk/avQqGE+hD1329r
	 ipKYH2xaAJJel7A+g2/j8wEJeWKFvwjDHN5QRPw4qt+CqTLrPFaw5/whTRgllLUPabwq4
	 iRkuzJkHqhD4UCHh4OD196rUVFvfqSFO6dWftB7JDkXqagxn3kVp5V58JjAKLp2lS3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=coEGb6wT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.114
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020114.outbound.protection.outlook.com [52.101.225.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D88E60A2615;
	Fri, 30 Oct 2026 10:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D88E60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=coEGb6wT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yByZwgOiSwuh6wpLcecc/DwTwpT3EqpnX9dM+st9lamT1Dk89pcYVjsnuDMuE9Yc7dzbhPeQuQL5EkZlOg3NAzvrdIj1HOkLo32c80p8sdHuX59ww2klaEJSnOjpOx4C0W5lW5FCjMdDXgSvNg26068HAFUlSB6A4M/BL7mtNgb8la4cjHYF4h8AiQdqyzvh3dYZbrbTetcNOwFsqgT9a1LPv5bXT532a4DDuszAMKRTDpOtCGDwacAKIZhNaP/I1JNhwqBBwDte6jniSOPV8eoWofbn5sM0ozAQztFo1oitbnHoUMHTmYyruaUfO3t0P3nO9y9FOt9EktXO3ROBeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZH+sD9T4of3jSMlnS9hZ1u2ceZOAPUeGZdT84zHyXDU=;
 b=TGiKAcYwDK4AfW6RPf32HnvaMpEWCtXZDm0T/fqjOv9N2IeX80asvtbKl1M3sJA9uHLiv69Zz3pPWJyd54ry5Y0HKeTw72VCqhZ82fqog/ycqWEft9o8r+GJRwiUdTC+UbJDKYVcYjCJhdA8+cwb9uCfAkW3Nm88P8N+PurP7wrOyIvhXUxkYKWrlKkAIg2X3mYn7BlFGkGi1AwK/980WAuh2A/TWzDqoWImkKhWLHsO5937x3aObD1re++P0TADrk+YXGpON0ng4sW0H826CkXY3MlsEFO+AmMiw5KakO9DS+DGdClk9wEVeb9NCPDMAgmsHs6nqfqSeLupvxnKQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZH+sD9T4of3jSMlnS9hZ1u2ceZOAPUeGZdT84zHyXDU=;
 b=coEGb6wT73ilrrmVQuzgrUIch573nuamfWzGyPMiQqU3kqqK7i/39BWDKag9JrSAidZiLMEA7niF+uJV1/w4mfau648izsuNhR1C218yBqOxKf9GnARStc43IEk1/VnrIzolHxjktlw0HEpWHKT4Ogh7t65N6zNtGkX+qS/QJ4OTpixXc7/74N0UkCtyZqhz2cPVB91tohtTGIjum29F1NPS2JVhxekt6GO2IsK2L+D2VQoZMC4jypE0DhnMt3qlFqFOYmzZVncUTwmuNRNEu3QyJxFBnoYWHfxxPNTrcfAhCdCs+iKhzUg3KmVrG804B9C8+fkM/zgYY5mghZ4ZsA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN2P287MB1787.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::8)
 by MA0P287MB1769.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 10:49:57 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::3d7f:7f9:3b6e:4781]) by PN2P287MB1787.INDP287.PROD.OUTLOOK.COM
 ([fe80::3d7f:7f9:3b6e:4781%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:49:57 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 08/15] media: i2c: os05b10: add V4L2 digital gain control
Date: Fri, 30 Oct 2026 16:17:57 +0530
Message-Id: <20261030104806.1223991-9-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030104806.1223991-1-tarang.raval@siliconsignals.io>
References: <20261030104806.1223991-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::11) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: PN2P287MB1787:EE_|MA0P287MB1769:EE_
X-MS-Office365-Filtering-Correlation-Id: 97412f94-a1f1-4ab5-ae10-08df36736452
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|38350700014|56012099006|261009223027099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
 3np8drG9GOtlBZ9pwMwCcTjV0JHUcCtObnRR0kLxP6bOBraxX41BFwf/SCJqGS+QGCTXfhvCQo2ubiRTqX13JkA3O0sULFBYM7UJYgULiwHij9GF9tNg4bkL7JVBqjBwn4GxunOAB4e9fEb1MOaom/zYNxBGRPLHw76qtr1/J9XB/Z/rsKaP0TLaLZSuNkFAOfMhPOYywMioCFtaSzCFWv8q181j4kcJFuraHJtS2ach5FP6KEYvfUtKwXuZNJycBsGtvxLcm26z42DPG1STNKuG6vsyEcMSwr8/JwwQHQdaiHfnGbCbZWF4ngevpgTcWeWAm0cs6GdlGEMTH8VZGA9YarM8dOvrRCSbD52EAQUdxW+ybFev82g+R3kfXGWPA6WEIaMEfZEj07NzA+vFT1BIx/McuWwPLtefO61cHoupXFCVRY6J6wY2Rzd8GOUIgCie7/uJiT+Tja9TlHWb/05eZW8Eln+T7sBnTxfgQPi0tron1kcyksVCanzNcPkaftVJ4Tj4BnDASlkbmyMn37RIv/6GL1EcSWENRX8Z/DDEmQFwXTO9Am96kvf8jtKKdtQ+ZqpYyaP+WV8BxiGqr3egnGRtBS8MNK5lWI6laNVFWTQim1lw5NRb4PULv/BkVuILOlj5hthUKFw0vgThAS6LUAWj5sElaWKDTQBQQT+04jRdu8IBDv0JvRt1PhtxxJAj5vJFRkB5ToDkpjQjgQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2P287MB1787.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?toG3jAlf1aHF0tpbotzIAGQh1CZxxdVt4r1fUkphHjVK5sxqOaFNwRpFJgUl?=
 =?us-ascii?Q?HaWf9RxztzXVRpfV5BNHrQZ79r03xXxGcZjdY65+rmAHHj1GR1rZOhufJd9m?=
 =?us-ascii?Q?83QyifNyZdfE7cu2mZ/Ek7ea2C7NV0BSGruQ8Gm5UMrU0opbw5mU96oQPOZl?=
 =?us-ascii?Q?0YpDHMUrFTgFfzyNJn57bSAjC9CIb96tXvG1UKVSimA52rtQZ6rZ6QBl6Rfn?=
 =?us-ascii?Q?GYQ+WJJgPejCPE6ohQoDP04OyYFp3QVON5lFqcj9tEF+4EJYtccvcPeZn084?=
 =?us-ascii?Q?0Zvd6K8Wv46hglhHk3fonjt0yVlnrQ3b62DyorWjfRsqmMVd5E+Y4u3TiVlM?=
 =?us-ascii?Q?y4laFohG4WuDLHwWlwttGkrDjx5H4i1DUbYnR9Oc5dcgLjNoH1bWwDAz1Vnc?=
 =?us-ascii?Q?4V4r5lUZkxg2DB4BLEjsLW0T1uIYgYR0o6ignRbBGlmHKG51XwO8OtQr7rNa?=
 =?us-ascii?Q?JnNX0oy+Z6XrDcTONPz7Tg0sV1BmpyEzgaak8YyYCd4k/DrJSQEajbwlouLm?=
 =?us-ascii?Q?isP5k6PltHyJGHbmw/mr7mWwkfAHCEqxUhfUF/IGeNmJw0IscgF8QcKT5vj4?=
 =?us-ascii?Q?qX8jYOHE8mYJpFW47WrqUtoTdkWGBEk8ednXEMxOHU9389Uf1Sae0UAKLMvj?=
 =?us-ascii?Q?ipur6roWdE1eA+t7QXU5VQryZ2FuYAjM/bhja7FgBpIVijKzwuelACxh9sJO?=
 =?us-ascii?Q?+orrHfYe5Lb0tXg/fMOKN6z29o2YqaXO/MlGlxPEqUDqZW9pxmQy9NK3x28r?=
 =?us-ascii?Q?S5YXTUkBSh8TKxftk9aJeojXgylV5cvq/GBSfdIe6LLEvyz1Us/JPkantENo?=
 =?us-ascii?Q?dQVHfpW6cXc3EUKboiZfF3bw4oU1xnUTzhkl3kNxU5VEgoY8A7i4B+P0rV6W?=
 =?us-ascii?Q?MX+lJzq6pFOrvMGX3AGSw9mpQfU219BwWHuBFMVIvPaYJujI603VNtdGPaCv?=
 =?us-ascii?Q?8HxY1Hf70+JdrKDNHVTaHayr3tuESMllKw/lz1D8Ya8mjf+1Ruf93bb3VH1k?=
 =?us-ascii?Q?KVpLdtkWlkdVvaQgPw7oh2LsYRGgL0XJ0m2c98Oa2E+HA5ZIQNbm6CM+hAya?=
 =?us-ascii?Q?I24rdxJkMGXNLE6ZUD5RixNeff7WtbYMkeC0cKpiSosoKUOyUq6w0g5TnkWq?=
 =?us-ascii?Q?XzQCUgOunuTZRm1UXnayG0mOGMvf3YezIUtEAowt+bzX8b0860Izcg2mIKTc?=
 =?us-ascii?Q?tTZtibakxhQNRUcWtnwcUTqKLU6/Onq5QnxQENy66/bXVQ154gGtT8y/CEib?=
 =?us-ascii?Q?ea8hLgQurQg0o6oJbgA3CGa9g2HS26KBqJb1a+IaA14V6xwOZ0NkWPHyq6Lf?=
 =?us-ascii?Q?AvXR9BpfAWw+o/fWGtkc716L55HViLPnIIOibmsva9MMgbKFsXDH59emrHx3?=
 =?us-ascii?Q?mOG+IjNTJ0GtxPn96BWtFQ2nbYxIZ6+DgnfAqvwjxH8exQrJkuosOmJoBxic?=
 =?us-ascii?Q?uEPRGfYeIz9Y7fkVRkxPg+cjeQJetTNJwwfKDLftBaNmOxYTkYQGG8ye7Iop?=
 =?us-ascii?Q?OmNK3Zl8TvQjayaX3muQXgTJaXUIX8e1sv8a2hkWLO/E++aH6JjXDCTNdIZh?=
 =?us-ascii?Q?jeJbYFKeOacXSvD4Ex7x6BO7qZ+go9wKpm8B3m9OxqsKuUT+ot3Yf6hJAWzG?=
 =?us-ascii?Q?+l74zhylItzYW/41BWFanxavbtPD5CatXqsSPSuMXisc/fm9ucG5TqUT30An?=
 =?us-ascii?Q?ITrITMn6FNDlTobn8QoInYO9Stj7hD8IpDWeGNDPmy3aWaAMIJHNs2+pis8G?=
 =?us-ascii?Q?pHVwXdyS6eTSeq/WoQcQ4gqBDRTEBfE=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 97412f94-a1f1-4ab5-ae10-08df36736452
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:48:54.3121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3AOZIVyMEiNT33hfhyg2IUUMZn2cfx4Gim4SLn/RWDWSw8KP9p1kEMXDCKRgCN14DVGjGzIal7vNEzL374xKbdKiRDIAvEBFDkRJJxLJae0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1769

Stop programming digital gain in the common register sequence and expose it as
a V4L2_CID_DIGITAL_GAIN control. Initialize the new control and handle writes
in the ctrl callback.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/os05b10.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index abcb7c766754..14046f1c9324 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -132,7 +132,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3108), 0x7d },
 	{ CCI_REG8(0x3109), 0xfc },
 	{ CCI_REG8(0x3503), 0x88 },
-	{ OS05B10_REG_DIGITAL_GAIN, OS05B10_DIGITAL_GAIN_DEFAULT },
 	{ OS05B10_REG_ANALOG_GAIN_SHORT, 0x0080 },
 	{ OS05B10_REG_DIGITAL_GAIN_SHORT, 0x0400 },
 	{ OS05B10_REG_EXPOSURE_SHORT, 0x000020 },
@@ -543,6 +542,10 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(os05b10->cci, OS05B10_REG_ANALOG_GAIN,
 				ctrl->val, NULL);
 		break;
+	case V4L2_CID_DIGITAL_GAIN:
+		ret = cci_write(os05b10->cci, OS05B10_REG_DIGITAL_GAIN,
+				ctrl->val, NULL);
+		break;
 	case V4L2_CID_EXPOSURE:
 		ret = cci_write(os05b10->cci, OS05B10_REG_EXPOSURE,
 				ctrl->val, NULL);
@@ -926,7 +929,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	        return ret;
 
 	ctrl_hdlr = &os05b10->handler;
-	v4l2_ctrl_handler_init(ctrl_hdlr, 8);
+	v4l2_ctrl_handler_init(ctrl_hdlr, 9);
 
 	pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
@@ -960,6 +963,10 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 			  OS05B10_ANALOG_GAIN_MIN, OS05B10_ANALOG_GAIN_MAX,
 			  OS05B10_ANALOG_GAIN_STEP, OS05B10_ANALOG_GAIN_DEFAULT);
 
+	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
+	                  OS05B10_DIGITAL_GAIN_MIN, OS05B10_DIGITAL_GAIN_MAX,
+	                  OS05B10_DIGITAL_GAIN_STEP, OS05B10_DIGITAL_GAIN_DEFAULT);
+
 	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
 					      &props);
 	if (ret) {
-- 
2.34.1

