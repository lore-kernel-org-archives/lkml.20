Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2A24A7C8A;
	Fri, 25 Sep 2026 15:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350962; cv=fail; b=QmpVjMwYrM1nkBVj6INKCDuX5mXG1sqxm7gH4DjBf8wLNSF69YJr6cRPLsFKUXSgQtEdsdWXS5dsc1i++ehJIoxLGU0eqWqDDRSeBxuca2fjj+nIpYfixVcYOBMiBUPE7p0o1PIsvN1vy83S2LWN4oRSLn1fcFUIk1FW0cdJo1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350962; c=relaxed/simple;
	bh=83lrltfGE7i8iELm1PzkOKl35nPCmDGGOI5C9XLUboY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oTFWWrkblEdS3liovN6HofLC01BmdRyJW13uHCVOoB4rW6w5xQ56OxwueXzFsMjfBz932bitCLyQe7XA9OZNZzNcpOvHfUsOJw0koE2cj16Ux8DzDOLWOXmciyZU0ufck+KoEGpsIBFdg1rZS5o4qmDwYD1fQAbpRlA1rJW8rEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NBKvN7GS; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=GsJkM4dq; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NBKvN7GS";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="GsJkM4dq"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDVoPj2786131;
	Fri, 25 Sep 2026 10:42:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=H4hEX84y3jEiucfWHwoS6m0SdeYsxdoFXtQowXDJfKs=; b=
	NBKvN7GSX7MNk3wLZ/3YaPPPNCz46p57A1yyCXE6739+nOLS4Jnx249fgGOOBqDj
	owYBa3lgFnM3SvLvRKXqrhBjwyyBQ66kclKwcOO5m5gmGE2x2Ha04HTQE+bbyVAo
	tJziVEpb6VGhnxRkf0Tl0C4tn2TA8iV3a9dBnM4+5xL+OVbtKxUeJYwbe3CA+g75
	SyWfOSIvxYTT5AYzv3lvut2xEVfyhazZnnuGRpUO9zbdqG4h74BuJVAqxdIJhogA
	nQZ/Vjx7cvm/NTi/4c1poOMQR4tENMv5/m9g+K+8iBxDvgNOhHyCf1nTjnynIPnp
	s3DV80Eu+RrWIGnKqVRTng==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023088.outbound.protection.outlook.com [40.93.196.88])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gw698hh4q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 10:42:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5x+TXzitdo0HB4NDK4nCosYo6aOXpqzZXFHl9qBEI7N8cdNS345LqVAvcDRQ2OfhMEtJ0uTByKtYfrviRQ3HAsXgdAXr5fxDi1jQTo4gepPKAHCQX+w+bdeF342bm9dZvtumc9eeEYbZj3lsilvAyR8pOs2PCMAEqjXedujtLcNRQaJnHJGr4D03KTu9GthwtEw+aOl7qmaGOP0B/H0eTN/GGZmCeQcdD6963HRTdAHK3qWc5p2AE2NMhPVN3t5K9hFKGqQ9+/rYj8oUn8p0xWTqaNKasmdu/DOmABuEzbXPMbXj00fMgJnrmxal9swTXRFPfmOThfq3ORv5rA7jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4hEX84y3jEiucfWHwoS6m0SdeYsxdoFXtQowXDJfKs=;
 b=Z8O8mSlRb6jEYUk7iHUSYh43+ffQUJNM/N8Rw5b6uXxYl7wRSgrdQhWgTvRlvNbPQ1lmkkOOK0aHprT6GBBf6uN7McX7UcvPoMPvqGfwaOAl6oq+3hCxN94A7y0Fvdy/zhZb2DXNdF5shFok5Nt5MP+snJ2rRLGNyzxm4EWyc2zsW5XBGCuAo26XPjHPQWi8QftA8c552B91yqKohKkwnvsnLNDAbJJc8vBn5WjuOulukQh66x08kDItjIPwe26fxkEpjU9OFms+s1njwiDnrQxSYHXzT4MFrpo7y/PWoCJ6wRArfAnMZE/PQO6ha046T3mTyfBn++sEtwYYQZ1NKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4hEX84y3jEiucfWHwoS6m0SdeYsxdoFXtQowXDJfKs=;
 b=GsJkM4dqATj8Nxak0fL0z3UECSyr6AwqDtwiVO0Uz7ZOxXUK9Gw1IuVjrEWBkoufZUBzS3Ab85bhkD4Y89wLb20gYjYc6Lp58+2qhdNhSHwaKCgl22caxC7PeayqfYSvHJD8UajzYxWDIsm98ttcCwbRzfbo/eULa83bc5MjRPk=
Received: from CH0PR03CA0102.namprd03.prod.outlook.com (2603:10b6:610:cd::17)
 by PH9PR19MB755322.namprd19.prod.outlook.com (2603:10b6:510:3f4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 15:42:23 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:610:cd:cafe::1f) by CH0PR03CA0102.outlook.office365.com
 (2603:10b6:610:cd::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.19 via Frontend Transport; Fri,
 25 Sep 2026 15:42:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Fri, 25 Sep 2026 15:42:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B06BD406541;
	Fri, 25 Sep 2026 15:42:20 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9275982026C;
	Fri, 25 Sep 2026 15:42:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] soundwire: bus: Expose a helper to remove devices from the bus
Date: Fri, 25 Sep 2026 16:42:15 +0100
Message-ID: <20260925154216.3520136-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260925154216.3520136-1-ckeepax@opensource.cirrus.com>
References: <20260925154216.3520136-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|PH9PR19MB755322:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d6d8d840-eea2-45c9-f647-08df1b1b96ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|30052699003|61400799027|23010399003|376014|36860700016|10067099003|56012099006|11063799006|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	4jAdbrAjnF7hCa6Iyo9vxT2eVY0QT2TZYBeLTKm3zgPXo2BrUOKwZesgTIui35BqwZ4RY7Hf4uYn8o4uFTzbaXfj+gYDy8FqVCNiOgEuAkPRPlep67YDoEShjRG7gjoHvnizy7lMln55cqKCMNzo9K3cZW5Uzg0Z/lyaX6TTt3T29a9JW9Um5guNdiA2nqY3z9jkcfojoZEKagcrqHJz+QyH4LA3oFTmrkGxu+fmZWwncPSKkyOobNItdAaomNR4Dqe3ZxCNPQgImjNTBA6vSqz28bq+HdJ7DW7r00azLqukAYeQ80abBixRHl9B6BNX+6y1pjFqB8hUTckMffmXnp4qmiYgKlJl+UfhodCEGZBFRSt4fSMlDNPC5pc9CZ1m7flmZrCQRAY3ohMjvKRaO77F1I19FSRpZhg61aCmGALXZfkUtrqq5+ZFE9UZysII1n35l6DtYdH/uLYT8Krs3bDaZKJJJfLHHIMcVJx4Ij74zHisQp72QRACxw6lHj+eQDAVnELMt27C/OCojQVfGCmFNgiCr7ES18vtJzLUYLdWE58zzBizPKcp4oleaYsdD53QpC108MRzSnPJV8EiNxQnjvAXzZLjPQGmPCjsfbNnkPURy5AohPijcKQZefJhL+WJ6fxMynyToh5Rkhg3RCZ7hXCG+fdmVO6kez1uXxlmq86CXfvtJwwoTUr1vn6SvxyROq6PYVFTFFXo0oHBaA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(30052699003)(61400799027)(23010399003)(376014)(36860700016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gv40t5eNyhS6Fz8gkfkbncbsbCPZHRluVqXgjA5syLiUxt37wJzy/M9clZRPOnzwnzmdrQj3C9hZdhQe7voo5opcpNoQQF9N+m5ZxshuZyoiUQV+P2LO/uCLK8dUf19sGTmvqD4VQq+G47eldApp9n3Onw1KjIra3slREdlW7ELD4hrfEU1U4j2tRnupp9bolSr/2lBm97cD+2+hFELxzFyKd0KDts9BWSijy9vNXHKGJ39sbIQRiDAqjTthgqZlptLbkcsmretejO2yFwmkKSkBUx8nGSgebRQioejYhCYFT2830xCXADdnHg1eaJgTKmYNl2R/IJUU9YMsEWQ1ZnmYludJbqCohR6+RYuXWkS0mW6mpGDxvT2tkLjHC190InnmPEV3Q5oP4Q8hu9yiEzMxciND001NLrOL6erLEa0jJxK74KAGXuaqlZtW+zGC
X-Exchange-RoutingPolicyChecked:
	dcEdvFME+s9OigxtrptL0GiCeRVLttijHP3t2/lAb8vP8MykBbSha5KuBoYkXRxFv/QKC/dFKXZz0TPZEnyoj9oQtzouK6ExMBnz4wiG32sH1TfcxhwvkokBALFCTtWcfZ3HUUO6Tg3AjuVcqi2drDHZsdfCL4m+hTnyoUSU5FzlxbKKjaKhysS+B8FUD7rhbQytXZJ1JCMS3ZIYemyAOEPmywN2YRIgQfSuL0ujkZwGwJyWjamfORec4TF3N6yCMft3Pjcc5PNPgsRVOgPKU7YZG8SKWuMHYJ0nttssa+pVwNOwGJcU0PBD/fnS86sX9FG7MZvHgPVv+5Ru9uBnGw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 15:42:21.5980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d8d840-eea2-45c9-f647-08df1b1b96ce
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR19MB755322
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MiBTYWx0ZWRfX3soBt7Vnwky8
 kd6Le9Nauev/VNiey2v2v5Gv80yYeHokOPbyS1thh/Biwm2VZsWLU9+bk9ZqJUEzFN63fnMT+W+
 wOp7j1MOPwzX1CjTRnDU9cY8uVKAZUJXWfTwb9Qd6NdPjY3UEarwChoZ/EVxU6+a0q7Ij/S/H5Q
 21cSMRN/Lrrwfw53kl+IeJ/6GWyJTOZsBmsOrKU5nxbjaz84MULoA+h7gZiKuq03UmUkM+iS5SO
 eO+Pv7NsiikUHeCzK+gNJ7uncdopqXOEKkNq9uN4Hu05MJ7oPHVRh5VnQZBmyqry0H4bsPWQNVS
 232QFeXh+5SO+Ikk7S/RopiRpqRQWdPkjHNuSXioLLkA1VKtDqv/8p9M7ghtU5D0cV+TlZ3embu
 +zhf8vb+EXK4Ii0vOllP8kjO1BFzQkA9d7UPjJkixV6T/RrLdKw+XDW0d8mW0YnpJkVIWr9A+F0
 Vvc+6vcyhliaOqspSpw==
X-Proofpoint-GUID: Rs0WmVm45mxWrhCwx85riRX7Utuypfkq
X-Authority-Analysis: v=2.4 cv=Zu94uN7G c=1 sm=1 tr=0 ts=6ab69663 cx=c_pps
 a=baSawIpcEEtupL8iW46Hvg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=gQeVhbwXa6W6SovQ:21 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=1N7ZiyxPLO-s3Sfvc6UA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MiBTYWx0ZWRfX5HbUJNKdfg/I
 h63g+1nMp+jiJWLTaOnWrIg1xwI9zJ27eX+ne3FzoNEIARRqMR9atg77rHgNIPrNlfEgawce78b
 QQKeAbwvS180AtI/9blBrhCKv+JMyFo=
X-Proofpoint-ORIG-GUID: Rs0WmVm45mxWrhCwx85riRX7Utuypfkq
X-Proofpoint-Spam-Reason: safe

Some SoundWire controllers may have features such as IRQs that are
needed to support peripheral operation, it is desirable to continue
to support these whilst peripheral drivers are removed. However,
the current sdw_bus_master_delete() monolithically removes the
peripherals and destroys the controller giving no chance for the
controller driver to perform clean up after the slaves are removed,
but before it is itself destroyed.

Split out a separate helper function that only removes the
peripherals, this will allow drivers that require this to sequence
things appropriately. The functionality of the current helper is
left as is, if the peripherals have already been removed the call
to do this is a no-op which allows drivers that don't need this
functionality to remain untouched.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1.

 drivers/soundwire/bus.c       | 43 +++++++++++++++++++++++++----------
 include/linux/soundwire/sdw.h |  1 +
 2 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 1488b6540844c..4c4e69a58fbef 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -169,7 +169,6 @@ EXPORT_SYMBOL(sdw_bus_master_add);
 static int sdw_delete_slave(struct device *dev, void *data)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
-	struct sdw_bus *bus = slave->bus;
 
 	pm_runtime_disable(dev);
 
@@ -177,18 +176,37 @@ static int sdw_delete_slave(struct device *dev, void *data)
 
 	device_del(dev);
 
-	mutex_lock(&bus->bus_lock);
-	if (slave->dev_num) { /* clear dev_num if assigned */
-		clear_bit(slave->dev_num, bus->assigned);
-		if (bus->ops && bus->ops->put_device_num)
-			bus->ops->put_device_num(bus, slave);
-	}
-	list_del_init(&slave->node);
-	mutex_unlock(&bus->bus_lock);
+	return 0;
+}
 
-	put_device(dev);
+/**
+ * sdw_bus_slaves_delete() - delete all peripherals on a bus
+ * @bus: bus with peripherals to be deleted
+ *
+ * Delete the child devices.
+ */
+void sdw_bus_slaves_delete(struct sdw_bus *bus)
+{
+	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
+}
+EXPORT_SYMBOL(sdw_bus_slaves_delete);
 
-	return 0;
+static void sdw_bus_slaves_put(struct sdw_bus *bus)
+{
+	struct sdw_slave *slave, *tmp;
+
+	list_for_each_entry_safe(slave, tmp, &bus->slaves, node) {
+		mutex_lock(&bus->bus_lock);
+		if (slave->dev_num) { /* clear dev_num if assigned */
+			clear_bit(slave->dev_num, bus->assigned);
+			if (bus->ops && bus->ops->put_device_num)
+				bus->ops->put_device_num(bus, slave);
+		}
+		list_del_init(&slave->node);
+		mutex_unlock(&bus->bus_lock);
+
+		put_device(&slave->dev);
+	}
 }
 
 /**
@@ -199,7 +217,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
  */
 void sdw_bus_master_delete(struct sdw_bus *bus)
 {
-	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
+	sdw_bus_slaves_delete(bus);
+	sdw_bus_slaves_put(bus);
 
 	sdw_irq_delete(bus);
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index f710e5932b4b2..df9ee56493b17 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -899,6 +899,7 @@ struct sdw_master_ops {
 
 int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 		       struct fwnode_handle *fwnode);
+void sdw_bus_slaves_delete(struct sdw_bus *bus);
 void sdw_bus_master_delete(struct sdw_bus *bus);
 
 void sdw_show_ping_status(struct sdw_bus *bus, bool sync_delay);
-- 
2.47.3

