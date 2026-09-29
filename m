Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635FD3955DC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790665665; cv=none; b=uI19YqNjB4hzyAK54Cnll4RfkXhSE33+PWmEhwu1nDlKJqvQLoXqtc7Inw6ZvUv87JtUl9Rtl5dTDpynD+M+zAPE0sJAb/qYF7lvQRNpYoN2I94gAJCQXstDyMUBp+IOVb9NJs6HMTlmhsSQ7vb1ynTf60NT98WjBvqJhlnLdlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790665665; c=relaxed/simple;
	bh=sn9nVAuE9CIKUaNtjwjoRmbzxL+sDIi+Hu2Kva/kOxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FG+De6Wpf4YlYz20v9bqtC4ih7Nb9tE2+wDPZB9auysBUAYjqZmzFxXFIFxcVIbuUbA5/sOm1EfY12AB5zwxrpMir3fIdClOfKOsQOWZMSKwKKS7EppIUO2aqsUtp698+EPEFykNtc8pZBPyiPbleB7gwBhwkaCfnPAtx+QDfnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pRjAc/fC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MlAEZaJ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pRjAc/fC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MlAEZaJ3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T475bd3390850
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yRyTuafYCnAtMg41E5eJOVfsBaO0/MWamWc
	9bPCyTtM=; b=pRjAc/fCbWl9lTmGOIchQ1JPrLJeF/yv+6SaNz0SnCa2Tje87Il
	cdEk0OUDZJ7HxQ0GJ4EqhWnfoz00nesihJ44hcSno/yJfr2jUeyBuQaci6+vidJM
	DJ2h+ZtKpppU5k3RdTOFpTGgyuxAVeZpeKF/CuSo/8I35Jyz6L51npwtV3Det6xn
	3z6xP5hkdc0Wb1IYYcL5Lp8cgRPGeGe0XsEtDr9LSzgajINBKLFJ1UJw2Hsg+O7s
	6aDPk41mEp+usCY6N1pV4jkNBiotG2dO2s6xwZQ6t+2Urcequs3+tB1gGBEa8ScK
	N9l3BIgsP3ZNRxdbZIJWe5XVzkyINvQjAqA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkhfjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:07:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso459039eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790665662; x=1791270462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yRyTuafYCnAtMg41E5eJOVfsBaO0/MWamWc9bPCyTtM=;
        b=MlAEZaJ3ane8pc+vwixAY7XzqSoCStWezQQAK5D7tI4yVo6E5/dXQkrnpH2mAcHxAm
         mzVCi9w93MyOybeIdA9CjgIkwOjbJthS6p94n/tyzgK7/rbblDH9my1HJVGO7rzwtUQd
         cwDKRLF1UuumaJSD3lEtlqVy+jLwra9NOOuoGPPC7dNqtilYXOQY05do7NXzR7EJBPeH
         FiXeC1tbzIKw+cY+Q5rvZTmuIHMu/D4uAuxH/dqZQIopwx0e8o+tpzc45uNOmnpPQQ5n
         p7ppv9fNSougDE4Y4Dxrdr8JlGibNeVdZ9FGJ5HF7nEXHsclyeXX32KC1QFsx3wp9GQM
         f7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790665662; x=1791270462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yRyTuafYCnAtMg41E5eJOVfsBaO0/MWamWc9bPCyTtM=;
        b=dDgDgYBeJykDJ5Dpwx1BJu7syaCOwWcw+iA1PxqFRMON3mxEQ2SX3qfbyNLvMqfnOW
         QMM6QC897INValt5MyskbDKFbM/vV2U34PT9NkzSh8jal5383qtPuk+8M7xvvL4IJ4n0
         kBM8slFs9a2d258WmQQaVc1+xBSXRXyHyvOB68P/SJIFtrtKXmH4I/vI9MiNC5RyQSOI
         OnqcxumSLeEF8+W2aHg8k2rWjN6e00nw6U40/rNGXNquRiQap0G0+LiKY2A4DnE2gU3n
         oJbW8ywILoHLrPYMSUC/OXfLbFwreDxALZQRSrbuelMWr3U32WxVI0iPY4dQmudSy1Wl
         yXug==
X-Forwarded-Encrypted: i=1; AKwUvByXFOo7UxwelNgc4PU4wO6B+AiPUnff3iB+kMX4MOocJYZKFyjveU1yWkWqrceO6us0HmQuKgDAC4S2qNg=@vger.kernel.org
X-Gm-Message-State: AFuF++nn7uuBjyFOjteGOHxrnjbaMuUZTAhxJKTDB2d0bgUsJzDqgU1S
	cAq3aFA2z02iB8aQFBJ+wt508uaDowdIcDmwdDF8Wns38Ss+EEqEZvT0m/+MZDciZ1VPV3F1GUG
	RHH/7OO1NFPUrOR4ZiYNNxXfdVyEixCGApEuyJKly/MYablsjLYsfkoUVauzdxfBbuwsYvn8rey
	w=
X-Gm-Gg: AYBFou3cekXC7kHgMg3rWnrU8abENZWNR/ejMdrh9Y0kiyzrp6GkuQnPAwggK/XJEQ/
	l5MkO9mWXc70tLgOtmq3aX+TN9TLP3es6b3SUIubGNf74gI39ORH64iH1lylfapFd3uKOyFSrw6
	xGgXmQjXj1TZ7NJ8N6JeHLLzueaJ64Jx9rQpQr75jJ54XWis7xhEtBehxaawwC9cmPE4fXOMHz7
	BncXMW6pQ1aFXCv3vY6XLSh2KPNGSmoOyW1SPXvcLc1B/m0Gs+Ne64uzv7c3EYVzfIS2AthfkUf
	XcJBRRo32Mnh/0YDS5w0/AIgDpG+RuNxr8AHDauF4a+7HM1+UqVmJtl46wFJ/pWAVY0pAlN/a3/
	Z12B5uuRHp6mwevj6HSI5kZno5Wet8xulFUcceSMemHvOBCbKsw==
X-Received: by 2002:a05:701b:2212:b0:149:ef22:2fa2 with SMTP id a92af1059eb24-149ef223168mr5577023c88.8.1790665662218;
        Tue, 29 Sep 2026 00:07:42 -0700 (PDT)
X-Received: by 2002:a05:701b:2212:b0:149:ef22:2fa2 with SMTP id a92af1059eb24-149ef223168mr5576993c88.8.1790665661419;
        Tue, 29 Sep 2026 00:07:41 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14a7c03ece2sm7426321c88.16.2026.09.29.00.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:07:40 -0700 (PDT)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: joro@8bytes.org, will@kernel.org
Cc: robin.murphy@arm.com, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        fenglin.wu@oss.qualcomm.com, peter.chen@oss.qualcomm.com
Subject: [PATCH 1/1] iommu: Hold group references across bus_iommu_probe()
Date: Tue, 29 Sep 2026 00:07:37 -0700
Message-ID: <20260929070737.3798358-1-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyOCBTYWx0ZWRfX3RWmMWxtWzl8
 8L3HAj6j+bQ04r9OJbeNrZ3MPZr/dafYwGhccOwUUeNd4S3UgNDdHzDeWp+vgk38fV9xmee4bE9
 a1mAm0A0eGU6KtDRZoJy+NnpU5wPKQRroeFWYXq77XEQaNyjcrSB3MKgFYt3One7YDHCTh1+5Qn
 P+LjBU46dohzsTYoaAlBSr4VjE0v3SPMFpNOWrFFTW0BDOaDcYysz7CbfI+VKRCepek7xobf+wC
 Tdipc98pmT2vBRh1t0dsbV9eiARMKjts0f5dNZvrIfFrXzvlpF7UVjyBhJfuQJTB1Ulxm8g+9kH
 CQTaXD+dobYRVcDwItaX29MbpFFPoJ9rpf9bZ0gCMD3S2n9NSX7DKIqTVbagVJ3tlrSVpE8xyGG
 qjvdRkAf0k1lChBEWyXv9zmWgzPyxE7lkOE9A+HPdVNQyG3C9LM6Ux3hCewiBzp9Sq/DZuFW84d
 y3WnMuY2PK0xJNhWOaQ==
X-Proofpoint-GUID: pOHQVe2yuFTY1pIAGI4p4WM3qYoeq1N7
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abb63bf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=5nmvm-2Xiqt-MVby-jsA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: pOHQVe2yuFTY1pIAGI4p4WM3qYoeq1N7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyOCBTYWx0ZWRfX9fckKHZ6bTVs
 YcgFYnEU+q4G9hRpo+IfQeOtFgfN22kdd9O/ESgJo7D1EUzBJ4+b10KopR3yumbehJSanut1R8H
 5MKw3YRtz8J8y6NCqjm7LHpwPeQjlcs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290028

bus_iommu_probe() collects the groups that are linked through
group->entry, but the list does not hold a reference on them. Only the
member devices do. A device of such a group may be released while the
bus walk is still in progress, for example by a BUS_NOTIFY_REMOVED_DEVICE
for a platform device that is depopulated concurrently. If the last
iommu_group_put() then frees the group while it is still linked on the
list, the second loop of bus_iommu_probe() walks and unlinks freed
memory.

This is the "iommu_bus_notifier() being triggered during
bus_iommu_probe()" case that commit da33e87bd2bf ("iommu: Handle yet
another race around registration") left open. The sequence is like
below:
- Process 'A' creates the platform device 'T'.
- Process 'B' (eg, arm_smmu_device_probe) walks the iommu bus, and
  allocates new group ID 'X' for this device 'T'.
- Process 'A' deletes the platform device 'T', and frees its iommu group.
- Process 'B' finishes walking the iommu bus, and tries to get the iommu
  group from the list, but that iommu group has been freed.

The kernel dump is like below:
  list_del corruption. next->prev should be ffffff8064a984e8,
                       but was 0000000000000000. (next=ffffff8064a9a6e8)
  kernel BUG at lib/list_debug.c:67!
  Call trace:
   __list_del_entry_valid_or_report+0x148/0x14c (P)
   iommu_device_register+0x1d8/0x268
   arm_smmu_device_probe+0x588/0x624 [arm_smmu]
   platform_probe+0x74/0xb8
   ...
   deferred_probe_work_func+0xa4/0xf4

where next points at ->entry (offset 232) of a freed kmalloc-512 object,
the released iommu_group of the depopulated device. That was seen
on an Android 6.18-based kernel, but the code involved is unchanged in
mainline.

Take a group reference when a group is added to the list, and drop it
once bus_iommu_probe() is done with the group. With the group kept
alive, a group that has lost all of its devices in the meantime can
simply be skipped: there is nothing left to attach a default domain to.

Also drain the list on the error paths. Returning early used to leave
the remaining groups linked to the dead on-stack list head, so
list_empty(&group->entry) stays false for them and a later
bus_iommu_probe() would never queue them for default domain setup again.

Fixes: 41df6dcc0a3f ("iommu: Keep a list of allocated groups in __iommu_probe_device()")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 drivers/iommu/iommu.c | 41 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index b486b8bbd1fc..6965b89e76bb 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -682,10 +682,14 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 		/*
 		 * With a group_list argument we defer the default_domain setup
 		 * to the caller by providing a de-duplicated list of groups
-		 * that need further setup.
+		 * that need further setup. The list holds a reference on each
+		 * group, as its devices may be released before the caller
+		 * gets to it.
 		 */
-		if (list_empty(&group->entry))
+		if (list_empty(&group->entry)) {
+			iommu_group_ref_get(group);
 			list_add_tail(&group->entry, group_list);
+		}
 	}
 
 	if (group->default_domain)
@@ -1951,6 +1955,18 @@ static void iommu_group_do_probe_finalize(struct device *dev)
 		ops->probe_finalize(dev);
 }
 
+static void iommu_group_list_put(struct list_head *group_list)
+{
+	struct iommu_group *group, *next;
+
+	list_for_each_entry_safe(group, next, group_list, entry) {
+		mutex_lock(&group->mutex);
+		list_del_init(&group->entry);
+		mutex_unlock(&group->mutex);
+		iommu_group_put(group);
+	}
+}
+
 static int bus_iommu_probe(const struct bus_type *bus)
 {
 	struct iommu_group *group, *next;
@@ -1959,7 +1975,7 @@ static int bus_iommu_probe(const struct bus_type *bus)
 
 	ret = bus_for_each_dev(bus, NULL, &group_list, probe_iommu_group);
 	if (ret)
-		return ret;
+		goto err_put_groups;
 
 	list_for_each_entry_safe(group, next, &group_list, entry) {
 		struct group_device *gdev;
@@ -1969,6 +1985,16 @@ static int bus_iommu_probe(const struct bus_type *bus)
 		/* Remove item from the list */
 		list_del_init(&group->entry);
 
+		/*
+		 * The bus notifier may have released every device of the group
+		 * since it was added to the list; there is nothing to set up.
+		 */
+		if (list_empty(&group->devices)) {
+			mutex_unlock(&group->mutex);
+			iommu_group_put(group);
+			continue;
+		}
+
 		/*
 		 * We go to the trouble of deferred default domain creation so
 		 * that the cross-group default domain type and the setup of the
@@ -1977,7 +2003,8 @@ static int bus_iommu_probe(const struct bus_type *bus)
 		ret = iommu_setup_default_domain(group, 0);
 		if (ret) {
 			mutex_unlock(&group->mutex);
-			return ret;
+			iommu_group_put(group);
+			goto err_put_groups;
 		}
 		for_each_group_device(group, gdev)
 			iommu_setup_dma_ops(gdev->dev, group->default_domain);
@@ -1991,9 +2018,15 @@ static int bus_iommu_probe(const struct bus_type *bus)
 		 */
 		for_each_group_device(group, gdev)
 			iommu_group_do_probe_finalize(gdev->dev);
+
+		iommu_group_put(group);
 	}
 
 	return 0;
+
+err_put_groups:
+	iommu_group_list_put(&group_list);
+	return ret;
 }
 
 /**
-- 
2.43.0

