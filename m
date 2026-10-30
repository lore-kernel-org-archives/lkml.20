Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793357409;
	b=eF56ZAbi0E5trbk3GybDpREf+RkD2fHKXGztPW973H/Mdxmr2LTG1qJgi5JSUG3uvELI
	 SqNmGjNVTarWLCZTEI8p151HCUmCszzQ9znrWEOJT1S4Y1giUQuY2kb/A+H10/xFuYjGp
	 Pbb3Io8sfWSOC3Qp2r/KWU6ZyZYsoYJfUT9uO6tltE18sUVSfgvtFslFIZx709jiuYEsd
	 8KwGkkERPfDJegjIgvzGjJut8w2tucZKQeggNRSuZFTCAoDu7c9s2xAFPoRQGc5qXIQjH
	 LZf6Yk/gMq1dHYIft6ChtwwHFV7Qonlk6N5ApBZuum3MntGW0twgUczfluReg5TsGSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357409;
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
	bh=qKDaawHmY1myn6Ai8bxwnYli+FYFFJIRuNIy2M0kO/0=;
	b=e8UINyCVKifrsY3ByFYHwywZ8KmRf7ebrSI/XGtXQq09lGax0U90+qNJhPqPffqDS7mO
	 lOitdg1V3K26w8ypFMyz62vOcUQVWMU9aLQVzhBynGsnapac5RwCyGkL6354v12LnB6Zc
	 G0vNElfwXl5FTBihsMaFXir0yWaF39NooV8LNaMNiTxub2wdna45jprL02hROVQU67aGD
	 GqtW7jML7tnzUUvbz8ehDADdu0/ZU3rsJIFOtntmRJ2Wb/wnLMfoIX8VFZ5kCdTK/DcBJ
	 1VR2oUnv0PeqxtT2W5BV8JLMiomR6xKpwdWHAvxJRRrN6AtiiM7fcQ53JIQMLEh4KOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b="kz36R+/R";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.75
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020075.outbound.protection.outlook.com [52.101.225.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F4760A382D;
	Fri, 30 Oct 2026 10:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44F4760A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=kz36R+/R
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcDX9NnBMv6YoTAY5iHwNR1A+VYJdtv4Imsx1CHpW/+NE5toCtEI6S/u0Bs+kb9gX/lC9bBC15ox380Uz/NCWuOiTEqHMsZfWja6oge/V7xWDUnWMLYXGWk4effeKLNiSYYm3GpVIBOLAzu3TA1M5rPbaGrTKszkMZg5mkvJbYCnX+qfMFRawjPQjQwk7/8PMDXQFPfJDhWkIDVdJ18LxolsmFeTCAxMGbGrnI7dn3+NaxS53Y31GKxDc5WJLON+srOekPPedw+1bYvxd+4joyrUIh437eTafBkhG77H9SUfoj2SQdbGA9585ylxxX+i42ztIvHoj6ZDCJKv17T5nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKDaawHmY1myn6Ai8bxwnYli+FYFFJIRuNIy2M0kO/0=;
 b=cLVIHVHujEbGtXbm7MyK6PO6Nse/LRkcVtS8d9zgXN5QQoFjIPpWS+TAMBLTLsTXBMe2qk3RzReYVgAlu3dQ3tw9UnodpuNIhAtoOdHH0109JIzSq80eqDQO3g4+DKxcEDyrkg/E//QB2PkbrfMTwrcWkiypoLi0bs8QaZwHn2JtjFiZE2wG5Cp7bKb9u+DPsQm4pDqTPJM/j2bb6KqtB3tQnsxPDz75HbxOj9mI5veiHCQEiuHlGxnhM0IYJ6LuRMLBuOwFa3saBohlPm9K25DlRgbJDKKjvNpKjtZ0lcxpm0DL+rDmYPLuPpjbWrFICH0WSQL/lpi6wxcr7lxwDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKDaawHmY1myn6Ai8bxwnYli+FYFFJIRuNIy2M0kO/0=;
 b=kz36R+/RDCYCM2f2cB1Ev8hCW28EmemMF6QbcZYYZo0zxYCUVsZK2ODcqMj+tjnpENfkAPIcR4Kyv1sv/2MOzHmTp+60bUFwqh7sYiqeIZ5i7DApMSqK5232Uee0bmvrzXCpOlj3GQuM5qHJJrTAJA9T9aSnFgYWdLT2QJ+yMZQlGyISyPm/CVklZAmnpNg0o6JL71SABJusecA054/NB87vOzKk5qYeviYLEc2ncbM8iF8EHAWotjqQ/o+8b10msrXLwiLc7UoUXNisIp5jcuc1PQS5uPQ7jahJQEZQ+Vg28BW125pe2olZhsSNYOo4UFqIi2ugVXoHJFxQMfR9nQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN2P287MB1787.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::8)
 by MA0P287MB1769.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 10:50:04 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::3d7f:7f9:3b6e:4781]) by PN2P287MB1787.INDP287.PROD.OUTLOOK.COM
 ([fe80::3d7f:7f9:3b6e:4781%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:50:04 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 13/15] media: i2c: os05b10: keep exposure default in sync with the active mode on VBLANK changes
Date: Fri, 30 Oct 2026 16:18:02 +0530
Message-Id: <20261030104806.1223991-14-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: 9a932ba3-0295-421e-bf4f-08df36736a12
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|38350700014|56012099006|261009223027099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 nfXwrMaFsiVxKZVOWZyutQ8SrM5ItkggtMx8gSO3uPRUG2jjJLtPn+QA9M+3XK/+pItLBEc0ZbhDnGT3Wpb9dGC6wk4DPkS2o7apWoef55e0ZmcoY4m9WtNiyTZZWsJF9GPEWMgyVrHPBUMeOF9cK7TBxHZtVAHXxA1+NhQ4tLh0jvn90cDaZ3tdCo8HjXnZ3HHIp9K4DjdCCF93hqrBxAshxoMKQxYxJPRCJo4paadM8JGAwvL61+rNWRFNE20qdhSoaJltxgX/SlHrCji8g/lhJq/6hsvwInKTOcrbJu10eVqs9InrdboGkMPi4EZgxMdmAg/Dyeh60d7EHJr3IGLkp5kYXJkt5/weIywC8dAjO+Oes2cV9NvjtM+lal4Lcp8VHNotQUKdSVwHtjuPXXSe6Ugl2nzkfFp6FW/qEOJr5doF2pP4j7RXma+fLKp0CVM2KFaY4C5WZPOzbA/pZqEKDgzrSWVspEiV3tskYnEf0gZ0Zeiw7QG64H/DGEE/q/CTku5rtgr2vRd7DytRuU92RFXE9nmhDwdmjcQsC4KypJsVbArL4nHL3/D6eZyOs/+eCMM/iRYXW5zN8R9vKqn6IAKjR/5uQsCa7KK73rjXGEKbtZncapa+j9y1ZZPVfearoJiWEKTNN/xacpYiXPbLGMq4S8MEqibO7NpUU2mPGFLzbLXJyfKnVkyDNJ5zTUMIYOO2DHeqwcauGZdMqUFTwNHoIuTL8SE/2hIA4pQ=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2P287MB1787.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?nr9KFTP6mux7DAWBGKeZbAszXdrmSSWNbOn7NohO+kNEpkxD143P+Eu/tSaq?=
 =?us-ascii?Q?l10VDwMT62owGaiD/pKo2m2+y+mb7TFG3vQqbihJvBtNmgSBTKZzPkI2dsl2?=
 =?us-ascii?Q?Y+jEZy1VDWkNBulLksp+WfZtWbgqoVn6gayEAbAMu6OvWhmgBbYPzwG56ALf?=
 =?us-ascii?Q?3wIrM1561hMvcmWQ4Uadxqr1xFfOwXJS64UGH+HBHxUVy4FpFKWeuDuZtYtY?=
 =?us-ascii?Q?bbsYpdKkZ8ai7//y0TcwJS72NektRXssPxTzO4OcC5+9OKNeLwfz/Ty80NPv?=
 =?us-ascii?Q?w3hhIZn6bnMzCGfh9sNd89CjfhPPxK5szt1UQbAQOAFwtGfxQvRoJlR4P85j?=
 =?us-ascii?Q?EIpC4f+DzAO3VM6NdsUJ5nnTF5ItovePxufbwDwdPW3tqCLOLWGpFJmAtHJn?=
 =?us-ascii?Q?gzOs+bXzirZvnGCJZJIt5zHJcvGokd6pASmRkfdT2uGLH563ieFBVuYdKEq8?=
 =?us-ascii?Q?Xx+TMBZXD9yY7pfKTPLJqEZH0mUfnNScigviBKkeZY97ZTTTdO0vh16W+I6V?=
 =?us-ascii?Q?CcB+7uLnW3dg5JsXAtvbknPCMr5qw4B4zlqeHDciRyui86KaX5DqcqcXZnYc?=
 =?us-ascii?Q?H1vNamsvyPDq31qXTXZQ9Nq4FFwFFj93Ztuh8zFH063lH8bdsoR8IKNEmZU8?=
 =?us-ascii?Q?HUi357qT97Gi0keELaIbAoDYO8GZqsyicY7VH022jyKfN4R+os9aZ5wI+OX4?=
 =?us-ascii?Q?8RRpr9xHhN7SqSvYXHpJRqPQejsH5wtddZnDPMuElC1ugCVnMaslidN+1woq?=
 =?us-ascii?Q?uLmOmHmTOKXdzEinhi+XfBq3gSL5+BwPrzXS//AfYCP/OIcfUrjENd/cRmhT?=
 =?us-ascii?Q?DtqNL1PJoDW9/uThkXCXdWQph3XZUNvX5JDVfHe7dcynhiSfZg0XIEmNeHAb?=
 =?us-ascii?Q?sv7m1ebmzjlbUoeOp//qiNfME7sxmobrR5QmPzjUKctEscueIlwgoevJHHU9?=
 =?us-ascii?Q?YhP8kaU0zrOfJ/VMx2ki0PI009XCgdzFi21sEpeZ6mzUWyA+lhvkRaV62in/?=
 =?us-ascii?Q?Qug3Is8eEAF2q9kuXvswIudXEJe/Jn3XpLiSs23e+QhRJOM/g5BWGSSGmFTK?=
 =?us-ascii?Q?O9oenwn8SFYfvVFMQ0C35Kfb9DU6PMWCe7hvInrn5sD1OuV3Fl3hro25Vd3p?=
 =?us-ascii?Q?atilHUR9bBtM8kCL//WajKGeYXco9eBrA9FVSHPS5DbxD0FKHYE0qnKh7Flf?=
 =?us-ascii?Q?Y6O0anZZzs5/nX0pUyXpHc+HMB54srlPTf0r64YSgk5Qoj1mVKG1YVD0GBo3?=
 =?us-ascii?Q?ROkkNhJgO2x1ywsav6u5rzP497GOzEz4ph2iqHJgivPpTaY9c06Wg4gVr58Q?=
 =?us-ascii?Q?QJ/fNWUEmUDhakmv3HKU1EOBXVdnBX69IJ458wXbL+rHfjZXxQU0Jhr+ArHX?=
 =?us-ascii?Q?/EyME5uwB2cb2/sLdsssWOVtPZp63lj5s0K9K90wccf3reTDrlhqf7JOquuN?=
 =?us-ascii?Q?nccAXcEsGXzLz2HBFnuuoyjSO68YWPuVGhDRAlRPEB6tO/ju1k4hqRArj5rp?=
 =?us-ascii?Q?Yo8VGCsCglaptKtoaenXmO2qjEFvO4bjmIqxtIkywJGwy0b+1VwuU7mfaZH0?=
 =?us-ascii?Q?1bJh/PlfLRWxDM8PF4qwdJtSO/+Oq0iXS+o7w4Z8rMi81KVTh6RQyWXmNm7I?=
 =?us-ascii?Q?kHHBUKQKejpAyjHgGZGf6p+cRelxI3GhE1OM9Xi3nej97SlKOTM9xnffLa2R?=
 =?us-ascii?Q?7Tki2/N9mVbgRerHxPwi2QVEL/XO0ohuJHafjNjMM8oT9jqk72tbS7dw3f1A?=
 =?us-ascii?Q?S9oajQzIq9Qs/hEJQf+PqKsQofK2rPU=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a932ba3-0295-421e-bf4f-08df36736a12
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:49:03.9528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2eWqQlMdlBmypCdQmWnTeAS/jXwWVbUHDgj/i/rSQ3qAor8sAAHl+ftK6PSTm99iaLaVB3E3DQIXixsbJK8Av3aBNKh56cqn8ZHIMj8vSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1769

Update vblank through the control path on mode changes so exposure
limits and default values are recalculated consistently from the
active mode.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/os05b10.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 48c406b2e544..507d714fbd21 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -16,6 +16,7 @@
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
@@ -751,13 +752,23 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
 						     struct os05b10, handler);
+	const struct os05b10_mode *mode_list;
 	struct v4l2_subdev_state *state;
+	const struct os05b10_mode *mode;
 	struct v4l2_mbus_framefmt *fmt;
+	unsigned int num_modes;
 	int vts, ret;
 
 	state = v4l2_subdev_get_locked_active_state(&os05b10->sd);
 	fmt = v4l2_subdev_state_get_format(state, 0);
 
+	ret = get_mode_table(os05b10, fmt->code, &mode_list, &num_modes);
+	if (ret)
+		return ret;
+
+	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
+				      fmt->width, fmt->height);
+
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		/* Honour the VBLANK limits when setting exposure. */
 		s64 max = fmt->height + ctrl->val - OS05B10_EXPOSURE_MARGIN;
@@ -765,7 +776,7 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = __v4l2_ctrl_modify_range(os05b10->exposure,
 					       os05b10->exposure->minimum, max,
 					       os05b10->exposure->step,
-					       os05b10->exposure->default_value);
+					       min_t(s64, mode->exp, max));
 		if (ret)
 			return ret;
 	}
@@ -851,15 +862,19 @@ static int os05b10_set_framing_limits(struct os05b10 *os05b10,
 
 	vblank = mode->vts - mode->height;
 	vblank_max = OS05B10_VTS_MAX - mode->height;
-	ret = __v4l2_ctrl_modify_range(os05b10->vblank, 0, vblank_max, 1,
+	ret = __v4l2_ctrl_modify_range(os05b10->vblank, vblank, vblank_max, 1,
 				       vblank);
 	if (ret)
 		return ret;
 
 	max_exp = mode->vts - OS05B10_EXPOSURE_MARGIN;
-	return __v4l2_ctrl_modify_range(os05b10->exposure,
-					OS05B10_EXPOSURE_MIN, max_exp,
-					OS05B10_EXPOSURE_STEP, mode->exp);
+	ret = __v4l2_ctrl_modify_range(os05b10->exposure,
+				       OS05B10_EXPOSURE_MIN, max_exp,
+				       OS05B10_EXPOSURE_STEP, mode->exp);
+	if (ret)
+		return ret;
+
+	return __v4l2_ctrl_s_ctrl(os05b10->vblank, vblank);
 }
 
 static int os05b10_set_pad_format(struct v4l2_subdev *sd,
-- 
2.34.1

