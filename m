Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013071.outbound.protection.outlook.com [52.101.72.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B39B420898;
	Mon, 14 Sep 2026 09:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378517; cv=fail; b=pMxJ5eXUzi3bcZKS7iVYrVJPIDqIzSUt6zr2K5TgjHpOFauUY0BMAQkIrQTkGyavEvCK5YIfhrCBah19dpFRmQYQ57D67IxX/Th/4IuyFSIMlaPEeghvCxoIW/v9BT2Yc3FZyXocNZnTTxXEXwaDQEAxJUS4K7JNVwWsx5BsAR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378517; c=relaxed/simple;
	bh=7gsv32vvYz0hf0RCixPg0k/gl3/qmawT0y4DjrhPr2U=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=b3la0LnZeNsO+XEqG67hvL13ZW0OQLGSeVZMcvqRe8MA6cpsWu2Fw/FZytI7/rWC49pitQvxgO7UUXuQY+rqhDH6DcjaBBS7sts3qyyAim7fE1SHlv5bUevNMtQKVLg4EQGWkxrdNirt0p2UhqcRcm7ndA2n6pgoxkeieDr+caA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ba76Cpb8; arc=fail smtp.client-ip=52.101.72.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ba76Cpb8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2VLazOLAMhYd64JpBBbg3v3QDh0Q4BeBw2K7LNuuu8KbDrTFQ7Eoxvhbi9uTnDRltIOO0O7CnEAOAQpbslkoH7g6FRSwyTj6vPYk71CjyIg0qfUIsGzQqLi8aNggFQvkrj6z13tg08mHSQpsQm31ifGtXr4ZkVCCVP9OSF1jXTSh95/AuEhSl60/0MVKX26rgNVbfBJEcpFcHma7ByMylj0FMtjh5otkRRHGC7yzDKvVY9M5i6OTchDP3OzJvtWNc+I7/XNcnYRzF0FFJC7/A6OEiao/0QHsKdAHYOhMu7ZyK8j2McKX0u5PixFficlmpmlK+mjUyFWw3pUD6+8GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYqOWALvcN1ZJU2+EKulqgDGBMXeiQ8wuh/0wAgtaS4=;
 b=ga8gILPGAGAY2QrRCVNgsh4fSBdf7KfOcw2Qvc1G7QKWuEUODgmV8R0pSV6jJpWng8Gj0BV7Eb/qNRHMv5Lks+9WTut1LQQ6yECizZBp4a1nFyJmtUn9TZflYn4fz1KXQFGVXnnoVbkG+Z0CioTFYFrDa8/Bf1BnHxAgk/1MPP1Rsd7AdBvm71y3UF6a/LPSQCppqo7BWZ+C9YxAh37gMP/im9VLdhJZtdWK/bhUqckRQEkDX4T4w5AH4N545nhF34i1nn0teOg0+CcECxkfD35SKP2BsW+pJXS0tBXsZ2KCvpaNSpjGK0fFOZhuUkjrnCinbUoGTqDEW0yejonASA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYqOWALvcN1ZJU2+EKulqgDGBMXeiQ8wuh/0wAgtaS4=;
 b=ba76Cpb8rdYrV4cL9dV9wwsHUZF4ku638YEsgU7iOwAV0oVxa7n8r9EXs8kz0zNBPWEzscmwAvBKlcxeBaUaSa1fnU7PU7CXdfiKs0vnhHyP+ReoJ254gW7D0wbCTU1ENulcxBX1g9xDznL3sTU8xR7XZ0XWZhb8WJYLWixgWmiCI6B7Vwzd1MWCesIc4YeBf0+7vyGOxfc7NDOxRQiAuuw5ils2SA18svKNnyZRxh3TRG8p8TqqT14vkkmwFd6z/0BHVpGazLc/aJfTii51ia4ym9eioxs8sJx0FthlZHBjxZbESNi3MCCBqAw4aE3USJHC1igevSPYRllly4eqvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PA4PR04MB7614.eurprd04.prod.outlook.com (2603:10a6:102:ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 09:35:12 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 09:35:12 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: typec: pd: mark usb_power_delivery sysfs devices as PM not required
Date: Mon, 14 Sep 2026 17:39:23 +0800
Message-Id: <20260914093923.1910484-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0259.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::6) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PA4PR04MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b0d56c7-ac5d-4635-ce54-08df124379b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|6133799003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	txTsKbAqABea8NmQ0LIySOg4ZocNxWJl85JcT3l3tpqnPOMH/LpIF2Pw0AUi+0o5rQYEtJZvC//XCHkdQ8d8ClVQ/3PMDyTfj9Ke7+bFYc9GSdIZHsi6bUgbxiZHWxoBlAiW16odnIJ/z6Y7mU2xJXLQ5RYfeugri7E5YGk2nZ+0TeKy8rL+kPWO4oridfQ4UbYFf1pV4S9e+n6GB+2awSVDR7w/VV+6qp7SEi7VBmNsJIP/EBtlhrCUgiT4asB/tUinjfJIRqXlO5wRRtx2sroLQelvU8SJ98aLURl8vDLccf08v9TUvd4ZaVITC4i/eMtTU1aPKmACNgJjys+hDnvYKTbn8hJ1HEZGv0Fhv25zOQ+txCIETBX1ir6h6RImr/nKthFlW0VLIQTMcFstVWVkMaYN/H2Xy+RAHHbG3l+voqfJ7qpazbUWL1H1pQImzCg6Ouwkgkma7mpGpBXTuuLne3eFbrLgZ47UYcBrXZH/8XKXeltJ0ddYAeaGOx0CowJAUxC7FApxj9vZS4JQge6loSezH9N6+r76bCV6QGLSrcVuCBL7fK20qj1iWLjSJT3XIJHIcZPK4rnNbOURRwUetrCq700AYMWugnlxamQHoMxuOeHUaj6GyfWgZoc215xsIvz609cK73eDxsOVc8EEyOQ1cZzk/T9k81vhjc8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BaxtPPweSiuCvy2nb7qRHzxeYu8Klj/rBZNsSEDdupz8T6FnQSnoA6NRwr6R?=
 =?us-ascii?Q?sYaVaE569PwEQmirwFG8R4Ax+YprMc8OldGruHkYoTfQAsEZ7ES77QR7N4cS?=
 =?us-ascii?Q?IwzZ2BjivDjNgzciw3T3cXUEOfXTBHVCTFj1MaEoXuwIJWr65xeUa0iLUNHA?=
 =?us-ascii?Q?gqMEsCpC17K3jA492GgIHv68/BU2GRx9rtl06dNU2cqvB+GRTl0HXTwEE08f?=
 =?us-ascii?Q?v6iXz74IhCp1IgNQKfdMJHOn3jkDUySfbCLWkmpjrRbIqPvSYudGL4dPGjXf?=
 =?us-ascii?Q?NBfHZp1XEpOkDX+Oqa/YjPSiavLEUv5gQ5N2Aekcesxba79OL+i3DGKcXByF?=
 =?us-ascii?Q?lT/XJ9VvC7RYNpc3HmQvAF6QXOtH1zk3rxysnnZtpgja0D2SsDo8/IbhPKCW?=
 =?us-ascii?Q?cSke++wwUxNVqQsxe/2GkY/u2tfzgc/jTL033zYxuY4wytQN7Cmk5Z5vgEz6?=
 =?us-ascii?Q?iFN8F7Wv7y1dIOZ9S80AUo2zizj+X7sio7Onmc2Ya/mmpbUu/7fDj+QNC/eZ?=
 =?us-ascii?Q?Hb5MFbfFuGTDdNBYHhP2n+EF5QdU1QdBU7I6wwA0kcmPnm1BQItxZjkjZBhP?=
 =?us-ascii?Q?9FiXQPZF1J1hN08alf+e83aaBC9yKxnl/Co/efVKGHaTU+PEdyZu3YtVesh+?=
 =?us-ascii?Q?h5wMgPw62BBVm8O1S9jUUBNleTaCBBcBIJGqfGiSwOtPOTugkaSWoak4shfR?=
 =?us-ascii?Q?9I0iG+9mTfbCx9/BjHNwwT8CDNIDYON6PsXcEZi3EW4oQkjVNBcfNBqKzavj?=
 =?us-ascii?Q?RzuNWhc9jHkLnxhBMAamAQJcFb6qFjoACqad1hd1psx69nZeoETmGD9qYJLu?=
 =?us-ascii?Q?SmLaSu/EusYDOl+wb+juEQlZutWfztRJneAn3DJ8gT+mlyFqG7dzEqKnb7TJ?=
 =?us-ascii?Q?/0DLy11Ie31ypr9V9wlFJ3XX+3h+JVRlaQ2jUsoxzOOzfOtgSeqO4f+XHxWB?=
 =?us-ascii?Q?QhmE2LS/AAHvuQFmCoBL88P8rm6b1h30ZA5YW0gEL38YVnlEP+AsC7d53Y7Q?=
 =?us-ascii?Q?9jbrTFGmOObOd/WBrxoxcw20StywIRTHNItAXBRsia940+vjnOiQt+IGOLwi?=
 =?us-ascii?Q?DN5FYcC4fsmpa8bVT+OsPdwauWRI7t7bbxvTWNmHPfHdhXYhyaBRInuJtzuC?=
 =?us-ascii?Q?khuhdxamSAbY0DJhoRNOY0E5AWmEjxw2dki+svTpusv9ffzy0HH5i5ZI9HdS?=
 =?us-ascii?Q?OOdWJ0oQi33Zj3OEIF/Rxmkd0eFBhMhPxSBG3hmJx+f37TYGhmMt/AAMnKNU?=
 =?us-ascii?Q?bhA4iJn34OJRnoP3r1/sscoJR0ErON7SUj9PJ6kPiQtOLXtrUUzdcceTzT00?=
 =?us-ascii?Q?677wnbMq+9AA0GHZu8w5/bkClrUUnaqDhnVkQYWUn6g5V7GaEJoT1Mq4BSlo?=
 =?us-ascii?Q?RHpogbjVU7lGcYtuL7JftA6JVZGSiXqYvD5MZxXeAQRDpXp/zgoV2/+VirWW?=
 =?us-ascii?Q?RwOcQLl8NdqBiVhlHf9SUFaj1hgudoow0YpL2uqAcNcPgumgCCa4wZnzPMdv?=
 =?us-ascii?Q?sKGlaXrS48G9sxYfYOWo2oXhF6h0JCFpO5Km8mo+D2HzEn5GxMeDohPWC2ju?=
 =?us-ascii?Q?jJ7p137uUcPsENp56TjGu559ukOs7SKDdqPIGqJEnJCmLhL7UN4vmV3CqciB?=
 =?us-ascii?Q?hFcyNMH7f5b3i9BdvHgXy2M1WoKNK2Z7nd9Auhu+qDpuPD1GaWrGsksum/2h?=
 =?us-ascii?Q?cyVJ4fBgmAdFsFJB0675937v3jqK+dUr/Xd2Lkx+wJ8OpOCOBdu9+N40a3Zy?=
 =?us-ascii?Q?i51N34efJp2GHaxQ1wNjl3K1I1LKDxUGD9iKNf1Z/H6Maltw2wLR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0d56c7-ac5d-4635-ce54-08df124379b8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 09:35:12.7148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgYn3JefvbLtSBHwrJJ3fL/4v5RP2iBQzbq15VU4n1TrTn4ZWxkxW9uTlxyYZHOEC9/Vjkhq8P5rVkmHM2y5nJTJ66hlKYydEVyEAQK9/DwphbvEyyoFkx/pduC5kZMw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7614

From: Xu Yang <xu.yang_2@nxp.com>

The usb_power_delivery device tree (pd, capabilities, and pdo objects
created by usb_power_delivery_register()/_capabilities(), and add_pdo())
is a pure sysfs representation with no PM callbacks of its own.

TCPM's state machine runs in its own kthread and is not synchronized with
the system PM core's suspend/resume sequencing. A Type-C wakeup interrupt
can resume the system and let TCPM register a partner's source/sink
capabilities (and their PDOs) before the parent device's device_complete()
has cleared its power.is_prepared flag. When this happens, device_pm_add()
observes the parent's stale is_prepared state and prints a spurious:

  source-capabilities: PM: parent pd1 should not be sleeping

This is harmless but confusing. Mark all three device (pd, cap and pdo)
types with device_set_pm_not_required() so PM core will skip dpm_list
tracking for them entirely.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/pd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
index 766c76d63328..a200d1f50977 100644
--- a/drivers/usb/typec/pd.c
+++ b/drivers/usb/typec/pd.c
@@ -517,6 +517,7 @@ static int add_pdo(struct usb_power_delivery_capabilities *cap, u32 pdo, int pos
 	p->dev.parent = &cap->dev;
 	p->dev.type = type;
 	dev_set_name(&p->dev, "%u:%s", position + 1, name);
+	device_set_pm_not_required(&p->dev);
 
 	ret = device_register(&p->dev);
 	if (ret) {
@@ -579,6 +580,7 @@ usb_power_delivery_register_capabilities(struct usb_power_delivery *pd,
 	cap->dev.parent = &pd->dev;
 	cap->dev.type = &pd_capabilities_type;
 	dev_set_name(&cap->dev, "%s", cap_name[cap->role]);
+	device_set_pm_not_required(&cap->dev);
 
 	ret = device_register(&cap->dev);
 	if (ret) {
@@ -715,6 +717,7 @@ usb_power_delivery_register(struct device *parent, struct usb_power_delivery_des
 	pd->dev.type = &pd_type;
 	pd->dev.class = &pd_class;
 	dev_set_name(&pd->dev, "pd%d", pd->id);
+	device_set_pm_not_required(&pd->dev);
 
 	ret = device_register(&pd->dev);
 	if (ret) {
-- 
2.34.1

