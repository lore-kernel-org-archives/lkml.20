Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.79
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793356475;
	b=fiY6aUdXvGpe9pIZq4HgQyfnYVK1TYDaWhGRljYHRvWaanUV+TMqQME60Fpu3ie3G9kK
	 +/9JOqIaH0PY3mKMKH5lGvzrJzmKZFgd/u6Yzbcyvl62tebVwpMmqOj8t8L5K/kVd4Fol
	 f0xzDtU5oiXH6zTZ1WhIIzkJRwkuBPkHhbiPS2nI1KqFSOn+ozHd3Mntjd3jvwWfqi7z7
	 iSiDhfddGy7fuS9N45/+pvdVf10cqgRuDqDYYASWjU3UIl6Z1J3/WTQtgeBweIixYK5KF
	 ti5L2IZfhMyxQj34AgPmiF8LG62YpI/6UqrNFkHJRW/zANgSpeJIYTz5+ku32IWVNgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356475;
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
	bh=bbtVXxZZJrbDLrsOX5jApdODpeYfBxAgzvu8/+eLCJY=;
	b=EwKW0XrQ4KeesEdlVDk7+iE1cSm7TKm1RTMaaHbgBMQke1vViorP5zhcKYlirIyL++gK
	 JuaEt3/7GeuDMn4zCJ/f87hT/zLifqBScZW2XNT0f7jL5pF70Nbj2uFQ0sZHwwiKZOpZS
	 RfCGp7qGfsPnOM3+c3VCq2UUwo+mPFDHGMChar9R3a18jbVJVY7sDdJkoXUavacxzoZdF
	 N2xDDHKGTqQ1yBQQ3W7TcV+8CEuEJNjf1SDU/3liFJHh4kV7PnxvCsO4nyoYWwiUe7hHJ
	 XRU4eJh6+pdIhMblCtdH9g9mZaJLwkowATitTXRUdif1+cgF3yectmi4F2ox8HvC+tA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=mhVGTc3g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.79
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020079.outbound.protection.outlook.com [52.101.225.79])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36CF60A5BC1;
	Fri, 30 Oct 2026 10:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D36CF60A5BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=mhVGTc3g
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEtsR5a7LYxzt4foc2V864+93sz5ZvnN0voCj6l5zgkvGOgyEE+kVJElFPLvFcsVe+8lesbeyvyA5x3V0GC5ZZYB6+BhKtbzGIn2MGrFsDX2FrPoyYjQs40UcCRuatqi59JtsyqtCnhAcGFjJ8l00sn2lNCCrgOeLB+Gkt9ODjeGEdoX5XYqb71CfwM9Ug+nHTK7js/LacITEbHoXY+KWSmkkUneyN67dzuoct5ENe+jbU+62IUVWtkE/MxoxKvzyIETC2OgTsa7kAGOkAa2hTfG/+58dqKiXEr3S6eQ3lxI7gWOXP+q6K522JfsLWd82xOKAKqDEYjgbpvSNdL4rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbtVXxZZJrbDLrsOX5jApdODpeYfBxAgzvu8/+eLCJY=;
 b=X/Cd4s6zThonb7cuRIcW6jFouS6BsrQQc9wjujy/0AtD9OiaJhCpd8bQf0ZHfk/iypnqXF3cInpSmNLgmlAng33j/Slc6RJQLHy2+r6JkcLrsGVWd7ltiqLqISquGw8TmxPSgrqKs68ndzPNEIeCoEndhIZUkY6lZtPrkpPa0KQfXXXkXEeazomQ/ZSMR2PjplMeVXibbzkfgj1pCB0SxKQaeD6e1V0SEFyMwiQLOOeOTRnPOqRNP1xHrfe7F1G1retiK6mcNdlGsw97Ec90rh+ImlsN76jxpVfg6roaMrung693JKiOCQ7lzgBXZW7wQoOBYatoi/SX5qcGOXHFog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbtVXxZZJrbDLrsOX5jApdODpeYfBxAgzvu8/+eLCJY=;
 b=mhVGTc3gpalxLQMaPW4brogpV2sZJaPG3urzkjrF7hKS8Gz4jWHEF8ArnNbL164vwjl1POGdSf8dub+YOQ7Fxbeg8A9AuCSid9VyJfXkyh3HT31LXf3s7Fk2eC3DDSTi557oCadnD/GWVIn4p9GyyCAfeZSnUY/gbkvAVK+otEiqPnxtocNeYiQdEVxSyq2K2FCi1VgD8x1gMpOCTPlqQkEPVzsIbq4b9wBFg3ZG1GW+ZI8FpVWXbq/554q32lA3prsPsmbks55YqAeXZIvIH+183dBMedH2CFN0y/tPOiZ+li1ehENJpUGq26FMOzS8Xy6hLn/s1AplESceMSNcXg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB1404.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 10:34:29 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:34:29 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/15] media: i2c: os05b10: Add H/V flip support
Date: Fri, 30 Oct 2026 16:03:41 +0530
Message-Id: <20261030103348.1222201-10-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|MA0P287MB1404:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cea8e07-2e56-4392-5ce4-08df367160b9
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|38350700014|56012099006|261009223027099003|261009221227099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261022115727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 kPnIKROk+LAIxMc7af5ejhUdKEjpZbps0Duhe/TwnYJJgXgxEXPjwXDdH+gHzG7oRP99Ou82pUPhgy3m+PyfLSd7CePSQYl7ef6aCqpXbSJUDQ1kD/2txODuA8am0L2TGU15EQ66GaA4IErHPf6dlK6IoLzqvBxDKFGlLslBwHrWyS3aLehZgzUK4F2h+UGTDrufyRSd0+O1bhVxBaAPg0JmRTAGgv9APCTcsO3EKhe4+kyaWQTpm0IjxCc5KL60ZdnfnT10/fkfsXBujVd9azY3uI5J1l69TCTW2oj7T5DOo8qnGcyxqDVoWKwHJ+aOfiiNA2RYJhGgHpCYFMAFiqv4eTMZy4Zdp+9G4ZT08amKYITQGFw2Zb/9q0AFizYX3VaxNaJ0Y4qSKdrsg5tfEnF6kqzSzYboaZnvERAKnf/N2Ywghp4gDF7o0+ZXridoTFK0uJekhyS1QFPe7pjFi20stCyVqTjZki5YANTEZybRt4qw2/4jP6K56p/+75oKQZeTllA3NFxjm5c6tjxvctzJGdpdxnlaOLpjRLLRgzJeWQRJ9y1895d+8/OAnSqQ2Pmq6uLnMeKH3pbyYNtekqZ3fiXktg0UeuMUvClSHbbWQr2hbzF+RDNa5rxxtGvghZ6DiTytJnPVT9g/B1y+pXE6oMmzkRNEi99nYtaYYqTe32pbLgf8HaBERARwLM5BN/70eliu0PM/GBWYtwOJKo5Vxv7vMODsFR5FAF4m6Zc=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(56012099006)(261009223027099003)(261009221227099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261022115727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?at6ejUE9NJ8KiO6T2YuwAoVK63C+IX99XeQox3gVEnIxVA+ps/8kUbb5u33t?=
 =?us-ascii?Q?gkgoE8hYO5sP63P7tncMiujKBQLM9tiZJJ4wvK4QdGxU/Ewj17niuSj0pEqA?=
 =?us-ascii?Q?gPCA4I0nQCmmhGFWeNv30Bjz52iY2wP7r3o0kTQHX9MngLdftXFnwnU6Daob?=
 =?us-ascii?Q?PkFw5rXb/cBdVLYa4DQo/xNSl/4+t9GNdeNfxMxbqJbcncwScDwLGt+KYDxs?=
 =?us-ascii?Q?RJnSP1HW2ddEznLDBVoAFRn1JyGCjZLPn6Iyttlch1ED/8+c8LMiGi4g41P0?=
 =?us-ascii?Q?vqiFY/J1vqs/5YkoC4vc2DH16F6ffuKRzScg9Dn4YADoDSexSMN3b/2Ixh5N?=
 =?us-ascii?Q?TIMDj1iwu6ETnY1vNMY/PKkNBTsbQa+nnXXI4D1HI83m/+8O/o6kXz7f+2Xm?=
 =?us-ascii?Q?mH2O+jQr9qGB1FVTQ2REhN+i13TNsjP4hzgNSNO3QBjDln1upelK0SZmFuEj?=
 =?us-ascii?Q?4Hq2rpp3lbW342IddL6NfThC9Vv7pw05bqTI8ubjRmthD9m/jvZjBLHKG8sj?=
 =?us-ascii?Q?B9VcjWxrs4E14M/bIufAVQpXe+TyEcd5H+QVsI7FJyVOi8KXb/SLJMfNeFp6?=
 =?us-ascii?Q?rH6vi7EPFaFO9RCqRMHLDKJ/2crFiaj6MF91q9Mv+cX+Fr6ROgnffmb69RgA?=
 =?us-ascii?Q?Qy34mT3epI9eiXzAXDOU7DHTf9+es3H3ZllUI6paIstfeEvH4eNka5rftq0x?=
 =?us-ascii?Q?L/7zdIJa5qXIXpHr/VZM781zkSYIqxr1Jb004NvVmVcuBGTauUNT8DPPEJrb?=
 =?us-ascii?Q?+qN/sMg4Xh078LjWNwz+GhRFG9Ry4TXm/g4I2enomBat1NVMWB8t9AQIcif5?=
 =?us-ascii?Q?/VdFIi2WParlHaL2NBiU9S6IrnVjrAK1JigYjqjX8AY1aeHfsWYgVdi4cwXD?=
 =?us-ascii?Q?uv4W1BAFn7HR/e18LqdckrOKw22V0oXNqW3xM/YCmcHrLxf6bPSD8KuATs8L?=
 =?us-ascii?Q?YdR2Wo2uDkybzoLfAXkptXJWjgkP7vgL7xYiw20Bg2Aal/m+NWZrFGtTJOVT?=
 =?us-ascii?Q?d1o9foqjVKEwRSo+xu4ag1KMAOH8FZJY3+NxHuCvfJzdV1R556HMxAnaRJer?=
 =?us-ascii?Q?emd5DgwCpINPm/LSXJhWp8rrfccypkbwoc/6TrsTO7Tw/5SSfFytRfc41UR2?=
 =?us-ascii?Q?cBk3O2SytoEbQ7KGKhaTbbFEY2HVUpfjhBlkImtJjuNWEb0/zZpsOk4Zhg8B?=
 =?us-ascii?Q?/G5WQ8iLwGC/zvYrQrSqnFNZt10XTP8VAVKtfsNomGt4WKZDHBVEwQ6OEaNn?=
 =?us-ascii?Q?E8fEqHRCySXJ6taLW4ovtoiCjpes7rBrmvXoIeWJoEiXhCLhQcU6iTOznufw?=
 =?us-ascii?Q?siIXUUshMR2HG2eBPaej2lpi9fyNEPq/WosMOt5Ftlgd4xmojyUbASMlnMF6?=
 =?us-ascii?Q?L4utBI/qJS5ylFRbcabkjIrnLBtQwFLfE4HQ2BkI+SNPzNOUxP2wlfUKBSUH?=
 =?us-ascii?Q?RT4H0q7hS+75Im65ulBJRTMzjEV3ijat3WU5wrTA93ZQ7UKIQeCXmdm36wOz?=
 =?us-ascii?Q?LIXDUmOgSr6CuQHvIixeXvkWjzxAFGwRrrpcRhEuwbrGxfVDT9JNlfaNU4Gk?=
 =?us-ascii?Q?M+SS6+UsbHh4MTiRkXhoUzCByf3XbdW40stDweoIL7Ai22Y4Rd5azjFXro8t?=
 =?us-ascii?Q?1MAbpeNpODv7mClTWK38nkijQlOXVBovNXNftkgfBvYur0FmMiIa1LiSgnVz?=
 =?us-ascii?Q?PhndanDTxCOqra5/csytogmWEffoNfL65Vwvd4dFtUr3CTuerrb4BDm6lRF0?=
 =?us-ascii?Q?n6cuA8UO7vJeF1CT2MfAMlj3Jhborko=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cea8e07-2e56-4392-5ce4-08df367160b9
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:34:29.2784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HH8BSQotPnE/WFMI8idGf6KHXskSN8ZCsTr61PnsqhEo1++S7pN0cWgVrKpPcWPck9a+onIAJoRrep36aOvfzK5wih2jhjDZvgt5fdDpoN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1404

Add HFLIP and VFLIP controls, lock them while streaming, and update
the reported Bayer format based on the flip state.

Chain the two register writes through the cci_*() helpers' error-out
parameter instead of combining their return codes with a bitwise OR,
so a failure in the first write short-circuits the second and the
original error code is preserved instead of being corrupted.

Update the active subdev state's format code when the flip state
changes, so a VIDIOC_SUBDEV_G_FMT issued after S_CTRL reports the
Bayer pattern that actually matches the current flip state instead of
the stale one from stream/format init.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 59 ++++++++++++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 14046f1c9324..4b87ef60a2a7 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -92,6 +92,10 @@
 #define OS05B10_MIRROR			BIT(3)
 #define OS05B10_FLIP			GENMASK(5, 4)
 
+#define OS05B10_REG_ANALOG_FLIP	CCI_REG8(0x3716)
+#define OS05B10_FLIP_ENABLE		0x04
+#define OS05B10_FLIP_DISABLE		0x24
+
 #define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
 
 #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
@@ -227,7 +231,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x370f), 0x1c },
 	{ CCI_REG8(0x3710), 0x00 },
 	{ CCI_REG8(0x3713), 0x00 },
-	{ CCI_REG8(0x3716), 0x24 },
 	{ CCI_REG8(0x371a), 0x1e },
 	{ CCI_REG8(0x3724), 0x09 },
 	{ CCI_REG8(0x3725), 0xb2 },
@@ -459,6 +462,8 @@ struct os05b10 {
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *vflip;
+	struct v4l2_ctrl *hflip;
 
 	u32 link_freq_index;
 	u32 data_lanes;
@@ -507,6 +512,16 @@ static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
 	return container_of_const(sd, struct os05b10, sd);
 };
 
+static u32 os05b10_get_format_code(struct os05b10 *os05b10)
+{
+	static const u32 codes[2][2] = {
+		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
+		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
+	};
+
+	return codes[os05b10->vflip->val][os05b10->hflip->val];
+}
+
 static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
@@ -550,6 +565,25 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(os05b10->cci, OS05B10_REG_EXPOSURE,
 				ctrl->val, NULL);
 		break;
+	case V4L2_CID_HFLIP:
+	case V4L2_CID_VFLIP:
+		ret = 0;
+		cci_update_bits(os05b10->cci, OS05B10_REG_FORMAT1,
+				OS05B10_MIRROR | OS05B10_FLIP,
+				(!os05b10->hflip->val ?
+				 OS05B10_MIRROR : 0) |
+				(os05b10->vflip->val ?
+				 OS05B10_FLIP : 0), &ret);
+
+		cci_write(os05b10->cci, OS05B10_REG_ANALOG_FLIP,
+			 (os05b10->vflip->val == 1) ?
+			 OS05B10_FLIP_ENABLE : OS05B10_FLIP_DISABLE,
+			 &ret);
+		if (ret)
+			break;
+
+		fmt->code = os05b10_get_format_code(os05b10);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -564,10 +598,12 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
+	struct os05b10 *os05b10 = to_os05b10(sd);
+
 	if (code->index >= ARRAY_SIZE(os05b10_mbus_codes))
 		return -EINVAL;
 
-	code->code = os05b10_mbus_codes[code->index];
+	code->code = os05b10_get_format_code(os05b10);
 
 	return 0;
 }
@@ -708,6 +744,9 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		goto err_rpm_put;
 
+	__v4l2_ctrl_grab(os05b10->vflip, true);
+	__v4l2_ctrl_grab(os05b10->hflip, true);
+
 	return 0;
 
 err_rpm_put:
@@ -728,6 +767,9 @@ static int os05b10_disable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		dev_err(os05b10->dev, "failed to set stream off\n");
 
+	__v4l2_ctrl_grab(os05b10->vflip, false);
+	__v4l2_ctrl_grab(os05b10->hflip, false);
+
 	pm_runtime_put_autosuspend(os05b10->dev);
 
 	return 0;
@@ -736,6 +778,7 @@ static int os05b10_disable_streams(struct v4l2_subdev *sd,
 static int os05b10_init_state(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state)
 {
+	struct os05b10 *os05b10 = to_os05b10(sd);
 	struct v4l2_mbus_framefmt *format;
 	const struct os05b10_mode *mode;
 
@@ -743,7 +786,7 @@ static int os05b10_init_state(struct v4l2_subdev *sd,
 	format = v4l2_subdev_state_get_format(state, 0);
 
 	mode = &supported_modes_10bit[0];
-	format->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	format->code = os05b10_get_format_code(os05b10);
 
 	/* Update image pad formate */
 	format->width = mode->width;
@@ -929,7 +972,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	        return ret;
 
 	ctrl_hdlr = &os05b10->handler;
-	v4l2_ctrl_handler_init(ctrl_hdlr, 9);
+	v4l2_ctrl_handler_init(ctrl_hdlr, 11);
 
 	pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
@@ -967,6 +1010,12 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	                  OS05B10_DIGITAL_GAIN_MIN, OS05B10_DIGITAL_GAIN_MAX,
 	                  OS05B10_DIGITAL_GAIN_STEP, OS05B10_DIGITAL_GAIN_DEFAULT);
 
+	os05b10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+					   V4L2_CID_HFLIP, 0, 1, 1, 0);
+
+	os05b10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+					   V4L2_CID_VFLIP, 0, 1, 1, 0);
+
 	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
 					      &props);
 	if (ret) {
@@ -976,6 +1025,8 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 
 	link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	os05b10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	os05b10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+	os05b10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	os05b10->sd.ctrl_handler = ctrl_hdlr;
 
-- 
2.34.1

