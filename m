Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020092.outbound.protection.outlook.com [52.101.227.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D99B47A0DD;
	Mon, 12 Oct 2026 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806762; cv=fail; b=SrpSLEFQ7/mssIPiI2HQtHIxQsB39qwjJ29u0FSScq6xcOPafSr310fviLfWFBwVnK0K3GIG9f8AtQtQg335ED0juOmInrlvCJN/rQXZttRTWtEud4KLUzeNnuSjx215LtaBZT4caizdG6+npy19T2gIvvvx79apbrfmJ9jgbjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806762; c=relaxed/simple;
	bh=hxVPo62KnGDdoNwOe+ss1/wTqLVhl8aHN9p2Ta9i9Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZtswJAU4VU6n/pnJUHOlKIytXjlAuxplai5uMKKL97mTCDzAly8s26bB0zc5zFHb6W0XzBn/0p4nny+V3hpeI+NVS3ccmGU6hQiWAZEsVeGRTm4/g05PHQx8S9CeLaq5VYvLDI3OAQIWyvj1SalpNog6CvEpa2ff+eckQZVhvLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.227.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaf5mckJXNcAvfUV0XZxKyr8V7SaetAzV3YChUOdqtGVug3U5zuFqzUbgfFBb/oXD7b+QIXwP0BP+DpIhyO6eLSEkQ8uTtbjmt6kzNiL1WnwEw4ePINrFmCGYZyUNy+EzAu+Epq7U5Km37XSF/pMhLrUw2r6RMSeRQOJMbxZKQLsGjiEBfTDqjWtMrc7FipQGXIFc70KZLjwWkTzVr0NoI2L16TphfWZD8Oy/QhzV6ZRBgg+dDZC9D20tH26DRDC2mynHKvVJPTzcF+0lEE48dV/1ITprIoMMuUX3qP9/9Y36o6vuH2x3MCtfyhQoJkFXpgregkXZF3yBVFysCV1ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVog2p/NTUQRqONntNA8Cr9GzkanJZ6t+bPomJMErz8=;
 b=G8BQOp7AgWd7w6PrdnyEWH5QMHjTwuz4+GK/I7ARfbX/UrG6HzU2FiJLlNTm/6GjyxMgMfQABSdEy28SwAqxjJwLtg5XyrV5+pGtQ1c0JElGBusrWmV6QLl0VzOU/GQf2GHyMj3wLuB1B/72I//h/1vaIViLKYpBYRiYtBGgofdn9GOEXMknTBnE8dXBe+eB2l7ZzcQKUivRJB0G1PGIPiUJUNB8iD7KrsRIWzVJYmsbQcgvumR6UweHS2e3X6PGAObbMBLidr59umm7Rs9C5leaiyqjInIcTCXAR0ITKrEPFbdPIEQchFCzvMPXexUGoA8BmLRIL5s4+0V6SP3VGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::104)
 by PN2P287MB1987.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 12:05:53 +0000
Received: from PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM
 ([fe80::3a7f:fb1:6998:b89e]) by PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM
 ([fe80::3a7f:fb1:6998:b89e%3]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 12:05:53 +0000
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
Subject: [PATCH v4 1/4] media: qcom: camss: csid: Match the current set_fmt pad op signature
Date: Mon, 12 Oct 2026 17:35:39 +0530
Message-ID: <20261012120542.1140157-2-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012120542.1140157-1-hitesh@ebytelogic.com>
References: <20261012120542.1140157-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0057.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23e::26) To PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::104)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN2PPF076CDA63A:EE_|PN2P287MB1987:EE_
X-MS-Office365-Filtering-Correlation-Id: f77273f3-8b1a-41c9-1774-08df285929e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|23010399003|1800799024|10070799003|56012099006|18002099003|22082099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	cPNA2sEWb1PQlBF2YL3aW99HV5Yvk3HogEmC8Gp/3UP2ShwTFSoBB+ujTsGzBNfVdKUwvjJPGaRx9VWxoVKqBrqGvglc8ovwuqERhp+wubTwSbWuvj9keLRSKtaODiYkF2xDNxgjRTFsWzz5qpNBwT1viJI0Q8x79upH0ZcQcacqTlxM8XliVuxjWZqEiZxWolgc0gYQfosEA60FiFopo4se2iuEcFPdAJEG0GlnIfOZLn88Wnjx+rqb66MMYIw2Hf3CvgCnAbx6xyoWet+HIscZ/yv5yaYJz8SajkFPLmtXQjrj8MUNVPTFqXS7SEinFOwGySdWZdZ+ukhtLv6fMb+c3MuVX8KIAfqOq0Ul3wM1pRU9cQoUowweWzQkkDDJtG9li9QysdG65oPxbDtYvmFYk8cOxO5DmcaIxUIpV8SDpWBVdF8kOx+58Bij4i6bgTnAsIM4ECyf/aHBm6J9Kbv5oLBqrhiFRMfEydOMzxZ5wmTepkP/oBrwOX5n4nG4bNE85lKEy2QXmH2ZzKQMfzU4cdRCfhezugCit4UtLVRd3iRXfCNVchviQWJjNDyer1jtGFa+GIoCDQrprojzSuOWtf7DqWKWrLWDgAq6c68k1nSfNzQNih3VZWoY/zzl9tmau5cQ0rX/b4DcfwhscvzKpkSeDS6fp3liHJszvmw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(23010399003)(1800799024)(10070799003)(56012099006)(18002099003)(22082099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TZwEwRMf3Az7Z7Twz9mAQogGXXgd4++N3rESqG++AXs0FBlyOkfRl8GE0yR7?=
 =?us-ascii?Q?AuNSNDbC03UCWONwlrDcdsKKe+5TObAPTSMwow5vXZBbAx2XysAamaxV96vW?=
 =?us-ascii?Q?+gSIkYtJBG6u3v4Wk4l8DW7f/HVG0i5dsBS7pbAbXT+yOvhG7Pu+IvOC9i/y?=
 =?us-ascii?Q?C8PtXLjiBeDspsA5WXCs1jXHZMPOUesmacHmEKYyA8nhwuHJ3uRq70iYBP3N?=
 =?us-ascii?Q?X4V39VSW3KJ1hlIeFHQb7BVFqox4E3Io6X+814lepjCKRnK9lZKdQWrD+xUJ?=
 =?us-ascii?Q?+KoxQjZf4t61VHPs7wE32RTe+iNNYzCSYk/ibK6jCP1lW86qjUCzrsmPRMb+?=
 =?us-ascii?Q?dGe0p3EjfEmT9hayYmlKUqEnvcc4DSBfVKrspMOnOuPTIOm1PQKJ9yTCtnNa?=
 =?us-ascii?Q?ObDUmR9Om9+Ru6sHp4QdaM9b8Eq0mXO84HSEx212a8K5Vc76pcoQTXVI4Dzv?=
 =?us-ascii?Q?qPVcJbnp+oHxtxjzio1rgHeFsG0e4dKsCpNExvAoHBDN3RC2rP1ds5GWv04R?=
 =?us-ascii?Q?oJMXZur9IxhZpsFf4MGpcTaR4/fQ4B5nomh4haS8pcK80xrbwMf6Buodr8oD?=
 =?us-ascii?Q?O6KFsJnYsOrFePMvrTKZ/VvIQ1cC2//4BE3w/mRh1qaJKvrE6VfKtflp5eKg?=
 =?us-ascii?Q?BLO57l1sdTWjoez/YVGYLVXCYQPrprXtzlq85U548jFgENvjso3nkSbwOu2I?=
 =?us-ascii?Q?9Bb/yywjMS8hFSNPPPUdmuASXNUO+9p7uxGulvzNNlrqG/i3urBsCT7oUPVx?=
 =?us-ascii?Q?JaxaNUbmmPAUROvOPk5tc8nma9Beso8q2n+9IKVIv6V0Z9jafvjO1l4UecnC?=
 =?us-ascii?Q?6HOxxud/WE9++fnpQZ20CYe0eamHHO0Vmy/MJu5D1+pL2d0IDrc0MkhpxeY4?=
 =?us-ascii?Q?sOoJvnnd24pZrMWad0PcgOv1+gmpmw4Rf1086l8bglwR6bBdPZUmPYLZ+Do+?=
 =?us-ascii?Q?vUeTeDHm+BPj4FZlrSQKssjUUU7VzeDQB4ylxiSgdc7rpBUcXDDWf6ytEZL9?=
 =?us-ascii?Q?rIavUNKb2sJnkSmlPH0vCXfurqin6SQuwAebFdx74N4AJ0P54fjrxuqnKfFl?=
 =?us-ascii?Q?irrg0YZOiLeW9hcDsDWB+Q3WzKfhoYno1otVjemi2WIkXLXG6nDoojbdKb3L?=
 =?us-ascii?Q?0CWWNAKK78n6nTo+cVR/Pu0hgqw3PWy84ZQsMEFYkJsgnWyJBE1EWaTGJdSh?=
 =?us-ascii?Q?UHVaRqdhh4dVzr6z+UFpIn5t0RpBtID5rtXh8ZhR15B218QGHD8w6Dl+t0vL?=
 =?us-ascii?Q?VkjhraueRhK+YW59qyhuDzE0T5+5bX1vFLA4+2S36VKQQmgvKfc7BYyDz3pj?=
 =?us-ascii?Q?7yyH6HKGhfdBSBzjn/LbNZ0aK7fyzqJr9+1OfuAYjYiR5iAtQLI0jtbviuE4?=
 =?us-ascii?Q?CLHFjTf4Tqwl2hNh8Fl8FPFjaaT8ZNTDcRlwtbIrzxKXtbX0jmNNAXRsMCzP?=
 =?us-ascii?Q?U6ZRBoRXRR6w/eRHMDPG8KDG0C5pNXl6dz/K9qsx99apKlRwG9NRDSZH+X9o?=
 =?us-ascii?Q?6tujjzsvq0QXivoVSZsxsVgU9hZb7QicYACRBiBLlpvMKqwfEbm+qVAQf597?=
 =?us-ascii?Q?xsxfb8cg1jFyr0yf9jq/Cy0Y4ZOnRdS556M7NMG3y6L/aHPg08smShIle2Et?=
 =?us-ascii?Q?nY/91vx7lLsRPfzdCB5X75+/grbkk17pABmvYQMc1BnIOkD4/FM89Y+rllQI?=
 =?us-ascii?Q?FJOdw1m55hzb0A3l1zpf6tZYXDFJo9hHYEgGLZs1xUCb52uui3qvaVipvzQB?=
 =?us-ascii?Q?m7fsjLhD0ghLW/YDDSpZrXLWh3BgT0dQycoC5/z7ewqbRn89J3wmQbLYKu2a?=
X-MS-Exchange-AntiSpam-MessageData-1: aDweOVUxFIhjsA==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f77273f3-8b1a-41c9-1774-08df285929e0
X-MS-Exchange-CrossTenant-AuthSource: PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 12:05:53.2794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whS4sFOHynE2JnsQqXFv4vOr/FGB+lxY6GNSL9YOFVF2Fgi/6Cye9sLTL/IRD8NOZJkq2dttC4R35zLVagtRXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1987

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

