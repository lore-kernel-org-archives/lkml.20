Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775889;
	b=oYeoEn5nKgRD9+2nXqRcQPpFsP1w1kHJykRdOPv04dxBjDxhSMe3EpNLxxER8fDD9Ya1
	 pfqwEQkztflyxl8fXAz8bhhKBfEzb45cvAewYVI6ZHjf1JsToGpEb3Bq6SUH/8NVnSuTZ
	 teKRtX0F0n8h7PYnzRQAhy2QoRJj2X9T8l6+QFYJMe+bVxQ5wpkXKYXPw3qSWeCsCfNCx
	 xTZd/2pSnvEmlZaSi1JO2pEdjqrJ5HGxiCX1JmMj9kJRmosndyE/fOVbIM5fRrImfzjkX
	 U8rqxy+ZpB0pOiyWkENqgtrNbr2wZjvx3+6KvbrRCkSRqnKf0wmyUw/5cBXcuXAUnFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BtsETwFv6Q5X/fzD8zbBvXbPWBG6c2z5Kntag4vBmnk=;
	b=grMoOsJwxx48JPiXlvAht4TPiEWRUtDBvDGzF/wR7+sR554FgImDi2upqN9gTOJ35Tae
	 jPUlN/b3Er4tutgt3LlUfBnL2c2IApuBfj0jSV54kZef1b9Nj45zsfWqIPNG+hEEWw2Bj
	 vFYklMT7giFPXcqw0opqy0Xx9aOAfsgS6gSNXwTKM5k1wkuH1e/x/B7DRhap+ROHL3Y2z
	 dLtuQ25w/KBHkXIi2GoPX+6U35h7uTffeu/FmHucxwDjLr86I9vqi7x/Fz2SP9mGFYvSw
	 2sNaf5SxbBDdW48V9xSTz1sdDQgI/EvSgBuBzuHW51NhhrAU3KxD0FzpV0mN+KITozQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lcfB2Reb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NfpQvNKx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB5560A6F60
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EB5560A6F60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lcfB2Reb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NfpQvNKx
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG343x3734767
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BtsETwFv6Q5
	X/fzD8zbBvXbPWBG6c2z5Kntag4vBmnk=; b=lcfB2RebNKdlg6TYehKA4bLwMcW
	91qfFp3mch5PzEnaMDksHo9pykafmIY3+g8x6nJLmxmTcTLeAZZRDUexpxUFCGQK
	O1ITQYufxN++x7nl8rOgtpRSM6mvzn7VYDG01baJMvBMQWwrbpdYUsoMwQisqrVb
	J/mX7p+ba/ywBahFdjHwD1xnEo/Je5G9li4QWFFsihJSVHOnv3u6S1ReXwEwxhlW
	k5ldVNdXHwe+xPieIdbRnxypF3exQb1cGDCzrIvD14oqWNt5y5qE1e88wzGkTLlv
	d2xI57V12cBZs0NKrXvE3vsE2Tzvc2Di5hNOAXj6iYpRdAwnQTz87Lcwfxg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgarug9dh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ecdc701a2so151559985a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775887; x=1793380687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtsETwFv6Q5X/fzD8zbBvXbPWBG6c2z5Kntag4vBmnk=;
        b=NfpQvNKx4rjNxX9FbyNhz2dA9AYJu+Ok5jBc1ZpGIdf8cMCm1gTXt2cn9e3lPUy7UH
         nh2Y/+ILGHZkFmCs8SZrWf8tcq/Ws3VOVYV83aeKmWLLcciuylacLsVFB+OMalskhcwe
         LAHlApXSyZWcgLEtRl5I3lbzSC5hh2rjJeFBI9eG3G959ezQXSUQK6bjQ7tvNNTSVCW0
         bRORcuPR+DqWfErFiZlmx9ycbnKlY27P8oONfr3n4kQXuIQeRap5dA1IO8eBCj9d7Ege
         0PzrXwIaMPP2OHX+HEZqie/J2/MymNupOgd0vPfMa8+lS2z+56RArhx7C3QmcPzTnUtX
         4nEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775887; x=1793380687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtsETwFv6Q5X/fzD8zbBvXbPWBG6c2z5Kntag4vBmnk=;
        b=plZBG2vZTaoL71zp826+7OM0JeN6OY1oS3827F4hHWhBN9G4v+PRXTKnTHu50dTtnc
         mb7cG4M7UYUvrO0LxAW2Ui71nsbLukI1xrq0oMRMRXi1p1i8IBI4x/bJMLZg7pl6hUxg
         n8FiXfcDvRIShz9NHzTQL4ej7EWYtch5edScsWQQdwI9oKPwEUKaGJCBCVLXiHnwIVan
         BP0z9eUsxtSJr0Uf0KVZ4y1+GtwxDNW86knEaPCBA6uxgBcwQBJ6z4Awsrf8QNyOXwZ0
         OX+eUJ7aubPZJsAHS9L5WAsmp2w/JyWC4vjsPsgjKmZ5U+otr1FgliqXQhG3RZsTQwfx
         M8eQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkZ6m3fp6pfiw1fWA08ITzQ4OXlJSYgum+415jiYR+DkNw3TVY/d7MULXfD4mSU/QHVUSP6VMxHzFWIkc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZZ1HyqS1YIUyMyQOw5o/KDNQfDJ1W0esacIFUVy/WfMf+pm5A
	f/dGMwA8nm4c63sPP2JzYmWv6sEo3VDggn1VZo+1BadDJ4I45jTaC9GXEL5Bg5dG0uvDk4c4cQY
	w97OJe9ykEBhPCvES59TNsVI6rX2UcM0qncjFdCqk1j9ugKGbfiyAhoYt5FWobzPps08=
X-Gm-Gg: AYBFou0da3nHxk/ArUhMyCsNXSRxukY19f4QYdUzco5eNU8G9OxTdf/R1XPAxb1KPa7
	kiGD7WUZFqNZ7wv+49+uYwuqBF6BD6WalhilnXx0OLvYECanj2P+6SLnjmFihFfAQK4o05pukqY
	aLVmP+B486h73Yn0Aa52kJ+Axk2LhNjCbSjo1IfzP4xSecLQhsPPKfULycYw3igI8NDxLLTY9l+
	MDCBcCMyWxtkavjwi8CJVF6osGr2cK/+cU8kn2cO5hMAagEHddLKDr6kagmGRNdna255cqlBE7n
	ciaOWlZEpnag/cCw+CFgKWNAzAOirZvj7tn2KilD50Ajbu2+A7ffDA3CPm0hpkj3ouTfd/VwU1l
	MGlSkm1tmydkP
X-Received: by 2002:a05:620a:1a15:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-93f6f9ec172mr559089185a.66.1792775886319;
        Fri, 23 Oct 2026 10:18:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1a15:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-93f6f9ec172mr559083485a.66.1792775885599;
        Fri, 23 Oct 2026 10:18:05 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:04 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 11/23] ASoC: qcom: audioreach: cache VI calibration results per speaker
Date: Fri, 23 Oct 2026 18:14:21 +0100
Message-ID: <20261023171433.820092-12-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX6WtYjzWShkJR
 +EL74/3D2dgDFRAtjW3deiehm92xjmdKWKlO2FlMvQeh1S94ujKhCY/jkw4G9Vm0/+bAUsmtjKK
 TKky1pxHFVZAApj4lUKwwMTUiSs/nMQ=
X-Proofpoint-GUID: 3T2Kyk2whxOGsIuZhFe8RuS3pXWgkNYK
X-Authority-Analysis: v=2.4 cv=SK7Xx+vH c=1 sm=1 tr=0 ts=6adb96cf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=9i9zgLQWcW9tzXS19ZUA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 3T2Kyk2whxOGsIuZhFe8RuS3pXWgkNYK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX8oXKJ5aFNV80
 OLYKSN8G9ywlq2Dh5U+IiGR9rclULDSkKgWPoKIl2wBoOjx0s+YlUz9O6LyLE9xzAdjCe1vJGjQ
 iAYKW4VlPttiCbmqB1VvQZ+mLfT4gGs82pwKWifJAzQejTwEqKIRdRzxtDWT3fg2X69jv5RJQ1D
 QesTJEd/wf+VoRFv7WpqirpDYpcNErOMn3HH5EuGpL3NVuio8NxJNSOGYoghWf0OWXdwf3JDUar
 GL8pP+TcFgwRneG23Ib5TAqLoXogMQq72MNxj25KVcH/G3nhxDdNlCFAbjD/67Xgb1zwUPKnq9G
 j2+XB7G4XeKRJvAkUiOb40RgFl/SplRNSALBfAtp7BCATJosSO8J9WsRI4E9gRwiV5irA9j6/SP
 neBqU7pKH4v9P1FtHezWKFalMTYfZpXyLd2iG4flB0F/6PzWQ3UE6mcp+yWjfAvrO2phFoMwXYv
 v4O49ndc9a42SW9esZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The VI module reports EVENT_ID_VI_PER_SPKR_CALIBRATION every frame for
the whole run. The handler logged each event and kept nothing, flooding
the log and dropping the measured resistance.

Log each state once per speaker and keep the result once every speaker
has reached a final state, with R0 for those that succeeded. Log the
R0 of a failed speaker as out of range. Move the handler to audioreach.c
next to the state it keeps, and turn the calibration states into a
documented enum.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 129 ++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  39 ++++++---
 sound/soc/qcom/qdsp6/q6apm.c      |  37 +--------
 3 files changed, 162 insertions(+), 43 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 24198cde8158..eb317b704b54 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2020, Linaro Limited
 
 #include <linux/kernel.h>
+#include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/apr.h>
 #include <sound/soc.h>
@@ -12,6 +13,23 @@
 #include "q6apm.h"
 #include "audioreach.h"
 
+enum sp_vi_cali_state {
+	SP_VI_CALI_IDLE,	/* Not calibrating */
+	SP_VI_CALI_RUNNING,	/* Events arriving, none decisive yet */
+	SP_VI_CALI_FAILED,	/* Run finished, no usable R0 */
+	SP_VI_CALI_SUCCESS,	/* Run finished, @r0_cali_q24 valid */
+};
+
+struct sp_vi_r0_result {
+	enum sp_vi_cali_state state;
+	u32 num_ch;
+	s32 r0_cali_q24[MAX_SP_VI_SPEAKERS];
+	u32 seen_states[MAX_SP_VI_SPEAKERS];
+};
+
+static struct sp_vi_r0_result sp_vi_r0;
+static DEFINE_MUTEX(sp_vi_r0_lock);
+
 /* SubGraph Config */
 struct apm_sub_graph_data {
 	struct apm_sub_graph_cfg sub_graph_cfg;
@@ -1456,6 +1474,106 @@ static int audioreach_gain_set(struct q6apm_graph *graph,
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
+static bool sp_vi_cali_state_is_failure(u32 state)
+{
+	return state == VI_CALIBRATION_STATE_FAILED ||
+	       state == VI_CALIBRATION_STATE_VI_WAIT_TIMED_OUT;
+}
+
+static bool sp_vi_cali_state_is_terminal(u32 state)
+{
+	return state == VI_CALIBRATION_STATE_SUCCESS ||
+	       sp_vi_cali_state_is_failure(state);
+}
+
+#define SP_VI_CALI_UNKNOWN_STATE_BIT	(VI_CALIBRATION_STATE_LOW_VI + 1)
+
+static const char *sp_vi_cali_state_name(u32 state)
+{
+	static const char * const names[] = {
+		[VI_CALIBRATION_STATE_INCORRECT_OP_MODE] = "not in calibration mode",
+		[VI_CALIBRATION_STATE_INACTIVE]		= "inactive",
+		[VI_CALIBRATION_STATE_WARMUP]		= "warming up",
+		[VI_CALIBRATION_STATE_INPROGRESS]	= "in progress",
+		[VI_CALIBRATION_STATE_SUCCESS]		= "success",
+		[VI_CALIBRATION_STATE_FAILED]		= "failed, R0/T0 out of range",
+		[VI_CALIBRATION_STATE_WAIT_FOR_VI]	= "waiting for V/I",
+		[VI_CALIBRATION_STATE_VI_WAIT_TIMED_OUT] = "failed, timed out waiting for V/I",
+		[VI_CALIBRATION_STATE_LOW_VI]		= "V/I level too low",
+	};
+
+	if (state >= ARRAY_SIZE(names) || !names[state])
+		return "unknown";
+
+	return names[state];
+}
+
+static int sp_vi_q24_to_int_frac(s32 val, int *frac)
+{
+	*frac = (int)(((s64)(val & 0xffffff) * 1000) >> 24);
+
+	return val >> 24;
+}
+
+void audioreach_vi_calibration_event(struct device *dev,
+				     const struct event_id_vi_per_spkr_calibration *cali,
+				     u32 num_ch)
+{
+	bool decisive = true;
+	bool success = true;
+	unsigned int i;
+	u32 bit;
+
+	guard(mutex)(&sp_vi_r0_lock);
+
+	if (sp_vi_r0.state != SP_VI_CALI_RUNNING)
+		return;
+
+	for (i = 0; i < num_ch; i++) {
+		u32 state = cali->cali_param[i].state;
+
+		if (sp_vi_cali_state_is_failure(state))
+			success = false;
+		else if (!sp_vi_cali_state_is_terminal(state))
+			decisive = false;
+
+		bit = BIT(min_t(u32, state, SP_VI_CALI_UNKNOWN_STATE_BIT));
+		if (!(sp_vi_r0.seen_states[i] & bit)) {
+			sp_vi_r0.seen_states[i] |= bit;
+			dev_info(dev, "VI calibration channel %u: %s\n",
+				 i, sp_vi_cali_state_name(state));
+		}
+	}
+
+	if (!decisive)
+		return;
+
+	sp_vi_r0.state = success ? SP_VI_CALI_SUCCESS : SP_VI_CALI_FAILED;
+	sp_vi_r0.num_ch = num_ch;
+
+	for (i = 0; i < num_ch; i++) {
+		int r0_int, r0_frac;
+
+		if (cali->cali_param[i].state == VI_CALIBRATION_STATE_FAILED) {
+			r0_int = sp_vi_q24_to_int_frac(cali->cali_param[i].r0_cali_q24,
+						       &r0_frac);
+			dev_warn(dev, "VI calibration channel %u: R0 %d.%03d ohms out of range\n",
+				 i, r0_int, r0_frac);
+			continue;
+		}
+		if (sp_vi_cali_state_is_failure(cali->cali_param[i].state))
+			continue;
+
+		sp_vi_r0.r0_cali_q24[i] = cali->cali_param[i].r0_cali_q24;
+
+		r0_int = sp_vi_q24_to_int_frac(sp_vi_r0.r0_cali_q24[i], &r0_frac);
+		dev_info(dev, "VI calibration channel %u: R0 %d.%03d ohms (Q24 %d)\n",
+			 i, r0_int, r0_frac, sp_vi_r0.r0_cali_q24[i]);
+	}
+
+	dev_info(dev, "VI calibration complete: %s\n", success ? "success" : "failed");
+}
+
 static int audioreach_speaker_protection(struct q6apm_graph *graph,
 					 const struct audioreach_module *module,
 					 uint32_t operation_mode)
@@ -1493,6 +1611,15 @@ static int audioreach_register_events(struct q6apm_graph *graph,
 	return rc;
 }
 
+static void audioreach_arm_vi_calibration(void)
+{
+	guard(mutex)(&sp_vi_r0_lock);
+
+	sp_vi_r0 = (struct sp_vi_r0_result){
+		.state = SP_VI_CALI_RUNNING,
+	};
+}
+
 static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 					    const struct audioreach_module *module,
 					    const struct audioreach_module_config *mcfg)
@@ -1520,6 +1647,8 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 		return -EINVAL;
 	}
 
+	audioreach_arm_vi_calibration();
+
 	rc = audioreach_register_events(graph, module);
 	if (rc)
 		return rc;
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index c8c7fa4f6f70..232faba6d83f 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -725,16 +725,32 @@ struct param_id_sp_vi_channel_map_cfg {
 /* VI per-speaker calibration event, raised every frame in calibration mode */
 #define EVENT_ID_VI_PER_SPKR_CALIBRATION	0x08001511
 
-/* Calibration state, as reported by struct vi_per_spkr_calib_param.state */
-#define VI_CALIBRATION_STATE_NORMAL_MODE	0 /* Not in calibration mode */
-#define VI_CALIBRATION_STATE_INACTIVE		1 /* Port not started */
-#define VI_CALIBRATION_STATE_WARM_UP		2 /* Warming up */
-#define VI_CALIBRATION_STATE_IN_PROGRESS	3 /* Calibration running */
-#define VI_CALIBRATION_STATE_SUCCESS		4 /* R0/T0 within range */
-#define VI_CALIBRATION_STATE_FAILED		5 /* R0/T0 out of range */
-#define VI_CALIBRATION_STATE_WAIT_FOR_VI	6 /* Waiting for V/I data */
-#define VI_CALIBRATION_STATE_VI_WAIT_TIMEOUT	7 /* Timed out waiting for V/I */
-#define VI_CALIBRATION_STATE_LOW_VI		8 /* V/I signal level too low */
+/**
+ * enum vi_calibration_state - Calibration state of one speaker
+ * @VI_CALIBRATION_STATE_INCORRECT_OP_MODE: Not in calibration operation mode
+ * @VI_CALIBRATION_STATE_INACTIVE: Port not started
+ * @VI_CALIBRATION_STATE_WARMUP: Warming up
+ * @VI_CALIBRATION_STATE_INPROGRESS: Calibration running
+ * @VI_CALIBRATION_STATE_SUCCESS: R0/T0 within range
+ * @VI_CALIBRATION_STATE_FAILED: R0/T0 out of range
+ * @VI_CALIBRATION_STATE_WAIT_FOR_VI: Waiting for the V/I level to rise
+ * @VI_CALIBRATION_STATE_VI_WAIT_TIMED_OUT: Gave up waiting for the V/I level
+ * @VI_CALIBRATION_STATE_LOW_VI: V/I level fell below the threshold mid-run
+ *
+ * Reported by struct vi_per_spkr_calib_param.state. The DSP chooses these
+ * values, so they are fixed and must not be renumbered.
+ */
+enum vi_calibration_state {
+	VI_CALIBRATION_STATE_INCORRECT_OP_MODE	= 0,
+	VI_CALIBRATION_STATE_INACTIVE		= 1,
+	VI_CALIBRATION_STATE_WARMUP		= 2,
+	VI_CALIBRATION_STATE_INPROGRESS		= 3,
+	VI_CALIBRATION_STATE_SUCCESS		= 4,
+	VI_CALIBRATION_STATE_FAILED		= 5,
+	VI_CALIBRATION_STATE_WAIT_FOR_VI	= 6,
+	VI_CALIBRATION_STATE_VI_WAIT_TIMED_OUT	= 7,
+	VI_CALIBRATION_STATE_LOW_VI		= 8,
+};
 
 /**
  * struct vi_per_spkr_calib_param - Per-speaker calibration result
@@ -1098,6 +1114,9 @@ int audioreach_gain_set_vol_ctrl(struct q6apm *apm,
 int audioreach_send_u32_param(struct q6apm_graph *graph,
 			      const struct audioreach_module *module,
 			      uint32_t param_id, uint32_t param_val);
+void audioreach_vi_calibration_event(struct device *dev,
+				     const struct event_id_vi_per_spkr_calibration *cali,
+				     u32 num_ch);
 int audioreach_compr_set_param(struct q6apm_graph *graph,
 			       const struct audioreach_module_config *mcfg);
 int audioreach_setup_push_pull(struct q6apm_graph *graph, phys_addr_t bphys,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 0e02cadbc14b..a4502741d87f 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -560,24 +560,12 @@ int q6apm_get_hw_pointer(struct q6apm_graph *graph, int dir)
 }
 EXPORT_SYMBOL_GPL(q6apm_get_hw_pointer);
 
-/*
- * Convert a Q24 fixed-point value to its integer part, and to the first three
- * decimal places of its fractional part.
- */
-static int q6apm_q24_to_int_frac(int32_t val, int *frac)
-{
-	*frac = (int)(((s64)(val & 0xffffff) * 1000) >> 24);
-
-	return val >> 24;
-}
-
 static void q6apm_vi_calibration_event(struct device *dev,
 				       const struct apm_module_event *event,
 				       int payload_size)
 {
 	const struct event_id_vi_per_spkr_calibration *cali;
-	unsigned int num_ch, i;
-	int r0_int, r0_frac;
+	u32 num_ch;
 
 	if (payload_size < 0 || payload_size < (int)(sizeof(*event) + sizeof(*cali))) {
 		dev_err(dev, "VI calibration event truncated (%d bytes)\n",
@@ -589,27 +577,10 @@ static void q6apm_vi_calibration_event(struct device *dev,
 
 	/* Bound the array by the received payload, not by num_ch alone */
 	num_ch = (payload_size - sizeof(*event) - sizeof(*cali)) / sizeof(cali->cali_param[0]);
-	num_ch = min_t(unsigned int, cali->num_ch, num_ch);
-
-	for (i = 0; i < num_ch; i++) {
-		/* Only SUCCESS and FAILED carry a measured R0; both are worth reporting */
-		switch (cali->cali_param[i].state) {
-		case VI_CALIBRATION_STATE_SUCCESS:
-			break;
-		case VI_CALIBRATION_STATE_FAILED:
-			dev_dbg(dev, "VI calibration channel %u failed, R0/T0 out of range\n", i);
-			break;
-		default:
-			dev_dbg(dev, "VI calibration channel %u in state %u\n",
-				i, cali->cali_param[i].state);
-			continue;
-		}
+	num_ch = min_t(u32, cali->num_ch, num_ch);
+	num_ch = min_t(u32, num_ch, MAX_SP_VI_SPEAKERS);
 
-		r0_int = q6apm_q24_to_int_frac(cali->cali_param[i].r0_cali_q24, &r0_frac);
-		/* Raised every frame, so keep it at debug level */
-		dev_dbg(dev, "VI calibration channel %u: R0 %d.%03d ohms\n",
-			i, r0_int, r0_frac);
-	}
+	audioreach_vi_calibration_event(dev, cali, num_ch);
 }
 
 static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
-- 
2.47.3

