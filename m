Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D39393DF5;
	Mon, 14 Sep 2026 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378466; cv=fail; b=PdeYbA4jsluZQOMNsEDlUxIkyXZWT1w1K83t9ufGldHyyZUp6Z9rQI4GKnmuRUV4Sj1+BLVL/7mfkE49hyTwTlUZ74Q4nE2hNLIf0eHYmqq4zpbmaWDRm1whdlceMISLgg6MvCAlDKJ5X8TiAP6XjrbLWha7o6IQSOxK2wxcZi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378466; c=relaxed/simple;
	bh=DPRiIA6ZjbvSpq7YVTSM5cwLFzML5FVVeB4Tq2fkY78=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=rNwflWOY42jvqneAQDjjZltDih+Go9WwyafXn18hAE8re9UtMUrmBjAYXibuFb2Rz/uAkTx3qkF4DEhdTedIvkN/seTAlR4F7NLPZ5kZDwxcWbqixAQMyFB+kfFYozSBloeecLIb7bs8LSHKSuYlyZLQ7BQiLMkDCDwq3nUfLsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QGUccJO5; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QGUccJO5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbM4/UyJXUHcK2vC9+t26515snQ6iUFbO9Gb9hH0NXd3y+HOmp+9E/mGoE0Iq1CcPuvTHw8afvvS/D4gEPW56Agf5zl6PxheLVOpaHgnVZiqMU1yj+5uNwVMFqkuF9zg2X2TgUOowRLaeIDBmCOLm14uhbsTGxjMWl/cb3lPpZX7cYTR9N84UUSN5pvTajLop6T+2G+uVJL7vW0n1SUWpzKJWGlfBiNNPyRfxa6urHiUVENkJSuDXDoL+IMcmmm07Q2XIt2qsyxupB839sJZHMqAfzq4bhyLLFpAllf8KJtoBnS0HbGuwRDL3mjzga0sNpjJa9cW8Y2TDEj+7BxD5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlJTds6UpcSqEvGYSdxYquPuN1F/QVmLZ4kECA+iiFg=;
 b=btxLpRPqmo8kO19DklVRFBijwlSn7JfAfzLhEy3L2739qikZqVz2bTXboY12hFJaOP0ki7pyZMkT+NyAg7uqd8E3wUxnBDB4wEHWWZ6wFufqDFCDXiEJF1klcLgfw/d7KpOANOo9bQ20V+hnoGH4h+cvNMMRolsMkWKNZMcD1Sac5exDiheFqKwVjq2AFMnOvUm9BF3/Q+FzuPjLxIpHadCiD2lQ95ZWC77/0OVZWeCT+jHUME9an+8PQtAgXaKZop1YPu6/TPAx1OWZJmDkh11/2pp61+V4fejWX9IsX3gBiXxuNC7xoxlHFDJHyZ29Webk4B4GznvUSGiiN/tenQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlJTds6UpcSqEvGYSdxYquPuN1F/QVmLZ4kECA+iiFg=;
 b=QGUccJO5ubn43nKWB8n4jfxh8jMTd/qH6OU/hfE+ooVgdmdCb5Hf1E+BcFUEKA9v2GqHD9Wbg1oTAYerlVjxfxjiEs16HU3n7nYMaowmYpr4CE5VoCLaW5NaB3zMZP7oIbeFIFiTIthPKJD0Q1FumB2FilPuYpGiZ0CAkBP+bnmqG7BwEYZeQI2z9pdHwtXpuonGlq94E82sw9mD0BKRm6LPctde9v6u2KhpLoU70ka4YjaH9SoSCMa1EN6udNaobUUhLJDTBKO40nmhI29NKxShoIAijAzi4jxyz7tA5GNVZK9ZAObWy8x4wf1dQC5EAYzBtcng3RZPnaTfA9gXgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PA4PR04MB7614.eurprd04.prod.outlook.com (2603:10a6:102:ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 09:34:20 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 09:34:20 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: badhri@google.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: typec: tcpm: advance vdm_discovery_state on Discover Identity Not_Supported
Date: Mon, 14 Sep 2026 17:38:28 +0800
Message-Id: <20260914093828.1910201-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0309.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::12) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PA4PR04MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: d887e9c8-b9e1-4683-89f0-08df12435a57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	0s2IKWAUEfBwImGcyPSR68zbA6go9aSfclzKI37gI/VTKKnOSpXUIXU+6HR/NM/ravzjQkrGN7ggAsJlaZ+gRyWjVSO6L42scTKTAA/28NuDbN4UywtcbhAMBPfERtjypGZFHIxrKj56HL+CoFz0PdzisLBvHJwUnpsSPefAkwJfgP5DJZXuhI7VREVIA5fOLCtY6QVJw6nktFozj/drPH+ZGB7bj/fcYRpmCWtNdQ/gXjNDsIUlJl95NNChw2qbBUE7sojLbIzcjklac5VJg77HfwxF8rMkAJz1cUBOLu+3ifBwa2xTmicgP6OVBq4+QlPakjB+IzZgRD0M6jjiXnuydnP9TNRDkzi3WlWHKe5ViIYcKM8eHDkgTPzeZ8fT0B+uTbZo+fEIx5DouYFHsP4yZmM4j7S8PVzD+XjRMQGxqk56h3yCFDi4cl+tmQG5ph7kba4H58QuLNpr1EeYTBhymwtL0dlNEH/+x9LOsUyZRQa8D3tCD/TM4ComukHNLC3A+0vgtPyqG+YCitm78bQb2BeMN0UK2+qLKhDRlvV+Q4NB9eeWd+8tHPzdLVYRBgQcd/DwbUW5lZnnv/P/7EZJJtD8H2yOBA+oGkIHqVHfsX6RRg1JQhy/vCLto/vkVrgY1xEx/7lN/DX2sglkae6CysaAf2PXAwxRPuREPoE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UsLBT/BdShaVkohWsIqAjk54IRtex/rVxagA+dWhKUdT0Chg0IiVWrhIbGnF?=
 =?us-ascii?Q?7x4N3wrvbuXBAEBFLj++TGC/wwqC4ZcgzeldDg2uFHCoF8rqguddaxtf0OfB?=
 =?us-ascii?Q?nnYF9lOZiq1/sCtWZGO/xmFku0wEVZIEPn88bdgYJWzPeW9XPX5fsf1/yt4g?=
 =?us-ascii?Q?HE2XZvyuuI1rYrwxZb4+p5QpXdjGjLVBxQBKPc3+3xi+HBn8i6bc6KL1898I?=
 =?us-ascii?Q?/dgMgzTsZFsSOt1et7LSl2yVHycD2gDm9cTGg1ZUU8qFMNKD4xGWZaZP1fXx?=
 =?us-ascii?Q?Q/UdD5XjNG76wVUy3gEAcp370MedUZJicTLSwtaLdI+xCIx6y51bVd9sHRdP?=
 =?us-ascii?Q?BNRSMGS9RjL3DC9B7/HhV2MnnsJ8aiIa+sBs+p02qE1Kb72XCuziQ79h9J0E?=
 =?us-ascii?Q?vf5shm3WS5C7/IPk5Kfm/CsN2sIddbmDfRcaCc4QuXP7gFb41Wp8m95sXLuZ?=
 =?us-ascii?Q?5NiMuDN9h0/76Ua8hef64a8cRfyX/0B6jkrYU3Ra+gxtBRetWfrvxF6TX5+z?=
 =?us-ascii?Q?ORXMMdMtBJ66EKSIdB7Ps/9LQeFxOnw0xlmflA47REd5pGiy8vzQcIagvI9q?=
 =?us-ascii?Q?NTUpRfhlI9+ECQcfjbGkbRWdaLDeGNAWlh6WFQk32TnHJ+EwZmYDhYC8A27m?=
 =?us-ascii?Q?JBQVWGJFuPG7WxEYr4aJIUL9kL+u8pbd5qTKCubbtbCHGElZavH6lHVagkDC?=
 =?us-ascii?Q?+9glBN8L8d662GcRTltgbdAaB9l5f/LDZo1ABq8LJU6gE4xHrJ6LaZSw5xEG?=
 =?us-ascii?Q?1V50Xxm+o7i9luvY4/0qRuJlNuDmKSToDKMVVMgBKMhp37Aim211HzG7QKP9?=
 =?us-ascii?Q?C4Z4CiM+J2HZ2ks3cM51wlFuCP4poSFtC/8lFlh/KTQ+B75K1KGdpIFGECUu?=
 =?us-ascii?Q?b2ytkzPNmPNidC9EtWBDBiMeG7OtXTZaUj8XbIyVghW1EREGFLuIEwk5y+L6?=
 =?us-ascii?Q?M/JuoRb88+H5JTuXEC6v4GYAzeoxoP5vJfI17VrNXiaYYnQ7dAoEtijx45Ko?=
 =?us-ascii?Q?qZcC8K1/xXSL41LIKfKYuy/qCiexRavi/vFMOuF1KkTUJUuX/P/WJlEQnSZe?=
 =?us-ascii?Q?RMIuDWkbOwyXqAV7G9hT0RZLvdyVqG1ek6UlmuYpAq3qY4mRv7Exsj/eFBsw?=
 =?us-ascii?Q?IQsUi7febrSAXKZVX4NyFE4iWV067vEPITFC2JyhIL9qlGnCBgkhprGrj4zq?=
 =?us-ascii?Q?8yMcz4c7VLL0FDbObRdoxZ4zh/ayHzXcGHEa39aCoaat3WvCdaoGRFcVrxJy?=
 =?us-ascii?Q?Znm+Se+2+VeS4MHNYBDSdUHS+tE/seLvyeWHDw442GEdGqtCC11FvO0IsM3I?=
 =?us-ascii?Q?0slcgLNSLheEMhtYoMyiqnykI6k6BoUfi72UzOQKHE7ZudU7qN5Rk5jg6Hl2?=
 =?us-ascii?Q?kLAXKdsUICVjffB4tFGWKAEi7niZqQK7m7v0W09ZQ84W6qc3ObwQbNUv15Pe?=
 =?us-ascii?Q?j+NYQeh+HW9KgIicH6QhNAwYNewDwLG8Be+3JBzeRET6DRQby8deA/JqnZru?=
 =?us-ascii?Q?B8tAvCMDRmQa9vmO+oplbH+wHAuvagJwZw5cwECSM7k9njVb/ta8Depy5ukQ?=
 =?us-ascii?Q?ux44eK0WVobo+gzbMiHcqK/ZzoGPuBcGmVDSZ3dq1BD9qT5L1NBZ1VjZD8mV?=
 =?us-ascii?Q?acoRpuT4LiNY2OHJDxXuSp3UbcKWSnMQMl74q014Rc1+gxkqfQu5y6Hzilpa?=
 =?us-ascii?Q?kvnznRA8SSL0k8G30zL0oFltSWYKasB/DOhGS6lDiVQvBc0RIM42Qp0qnCAt?=
 =?us-ascii?Q?ubSjESbVikBOuwcHVG90KmEAtlebLTFyacr62ByEohAl4n/xTN1z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d887e9c8-b9e1-4683-89f0-08df12435a57
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 09:34:20.0755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6zMJbKCpNk0VPdWOSXSoKwkTXNX/5Z4HZ0+Mm/UWuJhZElA++Zk3TEuO11SQZGJKn7ZnXwFPCE+mvOnfBsd7g4JGbE18G1rsl+tH1iq0VFS06YzBmAXc3NKSZABFV7ic
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7614

From: Xu Yang <xu.yang_2@nxp.com>

Commit fa4d0a7cd036 ("usb: typec: tcpm: fix Discover Identity retry loop
on Control Message reject") advances vdm_discovery_state to
VDM_DISCOVERY_COMPLETE when a CMDT_RSP_NAK is received, but it does not
advance the state when a non-modal port returns PD_CTRL_NOT_SUPP.

This can re-arm another vdm_discovery_work if the port is going to
respond with PD_CTRL_NOT_SUPP to the partner.

  tcpm_pd_handle_msg(port, PD_MSG_CTRL_NOT_SUPP, NONE_AMS);
    tcpm_queue_message();
      mod_tcpm_delayed_work();
        tcpm_state_machine_work()
          tcpm_send_queued_message()  -> send PD_MSG_CTRL_NOT_SUPP
          run_state_machine()
            case SRC_READY:
            case SNK_READY:
              mod_vdm_discovery_delayed_work(port, 0);

If both the port and its partner do not support modal operation, they
will send DISCOVER_IDENTITY to each other infinitely.

Advance vdm_discovery_state to VDM_DISCOVERY_COMPLETE in this path as
well, mirroring the existing handling for the SVDM CMDT_RSP_NAK case.

Fixes: fa4d0a7cd036 ("usb: typec: tcpm: fix Discover Identity retry loop on Control Message reject")
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 2d6b14aa2085..cc9ea5d5e78a 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -3891,6 +3891,9 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 		case SRC_READY:
 		case SNK_READY:
 			if (port->vdm_state > VDM_STATE_READY) {
+				if (port->ams == DISCOVER_IDENTITY)
+					tcpm_update_vdm_discovery_state(port,
+									VDM_DISCOVERY_COMPLETE);
 				port->vdm_state = VDM_STATE_DONE;
 				if (tcpm_vdm_ams(port))
 					tcpm_ams_finish(port);
-- 
2.34.1

