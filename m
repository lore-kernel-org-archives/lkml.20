Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7115372E2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172161; cv=fail; b=kF9SR9glhTdlE9YWBWfHUeLaH/agikOxKESEJikiN4aHLxYrLpI6ROycpIq5K91uhCyEGs6tgXMgdhrHsnZTpunUPOl6T03EVqd0Xd+SvJYJpFpOVGSuLErxwQCzfufIw6ZGMf88mpnEU8z9T8akbFHukr4k+cRrq5zFoSHmauU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172161; c=relaxed/simple;
	bh=0aMVqyzlnbiw+3tLUgMvgOWYRRdon3x7idK/AkgvdF4=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=Cj53r1PtTzlxYZyp0UW/s4tW7EZl6O1MnB166S+OK5c8W4wcMkRvwku/O6ThHMX5DFCokYgAtbPjF2xkD27KCk09arHCG+L1aOnDolMJsjRc4IOWzUJ0yMwtJdf3HmhSX+SAraTYf5ZqfsSDgYgs7UEMQbTh3oOtY+PaSOIYGNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=bm9M78s7; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="bm9M78s7"
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NCpGqO2936813;
	Wed, 23 Sep 2026 10:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=Yo6RdG5pvW9RajtpplPL8adBtGv
	s4Wt5v4qZaQxWJJk=; b=bm9M78s77ghRzVzX7chjKIfHk2gNuQNbDr4erXwXLbk
	uOA/onuOeyN4R0Z5YxtWow+Ka2cV4X9B1zCNpMntQ/9DeK62brI4M3+9S5MuU7TP
	4VveuD10dkFnBZuRS124VaOP+I67oOqyGaZB6gUxSaBuhyROZY8dzJsz8ui87qNl
	xlC7GeG5RSoxYYS8aN73CdP39HpTCIxsdOt7PPJBdIjR2ed3/uLi+UTL/JKC8+ww
	r7PkLHeedMizMnPfdZ8QX8RjPWdpNamOyJgEokr0x4sodwlLZOcp5X33dxMUrfPE
	mRtYoF48gFWbwwAtmBSq2Xy3F4Ou6HPBdMiTs2DZp6Q==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010046.outbound.protection.outlook.com [52.101.193.46])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gvagqsna2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 10:02:24 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ju1KzGKDSKVyAdgfuYLkEqq0wRmTFRBLQx9HyzxRN+QNH8UJTyL4fDaIiKzSYHlOPHJhcEPmWYqw7LA8+D4VJgzVBPkxnT40D6CZfgLmpyXLZEXvRq78wz9uta8vh+VlItfmlBGIaIGA89F8eU8lyQRGX4wxxBt8hcNrB3/GsQjCyJtmrGvBku8ibdXdlGLxBWaVXSE9vE6IXrDTlcSnPRLuaKvb2fX5BV9at6dhyOgzVSMsv6VCdhmhks2qycA1Yd/4CF8EqQqC0N/liAVyCNQvOU1/enfMdb3YBcFct1aCVwvq5HnEx/Zu/aEI2+tYE6HoPItO3l+YOP6ggkV/SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yo6RdG5pvW9RajtpplPL8adBtGvs4Wt5v4qZaQxWJJk=;
 b=HJA64VDlHFfcBHNh8GKFzSAqKzsh4wB0lJVPFt8bcpBSUet9Bhe6dD6AptZh+OzWAWHLtY+SFDr5kSSeOfIx3FqefaAm9WCiqDBfXaBhp/9S7lu0EueWMzXl52/gx057ktfK8+qCmndCKCbEqD7ITcYDMXDwRjDbsIR5EXX8Z4tSO2zWO6ckIMX+9+fGyrPbbz0AYWJBC/Xn3o5AVqrkNf1dtP0pR77U6K9OQHbq2YWHEqA9UPCLAD+Wm/UWsSleY7GAjUSPCSFCkX7WvxsaLKOhb/XcuF4XWskEuxGiv9oJfzVZJBqfhUdbTdZxDVOLk8mXsqrDYSNJQeJFDrylYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by DM6PR03MB5004.namprd03.prod.outlook.com (2603:10b6:5:1f1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Wed, 23 Sep
 2026 14:02:21 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 14:02:21 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Wed, 23 Sep 2026 14:52:29 +0100
Subject: [PATCH RESEND v2] mtd: spinand: winbond: Add support for W25N08LW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260923-mtd-nand-new-chip-support-v2-1-f8bfc5754620@analog.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790172217; l=4487;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=0aMVqyzlnbiw+3tLUgMvgOWYRRdon3x7idK/AkgvdF4=;
 b=8bh3CBExn+vtZsgx2TmeAjTGH2Xim8q0Ryh9YPaAvrdTj+vbr/t8IMh3unIx27JhLwGrCZj59
 KJMWe3uatvjA74u6InvBz+Xiq7mAvxhjbVh/XJP+tA/xo16E030HLZ6
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: ZR2P278CA0084.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:65::8) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|DM6PR03MB5004:EE_
X-MS-Office365-Filtering-Correlation-Id: bb39b6dc-44d6-41f7-1c47-08df197b4989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|6133799003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	CvmMYXdPuUiorAC+njQFOwctObtDpTbJlH/uJm5QLWEHoyMqwMiud534R2tPcv/ljXCFS/05EzZZxZCKq+YMuhpv0jn+V2ABXL0GKNXEcbRTKPePwLboHEILKofGWQoJZ1mypcm+m54I18fWmrWwZLgB6Wb/9J/aYbakQIxQAiMUAWMVvFi8a21QDHNMCX+fMd7FaDRgT57w7edVFpPocEqkCW279aBcf7wsJONM0BJdCdHLRtIPn+xvzJ6Bw9SFUKrWU6gtigVFe2CyMvLbSWE7d8nQM770EGpURDHEWZ5myHLuSDO+srJF+ThCi276cy6iAtAKAex19ewtM/E9wG72LFsMC4dqHekuNLKQBwIBPkaSV/+2Xi8nf9qq1qpCQyxs0ggHjdbC4TM/ypB0v0phPhyUWW5ixvgMTx++VZBTUAAVbamFg7Io8JD3x+Z0KaIj5RAvtqPN2UvShIBNAZaaMapahje7kUq9+hy7hBmK/bSqmEgxI3oLA8Rar8AaXGcT7+d5pn1T5XRe0iIVAxNHAC8wL+89K7Py/FitfW1YDmH8CptaNZcBukCT6XZPyFjKlCeiTNCnZax5skErmA21qtNP2uXN76gjM9y/zA8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmVBQTBBZ2RHc0J5WDBDOCtoRzdOQk9UQXhGM0pLc3psQXBWVGR0ZnFRMXpY?=
 =?utf-8?B?Ykp5c3lNVzBVQ1R3aGloZGZta0R0TlhRRzlOWC9PbU5ESFJ5TWg0ZC9HOXhU?=
 =?utf-8?B?VXE1eEpZS0hOUTV0TEl3bW10U3d2bXRXRTZQYnp2YmN3blF1OUVqdURlRDk3?=
 =?utf-8?B?RGNVcWNYcTRSVFcwRUx2L1cxRTZxeU04NFVQWGYrVlhlTkRBd1BETkIzMTBp?=
 =?utf-8?B?VFhJaytVc1V6cW1HMWpPOThBTE51TGJKRkFQWm5CS3g1VndxWFB4LzVTT0wy?=
 =?utf-8?B?V2xLcmJpczU4dkZ1dFB1bE5SZFIydjlocFY2aTh4Y2VpTCtTSk50a2dqc1VU?=
 =?utf-8?B?S3NhM3RRYm5pUnlZL3ZXYlVXQ3VGU1JTeExoa1QybDBFb0k0ZEdnV3dSV3lH?=
 =?utf-8?B?Slo0SEhiSWQxSGRUU25BN0plSEluMGFXTnFvZ0dCaVRaL2FWUnVRb2U0cFZV?=
 =?utf-8?B?ZklpbjZIOHlPdm1GNlFCaCtRNDZibTBrT0VmNEc2NnEySU5aMW51VzMrOFkr?=
 =?utf-8?B?RVNlSzQ5TE9EUmI0NlExeHFYSUMwMzRUR1dzMlg3WlFOakt5cFR2ck52ZytY?=
 =?utf-8?B?bSt4blY0eWhFd01ZUG8zVS9QS01vVXJMUVVtS2ZhaGYwcEh0M2MyZXNPSCtL?=
 =?utf-8?B?VjRxOUx6UkdNNnloYkQxMVJ5eGNkQ0J6Y245bzhST2VHRkxrY2xUdExaYkxO?=
 =?utf-8?B?TGVoeDRPaTBpaDJGZlBram9kaUNxcGZCU1ZJMURRRlJiUUZiamVwWU5GWmdp?=
 =?utf-8?B?WlFtL00yeDdPdUNyY1Q3OUJKRzRtaWlsVlFTcEtoTkRnd2s0dDVPMWlPS1A1?=
 =?utf-8?B?QmxMRm55d2ZxVyt6MjUySGZHUFg0VGNIeWp4My9nM3EvK2YveXdFR1VLQ0ZM?=
 =?utf-8?B?RVBoUkdlaFJMODNSVy9IbWhISHVxMGsvVTB2dzdSbU5xbG1Lci9saGdqbE1U?=
 =?utf-8?B?aWtXWXRCaFFQWE5nd2ZNYkplbGpKZndsOGVsQk9sQWo1MEUrdlpLbXBiT0JS?=
 =?utf-8?B?S1I3ejdoby9Vd0ROVjh1N2VydERSUU9tWmVCZDdSK0UvNUp0OGFhRWFKNlpY?=
 =?utf-8?B?SUtESnYwTGc1ZjZkZW0rSmowYVhBMlJDRFVIS1ZLbjgwNEwrTE8yWjEvYkJi?=
 =?utf-8?B?OEtsZnltU1VVblJRdzdBNnFtOW1GTnplcFNobUJwc0xlYWtXUGZNbVRJaDJz?=
 =?utf-8?B?aDNuK3gwcjlmZkJ0Ym5sOVlxbG1aWDhWY2pQV2g5VnB4UDVnc1lwaFRYSCtY?=
 =?utf-8?B?QStLVGVKdzJYUjJJMlFDaEZ0OXpiclJGazhtQ1dRSmRjQWQ2UTFnYnp0RmZL?=
 =?utf-8?B?Yk91TlQ3Nm0vQjh2aW02OGNXOE5nNUY4c2ZoSDlDTTQ4ek9yQmtOTy9ocjM0?=
 =?utf-8?B?V2F1V1puSVo3NVBmR0VJOVJwZ3YzQUZXU25KODMrVjZvOEtTUVRNZ0Iwbjh2?=
 =?utf-8?B?ZUozaXh3SVRHUGRuWE9IUVpCVFdiZ1BuREhOMWgzeDFmNDMyL09IM2VzSThS?=
 =?utf-8?B?Z05UQlJLakJBeXlVZUM5K2Z0K21LSGVXdFpWUmh6ODZ2STcwM0g0NjN4ME1a?=
 =?utf-8?B?QmphU2R0eC9KbUhpQnlPWFFwbVUrVlF2OWFVeGdNbHdpTlgxQVYxazU3cVpk?=
 =?utf-8?B?RmtoRjZHQmhONjdleUtpQk8rblhOcWxscUdrSW92L1A0Qk9abm10dkQrWVRE?=
 =?utf-8?B?eU44VE1PSEZyYXdMY0lEZFlFOHJBeXllNytvS2o2RHdjTHoyRkNKRGU1enFW?=
 =?utf-8?B?ckV5akg3cllFemE2ZlBjOFJxV1pjSzJGcHMwUGk1S2ZiNytqdmNmOTNpNjVv?=
 =?utf-8?B?eitMYVdOd3RNaUVKQW1KUHJYcmphNEh4Yzg2dWtsQVc3dStwb3cyYlVnRk5p?=
 =?utf-8?B?U08rMjlZQXhNYTc3SElrWE54MjFaM1ZwMWd6NG5vaUZpbXI0V1prOGZLNmNK?=
 =?utf-8?B?cmxGSXFKekh3NFl3V0FiVStlQzN4THdIOFVNSHVrWjVaZEFPQzdrUWNENmw1?=
 =?utf-8?B?WnU1TlVVZlU3eHVoSGtETXJtY1FpZko0ZThvRmNHcngzREhIQVJVMkFoK2pW?=
 =?utf-8?B?VWlvRkkvanlZREVSWnZEYzlPbnE4eTJuT1IwaGVhakU1WDlvc0hxbSt3LzNL?=
 =?utf-8?B?eno2eWFKOVM0OGVybzBZdEQrZ3VXMFdXZW9RY3k5ck1hWnRRaEkxcVZ5dzZr?=
 =?utf-8?B?S0p0aHZtNzliM3lKa05HNlVIM00wcElIdGNCQ1lFR3R5V29CV0tJVU5Ybmsy?=
 =?utf-8?B?WXRpVC80UnpqQ2ZvdTUrNFhsVHY4SUR4NWYwMWJMSVUxRGg1RXJjR3JOUHlK?=
 =?utf-8?B?dkx3WDRpcGo0MDBrSDZxOHY0azZ1SHh4Y29yS0UrbzVzcWxTWTdBZz09?=
X-Exchange-RoutingPolicyChecked:
	v6TLcjOt9fx2HB8ZlJHVKJKgk7V2kwuFGOwKPs7zNDRB7pmnG4GJFjpxtS8C6FdU+3neo8OAVZl9MUxy9K2JhkJGmL77RsK/+RlHFqddqRgKaUGbSGKB45rFo9qsiMYop86y3EkgkP15l0s4LX9FcuWMilHEZKc+I/tOw006N7O+DfHHPb8XsYgBkupp0MwSclkytM6k933qcGTJhtgJNbrAtiYQmyLPVIASnCk/PY2Cylg05ZH5Q7RlAdoDKg3JafHr9S/XFS06drp0n7xfyfx//ZOoixEL8l8nBqNvRMt8MRC4HrlH8MLqpjb6TkN8hi5FYDrzrBGjzribPnySEA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb39b6dc-44d6-41f7-1c47-08df197b4989
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 14:02:21.6792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emU+rlDWpDGpdFdeTGshUUjglolpLNGM0BiFwaiDKitTxyefgmRS9Y3i6bIbsmwgriXFpRfCJ8PKejrv0auvDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5004
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NSBTYWx0ZWRfX1HmNXqhrbOTL
 WvcIS9LSys5aRUbnzUZrhD8Zpv5V4569tqV/f1//JQp9/qgwzkLH7bWakQtzAe1dyQNy3hHnytc
 TqQo3VelFeFS4qCgYbHuTL459Nq5kSKLtCYMuwqI7xVP0+pv6es7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NSBTYWx0ZWRfX/vwQ+a/uJf9p
 PkMOx43hEM88JrKgx+pF9WeF4x+FhxaL+IcnHdDKgSqSEMMi0QJxQs0Fat39HzUl+pGtV14gMII
 rQcMxvbOfncwNOF+VvJ/+gi1cHF70SsZeTKfP7lcB9FPa4dNkE4/LNTgd8H3qeMhhRmqJpG6Tv/
 DCSdcgRLX3/aZYBX29OwhjoEtW4ArzxDxuV22fDyKZ0z/itXyXizTZKkjtEv1HP+ZxlyNbBotnt
 u5Odm+PlVUbl2yUVlxEVBHQTh6eVp0eWkfzwn6efQx1+TCGjVBRJ0n9vr1td4+Abw8U5t4IeyRC
 WtkMRofajIzbAyByLFevPe0dwAkcDiPwzkoHeEX5c+cdXHrXUq3Fm+bi7Rvj9farKNTPcLYFubv
 PpUVi2fhuOUMxyz1IliBSlC3RMa3xgaqlInj472Tw0uZJgN4qe0UmFHqqVEYhMSkqpEVj4ZUvSR
 aXjSTB6yMXHKnr6/o/w==
X-Proofpoint-GUID: M00L6YHLENWmxoLuJV8SGCVw4PB9KLHh
X-Authority-Analysis: v=2.4 cv=TJDQ2Fla c=1 sm=1 tr=0 ts=6ab3dbf0 cx=c_pps
 a=imb72M7KABO0D7Cp285+Zw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=iZSIUCweCk2Oy3QsdGPA:22
 a=bC-a23v3AAAA:8 a=gAnH3GRIAAAA:8 a=C8gYX-aa70u0wLh4TRIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: M00L6YHLENWmxoLuJV8SGCVw4PB9KLHh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230055

Add support for the W25N08LW, a 1.8V 8Gbit SPI-NAND made of two
4Gbit LUNs, with 4096-byte pages and 256 bytes of spare area.

The chip reuses the KV ECC status helper, but needs its own OOB
layout because the geometry of its spare area differs from the
existing Winbond parts. Only half of it is visible while the
internal ECC is enabled, so the ECC region is reported as
inaccessible and just the free bytes are exposed.

Assisted-by: Claude:Opus-5
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
Changes in v2:
- Only expose the ECC-protected "User Data I" bytes in the OOB free
  layout. The "User Data II" bytes are not covered by the on-die ECC
  engine, so they are no longer exposed (suggested by Miquel). This
  lowers oobavail from 126 to 96 bytes.
- Add continuous read support: add the continuous read operation
  variants and wire the chip entry to them via
  SPINAND_INFO_OP_VARIANTS_WITH_CONT() and SPINAND_CONT_READ(). The
  existing Winbond continuous read templates and the W25NxxJW cache
  read enable helper are reused as-is.
- Link to v1: https://patch.msgid.link/20260831-mtd-nand-new-chip-support-v1-1-dca9f63ac0f9@analog.com
---
 drivers/mtd/nand/spi/winbond.c | 52 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index a1807fa9ae03..810975808c97 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -211,6 +211,13 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0, 0));
 
+static SPINAND_OP_VARIANTS(cont_read_cache_variants,
+		WINBOND_CONT_READ_FROM_CACHE_1S_4S_4S_OP(6, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_4S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_2S_2S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_2S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_FAST_1S_1S_1S_OP(4, NULL, 0, 0));
+
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_1S_1S_4S_OP(true, 0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
@@ -365,6 +372,39 @@ static const struct mtd_ooblayout_ops w25n02kv_ooblayout = {
 	.free = w25n02kv_ooblayout_free,
 };
 
+static int w25n08lw_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
+{
+	/*
+	 * With ecc enabled the parity bits are not accessible. So we can
+	 * only see page + 128. Without ecc the full page + 256 is accessible.
+	 * To make it simple just return the area as not accessible.
+	 */
+	return -ERANGE;
+}
+
+static int w25n08lw_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section > 7)
+		return -ERANGE;
+
+	/*
+	 * Only expose the ECC protected "User Data I" bytes. The "User Data II"
+	 * bytes at offset + 2 are not covered by the on-die ECC engine, and the
+	 * first two bytes of the section hold the BBM.
+	 */
+	region->offset = (16 * section) + 4;
+	region->length = 12;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops w25n08lw_ooblayout = {
+	.ecc = w25n08lw_ooblayout_ecc,
+	.free = w25n08lw_ooblayout_free,
+};
+
 static int w25n01jw_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *region)
 {
@@ -810,6 +850,18 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
 		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg),
 		     SPINAND_CONT_READ(w35n0xjw_set_cont_read)),
+	/* 8G-bit densities */
+	SPINAND_INFO("W25N08LW", /* 2x4G-bit 1.8V */
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb3, 0x24),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 2, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&read_cache_variants,
+							&write_cache_variants,
+							&update_cache_variants,
+							&cont_read_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25n08lw_ooblayout, w25n02kv_ecc_get_status),
+		     SPINAND_CONT_READ(w25n0xjw_set_cont_read)),
 };
 
 static int winbond_spinand_init(struct spinand_device *spinand)

---
base-commit: 7e874b1750a40f3dc9a629aeb72eba09c77f77e9
change-id: 20260831-mtd-nand-new-chip-support-44b10657243f
--

Thanks!
- Nuno Sá
-- 
Nuno Sá <nuno.sa@analog.com>

