Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010051.outbound.protection.outlook.com [52.101.69.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CFE371860
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.51
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789119232; cv=fail; b=JkjlooO1fwTY/YPBNPKnumByDa5yj+BZWLhwVCMOKm3YVR9yizX6QTQ8lk8BQVfLkDz03cN2PDmVH95ZEwoUBUFpAa2WTup9g/1rbqRYSoMy1/kI9xP8cUQqY3mAF7uVG30R0csnU9ZdWJDaGXTFpdJFWseZVAizsSO0De/UlQE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789119232; c=relaxed/simple;
	bh=/KFbEPBqnFOqXjtM5rlDLtmDxIqc0YXnrhNvX5J7TNk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b6s+Mi+bA/sl3gF9e/6hfQHas6+BNMB34MdrMQX52JhpKgc1Ix93VpXPhNgFVIE+Y/Eh9y51ERAaLlwD/2O7xfB0qay5bh8gRJGtBD7+fKmA4lMLaOejO6unebi3TmG2FhQCHSAvJM2dxabnRDPDkeCzLyGEW0nFlbE9F95g2BQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nC8Py7Eo; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nC8Py7Eo; arc=fail smtp.client-ip=52.101.69.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nC8Py7Eo";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nC8Py7Eo"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HzX/2/5N5yWiifZDcKMz2/PCzKib+Tfa9cO0uMu6uLaPCM9MtCDjHCpYDroPhZAoPqwR3gTPkzgrBqEtDDfumb01oLXNlfuf6CtfdoW+Sg/AtKLLW/kdZlUd1PB+CEjv6xGnVNn0qeFlt2WSP3R1uHz5F/T5POOXc4cnGQjugsm7A/IcoF1Kv1krrZgN3KYwM3dG9LZgO01DcqYpnZqa29YevWNGg//FpOEtjTHTxsOG0zv2DjRzgHQw9Lv7OH4M2SYhmbq3Cb2L1joBHEUgoKBae8/anD2Y1hVJkLz2RkMLkXIKykVlX+xf94x7p2+ouoqTZQeTL8bX1ejykVEIig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLyByHJF4v+WtE2oWs7kAi8erXvtxq2XuKuhh2PRfaI=;
 b=JHd5dZ067xz6YXRrHJfsDmGi523mpndM+8k9jP/o5G2s2BRr1xPUV71e6GuQY7aeyHJ5z8RG7ag9JvnRsgo3pdoKUluKsqcurmC1hxtxmZODXM8WFIEGRjMDvEEqf2G8XOgMsEdLub7X0dwMqZeT0ru533RuGJqrQjmP9qeJlYlSZjBtmmvrcmjLsaap93QNJjfXM0DkU7squDVkjQDJYhzPqja7D7zdQEDjdBP8/R7i/Q6ijMbrFSlyCodnG84lGc0pQswZlY8V3ilEyO4Jy5lI1q2qmh0YU4Wg9gPcxEr6i43cHB77tTC+DaM8IHWDgoaf3umsvbUaJI/LEMz55w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLyByHJF4v+WtE2oWs7kAi8erXvtxq2XuKuhh2PRfaI=;
 b=nC8Py7EoIKb/LbTF9O2v++L61gwdzm+dM4BOPe7/Wpmp0Wj3+sTltXVlMYY0UaqwbNebBWF2c1WkQqI3vxZQ7MjjzVogLBfyytFeABZzQfFU3/WQSIETx+yeZB7g5IllLP1SCnwYEa6rsxC/9VqwxQVPFBhHkf33GKZRK63NFnk=
Received: from DU7P189CA0027.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::22)
 by GVXPR08MB7774.eurprd08.prod.outlook.com (2603:10a6:150:7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Fri, 11 Sep
 2026 09:33:42 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::a5) by DU7P189CA0027.outlook.office365.com
 (2603:10a6:10:552::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 09:33:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Fri, 11 Sep 2026 09:33:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edCj8F1ONm2QfnfUfFBoBQRHxuNQDAE+lB0LB62tMPV9rN0dgk5P4jEbb6V/4yMXuX1m3VZgYVlRbsr2nU7RAxuoWeIqEyIzfjmNnpV4IMH2Iw6KoBw7fgO/4cBcqeTwjs3wjevZVWcXkkYiewUZfWGuHGVlwlzfNcK7AGBhky1muis3m9v3JK4wOL3Qqi+OrLwca78XlvzH/4VIJ1/BqhADZhrxpxu0Z+Ko5HDktU1IPNPLlG1Pwz5TMu84nXTTqPg2xgmGyg+jh9mc59qlk0/XCdnLKF4QWCsLX79d4KA18mT1iXVPUmkNpC8qypaQC35XA4tpMQ2WGuEOdlshSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLyByHJF4v+WtE2oWs7kAi8erXvtxq2XuKuhh2PRfaI=;
 b=aJ61+nR9ee4m0fBhCiHwTxUvuyWD3UOUCcgU2GZRCIEStNKhTABxuwU15Gm7AeUAENPCK2tkrXiUY5Vsd4rGLNBHOL6jZmJyB9Sza8+do3qEPjGCTfFNtjOU/MjNQOkwAMW9eTPJdvbbTbb1mygLJu7n4g9HZoL/Hg1PFD29x+7z4bntI0dzcn0UPrh8prdlsRbzAejIG5YrxfpGi0RYxrq6+murOiT0I6UpB9iD5hZ0mvWyBhX2GssbNdmdqXm14wD2iZu7ewUXxFxBhGNSYZOZ/MRTfjQsnEotXK7Z/+3g1A2IhZRBCp0M6YvsRkj14D4dQP4IpDOazA9Re8KbTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLyByHJF4v+WtE2oWs7kAi8erXvtxq2XuKuhh2PRfaI=;
 b=nC8Py7EoIKb/LbTF9O2v++L61gwdzm+dM4BOPe7/Wpmp0Wj3+sTltXVlMYY0UaqwbNebBWF2c1WkQqI3vxZQ7MjjzVogLBfyytFeABZzQfFU3/WQSIETx+yeZB7g5IllLP1SCnwYEa6rsxC/9VqwxQVPFBhHkf33GKZRK63NFnk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by GV1PR08MB9915.eurprd08.prod.outlook.com (2603:10a6:150:3d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Fri, 11 Sep
 2026 09:33:06 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%5]) with mapi id 15.21.0428.004; Fri, 11 Sep 2026
 09:33:05 +0000
Message-ID: <efd85115-975a-420a-92fb-113625c80183@arm.com>
Date: Fri, 11 Sep 2026 10:33:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/5] coresight: cti: add Qualcomm extended CTI
 identification and quirks
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, quic_yingdeng@quicinc.com,
 tingwei.zhang@oss.qualcomm.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
 jie.gan@oss.qualcomm.com
References: <20260615-extended_cti-v10-0-1c1694b6d8ed@oss.qualcomm.com>
 <20260615-extended_cti-v10-3-1c1694b6d8ed@oss.qualcomm.com>
Content-Language: en-US
From: Mike Leach <mike.leach@arm.com>
In-Reply-To: <20260615-extended_cti-v10-3-1c1694b6d8ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0456.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:398::26) To PAVPR08MB9674.eurprd08.prod.outlook.com
 (2603:10a6:102:31d::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAVPR08MB9674:EE_|GV1PR08MB9915:EE_|DU2PEPF00028D09:EE_|GVXPR08MB7774:EE_
X-MS-Office365-Filtering-Correlation-Id: ad10ea76-aaa2-45a7-5f3d-08df0fe7c4ae
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|11063799006|56012099006|3023799007|10067099003|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 TVShS/kF8ae/GMCfkjFYFv0idPiWMasBCBzHw6kCN0p3pWYAZ3AFdLm33asfumo8+LNtEKeN2mzuYkWflau/7rhatdNQcmWUHw0Cc1aBAXwpimI4v3rMijkQGySR+2najwD+N1tgiRbvFAqlBBoo7zo6/YLqm+zr/mXg2upOU7Jvthqm+Z6bKjuPXi2sg3lcg0jcmLdQms1CuHoQSu3vCxBOPiYaFHgjwO7FNKnmyq+3xLeH2ArbDAagQuk4M4v7QYxEhWz1gf7p2Cb7rrQRg5M6Rn2awOQaPdEexmT0HJaAhPaZYlnop0zzhmrs2aQ7LIY5tlnDmScNR2y0PvXaLHiH9qiRIWMeMFRbNQE/IeSdIXXs+CHJXybxnFYm0zZBRAjq66Z4CzEX69uAWd847k6zDBLa8ESQZkSBsAxZ0n9pm+5kOfQ0Q8rQjiWqNM4AfVqw9pHrY9zsZTVqeZDqQXF1g94XjeK6X1xqs0NYOA8wnC4dkmpqnEvQLj/5ktE69XxwAMeVrdlup81PzZJrbZSMVbJ6x706e+3uMcbPVmzvOjrs6mTGZSD22uvudeelulkHOwSUiL/VDqekkI2udHF22clqUclFVf4YyznwvjqBlTcW8hUJP+y38ZVWwJCHmXmbtIVfK7jdnwJs78pTy2v+2CisHXKF7yPjMpBxjiM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(3023799007)(10067099003)(4143699003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 xgnWCjelNlxokKOaScccMsSUGvLAElIdEp3A8zINhuwBfBRkGbCiffTY5BaAd1NUzMFyWcpj+PCa92Aw8LNbNbph/7cDo9KkQsLdKM1cCLKD5GZTi+NLXVUD2FRZ+AjFNenJdFMWy1o52KXp1D/nM8D16tGidgwkw8E6Vvnj/+MPiW6vsPSWcxilGJHTS5ckSiClU6C4h4z62BsGDuVgBrVTKozBz+48Dk4wFjhgHpV9obwr0PC4nW3qUWGVczlxCCH6HbbMjrOl7PPPv2dNGN1pa0ZOnXOscGPTwaJk09Anqgvp3r6MFXtd5T4++VHX+xekbI211WJmVD4BxyOYAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB9915
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b27fd56e-288f-45ab-ebe0-08df0fe7aee7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|14060799003|376014|7416014|82310400026|1800799024|35042699022|3023799007|6133799003|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zEG0lQ/vhWKqh+w0ma2FvDl1JcS9Z4Br7PlPwt7dAwp6bCjgNLatRU/ZQHl4HS3CdQR7Omq2Sd0oX4MGw1PGVCda5FRNYVMIJ2LjANsO5V86VIxptOFwHRFz0CDWkMEQMvkXnZaL9r8j7g3EPmlZHxEKGPpSaFQ6fYftd7WbOkmCn51RWqB0Yh9nz0R4+bfFeDVCVJvHfnyDINz4RfnQ+qpdDLI/mzJWw791Dk2DH4TXQCiHHhNfqTQ8d3VIS9BhuJzZRDmbmPyDN5CAYOgAngJdJEtiVPvUY724sx5wgSBSk+xIPIxmD97YIh4FACM92u0DN8WGwkpO/Tv/p8pLXdB3LHvW+FcVnZoTl/jLfylfMUMW5c7Q8mPZp+hCkcrJ3SvSUhSObnuY0KLeRUKZzE6cHAU0h/G+2gLUuhNwTmPIgkazVZ2URWfdmgB6KvinYRnGmu1diJBe7UD8d9Y6HgKJbMOcl0hyllIqQLPdzFPfoNFg7Zcc4Ux3MBAC84eHDjAgVVDlC2YJz8gFk9xQQ+TLNoLmhLa2ztys2t+UGi/txZ+wEGmPrvXUbuQREMgd+GuUCq6DEJdakepaJWuRgdxyILl2j0+bdYIN3TCcWXOamVkyiYgQe7n3pYqCNCMUSEtN/GawoPLW90qdy/ap8IUyoZfl1fJ6ruG8oWG2HCpDxde6hNLtmGacUYzF1R8+WiJemqrbCLdGi4ZLRTMOkw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(14060799003)(376014)(7416014)(82310400026)(1800799024)(35042699022)(3023799007)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q5VQdGtOI/B+QffBb7U72oOPH+56HYX0F4c6eqnJl7hppBNvov60ek12UaWKh1CTENNp01geE7GI1ONAjJEBj2XqjVFgrDrYkDPzE98SmU3T2Q8Ts4O4VQ8y8POPLTXiXXD8oJ5qNQf6+OtuTcg+v4/cuZtJ3rINTgSIJ97nRtdB49Jjncl4PHkBGop1P/6iss+RgD0CoXuMEHOsn3FFxRvhMUCwWGbzGg6otX9+omUPERMsPQGek2EIOfElQbi2NWzBQmfy5gV7o98D3hITB456YY26fQB1pZLooRu7a4ScijHt2oVTnOwlERDeUyI+5dJBTpC8yXSxl+mVWmMCgZSSE+HlnFxoS27Fv4Zka6/d1QrZ6OTOhiUSdwTkouaqh6N5WpQCLUKfzbLQpU8JYSL/Wp9iQraHAJam1ZpDXAbFaZ0/3cKJVseKPcyMUJ7y
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:33:42.0322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad10ea76-aaa2-45a7-5f3d-08df0fe7c4ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7774



On 6/15/26 13:32, Yingchao Deng wrote:
> Qualcomm implements an extended variant of the ARM CoreSight CTI with a
> different register layout and vendor-specific behavior. While the
> programming model remains largely compatible, the register offsets differ
> from the standard ARM CTI and require explicit handling.
> 
> Detect Qualcomm CTIs via the DEVARCH register and record this in the CTI
> driver data. Introduce a small mapping layer to translate standard CTI
> register offsets to Qualcomm-specific offsets, allowing the rest of the
> driver to use a common register access path.
> 
> Additionally, handle a Qualcomm-specific quirk where the hardware does
> not implement the CoreSight Claim tag protocol. Instead of clearing the
> CLAIMSET register at probe time, bypass the claim/disclaim operations
> entirely for Qualcomm CTIs by wrapping coresight_claim_device(),
> coresight_disclaim_device_unlocked() and coresight_clear_self_claim_tag()
> in thin helpers that early-return when is_qcom_cti is set.
> 
> No functional change is intended for standard ARM CTI devices.
> 
> Co-developed-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
> Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-cti-core.c | 47 +++++++++++++++--
>   drivers/hwtracing/coresight/coresight-cti.h      | 64 +++++++++++++++++++++++-
>   2 files changed, 105 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index fa758c535ccb..5b83dd4e603b 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -73,6 +73,35 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
>   	CS_LOCK(drvdata->base);
>   }
>   
> +/*
> + * Qualcomm CTIs do not implement the CoreSight Claim tag protocol, so
> + * bypass coresight_clear_self_claim_tag() for them.
> + */
> +static void cti_clear_self_claim_tag(struct cti_drvdata *drvdata,
> +				     struct csdev_access *csa)
> +{
> +	if (drvdata->is_qcom_cti)
> +		return;
> +
> +	coresight_clear_self_claim_tag(csa);
> +}
> +
> +static int cti_claim_device(struct cti_drvdata *drvdata)
> +{
> +	if (drvdata->is_qcom_cti)
> +		return 0;
> +
> +	return coresight_claim_device(drvdata->csdev);
> +}
> +
> +static void cti_unclaim_device_unlocked(struct cti_drvdata *drvdata)
> +{
> +	if (drvdata->is_qcom_cti)
> +		return;
> +
> +	coresight_disclaim_device_unlocked(drvdata->csdev);
> +}
> +
>   /* write regs to hardware and enable */
>   static int cti_enable_hw(struct cti_drvdata *drvdata)
>   {
> @@ -86,7 +115,7 @@ static int cti_enable_hw(struct cti_drvdata *drvdata)
>   		goto cti_state_unchanged;
>   
>   	/* claim the device */
> -	rc = coresight_claim_device(drvdata->csdev);
> +	rc = cti_claim_device(drvdata);
>   	if (rc)
>   		return rc;
>   
> @@ -101,7 +130,6 @@ static int cti_enable_hw(struct cti_drvdata *drvdata)
>   static int cti_disable_hw(struct cti_drvdata *drvdata)
>   {
>   	struct cti_config *config = &drvdata->config;
> -	struct coresight_device *csdev = drvdata->csdev;
>   
>   	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
>   
> @@ -118,7 +146,7 @@ static int cti_disable_hw(struct cti_drvdata *drvdata)
>   	/* disable CTI */
>   	writel_relaxed(0, drvdata->base + CTICONTROL);
>   
> -	coresight_disclaim_device_unlocked(csdev);
> +	cti_unclaim_device_unlocked(drvdata);
>   	CS_LOCK(drvdata->base);
>   	return 0;
>   }
> @@ -144,6 +172,9 @@ void cti_write_intack(struct device *dev, u32 ackval)
>   /* DEVID[19:16] - number of CTM channels */
>   #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
>   
> +/* DEVARCH[31:21] - ARCHITECT */
> +#define CTI_DEVARCH_ARCHITECT(devarch_val) ((int)BMVAL(devarch_val, 21, 31))
> +
>   static int cti_set_default_config(struct device *dev,
>   				  struct cti_drvdata *drvdata)
>   {
> @@ -684,6 +715,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>   	struct coresight_desc cti_desc = { 0 };
>   	struct coresight_platform_data *pdata = NULL;
>   	struct resource *res = &adev->res;
> +	u32 devarch;
>   
>   	/* driver data*/
>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -708,6 +740,10 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	raw_spin_lock_init(&drvdata->spinlock);
>   
> +	devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
> +	if (CTI_DEVARCH_ARCHITECT(devarch) == QCOM_ARCHITECT)
> +		drvdata->is_qcom_cti = true;
> +
>   	/* initialise CTI driver config values */
>   	ret = cti_set_default_config(dev, drvdata);
>   	if (ret)
> @@ -753,7 +789,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>   	cti_desc.groups = drvdata->ctidev.con_groups;
>   	cti_desc.dev = dev;
>   
> -	coresight_clear_self_claim_tag(&cti_desc.access);
> +	cti_clear_self_claim_tag(drvdata, &cti_desc.access);
>   	drvdata->csdev = coresight_register(&cti_desc);
>   	if (IS_ERR(drvdata->csdev))
>   		return PTR_ERR(drvdata->csdev);
> @@ -767,7 +803,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	/* all done - dec pm refcount */
>   	pm_runtime_put(&adev->dev);
> -	dev_info(&drvdata->csdev->dev, "CTI initialized\n");
> +	dev_info(&drvdata->csdev->dev,
> +		 "%sCTI initialized\n", drvdata->is_qcom_cti ? "QCOM " : "");
>   	return 0;
>   }
>   
> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
> index 634bdce5cdfd..4b6fd6b55114 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -54,10 +54,36 @@ struct fwnode_handle;
>   /*
>    * CTI CSSoc 600 has a max of 32 trigger signals per direction.
>    * CTI CSSoc 400 has 8 IO triggers - other CTIs can be impl def.
> + * QCOM CTI support up to 128 trigger signals per direction.
>    * Max of in and out defined in the DEVID register.
>    * - pick up actual number used from .dts parameters if present.

I haven't seen anything in these patches that actually does check for 
max CTIINOUT values in .dts.

Would it not be better to have a QCOM_CTIINOUTENMAX and set the max 
value in config based on the is_qcom_cti flag?

Otherwise it appears that the standard arm CTIs are going to create a 
whole lot of unneeded/unused registers

Regards

Mike

>    */
> -#define CTIINOUTEN_MAX		32
> +#define CTIINOUTEN_MAX		128
> +
> +/* QCOM CTI extension */
> +#define QCOM_ARCHITECT		0x477
> +
> +#define QCOM_CTIINTACK		0x020
> +#define QCOM_CTIAPPSET		0x004
> +#define QCOM_CTIAPPCLEAR	0x008
> +#define QCOM_CTIAPPPULSE	0x00C
> +#define QCOM_CTIINEN		0x400
> +#define QCOM_CTIOUTEN		0x800
> +#define QCOM_CTITRIGINSTATUS	0x040
> +#define QCOM_CTITRIGOUTSTATUS	0x060
> +#define QCOM_CTICHINSTATUS	0x080
> +#define QCOM_CTICHOUTSTATUS	0x084
> +#define QCOM_CTIGATE		0x088
> +#define QCOM_ASICCTL		0x08C
> +/* Integration test registers */
> +#define QCOM_ITCHINACK		0xE70
> +#define QCOM_ITTRIGINACK	0xE80
> +#define QCOM_ITCHOUT		0xE74
> +#define QCOM_ITTRIGOUT		0xEA0
> +#define QCOM_ITCHOUTACK		0xE78
> +#define QCOM_ITTRIGOUTACK	0xEC0
> +#define QCOM_ITCHIN		0xE7C
> +#define QCOM_ITTRIGIN		0xEE0
>   
>   /**
>    * Group of related trigger signals
> @@ -168,6 +194,9 @@ struct cti_config {
>    * @spinlock:	Control data access to one at a time.
>    * @config:	Configuration data for this CTI device.
>    * @node:	List entry of this device in the list of CTI devices.
> + * @is_qcom_cti: True if this CTI is a Qualcomm vendor-specific
> + *		 variant that requires register offset translation
> + *		 via cti_qcom_reg_off().
>    */
>   struct cti_drvdata {
>   	void __iomem *base;
> @@ -176,6 +205,7 @@ struct cti_drvdata {
>   	raw_spinlock_t spinlock;
>   	struct cti_config config;
>   	struct list_head node;
> +	bool is_qcom_cti;
>   };
>   
>   /*
> @@ -229,9 +259,41 @@ struct coresight_platform_data *
>   coresight_cti_get_platform_data(struct device *dev);
>   const char *cti_plat_get_node_name(struct fwnode_handle *fwnode);
>   
> +static inline u32 cti_qcom_reg_off(u32 offset)
> +{
> +	switch (offset) {
> +	case CTIINTACK:		return QCOM_CTIINTACK;
> +	case CTIAPPSET:		return QCOM_CTIAPPSET;
> +	case CTIAPPCLEAR:	return QCOM_CTIAPPCLEAR;
> +	case CTIAPPPULSE:	return QCOM_CTIAPPPULSE;
> +	case CTIINEN:		return QCOM_CTIINEN;
> +	case CTIOUTEN:		return QCOM_CTIOUTEN;
> +	case CTITRIGINSTATUS:	return QCOM_CTITRIGINSTATUS;
> +	case CTITRIGOUTSTATUS:	return QCOM_CTITRIGOUTSTATUS;
> +	case CTICHINSTATUS:	return QCOM_CTICHINSTATUS;
> +	case CTICHOUTSTATUS:	return QCOM_CTICHOUTSTATUS;
> +	case CTIGATE:		return QCOM_CTIGATE;
> +	case ASICCTL:		return QCOM_ASICCTL;
> +	case ITCHINACK:		return QCOM_ITCHINACK;
> +	case ITTRIGINACK:	return QCOM_ITTRIGINACK;
> +	case ITCHOUT:		return QCOM_ITCHOUT;
> +	case ITTRIGOUT:		return QCOM_ITTRIGOUT;
> +	case ITCHOUTACK:	return QCOM_ITCHOUTACK;
> +	case ITTRIGOUTACK:	return QCOM_ITTRIGOUTACK;
> +	case ITCHIN:		return QCOM_ITCHIN;
> +	case ITTRIGIN:		return QCOM_ITTRIGIN;
> +
> +	default:
> +		return offset;
> +	}
> +}
> +
>   static inline void __iomem *__reg_addr(struct cti_drvdata *drvdata,
>   				       u32 off, u32 index)
>   {
> +	if (unlikely(drvdata->is_qcom_cti))
> +		off = cti_qcom_reg_off(off);
> +
>   	return drvdata->base + off + index * sizeof(u32);
>   }
>   
> 

