Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793357329;
	b=dZ+fkH7L4c8xlHvlOBnjE7gYC1pcslX6YMrONlbiEXhKUwaaP1K0r08cRplbTy1aeUHW
	 E1fhRdgpPOcF9VemHTzEIo+zd5oBJjyQMsfvGG/c9tbLjPybQnshPX4EQMcjvvhCIiBNg
	 squ4pDIJftudpewYvrJyGoQrOymxnSPBd9urCsun6/IQu9vWeG5081ZSp3fodqPxPWzPC
	 rGe8oPMTymAEBN2rdt2NoCvasnwFyJ2NCe4WhOHRAIXsOE7DS0Gm9MWiY+U6dutpgkqIJ
	 jXsevbWD56JPoP1LFY2REgfkpnfHyJH78jazg3j+siExWxbwARM2EsQuYk4YTp74J/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357329;
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
	bh=M6/Jb/DVlIH9CiT1NowkKM+A0AnVCIZdl87Bc8ox+AU=;
	b=2lsa5yHxnnD3OUK6rQ0RX/DdYBkf32l3zPA9704a1rAfvKBNIf0WToy/gMkWtDnBLdUu
	 c7A6qtguC88uOd+grwMr2YReUhlWiWo4jCKxLxE/8PWD+GmZTcNUjyN74cD+52rmB9wtQ
	 3xWPsNomML9hb/sJB/5ne+3ISpwq7dqk7Tx/3b47JKN23PHsyIcEsueE5r3Gwm3egHkZs
	 FeTSswWrViHBaoiZkZUd76dFemWoLAOF7jPUASTtdW6qn6gjIDTMhKkpo0VA43mzqBJsW
	 urHi2wkf5jo4ToXSORz+XsgVxDiYSqrYOOypcCXJ3sCgaTQ0yLxyhjyoRtG+P5/BshA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=JzQr4MSg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.75
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020075.outbound.protection.outlook.com [52.101.225.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91B8606A320;
	Fri, 30 Oct 2026 10:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E91B8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=JzQr4MSg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Seae95u5F9o6zRBDN9ilSZpOFm9rGkw1KPeTtzO2pgEmxjjYfXx7+VWJ6P7rnYslKuTnVcZZooO9bMO86FAnsHYGUGQmV3r7FDacd9/lbu9OueBvtXfc2ykJHA4GAX8rylFLd4uM0d7Obk1PMrMdWHzW6nDEmh4MohpqRf0BUqzOcvkH2p5erpSbva0Mj4Nx7Dq+J67uKhvCiMuJUyj2/Yrfk71/bXKgo99XFlJyksWIpctJR5xa0I1Hz2YSwbrSPZhSDt1/nhZCxBwIGYp9I23iJPBxqSg3cyw9uajgGpjBi1FnOncSWQgMBfKLayJRduieCJ1HkMZEYGpUOV3lTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6/Jb/DVlIH9CiT1NowkKM+A0AnVCIZdl87Bc8ox+AU=;
 b=MVo8FviIxEM4Dz1/W5U2dRiCuIN5YPhsMvSehNCPZZiH08AfIU9hZGuHMlPMFheAKCgGnQVJqZAmBovMAXI7v/QZrARbZplM3ca1RVjGMoNdW04UxTMzapLMMAqQ/jCsS9ZsIv9IxfEM/Qyatu1nXWlTyuUxOEzbGlzslmjFPigYTBHihH9fJsyK5MXJZvFFgXFxO0eM8dRyclN5htL88MKI9lxyB2ALzsk6ir9ZI9baBguNJVNXBoGuRfkVQ7DD+DMxTC6oD9shn/5LBCwiq9P2gwhMIIJggljC6sfiQ75G4dHh4Gzl68OZCLQzf7oQnExFwN/nYfSYqmfCqb0Vkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6/Jb/DVlIH9CiT1NowkKM+A0AnVCIZdl87Bc8ox+AU=;
 b=JzQr4MSgpsxWvbiI2djL3gMiobCAedHvDxfy4mUoMgg6TBd2gP1XHhXn9acBqpw4ueZsMhIKbppRHRVmrnA+rtXFnZUCb8OgUhzyPjnrLOmvBBpqlPiHFmRZ6i6RGCa4fmi8xUhI3M+Q7HtJPTVDFk2+/Fo9dK/uBhZ/XurRPbH5zmOternTprda0dsFl1EK6GEWuOd41II0BOGgahHiSQLbm9yH/qvNy7JCRzmkZAP4IaeZhLxPZ3eE8JYAwmANmJRn2+I0aa5IuqrTWjbieiKxaJ24P2ZHPKxIhO7F8skVAg5KciGGsBL9MuV10b093nvexFwqQYhmKTeCZIGnTg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB4658.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2cc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:48:45 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:48:45 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 03/15] media: i2c: os05b10: Update active format before adjusting framing controls
Date: Fri, 30 Oct 2026 16:17:52 +0530
Message-Id: <20261030104806.1223991-4-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PNYP287MB4658:EE_
X-MS-Office365-Filtering-Correlation-Id: fce7f59b-ff94-43d3-7832-08df36735ed0
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|376014|52116014|1800799024|366016|38350700014|56012099006|261009223027099003|261021121427099003|261021123027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 f2nUmm/JESTv2ZJeLsBOQY7Wxs0auBsa+qTpXH2opvKNB7MD+RjPKov5EuSOTIBkuwzB5CY1NxbvoffW9uXbMlaKd+7AVzp/t3LslR4xKmb0+Iq6BHnn9nTl7rYQGC79Qrjjh73KU7PaPIynoKAH/RKbIKYIq0AiNL3KymDeCp1A8rDOy9wBUJtNfBgKqK6A/zCWbwInXa/3BltQOvzoIU4Qz/Ky9G2x3HAhoTuU5G6m9Vfvv7Z4qwyv88mvrnfobe0tVCA9//eaSOk+MO7U/Ck0lFaRQLxH4T6GXFj5FlZDcWuZvZsbdgMI47Pa84i/7E5teUk8RxnmK0ZCElhryBoaAjqJn4ww/2JunYZ9CA0p2S1JjjDCW9VwakfCbEGIXwQtIb+DxCNXeSSlQVh4W61qZwwgYFm/swOUFY8eoDhg93qghkJIFcuMGUq50ECqn5U8ryr+ums34ZN5SWZVZrstm150vQ82X51jAMnHFthwRVAo4P3XrUd1CDDF3Yl6DbDwuxIcdCTgsHCHCvl3UkuiPENBSria4hktEB+dbN/FMNtifaO37P2VWMBPOSWufuR2SgLrLjoPPjcqRIhyltYfUVqRki2lRYKDstOutjs1EQyeeyRMnfDh8VOkAx7e4hEoFVyWKj4WlgE3REnq3yZylumB1e5szCzBvzIDSwGCFRttuWC0g8heiLKrrpHazsEarJ5d8dsrQuVKchiGntbkagCZcmjINKtsa0nyZRA=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099006)(261009223027099003)(261021121427099003)(261021123027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?oc198tRF9Qh92D+p06R54OzMeJSxHr9aGFHOq+AWD/hTAAsWJiS3qw/E84c0?=
 =?us-ascii?Q?X8KbMzYkhemFh8vIu9pdwBYTfIHXQVkqQ4o2LULjcEVZ8qwmOEo0/09xMD+8?=
 =?us-ascii?Q?DFiDYttZiEzXzOlPxxJ91tvw1mIId3g+jzmDvKUWfeBaAl9R7g1q8AGGK1cC?=
 =?us-ascii?Q?gXFUIUYJpOMUgBKVmciH0nxLnOdIiaj2H4AYGr18+CbtKItJpUzK7BoI9nxN?=
 =?us-ascii?Q?Ifra+CcuVnFN5W349Q9hW5aXd4kJ+yhoOkj/TJS/8iBfQbz1Y0SPzLPAFaSc?=
 =?us-ascii?Q?YC+sKQ64eIig9LzOqX3W8rXb0Q99fpFKrGIs1VQaNbICoMksbrBSYX3JGn+n?=
 =?us-ascii?Q?tmoy601Lt5rhM1WTKXocSm6hnWrNyc/bodX6IIcoD/6t9WRurNUBlBn68Fwa?=
 =?us-ascii?Q?2dxZeBzLLeY4XnB5y6KFFP12cscgCx8cVJeJS7puhmO7WacOdtifUPqLzSBc?=
 =?us-ascii?Q?csr6KbStfG7lUtXuvlHO+aLyhz8poOaiLVAk05DVBJEA3czgmSvOX5fHac18?=
 =?us-ascii?Q?Gu8Ci6OKejg0RnDeqoobth5SgzFjtdWv0ZVyC42Jb2E7per9i8Vxym51r2xn?=
 =?us-ascii?Q?VlPG64mMqVcxveNfc3F5sM4rHLAaiVMt/unKnEwPYdEZ7jYIuO7cpIH2nkQQ?=
 =?us-ascii?Q?SX8gzq11CNl/f27C/+Ru0b+3bpKH5gg8S3d1cGrduO9vQ/4UIPQbif9kb5rW?=
 =?us-ascii?Q?fhUVDRJELbfI0ZYvKNwoa09bZHZTLmAbead8/Ay3RxJdA7TsFQ4chJDJ3w2h?=
 =?us-ascii?Q?FwtsJrlWIV3Wlnde36d8OUm+qxFNQjt6akUt/MR51THqDH4LQ2601X+wOXg7?=
 =?us-ascii?Q?yU0j5h10hg/OMSswPpu36HOQZQ/HexsNR+px2eruiOkVFR+Z3Wu+fX+UH7Uw?=
 =?us-ascii?Q?BO84zgJDAw9lojt3G8/bQ84/6ix7y6L027ekgJyqulBbM+JHkhX7wzDf5Jzi?=
 =?us-ascii?Q?X6rTV67+BNuonLAyodUvYGQq44+eHlXMrLCTwQtp0SsCVV78RspaI5H0/i3m?=
 =?us-ascii?Q?LBEBottdXKltRO/W4fgkJFJQjuX0K62t2VYjJpZjSZJ3mo47CC1i1NLYLaZY?=
 =?us-ascii?Q?7hQ769SWer67tnS/4uHB/h9IwmAoMTB+f3B30k68a44DGRLcTUQNLNeNefEN?=
 =?us-ascii?Q?iT6/U9t5bPE9TB6FK5jpE4TqrA0Jol7yzWPeA0Jh6z2JEV4HQ942BRKWC7YT?=
 =?us-ascii?Q?gXIDc+wMUBypETOVE/NVcjtJe7totCDQlz38vjAKLWORhGfn4RmX6InXb53F?=
 =?us-ascii?Q?8wJS6RF3nPXgnm3LgTUlb6GQg4jbx7bS7Z9EYKTIRcekJGd1He1jPm9iT94V?=
 =?us-ascii?Q?kA+fnn5LkPzSyMh9iVvtRE4y/KLrZsjq2tLuIW+NoQzDk6NoRQglm9+fA6SR?=
 =?us-ascii?Q?Ceh+23AzMNoT3IisEBkT27ua7pv0XdvJhC9hwRssh3Oa3HiWR9dwdmB7tRwO?=
 =?us-ascii?Q?9JSdhUfyxGgc9iQib8K0+ZIgj6C8W2gw3A7FAQElwgH0QTtwltHhnx/zVYAS?=
 =?us-ascii?Q?xD34532dAmJ16Q7NtzwPVx4QP8y1k/Mkq9YeNz67XkPIOagxgOp2dJDSAOP7?=
 =?us-ascii?Q?CF3ltA3hJXsAfobXaE3JcqvaVYi+6FRmLHdu93rbkKAf3fUNX+J9nUrbVrCi?=
 =?us-ascii?Q?kJJzG7CAcJKWoyQ05KxPoZH8Z3zyZs06/64R54r7yIKtm9OZdk6midAi8MuO?=
 =?us-ascii?Q?WnG+5SMT1OWoR2Jffp93k1eCgCnmYkDzQid9flUi1EY6ondOU/Sv+JjOha29?=
 =?us-ascii?Q?EzEKIElW0zs4mm0gzXPZ0urrZJkvd54=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: fce7f59b-ff94-43d3-7832-08df36735ed0
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:48:45.0660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6iKJb+IRKBnd0CoNEmJoYgw/IwzkW+dyVgOiAY6iHHI2NceIRTW4ct5IF7nb7dRatYgtKCC9O5E5Pm776Wi4FDrLorDMQcgCsT+71nfjCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB4658

os05b10_set_pad_format() calls os05b10_set_framing_limits() before updating
the ACTIVE format. As a result, the VBLANK control handler uses the old
height when recalculating exposure limits, causing -ERANGE when switching
to a larger resolution.

Update the ACTIVE format before adjusting framing controls so control
callbacks use the correct dimensions.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/os05b10.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 46246d297a44..70ad9124ad41 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -576,14 +576,14 @@ static int os05b10_set_pad_format(struct v4l2_subdev *sd,
 
 	format = v4l2_subdev_state_get_format(sd_state, 0);
 
+	*format = fmt->format;
+
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		ret = os05b10_set_framing_limits(os05b10, mode);
 		if (ret)
 			return ret;
 	}
 
-	*format = fmt->format;
-
 	return 0;
 }
 
-- 
2.34.1

