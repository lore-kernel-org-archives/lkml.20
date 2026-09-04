Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010013.outbound.protection.outlook.com [52.101.69.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AD150EBF9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.13
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788543758; cv=fail; b=I6EK12v7r9lOPVN4v2FmZXQxeEc28le5NJLxOeztzw1PUsf1y6kMsTwnuNhlGCEDdoFbEGlIpy5L8nAJwshB8qTKPxntJocbR/s32mOsqa3SHF6ztPVzckcUlVEwxNKpRrCsXnvWDBiQWpRB17gP2L18g56ntXOqW7yuLYTKEIk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788543758; c=relaxed/simple;
	bh=aYc26ChswgA3UhB41JqaA0THOjYfo2J8/vwoUra4gbY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Dh0t21NaREGOF5e03yypjKK7nhuIlUzfskvpFgluJVjJsIdrEnwht4dBR2/8TVGrJFA3NjmLfWQLTrFVqfcczOXzBeuwx4VATb6JmbTjvUQaQ6MFjSHzD0Iiwyjl+48gyuPbNfLS8+PBp4pDBqAgPVMQ6uqov2iiiwv3+eKY0A0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ruHISp2F; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ruHISp2F; arc=fail smtp.client-ip=52.101.69.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ruHISp2F";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ruHISp2F"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=K2dvY8MTU+2pgfuL04Iap7Z+0XK8gDTDw8USMKfVBgPUMo3e8eXXq9J0i8iqE8I2FX8HAZS6RhAC1pgIwd+IqNvQwNPOLY2zJo2/hyNn3eWf2pjdSGb4hHJOd0tX9hu6zBuf/rIfn2oleZ0uZk39tJG9s20d82uq+1Q37k4LOeg2UMJAea8MPdmO1u2+BW5EHpAdcXW60WHwM62IUOyFzbjIr2NJ2w12Ae3tKWBKHqQMW6zx48QifeCyd8O509ropGAv75r21p1T/lY5DvinxLUd8LO/H8GzPeYpxTw0LNHf68JJin8Ih1CuyHMkk2EGldrSmpxaCypC1Z8aUEJ74A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lzWD90kL5BoSigNyt4Vqt/z4SY3LqcMQEUdJ4O6d5w=;
 b=Ss4NGde49xZLmidF17KvtUtcojEoNuku2cTYNtFu7Hl/Z20gXTF24ZYcyKhkPHJTRPzqdH0Kkl8YdKDwaiyrvKGLXFa8qeTBOOjaZuK7t/xeWrq3ZtLHJXcqhJleb2APyjruDHawEK/QCk/eZIUvBnr+NiV79fLgzCmV2naEsPtZtalr3Cqhz3BtX9ZbDs8IH9YeiXPypmtA5fx6NQ7c4zllVbF6oWHtsQ9G1fMbepvBo7irKWTlLM7y7dcSvxxSrm/zBTjZ03Mm6TOuBukG5ZkZ729PBcMzP9mteW9kJ4OVcb8703E7+zpN9+n4ZJ9DUtvRsW79ubPVjD+2k6ktsg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lzWD90kL5BoSigNyt4Vqt/z4SY3LqcMQEUdJ4O6d5w=;
 b=ruHISp2FYmRsygfzLeMqp8J/9X/OSUslwaxIh+uy6ZvochA52fVT0O3d8QHXAuYOS1Y48aydS/WRzcm/EQerBJnWzltfx1oKPyxY72n3/lhUoyDd9PqMiTN87o6XKq+K2aFyjvslUDUvXWFiZhLmQa68oyyYbnArwZPtaNNMoAA=
Received: from AM8P251CA0010.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::15)
 by AMBPR08MB11939.eurprd08.prod.outlook.com (2603:10a6:20b:762::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Fri, 4 Sep 2026
 17:42:29 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::74) by AM8P251CA0010.outlook.office365.com
 (2603:10a6:20b:21b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 17:42:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 17:42:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OAyg/Scvkmq4+zRNjVs+txzJZ66ZXbF1kYNvHJf3H59mEofww6kHa8QLQZQrtxeJElV8gAfhZVvli0EpVg1XQY5MGEpzX8y5qgAcWjv7bONn/NmtUqqEWfq8JH+AjxHNScJhRP443S9/jsqJ24KyHGxI90vEnbf+P5pjFGQAEtnnufgFtLzA4Vn/Sqp6y2V2fQy+iRcdSMsoNY0ci2mJefA3pHpDzliMu9coIJTTMXor6s5eUib2KFlrph1KT2m2GtHBOURNFd9CJcqYNZSYR/6VFhk9liEBBCf/g156iSUcF5ykHhQDKYwCmSdzT1fF+VvnOJyLG7HWf4XJEDQh2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lzWD90kL5BoSigNyt4Vqt/z4SY3LqcMQEUdJ4O6d5w=;
 b=caVeyBtF5aDNLu0dMi1P1Y3//FMCPk486TKN9qEhFaT5taRXCQFqBH80rxUG4gFuppliRTMxfZy+UihvlM6HwFs11k603zJsEPzEMFr0860/n7N67iIW+Ly8BIjPhwUr4nc1hzXD5eqdadhDKg0aK4+ZCauJPOdgJLxkUAM1cp/MlwAs+dsBAoL0ovcg2XPhzxdsJ2JPi6abDeqJNJpJ/8hFiwOFRWEvkqii9DFcJiPS30Bgku/cBguxTEXg0ygOI/la3rQkk+ylqIpYe7BxIMtskPGjJ65/VtZwrPhwSiYxk0cIhuY/VMzJQK8mxACFDdlLveZde4ARVfiKvgt3nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lzWD90kL5BoSigNyt4Vqt/z4SY3LqcMQEUdJ4O6d5w=;
 b=ruHISp2FYmRsygfzLeMqp8J/9X/OSUslwaxIh+uy6ZvochA52fVT0O3d8QHXAuYOS1Y48aydS/WRzcm/EQerBJnWzltfx1oKPyxY72n3/lhUoyDd9PqMiTN87o6XKq+K2aFyjvslUDUvXWFiZhLmQa68oyyYbnArwZPtaNNMoAA=
Received: from PR2PR08MB4889.eurprd08.prod.outlook.com (2603:10a6:101:1d::23)
 by DBAPR08MB5574.eurprd08.prod.outlook.com (2603:10a6:10:1ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 17:41:56 +0000
Received: from PR2PR08MB4889.eurprd08.prod.outlook.com
 ([fe80::8bda:5986:a1f1:cb7e]) by PR2PR08MB4889.eurprd08.prod.outlook.com
 ([fe80::8bda:5986:a1f1:cb7e%4]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 17:41:56 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "tglx@kernel.org"
	<tglx@kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] irqchip/gic-v5: Bring up and preserve the IRI link
Thread-Topic: [PATCH] irqchip/gic-v5: Bring up and preserve the IRI link
Thread-Index: AQHdPJStBUU57AfeV0KphLKfP/liew==
Date: Fri, 4 Sep 2026 17:41:55 +0000
Message-ID: <20260904174150.75945-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR2PR08MB4889:EE_|DBAPR08MB5574:EE_|AM3PEPF00009BA0:EE_|AMBPR08MB11939:EE_
X-MS-Office365-Filtering-Correlation-Id: f0964be3-900b-4391-f53a-08df0aabe439
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|11063799006|10067099003|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 X0pFbcd9CAsamVWFjqfLPv85ishJY+gt4hhbKD27QVyCJXvZ1cZ55hXQUX6VxS0zUwQJUA+8/t9DedAlQJ8DmJi54YSq4r6A0z+XbRNwG+H4oxUJibh6JxxJdVWBlisSNaIZjq06vtjbZJUSxufKvpqPmRUOfYN3SzRQtm/EMSBFSZ4n6QGGdzi00Sg+Y31ZnwDsgdEjMD5sH1qju4fBDlCo+G8QI7TINE2vyIztgUOBZ4084P4snpieSbzyoTu3KN30UJxif/PAQzvy6/zKmsvWGugw6s1TJj6QAA4KN+ns0/QuT2OlmW1ipcs/HZ99fVVrb5pCWbQmz66j782VfIw38A7kCi3dGzU1cf2P0z9hU4eZe0TSpjgIxc95LlzjvIk0pflAu0HI1qrPbQd8us9FeaJagg7HDhCVDXY6U/NZu01fxGfYZzUzuo2z8wmNpuTsBu8C11c/UQbSDiT7Rbe/gMDkYk4CtlAAIhWPr6aVIplKKh0sCcEzKykBSPg3o0Lkdro7OC7S0oIriORfCMAobhQt8qoMclwfuxi+Pv7bkkbRBcZhUiCL92F7WyTyS9zLDBgnrTotD6F6jO0TdANkFiiokJd+PPu4TBVrTKt6yCZBD/nrQPS4JPR2Afv3gzzrwihVxg3+Wyn2UKiCboiMRLaupZUozfLNDChn6ZYRPxShjKpHSRrIBCHAf1WgA6Q81Fs/0DT+2JkS8Gdn8GqG3Ha/Gr6wjsTW53Nf1A8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR2PR08MB4889.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(11063799006)(10067099003)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 aFXIJA4bG8JbY2gAVEPJ3cT7KI3AYrnzBRGaVZQkabq9UeweEF2wEU9bbBqYmPkwXNXVgbybVw0yndEwuThZmeHsfAd7oUXXxrOrqP8wLhokgQO7iN/X+W0n387nqVw8zEk2RhdwAPYmtNFBwdOMFkFQTZ7wLy/s7VPC9uDnPBGpX/sWKuJvCBmBH1yM0N3VgQ8xwLEgpU56fwkuo8So2E8CA82Y02tXqftP/2caSyznkn8NDlgXYHxKj1LVdn1pzvfZ2BiRf8MYcKpIktxi5f2q0HwbH+fQRcq52ApWy/uM+jYoPEa89XzQPDbP0CcbatlGKt3z9Xu/7p8kM/2tCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5574
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4b545e95-0f0f-4d6b-dbf8-08df0aabd04c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|82310400026|23010399003|1800799024|14060799003|36860700016|10067099003|6133799003|18002099003|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	XugSuP8cjwvPrwWtd1Kbz5v7AZR2ZB9rULQiFAix2m8rgtzOEBDBYbbpGf6XqshjtnHRcZnO4T9lVvY0mlav30dBJ5OQpgKF4s7A4uMpRVhsZ+IiFN7IeX12bdQZHIsnbTL8Kc2wAv08IbWuXATNOWy7LSUxKhOYAjR9/YNJyfKAGAeoK4nhjT1cnwdGHRAQJLGoJUVg8deOxqa4zNDjnrByKvXyV9bKp0aATqPmxIxI2n81xfyVSHgrUHvo7QhtX6nqZpEvExGqC67zk34Vj2WWbqLTh/aRd+Bqk9RkyX49kBS3TxEJU9rDivK9jb3OPlMvUayneEG2l0McMfdWQkyPUVyha0dMSJqiqS0b5T3uYEPpTvS9LeHzAvRRa50nApo1CmJX75bSxh7b3LqX+Zo2xW2eBE21we7hXEQxlQc0Iq20AGaVoojDkSMnKWfHCKql6s8hiUWYNx9RmYF3jA49pGFeflhTdmLAc4RCuCEiAyaceljF74AMPZOCQ7GBNu8M1F52+mSGY0pSXCqkDmaOCP4PCewDnr0NTtbqNzSjx658K9upDMQozYhosrswVoNUqRKQCPRV3mvy1jnBPTORInfgYIzqB1vRE4N/nOo6V2T51M0LG7kkVz7FPBN5YchWKMyFicVpPF9hVLzrkhxQNy75YCu35i247CpvKLM=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(82310400026)(23010399003)(1800799024)(14060799003)(36860700016)(10067099003)(6133799003)(18002099003)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EYGu/zW6pWwWlZAONWNLi8biJucI5Gm7JwkBZBovJ3wHwIWxUbh1Uqu0q2rF8MUNHvyrLeaIrPVBgi7u8FxTmO53ABg5HbfsXTYiyBffqCpNwO+q6n4kViF0zrPQ37PH2MIgNb46O5fl2Oim7MAltqGnQVSw0U7zinngqdm2cjRdz1qGJejUYJgvXPcjjT2N0oD+IROu11MpqNnByyqwIuc2t6vHyodh1Itpzhq/aFKeQitHDlsbRmgnRHxERxeb2OOAbg3SAIMOX++FKRfzn8UOQ/sMCPrmkr5pBxrxQDOetNeHVD4NQtxUtWWnDjBop5u9VOhkKGuhTofyZl0ave1dxFuHUkRh0VCqCKGe6wQ0tJKrhKmny/HkpAGsiPYTWJVz0zsph2ylsFXNQyVPc2RdYsul6SBRAUKWPyu9S+9Wl660mlm2VSxrQGxcfZaX
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 17:42:29.3641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0964be3-900b-4391-f53a-08df0aabe439
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR08MB11939

ICC_CR0_EL1 controls the link between the CPU interface and the IRI.
The driver currently writes absolute values when enabling and
disabling the interface. When EL3 is not present, this clears LINK and
can disconnect the link. Moreover, in this situation the kernel itself
might need to bring the link online.

Define the missing LINK and LINK_IDLE fields. Use read-modify-write
operations when changing EN so that the existing register state is
preserved.

During CPU interface initialisation, set LINK if it is clear and poll
LINK_IDLE before proceeding to enable interrupt
delivery. Propagate a link timeout through the CPU hotplug startup
callback.

Fixes: 7ec80fb3f025 ("irqchip/gic-v5: Add GICv5 PPI support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260807121703.D4B7A1F00A3A@smtp.kernel.org
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/tools/sysreg      |  4 +++-
 drivers/irqchip/irq-gic-v5.c | 33 +++++++++++++++++++++++++++++----
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 94bf065c8ac71..e2d37ee221b84 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3761,7 +3761,9 @@ Sysreg	ICC_CR0_EL1	3	1	12	0	1
 Res0	63:39
 Field	38	PID
 Field	37:32	IPPT
-Res0	31:1
+Res0	31:3
+Field	2	LINK_IDLE
+Field	1	LINK
 Field	0	EN
 EndSysreg
=20
diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index ac2d423b17239..4669e40356eaf 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -8,6 +8,7 @@
 #include <linux/acpi_iort.h>
 #include <linux/cpuhotplug.h>
 #include <linux/idr.h>
+#include <linux/iopoll.h>
 #include <linux/irqdomain.h>
 #include <linux/slab.h>
 #include <linux/wordpart.h>
@@ -974,14 +975,16 @@ static void gicv5_cpu_disable_interrupts(void)
 {
 	u64 cr0;
=20
-	cr0 =3D FIELD_PREP(ICC_CR0_EL1_EN, 0);
+	cr0 =3D read_sysreg_s(SYS_ICC_CR0_EL1);
+	cr0 &=3D ~ICC_CR0_EL1_EN_MASK;
 	write_sysreg_s(cr0, SYS_ICC_CR0_EL1);
 	isb();
 }
=20
-static void gicv5_cpu_enable_interrupts(void)
+static int gicv5_cpu_enable_interrupts(void)
 {
 	u64 cr0, pcr;
+	int ret;
=20
 	write_sysreg_s(0, SYS_ICC_PPI_ENABLER0_EL1);
 	write_sysreg_s(0, SYS_ICC_PPI_ENABLER1_EL1);
@@ -991,19 +994,41 @@ static void gicv5_cpu_enable_interrupts(void)
 	pcr =3D FIELD_PREP(ICC_PCR_EL1_PRIORITY, GICV5_IRQ_PRI_MI);
 	write_sysreg_s(pcr, SYS_ICC_PCR_EL1);
=20
-	cr0 =3D FIELD_PREP(ICC_CR0_EL1_EN, 1);
+	cr0 =3D read_sysreg_s(SYS_ICC_CR0_EL1);
+	if (!(cr0 & ICC_CR0_EL1_LINK_MASK)) {
+		cr0 |=3D ICC_CR0_EL1_LINK_MASK;
+		write_sysreg_s(cr0, SYS_ICC_CR0_EL1);
+	}
+
+	ret =3D read_poll_timeout_atomic(read_sysreg_s, cr0,
+				       cr0 & ICC_CR0_EL1_LINK_IDLE_MASK,
+				       1, 10 * USEC_PER_MSEC, false,
+				       SYS_ICC_CR0_EL1);
+	if (ret) {
+		pr_err_ratelimited("CPU interface link timeout\n");
+		return ret;
+	}
+
+	cr0 =3D read_sysreg_s(SYS_ICC_CR0_EL1);
+	cr0 |=3D ICC_CR0_EL1_EN_MASK;
 	write_sysreg_s(cr0, SYS_ICC_CR0_EL1);
+
+	return 0;
 }
=20
 static int base_ipi_virq;
=20
 static int gicv5_starting_cpu(unsigned int cpu)
 {
+	int ret;
+
 	if (WARN(!gicv5_cpuif_has_gcie(),
 		 "GICv5 system components present but CPU does not have FEAT_GCIE"))
 		return -ENODEV;
=20
-	gicv5_cpu_enable_interrupts();
+	ret =3D gicv5_cpu_enable_interrupts();
+	if (ret)
+		return ret;
=20
 	return gicv5_irs_register_cpu(cpu);
 }
--=20
2.34.1=
