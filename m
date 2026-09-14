Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020092.outbound.protection.outlook.com [52.101.225.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C8D4746A6;
	Mon, 14 Sep 2026 13:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392888; cv=fail; b=XoPWvQabUMcqy/wia353+hwwx7rSyjV0Z0vXOen7knZHbuUEBuz7O3gbem9oTSmcXKvwXw94jBL3kU5FagVAJYu9NSKgIOc3Nz4QijHN5+OE2NGVvQwyrVheWnP0yV1b+VeFFObheghX6UB5mZZCfnRfRKe0EFQRlOTUYZxECNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392888; c=relaxed/simple;
	bh=Xp5Rm+M1q7TJSmOa3t/5KZ4DbEzbAoyGVQQ4gz8viB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GcW0igj2qHi7N6U1fP6F1vWF3rGPO6jOIWFq6CIyHk7WD6mmqFocUOnAlANpNtVPH0hbsWf/6aJqwWowi2TWjAUQ8R3D6a2LNRTKcJGBzxlvbOTsLzrm4cNqQIdyN7GXIqpzHygmplzmeUPcugq7yaVwbYrIHybNWA8j5wwcXGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AkJmyGeNucSCzFrwRNQBhuM1YhoV1kre8lp8txs8FsaorFjnZp8L/rbNeJBlTpCWJ75MuzgVAyl53eEVMpf1Zxy8aApVWMEf+QzaT7FQVH6f1N8ESgk2DwfjpWHHBFd6GR1ZAqATd2sYzxPMPcgThYeEMZKljjcT0CiyaucaeSt6YS4DvrWqYwZHMokuoN48of5KvZlaPGk4bEWID+g/7kgmnN2NsS+oS1aGNw9s0K5SheLAlpLG7dRehI8ZwDAQAKLz7Sk/Ihiqezc4yZCNvniRJN/x0Stmy8x6Z9sljaXsqbT6iVDtDDlnxSDwJcoJZDNb1nz/iFoYEeWUkCfHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDeYSWfU0N3l/5oT/gglsOfaFHSnACHOTuVCvNFW6TQ=;
 b=vXeZFKEsZB/AxGwbW3sFv8p4E19nwxl6ZO68v8KMfHPEhQnIhH+e+Jz11XH3HFZHkkNu3epgD36T+YZdpz/q2gs8i5KE0wGFpypoPqxD9RSwEBhBm3ObV7181DDBf5dVCcFQs+H1zFPzSxa2OOxXxwEB+P9ZMS7fQld1LvdXQVkp5J3tPcev62G+UrJLPGqpnF/qiiIK+pk8De2wGIUNBcdlj67EITzaIbhU8mc4X9e1/oUhqxSw3wN3pIBY+kgKs1jdGnYuj+iV0yi5dwxrRWeqwrD6vN6u9GSdxNvS/Y6IcMuozA6YXDj+C4Z5YAG6i3s/Ce/aE5Z0ONHkVJV3Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PN2P287MB1360.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:127::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 13:34:41 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 13:34:39 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH 5/8] media: qcom: camss: vfe: only reset the VFE when its last line stops
Date: Mon, 14 Sep 2026 19:04:13 +0530
Message-ID: <20260914133416.1030231-6-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914133416.1030231-1-hitesh@ebytelogic.com>
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:262::11) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|PN2P287MB1360:EE_
X-MS-Office365-Filtering-Correlation-Id: 10464b59-3a54-4882-95d3-08df1264ed43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|10070799003|23010399003|1800799024|366016|6133799003|3023799007|10067099003|56012099006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xcRiXYEj6O/vNr3xd6xICTPzDaSqilK3t7VXKQndGXC/ZG9wv2S9KIxC0s6wssgy9N/X6+YLyGWtvH7p/jSpXTcKa3o8axDSzALX7X63b5I01h4kLQ7R4QJC7b+0DyqsSj0rgIbmOOeg1y2DAT6tErPFKSNR+RpOQxfAvIVJrEIzVLca3nxjiolB+ofvpBi+jD2xeC26s5vyPcqCB5/byTfsf+wkgy0wILT41puYtSmFvIAeN0yG3N8f/D5Wuj2XGDHbW+aylmCfCXwEb+t4yoAgYdF4XB6eVquGp/KzH7hnhB5mLM1TLDtaU4IBUL6yg2vtXFtljweKjlcvjOXy2Ho834Yz1m4LA+TV9NCLi3irji74lQleMfladuozJ1IplhTPvmZajmSjal2QJ7/hxvWkAS9RXo2oQvXCtCq3jCFuvUuEqK6nf8fMIIgOFU21eEf0q5RRXA/bXD9/GBHKwQvEkllGzaTDfLrxTFrXjZJ8is9a9t9pwkLxcJOuKbGB3gvESW940RO+4iDIU5jRdvB6sIRQiOcg+7XQp0UnTvip3NziwYxglpqrMEUOijPj+DJZoYKZJg1I0VFJp5At0DzxUyf/1kB3WV5K5/Bm+bGtDfB55X0N+tV4J3IwUtsJQebSkZHEaB6M1qYf/uR5L7FIoTa4V/LqeQgtXwrm1dw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(10070799003)(23010399003)(1800799024)(366016)(6133799003)(3023799007)(10067099003)(56012099006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ulv468pVNomz86KiLyh3nzPzBbNEv9fsmzFjZv+W8RUA3+4OZQBw+dLFPWMc?=
 =?us-ascii?Q?iu/SPQmEGOkCDk7NsBGFXpT7jrIbo+xaxcY0+591VlMR3bnjMcLcGMz9qo7v?=
 =?us-ascii?Q?1egUG9i+rFN7vallBEBwO4BvLcm1gGrxb5NJWIqjMzuvxpQg09q6nS9wTF9p?=
 =?us-ascii?Q?X5DCjlwOJ01TtBeN+HHi5Q60I9147TKtMqkwUKeEeVMI54Vgos9O+mK24/y+?=
 =?us-ascii?Q?UXUWU7DCNXtP3Q/sEotYRmuu1fg4tuQYoLoDlZwqwnTTqcTQRc3+1xoSgams?=
 =?us-ascii?Q?5pAO02f5IB9rNjsZN9wbupZv13/hcRahsIDmvr38w9kPoVxqjCUQp0fCdJE8?=
 =?us-ascii?Q?jR2MsQpDVdIN1FMLH0Z5KjOA+NzvqiO0QkbAu4gPcw8qPMXimMZtl4UKBBCk?=
 =?us-ascii?Q?1hgMINuN0fyEV7WTeoJO1sQZEUIS/rnx+I5z0NTvq5j6/Hb6C+j4YKMAIovG?=
 =?us-ascii?Q?O384cMQyL/mHU1NpbQyQtOF2zkCi1POo1Bbor4L+3sf+W1e7ECFzQoCgZeAl?=
 =?us-ascii?Q?Yq3gqhCislPVFNNYmmDg0dWepc0LMARlmTvR3n7FoWg26ebGOck5+C1hhJB3?=
 =?us-ascii?Q?McypEvcmWA9d0Q5oHupZdYkQyn6GblOmTuprb4vg4cmAwHW5KRFg9yltL6M3?=
 =?us-ascii?Q?KWwh/MZ+/PWgaLxEgUyitguZCzxBVDdWL4NDuiM/sQcBrQP36DhCyfuqRysY?=
 =?us-ascii?Q?ApKbT5ttvIkKCfETYKQARfhcda8M7MnJyYDTKL5Qq4SeHVB/dZ+v6ufvNA1n?=
 =?us-ascii?Q?N7aFRuED1K4zt4BaDjwy2Gu2BwQVwnwHZltoKAtFOvJIiqO9/kmKfF4TbyzO?=
 =?us-ascii?Q?cwFCFBgpOeVvZm/dTSGKav3xwm4iNguEvM80kcY3ChhxrjkmzVZLRnxH+UCk?=
 =?us-ascii?Q?7d3F9dWu/ERLnGHQsE1xIQWr10x4Xn1W4k3wQeMJhm7tNd4qDF4eNIiZ+c/h?=
 =?us-ascii?Q?JT1kuKQnInx4TfBMpP6PpfhQUjQhCYDhzynFhfz9wS2alG4HvJ/qjCeTjVeC?=
 =?us-ascii?Q?Oo7dqnjmnpOgzdpDWXgb4fuz5ytwlkzJApbDhikDmhv0yXZgEIaZ+4XO1ccf?=
 =?us-ascii?Q?6dLZk/qxhOWuFdmwt/eYd2myk12ItT5IE7cicJRhhfO9251j14LnBRD0yTY9?=
 =?us-ascii?Q?RifpBDU2V2H2/WMX+N/JDrKKBEuIiRO1O58UQsfKXrRjXw8+1g7603x9Pd4A?=
 =?us-ascii?Q?zUxKvPpEQW2i6/S1HNlC2OsoV+MMvVifhw8DkRV0FHpkXz6m7zNgzvwAhU1i?=
 =?us-ascii?Q?3ky8xDFkzxzeVMUKCU1WgpFNusNRpuCBQ00I7AKwtWHvZxkdTkyGXozvOWT6?=
 =?us-ascii?Q?s6mo1nZ/IwiEu/A56UJfa/nLBC6H33XzIX9z1mCDmqIcyvm1oH2ldPWW6dMi?=
 =?us-ascii?Q?wJzMBe+xOA99fNChvAxko0A5S65kZHIPlRP7N+0q3Oan5E46GwaS0JqNKAf2?=
 =?us-ascii?Q?uXf8jaBqj5JnGT7klFAgXHqXjj6lzj/Z5DHmk21ihsU4JFCg7CGm1/cZ+9QR?=
 =?us-ascii?Q?ThDFfMYG+JHRYTsCG93bv+PArZnHp/mrJS2gXFqRnrE/x5/a9TY4xXGFhWyX?=
 =?us-ascii?Q?GiUhhzK6waiqi0MgRLijDAaat4+h0u7YJmMwriWvq9OKYmSl7Jb+4gqnZ8mE?=
 =?us-ascii?Q?Fb1spkQnwAl5PXLVYzYV3mEmx3rIAjhC6JaB9REiGSasX9IQbRC/KSLl00yX?=
 =?us-ascii?Q?p3yNuw7HtjgVGfF7CZT84ooLedL8ZRIZ3Uc8nzAeqd8V/ldERTzLu07gG/9l?=
 =?us-ascii?Q?1ZA5BBZhQ/sg7Kh2Q68Jzgv6ug6oY0jE5N/HHyTTRnd+1VAx54EuFRvGyOtC?=
X-MS-Exchange-AntiSpam-MessageData-1: gOKEiJpUDQG/Xw==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10464b59-3a54-4882-95d3-08df1264ed43
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 13:34:39.8030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YinxyTrAj4VEKI1VRlPIySYklaDFh7vjDaxS4VOLpPC44rg8zYhJynO5w/gjbWs304aPaWOg8A6yo332TCuutw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1360

vfe_disable_output() stops the write masters of the line being
disabled and then issues a global VFE reset. The reset is not scoped
to the line: it resets the whole block.

Several lines of one VFE stream at the same time when a CSID
demultiplexes virtual channels to different RDIs, e.g. two GMSL
cameras aggregated by a MAX9296A onto one CSI-2 port, each on its
own VC and RDI. Stopping one of them then resets the VFE underneath
the other: its in-flight buffers are never completed, its write
master configuration is gone and the block is left in a state where
the next reset is not acknowledged, which surfaces as

  VFE reset timeout

when the remaining camera is stopped or restarted.

Only issue the reset when the line being disabled is the last one
streaming on this VFE, as tracked by vfe->stream_count. Stopping the
line's write masters is sufficient to quiesce it while other lines
keep running. The single-line case resets exactly as before.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 319d19158..9cdf26671 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -814,6 +814,7 @@ static int vfe_disable_output(struct vfe_line *line)
 	struct vfe_output *output = &line->output;
 	unsigned long flags;
 	unsigned int i;
+	bool last;
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 	for (i = 0; i < output->wm_num; i++)
@@ -821,6 +822,13 @@ static int vfe_disable_output(struct vfe_line *line)
 	output->gen2.active_num = 0;
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
+	mutex_lock(&vfe->stream_lock);
+	last = vfe->stream_count == 1;
+	mutex_unlock(&vfe->stream_lock);
+
+	if (!last)
+		return 0;
+
 	return vfe_reset(vfe);
 }
 
-- 
2.43.0

