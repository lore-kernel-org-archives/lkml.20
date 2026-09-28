Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021111.outbound.protection.outlook.com [40.107.51.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4795F339375;
	Mon, 28 Sep 2026 12:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597736; cv=fail; b=UOQV1d/YtEtph0q+ktWVF1qXVnMkgIqFJD5Iid5mQSOIkpHxiJDDSEz/GPJLj0ujvNacqwHMIdgOBRyLRzytW4+VxdZQP0JjpZHB2JmvrGEkFupWZLWavr9EQa5Mm0MirzDgf+g1k1GmFbGk+acb/Lx44rfB+dK8VF4KMpocYik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597736; c=relaxed/simple;
	bh=VsHvELnr1/gsXIDt/ZOpk+q44aw9PGCgZP6D4dI4Qj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fM+V6qoqXUJu7jvBLW7W8brVmyUeOcwt3TonPCTLUnCJRsS9Pyh9flmE7f5Qozpqr4C1dppx7X4C8NPOEATg8QuR+yqyts6vaSXlx4G1aiLlF7FLf8IsYDQyH2SEpjVJzBGI1yKVKbGWDeAXLjeFOjpjd//1fh+c+87mrXK5udo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4vlqknn7/wxY47v8B15mbhcL8xcmCmuOqf9Jdem5hWLqBsHA3y6ntoudNDCjS6VXvds5C6NNvFKLR9EjbRrI+ldtcCxUQg+YgzxP8LK9i4l9GFUbelu/4DzNY0yEWuV3e/odXPjIPGNW8ePnsQu9bGSHdPPBRxn8qmHayYE/3ZkWL+G2uScbz98W2bQD2HwfoBfK/8yabBK2GJXHDh/Ysla1JjadiG5RigHz5Y87V+VVgexhOX/zz7lpozEbe02EVwdSNhS+ym1+bR66o5/9DX25ECjd6K+A1dSYrL+/MS1eUHRUgtguF1ey8dC/jRp9eHvTfM8eeyR1b2N+hRfwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iT2/xQ0kwimkhFDGLjW4HCOsNkPIuAgpK6lvRWKQ3zA=;
 b=gcwW9T338o0uqRPblW8zKNTpb1yTMWqkrjUeRrd2aX3AW0+5GGWBAd7MR7RLaeop3eS72DSMTbn2YQ16rIgQbr28i8X1R0iZhbyHLx+2qDTNjPXCQoWjrQjwRMbtZESgBNF84OQHBFmLl0mXPaWV9+RmGoWy/3VdbdFjnxg5akYPWLIRJ2drC3C/EfvuxzlRc9zsfuLEQTG1WZXCEs4eiGwN5gEM3rKRQFMCjRO4wH0uDKV27v6LR1PwRFCaVeVCT+dYJ3SUUgSNrRhPy5EwSV32qmnuYpU2iQCIr53EWL4yXOwqxeIli/1nbK5WXAufbj3cAfrty4gWFPIa2srwNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MA0P287MB0267.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 12:15:32 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 12:15:32 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v5 4/6] media: qcom: camss: vfe: Remove unused frame-skip
Date: Mon, 28 Sep 2026 17:45:06 +0530
Message-ID: <20260928121508.1404808-5-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928121508.1404808-1-hitesh@ebytelogic.com>
References: <20260928121508.1404808-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0091.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b8::11) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MA0P287MB0267:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f7db79b-a73c-4367-4494-08df1d5a313e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|10070799003|23010399003|6133799003|22082099003|18002099003|3023799007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	X91IgWsiHwA/Pvu6T7LlciXngvrBXgYFJzhNgf9urleUsIVr+aVVrhgWnOeC7Q6sv6awWbUtejV9Kk31BXb9pZAyCq65HevTB09l63Sbq2Bln2wZK9ztT+YvLCTFmoLkR6fkSVXfrGrpHRl6lbSR1TXRhJUByvpglWKOJbDyNDkdcentvv4OWbcXHiHkEUY7az0p/VF5/oumLum2CZJ2zj/1Hy4p1Mr/bEJR7grn0veyuUC/j3Rt/I6zlJ+8MVBWy3AYZERFDaUqn177iKkGnf0CQ8D1fHd1xtGszytE+gVspkGRD3IXmE0EB5nig+XDIzt89+fjMG1uzlHboETU1FjyTCbz98INvu1YtlbKvKaYMmFGdn2bQh+T3ODEL8TCuF5SX1fO3iLE7E/0AWiRB0hoLWORnYdZFKtOA/0qb7u2BK5OqC5zFwYiqZubpk/Q85UYy8DCDzgeIUzXyn65CaU4o+A/VBlhrGkTa9DS9jPV3ZR4ubYweIWeNHHp0yAQ3wYr9r3OoRLIDgJ8QGQsA5l05CTp9olgvpteanA81LGKvJlVNJYnwkHzU03QocEBqnFqq/JBaSJhWuE4pQ+WqVVmLLB1Bnap7JAmumqZbO00uCUWsAxgwUUSvZRLtAgAHyq8ggIgtTmJemNj7AK7fdqzvulE1wPGsBAt+s7/Az8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(10070799003)(23010399003)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z8vuCw7gI6ZBR8jioKFs4+TVsZ3ZLkANBOvbOPNb/S5owq7Pe4aBnHe2uz5x?=
 =?us-ascii?Q?nqk3m0V6uAjpkWaXvlKBkpsHKO2+4JaIdRFXC3fZsg1ACE+LZu/3Q6hUzABv?=
 =?us-ascii?Q?aotf3kbrrF5yknxvy3PhBN5i6wy8kH9u+WtvBgvipgHHwmqxcAt1hoeD48lu?=
 =?us-ascii?Q?6ooUK7lGyF/6HE1mfgrrj0StqKAeKbIb2SMDAsZ3dOft2VynyZcMjFHV/Je2?=
 =?us-ascii?Q?zP0gjTYhjz4KbGGfjxEPIDspo110LR2vYzpc4oVGTevltCoOPdRfyUZpWXQZ?=
 =?us-ascii?Q?SVpVZYEMA6XXdD7mY9DnnKsdWUgR9IsccX8PZJvERIRrrRjUxfH+6ivzjlBi?=
 =?us-ascii?Q?ugFNrBgsZ1rCpkprfTAC1GWzHnn9GOnIDvycb8akfq4SQDOq4Lhe0HnBe3uM?=
 =?us-ascii?Q?Z90yUOcq+oXBeB13K0q8aoMTFzeMFNPYfipI2zY73JUj7AD0Bx0uAOIQ7P3k?=
 =?us-ascii?Q?lBe0uVlWFBxAwqB6MyFsFpcUemjlCzdTuyxqPJ+pSV5STzwanLO//H0CIRS7?=
 =?us-ascii?Q?G4qkBCs3b+AuIviLlZ55Bx0A18Lw2AA9hM8Vuw2yCCmTroOvAc0GkBtwyvoq?=
 =?us-ascii?Q?Sc+dpGXgEPGv/9uL+T7Z9/lG4m0/xzUH1mTceH+xstFxslJXItZcpRhqeIWS?=
 =?us-ascii?Q?pWpQxVK/s+PCJu+3SThDhPObZvRlXBSHnowL8CmJw08STpyeD+jDyXsYjwHE?=
 =?us-ascii?Q?iCMKlcbyVzf84FgdfXfE4F0MbwAGjisHlpWn+M30/X7ivdzbrmVv3dtRR1Se?=
 =?us-ascii?Q?ayYAEkNn3/wvanq9tcLVcbTGZhryF9Uy3AqewuNm/EvgyuhvHYoRARQmILb8?=
 =?us-ascii?Q?sRRI9FRZ4i6DmZrYTpDXhNZl05t6nu1OBEnQEkUQujkuZY52m4eSz++xsWgD?=
 =?us-ascii?Q?xDrhUDvGDv2DfsVU8/5adyyXzbAszGigJWBzMLplhj2GLJXpkk78T8QpdWBG?=
 =?us-ascii?Q?yU2rf0qBy/Ilgt0tteKWsZvKUoK4OHrcYbhaJYFYfioJ3B+YJ/G7cm58tZlw?=
 =?us-ascii?Q?dGjGGLVjDQOC8f3CJsoh9rZ5AM1k1a8ZgaofLK9NPaMyDaE0rzlJjIOIDnOb?=
 =?us-ascii?Q?emzwvi7ZdN7gN+15mHGM6bPdE7NxWchQU1Htt2g2YeD1uzB7o44juI3/E5Bu?=
 =?us-ascii?Q?aR7qybIKQ6B5OLw4mFn7T6l7Q9RQ2slCO+RghsGABxaraMRkA9G6sVy9KzEC?=
 =?us-ascii?Q?+3RdjxGIoaGXJzw6+f5Ro9eCdk/VS7PS7BsYuKeZCl0CxiJ4VUe+cEgiCHO4?=
 =?us-ascii?Q?TUGOhBtB4P2TYBGHGq3GeCRgslBxGM6yfNmFNXmGYXXvvxsF/254a4MuS3dZ?=
 =?us-ascii?Q?nIme2FYwHvaiGXv7LzfXUJILyVDC1Q9zrdut39mJdUSMv9Yca1xVp+CT4nBY?=
 =?us-ascii?Q?MLQUwTZVq9Ry7AoxzT7/yLC6l+uX/OjXsX1KqKP/dcUrG9RZF0YeFftBzpq4?=
 =?us-ascii?Q?24d7li7eAtSmM+7niTGxrivxbujqHrRFoLwconMNwHLT1Xhr+3IbZFbzljlh?=
 =?us-ascii?Q?OJu5DLIJ4kAOrg0R/KrO9nY22RNo81ZVvdWDhkmNg/1RFbuXrypf1blRbyZb?=
 =?us-ascii?Q?4ddTuZdd9XVhPjSeZoqg48kfKLK0G2hE54p99iONJsDd0GomVkSGh4OPDOQP?=
 =?us-ascii?Q?JGagiqouZKkl1eSOftgbu1oHoQYFj4OBuNO2UQ7reP8Jdq3Y96wOmlq7fSbP?=
 =?us-ascii?Q?32y0T5KsrngldWTac8wdVz7wllgRMOqSsYOUGECvw9mqdPvJ2cAe8QUV0L9L?=
 =?us-ascii?Q?GTpBey6kN9KI6UbHtdzIjPvT4TR2/tFjHO8KDsp8wPAmKgnkS8zcpXgWxEuG?=
X-MS-Exchange-AntiSpam-MessageData-1: RKc+/YPbkOAYwg==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7db79b-a73c-4367-4494-08df1d5a313e
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:15:32.1990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rj4g5P7RE5DkARFzW9Bpi7ZsPEvIaNxRAEI1VWG9hcna1AqyFQmr0qplRIQEsNNFipPovlYVDAKheNaFWAgtLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0267

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

The frame_skip logic originates from older VFE implementations where it
was used to program the hardware frame-drop mechanism during stream
startup. The Gen2 path neither consumes the returned value nor programs
any corresponding frame-drop configuration, making the sensor lookup and
g_skip_frames() useless.

Remove the unused code and associated local variables.

Furthermore, startup frame filtering is generally better handled in
userspace camera stacks, which can discard unstable frames as needed
without relying on driver-specific mechanisms.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index d20cd4dfb9..9c1b1b85d9 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -507,22 +507,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
 	struct vfe_device *vfe = to_vfe(line);
 	struct vfe_output *output = &line->output;
 	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
-	struct media_pad *sensor_pad;
 	unsigned long flags;
-	unsigned int frame_skip = 0;
 	unsigned int i;
 
-	sensor_pad = camss_find_sensor_pad(&line->subdev.entity);
-	if (sensor_pad) {
-		struct v4l2_subdev *subdev =
-			media_entity_to_v4l2_subdev(sensor_pad->entity);
-
-		v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_skip);
-		/* Max frame skip is 29 frames */
-		if (frame_skip > VFE_FRAME_DROP_VAL - 1)
-			frame_skip = VFE_FRAME_DROP_VAL - 1;
-	}
-
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
 	ops->reg_update_clear(vfe, line->id);
-- 
2.43.0

