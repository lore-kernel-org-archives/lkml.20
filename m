Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010009.outbound.protection.outlook.com [52.101.201.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1949519911
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545517; cv=fail; b=O8rwt78rzD5F0aIax+50P/Y9Ae33twXTtQNQ7REIz6PGbbBuoOkxCylh+DULDW3N9EgW9iwZe/tQpF48i+/+cDxwt61MBUTm/vcqNGJcV7p+CzFpm59C9+tER+2NqvSssNnUnrRpCTLH8GmeJqFYT+jeCyXe2jNhZqCpRH3tHSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545517; c=relaxed/simple;
	bh=Mu29aDK8CdRTfFIX/vKN007y/nw0b6gcgR6tLsDPZtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pqSuDe0nRecIRSCKSnUaL2rwMZ2MhgDkyKpnf4RhIZ6/9vgo9E4pEBtX90C8cmSGRs/M01ov8AVUCHpCDokWS/8fHu/LtKMkD/V8MeDyJHrSu9tqC5z2qJu3v6VYR8RdMDWWVV0M9vEqBUvwuhiorfNf7/xQw3ZABuMJiVeg464=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Kr4tSxoW; arc=fail smtp.client-ip=52.101.201.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Kr4tSxoW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIgPNI5/TGJcCXmlhA89WQ7N+y9PXIFDcMv9fNTkXEwpR8r4D+9J+yhLftUP1Go0ONL3U5A23l68QhPeTpahVV/+MIvUcp5Qs6Lc5gnLtkpv5SgwjnOGQI8oDKdrXKHi5Ms+apbCeDeH/GByDRHMquPHL9pF1v/BUsKQlcz5QAlD1U1IS9aZE6gQEa1tCTivupzBbn67qE5V5o5HBtveeFgjTtfMRvQwaK/pydzBe4g0MueGJm1/FWQMlHeJC7x9Sh8btrNeHI6s8oZEKlurrpPjI0U8snBbmH2YHXub9+Wlbq1ocu4gXc63+n05HG3o2Fzgd80EQMRNk24iXr5UYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9hMRl2vRUVg4qvMLjgArPASUx9Q+pkwtn5zHJds2Os=;
 b=tEfqAy+aw3otqC7ebQBpOgjjwXaFjiWp4B18dhtC+WiQVLuus8hJMzgaA8pu3IqMnXG7XjjJTOQLvVU9LQBwbjCI75TkOG31d2waE8pAGWPw4aFrWGxmFYg3X4ArrsNVxEYBxzz8b5f/x0anm7e11qp21poVbEGdqlyLctDbS1jyTiwTZuX0q3mCS6o9iKyktCOfDcmoze9VhR4plf/Vg40jjzsX6XA/CsQ7bMLHPfHQ2IjQNYADGdFsGXjymD+hI9dl9O7gSY4wEQjTaevRzda4kQzLGfcQKgIwS+tLlt1nGdxtJZWpBFR/AeKaGcfqEkB8lm1hm9RejnHUtZyh5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9hMRl2vRUVg4qvMLjgArPASUx9Q+pkwtn5zHJds2Os=;
 b=Kr4tSxoWvsi8MPr2mL39vgn0ohvG1c2hx19Fhk279i/GBuLaij9mIVLtv4GJNbZ9AMFZc+A2g5xdQSgb4oGfiNfPgM3FM8CtB6WtMtJ8rixLEPudp+DehHDmmhINHmbKLfmz+THHVILUbaZL6+TgoGPptiYt5E/GckFTprEuvHKo5VEmnq7zwjrSuCtHIAvM93NRAfqWYGNP9nOC6KYVi+8D0Yw4nzkARh/kzVjQhfKVKUG8UEAF5R+h4xN6I9QwhthH13px1paD68x3QgQzeHUtMob+zAoiN5we6OfIAUjtoBIxPhDlq1dwyiGLDN4KYQxvsuQNWq2xJch1ViK1mQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from MW4PR03MB6555.namprd03.prod.outlook.com (2603:10b6:303:126::12)
 by SJ0PR03MB6567.namprd03.prod.outlook.com (2603:10b6:a03:388::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 18:11:48 +0000
Received: from MW4PR03MB6555.namprd03.prod.outlook.com
 ([fe80::c8e9:5e5d:afad:5eaa]) by MW4PR03MB6555.namprd03.prod.outlook.com
 ([fe80::c8e9:5e5d:afad:5eaa%5]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 18:11:48 +0000
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
Subject: [PATCH v4 1/3] firmware: stratix10-svc: increase args array
Date: Fri,  4 Sep 2026 11:11:42 -0700
Message-ID: <e3d85c9872d552a08ebb836eb17705c02c25f6eb.1788537447.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1788537447.git.hang.suan.wang@altera.com>
References: <cover.1788537447.git.hang.suan.wang@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
X-MS-Office365-Filtering-Correlation-Id: 646c5221-5c06-4fba-530c-08df0aaffc98
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|22082099003|56012099006|11063799006|3023799007|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+GOZ6Bqzjzrch0c0C+ml8bnTN1ON4nZVpxHhV7dLYq6lcIeeRCVrlLaeI/XA+tAOf/RtD+sAMNQf1dpt9RcXzcMK0TTYlHvb983R31gBpaxzKaiIqFt5ZtcNsr3d6+WA/cXi+EFrY74n/t7LME6jdXFwfnx1tlVOkQA2CvEz4ZcJMm87SZwujfu6gXyY1RxXqhs+FK8Hm08IFYu2d7fcTEDiJYvtI933/bzUhH+TpTelT4c3myYuqo6QrhmGw7LL+PH966EuHyTgER82MyUIhHhYVX50BZozX4TZXIsXV+sEnZE9taj+i4yvAqyJFcwwyUqIwGYvWJjPEssXTyNSbvAPiYCMnKye253ZuQ9Yhd7GDjXjP7Dk5to8ZavCvNnOQ5Qioswx5B5LfrJs8/2HTVMPECEbguRKx08iqUdxfBhjYmVoy1RNyleraP7qAsrqhLEK3oxmc4NyrQ5P450KH4kcLI7gUDSHRHPHv/4d43cIe8PdBlJS7frCeOgdbhtYlsRCri9jacC3gZ47PgrHA4z9tOLsiwstmqbdidGMgk4QQG5aRuFQAjBqcs/MCxEhwoOxLTfPKEuUFgWczq/lStZaZzkIHJiFOfFWCFtaNVtMBo60vtL1zN9qrbWDzUvO7cXC7GKbk9U4tpSVJtFtpz22U7SXJbcoOCahUavXfQk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6555.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(22082099003)(56012099006)(11063799006)(3023799007)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eoxsqdLIY4l9aKRCemhSMcSji1xEZRAN8M9EQ3B/CLrpyxnzb/A5FBCDebtO?=
 =?us-ascii?Q?2sgK3OCW7mWORRWMAxQs7AXSdj5LKS9p5jtNqRBLN24NOwdYeXuQ6zcXA8pE?=
 =?us-ascii?Q?j9Z40LAysGdF7gHyuN3ZtuartvU1H4cjL7oGTmdI8368yQo/MCBbkaCrPo3x?=
 =?us-ascii?Q?Ay7/VUhcbcD82tA0/FRVo0QbbOkpChvKpeDsHUz+Ph6dIafXX7PmeUpYHPWC?=
 =?us-ascii?Q?HDmkvUF0t/OkictV5mKDZh4IINwrZSkiiHMVXvyBM3XdV7roP/FE80KKrc4u?=
 =?us-ascii?Q?f5cFsea/4795DHowwHe7sIzNWHHvty66h7hVUzYMzG29LdaDBL8/a64vYsSI?=
 =?us-ascii?Q?bKHPjDVl4wOJ6kgVUR7CPklYx8fmnKuaLRCmky/hs5yeCBji18kK7tRYj9vF?=
 =?us-ascii?Q?J29LFqRrae3PritLMEZ70gOWc+V9ac8FyVGcp3WJxNTW4EDTf2z8I2QqAU+2?=
 =?us-ascii?Q?DDi8q1S37f8b9r8nu1AeIu9S7a18ZuJ9sgAVHQsPZlEb7tNf8o98B7Rc0L4G?=
 =?us-ascii?Q?Q0/vS8xlpV94mxzQFqnpMZ9l/BuS6VJBF+DWFS1fR2QmSBg7P9IjJbnqfyQT?=
 =?us-ascii?Q?JqpIhvd+xR8WNuhBWL9U6PysztQWx4bpfpCmCwII6V/dNt1rMarSPCPdTId+?=
 =?us-ascii?Q?/4B6oX2SCirMGspwRxB6N8HqKisVW+Y1jT7LPMS4vtRa7+3PdzeMEs+gcj1r?=
 =?us-ascii?Q?ApH9Y+XGSU8jw2kDoTb/KL9yFBu2RZiNrMqDM+mEcUMZDWw5+t7eTVQVi8/D?=
 =?us-ascii?Q?HSpbYIQPT8xAnbtfSHYTk4D7zf0u7KVec/vak48tBRfy9/vyuXJYAJ3G3/UE?=
 =?us-ascii?Q?T3k9Li5sPLLbVy5IgBaK5gSeywilthtz7BDvl0Kw/JedziA2s9QaH8yOw60v?=
 =?us-ascii?Q?I65k2fLCFQ3T1ELkFNZzSHO0Y7Ci79PQ0xvcYg0dTj+zW7ficqU0ZaX0sPxG?=
 =?us-ascii?Q?YqUQaLvdTgjURjJfTFkhl8Edr1Ooatt9lqX7DSFM+FuNetzV1ju6SGq7uuCu?=
 =?us-ascii?Q?LI9ufLLBk1F78xkPnmR+sa/DDEl+00i+GAlw81BpGbSOVk2XDsnrzxdKYF17?=
 =?us-ascii?Q?EvSeu/kitbVXSw/+84FJjLfpHexUBzsSqJWN1xf2LdzOMOIMpa+tRjOPn3k2?=
 =?us-ascii?Q?pYFuUXZIpptMiHtlcN3XN9Kf9T38gysvPH4BsmZrpsFzmsxdEA2iVYQJRsld?=
 =?us-ascii?Q?UxAiviuDoJMS5ZTAxmlUNjmeZAl94d8Bqz4N3pBR4gJOc//kogiXuqJyL3MC?=
 =?us-ascii?Q?y2Os2TSChWz8AHv0iinPTaIkzPEOxjHmTjlKIGTWZgoigIlTO6TJHPGhLcfx?=
 =?us-ascii?Q?uspfmQyIAeZOsShfllvDfF4mSt/t9fqxmMp89biOLLcW/uCRi1ZP4ub5EjFW?=
 =?us-ascii?Q?v8n3DSOllviTm6PHB23Rjhb4R1sio/qY8ZwruJEiXcWChrAPsHOasXY3udjF?=
 =?us-ascii?Q?Bzljqg0Tov9gG13Lg9AP5/JBSuhYSzd7tnyZYaxQaCwdWmaJqtrybys/3UmR?=
 =?us-ascii?Q?bNFo8+OBE9OiGr0Ge70Q9dpKZ9xAfx8ioEZjTBntIDaQ2G78Vk4PN4nyvDQ+?=
 =?us-ascii?Q?leWBJ1ODp4WxXQbEt5gwMkofvcTNuvD/p9TwTpz9PVBJ+daS2BwHz6F8kDV8?=
 =?us-ascii?Q?eeFuyJrWYTLbOid7YxTX7U6FUvijbpdaQLljm1t4x34iOgkpov81Q9MZNhCM?=
 =?us-ascii?Q?PJ5y6YQ4tOrIjymo88nES57jEWRUU/xrytwB0LD6mMBJG95TbNwxfJxSe7LO?=
 =?us-ascii?Q?6hOFH27HNbny3yZKoVOWoc5VdOzbiMg=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 646c5221-5c06-4fba-530c-08df0aaffc98
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 18:11:48.6032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vNzQDGYYW5O+FhVzDs5cCH3Dl3TngyNqVraIGF6Q1nI5uf1Z0WKxhTlEH4NaLLX9NMGZeOj4n+eVGdF0tz9xwfo0CPCLgDS+fY7fzKrNz7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6567

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
index f8c2da207cb4..07345efeef0c 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -173,7 +173,7 @@ struct stratix10_svc_data {
 	size_t size_output;
 	u32 command;
 	u32 flag;
-	u64 arg[3];
+	u64 arg[6];
 };
 
 /**
@@ -1888,7 +1888,9 @@ int stratix10_svc_send(struct stratix10_svc_chan *chan, void *msg)
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

