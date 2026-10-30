Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.89
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793356484;
	b=gpcZ8mqT3/EuJhEsVig48gHALcRuJWHprk7x4hWxzDndjP+rWILUQza7CY1PPtds1zZL
	 UwL+r6ql5XOXELxNCaSDuNl20D2oP7dqec0lUHl/W38uJrteKzWy7YPyo6btCFZBfV1Me
	 rPVk2yG8G4uJMYlqGcP0lS+FAUDLINUEYmKCwvk23wkm4zKA1981Ue+GKmLMF5HZpyNuG
	 esuYOaATF38YcuEgGx+7Jd3GttFyqdQdggw+ueDZuggJVaguALnrTnrnL7fSpsWXLLu23
	 LjJ1avXWVxO55vWMukD0ab5tfKzlpgvVxh3ON2lERzKvzqzkdzuvUkdxKuZhYuH2AjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356484;
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
	bh=5vqVrDB+23oifOvVMD/Pq32KS0vHjGmZ4YXkz2G26i8=;
	b=mp6sb+sGO9JaRAIChNAFlQeRsVw8qJLt9YSPh87pBw5yfsRdwA+ofTkkylJOszNChoH+
	 OQDnLOZmNQgyogkNYqYfDEhmT3VaRXiTo1zRoQRTdxmdyWlbWXrf6dxW1vBGpPta6isB/
	 m+/RT0Tl3poGf/9PaXKI0FKWUtaSdzjEJ1uT0uKk1SziHLifB8V/88Osm5m974q5xHqvN
	 AiHm/ShcV4EwbKJSD/f0rqx9UvtetbNKFF5bQlkb28BLwbUnvMsMYbnHSD3jyYM6MyBzV
	 y/g2J0I2K1sTWXxerOOK1TD2LDSwQ5DJjDhyYhKB5iS91RCYQph8S77BUiyCfhtagKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=ExKwiucf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.89
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020089.outbound.protection.outlook.com [52.101.225.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E951606B895;
	Fri, 30 Oct 2026 10:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E951606B895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=ExKwiucf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yb2qB+TQWvF0RdJgaYh7Vc2Xfr1s4ZQlubBqmFlXt5Tte9AXQ8fhqlgnbFBAgxmFVjcCx78KkymjiqjfiEhKsfrzSTFJ9DDlWHiusYipFO67swWMWwYkVULfcb4B8WEtnUjdh0X2maDW4nZ+mNeTjy6CwhWEv/p3QQkijIv/rZZsRRpUXoWnwyTryWI9rXg0OZVFyejoftfh5DHAfD59xMWqrIwSdpcNouCVfP3MO0ngC3fBY5J+78G86EE93exUpr1/BP9xUMaHFBWmwnGrb7csByrxnHKzsmCeMEMdyDVol3JU7NMKQ21vo9+zQS22teE3XbffuxsgwlfaTTvg6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vqVrDB+23oifOvVMD/Pq32KS0vHjGmZ4YXkz2G26i8=;
 b=KIIzmgKem1qBD6BKKioByNPrTZu/2NDZiN1FrrYkyuezIzUj7HOZKDBgB2adaiEQe1hTVoPr5hMcNM8AaRlfZ6gQq3L1jWz5wyB+yq096Taha4kkupiOJYu1wFFpaSYiSQenrIBbTSc+H2M70BDi8oHYnoP82VJmj92WfZMdyrkTWrAmQztSnvsUVFnzpw2intGYqaW7qSa3JSN3J4+thCuI3JKblDJDdD9B32fsvFgHEFRVRkCwF28J1zQpotUGgP1LW0/JcRwDfjTMtTTyOc4wyS0ejwWNt/EiR7k7jaREPwuoUk1VwUydgKm3SNyxzmOB8V7qSrUgZLvl8Ko24A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vqVrDB+23oifOvVMD/Pq32KS0vHjGmZ4YXkz2G26i8=;
 b=ExKwiucfPZicLieV8WRBkWJcCluC+CK2GyolRX6cOJg0W+blVZHOUZKG92c3+M46RJkJzEniVYPEEbf17urJK9QRlo/jjYMnqXdV0wcU3Icuwgqc0yAutYqmQ1lexPPkj1SPSSbWnyHndav2MY25nIKKxyAaZpq8g3A44qkHOUG/pRpR8wlyZeDApgFatZPZWtPea6B76o1HQ0L4YYtTh2ujU1ziEsGbddtG/gWeuGqkjdRy5TGXWJXRz+Q8A9PnnHUTE9pVYF02+yBYrtLoKfMHhe8RtRVrXnvIgt7vrSjH2DCIfgz5SLyRWSOHl6rb85wzMJVM70gKDNh2SPLwMw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN1P287MB3696.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:24e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:34:39 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:34:39 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 14/15] media: i2c: os05b10: add 2-lane support
Date: Fri, 30 Oct 2026 16:03:46 +0530
Message-Id: <20261030103348.1222201-15-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN1P287MB3696:EE_
X-MS-Office365-Filtering-Correlation-Id: b6b29f2d-deed-41d2-8aa7-08df3671667e
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|6133799003|10067099003|56012099006|22082099003|18002099003|261009223027099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261026140227099003|38350700014|261028144727099003;
X-Microsoft-Antispam-Message-Info:
 IZbcMwLMl/wBTTwUP09mwDfzjBCC5QiFRjOtsfHD/hVwwbghsDcfl7Dv+FdR/PthgFBxFPJplkDpaN3KbFqv0mvcmqRxkEXf/7vKMQewyXQVTL8RAfnpNQhRCjpjnYXv4bv9JDsFoLyeT6jhJmIKECJau8yyHSiIGmsgbTQLG0P3CoV0wEhNr/syzK2svtoqK1HY9d1HE9v48DBSWsP+WdJeaj6smUT99vQYIjYEl3qr6ZglA/m/CAJmS9KS5L78Z+7G9xri/nZldUEortZ7iIT6jdKgssin9PgzKZ1d+NndzpkE0QCxZZEoDjsT+2Yxe81vj4RJ5J3UnCYMAVmHg9MZBShuaom73HOYFq3BVyI3lxoGP1apTkd60jO+9ucvV2Rnpo2k10rkJanQlb1Xqevu8vI2jdMmur08L/Lue9L+WFMH6f5T+MhqaLKYxChUDjXc/7JPjkUWO85+c0L4a8UxNGB/HCE21QPCT80pDJNwNT2wj6YwTUKSWy4ZtsARKUh8lOr0SgT4RTuRm/mD3THNwmBXbUzgzJLCa731GjhXR0v30IPEXGFvaTYxuW5I2g6hXNjn9eArKvRsGh/XPZ+kYhUQg1k1Cr6Tk1QmcYe7q+5lyqeuOMvfUlL8mxOtcFujIwC5GXw5LWWMTCSaYVQErbVKs8afFvb+27WrrbTKUt0rpzoBIIi6oHhrxtcmsjy9kgN51r8c0y48d+8Bb2gMT3oxBD7d3IaS4Bghnu4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003)(261009223027099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261026140227099003)(38350700014)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?4LWnALpoPUNU6BLb76XRcrBWcz8EWXztGJuvgkwcespecQ8uU3Efkl7toJ3M?=
 =?us-ascii?Q?EElaG6jtDtiQQdAszARwtLmoq7SJoJERVPyqQF2yuVU/e7HWTz6yNeWM/39w?=
 =?us-ascii?Q?KrNpQEwtcuZg+vmbWYc/6+vYFzYinF8IZN1J7VRTYBkarETYQ+Z3TYdmqHdK?=
 =?us-ascii?Q?T0WxFAskVtVQTlbV8mtDuQ68ZGuG1VIEgt+vCp452DHWe/LR8lBiW4tMaHgE?=
 =?us-ascii?Q?PmosLwWBVbxe+IoBxLzvjJ/DfguTK7rgD4cenqFXQVFsQ6feRxJ2nJ3t+FkR?=
 =?us-ascii?Q?bwcpovm6KPWZ/7LZb0JbWV8y9Ht1wxDVdcB/x/HGdezDBoycR8x0vQSW349X?=
 =?us-ascii?Q?2i3ueERLfGNi7K7QnnJ3GlmcZIGP1ymLSsLc30Xeoa5y2y0Cz9eFNYqy+PUA?=
 =?us-ascii?Q?dwhuKD1JlEJWoWYqZAd1LLdMrWjOwsTintQkvOoaNV9D8as9P1amWoCQ3VIs?=
 =?us-ascii?Q?Lo4eFIomtQrZE7rsXE4mzYvJ2/Dao7hV78eahINQv8u5D6znUDlOVbCLX1wS?=
 =?us-ascii?Q?OARIrlk839qnepDYEo1JsW7R5AIcTaIq5lrrBLPSXlpYyhp+YCkuVmvNhmdF?=
 =?us-ascii?Q?mQCxeTt+Rj5FXXnr31RA1N/ZMzeITvOjjmxEx/U6aHXEMPlt/nFDOW2KcJoD?=
 =?us-ascii?Q?WrAPOWeDg7DSsnAD7x1bDAYbS1fy/dIajp6JuJukn47olBDn9gzj7mxC40te?=
 =?us-ascii?Q?HPuS/WpuS2bH1DSiRy9M1diMbf5x5nxJJcBZOygresxkjlsEfKmDrpNmYat7?=
 =?us-ascii?Q?jE1oy2tAGnOSfmRYS4z/gMrOs2rI36YdBpUL8ffXQVv+R0c+ZdcCl2CF6Ir5?=
 =?us-ascii?Q?xdTnVMhPYzQjinoFZoG4LEpg/gP/OKy4XhxQi0KEb1/QAa6+MAanNgg1cS/8?=
 =?us-ascii?Q?MF0WoRsuoUOk1mVJxtyNAN76G2akN2yfVnYCjIRiH0frmvR4HOkB7XNGZwMu?=
 =?us-ascii?Q?bJsDQ47Y2XQu7T2HPnLwFJ3nIU09se91Tmyp82clwAEgUyNGoiL3zLiGjiEJ?=
 =?us-ascii?Q?5Af4FDQKLD0PsHebxOuOap+G64ePrTrnuanUpwJ7OVDE7pVedIkjUUEDq4fm?=
 =?us-ascii?Q?NCeYP752BIasRK0Z8V4nNnUz+tFwDRjza1A+g2iHvm8NAgB1aWXbepywnvat?=
 =?us-ascii?Q?RQUX/EfB5GcihL6Fm3/dLAf/XYKx7L0jiSngEM/aUqJSDPdJ4KuRPUbRfkAu?=
 =?us-ascii?Q?lkEpyCf2dtBUwXPgOjCKL6ix0ooPJjpMaFS78TMnpL6bziqV1Uj9AxTv4fEX?=
 =?us-ascii?Q?Se6p6nF1ay0bOEdSzP6LE4m1jHw5ZYFgbGqqUS208NerdsUr2sEwvbvbco2c?=
 =?us-ascii?Q?2E/PfUIsQKvZ8Emhruj7nDzBiVxJovATT3ecKB5wv87ToUVe3dgtHxZFbGYf?=
 =?us-ascii?Q?glU0BAghfp5S2uDNFVe8XNbCA7y6YhORnRZw5A2dkW8R7/sq+si2nAJ3uBH0?=
 =?us-ascii?Q?ivv3TdXVbn3E/0u3SLI4WbTedJXUmGAsFLuNg3aFnuB+KvR4TAW9ZEoMb3Z/?=
 =?us-ascii?Q?+Q7MJMkyPAn210I1RG6N4Wp4D3S+a3JSAzV78VuDMXC8If018eJ6YaaEfu7o?=
 =?us-ascii?Q?D5dDEBBADl2XcKwtjhppXL0xzhESvehhVDOkwfbIVf2bNUwMTP64PYIcIRRB?=
 =?us-ascii?Q?I/n9+Bcz/v0nrXscfR/oh9mjPfhRIy09Yj18nhgQ1QSDDS7jhIkuYNVnuG8X?=
 =?us-ascii?Q?ZcxUCyWpGqLky2FXHiPL/dGOCmC6uFHjIq68pwdskdOc0Zc5KESmEvx9FQ8v?=
 =?us-ascii?Q?GwiErZ6rPuB4XU7KO0Awz3xITmzegUA=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b29f2d-deed-41d2-8aa7-08df3671667e
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:34:38.9655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yVvbdjEIPuyYHaCTAQ3HNOn4lbH64TB53FcxoD6ulKWeD/7D3IluYBqxrh28FodRtRMRntejf3J2IlVTmnkxk6EHcITc7jf2g1NdFvhWeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1P287MB3696

Add support for 2-lane operation.

The link frequency depends on the number of data lanes: 750 MHz for
2-lane and 600 MHz for 4-lane. Select the matching frequency table while
parsing the endpoint and use it for the LINK_FREQ control and the pixel
rate computation. Accept 2 or 4 data lanes in the endpoint.

The PLL and MIPI lane configuration registers differ between the two
configurations, so move them out of the common register list and write
the lane specific set at stream start.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 70 +++++++++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 507d714fbd21..9284b21a92c7 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -111,6 +111,7 @@
 #define OS05B10_ROLLING_BAR_EFFECT	0xc0
 
 #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
+#define OS05B10_LINK_FREQ_750MHZ	(750 * HZ_PER_MHZ)
 
 static const struct v4l2_rect os05b10_native_area = {
 	.top = 0,
@@ -133,13 +134,7 @@ static const char * const os05b10_supply_name[] = {
 };
 
 static const struct cci_reg_sequence os05b10_common_regs[] = {
-	{ OS05B10_REG_PLL_CTRL(0x01), 0x44 },
-	{ OS05B10_REG_PLL_CTRL(0x03), 0x02 },
-	{ OS05B10_REG_PLL_CTRL(0x05), 0x32 },
-	{ OS05B10_REG_PLL_CTRL(0x06), 0x00 },
-	{ OS05B10_REG_PLL_CTRL(0x25), 0x3b },
 	{ CCI_REG8(0x3002), 0x21 },
-	{ OS05B10_REG_MIPI_SC_CTRL, OS05B10_4_LANE_MODE },
 	{ CCI_REG8(0x301e), 0xb4 },
 	{ CCI_REG8(0x301f), 0xd0 },
 	{ CCI_REG8(0x3021), 0x03 },
@@ -529,6 +524,24 @@ static const struct cci_reg_sequence mode_1280_720_regs[] = {
 	{ CCI_REG8(0x4837), 0x0d },
 };
 
+static const struct cci_reg_sequence os05b10_2lane_regs[] = {
+	{ OS05B10_REG_PLL_CTRL(0x01), 0x44 },
+	{ OS05B10_REG_PLL_CTRL(0x03), 0x02 },
+	{ OS05B10_REG_PLL_CTRL(0x05), 0x64 },
+	{ OS05B10_REG_PLL_CTRL(0x06), 0x00 },
+	{ OS05B10_REG_PLL_CTRL(0x25), 0x3b },
+	{ OS05B10_REG_MIPI_SC_CTRL, OS05B10_2_LANE_MODE },
+};
+
+static const struct cci_reg_sequence os05b10_4lane_regs[] = {
+	{ OS05B10_REG_PLL_CTRL(0x01), 0x44 },
+	{ OS05B10_REG_PLL_CTRL(0x03), 0x02 },
+	{ OS05B10_REG_PLL_CTRL(0x05), 0x32 },
+	{ OS05B10_REG_PLL_CTRL(0x06), 0x00 },
+	{ OS05B10_REG_PLL_CTRL(0x25), 0x3b },
+	{ OS05B10_REG_MIPI_SC_CTRL, OS05B10_4_LANE_MODE },
+};
+
 struct os05b10 {
 	struct device *dev;
 	struct regmap *cci;
@@ -547,6 +560,7 @@ struct os05b10 {
 	struct v4l2_ctrl *vflip;
 	struct v4l2_ctrl *hflip;
 
+	const s64 *link_frequencies;
 	u32 link_freq_index;
 	u32 data_lanes;
 };
@@ -644,10 +658,14 @@ static const struct os05b10_mode supported_modes_10bit[] = {
 	},
 };
 
-static const s64 link_frequencies[] = {
+static const s64 link_frequencies_4lane[] = {
 	OS05B10_LINK_FREQ_600MHZ,
 };
 
+static const s64 link_frequencies_2lane[] = {
+	OS05B10_LINK_FREQ_750MHZ,
+};
+
 static const u32 os05b10_mbus_codes[] = {
 	MEDIA_BUS_FMT_SBGGR10_1X10,
 	MEDIA_BUS_FMT_SBGGR12_1X12,
@@ -983,6 +1001,19 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 	if (ret < 0)
 		return ret;
 
+	/* Write PLL and MIPI lane configuration */
+	if (os05b10->data_lanes == 2)
+		ret = cci_multi_reg_write(os05b10->cci, os05b10_2lane_regs,
+					  ARRAY_SIZE(os05b10_2lane_regs), NULL);
+	else
+		ret = cci_multi_reg_write(os05b10->cci, os05b10_4lane_regs,
+					  ARRAY_SIZE(os05b10_4lane_regs), NULL);
+	if (ret) {
+		dev_err(os05b10->dev,
+			"failed to write PLL and MIPI lane registers\n");
+		goto err_rpm_put;
+	}
+
 	/* Write common registers */
 	ret = cci_multi_reg_write(os05b10->cci, os05b10_common_regs,
 				  ARRAY_SIZE(os05b10_common_regs), NULL);
@@ -1194,9 +1225,16 @@ static int os05b10_parse_endpoint(struct os05b10 *os05b10)
 	if (ret)
 		return ret;
 
-	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
+	switch (bus_cfg.bus.mipi_csi2.num_data_lanes) {
+	case 2:
+		os05b10->link_frequencies = link_frequencies_2lane;
+		break;
+	case 4:
+		os05b10->link_frequencies = link_frequencies_4lane;
+		break;
+	default:
 		ret = dev_err_probe(os05b10->dev, -EINVAL,
-				    "only 4 data lanes are supported\n");
+				    "only 2 or 4 data lanes are supported\n");
 		goto error_out;
 	}
 
@@ -1204,11 +1242,13 @@ static int os05b10_parse_endpoint(struct os05b10 *os05b10)
 
 	ret = v4l2_link_freq_to_bitmap(os05b10->dev, bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
-				       link_frequencies,
-				       ARRAY_SIZE(link_frequencies),
+				       os05b10->link_frequencies,
+				       ARRAY_SIZE(link_frequencies_4lane),
 				       &link_freq_bitmap);
 	if (ret) {
-		dev_err(os05b10->dev, "only 600MHz frequency is available\n");
+		dev_err(os05b10->dev, "%u MHz link frequency required for %u lanes\n",
+			(unsigned int)(os05b10->link_frequencies[0] / HZ_PER_MHZ),
+			os05b10->data_lanes);
 		goto error_out;
 	}
 
@@ -1223,7 +1263,7 @@ static int os05b10_parse_endpoint(struct os05b10 *os05b10)
 static u64 os05b10_pixel_rate(struct os05b10 *os05b10,
 			      const struct os05b10_mode *mode)
 {
-	u64 link_freq = link_frequencies[os05b10->link_freq_index];
+	u64 link_freq = os05b10->link_frequencies[os05b10->link_freq_index];
 	u64 pixel_rate = div_u64(link_freq * 2 * os05b10->data_lanes, mode->bpp);
 
 	dev_dbg(os05b10->dev,
@@ -1255,9 +1295,9 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 
 	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
 					   V4L2_CID_LINK_FREQ,
-					   ARRAY_SIZE(link_frequencies) - 1,
+					   ARRAY_SIZE(link_frequencies_4lane) - 1,
 					   os05b10->link_freq_index,
-					   link_frequencies);
+					   os05b10->link_frequencies);
 
 	hblank_def = mode->hts - mode->width;
 	os05b10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
-- 
2.34.1

