Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6F049B202;
	Fri, 11 Sep 2026 16:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143575; cv=fail; b=LqaylBAR8rjgIE8sRWhQAJvZGczGAPUNnEw0gOxTlekFk0O0TF+c/d49DLRbfwS9KFZDzPD+5cJix2hcNHeE+h2p1/XVq3fKSj9UnlMAN98PHy41OvxPMQXYNq3JHEAhMB6jhk9c32KbnifBUe7n7vQ+LXdJJJtTI1akvonUVOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143575; c=relaxed/simple;
	bh=3vo5sf5zizsXEeSiU1SKIJ6jDhEUSuVBlc6uAiRcrXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s2nDKlUe7fZ6Dq0nuIX9FatECC6nHO7Ki7e+W29LHzx/k/zR0uVLkMM1eyqsEeGFwR+lG8bthKTRKgsVUstNStbCw2ZBiecyPNpSpHDGj7eD50E6GskpsDR/ACMgFakTaysC1wSNeoPb94quOzQcyaGAeFZNA8wIZq6n3w6nt3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=CgWZLi8R; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FI3C0jsx; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CgWZLi8R";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FI3C0jsx"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BFNw2X3275254;
	Fri, 11 Sep 2026 11:19:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=0I3cxrv8S4SIlALWiFurV0AcLiLnvw9M25dFpR6RQQE=; b=
	CgWZLi8RKipiN3PYo9b+SN+gb6oynva2XFBxPXz6mnn317oR+s3M11/GEqmz3Obb
	D7Blyp/ITmof4aNt+5F5R76EIFwsQbqK15ok9CA8UAoPxFWt9jt+qnZ0pbFHOyz3
	rSu4g3q4gTiDsPmA47EuCKsOKL8/zhhUDIx7WODrBDd96wM9epc46ExjShZiWc+K
	lRL5aRxHPLnSMdAoeaSw00PWBDYgfkvQQA4xI7m/VXVxvZAMRYn4T027BjAhSR01
	BZNSMZasQZpWyTSSO8MOM2RVoLtLAg7/53EIX2p/d9tW60rbR0lZLUIpJchjcv35
	eQPQfgrSKNVXdKjubq/6zA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020091.outbound.protection.outlook.com [40.93.198.91])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gkcypb32k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 11:19:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rumf+upHMBvYtAoUMy6mzEHzooMDh+CFyRQO1WeN6PgYnMT0REbv5VkUNZCo4mYiRxDTtJl6X2rGS3r64FY7fuj3s3cpGUnRjFJfvDh8IMBNrD3PqxEd2oWJpEPqtqrL/jg1ZhsKHc3VVOzQ5KGUs2BewSFH6NNLdYHskW/0aqClJGj1mITJNuCUxyqt74ugi5+fPz6FuyEhdJwP27RJZp8P/fXLaK8+Xb+QymBU6GDCjiEo3htYOE43uen/UbLy58Tfod44ml4F1Kt75ALIIcbRd9zd60X59NK+5KyHz/LAP6mBIxRg4X7IktmtvjNliVienk5B22R611YvHae2Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0I3cxrv8S4SIlALWiFurV0AcLiLnvw9M25dFpR6RQQE=;
 b=OnAKQh9uKjTsrpZ15ZENZq2PtYWhxQSVxd3xJOJyQzsAXlkNvYvxUAp74Q73PONemBuYX5FEnsKzFV0+V3WaZPRQdqpYA0x6EKIvxtRa2rFMvHj7AZMSmVPAx8Dords1lERbmp2qJBn3c3byseEY6iJhBqOh38dqRERtu/mS6ITxcHOhhSbakV1MsE01RqD89j3VHHi7/myVaCB7X/rQ4d4UZYGLz7afPaPk5m6mY41Y60dIvldk9S/wfSkRvlqCTAilzDGsS5uauCT/8Gu+V/L+QtIJOT130Bok8zRA5w0ZTdmUTAKnYqQZ+IOlzGzKEhAQBV1f4nlgT8luo9Q05w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0I3cxrv8S4SIlALWiFurV0AcLiLnvw9M25dFpR6RQQE=;
 b=FI3C0jsx+sJTvupxfmshwlvnJWv/bVXMwk/fEKiVkKnuEOeVpJLtvv6RPRxYm+2lqgZ+UKssDK4a19u4o0kw6PLVuGlBTCAJNfA0IUK4iTZF4joLWblwCI3P0uRTI6hD3I2hGjvK9o6omqc7toa+Gz2SJA2R7Wszeer8W0zeiws=
Received: from MW4PR03CA0205.namprd03.prod.outlook.com (2603:10b6:303:b8::30)
 by DS0PR19MB772294.namprd19.prod.outlook.com (2603:10b6:8:3da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 16:19:11 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:303:b8:cafe::4a) by MW4PR03CA0205.outlook.office365.com
 (2603:10b6:303:b8::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Fri,
 11 Sep 2026 16:19:11 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Fri, 11 Sep 2026 16:19:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 17AEF406562;
	Fri, 11 Sep 2026 16:19:09 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F379A82024C;
	Fri, 11 Sep 2026 16:19:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] soundwire: intel_auxdevice: Don't disable IRQs before removing children
Date: Fri, 11 Sep 2026 17:19:03 +0100
Message-ID: <20260911161903.419814-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911161903.419814-1-ckeepax@opensource.cirrus.com>
References: <20260911161903.419814-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|DS0PR19MB772294:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: df0e81f1-eff4-4f26-a894-08df102069d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|61400799027|376014|22082099003|18002099003|16102099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	ZuhtHS7YzUaroeyNfLYFwRfCoNlL9kmhO2xnZczkNm7eUfwpRAQnCRg247faO5kFbxvQCEpMuz9XERtImGaI4omjAKdVn0hg5ZCCaWAV2LnDzOEci9dxgkpOz0LXwpP0glUj8AEjuZUlDJMk2RXkOaEO/j+3uAELmjrDaHMCfmUwI82d0/S2fAa2bMCM1E5JoaJ8jgHWm2Ga5DtV5SWRCpqiOIF3YQ93A3O+4oYRUHD/ed/uQi5S/snH8pfsi30WB1qoXQE5qbGKHZJPC/rgTRDNIF9tWFlwWRM4AQdA3wsAcs3IuwGusPqRcjmBa5dsfY+J/neu5gwQkdlrQS51PtA2tipkbotrfOGbAVTF3YLfGJXQFkocqNcvxOOo59wqOuNn/1ia1QXx7PEgTx5rAlsbfsrbYgd/J1Bb/XosUMcglS0+2biShmykZiJWBk232dfd4mkpueKQuRXDb1vC14NgVfzrWXuBnu/x+aSbIFrXK4DgEeldVabpQG7CPXMW576jTYme8YCegBWim5M/9PZQU4AxL1DHwpzhob+ugL8n4K/EvS5+I+4xjJNJvztEVpFUIdWwDSaHxU+5zg4pN92cyPpigged9SKoHYoZADhK3ohEXoAPbDaZFIrqtPoMQcN3AXwvys2GGnRNBc56DUGoanq+oO+EtH+DjTdE1YbGa2lwvRw6Puw0cQGaRhwrFcBSeEOj/ug95OllfLtgGw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(61400799027)(376014)(22082099003)(18002099003)(16102099003)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Nf1BWPRy3MrlnamWjzO03HtVnjKn+wVRgfnhwbu2jsmfoNQ3KxR7BOTroFk5rpPuxdMUvSHEuA47ymb+tv+4+lWLHj3e/8EtcMAyDid1asz3Trsh7LeDzSB6PE7Ie5o8XQG3vCbfKd5aY2FKdO9kmtqSBgX+5qbblQ2ABHfs2rfGg4YnJlalU1nrV9wTVIEV2RnntB+TazeougR3qDsuRpoNCFCM5BT2bgb0ThIVXr4f+6b9waOZFKn1arx8wMrETHbzInr4u4t0Yyh7UZR6mLOnanM2DiChgZVXfdqZVTt55MecXJPOJODRZS8piBcaEpA/wKn7dQIXZPlRWpdfFp5x/Tfg8+DLtHnTPrVvbWnYV66oQs8su3+LMB9G+ZQlE+/FtQveO5xc1/CzKqbMAWaFMOlVeLzqPfZ8iUBaYWRFrNQQtFocUSPtkQRiF8XL
X-Exchange-RoutingPolicyChecked:
	tUJj1XbBQ8o4OoaRQajEnHtylK2w8v8ICsD87o8PbfAtw/I1SBWRGB/lRqJuCWLhaFIdTJwING5IAvmInVftnWsFNXfMS50+hg/Kr2kdqWYncuq33VE5xpEHuphLQgKVPz6XFS86QqDqt8MCZVAy30UGjaa5iXe/Nugz+4jHVt2hOrMPnOg8mTnIyOAyn7H/qOU1VvH6TM5RWMqLUSoWpr/BRXcHp6mmErIarqtJ6MlssF/fPzx72fcjtOm73uNUymVy0AvVfA1bps4ShLY144vPE8yx2FXJ39TzHCdjrsFtzh2aIlDfDt4/B9oEVO0zgMjm0Bxm1rmnH3L+8vjw6A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 16:19:10.3796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df0e81f1-eff4-4f26-a894-08df102069d1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB772294
X-Authority-Analysis: v=2.4 cv=f9Xdl+yM c=1 sm=1 tr=0 ts=6aa42a02 cx=c_pps
 a=LgTXwy+OxRus0W5fFstXuQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=44R2R_4jCHrIqheVJbwA:9
X-Proofpoint-ORIG-GUID: 4te2vnadoiGAUHg9P-QwgE4Ve0R8VCmk
X-Proofpoint-GUID: 4te2vnadoiGAUHg9P-QwgE4Ve0R8VCmk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIyNyBTYWx0ZWRfXwS996Tyqeigb
 ezv8D6AWIFpdWAZCvEd4XyTRSIRkoOhRQviU9gJdimHJq6RTPxeElBOogZKURIuryiRaLDSeVG0
 SvT73w5C6fbsA+vyYKg/pua5k8t3isZHh6St9DdDPkex3y7imrSvANWFtFevv0S4RBEurdsRyCA
 llT+19DaPNT2LxoYbnRG5stOcoLNW18nd8kHP579YJzqZcNMUSob5xMml5A47iYmCmQAWY3QkI4
 iP5TJZhMaP2MRDXqk745nE27bcAikIBrqS1iWlsfv22ZXeK7Wx4vUVdmyRtrsMoa8reqg1xd5wG
 M+8RJj5sdLq4z1G+0EZnK3G3t/RvCweqxnvOPw6qrNJqKl2IBUmnVHKVvxZ26mTTys+4zw+mZI6
 /J22Gv2stN9yVfIEVL23qRbFw8WOlue1Q7j+vcN5woZiwNEWYIKA8IDM/SFZ+/C4/bPn+oGaYGa
 SN2E2lR1K4zpBNfvrxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIyNyBTYWx0ZWRfX0wg2KXHrC5Si
 TX9fkMjLhV5p+/ZyegoP6d3CLgM7jCj43TSPG2ZZ0vZ/JT4T+ayIyqaf5fwctrLjGT5K74pwWR5
 YSFWbZg1BH1wagkxsl973vIGnRYWnmI=
X-Proofpoint-Spam-Reason: safe

Currently the auxiliary device for the link disables IRQs before
it calls sdw_bus_master_delete(). This has the side effect that
none of the devices on the link can access their own registers
whilst their remove functions run, because the IRQs are required
for bus transactions to function.

It would appear the reason for the disabling of the IRQs is that
the IRQ handler iterates through a linked list of all the links,
once a link is removed the memory pointed at by this linked list
is freed, but not removed from the linked_list. Add a list_del()
for the linked list item, note whilst the list itself is contained
in the intel_init portion of the code, the list remove needs
to be attached to the auxiliary device for the link, since
that owns the memory that the list points at. Locking is also
required to ensure the IRQ handler runs either before or after
any additions/removals from the list.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/intel.h           |  1 +
 drivers/soundwire/intel_auxdevice.c |  5 ++++-
 drivers/soundwire/intel_init.c      | 16 ++++++++++++++++
 include/linux/soundwire/sdw_intel.h |  1 +
 4 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 7a2e7e73ad632..ec82ac8d54adb 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -47,6 +47,7 @@ struct sdw_intel_link_res {
 	u32 link_mask;
 	struct sdw_cdns *cdns;
 	struct list_head list;
+	struct mutex *link_lock; /* lock protecting list */
 	struct hdac_bus *hbus;
 };
 
diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 901a71262094f..1743793de2bd0 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -508,9 +508,12 @@ static void intel_link_remove(struct auxiliary_device *auxdev)
 	if (!bus->prop.hw_disabled) {
 		sdw_intel_debugfs_exit(sdw);
 		cancel_delayed_work_sync(&cdns->attach_dwork);
-		sdw_cdns_enable_interrupt(cdns, false);
 	}
+
 	sdw_bus_master_delete(bus);
+
+	if (!bus->prop.hw_disabled)
+		sdw_cdns_enable_interrupt(cdns, false);
 }
 
 int intel_link_process_wakeen_event(struct auxiliary_device *auxdev)
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index ad48d67fa9358..117c2e42b9bac 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -28,6 +28,15 @@ static void intel_link_dev_release(struct device *dev)
 	kfree(ldev);
 }
 
+static void intel_link_list_del(void *data)
+{
+	struct sdw_intel_link_res *link = data;
+
+	mutex_lock(link->link_lock);
+	list_del(&link->list);
+	mutex_unlock(link->link_lock);
+}
+
 /* alloc, init and add link devices */
 static struct sdw_intel_link_dev *intel_link_dev_register(struct sdw_intel_res *res,
 							  struct sdw_intel_ctx *ctx,
@@ -79,6 +88,7 @@ static struct sdw_intel_link_dev *intel_link_dev_register(struct sdw_intel_res *
 		link->shim_lock = res->eml_lock;
 		link->mic_privacy = res->mic_privacy;
 	}
+	link->link_lock = &ctx->link_lock;
 
 	link->ops = res->ops;
 	link->dev = res->dev;
@@ -145,8 +155,10 @@ irqreturn_t sdw_intel_thread(int irq, void *dev_id)
 	struct sdw_intel_ctx *ctx = dev_id;
 	struct sdw_intel_link_res *link;
 
+	mutex_lock(&ctx->link_lock);
 	list_for_each_entry(link, &ctx->link_list, list)
 		sdw_cdns_irq(irq, link->cdns);
+	mutex_unlock(&ctx->link_lock);
 
 	return IRQ_HANDLED;
 }
@@ -210,6 +222,7 @@ static struct sdw_intel_ctx
 	ctx->link_mask = res->link_mask;
 	ctx->handle = res->handle;
 	mutex_init(&ctx->shim_lock);
+	mutex_init(&ctx->link_lock);
 
 	link_mask = ctx->link_mask;
 
@@ -246,7 +259,10 @@ static struct sdw_intel_ctx
 			i++;
 			goto err;
 		}
+		mutex_lock(&ctx->link_lock);
 		list_add_tail(&link->list, &ctx->link_list);
+		mutex_unlock(&ctx->link_lock);
+		devm_add_action_or_reset(&ldev->auxdev.dev, intel_link_list_del, link);
 		bus = &link->cdns->bus;
 		/* Calculate number of slaves */
 		list_for_each(node, &bus->slaves)
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 9710f2dc04e29..7495d35ed2fc3 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -307,6 +307,7 @@ struct sdw_intel_ctx {
 	acpi_handle handle;
 	struct sdw_intel_link_dev **ldev;
 	struct list_head link_list;
+	struct mutex link_lock; /* lock protecting link_list */
 	struct mutex shim_lock; /* lock for access to shared SHIM registers */
 	u32 shim_mask;
 	u32 shim_base;
-- 
2.47.3

