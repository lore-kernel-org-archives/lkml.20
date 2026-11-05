Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793899043;
	b=Z33bsmGOBR6nBwtanGHhnxmI4i3L+cXmWPacrOy2PKgqurDztw9+lDrLXP/Va+Q1Vgzd
	 e2MvX0Y1KWgtxfCGeVGFrg1vb/VyY6PW75w4HyfUJWAjMSa0xI1gYGRxGoNHh/h1cz4SP
	 YRI0LCQuTkjC42hdiMdX2Dwk19j7+q1QDPPuu7zLFwSeYGbFwHwh0E7ImtmOEVJqqohdC
	 dGc3Y5rQAAzQgmRyKbOiraBgTi1PY6tTX4qOmkB+KWjEtfiVfyZP8WKXNvfxKr0JW8in+
	 u0CX9pNsjb6sq8s0aajAZYy+Bb1mqLexfqAMwZUG47oHloB72/kHs87KXZiFS9NrgRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899043;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-AtpMessageProperties:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=j66JGXXqriMTtX4ih9s2u9v/TdW7GMtMA0fNa3+wJvQ=;
	b=bjQP1sRI8K9b1jQvSLdJ0GKoW8csYSQwwbBQBY9Ibh0BLMlFFqSirNGWqMfaumQD6nPU
	 7+X4drs6G0i3OUXhT5vo3VUrawPjmJiexq3AVsU0/g7h4WsojJC6k+HH9qKgfABD/cTka
	 BFkDtdNCikwZB3IWRs02LT34hQM4BvGWZL5o2R5AuIIStAdNgEYyZ2w8Gpnb3+sZdqVVL
	 F7s/KR6MxOz7uFmuzbLhWgawYhTa/ivFj+sXvd3dJy0EUO4tTEFdaVGlEOco6PFGsVMFk
	 9lj7w9Vw6ACG1t0rWYkvLizScNtFf+aqgdnQQ7VDUMu4y5NJVtkguRkK3HI8nZqzYBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=altera.com;
	spf=pass smtp.mailfrom=altera.com;
	dkim=pass header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=jH5XswBn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.30
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012030.outbound.protection.outlook.com [52.101.43.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FD2606A32D;
	Thu,  5 Nov 2026 17:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02FD2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=jH5XswBn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROzeolbShcUSmBrHPfF8hnM2GGgbKKNYXOeqRuV5CU2UC6eItYKM0fH0JJjFJTmxbEqHl7BtBqcd0/48/PXqjXtFrUtzILZmpvg4DOF+uDWghmw6oFCTONyJb8fBfwiTBfJ/I+rMXkcT9Tml6yk4bqJBs2bgSg8LqsFr2hdAhRfMBVTTgvengKKn9nHQkixXLA5ZqMDtMofCOyHRwXXLGPURYlC03SRBoI1ovjtGIMdljU/kV5eQlz3k8Y+he7w2YM5C169rbVDGpvI0jPrHhE+EdapYB4qmsXs9q+9DoA3Vw7jp/pZh97o3mgOwryrJkDmtLiym/fzzBCnHlW/sSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j66JGXXqriMTtX4ih9s2u9v/TdW7GMtMA0fNa3+wJvQ=;
 b=Z7tKBgxErjFKgDzv0WXjxeklWaD+RjfA9JvR4I3wj2DV2Xs/Y2EyLdATi6IKqYzdvDF4ixNwV0t+e1FlWQf1TALCYPO6JUBAuoXYJVXsSjAVzpz7WQYnsYKkmFMYYMlCOcP9AxvxwkC+osu37Gt4gL5WFcDoTaoCSswJ5795dKnU3ttCb9lR38gNLTEIAmv1I4z+vMctpuUX7UAENirnA7XwB2lWMU9zNrkh/ZjysXAFAVGroZFjZjdcCNu4g9JWdawiYVegwNxU9XUDp3tGzGIjgiQrNeJZv7u2ntopQoK8jqWkbsuBeYdy8UhAYDZyqteUUA4hqNzwfhJLCwRx+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j66JGXXqriMTtX4ih9s2u9v/TdW7GMtMA0fNa3+wJvQ=;
 b=jH5XswBnVmRdbG4i3WvcWy+wVin1ujto2Reoe+T+UJlmax9TKh1m2LtYl/edD8uAbly031dQTyhfvZ2eVda1vLLPyJmr8gMmnxvLvqPUZrXxT/IiMniZcCbsrz3HsZQYLRLzoGPDa1h0RZrrOuvRd+hQXtR1hOpnYyVlt5KLQvhDMqm9PAoA3BRV0zXmk0ZS2fE87BOIrysdhVa6+bWmolZUe4KSGWPnxYNfdDQGIu74rrHAG8W3fZVT6pd/8xJHTDekpyJcPGL/P76DegAe1JLtYog+k+KEtuxAFLuyb/KUN1JZ6st4heY392kRvbsopxwWYW4IhzUA1Ex/e16STw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DS3PR03MB097838.namprd03.prod.outlook.com (2603:10b6:8:546::7)
 by CH2PR03MB5205.namprd03.prod.outlook.com (2603:10b6:610:9b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 5 Nov
 2026 17:17:15 +0000
Received: from DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59]) by DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 17:17:15 +0000
From: hang.suan.wang@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Gabriel Whigham <gabewhigham@gmail.com>,
	Will Deacon <will@kernel.org>,
	Kiryl Shutsemau <kas@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	linux-doc@vger.kernel.org
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com,
	tze.yee.ng@altera.com,
	chee.nouk.phoon@altera.com,
	genevieve.chan@altera.com,
	adrian.ho.yin.ng@altera.com
Subject: [PATCH v9 0/3] Add Altera SoCFPGA Crypto Service (FCS) driver
Date: Thu,  5 Nov 2026 09:17:09 -0800
Message-ID: <cover.1793895849.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::17) To DS3PR03MB097838.namprd03.prod.outlook.com
 (2603:10b6:8:546::7)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR03MB097838:EE_|CH2PR03MB5205:EE_
X-MS-Office365-Filtering-Correlation-Id: 94fa240c-63ff-43d7-999a-08df3b60a366
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|261026121527099003|261102123227099003|261102130727099003|5023799004|11063799006|921020|261021123027099003|10067099003|261021121427099003|3023799007|261009223027099003|261022075727099003|261026140227099003|261022115727099003|261022105027099003|6133799003|18002099003|261028144727099003|56012099006|55112099003|7136999003;
X-Microsoft-Antispam-Message-Info:
	T44HxoaCm0VFDrXLUmiG4V9i0fRLZlMqAHz5wOagYZ54h9dL5M8nem6MfLNZlftctekFfff4TYfKm4yXbxceEBogWDH6xh5+LgsPfjut39egr8DKIP7sLw4kHmqnM1LiYF90k2buMmhBaUf0shYBAVgB/GJUqgU++imHNTYV8h5aea+yfHZJQkyd3ItJGZpHwgRwUd2HVjiF7jX0NQnyY1Cyo0algkqmyUwSZAv8cCZZq3GHdsA6Iiv+1CLEIhkRhPp7JzsDPWLevikMQ/GpGXX+o0z0Qp07Wj9dVuXbiqjl0v7Yma/n6xEBrJX6JBMd5UCDZFNkx+vPB5tScvXBWqkVhfvvL5a0uwOUh4PasMYfBrpofwPHzInaasipNg/X9va+WR8dFAMUFFy9ICFYCTAwUGy+yDUStlTfExIiXVmJdH3igyOGXRbrz6CmNvia/iHt1+hCWkAIpCzbhQ51hSilwoCozb7PNebpQLtj4oqWtDzjlAA97SA3oQEa8+cauoRjq78E2RANkxJR294xH4OO99dTtA/ZioQyYqJ7/9JCAo4sAtbsrkvGF1M6uwY6dC1NbaAYzhuVQZ7ldNc1+7UAe5DQu60XabvzVSJT9d9L6FWdTw4l4FM6EDOqZZTMBB0/arS3OSYQRKHRAAp8gXDe7W++oEn627mGK6soJ/738wILLENrdVM0/CzCuMKNjYtHaZMrROC37QjL0pw9qQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS3PR03MB097838.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(261026121527099003)(261102123227099003)(261102130727099003)(5023799004)(11063799006)(921020)(261021123027099003)(10067099003)(261021121427099003)(3023799007)(261009223027099003)(261022075727099003)(261026140227099003)(261022115727099003)(261022105027099003)(6133799003)(18002099003)(261028144727099003)(56012099006)(55112099003)(7136999003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jbdQpjHCxmlTPYPLKmLTXJCPXTwQdW7xBKH0pgadcy3+eEdOGliv8lDZ6gOw?=
 =?us-ascii?Q?v5h6DG2N+V4nSF17Jj6UG37kVYhzfL+r472WsLI3B5VRDKCFSSKE6Pzw1lop?=
 =?us-ascii?Q?7EfvmhQKMXoHTraKIhE2nXftxtUBkof//xYFvtl+xw0xsEOveaThQzeM1JBx?=
 =?us-ascii?Q?rme0Y/FW/lLOFHGBn9YXWObGyYsicjglWdyFpzZFAZ2M3sizaALb0GXEqLVs?=
 =?us-ascii?Q?qYNdnyDjGJBLUWkmxUd71UAWgyQX0Vkwnm3K+id9FuW9vk6hS4ruw6d1PDwC?=
 =?us-ascii?Q?/XjtCrAJiqICmBM072c4uA7bAMJ8TJdw8KMoSjU59+9rvyLONoIN8mPTv+Qp?=
 =?us-ascii?Q?O7fFGPhdnfq8w9IXkZbJ6cVhIWPdaHy3QyKRiqB/LaLhgFalJTaSj/35/sko?=
 =?us-ascii?Q?ApD5uq0ZX3kGE8P08pNk4MHJao+c5HvxwfmGZTpYaCu3+t+CG78AwoqhrwlF?=
 =?us-ascii?Q?d4ogT8FM8VyrpK8zEdVkFaj+yvoN9LbkK0pKzZN0XRls/2UiFV8TG8w2nxX+?=
 =?us-ascii?Q?kdANivUFPktFCCC7EItlEorG8vlZ9qUigYnZY1wnrrAfcz3WgvYBImc7CTKz?=
 =?us-ascii?Q?WqYBpx66Fx/Ofz9tVmIMcjhvQywQaIpKGUosBIwM69wuX3eFzjOuqOUagAtR?=
 =?us-ascii?Q?WH0lgVOtVghQs6YIFa6IMvnLanzb3RTOw/9FZIAcOLfJbFhQMK475dTpjvAz?=
 =?us-ascii?Q?eSWgO8Y5YmI6EAx9qR8Db7VPWmeH15WD6QYUE+sxvIG8ReOJyLP7Apg4HbI7?=
 =?us-ascii?Q?EhesovQhTwrmsj1V+1QMpxvJdPMCN39RUvxiyuhD+jENyRNgTXoMGq6eBxaJ?=
 =?us-ascii?Q?9kuUpoXbc2nFrRQJ9ViVRzJLQJX1EH7D2l3wXulYkXBhGPGRTMp/W1wXPIQs?=
 =?us-ascii?Q?HbR56D1+WQK+1HGFHhdj+HujHfQoIPbzRTU5VnoTYPVahxUg3QtwbtxvzSPG?=
 =?us-ascii?Q?QqjsG26VGKlGUIFLuu1arWhdMEEEbveWcS/zzAGXCFcNDSXkSabvw3DMmjnd?=
 =?us-ascii?Q?HO+iDivMDddwTwajlhPf9YpxFrLWJJxpL+6eQR81ZGEfw26uytBSmvveUf7I?=
 =?us-ascii?Q?jtwfQVW7CD5bL0+yQ/159z7djuiYvBzQ4Thab7Zf13eNFj3MAlxCnPInXo/Q?=
 =?us-ascii?Q?zbQB9omzU6FRteLNhRSexlkIsoa6FEk5xO+FkWi+i4cAGG1VMua+/t7TUod0?=
 =?us-ascii?Q?yzXrvq1vUKZy8zmat/mfSImAyvFApR6WjYLNDS793FwjGxbq32at1QyQScP4?=
 =?us-ascii?Q?Co+V5LglGHuYcbrEe8VGHISwt0oORssyz7ImIq1oB377rgjH9FSAJlh2tUXx?=
 =?us-ascii?Q?eOinkI8Lut8k5Y6BrsL14gPP6wq5KrceqNoXWRepntjSPpKQa+R3p/vZGvQ5?=
 =?us-ascii?Q?GWgLJtysHyL2A+rNNnsUbrz96eP3usAB1cuAqSLoz1JRXdktgEozFPLiRLYX?=
 =?us-ascii?Q?CsI19F/DS52Tgdy9pQCjHMJeEEeu6sXiueiDf4qrN3oQR07ABMZVcHaegu6x?=
 =?us-ascii?Q?F3xGpBNh+Y3ZZVbaXyS0ewlmrLIC3J2L+ooUgh5KmTIaNPXdGLixgjWH7DHW?=
 =?us-ascii?Q?Ymgp1M/hUHXQTld8SyupFlqlZ+mcIZsb/jc3H1JkYq2gdlQsfpv4v+EqX8DD?=
 =?us-ascii?Q?csRtj4qIlP+jYAL3hOAFZI2FxijPSURu+BQIXJdQkPTq1muGOS4ilyN6znGD?=
 =?us-ascii?Q?8aHzTii1Bwa8Yt9MvoveiCVNTEfIM8nt44DLrdOvWT3gDR0hQU1WrFjZ0zrY?=
 =?us-ascii?Q?/zrOraJYqKnp4IoHeVXgz5vgXZEZ8g8=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94fa240c-63ff-43d7-999a-08df3b60a366
X-MS-Exchange-CrossTenant-AuthSource: DS3PR03MB097838.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:17:15.5002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xO3nCUlb73+w+h+WmeXBgJ5R5hLsD3YKRrwOuxTEqVa6/eOSmQtPy+AHdkqdUqnHTfnoyViV7XJtS3KjhAxMEYtNU5VKcPeDk+zaWbTSUiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5205

From: Hang Suan Wang <hang.suan.wang@altera.com>

This series adds Linux support for one of the Altera SoCFPGA Crypto Service
(FCS): Secure Data Object Service (SDOS). SDOS is an Altera-proprietary
service that seals and unseals arbitrary application data. FCS is a
runtime cryptographic interface provided by the Secure Device Manager
(SDM).

The SDM is the hardware security controller in Altera SoCFPGA devices. Host
software reaches it through the existing stratix10-svc mailbox, which uses
Arm Trusted Firmware SIP SMC calls. This series does not expose the rest of
FCS (RNG, AES, SHA, key management, and so on).

SDOS protects data at rest. The SDM encrypts and decrypts using a key
derived from a device-unique SDOS root key that never leaves the secure
boundary. The host supplies plaintext (or an authenticated object) and
never handles raw key material.

SDOS requests use the stratix10-svc asynchronous SIP SMC path. Source and
destination buffers are allocated from the service-layer memory pool, and
their physical addresses and SMMU IOVAs are passed to the SDM.

The caller opens one SDM crypto session with FCS_IOC_OPEN_SESSION and
closes it with FCS_IOC_CLOSE_SESSION. SDOS commands use that session and
do not open or close it. The session belongs to the file that opened it:
another file cannot use it or close it. Closing that file, including when
the process exits, closes the session in the driver's release path. The
SDM allows one session at a time. Each command takes the device lock, so
only one request is in flight, and the kernel gives each command a new
context ID. That ID is not part of the user ABI.

This is the session model later FCS commands will use, so a key imported
in a future series stays alive until the caller closes the session. Those
commands are not in this series. The ioctls are usable on their own. This
series does not add a daemon in the kernel or require one in userspace.

The obvious question is why this is not a trusted-keys backend or a
crypto API transform. There are four reasons this feature cannot fit:

 - No key handle. The key is derived inside the SDM from a device-unique
   root key and is never set, imported or named by the host, so there is
   nothing for setkey() to bind to.

 - Object format. The SDM emits a firmware-defined container: a 40-byte
   header, the payload, and a 48-byte HMAC, with the owner ID carried
   inside the header. That is not a generic AEAD output.

 - Size. SDOS payloads are 32 to 32,672 bytes. Trusted keys wrap key
   material, which is far smaller, so the keyring model does not fit
   a data-at-rest service.

 - Status reporting. SDM statuses 0x102 and 0x103 mean "decryption
   succeeded, but the key is outdated or should be reprovisioned". They are
   successes carrying a warning, and the warning has to reach the caller
   together with valid plaintext. Neither keyctl nor AF_ALG carries a
   firmware status alongside a successful result.


The series is organized as follows:
 - Patch 1 (prerequisite) enlarges the stratix10-svc SMC argument array so
   the asynchronous FCS SDOS command can pass its full set of parameters.

 - Patch 2 (prerequisite) extends the stratix10-svc service layer with the 
   FCS command codes and matching SIP SMC function IDs, adds the Agilex 5
   (intel,agilex5-svc) match, and registers a "stratix10-fcs" platform
   device that an FCS client driver binds to.

 - Patch 3 adds the FCS driver. It is a misc device (/dev/socfpga-fcs).
   FCS_IOC_OPEN_SESSION and FCS_IOC_CLOSE_SESSION manage the SDM crypto
   session. FCS_IOC_SDOS encrypts or decrypts on that session.

Testing:
 - Built for arm64 (defconfig + CONFIG_ALTERA_SOCFPGA_FCS=m).
 - Tested on an Agilex 5 SoC FPGA board (SDOS root key provisioned).
   SDOS encrypt/decrypt round-trip; the decrypted output matches the
   original 64-byte plaintext:

   root@agilex5e:~# hexdump random_payload_bin2.bin
   0007cc0 a5e3 b39e cd9a 86de b3e7 d035 ad6f 6b4a
   0007cd0 1327 9672 25ec 1947 d98e e61e 9b2d 594d
   0007ce0 0474 29a2 fd28 e5a2 4a4b b608 6271 7e3d
   0007cf0 5c61 c2d1 4c7e 7aa6 e347 10b7 9aae 5439

   root@agilex5e:~# ./fcs_client -e
   root@agilex5e:~# ./fcs_client -E -i random_payload_bin2.bin -o
                    random_payload_encrypted_bin2.bin -v
   root@agilex5e:~# ./fcs_client -D -i random_payload_encrypted_bin2.bin -o
                    random_payload_decrypted_bin2.bin -v
   root@agilex5e:~# ./fcs_client -l

   root@agilex5e:~# hexdump -C random_payload_decrypted_bin2.bin
   e3 a5 9e b3 9a cd de 86  e7 b3 35 d0 6f ad 4a 6b  |..........5.o.Jk|
   27 13 72 96 ec 25 47 19  8e d9 1e e6 2d 9b 4d 59  |'.r..%G.....-.MY|
   74 04 a2 29 28 fd a2 e5  4b 4a 08 b6 71 62 3d 7e  |t..)(...KJ..qb=~|
   61 5c d1 c2 7e 4c a6 7a  47 e3 b7 10 ae 9a 39 54  |a\..~L.zG.....9T|

---
Changes since v8:
 - Rework the FCS core into a command engine,
   socfpga_fcs_core_engine(), that takes per-command parameters.
   The caller supplies a fresh context ID for each command.
 - Poll for async completion instead of registering a service-layer
   callback, fixing a race on the shared completion.
 - Fix a NULL dereference in the ATF version callback when the
   response carries no payload.
 - Return -ETIMEDOUT when a request times out; only busy and
   no-response statuses are retried until the deadline.
 - Reject an SDOS op_mode other than 0 or 1 with -EINVAL instead of
   passing it to the firmware.
 - Report the SDM status in error_code even when a request fails.
 - Update the ioctl and ABI documentation, including the errno table.

Changes since v7:
 - Give the caller the session lifecycle. FCS_IOC_OPEN_SESSION opens one
   SDM crypto session. FCS_IOC_CLOSE_SESSION closes it. SDOS no longer
   opens or closes the session, including when a request fails.
 - Bind the session to the file that opened it. Another open returns
   -EBUSY. Use or close from another file returns -EPERM.
 - Close the session from the file release path, so process exit still
   tears it down.
 - Generate a new context ID for each command. It remains internal to
   the kernel.
 - Document the session lifecycle, and split EBUSY and EPERM in the
   ioctl and ABI docs.

Changes since v6:
 - Add proper support for the two SDOS address forms required by the SDM:
   pass the physical address backing each buffer separately from its
   SMMU-remapped IOVA.
 - Resolve DMA IOVAs through the device IOMMU domain with
   iommu_iova_to_phys(), and reject physical addresses outside the SDM's
   32-bit addressable range.
 - Allocate FCS service buffers with DMA_ATTR_FORCE_CONTIGUOUS on the SMMU
   path so their backing memory is reachable by the SDM; track allocation
   attributes and use matching dma_free_attrs().
 - Mark only the FCS service channel as requiring physically reachable
   contiguous allocations.
 - Rebase onto the current upstream stratix10-svc implementation and update
   FCS child-device registration and cleanup.
 - Convert FCS core logging to device-scoped dev_*() messages.
 - Update the MAINTAINERS mailing list and Makefile placement.

Changes since v5:
 - Drop the exported fcs_alloc_buf()/fcs_free_buf() helpers. fcs_sdos_crypt()
   now allocates and releases the service-layer pool buffers itself, both
   under priv->lock, so a pool buffer can no longer be leaked when the device
   is unbound while a request is in flight.
 - Stage user data through kvmalloc() buffers in fcs_sdos() so
   copy_from_user()/copy_to_user() run outside priv->lock. A faulting user
   page can no longer pin the lock and block device removal.
 - Read the remaining 32-bit mailbox results with lower_32_bits(): the SDOS
   payload size and the ATF version error status. Both still cast an
   arm_smccc unsigned long through a 32-bit pointer.
 - Document struct fcs_ioc_sdos and FCS_IOC_SDOS with kernel-doc in
   include/uapi/misc/socfpga-fcs-crypto.h. The structure layout and the
   ioctl number are unchanged.
 - Add Documentation/misc-devices/socfpga-fcs.rst: the device node, the
   ioctl, the size ranges per direction, the errno table, and the
   0x102/0x103 success-with-warning statuses.
 - Explain in this cover letter why SDOS is a dedicated ioctl rather than a
   trusted-keys backend or a crypto API transform.

Changes since v4:
 - Read ATF version words with lower_32_bits() so a 32-bit value in an
   arm_smccc unsigned long is correct on 64-bit big-endian.
 - Keep the SDOS payload size when SDM returns 0x102/0x103 (decrypt OK,
   outdated key). Those are success-with-warning; still return the
   plaintext.
 - Release the svc channel in driver remove, not on last close, so unbind
   cannot free parent channel memory while an fd is still open.
 - Guard fcs_alloc_buf()/fcs_free_buf() with the lock and a NULL channel
   check so they do not use the channel after unbind.
 - Always call stratix10_svc_done() after the ATF version query, including
   send failure, so the sync svc kthread is stopped safely.

Changes since v3:
 - Rebase onto current linux-upstream; register stratix10-fcs beside the
   existing socfpga-hwmon child device.
 - Drop context_id from the ioctl UAPI; the kernel owns session and context
 - Make FCS state per-device and kref-counted so an open fd can outlive
   driver remove (-ENODEV after unbind).
 - Copy user buffers in the front-end; the core uses kernel pointers only.
 - Use kzalloc_obj() and shorten comments.

Changes since v2:
socfpga-fcs (front-end):
 - Replace the sysfs store interface with an ioctl character device
   (/dev/socfpga_fcs) using a fixed-width UAPI struct and
   compat_ptr_ioctl(), fixing the KASAN out-of-bounds read and the
   32-bit incompatibility of casting the sysfs buffer as a pointer.
 - Add include/uapi/misc/socfpga-fcs-crypto.h and register the ioctl
   magic in Documentation/userspace-api/ioctl/ioctl-number.rst.
 - Add a .release handler so a session is torn down if the owning fd
   is closed (including on crash).
socfpga-fcs (core):
 - Manage the crypto session internally: SDOS opens and closes its own
   session; reject a concurrent open with -EBUSY. Removes the
   user-visible open/close-session interface and session UUID, fixing
   the session-exhaustion/DoS concern.
 - Harden the async poll loop: keep polling until the deadline and
   always call stratix10_svc_async_done(), fixing the teardown
   use-after-free from the previous -EINPROGRESS early-return and the
   needless full-timeout block.
 - Clear receive_cb only on the synchronous send-error path so a late
   firmware response cannot deref a NULL callback.
 - Set priv = NULL on all fcs_init() error paths so a later probe is
   not permanently rejected with -EBUSY.
 - Read the SDOS owner ID with get_unaligned_le64() for correct
   little-endian handling on big-endian hosts.
stratix10-svc:
 - Enlarge the SMC arguments array so the async SDOS command can
   pass its full parameter set (through a11).
 - In remove(), unregister the child devices before
   stratix10_svc_async_exit() so async_poll() cannot race a freed
   handle.

Changes since v1:
stratix10-svc:
 - Forward result registers (kaddr1) for OPEN_SESSION and SDOS_DATA_EXT
   so session ID / output length reach the client.
socfpga-fcs (front-end):
 - Publish sysfs via driver.dev_groups on the platform device instead of
   a raw kobject under /sys/kernel; callbacks now get a struct device.
socfpga-fcs (core):
 - Convert completion timeouts with msecs_to_jiffies(); drop TIMEOUT.
 - On SDM-busy timeout (-EAGAIN), abort without async_done() (no id
   reuse) and return -EINPROGRESS.
 - SDOS: on in-flight abort, leak s_buf/d_buf instead of freeing to
   avoid corruption from late firmware DMA.
 - Validate the caller UUID early in fcs_sdos_crypt().
 - Enforce single instance: -EBUSY in fcs_init() and priv NULL-guard in
   fcs_acquire_cmd_ctx().
 - Drop the always-zero platform attribute and fcs_get_platform().
 - Set/clear receive_cb only around the synchronous send.
 - Use device-lifetime priv->completion for the async path (was on-stack).
 - Use the local ctx snapshot consistently in fcs_sdos_crypt() and
   fcs_session_close().
 - Point sdos.dst_size at priv->sdos_output_size, not a stack variable.
socfpga-fcs.h:
 - Drop platform/AGILEX5_PLAT; add sdos_output_size.
---

Hang Suan Wang (3):
  firmware: stratix10-svc: increase args array
  firmware: stratix10-svc: add FCS crypto-service commands for Agilex 5
  firmware: socfpga-fcs: add Altera SoCFPGA FCS driver with SDOS feature

 .../sysfs-devices-platform-stratix10-fcs      |  21 +
 Documentation/misc-devices/index.rst          |   1 +
 Documentation/misc-devices/socfpga-fcs.rst    | 231 +++++
 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 MAINTAINERS                                   |  11 +
 drivers/firmware/Kconfig                      |  17 +
 drivers/firmware/Makefile                     |   2 +
 drivers/firmware/socfpga-fcs-core.c           | 856 ++++++++++++++++++
 drivers/firmware/socfpga-fcs.c                | 297 ++++++
 drivers/firmware/stratix10-svc.c              | 184 +++-
 include/linux/firmware/intel/socfpga-fcs.h    | 168 ++++
 include/linux/firmware/intel/stratix10-smc.h  |  64 ++
 .../firmware/intel/stratix10-svc-client.h     |  16 +-
 include/uapi/misc/socfpga-fcs-crypto.h        | 136 +++
 14 files changed, 1994 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-platform-stratix10-fcs
 create mode 100644 Documentation/misc-devices/socfpga-fcs.rst
 create mode 100644 drivers/firmware/socfpga-fcs-core.c
 create mode 100644 drivers/firmware/socfpga-fcs.c
 create mode 100644 include/linux/firmware/intel/socfpga-fcs.h
 create mode 100644 include/uapi/misc/socfpga-fcs-crypto.h

-- 
2.43.7

