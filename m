Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013052.outbound.protection.outlook.com [40.107.159.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2466938AC9A;
	Sat, 12 Sep 2026 11:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789212889; cv=fail; b=npQ49iwgHHNePAua68ZdIdd9G+IXk5I1UPU60FY9VFlmi2ieoT+C+IzsPcNrk1kNDSWmxMjtyh91wu5HKXbDYQPYdUWOfaJjMmr5si0DpTUY1qdN39SiyRshpnJ3EVZ+/orB1iPUl5G84iA2d9qtvK3nadquWzW6SzH5L2UF6UE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789212889; c=relaxed/simple;
	bh=/m8oXPbNvhlQFtkGuaFz3sjPlTmT8rQp3A2k1x0A2Xw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NerI2fHdddiECPSkLozQHm90KrhOH2+zPOeDzco2rNqmMhPXttF+N63S2oBlCQaRHab0lVTGJRdYMftHmGCR2SehHqJA8Eox9gM3XIDLfi7wm1OlmNwdblz2IpS6IlkjlEELCi/YE/A/cg9tMgECVikyHNbSHTVZCZJYLnJh1+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=trrylEnm; arc=fail smtp.client-ip=40.107.159.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="trrylEnm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vUoGXQzG7ktDt6jSC7OzUCsx9viUqemdxFK4KSqkrpEOHNqzA8xAHWqd4mUYojTtJe95H/I6IUUwv6naXMbIO/kn2v7zvwsHduWXaFiroRuT80YBrCqerdMg6uVpiDzXIk0Ufiy6Cqe4vpr7lZAOsOJ/s9HmHhMfVoJZD2OytPgDn/ZR5lcXK5Xe9WK+TxyP0f8vaTCFXmqGrc9G98nPgWrrCs949udkh7l81xWjRdRVOB/EeA/Jia2LijqZUeyg30199ePu+788tWHrRH9z1BU6uwFuophtWwEuoHuWemPJNpoPst4iyXL7UC8Y/q8bA11LdVhrpiH48XHoG/nc1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=er8mkpSGysTU2AnOCiPtxLRaraSl7B9NqJnF92yeKFk=;
 b=cUCyBLxMxNiu1vMtGX9tZTf0C8ohXwNagHM6CrN5Gl3mQcqcdM+RcI86oVhBcAxf0we+6UXUpktF0es4AA4IW5vysai1VPSHH6Acq1FjJ/cLTTYFvNA3kLPfgTIpFdKkZs45rpTSs6r9AzBv0BJvmMmJLe9Vu9Y70pvOmsrcaIo/Wj3HNqCpFXLs3XzUKoeZU7As0n3+MlkdFu/O3e5JCP75QksR/1ZvIGaLlAcegEOZHBLLaMJkbeVtEOenyW96U1WaHa+Dc9OOQP0GlFqd2b6yxlh9qNp8jW68SrvUCsV39pETVzmSGII1szFxmFty4XNdFfvdd16geAqPSIY5vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=er8mkpSGysTU2AnOCiPtxLRaraSl7B9NqJnF92yeKFk=;
 b=trrylEnm7YEwPeXPTOpUFkeTowshlNPtCKX2Kxxr/W+QllQlBBq+ap303ml1eUYABwEJaU1qUGkiBZj2jCcaw1WMCQH8GKKVJFel5GA9osnOICwXIwUOCwlOTFFmnpUqBW9Ujbj3YcK+dng1U67IHlSG/M7/8St6joqYna7ASdjC10jiha/EVrGwZnAn+sczfxGKZaJ8JJ8jDT2r9PDljS8q61qNQv2iKUOb6EeFUhSMfKhDMrqE5qvD3ZYD8RLA0SybL92tlQmNVg1Zvmn2vb31R9Slv4QkTupW1bpMq1cbiOjfeVSUwISQkYq4H21UJ6TsfjSfakKOVfcCazdDlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by ZR6PR04MB466071.eurprd04.prod.outlook.com (2603:10a6:910:dc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Sat, 12 Sep
 2026 11:34:36 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 11:34:36 +0000
From: pankaj.gupta@oss.nxp.com
Date: Sat, 12 Sep 2026 22:33:35 +0530
Subject: [PATCH v50 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-imx-se-if-v50-1-80834ef510d3@nxp.com>
References: <20260912-imx-se-if-v50-0-80834ef510d3@nxp.com>
In-Reply-To: <20260912-imx-se-if-v50-0-80834ef510d3@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789232651; l=14442;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=GR+UpWiKN6vQ/fD+2am73nCHpHQoukDXxfoTE0YlRxg=;
 b=hDLUcOr3yh7vp9oIN732CANcq6vigW9AtgJbHWBUMdB7eN7XsBzoUq0k7Cp3hQr6h4llbzpJy
 i7kp97ps2jhAfVAmDRQ3cnel95GOi0bc4nBMkyUeZx8ATYVBndnjBTb
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA5P287CA0217.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::13) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|ZR6PR04MB466071:EE_
X-MS-Office365-Filtering-Correlation-Id: fd4fd91f-0b5d-47b5-2095-08df10c1d2af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|7416014|376014|11063799006|56012099006|6133799003|3023799007|10067099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	zoTSwj4A9xxSbnqmRCElhvDOFkXv7C38YgpY6V4RBemmEfVZJrO4pCl8MzffqSP8aagV3FZTGE1XqC0AojMh3ukpPYtKN/Xoh/2KQfLtGFKhDHJHUp0xaTpPxRzsAnx+pVD0ET9ynLgHOkil4YImXkPJq4aID+P+2wZozl2gypoDcBzV2asV+Q1iYKoB8VCwvOc+qnYS4Dy3INsT968FucH+5ThHKkNdD8x7N4y7ixO0rbxM2vVyYnDXACFEtzCPbcSbAQqse55fwLYLPyWwGfPHRrE/by20XMrgzgHcFp8OIG7/pfb943hFzju34OPbtV5sLYGt1zmvu+HvkYGkNRt+Mq4zw3WlNPwDHDep0FiL3w9/twNkgxTiZo3S7gikRO2F8nJvHljzoq9k8rgGqqSokA8RNgXw6NYDH+XSD976QDCIrnW4/rP9UMzeSxmoCrxmz9tx5yfljgsHrrQuKiACQYVeFIy6QLWSqV1+V5yX5FKz8HZRD6R4HI2nIkQxmEwqGayU3GqN6egJe5wnNYzGvsOnqySqghyfMfuvS9vzmkNfZm7D03JryzTk6BLbbrieBx8As/QEtRvV4GuFv6WZqx+c0R7487cMVKhDoXO7vhBHwKhj1pygQ0BD4aSP9GCdRku3uiI5N5uK4Ghl/0sJ6DSIEf8qw90DMneuhjcm2BpjadOIw3jX1eRIxAqqe77LCjO1h/AVzeeX2O3eCA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(7416014)(376014)(11063799006)(56012099006)(6133799003)(3023799007)(10067099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tmc4NXV6azdicGsyRU9HTXhRMGwyOE4vVXU2ZnpubW82QTF5QlMreHVjWHVv?=
 =?utf-8?B?bXJ3aFFkUEk2cVdNWTFFUnc4VXNCWUdzc1QvZFlZRVRqUm1lWS81SUI0THdi?=
 =?utf-8?B?WW1kRU9zUldXd3M5dFFOQXVIVi9wOVh3ZDVweHQvM0FXRUxudDFPL3FQazA3?=
 =?utf-8?B?bWVjbWZ0N0dRNW9TWUhkQUtXaXUxQUNjSUYxLzZaMmtLckRpT3JMK01rVjBm?=
 =?utf-8?B?WUJmZEt5MGkydE4yZjZJTVVLMDlpTjA4UzB0V0g4ZWQxRHNFNFA2bmo3RlRW?=
 =?utf-8?B?clozOWVWZkdRcDRna2RzRDQ3am1xc1AzUjhVczJKTnNLUXhPM3drckd2QTRO?=
 =?utf-8?B?TTI2OHJqMEV1cWlqemlrUlUvSmhXbkUzdmpJZkxFL3FQUmd1TG4ybVh1NDJy?=
 =?utf-8?B?S2lCdXRzalhwcytuY05IR1NYb0VpMzh5ZFRyVjFIa0NhVDY2L3dtdDEwQkJ0?=
 =?utf-8?B?cGJoSjNYMEN2MDEvd3VaU1pQRVFVZzNLVVRFNnRHaVZCSmJMdU14WGk5NUJr?=
 =?utf-8?B?ZkdFSEtDR0ZuanNicTl2WU04VXhFVlZDY2x1bjdrYzQvTk05VkxKM3orV2Jw?=
 =?utf-8?B?WSsxLzV3dWhqQWQwbm1DblJsQXdSZkxQRnZxbUdZb0RKUTkvQUV5dFhFRVRy?=
 =?utf-8?B?ZlFSZWpyam1FRDBlR2p0MVgxalc5bVhGczMrSG1pbkF3Qlh5Z1ZXaVRCZTl3?=
 =?utf-8?B?SU5kVjRqYlVnaUdORDBLQ2dlVjFBVUJQSGg5cEJvamZEYnFZQzdEWUN3Rytp?=
 =?utf-8?B?R3JKaUFTOTIza3MwQm5aWGlGcVBXN3NoRERKSGxHUUJlNzgyMTlRMVRXb3RJ?=
 =?utf-8?B?bHNpUFdGZkRHYjdEMXZyQTZMSTJOZDN3YUZmeXdLTXFuTEF6b0p4cUpPVVhG?=
 =?utf-8?B?dW0zNjdTdTE2MzBtRm5tUW9wSkZ1alRIaGtLSTVuSlk3SkhMb0wrcWVTMm55?=
 =?utf-8?B?eG5QTUVrck50Tm54YUlSMWU0Q0QvRFA0YlZqM0xKWWRBZUh6bDBxalBLTnhj?=
 =?utf-8?B?bEJxY3c4SXJVV2RsZnU5bDlwRGduWURZRWxLbklrS0tVZC9wa2RTditFV0tl?=
 =?utf-8?B?YkpndTE4NXlPZUVGOVZZMHJYQlZEM2V6YWVTeGpIeGNwSnJ2Ykt1RlQwbWpN?=
 =?utf-8?B?Z1N6WCt5WGw5SWVnWG9QN2V3cGpleXE5bXJ1NjVLZzRLY0NWWHhGZHNuVzYz?=
 =?utf-8?B?cE41aHFtcEx1aXZsMEl2RTJYSmxoMm1jN05sSWZXWVM2TlVkT0dob3R4N1o3?=
 =?utf-8?B?TDVrRzNzenQzZENCa3BYbEhTaW5abCs3c2ZPZTZpSFROZGZQVEVCdXJUYXRo?=
 =?utf-8?B?KzZkV2dVaWtrbTdRV0tUTmhxR1YzWFBzTHhFcmFoaFAwNmVRSjNFUlFUbmhx?=
 =?utf-8?B?NlFDSmtwblZaa3poK1RCWjQyRlB2MW5zbDVNcDU4cWVFWmxmTWpWL0IrU2Uz?=
 =?utf-8?B?SXVnc3RsWmlWcUtvdXVRWVBMZkJBMkV2RFNVeWY1QjRBb0QwdkxCd1IrcUNC?=
 =?utf-8?B?NTc5TG5yeU0xcDBZYXRYaCt0UW1SSnJrOXBZSE5kekppeUwxc3F5NHV5Q3Ja?=
 =?utf-8?B?anFONW5VMHZwRGtSK0E1RlMwMy9PWWZEVWFUT1hhZHhWVlZjT3NVVWJxbTlI?=
 =?utf-8?B?VC9rYUpyZ3kzVisxS01uQXlwZnhqcEh1RmxVQ0pxdjIrb1NQdFd5dlB0U3pr?=
 =?utf-8?B?VEtUTUNxbisvdkxWR3JUbm9MRWl6V3JrSnNQQUFSMFBtdTdvSWJDM0hqRlpQ?=
 =?utf-8?B?UWdzdlR4SUkvSmZBWmdJSHpxeHdyODJpYmZKcEJxZVptMzV4TVpTN01mbkFh?=
 =?utf-8?B?blRTRi8wdTRvQUQ4MGdxUWtyWW9FTXRLcjIvaGg4ZzJLZVBrTVVKT2VETGlP?=
 =?utf-8?B?UVNNcGd3Q29WYjhNK2ZDQi9KZnlCcmVJb1p5ZTJvaHlNMUFhalo4cEFiNTFT?=
 =?utf-8?B?WEZ2TnZTVWYxdjM3TjBBeDIvK2pXNlB4ZkVKanptQklkOEhuSURFSk9qbkE2?=
 =?utf-8?B?c2tDY1pxTW1ibWtzMHdTaWtsSmhUZk4rWlV6RGNVQ01WUTZsbEZQaVlhTGVr?=
 =?utf-8?B?OW9wSWdmb0tFZHBCeVBCNHJScDg5UlhNTHZIeDBFUE5DK0R1WG9uMS9td1h2?=
 =?utf-8?B?NTQ5bEUxTlRBTFdESlg1bUZPRnU2MVoxYzc3c3dIbnhnVzdFZFcySlF6cHVT?=
 =?utf-8?B?M25RM1Z1TTBmSC9RZEYwS0x5a29vSENlR3RUdVBYSkF3YUxHcnZhNm1rUG9n?=
 =?utf-8?B?cTNvVTFkdHVDc2hFSGw2Q3lwclp5QkFKZC93RE8xQXlGSGpNUURPVUtSYmdC?=
 =?utf-8?B?dFBhMkovSXRyaCsxU1JqREtOODY4elBwSDNGM0lEVE0weTlvcW1HR0JpZTZq?=
 =?utf-8?Q?WiIuY4YVB6814QJrpF3v8XPEGTaM+Hdo7ji2t?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4fd91f-0b5d-47b5-2095-08df10c1d2af
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 11:34:36.2573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGkOM8muqPI5LyniZjUV72Df3Fh4b+29qmw7eEiIaOOU0MFqXGulW9Pliy5ll7y9QneC02NhorexZnLYERe23neTVgGoNc318qlqqnqpJa3zLAMYXXN+tzZopSDCF6dc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB466071

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
----
Changes from v46 to v47:

- ELE_STORAGE_OPEN_REQ concurrency and command-receiver exclusivity:
  Explains the three-layer protection used to serialise concurrent
  ELE_STORAGE_OPEN_REQ ioctls: (1) an advisory early check under
  modify_lock capturing both receiver_exists and is_cmd_receiver in a
  single critical section; (2) se_if_cmd_lock serialising the full
  send+receive cycle; (3) set_dev_ctx_as_command_receiver() re-checking
  under modify_lock after the response arrives. An ASCII sequence diagram
  shows how a racing second caller is rejected by firmware before any
  storage handle is allocated.

- Signal handling after a completed hardware operation:
  Explains what happens when a signal arrives after firmware has already
  executed a command and written its response into the MU receive buffer.
  The driver validates the response, calls fw_api_specific_ops() with
  is_cmd_interrupted=true (which closes the firmware-allocated handle via
  se_close_session()/se_close_storage() and clears the kernel-side
  handle), then returns -EINTR instead of -ERESTARTSYS. Returning -EINTR
  prevents the VFS from transparently restarting the ioctl with
  already-zeroed input buffers and lets userspace enter its signal handler
  to decide whether to reissue the command. An ASCII sequence diagram
  illustrates the timing.
---
 .../driver-api/firmware/other_interfaces.rst       | 238 +++++++++++++++++++++
 1 file changed, 238 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..984ee3ecc8dc 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,241 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+--------------------------------------
+
+Introduction
+~~~~~~~~~~~~
+NXP i.MX hardware IPs such as EdgeLock Enclave (ELE) and V2X create an
+embedded secure enclave within the SoC boundary to enable features like:
+
+- Hardware Security Module (HSM)
+- Security Hardware Extension (SHE)
+- Vehicular to Anything (V2X)
+
+Each of the above features is enabled through a dedicated NXP hardware IP
+on the SoC. A single SoC may contain more than one such hardware IP, that
+is, more than one secure enclave can coexist.
+
+NXP SoCs with such secure enclave (SE) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more coexisting SEs on the SoC, there are
+dedicated messaging units (MU) per SE. Each coexisting SE can have one or
+more exclusive MUs dedicated to itself. No MU is shared between two SEs.
+MU communication is realized using the mailbox driver. Each secure enclave
+can serve multiple clients by virtue of these exclusive MUs, and can
+distinguish transactions from different clients based on the MU used and
+the core security state. The communication between clients and secure
+enclaves uses a command/response mechanism. Each client can expose a
+specific set of secure enclave features to higher layers, based on the
+commands it supports. For example, a secure enclave can simultaneously
+serve an OP-TEE TA and a Linux middleware client. Each client exposes a
+specific set of secure enclave features based on its supported command set.
+
+NXP Secure Enclave (SE) Interface
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+MUs are not shared between SEs. For an SoC like i.MX95, which has multiple
+SEs such as HSM, V2X-HSM, and V2X-SHE, all SEs and their ``se-if``
+interfaces dedicated to a particular SE are enumerated and provisioned
+using the single compatible node ``fsl,imx95-se``.
+
+Each ``se-if`` comprises two layers:
+
+- (C_DEV Layer) User-space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+::
+
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        |   Misc. Dev Sync Logic  |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+::
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer ensures the communication protocol defined for interaction
+  with firmware.
+
+  The firmware communication protocol provides two guarantees:
+
+  - Serializing the messages to be sent over an MU.
+  - Firmware can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as
+  ``/dev/<se>_mux_chx``. Using multiple device contexts multiplexed over
+  a single MU, userspace applications can use file operations (fops) such
+  as ``write`` and ``read`` to send a command message and read back the
+  response to/from firmware. These fops use the service layer API to
+  communicate with firmware.
+
+  Misc-device (``/dev/<se>_mux_chn``) synchronization protocol::
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                +-----------+      +-------------+       |
+                | se_ctrl.c +<---->+imx-mailbox.c|       |
+                |           |      |  mailbox.c  +<-->+------+    +------+
+                +-----+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+   kernel space +------+      +------+     +------+      |
+                                                         |
+   +---------------------------------------------------- |
+                    |             |           |          |
+   userspace   /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its
+``device_ctx`` as a waiter of a response from firmware.
+
+The secure enclave firmware manages storage over a Linux filesystem.
+For this, ``c_dev`` provisions a dedicated device context called the
+command-receiver.
+
+
+ELE_STORAGE_OPEN_REQ concurrency and command-receiver exclusivity
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+A userspace-created ``dev_ctx`` becomes the storage subordinate to FW by
+being registered as the command-receiver via
+``set_dev_ctx_as_command_receiver()``. FW sends NVM callback commands to
+this ``dev_ctx`` via that priv's MU, on which the ``dev_ctx`` was created.
+Once a userspace ``dev_ctx`` on one priv is registered as the
+command-receiver, after opening the storage handle with FW, FW enforces a
+global one-storage-instance limit: a concurrent ELE_STORAGE_OPEN_REQ
+arriving over this or any other priv's MU is rejected by FW itself, before
+any storage handle is allocated. The driver uses three layers of
+protection; the sequence below shows how a concurrent race is handled
+safely::
+
+  Userspace A        Kernel (se_ctrl)          FW (ELE)        Userspace B
+      |                    |                      |                  |
+      |--ioctl(SEND_RCV)-->|                      |                  |
+      |            [advisory check under          |                  |
+      |             modify_lock: no receiver]     |                  |
+      |            [acquire se_if_cmd_lock]       |--ioctl(SEND_RCV)->
+      |                    |                      |  [advisory check  |
+      |                    |                      |   passes: TOCTOU] |
+      |                    |                      |  [blocks on       |
+      |                    |                      |   se_if_cmd_lock] |
+      |            ele_msg_send_rcv()             |                  |
+      |                    |--STORAGE_OPEN_REQ--->|                  |
+      |                    |<--STORAGE_OPEN_RSP---|                  |
+      |            fw_api_specific_ops():         |                  |
+      |            set_dev_ctx_as_command_receiver|                  |
+      |            [re-check under modify_lock]   |                  |
+      |            [release se_if_cmd_lock]       |                  |
+      |<--ioctl 0----------|                      |                  |
+      |                    |                      |  [B gets lock]   |
+      |                    |                      |--STORAGE_OPEN_REQ->
+      |                    |                      |  [FW rejects:    |
+      |                    |                      |   one storage    |
+      |                    |                      |   at a time]     |
+      |                    |                      |<--ERROR_RSP------|
+      |                    |  se_val_rsp_hdr_n_status: -EPERM        |
+      |                    |  fw_api_specific_ops not called         |
+      |                    |<--ioctl -EPERM-to B------------------->|
+
+The three protection layers are:
+
+1. Advisory early check (under modify_lock, before send): fast-path
+   rejection if a receiver is already registered. Not the final gate
+   because modify_lock is released before the MU send (TOCTOU window).
+
+2. ``se_if_cmd_lock``: held for the entire send+receive cycle, so only
+   one ioctl command is in flight on a given MU at a time.
+
+3. ``set_dev_ctx_as_command_receiver()`` re-checks under modify_lock
+   after the response arrives. If two callers race past layer 1, FW
+   itself rejects the second ELE_STORAGE_OPEN_REQ before any handle is
+   allocated.
+
+Signal handling after a completed hardware operation
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+A signal may arrive after the firmware has already executed the command
+and delivered its response into the MU receive buffer. The driver detects
+this case and preserves state before returning ``-EINTR``::
+
+  Userspace            Kernel (se_ctrl)          FW (ELE)
+      |                    |                      |
+      |--ioctl(SEND_RCV)-->|                      |
+      |            ele_msg_send_rcv()             |
+      |                    |--CMD_REQ------------>|
+      |  [signal arrives]  |                      | (FW executes,
+      |                    |                      |  allocates handle,
+      |                    |                      |  writes response)
+      |                    |<--CMD_RSP------------|
+      |  wait_for_completion_interruptible()      |
+      |  wakes: signal seen -> -ERESTARTSYS       |
+      |                    |                      |
+      |            [response is in rx_msg:        |
+      |             validate with                 |
+      |             se_val_rsp_hdr_n_status()]    |
+      |            [fw_api_specific_ops()         |
+      |             (is_cmd_interrupted=true):    |
+      |             for SESSION_OPEN: record      |
+      |             handle, close session via     |
+      |             se_close_session(), clear;    |
+      |             for STORAGE_OPEN: record      |
+      |             handle, close storage via     |
+      |             se_close_storage(), return 0] |
+      |            err = -EINTR                   |
+      |            (not -ERESTARTSYS:             |
+      |             prevents VFS auto-restart)    |
+      |<--ioctl -EINTR-----|                      |
+      |                    |                      |
+      | [signal handler runs; userspace decides   |
+      |  whether to re-issue; FW handle tracked   |
+      |  or cleaned up; no firmware resource leak]|
+
+Returning ``-EINTR`` instead of ``-ERESTARTSYS`` is intentional: the VFS
+would transparently restart an ioctl on ``-ERESTARTSYS``, re-running the
+command with already-zeroed shared input buffers. ``-EINTR`` lets userspace
+enter its signal handler and decide whether to reissue the command.
+
+.. kernel-doc:: drivers/firmware/imx/se_ctrl.c
+   :export:

-- 
2.43.0

