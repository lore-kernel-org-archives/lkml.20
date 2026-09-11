Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA8E757EA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789094861; cv=none; b=VHkW2sqJoT07gAgJzzDYwruA38jfi93P6+s/u2bgBciq4GVLplRpOMV6PAJb5Wc2PHzCVBy9975zISdMUgt6c0yk+SQn2DnTcxkhjZF54Bjq5JudD3KK5P4cuOPsugmE7RSR1lUybQLSG5IW1qFgK8miLhI27rn3/IWqhYBH5Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789094861; c=relaxed/simple;
	bh=wIpdI0LplJtNd4qCCGfH2+goMSQTWqf6VKf09p+8CJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aqaBQlhVwa+LV4PzYO3p2OvKAsdjGeUPuz1LUZti88qjUbHlMOvZYo2uIRozQgqttyN5w7+I8oOqHTGGYZ+4jkmiPTk554YwCHSkmSRpy+IqHI7mDW1BMdrJdjodYZKrPRGZIqcjv5DGSB9kqVknAGd5+Ke/5Bs74Ugz2xFtSEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQ1HSvqw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZnfK8SK7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQ1HSvqw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZnfK8SK7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B12ZMZ3447522
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/jT2QclORhv5dXCzi1KrXX
	vOQ7zvag9cAwts1fvjBDQ=; b=SQ1HSvqw648FhQcKft2w8QXlR37r/2UU+jSJUN
	6vMKLX7xZy+cKo4QwWuV/uzF7CAeh7QB6Wvr2YGEInPjgYRuK9Rc28bb5mpTXu57
	JXlgU5xa4cifzaPwrCarziXDRtq3CuKE8j08Ak1GcJxiVPddo/t5lGVdfyZMDsLm
	68/wgWSKJkzV+7Ysi5MQtuGAA2sf050b+rM9IBRX2JeIIAgcL2qXwrVbnymFmpzp
	bMkliUBLgGZ2da8X8cq+h1+/3WGQWz79B5mHqU/sloUbRAiDa6H5Jhx+27eNwFf8
	HWQHJK5nMGGy46/OrvB0S38kZqLCiDPn1MrohP98Q1qhss3A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxd8ts9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:47:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso427280a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789094857; x=1789699657; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/jT2QclORhv5dXCzi1KrXXvOQ7zvag9cAwts1fvjBDQ=;
        b=ZnfK8SK7bE0Hfjg868ewkm3nGngi6PjP56hJWUaVGgr0Vm3I8VcMgt5pAqRiO2ArdW
         89x0hC7z0cI/lbL1DYS7AIUIu7VHoOquhnQyrhC6z+MlUsqIo9AN/3haSlUHy/82j+iv
         mnWMofUXWr2WUl7cGxQxG+XTVxTjbqD0NBoEmKGpRCiDlewibNajDSfmYT1Dvp/M42jW
         mJbhkkqZQJrU4QZZVBv35LeoqWJA9lBGYN/Aafh8SNggEcweodTmg9aW8ziYnMRZf1vy
         XQXkpnHHqwTFOUfAZ9hhyNsnTeNdyn7CQDb8R96k5ePz/Mj4i5zjDfyUgBxeQN7uZ4D5
         0PPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789094857; x=1789699657;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/jT2QclORhv5dXCzi1KrXXvOQ7zvag9cAwts1fvjBDQ=;
        b=awGfwDpgNMkKbc1CRFzFADN6Ha4OD1mjxdmWPy5Vng3OfvIBlTpeXNDwfSF3N/hUzQ
         cux7DDxA8lHLa6e29cEIx9PQiOPlf2YXmCXrCC07n40xHgJLpch3MabrhYOT/sq3d3cM
         K7QXC2Qn22Sx398cHLqUg76Jm3Nl9LY3xdz3ywMNPl0MMCeh5ZYbcLwKfcYwSKtzd+Xl
         JsCkPOZnQ6MWEBjuj8TKdhvHSkLjrDVvWRVGLl0DyUmPTEhoqzmyoWOfqQEvmAX+hW4m
         05NKuoc3aOWn22TJOJBcbtSroKtl19QppU/iPRuzlZigODJfy8CZAataRODK8RgigNtH
         z2ig==
X-Forwarded-Encrypted: i=1; AKwUvByRpBI1/frC99nIp1ZMmoZ+24O7k4Z2B76zAKqmDomMJo+aQiDaKMUYrw9ywvKfrMm1m14ZaKrZ84FmWfA=@vger.kernel.org
X-Gm-Message-State: AFuF++kp6L+y9/Baxf3UeAmIHlO0KU5ZOVNekTE4ZvvEf4AyDj+KiVbj
	o3y2s5PzhzI+YZEdOfDi4awGGoyw4QmC3jQhwxAEJOumk8ydWWidsWIa+KankbGPc1ESp29ixK1
	5Z55QkXG2EzU5e2z44gmcJbWH4s9ol7xfm3ugiPqw9XLjx3w6vM9hYImGsBY18/5OeDs120jm4c
	g=
X-Gm-Gg: AYBFou0/SrGJZi1/QS4kUMxKKIKqAc5niVWfAxZTPxLFv8hzu5q9yqsS92BifW3ynK2
	Qqhq91zCXccx0Df8uJnGVv5v4iIEvVrAgbPA2WWJg5536oCEntke3y5BElegClBhWwNwK+dHm4o
	cMm/3Oj+AsMb8cVDbeL74WSrzdglLUmXi7dwgMnMUXX3mYIhBqHV+quzW53uK3hDOSbusErfows
	Sf9O0ZeDC3j7T7QeXy6NosSZCoHIXPRX2q0Ten6XgJEp/iTmIsVepIe9a5syK1sRFFCL/XXtgKi
	hIlWtn1Ugj+IZulq5biXCzaXOkM7y8+ZffLtvs+jtBI2KQ+TF6NSEcSzAHokA+sFgiKI7Pk2d7l
	2kOUJRCUDLKJHbhdTS8Zzc2JC6l+v7tM=
X-Received: by 2002:a05:6a21:3391:b0:3cc:b26a:7686 with SMTP id adf61e73a8af0-3daed1515f5mr4204147637.6.1789094857071;
        Thu, 10 Sep 2026 19:47:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:3391:b0:3cc:b26a:7686 with SMTP id adf61e73a8af0-3daed1515f5mr4204063637.6.1789094856505;
        Thu, 10 Sep 2026 19:47:36 -0700 (PDT)
Received: from hu-renjiang-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm4000177c88.12.2026.09.10.19.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 19:47:35 -0700 (PDT)
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 08:17:29 +0530
Subject: [PATCH] media: qcom: venus: reduce impact of verbose firmware
 logging
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-media-qcom-venus-fw-log-perf-v1-1-b8fcc69f1055@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMBro2oC/yWNSQ6DMBAEv4LmnJG8sThfiTjYeEwshc0GEgnx9
 zjh1tWHqgMSxUAJ7sUBkfaQwjRm4LcCuqcZe8LgMoNgomKacxzIBYNLNw2407gl9G98TT3OFD1
 yo10tWeOkKyEr5kg+fP76R3txpGXLlfU6wZpEmGVDWO+FF9bbTpal6kyluVaNYpLVQiuhrHZEv
 +WEgvY8vy+JOpK6AAAA
X-Change-ID: 20260911-media-qcom-venus-fw-log-perf-1a9d7308d3d5
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Renjiang Han <renjiang.han@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789094853; l=15400;
 i=renjiang.han@oss.qualcomm.com; s=20241001; h=from:subject:message-id;
 bh=wIpdI0LplJtNd4qCCGfH2+goMSQTWqf6VKf09p+8CJU=;
 b=Iz/qKHm420UoGtvygSbHSytVM/OGsQEBdXifgtB3IybjeJtgJa1foYeIC+dyuEi8Iib88xQ7t
 DrV9jV0aklADP+xF5O/sbdKAhgqY48QHuETOgHYJVqdPEVCkSjDRZCf
X-Developer-Key: i=renjiang.han@oss.qualcomm.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-Proofpoint-ORIG-GUID: fGGVQSmIz2KJn6rzar0wVfNn5DsHUGLU
X-Proofpoint-GUID: fGGVQSmIz2KJn6rzar0wVfNn5DsHUGLU
X-Authority-Analysis: v=2.4 cv=PchqFShd c=1 sm=1 tr=0 ts=6aa36bc9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=gJ9IjCNN_hMKb9KTEusA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDAzMyBTYWx0ZWRfXygYjg0esmJAv
 Y/XHnekacKQqLdFCyTkqsFYKnCzeY8oowcmiZtTonmqrkAXiG94TQKRLH2wpsSo+PXQWJU6a9gF
 SqPC6ey7WppDpJqHqftROQF4OImrNwHqZm3sO6aru+VCMl9Zek8mISL0iOGLBHL7oMtrFjR6TlK
 fBYhYJBtKj4ni/blFGC1jYKDvTLdLS3rtXKSEZ0S89lSPRVtEHhs7Yo+6MD0ZnEOtoFG1wP/00Y
 NFwvlVQ/k0jBCzOxxuKPclWA3DpenaoywdfMCi3lym+Pnb7bBxIRH9DKB9AsaYpMeu/X8xomFy2
 QzmlL/8Oee6ud4q/NoHw9HW5lOx2JJYmsI5y6GesaDzcUvmKbQr9lLDr6aaA0hneoiyNqqWIpRv
 oyYLSrxmeDjWNQQotFrsiQ3xSTUOvLgX5u355He7TOjlEORLvAFdwSeeHAPFuc+0ccFNis27Zlf
 ni2o2E5dWuSy1EkTjgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDAzMyBTYWx0ZWRfXxYVDqwPnASoL
 DDyPywqBXfWSUQHOXiSBtfXjDOsBStcUDRxePUAwmSV3fSYDU4DRIeri7ZEYYUlhfpnrLENIfrq
 mPLm4i+3NlQKis29f6Qw1JDTLdTIwwA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110033

Firmware debug logging can generate a large amount of traffic. When
verbose firmware logging is enabled, debug queue packets can delay
normal HFI responses enough to hit the existing response timeout.

Increase the HFI response timeout, power collapse delay timeout, and
runtime PM autosuspend delay when fw_level enables log classes beyond
error and fatal. Restore the default values when fw_level is changed
back to error and fatal only.

Print firmware error and fatal messages with dev_err_ratelimited().
Other firmware debug messages continue to use dev_dbg(). Bound firmware
log printing by the packet size so messages do not need to be NUL
terminated by firmware.

Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
---
Verbose firmware logging can generate a large amount of debug queue
traffic. When many firmware log classes are enabled, normal HFI response
messages may be delayed behind debug packets and synchronous HFI
commands may hit their response timeout.

Reduce that impact by increasing the HFI response timeout, power
collapse delay timeout, and runtime PM autosuspend delay when fw_level
enables verbose firmware logs beyond the default error and fatal levels.
Restore the default values when fw_level is changed back to error and
fatal only.

Firmware error and fatal messages are printed with
dev_err_ratelimited(), so important firmware errors remain visible
without enabling dynamic debug. Other firmware debug messages continue
to use dev_dbg(). Firmware log printing is bounded by the packet size
and no longer depends on firmware providing a NUL-terminated string.
---
 drivers/media/platform/qcom/venus/core.c      |  5 +-
 drivers/media/platform/qcom/venus/core.h      |  8 +++
 drivers/media/platform/qcom/venus/dbgfs.c     | 51 +++++++++++++-
 drivers/media/platform/qcom/venus/hfi.c       | 10 +--
 drivers/media/platform/qcom/venus/hfi_venus.c | 95 ++++++++++++++++++---------
 drivers/media/platform/qcom/venus/vdec.c      |  2 +-
 drivers/media/platform/qcom/venus/venc.c      |  2 +-
 7 files changed, 133 insertions(+), 40 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae75336af17bf630712417e34caa96b..2282926369d1e04b9a4bd990acacdf3aa344f614 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -429,6 +429,8 @@ static int venus_probe(struct platform_device *pdev)
 
 	INIT_LIST_HEAD(&core->instances);
 	mutex_init(&core->lock);
+	core->hw_rsp_timeout = VENUS_HW_RSP_TIMEOUT_MS;
+	core->pc_delay_timeout = VENUS_PC_DELAY_TIMEOUT_US;
 	INIT_DELAYED_WORK(&core->work, venus_sys_error_handler);
 	init_waitqueue_head(&core->sys_err_done);
 
@@ -545,6 +547,8 @@ static void venus_remove(struct platform_device *pdev)
 	ret = hfi_core_deinit(core, true);
 	WARN_ON(ret);
 
+	venus_dbgfs_deinit(core);
+
 	venus_shutdown(core);
 	of_platform_depopulate(dev);
 
@@ -564,7 +568,6 @@ static void venus_remove(struct platform_device *pdev)
 
 	mutex_destroy(&core->pm_lock);
 	mutex_destroy(&core->lock);
-	venus_dbgfs_deinit(core);
 }
 
 static void venus_core_shutdown(struct platform_device *pdev)
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 46705a6667762e8975e32947b4cb3355e20754d0..8a9649745fa18bcba69baf29c3ed6242fd68bd87 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -23,6 +23,10 @@
 #define VDBGH	"VenusHigh: "
 #define VDBGFW	"VenusFW  : "
 
+#define VENUS_HW_RSP_TIMEOUT_MS		1000
+#define VENUS_AUTOSUSPEND_DELAY_MS	2000
+#define VENUS_PC_DELAY_TIMEOUT_US	(100 * 1500)
+
 #define VIDC_CLKS_NUM_MAX		4
 #define VIDC_VCODEC_CLKS_NUM_MAX	2
 #define VIDC_RESETS_NUM_MAX		2
@@ -169,6 +173,8 @@ struct venus_format {
  * @state:	the state of the venus core
  * @done:	a completion for sync HFI operations
  * @error:	an error returned during last HFI sync operations
+ * @hw_rsp_timeout: hardware response timeout
+ * @pc_delay_timeout: power collapse delay timeout
  * @sys_error:	an error flag that signal system error event
  * @sys_err_done: a waitqueue to wait for system error recovery end
  * @core_ops:	the core operations
@@ -230,6 +236,8 @@ struct venus_core {
 	unsigned int state;
 	struct completion done;
 	unsigned int error;
+	unsigned int hw_rsp_timeout;
+	unsigned int pc_delay_timeout;
 	unsigned long sys_error;
 	wait_queue_head_t sys_err_done;
 	const struct hfi_core_ops *core_ops;
diff --git a/drivers/media/platform/qcom/venus/dbgfs.c b/drivers/media/platform/qcom/venus/dbgfs.c
index 726f4b730e69bc07fa925c747bfe9d7cf434b54a..4fd44b4a7e054503632e1d6f01f90e151532967b 100644
--- a/drivers/media/platform/qcom/venus/dbgfs.c
+++ b/drivers/media/platform/qcom/venus/dbgfs.c
@@ -5,6 +5,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/fault-inject.h>
+#include <linux/pm_runtime.h>
 
 #include "core.h"
 
@@ -12,10 +13,58 @@
 DECLARE_FAULT_ATTR(venus_ssr_attr);
 #endif
 
+static int venus_fw_level_get(void *data, u64 *val)
+{
+	*val = READ_ONCE(venus_fw_debug);
+
+	return 0;
+}
+
+static int venus_fw_level_set(void *data, u64 val)
+{
+	struct venus_core *core = data;
+	bool verbose;
+	u32 fw_debug;
+
+	fw_debug = (u32)val;
+	verbose = fw_debug & ~(HFI_DEBUG_MSG_ERROR | HFI_DEBUG_MSG_FATAL);
+	WRITE_ONCE(venus_fw_debug, fw_debug);
+
+	if (verbose) {
+		WRITE_ONCE(core->hw_rsp_timeout, 4 * VENUS_HW_RSP_TIMEOUT_MS);
+		WRITE_ONCE(core->pc_delay_timeout, 4 * VENUS_PC_DELAY_TIMEOUT_US);
+
+		if (core->dev_dec)
+			pm_runtime_set_autosuspend_delay(core->dev_dec,
+							 4 * VENUS_AUTOSUSPEND_DELAY_MS);
+
+		if (core->dev_enc)
+			pm_runtime_set_autosuspend_delay(core->dev_enc,
+							 4 * VENUS_AUTOSUSPEND_DELAY_MS);
+	} else {
+		WRITE_ONCE(core->hw_rsp_timeout, VENUS_HW_RSP_TIMEOUT_MS);
+		WRITE_ONCE(core->pc_delay_timeout, VENUS_PC_DELAY_TIMEOUT_US);
+
+		if (core->dev_dec)
+			pm_runtime_set_autosuspend_delay(core->dev_dec,
+							 VENUS_AUTOSUSPEND_DELAY_MS);
+
+		if (core->dev_enc)
+			pm_runtime_set_autosuspend_delay(core->dev_enc,
+							 VENUS_AUTOSUSPEND_DELAY_MS);
+	}
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(venus_fw_level_fops,
+			 venus_fw_level_get, venus_fw_level_set, "0x%08llx\n");
+
 void venus_dbgfs_init(struct venus_core *core)
 {
 	core->root = debugfs_create_dir("venus", NULL);
-	debugfs_create_x32("fw_level", 0644, core->root, &venus_fw_debug);
+	debugfs_create_file("fw_level", 0644, core->root, core,
+			    &venus_fw_level_fops);
 
 #ifdef CONFIG_FAULT_INJECTION
 	fault_create_debugfs_attr("fail_ssr", core->root, &venus_ssr_attr);
diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
index 675e6fd1e9fae40177349c0bc68f38c326b9aa25..615f30d86c7bd86087ef274d2cfdbc5dd74baee9 100644
--- a/drivers/media/platform/qcom/venus/hfi.c
+++ b/drivers/media/platform/qcom/venus/hfi.c
@@ -15,8 +15,6 @@
 #include "hfi_cmds.h"
 #include "hfi_venus.h"
 
-#define TIMEOUT		msecs_to_jiffies(1000)
-
 static u32 to_codec_type(u32 pixfmt)
 {
 	switch (pixfmt) {
@@ -49,6 +47,7 @@ static u32 to_codec_type(u32 pixfmt)
 
 int hfi_core_init(struct venus_core *core)
 {
+	unsigned int timeout;
 	int ret = 0;
 
 	mutex_lock(&core->lock);
@@ -62,7 +61,8 @@ int hfi_core_init(struct venus_core *core)
 	if (ret)
 		goto unlock;
 
-	ret = wait_for_completion_timeout(&core->done, TIMEOUT);
+	timeout = READ_ONCE(core->hw_rsp_timeout);
+	ret = wait_for_completion_timeout(&core->done, msecs_to_jiffies(timeout));
 	if (!ret) {
 		ret = -ETIMEDOUT;
 		goto unlock;
@@ -140,9 +140,11 @@ int hfi_core_trigger_ssr(struct venus_core *core, u32 type)
 
 static int wait_session_msg(struct venus_inst *inst)
 {
+	unsigned int timeout;
 	int ret;
 
-	ret = wait_for_completion_timeout(&inst->done, TIMEOUT);
+	timeout = READ_ONCE(inst->core->hw_rsp_timeout);
+	ret = wait_for_completion_timeout(&inst->done, msecs_to_jiffies(timeout));
 	if (!ret)
 		return -ETIMEDOUT;
 
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index bd82066bb6e77f68ac3fe1440a8b5429ad62a192..10cf9a775d8bf3781150c830583db4b190146be2 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -132,7 +132,6 @@ struct venus_hfi_device {
 static bool venus_pkt_debug;
 int venus_fw_debug = HFI_DEBUG_MSG_ERROR | HFI_DEBUG_MSG_FATAL;
 static bool venus_fw_low_power_mode = true;
-static int venus_hw_rsp_timeout = 1000;
 static bool venus_fw_coverage;
 
 static void venus_set_state(struct venus_hfi_device *hdev,
@@ -949,7 +948,7 @@ static int venus_sys_set_default_properties(struct venus_hfi_device *hdev)
 	const struct venus_resources *res = hdev->core->res;
 	int ret;
 
-	ret = venus_sys_set_debug(hdev, venus_fw_debug);
+	ret = venus_sys_set_debug(hdev, READ_ONCE(venus_fw_debug));
 	if (ret)
 		dev_warn(dev, "setting fw debug msg ON failed (%d)\n", ret);
 
@@ -985,29 +984,52 @@ static int venus_session_cmd(struct venus_inst *inst, u32 pkt_type, bool sync)
 	return venus_iface_cmdq_write(hdev, &pkt, sync);
 }
 
-static void venus_flush_debug_queue(struct venus_hfi_device *hdev)
+static int venus_flush_debug_queue(struct venus_hfi_device *hdev)
 {
 	struct device *dev = hdev->core->dev;
 	void *packet = hdev->dbg_buf;
+	int num_pkts = 0;
 
 	while (!venus_iface_dbgq_read(hdev, packet)) {
 		struct hfi_msg_sys_coverage_pkt *pkt = packet;
 
+		num_pkts++;
+
+		if (pkt->hdr.size <= sizeof(pkt->hdr))
+			continue;
+
+		if (pkt->hdr.size > IFACEQ_VAR_HUGE_PKT_SIZE)
+			continue;
+
 		if (pkt->hdr.pkt_type != HFI_MSG_SYS_COV) {
-			struct hfi_msg_sys_debug_pkt *pkt = packet;
+			struct hfi_msg_sys_debug_pkt *dbg_pkt = packet;
+			u32 msg_size;
+
+			if (pkt->hdr.size <= sizeof(*dbg_pkt))
+				continue;
 
-			dev_dbg(dev, VDBGFW "%s", pkt->msg_data);
+			msg_size = min_t(u32, pkt->hdr.size - sizeof(*dbg_pkt), dbg_pkt->msg_size);
+
+			if (dbg_pkt->msg_type & (HFI_DEBUG_MSG_ERROR | HFI_DEBUG_MSG_FATAL))
+				dev_err_ratelimited(dev, VDBGFW "%.*s",
+						    (int)msg_size, dbg_pkt->msg_data);
+			else
+				dev_dbg(dev, VDBGFW "%.*s", (int)msg_size, dbg_pkt->msg_data);
 		}
 	}
+
+	return num_pkts;
 }
 
 static int venus_prepare_power_collapse(struct venus_hfi_device *hdev,
 					bool wait)
 {
-	unsigned long timeout = msecs_to_jiffies(venus_hw_rsp_timeout);
 	struct hfi_sys_pc_prep_pkt pkt;
+	unsigned long timeout;
 	int ret;
 
+	timeout = msecs_to_jiffies(READ_ONCE(hdev->core->hw_rsp_timeout));
+
 	init_completion(&hdev->pwr_collapse_prep);
 
 	pkt_sys_pc_prep(&pkt);
@@ -1091,6 +1113,8 @@ static irqreturn_t venus_isr_thread(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);
 	const struct venus_resources *res;
+	int num_debug_pkts;
+	int num_msg_pkts;
 	void *pkt;
 	u32 msg_ret;
 
@@ -1100,31 +1124,35 @@ static irqreturn_t venus_isr_thread(struct venus_core *core)
 	res = hdev->core->res;
 	pkt = hdev->pkt_buf;
 
-
-	while (!venus_iface_msgq_read(hdev, pkt)) {
-		msg_ret = hfi_process_msg_packet(core, pkt);
-		switch (msg_ret) {
-		case HFI_MSG_EVENT_NOTIFY:
-			venus_process_msg_sys_error(hdev, pkt);
-			break;
-		case HFI_MSG_SYS_INIT:
-			venus_hfi_core_set_resource(core, res->vmem_id,
-						    res->vmem_size,
-						    res->vmem_addr,
-						    hdev);
-			break;
-		case HFI_MSG_SYS_RELEASE_RESOURCE:
-			complete(&hdev->release_resource);
-			break;
-		case HFI_MSG_SYS_PC_PREP:
-			complete(&hdev->pwr_collapse_prep);
-			break;
-		default:
-			break;
+	do {
+		num_msg_pkts = 0;
+
+		while (!venus_iface_msgq_read(hdev, pkt)) {
+			msg_ret = hfi_process_msg_packet(core, pkt);
+			num_msg_pkts++;
+			switch (msg_ret) {
+			case HFI_MSG_EVENT_NOTIFY:
+				venus_process_msg_sys_error(hdev, pkt);
+				break;
+			case HFI_MSG_SYS_INIT:
+				venus_hfi_core_set_resource(core, res->vmem_id,
+							    res->vmem_size,
+							    res->vmem_addr,
+							    hdev);
+				break;
+			case HFI_MSG_SYS_RELEASE_RESOURCE:
+				complete(&hdev->release_resource);
+				break;
+			case HFI_MSG_SYS_PC_PREP:
+				complete(&hdev->pwr_collapse_prep);
+				break;
+			default:
+				break;
+			}
 		}
-	}
 
-	venus_flush_debug_queue(hdev);
+		num_debug_pkts = venus_flush_debug_queue(hdev);
+	} while (num_msg_pkts || num_debug_pkts);
 
 	return IRQ_HANDLED;
 }
@@ -1227,7 +1255,7 @@ static int venus_session_init(struct venus_inst *inst, u32 session_type,
 	struct hfi_session_init_pkt pkt;
 	int ret;
 
-	ret = venus_sys_set_debug(hdev, venus_fw_debug);
+	ret = venus_sys_set_debug(hdev, READ_ONCE(venus_fw_debug));
 	if (ret)
 		goto err;
 
@@ -1584,6 +1612,7 @@ static int venus_suspend_3xx(struct venus_core *core)
 	struct venus_hfi_device *hdev = to_hfi_priv(core);
 	struct device *dev = core->dev;
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
+	unsigned int pc_delay_timeout;
 	u32 ctrl_status;
 	bool val;
 	int ret;
@@ -1612,8 +1641,10 @@ static int venus_suspend_3xx(struct venus_core *core)
 	 * 2. Send a command to prepare for power collapse.
 	 * 3. Check for WFI and PC_READY bits.
 	 */
+	pc_delay_timeout = READ_ONCE(core->pc_delay_timeout);
+
 	ret = readx_poll_timeout(venus_cpu_and_video_core_idle, hdev, val, val,
-				 1500, 100 * 1500);
+				 1500, pc_delay_timeout);
 	if (ret) {
 		dev_err(dev, "wait for cpu and video core idle fail (%d)\n", ret);
 		return ret;
@@ -1626,7 +1657,7 @@ static int venus_suspend_3xx(struct venus_core *core)
 	}
 
 	ret = readx_poll_timeout(venus_cpu_idle_and_pc_ready, hdev, val, val,
-				 1500, 100 * 1500);
+				 1500, pc_delay_timeout);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 6a43ea191da15fdfdbbf0a136b11ef85bcc7a73d..cb74318c6408f49354a75b768008e2edf2a347c3 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1817,7 +1817,7 @@ static int vdec_probe(struct platform_device *pdev)
 	core->dev_dec = dev;
 
 	video_set_drvdata(vdev, core);
-	pm_runtime_set_autosuspend_delay(dev, 2000);
+	pm_runtime_set_autosuspend_delay(dev, VENUS_AUTOSUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 79acf7c1ec9a3a1b36f1a5e83af1f6c330802f08..e0350e6db45e72d47536b7539deca2f728393bea 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1593,7 +1593,7 @@ static int venc_probe(struct platform_device *pdev)
 	core->dev_enc = dev;
 
 	video_set_drvdata(vdev, core);
-	pm_runtime_set_autosuspend_delay(dev, 2000);
+	pm_runtime_set_autosuspend_delay(dev, VENUS_AUTOSUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 

---
base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
change-id: 20260911-media-qcom-venus-fw-log-perf-1a9d7308d3d5

Best regards,
-- 
Renjiang Han <renjiang.han@oss.qualcomm.com>

