Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013045.outbound.protection.outlook.com [52.101.83.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4926F35B650;
	Mon, 31 Aug 2026 06:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158925; cv=fail; b=LlynTYaGJBnIgJX8xbVgGtCuTr7BduBBNcN1f3p6kzOftrLra/pWdwOMHzqDwmp8SD61D82kDPuYl8kfTEW88UCY6K8SygK6E7xSkBnbcqPaxOYwjaK2lyITYdxnWd/NngOORg/+Uv4QAyQZh/onYvdpn579dcIxPqAfIf1nsvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158925; c=relaxed/simple;
	bh=byERWBwpD8yqNE0TYFSDkd8NSexM6HmJP/58wI41nrE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dQqW6IfY3jrj/LFDOlXv2hZK09dKbdRHDZiB6UHtfce/MoHA8ul4efB0AKJsKxde3jBw8xd1qDNstaXDDu8wNJ2rSJF0M1Q2iggiIQDqP2YHBsbq++KY6hzTGiD99B4NUwDINTRTv9+1A7eZgXg6ghOSZABPR0Xtj3D7W1ARrOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=o/n4nuiF; arc=fail smtp.client-ip=52.101.83.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="o/n4nuiF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUht8RZr9ANF81K6K+3Kb6xzjyr386SJjRFq3aBFxzm1BbFgwAq2QfkmY31ZJSu07unTPvl4tqJCBNBw5Kjc0KbRKSWoQtO591ttXYVZKJd/6SW8gKpEEV+0CR7JBN9Ma83tQ724qtUK0GU3wWCqwHytXmxfk9kp1X9j/joxGUU+PpFMwLh4XxgEZZshA5nQuE71ShV8EBFHyG2PgNvJypPh7/aYsH2EiC9MKroU8nUtDT87chZgOdkS0dLhwC0xcYatgSHHK8vuukl9BRtsmP1Jjso/No+x6I0pYxtVPIpOw1UimdiWNvSCLGWeDk+sIHOmVGTi+scWrcdDRgQx6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qcN6wqH4xF3K8h1JLfZvlbwKtqBk47ZqpoW8K3MePw=;
 b=QjdOXz4kX//MuZx156pChDQn9hTirDmE/8x2DGIRjpFB8bj/UdTeEWiiK7eG/azYFOKZ1zNqzTs72PGyBr6f/iFBajD0MAp9QBRgU0Qxo3NkMF8SHwUfJLm74WJl43pIKILPw/ySerRlB2iWAbx1CpfXqje8RkBbZl6OGxopx5QzCwP/dCylq1pzBI2MKbW07T9pgDGrR/rfS0i+BiK4PsTCjsPh77Yu9ZMYnv2xrNGioUJ+CEavd5HhGZjlfdh6kQhGb+VMXXPSRRKe/Px1wmfdH/dKakDyNyporpP1ThRCwTXb9vqWIzYznhWQMdgeBkJhVK9WPe+9U674xonQEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qcN6wqH4xF3K8h1JLfZvlbwKtqBk47ZqpoW8K3MePw=;
 b=o/n4nuiFzFZdE1Jz6LLJnsJgbBQDBe4WWu4BC9BhOxdUkUH6eSUIIcxSiOX3K3R1V9oI57usau1OvpwJYnxu/Vx/CaeRcuir8RI4Hk3tQy52mP+VxfGQ8o20J3pv5VpGODmzZdmgvkj6FQ1M+3beP0xRVF/FZFKwcS79boR47sb+ZOwFN+Jx6y6xiVevtsx+DcGWDGmqTYHPwEksAUgxRuSIJgQ2ZFgYqwKBFAfA50X1Gtqpv2hQgMqLBXpuN92qGx45k/3H0viJ/s2p0D6I30PWjJ66Qet41Qir1SRTFLggd7kab7oVgQn6CO9mSe9zufnGyu7KAZUN4cVchBwncA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by DBBPR04MB7705.eurprd04.prod.outlook.com (2603:10a6:10:209::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:48:41 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:48:41 +0000
From: pankaj.gupta@oss.nxp.com
Date: Mon, 31 Aug 2026 17:48:25 +0530
Subject: [PATCH v43 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-imx-se-if-v43-4-a3deadbda4ef@nxp.com>
References: <20260831-imx-se-if-v43-0-a3deadbda4ef@nxp.com>
In-Reply-To: <20260831-imx-se-if-v43-0-a3deadbda4ef@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788178704; l=15491;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=Jc9MIPdW3OJQleVJCKLzK3vZuQzL4puZIMPC6zNVIkg=;
 b=qZNNWLtIcw60zC4HAIgTS1V8obazBqpc4JRvHYrxEysDOhc5eX/kmt6vFm68LVIZKEZGv+UT2
 kkx/JXVmOigD9dOHjmTskruIQdraJBcPtKHDW2FY+TeiPJ0bntJNk1a
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|DBBPR04MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dcb8e06-0d87-467f-d366-08df072be498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|23010399003|10067099003|6133799003|22082099003|18002099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	DOQ3AiA0g1JxMZTcu+Z8XZWr2c2grncWnZYj3f2IbqE0RQY6yfTSnewohKgICKCXEm8xtN1AX9kM4TpLtKgmyG8tvnTilEwvOAtSqAgFZFEKi2fmp8PWzEKPEEyxeFQxDIwx1ijTC5medwfmVyDSMa4oAqkJUKK3pGoxaMWBtP304qEmKMPhjSvVPYa+6U+bm5bJRaAGzdih5Hz+fspY3O6CRj+BvutTY3Vu/jtz07URFVF7IoG+yKJ4enzAo4PSn4i7GRmUKWjNq0Ovm6EGusD9Xt4Fa9l5AXw1y1hi3dunH3UfW5cFDm+4+pWhb/FOz6u/FO6Xt02awOfhr7Fy5nF4Rh88yxEcmO0xf2YbU6foW6+lrBi2jaW7wD+93IvHd36bgrHysymRvTlde9othWMmdW9BeHENXMgQYlOvV0omhCbO3kTqYIABKcIzp1a9igf0szIRk3Uh0ieDmC8vJcjjbnrZMh3yNzGtGMdmB5Z1Mq1ivSPFlpxAZwO9rPu4D90VYD4nHEUeFdhtsWsfeBuSKXsc+dxOBsI4fgbhzsvc75Rs/ugq9BvYMuv4C7ACDR/o8Mt/2kAbX7QlmDRrhT0ELZYs9daMmLa/r7GIJxwNTq17EikphSNuQvBH+zCut+6+8kNKrHrKWVOIsU9zv3Fz/ixfOayFKcGCz0U8PiIOKwxuelcGNQ3gofHvX9zekTRBg8eNpmzL0l5nPBlBjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(23010399003)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWpJK2JaL3doVTdVTUpnVW9RRHg4RmlwaVFGaTJoV0g2dWV0Z3RRYWdSU1BL?=
 =?utf-8?B?MldESnlERUFhdUtFdm9ZNmt2aktHcVpPR2lHZ3BqWWFjbVRsYlY2Slg4WUp6?=
 =?utf-8?B?VFNQWXk3WkZ0QkJLL1dCNHYrN1Mvb3JtMTR3Z21WdlFTcDkxd2k5QmdnTENy?=
 =?utf-8?B?SGZmbkZremJBYmhidm90U1dVY3o3OGo0RDhreXZnRHhsOEVnVkNvRTZhYThN?=
 =?utf-8?B?TzJ3SW5zajVnVlVHQ1gxRlJYRkVaSXBrajZOMGhMcndzb3U2RlpTMkhPMGh6?=
 =?utf-8?B?Smc1ZHZNRW9zcDRtMm82eW9wVGthLzZlQjRadFRGL3l5UEg5S3dzV0RqUHpY?=
 =?utf-8?B?b3lrWmt4UDUxc2M5UW4wL2RIWjVVclY0MzQrbHVnZ3hNOXRncEhFNksrSXhC?=
 =?utf-8?B?QUQ2K3RTMFg5OGhPdjJjTXpwSEZ6Mzliam4yVHR1S3JFVlkwL1lKYTZzb2pZ?=
 =?utf-8?B?OWQ3cmkxdkF0V1hieVJIb1htRGVSUDRMYjhnajJqTHJMa1J0QzkvWGNoVFBT?=
 =?utf-8?B?L09TZ2cvRmlEQ2VleU9VN01hRG94TUlYckZtd0UvdkJIa05LdGsreVNuKzc4?=
 =?utf-8?B?NVlJMStCTGdDaUVyZ2h5alpVRnd2aUwvUEZ3NTNnenV0MkVGYXljYkplYjZa?=
 =?utf-8?B?VnMwYTZQUHRocEJDd0FMZGFhV2lwU0tGUmFwUzhaRCtpckdOTUJNSkxVaDBa?=
 =?utf-8?B?VnB5SXI0NHhoY3VvQ0g3a00ydk1BUjI4czVQZlpUdDBGb3lsSDFmMU1zV09Q?=
 =?utf-8?B?S1dQQlFVRU8zT3E2bllna3ltZitETDVYVjhmM05adHVTZ1RQNVZvMTk0Nm9q?=
 =?utf-8?B?d3VLbHZGWUpVU1ZJRERmMk9XZ3NBS0IrRW92b2JwMWNGalE0Wlpjd1hkRUI4?=
 =?utf-8?B?RjBWRWY4RWFWMXp4enJ0TjcyWC9ISHltRGhMV3poQlRNNkJvS0syUjc0SGNn?=
 =?utf-8?B?ckdKR1ZTb3JuUFJlNnlHY1EzZXhnbmdLdWVFVmZtZC9ETWFZZWpDd003b2Rj?=
 =?utf-8?B?cE1xMWQ3QldtZHJpS2t6QWtkcW43QXNicmNOSW1uSGxVMmhZcm94NWluVSs1?=
 =?utf-8?B?MC84RUZ6Wjl0RkhyR2RDQWZHYzhpSlNTSXU4Y2Q1eHBMbkI0Wk1INlZDelB0?=
 =?utf-8?B?WS90QWdtdlJUQXc5REhzNzh3NnExQzdKOFkvL2hTalF0MmVUSGZZVFNzYUt0?=
 =?utf-8?B?cGxPaW5ZNzh1SEN4WXEvVW9Kc08xczg3OU1DQ1BpR0JiNzRsZWNjZVl0RzhU?=
 =?utf-8?B?YzJmTmVRTmpvYnU3Y210Z1ZnaVhDWU9JVmluZDZtaGdZeFBNdHR5akRNOXBo?=
 =?utf-8?B?TzZRbDVFQXNUZXI1c254MTJQdEtiL3RtcUUzdmNvbGFzRU15c1dMNnREa21s?=
 =?utf-8?B?Z09VdFJjV0RXMzBEOHJYQlhqRVM1UmRyM1lxU0FzdkdTcy8vODRsT0hMWHdB?=
 =?utf-8?B?M1NoQmlsbjlNU2J3azdPOEt2VW0vMXhoZktsQjJZZUJYRW1OQUovWTl2UXBF?=
 =?utf-8?B?cWxubU9pYUhwUnF4VDdpc1NlS0ZNQ0RwMWJSSWYwVVVld0xvKzZ1YlU5RWsw?=
 =?utf-8?B?K3NuTERwREtSV3NZQXo0MGk0MjBjWlJnYU1jUWsxMldZZVRkc3hZakE3akxR?=
 =?utf-8?B?T1ViSlU1NmV3RHI2cmZmUlBxRFVTNnYwd05CMGJET1VtcDVyYUlSbmN3eEF0?=
 =?utf-8?B?MmdNUjNNM0VZMzJoN1pXbGd0eU12RHlLRmJZaHFDZUlFTkpqaGt1MElTWktx?=
 =?utf-8?B?SEtIaXdiVzR5Q3RzUW1ZYzF5bkZhR0QrejFVZFB1eHFZM1UycGpwc3pGc1pN?=
 =?utf-8?B?OEs0LzlJSjhvcDR6dTcwcmlwTFJ4QnhwK2FBSkN1RmxMbE03dlFGU1VBamZY?=
 =?utf-8?B?c2NvbnViTWFYTm82dEV6ejRDbTNSVlBoL0ZnbjNpQUF5Q01CMXJsaEtDQ1B4?=
 =?utf-8?B?clRJWC9OeFZwS0cxY2FPeWJRSU9FU1d1L3A1YXpyclRBTllvaWRFM0lmTXdy?=
 =?utf-8?B?K3ZIWDZaVUJYc1RKQWdldjl0N0xMZW9ia1p4SXAzNDYvZFFvRExQckNKRFdM?=
 =?utf-8?B?aWZ5ZHZsSVlCS3BKSG9TaGJ3c3JKaTRKSmpkdGZYMS9YT3RZRldWUlBQWkJ4?=
 =?utf-8?B?ejJqam5FbHVSb014c1NHNzB2dWtOZUZaTFlQVkVuak5WdmtBUHF3MVF4bEJu?=
 =?utf-8?B?M0RidkdoMjU5ZDNnbm93WjdyUmxZT25IcVBybnF1VUt1eW9SWEc3U3hEcFho?=
 =?utf-8?B?TjJzSkZTcXlUOWZaZ01aTXhlcXB6akROam5ZUVVHamZsbjZlaGVkVjRFV2V1?=
 =?utf-8?B?RGpKRStINnZ5U0Q3YjJKV0VRRy9iL3pvZ0xTbTdnUTBqT3l3cUs2RDNpa0sy?=
 =?utf-8?Q?7aK4hdOF4Hn2DJ8IfNo20A2OP/1c7xQiAzgiE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dcb8e06-0d87-467f-d366-08df072be498
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:48:41.1831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XmExWqm5JKVwS+3blH3GNu/ZJOO1drLnDtGzBdpWy7ppniZ2UiIonXbZAXT/Meo74oKGfUOsXHrVsnKynN5FVn6U8rQwtiOiCO5zuo5+03RCHCYOnSpv821+Hvphea89
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7705

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/firmware/imx/ele_base_msg.c | 15 +++++----
 drivers/firmware/imx/ele_common.c   | 66 +++++++++++++++++++++++--------------
 drivers/firmware/imx/ele_common.h   |  8 ++---
 drivers/firmware/imx/se_ctrl.c      | 33 +++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 +++++
 5 files changed, 95 insertions(+), 36 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index a9a0fc16a553..d63dc4fbd4c8 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -82,8 +82,9 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
-			       ELE_GET_INFO_RSP_MSG_SZ);
+
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_MSG_SZ,
+			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
 	if (ret < 0) {
 		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);
 		return ret;
@@ -143,8 +144,8 @@ int ele_ping(struct se_if_priv *priv)
 	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
 			    ELE_PING_REQ, ELE_PING_REQ_SZ, true);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
-			       ELE_PING_RSP_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
+			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
@@ -201,7 +202,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (ret)
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -257,7 +258,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
 	tx_msg->data[1] = 0;
 	tx_msg->data[2] = lower_32_bits(img_addr);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -305,7 +306,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index 74cdac45231c..f7a6df5ea582 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -47,7 +47,7 @@ int se_update_msg_chksum(u32 *msg, u32 msg_len)
 
 /**
  * ele_msg_rcv() - wait for a response from the secure enclave.
- * @priv: pointer to the SE interface private data.
+ * @dev_ctx: pointer to the SE dev context data.
  * @se_clbk_hdl: callback handle whose completion will be signaled when the
  *               response arrives.
  *
@@ -60,8 +60,9 @@ int se_update_msg_chksum(u32 *msg, u32 msg_len)
  * Return: number of bytes received on success, negative errno on error
  * (e.g. -ETIMEDOUT, -ERESTARTSYS).
  */
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	bool is_rsp_wait_with_timeout = false;
 	bool wait_uninterruptible = false;
 	unsigned long remaining_jiffies;
@@ -150,7 +151,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 
 /**
  * ele_msg_send() - send a message to the secure enclave over the mailbox.
- * @priv: pointer to the SE interface private data.
+ * @dev_ctx: pointer to the SE device context.
  * @tx_msg: buffer containing the message to send.
  * @tx_msg_sz: size of @tx_msg in bytes; must match the size field in the
  *             message header.
@@ -161,7 +162,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
  *
  * Return: @tx_msg_sz on success, negative errno on error.
  */
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -173,9 +174,9 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * carried in the message.
 	 */
 	if (header->size << 2 != tx_msg_sz) {
-		dev_err(priv->dev,
-			"User buf hdr: 0x%x, sz mismatched with input-sz (%d != %d).\n",
-			*(u32 *)header, header->size << 2, tx_msg_sz);
+		dev_err(dev_ctx->priv->dev,
+			"%s: User buf hdr: 0x%x, sz mismatched with input-sz (%d != %d).\n",
+			dev_ctx->devname, *(u32 *)header, header->size << 2, tx_msg_sz);
 		return -EINVAL;
 	}
 
@@ -185,9 +186,10 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * caller-provided tx_msg pointer after mbox_send_message() returns, so
 	 * the caller-owned buffer may be released after a successful send.
 	 */
-	err = mbox_send_message(priv->tx_chan, tx_msg);
+	err = mbox_send_message(dev_ctx->priv->tx_chan, tx_msg);
 	if (err < 0) {
-		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		dev_err(dev_ctx->priv->dev,
+			"%s: Error: mbox_send_message failure.\n", dev_ctx->devname);
 		return err;
 	}
 
@@ -199,6 +201,7 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
 	unsigned long flags;
 
 	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
 	priv->waiting_rsp_clbk_hdl.rx_msg = NULL;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = 0;
 	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
@@ -206,7 +209,7 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
 
 /**
  * ele_msg_send_rcv() - send a command and wait for the response.
- * @priv: pointer to the SE interface private data.
+ * @dev_ctx: pointer to the dev_ctx data.
  * @tx_msg: buffer containing the command message to send.
  * @tx_msg_sz: size of @tx_msg in bytes.
  * @rx_msg: caller-provided buffer to receive the response into.
@@ -219,32 +222,34 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
  *
  * Return: number of bytes received on success, negative errno on error.
  */
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz)
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	unsigned long flags;
 	int err;
 
 	guard(mutex)(&priv->se_if_cmd_lock);
 
 	if (atomic_read(&priv->fw_busy)) {
-		dev_dbg(priv->dev, "ELE became unresponsive.\n");
+		dev_dbg(priv->dev, "%s: ELE became unresponsive.\n", dev_ctx->devname);
 		return -EBUSY;
 	}
 	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
 	/* Publish rx_msg/rx_msg_sz under the lock read by se_if_rx_callback(). */
 	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
 	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
 
-	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
 	if (err < 0) {
 		ele_msg_send_rcv_cleanup(priv);
 		return err;
 	}
 
-	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
 
 	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
 		/*
@@ -255,7 +260,8 @@ int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
 		if (err > 0)
 			err = -ERESTARTSYS;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
-		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.\n", err);
+		dev_dbg(priv->dev, "%s: Err[0x%x]:Interrupted by signal.\n",
+			dev_ctx->devname, err);
 	}
 
 	ele_msg_send_rcv_cleanup(priv);
@@ -290,6 +296,11 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 {
 	struct se_clbk_handle *se_clbk_hdl;
 	struct device *dev = mbox_cl->dev;
+	/*
+	 * devname_snap: a local copy of dev_ctx->devname taken while
+	 * clbk_rx_lock is held.
+	 */
+	char devname_snap[32];
 	struct se_msg_hdr *header;
 	bool sz_mismatch = false;
 	struct se_if_priv *priv;
@@ -313,7 +324,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
 		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
-		if (!se_clbk_hdl->rx_msg) {
+		if (!se_clbk_hdl->dev_ctx || !se_clbk_hdl->rx_msg) {
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 			dev_warn(dev, "No command receiver registered for message: %.8x\n",
 				 *((u32 *)header));
@@ -327,8 +338,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * SE_IOCTL_ENABLE_CMD_RCV and is not subject to the timeout/circuit-
 		 * breaker handling used for rsp_tag messages.
 		 */
-		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.\n",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.\n",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -343,13 +354,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * Clamp the copy length to the pre-allocated receiver buffer (MAX_NVM_MSG_LEN).
 		 */
 		se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, MAX_NVM_MSG_LEN);
+		strscpy(devname_snap, se_clbk_hdl->dev_ctx->devname,
+			sizeof(devname_snap));
 		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
 		complete(&se_clbk_hdl->done);
 		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 		if (sz_mismatch)
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header,
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				devname_snap, *(u32 *)header,
 				(header->size << 2), rx_msg_sz);
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		bool exception_for_sz_mismatch = check_hdr_exception_for_sz(priv, header);
@@ -371,8 +384,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			return;
 		}
 		exp_rx_msg_sz = se_clbk_hdl->rx_msg_sz;
-		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.\n",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.\n",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		/*
 		 * For rsp_tag traffic, the sender provides the expected response
@@ -384,14 +397,17 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			sz_mismatch = true;
 
 		se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, exp_rx_msg_sz);
+		/* Snapshot devname before complete() can free the context. */
+		strscpy(devname_snap, se_clbk_hdl->dev_ctx->devname,
+			sizeof(devname_snap));
 		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
 		complete(&se_clbk_hdl->done);
 		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 
 		if (sz_mismatch)
 			dev_err(dev,
-				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header,
+				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				devname_snap, *(u32 *)header,
 				(header->size << 2), exp_rx_msg_sz);
 	} else {
 		dev_err(dev, "Failed to select a device for message: %.8x\n",
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 7bf2febefc45..07e6b6a1bafa 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -16,12 +16,12 @@
 
 int se_update_msg_chksum(u32 *msg, u32 msg_len);
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl);
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
 
-int ele_msg_send(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz);
+int ele_msg_send(struct se_if_device_ctx *dev_ctx, void *tx_msg, int tx_msg_sz);
 
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz);
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz);
 
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
 
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 9e3f81a9a272..0792e5152436 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -293,6 +293,29 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
+				    struct se_if_device_ctx **new_dev_ctx)
+{
+	struct se_if_device_ctx *dev_ctx;
+
+	dev_ctx = kzalloc_obj(*dev_ctx, GFP_KERNEL);
+	if (!dev_ctx)
+		return -ENOMEM;
+
+	dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
+				     get_se_if_name(priv->if_defs->se_if_type),
+				     ch_id);
+	if (!dev_ctx->devname) {
+		kfree(dev_ctx);
+		return -ENOMEM;
+	}
+
+	dev_ctx->priv = priv;
+	*new_dev_ctx = dev_ctx;
+
+	return 0;
+}
+
 static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
 				 struct mbox_client *cl, const char *name)
 {
@@ -337,6 +360,11 @@ static void se_if_probe_cleanup(void *plat_dev)
 
 	dev_set_drvdata(dev, NULL);
 
+	if (priv->priv_dev_ctx) {
+		kfree(priv->priv_dev_ctx->devname);
+		kfree(priv->priv_dev_ctx);
+	}
+
 	kfree(priv);
 }
 
@@ -438,6 +466,11 @@ static int se_if_probe(struct platform_device *pdev)
 		load_fw->imem_mgmt = true;
 	}
 
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to create device contexts.\n");
+
 	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
 		ret = get_se_soc_info(priv, se_info);
 		if (ret)
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index 54b2a262a2c3..dd4a1ea7e35a 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -20,6 +20,7 @@
 #define MESSAGING_VERSION_7		0x7
 
 struct se_clbk_handle {
+	struct se_if_device_ctx *dev_ctx;
 	struct completion done;
 	bool signal_rcvd;
 	u32 rx_msg_sz;
@@ -44,6 +45,12 @@ struct se_imem_buf {
 	u32 state;
 };
 
+/* Private struct for each char device instance. */
+struct se_if_device_ctx {
+	struct se_if_priv *priv;
+	const char *devname;
+};
+
 /* Header of the messages exchange with the EdgeLock Enclave */
 struct se_msg_hdr {
 	u8 ver;
@@ -106,6 +113,8 @@ struct se_if_priv {
 	struct se_fw_load_info load_fw;
 
 	atomic_t fw_busy;
+
+	struct se_if_device_ctx *priv_dev_ctx;
 };
 
 char *get_se_if_name(u8 se_if_id);

-- 
2.43.0

