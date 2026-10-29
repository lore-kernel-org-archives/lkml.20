Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793250869;
	b=XCWJsU1MFxPZ0oOCREm3ocV6It1UygEIrxJOoRjcSmbz2sNliY0p6LIp+ojxYYKSWwVK
	 vB4FpNDgGRiQcDR4p+p17ffzk1ov5pn3pkXH07vGqTkomygZLPycM9TQWaULlmbhEaByS
	 Pv0M6Epzcu2XuzyiWS90IZ3xZVZOiocdlOIcHzheM7qg5x4hdUU8g+qk12vJljdKrVTQZ
	 kTFbq273Jk16FDR54Hz0OEuIsZ5zUYBLm15SeqMu0ajKxPdXKCOTv8OkJfzo6QkNhAkWG
	 ErSKBbIBkB56T7v5D0z3N1THqoZXJ0o1GQTlfk8l2jQtFTET/lqwHPO5CWGN0/ndRpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250869;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:
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
	bh=8BmoaUM7WDYLl1xcd443m3LRkqosX8jFkFJjPmchwBI=;
	b=fooCW3QMiIP3JEEXdltNhzBSwMf179X5S2UzqQ1/es8YVMssq0TBhxLASNtF1lJQysy8
	 QHVS0B1QJhyMto40SfYakfALMUUwCiHOncD8FMMlVbMGjYc2OgrJnNxgRsbJh7gus1XDr
	 p8LdGcX84Fyrbr+IkrRSQA4mxGJZ3rvcMKbaA/qcAuDunHhba4wbWIKc8BaIY8DGCrrk8
	 r8eZttVnekPvDYPc0uMb2Iyj3cngd70YQJK2/A49z9f2C/OLd0+6un8Whh7JzLXjAEFyx
	 x4DiyGo5iPSavEbDznD0SDOv5Mv9og9nPJKDnlc6ZJEoT6u6UOzkageAULCKBUMY7LA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=altera.com;
	spf=pass smtp.mailfrom=altera.com;
	dkim=pass header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=QGJZPTUK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.43
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010043.outbound.protection.outlook.com [52.101.85.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B708A606A31E;
	Thu, 29 Oct 2026 05:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B708A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=QGJZPTUK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rj/htUpY8kmObZhV2YoYHm4WjHhmHwAKNR6tIUCxSNW18DV782M6Ilc68Dmnl8n4Y64YZZwVMCY22O98SsmlMNOO+kKo1OxeL68CPt3b78GWS9kZGpiHuD/JOfSVuV3bHejQzgP5R7bu+ZiJxJLGiEaSymxOf9b5axFz42qFQnQGYizH9XhK5tyTrTzQsWAt7IKcM9TPAOcXXda4a6ShftkfbOtZM+7YqhZgU/UkVRSy0BSFIVLaQTw53Yto1FqtoPJHDcooCjYGPg3zjHvqLNeyfHnfa6WbR148XjOx2BJR/32B9FDUkkKxvVxlRIAceCc2VSb1JzgCDxS/cgLAHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BmoaUM7WDYLl1xcd443m3LRkqosX8jFkFJjPmchwBI=;
 b=wwKpflJKPPrDHOlEUpa+x9Kvg/jNqRtGKphAJ3UYSRRq/fDIIuqOSvzZ228+VevQp9pD18KEiX5pUq/zClqVJxpw+SboA4M3ZYkQXSDjjwaIumzh4FXFXbzO0tyJpakL8fXpXbC4E9WDIzDFO/HMy783MKSt3OOE4G1CT3F9pEokYEGgt0AQDGhI0IweCuLSm9otQeGx0rkXBoKCK6e63nyCKs8KH//bqk8oRAvMmiOfg29ZKRGtNqBkxmTMEWIiz1YTxWblh7Js6W0FJMN9OAOzbqTGPj56lR1ALGwXqJgyhEnlr7GoIHnzV1pS4YAlbxX288kqlQE7wdDrdqY4EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BmoaUM7WDYLl1xcd443m3LRkqosX8jFkFJjPmchwBI=;
 b=QGJZPTUK2lJagZ2ovOeuVNBw2+1uyktIVjyFCdFCDUx36yPMFc1CCaFIavYtyZ7SJLTgO+VO23mS0Hi+6acBb7ctFBNnY/mqFs8+vb4OTeYTzLnKTyA01XsfwGYZUo6jGo3VqrQzwO94I8VX4TkwRNaXPaQXnUDP8XHZShbAEqZXnnxJmANctIj16GG0ihn348/Cu1lzMdJ02/X7hRtYLATJRPNLIQWqSxoSVPFF7uudaJBlt29HsIfNAirpAgTlSDKT0ThsoR1N7ewxjIjhjPnf+V+NnCinthbDoKuRDIg98F57bmBwVpYUY5e0U8sDEu+RwYcPiZhi4holxsXH1g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DS3PR03MB097838.namprd03.prod.outlook.com (2603:10b6:8:546::7)
 by DSSPR03MB989214.namprd03.prod.outlook.com (2603:10b6:8:374::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 05:14:27 +0000
Received: from DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59]) by DS3PR03MB097838.namprd03.prod.outlook.com
 ([fe80::fa39:2c18:c265:1d59%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 05:14:27 +0000
From: hang.suan.wang@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Gabriel Whigham <gabewhigham@gmail.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-doc@vger.kernel.org
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com,
	tze.yee.ng@altera.com,
	chee.nouk.phoon@altera.com,
	genevieve.chan@altera.com,
	adrian.ho.yin.ng@altera.com
Subject: [PATCH v8 1/3] firmware: stratix10-svc: increase args array
Date: Wed, 28 Oct 2026 22:14:19 -0700
Message-ID: <6452080968943b212fa2398a14c16377d3a14b04.1793197438.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1793197438.git.hang.suan.wang@altera.com>
References: <cover.1793197438.git.hang.suan.wang@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::21) To DS3PR03MB097838.namprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS3PR03MB097838:EE_|DSSPR03MB989214:EE_
X-MS-Office365-Filtering-Correlation-Id: 7853906d-e11b-41a4-4b2b-08df357b810b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|921020|56012099006|11063799006|261009223027099003|261021121427099003|261021123027099003|10067099003|261026121527099003|18002099003|55112099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	wZRmF0OrnBzZTm5tV8S0SqvTVCTKk5f4gy5veCEjOAixxKz+gRUz27KOBP4V3BKNgSGqtdAYf4sNeEgKThiBkstYYSP9plxpn7r/+3fOwEMk300dl0SbQU3hng6EqLaM5olPiZiX401yv3Wu4LDsBQEYwSm2e5PGqfseLDwCiHb0FE0tjL1F84E+fDmzQULAwQUw/v/xuM9vJ1nRXdUc532gqCTtPZRdf3DDhkZfpUK0h+n/X/1P35qYuelUVqsEwILfzVs4jOOHpcDUFrMLVzJKeRi+khRNo/lP+fH03R2WAbtADJ14uNIAY7jUfvcOAaV7AOvPyDJTSLPqFuHK02RVDEeSr+R7gE7U0u41k9IGhW3Z1pmVd+7P98JcnJyEAYNqNR5hxiYdfYU6Z/JCls9UGHSOy/qfDt1Caq5O48eL0B7qaqLct5AqCVlBLpNm12trIeIBTW4JJA2I8JboCuOoRtXax97frZIcDajxC66/p2xctxMdFbV1yC0fJa06dQEiNOcWbkZ8++kwDGf3+Cqypco+BgrBM2tr4rOd5yHia1eCZ6LX55IQ8TTWZXLzaWKrJEtSDl+kR0Pc9I7OXDiiuszP/0JZh1Z3yMS8m0t0U7pOFErpIMQ/yQsJkFDrdsp0jyHeuxiYdTn1Ju4Nogw3s2Icw9HK/e/9JfbonxO8wqDGCUA4AyRQ5gzYAnSh2cxwUz9fnYBwvs5/Q0s/pQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS3PR03MB097838.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(921020)(56012099006)(11063799006)(261009223027099003)(261021121427099003)(261021123027099003)(10067099003)(261026121527099003)(18002099003)(55112099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6FLgTZ9gmSYypa0VUXYJ40TmKgeILc0Oc7Lp7fpj/aBsEUVtPa0d1oGjxpLS?=
 =?us-ascii?Q?5SQ5e2nf4EJW0Krqx7uih7FZm3W59nh5DZOoF4J6q8JbWqFkDG8hCqYDSuY0?=
 =?us-ascii?Q?BZmjey7oKqL4MAzqZdZlRFC1D4yyyg/CR0lKKVUoVpaZpZ3iM7UvoHq72ipX?=
 =?us-ascii?Q?ZkBX54yhhvZ9ogJULVI8sA8QGfAwcjiSxtVqHFxlCzbAXjwmFPZwAysWM16g?=
 =?us-ascii?Q?k+7AVEhPu/aDFg7MtFxQ+rkNl0j4o20JjzR+IjBDDO7zdn6sT7x/ZebwmJtl?=
 =?us-ascii?Q?R1g8QVpopnAsAeFZLzuMILOtAjWMNLpOqM+pN2ICel3CTJ7iYisTYbQA9jEc?=
 =?us-ascii?Q?NIFdnIJnGian3z0lJjr1Xr40Zz+puZcjLmD5LnsqdL3I4c8pGjfmawYs+Geu?=
 =?us-ascii?Q?YeTOronkK5Oso6JHXWQhhIYp+QVZAQcCb/r9cY7pC87BD0LyAQIxiCdT7SUg?=
 =?us-ascii?Q?cAhkvzHk/EyfZh8Fe0rms3lIkAZ0JBayVJ69YabtZx+M+6vVN5Hh/Wua7Q9i?=
 =?us-ascii?Q?9GCZXInkMKrGwc2cxEP871Xfwc0ZBf6sFzvL1IGeGRNXJbocKqkEGGIgpTn9?=
 =?us-ascii?Q?mTuSoUkQLWbqMu6TIINnLrj3MuXgeHjgAP+mPvIYp0SuGeKqO159s5bGNSmr?=
 =?us-ascii?Q?cxjqv8IOo8TBVrMOJG5FK1Yffc7VcR0tRtuNuRYTauoS1LI7PYdYpPrmanXo?=
 =?us-ascii?Q?vrobsfxXrLr9z0VNsnKX1WUa8MxHrME2SlSNZMtI6FmJzMKVsmmgTp8ktKrX?=
 =?us-ascii?Q?S4EztCW1HQFDsYbQw1YnhS2sLvSRttys+f4s8Or/P53OR44Xur78QWoxnZuF?=
 =?us-ascii?Q?b80aPuPP5eobYocvZRIZf3QRPd4Dgj2YvT3fVUbetpEHLkhEUWYwfd/E7kAB?=
 =?us-ascii?Q?gnZmFGdJuKnc6SzXaoC2YCsVbcr+g6i79Kf4OfkljbfEo4Ept09dKlreh9eA?=
 =?us-ascii?Q?2RGUr+w+SkvN91E/wQ/RwtKtSc8U3gCDEXue/v4QTO6nXeU0YWjp0UtxRNYS?=
 =?us-ascii?Q?w+IiPCWdVIlKiOXvHH2A25Re5JLN+x1OGH5ZFkQ/VhIyNfrSKhQ8tqJY+CTg?=
 =?us-ascii?Q?9p4NXth0qcHfRvnI21XS5CJY/TXEWnOeupLeQkyJj3akZMYW4oChsAfG5BMc?=
 =?us-ascii?Q?CTb0lLyxlKeyASD0vt6HODrKCgkT7nTa34L1ivlqqyXcwijwNAe1xVUsvZjz?=
 =?us-ascii?Q?wdY/nYIhHe/BD6Wg1fpWXw0TEWUqSbtQ3ILf0M+sqtoV5sRNWwmDn7LuafF7?=
 =?us-ascii?Q?z8KQPggz0I5ByN8FhCUDXNJbvN+48TwlQShVH8l3tztYfZVnSJ7ZAzrQcghw?=
 =?us-ascii?Q?LA87zbkw0aMJa3G68ftUX+cRzCBJzG4FrwMwA9VDo3/G8DzeTIBb6JvB+265?=
 =?us-ascii?Q?sgnU1MeRA+TyQ+Qxgh4vAS0Xzd3SzCy7ZJDOi9YxHQl9g6c12Wix4LM9EyxO?=
 =?us-ascii?Q?7TnoSYlY/W+z8RZpoFbXvHod0EGcQk8PUu1ooGv+bISYS74Qo+9KLPhegrvX?=
 =?us-ascii?Q?XTMv1sZuVkHe4ECRWkavFuXD1EW8Jaazp1Xj/RyP217v9q2Cq/1sApLtVtXA?=
 =?us-ascii?Q?s841aAw0UcEdJ+syEbg19HD+RvHstaE1Ycw1SYNMIM8jPSz2BUFdrlw3Yf1S?=
 =?us-ascii?Q?expgmmLOVeIpWv/rVHmYluU3d+1CsAg/8UkIuL0NgSNJkwZ5bIOqgijjxynJ?=
 =?us-ascii?Q?q7fVM03qGut7QM8NNud0iZ2nHufTkgSgJ5WMP64tC7Jn2Btdv6JGVx9f310g?=
 =?us-ascii?Q?sMWXcd1b7A=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7853906d-e11b-41a4-4b2b-08df357b810b
X-MS-Exchange-CrossTenant-AuthSource: DS3PR03MB097838.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 05:14:27.3069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EC4Jv5W2J8j4wYLooKxm1uKGEOrb7WYa0RXDYr0zmghscQeWoYVvKx8VHPKJ5w/h2VeOYbTmmUpCSnNsV7UGT9xxmq9VE0OQ8iKN7OKPXbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR03MB989214

From: Hang Suan Wang <hang.suan.wang@altera.com>

Increase args array from 3 to 6, for the SDOS encryption to call smc
call which is used for args to be passed via registers and not
physically mapped buffer.

Signed-off-by: Hang Suan Wang <hang.suan.wang@altera.com>
---
 drivers/firmware/stratix10-svc.c                    | 6 ++++--
 include/linux/firmware/intel/stratix10-svc-client.h | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index f7928ef6b6db..8f07b945392a 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -219,7 +219,7 @@ struct stratix10_svc_data {
 	size_t size_output;
 	u32 command;
 	u32 flag;
-	u64 arg[3];
+	u64 arg[6];
 };
 
 /**
@@ -2088,7 +2088,9 @@ int stratix10_svc_send(struct stratix10_svc_chan *chan, void *msg)
 	p_data->arg[0] = p_msg->arg[0];
 	p_data->arg[1] = p_msg->arg[1];
 	p_data->arg[2] = p_msg->arg[2];
-	p_data->size = p_msg->payload_length;
+	p_data->arg[3] = p_msg->arg[3];
+	p_data->arg[4] = p_msg->arg[4];
+	p_data->arg[5] = p_msg->arg[5];
 	p_data->chan = chan;
 	pr_debug("%s: %s: put to FIFO pa=0x%016x, cmd=%x, size=%u\n",
 		 __func__,
diff --git a/include/linux/firmware/intel/stratix10-svc-client.h b/include/linux/firmware/intel/stratix10-svc-client.h
index af13dacdf5ac..9bb46c3cb0f8 100644
--- a/include/linux/firmware/intel/stratix10-svc-client.h
+++ b/include/linux/firmware/intel/stratix10-svc-client.h
@@ -215,7 +215,7 @@ struct stratix10_svc_client_msg {
 	void *payload_output;
 	size_t payload_length_output;
 	enum stratix10_svc_command_code command;
-	u64 arg[3];
+	u64 arg[6];
 };
 
 /**
-- 
2.43.7

