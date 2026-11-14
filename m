Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625556;
	b=UpIauD/WMpsiTCHuCPsbsH99XJKRYyoqBzEMDbqJ0uchEmVruR0IARrVF8QW7tDFcxGz
	 BDPey7sZc+DdeDRLoJKTV+ivkmNSi7QOikBNmHjWME9Y3UaE2pZv+OoLDuf4TEYWp4IfY
	 6w59osRB6GuD5hUgaLin0N/13QqqdamrRYbW3/OxvV2/Yt8KteTDxRchEEGtgPMvt0w7d
	 RM5NVu5mk1j06AGaLcbQJ0TFVRT/HnAyibZq1W01rjDqz41o2g1gqZjLDlyCzsUeDSvtV
	 x7VosjFUjihJ/RcWAATabwKLB6fjSmeikyE+D9xgMTVBKNwQoPbsLALCJMZ41nSzO4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2iAtZsFyt4C2826PuxwpFZtp0CfSh5l8d/TwOV9OV+8=;
	b=itUsMs+BN68vvcdKg9cbG+oj8x9a8Rt2inMSvSCqp7LIk7EUxKfwr3fHJX3qy+5OYm6m
	 rJc794mtvcFIHjyz/3d6YjPUGM2wBonsRrDvh+alLbdHooIK4T87Qivfaq4tS40iP6EiP
	 wWp9GN1MQa5XNjn+sPTOTqXmeNZB+TnfV1FwwSsYXI2kGOxH1bqKsbR4t/POKPMp0T8v+
	 mxCIdpYc55ID5AYy85vGJNVg0fgILpZ0pQpV5+GE+MoNN8dkbpZIvpnsvKYH/XTUOitxu
	 VILy2FVRg4rh0FrHkFP3pNtSI95oXqqnPt1dks+Wh1HSf7fD6cdaIyRKbrN6oVVj04Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=WtSrSRWQ;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2195D60A263E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2195D60A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=WtSrSRWQ
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-14394530ec6so2106699c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794625555; x=1795230355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2iAtZsFyt4C2826PuxwpFZtp0CfSh5l8d/TwOV9OV+8=;
        b=WtSrSRWQn8wgjIvgrlNFy66Lbly5oV3NnHZuif87VcNTlTL1l1OsZByrugNDNhuZcN
         uj/6GGBH8MMshFnLuzJgIWFSfAE07ldsPXRioWDJnWYb2NNux0meN2nfLopFo8WA3M1z
         56oa37dl0+RJI7OJu6uKP0/2YCLupRhtb3qoqOrX7s+uLXYhKWmkD1Q++zTAEP0X9rYj
         FZRfDHyBlkeCKcFtl1/RtI1Q0Gx1ebg/bmRcmfWapEKiZC1gKV90iDep1K1z3cHh9ODu
         dvunsnMzn53nPWWmY9i3fvZQwYKGTUmHf+2V+Yd9bavlk+/CepgwRXQdy/QirQSIVCoV
         ogTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625555; x=1795230355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2iAtZsFyt4C2826PuxwpFZtp0CfSh5l8d/TwOV9OV+8=;
        b=s+aiL/qBIzq/10pNmH5/VHRQkbXB48hlDfMQkAzpTKNsMCOMhpmzebketdfaAXkxus
         12qNElUFZU6DxcuF1kt93hiuLjJdQasCWqjX1yGYPCJaas4F7mJyu846/IiWAholGlG2
         ZF2I+06k/ClTqykU16l8yKslE0E1tVsKu+UL/ESl1I8/jUnecQ6px/2IdeDTl3cgan3F
         tHm8xW2ZD4PqcPsaTH9Xn+Rowh55AbeOsGsp0Mqp4NJYwsoq6EQHBYHJjc+7H876VawA
         03xQ5K2Uze/Kb/sA3g0g8B3qc5KVGGOQu0uaEfF5xwlUJStwDSYC/vGD/RE0QEceGt3u
         0Kfw==
X-Forwarded-Encrypted: i=1; AL+hErHIV0ngWh5ty8V8tRaARkdVkC/N9kkJ4gm9rdZrpob3+0TReKVrLbF0QTGboE79v8gR9zAmxIlUXjPENyo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9igRe6JvJN1TpHrO5ne2lAYPFk9D/qY8TH/JKXSU88OML3caU4
	Okr0m/WQZPOPrMFkYuxclF7RpP1tgtCqh5TG9bGlALNrUtarpErfBEPgUkHmlfpxOZY=
X-Gm-Gg: AYBFou2h+7VzP92Q5CO4FNZPrJpniB2kz15ig7VFS+LIxspd3jZxg0RtV9PHwrtXVRL
	rTTIshMfVjJ6qNSO5CLiDKHri/fwWxmkN1Cua2/nGPHkzZy8RxGBl3zEFpY1IDnK/Rb8jFrlpfM
	QGO8yf36SVT1hQltVuodmW3IgevVxIJ0UCFFoWE6BKcsPLVqg49cpSIrNTcfLiQISW80JWOZkcb
	TYTjRR/2B4uZJ6inJ8vxguVERKpNIKmWNQ6HwbMHZPQP85GrwPE0scNFlFvGHp+hpmFkCgqf6MG
	RAl4DP+TKLMbMsg89e5DslAVQ/HQ2+lS8b3Oh+cDpkfJxif1rimfhOCHZLnDncBW5W8SrORfLhq
	4aSqHaxbv1USNndg4TpTSKvq6M+bz7t1sHaTTxta2drl9dP7N0v24FNgarLJ+W0zJj/wGo4jlEM
	dFEyWhbCP4Hb56xRXM/D55Aszl3ek9Wed7tyC7XEcY+l0fkQW+j8qHV8QR55x1UxcbVl8xFM99W
	79bKmsrZKrMbkKtfhG0tqqbBuiQa8k2pmQCK7KlFrlPnEGy+I1PeiZGoYB+3sCo3B3ak4BtJauz
	2KRE+7MH8+1BIw+VFmUWswvEaFWV3m00SmXEKAgb0atyC9wllWvuV8NAaGnSlcJFkv1vt3qtsQ=
	=
X-Received: by 2002:a05:7022:f904:b0:143:2719:f800 with SMTP id a92af1059eb24-1b50313d950mr4026638c88.40.1794625554937;
        Fri, 13 Nov 2026 19:05:54 -0800 (PST)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b50316e008sm10829382c88.6.2026.11.13.19.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:05:54 -0800 (PST)
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	Daniel Wagner <dwagner@suse.de>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH v7 06/17] nvme: Rapid Path Failure Recovery read controller identify fields
Date: Fri, 13 Nov 2026 19:04:20 -0800
Message-ID: <20261114030454.2836543-7-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114030454.2836543-1-mkhalfella@purestorage.com>
References: <20261114030454.2836543-1-mkhalfella@purestorage.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TP8028 Rapid Path Failure Recovery added new fields to controller
identify response. Read CIU (Controller Instance Uniquifier),
CIRN (Controller Instance Random Number), and CCRL (Cross-Controller
Reset Limit) from controller identify response. Expose CIU and CIRN
as sysfs attributes.

Together with CNTLID, CIU and CIRN identify the current instance of the
controller. A controller that is reset gets new values. Exporting them
lets a user tell controller instances apart, correlate an entry in the
CCR log page (which reports ICID and CIU) with a specific controller,
and issue a CCR command by hand when debugging. The values are cached
from the last Identify, so they are also available when the controller
can no longer process admin commands.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
 Documentation/ABI/stable/sysfs-nvme | 11 +++++++++++
 drivers/nvme/host/core.c            |  4 ++++
 drivers/nvme/host/nvme.h            |  3 +++
 drivers/nvme/host/sysfs.c           | 23 +++++++++++++++++++++++
 4 files changed, 41 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-nvme b/Documentation/ABI/stable/sysfs-nvme
index 9291595f8102..e3395e5730bb 100644
--- a/Documentation/ABI/stable/sysfs-nvme
+++ b/Documentation/ABI/stable/sysfs-nvme
@@ -9,6 +9,17 @@ Description:
 		of the NVMe controller, as reported in the Identify
 		Controller data structure.
 
+What:		/sys/class/nvme/nvmeX/cirn
+What:		/sys/class/nvme/nvmeX/ciu
+Date:		October 2026
+KernelVersion:	7.5
+Contact:	Mohamed Khalfella <mkhalfella@purestorage.com>
+Description:
+		Shows CIRN (Controller Instance Random Number) and CIU
+		(Controller Instance Uniquifier) of the current instance
+		of the NVMe controller as reported by Identify Controller
+		data structure.
+
 What:		/sys/class/nvme/nvmeX/cntlid
 Date:		February 2016
 KernelVersion:	4.6
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 03671bba1754..38b27d8db011 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -3693,6 +3693,10 @@ static int nvme_init_identify(struct nvme_ctrl *ctrl)
 	ctrl->crdt[1] = le16_to_cpu(id->crdt2);
 	ctrl->crdt[2] = le16_to_cpu(id->crdt3);
 
+	ctrl->ciu = id->ciu;
+	ctrl->cirn = le64_to_cpu(id->cirn);
+	ctrl->ccrl = id->ccrl;
+
 	ctrl->oacs = le16_to_cpu(id->oacs);
 	ctrl->oncs = le16_to_cpu(id->oncs);
 	ctrl->mtfa = le16_to_cpu(id->mtfa);
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 82cdc7d32b22..0c87072c5265 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -401,11 +401,14 @@ struct nvme_ctrl {
 	u16 crdt[3];
 	u16 oncs;
 	u8 dmrl;
+	u8 ciu;
 	u32 dmrsl;
+	u64 cirn;
 	u16 oacs;
 	u16 sqsize;
 	u32 max_namespaces;
 	atomic_t abort_limit;
+	u8 ccrl;
 	u8 vwc;
 	u32 vs;
 	u32 sgls;
diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
index 10018c6356b6..5b549a0513c6 100644
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -491,6 +491,27 @@ nvme_show_int_function(queue_count);
 nvme_show_int_function(sqsize);
 nvme_show_int_function(kato);
 
+static ssize_t nvme_sysfs_ciu_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
+{
+	struct nvme_ctrl *ctrl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%02x\n", ctrl->ciu);
+}
+static DEVICE_ATTR(ciu, S_IRUSR, nvme_sysfs_ciu_show, NULL);
+
+static ssize_t nvme_sysfs_cirn_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
+{
+	struct nvme_ctrl *ctrl = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%016llx\n", ctrl->cirn);
+}
+static DEVICE_ATTR(cirn, S_IRUSR, nvme_sysfs_cirn_show, NULL);
+
+
 static ssize_t nvme_sysfs_delete(struct device *dev,
 				struct device_attribute *attr, const char *buf,
 				size_t count)
@@ -943,6 +964,8 @@ static struct attribute *nvme_dev_attrs[] = {
 	&dev_attr_numa_node.attr,
 	&dev_attr_queue_count.attr,
 	&dev_attr_sqsize.attr,
+	&dev_attr_ciu.attr,
+	&dev_attr_cirn.attr,
 	&dev_attr_hostnqn.attr,
 	&dev_attr_hostid.attr,
 	&dev_attr_ctrl_loss_tmo.attr,
-- 
2.56.0

