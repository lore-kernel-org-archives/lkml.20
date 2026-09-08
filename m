Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010020.outbound.protection.outlook.com [40.93.198.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EF1598BE7;
	Tue,  8 Sep 2026 17:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887540; cv=fail; b=l+hn263jcQCxTL0vBbYXYKdixXRcUgp7bJ5nK0LlhwJ7UqHRHLSG7xvYn3N6+DkLX1D9NQ1BGegDzS5F3w+VbM9bBeZ/qH70xkc9N/P6h4GnYL02n18vGFT4HSoyiukBTnfcmtd9EL1YwnEgBbgd3f3eGFpSIxftFz1d/BRAfRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887540; c=relaxed/simple;
	bh=8XG+oWRMJQ164B8zSo6nkO785ckqjt+45U2RBhzGspY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hgbRkepvmRE0Lk+BZ7485B/sIWNPGZPNmyEn8tp+gDy9siEiY64ZGl4ytcFxZFYuc3680Jufqxda7kkHW/AkkaMmQBcYdSvp5zSkPaH8wIt9X4sTrMJWb5/KKpKazA4ONESsyuGhJ/dI866CRnQti6dDcYwnTORtMUQJ6SPQZf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=DDJkTiZi; arc=fail smtp.client-ip=40.93.198.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="DDJkTiZi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qcnbyrka1AvfGhKDIugjCRCSG35LcOI4of5V5AT7sAF2yKI0FgTBGeR0dRzBafzmTLD7iBaftTG6O+yPVjzITTFaZp7jaAx+uDxPT8OzF3eZBa0vtoVvi52GMtm6h+K6MeE/onwVossRKr9KAofqoOUP7wvRr34yGh2YnDxT4krp37MWLVfGLU4nPjHq+FgKwZPmC4pMF4kLC2LB1ZAeMS43dhCR+SXeD7hueGW5n/k7YtN+Sm44NCPt/Hiv21Q00ZpO++dOyApbWM8lJRXkec/uAJLuSKcd+e/TGm7VBjGvQpQN7wvWYjOCk3Arnp9LApGpCZg+3r80fad7Fun2GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toik+hmkxcvUj4xJ3Xm2EiEFAg4neokMEBO0iUWxuyw=;
 b=rjBHXn/fo02nhLDpX9DDwcD8hofQLSjIr2mPpNbRmDCDgQsdSQk7/uDT3Vvh5ahWl0qbdK78bqzu79iSTN6LndpnyDJEIGWVfM5eIMYy9rBs7kBCZFQ7Er/15IRj58hlwSl2ZVxH1A6l/166dP0fNsQCfLvqlpRnhg+WEKxCuXiXIxv66/8QofAUA3SLYRuppfBRyIcQdfvodfZXryK7+7uUz05mFcNFCMYfP4BHHp4SwVy+KJdbp/DGsmHWKUMZm5gu7/VFvWSC5UAaqqO4WRFgTjv3AnSotdB1pqDQCY71R51mrbg+Z5hGL7W3y9u3hoH2z5X+4QMxG9w6l0CzoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toik+hmkxcvUj4xJ3Xm2EiEFAg4neokMEBO0iUWxuyw=;
 b=DDJkTiZioBEKJSoxQoCgr7PZhbAopqxAABcKhNMqJil4ncYy/YlBbg9qYIel1YGNPhbl044EAV14uOvGgo4kCLSmNkFlduUcx4Dn3sn/xiEewONNd0ltEltIf1dWTFFMi6lqcGDxK6TYLpGCiwHbFV3UoFwfzpkhI+y+MJXouvE1SD0BOzAToxluP219sIdJPN1omXHp9w6gtDMSXplA5kWMb0xe8kCm0TD6Akl/3AYv0pEOJBiiJTDSznlztq9Pf+NHEVEs7IL495Tnq9SVVLBTg6UnshHMKq0y1jbfXmN5PWa64Rnp6YXjRIRLWs7nPV+jlmCrjc2ghq1NJQ6p3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 PH0PR03MB6560.namprd03.prod.outlook.com (2603:10b6:510:b2::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.7; Tue, 8 Sep 2026 17:12:16 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 17:12:16 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v6 3/4] arm64: dts: intel: agilex5: remove usb0 in Agilex5 SoCDK
Date: Wed,  9 Sep 2026 01:04:39 +0800
Message-ID: <6c324c1953c6fb9e217e878bdd42c06bc4b6bceb.1788886615.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:295::11) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|PH0PR03MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a3db124-1819-44e2-3d44-08df0dcc551d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|6133799003|56012099006|11063799006|22082099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	bFhTDxbzYRZAP2LttUu5N+a9ImV086POkEivjbZWxVq8lLbZE6qJ6e+UJTRZlvNocBroIzA4vJQs3zP80fV11fXm7QRQvt4D6lzZkSb58WMdNC2HsGsI7ZfSQHyqiO3cF+cn4slgUYtxg52zuhpab0cf0QlS/IBB5bSep5nCelFuIX8jr9AWXmASZp9KH16sRqBF5edO+e6uBpndkY1lo0KQkLZM5YC6Eh8ZN1CdNwjuJDcIVLteOoQYnfqK7tf4AlvQhDNA6zojOgbP516hOVLcI6JFtGAxsD0Le7AxL1wcrtaGNJwSkIM5weikBpXYhdXmPrIo6kWCoKWIPgBlDqpeN5qExl7heYMlx6C4KwtnFKBhtId/C3cVAt78gkuGr2Zjgx2CRm8G0yskKe/ApK+3KcwgfeLh0yQ07qWQ+l8OT8QyOFm6DtT+U4QbuwHCy4p9i3Tb5s9DKKu7SE9b9bMhyiRl7+WW4fieGThhELugY3opkcICw8HGqaoQaFRbC+wWyn3dFWEFL17L1Wfqw3LPJXtVj8lhso62DSmDzSYHxnALs2GXDSWFbH72Trfd63MZLdmuduLUwpSyzsWqOyDHj4rORafifc8ZoSBcWO0HKTq8AnrPPsbqCdGrwPQg1NiKWi5t51YWndlExhNPbsI9vj4AEMEulXGUCkTa0oE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?prRdwb10wIO1qHRYpIThG5otVhdMazhqfXPfZD5XKnDPwdduFGmlByLf3R2f?=
 =?us-ascii?Q?z2rx4q/iEdYQgaucRYBkEdWJB1wIKlRBsOHpp5d1Gpx1z/E1Mz2MfXF4f/d+?=
 =?us-ascii?Q?4giViEK7IQW64wDByNcpihqV6B+N+0RxM+fwhxeHd142oPP053QYLXzshqeZ?=
 =?us-ascii?Q?hxHJ6dnH/hxIS6bG5nRdPgc3rcKM0H9TD3+cstrZm5fIwWADahoil/B6JMtZ?=
 =?us-ascii?Q?rFNwVCo+WK/7mfTDyyX/VcjrowAvmfq80Qu81N/dDYrhwtfugfvdaplsWowr?=
 =?us-ascii?Q?3Ii5vjRnXe/HG2OEWD92TqwPQ1nxvkk5AIlJo+5K1/sRp62up4BoTEZ309VP?=
 =?us-ascii?Q?y/iNU+0N+GEPDsRdJTxvTjl9kxJVKjvSI+xZ5suOXJqysl4a5uG2hcyw2X2F?=
 =?us-ascii?Q?czcEP9pV2XtsKg0i5yWmQBJqBdrZGg/cyUJ1fWMEU4zgwiQDGhpKMgPvwYb8?=
 =?us-ascii?Q?un+2s1Gj1NQH+F3nLI75Rck78omuQF9iOn/kaJ5G04wAZAs0Z+U962NNrX6t?=
 =?us-ascii?Q?a7ADkR0pXfkGZqmJm3MYvcECjvhbSB39vS1gUSrGzlECaNSvn8iFlDuYi/gy?=
 =?us-ascii?Q?oZnxg/v9VXzw900Ea//X4wwfKjT/IGe9owXqOWe6T4VnuW7o3BfB+myi7bUu?=
 =?us-ascii?Q?ErsJF3JZUul7R25oEBZxkHgQEA9+ZghQsarntBIh2EXj2PGkP0thd5pt2Q34?=
 =?us-ascii?Q?iFwpYLn64NAQpn7a2KfSh0sPFsiD8jkdI2FJ6Kdd1KkwHbun0tAYfz/v+lqy?=
 =?us-ascii?Q?LdabvJdUtTpJHGDaaQ+A8DkthuY2iUrDpkn4wVyJvT2MY7uXtmVNBZD6BVB6?=
 =?us-ascii?Q?dZTnFT3CbSbByO7/82UsfeW9cC8aCi/jqWrZWyavVZT96VfPp0qrAzdEKu0m?=
 =?us-ascii?Q?dVNfnfX0PG2amsBzNB9j9A0c+gqXwLBDMzh9bJnUuIx//uujCQ6dwC0Z1LWf?=
 =?us-ascii?Q?mB4yNfTRU+Ruw1hrPgCfaXsTckSBHps0m3IW2pJJiOr2qIy3TQD8IhOH9/3b?=
 =?us-ascii?Q?kk/j4zoqQLYsPCuXk/TMRQLR6zT6mJygX8i4xBG+dX0sMnJiu7cA820IfzLx?=
 =?us-ascii?Q?EcdXxPy/9htban0lczNL+cJgHeUcuLIAY5ojQFem0nzMzWBX9sgnfQhL0YVr?=
 =?us-ascii?Q?J8QKndGMarGTQJLI8Gc3F0eDltQwO/hrUgzf9W20Lh2B3draLcLQVAJUZ/dS?=
 =?us-ascii?Q?i07i4fgJ84jnIqv/799gBXjku/ftv1FpAcndYwzhHuu5qWK4qgGRZvNtmc6C?=
 =?us-ascii?Q?AAxguUsHQNpWa14Mn650KyN/iXszjuTGRRTmqbz7p/kHE6o07kzTGpmzFy5f?=
 =?us-ascii?Q?aaq82eCfmV0k+OFRJiK6Tid11UyB6jG4zcHNznGs8BbmpI+kA816sZd3skp1?=
 =?us-ascii?Q?alCl66ZIfyIXyURMY1MjGeVQFptAw0QkE6oF9+3W1pqZLBmKuhPXTh5UmfM6?=
 =?us-ascii?Q?pN0IgUu5/XChMltvY/6migJ7bXmerLwuzOoeZhSvQ+Lcoh+4jClFyfiWjt2w?=
 =?us-ascii?Q?fc/q26OPbzmH52q9fZPORaLgcK7oTIJd+TbEivgeey1wxy1VMX1u7N0xfsS5?=
 =?us-ascii?Q?RSs4UA4SBtLvTI5eX9UkUs6wT143NCW2ZNUuJvVo1T7SqZQVURQntlIG286n?=
 =?us-ascii?Q?XvXDzYFGcGKVaFv72ZjgpeQM1dNCTDoA20rEMVJYeBTSH08fkQXfTvrLeTkB?=
 =?us-ascii?Q?5A2zu0bpkA8zPBJR0f68Msmhue+pn+9C4SEIH3TiqswPg0OpCY1DKtBh5NTk?=
 =?us-ascii?Q?P4BFE9CyBw2QA5RAW1YOjvnQLr/Ns74=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3db124-1819-44e2-3d44-08df0dcc551d
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 17:12:16.5720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rOJ2w6oy7rkAU42lLl94NReGw55pKVNQPvz2QW1Wnco5z+c/V++T7sdLbwCOWzyEZDxE6GxNzmhvkN+LE4pgwF920PV3VHqE6Sr3Fi8PH80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6560

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

