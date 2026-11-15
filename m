Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794712873;
	b=jE/4gi9P+MFUmS3f0e2O7kkln7/7qAqXiyNn0NGUorRon2htWPQHT02plDoAdRC01kHA
	 GA/K0S4Hs9wnairD1nSlmVhg4L5Nz40BznLsXSN/hbmjSY4YpjCRUMs9zi2igEXBoTBj+
	 7Z1xC+ZquTKWE73zmFpMWo0yvFm9dnErboIBuW0DJjpruVaEeYYyDlwNkZj4kGLg21v8o
	 TzLJmz3znHVEvO2PmZIKAZYGLjZ8nwRurSxYrFWjGx26QgZ/KRVYx9rFRqlK666t0bo9L
	 h5qCOSQmwnQzpWJnCfA7bpYaZOn/qAkYfnq3hUcLCUo8T2VNCMLZDkgzUFfwQt2ddBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794712873;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9zt/IEb0vWUpec8F6oTKQ3LvV6PVEYgSmSGRtHHQSnw=;
	b=Pi+/vYBvwtxHrtf3pR17l8PGw0n5tB09qokjkqI3bB3R93ZZCty5XYnpUHxaAzqzkVaq
	 soU4iY8n+av+X9sx/H88L6D6f+kKzOTMz6854bOkrXddH5IAdw2qsjOIVMTmLyNbz0IjW
	 JJiJ/dr2rr9cp1ICH3Uzhr0xIAQRW5OYwqJ0IjkaQ41Pe6pFP++DEfOb3R1HqHfp+VBMg
	 VoVgKdj5cxDHU0kKNqEtTwcsiysDi2bn7GeHexoJR0+jp7Zb//6bzF1bckMzfQpKqhoIK
	 pTRs8RJufDOjig3O0J0BcrIX4x7FxjJQfZqdw96YkP29vNVU3T0u1mzZjQTEfxJbXVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hhXlSKW9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MdOS+n8V;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986C4606A893
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 986C4606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hhXlSKW9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MdOS+n8V
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF0w59G2013133
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9zt/IEb0vWU
	pec8F6oTKQ3LvV6PVEYgSmSGRtHHQSnw=; b=hhXlSKW98HNeYCX9f0IwxptUd/Q
	NY+lvTKq0kYoi/ZiJuMS+iGUKy+qVqQyQIaMsm2XTiHgnnHBAEpNqGZQvM5RlZct
	hcR3vwyym7RS3SUzY3HRXZQvYSjSJpH5Jo+PaFxDflrEkxV2NxCQvGCpSdOUBbSe
	ae6rt9LBzOG3pyvaTqJQsQl6cXryGGgTyew3A5y1LbH3hKjbBcHlAWKUZcZPN1Te
	dG9TYY5LThCcaw08EvbjiguIEGic6a/f/FpDRSCXNkywbzy/PFEqZ/y/IgM/t2Rz
	lWsx8bmSLxd4fTJPG2pay2wMfejWAtgqeTWDb8pBVoaAnD23gfzo5mNKVrg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmaj5j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:21:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36de26cb4b3so2861470eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794712870; x=1795317670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9zt/IEb0vWUpec8F6oTKQ3LvV6PVEYgSmSGRtHHQSnw=;
        b=MdOS+n8V3YacghT/DHqiJRZYQa8ib8nTmlHEvVaebk2cCHszhYffyZ6JYdzaCKkQ3C
         rt6nmpF8XEIeVdtoT/i8zTemNG89vA/qdn6aj0cKRZjohfPVh3vBp6pxnDfBMmQaH+lF
         eLHvY138ADKnFlIdpB5+6aWcx++bsAVQIyC9p2oAWQl4qBVJ8p/XYwRNsArUQN2LW0jZ
         vMhM5YLFvgTNehMN7kufb22d6oFcE9h/a90OHrlYDtHsJ9gG1yalya26Dm+5fS/erW3h
         lXDsAAl7QFT0SwzNeHKtIqxbG/nUc58TUUElv+PT6dpRUUaTzjvqZnFzYrSSHudXvPCk
         KGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794712870; x=1795317670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9zt/IEb0vWUpec8F6oTKQ3LvV6PVEYgSmSGRtHHQSnw=;
        b=ZZMhRkZ68LNdxUueX6ayLvV8+zMHZ94S3S38tfPtgDfAcxCO+KugK8enZ1gprsSmsN
         VOrqlk4wbAWkIERz5rx09VH8bCLF9LTkIue42cdrpD4cmOtpU2vAH5ivvaRYCywVVPE9
         FzplT4tJJjfrNG/cpNElwC24JL/9KzC8WfBtCXD/ZL+jWHBxnAV+wnLdxYDkM0j72EgX
         6/KMHxTGFygsqWPgpQN7WfSYsNk0SnaIgywzJ6ZlI2QjYqnbndZVhNa5yNd5VgySUqeK
         3SWXDwN37wHqJpMhG2ptQPdTjTtJcd/OXfllGEW9cN1LuawpA5ztRLtN0LhuM2XjPGYy
         D9NQ==
X-Forwarded-Encrypted: i=1; AL+hErHYfleyl4dyobRhbtexPzOBQGNc47gl+/HSVDWRkeSd34wplyO5dKLGgF+gMgpdLtOSOoV5LABXtivFDBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ryCY3px3VZqx70XdNnIMdsWyf8pmyjI+N18aUjXdiqdrqw6OS
	k89I7vjmwjVMkW/jOW4pZiu8oS9lAXL2bIsOURqdjZkOCzVxlkY4D/bPDWVzoOy3A7LCkVxGo3T
	CbZZBBntYQ0srsaE6AqELbtrnCxI/ANe5mBRPIKYxKRAittDOdfO6I6+SG/llH/yeUmg=
X-Gm-Gg: AYBFou2x51e3sB7yF3KzSHb8o5647+gvwDTEfJTEE85yrmi2rornMDzV74CM9sZNgWD
	y4uKcvgiWXr1tReoslhuSVW82KWqg3N2drfY1OKNn33Q5PbqpXJiXXj7z8hQZDUNjsGC44TUcjB
	ZvQOBx67+/PzoWiWSMfuntiEpgXGL81D2QrwDrQw0aJwHiMA7PG19aaJY0FNjU8+ozTvkG4MjRg
	eiEUJgk3WGRKR+JN927TiUkSqE30SyWDn41vP0NsbhlciuusvG8Cd5Kmsrq8K94v9zOlDOHjau4
	3oLcXt66rSZMQ626owhJfkTWfr9ZqyluMXBwhZ237H+oVrenSBxpY0sTgwNqHDNjVZAu6qym16d
	CN+PVouS0r2nth0nECiPHoK9PmmZd8vbLOL9HC3RfJHBc/2HMfM3RHr3c1/50VZT+4sg2aKI++k
	YWube6k01+2abi/STh0mJCp4RgJosgqChi
X-Received: by 2002:a05:7022:f4e:b0:144:fb42:52 with SMTP id a92af1059eb24-1b50311a2e2mr6126215c88.28.1794712870159;
        Sat, 14 Nov 2026 19:21:10 -0800 (PST)
X-Received: by 2002:a05:7022:f4e:b0:144:fb42:52 with SMTP id a92af1059eb24-1b50311a2e2mr6126196c88.28.1794712869566;
        Sat, 14 Nov 2026 19:21:09 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm21300791c88.14.2026.11.14.19.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 19:21:09 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohit Sharma <mohit.sharma@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/3] ASoC: qcom: q6prm: Keep the clock controller across DSP restarts
Date: Sun, 15 Nov 2026 11:20:27 +0800
Message-ID: <20261115032027.414953-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115032027.414953-1-shengchao.guo@oss.qualcomm.com>
References: <20261115032027.414953-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ai_pRvKOY5rcg_I7B0PWHmqp7LTUQGio
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDAxMyBTYWx0ZWRfX/+NHEaHe9jzC
 0MjEsO8nZdzShMIab0P5Yo5A7/AiTDIGPK5+yqmfjrtQA4T5qJkl6IUdaD6RIb1OjKwLd1yzUhF
 g+5dNoRNoI6O2mmYOpUILCtX3fCY7w4IPbCrZCCTEtr2uj1ejge+JQsiP3TNoimhxg3uRcFtbMu
 BRFaElJtuujVreClSTcCr5VJoW6THardQ+diX9UvjyeEkd2+qwGvyqqeY8q88cDEKhrtVL4lhF7
 046Hn/b7tt7ZUQ0sfGY2qu2OXHctJR5LSLKVYkfNE9zc4DlF5c2BZRylWIyPXcz+c7MbktTItCu
 ZBkczBDkWx1itqiXFUIi77apTVIHZnaPM3CrwWmU0n8l1GG5Vw+JjuNJmtoMe6HMz5NpqlZUWJe
 hnSGBbX1Md8tphkXg9C58sCfkQkDUTT7Cqyu/SJQZp3FWuUDrrFfJc0WKQbp6teYAVGxbdmNMKV
 S4kE+ndUsaOpSW4Z4Yw==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6af92527 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ZHXvaJr083fUS051230A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: ai_pRvKOY5rcg_I7B0PWHmqp7LTUQGio
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDAxMyBTYWx0ZWRfX5O98OkKtzkfs
 XFe0edK1jegnzMOw+I5/3TJ7wuq9jBvOgqn6b5qk59DAit0Triqk48Y7sYDEMzbcN8a8LvKdLNW
 UKUQJsS9SQ8A0W2em4Syu6sqUrxZ658=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150013

The q6prm LPASS clock controller is populated as a child of the q6prm
GPR device. That device is unregistered whenever the DSP stops, which
unregisters the clock provider while consumers still hold their clocks.
fw_devlink links the consumers to the remoteproc device rather than to
the clock controller, so they stay bound, and their clk handles fall
back to clk_nodrv_ops. After the DSP comes back, every operation on
those handles fails with -ENXIO. On Nord RRD, playback after an ADSP
restart fails with:

  pcm1681 0-004c: Failed to enable sck: -6

Create the clock controller device once and keep it until the module is
unloaded. Its parent is the closest platform device ancestor of the GPR
device, which is the remoteproc platform device. That device persists
across DSP restarts, while the rpmsg and remoteproc devices between it
and the GPR device do not. The device tree is unchanged: the controller
keeps its clock-controller node under the q6prm node, so no binding
change is needed.

Each probe of the q6prm GPR device attaches its instance to the existing
controller, found by device tree node, and restores the clocks that
consumers held across the restart. Remove detaches the instance first,
so new clock requests fail with -EBUSY while the DSP is down, then marks
the prepared clocks as lost.

Since q6prm now destroys these devices itself, replace
module_gpr_driver() with explicit init and exit functions. q6prm also
calls into snd-q6dsp-common now, so select SND_SOC_QDSP6_COMMON.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/qcom/Kconfig       |   1 +
 sound/soc/qcom/qdsp6/q6prm.c | 190 ++++++++++++++++++++++++++++++++---
 2 files changed, 178 insertions(+), 13 deletions(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index f6d810931a9a..74f0190b05f1 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -127,6 +127,7 @@ config SND_SOC_QDSP6_PRM_LPASS_CLOCKS
 
 config SND_SOC_QDSP6_PRM
 	tristate
+	select SND_SOC_QDSP6_COMMON
 	select SND_SOC_QDSP6_PRM_LPASS_CLOCKS
 
 config SND_SOC_QCOM_OFFLOAD_UTILS
diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
index 73b5a96e8311..861d48bdb5ea 100644
--- a/sound/soc/qcom/qdsp6/q6prm.c
+++ b/sound/soc/qcom/qdsp6/q6prm.c
@@ -8,22 +8,56 @@
 #include <linux/of.h>
 #include <linux/delay.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/jiffies.h>
 #include <linux/soc/qcom/apr.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "q6apm.h"
+#include "q6dsp-lpass-clocks.h"
 #include "q6prm.h"
 #include "audioreach.h"
 
+struct q6prm_clkctl;
+
 struct q6prm {
 	struct device *dev;
 	gpr_device_t *gdev;
 	wait_queue_head_t wait;
 	struct gpr_ibasic_rsp_result_t result;
 	struct mutex lock;
+	struct q6prm_clkctl *clkctl;
 };
 
+/*
+ * The q6prm GPR device is removed whenever the DSP stops, but clock consumers
+ * hold their clk handles across a DSP restart. The clock controller device is
+ * therefore created only once, under the remoteproc device, and kept until the
+ * module is unloaded. Its clock ops reach the q6prm instance of the running
+ * DSP through @prm, which is NULL while the DSP is down.
+ */
+struct q6prm_clkctl {
+	struct list_head node;
+	struct device_node *np;
+	struct platform_device *pdev;
+	struct q6prm *prm;
+};
+
+static DEFINE_MUTEX(q6prm_clkctl_lock);
+static LIST_HEAD(q6prm_clkctl_list);
+
+/* Called with q6prm_clkctl_lock held */
+static struct q6prm *q6prm_clkctl_get_prm(struct device *dev)
+{
+	struct q6prm_clkctl *ctl;
+
+	list_for_each_entry(ctl, &q6prm_clkctl_list, node)
+		if (ctl->np == dev->of_node)
+			return ctl->prm;
+
+	return NULL;
+}
+
 #define PRM_CMD_REQUEST_HW_RSC		0x0100100F
 #define PRM_CMD_RSP_REQUEST_HW_RSC	0x02001002
 #define PRM_CMD_RELEASE_HW_RSC		0x01001010
@@ -63,9 +97,8 @@ static int q6prm_send_cmd_sync(struct q6prm *prm, struct gpr_pkt *pkt, uint32_t
 					NULL, &prm->wait, pkt, rsp_opcode);
 }
 
-static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool enable)
+static int q6prm_set_hw_core_req(struct q6prm *prm, uint32_t hw_block_id, bool enable)
 {
-	struct q6prm *prm = dev_get_drvdata(dev->parent);
 	struct apm_module_param_data *param_data;
 	struct prm_cmd_request_hw_core *req;
 	gpr_device_t *gdev = prm->gdev;
@@ -105,21 +138,35 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
 int q6prm_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
 			     const char *client_name, uint32_t *client_handle)
 {
-	return q6prm_set_hw_core_req(dev, hw_block_id, true);
+	struct q6prm *prm;
 
+	guard(mutex)(&q6prm_clkctl_lock);
+
+	prm = q6prm_clkctl_get_prm(dev);
+	if (!prm)
+		return -EBUSY;
+
+	return q6prm_set_hw_core_req(prm, hw_block_id, true);
 }
 EXPORT_SYMBOL_GPL(q6prm_vote_lpass_core_hw);
 
 int q6prm_unvote_lpass_core_hw(struct device *dev, uint32_t hw_block_id, uint32_t client_handle)
 {
-	return q6prm_set_hw_core_req(dev, hw_block_id, false);
+	struct q6prm *prm;
+
+	guard(mutex)(&q6prm_clkctl_lock);
+
+	prm = q6prm_clkctl_get_prm(dev);
+	if (!prm)
+		return -EBUSY;
+
+	return q6prm_set_hw_core_req(prm, hw_block_id, false);
 }
 EXPORT_SYMBOL_GPL(q6prm_unvote_lpass_core_hw);
 
-static int q6prm_request_lpass_clock(struct device *dev, int clk_id, int clk_attr, int clk_root,
+static int q6prm_request_lpass_clock(struct q6prm *prm, int clk_id, int clk_attr, int clk_root,
 				     unsigned int freq)
 {
-	struct q6prm *prm = dev_get_drvdata(dev->parent);
 	struct apm_module_param_data *param_data;
 	struct prm_cmd_request_rsc *req;
 	gpr_device_t *gdev = prm->gdev;
@@ -148,10 +195,9 @@ static int q6prm_request_lpass_clock(struct device *dev, int clk_id, int clk_att
 	return q6prm_send_cmd_sync(prm, pkt, PRM_CMD_RSP_REQUEST_HW_RSC);
 }
 
-static int q6prm_release_lpass_clock(struct device *dev, int clk_id, int clk_attr, int clk_root,
+static int q6prm_release_lpass_clock(struct q6prm *prm, int clk_id, int clk_attr, int clk_root,
 			  unsigned int freq)
 {
-	struct q6prm *prm = dev_get_drvdata(dev->parent);
 	struct apm_module_param_data *param_data;
 	struct prm_cmd_release_rsc *rel;
 	gpr_device_t *gdev = prm->gdev;
@@ -180,10 +226,18 @@ static int q6prm_release_lpass_clock(struct device *dev, int clk_id, int clk_att
 int q6prm_set_lpass_clock(struct device *dev, int clk_id, int clk_attr, int clk_root,
 			  unsigned int freq)
 {
-	if (freq)
-		return q6prm_request_lpass_clock(dev, clk_id, clk_attr, clk_root, freq);
+	struct q6prm *prm;
 
-	return q6prm_release_lpass_clock(dev, clk_id, clk_attr, clk_root, freq);
+	guard(mutex)(&q6prm_clkctl_lock);
+
+	prm = q6prm_clkctl_get_prm(dev);
+	if (!prm)
+		return -EBUSY;
+
+	if (freq)
+		return q6prm_request_lpass_clock(prm, clk_id, clk_attr, clk_root, freq);
+
+	return q6prm_release_lpass_clock(prm, clk_id, clk_attr, clk_root, freq);
 }
 EXPORT_SYMBOL_GPL(q6prm_set_lpass_clock);
 
@@ -212,10 +266,76 @@ static int prm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 	return 0;
 }
 
+/*
+ * The GPR device sits on a chain of rpmsg and remoteproc devices that are all
+ * torn down when the DSP stops. Its closest platform device ancestor is the
+ * remoteproc platform device, which stays across DSP restarts.
+ */
+static struct device *q6prm_clkctl_parent(struct device *dev)
+{
+	for (dev = dev->parent; dev; dev = dev->parent)
+		if (dev_is_platform(dev))
+			return dev;
+
+	return NULL;
+}
+
+static int q6prm_clkctl_attach(struct q6prm *prm)
+{
+	struct device *dev = prm->dev;
+	struct q6prm_clkctl *ctl = NULL, *iter;
+	struct device_node *np;
+
+	np = of_get_child_by_name(dev->of_node, "clock-controller");
+	if (!np)
+		return 0;
+
+	scoped_guard(mutex, &q6prm_clkctl_lock) {
+		list_for_each_entry(iter, &q6prm_clkctl_list, node) {
+			if (iter->np == np) {
+				ctl = iter;
+				break;
+			}
+		}
+
+		if (ctl) {
+			of_node_put(np);
+		} else {
+			ctl = kzalloc_obj(*ctl);
+			if (!ctl) {
+				of_node_put(np);
+				return -ENOMEM;
+			}
+
+			ctl->np = np;
+			list_add(&ctl->node, &q6prm_clkctl_list);
+		}
+
+		ctl->prm = prm;
+	}
+
+	/* Created on first probe, once its clock ops can already reach the DSP */
+	if (!ctl->pdev) {
+		ctl->pdev = of_platform_device_create(ctl->np, NULL,
+						      q6prm_clkctl_parent(dev));
+		if (!ctl->pdev) {
+			scoped_guard(mutex, &q6prm_clkctl_lock)
+				ctl->prm = NULL;
+			return dev_err_probe(dev, -ENODEV,
+					     "Failed to create clock controller\n");
+		}
+	}
+
+	prm->clkctl = ctl;
+
+	return 0;
+}
+
 static int prm_probe(gpr_device_t *gdev)
 {
 	struct device *dev = &gdev->dev;
 	struct q6prm *cc;
+	int ret;
 
 	cc = devm_kzalloc_obj(dev, *cc);
 	if (!cc)
@@ -230,7 +350,29 @@ static int prm_probe(gpr_device_t *gdev)
 	if (!q6apm_is_adsp_ready())
 		return -EPROBE_DEFER;
 
-	return devm_of_platform_populate(dev);
+	ret = q6prm_clkctl_attach(cc);
+	if (ret)
+		return ret;
+
+	if (cc->clkctl)
+		q6dsp_clock_dsp_up(&cc->clkctl->pdev->dev);
+
+	return 0;
+}
+
+static void prm_remove(gpr_device_t *gdev)
+{
+	struct q6prm *prm = dev_get_drvdata(&gdev->dev);
+	struct q6prm_clkctl *ctl = prm->clkctl;
+
+	if (!ctl)
+		return;
+
+	/* Fail new clock requests first, then mark what the DSP dropped */
+	scoped_guard(mutex, &q6prm_clkctl_lock)
+		ctl->prm = NULL;
+
+	q6dsp_clock_dsp_down(&ctl->pdev->dev);
 }
 
 #ifdef CONFIG_OF
@@ -243,6 +385,7 @@ MODULE_DEVICE_TABLE(of, prm_device_id);
 
 static gpr_driver_t prm_driver = {
 	.probe = prm_probe,
+	.remove = prm_remove,
 	.gpr_callback = prm_callback,
 	.driver = {
 		.name = "qcom-prm",
@@ -250,6 +393,27 @@ static gpr_driver_t prm_driver = {
 	},
 };
 
-module_gpr_driver(prm_driver);
+static int __init q6prm_init(void)
+{
+	return apr_driver_register(&prm_driver);
+}
+module_init(q6prm_init);
+
+static void __exit q6prm_exit(void)
+{
+	struct q6prm_clkctl *ctl, *tmp;
+
+	apr_driver_unregister(&prm_driver);
+
+	list_for_each_entry_safe(ctl, tmp, &q6prm_clkctl_list, node) {
+		if (ctl->pdev)
+			of_platform_device_destroy(&ctl->pdev->dev, NULL);
+		of_node_put(ctl->np);
+		list_del(&ctl->node);
+		kfree(ctl);
+	}
+}
+module_exit(q6prm_exit);
+
 MODULE_DESCRIPTION("Q6 Proxy Resource Manager");
 MODULE_LICENSE("GPL");
-- 
2.43.0

