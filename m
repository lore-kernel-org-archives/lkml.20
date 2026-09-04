Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020140.outbound.protection.outlook.com [52.101.156.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C273415F06;
	Fri,  4 Sep 2026 06:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504417; cv=fail; b=f8kIyYhudJ1MYGuVf6QAFGR/1LnDtgJL7iOCLTsnFYlcknwTXbjiS3aHUH6RSs/ISBBI20VBATDBuQq1Xax6L3AiIfB3zwvZBplJ/IZxFRoNe20UTNR1NpYgRCzobnhvu2ON6xgqYql1O/mm5svxIITs36rZHXAMnXNDNRThL6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504417; c=relaxed/simple;
	bh=sgzpOEe5gLl43St+aDlf6mQut1QcHlE/vtRcI4XXiaI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cE14k7BfovbXHgqlpCgSNPJ9pLrwyBWfAEWLlrpdkzELrVurCtb8kiDr14DR8n0M/FIquZlafqXXcEJu+4DyKNCe2FgWCNDjvvhWdjnqQ0x7IqPM8bXHWWm42mc5r2noHF62L0p82robxY+Taf2oK5Ph1ByN9Jdnom5/LzMiclo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=FWrArsMu; arc=fail smtp.client-ip=52.101.156.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="FWrArsMu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2Api5wHX+pL8kNYhGOKhfzLb4R91R6qD8F8MywbzmB589EgxkkVNFwgmc5D62Xxqy7QbG/Z+xEEsh6gCSDCdeN7bgT20FYii/PY4q6TBEnERi2G12X5twUOLpEsBjeF0Ujge+2hDPqcUYb6CVRQ477JS8iJk+oNyI3rlQkZ1Nh52q8frRgSJHhFyM47eX5ASwzqlNZli8u7yGZi/L9NVgIMvqC6ZtOGFChDW5PHYNb5Lep9jxKsvcUR3/OZo4O2UXZeccp4p+1UCcevizousOaW/P2WK+4lMY3vklBAnmfvTqUeypCaL+QlWMt30w6cq0VnA27/X+kkuzLWFw1xgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAC8+/v7e6XibFsNPx+Wyt11P3I9nhDS/a803tt9xOg=;
 b=zQ1WFHjto2I4vjE5wqk0dwqRbircfkwvntEVegrTV+eLEKjGeL6FkGTFXxL6S/hT65d4iriot50i/i+bUNxNAiED48F7XPJcDMvFsyL1xGDSgB14T1O3yNd3a9Ebl4P7ck2l5AxxmlEZH1JR/JmjzeSCJZH/wYwp2mgJUuUR3vS2nhmAhtmf0L41Gt2Hb+9jWreoW1uP/1Qx56KaypJHwnoXanBb19/WDQ3wxEifBCiT9yR8WtlJaQTpLjaDKCh25aDzhtmQDquXs6BH6HMjdZYzbRJEI5dchu5Xh11Fs5zwRBlYd6Ujtvep/4StxR+LVwkdR5qgSchdqaVBb3U8kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAC8+/v7e6XibFsNPx+Wyt11P3I9nhDS/a803tt9xOg=;
 b=FWrArsMuBj0oODWqNSgoboIZcCrsxyc0osiThkKX1ITQ9eaWzmW7WNK8oP2znbUxq49KLF9DMnePEF4UYMihYAHGErdc7kTw78CEfbpHiABFB8hxr4Vh9Owtexx31PMXrFcWB0HJDbmH4Imi4qaxbtKbnTPkar/lUxjs1duVJlPtu0yS/tsvNYl9crUE9fRIpRSgINBWGkXSzQry+HUKzA+B9zUMoNWBWcYdZM9YXamR8rTW2jJmnrLJgQfN1GDLnvCY623oiQuEFaGgC2x7orF9HGTa7ylpC7ZtIZky3vEyZ3Q+l6xfCUChYiYhZxJfZgz8OwZpYUb3ejpyWQpJ2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SEWP216MB2979.KORP216.PROD.OUTLOOK.COM (2603:1096:101:296::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 06:46:51 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 06:46:51 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v7 1/9] media: v4l2-common: Fix P010 format info
Date: Fri,  4 Sep 2026 15:46:27 +0900
Message-Id: <a6496e8b6bf87c48f4ab5ae31aa952eeebb7a2e3.1788496816.git.nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1788496816.git.nas.chung@chipsnmedia.com>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0130.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c0::8) To SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b9::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2441:EE_|SEWP216MB2979:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a70964d-e7c4-4492-7f00-08df0a504cfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|52116014|366016|38350700014|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	gHTjrpqO3swuOautZ++epOYWGXdFUgz9+X3pNUTx4vLUugFdqUdxMFxVBHNgMImguWCSNCoGRp5bdOrOfgVYkgUWL0r5nBmpxXZIpjBwpBjYjckjJ2FusbdwGZL/E3l7mMMve7mRM1yx+9yIKFSBSaIZPKCCphKTEkr6MYd1w/yFwJHQGVlTWXT45mhFX2Jqir9K850EreQ67GQDPx+pTUX+QvxPYB2K7C+9isC0VLF35Fp7ewFp0OXeAoJgT7/p1TuB4VHXmex4I/q3cCh99Yf9vjTxOVywsAZV3TrirUqddHekn/F3vJEjxY7xmMuO6hmF6t/Si+4bO+ugGK+xFBJJQid91BkR4xBJ3U6uXjYFrkDG+stSIxmQQaRkd7Lorag3dm7YpC5artniMR4PZA5LEmWE8HcNQu2K4ssBP8pbqQVl3Njl6ZFFDTmLLi2OBp48HbC5ZM4OsZIviG2XrjTApXlof/wlRad8Sv25gQcgMi35L0FSl+NHAO8FJfxnYjYBG9CSN7jR5Kai82a1cAH3m4AkhZPAirFxOQXigyMLV5Dm40J5wcSWHnkn8gqdCyT8VUE024vs4k0eWfRz+xQ/0Py/jCTY1lYuO7T23bubyUGap72sAVDFnHvBwZpGJC0RRv5NEdO4/v/G0ulofvhMORlXd0FI8uxcu1Nf42aLRY2f6ygFfI7SeQbR12NZyDS+31ZMNQO2ILOjAjJ/DOPck498a/tUiL1jj8wMZbw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(52116014)(366016)(38350700014)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HrGay/3KuCqHTQnh8HTmXNnPPj2vR3YydUVPxCuRRxH2U23lcPdOg28z/Cug?=
 =?us-ascii?Q?VxqLYJotJ5RmRxYhRRTCM4L8n+y35YCjsrXTrKYCw4HYbFN8x7/DxfD+5pqP?=
 =?us-ascii?Q?zUVBVVXjkGB/uqzKWL7x6cbxTpsxjbOx4vCNifvyp0moE98AeV/p1qN+D3m2?=
 =?us-ascii?Q?j3Ovj5oSsJpT9L/3x3R0yK4Xe7wa0JFRFegqH8z+zoP3w5FegH7OE9xtZlMe?=
 =?us-ascii?Q?TM70v7KvdruyH1Hxtv5L3Rox99UWW7oXV7ctjPwjLcSEZ6dS5goCoLC1y0CS?=
 =?us-ascii?Q?eUnFJG2M7s+qFZlOldEmeJ2fY7Mph8y27xMDLhH+hallj9XJa9xOkr9jSX9B?=
 =?us-ascii?Q?JoTGK79mnaVThlPaAN/8OwKPTm1iw8tb7XDq7K3tIMGr0U2aS5G98JteoX3h?=
 =?us-ascii?Q?24zbfVwHixTq1odMDkQRQ6YdXq/8DTqO2zuC4L/KpU7/3F4T9odAvHBZguMv?=
 =?us-ascii?Q?2+sp6o4SP+SqEqbNP0jmtAbW1f6sH/oVMcho9TlhDdc/2ZGENZRnBdjET8bY?=
 =?us-ascii?Q?eGZhL1mHgaYiACsPs5A6i+//2G+NzrnZ5OT8JU0JxXRJPb+5U6GTF+iAzfp8?=
 =?us-ascii?Q?VOpryfrVdK2FQA4ErSLcevLV4R7x5YfQnKg3kat1uxbHgQy2t1lSVLt7Q6Yq?=
 =?us-ascii?Q?jtHmfGFw2P9GAVV5FkDPVGYwtOYLtIAOL1BwO5UerhPm6zBrDcXSIB2dm5UF?=
 =?us-ascii?Q?nl2m970EVv0/YGkmpBIJ8GSeA1uxsRbvlDaIeehcLyb7+SVbEj7iCSm+Xbjy?=
 =?us-ascii?Q?XOD0nFntmbINQAYHp/uKI6kcGxe51oW0+CWv8OFvbArzSXlw0RpolDW9w9n7?=
 =?us-ascii?Q?QoDplqjqaiROoTTl2I4Ul4GmWB4filK9iN7mWGopG0k2TJ+7QcKYPYrZQBKh?=
 =?us-ascii?Q?SVZOGle7mCDYGJQIBXPSZQtWb59dMHpXlYCop86ZW3OGYnsqnIuEjyvd6OSk?=
 =?us-ascii?Q?a3bhLEL5GV8rdXz5MagXGLly4O/3iH2SBWADRirQa7ttq3BnysRS+iAhbqfQ?=
 =?us-ascii?Q?yYxsRKI4KnsRhpGOyC/cxaxvZtH/afEcXq7YZAlU/VE1CYRx5Fs0QgROnzk7?=
 =?us-ascii?Q?1gJ2OKeg3r421ut9HJuR0O7IRVz8LDrM6unTE62b+kFCWlAWLIt+jYK1MR0c?=
 =?us-ascii?Q?EYMIHx3uJnW4xlFtLJf7opPPhEOsORnarEClKruX+/kJz+TL617Ngln+/VsT?=
 =?us-ascii?Q?Hpj74+plHISRlEU1hJp3T6ybaSHyHQWNGRVzzGiqmDWcZf7qQdIAeZYgmZVb?=
 =?us-ascii?Q?KsYdyJgsihPgHKR7FR6MyRnOzzy3bTcRNXQpI9Qz3EVhJejPd9htYrok6Wp6?=
 =?us-ascii?Q?APtyDpikimpnjGs3y4zqvASaIpW0bUPBywnofKKtHDDMyfszpHm99q0anRgj?=
 =?us-ascii?Q?SWyYF5adXllVkf8BGiI2hr9+E2nOdslgiz7ytM6/RQG89mYKSEzp5CELPMhd?=
 =?us-ascii?Q?cWsdz/WTvNTz0bz+ZfnZCiY7YmtumG3wnqTW/ZBrwqYqJoEZ6tmR/dr+dDs2?=
 =?us-ascii?Q?Lxag4V33yw8uBJldmIYdeERwfmFwPma/vuXes4Jmt0cDlv4557sjJnMTSVro?=
 =?us-ascii?Q?6WW2i26V+uPiAictej7bgwLwxmTGpu33aigaIdodM2Lh6xURTl0ddxF4sNuN?=
 =?us-ascii?Q?zybs0O6cILEHoZcB2aTG35i6cGADBjKIy41M4hJFvqUyJMmXEeaeO+PzWeE7?=
 =?us-ascii?Q?PDBxX6ITg2THN1t7TAk3W2KF5EzbeUfR3TI/yPmnzJNnOPSBC37/J77Rtn22?=
 =?us-ascii?Q?CP5dc8SAbsT3n8UgCz+Q+xyFgRDEYDE=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a70964d-e7c4-4492-7f00-08df0a504cfa
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 06:46:51.6567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /1eYd+GhgBNRwfOWelXibClGnnUprvAQHkGuYYkrhifjoe8SVU5srV1mHnprOCdkymRji4ReflSV/b72Ljmiaxr33CXofLe/Ua89S6+mFlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB2979

V4L2_PIX_FMT_P010 is a 10-bit 4:2:0 semi-planar format, but its
v4l2_format_info() entry described a 4:2:2 layout with a half-width
chroma plane. Correct bpp and vdiv to match P010's real layout,
consistent with the other semi-planar formats.

Fixes: 5374d8fb75f3 ("media: Add P010 video format")
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 65db7340ad38..4de8aa3ef7d2 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -323,7 +323,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_NV20,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_NV24,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_NV42,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_P010,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_P010,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 4, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 		{ .format = V4L2_PIX_FMT_P012,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 4, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 
 		{ .format = V4L2_PIX_FMT_YUV410,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 4, .vdiv = 4 },
-- 
2.31.1

