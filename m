Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010020.outbound.protection.outlook.com [52.101.228.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBC146EF79
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791135707; cv=fail; b=fD5qdmUUCoVgKMQCIVwM5kNgYua0cfxzLEaE8Wjz82EZTj3ytLVBFy3rAzPkahDsn/uelIXGtYloeMTyHTSwx77BeDyzuxc12UnFnAGqLjot2n3y+Xl8+3YgW/Ln8VB/k4v06w1lg5ST9Yg0+C24X+Oz3ySzrhpyIIWq6mqpAkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791135707; c=relaxed/simple;
	bh=gZUkxITSYMFuXTpPSxsHiEE8jGm/6OCHRiL293SY2us=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=paVseM3m0JXCq7YSK0k0O3hF/880wmO9OA2ZoCYBVvTfXv5AvSO94CKNTsfTVIzQFOa5347SJdfEu0veipysNU5SJ2+SrrE/yN3XfEK/UOiDpmVbckPpGL7tnarL/2GDd1QKEdbRUZKsJaVxFHYBPfD0qfIXoVPdjIO1lzKC+6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Wug4IvpA; arc=fail smtp.client-ip=52.101.228.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Wug4IvpA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERvHFDYyCNXjuPGRNiymPrNjOtwVH3JzqZIS9N7uvE73U3wmWuvn2b8/FbvdH4UqnWSSphZwwZ+Xm9dbEwBYhjlch0ko2jWxd+BtreiN9Hxm2SAZKvRHn2JuCA/Yn5qi7IT/9XkwYMElPrXXOV9i5kVQazsFZo6eMHos55sInOq+AHJNnV8g/3kOnBmu27N1Vub5aiS+YmaStI7rYEKETvuJTrK2QhpEF55Z+iSPDeUGTxCawqwRG6ahQ8eRsi7LXF6hk/FPCbFLpRrl15W8/zfqghGjRIq3RAgSRzPmc0wLj7hiGbMLm+4eRD/Y6MAmGE/rgASiwHl1de5jJawnwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUcnfkVNAqr85OP0siufQPMfsjO8Z0v6VtXst7Ub0iA=;
 b=M8Dliq3/vCog1fA4GGoPmPMHGOClEsigtPOZsDvH8fd46Lp8rnKP5lMP4hGie8lKi4gZyib+gaeJS7gIzSdUvreNufXKAiilU7wZjF919kWnw6+fZzDjOWCPsdLTUX3bl8dy6qBeKa5mPkMWHyTb9jKmxruQleZxj1VmOMSuWgX20HZaAJvQPD2ZnFp7/QH8UbvYYgUC0dz2H2jqq2kQ1kHAXsDQIFp2bhYS0eSa4gQ8dWQRfE0f+K7uScKBdXgFMIHKjEq0COmnwZ0RWesYnQ9B3M+G5CI1V9HhaWsBWcBMoJw9W9jqnYhs3Yzx4B+n2NmcAvo5uhY9i48JvhTaHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUcnfkVNAqr85OP0siufQPMfsjO8Z0v6VtXst7Ub0iA=;
 b=Wug4IvpAclLKPAmNWfuSUVralO/NqTfCi/719HYMtp4wG2PuxX1ljeJyRMx+bwBKltCUQiPserURwf06vnQJWAFGHR1sw+KcR9ll17FjVoSHWwxJm2sXKmYpCoWzGtySZjOfnw4KbUTHA0sIcGgVBsEzvwSZOYtebrfn+GfVWMk=
Received: from OSTPR01CA0083.jpnprd01.prod.outlook.com (2603:1096:604:218::12)
 by TY6PR01MB17314.jpnprd01.prod.outlook.com (2603:1096:405:35a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 17:41:41 +0000
Received: from OS1PEPF0000D215.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:218:cafe::89) by OSTPR01CA0083.outlook.office365.com
 (2603:1096:604:218::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun, 4
 Oct 2026 17:41:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D215.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Sun, 4 Oct 2026 17:41:41 +0000
Received: from demon-pc (unknown [10.226.92.36])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 1CCE1300024E;
	Mon,  5 Oct 2026 02:41:39 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH v2 3/3] mfd: rz-mtu3: Enable runtime PM
Date: Sun,  4 Oct 2026 20:40:24 +0300
Message-ID: <20261004174024.502949-4-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261004174024.502949-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20261004174024.502949-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D215:EE_|TY6PR01MB17314:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6b0138bd-2dd4-4239-6d12-08df223ec02e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	xV8sTwL3n6u3doSx8vSm0f0aZHg9T/UYcUzA+fg8LksJh5w2UskU047Ges0Xqb6KYc3+ObnxkiyyRJVIGqJGrha5T68KXHLiywnlCvxfltstlPu3IjEMUcKRKc/qnFWpGG9Mk7dAFhWDOOYVjVhLDSdwMZShwun3dCipXRJTmrnVpZwgyBY7ZA66laRfX1W3G5gb+l8L7YnIYq++AARmRgeBvXePhpUXvyln5sys3k+a2Ze5erZTt+0ofRPtoLMFkv2RJL3I8d61KKivnO4xgikZAzmk0XIAGspO91teMU7+XVqXQu4ZmUQ+k0NU0OjnUNPSb8K7CfGQJaIhxVjDnFZymvmdW/vEQ1qwNt5m8haGg/P32eCRko7Zxp0LZYKKMu45mYFUX6t4DjZgnqleA0d0MwalML8uORxCrM3Pgr6Xc+3i+r5mo+KA/Beman/QFvDeM7jOdk0lKzUzwBbN1fXm3nIAY0X3TI95OBbFAIfSblsVcUTzT2TUok8wWwZk8gBgOQW732zO3GWtLyy9Typ85hhDl9j1jUvJqmKME1sLcIaweFl/zgffVNvxbGz1VIEp+OivE1evekP1MLtR/YxpxfBCh9jqTo1FNwmwkI3AGWBZHnOeCLGdAg5rqlBwOXn78ovD2qZFmXnfXCo3yLa7htImlMYRwAkJiAFGSb1eL2JaxlgPK2nMFKIS0VEZACAG20Q3zY+mo+yRajUNig==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZwqXVfIrfNEhhsCxvKMA/VtOxq7TKnDzh/QaFa04WRGEBDw9goRRqWd8yB/9GfWSYVZ6iKdvcT5BtB4Bddt7dIg1RDSLWl7sV4hTCHSvHIYvcaHY362xI0m5yzoms4nx9ttqVCmYdp/Datx82t3c5QLOZUpq8vAspar+BciaTzJf+AMwvDLo9IPpxwwvcQgWucSrLAe5W+LNLlkQAILIxGERNmD0z0La79Cw9M58F+fuuX5FCzWOR29A9v8xjm2wTnXbs1nKKDIHn4qhtp/+Xmwi875Q+B02Afs7D3f19gHVaBt3qJh8hlfq9D2aip/BZJsMKnPhISmU32fr3b7DR18U8KQa7y7nVY/0CakLUjOeTmpR0SpO4jyDpYpUW1qXq0l0qNdKZ6F2LaQhWue7uJ9pFo9oS5/USyitjz1jzb4aSRV328xb9ZjpeZy/2qEl
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 17:41:41.6843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0138bd-2dd4-4239-6d12-08df223ec02e
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D215.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6PR01MB17314

The MTU3 child devices use runtime PM, but the PM domain is attached to
the parent MFD device rather than to the individual child devices, and
the child devices open-code their own clock handling instead of using
the PM domain logic.

Enable runtime PM on the parent device so runtime PM usage by the child
devices can propagate to the parent.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V2:
 * capitalize subject after prefix

 drivers/mfd/rz-mtu3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
index 5be1f5a4167e..558ed3fbe520 100644
--- a/drivers/mfd/rz-mtu3.c
+++ b/drivers/mfd/rz-mtu3.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/rz-mtu3.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/spinlock.h>
 
@@ -290,6 +291,7 @@ static int rz_mtu3_probe(struct platform_device *pdev)
 	struct rz_mtu3 *ddata;
 	struct reset_control *rstc;
 	unsigned int i;
+	int ret;
 
 	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
 	if (!ddata)
@@ -321,6 +323,10 @@ static int rz_mtu3_probe(struct platform_device *pdev)
 		mutex_init(&ddata->channels[i].lock);
 	}
 
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	return devm_mfd_add_devices(dev, 0, rz_mtu3_devs,
 				    ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
 }
-- 
2.55.0
