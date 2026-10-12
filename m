Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7AB2DECA3;
	Mon, 12 Oct 2026 10:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802570; cv=fail; b=Z54nW4NrZDOrb/Mb3Wpn862GWJstp5ZETVW3OuNDCMTUpv/qNSzdwi84+KhN3HxUWr0BhLb27/fGfehnuAc1m7ixIlwZdC9qianZkn7BoJJ+i3gMI7sEt32WkNrYECQhGlLdyHvlljA7z9j+4UbMVyN7y8ylN3AldZPH2wTr1zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802570; c=relaxed/simple;
	bh=n/TWzSqT1zRAU1NeuUt7QZtXDOpD4E4+rs2eSkIcPjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N1YwZHYPKKlVi+TmfljXMuV8BhfgnkkEBpJDmSkBmXg9HyAUwnAMZ08CDAliVz1ubkraIn4pLALJP6GbDC+/UE/rQlnC9oQPf+JgYhS/76/kaGrti6JC5GKyzsXqj1PE1SrEdAQLX9/Kasqp9/prIqDhwthK43cAiaHwtS6jEJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SE1JohDB; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=zaRezzaS; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SE1JohDB";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="zaRezzaS"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CAoSpn4187390;
	Mon, 12 Oct 2026 05:55:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=2KzpJdZlFEO2KxxfaJzhPvHtbh33KL2o/V23i4SNqmk=; b=
	SE1JohDBiDwNoA1Yz10Aw9bRaFCw0QRAKPbGn7HO0sMDhZv/BJgjanPwgUiHaenf
	TbCmJvH1nU7oa6q4uoMCdwv0SVXpMXEAzwKAwRQKpdvKjD8wdqmD8RE19FEWNf74
	gtHGMTZ4kN1ypQlri/5+H4yERDbuuXYuDMISm7RVq9NrMxJSd0m7UfpLSduOaCwn
	VNxkFz2ilwTdJ8omvM1qL6neZF9rIQGE+xWQoD4wOcwAW7f4J1GvT6d6hYDGoA0J
	HeOBYy3hBmjfm0RjfB4+M14NHEyCSUbGDS82DSFSQFKXbqvvgrhq2yHmVkqLDPLL
	nCnYdcWIZWcLSFDk1UO+SA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020139.outbound.protection.outlook.com [52.101.201.139])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4h7jrxa131-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 05:55:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yB8OphCWG5Ef4oKXc1hL2dyxInBOmysOoYSLi3DH8czmw2w9Yxh3w1eG6+QcNpwq3N4d135u/yJJmGARK0IQ6lQ9CBVkQQbbBq8lqLFy0XMvn59cENuO2hSROnIdgvfIfr61HFjOkeI+jTgAEpNNIq8Vem6BPZtOu1hUy9dqnOPipngp38A/pHfENu+rZFkd3RMCl6hTCD3y2fnCHWXjUtwXZLErWWvTUU91LIf+9lXLpql9kHZZpD8g1WOEnnIf88/BfJNSAIQEDIZCeXwkshYWJIPiQkLKV6SifZtSVlsoFwcmirhKYwPGwKwqdk+VWDwtRZ1EGQYQzaNClL+pPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KzpJdZlFEO2KxxfaJzhPvHtbh33KL2o/V23i4SNqmk=;
 b=FjOJgEPEX21HeaPrPAXoHPJ66x7xwB/yY4f7Vpd2m0NRzXf0Zi0yRr8eufo/SY9G6uDmKM1u1AIe8hrs0MPpbfQkJ8h+aCYASBeqhHYDSfLbt04HBEB1I62KP3NhIBSlPqQeUn3MH8nN06JgttDWEDMdSSVy8uhSHxEcSxb1kDZbC0mJFG3HuyYHjlOdnkCTJbGeJz7UPY/dTqyk/hjlmIHBRjMvV2ac46db0OVDX0PHisdS2KAQMPu2JBPW1k8oGx2IsYsmUBkOTrbCKCl0No2prdkX7Vb6UlFLZaoUM34Y402ONOV+llD+pZgD6kBmoE5N+KTlyvZPEtiKkZ79Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KzpJdZlFEO2KxxfaJzhPvHtbh33KL2o/V23i4SNqmk=;
 b=zaRezzaSXxpDtQwtcUQtkFHRRUA43ocqD8HvCClgjXyNft4X+SZajQvA4UKVvX2Fk/WiM8H2VJWuR2PNjhnuwgIXkNzJsSM41VfrF3ujZfjUIWGKimbLwluzw1hLSdz/igFypiUU8TfQ0wlMJmr9C3VaJP9cj81MSRnxR6egiKI=
Received: from BN0PR04CA0128.namprd04.prod.outlook.com (2603:10b6:408:ed::13)
 by MN0PR19MB5778.namprd19.prod.outlook.com (2603:10b6:208:376::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 10:55:45 +0000
Received: from BN3PEPF00022BCB.namprd03.prod.outlook.com
 (2603:10b6:408:ed:cafe::42) by BN0PR04CA0128.outlook.office365.com
 (2603:10b6:408:ed::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 10:55:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF00022BCB.mail.protection.outlook.com (10.167.248.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Mon, 12 Oct 2026 10:55:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1B87040654A;
	Mon, 12 Oct 2026 10:55:44 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0073082026C;
	Mon, 12 Oct 2026 10:55:43 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] soundwire: bus: Don't unassign dev_num before unregistering device
Date: Mon, 12 Oct 2026 11:55:38 +0100
Message-ID: <20261012105540.1686405-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012105540.1686405-1-ckeepax@opensource.cirrus.com>
References: <20261012105540.1686405-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCB:EE_|MN0PR19MB5778:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c34761d6-828a-4ec4-be31-08df284f5e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700016|23010399003|11063799006|56012099006|18002099003|22082099003|16102099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	PLuj3A4aNYwGZE2J0IER0AagAJPeIhiW1eJ5szfiCnyVEJBr5a/I0mCtFoxS1eS055/uY4MIhRFDjKPyyAziqqLjQcNFUrgpoCYAC+3AdGe8PPWGfpxNtBTyJ5XZo2l9394uE+6ajiqQ7kjCpmv0QTMIaRkVP8MwZXiWeeKEmNnHncRf74ikdzWieFOhqQS/kFAiVXL+Byh2rSKp2ng8/5u1hNbr/EVE4dThoPgRv9/nrYcMJj+oEjEff2EVaxE9BwxAJLAur+QAFrpGu+IYqOmSGgFoeJ8aSl3mzlr/P3VjQpXgPjWr/uMNMmho4nSnDcnRskB5JxByRGD5f/yX4zKb6VFWq7FBIcu9PwXpXN7PqeU04IXmML0jVihmLSU9hpZLthbSBkcr+uMyQdK89qd9LN1VR0zaDETsq2DHUBI2HE48BOe/DmQZWsqAzwi4B0WL4Pr0zFsOVVJRxIbCT4Vu5ViZ1cBBMLxHqoavW4N4Df376/Y390XkMVQ7u7luOGPHa52LHaR6pc+AnjBVAFODvm/9RaOPvz/AiAvpbxnfzkUab553sNwer2GBzRTq4CBtqpG7VSIewdfv2u8jOOol4rioQmdr3+hjbmUvItNzjPzPnbkKmrKucPSxtmRblrRS/XSvJTOdWPPVOapNGHYAwPc8ywVGWUfheBuma2RJUmhtnAOKJjs6pnpToDjf1BaZ73Kxg3ps+glUSnn55w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700016)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(16102099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dEp20UwcSvg56mqHrW8TmT2HS4ADlPAZeEBeBF08sP6v1sxS2xdoDtOIQ670xSVewwXObcQI/Id9/dSmpZa9reycCy8noVGteQGcOk0JL4OlgaiGuPLD+2jNG+4iBWrDoxzhmxfwykpoS4jfivh4cxGx2NfawCc4kZVd0eq3IKB0Pmg1u1mBPX4Yb8dvoVa8FYK1spgAMJD2N7mex1k9hG4YMvjup/2BpIh9fPk7kNj0jv4cjPxORy1sWoPDpftt8iPXFKA8LNBTCHx/HkXmFUctWTL9MNGpmZBFJNSfCU9Vs/ao4BBrzErmUftojRK3HP612GTmOfLc1bgJ+sr9q7VlmmLqAPbl8yffeApFExLrrBedsuyyW8CbLnB2wv1YH+/U/94AZexcUeEDstOzKSn/cutNzmfEqYM8XEQ0bpZseSRFxA+H5LHcofsjD04M
X-Exchange-RoutingPolicyChecked:
	M2kZm314kyicbl3QGmzPlQuWi/KSXJkhgEf89ac6QeuE1uoG9MXi05+BdihHdFFrVfBemTE1SU5ub15nD5+I1dOEU+SdkBprYZQnuOcjfhncvuiqFg/AywpFEj50ZLSp0sWIzAzN44NENRBaWcqODYjySR9HNcVI+DmNwTHHgKS6XJLZPMg5xnVFTXWyNcb8agcNCy6yFSNBsn692/Hf2J4/JjMaob0VP7Au6cUR96j13P5EA3HdfI1LK8/2RMlPPVoiIliX/qvDJyyBIg8q+32T2fUGU8M6zUiigXYXQ27xGMMGWvzh/X1gGMLRXqOHrQmRh8zEDBdUGAAUZmD/zw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 10:55:45.2929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c34761d6-828a-4ec4-be31-08df284f5e08
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BCB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB5778
X-Authority-Analysis: v=2.4 cv=A/n5rKWG c=1 sm=1 tr=0 ts=6accbcb4 cx=c_pps
 a=m5u7UkoT2y3MSdrnBkr6Vg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=gYybnV_sw2No2sUOuNwA:9
X-Proofpoint-GUID: bUUuyP5oSC2QHQAJdwY6RKt8XayEeTZs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MyBTYWx0ZWRfXyxhTrgVC9GW/
 +bs89CWfSDZ8s+9xtxTxry2iuYwBqw9l4sYlStWv9f504O/cZdxrtEVMUxP1GpCRPlzgIRUOEsh
 5USd3tgLtccdcFbTrHoQCZvgdbznnM0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MyBTYWx0ZWRfXzJTen7hKiG5p
 FGf5foZN1McUf/Ns6ISqiMUdxythW3eJf6qvnPdJFd0MeeE6+i/46E5XZa8RTpU4xG5WJQrL/q6
 A+iwSVa6jU148COV5nqdeN6NrBkCT5LUiklCkqGzpEx5Q+UgTH9K6gVErZraDzXt3suNcTFIBQk
 awsn7mDIYdu3jszjAnALBzjaaZb7KBPWek1Xa0v6HbB8MBDYJrx8sJH0gRMkS3OD6fWQtwrioBv
 ISRMN19eU7ZhSpUg2Be/OMwvIi7Hzo26KU8779R0/qSIWLJtM33qTjcY6xRZyNEHMzIa2h7fK3Q
 5RwnS5TtZJ4C7jcoR+lRRcrt5kZ3aauvUgQaFF0zTYqViQen0u5UrRAD2yu1qBeizt4mPpXlJMm
 GxwTDxkfGveT1VR3pmWYxAZOdbk3AQJUCZRwUtRLWvS8jFxfAoHwug1/mYjAPEoEoseP77Wk66+
 +5zGrnXChSLZdjGyNAA==
X-Proofpoint-ORIG-GUID: bUUuyP5oSC2QHQAJdwY6RKt8XayEeTZs
X-Proofpoint-Spam-Reason: safe

Don't mark dev_num as unassigned until after the driver remove has
been called. The driver may want to communicate with the device
as part of the driver remove operation, so the dev_num should
remain assigned until that has completed. This requires moving from
device_unregister() to manually calling device_del() and device_put()
to ensure that the slave struct isn't freed too early.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Added comment to explain splitting of device_unregister()

 drivers/soundwire/bus.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index aeaae5a57c89d..eddff9a5fd35d 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -175,8 +175,18 @@ static int sdw_delete_slave(struct device *dev, void *data)
 
 	sdw_slave_debugfs_exit(slave);
 
-	mutex_lock(&bus->bus_lock);
+	/*
+	 * Split device_unregister(), the framework level needs to access
+	 * members of the slave structure after the slave driver has been
+	 * removed, thus the device_put() needs to be delayed. The device
+	 * number needs to be marked as unused and the slave needs to be
+	 * removed from the slave list. These can't be done before the
+	 * drivers remove callback as the remove callback should still
+	 * be able to communicate with the device.
+	 */
+	device_del(dev);
 
+	mutex_lock(&bus->bus_lock);
 	if (slave->dev_num) { /* clear dev_num if assigned */
 		clear_bit(slave->dev_num, bus->assigned);
 		if (bus->ops && bus->ops->put_device_num)
@@ -185,7 +195,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
 	list_del_init(&slave->node);
 	mutex_unlock(&bus->bus_lock);
 
-	device_unregister(dev);
+	put_device(dev);
+
 	return 0;
 }
 
-- 
2.47.3

