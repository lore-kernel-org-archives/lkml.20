Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A324ADD97;
	Fri, 25 Sep 2026 15:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350971; cv=fail; b=UL6qGbfHCNOFYAM+zdnubB/50mE8Q0zRbOP3OEPF7ERybh2C+dhvCZSqiWTjhH1lbju5fYw2cEcwx8kbsEtdJTztb3LQcIYETy6Y1DpaHCR6tSUYtQgW+b3ImewaMGV1gefaZX6wDhMfcyJ1Hoiii4QZ/Umj6A2uf0eP1O1HZMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350971; c=relaxed/simple;
	bh=7RCLZXhIGVG6fsejh1Yc6T6vr4U8FmMjtitxJ292fNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vC4NA0C6VvwuFL2p59BnnRO9Z6VN9ub/GqGkp0DfhQihdrthYotB89Kd35Mvpwro95bUsKYN7LVa8CCa+NMUkS81Ob5wR+cY73m/lWILKoyT/Zohcov++R+FNw0v8l970beV1gqkkZwqmSYKmE282zoaOB9cpq5EAT6qAxvZ9ZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pe9JQaij; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ffPhl2On; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pe9JQaij";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ffPhl2On"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDVjvd2786040;
	Fri, 25 Sep 2026 10:42:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Wx8rbcK0F7gqJ+MRN0hkd1g30REHS8wF7+80I9wBpd4=; b=
	pe9JQaij6tZKqXWZdi/8KWzzY9u7CZvCQsBGaWnbRAZzFgAw/f8lCPG+auGWrXxo
	dk4E0otmVQhornq20jwlKiJv0A7IJaAo4ZsAR+PWeL7j/oM2n30EZ2w5c56TyBxo
	7uhmLec89+k1e+z21lh+d5uBpJu5NGvb/a7PlKWMXr80k3/r3ecChOEiiGXCHInI
	MPLG2huXAksro1PUiKX6fkp5bmH4v6bDKaW+LzDPYQY9VERj1YrpS290GDp6wcwN
	VWGqgWPagsD1wHBnYMb+j92nyqiFzOvcsyBFYsp5LrSDTvenRIYpojy0rnPR9ywQ
	nPb71dfM1FRR5mSho3sERA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021109.outbound.protection.outlook.com [40.93.194.109])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gw698hh4r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 10:42:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrKvjbVXVSICX46gJB7ByJxQMEnFpsU2mUO9N2ba9YU/7wyRMODDZh7KJYyNb/cCmTtIlZprz+C2Oz5lV89SPpkAmNcWYlSe0FGzZVbSLIzM3qH4jiDDjBqO25K0T/wjv6Ta1QDq1f0058SQm2CGKf7o2tttSw4Vy51zx3oV6dxC+YhtdkadlyiPrJjAhyzwLsKRSvQFj86iE3X30pjHcV1BoytCeCkoZmF34uopNeBo1OhaVn73sDJCxsr1I14N4xg5jH+klCaVIFnF8L13HTjCI+h7yaXNLdgfWPMgwvAZiXxdWq4JstWcM7dDV006uUS8fBgHvJbUtuVv7xN83Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wx8rbcK0F7gqJ+MRN0hkd1g30REHS8wF7+80I9wBpd4=;
 b=rsn5UQ/a7h1NcIA7Hnhot9x8By11n+HBXs3OOK5q1pSUxmV4r3SjiViZI0s8KAv+O/0tl1GbIg3yaskBElE8xy/qPLROQfApXo/TwSh4RcNvzAduJzLoIJ9dux3IRT9hNTMGIDlCpaMGsrrCG77KMRrBs/Fz91+b1wq2JPJU1WzVDj3uLcPZjtorLHRMqLc0Iho+KUWMUjUcEp+uCp7VMwjSr+2OpAw27rkGkjJ5QVYgdVWi7G60eX8bOS5j7ahO1ixCimsbQ4DlkxyPKsUBm1/t+0Sm2rrvtZzn83IQsZqzspAKb5u4J5od11jzjTZSGBsV1dlYHPWLR/zLpeOR8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wx8rbcK0F7gqJ+MRN0hkd1g30REHS8wF7+80I9wBpd4=;
 b=ffPhl2OnvFY1n+UjSYRDDgO1RPL35wGfnCz4xBUZSyZwyAcb1uqfJF4wPvnxG2Ss5z8WKaZ60uJwqjWjLpZqv2qecCvVym8kdTwNYXBO2n+ZknoQA3LoqX7K3BJqAND4EPuB/ipLOIWuI6cX0UOaTPLt+ns5PIwPXJSdbTLN7Y0=
Received: from BN9PR03CA0901.namprd03.prod.outlook.com (2603:10b6:408:107::6)
 by LV2PR19MB6126.namprd19.prod.outlook.com (2603:10b6:408:17d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 15:42:22 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:408:107:cafe::5e) by BN9PR03CA0901.outlook.office365.com
 (2603:10b6:408:107::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 15:42:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Fri, 25 Sep 2026 15:42:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BCF60406543;
	Fri, 25 Sep 2026 15:42:20 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 953D2822541;
	Fri, 25 Sep 2026 15:42:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] soundwire: intel_auxdevice: Don't disable IRQs before removing children
Date: Fri, 25 Sep 2026 16:42:16 +0100
Message-ID: <20260925154216.3520136-4-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|LV2PR19MB6126:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3cc792c4-f259-48fd-3a2b-08df1b1b96d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|376014|82310400026|36860700016|6133799003|10067099003|56012099006|16102099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	50V7Y5R+16l5RuwvOYxGBNsJE40PtTEgIJMWOUGc3O40fWKnfZKdxG4O2wRxSsyp530dOcsXe50Wvw901BX0RC4KuWzmeVYubo50RkUVkjmoJvLs+QUZoPi1cqMqPlgvrXo0Sj7DMKXJ1nHM7vuxnuN6neCNPmdimfeX7ueHEG0Ijhc34eJC64o9mAR3ug+skZ+JETb/ZcDewxoelqTBON9EsesbTk/oxo+E97aEFd76ffl/HfczXJaIN+QhJ7O+qsXuFPnYc8gXT+gGYIGrcUJ0WposeSHyLWmnjB5h4v/MRgOhmMIHG8IxPDIOoF2La0iBPomxCh5qxbP+ebxaVu4n3bIUiu3GeBzM6dTLabRS2Uesdo5ywG0mvsH/O+Lr5K+arECNT4i3i0NEkjQRC6/rG+LuK8uTd+YTLERnO2yB+H363a1BWFmeSo0d6ocP88CZpiw63mG8M75Lmz+lu6cL5535bGhgzaBF1MfayHLPY/XS9pnSlr8tJeTKkppODgrUJRHQ5HHLJEuEZ5jFnNIag6djmEcaxK0nBtZhv7ngNPj0aNS9uZCc8+mOX3JIGBu2mdf0tRkj3Wl/6w07uwWkLboNke9CVrrYtPrkgiajKi/f2pU2gPLRliqrYz/Ig2+EdE/50fCbJCzLs9APdsOssnMKqsF1/+mqk0GqTWcWyAeR6RfxXW1/bIZRjvZyRKx2KMF86xGmSkgYn6wKvg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(376014)(82310400026)(36860700016)(6133799003)(10067099003)(56012099006)(16102099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uXDJ9moRzUq3YcWLTxZanOAFspgBA/5LwxXYGU2HLtbUcMoXHnjd1E5EFDHKsN/otFZ8/L7WzFGlyPoeXLTpZJY9wLJSqXXT9A65UuW9A6X0Yu9uTfQu1+WQk5p5eZS1hMqH2PnGVOBwkG/BeS84OohLku7YhNY3yN+gO+ltRMouviHcq8gbd78BAJ5lDYn+cMhMiDMjNZgsmMJfjnafaFvn6fJpnQ4SpMhVVHrMI36UtOLYWxbEPwRRDXMV1nRC4VPW/K5n/aoQSFfzqmyqQL4tBXZ2kbuORjhttKZYX0qS0pfan+ntkbydePHt1GGuFRY3w9cE/SanT7h40EjU8nOLl7x5Faaf6d48CH2t0aD2IybRdVldY9Ixi3KA6MXNby1b/BO+uQl80T4Sp2nTXUjRMxOv7JDdtQj+wsp6k/VXZ4/UVqQzBTjkcBOGOtDG
X-Exchange-RoutingPolicyChecked:
	bWlS/jYkYOgPo81rKZIPyzWf17vKxB5jhJRXyLjSdPRDN3SlzpLLHYHVvZKmuOclWouMBkVDlysD0WRiF6Od3eu3+MM9WPkw+JhZyaFWmJmx+20akZaUbSxMTOdCt89R4Z34fpbtc8MB5em2yt1HJp23cyKSJ4lD4xgDBbguHt3IIiQWlEDQVqTYS9Z/QiX2w9nROy1H+y25yhxMLhIetvBxZQ/9tO4/lGtkIOLdDOLLq8uLXZnCEzoc7HzLBLuls8PqIWe6KrtlQyVUYODVj2+qG8FBdN10kZB6518qEuYfCMyt/5ruCgNrU5iQnbqfZBOzSGrJNPthrRyi2//JNQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 15:42:21.6314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc792c4-f259-48fd-3a2b-08df1b1b96d4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB6126
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MiBTYWx0ZWRfX4KyEYg/RMk9s
 b2TDnOWc0XWkiInLYTPfu9QKjBuJ2qhM9gUT9AScIkvqUo4Ul3mfE7qiwV6gwttUrdzcMr9Bz/k
 VbDTmGrdAMqHSVFicXNQ36sbdkvZUpnflL2Nqs05r7HsFCkd7NT5IGZXxb397ix7jvrl7OI5oas
 9B0wQKxytt1kO3xsF4mLWADt+TTStDI/U32ESg7uEi2N48rdGg1rb5DQsaCtvbfpnUxFr/MgHg5
 CAEnm1APVKPwB8o3lTYJkJdQ0Syf1HFziqmlER69G4t+Dr5DcOCltpCnYigi8x7Gv6AUYNrQwAq
 lRjfjs+5Oe0V4dBuA+TpvN7Ae6mWuT/U+qbsm/0aAOdKCZL2H5Uwby3glcUQcYvYikJLLy6W6KZ
 h3jgok+HA6jFjKqJ68YluTA1+CD57PgKFV7nM+/CVpWZIGA5mdyKSFnMvFVyOw7bcdWBMu4/Jco
 FMX6IBSPLbp1sH42k+g==
X-Proofpoint-GUID: B7BOUaOY6AR-ZMyHtgu2U2vmVgRKQrCC
X-Authority-Analysis: v=2.4 cv=Zu94uN7G c=1 sm=1 tr=0 ts=6ab69664 cx=c_pps
 a=mU+v3NmKB8T18PSzrq+lTA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=rGfVdOg06a76RMjW3RgA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MiBTYWx0ZWRfX2n+DfB1Wbdv8
 N227WQuboaPisnznn9W1JlCTSlxHgQ9UTojOWgeIwW8sGXHhxMe7fyMaHyAWjnS2SyO0XCRpDn+
 LDcORANQF5P1DEFuEprm8KkwPJo3hKE=
X-Proofpoint-ORIG-GUID: B7BOUaOY6AR-ZMyHtgu2U2vmVgRKQrCC
X-Proofpoint-Spam-Reason: safe

Currently the auxiliary device for the link disables IRQs before it
calls sdw_bus_master_delete(). This has the side effect that none
of the devices on the link can access their own registers whilst
their remove functions run, because the IRQs are required for bus
transactions to function.

There appear to be two things that currently block leaving the
IRQs enabled during peripheral removal. Firstly, the IRQ handler
iterates through a linked list of all the links, once a link is
removed the memory pointed at by this linked list is freed, but
not removed from the linked_list. Secondly, the potential that
an IRQ runs after the controller itself has been destroyed.

For the first problem add a list_del() for the linked list item,
note whilst the list itself is contained in the intel_init portion
of the code, the list remove needs to be attached to the auxiliary
device for the link, since that owns the memory that the list points
at. Locking is also required to ensure the IRQ handler runs either
before or after any additions/removals from the list. A new lock is
added for this, the shim_lock is used to gate access to the shared
registers so doesn't feel a super obvious fit for managing the list.

For the second problem utilise the newly added helper that allows
destroying the peripherals separately, allowing the auxiliary device
to disable IRQs before running its own cleanup.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Use new sdw_bus_slaves_delete() helper, which allows us to disable
   IRQs before destroying the master completely.

 drivers/soundwire/intel.h           |  1 +
 drivers/soundwire/intel_auxdevice.c |  7 ++++++-
 drivers/soundwire/intel_init.c      | 21 +++++++++++++++++++++
 include/linux/soundwire/sdw_intel.h |  1 +
 4 files changed, 29 insertions(+), 1 deletion(-)

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
index 901a71262094f..1439cef43462d 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -508,8 +508,13 @@ static void intel_link_remove(struct auxiliary_device *auxdev)
 	if (!bus->prop.hw_disabled) {
 		sdw_intel_debugfs_exit(sdw);
 		cancel_delayed_work_sync(&cdns->attach_dwork);
-		sdw_cdns_enable_interrupt(cdns, false);
 	}
+
+	sdw_bus_slaves_delete(bus);
+
+	if (!bus->prop.hw_disabled)
+		sdw_cdns_enable_interrupt(cdns, false);
+
 	sdw_bus_master_delete(bus);
 }
 
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index ad48d67fa9358..a7437cd420288 100644
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
@@ -165,6 +177,7 @@ static struct sdw_intel_ctx
 	u32 link_mask;
 	int num_slaves = 0;
 	int count;
+	int ret;
 	int i;
 
 	if (!res)
@@ -210,6 +223,7 @@ static struct sdw_intel_ctx
 	ctx->link_mask = res->link_mask;
 	ctx->handle = res->handle;
 	mutex_init(&ctx->shim_lock);
+	mutex_init(&ctx->link_lock);
 
 	link_mask = ctx->link_mask;
 
@@ -246,7 +260,14 @@ static struct sdw_intel_ctx
 			i++;
 			goto err;
 		}
+
+		mutex_lock(&ctx->link_lock);
 		list_add_tail(&link->list, &ctx->link_list);
+		mutex_unlock(&ctx->link_lock);
+		ret = devm_add_action_or_reset(&ldev->auxdev.dev, intel_link_list_del, link);
+		if (ret)
+			goto err;
+
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

