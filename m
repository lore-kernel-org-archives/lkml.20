Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020084.outbound.protection.outlook.com [52.101.225.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25B1314D05;
	Tue, 13 Oct 2026 08:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880404; cv=fail; b=ADSi9C3e7DNRxHdTvVAA48L8kpNpWlozp2rBU16mGuqh15i/z+67kiDZ8gn/0FK53j/ZIvCCamG34Cp5rymxCFZDEcG/Xkor3/klC3OaKvttuda+NTGAt+gqSGia865VRFHPle+8W29qjE1vXTmbNyikXJj3hv/N4zPRY+zVXDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880404; c=relaxed/simple;
	bh=hxVPo62KnGDdoNwOe+ss1/wTqLVhl8aHN9p2Ta9i9Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PIqVVtP7TAkQuoPXMK4Zu48vCUKbBXXkYCkKm/JsfxJu8ojEGnarfsHETzEmx+vwMHkB4BEGCtafWxzQ6gNltUeg53tbkS1QWjbBM8/bh0+sIIktYbLo/uVkfEqtjBfzii2SxPvsoW9Cwi+/3Jkbt770JRekZSaYzPu41Xa7WAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJQ0TOksGZ7zwlLRKPgcaOSftrbsrBskCUFwfZf1ZiQNO3gVrpGEt9WsGRfSkjyKU1fUOjhoL914Rn96mFR4HGlQfrpQBrSxX1dmBIddeHKDVYmLFdKMyYFBlVmIdFf4Q82oZd+AEuQ1GewmsXiEYRqtZftQM6ug+sCdvUUaNg7VPWHoHP3phih0ohihzvYpdJVFQQ78WjIKrHpVDVv54aQ+wWwaOIMSVt/GMjHCG1/JHlvQTuv06Hu3+7D+Nf8P2t5EDlAWaKfCQWullqRHYjxVvjevw2HXGqDizUifqQ9huUIt4xxvDNcfwESzwHWH/FAV/BejvmpeHJnDW9KQog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVog2p/NTUQRqONntNA8Cr9GzkanJZ6t+bPomJMErz8=;
 b=rhM+0JyRLuZ+nPcNMwooheHgchuelPJi+9Fsk104zRjs1l6lm6LvPw6DzB2EeYonhiOLSe4xjUFjq9gRjbV5shd0VBJfshQw1ZKInsdfZ2/UI3CBcPFCA15psRtms+tk5Xyyl+txVGfZJRu9CXcPi3LaxgQIKbQm3nWpMYpbsCp9KnNWuzA5pBF0n+E+gozxaFhquIjT3kbriSqH1ZSkspU1hFBAsofUMxnH2d0jiAdLDiX8hk2zgJ2WyLCglEI46RYW5Bi8NggjMRc4ngazg6vhdBqbtyxRnSNbEKDASB6TUE//POgolueP+ewZOd2lM8RSV3wbWprz+zNlr1uVEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB4631.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:18d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 08:33:18 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 08:33:18 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
	bryan.odonoghue@linaro.org,
	bod@kernel.org,
	mchehab@kernel.org,
	vladimir.zapolskiy@linaro.org,
	loic.poulain@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	atanas.filipov@oss.qualcomm.com,
	jigarkumar.zala@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v5 1/4] media: qcom: camss: csid: Match the current set_fmt pad op signature
Date: Tue, 13 Oct 2026 14:03:03 +0530
Message-ID: <20261013083306.1132036-2-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083306.1132036-1-hitesh@ebytelogic.com>
References: <20261013083306.1132036-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYPR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25b::10) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MAUP287MB4631:EE_
X-MS-Office365-Filtering-Correlation-Id: e29a17f6-c3ba-4a82-a06a-08df2904a1e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|52116014|10070799003|56012099006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	q4mBv06H4HJGlPTPp8XQ5fksHSyu9XX2lu9WxCdDqrxAybS6cuj7DbxnQWzdyoJF6hGhV+aq9ZN4q67GrSHlAhpEA/LtL5GV/WPQPIjS2xo4OlkDqoemAiYf9Q97PkfhzRSlqXOV8x1QS6omlY7x2Ti7wBw4lJ3AwNhXacwhBj5rDxjc53H+525k/x/wPJLodjuuV0Ff+JVzA5Fnzpg9ivRXVtBhLJp+1Rgensmg1FsvmC2cX9aIlbzhg6t/PUvpipX9vPf5uAF9UIgsbLS76zMlym9hZYHWDxrjUI74ZIyK5FyBd8P4i52loKKoaiwMMOcuySZ1+0/7jf+CRtla1r84ha7CkiGf+ePXYdSrVubPlGkJETrjRgiV6hAOr4jQIVmFjWk5DBCkznCsLw/7/WXoXi/FErMmIYKdrpR8GQGsA3Raffrk+ehiMAYJ64GKc0v35pWx76FiUAWJOhivAfqTr8u38Nej8a8BXizCmuT5BFkNcI5D0c0qPl2IASpIhFFROuZGBwcI2UIRLTfK9UaQ6byxeMQUm3FYv3VC1ISxIOWpDOp+j+hp2mTAhyA/NvnjL01NWpzaHA8VcXn+E5H7tD3ZmBKAe41KQIr5vUCUG0TxCt10MoRYjWULtGu0N7yK3GWEi/ln/mIagAWvhvTpdyxeFC3X5XIFJL4bRH4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(52116014)(10070799003)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ys8PrJAMhYj1W1m5xNEpu+b2XHDuvo6KSdUxnxQbjvb6boI8TFhNhyvPqBNC?=
 =?us-ascii?Q?RSoAD2ROvep/38U+LS8w9LPcKCwwbUH9pe1LltgHd9NISDUTeB6qKbm57gpi?=
 =?us-ascii?Q?VroZqluqtq1mooL++V7x2iCpR4QKiD+E0lJC9AmJqibTE1LxxwOcyxBF3slq?=
 =?us-ascii?Q?rLWV1bn8CTWTORuxAk11VV5QH6z8MTuUXUZsag/l3fG8vZqFNCcR5ze3mOy4?=
 =?us-ascii?Q?sD/MhG+rSGdiTJwz4iuQUnpZleNgX7Hhx6CclBHT1SVkO1wmAVr7tSAHcGh9?=
 =?us-ascii?Q?bDJmOS4CPKvFNi4QKOwumDvnfH0rXVfJQKf4AktwDPoRQmNJdYkejJq1ejzE?=
 =?us-ascii?Q?yBGwZOoX6FB1Oq6egbKjFZK403WolesQx0hN5gr9z2o+Iar8A/mjoPhSMYOd?=
 =?us-ascii?Q?nqRHh39JZO4hCAZU+ODK4ZnIX97j9audc10pjQPigKf1oXTqpXCHAKIa3h92?=
 =?us-ascii?Q?VbLGBRXlzkQiQO5amVRKNa5BHhyw+u6rb0yhl+SXw7GhJL2S049LkNbGrSjL?=
 =?us-ascii?Q?g1gErHsPQRP56Z4OFNuSfZez0ACrIWkuxSX1AELR/1bpqm9k6p0O3zS6A25/?=
 =?us-ascii?Q?Q3mTdL3Wrsk90VtS94renqe8bV4jDDQP0NUEwKHHie7xzS86UQw7gm+bkc9v?=
 =?us-ascii?Q?Gk7jPKnm7qqPfDmLtsJ0JoR9/vvy7GHITh7lulS8NEu2RoiV9zZkQqAffv1w?=
 =?us-ascii?Q?SacgE8ojpPjS91rspuRy73VgvKiCINuej2JA9ba9kGE35LgwlhkKgf1qUNpS?=
 =?us-ascii?Q?Z9KnuVVe0B9t+xi0ARAF8rqt0U6icvVC2VA/VAhdDeQnu0zbj5zXS1sFuHh2?=
 =?us-ascii?Q?E1MnkDo5U0+2CfLlSVaBTIcuFAC6HZMI/lw6LbqB7iTgV2DZj+ySaxzWoZoA?=
 =?us-ascii?Q?3lYMSXXOrfAqlhNAkg020EQFiaisn7qsZY9x2lKGA6l9tgLPbyGhdNGvmwV9?=
 =?us-ascii?Q?Ld/sKzu+tZfGDX+y75c2vWPNZ9GB6eso0W8QrxCD5OHrwmugx3qasVs2EMfB?=
 =?us-ascii?Q?ajO0+ON9s8isAOXDK1YGp2ahbBSUJWf8R6Ac/ORkmhHUAO/a+0bq8madBda3?=
 =?us-ascii?Q?vfFPyJZwEjtt+XigwjQTnNaUL0HPLJaRNnfYei1RVYPZxB0/L0bCWZfdBnsK?=
 =?us-ascii?Q?oTvgdTWgJKn7UmHyZgd7AxfY5bn30sEbjUbpjXYTXbVwkspsFsRpy7qDOObJ?=
 =?us-ascii?Q?HiEFP2W9ZmwrYAZOeyNeg82c1rDCn5CnuRaKMyl8oV4nCz12n+Y1kx+SAOhk?=
 =?us-ascii?Q?7Jj3cLUtXaTuSZGYPa+FYU+4mMrbdaMhQVRbJoK0fi72iJU2JP8kxqUYnz+2?=
 =?us-ascii?Q?+i/SSrKZerrofJCGMQPQ2x2CbArezazM36TgZwaFuz86CxZC/RLaXmonKPEp?=
 =?us-ascii?Q?u2W2ov6DEj7RwYZ+LJ1IhHJThriDQaOEwLxhmtN1Hhq6TPmMGURxyPo/vkSj?=
 =?us-ascii?Q?+Cq8QoCjPZsYbWR1uiV/ZTFfpYcFnp9Q/PA8ljpPFWSyOAu9H3gOiPZRQvFE?=
 =?us-ascii?Q?XXadb2DHig/5qY+hTjQU7DmNzCn4A6XOKbIkJKcCwY2a9IT/pMVAbHTcGos6?=
 =?us-ascii?Q?8j/gZVESwkYdogzUJk8Oyg3gHSPgAkw2deSlRgFFPomBAelZHkm5vAZ9QG0S?=
 =?us-ascii?Q?XOuGHfp5welqdfkhhuTi6NPteKnCn1hDLWMlaQrcC4eef03k915+bD2iwYNB?=
 =?us-ascii?Q?o4im2zBlaBxa+KTVToNNkTQPbGysXTAf3EFPGljkyEa5rIdgOCGBDhat2nE6?=
 =?us-ascii?Q?ARGq/N/rK309p8LDJu/NlUD8f6N6b3MoSL/nU8BdLnQxQkUW0TEzR4v8lwQQ?=
X-MS-Exchange-AntiSpam-MessageData-1: W6XuDSbBG49NbQ==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e29a17f6-c3ba-4a82-a06a-08df2904a1e7
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 08:33:18.4374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5sXhewRVaVNZaQYd669hpax0iluw33hNuArISSUPFLqLM2JAvUp8Itm+VFG/jLnyB+K1TVkYz5G+/UDr9vGng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4631

v4l2_subdev_pad_ops::set_fmt gained a
const struct v4l2_subdev_client_info * parameter, so
csid_streams_set_format() no longer matches the op it is assigned to
and the driver fails to build with -Werror=incompatible-pointer-types.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 2559ebe98..991275398 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1696,6 +1696,7 @@ static int csid_streams_get_format(struct v4l2_subdev *sd,
  * Return -EINVAL or zero on success
  */
 static int csid_streams_set_format(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *fmt)
 {
-- 
2.43.0

