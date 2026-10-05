Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9421442FD8
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191511; cv=none; b=El80uD+6KAeOD0KodHhX5GK2Cl9NFZ/aKCMyRVx8S/nEL0VeZQKhr6NdDiEtxgCU8KJVA4f4RR/Z9hzccFfxhs72v0ZWqY10RHdmqMbQoIPk7Hbup1PcRTHPqyAyG5raDe1MWNj3vOO/0GMmyVuwZkRF0mnPnDxi+yXUNqbjl9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191511; c=relaxed/simple;
	bh=Xq53i4DvREansymo8LhN7blZ3Irmefaf3T+L4KAoc20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rfrbOc+JmpCk0RFuJVT3zZoi87g+CxvWRkysWId12ezJer43MKryPnjH80bbbbQwXxAY9TUeko4rmcft9yIik1GbiHCQTnXoQM10JtThJna47CLKr6540Lm/M15VqdZRnvUvNdqUyJ1Kdc+Ezlm9ThV2u7SlYJbFvmpECemBwIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZH+r4pgt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJXAZ+3D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZH+r4pgt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJXAZ+3D"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xRk91941515
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 09:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ss19VBcc+YgAI+y0F6urtLQpxiZ41oXUqnmy+BcLHWE=; b=ZH+r4pgt4OFf/VOb
	coBnoqQUPLv2SE3H+o0T+poamtwppGCwIUK4l81sfHz/f752/QHw6A0N6+7iDbQn
	gYQZ8DUyhNoy+eQCfkGyHbBoMhyaLXO7cmNEsteYeoZV90EWLEcjhwODZtqWFJO5
	j3ltQQZb2dZxl8slso9am9LjEBjLE9HJI27OascWLD/XpxMiW6aqas/V+bOTjc9X
	ipARsJavHWH20jh1fOHUVQbK8qkxW3qH7BV7l2yz1YKs/jLKluvs5b5AbRta+bYY
	5QFb3CDUEp2vszqZ+vuGodEKhrc1MyTI40eoQ8FLmxkef3MnD9h0WjVKwbtNka5Z
	Zot2IQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sq8w71u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 09:11:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc489e7a701so1710902a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 02:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791191507; x=1791796307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ss19VBcc+YgAI+y0F6urtLQpxiZ41oXUqnmy+BcLHWE=;
        b=LJXAZ+3DPBqMe3oCf5hebgoIhd6oKlheuQPybSsbbxW4nO9ROXZ+3U2nDo8dwjQSFS
         6e4yit2A8yINfTOZvx9M4ekb1Vihi07aVlrf0gdYDYJkgo+esyiwDM47/nHxXQdlUv4+
         wkmnz+4h530QUi4Xzeix9q9zqOvxav58TCDVKJsIiZ62HrkvyVAWF78wFTF2xu8OP1n2
         oPXYYhwCeHUmaGaO4pvA9qSpxIXvO+yncvxAIH58wybix5KK/bWYULnE7mpepiiC08Pt
         2Iw6u+daNUIQ6e+y86XN+ZvuEA4VhoEo1Pz2rVKN16he4Y+Rcfs8xs+Z4oAsBBYfZLsZ
         xiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791191507; x=1791796307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ss19VBcc+YgAI+y0F6urtLQpxiZ41oXUqnmy+BcLHWE=;
        b=kvtYuGItevcF1rTcXxOn5JIk4QjKhKZ+FRejTAyf1IpE7nKjgjmE2G7Xn7rDV00bD1
         UewVI9ss672aQ4MPhI8uhhL05LZZPZmye46it4RTCdyCKvylC1CDealt+D79Rej3ejtH
         cBCK1vCuIw7ockWk4bBp8uTYhVrHJvOiwYvOnP7FOsRMo3Nwz+WYGepJR+hxdsuOx2Gb
         myufA/GxcoxF6RNv2rgFcElv0EP6OkQiDUdYdzH75xCR1mtQwdyY2E/s88BpsmrQW3kT
         v825c/hDo4rAM08rYdm4/7OWd3SwADjMaqJuIrADQ8tcxrIfHOJ5+CtRQ93yjPURd3w0
         14dg==
X-Forwarded-Encrypted: i=1; AKwUvByFxbhpIdgii60O3Q1xQJXJOG19NM4QhenaRpTwGg99yF50nwhhfsQBAlAbIX4A/k32BEiLFrswju0n1v0=@vger.kernel.org
X-Gm-Message-State: AFuF++mFgzCAzVM4I2RFRoWwj3Cu8aRJMOWtXL3LkTZsNEGJ6KRwMNwX
	gEdNi9JtJHpMKFSqQBbtwYxcT8EbUdK+ABGxfVN4vrTxihGU27/mYdsOGKAgVdV4RHvn6q4m7pP
	rzNNoMZbZWMJY1N1CYD7vO25wc2JjzVcYYw5ryiBIyppYgSl9IkStkdYsSMMDlNP2pzEElObJ5a
	Y=
X-Gm-Gg: AYBFou3I9chnxHexkIBcAR+amXOPb5XVUUtdNtRkjAhy0NRsUbvKGBMwJrfB+GI0flm
	GK61UwwIC21lvqKvquexxQTHoKO2eLou8ox9ZodEkJhbtn25lrUJ7OHtIXdEch2zBpnAwujf+vf
	a20ApKWKl87htvORKfYvwWVapOAeZtXFqiIKyX/ezipaeHQMjAvdphXAQB7kqc7WDVhF5T2VrBz
	Q0HUqe7JfVIPXjTd30pRuXBzdUL7eVjo3lnfa+22OZ1PDXuvgqybEm3gjjBNz9h539I0/T2STgf
	h2+5A+/0//VsUBMC+w80GIyeEkgU+2u6G/zYJbtzIbS1G2flZrUDtevqJbZeNoWwhTmYzUcHfBd
	uPS7OIdpuGJcwq6uWRL10vakxNsw4
X-Received: by 2002:a05:6300:2189:b0:3de:4f56:cf03 with SMTP id adf61e73a8af0-3e0bd21770dmr9322458637.69.1791191507359;
        Mon, 05 Oct 2026 02:11:47 -0700 (PDT)
X-Received: by 2002:a05:6300:2189:b0:3de:4f56:cf03 with SMTP id adf61e73a8af0-3e0bd21770dmr9322435637.69.1791191506894;
        Mon, 05 Oct 2026 02:11:46 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d8ffc38sm497262a12.15.2026.10.05.02.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:11:46 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 14:41:28 +0530
Subject: [PATCH v5 3/3] soc: qcom: rpmh-rsc: Output debug information from
 RSC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-rpmh-timeout-debug-v1-v5-3-7b9c457a191c@oss.qualcomm.com>
References: <20261005-rpmh-timeout-debug-v1-v5-0-7b9c457a191c@oss.qualcomm.com>
In-Reply-To: <20261005-rpmh-timeout-debug-v1-v5-0-7b9c457a191c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        "Raju P.L.S.S.S.N" <quic_rplsssn@quicinc.com>,
        "Raju P.L.S.S.S.N" <quic_rplsssn@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791191492; l=9923;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=cGGI6rhEOR5PhXGMHtL1aBSKa+tLjTZuprToKLdnc/Q=;
 b=WPlt2t9C0kwL/tsaM/A+L0V1jLOpwuOr1sCG1Z7Rpv2lbUzzTdeZme6if2my/NSmnGFhkaaON
 nwRuTS55uGYDF8oaeW0XCZO0osU2L6sUeWwDC7vVqYjjXMYBgGZdrJW
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: s-QpeocjvERRpp2s7cM1Ervf5K2FlCyr
X-Proofpoint-ORIG-GUID: s-QpeocjvERRpp2s7cM1Ervf5K2FlCyr
X-Authority-Analysis: v=2.4 cv=TKzQ2Fla c=1 sm=1 tr=0 ts=6ac369d4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8 a=dJJuL2mqxW2t2NE-lFUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfX+QVnxPWPMa05
 txQVDicO6wIAXzduYaSvjP86SLvQTCtbwPt2TvqGa2Jzfs5xZhTgF/C62jhb/MC7RuNU9/+EsOL
 pz7MpPujFhEq+ai/po4KjOK5GTlWFy3N8CU2e/fwKAc+LTJ5d52Pzp0XudZqv1PR1Hg0sb7LKk/
 p+9K0VNkF9eLEKPM6F+swqHOynN2xulBVQEHLl9dQriQtfwUSbKZOu6fdl9JCAyIXeUliFmsRY0
 kMjv+qK9rbXf231kopyKLA+3m9SOuGwKefOwELA93XrPq2IfYOW+hk6aNsg/2XX9TsCldaiM7QY
 FOzi6o3JUvRm0hgcaW5Cq+MWDWHC9inLEErWxzfg8JMSm7yHZ1eOv1iuoQOIGQfPTogpFUjqaaC
 q7MvOp7SV+RbglfOpg+1ApFbrEqUUhk5WvQZ/gUOXm0OWggedSw4A1eoZLCs1rbm5DzY87Os32y
 44diI9E5uZYMxIu1kgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfXz3R/f9fVbdyy
 HrP1oqYm/pthg/x525pab5dJpvK4CMBj/Q749FwCCMwsuYBK9zp4HVoUIXa6irTLvoLX1k6gM0o
 D+pl6jarAE3kDu7zHnjeF3WE64ikKwA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050036

From: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>

When an RPMh transfer times out there is no visibility into which
TCS was stuck, what commands it was carrying, or whether the
completion IRQ was pending at the GIC. Add rpmh_rsc_debug() to
capture this state at timeout:

- Iterates all in-use TCSes and dumps per-TCS control register
  state (controller status, AMC mode, IRQ status) and per-command
  register state (address, data, message ID, completion status).
  The accelerator type (ARC/VRM/BCM) is decoded from the address
  using cmd_db_hw_type_str().

- Queries the GIC pending state for the RSC IRQ via
  irq_get_irqchip_state() to distinguish two failure modes:
  * AOSS firmware did not respond (IRQ never fired)
  * Linux lockup (IRQ pending at GIC but handler never ran)

- Reports the completion object state to cross-check with the
  IRQ status.

Store the IRQ number in struct rsc_drv to enable the GIC query.

Wire rpmh_rsc_debug() into the rpmh_write(), rpmh_write_batch(), and
rpmh_read() timeout paths so that all three blocking RPMh callers
produce the same structured TCS/GIC diagnostic output on timeout.

Signed-off-by: Raju P.L.S.S.S.N <rplsssn@codeaurora.org>
Co-developed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/rpmh-internal.h |   5 ++
 drivers/soc/qcom/rpmh-rsc.c      | 100 +++++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/rpmh.c          |  14 +++++-
 3 files changed, 117 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
index 39441a25af9b..4e465bdb5a27 100644
--- a/drivers/soc/qcom/rpmh-internal.h
+++ b/drivers/soc/qcom/rpmh-internal.h
@@ -104,6 +104,9 @@ struct rsc_ver {
  * @tcs_base:           Start address of the TCS registers in this controller.
  * @id:                 Instance id in the controller (Direct Resource Voter).
  * @num_tcs:            Number of TCSes in this DRV.
+ * @irq:                IRQ number used by the TCS completion interrupt;
+ *                      stored to allow querying GIC pending state for
+ *                      timeout diagnostics.
  * @rsc_pm:             CPU PM notifier for controller.
  *                      Used when solver mode is not present.
  * @cpus_in_pm:         Number of CPUs not in idle power collapse.
@@ -131,6 +134,7 @@ struct rsc_drv {
 	void __iomem *tcs_base;
 	int id;
 	int num_tcs;
+	int irq;
 	struct notifier_block rsc_pm;
 	struct notifier_block genpd_nb;
 	atomic_t cpus_in_pm;
@@ -149,6 +153,7 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv,
 			     const struct tcs_request *msg);
 void rpmh_rsc_invalidate(struct rsc_drv *drv);
 void rpmh_rsc_write_next_wakeup(struct rsc_drv *drv);
+void rpmh_rsc_debug(struct rsc_drv *drv, struct completion *compl);
 
 void rpmh_tx_done(const struct tcs_request *msg);
 int rpmh_flush(struct rpmh_ctrlr *ctrlr);
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index c4542318eac4..04016439644d 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -10,6 +10,7 @@
 #include <linux/cpu_pm.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/irq.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
@@ -25,6 +26,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <linux/wait.h>
 
 #include <clocksource/arm_arch_timer.h>
@@ -89,6 +91,7 @@ enum {
 #define CMD_MSGID_LEN			8
 #define CMD_MSGID_RESP_REQ		BIT(8)
 #define CMD_MSGID_WRITE			BIT(16)
+#define CMD_STATUS_TRIGGERED		BIT(0)
 #define CMD_STATUS_ISSUED		BIT(8)
 #define CMD_STATUS_COMPL		BIT(16)
 
@@ -693,6 +696,101 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
 	return 0;
 }
 
+static void print_tcs_info(struct rsc_drv *drv, int tcs_id,
+			   bool *aoss_irq_sts)
+{
+	const struct tcs_request *req = get_req_from_tcs(drv, tcs_id);
+	unsigned long cmds_enabled;
+	char rname[CMD_DB_ID_SIZE + 1];
+	u32 addr, data, msgid, sts, irq_sts;
+	bool in_use = test_bit(tcs_id, drv->tcs_in_use);
+	int i;
+
+	sts = read_tcs_reg(drv, drv->regs[RSC_DRV_STATUS], tcs_id);
+	cmds_enabled = read_tcs_reg(drv, drv->regs[RSC_DRV_CMD_ENABLE], tcs_id);
+	if (!cmds_enabled)
+		return;
+
+	if (!req)
+		goto print_tcs_data;
+
+	data = read_tcs_reg(drv, drv->regs[RSC_DRV_CONTROL], tcs_id);
+	irq_sts = readl_relaxed(drv->tcs_base + drv->regs[RSC_DRV_IRQ_STATUS]);
+	dev_warn(drv->dev, "Request: tcs-in-use:%s state=%d wait_for_compl=%u\n",
+		 str_yes_no(in_use), req->state, req->wait_for_compl);
+	dev_warn(drv->dev, "TCS=%d [ctrlr-sts:%s amc-mode:0x%x irq-sts:%s]\n",
+		 tcs_id, sts ? "IDLE" : "BUSY", data,
+		 (irq_sts & BIT(tcs_id)) ? "DONE" : "WAITING");
+
+	*aoss_irq_sts |= !!(irq_sts & BIT(tcs_id));
+
+print_tcs_data:
+	/* All TCSes on a given RSC have the same number of commands per TCS. */
+	for_each_set_bit(i, &cmds_enabled, drv->tcs[0].ncpt) {
+		addr = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_ADDR], tcs_id, i);
+		data = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_DATA], tcs_id, i);
+		msgid = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_MSGID], tcs_id, i);
+		sts = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_STATUS], tcs_id, i);
+		if (cmd_db_read_name(addr, rname, sizeof(rname)))
+			strscpy(rname, "unknown", sizeof(rname));
+		dev_warn(drv->dev,
+			 "\tCMD=%d [addr=0x%x(%s/%s) data=0x%x %s sts=%s%s%s]\n",
+			 i, addr, cmd_db_hw_type_str(addr), rname, data,
+			 (msgid & CMD_MSGID_RESP_REQ) ? "resp-required" :
+							 "fire-n-forget",
+			 (sts & CMD_STATUS_TRIGGERED) ? "triggered" : "-",
+			 (sts & CMD_STATUS_ISSUED) ? "+sent-to-aoss" : "",
+			 (sts & CMD_STATUS_COMPL) ? "+resp-received" : "");
+	}
+}
+
+/**
+ * rpmh_rsc_debug() - Dump debug information on a transfer timeout.
+ * @drv:   The RSC controller.
+ * @compl: The completion object that timed out.
+ *
+ * Dumps TCS state for all in-use TCSes and reports which accelerators
+ * did not respond, to aid in diagnosing RPMH timeout failures.
+ */
+void rpmh_rsc_debug(struct rsc_drv *drv, struct completion *compl)
+{
+	struct irq_data *rsc_irq_data = irq_get_irq_data(drv->irq);
+	bool gic_irq_sts, aoss_irq_sts = false;
+	int i, ret, busy = 0;
+
+	dev_err(drv->dev, "Timeout on RSC %s\n", drv->name);
+
+	for (i = 0; i < drv->num_tcs; i++) {
+		if (!test_bit(i, drv->tcs_in_use))
+			continue;
+		busy++;
+		print_tcs_info(drv, i, &aoss_irq_sts);
+	}
+
+	if (!rsc_irq_data) {
+		dev_err(drv->dev, "No IRQ data for RSC:%s\n", drv->name);
+		return;
+	}
+
+	ret = irq_get_irqchip_state(drv->irq, IRQCHIP_STATE_PENDING,
+				    &gic_irq_sts);
+	dev_warn(drv->dev, "HW IRQ %lu is %s at GIC\n", rsc_irq_data->hwirq,
+		 ret ? "UNKNOWN" : (gic_irq_sts ? "PENDING" : "NOT PENDING"));
+	dev_warn(drv->dev, "Completion is %s\n",
+		 completion_done(compl) ? "done" : "not done");
+
+	if (ret)
+		dev_err(drv->dev,
+			"Failed to read IRQ pending state (%d); cannot determine timeout cause\n",
+			ret);
+	else if ((busy && !gic_irq_sts) || !aoss_irq_sts)
+		dev_err(drv->dev,
+			"Accelerator(s) at AOSS did not respond\n");
+	else if (gic_irq_sts)
+		dev_err(drv->dev,
+			"IRQ pending at GIC but not handled within timeout\n");
+}
+
 /**
  * find_slots() - Find a place to write the given message.
  * @tcs:    The tcs group to search.
@@ -1114,6 +1212,8 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	drv->irq = irq;
+
 	/*
 	 * CPU PM/genpd notification are not required for controllers that support
 	 * 'HW solver' mode where they can be in autonomous mode executing low
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index 360242a315e3..1f10b85514f1 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -224,7 +224,7 @@ static int __fill_rpmh_msg(struct rpmh_request *req, enum rpmh_state state,
 }
 
 /**
- * rpmh_read: Read a resource value
+ * rpmh_read() - Read a resource value
  *
  * @dev: The device making the request
  * @cmd: The payload having address of resource to read
@@ -240,6 +240,7 @@ int rpmh_read(const struct device *dev, struct tcs_cmd *cmd)
 {
 	DECLARE_COMPLETION_ONSTACK(compl);
 	DEFINE_RPMH_MSG_ONSTACK(dev, RPMH_ACTIVE_ONLY_STATE, &compl, rpm_msg);
+	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
 	int ret;
 
 	ret = __fill_rpmh_msg(&rpm_msg, RPMH_ACTIVE_ONLY_STATE, cmd, 1, true);
@@ -251,6 +252,10 @@ int rpmh_read(const struct device *dev, struct tcs_cmd *cmd)
 		return ret;
 
 	ret = wait_for_completion_timeout(&compl, RPMH_TIMEOUT_MS);
+	if (!ret) {
+		rpmh_rsc_debug(ctrlr_to_drv(ctrlr), &compl);
+		WARN_ON(1);
+	}
 	cmd[0].data = rpm_msg.cmd[0].data;
 
 	return (ret > 0) ? 0 : -ETIMEDOUT;
@@ -308,6 +313,7 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
 {
 	DECLARE_COMPLETION_ONSTACK(compl);
 	DEFINE_RPMH_MSG_ONSTACK(dev, state, &compl, rpm_msg);
+	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
 	int ret;
 
 	ret = __fill_rpmh_msg(&rpm_msg, state, cmd, n, false);
@@ -319,7 +325,10 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
 		return ret;
 
 	ret = wait_for_completion_timeout(&compl, RPMH_TIMEOUT_MS);
-	WARN_ON(!ret);
+	if (!ret) {
+		rpmh_rsc_debug(ctrlr_to_drv(ctrlr), &compl);
+		WARN_ON(1);
+	}
 	return (ret > 0) ? 0 : -ETIMEDOUT;
 }
 EXPORT_SYMBOL_GPL(rpmh_write);
@@ -438,6 +447,7 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
 			 * the completion that we're going to free once
 			 * we've returned from this function.
 			 */
+			rpmh_rsc_debug(ctrlr_to_drv(ctrlr), &compls[i]);
 			WARN_ON(1);
 			ret = -ETIMEDOUT;
 			goto exit;

-- 
2.43.0

