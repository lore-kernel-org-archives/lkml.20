Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011065.outbound.protection.outlook.com [52.101.52.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FCE378822
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571563; cv=fail; b=qKnl2XAC2Of0AIyHQjnh6XlK+aAO8u2XJFZj6KYiBTgeW8LH8RcLOAYSGtPfW277EfiTAzxI9DhmH0yId3r6KU15S2Jpj/+xHrHbUEoqr2nhp5jsxOHjfHgwOlf0QNaAET+NE2EaYCgZdtX6zb1VUsMCSmijigztq/BIp8P3rGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571563; c=relaxed/simple;
	bh=eXe90lg7Vd2okJwVPKZnc8Jl367jDXe5Az7hF4+byOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TqCYyDamRUyGb7b3cNH00pYzTCDwHi/a8rTgJthNIGNCfWLty3FPD+UMzwN9DZuuUcIBCFMO9+0XZySGFFffX9NwCSpM1i1/c0ncd2bq7ovpfdC5rY5GgLbOWGWz/FajQr1urLcKayMQy7ACPoF6PiEGVZe0l44THlkkw0Gk1dU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=j+45tm6g; arc=fail smtp.client-ip=52.101.52.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="j+45tm6g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H97tU2Jcl0UhW+DOk27kV66G3cXG6fpFevviwrhfpDcLYhVOblBKkE0O3KyXmbsHJCCewtRPt8WXAWToNNLQtJAK+2chneAsyy9p/BBiLhCkWO6ltTZuZI3HSYESInpa9qlLcN33IEmeUMpVjxS8jDAuf1MUR7GUAN2dJpz6dvz8t9CperxFN3E8btgPg23xpp7yUrdxOdgmyLfA8FWUMdprqeKtWwwbbZKcGamJ6De2WRbZE82X/WWWAWxlJUAWYOUUikryfuGCHY5eV4w4BOP4fZLzpoWJS9j41lHvUiTMT37PPqrgMLs2dAa5T3+bJiNVZdCQfhaFgaTWF2Zb4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7AVOYlRPmZxkfGDdGtAUnOcOoMM47wkEKebCJ1MgVo=;
 b=aEYbxGWW50BcSgRdlGq4KGNi4QLispUesBUaOsS0uNTbQ1uB/RgsYKN3IPraHwFmrOsMSZX2uIZVXs6VbcYW0AA8pTy4vSC/Ny/JepS8lJ0Jj6ttb9hD6JAclUaYemxy3rtsZ4okPzNjcitl32wOX1AKdkz/Da4tR4oFo80p4x9J5xnl7shfu3s+XYUNKwAdCg8YBfdgJqbgRN3YZTw6IxMIMPKV5xDnO6clgJxXk+aeAiHS2i5oQFzURB6Ea2cC1EIfl3/FPODtV8IPC7HBjnFGHndGYrxMzZiBsKDNVRpVeRAQxillRDZeKi/lD/lomx/3uquNKvDbgEz17vnq4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7AVOYlRPmZxkfGDdGtAUnOcOoMM47wkEKebCJ1MgVo=;
 b=j+45tm6geMiBLztbcecrYTjNBok1F7N2DebCWAiUk8o5RpQIM+UQNMfkiCY5JhzYaxVaPtrG8p3z37ojFIgmypo2GYF8mkAnC77LVbKC5ThKKT1ZFlfxcqraA5MNGveaRGAnb5xl4PV7B+TpbKVhNZ/TuzXsFXqXXI5q7kyudMDZIWy+24afXQ4xvuzjo0jWc3M0fKT0MmXR/3HEUrWmPJFLnXORk8z7UJcGTSCJMoV6hydlaETdp2kKy49ZzJn6Hhe3fdnNOh2fT6WnQmxsSRr7KpjUWkBlzx1sKzYoxQPrg0ERBWWWLRFMQcX1x1oJix06cqDn6qN8IdqN/FsCtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 by SA1PR03MB6418.namprd03.prod.outlook.com (2603:10b6:806:1c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 16 Sep
 2026 15:12:37 +0000
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80]) by SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80%3]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 15:12:37 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH RESEND] firmware: stratix10-svc: remove RSU exclusion from no-support path
Date: Wed, 16 Sep 2026 23:12:28 +0800
Message-ID: <0b12d08b135d8bd1744db895050340b5929d5211.1789570907.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <94bea0ef315adab7a8f9f9a4514eb961a9ea7be7.1778480470.git.adrian.ho.yin.ng@altera.com>
References: <94bea0ef315adab7a8f9f9a4514eb961a9ea7be7.1778480470.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6581:EE_|SA1PR03MB6418:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fb7887e-ab58-4b89-38de-08df1404f18c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|56012099006|10067099003|3023799007|5023799004|6133799003|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	0sVb15Z1h8Hz74wZSKmOLIXhzEpbkneCe1il116578kpOqLwX85jz/+N6swpRbcYFD42tKHMuH2XDeVeMN+C33hJiWqBpIMJ4vbjkFk7Jm/KBi6kjQH1JpdM4gS67NT15PVRNayC2OLhY1mozz6b9pTVtP2BMb5S0KB1uSkADPQcGvJdxSnBtb7xFtdJWzrVWD3h9+CAjjOu2DWSQeFvUmwWebOcZIw4ZfnLHp7VeM/3tnvy8Q1zwLKN9M6KTKFe2+oEslBhiPfcXl1hPIjhhtFdCaQEH/LWR5Zt0w4BTBrkvpXDIWPSZZyWSwNHEOmoU5KBATpJ7hpsHZwqTY1wIRvWwGfX5RSf8stBqJx563XM0oF5rZB4i4agOyCaqMCLmDmqdjHCrIvo2ThE1QKT5aU+SnHgAMmDv3UT0Z+HLUk9Azu/qETIv5b3Ojd+RoM+OZMY3qzshGugxM8w5+nqn2HgJoom6fAbtnLcn+O7z9M1Z2pQ6RkMMh4Ov6vIoGaDK5UysWseM1jj7tTGRXwpVI5M8Jk/LIZLv2BZcxNsIc7nKMDD2EpfRDK8RnHrzG5wYnhlSLFdBMWqFkyU7dOFLCEw3FN/ulmrccaOcwh4ujY2vXQrzxKbjAW6B4NCQjbH3nvACirxy1tGYLJZpRVQd0ZBWeP7gncTIBCh+8ltl/8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6581.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(56012099006)(10067099003)(3023799007)(5023799004)(6133799003)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tJIcaDh+MM2XpUiB2oPtOldqPDZd1v31Y7kSS/66uhDaxiB0qNdVQopikjZP?=
 =?us-ascii?Q?JY+/pEe5V0bNUEAbbuRnXpJtotetL1tRgAUUDlOF1pFsxmJE11M3/sTuNZmq?=
 =?us-ascii?Q?JM+V89lt0ZxtaJaeYbNs2jkMpUauVUTUISqFxmqvsk0JPIAInr+HjBawimQd?=
 =?us-ascii?Q?4V2bfQH6PJv6/TWx71Ud5nCv78d0GLHdXJ5+t+GrATvnBaYUSKApVvQb32dX?=
 =?us-ascii?Q?3KYSqrPyDzVyVmldI6dheQFQ3zPnZo5TaojQ8OUkQ2BOAARkXVIWjMn3z3mh?=
 =?us-ascii?Q?DJcj4Yb0uJwixVt+wA7yGn2xaSgKnuJUSytNiR0tfhLpxOtbGZYwi4Ipu1FT?=
 =?us-ascii?Q?yAk1Dz4RHCOXC30en7yrm2EiWDMDJ20e7+h+bAf6AdAaVuFV3ZhjfZ//i/hZ?=
 =?us-ascii?Q?cq7a6TLkD24MKQZhp5/z+1tvPMPeF656NMcssHhLs4zfiQaX5gbAHQknzf3V?=
 =?us-ascii?Q?V4d2JoxLjyXKPm5r+NS1ii38Pc2crlPS7ZFfqEc8qWTX4ldAJ7Wdh/itujEJ?=
 =?us-ascii?Q?byY+FSBXL5HIRTER9Mzd7DXrV01XN121PhCF3bLoLdoA/Bd3a5gbPQRE9GTk?=
 =?us-ascii?Q?lXGvxMpwGiJtF2grikY4v5yh1KIAukMv/V3f1pwVFVSNSaMHKNGZ6pkCG4UB?=
 =?us-ascii?Q?8xVgyJhytpPYdsVRxnh65Px4T0U7+VHFJ/wU2tXbo68SahzOBZanf49I862D?=
 =?us-ascii?Q?X7BgERq5yEE16/CcXDyPnPudsBLJGr31H+jVGKP1kbJds6IjCGiiSMjIMcud?=
 =?us-ascii?Q?oh8+7bfoLI54KRczuqSryKWP2x5OUoB3kGPCOznJLGHn4NmUyPuQtmBqi1F8?=
 =?us-ascii?Q?g7/P9dXtLxxCkvTfAZl91OXUw51ULrjLE48QpNJe399OaOQ1OYBU1Uk/r8/E?=
 =?us-ascii?Q?eNdvmJJO+hx5N/L/t4LnrGhSwBYOavsW8rNvBHmGs0mbU+7U0FrhB7V1Ed7t?=
 =?us-ascii?Q?QL7IEZFZHwXzGDuhd5J29+KdZuhxWQmf/06OWYT6di1JGZILf7OY8uYEiIv8?=
 =?us-ascii?Q?+B9dfJcXZmBcHv033GefVc3Kk0+xAZ4tRLCT3bA+L0XRSqEdHUok+FPKtMjC?=
 =?us-ascii?Q?O8kURryxP/zyQs8zpHJm8pQaA3KhusOFYl4F7xo0gljGB9WxM8/DtoTEQpt6?=
 =?us-ascii?Q?BbnuEE7DaCJdbVKNcp881dWsuWWPIAOwpZ66gD/mYUrTdXGk/rkAKTlG2Xza?=
 =?us-ascii?Q?bzY624dy7mRUfG8KsUgifOv6Ij/AfqgcIQ4N3M29bK/k9uJXB1nTTMQ6JneN?=
 =?us-ascii?Q?uHF4xsNRf3rLF8w/ZMCLo7mTutl7WJ2aTzpg9Aj6kekm3V7UuqxyicUl7qHQ?=
 =?us-ascii?Q?f8YdS+CCkuPco9922WdqwtUDF3ZbNIzt/5rWIBuKxh90oVRiAb9ZgzEHzRVX?=
 =?us-ascii?Q?xpTof2Iq0aaYsnBrx6n1ND/Owl8QzQgwj0J5TGpNdPtCogr0s+G9+EYsY1Xs?=
 =?us-ascii?Q?WNCmW8SQ1Dlcefo07gZ0IT0k0q3vfclj3fcSrSaDIV5uHPbZ2oNgR5oJALjU?=
 =?us-ascii?Q?cLj6dwAOY1remZiC2qryWLNz8/+3Ni5fxIMXSHJEdr86ymkjCz4nDF2dJ5vV?=
 =?us-ascii?Q?5w6qNwKwgt8fqylWAXCLOcH67kSzxp96y4KkHk2nMbdcbRvH4f33Byw4Weit?=
 =?us-ascii?Q?Fy6OriCseOa6ZcpUpD+IHuXyJ9KtbkcFPp7hxZ5YgNC2HfX4erfVNiJW6a0V?=
 =?us-ascii?Q?gL0M/rW7031RLV8AjL/E4aYhgrO3VE3EFyfUAScK+tb/YkvVlUlQtPvl/Fcs?=
 =?us-ascii?Q?mv2vXNreRDenfT49/eMDQ48iJ0CiY2A=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb7887e-ab58-4b89-38de-08df1404f18c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6581.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 15:12:37.6326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j9TJVHPz5lTsG2A14CaxRwf2H6NQbGjxCZ+mytOkrjM7m+BYzQmHMqy0UHJHGapSlyt6KRgsMTj0o3GI97fgFmig/FByhM0MQm/bHHo4rOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6418

Remove the compatibility workaround for older firmware that excluded
COMMAND_RSU_UPDATE and COMMAND_RSU_STATUS from the no-support callback.
This exclusion caused receive_cb to never be invoked for these commands
when firmware returned an unsupported response, leaving callers blocked
until their completion timeout.

Always invoke receive_cb with SVC_STATUS_NO_SUPPORT when the secure
firmware does not recognise a command, regardless of command type.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
Link: https://lore.kernel.org/all/94bea0ef315adab7a8f9f9a4514eb961a9ea7be7.1778480470.git.adrian.ho.yin.ng@altera.com/

RESEND: refreshed against socfpga_firmware_for_v7.4; clarify commit
message (timeout wording, shorter subject).

 drivers/firmware/stratix10-svc.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index dd1c945f2bee..f803a1e947b6 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -933,20 +933,11 @@ static int svc_normal_to_secure_thread(void *data)
 		default:
 			pr_warn("Secure firmware doesn't support...\n");
 
-			/*
-			 * be compatible with older version firmware which
-			 * doesn't support newer RSU commands
-			 */
-			if ((pdata->command != COMMAND_RSU_UPDATE) &&
-				(pdata->command != COMMAND_RSU_STATUS)) {
-				cbdata->status =
-					BIT(SVC_STATUS_NO_SUPPORT);
-				cbdata->kaddr1 = NULL;
-				cbdata->kaddr2 = NULL;
-				cbdata->kaddr3 = NULL;
-				pdata->chan->scl->receive_cb(
-					pdata->chan->scl, cbdata);
-			}
+			cbdata->status = BIT(SVC_STATUS_NO_SUPPORT);
+			cbdata->kaddr1 = NULL;
+			cbdata->kaddr2 = NULL;
+			cbdata->kaddr3 = NULL;
+			pdata->chan->scl->receive_cb(pdata->chan->scl, cbdata);
 			break;
 
 		}
-- 
2.49.GIT

