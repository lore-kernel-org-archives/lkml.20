Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792551950;
	b=vj22J7sqaLSV/FR5uqXzX6+z3Jsdpw8RDFlR0gXUGnytzqqcSnvZ/5ZhhrqTC8smjJ0Z
	 xJA8lYBol+UvjHMKYoOT0kw8yyGx80ZyKOuSvWxQGyV9kAnPm3EgpcAwKZHNmVAKRQUoG
	 hipAnxpPFdq9HB+tiCHJbr5fCOOplMohZcb2n/AXAyiUd59Xqs1x6u9bfMSjIWwkNnVk/
	 2xYdYb3PLx30IMZIKtPCopsv1b7LprHgC8/MpdS6ocD5JLozhp/LyqVNrvAkmpUr9Q5Qx
	 lmt9nikVvXcGEgs5ES8RXgOV0OfZK8s4TO+0033JocB75XzifM1puHoFBttmqD7xTBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551950;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=CWQCFus3vSK44Qyk8ON4AO35bIWSLJZn6jPjYSwsUxY=;
	b=x385BBBXWSOusu5LP/IJYkzFdGV4PJJj/uOYh+rimiUxJWY0CwocolgM9Gn8IwHeo/Xy
	 w00YvGdjMfTIbSwrkR1dR3wNb7VWjvF3OJXemSBzmwKahYAtWmpvR9UsXXKer/UsFNVa7
	 TU1xrVO1jLNNa9QXEy6tQIZ72E+jFZ9pr4fOefFYVPT44W/VL6+o173b0uQ75ek7b9Fw8
	 yvwQmGDTslLdt4rPs91/jMmq7Vmj2rx6j/pxeb4EN0lXajJaFy5Qmv1PrhRmhiMuGXu1d
	 l7dxMJpMHc3Ak514oa+dV/iMyw4IR3uqqHO7dvYkf11nCIGhjyFRqTmMCymgIzQsA9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=DlsJCyF1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.64
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011064.outbound.protection.outlook.com [40.107.130.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5430A606A323
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5430A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=DlsJCyF1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGO2rIMvZ9bBoCdPPYvpr+//r9+aT1lgsv177kDMGwtpRt9xUApreGFrVB5nqPdIejwSTYv/OffSzgKCx0c5VE4OciOg5upKnWSsZa25EnGNu40h9DB/URMsYxJVGT3uSWr8ELb39gRGlzwjFU8mPki/A/fYwOCW76p5R97o6LvVqT32RSWw3WQbBOW+NLGaOc4ORMMPLAKjmVyKYu+a6we2ZEg/5RxE3Xr1TvajDGCH0144z+FrHKF+Jr5S+iWXCVF7mB/mCLo3OjHDTPS93H7VTUPk6isAwVSYXM2h/7MjvsRfdmVgW7hJqOlNpIiYLp2JpoBV+3kZLAhhycC2BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWQCFus3vSK44Qyk8ON4AO35bIWSLJZn6jPjYSwsUxY=;
 b=xkBHtcg7y3llDJ2jngiS8kXvsJ6QjBXJdTQD7xjfrHXhsNbh9Zftd14qgMe2bs0lYivQjKXrMjZMraVqr1uxDT12ZvtwKDcfXKCfxYaoyJIXKr+Jg83ZLgdpkKxCCGE/gvwKRdbodzNJLpyG51+Vwh6Gj3nj3uCwCZgl0LISygB5iWzE3AKqWM8a5Kn8KcpY20hNqLACSTKcSMIQhDKm1oFtgKOJxVy8uICZEJl6hLrI5YXS29JOtbejDrrwYbyRIAw6mZdaFXqOcMeqpX3tvqmbNrlRGdnidw5zD0GiqWcHZNnZWwx3DCEIbF6FwEpwvWObJao1jL9ILUduCVY6cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWQCFus3vSK44Qyk8ON4AO35bIWSLJZn6jPjYSwsUxY=;
 b=DlsJCyF1n5iViZmcJGmIEOqzeEDJgNDHkYwyON/b3/V9DFe8Tsm4qEtgOU4/B4bZqTRsSzB9dO1wZXZ2l2xjEhDfb/HdWRs7ygmhm4Zg5QG463x35Z0X6wZpVCL4IJRMa10lsuy/KXifN6ASoZ6+9BFuHRZUA4oTT/TOi/Yw9TvfMpgumWqIbUdeiJvgimKSz3ngjC+YjMx2Af2Zl5ssNnBARahzrbJDGcz7DAfmqJ26oRGOODDmDMBUhxFp59uT/cwZeoa4iRat+j2NcYo1xn8MuRiRZeZvgAJS363GuQOH3K4AnIy7YiwC1mL99KFIq9PMBFwcgr0r1yIheSGxCA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 03:05:44 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 03:05:44 +0000
From: shengjiu.wang@oss.nxp.com
To: p.zabel@pengutronix.de,
	krzk@kernel.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	broonie@kernel.org,
	alvin.sipraga@analog.com
Subject: [PATCH v3] reset: core: Serialize concurrent deassert/reset of shared resets
Date: Wed, 21 Oct 2026 11:09:25 +0800
Message-Id: <20261021030925.3543841-1-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::16) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|AS8PR04MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a27f160-fcaa-4227-f7ae-08df2f20325e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	RBhYcW+CMFzgk/dMfOvqrPB3irdwDa3zeTw+ypMX7QsVQnoWJzwXCIIW6t1vwfBU7YKv/1Z/8sKWLvSAEOTX6aHzWoi+pXjcXGXkws+xT00zSnvOyc5yBRcKgSkOPWVur0rax7s4Goiwp+UC0Mt57p7STUhgVTOgJ6/8qt85TYSaMltLdbYEEo1q6kgxiRdJw4S5C2kt9WgZmvIcn2XHSIl79ZRUkMLop1PnUkYBfwZEsEdSoLGPnFBMPR6BGTuRoIvMDkQOwAen56pyhX6hzc8T88qRZs1lojYEW+1S4QnaGvf/Pz4jdx+Q1r/enxMT6umXub9eniX8yfDExVrgBe2fGhYAVwTCnT97uF6+uVwniUZzk+2+FLXkZ9vnOfv96ck/ocKtWsETecrzvzRXkg/buytb5/z8Temq13zK8h6xX+pdvRQPW0OmDPZD5fx0WCX1JqASw/pvjKE/jvRz7AQGac1Z5i7VG9aUAzcZW2j1MHrSf9ZL2wgT/W9FXliAMhSrXFUa3vIYMI/6M4hxU1mBAR6fb27Rr/nk/qCViGn348DUtjxhR/c4g4ipBaI0fccPJFYWXZQKrXFkJYJc0y97VA7QLY5CYF4VIknv7N9OiVUN+TuFJLKRLd7gj/3K
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VROmXynBEKKJslHJAbiF76B27s1oORZZVRQRuMMF6YUNQKLVy/W5Pmo2NCLe?=
 =?us-ascii?Q?1YVFCUJI6tZKFSEdUVNYTsysbeSNPTGLl7cFD8+M9NPxkBXJBjhgfo8NHemm?=
 =?us-ascii?Q?ZOwKx8eeHjm3BhAWSErYmUhG6pYZVXsLGfFIDM42frLxzk7puPDVuKKmX/sV?=
 =?us-ascii?Q?oHrhvoKHKsjuz4JSpOYFaWZa2LwYrLDscyGleVD/30YpwC3Vku+hrLb2w8cx?=
 =?us-ascii?Q?gEbCdW2tGwdZjsCOMBODp9S4wj0I3nPOYpkvFi+in8kPOT+Eo8OPawzQkUot?=
 =?us-ascii?Q?W3OFUGiOnap7Ja4ERqaA6RzQ3FAI1h+pxliKBoaYurNvWePG5dWgOShrGvno?=
 =?us-ascii?Q?h1hBbGFoqcLCH/cS5RILU9xlgfx+0c+kTFcqd3Xvh5UCKKDH1k3n+iv4gwCP?=
 =?us-ascii?Q?THkq1Z0TUa1vYHAnUhAayB3pNXXVs2IhCcb3fqVRYKiFFic9AsNbZX/lBhRS?=
 =?us-ascii?Q?EAw7D/pYuRvinHmUYvja03LPwv0CQKaKHXQt/P9LSCvHU9wmWTZN1k3XsiyD?=
 =?us-ascii?Q?FSuVdRqCDPnQlX3wiHH4AHsFr+20+kLM7OrLew2M8t2xlb5mmPqkKm73IFo2?=
 =?us-ascii?Q?YDt5Jep8ZKiobsIdLlMWSMERkaLlsphwiVJI8Q8TocISOK2RYP/s5L1XdQJ0?=
 =?us-ascii?Q?tnLnSe8fX0SKzH9fFIxKRlmn3OKMKiBO09zWv32RkGhhZWbfyPiSe3gPSBmR?=
 =?us-ascii?Q?4zbOvRBcheNdRmQP+zeK4+kGLyuF5fSmDF05+CG/ZBkrQp1F/mey3l7QaJKp?=
 =?us-ascii?Q?bMfIPvrx+TVnAFxDYTyC1ZFSy0QwNOGdUmvRkFZOMd7ueXq4a+aTHQO6/bSm?=
 =?us-ascii?Q?yPW8vgX/LJ5oloMo11MQdK4/FpFyoPv8xmNOIYMEfFTE2mmqcf7lZ82dBXPX?=
 =?us-ascii?Q?uR+FEI7EjJAiDFiWPew75k3RK9JKvFSmxuC8oTz2TPJfb2BKluSGj53slKRi?=
 =?us-ascii?Q?66r72VNX/1QO0gmzlDllcjoDum4sGeHg6orSDKrDDbJbUGLJ/XvMWsG4aKGg?=
 =?us-ascii?Q?/VaIY/Z5rKuShi9t5bNH9wUaPU8Xupb1jnZ5GuocLeh+HRQNJHdanOM/DhH+?=
 =?us-ascii?Q?Q9uhWv9xzn7ZHzqb7CxNGm7QKWRM5wp16u7JszUMusm8atKaOaDZJxbiB704?=
 =?us-ascii?Q?HSPEuMzbYnnszBjhtLYO7twfLx3XIr8gYPLaHSx+I87neFHBs7HVcP1ce/iN?=
 =?us-ascii?Q?J4ZUCJR17/wb3QVLXzRHmDGV3pHpd6LvQePof4dVRgWwawbgQk5fipjJ5VPs?=
 =?us-ascii?Q?For+JDr6zlzsBKsirlP2dZH+8evEjP1WwTXePoEdYyLRpKMIrmngAv3XIa/h?=
 =?us-ascii?Q?u18/EXKIxVHaJv83P9OLNBMxK69RvrbUGyQ0VdrfMDtB1Lu29Z7sowLlXhp4?=
 =?us-ascii?Q?CaCwpf8OqpfblmQ59XhfyxFwmw4X2DbTn8rXLUDCjbu2EGDSJiaPcXKcDvWm?=
 =?us-ascii?Q?/Xoeu1aOo9SjST7NvC+cjICtO9wjl64Y0kWKKm76qbYP9pfZgZ7f7j1Z+9zv?=
 =?us-ascii?Q?MMEop9DdyYiF7WIYn9JNOeezcst51z6dM97fcKzwKRx5gOGWqQ+jiV8YJkvV?=
 =?us-ascii?Q?xiRiIksK8HsMsZ2V9Mi9AtH2+E1CvdbJMHcOFsYP3vlMrGkBmPstR5fKocUV?=
 =?us-ascii?Q?DqyZSqYrFY1yi+85PjPT4pgxKl6Fu3vSEusyVxAmp8ebsq3SOmiaFVHaZ3yM?=
 =?us-ascii?Q?7HRq4Qspy0omyF9pJo3joyymGp9+rXQekESckX8FbydM6brLWfndvg91xwgN?=
 =?us-ascii?Q?vMq+Z/XdhzRcWm/OETum/h0Gd2Sxwqcv+IjUC5WepAhrOJLF/O07?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a27f160-fcaa-4227-f7ae-08df2f20325e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 03:05:44.1706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9pQO+4yGrIL72zJSj7CMat3q7GfVKRGHvQAfnahmApJOclknQx/aYrlWDOR2HBSlpdhA0FNvAAFHS7mnjOf95l3+e263k43IgPQJlvyILh4K5qZfwNaRN62RMzfQSm+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8420

From: Shengjiu Wang <shengjiu.wang@nxp.com>

reset_control_deassert() and reset_control_reset() are documented to
guarantee that the reset line has been deasserted, respectively that a
reset pulse has been issued, by the time they return.

For a shared reset only the first caller runs the hardware op; the other
callers just bump the refcount and return. When the op can sleep this
breaks the guarantee: a second caller can observe the bumped refcount and
return before the first caller's op has finished, and then touch hardware
that is still in reset.

Add a reset_controller_dev::can_sleep flag that a provider sets when its
reset ops may sleep. When it is set, serialize the shared refcount update
and the hardware op in reset_control_reset() and reset_control_deassert()
under a new per-control mutex, taken inside the SRCU read-side critical
section. Providers that leave the flag clear keep the existing lockless
path, so callers in atomic context are unaffected.

Set can_sleep in the reset-gpio driver, which drives the line with
gpiod_set_value_cansleep() and may therefore sleep. Other providers whose
reset ops may sleep still need to opt in.

Fixes: 0b52297f2288 ("reset: Add support for shared reset controls")
Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
Assisted-by: Anthropic:claude-opus-4-8
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Link: https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/
---
Changes in v3:
- Drop the reset_control_reset_atomic()/reset_control_deassert_atomic()
  variants and their reset.h declarations/stubs; gate the mutex on
  rcdev->can_sleep instead, so non-sleeping controllers keep the lockless
  path and need no new API.
- Use a dedicated rstc->shared_lock taken inside the SRCU read-side section
  instead of reusing rstc->lock before SRCU.
- Set can_sleep in reset-gpio; no other provider is converted.
- Drop the lockdep_assert_not_held() additions and the reset.rst / kerneldoc
  text about sleeping-vs-atomic variants.

Changes in v2:
- Serialize only the shared may-sleep path under rstc->lock (taken before
  SRCU to match reset_control_acquire()'s order); exclusive path stays
  lockless, and reset_control_assert() is left unchanged.
- Add lockless reset_control_reset_atomic()/reset_control_deassert_atomic()
  for atomic callers; gate the mutex on can_sleep so no shared consumer is
  regressed and so it works on all configs.
- Factor the body into __reset_control_*()/__reset_control_*_locked()
  helpers, and lockdep_assert_not_held() at each lock site to catch a
  controller op re-entering the API on the same control.
- Declare the new variants and stubs in reset.h, and document the sleeping
  vs atomic variants in the kerneldoc and reset.rst.

 drivers/reset/core.c             | 125 +++++++++++++++++++++----------
 drivers/reset/reset-gpio.c       |   1 +
 include/linux/reset-controller.h |   3 +
 3 files changed, 89 insertions(+), 40 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 38e189d04d09..dd6e47163f6c 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -52,6 +52,9 @@ static DEFINE_IDA(reset_gpio_ida);
  *                   only used for shared resets, which means that the value
  *                   will be either 0 or 1.
  * @lock: serializes the internals of reset_control_acquire()
+ * @shared_lock: serializes the shared refcount update and the hardware op for
+ *               controllers whose ops may sleep (rcdev->can_sleep); taken only
+ *               inside the SRCU read-side critical section
  */
 struct reset_control {
 	struct reset_controller_dev __rcu *rcdev;
@@ -65,6 +68,8 @@ struct reset_control {
 	atomic_t deassert_count;
 	atomic_t triggered_count;
 	struct mutex lock;
+	/* serializes the shared refcount update with its hardware op */
+	struct mutex shared_lock;
 };
 
 /**
@@ -355,6 +360,32 @@ static inline bool reset_control_is_array(struct reset_control *rstc)
 	return rstc->array;
 }
 
+static int __reset_control_reset(struct reset_control *rstc,
+				 struct reset_controller_dev *rcdev)
+{
+	int ret;
+
+	if (!rcdev->ops->reset)
+		return -ENOTSUPP;
+
+	if (rstc->shared) {
+		if (WARN_ON(atomic_read(&rstc->deassert_count) != 0))
+			return -EINVAL;
+
+		if (atomic_inc_return(&rstc->triggered_count) != 1)
+			return 0;
+	} else {
+		if (!rstc->acquired)
+			return -EPERM;
+	}
+
+	ret = rcdev->ops->reset(rcdev, rstc->id);
+	if (rstc->shared && ret)
+		atomic_dec(&rstc->triggered_count);
+
+	return ret;
+}
+
 /**
  * reset_control_reset - reset the controlled device
  * @rstc: reset controller
@@ -362,6 +393,9 @@ static inline bool reset_control_is_array(struct reset_control *rstc)
  * On a shared reset line the actual reset pulse is only triggered once for the
  * lifetime of the reset_control instance: for all but the first caller this is
  * a no-op.
+ *
+ * After calling this function, the reset is guaranteed to have seen a reset
+ * pulse at any point in the past, not necessarily during the function call.
  * Consumers must not use reset_control_(de)assert on shared reset lines when
  * reset_control_reset has been used.
  *
@@ -371,7 +405,6 @@ static inline bool reset_control_is_array(struct reset_control *rstc)
 int reset_control_reset(struct reset_control *rstc)
 {
 	struct reset_controller_dev *rcdev;
-	int ret;
 
 	if (!rstc)
 		return 0;
@@ -388,25 +421,18 @@ int reset_control_reset(struct reset_control *rstc)
 	if (!rcdev)
 		return -ENODEV;
 
-	if (!rcdev->ops->reset)
-		return -ENOTSUPP;
-
-	if (rstc->shared) {
-		if (WARN_ON(atomic_read(&rstc->deassert_count) != 0))
-			return -EINVAL;
-
-		if (atomic_inc_return(&rstc->triggered_count) != 1)
-			return 0;
-	} else {
-		if (!rstc->acquired)
-			return -EPERM;
+	/*
+	 * For a shared reset only the first caller runs the hardware op while
+	 * concurrent callers bump the refcount and return. If the op may sleep
+	 * (rcdev->can_sleep), serialize the refcount update and the op so a
+	 * concurrent caller cannot return before the op has finished.
+	 */
+	if (rstc->shared && rcdev->can_sleep) {
+		guard(mutex)(&rstc->shared_lock);
+		return __reset_control_reset(rstc, rcdev);
 	}
 
-	ret = rcdev->ops->reset(rcdev, rstc->id);
-	if (rstc->shared && ret)
-		atomic_dec(&rstc->triggered_count);
-
-	return ret;
+	return __reset_control_reset(rstc, rcdev);
 }
 EXPORT_SYMBOL_GPL(reset_control_reset);
 
@@ -575,6 +601,36 @@ int reset_control_bulk_assert(int num_rstcs,
 }
 EXPORT_SYMBOL_GPL(reset_control_bulk_assert);
 
+static int __reset_control_deassert(struct reset_control *rstc,
+				    struct reset_controller_dev *rcdev)
+{
+	if (rstc->shared) {
+		if (WARN_ON(atomic_read(&rstc->triggered_count) != 0))
+			return -EINVAL;
+
+		if (atomic_inc_return(&rstc->deassert_count) != 1)
+			return 0;
+	} else {
+		if (!rstc->acquired) {
+			WARN(1, "reset %s (ID: %u) is not acquired\n",
+			     rcdev_name(rcdev), rstc->id);
+			return -EPERM;
+		}
+	}
+
+	/*
+	 * If the reset controller does not implement .deassert(), we assume
+	 * that it handles self-deasserting reset lines via .reset(). In that
+	 * case, the reset lines are deasserted by default. If that is not the
+	 * case, the reset controller driver should implement .deassert() and
+	 * return -ENOTSUPP.
+	 */
+	if (!rcdev->ops->deassert)
+		return 0;
+
+	return rcdev->ops->deassert(rcdev, rstc->id);
+}
+
 /**
  * reset_control_deassert - deasserts the reset line
  * @rstc: reset controller
@@ -605,31 +661,18 @@ int reset_control_deassert(struct reset_control *rstc)
 	if (!rcdev)
 		return -ENODEV;
 
-	if (rstc->shared) {
-		if (WARN_ON(atomic_read(&rstc->triggered_count) != 0))
-			return -EINVAL;
-
-		if (atomic_inc_return(&rstc->deassert_count) != 1)
-			return 0;
-	} else {
-		if (!rstc->acquired) {
-			WARN(1, "reset %s (ID: %u) is not acquired\n",
-			     rcdev_name(rcdev), rstc->id);
-			return -EPERM;
-		}
-	}
-
 	/*
-	 * If the reset controller does not implement .deassert(), we assume
-	 * that it handles self-deasserting reset lines via .reset(). In that
-	 * case, the reset lines are deasserted by default. If that is not the
-	 * case, the reset controller driver should implement .deassert() and
-	 * return -ENOTSUPP.
+	 * For a shared reset only the first caller runs the hardware op while
+	 * concurrent callers bump the refcount and return. If the op may sleep
+	 * (rcdev->can_sleep), serialize the refcount update and the op so a
+	 * concurrent caller cannot return before the op has finished.
 	 */
-	if (!rcdev->ops->deassert)
-		return 0;
+	if (rstc->shared && rcdev->can_sleep) {
+		guard(mutex)(&rstc->shared_lock);
+		return __reset_control_deassert(rstc, rcdev);
+	}
 
-	return rcdev->ops->deassert(rcdev, rstc->id);
+	return __reset_control_deassert(rstc, rcdev);
 }
 EXPORT_SYMBOL_GPL(reset_control_deassert);
 
@@ -879,6 +922,7 @@ __reset_control_get_internal(struct reset_controller_dev *rcdev,
 	rstc->id = index;
 	kref_init(&rstc->refcnt);
 	mutex_init(&rstc->lock);
+	mutex_init(&rstc->shared_lock);
 	rstc->acquired = acquired;
 	rstc->shared = shared;
 	get_device(rcdev->dev);
@@ -901,6 +945,7 @@ static void __reset_control_release(struct kref *kref)
 	}
 
 	mutex_destroy(&rstc->lock);
+	mutex_destroy(&rstc->shared_lock);
 }
 
 static void reset_control_put_internal(struct reset_control *rstc)
diff --git a/drivers/reset/reset-gpio.c b/drivers/reset/reset-gpio.c
index bf95296a512e..b4a198792107 100644
--- a/drivers/reset/reset-gpio.c
+++ b/drivers/reset/reset-gpio.c
@@ -67,6 +67,7 @@ static int reset_gpio_probe(struct auxiliary_device *adev,
 				     "Could not get reset gpios\n");
 
 	priv->rc.ops = &reset_gpio_ops;
+	priv->rc.can_sleep = true;
 	priv->rc.owner = THIS_MODULE;
 	priv->rc.dev = dev;
 
diff --git a/include/linux/reset-controller.h b/include/linux/reset-controller.h
index 52a5a4e81f18..7318c07b80e1 100644
--- a/include/linux/reset-controller.h
+++ b/include/linux/reset-controller.h
@@ -47,6 +47,8 @@ struct of_phandle_args;
  *                id as given to the reset control ops, defaults to
  *                :c:func:`fwnode_reset_simple_xlate`
  * @nr_resets: number of reset controls in this reset controller device
+ * @can_sleep: set by the provider if its reset ops may sleep; makes the core
+ *             serialize the shared reset and deassert paths under a mutex
  * @lock: protects the reset control list from concurrent access
  */
 struct reset_controller_dev {
@@ -64,6 +66,7 @@ struct reset_controller_dev {
 	int (*fwnode_xlate)(struct reset_controller_dev *rcdev,
 			    const struct fwnode_reference_args *reset_spec);
 	unsigned int nr_resets;
+	bool can_sleep;
 	struct mutex lock;
 };
 
-- 
2.34.1

