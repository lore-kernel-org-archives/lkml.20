Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.117
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793357332;
	b=UphTq5KUqD8pLxMjoVtvKHZhfzJ9oA1LzQH6RWPCk9mZ9Zw9uK5K5aXny08nbG/jKAko
	 l7aonm/CnRJjym0mmfJ+P73B9sda7ighyVVVU+cRAjDV/UA5ON0py3cyZUiwj8rSREjnH
	 ZecAyan26xy2W6ljSIwF/tIMd45yLdZgo86ZClKBDV/Vo09zhntvGIsdJQypo9HqykCNc
	 +SHiKIPwVE8XBVENHdoirbuUbY1mTRt/1RapXfHm6R0ZULpwIaXSoKArLTivrt9V2azGZ
	 tzJMlVW1HoszLHPsPEN06E8M6WmCQ0ZG+UP+0h93ToO9JUGfuE4w6nho0Z2rKU5K/SA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357332;
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
	bh=+AQ/IYZ957tAoMk4TuSUGIoQLQYDbnG6/1GQBNZaDcY=;
	b=mI+wTaaiz4/jJyvIAlUYNWI1NpeNNrh0fYnF3QzmGVlRe8W7hRMHaRmQUnxFcmTZpMe3
	 dI+s0umGNowBc1QOXo6PYiJfK5xhKJhhjaU3Dm7B+bu2vbTzI36kmVnEBdVCtXpBt8egp
	 i3juZ+TZ8MERJDxMH+v4nVSOvVoDJcE0sWgzHBV+iqPUR+KQSuxnKOARM9AlyrWSJdCCm
	 O3P2sQ9tPCdOaA24vF0CPASyWcypEtrs5jx539idaoEQB8T3r9zXuHFPxJiCpOyAatkrO
	 2lwK+tAp+WhyEqSfbefsFzxhYWr2/jd4Y9pHceFhnZfCDJvZ0CgKq7e/T9mKmWHP0/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=dmUmzD7W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.117
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020117.outbound.protection.outlook.com [52.101.227.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1384606A31D;
	Fri, 30 Oct 2026 10:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1384606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=dmUmzD7W
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pShN2/WC1Zmttoh9KbmEdFTTQdQIx1kpcWeExCr53uYD8GomYKLSSJMfRTzf8ARK56syIjA66+ieAKcXyYSLLiE+7pxjiwcvH/2r6uvFs8wXzkjHDmlUImTwOWzheI+YiwLZliZzAxTYtYxcrWFabG9kbQPZ2Rl+/9DLoVN1I2JKYxarUvxQppR059iXr8yzEAPnduXFX6ISfdMBr1B+Om5MO05PrrrfD28ByiXLGryL7BAXnxa1TLzvCdWjRuZhGed90g0jQFs3Bl4VASRfgu/oEFMPfbGYgZZVT+pW7Ok6zSsbDr4aDQr+RFwDyn57FNRa4E/myYOKlgWbrPGDFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AQ/IYZ957tAoMk4TuSUGIoQLQYDbnG6/1GQBNZaDcY=;
 b=dKGe167gGXaerFBN8lgvvk5iio2HmWMlnS10sJ9ZBzSBrWFVhFpiYcqAekVDA5jb28PR/UCFWZ4WPyS5AArjLv7wW4/6tvSO/U5tv/EJ8Dc82YxI3S2Hxuy3TK+/uNNA/YDhpn5QVTgOa0HzF0AhrnLb+Z6sUDJFsxiv5mbcCftghrSZlizaJUf/tl/Cw9ODcC9xHVL3GPTgAtLcqTD1VbEisNBwxrZAMjcfWBd7Rr8JnEKQ17k03d4kuWS/wJ1NphqF08cIDoOqFnnURqrTxuVCaVdzbFicspPs5OQk5JFdCeTttIwlg9qX6P1Yci4dh130pCoO2pmXSneXcrb5+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AQ/IYZ957tAoMk4TuSUGIoQLQYDbnG6/1GQBNZaDcY=;
 b=dmUmzD7WEzySQVMWn5EN1kPSr3YnWdvkHhdJbQ3FIhEBsh/3umFUaaP4VtcTwDmsblVgcQ3UJEiPDIBGTDQAM3Kx4ikEOwp5+xzqsZ2FBsjKwtW3J3evsqaDdGFQN4z50nlzPi6+mfqgQuQSrMnMP6xQNZfNZ5ZWvEBJghFsCdMOnY4574DensaYPLIPnkDu6q01ytT3IGeNZCgB0oXpAPRGs/TaU4eOanhZ492M2BEHd4hhaquVL5ssuFi9A/64KLLPyok/PW2Xvx11djeoL8ds+DacIXPNJqsQHJzzIy19Dawo7Hq992A4BmUVTSQv8EUCDJaYuaqdc9nVvEkw6w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNWP287MB5684.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:31a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:48:47 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:48:46 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/15] media: i2c: os05b10: Enable runtime PM autosuspend
Date: Fri, 30 Oct 2026 16:17:53 +0530
Message-Id: <20261030104806.1223991-5-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PNWP287MB5684:EE_
X-MS-Office365-Filtering-Correlation-Id: c956dc2b-9fb2-4c7f-71fa-08df36735fe6
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|10067099003|22082099003|18002099003|56012099006|261022105027099003|261026121527099003|261026140227099003|261021123027099003|261028144727099003|261021121427099003|261009221727099003|261009223027099003|261009223327099003|261009220027099003|261009221227099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 44cyRSsjG9N1Nu7nPxv4BiTsgjl01w7khM8IH+Heo5z8KyMtZeguRCQswfcDn7eUguDl3o2xmAHptmlaCtWMzKcsCRi1yhiHquTMm6/vPfXiYZsDh2D54ZTdg/d0ntIa0d4DRCprPi14MTZJ7HDjAwxrczi4UaxV1hVD875/nXjtkgwZjKyji+eVZWfBNvY5RLpEmpCIWTYSkyDK7lCKBh+vf68K+OUPScoWhXx6IHReo94+HEtULmqsaoirn49GYFqD3duI5h7UlMU4MY84+5IOr5CJgZ5qZqsPUY9SkoNQ+gpJNo6L8gY/HmF5iSTJgMM7uqj9mhEUlpv8oVk9un501Ut++YAcM3tmjbZCR3p/aun7yQXeFco+2BP7Man+N2JM6vo9SAPLCH8HgPTaZc3YTs47i3z59dqXjjcfbB9PXTqtH7nacPT3rUpriXzl69LZErzDy/tx4N/dnpKhWEerwl/mVhYw6yRI2CpOAjmJe0LbgY9Tup1Q37ORn8KuC+WcFG9aymS27/Xb+6TxRntPtjwq2b00qMcxX09tMBOA6EdGWghX/Zpc0aIlpeLN/tBzIVJE2TjEivv4hCoXygrNTCdBSTI50MlCCXdcNNpx4fdhwzyu8hJl2lkaFd/x9oqFJNjxiD6xlc3d5ZBEKyFE+h2ryMpwVVzkgG/iBxB5Ydr7RkQxNmTVgkpVv9P6cgnbl/LN4MurVNW7yxVfGLfos69EW/2V2+kPBfhMTW4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(56012099006)(261022105027099003)(261026121527099003)(261026140227099003)(261021123027099003)(261028144727099003)(261021121427099003)(261009221727099003)(261009223027099003)(261009223327099003)(261009220027099003)(261009221227099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?9yIpBkHT5g35h0b94j3q54smFZ9x/cSS3Tctok13Bautip842/eJHqZamAfp?=
 =?us-ascii?Q?fYRL4mq0wJ6+g+K6IIZc2es93jlWxDOn8h/h4qQabSSmPTzMPEeO6CqmD0Zs?=
 =?us-ascii?Q?SeArX3qrwqMECivO3wIiwtA0YdJB9QAvdnmiGGjP2phCpgABvyKb+Vjgh10B?=
 =?us-ascii?Q?OzvIy/b7mM2FssYwErzseBOsoSd/qOpbHw8pd2wYbne+tV/FKiTCdylN1fPa?=
 =?us-ascii?Q?HK51VS9zRTkdbxSv0rvbFyllndFQe3Y/Mf8n5LQHhTaVh+fGf7CaJzj+xqOu?=
 =?us-ascii?Q?Om+RScY+qt+GlANzL8/Kg/OeRzCmQYOPdt1CNqoQ7+CdeQjK/e67OJjoBV2u?=
 =?us-ascii?Q?BtAZB9gF/WpjgWlx9ucd+7eIEQ5z1fHj3MU2PkRXMR7J6Dkoq9KUJS0N8YDN?=
 =?us-ascii?Q?Wg1xkJFdReesyFpJ3V89PB1t7Ql49YjOhd6FOULVE0KpREkJLVyytv6arc8q?=
 =?us-ascii?Q?7qvo1PzEdbal1CEA7OtpZ4uCYvP6BfNlC2Szv5iQOAWhsh6uUK7RVlqxYzBt?=
 =?us-ascii?Q?HFENjEGESJlwgs2jebpeT+DWH0VrfFcVGXeRfcvMQ3znEKFckDrE945ABulr?=
 =?us-ascii?Q?r0Px8FtLOo10RjJ9qTYW8F82tcC0zJvPXjgnL/aezJv7kGdaVrE07y8MXdnx?=
 =?us-ascii?Q?REeaW2tn0tU8bF70+G99P2eR1/9ygOWJrJbaEat2YvOV3Q3Zod8TftDkZrJs?=
 =?us-ascii?Q?jRzq2UeShSwk3O9UZ26BpL4eIUPy/j/GllGiBYomrMSZJO+Xu0sSniPeDl75?=
 =?us-ascii?Q?uX0julVSEsCj8TcoiNEMeHj6VqloKgy8CVKcNGN2GFawVdx2y1QKay5ClYkq?=
 =?us-ascii?Q?gEV+U7PilDruCVVGCXxG/jO3hgB+H2iLv+SDuJ14deUXlt88O/De/6q8EjeO?=
 =?us-ascii?Q?mI9eQWUDSkBbw134/EmY23COnOAqOD5ufWHAFhEoFKQ0DeAi3kTny7WhhkwL?=
 =?us-ascii?Q?HIL1BGlJwlcWFA+BufwOnJLNxo20kBd6NlRrrAyFDCyn/PJlnTRDdTZR28HH?=
 =?us-ascii?Q?XeOzrQP3ATS2bwtUeLkoCijuU2y389yLtrxlgxTdi16jbUgp6lV4Go9zBJ6N?=
 =?us-ascii?Q?RNU2IwALQc80DBdDS280p961DtPbVrM1boQPZUsUKKT2YAYyfQSb4ZzhWPgx?=
 =?us-ascii?Q?z4jvmnO4EK74o5Rmf/whexKQy3RKskll0Tffc1UJOFiYYTTBzd8d6VBmFRRk?=
 =?us-ascii?Q?eVpQ4diJ9uiXePAncQ2WteiA4RtJp22181q3i6cThUphqf0tXnM81sh+bsVy?=
 =?us-ascii?Q?PDAIdWHhDdBSQFEWnP8zDMLk6+8mTmnbteCcDIt5pFIPxWtFohm2fAh0zfoM?=
 =?us-ascii?Q?bMGavIfS0MgwLNxj6z31PSEgjWkxADHhdrSLcQ8g12wdG7LE1ExswZLehtT0?=
 =?us-ascii?Q?zLNNhRBDConblcHlyT9+3O6bwIq/qGRGlAoMpJh3Re6xtdAHIDwmwnZ5svWH?=
 =?us-ascii?Q?aHPwoyjKCJgnV6yQohSTEahkMnj4cJwjPpUjSXbZYkIHr5tHXvR+mrRgYk7C?=
 =?us-ascii?Q?4XeXdY+0chSA6yEiNHX0G6dU5iNN4gcx1w3AfFZhc7OsvJb4OF/rjt05Ve6i?=
 =?us-ascii?Q?DPfKz6a4Kgc48UinlTwxs4fb27N8ZnqPlqKLLDoPUqIcapVkezzGi+6O+I7c?=
 =?us-ascii?Q?qntdRubc33/eJhXLC5+7S70hr0r4LjhB5Pa5asQSVpfyC7oNZmTyfYSzzX7c?=
 =?us-ascii?Q?/6uaD3HBXofULvMCi+2FKiZ7NaWl7cKBCHs/RioSj95KTRrtV18NKcxm864H?=
 =?us-ascii?Q?8VTxn4+c+fwajOrD0NYyqlOb7NDoVPk=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: c956dc2b-9fb2-4c7f-71fa-08df36735fe6
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:48:46.8877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+VdOLk1eaBQ5VpGpOPk6FFeEwqT4qhxXubM6sX21bPDc/3YuWZJ3CYXzhBBIc9ozSnqrowcXB5rt9RTEBCNu0xNYa40ccLFzwZzmSCLfLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNWP287MB5684

Use pm_runtime_put_autosuspend() instead of pm_runtime_put()
to allow autosuspend. Set a 1000ms autosuspend delay.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 70ad9124ad41..7f6cb4c7edc8 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -654,7 +654,7 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 
 err_rpm_put:
-	pm_runtime_put(os05b10->dev);
+	pm_runtime_put_autosuspend(os05b10->dev);
 
 	return ret;
 }
@@ -671,7 +671,7 @@ static int os05b10_disable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		dev_err(os05b10->dev, "failed to set stream off\n");
 
-	pm_runtime_put(os05b10->dev);
+	pm_runtime_put_autosuspend(os05b10->dev);
 
 	return 0;
 }
@@ -1029,6 +1029,8 @@ static int os05b10_probe(struct i2c_client *client)
 		goto error_subdev_cleanup;
 	}
 
+	pm_runtime_set_autosuspend_delay(os05b10->dev, 1000);
+	pm_runtime_use_autosuspend(os05b10->dev);
 	pm_runtime_idle(os05b10->dev);
 
 	return 0;
@@ -1037,6 +1039,7 @@ static int os05b10_probe(struct i2c_client *client)
 	v4l2_subdev_cleanup(&os05b10->sd);
 	pm_runtime_disable(os05b10->dev);
 	pm_runtime_set_suspended(os05b10->dev);
+	pm_runtime_dont_use_autosuspend(os05b10->dev);
 
 error_media_entity:
 	media_entity_cleanup(&os05b10->sd.entity);
@@ -1064,6 +1067,7 @@ static void os05b10_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev)) {
 		os05b10_power_off(&client->dev);
 		pm_runtime_set_suspended(&client->dev);
+		pm_runtime_dont_use_autosuspend(&client->dev);
 	}
 }
 
-- 
2.34.1

