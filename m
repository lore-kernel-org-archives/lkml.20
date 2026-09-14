Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D53C3F0744
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372379; cv=none; b=UIR2uEc1IpNdozyXzuPU5gktdcBkzEG93r4YUBQP7svixAXqNC2KoX27UzJ3pA74KWU4fkT8+pWnaiWA/QCzFBMrbolCvaJxLPm/v+iAGtP2362rmJUmm3Uv9pqh5vfp0FM5lZ2uEc+TSarifaPOfgxdEwk8CNdJcTkc4Zz3DwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372379; c=relaxed/simple;
	bh=VCtqfOsY5Y0ENCxMh4RKNGglmCVugcn1LhCuMYnkbbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HN3S6RojkvNADp3m2rbEULjz+tJPYH/Qvbw9RrfWgyc1ewbsxVNeuBDCaF0Bb2AOiHYeFzMJ5WaNP7GMfFCZvbciECKorj3gT5PVReajh+wOsWZ84JSpk5kUYD1Ha+yzCOWnG4ajmvctweYRZfmEX7xbkkoxwJU/ASt3gXBBdxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn; spf=pass smtp.mailfrom=kylinsec.com.cn; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: esmtpgz10t1789372316t079568bf
X-QQ-Originating-IP: Syg0v6EdJmRYg1gvwocYnJ1zj1OFg3WMjhupT7LAz1s=
Received: from localhost.localdomain ( [175.0.204.93])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 14 Sep 2026 15:51:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15608378338878649806
EX-QQ-RecipientCnt: 10
From: Yingchao Deng <dengyingchao@kylinsec.com.cn>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dengyingchao@kylinsec.com.cn,
	qinyungao@kylinsec.com.cn
Subject: [PATCH v2 1/1] coresight: syscfg: fix deadlock on device registration failure
Date: Mon, 14 Sep 2026 15:49:00 +0800
Message-ID: <6CC680FFAC60931F+20260914074900.1711-1-dengyingchao@kylinsec.com.cn>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <B16F90D29FAA2B3E+20260914074524.1694-1-dengyingchao@kylinsec.com.cn>
References: <B16F90D29FAA2B3E+20260914074524.1694-1-dengyingchao@kylinsec.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: MnyA3vAndR/VRcW3wesENlVcZ4KkBFEPe2YhwCT+IRxAXT2VLVugDu9r
	/7epfxErcN674vMyqrqIiAQzt2L3NhL8b753hksYX3mp4mOJtIakyzAeSebyI/sME3ouz6o
	Aaaj8llPrZPc8vYwqloIUZxFwLEZaoB7uVP78l3bigUVgwC7rzeJVLnQPyJG1ysPAYR5/a0
	5ScGBDLdXf3xW//iSkQBVtyqdxryc8sG/ozd9aJ7Wc61i3Frqc/Tmbc9V/bd6lfPSadbYKv
	0JJLY0LISlR+pehrcB7nuoXNAIRk50rGnz8FB+D/73eMUdP/LdXBbnOij1rb19EmqH81+6t
	xRNx+2PVT9YHdylBH6/9uOBhI9TSa4tZKXHD/pg2Z7cU6YDjpJSeROytr64DEE52m/aK2wz
	QBjrsj5xgMXISzB/6B5hXoLnPffdg2eg9X6nC4Ujh05xr8gvamelqZcZ5plp8x6ngVDbuUt
	7wqKPCr3mES6sT1ACo9lSNNVl0B/W0PZOkuiDIGov4TgcnUZklzMc63uNDJVwrwQ1t9D14W
	IntKFmPToXx1Lzgt59GpbUsY2xkFohjRFhyzZABNz4/S5b0rLJUOgdJJ/jg/2E8ZPpbPvMx
	MH4XIgeKnqYGA0nbgunMQZeHDvb6e+874qX68T7KcmlmQhp6y26IB5ywm0/Xwb8Xqn2ZTKM
	b2zgaGkkZTLOcoLokq8kf9jWXDBhP4Fv48yKTmT+y+ne1HemqPOmTb2sZ9m/iWHCEK0mmWb
	nzeO/obOn3Aev1olsk2QjAgNpnEVxdhSAFB4wNKmCk4cQQMcIiduV2SOq2AwtPxz6Q+Todq
	QpRhV6Hxf4oWFgIz/Gbc0wxInP07VnK6PAWmr+T03VGsycQr6ew1A4vo4E5ojfoZHXwHkMq
	POUiywuo3I6MB0XelM+oJICLCt9z8YZL2f2rp54iZRdKd4TBL/WC2avfNW/C0e7gO2zJtam
	0me98G38IICKPTTRHxOjFWMTrpxjn+ZF9dvvwS2Pg/e33p6nF0tQVXWhUT/FoWWc4ajPrv+
	0HFNfp9fSr/938rTCM4V2YD6ghP6p9DA4OOwnc+Gyu5+lukdP1pOmwndUWgLGignrmeMCCS
	gvJgdY77QECNYYuB7Rta3mZZ1rcvb8AA7O3Wwz76mfqrvyy8M+Wn1xmQ7PgUZLqBTXekTj1
	8rSbU7QoMkPlwus=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

cscfg_create_device() calls put_device() on the error path while holding
cscfg_mutex.  If device_register() fails, put_device() drops the last
reference and invokes cscfg_dev_release(), which takes cscfg_mutex again,
deadlocking.

Module init and exit are serialized by the kernel, so cscfg_mutex is not
needed to protect the allocation and freeing of cscfg_mgr.  Remove the
mutex from cscfg_dev_release() and take it only while cscfg_mgr fields
are being accessed.

Fixes: 199380decc5f ("coresight: configfs: Fix unload of configurations on module exit")
Suggested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Yingchao Deng <dengyingchao@kylinsec.com.cn>
---
 drivers/hwtracing/coresight/coresight-syscfg.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 2bfdd7b45e49..2dd0b29f44e4 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -1173,27 +1173,21 @@ struct device *cscfg_device(void)
 /* Must have a release function or the kernel will complain on module unload */
 static void cscfg_dev_release(struct device *dev)
 {
-	mutex_lock(&cscfg_mutex);
 	kfree(cscfg_mgr);
 	cscfg_mgr = NULL;
-	mutex_unlock(&cscfg_mutex);
 }
 
 /* a device is needed to "own" some kernel elements such as sysfs entries.  */
 static int cscfg_create_device(void)
 {
 	struct device *dev;
-	int err = -ENOMEM;
-
-	mutex_lock(&cscfg_mutex);
-	if (cscfg_mgr) {
-		err = -EINVAL;
-		goto create_dev_exit_unlock;
-	}
+	int err;
 
 	cscfg_mgr = kzalloc_obj(struct cscfg_manager);
 	if (!cscfg_mgr)
-		goto create_dev_exit_unlock;
+		return -ENOMEM;
+
+	mutex_lock(&cscfg_mutex);
 
 	/* initialise the cscfg_mgr structure */
 	INIT_LIST_HEAD(&cscfg_mgr->csdev_desc_list);
@@ -1204,6 +1198,8 @@ static int cscfg_create_device(void)
 	cscfg_mgr->load_state = CSCFG_NONE;
 	raw_spin_lock_init(&cscfg_mgr->sysfs_store_lock);
 
+	mutex_unlock(&cscfg_mutex);
+
 	/* setup the device */
 	dev = cscfg_device();
 	dev->release = cscfg_dev_release;
@@ -1213,8 +1209,6 @@ static int cscfg_create_device(void)
 	if (err)
 		put_device(dev);
 
-create_dev_exit_unlock:
-	mutex_unlock(&cscfg_mutex);
 	return err;
 }
 
-- 
2.33.0
