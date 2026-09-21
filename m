Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011053.outbound.protection.outlook.com [40.93.194.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987F14A68A4;
	Mon, 21 Sep 2026 14:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999270; cv=fail; b=jiFjtcxqVfHK53gUKbNG+1zw/+Dv+ftz9MZAZpGCB178zSjJtBsYdAdsgXZ4ECaUn1eZOMGzOTSev0jcinx6C2u5RV4iOxEqETYAlcnD3uVIJUXMbHmz/ZlrZYIHxHkMIGAr7KjRZUqukERZ2l6n95bWsSE+ueAdxZ/e9HV4C68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999270; c=relaxed/simple;
	bh=8XG+oWRMJQ164B8zSo6nkO785ckqjt+45U2RBhzGspY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=boeunGCVYg0MkkaooBHvyjtZ2AnrMNFtoYmY8YVOLBXdXSt5yuI9menKbS4pTQJ7BkIZM0s7hvUyyjGwb6jIjGpXpYpMj/W2+3LoYnUvSsAorx1DE+0BRSPLTUYEjYKY+Riz91rm4RgEkB2BU5sW1FPmFpYK0CxSen0gYP+IH1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=omTwPq0i; arc=fail smtp.client-ip=40.93.194.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="omTwPq0i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSbSY1aSZKEnWs1ONpijSSTt2n9KO2iqWPEFPKpnDwnMQkX3rZcCMMiBES0FzAyHdFWwv/Uu5v5k78EwjCSJXQn6JsBJXbgUIeur9h9ukULl2j9Y1ZkkrdD3ntYgPZxnukbb2n6XzJX5S/RRvfRhy35goiYuC4+qDoXLkkjRiUOgX3y80TPHOykdCaD/WEYfiNBByS6Rnl3sYq83BfkgkEOo+ABUtqjVWhss/TZSizReF+Wh9W0pa+37fBaVxh6ima969pSDHRwagLBTBhNO7ZjYq7jIxI86MwBiXlhp//XGmT6q1bf5iG0dGdPizB0epRcWvF7oPEtEQmnLbBFG6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toik+hmkxcvUj4xJ3Xm2EiEFAg4neokMEBO0iUWxuyw=;
 b=asAiZc6swPzBG/HpzCsfnk0TKMGvZo3qpAlWVDbZWVDDPTaKGY4GciqdOzdjN5dCISfkKcE7tf67HAy3T8CMSJysyUCZ4qp5nn+mrq+57nLetGrqPUJx1WtzvCk1F8Hxe4caN0Z5UDV6xmWfRHt4aTWMEGJryGQ2PjSQ01FOX0Js7do8Lt23BETOS9AbHKfJl1ZDsAmFSwnEO0kgqWlcNIrQqDzSuGgFApzFRu8w1x/7rLYliU6T9mYF/kQKsVR9DuKrjFbMW3gL81BKQX4p5qju8n/VV6/1r59kxA2NbdEKnfmbapJGSoTK1vdv20um2oQ75Wtkrpv108J/RMOCoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toik+hmkxcvUj4xJ3Xm2EiEFAg4neokMEBO0iUWxuyw=;
 b=omTwPq0izUetBk0g+RQ+nOA3GIqqFuDxaZ7Z3vgja7XtDkn6JG5utR5BkD12+wg4XWnbMEGKssmnWW0y8LpXv7vQb7bR8Y87L0qjMHNV9XtoPDi2mKriNPLYNinYE/US6/rplGsRqI22UZAxGsY0GVsSdDe7vgBEdw4lf/HIyl2WX9th0bEDnCqBCnzevFLslIkNCMHRTnHle8Su8GkWRT93AAJLgj1+SWD7B5iGH7qHSFTUxLxb2S2uqnEceIr+GStjKU87Vz7tYEqHehmf5jQpHPqRe7VQJjcl6UrYqx7yhtp9Kvy8GuIhGZWJ0jSfainu1WE6UiWQ8PhCvQEZQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 by MN2PR03MB4973.namprd03.prod.outlook.com (2603:10b6:208:1b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 14:01:02 +0000
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80]) by SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80%3]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 14:01:02 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v8 2/2] arm64: dts: intel: agilex5: remove usb0 in Agilex5 SoCDK
Date: Mon, 21 Sep 2026 22:00:35 +0800
Message-ID: <e372a28551a6179cdc55f4e406c11cd5c7be437d.1789998962.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1789998962.git.adrian.ho.yin.ng@altera.com>
References: <cover.1789114403.git.adrian.ho.yin.ng@altera.com> <cover.1789998962.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::16) To SJ0PR03MB6581.namprd03.prod.outlook.com
 (2603:10b6:a03:393::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6581:EE_|MN2PR03MB4973:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f87c17-619f-4478-d4d0-08df17e8c566
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|11063799006|56012099006|4143699003|10067099003|6133799003|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lxFf8jAtCb+DOaVNfEf8Ei6sh/12grq0eh6ZT3tHBCjT3KrwLs2ckxfCjcvo+7u25drDCjummGUNe3cPWJkiqDEKGFDjsrX0kvLPW67Bf3D/hrv/THwVuPtpnGEf7jt/bJvJ23ZjgnnOAy7Fe8MUxpJg/uLtJR7K7vsxjvqLNJZQwjZbEYDITSPmajtaWEm8I4gJOw1ctc0r/fJ+ih1/iB14qfUl6eP1sn4BI+eZdjqwX6sP1GeJLxvw9nqN41WX1tTwKnuISJZ+QW8ByK/u3L4RN2ikoMepjRCYYTP2+Kt+ZvSIYXu7oPvzZY2wqjOTG7xi++xcTb2OG+2nTiDGLIgul0X3Kizz45u2QLShI5ZFYnQXht6SSV5/VZGXUhxlg6TjP7PQ+3HMzRMtmAtWmVgo/iN8+nQ/I/ZpgLOdD8KBy1kXuyPFgozOedEjlqej9MQKqe8jXfcjgmpuufe3YNjwe263z6tebNcRiR/LoRnxU5NmhWQhftx5nYcmjppP2wm7/NMl8ix2aKFT93AOy8Z/U9y/D9l5mg0Z4E9/OuESBVp0HmlLQB2053nS324QYQg7iRotGFzMxduh/dRYcDgXz7hVf12d7FuO69zBsMN8C/b9R+VwIU7dH9NbV0jaU9Hf1z3P6/2rN0Y3lYCUvCxD9K4gOOUtU+o673mmt6I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6581.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(4143699003)(10067099003)(6133799003)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zbLPVdDHSJgACRUyZsXIGCaXTh5GoaqJY/gm6SUAApMmU3aayGgBLjuKqpqy?=
 =?us-ascii?Q?YXJqXpOb+Fd82mUU/ooIFDFDIw1n8qEZb+10KjhIvOW1hKbeOKPHN4A5bKvp?=
 =?us-ascii?Q?DH2MPWzLD31Ms/W0TdnQpW3yVvgccLwoYiqiiHZ/AQm/+c+Y0t7bc8ZJ6yr/?=
 =?us-ascii?Q?3U9sq/ya1ROa2n0MNSQLFbFyMUZ90si8i73MhlW1E4h3L7tgnCL3G0Tt64fJ?=
 =?us-ascii?Q?oNIejKZqju1NwB4Tnb3RFV0dJahcUs8ovQ8He/pKfV2mSi9NMKBHf9YIVV8M?=
 =?us-ascii?Q?WzyUr5jG98XP/c+SkoCFz6D+0+51zAlGrrWuuCV8+fo35vu1lPfSboEkKdaw?=
 =?us-ascii?Q?1A2OY+Y8PoK98gCd4+X0tNAUox8Eb7unpMpxRWkTywljvr5+JsfVBFLXmhqK?=
 =?us-ascii?Q?ztPbHpqxpOqoa0tvI9Pp3ogkKLn16AuOGZf9p5/h5spibULbkMYRdNy5I9r8?=
 =?us-ascii?Q?5AxS5U9qh1P2KzqpnuIj6hRikfur+97TXoON5n7btwqc2C96YB5tGDnX0W+U?=
 =?us-ascii?Q?qHZMKpal3yty58J8FdVz76bu/gwGncEjOCQXKdxo8JboUnezTu3c/Gt5t/RH?=
 =?us-ascii?Q?QNK94BeeKbHkU+YeTqihNO9SVfsZ1wLwuRanAiKpR3b5GmAhFDhM8qh9hPRJ?=
 =?us-ascii?Q?6Em943vVPGZM/cEnVF+ACp+9ueCn0VyoUt3fYgiu3ZQ2ZXQIbHGWcZRxzRjS?=
 =?us-ascii?Q?WN+gklvJcmxzRhwmJpH8fYggF4Vv+39t00LA18U+/6+dZHPLkoT6gsHx11S8?=
 =?us-ascii?Q?0jU596RqjhuN5V3VoW6M3ZteMxe1HsoZKKiUNj7caUuyWmLR50RrK3+3yfyR?=
 =?us-ascii?Q?SglclwFUxjGegBrJXODqXvr+FSKCUMIy/CE1bJebO9Rs57NeTu0gepvKc4Rv?=
 =?us-ascii?Q?wzlovBz/P5D1Q8xNkGJ8g5cTbzn5qsKSUN+iSXdeYDlUscV5YXGA5x1XMfF8?=
 =?us-ascii?Q?YzbFXYlh4jKeZNWi1GlDgF6b2oFWB0JzsYu0TBluCw5MPL2vK8yCYr9/0sNt?=
 =?us-ascii?Q?L8RlkHK9/+fa2yD2b19izb/2BHVafi1dBaxEEkEjyg7AYroUrrQ1eqfmfijY?=
 =?us-ascii?Q?mZDdX9exOBA8n7nT0229UCh3xzWvslP+ta8wlgXIHvC1SXfMFqxGZTvSdeoP?=
 =?us-ascii?Q?JJRr9JY2s/GEfWfwCVORMI8llrb3GKm1KKQLEZNr1WaPDWZnAc9GqKCLc5CU?=
 =?us-ascii?Q?AbFsgzoA3wj8ehtcE2e9n3lTIVGYQFZJdfkJqMoyjhSLGYYkNR1IV1IM7p3G?=
 =?us-ascii?Q?W5C6oMeU2YyNXzEixyzN66ZBZQT66DOl+6MpykHTgV6nnnJt0EsO/YyAYO0Y?=
 =?us-ascii?Q?BAT60m+9qeaZIjuyu7SR6bv2NYr/WufhSpczFxWwAG/mCdBIrfQgQbx6mSQs?=
 =?us-ascii?Q?Npg8GNnlsmK8Go47xg/X1K7WZIWRKer3PjqkW9mb2nKOIO9xLYFXuRsq+gHE?=
 =?us-ascii?Q?EeVZpzFeVrY8aZbnsm4QesHqJ86SOSWu/4Dt6QXChUkRFBQA/yGHfJRzcLP0?=
 =?us-ascii?Q?piN/HSJiS19ET6YMWPV/UDj+MPj9G/UMLXL9SkKzx6UV2/CJV/jqcGEUsaop?=
 =?us-ascii?Q?HyrGBl4NX2ZYkawCtpsF6mu7TXo/1epreqEBE4FA4mWRZNnAjGhP2Z2EOm+b?=
 =?us-ascii?Q?F/7FYn032JeTbI6POs1wnBjbMYVTkd6azQAhAPB9s9aCccmWSk2nAIYn71Dj?=
 =?us-ascii?Q?Dc8cnCETTGF1akBLf6VOXK5JXG2RiIXI2TjxM6uZO1sjlazvvyj9/ckLqZQa?=
 =?us-ascii?Q?/tqPKxLiONlUywKzv5Iud2ffcEEQM7k=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f87c17-619f-4478-d4d0-08df17e8c566
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6581.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 14:01:02.5043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2UquaRZWWemfhPO3MRyzBqmWxC++NH0dNHS5W5LVp47bmSsu1AaQPu54F5r0wApUSmvxhTDHT0AKf7bP+pHaT2uUDeihb+T/s+Tj3Ir4mc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4973

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

