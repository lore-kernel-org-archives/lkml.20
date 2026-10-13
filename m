Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020084.outbound.protection.outlook.com [52.101.225.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1FD3B893C;
	Tue, 13 Oct 2026 08:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880410; cv=fail; b=A5pPISiJgZhJbu40C5SW5qnWMVj3P21LNYFNFaxAiL/SM3+IfXaLXu4/34B8wrHvZJLG6xOfNCU73ZmiKmpchcIrjI36E32XVz6ajOiyJSKnMHm5UMfk/OQUdTOOlORu6R094PmU2AcPcHwqfBGRBBhbUJJdugIDrAKUz6qQV6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880410; c=relaxed/simple;
	bh=YP6urko9OM0M67guE0P5qm5gU7Ofc9Ggr096FqnEvUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B8vNZk0UZjpe0OLWUR36yxt/uogy7ZLrTTGzlZVjManT7pxKrbdcrL1MspD8aWvRVmQ9oceGfcykS4wsqMt1JGbigmRIOl3HooB+Hne52GDOixgGyA9I76i664gGuS0s76HctWmnj+RncyX3WE3N8BrAVYAVi8qAdx2uRMJcbhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NtyhJW27NimO7Le/CHZBQvFNjAjvaTQPnsfVkCCXb8oJz05ewn6mjitnEzhN8f+w/jmulFiysrwUrCIy3Tt+8ntBE1jzIkPp0aToJ/s9fCKIYPVFQGVsFneKVfmsggoUhC5AyuP9qdYjmjUXnGLjrBuaDkr8xPDFydAGBk/aULwuq0RdJGOBbN7eKD9mIu5Ge3er5GHmxHF+bjGawvWQaFAupRRjYe8kjkX+kd3olu+vFjwcxBmw48v4vyw/YLT50s/zb9gsQNw2bZp+rlgRB9+5aK9OJNAM+Dq2OxKjwsSWp9Bk5AiYV5OET3eOJ48V9of4KiVhpd3EZHiYOCfx2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4GJbBCEfmXaCiEOxCF/3A3nvzFaU9cEREPVwIQyB80=;
 b=C3ompayak7x+kdHKj1wMWqTnCiqw8S/yxMxa3v6hpLPVVZlZT54+y+KNPoL24zdHN8NsQ8EY4XAuYcf1PJGa0e6/A6aLjkz+UyOAcHFhSvfOM04gtxa5erZ1wVQ54FVlwIHPPGVwXNXvjNCA5BxgIgORQdS93+IL4ZGNoe91V2pdHcUA7bvBXSSbBSnDbd48zyvPqfzjN8KDvnGo82OKrNZTwl/QGTxRw0zPV2tFhyASkG0VApdkT7YLwUZSmI48aAyq/EFI+5EFTLdJRC02/quWLp1thlh5W/RXmKCa64G/VFic6ZnzO5LAV2GZp7JoX7oubC604MfI2n/pCCjDVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB4631.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:18d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 08:33:21 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 08:33:21 +0000
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
Subject: [PATCH v5 3/4] media: qcom: camss: Enable the streams API on SC7280
Date: Tue, 13 Oct 2026 14:03:05 +0530
Message-ID: <20261013083306.1132036-4-hitesh@ebytelogic.com>
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
X-MS-Office365-Filtering-Correlation-Id: 912d0160-b345-49df-8b94-08df2904a3dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|52116014|10070799003|56012099006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7for0HWI2wkPbDCR5FLfrRCYi2RM5ccNwyrfXi6Vtx+M5xwaBPMyP3OAPwisJ1M89ghb0bdYDDzniLlXGCetBsuDFdDSMBaAu9sRmXqEaWgRoNWoSTrAmuWmxJNvwCy6xdec5kI+0+rjD36wNYOxzpxO0el4F3SIOI+a7T7sGzuz2kn7kz4wnaf2bMwVtvlzitMOWKsvS1AzzVICg3iUYcA+ODB/6o68REvwnkNQM6TvEcsWgTEb2Rv9kaObVpNM8V0AC1eSIRqzhRJJq6mJQHUenOMd8sbBvGIvtSFm5VKzZHUEgGzUMRgq+16bxSE8UIf6FWaMq8uz5B+oHXqb2u+FzMguZXFVckY161m0uer438D3O8SIzZoB6+Jv0RMVDjazTk6IPFNGA2FBrzU+4Th4l1/j0YbcI7WnEyE7QWENbh3mjwQwcvkJL/KYzOL/82MXjjEXsPKCmMGzcAQUpAeU/5BKfZw5sAmIoFByo+XBJ1Gx/mfPPQEGNSSKXZvrdcwZInfuiS8CtyYZcU0KZDnGDCYGqZNxAxaGhjipBeMIMvQGwh9C0Mq8ASobhdG4eX8YKuX7YH6bBH84+m7MjlEMhrmvysY6h9c0o+psdvPOdqQNThXEMESfQTH2rKxBnTyeNi/XdVhyRhHlFgTCn5vHbxI3tqNmXJtxyGTYVWA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(52116014)(10070799003)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7sI+EmnnquUn9azvJyStlSoTgBLgU65aN94nE8Vne+di8/p2dUlKtm/OzG16?=
 =?us-ascii?Q?O4YmcbUZLfLwNTPVt/OojaHUZBDjfQuRZKtTlzCJG2qZFHzEtzn/wZo56u/T?=
 =?us-ascii?Q?HoMZZ8Q/44QwVsirj8Y2KrgNlOmEf3CurCwd+VAAkjhanvWFsMqGrYYI9+GZ?=
 =?us-ascii?Q?Qd9FhU2V80PFderTq6j23iUkTMRzbr6euLdHp696ezXtdvyKW8sripi7oe9c?=
 =?us-ascii?Q?oB5X+tTBXhsApFbDJrRlv+cRWLwQfUvM8CQo+I7+a8qRNKl6Pxye0Dp76gTX?=
 =?us-ascii?Q?1jfc+QJhz1Q7ij+KEsoyyUjE2MQPkT74tiTe13f87QFjrBYJli2q9K6CI/DB?=
 =?us-ascii?Q?JlMzqWiqzjhVcH5pWLfPUnENqGycjKpitRphRr2dNrNJPJ/ck9Xj449stUYS?=
 =?us-ascii?Q?vIzQrBeNX3QZakQI4mUDVicrtceNdqaK1yx//eFcOt48QMNK0oehXz+R9ikL?=
 =?us-ascii?Q?cd0fNcDzdEzCm3r3dcBAYhmZEEGSnROX51jBzb4ANqUDS4/jb6lcDVnV/s1W?=
 =?us-ascii?Q?MFzXApRRMyX9oHbBI/jQG9kVn7iSyfoKJ60wGlnl4ltH+Wvneglj5J8CaR7K?=
 =?us-ascii?Q?aZRmprrTbxc6Lket31e47Y0w6PjNCajIDX/Q4IORRVu7Rrl53Shp1O1Kat6l?=
 =?us-ascii?Q?V/nklwCeMyd2QQBEOZG00YQGUJEKrCGoW2hBK2URS76Z7hhwkh/fftLF72h+?=
 =?us-ascii?Q?nMcNkmJ1+umLa3coxNeVzacaVtI9uIwvghVbHd7obq3t7k/wCT64LWMAoh5C?=
 =?us-ascii?Q?u61ZnqcWSci5totmOSQbERcaCDAjMr3WPRh4/ziTm31C0lni+NSm1WWb/Gv/?=
 =?us-ascii?Q?7lC4K0gVjMrcraiqwjs286zqMXioT1tJ5E9S00lnxqxsXwkEsVkyyWx1dFNh?=
 =?us-ascii?Q?mBfYEo+Vl9E8/lMItPSdxOXuD9gJcChkr2bGqu+7xNbllwKH6wa0l2tyLU7e?=
 =?us-ascii?Q?I+d2gxwFCI2hyM1+wCYPSVYmN2aGuZ4uFXVYgV9lL4w8usuTqawjJmxKA7uH?=
 =?us-ascii?Q?Ra6PmGDgWW+V50Zt2+PjZUS9i9MJd4LUO8LqJgzT/+oIaa96s6cX/D1/MtGk?=
 =?us-ascii?Q?s+gTwvMvJupvMtDjQnsMRokbnDd+x7fJFEIru0xcGS/YQ2p77h0MVOnUC2Li?=
 =?us-ascii?Q?sSwU/FqvAx+x9ikkVWh5BeEjEyjM0JIEEeIFbP4iMLQRUqnAQno+QOjPJdAE?=
 =?us-ascii?Q?s0d7gpUZ1oQ2Q5eHfvLiDWkb5oUgEzRIxmFB+b5gNi5MQkBqSWn5fBO/DQig?=
 =?us-ascii?Q?9vX7jXLsYy8rNUO8UA55vh9u8snaoU0L1jmBCnp/YXqkdujKUUku7aQhSaBH?=
 =?us-ascii?Q?IFHEOKslwrGFs53gzV4cK92K+9VbjOGNw8d2LEhmjvwOaOGhgYvHqNK7P9gh?=
 =?us-ascii?Q?QJR7Q5bu0j5u0W4fInn8Asq6XhNY87vznad+9FaPjQY4oQzHpSdRZuPRmzeu?=
 =?us-ascii?Q?A4dMjPBeYlu2AnHuk48qCAYqLbgGvopM9vIA2lBS+/pkcy7NiKvmCz+jTXrL?=
 =?us-ascii?Q?C3iLSsT9MujOoPhzrJM7SgYye+RTa5JWYtuIzcwyQd34rO6yn5qXfQWvjV3Q?=
 =?us-ascii?Q?IAfRyhRPGo4AOFApAHoi6JLScuZU6K+faRxvBf97lT3mvIhp3cgnRmgK5hP1?=
 =?us-ascii?Q?YK2yDjZhs791gLGP66wlvsyEqLhO1V9RxdH2Crymi5g+HACexjXNRMae2ddi?=
 =?us-ascii?Q?51197NrU2LgmSlF/cAWV5pbgIM/9Y52+ONW+wOY2rAxofMFunFxRogIClNJR?=
 =?us-ascii?Q?wLTwLxUXzBPmGCCI/FhQkKIIxo3MgejrWJP8Z6o7/g5PhLxCl3YOcMb8hS2V?=
X-MS-Exchange-AntiSpam-MessageData-1: Z3mfBMzlcoE8oQ==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 912d0160-b345-49df-8b94-08df2904a3dd
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 08:33:21.7906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CrmCtFQquD658azLyG/JEwB9NZtSW1y/AdXpH3LI9joj15wu5q3GvZMNt2tqRBiXfpnGMpFCvYVMrCLYaViwCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4631

Tested on RB3 Gen2 (QCS6490) with two GMSL cameras behind a MAX9296A
deserializer, one camera per CSI-2 port, so two independent pipelines
share the deserializer subdev: both cameras stream concurrently, and each
can be started and stopped repeatedly while the other keeps streaming,
without the WARN in call_s_stream() and without the second pipeline
tearing the first one down that the legacy s_stream path produces. The
CSID test pattern generator keeps working.

SC7280 has no camss child node named "phy", so camss_detect_legacy_phy()
puts it in legacy PHY mode; the streams path dispatches the lane
enable/disable accordingly.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2c9c4ce50..a9bd79ca3 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5760,6 +5760,7 @@ static const struct camss_resources sc8280xp_resources = {
 
 static const struct camss_resources sc7280_resources = {
 	.version = CAMSS_7280,
+	.streams_enable = true,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_7280,
 	.csid_res = csid_res_7280,
-- 
2.43.0

