Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012003.outbound.protection.outlook.com [40.93.195.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57773E4105
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006444; cv=fail; b=GrUSuHscX8y9v+2Jdczo/ffR1rWlGcZeUZrEN/7isAOYFDrUPCNHEDiX0ELH3hcdKdZGVHV2TaFduMwzaPAaguxghJmjQKF5BmFgLIWgiBs9n22BSj/ZBTokPVTdlASgu0RL+NecgypyXu0yWVGq8tLeCs5hLCfY+t8vZOip57U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006444; c=relaxed/simple;
	bh=ASv76ZuMw/QA2/lf6g/PdUd1OV2Py8aIsppFnu085KA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=e4eecrOVzMOZy+LNrCYkuHQQbO+eWLCZYxXXdULY2WPpH5BTIFq6QRqjO5s9vDHb3LkzM5Muk6hjDeLP8n7kOjTPVWY51Ox5WTGhEtOLz9ltBesbBlJ3nPRsoEKQ3S07gm//zeStxEZril64GyU061b3ATJJomZ46Fx1kxxngkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Ocb4qzHS; arc=fail smtp.client-ip=40.93.195.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Ocb4qzHS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bc+hl/OxHVzkXhTli3P7DwfuexU2Js4DahBRu5/u4HbJG3fNPVSDpxb13F9uwfQutac/5lrG8K2PVPrS3S80OwkEqwOtZJivh6xOJRxH2+kUCwYA89DIVjvpP+Yvq/YTS6vzohLkR43Jeim7+qHzD0W22zHxzQYWfJJfiaWJIpuKeXPtHaOrREmUrgupGXpLSVS4Y24tzetm5HdvjkCCsYtolklK86H9ZB5wZ0ENoIeQ5Ux1PkzEOilkfxuEltkky416CzUKdGq4FUnnY+sM/01JIXxv2zwsuCtWhpXIf/s0JEzpY16Nl48E4Q+/A0eC/iewzkD8ZgpczU+wL1yg0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOWVq7bnMdbAA6KeQozhfapGkFx8F2jTdkjiHuK0Cuc=;
 b=OHmy/uCa/h4jNtKCv3aqCZikTWILWwjapxJn28dcOlUAoR1bS/+b0KwpTEHaNmpP4dyZfBG3LLnDDBLC6yWyzVsjYDT7FSq2oxP/NUkE1jCVcSDiGsHum1G9nyldtlpL5uhqUYp7QH8Nmm77eadCN6Nwa6yrXL2si0oEYrtSeigiNa21NW346DKQ6lL55O4Wc6eCwTyBe2AAMjeoM0LrzKEzb2HzoSklRw1insyo3Fq09fNfNl9bIMPsirs0hZpbBzzswuOJLHn/cU/Cdynnjg8fc4DnyQP8b1O2pLnKxH3IgfuIHZAP8++DktNMf/zW7grq2Kg5kemA3qM6JSqidA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOWVq7bnMdbAA6KeQozhfapGkFx8F2jTdkjiHuK0Cuc=;
 b=Ocb4qzHSml26ALSkit9c0zd9OSPCwFtATnHl9F9BSagGaRwbiabXnUWM8XCmb0dOuiHY1+mLgjLOYVypFgQLtkgFtNA0UrQOMJPKDvUJSOTkjd3XLnY3vU8YGLEguUOyyrswEL/kT1jeDQibjOF5G+neEZ75gAfjiTsVOJ0zeKOJYACylH+HnB3Gj28D1WdNcPMWaad+3/uApXRtuOAr2FUxfvvD/GsjWwcxnpS/7QLNWH82TewahSxyjbA0fqQUWaDlBloPr2Ht2mq6fG803WtYo8/tiDGlTSDpFbuZXVZbPH+BE82u036TK75/H4PMKXjA19j4QcrS/CgXXBq8Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 by PH7PR03MB7105.namprd03.prod.outlook.com (2603:10b6:510:2b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 16:00:35 +0000
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80]) by SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80%3]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 16:00:34 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH] firmware: stratix10-svc: Reduce polling interval for command status
Date: Tue, 22 Sep 2026 00:00:22 +0800
Message-ID: <397bca17aad39df1b48dc971ab09c8955d778252.1790005475.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0183.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::13) To SJ0PR03MB6581.namprd03.prod.outlook.com
 (2603:10b6:a03:393::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6581:EE_|PH7PR03MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 5071d8bc-8861-4500-8499-08df17f9787c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|5023799004|3023799007|6133799003|55112099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	hLS6u1sPrPF7TnTf4R1bcz81Z5IMlxFKyokR92LsqhinLB8Ov29fvfJCOD5L5wiDONyGGdYbES1mOR9JRENSjKhHwxiBOE8N8xEQQfj9l1ya+aGbcPUHybTBfqSPczDFBosYpEFIXQ5i5anujijZfpavTTvf/cPBmkOYuPnQhjuEt4vatuiUFFURZsdFCXXZz/S4/h7z1OhIxEzx+z5QDy4lvVCaMJSOB2AYYOtzds1PP9hrenO22VQlDiQ1ujbBbD2kp9KYyJ0uxL4YMu/Xp0FJXxv9owq9oerNVJb2Uyq9TFiZWEkJ+hgPQYrGO1alv2gAkDH5l4KU5XBOwo5N+dM1Hp6NVQrTJU6jSRItNFndQ936TLJb97eKQFkUNjFxgYnxUVYk2rozv/LRkWNRG3rxfkbcKsfnnQsVJvfRhqrKoAjXxC0Bfcbc1e0Ga4t7922nTL6S2J2xRpuM5wP3r7UCwjvUgiWrOMyAJtSbJiyJJEgk8D64BAtHQ3+2X7h/12y3mHWiVHorB3vATkINyJBJ+6sW94obPF62MSd+hd6Y0ljWlZ4N7wmcccWzCYS03b0uzMcuKWv15+/qoudubHcgV+ZYGF3s7GvyxdFkIv3tPsVMl8Rp6o6Q6YDRsj29hFz3/adySJadhTfuCIuMgQdcpf5+ls9tE+Zp0u0sye0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6581.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(5023799004)(3023799007)(6133799003)(55112099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cm00Q2VnOWRhN3NLU3kzQktmeVpxM3RIeUFPcFF2VmlJeUxQckhIMGpUWUZ4?=
 =?utf-8?B?MkMwNWpKNTk2LzhhMnpHc2VTckZZeHBTMmdmWlVZaENNMWFDT3c0dVdHYzZS?=
 =?utf-8?B?aWFzNTB6blp0bDBibkwxdzdDVjZoZVlnRmFtdEg4L2lQcFBaaG5OdlRmVU5U?=
 =?utf-8?B?aDIyZ3hPbkJnRlN4TlJvM1RJSmd0cEZrdmY3Tnk4N2ZhWTc3dnF2U0JJSlZ3?=
 =?utf-8?B?eFlTSkVMQm4vdWNscnJIUHFZRlZZZU9TZTZoWjYvVFB1ZENBQlJPc1J4ZVcw?=
 =?utf-8?B?Z1ltTVU3N0tGV3V1WkpBUXJWWUdXNDgzSGlzVzNYS1cvK3VoMnNoWnZub1Ba?=
 =?utf-8?B?SmJvWWJQcjJOWWE3aFQ3NU9TVlpkWm1Tb2VoM3FaUkJtVDB4L1licDdSMEpR?=
 =?utf-8?B?U1hYVzFDcE5OOHVpWlc4ak1DbTk0elcvYXA3ZnRoZmNyTkZWWVYrU21xZFRl?=
 =?utf-8?B?dDVvb1lGMk1UV1JEaGJMS2VHNVNzdlZFZWNveGlKOHJ0RzlHclV6SHFKWGpV?=
 =?utf-8?B?UE1HWTJMeXJmeGJRVzRXTE9pcFhOUXBiN1gxdVh6UUIyOTNubk1TUXJSb0VI?=
 =?utf-8?B?Y0hadUZ0bExRbnFoUks5Ni9iMDVZT0NKVFdEMVBjY0h0a2VEdG5KYmJsN0ll?=
 =?utf-8?B?ODVuelJSWTFlc1UremxNbW9TRjE2VHByanZ3aGZXMUh6ZFgrUHI4d3RnYk9F?=
 =?utf-8?B?a05OZlFKMnZhUjNCMTQ2ZDRJZVA4MlFCd29EaVl6YXBWckFIS0I1ZjRxRDhS?=
 =?utf-8?B?QytBcWVHZE11WTJGd01ZNEladm5mbjNXZWM3L0NqMEgrcW5vVFRzVlo3ZXZY?=
 =?utf-8?B?OWRvOVpHb3FEenFLczZjenNtUzR1MCsybWJMNzI1Z2pzY09Fb3djeTRaOTNK?=
 =?utf-8?B?Tmp6UHdwaTFodGVkc0FIclhKZzMvUjI2WUhTMHRNZS9mcnA5ZE9wZTJpQ09k?=
 =?utf-8?B?Tk9LdjBiRXE1dDlCM0NxdHJmbUpxQ2hRM0ovV09uS0RzZ0ZtSHJjMEJVVHdN?=
 =?utf-8?B?NEcyZkJhcEtzcW5EYjZhODB2QlByemhDb3JtbmR6RmxRc3BWb3RqeWtSWVpO?=
 =?utf-8?B?YXpJTmE4VThJTzRGcE1uMXBmb1cvSm1hUk1FL0hnTjlRQmloQVhQYXZBeSsz?=
 =?utf-8?B?TkRoY1pzUXEvSDFoSXlDSVNvVXN6bHJhQXZPSytGNG1lMWZWS2ZqWEVvREs0?=
 =?utf-8?B?dEEzK0k4czVCMll6RXRoM3MwUDB4SW9sTGVTcmpFSUJKTEFPT3FidGU0a2Fu?=
 =?utf-8?B?YndiWDRIT0xnb0s1R0JsM1NUMGl0enpJcitZcVl4NThmVVBuN2huSllzT2hk?=
 =?utf-8?B?dk1vRk0wdHBmVDB0ang0ZitNaTBEMzNoaXR1WU1yZnRydk1qaTZlUExxZGlD?=
 =?utf-8?B?Rm9LT1FHUnp5d0N5aDhyUUVQeUc2eVFhWVFqRlFzcS85Ymw3N0J5WkdPQmhk?=
 =?utf-8?B?Ty9YSnJrc2hUcDk2WVlsK1RvblhmcTJwOFpnQjlaUWg0Q0hNNkJpaE5jeXVU?=
 =?utf-8?B?ejZBV1lRMFpBcmJldHluQnZLTXNXcUhnc2RaNldCYkRKUW9Ob2lqLzJjUGla?=
 =?utf-8?B?YjdwVnpvZUxjU0xEUjRqVWkrVUxzZnlwc09ReUhMcytBU1pIOHBGWUNjeGRE?=
 =?utf-8?B?T0tYdHF5TW05anpVakJyQi8wdDJ1clZ1eHhVVXVHRmRGQnJlckFiZExGZHpn?=
 =?utf-8?B?Y0U4MDFKTk92L3JuemxnZ0tmTmUyWkhubnRWay9VdS9JZVBwaTEzSG1KaXpp?=
 =?utf-8?B?ZjZxOUtGUk1Pam1IV0QvNjU5Nk5KY1ErMVdrZ1hBVlpHUVpRVVZ0Q3lOUzFI?=
 =?utf-8?B?blQvZGRDbXpiUzN4QTdNRkgvRllTOUJtQUc0RHBScUNmbmQvbU0xL2VaQjdw?=
 =?utf-8?B?NFE4Nm5qbE1OVUVHYVVlMWFPcGQ2VGhLNkNBeWdmS3MzN2h1THFKckNoa25G?=
 =?utf-8?B?Mk5OZ3JKMFMxSWpRbTQrOWN0cFB0NEY3VFN3dTdNMGNzOGY0VUd5aDJOQlk1?=
 =?utf-8?B?OUhmZ0xkRUtrWjV6VHgva2ljUUlxWTdKVHJTVmVjTTdSb0U4SzBnWlZvV3Nu?=
 =?utf-8?B?NlhrYnV5LzBpSkJQNENDZUpkWFZwT3lJaklSSGVIb21DQitjYzdBSnc3SkNM?=
 =?utf-8?B?Z2x1WjlzZzZuVlAxU0UyakNVS1pNQ2xSTFo4dTVQTWg2b2tmcnFKRVhzdXBp?=
 =?utf-8?B?NkFWdVFrbzRoSUZ4NUJPN3VUbVhlck81YjVaOHhLaHE2UjJyUlB4VnJlK0ln?=
 =?utf-8?B?NlEyT0p4THFyRkJMcTRuMlRNQWpPcnZMY0xsTi9oK01OZzVwWGdER3FwZ1pr?=
 =?utf-8?B?d1dPdnF0blFENWhHa2xZVGdSVEx1eE51V2ZLTXJCZEFsMlhvSjIrd3JQTDh1?=
 =?utf-8?Q?bhDWl5k5XwJREuso=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5071d8bc-8861-4500-8499-08df17f9787c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6581.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 16:00:34.8467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTsDJ9B3mryoFH/XLtzcEwRvLPKhCMAnM1m+f392msDLcqgwoJ7dWMS4tY4dN8Os169s7MtJ1pAJiplS9XLurg629ME0T8KTdjDC+UDTZd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7105

The service controller currently polls FPGA configuration status at a
fixed 1 second interval until the 30 second timeout expires. This leads
to slow response time for fast-returning commands and unnecessary delay
before reporting completion.

Introduce two polling modes:
 - Fast polling: 20 ms interval for up to 50 iterations (≈1 s total)
 - Slow polling: 500 ms interval for up to 29 seconds

A new helper, svc_cmd_poll_status(), abstracts the polling logic and
replaces the existing loop in svc_thread_cmd_config_status(). This allows
the driver to respond quickly to short operations while still handling
long-running configuration commands within the same overall timeout
window.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/firmware/stratix10-svc.c | 104 ++++++++++++++++++++++---------
 1 file changed, 76 insertions(+), 28 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index f803a1e947b6..65ddae175817 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -40,14 +40,32 @@
  * from the secure world for FPGA manager to reuse, or to free the buffer(s)
  * when all bit-stream data had be send.
  *
- * FPGA_CONFIG_STATUS_TIMEOUT_SEC - poll the FPGA configuration status,
- * service layer will return error to FPGA manager when timeout occurs,
- * timeout is set to 30 seconds (30 * 1000) at Intel Stratix10 SoC.
+ * FPGA_CONFIG_STATUS_TIMEOUT_SEC - overall poll budget for FPGA
+ * configuration / service completion status. Service layer returns
+ * error to the client when this timeout expires (30 seconds).
+ *
+ * SVC_POLL_INTERVAL_MS_FAST / SVC_POLL_INTERVAL_MS_SLOW - sleep between
+ * SMC status polls for the fast and slow phases.
+ *
+ * SVC_POLL_FAST_WINDOW_MS - duration of the fast-poll phase before
+ * switching to the slower interval (1 second).
+ *
+ * SVC_POLL_COUNT_FAST / SVC_POLL_COUNT_SLOW - iteration budgets derived
+ * from the intervals and overall timeout so the two phases still sum to
+ * FPGA_CONFIG_STATUS_TIMEOUT_SEC.
  */
 #define SVC_NUM_DATA_IN_FIFO			8
 #define SVC_NUM_CHANNEL				4
 #define FPGA_CONFIG_DATA_CLAIM_TIMEOUT_MS	2000
 #define FPGA_CONFIG_STATUS_TIMEOUT_SEC		30
+#define SVC_POLL_INTERVAL_MS_FAST		20
+#define SVC_POLL_INTERVAL_MS_SLOW		500
+#define SVC_POLL_FAST_WINDOW_MS			1000
+#define SVC_POLL_COUNT_FAST			\
+	(SVC_POLL_FAST_WINDOW_MS / SVC_POLL_INTERVAL_MS_FAST)
+#define SVC_POLL_COUNT_SLOW			\
+	(((FPGA_CONFIG_STATUS_TIMEOUT_SEC * MSEC_PER_SEC) -	\
+	  SVC_POLL_FAST_WINDOW_MS) / SVC_POLL_INTERVAL_MS_SLOW)
 #define BYTE_TO_WORD_SIZE              4
 
 /*
@@ -441,6 +459,52 @@ static void svc_thread_cmd_data_claim(struct stratix10_svc_controller *ctrl,
 		 wait_for_completion_timeout(&ctrl->complete_status, timeout));
 }
 
+/**
+ * svc_cmd_poll_status() - poll secure-world service completion status
+ * @p_data: pointer to service data structure
+ * @ctrl: pointer to service layer controller
+ * @res: pointer to store the latest SMC response
+ * @poll_count: maximum number of SMC polls for this phase
+ * @poll_interval_in_ms: sleep duration between polls while status is busy
+ *
+ * Invokes the appropriate ISDONE / SERVICE_COMPLETED SMC until the secure
+ * world returns a terminal status (OK, ERROR, or REJECTED), or until
+ * @poll_count attempts have been exhausted.
+ *
+ * Return: true if a terminal status was received, false on poll budget
+ * exhaustion.
+ */
+static bool svc_cmd_poll_status(struct stratix10_svc_data *p_data,
+				struct stratix10_svc_controller *ctrl,
+				struct arm_smccc_res *res,
+				int poll_count, int poll_interval_in_ms)
+{
+	unsigned long a0, a1, a2;
+
+	a0 = INTEL_SIP_SMC_FPGA_CONFIG_ISDONE;
+	a1 = (unsigned long)p_data->paddr;
+	a2 = (unsigned long)p_data->size;
+
+	if (p_data->command == COMMAND_POLL_SERVICE_STATUS)
+		a0 = INTEL_SIP_SMC_SERVICE_COMPLETED;
+
+	while (poll_count--) {
+		ctrl->invoke_fn(a0, a1, a2, 0, 0, 0, 0, 0, res);
+		if (res->a0 == INTEL_SIP_SMC_STATUS_OK ||
+		    res->a0 == INTEL_SIP_SMC_STATUS_ERROR ||
+		    res->a0 == INTEL_SIP_SMC_STATUS_REJECTED)
+			return true;
+
+		/*
+		 * request is still in progress, go to sleep then
+		 * poll again
+		 */
+		msleep(poll_interval_in_ms);
+	}
+
+	return false;
+}
+
 /**
  * svc_thread_cmd_config_status() - check configuration status
  * @ctrl: pointer to service layer controller
@@ -455,8 +519,7 @@ static void svc_thread_cmd_config_status(struct stratix10_svc_controller *ctrl,
 					 struct stratix10_svc_cb_data *cb_data)
 {
 	struct arm_smccc_res res;
-	int count_in_sec;
-	unsigned long a0, a1, a2;
+	bool done;
 
 	cb_data->kaddr1 = NULL;
 	cb_data->kaddr2 = NULL;
@@ -465,30 +528,15 @@ static void svc_thread_cmd_config_status(struct stratix10_svc_controller *ctrl,
 
 	pr_debug("%s: polling config status\n", __func__);
 
-	a0 = INTEL_SIP_SMC_FPGA_CONFIG_ISDONE;
-	a1 = (unsigned long)p_data->paddr;
-	a2 = (unsigned long)p_data->size;
-
-	if (p_data->command == COMMAND_POLL_SERVICE_STATUS)
-		a0 = INTEL_SIP_SMC_SERVICE_COMPLETED;
-
-	count_in_sec = FPGA_CONFIG_STATUS_TIMEOUT_SEC;
-	while (count_in_sec) {
-		ctrl->invoke_fn(a0, a1, a2, 0, 0, 0, 0, 0, &res);
-		if ((res.a0 == INTEL_SIP_SMC_STATUS_OK) ||
-		    (res.a0 == INTEL_SIP_SMC_STATUS_ERROR) ||
-		    (res.a0 == INTEL_SIP_SMC_STATUS_REJECTED))
-			break;
-
-		/*
-		 * request is still in progress, wait one second then
-		 * poll again
-		 */
-		msleep(1000);
-		count_in_sec--;
-	}
+	done = svc_cmd_poll_status(p_data, ctrl, &res, SVC_POLL_COUNT_FAST,
+				   SVC_POLL_INTERVAL_MS_FAST);
+	/* Fall back to a longer interval if still busy after the fast window */
+	if (!done)
+		done = svc_cmd_poll_status(p_data, ctrl, &res,
+					   SVC_POLL_COUNT_SLOW,
+					   SVC_POLL_INTERVAL_MS_SLOW);
 
-	if (!count_in_sec) {
+	if (!done) {
 		pr_err("%s: poll status timeout\n", __func__);
 		cb_data->status = BIT(SVC_STATUS_BUSY);
 	} else if (res.a0 == INTEL_SIP_SMC_STATUS_OK) {
-- 
2.49.GIT

