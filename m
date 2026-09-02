Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D9338757C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372540; cv=none; b=D0r2cZaNEmphVWFJhX0dry4CgCxtBtqKRxQYYiNvKVqFXw6MR3mlp83umFtEI7GNxQi5BVSxop5EZHxEbfHh0KqVNIhrxigVcYRXrnKOiCcvUD7LSYkmMU9jsJhN2rJxr7c6Zx/vYSi0mAQ2zdlD7XK04B/hF8KZ6CxCtxFiRLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372540; c=relaxed/simple;
	bh=vs/zkZkBqDGWIJOv/e2m5e2aVz+VFWJKG1MOOWJTS0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jhwai5tFRgdSFbbsvSqm4f55P1t4wHI5hIoPNHX+Z642wKn0/nz8tdZWmlS6s+v3utrqoIUtobA+Cf2tZknFIAjuigMG0mzgfkvz9yJifb0Du7/dflsOyk/X4I6K9JCkLgvfxhirpWijzxrsPOYHkFtDt6+cqEvmDsMslVyUUxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DxS6P7SL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Md8bIJIy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxS6P7SL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Md8bIJIy"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqvMq2104770
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 18:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bbORKfBAEcY
	HO2qsqE2iCDgdtjeThGNyWZmtJvMyYf4=; b=DxS6P7SLUnmuzeNOqzF+4g/zJxu
	Ce2GUi0lzlVVbLVCYigkJKHMuQZCRp411lPCy3f8HAp4JJ7J74PFJfi5NjXp9peI
	Ryus9hn6rdlRnFw+PdD7Rj7AhOFxeXKLxxpExLLzmdjzoWjz9XHQ66UNquuTn6H/
	1TrFa94LmcwyCA6MDaT9uHssmcMH1IUYYOQk4zU8ZLLmAOe/PpUS8l1UciAcNcer
	I0nMGjUHGfkbk4hxBgKikY2O2uXoRezFF1Iyxpd/3iAEnFAiSICxf0rlswxNkquT
	84rUO5n6Awh4naqesajSsDeG0EpfCHZYzIDCqG1IaIevEX8GGxNNnb/9VUw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdrxu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 18:08:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939665a1ae6so206735985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788372537; x=1788977337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbORKfBAEcYHO2qsqE2iCDgdtjeThGNyWZmtJvMyYf4=;
        b=Md8bIJIyTQuh7aNdFiIvfKXCnZrLtop7r0kkLMY23/EtXlER/8EYMSb+8amEm4IYhA
         kW5AhXx5LH7yKdLbkbjQZrn7r7z1QjS8szMthDFRJ1Z/MJxRVmLeDjEHM47GFigWQ/o6
         AewZjc+4Okv8KD5u7XMtwxJj31rxgO0o/L15GqJfLSDdfPWtuQ1BNH9vmOZMYgNIeSqg
         0RhUhbD53bAQhY0IBJ/YDxts+5x9gduV37iSQabBBCKVPvnqv4WSCydMnf6i/w98O9md
         a7ljYGpVKeruo0ABK4pT5MqeBFqZcENGpTvpBMuRANXw05aKLysJDYAd5hiNLT4gmVjI
         Duww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788372537; x=1788977337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbORKfBAEcYHO2qsqE2iCDgdtjeThGNyWZmtJvMyYf4=;
        b=pPcb7MbY8G8deg1rresQMaZmuYys9fpifbpd9ztt9Jf7CIRK9PHoOl5Cgdlv52poTs
         KjM6KVw5DHcNbrwCrE7ypcfRhAJrQBde/Nm5GgysDq+2Dk46xyynZn5bUGCdSrafDXzA
         20OnIkiS7lW+3x/beRk4tGHT9lZSpQoYyOqfa7wBYqKR5O2xEHSldBnNN5crKbwfCwJG
         9pfONWLqzbYo6nlWefoN+Xnl2pnPpXN0wTxL2l/cwRpRpQwBPRLw+mWsG8K3dyPmlUKi
         zNJSjc0B88G9hID9nTvQO0G2lM5Si+775jt58Gk6Ezy53ny2lVa4euCaXHiBgOVUIHaD
         mr8A==
X-Forwarded-Encrypted: i=1; AKwUvBx4oJTavZJ4tMAps32EMdEGX+xmblQlfAkCjlSitPPXyOh8GlUxhEYZfJu9dlda9zLlC/ds/TN7BMhDr/Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nDDCcufQdvLZKo3lEic5q1HpcotD4HR2ryV8FhMdAf8514FgVP
	cKEmqz2QjioXE78r4vHYXA13elE0bXTC5IXF7WNg9Rb9n3jsjeCWhiDhUoQQJIpV7rePiCA3FEx
	eI5iRCfB3TGG60seuGp9I0wokeYMvX9KX6sbDYBnCWXTO/PwbXPe/dbqBFOYChS+3Vjg=
X-Gm-Gg: AYBFou2xNlj3JE86HoPtwm5hBBocsv3uj3d9BLplMmmfVjsxeuMnuKX6xa1JjiZbnkM
	Nsrwt05i/pOyA0RhHA6Hvasr1HHhKLaxaaT0eB1uIdl+f2us9c4Mcgtun7tb+vjtUmt/kyeLTql
	fk3b/7tM88dvteG02O+4hnuL4l84g0bc+KaDlwlHSDpIUzPBs9G+4tp/KxbQQWJOu1x4tFLPnpp
	3bZV8XZ53gpiyViBjHrocdbhDBzjw2vZC8+lDu+z6JBJZL4o9aYjh6e0owKW42PbAmlXiECKmCi
	URdiQj7XP3H6v9UGIEwAM4FIXvJoj7Pat9boj5sMQ09YEm8RNFPdb/TFPC38h9yBs9zaOCfplnS
	1qFRYp1WfgnzSBzUsAiJIZZu1jIMaFUTroo89CrYbYJcXUjtAxvWI+O0fkotxaC2YiKAttUuveE
	a/mosoOoRFHU4TgzA=
X-Received: by 2002:a05:620a:28c7:b0:932:ddff:1241 with SMTP id af79cd13be357-93960efc6d7mr820782185a.26.1788372536497;
        Wed, 02 Sep 2026 11:08:56 -0700 (PDT)
X-Received: by 2002:a05:620a:28c7:b0:932:ddff:1241 with SMTP id af79cd13be357-93960efc6d7mr820774185a.26.1788372535857;
        Wed, 02 Sep 2026 11:08:55 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895d68sm1444041a12.4.2026.09.02.11.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:08:54 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] firmware: arm_scmi: Always create devices for standard protocols
Date: Wed,  2 Sep 2026 20:08:44 +0200
Message-ID: <20260902180844.41230-4-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902180844.41230-1-johannes.goede@oss.qualcomm.com>
References: <20260902180844.41230-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a986639 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=9VS019lR99HtUmLVNGAA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 6ij0Tir41dt9EEaMni2E1mhJWiFQ9e91
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE2MCBTYWx0ZWRfX5U2dXgiscEjj
 hSsoxiZWpboytOh/ShN0JWnQTkMvpf61tgED9WezJs7yh9pMZ8wcfKBtFZTBjz7kDFgPiarfAwX
 aCg7g5CYGCRMWU8b/z137yqVtUBkNuCKcwMm7V5SU9kK9C/6UoqmbWBg61XtUInbvYt1b1xJByu
 Yo+MM7rsKH60AiML3yXhCpoZxyF9mubiKj9T+XWiUGfKDPSSsR83jLsMH44P7gxgETXbeVVnzV5
 vsM6mh71Md9M32tQUYeuWbJ4nMtQLrHnmmDjZeeS/GP29jJh6PvPBPHdyLWeKyvTDeeyfW487JN
 ICwFnRxKUIs4yDJO4ohz4VAYbcvnJhHwBFXKKoOjcx0vcy7c5UzJPGmhyhvNGr4oTZ3cOKU5Pop
 0Ce9OnVa2DKyhnT9ir85eH2W5UoAG9BN9JRbTFPtdVm0iqr594JmmhSJHu6Oy/8uEUDCzn/qeef
 fkNuCh93W9+SS37JcFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE2MCBTYWx0ZWRfXy6Unm9jRbsnn
 a3Alqiz1gik4MOmaCqnPhTiuyksP6XSBCGLuPNUfE9x7EDaZpjglJCkFpvSrGh6BwI1Z8k2MGiG
 QunOhdXrgMphLNZhMD/ZyLUmgxm6qPc=
X-Proofpoint-ORIG-GUID: 6ij0Tir41dt9EEaMni2E1mhJWiFQ9e91
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020160

Protocol driver module auto-loading requires the devices to already be
created for udev to get the necessary uevents based on which udev loads
modules. But SCMI devices are only created after their { protocol, name }
device-id has been added to the requested-devices list which is done from
scmi_driver_register().

This creates a circular dependency where device creation is waiting for
the driver to register and loading the module with the driver is waiting
for the device to be created.

Add a list of standard protocol device-ids and always create devices for
these without relying on these being added to the requested-devices list.

This removes the circular dependency, fixing module auto-loading.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v5:
- This is a new patch in v5 replacing "Pre-register protocol, name tupples
  for standard protocol". Pre-registering requires
  scmi_protocol_device_request() to allow duplicate device-ids, but then if
  the first driver of two with duplicate devce-ids gets unloaded device
  creation for the second driver will fail. Allowing duplicates causes all
  kinds of problems, so this new approach avoids this.
---
 drivers/firmware/arm_scmi/bus.c | 48 +++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 6f667e4ffeed..10d15da76f19 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -505,6 +505,34 @@ _scmi_device_create(struct device_node *np, struct device *parent,
 	return sdev;
 }
 
+/* Standard protocols table */
+static const struct scmi_device_id scmi_std_id_table[] = {
+	{ SCMI_PROTOCOL_POWER, "genpd" },
+	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
+	{ SCMI_PROTOCOL_PERF, "perf" },
+	{ SCMI_PROTOCOL_PERF, "cpufreq" },
+	{ SCMI_PROTOCOL_CLOCK, "clocks" },
+	{ SCMI_PROTOCOL_SENSOR, "hwmon" },
+	{ SCMI_PROTOCOL_SENSOR, "iiodev" },
+	{ SCMI_PROTOCOL_RESET, "reset" },
+	{ SCMI_PROTOCOL_VOLTAGE, "regulator" },
+	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	{ },
+};
+
+static bool scmi_device_id_in_std_id_table(const struct scmi_device_id *id)
+{
+	for (int i = 0; scmi_std_id_table[i].name[0]; i++) {
+		if (scmi_std_id_table[i].protocol_id == id->protocol_id &&
+		    !strcmp(scmi_std_id_table[i].name, id->name))
+			return true;
+	}
+
+	return false;
+}
+
 /**
  * scmi_device_create  - A method to create one or more SCMI devices
  *
@@ -534,11 +562,25 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 {
 	struct list_head *phead;
 	struct scmi_requested_dev *rdev;
-	struct scmi_device *scmi_dev = NULL;
+	struct scmi_device *sdev, *scmi_dev = NULL;
 
 	if (name)
 		return _scmi_device_create(np, parent, protocol, name);
 
+	/*
+	 * Always create devices for standard protocols, even if the device-ids
+	 * have not been registered into scmi_requested_devices yet. This allows
+	 * auto-loading of SCMI protocol driver modules for standard protocols.
+	 */
+	for (int i = 0; scmi_std_id_table[i].name[0]; i++) {
+		if (scmi_std_id_table[i].protocol_id != protocol)
+			continue;
+
+		sdev = _scmi_device_create(np, parent, protocol, scmi_std_id_table[i].name);
+		if (sdev)
+			scmi_dev = sdev;
+	}
+
 	mutex_lock(&scmi_requested_devices_mtx);
 	phead = idr_find(&scmi_requested_devices, protocol);
 	/* Nothing to do. */
@@ -549,7 +591,9 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 
 	/* Walk the list of requested devices for protocol and create them */
 	list_for_each_entry(rdev, phead, node) {
-		struct scmi_device *sdev;
+		/* Standard proto matches already have their dev created above */
+		if (scmi_device_id_in_std_id_table(rdev->id_table))
+			continue;
 
 		sdev = _scmi_device_create(np, parent,
 					   rdev->id_table->protocol_id,
-- 
2.55.0

