Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010009.outbound.protection.outlook.com [52.101.201.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FE151C34C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545523; cv=fail; b=r6XJe/m3Ww/iqYIjZoD3kZKjX0tKUtxmP9n7eFz0J8KXlNGg0trFqBaPj+37rvQk7iV0Cc9+Zcd96RUKvBaB+z5Y/Iff8DbZO6hFWEnFcrYjX4JyJ5JdK1t9bB7YoYGoxdO2ZsYHLmmnozlRj7E+sE00d0N/1otwfYJGhTHfoaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545523; c=relaxed/simple;
	bh=c4ek/iIMLtiY9FXQFWrV/BG5asm+RYxgJGJfxg3qjWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LTnx9cevwzK8yfA8yRouH+YK/ooADG5EuGivfQJpN+iGeyZXBHEktL6PFKIkJCg7O13UlUp97CnT63Q5jmcCU4GKgDy+Q3GZGoxyfE9ryrELouGvIjzaPvsGNudwNdpQOCIXcBHW63sSk96DmB1ODB2yUeg9z7zijTBICuq5Tr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Lmjg6i6R; arc=fail smtp.client-ip=52.101.201.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Lmjg6i6R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aK/moHS5N5D412F6UU2Yd/MHfIyNnYWdUvzQpP5LcI4aQnWl4gkiOP/M+Vw8QMe5wnTtkZ16HYwtWb6Zy//ScHtoS5g6CbFtXuBiqQHk9cfoTUAE4c6iydydONPhOtk6xcMD0Hj8m6JPGLtP6pbN/pGkhEqG1McvF7XEEJA66zMtjkHxzp2UHznBuGv+MXMU0LnntsoWubADydl6+sEj6hzsh9Xslz+0gnHe2PzqqFwcmArC1waVRKFxy9VpXxNeMn4WVJv0oWqgyNuoEpXw4lZWAO8qMmCqZLDEryH2QcU5sMz+lAJZbGhUeKG3aDiCqF/qo6asUHL2sYUgMdk2VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwNCxohRO1SFDa4dh5Niedqv2eYKjg4F7qObYSDMZdg=;
 b=E5uR9+YIqgDR/5i4t4ivBK7m72CFRSO+Is4QW8a4hY3RFysCqrx65pudFfK59tk8biwiovjCUCEBhmp26BxRoA3yNuApquTNbmBIMH4OH/g4GhFXB8YDVyMGjIUVX70phQntvkuB4YS6tKU6P/N/j3n3iJXtjvsfJlguoSJf4fcTkp2laQfPJlk9/YoRMRjvn8f3zh7X0wURFiieqTwtQY72lcUWBz+f5+EuhrG10znA0tikhsDTkZ6Ld3Q4ntaKj8BwTXO0KulmQBDvomYFcSZESnFGzIT6AFNIN/F9XVxvWa8ureIf+dnK6MBn4iKPnncwy7sT9vItK7UY/HqPzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwNCxohRO1SFDa4dh5Niedqv2eYKjg4F7qObYSDMZdg=;
 b=Lmjg6i6RWwy22N6ayhfQ8DCa/svvHczrTG2WBILn2M1BPR40DxV+HwnqdO3ssuwnn5V+yYvwfeW1gbBwhgvw0tvn72FI9MBD4MWxmujuw3cdv8uYJCMH1leq8hUSX6SUkTzOx531T/EpapNfb9Ho7akrYVIk27tiJ/v8zWDiNUX/D2bTFtY9/vi6DR44RxMc/sx6zrPkJkzp7j9IJelz0WlXKW/gINHdK6LAcQxxnffx7AlRsLPsht3sCzn5pFY872VeaPw2VhkkVJy8U38Zc3RsKMO7IA4RzfrObh6Y20qyBakQCELGDhD53UHUTfTf7+lOpa1ab0gsGuoRq7Wgdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from MW4PR03MB6555.namprd03.prod.outlook.com (2603:10b6:303:126::12)
 by SJ0PR03MB6567.namprd03.prod.outlook.com (2603:10b6:a03:388::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 18:11:50 +0000
Received: from MW4PR03MB6555.namprd03.prod.outlook.com
 ([fe80::c8e9:5e5d:afad:5eaa]) by MW4PR03MB6555.namprd03.prod.outlook.com
 ([fe80::c8e9:5e5d:afad:5eaa%5]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 18:11:50 +0000
From: hang.suan.wang@altera.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com,
	tze.yee.ng@altera.com,
	chee.nouk.phoon@altera.com,
	genevieve.chan@altera.com,
	adrian.ho.yin.ng@altera.com
Subject: [PATCH v4 3/3] firmware: socfpga-fcs: add Altera SoCFPGA FCS driver with SDOS
Date: Fri,  4 Sep 2026 11:11:44 -0700
Message-ID: <9434b1fa4f4185e098e1b5bfd9fa27d5f8e98de9.1788537447.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1788537447.git.hang.suan.wang@altera.com>
References: <cover.1788537447.git.hang.suan.wang@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:a03:332::6) To MW4PR03MB6555.namprd03.prod.outlook.com
 (2603:10b6:303:126::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6555:EE_|SJ0PR03MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: 9513a796-1f1b-4215-9a9c-08df0aaffd92
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|22082099003|56012099006|5023799004|11063799006|6133799003|3023799007|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IhMkKZMx1JJSZXeEntqsHReIVQ4GtzuzppTfu0kjYxCI0QZieQmUIiZQdQnEbVvexD0A8HyPiCEOEosCgtJELOqx8/x1Gvawtx+NcLnm+DMk2xzXcNDy+5Va3Qaxrn7+/oEaziCZu5IjOaEkbCtCvPgo8VvjLm8tgDwDTHpGxqtdydlbveKC0rEcbeWDHoXHpBpuMsujPECuPNsMO6fPOi+RzfFNS8l243WiK9wMItA4nViDzUT79iqvyhU5vUcNrnpFNmxFSzpe469ZyYUWR+REb9P53rFkF0tDq9idOLXtgAWGw5YUoh5FPvSNttcfrKDS2/XGcW2gOCcWEbiQWFGcWvOONd3XxXByMYWDfSlhopEnfkJRL8fqjjuh4uSOiCt6sotamMkYduLEx6XSDMbQrt45cp3Z7ldWKHwz2bXdMY9OFJffvnO+aow8y2bxjRMvKr6wzGfc/cQBH+/WDX/DpynttcpH92AKQIUHK0a2R770i6c1x2KZ8+y8fHuRcqB8QttdZjydddhAbTNZIGrFh+YaNCLlUkuTKybgxnyDn9+7SSr14shVSDwpxdUalWZZNxCRGf1NtCy1iNuA41p8iJMsYOhV1TC8BwH2q4657hIChqq56ACw9l5X8NOMUe+EpJvxItu5s+jgE5agOAMp7PB+G5J9IGA+fP/UigI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(22082099003)(56012099006)(5023799004)(11063799006)(6133799003)(3023799007)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clgwTy9hcm9odlBmaEdqSWUzUENjZm83OXB1MnpaZjhkY1A4bGRQMVpTdTcz?=
 =?utf-8?B?RkVJbFcxV1Arb3hGdWRmTVBqUElVMERIS0F2SkMvaWFtZHZBWHYySUFYTjRp?=
 =?utf-8?B?NTBta0VtaEVBdFNnUGpualdCSVR5KzhxUGhiZkFnYlZTTUtNejBHRnpvcnY4?=
 =?utf-8?B?N2xPRFM2eUN5SWhDY0ZKejNzdzZjd0FXcmRxMUtlK3BOeDloMXdMdmFweHQ2?=
 =?utf-8?B?NDRIVjFnVHVPUVE2bnRoMUFXMXFkZG9HVWdBa2Rmd2krcmFKM2Z3aGltbS9w?=
 =?utf-8?B?TmxtQVNiS1lkQkZaeTlVUkxWZVJtWExmeWs1TXEyaEI1eEQwZzliQy9ZdDlS?=
 =?utf-8?B?NHJhNDVuRUw4b0RZS05zMXBmelhtdXdEbGU1aDd5TFZwc0txeng2UVhpQzU3?=
 =?utf-8?B?bTk0NGhwUzB4elI4M3VnN2N6RUd6Nm9XK3F4WnErdE95RUJzZ2NJRkdKV1Yy?=
 =?utf-8?B?c2VLR3k0UGZPVHU3QVJTdDhOMjJxaEN0cEo2K1VsQk5yVDBPWHRjUmR6OS8y?=
 =?utf-8?B?cWVhbmVKWEE4THgxVWtTbTFwR0RVVTFzckpGcTAzU0Jsd0c4Qm9rbXBUVHZU?=
 =?utf-8?B?UmlhZVVYTVBsNW9WWFAzNktjSWFnYWZuREczUUVwTHFWczZKUEdqTHltSXVC?=
 =?utf-8?B?aGpmY2IwNUFCaXVDQlNrZTNYOUdFZ200VDZQUFdWUkkzRjF2ckp1V2VvQWFi?=
 =?utf-8?B?UzQySWdnMm1jYmJUU3p2UEEzN3RjOWNXbStWWEczQi96V2JaVC9wd0poenVj?=
 =?utf-8?B?eitkczd4ZU1zMEVCOWlHelBmcEJTT2dhcERFQVgwajY2UmdTUkxBaytlbWpq?=
 =?utf-8?B?QjlkanRZYjN4ZFNoS01OUzN2YUJrMnIvSHRwRnM4aG5iaDIyNmpGS3NZV1FS?=
 =?utf-8?B?M2RidEM1YU9zWjg4WXcvL29vaEZxWmwvZUlCRVUyWSsxQTY1LzVCYzRUeURW?=
 =?utf-8?B?WkhITFJMdG1ENk5CdTZLcUx5N1NrMk5aaDNtNXRUWUNtckZ3d2NMTlZaOWVu?=
 =?utf-8?B?bUEvYS84d0FmYzNva3Nmdzg2dER0TTFvUENUc0VNSnV0S0JNSUpGMksyZm9t?=
 =?utf-8?B?RTcyWEF1c0RYUzFvaEllVHBLOTlER2ZINnd0aCs3eDdwMENuOGJ2bkJtZG1F?=
 =?utf-8?B?NWpzcHQvL1pBTnBaOUwxNi82dmRhcTR3eVJvY0JzKzIwNEFuYWRzK3dxVEts?=
 =?utf-8?B?NjJVc3BlRmlpTjB4Vy94YlluajRPUnp5bnVhZWhLa2dRUGxnVnNrY0tLbnFn?=
 =?utf-8?B?cFA2K0VsdzEvbTVsM1JTR2lUTlhFencxMHBpMjdnOHBuVmxRazZjZG1GY1dO?=
 =?utf-8?B?em1obmdsZlR5VjJZbDZHSHQyQ29xS0p6SXVQUzJ0T3BrOVo0ZUpqMExUOTJu?=
 =?utf-8?B?RnllUlFiQWhoSGg3UVdYRmpMaERsU2F5bzFYWDU0R2lUZDAyVWdTVmhWdEJE?=
 =?utf-8?B?dlV5S0liRi9xOFFGR3VOUFM0ejVQSDhMWkt2aS9JQnBRRHhsZmZ4ditmZkhB?=
 =?utf-8?B?OHNadWZpNFVwK2xrMzdvTDZKZ1ZBNHFKUkpVd3QyWkRlVk14Q0NvREo0bHRL?=
 =?utf-8?B?THl5ZUlXUVI2SGNkUHNPV2F4bExCdDUwajZTTVJaU1l3QWlCdDB5OEJVZC8r?=
 =?utf-8?B?Z1laSXBhSi90K1BvLzllcGF2VTdzYitqd1lhZGtWSFg1Qk0rWmluUXJzQXFJ?=
 =?utf-8?B?TW05aHZRcHhJand5RG5HZ2dHcUxTYk0vSVJ3OElVck96Zk1PcHd5Y0VNU1dS?=
 =?utf-8?B?R0xVOFIxdEVBaVo0VGlPRzFRMHMrVHF1em9TKzFMdHZCZVYwRU9abXdCNURK?=
 =?utf-8?B?VkNFZjV0NEgzSk5QSGs5MmpJdWFQdVJaSlpUSnA0cVpDdzVOWEhpV1pDZW9Q?=
 =?utf-8?B?QjlhVFhjV2RSbHlEcVlQRXFHd3RjS1pGTGVkNlZnRDJjamlRdEI5cktHYnp3?=
 =?utf-8?B?SDJ6UWNCaDJMMHF6d3crK094QmJVQTBub1ZTSGFDV0ZKcFJWQmhOU0laZkM0?=
 =?utf-8?B?WVlDZHlsZ3NFTDQ3a0c1VGFBUTd4ZVRzM20xMzg0dVVueUJSbzdPYnV3YXlO?=
 =?utf-8?B?dEFkc0RUUTVjeTJKaUNNcnlKOUs2cmhOVUQxZERSQ0xNMUJQTk11U3VmQ003?=
 =?utf-8?B?S1ZBSE5uaHNnNkNJZTNwZEwvK0c4OGZXMHB4L2NiY0pwYy9LL2ZvenBTNHhH?=
 =?utf-8?B?Y0Z6M01MbWZVZ2VQWkNiSyttWWdhS0hic2xDY1lzUEU5cWVWRkZ6a2FIVEpw?=
 =?utf-8?B?dVUxMXAwODJrOVo2ZDU2SnQ2ODNZd2hOZ1dxOFh5YnErUlQ2dGJJbGdLcXZ5?=
 =?utf-8?B?bEZNaDlkcURZVVIyN1o2NGIrRk9ueDVEa3RZdGxGcEllbWs1NjZJamVVVi9W?=
 =?utf-8?Q?9B8qkVM4ymGdrrNU=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9513a796-1f1b-4215-9a9c-08df0aaffd92
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 18:11:50.1035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/SXmLdrN4Z4MWTPVaDKfgbzmd2I+MN2iUfQPeqawpyqir/BWQSr99F5plcqu5sxjruEb6y+mKN+QX0cxEWgJ6TUtYKy2dc7vcBhsXJxEfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6567

From: Hang Suan Wang <hang.suan.wang@altera.com>

Add the Altera SoCFPGA Crypto Service (FCS) driver, which exposes the
Secure Data Object Service (SDOS) encrypt/decrypt operation to
non-secure host software.

The SDOS protects data at rest: the SDM encrypts and decrypts using a key
derived from a device-unique SDOS root key plus an SDM-generated IV, so
the host never handles raw key material or IVs. It only submits plaintext
it already owns and receives authenticated ciphertext objects managed by
the SDM. A primary use case is black key, where operational keys are
installed without ever appearing in cleartext.

The driver is a standalone module and describes no hardware of its own.
It binds by name to the "stratix10-fcs" platform device registered by
stratix10-svc, so no device-tree node is required. SDOS requests go to
the SDM through the stratix10-svc asynchronous SIP SMC path using
service-layer memory pool buffers that the SDM can reach via physical or
SMMU-remapped addresses. Userspace talks to /dev/socfpga-fcs via ioctl
and sysfs exposes atf_version.

For encryption the SDM returns a structured object (header, ciphertext,
HMAC). For decryption the SDM validates the HMAC and enforces the 64-bit
owner ID from the object header so only the creator can decrypt it.

Each SDOS request opens an SDM crypto session, runs under priv->lock
(one in-flight transaction), and closes the session afterwards.

Signed-off-by: Hang Suan Wang <hang.suan.wang@altera.com>
---
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 MAINTAINERS                                   |   9 +
 drivers/firmware/Kconfig                      |  17 +
 drivers/firmware/Makefile                     |   2 +
 drivers/firmware/socfpga-fcs-core.c           | 684 ++++++++++++++++++
 drivers/firmware/socfpga-fcs.c                | 294 ++++++++
 include/linux/firmware/intel/socfpga-fcs.h    | 130 ++++
 include/uapi/misc/socfpga-fcs-crypto.h        |  28 +
 8 files changed, 1165 insertions(+)
 create mode 100644 drivers/firmware/socfpga-fcs-core.c
 create mode 100644 drivers/firmware/socfpga-fcs.c
 create mode 100644 include/linux/firmware/intel/socfpga-fcs.h
 create mode 100644 include/uapi/misc/socfpga-fcs-crypto.h

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 2fc53093752d..a1e07f7f6870 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -348,6 +348,7 @@ Code  Seq#    Include File                                             Comments
                                                                        <mailto:luzmaximilian@gmail.com>
 0xA6  00-0F  uapi/linux/alloc_tag.h                                    Memory allocation profiling
                                                                        <mailto:surenb@google.com>
+0xA6  00-1F  uapi/misc/socfpga-fcs-crypto.h                            Altera SoCFPGA FCS (Crypto Service)
 0xAA  00-3F  linux/uapi/linux/userfaultfd.h
 0xAB  00-1F  linux/nbd.h
 0xAC  00-1F  linux/raw.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 627595e245f3..1960094f284d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -945,6 +945,15 @@ ALPS PS/2 TOUCHPAD DRIVER
 R:	Pali Rohár <pali@kernel.org>
 F:	drivers/input/mouse/alps.*
 
+ALTERA FCS DRIVER
+M:	Hang Suan Wang <hang.suan.wang@altera.com>
+M:	Genevieve Chan <genevieve.chan@altera.com>
+L:	linux-arm-kernel@lists.infradead.org
+S:	Maintained
+F:	drivers/firmware/socfpga-fcs*
+F:	include/linux/firmware/intel/socfpga-fcs*
+F:	include/uapi/misc/socfpga-fcs*
+
 ALTERA MAILBOX DRIVER
 M:	Tien Sung Ang <tiensung.ang@altera.com>
 S:	Maintained
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index b7cc11e4fbfa..15727855fd5f 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -193,6 +193,23 @@ config INTEL_STRATIX10_RSU
 
 	  Say Y here if you want Intel RSU support.
 
+config ALTERA_SOCFPGA_FCS
+	tristate "Altera SoCFPGA Crypto Services (FCS)"
+	depends on INTEL_STRATIX10_SERVICE
+	help
+	  Altera SoCFPGA Crypto Services (FCS) driver gives user space
+	  access to the crypto services of the Secure Device Manager (SDM)
+	  through the Intel Service Layer, with requests forwarded to Arm
+	  Trusted Firmware.
+
+	  The SDM executes or authorizes the requests using device-rooted
+	  security resources. Protected key material stays within the
+	  secure firmware boundary and is never exposed to non-secure host
+	  software.
+
+	  Say Y here to add support for Altera SoCFPGA Crypto Services
+	  (FCS).
+
 config MTK_ADSP_IPC
 	tristate "MTK ADSP IPC Protocol driver"
 	depends on MTK_ADSP_MBOX
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index be46f1e1dc77..10431273e401 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -11,6 +11,8 @@ obj-$(CONFIG_EDD)		+= edd.o
 obj-$(CONFIG_DMIID)		+= dmi-id.o
 obj-$(CONFIG_INTEL_STRATIX10_SERVICE) += stratix10-svc.o
 obj-$(CONFIG_INTEL_STRATIX10_RSU)     += stratix10-rsu.o
+obj-$(CONFIG_ALTERA_SOCFPGA_FCS) += altera-fcs.o
+altera-fcs-y := socfpga-fcs.o socfpga-fcs-core.o
 obj-$(CONFIG_ISCSI_IBFT_FIND)	+= iscsi_ibft_find.o
 obj-$(CONFIG_ISCSI_IBFT)	+= iscsi_ibft.o
 obj-$(CONFIG_FIRMWARE_MEMMAP)	+= memmap.o
diff --git a/drivers/firmware/socfpga-fcs-core.c b/drivers/firmware/socfpga-fcs-core.c
new file mode 100644
index 000000000000..bb8d8fa9546f
--- /dev/null
+++ b/drivers/firmware/socfpga-fcs-core.c
@@ -0,0 +1,684 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Altera Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/random.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+#include <linux/firmware/intel/socfpga-fcs.h>
+#include <linux/firmware/intel/stratix10-svc-client.h>
+
+#define OWNER_ID_OFFSET				12
+
+#define SDOS_DECRYPTION_REPROVISION_KEY_WARN	0x102
+#define SDOS_DECRYPTION_NOT_LATEST_KEY_WARN	0x103
+
+#define MSG_RETRY				3
+#define FCS_RETRY_SLEEP_MS			1
+
+struct fcs_cmd_params {
+	const void	*src;
+	void		*dst;
+	u32		src_len;
+	u32		dst_len;
+	u32		op_mode;
+	u64		own;
+};
+
+/**
+ * fcs_atf_version_callback() - service-layer callback for the ATF version query
+ * @client: pointer to the stratix10-svc client
+ * @data: pointer to the service-layer callback data
+ */
+static void fcs_atf_version_callback(struct stratix10_svc_client *client,
+				     struct stratix10_svc_cb_data *data)
+{
+	struct socfpga_fcs_priv *p = client->priv;
+
+	p->status = data->status;
+	if (data->status == BIT(SVC_STATUS_OK)) {
+		p->status = 0;
+		p->atf_version[0] = *((unsigned int *)data->kaddr1);
+		p->atf_version[1] = *((unsigned int *)data->kaddr2);
+		p->atf_version[2] = *((unsigned int *)data->kaddr3);
+		p->atf_version_valid = true;
+	} else if (data->status == BIT(SVC_STATUS_ERROR)) {
+		p->status = *((unsigned int *)data->kaddr1);
+		dev_err(client->dev, "mbox_error=0x%x\n", p->status);
+	}
+
+	complete(&p->completion);
+}
+
+/**
+ * fcs_async_callback() - completion callback for an async service request
+ * @ptr: pointer to the completion to signal
+ */
+static void fcs_async_callback(void *ptr)
+{
+	if (ptr)
+		complete(ptr);
+}
+
+/**
+ * fcs_svc_send_sync() - run a command on the synchronous service path
+ * @msg: service-layer message to send
+ * @timeout: time to wait for the response
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_svc_send_sync(struct socfpga_fcs_priv *priv,
+			     struct stratix10_svc_client_msg *msg,
+			     unsigned long timeout)
+{
+	int ret;
+
+	reinit_completion(&priv->completion);
+
+	/*
+	 * receive_cb is only used by the sync send path; leave it set so a
+	 * late response cannot find a NULL callback.
+	 */
+	priv->client.receive_cb = fcs_atf_version_callback;
+
+	ret = stratix10_svc_send(priv->chan, msg);
+	if (ret) {
+		pr_err("failed to send message to service channel\n");
+		priv->client.receive_cb = NULL;
+		return ret;
+	}
+
+	if (!wait_for_completion_timeout(&priv->completion,
+					 msecs_to_jiffies(timeout))) {
+		pr_err("svc timeout to get completed status\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+/**
+ * fcs_svc_send_async() - run a command on the asynchronous mailbox path
+ * @msg: service-layer message to send
+ * @timeout: time to wait for the response
+ *
+ * Return: 0 once the transaction completed, negative errno on transport
+ *         failure or timeout.
+ */
+static int fcs_svc_send_async(struct socfpga_fcs_priv *priv,
+			      struct stratix10_svc_client_msg *msg,
+			      unsigned long timeout)
+{
+	unsigned long deadline = jiffies + msecs_to_jiffies(timeout);
+	struct stratix10_svc_cb_data data;
+	void *handle = NULL;
+	int status, index;
+	int ret;
+
+	/*
+	 * Use priv->completion, not a stack one: on timeout this function
+	 * returns while the svc layer still holds a pointer to it.
+	 */
+	reinit_completion(&priv->completion);
+
+	for (index = 0; index < MSG_RETRY; index++) {
+		status = stratix10_svc_async_send(priv->chan, msg, &handle,
+						  fcs_async_callback,
+						  &priv->completion);
+		if (status == 0)
+			break;
+		msleep(FCS_RETRY_SLEEP_MS);
+	}
+
+	if (status || !handle) {
+		pr_err("Failed to send async message\n");
+		/*
+		 * A NULL handle with a success status would otherwise be
+		 * reported as a completed transaction that never ran.
+		 */
+		return status ? status : -EIO;
+	}
+
+	ret = -ETIMEDOUT;
+	while (!time_after(jiffies, deadline)) {
+		status = stratix10_svc_async_poll(priv->chan, handle, &data);
+
+		if (status == 0) {
+			ret = 0;
+			break;
+		}
+
+		/*
+		 * Keep polling until the deadline. Leaving an in-flight
+		 * transaction orphans the SDM crypto session.
+		 */
+		ret = status;
+		msleep(FCS_RETRY_SLEEP_MS);
+	}
+
+	if (ret) {
+		pr_err("Failed to poll async message\n");
+		goto out;
+	}
+
+	priv->status = data.status;
+
+	/*
+	 * Non-zero SDM status is a firmware result, not a transport failure.
+	 * Store it in priv->status and return success to the caller.
+	 */
+	if (data.status) {
+		pr_err("%s: SDM mailbox status 0x%x\n", __func__, data.status);
+		goto out;
+	}
+
+	if (data.kaddr1)
+		priv->resp = *((u32 *)data.kaddr1);
+
+out:
+	stratix10_svc_async_done(priv->chan, handle);
+
+	return ret;
+}
+
+/**
+ * fcs_svc_send_request() - build and send an FCS command to the service layer
+ * @command: FCS command code to dispatch
+ * @timeout: time to wait for completion, in milliseconds
+ * @params: payload and arguments for @command, or NULL for commands that
+ *          carry none
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_svc_send_request(struct socfpga_fcs_priv *priv,
+				enum fcs_command_code command,
+				unsigned long timeout,
+				const struct fcs_cmd_params *params)
+{
+	struct stratix10_svc_client_msg *msg;
+	int ret = 0;
+
+	/*
+	 * The service layer keeps this message alive in its transaction handle
+	 * and still dereferences it from stratix10_svc_async_done(), so it
+	 * cannot live on our stack.
+	 */
+	msg = kzalloc_obj(*msg);
+	if (!msg)
+		return -ENOMEM;
+
+	priv->status = 0;
+	priv->resp = 0;
+
+	switch (command) {
+	case FCS_DEV_CRYPTO_OPEN_SESSION:
+		pr_debug("Sending command: COMMAND_FCS_CRYPTO_OPEN_SESSION\n");
+		msg->command = COMMAND_FCS_CRYPTO_OPEN_SESSION;
+		break;
+
+	case FCS_DEV_CRYPTO_CLOSE_SESSION:
+		pr_debug("Sending command: COMMAND_FCS_CRYPTO_CLOSE_SESSION with session_id: 0x%x\n",
+			 priv->session_id);
+		msg->arg[0] = priv->session_id;
+		msg->command = COMMAND_FCS_CRYPTO_CLOSE_SESSION;
+		break;
+
+	case FCS_DEV_ATF_VERSION:
+		pr_debug("Sending command: COMMAND_SMC_ATF_BUILD_VER\n");
+		msg->command = COMMAND_SMC_ATF_BUILD_VER;
+		break;
+
+	case FCS_DEV_SDOS_DATA_EXT:
+		if (!params) {
+			ret = -EINVAL;
+			break;
+		}
+		pr_debug("Sending command: COMMAND_FCS_SDOS_DATA_EXT with session_id: 0x%x, context_id: 0x%x, op_mode: 0x%x, own: 0x%llx\n",
+			 priv->session_id, priv->context_id,
+			 params->op_mode, params->own);
+		msg->arg[0] = priv->session_id;
+		msg->arg[1] = priv->context_id;
+		msg->arg[2] = params->op_mode;
+		msg->arg[3] = params->own;
+		msg->payload = (void *)params->src;
+		msg->payload_length = params->src_len;
+		msg->payload_output = params->dst;
+		msg->payload_length_output = params->dst_len;
+		msg->command = COMMAND_FCS_SDOS_DATA_EXT;
+		break;
+
+	default:
+		pr_err("Unknown command: 0x%x\n", command);
+		ret = -EINVAL;
+		break;
+	}
+
+	if (!ret) {
+		if (command == FCS_DEV_ATF_VERSION)
+			/* ATF fast call for simple command */
+			ret = fcs_svc_send_sync(priv, msg, timeout);
+		else
+			ret = fcs_svc_send_async(priv, msg, timeout);
+	}
+
+	kfree(msg);
+
+	return ret;
+}
+
+/**
+ * fcs_open_session_locked() - open a crypto session on the SDM
+ *
+ * Enforce the single-session rule and, on success, record the SDM session
+ * handle in @priv->session_id. The caller must hold @priv->lock.
+ * @priv->status carries the mailbox status.
+ *
+ * Return: 0 on success, -EBUSY if a session is already open, or negative
+ *         errno on transport/mailbox failure.
+ */
+static int fcs_open_session_locked(struct socfpga_fcs_priv *priv)
+{
+	int ret;
+
+	lockdep_assert_held(&priv->lock);
+
+	if (priv->session_id)
+		/* SDM allows one crypto session at a time */
+		return -EBUSY;
+
+	ret = fcs_svc_send_request(priv, FCS_DEV_CRYPTO_OPEN_SESSION,
+				   SVC_FCS_REQUEST_TIMEOUT_MS, NULL);
+	if (ret)
+		return ret;
+
+	if (priv->status)
+		return -EIO;
+
+	priv->session_id = priv->resp;
+
+	return 0;
+}
+
+/**
+ * fcs_close_session_locked() - close the crypto session on the SDM
+ *
+ * Caller must hold @priv->lock. The local session id is cleared even if
+ * close fails, so a stuck session cannot block future opens.
+ *
+ * Return: 0 on success or when no session is open, negative errno otherwise.
+ */
+static int fcs_close_session_locked(struct socfpga_fcs_priv *priv)
+{
+	int ret;
+
+	lockdep_assert_held(&priv->lock);
+
+	if (!priv->session_id)
+		/* nothing to close */
+		return 0;
+
+	ret = fcs_svc_send_request(priv, FCS_DEV_CRYPTO_CLOSE_SESSION,
+				   SVC_FCS_REQUEST_TIMEOUT_MS, NULL);
+
+	priv->session_id = 0;
+
+	if (!ret && priv->status)
+		ret = -EIO;
+
+	return ret;
+}
+
+/**
+ * fcs_ctx_begin() - open a crypto session and start a context on it
+ *
+ * The SDM runs one crypto context at a time and will not start another until
+ * the current one finishes, so the caller must hold @priv->lock for the whole
+ * operation. Every command issued in between then picks up
+ * @priv->context_id.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_ctx_begin(struct socfpga_fcs_priv *priv)
+{
+	int ret;
+
+	lockdep_assert_held(&priv->lock);
+
+	ret = fcs_open_session_locked(priv);
+	if (ret)
+		return ret;
+
+	/*
+	 * SDM requires a non-zero context ID per request. A random value
+	 * also avoids mistaking a late response from a retired context.
+	 */
+	priv->context_id = get_random_u32_above(0);
+
+	return 0;
+}
+
+/**
+ * fcs_ctx_end() - finish the current context and close the session
+ *
+ * Closing the session is what reclaims the SDM context, so this runs on every
+ * exit path of an operation whether it succeeded or not.
+ *
+ * Return: 0 on success, negative errno otherwise.
+ */
+static int fcs_ctx_end(struct socfpga_fcs_priv *priv)
+{
+	lockdep_assert_held(&priv->lock);
+
+	priv->context_id = 0;
+
+	return fcs_close_session_locked(priv);
+}
+
+/**
+ * fcs_get_atf_version() - return the cached Arm Trusted Firmware version
+ * @version: array of three u32 entries to receive the major, minor and patch
+ *           version numbers
+ *
+ * Return: 0 on success, -ENODEV if the driver is not initialised, -ENODATA if
+ *         the probe-time query produced no version.
+ */
+int fcs_get_atf_version(struct socfpga_fcs_priv *priv, u32 *version)
+{
+	if (!priv->atf_version_valid)
+		return -ENODATA;
+
+	memcpy(version, priv->atf_version, sizeof(priv->atf_version));
+
+	return 0;
+}
+
+/**
+ * fcs_alloc_buf() - allocate a service-layer buffer for a mailbox payload
+ * Wraps the stratix10-svc allocator so front-ends can stage payloads without
+ * touching the service channel themselves.
+ *
+ * @len: size of the buffer in bytes
+ * Return: pointer to the buffer, or an ERR_PTR on failure.
+ */
+void *fcs_alloc_buf(struct socfpga_fcs_priv *priv, size_t len)
+{
+	return stratix10_svc_allocate_memory(priv->chan, len);
+}
+
+/**
+ * fcs_free_buf() - release a buffer obtained from fcs_alloc_buf()
+ * @buf: buffer to release; NULL and error pointers are ignored
+ */
+void fcs_free_buf(struct socfpga_fcs_priv *priv, void *buf)
+{
+	if (!IS_ERR_OR_NULL(buf))
+		stratix10_svc_free_memory(priv->chan, buf);
+}
+
+/**
+ * fcs_sdos_output_size() - validate an SDOS input length and size its output
+ * @op_mode: non-zero to encrypt, zero to decrypt
+ * @src_len: length of the input, including the SDOS header
+ * @out_len: receives the output capacity the SDM may need
+ *
+ * Return: 0 on success, -EINVAL if @src_len is out of range for @op_mode.
+ */
+int fcs_sdos_output_size(u32 op_mode, u32 src_len, u32 *out_len)
+{
+	if (op_mode) {
+		/* encrypt: input is header + plaintext */
+		if (src_len < SDOS_DECRYPTED_MIN_SZ ||
+		    src_len > SDOS_DECRYPTED_MAX_SZ)
+			return -EINVAL;
+
+		*out_len = SDOS_ENCRYPTED_MAX_SZ;
+	} else {
+		/* decrypt: input is header + plaintext + HMAC */
+		if (src_len < SDOS_ENCRYPTED_MIN_SZ ||
+		    src_len > SDOS_ENCRYPTED_MAX_SZ)
+			return -EINVAL;
+
+		*out_len = SDOS_DECRYPTED_MAX_SZ;
+	}
+
+	return 0;
+}
+
+/**
+ * fcs_sdos_crypt() - perform an SDOS encrypt or decrypt operation
+ * @req: request describing the operation
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int fcs_sdos_crypt(struct socfpga_fcs_priv *priv, struct fcs_sdos_req *req)
+{
+	struct fcs_cmd_params params = { };
+	u32 output_size;
+	int ret;
+
+	if (!req->src || !req->dst)
+		return -EINVAL;
+
+	ret = fcs_sdos_output_size(req->op_mode, req->src_len, &output_size);
+	if (ret) {
+		pr_err("Invalid SDOS src_size %u\n", req->src_len);
+		return ret;
+	}
+
+	/* The caller must have sized the output buffer for the worst case. */
+	if (req->dst_len < output_size)
+		return -EINVAL;
+
+	params.op_mode = req->op_mode;
+	params.src = req->src;
+	params.src_len = req->src_len;
+	params.dst = req->dst;
+	params.dst_len = req->dst_len;
+	/* Owner ID is stored little-endian in the SDOS header (offset 12) */
+	params.own = get_unaligned_le64((const u8 *)req->src + OWNER_ID_OFFSET);
+
+	/*
+	 * Only one SDM transaction may be in flight. Wait interruptibly so
+	 * a blocked caller remains killable.
+	 */
+	if (mutex_lock_interruptible(&priv->lock))
+		return -ERESTARTSYS;
+
+	/*
+	 * The device may have been removed while this caller held only a file
+	 * reference.
+	 */
+	if (priv->removed) {
+		mutex_unlock(&priv->lock);
+		return -ENODEV;
+	}
+
+	/*
+	 * SDOS is a single-command request: start a context, run the command
+	 * and finish the context before returning.
+	 */
+	ret = fcs_ctx_begin(priv);
+	if (ret) {
+		pr_err("SDOS: failed to start crypto context ret: %d\n", ret);
+		mutex_unlock(&priv->lock);
+		return ret;
+	}
+
+	ret = fcs_svc_send_request(priv, FCS_DEV_SDOS_DATA_EXT,
+				   SVC_FCS_REQUEST_TIMEOUT_MS, &params);
+	if (ret) {
+		pr_err("Failed to send the cmd=%d,ret=%d\n", FCS_DEV_SDOS_DATA_EXT, ret);
+		goto end_ctx;
+	}
+
+	req->status = priv->status;
+	req->status_valid = true;
+
+	if (priv->status &&
+	    priv->status != SDOS_DECRYPTION_REPROVISION_KEY_WARN &&
+	    priv->status != SDOS_DECRYPTION_NOT_LATEST_KEY_WARN) {
+		ret = -EIO;
+		pr_err("Failed to perform SDOS operation ret: %d Mailbox Status = 0x%x\n",
+		       ret, priv->status);
+		goto end_ctx;
+	}
+
+	if (priv->resp > req->dst_len) {
+		pr_err("SDOS output %u exceeds kernel buffer %u\n",
+		       priv->resp, req->dst_len);
+		ret = -EIO;
+		goto end_ctx;
+	}
+
+	req->dst_len = priv->resp;
+
+end_ctx:
+	/* Best-effort; the local session and context state is dropped regardless. */
+	fcs_ctx_end(priv);
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+/**
+ * fcs_read_version_from_atf() - query the Arm Trusted Firmware build version
+ * Send the ATF version command to the SDM and cache the result in @priv.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_read_version_from_atf(struct socfpga_fcs_priv *priv)
+{
+	int ret;
+
+	ret = fcs_svc_send_request(priv, FCS_DEV_ATF_VERSION,
+				   SVC_FCS_REQUEST_TIMEOUT_MS, NULL);
+	if (ret) {
+		pr_err("Failed to send the cmd=%d,ret=%d\n", FCS_DEV_ATF_VERSION, ret);
+		return ret;
+	}
+
+	if (priv->status) {
+		ret = -EIO;
+		pr_err("Mailbox error, Failed to read ATF version ret: %d\n", ret);
+	}
+
+	stratix10_svc_done(priv->chan);
+
+	return ret;
+}
+
+/**
+ * fcs_release() - final teardown, run when the last reference is dropped
+ * @kref: reference counter embedded in the FCS state
+
+ */
+static void fcs_release(struct kref *kref)
+{
+	struct socfpga_fcs_priv *priv =
+		container_of(kref, struct socfpga_fcs_priv, refcount);
+
+	if (priv->session_id) {
+		int ret;
+
+		mutex_lock(&priv->lock);
+		ret = fcs_close_session_locked(priv);
+		mutex_unlock(&priv->lock);
+
+		if (ret)
+			dev_err(priv->client.dev,
+				"Failed to close FCS service session,ret=%d\n",
+				ret);
+	}
+
+	stratix10_svc_remove_async_client(priv->chan);
+	stratix10_svc_free_channel(priv->chan);
+	mutex_destroy(&priv->lock);
+	kfree(priv);
+}
+
+/**
+ * fcs_get() - take a reference on the FCS state
+ * @priv: state returned by fcs_init()
+
+ */
+void fcs_get(struct socfpga_fcs_priv *priv)
+{
+	kref_get(&priv->refcount);
+}
+
+/**
+ * fcs_put() - drop a reference on the FCS state
+ * @priv: state returned by fcs_init()
+ */
+void fcs_put(struct socfpga_fcs_priv *priv)
+{
+	kref_put(&priv->refcount, fcs_release);
+}
+
+/**
+ * fcs_mark_removed() - refuse further operations after the device is gone
+ * @priv: state returned by fcs_init()
+ */
+void fcs_mark_removed(struct socfpga_fcs_priv *priv)
+{
+	mutex_lock(&priv->lock);
+	priv->removed = true;
+	mutex_unlock(&priv->lock);
+}
+
+/**
+ * fcs_init() - allocate and initialise the FCS private state
+ * @dev: pointer to fcs device
+
+ *
+ * Return: the new state, or an ERR_PTR on failure (which may be
+ *         -EPROBE_DEFER from the service layer).
+ */
+struct socfpga_fcs_priv *fcs_init(struct device *dev)
+{
+	struct socfpga_fcs_priv *priv;
+	int ret;
+
+	priv = kzalloc_obj(*priv);
+	if (!priv)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&priv->refcount);
+	mutex_init(&priv->lock);
+
+	/* kzalloc() already cleared client.receive_cb. */
+	priv->client.dev = dev;
+	priv->client.priv = priv;
+
+	priv->chan = stratix10_svc_request_channel_byname(&priv->client,
+							  SVC_CLIENT_FCS);
+	if (IS_ERR(priv->chan)) {
+		dev_err(dev, "couldn't get service channel %s\n", SVC_CLIENT_FCS);
+		ret = PTR_ERR(priv->chan);
+		goto err_free;
+	}
+
+	ret = stratix10_svc_add_async_client(priv->chan, true);
+	if (ret) {
+		dev_err(dev, "Failed to add async client\n");
+		stratix10_svc_free_channel(priv->chan);
+		goto err_free;
+	}
+
+	init_completion(&priv->completion);
+
+	/*
+	 * Version query failure is non-fatal; sysfs reports -ENODATA.
+	 */
+	fcs_read_version_from_atf(priv);
+
+	return priv;
+
+err_free:
+	mutex_destroy(&priv->lock);
+	kfree(priv);
+
+	return ERR_PTR(ret);
+}
diff --git a/drivers/firmware/socfpga-fcs.c b/drivers/firmware/socfpga-fcs.c
new file mode 100644
index 000000000000..c6cf03432307
--- /dev/null
+++ b/drivers/firmware/socfpga-fcs.c
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, Altera Corporation
+ */
+
+#include <linux/err.h>
+#include <linux/firmware/intel/socfpga-fcs.h>
+#include <linux/fs.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/sysfs.h>
+#include <linux/uaccess.h>
+#include <linux/util_macros.h>
+#include <uapi/misc/socfpga-fcs-crypto.h>
+
+/**
+ * atf_version_show() - report the Arm Trusted Firmware build version
+ * @dev: pointer to fcs device
+ * @attr: device attribute
+ * @buf: pointer to character buffer to receive the version string
+ *
+ * Return: number of bytes written to @buf.
+ */
+static ssize_t atf_version_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct socfpga_fcs_priv *priv = dev_get_drvdata(dev);
+	u32 version[3];
+	int ret;
+
+	ret = fcs_get_atf_version(priv, version);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u.%u.%u\n", version[0], version[1], version[2]);
+}
+
+/**
+ * fcs_sdos() - perform an SDOS encrypt/decrypt operation
+ * @priv: FCS state of the device this request arrived on
+ * @uarg: user pointer to a struct fcs_ioc_sdos
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static long fcs_sdos(struct socfpga_fcs_priv *priv, void __user *uarg)
+{
+	u32 __user *dst_size_uptr;
+	s32 __user *status_uptr;
+	struct fcs_sdos_req req = { };
+	struct fcs_ioc_sdos u;
+	void *s_buf, *d_buf;
+	u32 output_size;
+	u32 dst_cap;
+	long ret;
+
+	if (copy_from_user(&u, uarg, sizeof(u)))
+		return -EFAULT;
+
+	if (!u.dst || !u.dst_size)
+		return -EINVAL;
+
+	dst_size_uptr = u64_to_user_ptr(u.dst_size);
+	status_uptr = u64_to_user_ptr(u.error_code);
+
+	/* Caller-provided output buffer capacity (in/out parameter) */
+	if (get_user(dst_cap, dst_size_uptr))
+		return -EFAULT;
+
+	ret = fcs_sdos_output_size(u.op_mode, u.src_size, &output_size);
+	if (ret)
+		return ret;
+
+	s_buf = fcs_alloc_buf(priv, u.src_size);
+	if (IS_ERR(s_buf))
+		return PTR_ERR(s_buf);
+
+	d_buf = fcs_alloc_buf(priv, output_size);
+	if (IS_ERR(d_buf)) {
+		ret = PTR_ERR(d_buf);
+		goto free_sbuf;
+	}
+
+	/*
+	 * Copy before the engine takes its lock, so a slow or faulting source
+	 * buffer cannot stall unrelated FCS callers.
+	 */
+	if (copy_from_user(s_buf, u64_to_user_ptr(u.src), u.src_size)) {
+		ret = -EFAULT;
+		goto free_dbuf;
+	}
+
+	req.op_mode	= u.op_mode;
+	req.src		= s_buf;
+	req.src_len	= u.src_size;
+	req.dst		= d_buf;
+	req.dst_len	= output_size;
+
+	ret = fcs_sdos_crypt(priv, &req);
+	if (ret)
+		goto relay_status;
+
+	if (req.dst_len > dst_cap) {
+		pr_debug("SDOS output %u exceeds caller buffer %u\n",
+			 req.dst_len, dst_cap);
+		ret = -EMSGSIZE;
+		goto relay_status;
+	}
+
+	if (copy_to_user(u64_to_user_ptr(u.dst), d_buf, req.dst_len)) {
+		ret = -EFAULT;
+		goto relay_status;
+	}
+
+	if (put_user(req.dst_len, dst_size_uptr))
+		ret = -EFAULT;
+
+relay_status:
+	if (req.status_valid && put_user(req.status, status_uptr)) {
+		/* surface the copy failure only if nothing failed earlier */
+		if (!ret)
+			ret = -EFAULT;
+	}
+free_dbuf:
+	fcs_free_buf(priv, d_buf);
+free_sbuf:
+	fcs_free_buf(priv, s_buf);
+
+	return ret;
+}
+
+/**
+ * fcs_open() - take a reference on the device state for this file
+ * @inode: inode of the FCS misc device
+ * @file: open file being created
+ *
+ * Return: 0 always.
+ */
+static int fcs_open(struct inode *inode, struct file *file)
+{
+	struct miscdevice *miscdev = file->private_data;
+	struct socfpga_fcs_priv *priv =
+		container_of(miscdev, struct socfpga_fcs_priv, miscdev);
+
+	fcs_get(priv);
+	file->private_data = priv;
+
+	return 0;
+}
+
+/**
+ * fcs_release() - drop this file's reference on the device state to
+ * guarantees the crypto session is torn down when its owning fd is closed,
+ * including on process crash/exit
+ * @inode: inode of the FCS misc device
+ * @file: open file being released
+ *
+ * Return: 0 always.
+ */
+static int fcs_release(struct inode *inode, struct file *file)
+{
+	fcs_put(file->private_data);
+
+	return 0;
+}
+
+/**
+ * fcs_ioctl() - dispatch an FCS ioctl command
+ * @file: open file for the FCS misc device
+ * @cmd: ioctl command code
+ * @arg: user pointer to the command-specific argument structure
+ *
+ * Return: 0 on success, -ENOTTY for an unknown command, or a negative errno
+ *         from the handler.
+ */
+static long fcs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct socfpga_fcs_priv *priv = file->private_data;
+	void __user *uarg = (void __user *)arg;
+
+	switch (cmd) {
+	case FCS_IOC_SDOS:
+		return fcs_sdos(priv, uarg);
+	default:
+		return -ENOTTY;
+	}
+}
+
+static const struct file_operations fcs_fops = {
+	.owner		= THIS_MODULE,
+	.open		= fcs_open,
+	.release	= fcs_release,
+	.unlocked_ioctl	= fcs_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
+};
+
+static DEVICE_ATTR_RO(atf_version);
+
+static struct attribute *fcs_attrs[] = {
+	&dev_attr_atf_version.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(fcs);
+
+/**
+ * fcs_driver_probe() - probe the FCS platform device
+ * @pdev: pointer to the FCS platform device
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int fcs_driver_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct socfpga_fcs_priv *priv;
+	int ret;
+
+	priv = fcs_init(dev);
+	if (IS_ERR(priv))
+		return dev_err_probe(dev, PTR_ERR(priv),
+				     "Failed to initialize FCS\n");
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->miscdev.minor = MISC_DYNAMIC_MINOR;
+	priv->miscdev.name = "socfpga-fcs";
+	priv->miscdev.fops = &fcs_fops;
+	priv->miscdev.parent = dev;
+
+	ret = misc_register(&priv->miscdev);
+	if (ret) {
+		fcs_put(priv);
+		return dev_err_probe(dev, ret, "Failed to register misc device\n");
+	}
+
+	return 0;
+}
+
+/**
+ * fcs_driver_remove() - remove the FCS platform device
+ * @pdev: pointer to the FCS platform device
+ */
+static void fcs_driver_remove(struct platform_device *pdev)
+{
+	struct socfpga_fcs_priv *priv = platform_get_drvdata(pdev);
+
+	/*
+	 * misc_deregister() does not wait for open files. Drop the driver's
+	 * reference; the channel lives until the last close if any remain.
+	 */
+	misc_deregister(&priv->miscdev);
+	fcs_mark_removed(priv);
+	fcs_put(priv);
+}
+
+static struct platform_driver fcs_driver = {
+	.probe = fcs_driver_probe,
+	.remove = fcs_driver_remove,
+	.driver = {
+		.name = "stratix10-fcs",
+		.dev_groups = fcs_groups,
+	},
+};
+
+/**
+ * socfpga_fcs_init() - register the FCS platform driver
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int __init socfpga_fcs_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&fcs_driver);
+	if (ret)
+		pr_err("Failed to register platform driver: %d\n", ret);
+
+	return ret;
+}
+
+/**
+ * socfpga_fcs_exit() - unregister the FCS platform driver
+ */
+static void __exit socfpga_fcs_exit(void)
+{
+	platform_driver_unregister(&fcs_driver);
+}
+
+module_init(socfpga_fcs_init);
+module_exit(socfpga_fcs_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Altera SoCFPGA FCS SDOS encrypt/decrypt driver");
+MODULE_AUTHOR("Altera Corporation");
+MODULE_ALIAS("platform:stratix10-fcs");
diff --git a/include/linux/firmware/intel/socfpga-fcs.h b/include/linux/firmware/intel/socfpga-fcs.h
new file mode 100644
index 000000000000..824870f8a553
--- /dev/null
+++ b/include/linux/firmware/intel/socfpga-fcs.h
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Altera Corporation
+ *
+ * SDOS-only subset of the SoCFPGA FCS (FPGA Crypto Service) interface,
+ * shared between the driver front-end (socfpga-fcs.c) and the command
+ * engine (socfpga-fcs-core.c).
+ *
+ * The command engine deals in kernel pointers only: front-ends own every
+ * transfer to and from user space. In-kernel consumers can therefore drive
+ * the same engine directly.
+ */
+#ifndef __SOCFPGA_FCS_H
+#define __SOCFPGA_FCS_H
+
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/kref.h>
+#include <linux/miscdevice.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <linux/firmware/intel/stratix10-svc-client.h>
+
+#define SDOS_HEADER_SZ		40
+#define SDOS_HMAC_SZ		48
+#define SDOS_PLAINDATA_MIN_SZ	32
+#define SDOS_PLAINDATA_MAX_SZ	32672
+#define SDOS_DECRYPTED_MIN_SZ	(SDOS_PLAINDATA_MIN_SZ + SDOS_HEADER_SZ)
+#define SDOS_DECRYPTED_MAX_SZ	(SDOS_PLAINDATA_MAX_SZ + SDOS_HEADER_SZ)
+#define SDOS_ENCRYPTED_MIN_SZ	(SDOS_PLAINDATA_MIN_SZ + SDOS_HEADER_SZ + SDOS_HMAC_SZ)
+#define SDOS_ENCRYPTED_MAX_SZ	(SDOS_PLAINDATA_MAX_SZ + SDOS_HEADER_SZ + SDOS_HMAC_SZ)
+
+/**
+ * struct fcs_sdos_req - parameters for one SDOS encrypt/decrypt operation
+ * @op_mode: non-zero to encrypt, zero to decrypt
+ * @src: input buffer, obtained from fcs_alloc_buf()
+ * @src_len: number of valid bytes in @src
+ * @dst: output buffer, obtained from fcs_alloc_buf()
+ * @dst_len: on entry the capacity of @dst, on return the number of bytes the
+ *           SDM produced
+ * @status: SDM mailbox status, valid only when @status_valid is set
+ * @status_valid: set by the engine once the mailbox transaction completed,
+ *                whether it succeeded or reported a firmware error. Clear
+ *                after a transport failure, where no firmware status exists.
+ *
+ * Every pointer is a kernel address, so the engine never touches user memory.
+ */
+struct fcs_sdos_req {
+	u32		op_mode;
+	const void	*src;
+	u32		src_len;
+	void		*dst;
+	u32		dst_len;
+	s32		status;
+	bool		status_valid;
+};
+
+/**
+ * Private driver state for the SoCFPGA FCS that holds the SDM/ATF service
+ * channel, the lock serialising command submission, and the latest mailbox
+ * status/response.
+ */
+struct socfpga_fcs_priv {
+	/* Communication channel */
+	struct stratix10_svc_chan *chan;
+	struct stratix10_svc_client client;
+	struct miscdevice miscdev;
+	/*
+	 * Held by the driver and by every open file. An fd may outlive driver
+	 * detach, so this state is not devm-managed: the firmware channel and
+	 * the allocation are released only when the last reference goes.
+	 */
+	struct kref refcount;
+	/* Set on remove(); further operations fail with -ENODEV. */
+	bool removed;
+	struct completion completion;
+	/*
+	 * Serializes FCS command submission: guards the session state and the
+	 * single in-flight mailbox transaction (completion/status/resp) so only
+	 * one SDM request is outstanding at a time. The engine takes it around
+	 * the session and mailbox work of each operation; buffer allocation and
+	 * user-space copying happen outside it.
+	 */
+	struct mutex lock;
+	int status;
+	u32 resp;
+	u32 session_id;
+	/* non-zero while a crypto context is active */
+	u32 context_id;
+	u32 atf_version[3];
+	bool atf_version_valid;
+};
+
+enum fcs_command_code {
+	FCS_DEV_CRYPTO_OPEN_SESSION,
+	FCS_DEV_CRYPTO_CLOSE_SESSION,
+	FCS_DEV_SDOS_DATA_EXT,
+	FCS_DEV_ATF_VERSION,
+};
+
+/*
+ * Allocate a service-layer buffer usable as fcs_sdos_req.src or .dst.
+ * Returns an ERR_PTR on failure; release with fcs_free_buf().
+ */
+void *fcs_alloc_buf(struct socfpga_fcs_priv *priv, size_t len);
+
+/* Release a buffer from fcs_alloc_buf(); tolerates NULL and error pointers. */
+void fcs_free_buf(struct socfpga_fcs_priv *priv, void *buf);
+int fcs_sdos_output_size(u32 op_mode, u32 src_len, u32 *out_len);
+
+/*
+ * Allocate the per-device FCS state and set up the service channel; reads the
+ * ATF version. The state is reference counted; release the driver's reference
+ * with fcs_put(). Returns an ERR_PTR on failure.
+ */
+struct socfpga_fcs_priv *fcs_init(struct device *dev);
+
+/* Take/drop a reference; the last put closes the session and frees the state. */
+void fcs_get(struct socfpga_fcs_priv *priv);
+void fcs_put(struct socfpga_fcs_priv *priv);
+
+/* Refuse further operations with -ENODEV; call from the remove path. */
+void fcs_mark_removed(struct socfpga_fcs_priv *priv);
+
+int fcs_get_atf_version(struct socfpga_fcs_priv *priv, u32 *version);
+
+/* Perform an SDOS (Secure Data Object Service) encrypt/decrypt operation. */
+int fcs_sdos_crypt(struct socfpga_fcs_priv *priv, struct fcs_sdos_req *req);
+
+#endif /* SOCFPGA_FCS_H */
diff --git a/include/uapi/misc/socfpga-fcs-crypto.h b/include/uapi/misc/socfpga-fcs-crypto.h
new file mode 100644
index 000000000000..a96aa21b0baf
--- /dev/null
+++ b/include/uapi/misc/socfpga-fcs-crypto.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Description:
+ * This driver is developed for the SDM SoCFPGA Crypto Service (FCS). It
+ * provides an ioctl interface for the SDOS (Secure Data Object Service)
+ * encrypt/decrypt operation. The crypto session and the per-request context
+ * ID are managed by the kernel internally, so neither is part of the user
+ * ABI.
+ */
+#ifndef __SOCFPGA_FCS_CRYPTO_H
+#define __SOCFPGA_FCS_CRYPTO_H
+
+#include <linux/types.h>
+#include <linux/ioctl.h>
+
+struct fcs_ioc_sdos {
+	__u64 error_code;	/* __user ptr to __s32 (out)              */
+	__u64 src;		/* __user ptr to input buffer (in)        */
+	__u64 dst;		/* __user ptr to output buffer (out)      */
+	__u64 dst_size;		/* __user ptr to __u32 capacity/len (in/out) */
+	__u32 op_mode;		/* (in)  */
+	__u32 src_size;		/* (in)  */
+};
+
+#define FCS_IOC_MAGIC		0xA6
+#define FCS_IOC_SDOS		_IOWR(FCS_IOC_MAGIC, 1, struct fcs_ioc_sdos)
+
+#endif /* __SOCFPGA_FCS_CRYPTO_H */
-- 
2.43.7

