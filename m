Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709C93C1963
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440669; cv=none; b=TxOvSH6sbRufMt8RqtBs4ILfRwiQcLdiVz4jMsF7Xjj4MNuBXDVVuTc2ghLR/Y3e5TZDVCf9V7NJchq1CYHzPDWPFhpuTWD/5omlKknyGjsl8NFUz3whEGuReY7I93KL8myGooSgaxV+YGuEroK6uRweOSPv3M0Bts6a3SUmNE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440669; c=relaxed/simple;
	bh=XVetEM5Q2ug5nyBqvhNaS/084gMekcQG8SGiCqI6YvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QF8lykFvjoStUuX6+1lpfEAUGiT6ApOBo9cIrBvGyUf2IiCFsUr7jssUOmOuk1Gj/m0gR6F+YiXkur1WMb0iaAUNRhNcQTHqGnphoY7U0FbXgzeq1u/PkrfVk6xKV4qpZ/GYj0MX8jqx/q8NoXhM9MGzvVX+CPPBunaPxlBQJuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evcTkvsz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RdOXibhy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evcTkvsz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RdOXibhy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BPPS2774900
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 06:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eS4PvSA7/Ma74eWd/k9oJLAImFrqW7ASvtLawTHJBjs=; b=evcTkvszK+8U31jJ
	ku8eUG7knSKpAMWE8bRHO311PA3pCziQipIRWzLnodfqSvJuVFktYYKncxBzIvUl
	gLDEZe2LP5GWc/pkRBZpMNOjIu89q2JVzssEjgc0ApQsyAk3DHZZQOwIcympLD0b
	kVa7NVF1tAu8hqsGimVBWj/loMp2sXzFNEaQX4i76qj7ZBlpbUNMjHdYpxialLQY
	xxe5ArNsgIGZYnChYDd4PFHlrcX1A7LxL9mj8o/KRyYJEmAmZ29PJo5R/8mLWqgj
	DCDc8qFzEpAY+xLo22eEtuyXowfX++2XM7L7UcZ+9Sk41xe0qXQPuNbWtwDx21nS
	FdyBgQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe69f1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:24:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a4e36d5a77so5006640a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791440667; x=1792045467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eS4PvSA7/Ma74eWd/k9oJLAImFrqW7ASvtLawTHJBjs=;
        b=RdOXibhyWWFo4d+hKuz01Fxe/cegPE8YX6/avh5/VdnUJ0zHDsc1ecPje+YLhgxPXz
         qtWUaIXLFBnBdoF1qbRY2LJrhhljfwUHzEm6c28o5Z8jfaP4VjOebSmE+tsrpKPLLCnX
         zEWbmSY+Q/xkA7Gn1+GsKIErGmaHe1xNxsT/lEeAkNn89LZXrCsEsm7mXwBcEYw2VwPi
         u9K7EBLZA3r78aoznDyUo2je3pzKZvBPdNNY9hWM4T+CepYpcHVkSQht2MD9DpIOzA4h
         XZU22QNqmrIS03c4HhQRwrIHfykECGuJv7ZUgNjBAE1a5Ev0OnL9ekL1KDgU7pYfwZlI
         enGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440667; x=1792045467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eS4PvSA7/Ma74eWd/k9oJLAImFrqW7ASvtLawTHJBjs=;
        b=14F+/ACMOXV5k4cjXpzLGKQTfqR+MSXQi5nBmM+6ZuBNcx0AW7+DQ5PnNOsZ/10//0
         /Wzj5AIF2rKN8MWYjiwa8VEFmvMGCjX61/e64T3O5xMtynBw3Y+9sryXQn8EQ1RDw3dX
         HdTDyWo+0/6i0/Mc5BmQU5GvPzrx79VoT8PpJy/5DYcln0R+uUR5V4GngrlPv5iSsslo
         mWxeffXK5YQx1I27zhyLMP0khsm+XLwDvjMMqfd7SHmj1GeZ3/c2FwPyWZPHvbBWaQy0
         PXf24+5hUpjgePNt3bA8LR77HvKJh7WsrspkbAydFp3vGnAs005MtsduItubSAEzPDZ3
         cs5w==
X-Forwarded-Encrypted: i=1; AKwUvBw9yppg0F/EABnlMcftySVTwmvq2DtE7bnqhEHhD2VXBZtAlqgFbgYLtZHfx+cnV7Wm8iDcE6LAeqVBjEw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdd9pS3Q+x7ORl1kAMMZTTO/85etCVJ+hk7gyEQ6PWBpMZ0BuI
	g0BIfzdZiWaABrjIbvyE5jgxMqifsDC2lMnBNSHXQC1hE+Has4yh2sekAiPHPLDU4vtguF8q/0T
	WLTfW3QjZpk+mvM1UiYyoAQk4vxgSq2+oFwX+WBAlEO1zyz8bIoWyuatio7BpkQJdTLA=
X-Gm-Gg: AYBFou0fLlAbogTQrLwRUpklOAdOG7ffe6jAuTGCQ97n/4cytxIL4dFxoDYaf8YAdSA
	vugU/fEGNU6CtYpAI34c94j4J2aRur7n2CbLaH4NUgvI7glehOGtXYhagZeGdpz0m2/jFKsbYbh
	WX5N8NqYRaIehZeBfjRgDEqRG99IVlqKIa8DhW/jHsCfScScp4Fo4neK4838Z/6qzwNM6oPOq4l
	mxLUSBQ8Tset+3meiV019j3f7bM/Sis7VCVQRLQuJmEZDlGj8TKBuKb9n4Jl3O05CZ+kRnBhTbX
	+KfbBkMFRjTz5QL+YYKOt9/jXORDMdEpy6lQK/81GJIocv7K2Dse03tSZsZwxffJ+qzzC8x4iYp
	52UfHSQNpwakT7p6i7QE0qoK+h8JF
X-Received: by 2002:a17:90b:1811:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3a8a1bbf16dmr4105662a91.45.1791440666913;
        Wed, 07 Oct 2026 23:24:26 -0700 (PDT)
X-Received: by 2002:a17:90b:1811:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3a8a1bbf16dmr4105630a91.45.1791440666413;
        Wed, 07 Oct 2026 23:24:26 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ab034sm2767618a91.4.2026.10.07.23.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:24:25 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 11:53:51 +0530
Subject: [PATCH v7 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-sahara_protocol_new_v2-v7-7-90d278bd7414@oss.qualcomm.com>
References: <20261008-sahara_protocol_new_v2-v7-0-90d278bd7414@oss.qualcomm.com>
In-Reply-To: <20261008-sahara_protocol_new_v2-v7-0-90d278bd7414@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791440631; l=5210;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=XVetEM5Q2ug5nyBqvhNaS/084gMekcQG8SGiCqI6YvA=;
 b=XwGMCYWzlGTsjAzJeyIcI3VnMQ7Gv2772DSFZeD+o6JRTtp9YjGcLODcxasJ/NPHil0Hp/nRa
 XEkzdLU4MUSCax5CLl3/wd4fJbJlZHVoEzE2OFoKpXGO4EqpVFMmk6M
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-ORIG-GUID: WUrqWbrdcltgU-jTZ0kI52u9Y_tKMAI2
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac7371b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=W7Sg6yURm1IBNJFiFuEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: WUrqWbrdcltgU-jTZ0kI52u9Y_tKMAI2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNSBTYWx0ZWRfX7+n1DrLISGq0
 euZEHK/UkaFlZKtnkU90g54WPnfCPS3i0Wf1108QU/l9eW3VXiIWq1tzfhqbuVv9sh1mVprbey0
 5f/mUzFbXa/j+7lWYWV7GdhFW3bA/cwmILvOke3WaxC/7JaWPZjjhXjT31zMhp1otWZvv2P3jO/
 09gsMwBgN8bsb2ZgsNeMWFCuHgAmJqMSOZ7oSOijb+TdqW7jOjQ94Pg9BejMeUapVAiEEFVpYFt
 GHmhcX6zi/vqMn+KxlIApSR2XI5QfTCLwKH3GCM7kOOZeXvUVigvHjnq0BhhPplHCcKpAfamT0A
 3znpEw1BKgjXBUOiFlHa3UmNWefQJBKmi8N49GEAzgTVs2KOlUpZaA6kumcNxDhQGi01o+0z8I+
 ldxa2h3MWO2YoZXX5ZdUIA3wc67Wahs56dt3mjOGnNPvSUPznychCVTvaLfbNJMv4ZypgddUSER
 /btto8Qdg0g2HlhA3Yw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNSBTYWx0ZWRfXyijuOgM0aU55
 ZqvNST7Q6TEEL5MI6q5db6UPgIUeU5yNBSk8SzyhQ4eethdcQz2Nz9dRsL44dmin9usxOA8U4KJ
 Iu7gN1W9fPAjdOgiNTDePaYVJGgGeeE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080025

DDR training data captured during Sahara command mode needs to be
accessible to userspace so it can be persisted and reused on subsequent
boots. Currently, the training data is stored internally in the driver
but has no external visibility once the Sahara channel is torn down.

Expose the captured DDR training data via a read-only binary sysfs
attribute on the MHI controller device:

/sys/bus/mhi/devices/<mhi_cntrl>/ddr_training_data

The sysfs read callback serves data directly from controller scoped storage
and protects access with the controller training data lock. The attribute
lifetime is tied to the controller device via devres, allowing the data to
remain readable after Sahara channel teardown and ensuring automatic
cleanup when controller device is removed.

Userspace flow:
1. For each controller device, userspace reads the ddr_training_data sysfs
   attribute.
2. If the read returns non-zero data, userspace persists it using a
   serial specific filename (for example, mdmddr_0x<serial_no>.mbn).
3. On subsequent boots, the Sahara driver attempts to load this serial
   specific DDR training image before falling back to the default
   training image, restoring DDR calibration data and avoiding retraining.

Add ABI documentation for the DDR training data sysfs attribute exposed by
Sahara MHI driver.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-mhi-ddr_training_data    | 19 +++++++
 drivers/bus/mhi/host/clients/sahara/sahara.c       | 62 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
new file mode 100644
index 0000000000000000000000000000000000000000..810b487b5a5fdba133d81255f9879844e3938a10
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
@@ -0,0 +1,19 @@
+What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
+
+Date:                   March 2026
+
+Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
+
+Description:            Contains the DDR training data for the Qualcomm device
+                        connected. MHI driver populates different controller
+                        nodes for each device. The DDR training data is exposed
+                        to userspace to read and save the training data file to
+                        the filesystem. In the subsequent boot up of the device,
+                        the training data is restored from host to device
+                        optimizing the boot up time of the device.
+
+Usage:                  Example for reading DDR training data:
+                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
+
+Permissions:            The file permissions are set to 0444 allowing read
+                        access.
diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index 11f65cbfa66b87cb6f144eb096f96773621978fa..2f2d18e4ed4da4ab023c8d68a5e69abad0480555 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -273,6 +273,66 @@ static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct devic
 	return ct;
 }
 
+static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
+				      const struct bin_attribute *attr, char *buf,
+				      loff_t offset, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct sahara_cntrl_training_data *ct;
+	size_t available;
+
+	ct = sahara_cntrl_training_get(dev);
+	if (!ct)
+		return -ENODEV;
+
+	mutex_lock(&ct->lock);
+
+	/* No data yet or offset past end */
+	if (!ct->data || offset >= ct->size) {
+		mutex_unlock(&ct->lock);
+		return 0;
+	}
+
+	available = ct->size - offset;
+	count = min(count, available);
+	memcpy(buf, (u8 *)ct->data + offset, count);
+
+	mutex_unlock(&ct->lock);
+
+	return count;
+}
+static BIN_ATTR_RO(ddr_training_data, 0);
+
+static void sahara_sysfs_devres_release(struct device *dev, void *res)
+{
+	device_remove_bin_file(dev, &bin_attr_ddr_training_data);
+}
+
+static void sahara_sysfs_create(struct mhi_device *mhi_dev)
+{
+	struct device *dev = &mhi_dev->mhi_cntrl->mhi_dev->dev;
+	void *cookie;
+	int ret;
+
+	if (devres_find(dev, sahara_sysfs_devres_release, NULL, NULL))
+		return;
+
+	ret = device_create_bin_file(dev, &bin_attr_ddr_training_data);
+	if (ret) {
+		dev_warn(&mhi_dev->dev,
+			 "Failed to create DDR training sysfs node (%d)\n", ret);
+		return;
+	}
+
+	cookie = devres_alloc(sahara_sysfs_devres_release, 1, GFP_KERNEL);
+	if (!cookie) {
+		device_remove_bin_file(dev, &bin_attr_ddr_training_data);
+		return;
+	}
+
+	devres_add(dev, cookie);
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	char *fw_path;
@@ -1130,6 +1190,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 		return ret;
 	}
 
+	sahara_sysfs_create(mhi_dev);
+
 	return 0;
 }
 

-- 
2.34.1

