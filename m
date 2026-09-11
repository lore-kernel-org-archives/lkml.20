Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012068.outbound.protection.outlook.com [52.101.43.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B6F471421;
	Fri, 11 Sep 2026 09:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117786; cv=fail; b=iq62jOvzlsPfE45dWvIThn4of9SSfCwoCFKtZU7tq/hdh8kL3A9ZHJ/I+LG9lbmsN3NCRgwx2TbMDOE+I2Zxu7v/ndZDZIY1+zWni4TC+kFSBWKJEr9AtzlgabDppWvmQOtYnkufkuVZ6KYCMkB431FB9lMbk3AxF0mYubTsm0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117786; c=relaxed/simple;
	bh=8FZ4t/Bz7kehcoP9vhwatZ0QtyRpW17CsK1S26rx8rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DS4PQbjTYQUqX77zfwwZk52h4cz4v+++hTsW+c7Fz27VRgGJPWY6BDYoHraoXMk3EDoLyn0HfUeR9sKw4C3pW/ixIJzJhp2Wqeb28afgNaKb6DCG68XUYSk6CsgMpIIdlZO3Pf9freTww2t9JeJnN2DmzL1+czA7kDsV2t0dwXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=kxXFIykU; arc=fail smtp.client-ip=52.101.43.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="kxXFIykU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDFHac6BVposVn7a9TuMQreaHVjVoFkukf/L/U4bmta5cRz+o1NIILpdTI7nqKQeN4IFvzvvavNqULNdRzMRvyrlsPyl+18lNNrkitHzE8ZswlI9UBB6IBpm/AGwdDQ50DrDfx9hXBwLl0F+cRpWiAkPIJc5LU1AVmdsOa2QLkKdNjzeNy83WkHStLTYozhf3YQ5ibtF9HDi+rNzK6eII4nFcEV5//+atQiq6J8WwQxjXlyOjFTJjzNZp6lo9dhliJBvyPUFenGBK+GuUuiuBjaIbA2dMRF/NBLtSRjg7q4v7wcjtamu3nqIglidj3NZi0dkzbN6mYOUUg4S7aBbPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBO/lBolSptA4RhaQFHiRUnte726cDcbFdbwJDPgjRU=;
 b=DEw3NVSQQ4zpDjFMGIne0LN4Kc5T4IEFQWoIdYQGC52scP3e5Cr5RHj6r9/03qoblyf1CEHo2kmjFWuKUjGXtHR3YhBcAd4T6m5sTWkHKmLJRoPk1MndoE9BvTpccs8fQeAQLrDawQTnjVlSEIn8COvAFojrDGZqw+KemOz39h2NxpZ9kLYnY5ysKQUynR2hIPSJEHp4FO4SQVfeRAtNTG9zm5APGPax1GnyOZsBOxe2TGPwK2GFlhoOsufM76jpwfAy1ixCEe7pAQGx6nI4XzaTEKBznGSJhj2uXNoDkOKKETfc65eCjoZpPJzTuzAGXUeWnk/umuxkbBkBqXbcbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBO/lBolSptA4RhaQFHiRUnte726cDcbFdbwJDPgjRU=;
 b=kxXFIykUj2/UStfXC84esIaVc0dQ+TQ/mR66rtHPrNaF46KU7+JjIKr3VVseuJQqZ77wpTkv69yDSuALTMYLWeUkVRDbD7msOUmKB0oSG6EilxfD4fdT9Pc+cbh9tAOD/zT93uZGMzxtyksKXE/rUmfC+Bhnet7pQSvN3HwGSlvcz4QbNLayM/UghWEV55t/7tnmyJ6Rb1JI6dYtIhQMooy6stDGBVUJLSUOqk/yYb/R2bGbewQ3OcJSTZoeGdjaE5JLrTpSsyMb1qJYSKSGdhf7BSNPOZaS/Ea5httFFFJdiJrLJAVQQZOhJiEkqgA5mBedLjZ5lxJgcmckJpUBKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ2PR03MB7140.namprd03.prod.outlook.com (2603:10b6:a03:4f2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 09:09:42 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:09:42 +0000
From: adrian.ho.yin.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v7 2/2] arm64: dts: intel: agilex5: remove usb0 in Agilex5 SoCDK
Date: Fri, 11 Sep 2026 17:09:25 +0800
Message-ID: <393fe48279137739e0781fa00b18de2b3821ee9e.1789114403.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1789114403.git.adrian.ho.yin.ng@altera.com>
References: <cover.1789114403.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:194::20) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ2PR03MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: e24f7429-8ac1-46cd-bb7d-08df0fe46a13
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|55112099003|22082099003|18002099003|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	p5WcDXjY6Y5wC5CuuTrtpCJ5r/By/1Icef6cWwRbDT7v+VIKke7aeMJB7owgxHZrIhEC4I8jaZxiaIWRBLG+2CO++Xz+OiuhNWglIdUXJCKLCzMxDuB0srHxJ30BFamrcFjP6osn3r0PqzFhyBqZStRkhLdECoThnEYxViYwBBVbYNrRIBKlKZLDAU8LpDxXhx+6gAk7v6J8b5nBxzz+3es+rjVP5YGn2HYCCA3osS5pD/FkMS/60UxjdnIZ1ALygiZWBPbJxF2MgTwyM1siYNYZ2OJdWFpVXe7cTdKfZtHenPMWCFaggueR485SSQQgqdFW1ZCMXgvmg4OOWQNVAacZPv1dduNdBsW783YRrIkeU4Yi1RD34EwDZ2397kHuFothLMHVqFdOdJA+m4B2gB+UOVuPHn7FUOraHEDTskyFk4KsHmuEZmlELnzIYLPxnLjLIbyebZuJQXfJm94GbmMGrVWhypB6Lz90GWMiT84/p5HQLMkqOWpMscbaeiyY6TEpNRn9h36nmXhH8t6ZGAwwFQechOD/T7I6TGHnNWJyziF0MA4KQjzN5Osz9Lls8xhFeOKmlWXFvEnMcNWI3OJd3tfLFMTOBoVpD9ZLKcbfa5SLO5QfVasv4GGygsSxLjfbc62AGAg0pQeh0pFOJq6EYmR0CVE9upR+cp6c5lQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(55112099003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uHptscUY5AKoPqhgnOt+A2WroQneEvSqRAd8dXGDFv965fKooigLGnzE4GFu?=
 =?us-ascii?Q?XlCUWELOqpHl/mdHEhLz1jtWssQRpcsFnwr4x/7wvMy3x2kYG/Nd6AxMHMO+?=
 =?us-ascii?Q?UC/pUXcdjOZMhmlo3thlhG3OHcLnwAdUPQ6L5UXPOtOyoV891iboWlVnyfgS?=
 =?us-ascii?Q?tm5yt//lJzrgBpAdessIXzuQ8icwfUkAn7SUwfX+sZIfVFqxgvK847cli0z1?=
 =?us-ascii?Q?t1HdQAONa+eyHnIq0qKh4/3uXypsftgwczWceFHlu4kSLGtYIa83grtuBuPA?=
 =?us-ascii?Q?6iVzO4kMDWyFpG4aA+iOk4qRsWepZGnyybATO6Ut67Nmz/UNdl/4CiBq/MW+?=
 =?us-ascii?Q?KmN2VR/cnX7kis7oPayDia0mj+BDB6lx+Tj2Ck7vY0utM0vUVV5cnTntrREP?=
 =?us-ascii?Q?kfnN2BG3lK6zTZhrpAneEG0BUEH632MUCHB4EYPKkH6atSz33BTem98RE8qr?=
 =?us-ascii?Q?v3bjvP8d2mV7thKk/SCjzrNRRqqYajclHUrzUBoZDp/9EBLKZBKygaEVgN5n?=
 =?us-ascii?Q?BFld2QDwMYDFW/zG4ZjsJT7BRCl2i+HO8xnX3Jt02yKq3R29KJWWoTUq9Z83?=
 =?us-ascii?Q?46pipEgIpEz6migUYe1c1WKJ+eMjVjX+5XQu3DRJN6n1AVaajpucJEXsAWwF?=
 =?us-ascii?Q?fus2YZLVyKBFi5q94RrRiIHQS93R5yThhHPVzpyLj/VXHauD35r7qUGaAr+M?=
 =?us-ascii?Q?XR/fTUrGz+YrLTrA/XUs9qvPdq0QMUryEbM9u9CE20ktxX6C8CWUFpAvnInx?=
 =?us-ascii?Q?kYy0GZ5pT5OnovOd1PFx1ucz08odw+xI5+MXp5mNpAodnPPxvqvrvON5vhVp?=
 =?us-ascii?Q?7cmn7ZCvhQtXxvao7Ad5H9N0gNCoomhqFcqEhWLy9yhQb3H8lZWa6HNpjgeq?=
 =?us-ascii?Q?n0UHYpvQgG/4jmjCDHRtZcuLxbxRiQYuFMpoWgUuUU5tminGT26cc89wYH2K?=
 =?us-ascii?Q?sw7WMhdf8nZli1cWSfnlIVClVR0lRApdM1C1wF8h/J7cIx9Tz4nvu5b1SwvX?=
 =?us-ascii?Q?nCVrOzaUOB1d+m8qCyJFmYVhrMWSPDR6OpLel8PTO8AAHwgrZzgNU9cGnVbp?=
 =?us-ascii?Q?SUJbm9yJjRLSYNXIUDNBbwazANlXzsRcFY2s8mgZwzFSDld4Q/iGOqrxlDNy?=
 =?us-ascii?Q?sii+8KQlUAP3Ip+EfdVKlz6XKJ33B05ZOy5BYe0Y6Lsn6eNtkITLbWt6YoW5?=
 =?us-ascii?Q?xLCNktQHE4bxNH2sTnTmux22LYZkU16Zh/eyPh8xpgvBPcPBnsnaDxpikZQ/?=
 =?us-ascii?Q?T5B9l9dRu4sxM+77n7ejlllw7n/afBnXUEU7vSF8hhjU5BMFk5Xcz+1GmQS6?=
 =?us-ascii?Q?qLQqod/gBMKbrvpQSc9wH2tEatuap+mMLVd9gUX0EHfB0NnRgElpzcpcLQVR?=
 =?us-ascii?Q?514RAFwaszWigkHGpccM7KTq19QPYieCtUZHAJMGYQqXpdj3lCAB1LZF6gPF?=
 =?us-ascii?Q?/zDS9eSlsXXNrp9jEu2c1zSoLdr1EMxJRNUFYnWO+CY7mzk9XTmbqHGmos+E?=
 =?us-ascii?Q?bvU7pc0GA0HjJ8BVUZOalzymQzDT92n7OxHPkjKy1jFq2cy8fUADTOctK9dm?=
 =?us-ascii?Q?ra0/SGV4/gAiL9eL1L7kKbUaUgASPpyDHyjS69j3iZzKVtlVlM2tz+W08cQN?=
 =?us-ascii?Q?skH6CwX2druXqSoGxLUdR0AoNUCHM0NU7N7YOJ6z7yKvNeXo1aoTh4CknvOB?=
 =?us-ascii?Q?wd6xaYQbuRW7f3NAvX8PmAUWCSH1c0IsZtmq6+BfWTaHbNSlKVaYWxz38Kd3?=
 =?us-ascii?Q?nQ/Z5cNfGLUtNmzTEehkxi6bmHbZcDk=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e24f7429-8ac1-46cd-bb7d-08df0fe46a13
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:09:41.9806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLafAphuOrPRFtIVnipi9eH1eqTZwXaOsT3kzlIdMSPkO+sij1NCY86/L+eCCvuvWDMauUThuDStUhTPniZBC3dFGLRWsS6ilIiXS3YlJ2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7140

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

The Agilex5 SoCDK daughter card only provides a USB3.1 interface (USB1).
USB0 is not connected or used on this board. Remove the USB0 node to avoid
unnecessary initialization and potential resource conflicts.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
index aa9294494421..c48867cc3043 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
@@ -104,11 +104,6 @@ &uart0 {
 	status = "okay";
 };
 
-&usb0 {
-	status = "okay";
-	disable-over-current;
-};
-
 &usb31 {
 	dr_mode = "host";
 	status = "okay";
-- 
2.49.GIT

