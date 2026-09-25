Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FE84D598E;
	Fri, 25 Sep 2026 15:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350969; cv=fail; b=XYTU93/mtnpRpD04tO5TvAUj9D1DYKwduww6c8UOquxOUjDtdjioux905yIJtfYvzrfoSoKo8jAXgkNpDiEYgmpxfSilDGWXe059+t9FyaILJCcFVUJJYsKTB25hfNpczidXgg4CciWeIYt8YUnXavnrE01Fc0N1RvYRBKby9cc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350969; c=relaxed/simple;
	bh=YgQoLj8cuPEpc4DUAOJ6UYyK9cTIunYfoFIrYhuXu4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nUkrea3FIx6l6fZBeJH6Y93EDIcLvLtK0/aDJdEIgBA47iLnxxjMRvkHef5T9ivILo/7j1j42FXp0niVmO3ddekBeDxGP6yRBxiVd4mthqkGfaZyL9sQg2IOA/FlBGqFUz2EIG3q748XMDR7La8VeH3QOsbswgJR/6zQuLq5PGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jVvlcNpu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jJ3ngP5U; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jVvlcNpu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jJ3ngP5U"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDVnEq2786091;
	Fri, 25 Sep 2026 10:42:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Us8UyJDpFx+RsQS9yWFyS4aOnQ8yclwbN7WYmWQBqYE=; b=
	jVvlcNpuhUOjamKvfA3hUQONigq12IhKtloOpWbpwELctWN6lH8/GZzHxz+1H3Zw
	0A6e0mvridHLB36VKOQE1ryRU/Vt5SfRGO/EziEpWHzL6Zru/wq+F0YDaUyo8pmo
	d74kVaRzbYZBO5SIUDHFP0R/JL0S5Pn5Z5aXGclyFM6TNzbPHzay8kT1xeTmnro5
	pwPsEhkf4Bbpi9E8Nk2euUF1TB8xvRx9PvJfNgadUgPxCRCqWLKayzCo2HwU5gn+
	A3Lu72z0kqGZzeXV8R+NNS5Ua9H/bqYlC39Ero1ooqVKV0hCSGlOHMww7LRqsFk+
	e31KhpabJ8vuFjFs8mj6zw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020143.outbound.protection.outlook.com [52.101.85.143])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gw698hh4v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 10:42:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdiXW7UVLlRWGSCf6YBAwnrXvViM5Q6aoyXQjhh8/jL3w5bTh7pPoVLYL/vKLYpvn0pCH3I+FpqQlp6L2emKhr7kFRwQ4nd5xKvcFVzeIX0x7a7VbFz8Dhlczn6JlrI0FYcED4sqUansVO1lqtz5QuJf4nRBxqoSI/F0uOkwFj1ErpAxdzuuFi6ja5HSiLs3ib7sAejLdmu4q1IsB2oL/Y0nI9T4MmehDh9ebeoIbZ6Km9fJHX257mJgrgH/x+EO0PzWj6h8wYRosfGm8TGIWZsLrcnEM5t8XkTIZKGlmuI34ZAERf5ya58TX6mAx3rQDxi0zogQQJxkT/3ikA7PDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Us8UyJDpFx+RsQS9yWFyS4aOnQ8yclwbN7WYmWQBqYE=;
 b=j0XyT/AFupsLP7+qM9vFzp8IAqg+eboCk/GitcyFQ7ph2/cxBXWNfa2Q+4fURDGXLZgKaTNrCPhv7qhtl6WgtVGT7XGn+Lcg1WARHr5q7nMyDw97oJTtIkFY4sys/gsKKthdzDCFz6Ab+/z+e1ZahsYtT5IGzC7kMwGC1rsxYPtzMJHF5N+HOQCbrVUtRaODnsg34zYuY3NgZS2VCPUtxkBDlGgre6Z2sWmcWtMOsvyld4pIycJw3iqbydWPqWpD4wg8ddW4LBgUuOuzAKGq++Mi31Cqrtf1oHVh7KJEYUZEq0OOZ4T2aNiHykpZJ5SN6eVrrJVkCPsWmzKgOZ/R3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Us8UyJDpFx+RsQS9yWFyS4aOnQ8yclwbN7WYmWQBqYE=;
 b=jJ3ngP5UrTnrTMBZUKL+AHVFbu2WDssbnEX9NaMdd98ohMbOjjqzN+zy07OcTin7vit+7a5j7Kul9mvT08J8qUy4ePEn7d98R21AB9mqk71tVgweLQMLQgJTe06Q3le24ItYd5UmZ5ZzM1rFHRGLXcZ8IFRFHoinNAVL1STx/Ak=
Received: from SJ2PR07CA0003.namprd07.prod.outlook.com (2603:10b6:a03:505::26)
 by CH2PR19MB8974.namprd19.prod.outlook.com (2603:10b6:610:27c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 15:42:24 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::ab) by SJ2PR07CA0003.outlook.office365.com
 (2603:10b6:a03:505::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 15:42:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Fri, 25 Sep 2026 15:42:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B07B2406542;
	Fri, 25 Sep 2026 15:42:20 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8EFD182024C;
	Fri, 25 Sep 2026 15:42:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] soundwire: bus: Don't unassign dev_num before unregistering device
Date: Fri, 25 Sep 2026 16:42:14 +0100
Message-ID: <20260925154216.3520136-2-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|CH2PR19MB8974:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 57ab3865-f94b-4e74-03b0-08df1b1b9722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|61400799027|10067099003|56012099006|11063799006|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oTduXRU0mrX9GqfpdFGFYRt8wPO7wJBFUdicauezFMFAGDLlF2/eXKdwxUphdLLLTWBUXixM1ujKQj6XqS9MAdu5MGrjyo1nxK092EKqJQn1DQxAHwgmh+lBMDt4aI6EOXp4NMPdQs8MSb//HWAD2q2BJH8gFaFOsqiwL80h6ioybD6bV1DpCwYnMXT5qWRkGDT1YadxBpF7VWdRsVGTczesG5qp1L539XodEKthxa7jS2dNDTnVD1EN3FxQnqyzDyTs9qucVlwy7map4j+fOqOIfCcCHNLYYlRYKEAZW7SAJjfFUveWImyZC8OnHtmLOFpShT+g/NfLKEuBY01lnOcoljTcRkYq6YgSUM+W/vNnSpUxcMBYciDZGedCEEqR0mlIQiaFatDcFlAcKuzzPHaCK3mIaUciW9fIc0LvLNMw0+IkUxLuHboBprSrBzSXDADNFadXkdAQciP841HE5v+Vq4+pfRO0t+kaZ+GLcAE7HIMJ2FOzqKBv27JMLaZ2pGYqibaWOMXkWAlKOB/Il7scO9FAV7TDsWsEq6c09cYJs4FRsuEyw4lzLQoL9HXVX171OLLGMlfycJpsPQjWvWemNp8y1K7elzb5BM5PK+ZVIAUFmqoD6HtXO7opltHgxFoObtDp6erCaxzXGUaUx8d5wf8VNXSPU+As39zhQwdrOJ6h5YWJQN8WkOOM7v4eSEfkeJa5jCu06hXkRh9QuQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(61400799027)(10067099003)(56012099006)(11063799006)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CsMiligqBAP1YOICmWmj5mRepllQQmYEyZpYT/eB4Con9+Q/FvqSrevoPvsRf5bwYpim+93yfa/UYh0wOfdFF4i3SR+tr3Pta2PTJnQzVuCCOIOR0/SCLMnASwrzXnN3dk4bg1lk4m21Eu+uONazOf1swwRBaFhV/1fPOU3/JdGwdBipPfIwIFFTImMCNq71wDNqwtLRwA6uHvy3GrnGq8wfs24s8dMZmZgbfu5DArfAZphd3wHiB77IuIplmTnxi5Z5H9HMRxMeMM8+z8w7kDKf9Z+6S7LWrhsDJ8cMs9AjeAX+OFOBxnKlipTt3pobMvp/4iDX0tmq/tHjhuoO492LesmrdZbi0/roqDCC3qecjty+ms7r5O2q0imtOJH3OJsvGwsX+7gRRIzXY/bNBjIDiEpfOUIwUN3eWy1jpQobeGyOV43GPWV4DH7iz1CC
X-Exchange-RoutingPolicyChecked:
	cjjZ8zEP5bIe7+dInx6BBjtLtt+6J49RCO65QYnA8N1bjTduAtTmyW+2qJY3X2O8ea5XNBG1znqVhFpdWtSnUK8RBnKVulU3y9sEqcGOUiTiT+Dj0zIfVlQb+hTZiVFM6xcZBuXcCs+s7exvWOKFCxYwZnkIsxIlJCLm+3I8rXqeggQiuuuRIuFnV+jnQbdNJKJ9CJgb7N62dsIhMRcZSbs3pT9epSMFCHf5xz15YEahNla80G3m6omiZys7yUq/eYr9n2XkOb5EL3IepGJHBVNDt17RIVAf2Gb3dFeFki8GPDPRUt7DLo5uemtLelxclicK0vN0VisPkBye9LbpOQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 15:42:22.0358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ab3865-f94b-4e74-03b0-08df1b1b9722
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB8974
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MiBTYWx0ZWRfX0bCnH39dukld
 fFgoU2qfjnKUDgVFBFH15qQQwZ+PvzIDrI/kFNYJLruFZYBbgfv/tTqr/hF6blShpfcSIvnX7f6
 Swx1B0nsvtXUfGtXrldgFF8IFVR1luPhSQ65kkonbjGX795lvoAQWLg1zgTXURUunQyM2zkBpR5
 uuDuliie14FWqtK7fKV3hmy0RR7hq85uQXpQvFbduTx8r4PIbdOShVhqOcFYhVYJg8yMvp5rVKw
 tdoRt13oZD+gguG+3QcLtszCN7jj11CRCazwrVKxfmlA55InBKUB+2Wftm7ogq1VdlIDfisiOew
 +fb/XVspvLY3oBbtc70+AbG8nypNidOIsXgnlTPuJ6VwtxkZItpjDENIRzrOFWeGw9ZnfYXRCnZ
 hgCsJLsjK2gwVvD7UeYMAg3jyxkvBNutrUyMrrX76CJlR3MybCBVUaSmi6+GyUrNDZPOdD1AGht
 UmVihbwMl4d0LIiRGCA==
X-Proofpoint-GUID: lg43TfmIvXq_g9UTMDmW4Q_-_aEF_See
X-Authority-Analysis: v=2.4 cv=Zu94uN7G c=1 sm=1 tr=0 ts=6ab69667 cx=c_pps
 a=VFd5apzHAUrRjeJ3DCr5RQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=ezFADJHWrSB6daEUBt0A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MiBTYWx0ZWRfX71woJdzR5e0y
 GG3kZa0FknRT9FQgx/1j6SMav/kABeFhQDuZJErIlLUgF/ZWWcFKgGv8hzAr1aAMJzxjDQByM6J
 iGxCuGX3Ocw2/pm2KQbxwszXayZ22sU=
X-Proofpoint-ORIG-GUID: lg43TfmIvXq_g9UTMDmW4Q_-_aEF_See
X-Proofpoint-Spam-Reason: safe

Don't mark dev_num as unassigned until after the driver remove has
been called. The driver may want to communicate with the device
as part of the driver remove operation, so the dev_num should
remain assigned until that has completed. This requires moving from
device_unregister() to manually calling device_del() and device_put()
to ensure that the slave struct isn't freed too early.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Split device_unregister into device_del and put_device

 drivers/soundwire/bus.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index aeaae5a57c89d..1488b6540844c 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -175,8 +175,9 @@ static int sdw_delete_slave(struct device *dev, void *data)
 
 	sdw_slave_debugfs_exit(slave);
 
-	mutex_lock(&bus->bus_lock);
+	device_del(dev);
 
+	mutex_lock(&bus->bus_lock);
 	if (slave->dev_num) { /* clear dev_num if assigned */
 		clear_bit(slave->dev_num, bus->assigned);
 		if (bus->ops && bus->ops->put_device_num)
@@ -185,7 +186,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
 	list_del_init(&slave->node);
 	mutex_unlock(&bus->bus_lock);
 
-	device_unregister(dev);
+	put_device(dev);
+
 	return 0;
 }
 
-- 
2.47.3

