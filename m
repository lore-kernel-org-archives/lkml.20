Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F249E4499B0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328187; cv=none; b=n/OjJWPA3GLskFlzp+W4uBxuGPcr3gNGJuxzOiCUQXtWvHbOWLOiHmaMJy6tIqvaaoYo9BLDYo2q+rpZj6Hb2VD5rTDfXS+KwRwQ9HCalEnxHvHnhsLg8TEsXKD/mdm2hbP24vNyN3yi7rGAhMa9iUcSJCYG4e9ih0/Z5brkUpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328187; c=relaxed/simple;
	bh=1K3Py6we5fiOyv3lBbiQiqnDRg9t78ygXbnOMxEfISw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YaFydB8KEwPh8qjZaXZlJfrbfHRCfpBhfjyRkJXBrmuFSI5WmY9Uqe3THJ3hMYzjcDxGGc2LFhn2lHNgMi7nil2Ww1T+qpk/xwg5ZKRnNMfGo5ATKpDqedHHTgxlWjiXOnB20agpUJ6Gv7pSSojRYcJe5omLfvjWpIlBGI68HGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ztf6pQyg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E52Sx7Jo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ztf6pQyg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E52Sx7Jo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YYK5208416
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YrwhiYuUO7IOf+5JLjyeZ0
	9blpXIFVfo4O+6DfIs030=; b=Ztf6pQygkd3lyIz9MZ/Swyly0T22R+f8q/mPFf
	+kp+saA9C8Oc7ad0FuBqCJCahqqt+dzKySCkxS+J91It9JxrqI9Tbq88M7+oLP50
	q7mM6TbdaBwdn5nKznLl+v4kNYDg7ZSFLPAE++TVWTRNRuKulJIXNz5X1s+9iglv
	yt/jZTUx1ITilg65JOGNt9jwVTr4ZHSen8hVr6ojGtQEQorLJPZhtscfaULacONG
	14H+Gj0UMAUipAg8/WQYsWf84qLuM2YCpCYWCIfWzqZ4UHbgSH+FtHZIvyE8RHWC
	L+YVJJX4ieb7EJhwN6KSZdX4w8KoUPRLcw5rJlv13j/vbzYQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898tw0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:22:58 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1384427c3efso1020174c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790328178; x=1790932978; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YrwhiYuUO7IOf+5JLjyeZ09blpXIFVfo4O+6DfIs030=;
        b=E52Sx7JobGbU7Fn6qa8qlJyCRBoreKlq4qhfWIkk0nHjiJcJ34st7mIDofQyOpAjzF
         4LlTKlVTPIfKN1mkeHCYrIMnz00yw+J0FOhFw7HZFwdJM/fsCqULRS3EQYUsEzTZJiGW
         15FmnNHrdaZ4fJ5PnuB5TM6yk+H0SmZJ37S9oSO38sQfuUyTJ/7eSFD7fbAyZKxnpwux
         bVBpC0u3MsS6czxNtX5FrzJ9ZmXjJ2k0Y5ZGs8onHizZzqHDZnrtydc3kg65efsNrICm
         NCIuO+y4GfCleLN0K44vKfxggDM2zvn0E5VBFuCln5w1VEEGnbYw/sVCC3IFKn+SR+o6
         ZFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790328178; x=1790932978;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YrwhiYuUO7IOf+5JLjyeZ09blpXIFVfo4O+6DfIs030=;
        b=N+0XZ2moppaghiQOfHEZefqio2hXaKAyDuBO9ptFs77H3oL/9QJJuvM7YKtc7fN09z
         J0zDIDk373e/+OU3Q/WBu6Pqu1bushPGr0ulxW7pbCJoc8PqAk/TGEVPCV4b6l7A6PFy
         lXY2H97qxjJSzqI0W7Yz4BQIKKssjWZ1c8Cp3g7TiLyLkEMe+fBVYJXGeNV77JYeLgjj
         4zaB3qqvg9O3oIjDzqC5Ob1UDsL0ZpyK2wB0cNblmXSmYt2t8wYnfhRqZlDsxdE/6yBk
         wmR5XQLitXx0UqCVTb7Hf9xXwFit8S7XcMDCwtMAZTNYxOpYyWlIfRESEJpki+1eIbiQ
         bpzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKj8vZgqnmK3xKWZwfEkf8t9GmhIAV3cH1+SJK01BSNINKCy2ZRmhcx4KXirSr2ONnf8ZRTpG0DUq3Nj0=@vger.kernel.org
X-Gm-Message-State: AFuF++lo7coHWs9WxNukPyvkurVegoZSEcYdRRgLnDMx8DNq5q/uYZuz
	9fv0R7BrPmmWWMkojsDkSVgP5VmDT8hOfSMNhjcvH6qrttSSLqgIxtPzYptoLR6GIrzVr+GSDsr
	yGH7TCdKMs6YUSB4ByoPa6M/OY9DQbn6VMKLLuGwGDS0nz+Ep2/fjhi3HhdAp/ekbg/55harSDv
	I=
X-Gm-Gg: AYBFou3fu5M+PrLpxSsTjhJAdcdJ62uhd6dh2bngE4NFHgTIz/EK2BY4ArFUxzh+sVo
	nZPxt845MMRGEJ4oIG1i5QXR6MlkvgALOfpEShGpqYh36QD05VKqwvu/lpc8wjeuA2a1djN3dW2
	DdZoeYWgsmZlpqEFBjzsmIiDYJbWzW7tUF6BO8PX9UGMx3z+8jWAP3FiPdRDSOe9rgzL7RJ7RaS
	P88i3m/C0dNUjMCtkZbNCsY5Sr/hvzwF/xBw4G8fWz+X6t4iQTbXIAD+WWeXd/lL3zdfpjm4jHA
	iDGknRggn1Rb2yox/ISNtp49un/McE9hlWQP03YBoqh0CDmmPwm+hW8BMrMEZw13VjseM9vPyGb
	f+eGnQEbweeZemxipCMhdrtetOW7GvEZfqYE=
X-Received: by 2002:a05:7022:28b:20b0:130:6c8f:5a87 with SMTP id a92af1059eb24-14503f2e50dmr4487646c88.13.1790328177605;
        Fri, 25 Sep 2026 02:22:57 -0700 (PDT)
X-Received: by 2002:a05:7022:28b:20b0:130:6c8f:5a87 with SMTP id a92af1059eb24-14503f2e50dmr4487608c88.13.1790328176628;
        Fri, 25 Sep 2026 02:22:56 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad8e43d2sm5391831c88.12.2026.09.25.02.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:22:56 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:52:49 +0530
Subject: [PATCH v3] slimbus: qcom-ngd-ctrl: Implement disable_stream
 callback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-slim-disable-stream-support-v3-1-cdc8171f27a2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGg9tmoC/32NwQ6CMBAFf8X0bElpEakn/8NwKGWRNUCxW4iG8
 O8W9OzlJZO8zCyMwCMQuxwW5mFGQjdEUMcDs60Z7sCxjsykkLkohOLUYc9rJFN1wCl4MD2naRy
 dDzxTJ60zkebi3LBoGD00+Nrtt/LLNFUPsGFTbo8WKTj/3vOz3H6/Uir+lmbJU24lFI21ympdX
 x1R8pxMZ13fJ3FYua7rB+FiC6XfAAAA
X-Change-ID: 20260803-slim-disable-stream-support-43599401607f
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, mukesh.savaliya@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790328173; l=5849;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=1K3Py6we5fiOyv3lBbiQiqnDRg9t78ygXbnOMxEfISw=;
 b=c5CNV1Jwmn2vZ+8AEs8zoYOulRBqOhVE48D9xuwl0ml872+r9M4SrFIMuk4zT25Q4ThdndrRu
 R2FiWeCGis1CWzgOb74EhXQmBA+u/xnq1sCpVYZd+MXhq7n4PkGxs8P
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNyBTYWx0ZWRfXwj5w5tYauAM/
 CwybAiexvTCN3xVJ3PEr5YzyjhdREd9v8AtnnnNGuuy6nMveqJJffdAFtsxKsjjAugSu0SK4VV1
 QckqjqRWjUiah1dXjC/ytgeDGPor8wC3oiNzQj2SPyVX5hVEOP/SuM1AUrmp9+6BDndIRTz77qq
 Cd4+oseZXdiZcqDRqimj7FaQscvgpx8OtCi5nkCUsknlLKArgY66NsJwL8azcGr+s18M+YrKrG2
 lxoBU7B/aJRDLn7v1/CTGr4d7ay5jkktZPZ0DEQ4XVNZKl2cGm4D5TEI9yNLIH4ih1QQ8JuJ3av
 gwO8+ZP4WM1eVmaZm2N4K/4PvsYYneI++G0ja8sMnHaqzWZS4E3/gblJ0akslb0W0YgyYc9dH5w
 Zz/Svz1JnEhQhTMuDNaKO+rknVBeBuB5Y5+USL1zCCUbxRjEVvUlThj3qk4UBZYFjemKwMizsIT
 i8zIHCMexDP0nNctYEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNyBTYWx0ZWRfXwqJhIWhI3Aos
 pGJjGAN3Mtk8eviQfqFBKKsYZtKRr7CKgNMtaVlH+jgTYekR6OzDWvDAG79M/jhK8oyoXqzWIlH
 /9PYRITZ4m1zQcPDU+f+yZFNDWhMo7I=
X-Proofpoint-GUID: JuiRkPSlXe7VBPnFU8ZVbpD1szhfg9NE
X-Proofpoint-ORIG-GUID: JuiRkPSlXe7VBPnFU8ZVbpD1szhfg9NE
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab63d72 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=kKA2uLVnAdZqmg0bn4kA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250037

Switching a channel to a new frequency without first disabling the stream
causes the channel to be re-enabled without a clean shutdown, leading to a
crash on the DSP subsystem.

Implement qcom_slim_ngd_disable_stream() so clients can properly close a
channel before switching to a new frequency.

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Changes in v3:
- Handle -EREMOTEIO as success during stream disable.
- Drop copyright update changes.
- Link to v2: https://patch.msgid.link/20260810-slim-disable-stream-support-v2-1-c2e8fcc3c99d@oss.qualcomm.com

Changes in v2:
- Rewrite commit description for clarity.
- Fix initializers: use { 0 } instead of {0} and {0,}.
- Use reverse christmas tree ordering for local variable declarations.
- Replace open-coded shift/mask with FIELD_PREP() and GENMASK-based defines.
- Add SLIM_MSG_HDR_LEN macro to replace magic number +4 in txn.rl assignments.
- Fix dev_err format strings: add spaces after colons and commas.
- Update enum slim_ch_control comment to kernel-doc format with @member tags.
- Link to v1: https://lore.kernel.org/linux-arm-msm/247e4ce7-1ba2-43b8-8a11-ec70f99a4fc1@linaro.org/T/#m3b50aa43a6493f8d3b607b1607b37bf14b199f69
---
 drivers/slimbus/qcom-ngd-ctrl.c | 78 +++++++++++++++++++++++++++++++++++++++++
 drivers/slimbus/slimbus.h       | 12 +++++++
 2 files changed, 90 insertions(+)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index eb0ccb31e907..f0a402069aea 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2011-2017, The Linux Foundation. All rights reserved.
 // Copyright (c) 2018, Linaro Limited
 
+#include <linux/bitfield.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -87,6 +88,10 @@
 #define SLIM_ROOT_FREQ	24576000
 #define LADDR_RETRY	5
 
+#define SLIM_CHAN_CTRL_CMD		GENMASK(7, 6)
+#define SLIM_CHAN_CTRL_LADDR		GENMASK(4, 0)
+#define SLIM_MSG_HDR_LEN		4
+
 /* Per spec.max 40 bytes per received message */
 #define SLIM_MSGQ_BUF_LEN	40
 #define QCOM_SLIM_NGD_DESC_NUM	32
@@ -1086,6 +1091,78 @@ static int qcom_slim_ngd_enable_stream(struct slim_stream_runtime *rt)
 	return ret;
 }
 
+static int qcom_slim_ngd_disable_stream(struct slim_stream_runtime *rt)
+{
+	struct slim_device *sdev = rt->dev;
+	struct slim_controller *ctrl = sdev->ctrl;
+	struct slim_msg_txn txn = { 0 };
+	struct slim_val_inf msg = { 0 };
+	u8 wbuf[SLIM_MSGQ_BUF_LEN];
+	u8 rbuf[SLIM_MSGQ_BUF_LEN];
+	int i, ret;
+
+	txn.mt = SLIM_MSG_MT_DEST_REFERRED_USER;
+	txn.dt = SLIM_MSG_DEST_LOGICALADDR;
+	txn.la = SLIM_LA_MGR;
+	txn.ec = 0;
+	txn.msg = &msg;
+	txn.msg->num_bytes = 0;
+	txn.msg->wbuf = wbuf;
+	txn.msg->rbuf = rbuf;
+
+	for (i = 0; i < rt->num_ports; i++) {
+		struct slim_port *port = &rt->ports[i];
+
+		if (txn.msg->num_bytes == 0) {
+			wbuf[txn.msg->num_bytes++] =
+				FIELD_PREP(SLIM_CHAN_CTRL_CMD, SLIM_CH_REMOVE) |
+				FIELD_PREP(SLIM_CHAN_CTRL_LADDR, sdev->laddr);
+
+			ret = slim_alloc_txn_tid(ctrl, &txn);
+			if (ret) {
+				dev_err(&sdev->dev, "Fail to allocate TID ret:%d\n", ret);
+				return ret;
+			}
+			wbuf[txn.msg->num_bytes++] = txn.tid;
+		}
+		wbuf[txn.msg->num_bytes++] = port->ch.id;
+	}
+
+	txn.mc = SLIM_USR_MC_CHAN_CTRL;
+	txn.rl = txn.msg->num_bytes + SLIM_MSG_HDR_LEN;
+	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
+	if (ret) {
+		slim_free_txn_tid(ctrl, &txn);
+		/* Controller restarting, the channels are gone anyway */
+		if (ret == -EREMOTEIO)
+			return 0;
+		dev_err(&sdev->dev, "TX timed out: MC: 0x%x, mt: 0x%x, laddr: 0x%x, ret: %d\n",
+			txn.mc, txn.mt, sdev->laddr, ret);
+		return ret;
+	}
+
+	txn.mc = SLIM_USR_MC_RECONFIG_NOW;
+	txn.msg->num_bytes = 2;
+	wbuf[1] = sdev->laddr;
+	txn.rl = txn.msg->num_bytes + SLIM_MSG_HDR_LEN;
+
+	ret = slim_alloc_txn_tid(ctrl, &txn);
+	if (ret) {
+		dev_err(&sdev->dev, "Fail to allocate TID ret:%d\n", ret);
+		return ret;
+	}
+
+	wbuf[0] = txn.tid;
+	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
+	if (ret) {
+		slim_free_txn_tid(ctrl, &txn);
+		dev_err(&sdev->dev, "TX timed out: MC: 0x%x, mt: 0x%x, laddr: 0x%x, ret: %d\n",
+			txn.mc, txn.mt, sdev->laddr, ret);
+	}
+
+	return ret;
+}
+
 static int qcom_slim_ngd_get_laddr(struct slim_controller *ctrl,
 				   struct slim_eaddr *ea, u8 *laddr)
 {
@@ -1625,6 +1702,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	ctrl->ctrl.clkgear = SLIM_MAX_CLK_GEAR;
 	ctrl->ctrl.get_laddr = qcom_slim_ngd_get_laddr;
 	ctrl->ctrl.enable_stream = qcom_slim_ngd_enable_stream;
+	ctrl->ctrl.disable_stream = qcom_slim_ngd_disable_stream;
 	ctrl->ctrl.xfer_msg = qcom_slim_ngd_xfer_msg;
 	ctrl->ctrl.wakeup = NULL;
 	ctrl->state = QCOM_SLIM_NGD_CTRL_DOWN;
diff --git a/drivers/slimbus/slimbus.h b/drivers/slimbus/slimbus.h
index 3a03993c3ac8..8e34f30601d3 100644
--- a/drivers/slimbus/slimbus.h
+++ b/drivers/slimbus/slimbus.h
@@ -316,6 +316,18 @@ enum slim_transport_protocol {
 	SLIM_PROTO_EXT_HALF_DUP,
 };
 
+/**
+ * enum slim_ch_control: Channel control.
+ * @SLIM_CH_ACTIVATE: Schedules channel or group of channels in the TDM frame.
+ * @SLIM_CH_SUSPEND: Keeps the TDM schedule but halts data transfer.
+ * @SLIM_CH_REMOVE: Drops the channel or group from the TDM frame.
+ */
+enum slim_ch_control {
+	SLIM_CH_ACTIVATE,
+	SLIM_CH_SUSPEND,
+	SLIM_CH_REMOVE,
+};
+
 /**
  * struct slim_stream_runtime  - SLIMbus stream runtime instance
  *

---
base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
change-id: 20260803-slim-disable-stream-support-43599401607f

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

