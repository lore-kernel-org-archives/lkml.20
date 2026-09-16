Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013055.outbound.protection.outlook.com [52.101.83.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D238F2D1907;
	Wed, 16 Sep 2026 04:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789533359; cv=fail; b=p8eWj7vqZLyPCog/ZscslDhgRpaH+ZuCmPnXcbdJe3zNlv1+DkuWn4kYlHeRoO5sD9qkkRnutm6mEAMYTajmMr7vV4xOFgPgSy+v5jdJ5y5/rFPAQWBUwGJh0dzyvR7QHUjE64AK+qDMRqUISVs1ybBdKoHM3XEVxSTTw6zoo/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789533359; c=relaxed/simple;
	bh=JW0xeAhuFsdaTdsoN1X6yq/wLoj6fCWs0Xpp47BuAAg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=cyL3o8oivoPnggZO9Dm90zlL4yQeolxOndjyqo8BwGvGZwtjGhMe+3L47Y32jrg9/bwDAZt2A2Gtke6ITm9r3dmayiKVOTLtHUwYlYZlJjSstJ3Dt/Kfea9damVnxUQxX5cDs8/WKNuxoBml++yhQ0Ztj3dgxJUQoqiN1hZTOCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=B7H2pLME; arc=fail smtp.client-ip=52.101.83.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="B7H2pLME"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFBWXLxb+fc3kAxXFh+leWqvZ6KFeR47n6eno9Pxer9SfEcxaOL0Y1LjNpJ+kWOkXkFAxgtMyLSTvLIM7fQizgHlis+G1tY97DhRqSwa2zc+14+dHQP4aLZeFWCaArBUHhDVsYL2Dx/0rsmY1d8ScoshUT5Rntu7fEXAPEtnycPcxVNXq3dxqO45GbLRI09JnCG6e6PXfFA0QHhll8MKVi/+XIHexhBC59RupFmMkPmIWcNi5jilaRoDvyqphN7lBbkIR9t1OXXcAG2E0uanfJ88Z1CTTlGGQFBd+tav8J1YEZ8Ti2xYk8CbUT3PGPQXUj11/dr9lVlPMQnsXmmjfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5I1SMbQ75rz2/ByMonlZGKUBj31CjQfF2opikRjdENQ=;
 b=joHxAE85t9GYQOudFooSXgH26oVAxKTZnFh+Z/nnMK7H5xOCNo9ZGSIVQsYV93iuE6uJAerP1Hvl3eHTPwm2Wdl2M0Khy128Cl4FIvS1gGdsEENhJIbIGvXOZK6KYFFKyzsz+HbuC+v3ZnGZlHdvRRL4rjkJZQc7MbXv5d/e02qrbmGzgNFqkIglvtmjEVNvVBxGsJyMVz5m98H1CCMtQtI/h/fxesFfmZsTC9FsNIcRjOGHHEXkAVVekChxk4SFaXleXXZWE4stIy6z0Djr62oiwEkqpGGK5VmWrfEls1HxH0JPp70IxJfL9edMuwAZ3sBFM1jsUixKNDLxAPxluA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5I1SMbQ75rz2/ByMonlZGKUBj31CjQfF2opikRjdENQ=;
 b=B7H2pLMEtdnkTcriMPPYnck4NOLoI75pDnhEg6VHu/wmbOMFi0jjwplz/xB6IKNBAHWWDbgwyPoGuUCbfdM/IZtE8prU2HNy7OKip5A6nEhCZ2k2QtKb/AgOABKXW2uZnJyG9ESZo6nM6UV9XgLSJkG/crdqe6RjKvoTh57m/ph8X8KIVFkuiEAeAsZHkVBfg61QLGRev1y74gekh3Ccl/FtMqjF7diZ+k8Cyls01idmLPH7f8LY/cQIypvhll8WsnSUeBxGzYzMYD9cjWGY/wErICyw63ae2nO5JbWw9vSAuOP5bjZBB8dWuc/k7oU5jEQoggBknqVk1YsXheb2NQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by DB9PR04MB9450.eurprd04.prod.outlook.com (2603:10a6:10:369::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 04:35:54 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 04:35:53 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: badhri@google.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2] usb: typec: tcpm: advance vdm_discovery_state on Discover Identity Not_Supported
Date: Wed, 16 Sep 2026 12:39:57 +0800
Message-Id: <20260916043957.3362995-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0038.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::7)
 To PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|DB9PR04MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: 899f687c-7c99-4582-4a23-08df13abfe10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|19092799006|18002099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	7clE5eH0eKVcrY49F+HRcrpKNDMBXoE0HHiqAsAmqyun6qm6puBYAQ918N5npwpEWLFmt5xTJNWl53ALqh2zpS1J1LgGMw1T0Vp5IzJilFKVsJthPTD7kS1CDcML9QUX82/etz6wLCK2zC1IJCGiL4Z0OKdj5SNWsBe+NR2fjDG/sFXiDqbw93qYqDqkY+UpKUdMZbMeTn1SMUY0aNID3r8Z0nQtoiRfqGayu4EWk017Ms7QnwJCbwb3xSqXjqB8Ki1LGRbhiit3q6b7OpzpCIE2bQf9uOe71C4j8wR5DmwCZnX5ze8gKACxX71Vd1elWXLCAYjFyGJ5bIIi4EOWNzTwO/YWzwHUlMewBO/5CYaMJ7R8gA46bhSn2BIQrj7KGy2JpitaNSp+Tqyx3H2YZH1qhhQzYoXxzuPQep5amQmZj16MsG1sNmZTUdB8iDt4y0CBCt+yEe7UEQuDEcNY5+QeoQF0nzFUgqS9S3pfBlt5XcZsnOIKFFD0p1LDPFpU1M/Pvmubd1pqr6ivdetD9JkRhHsaF7cCUVSz1kmsuqUO7AYkXUN4taJkHLCVR9IWF2dy6RcCYLzdefFsFtCvsCmDmsoIOO3dCpkXB1EGrkdt8fMWRWWYDJ942ByBW3VuH6LG2fV2+kNyhG1MeRTNzq/4Wxlxp36VXZlH6kac5iw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(19092799006)(18002099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MuwaP1fDazieRCkrEJwr1oRppaqZbGcGR6H8E+uYFw02QAUTUkHPKbk2i67R?=
 =?us-ascii?Q?qCtuDN0FrAsifC5iRmNhji9eCq3kDDfTYuZdXDyPnpjyMuGfFFSxvDFuhbWi?=
 =?us-ascii?Q?0UITy26QSD8/DSgiuXOvxXdfr3sBsExsuPQhOYdR3Gdn5tAW3DkynXPRyHe1?=
 =?us-ascii?Q?QvuEXeUcGQa0fBUHSCc5gpvyKuvQFcARQU7EAilN64WtP5jKPwb/IOQuvq9b?=
 =?us-ascii?Q?HL1UZMBwZ0B+zCzMApTTRLGy+GER69cNd+LHYKHRfFcRpphp1hs46N+Guh/c?=
 =?us-ascii?Q?pk5mhYNsVRDtYsKTYspSyZ4gZFpbNewAYm+vBoq4gcZaoagVROC7HyUcLIQI?=
 =?us-ascii?Q?0IxDmRp85CHrXn8TxznCpf1kZA+dvlmuCIU0n328kxVG5hUhdqxjrW+9xUbq?=
 =?us-ascii?Q?B9GNo5b0UIPmHou5h0t2O51/MFG0Rqdr9WGp3vTYzzDZvu2aISJyi2TYQy94?=
 =?us-ascii?Q?IsJfRg86JXaChonQxfNfAgbIK43nlQyKfNerHZs45YWcapwSBqW3BmD++pLj?=
 =?us-ascii?Q?liL8j/ECru8pfcE+vAtPXJuEomqTJ+87R3SQdermMUU8Cnx00JLq2tiwaCJE?=
 =?us-ascii?Q?wCxgNth/zI+DIl/OYh9f+0i+wDWAaXZZKAK+5ukiZVqTxuFPQMg40E8dCKpJ?=
 =?us-ascii?Q?a2IyP/QuUtYralgCbhdMx6CKJaXX7ID6dpdMOo2JphgxQ0KPedG9OQmbAYPJ?=
 =?us-ascii?Q?PYAZ7h3iUz/075nAuaJTZ8LCRtjHNUmdMhTWnQM2APh9juS/wOGd3h9XeQWa?=
 =?us-ascii?Q?HQaXUoT9GU5wNfw2tkC1WVM/Tq82dKcjzsVS/tZUr22ahctI3ykhLuXq8S1J?=
 =?us-ascii?Q?hGI9+zfmImP1WymsnLzLtJUuGpm2y3z5K15ltH8FhX2VfUE2nn3HxTYJQFFT?=
 =?us-ascii?Q?+MDkkjCmIDqA+vJRDUBMDDwqV6U7XiDR9Umo0G0KbhWmLyuM9ltalD5GWrMl?=
 =?us-ascii?Q?AuvB/mAopDsB2kiixyee3SLlksbzE8OmlABiVBeNwJfpvDd0ppcKbNAbasOJ?=
 =?us-ascii?Q?uwhkOdXG6Fsbwcjt1T9ZgK/I2/IZRn4Y8Y0ZkZN0Ye4nAP3FrbWKI5FG5LJ5?=
 =?us-ascii?Q?08dewC+LXtvyAlNXZkc5abGvgGxJ2MOGRnaCbqDSFasEeqWy0P7WdQwpgzRE?=
 =?us-ascii?Q?wyw6+HjxHqrXTzw2HBHVGlaaqysQ6cOckV8lOJsTJCf8LtArIrDnZnodwaBy?=
 =?us-ascii?Q?CQ69ljUbYLwZ5krokS4AOg4deUG6EFjFORKoA996Lo7RwJbYdmg7XvD4HmW9?=
 =?us-ascii?Q?VYQAS2zFcHQtdWlWvlwMMdyJuUKHJwny8m7laAd+mSAAXpcvG19EbfbvwZYf?=
 =?us-ascii?Q?bt9VrSU1zcAVAp4/j+VzOlZQGEuNpC7fkMqdTUyjBg4UF1sohDzI+5vZsiOT?=
 =?us-ascii?Q?Dr8W3cSnwsd2K0JZr50NuUHhPBr6kI5V5iyU44AbaDfn3FnFvwNJ21RqknRW?=
 =?us-ascii?Q?hj6QK3CvDznZ9KnPgkjZFJEegLCLlhzCpu+kPq5Qd/xE7ruB42XpDQcyRPf6?=
 =?us-ascii?Q?34WBqzf6FlkWcCBKMulsoyKIq2wfPpf9QJ3unrLdn5bJNuhVHx3ThPRC+dqC?=
 =?us-ascii?Q?YC3WBx7FqujF7U7Y+vfYxzK0eXqM2zgTbGkw+8vmORI1q3H+ovfxq4jvSd0u?=
 =?us-ascii?Q?R2vZgj7GE1UubVC9qD0kWgIfC/hy/l86FvloljOzJV+AT43H+LR8S35oYu7B?=
 =?us-ascii?Q?tMwa0BM3CV0GLQ1hiaWJbxRbidAD4NoWAX8hKeBYqwYSsGU7ziBDRGzOUOCp?=
 =?us-ascii?Q?75206zXlO8hX01drYSx2qtG3dC4l3QFoTscnHEXpL64NcnKqqT33?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 899f687c-7c99-4582-4a23-08df13abfe10
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 04:35:53.7686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6AXRtt3Fv+Kt2kJ9zo5cR46dc0Sci6s+5UyF3gIO2udOojUYUiIOjbtsCygSPEl04E3ZPbBxK+AnddREGhRxuoa1bUTEtsYvEd99o2GIVXICBwSwr0fbsPtY+35AHGsn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9450

From: Xu Yang <xu.yang_2@nxp.com>

Commit Fixes: 205dc9cb39f5 ("usb: typec: tcpm: implement retry mechanism
for Discover Identity VDMs") advances vdm_discovery_state to
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
well. In particular, update the state to VDM_DISCOVERY_COMPLETE if it comes
from the port partner, and to VDM_DISCOVERY_CABLE_IDENT if it comes from a
cable.

Fixes: 205dc9cb39f5 ("usb: typec: tcpm: implement retry mechanism for Discover Identity VDMs")
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - cover a cable returns PD_CTRL_NOT_SUPP case reported by sashiko
 - kick off vdm_discovery work to continue working
 - correct previous wrong fix commit id
---
 drivers/usb/typec/tcpm/tcpm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 2d6b14aa2085..5cea820e00c4 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -3891,6 +3891,16 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 		case SRC_READY:
 		case SNK_READY:
 			if (port->vdm_state > VDM_STATE_READY) {
+				if (port->ams == DISCOVER_IDENTITY) {
+					if (rx_sop_type == TCPC_TX_SOP) {
+						tcpm_update_vdm_discovery_state(port,
+								VDM_DISCOVERY_COMPLETE);
+					} else if (rx_sop_type == TCPC_TX_SOP_PRIME) {
+						tcpm_update_vdm_discovery_state(port,
+								VDM_DISCOVERY_CABLE_IDENT);
+						mod_vdm_discovery_delayed_work(port, 0);
+					}
+				}
 				port->vdm_state = VDM_STATE_DONE;
 				if (tcpm_vdm_ams(port))
 					tcpm_ams_finish(port);
-- 
2.34.1

