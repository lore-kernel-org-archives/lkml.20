Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.92
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793356459;
	b=oQ+OxODRfOZx985eCwGWkW6T55YS1sF3XVqiegA9CBrlt1tIbQPYBs/erJAnoilis+nj
	 64L0pMUrNPmafz63EQuV57b+zA7bkox6wVbFkiHgeHzP3WnvCX6/5ir1ofWXTilNQj76x
	 2awP+9tXQaMx612MhlLR7cvPS2AMN8c+ypiIDUFqEQG8hMPQ6aViKBOSF98h0C6oQPHiU
	 MxaH5RPWuxdkbo2q7AzzIjA3HZUumTAzWUVk1jPf4LkTB5HSiDY36BQLUHgXOeva+PLBG
	 LKBqjEX7N528nf5fC4IdlYtozo0sta45NdO8ATGBp1gjAKqjSRh7qdeokpmMMoWJtRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356459;
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
	b=0p6t+R9Y5Pz43gWSnSPQ3RaDMehsTu6tjHHMJ+4W/yNPLlZW3tuUYnraG8zOtwtM0jqA
	 SI3ffFMP8K4pVsxDAbQ4BZ1Lq8Gn5xyG2Da4A5vaoAdJFdbLf2RXyNdHOtYnOKY2/LeMW
	 EGJyS1LB4ho21dIBLZVJJoVz6xnGy+rjxzAWzi0gqpDak1XAXvVq+LwK2p7ikqqgTY57X
	 wNxJvYds6z1vv+gLrowVU23tKNTbYk0G3hCZ23aXvyMh55jiwSJI/ZRKXHVpBYU4SrB3S
	 wW8GokXT3mXAQXc4Rm65hIZ4cu2nI3YfEOP8mWCIymuTAN9LpBm+eY2AHkFcxsGel8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=Wfc4DIff;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.92
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021092.outbound.protection.outlook.com [40.107.51.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA87606A330;
	Fri, 30 Oct 2026 10:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBA87606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=Wfc4DIff
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvcoV3whdc4LY7iSWQMoiQEwOJUYODjYVRF7ZYXzA9uq50Bp533s5jU695LJ/tsKYUs9nmsKUnuxGbnO7SVl9MPDfksAk50kahrjeb3UiyuVoy3fA3n86STe9+JQKAR+1/JcoCQug4T6thWgdgI7iBNgfHMpxHWKgp5lnvKS/iTQRXFDwt+faVlOyYQk6gJPU3zLMqrLEVqUF5co23IZjDqgctcX28LaIYi1flpQK/jmR3WG/CEgxXX+rh4SuVnbvkAAvVtu8oi6co0IHaGSuTM8AsXlohlG26uW027pU0SoxhazAg4IHYb1voC1Igwx2WDzI1nVAbR1Jaqibl7C5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6/Jb/DVlIH9CiT1NowkKM+A0AnVCIZdl87Bc8ox+AU=;
 b=Nr3yyQQ6hn3+GCY/rrelQdOvHL9XMKICc4bBxNX/ffhi0gz2pLAXbgqkwIi+GSRiqPqCZvu2igyvD99Bea6upGsrT3V8nlHWJVwF+YZ2vJVapZRkcps5RnzXSC9m0/fV1/mDLA+5rUkOf3raCq3AcjC+Kx60Hs7bNMVXtTCAO6ZnbJ1hGyLtUnyU9uG1/BsPs6wLab4piA8Vwil2jt6UiCZ4Cwfdv6mpVdNwOdXBUOwwwa23/c5zZ5Ha4Wqi+q19nD+rWd6Llq/XfttL5fX213bUpDVIGj7o0WggXl3ByWzukI+c2PX90S/gDMZ/oviPN3vQL4vyflBGitKRb1NQAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6/Jb/DVlIH9CiT1NowkKM+A0AnVCIZdl87Bc8ox+AU=;
 b=Wfc4DIff1Kba7jOSOO6Fof9A9BBfibXJ8dmSZPEDZSQwbI8fA0YSOkYpnKHOzbNpbNz2a1C3I4H6aL/4t6KbImvw4G0ZXm5gvsfwANvYCjRgdwCLdGq3sFJLTGhG61ROEufvUc0MbhnZG4DzLE4rx+vMBfmJb2KkA58w+r/mkHd5RR/+f0mTtGnQxe713sjNIoQC3lT+UZ9IP/xQNsZqxAuo1WMnFSmVVzlzbRD7YErxzoQ7TeyIhIrIn+bClxj6Tj4+CvOJ8AFjz5lvLGoB0AXxD76/8XJMjOY3wRKtH/HzF9EnH9oqYnlPXhuP8kPcId4LJuI4gzGM7TmJ7kLzhw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNXP287MB4299.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2c1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:34:17 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:34:17 +0000
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
Subject: [PATCH v4 03/15] media: i2c: os05b10: Update active format before adjusting framing controls
Date: Fri, 30 Oct 2026 16:03:35 +0530
Message-Id: <20261030103348.1222201-4-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PNXP287MB4299:EE_
X-MS-Office365-Filtering-Correlation-Id: 293b0860-8578-4312-f844-08df367159bf
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|23010399003|376014|10067099003|18002099003|22082099003|38350700014|56012099006|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
 9n/upcfhKguDeKa38ukQoW1d2UwKX1sC1ogNvl0rYD9dAk7eLyVw/XbeyXLnbICx8frwuWzsLDTfMXo7eDY7nkAull50Fg+3C/33arpVesXfUtXww77pg/AN4ODsNxvSNKQsAiiIniGsr4QWnhlHBvg/0O3kDG73FOOODtCTgiMSMesX68QNGea5uR5altSqw5NywN++KR6iPo77fEFpGezR366rD/ZZXU2AMEBJMwdDfVtYEHk6evZGxCma2BRNgQly4tsoa5aMzKN3o3j5V+o+BQ/4lHmsQT1MAm/Z9qemT4D4Bb6I1RuExtEnSR2FMufAjUlt77Ku7bvWgR7PoMZ7mdSHHxLYfhTC1tvyTtVdXKiaslOZ1mFb8CF2wUy8C55shTDEf68fmDAY3CXA39SsNTJGTBjpqgLbeBFS5c2UnSWvRcu3DqePAHNZkDPzKkGAVn+c1YJLVUa+iaQ33bwk1zJxtNuoizHiXpjL/oQl0WTYseB2Ik+zO1NXVXLKd1NAZtLSJpyI0HnaH6Rn2f4PG1kA56WNIZJoibER1qDK4hqawXdFnLZlr6hCdEoQmLYEAYXMcEs5Qp6pg5h0nwsriPbaOk4/GIcXwI0blt5NPtNqnnDVprJeIKgqoRuy1H6RdWvnrUAwdwNV1fbBG3jdpMGzMYOYvjeih1Bu4PNILUvllcnUnrRUMocud7rYOhiC3Hw00UHZCEewha20xHOGmcNGvBH1OEr5bvPF55U=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(23010399003)(376014)(10067099003)(18002099003)(22082099003)(38350700014)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?dSJqm7UzTg5Z/CPo70fENoEIyR5vEqqnKBeAA+Zy6V7YXYkLXrEzHVXaW74N?=
 =?us-ascii?Q?gmJBGcH34I9GFdTUGbB4c7iwBOUOCFK/k+KYh2IDv8nUmXFBzi5oDomzvEob?=
 =?us-ascii?Q?pEcTDwcrPGDormYB0yp9bw1el7jDG6UZ06ptssjJQHs3xzWtZuOGmc0vJ3Wu?=
 =?us-ascii?Q?JjsNLxRG3dsXlwqL4zKzlKa2VHgTQBBFXAuQFObXf8wRGuln0TWuPCZTzbpd?=
 =?us-ascii?Q?6hbiVASt70rdJfIcb/MpNScMdRSNS54xRL5u1fu66UPyW5kTM7fXOwoZaHfv?=
 =?us-ascii?Q?l/FLjK9p+1i8llnOZ8y1uCPKPUE5BdwK2JTVKyXY3u7OvO2opyoPIVTEPUu2?=
 =?us-ascii?Q?2KrHjrriOjoN5W8B/71eb17owpx9ThL2uy4jTy6fgjuZ7mAKJsARhoHFBldt?=
 =?us-ascii?Q?pwUsTb/h1yw5XaSB31boPU9HQC3TM0Lcd8PxR8/BAYPquj4/dZCl8WpdEkBG?=
 =?us-ascii?Q?MLqXhzxSvTCIBpTTBsVdcuo0pAPwEAR0LW/LZpcaWZtXeHLXu8SGBqZ+cuMZ?=
 =?us-ascii?Q?FH2x+wSR3fkdAWQYE6Qvs6967pX9MxbkqCLxZlirgZ3a2GjbXx2Im43NFJQA?=
 =?us-ascii?Q?o3So1HE4MIqbe7Pyba9lGW2vTw/GR+7nlq1JLR5VY9v5K2mlSy4aQCzxOdJO?=
 =?us-ascii?Q?2oY4nGBMEJhQESJrKZqu1vBoXqUxJ44ilU2iKKnLC+8yHCfaEZ1Q7FlchVPQ?=
 =?us-ascii?Q?NZ7rtZylrmDADLnlTXnP+ZCp7Nd+xJ0vVUxczDLx07Qm/tkwVnVrCMMvSdbL?=
 =?us-ascii?Q?kMRxvbKTmUXGZBVgaO7C10QAE5uKineuPtfn8Ft7nQFndAxVYCnZxoXUdHYT?=
 =?us-ascii?Q?bFEiSuWrPcu1ENb46OsiU5yLeRZwN1qN9hKd87yxP1cM55e2BmPknSeCC5m1?=
 =?us-ascii?Q?z7UxstCgDGwdg5dufSALlO2XZ6Vz9u5asOdKhLCac7IyvC0PVRSrLbgSk1sp?=
 =?us-ascii?Q?ADJ0/dY+yKLBzQg+sWyDeb7P6PwUj+srR4hlDyGFO+FYS4wkTm5LEZTfTVkn?=
 =?us-ascii?Q?IPfyOlruYiN2tIvuFLaH56llAyqEIUjiyo9G7yBiU9ygX8fUq2CH8q3iRKYe?=
 =?us-ascii?Q?eUCoKoE1TeTmSmDTjERYZmIYkga20y/yHufIwmYb4agoVDhmkPbl8Vbo40OU?=
 =?us-ascii?Q?TEUYMYzNT1G6k26+Cqe/HAhvlFKHnt0q1fMoSBA6DcE6dlptL6TD3mPVMMS1?=
 =?us-ascii?Q?2U7nErUN7uGg0KJW+N3WEC5yhDXPgWNRcddEmcWOyeFltFnv3bx5f+UgH24e?=
 =?us-ascii?Q?WxWvbRmCx0ghhhRMMOQQYG314nsJFPkEro+83D/qoV4wW3Je+Ks/91KX2sGP?=
 =?us-ascii?Q?I09fvYB7GtlYIth8gJmEbfn7VytMI7q1dV8hF7W+F6nzke6G4EyxZ5Q8rLfN?=
 =?us-ascii?Q?IospV8HOvmKi4LvbhyEVRHEYPnghUCf6xjT6mrsWmoWsu6RVSzgzaAJoAOu2?=
 =?us-ascii?Q?mTSLEmNYMwxHfpLIWFteN1U6VgcxiC8k0C8JKM4JqE+Y3Q/ObTwnV+yaGsql?=
 =?us-ascii?Q?0d8zFqU5FWY0cyDoYiNUL3VVBdc48ogsdmzcIQ6118GPvNiCmELibltKTJv5?=
 =?us-ascii?Q?YG006qdfKoR7hAyzXtmWvkZa5uHCq6PqZRKvebnbmgsM6JM5l72n9lNFtoMq?=
 =?us-ascii?Q?p0UHhEXRgVrkuUAMmsVgcXwAjY2qEZgJR5HMmVYlELapH7yqK+j8esOwVWbQ?=
 =?us-ascii?Q?+5EYuVKAIvNjjd7mem/S9fLoic2o7qcQVGeqWaqf/viye7SMF3HDULyhq34r?=
 =?us-ascii?Q?lYMgxQI5+WjbD5qfuv1f6X/HKkPbRaU=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 293b0860-8578-4312-f844-08df367159bf
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:34:17.5666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Miux2TmJwASrUKRHGc4HrYF28+YpUmvrlmyxW2ADMsR4WXXPP2OERmTvP2C1BbRrh5R3x4dAsYM1GVx5NVDWJkXmEWCODdo9W4YkMPpiSoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4299

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

