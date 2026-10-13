Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3796B3D5222
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881184; cv=none; b=fmm3MVUHzVij8iOJ8LgUw1oDCzksm0E9WV0Os/OFCV1hboVs2lRBsZFWQBNHhRWu8nDx4nXC3cuAMkOodIfPq39YndmoJw22q6Oy8PXZuP6WLVXjw0NkuRcNgb4ZHs4rjxPXPWIZaLHTzdBHBI2VGZ++MJ11+vMwwSQcaeMtxkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881184; c=relaxed/simple;
	bh=68D+ZsKS1NidI8QaJpqFgyA6M80R4nxiC7ber19l0Ek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=apHUvRAF6N3FCxqwLzDpNjLpgP5T0xc0WeWG0J8Ib1GuubSfsxONzqB0sBagcV0y4/cpnqUlYK3ebQLZsDlTx/Jg5ArnkyemS1I1qeNJs4yrFRZOVWrOP3U2hqitxxL4S4zZ3fZvNxM+XqxbMldfNzJ4EE8HQ0kgymMXQknkiVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ToK7AUuK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pv5criEV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ToK7AUuK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pv5criEV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CU2K949467
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tEMDLqN5fZ9ZGGYYJqvC0hdrVOQfVxW/wGFukiEhFuo=; b=ToK7AUuKKvprRMkK
	Bv20C+OO4z9VjXP53d0EasiU3syfGYuVdQIAu6Cs+vET01lakCnHdy/9ty0OOIf6
	P5KBN8sc4YG05TQ/wCzT8EKKgd0tTX3d47MrGMq1awbBCeVT96q3H3WJi+kNI/oM
	IwFvUHA8iOmGkI6tRPouEryP/+Hi+IgyqfGNyuUDbp3yb/qKkVRx7mhXUd0D+9H+
	z5qLeMYm7byIglSNIAsuBWcty6Ha5lB1pBsyMGfn6XRkqey8feHcArNZVwJIA/gf
	i+BJNoKh8ERbG5WPbsarFP5uLGRnrqs0+7j/Bh0pcH9kq48EudnCKvZ4Vbzyd9Qg
	geCm0Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f628kpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:46:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd61bdc8683so200053a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881180; x=1792485980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tEMDLqN5fZ9ZGGYYJqvC0hdrVOQfVxW/wGFukiEhFuo=;
        b=Pv5criEVvuYVv631g0ZOzCPLMwvLjdK5wzekAJgmL2ITqTfhfllo2yU8KxoSOQZs9y
         RZ0ZhjL1T5i8ILPFAJA2nZTTR6W3zgNAB5ektN3rK1AwdUz1OK02veqRFFz3IR7CX0XK
         0SbmtjS8+elH1344Ue5dQzDioKwrj1txMN6LpbK06aGmgAqPbvanI4VEPr16dKhB4bOU
         Bov7jCWXnAc74eGxW4RwU24RCIL6UvW0PRJErq/OgPc2xN3vFNC0NrdoCrRLGK2LnWdK
         rTkfB4c2MUmm6rvAiP1lL/J4wWh+ya1pXXUm6O1D+48jxtACJC4HS/ZbAIajH6Dam4iU
         cDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881180; x=1792485980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEMDLqN5fZ9ZGGYYJqvC0hdrVOQfVxW/wGFukiEhFuo=;
        b=euiTCjGgtbMtOLHqm/nKXHrANt8WS7kilbyy9YECh9CWNIJ8XC03mbmFKDK6Hz08PY
         60N7P2bWixw21qlEWHyWtvYh8T0ZuexVyR6raXqZAQzw7RKcnE5NW0VZFUBDEn6T6NEL
         XkyhFSsdFIe0jrEHGl7e/BuAyQIpM8zMLe4UW3hKMqKAYoOuPf26SuBU2LiQzcDCcvkH
         N43FPIj1w0+mGBY7b8sxa1vOakJztA3bGhw+Sgi/JADtGwttaH8AKv1aZUOS8vqFe4Oj
         tNXKzWIp/rQDwzK8X7hMDcX7tbyBPSrYQYr5zb0g8RtuiWFsCXwW0UNnhO49LdC3TEFH
         gNjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdHU8vtPUfAn4zBaNeQOT7oVCBKVeF0pZo0b5tO6x9xIt7VWQj+mVpeiLwfUH7uxZw+dZnaYDw8E34Iq4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhJ109GzIHjxAVvkccNV/q6MatuwxK2xF/sGVyBRNs7+ISOl57
	027RqPEfQXaJ4d/yevQj3fZVSFoA1rC6HARbjWsMtagBg5YvE6tUvfpTITB1VUYwWa2zc3l1rlJ
	1RU88B/UjIxomlXOvCDnsjwwz7sVE0AQ1S1QDlvhy9m0nunHt0IjjNwBqsCWdoBacmQI=
X-Gm-Gg: AYBFou2Trh7yFcrt3LShbd+xa8TKpj1yqDmusFvIdyt71Sa356qVX7QMdP8ngSFIq2l
	QpMnNgcWowyVpUDe7LjpRRWoUxPn8JLepW6Tou7uAJKkVEfJKsd5iythV11dYtBvXWNxApaoKPv
	hZLS9O1h5hhkm22OrZHu5gQ4oKPhdvD/iLmntH5wSafNX3dh2d4JRUp4mxTZa+Dy1yl3Icktwad
	Iab11SPB6qG5tbWdexnGN0Aw8Y0gjo9Bsy7b7s4A9hEldbD2c4/G4uGoRZO/IXJDUWTwHCN3IYN
	8edkZEyDoSQsGT5on7W6XaZ2A77B7eFDLHlQ2TAJPLL84KbG8AjCLW/crrnvhGQEzCFbPEjUJo/
	S0ebMgbztE5py/dpN+63SE6XVAf20
X-Received: by 2002:a05:6a21:4598:b0:3dd:a197:cf2a with SMTP id adf61e73a8af0-3e16bf4c2b2mr9630313637.78.1791881180075;
        Tue, 13 Oct 2026 01:46:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:4598:b0:3dd:a197:cf2a with SMTP id adf61e73a8af0-3e16bf4c2b2mr9630279637.78.1791881179313;
        Tue, 13 Oct 2026 01:46:19 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da0596f9sm5384721a12.31.2026.10.13.01.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:46:19 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:15:38 +0530
Subject: [PATCH v9 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-sahara_protocol_new_v2-v9-7-dc9f24357c4a@oss.qualcomm.com>
References: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
In-Reply-To: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791881139; l=5269;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=68D+ZsKS1NidI8QaJpqFgyA6M80R4nxiC7ber19l0Ek=;
 b=m2DDfLs2by6LxBIHhmbf4ndcQniRip7Q5gsIwBvBeAZ+C6RhEDcmdeJ5XhIthHvkq7Jac72k4
 C529vdY8Rc7AvXpHwQtfRxOgIxqLYGYukoKZ5q572KQDPFeOeS6Vmr1
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6acdefdd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=NePjL4a1hEawMabAjiMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfXwS0mM++bTqZd
 j2bqoa4cUEkc1rzFaR/UXptJmRNMFhKnPFPFsnaX15+K5wcfeE8I7vSX9bXqoG9sES32A64dNN9
 786W/PteSwrGQChcV+K8HVF7FS4kxtI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX4DedDdQpeqlz
 SQCPNiduh8tq1Iu1KtFCiOzYKARTGwfYPPZOd2wZ9ztTfu4na90XYnlwZO368E5toTHLwX1wc1E
 PLzUnCR8hAxgLHJj7IXB+O6J1XgPsdpem3IoeQXlETg3zqR6X7bpZeUk2ksjqLLa7ZMtwGhAyTA
 dkB1ca2HkoFSTZ8WUE8Hsf01iWTEioP3SYriSdYYgXUX1p/A/G9jWz7pL2QJGRUNGHAYo5iNoUv
 d90/0B4iudOimFOmDWw0kiVKAPifDml3Gwkp0ZWXUGqZh6Lvv9jJ0tDBcRruqa5w06gJn2l46d8
 fehShy7rvvr17tKyfjL+UsgrBYsMwCpE/qyC5pw5eIeF3vaSSJBVz6mCLs7X4BYBmygHJUghQMj
 wWqvfClumpCMNNvvql1yJq4mfsOnGIj3wOqIaKI5xB2PYeUYSoOsCEtDuTXmkQwNe1zuU83HQCU
 pcgyNolAY8JmQz/DE8Q==
X-Proofpoint-GUID: 49QXwc5ue6X3zPSYAt0jZo5fArgiTVG7
X-Proofpoint-ORIG-GUID: 49QXwc5ue6X3zPSYAt0jZo5fArgiTVG7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

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
 drivers/bus/mhi/host/clients/sahara/sahara.c       | 63 ++++++++++++++++++++++
 2 files changed, 82 insertions(+)

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
index aa684355b7a31674f81a43a3783d5c4158b824b1..be5318fc5e221d0c91fdd9c4b6c908ef1fa4e852 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -272,6 +272,67 @@ static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct devic
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
+	/* No complete data yet or offset past end */
+	if (!ct->data || ct->receiving || ct->copied != ct->size ||
+	    offset >= ct->size) {
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
@@ -1129,6 +1190,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 		return ret;
 	}
 
+	sahara_sysfs_create(mhi_dev);
+
 	return 0;
 }
 

-- 
2.34.1

