Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775902;
	b=kiuxFNdzVochvjLjCdsLWRzpXQ+ep1jtDojKs2XBdxH27TLQXXocVh+H/gn0rnyPPyH7
	 dnLpxPyoTXpHg24DqLo9BzfgXGhQ9KQFkZjphVpxxu+TZW8cdGFUmJmr/UJzlHVDz7vAS
	 qPZCrboq1P5GYhI/7HABISELTYLkxVnWbt/DbibXVHo8Wui+Y8+76bWeXzXS1ibT9CpNA
	 iuws7Hdf0+1dpLuuDjHqC1VYqYcZxnywI7fjMex13INxQk6A/LZ8iy3YcZHlxmxiq2a/n
	 9CUwP+WEb5s2bvqH9UnGWqRQPqKIqO42rcnc0bCGC6Gh4i930sz83hjW9lS3hmA6fLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775902;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IwyToYvHi1Bz1hiwX/Vbh3aizuwmjoh9pZ0oQh56Bzg=;
	b=vaUCTX8VuODqiE3FcKVumvq3WZbK8fd4DfQ7VXn8w91SBRUPOCr/A2HF6MIa4Ds350ML
	 0/OxB4fgHFHjOPliDvhItmwpZRoEA3YR+EJ++qk5ebDhh1tqhdkzkXNSs30ncsoWqnNtQ
	 f1LRLzBSdPfakx98ckoCuUJXzlr/kY3RzrGPh2NyiUb35Q3A26ZKR/PW5XKcdSOWjoB0x
	 hfscy7HFIWBWv1ISFUKoAYB4nhPbKRTLZAcHfETbzb9r3q2lrqYLBoelKZDn9bTphhK6V
	 WzI5m8eZ0D6vdJVwUAUrX1dKW1nUzQr3pCxiVBefDszwUDN0hfobAuVYbCrzSngKmuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mT1oskss;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AiHNwOuN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B42606AA37
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07B42606AA37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mT1oskss;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AiHNwOuN
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6C0i2462551
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IwyToYvHi1B
	z1hiwX/Vbh3aizuwmjoh9pZ0oQh56Bzg=; b=mT1oskssTjY7dBGpzuiuOrktApn
	bhOZBSmGiZAmLju25udAAhAtKjb2/Sc35c3cRJLQ8DOi5pupSe9RkmcW3iDZuTWP
	KF5Ip2MH2RSWl6IslStlV+B8HDFjWbN52Gw9RFY9CLDOsGdjTX+qSkmDI4sGofzU
	DkBDrbno5csT/wro47uPViLDBUtaWsY0qp7/u7Chm77VbI5Vy8BtdqrGm0XOJutX
	q257b1ojOWmcLkZ7U3ngKVI3oaPOwYfQCh/rJagofXOAfaVVcLuhG+achAcLGD7z
	XZmLsUYiOz3I1f1akBYLy3dtdmfStvu11mC1YVKlElerV4xRJfi6RKUWzaQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtvskn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so203786285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775900; x=1793380700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IwyToYvHi1Bz1hiwX/Vbh3aizuwmjoh9pZ0oQh56Bzg=;
        b=AiHNwOuNOaUC3/bX2eQvupYiaKojtMMQIbzy9lW6svvpPd5CszS1ijqVgQwjWYiRnt
         hj0cHpuYgjAMz4tSePlPTQs4iuPT/iBfsDxu1k/3tgAtaNr5dM40TLSf/B1xOJneGefM
         0E32YKeQ6oyLljAqoZzAw9tX2H1EwYSf9HstNmvrLMn4EIK/Gs4JmHgbg1Z/ULBoHaWG
         tMpc8zWhDnf6UXESKS7e6BW+p8t3FoE1WKGkde0XwE5ts386jHiZI1LqIaw9qNMqE3wC
         CMaoLhW211p2qnr8zeEfuqumLH7qRKE+9YPzLviTsmIqDJRhIXAI5S7Od7ll3pvTUlWd
         CViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775900; x=1793380700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IwyToYvHi1Bz1hiwX/Vbh3aizuwmjoh9pZ0oQh56Bzg=;
        b=kigl99KPs2s9SBIO+3QLnPNTygXLr8Jdb3chWDhX6ZU9dKIB1pgKr0zJEyOxe84jis
         UQfgiMcuRQJKtDks85XSRfl0i3A5ixMchCfkJoUQWIXcS1AhAGRUh1CyPJhqghdD/Il+
         t4wgj+vW5cOEQLNojiJFq9ogUkbeT83H50saySI6bOSCbiRMP9hwR/qdD45gSFGSxXjv
         DoRx/dnoV0CQx1vz6eNz73TGCOOI5WSY0wBnfGLTMlLN8MPve2iMceY2qmzYO5r85Llp
         /WTRSDcIh/IANzcTfJ07AQnveQg8vS/7vJ0HII6IPas98RqqO8N1jcxG5vDi1mOQ8yfZ
         OEeQ==
X-Forwarded-Encrypted: i=1; AKwUvBypNhE00IGAQZsg1cf0+KwAbkDufnjt9VAJN6oY3GcLFj3nDhfVTxeK3FhR2xkwAe9WW8tl3ZJHXDmhQJw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLP7ak2cxk50YuWPBmr+mCLcybCA/WU9WMd0dWgo+56j7+Y8yZs
	Zz2JpWGop/GfRomdZim1JHcuu7CTQYlXBwEFIPokeI0dYfpn/E61x05MgoUjQCg11uHQQ3Cszvh
	4BmKtmdxkSWqsruUYVhMqhP1J10r99ujLPM535xoKb45Ixks/O7Xvb8NtQCX0Lenh1dg=
X-Gm-Gg: AYBFou2FMHFIgN+rHYbfqqJsgXI2ZHNcAiRvJgCL/6VVd1FS9IUZUx061kP7qRleMUX
	REbRlyl/D7hejpmX8X9XJQtfdYb0uxrP9Faox0ZzMno8wPyOUGVQUigSORzKPRJBrX5LuP40vsr
	X514ZWwxgFgTD65cifHK78Nlqkhr5/fmZUD+AdSYgXeEXHAaBULwuaswLmgz3LrwOU27JmI6fcC
	vB0TZgR/6U3Rm1AqOpYCebZk44ce3AZgwQf2wT8jyF1Hga+t/Q+0uWfTCPuP4zHfShRII9oOVc3
	QbDurBXZm9N82Lr4uw1HWw8y66hb/M2t7Dt6Fxj1R2m979GK9YHUtRpsxX0yuAGAy01kybU+I1j
	TqeZ47ECU0SEY
X-Received: by 2002:a05:620a:3704:b0:93f:8f9:7a83 with SMTP id af79cd13be357-93f627dabaemr1009220985a.43.1792775900161;
        Fri, 23 Oct 2026 10:18:20 -0700 (PDT)
X-Received: by 2002:a05:620a:3704:b0:93f:8f9:7a83 with SMTP id af79cd13be357-93f627dabaemr1009217285a.43.1792775899700;
        Fri, 23 Oct 2026 10:18:19 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:18 -0700 (PDT)
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
Subject: [RFC PATCH 18/23] ASoC: qcom: audioreach: add speaker protection calibration state control
Date: Fri, 23 Oct 2026 18:14:28 +0100
Message-ID: <20261023171433.820092-19-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb96dd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=kkz25WANwqfBvfs1KZUA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: QpyIqtwyYQwSDiUkUQYRf196HmmbF0dB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX0D657o2z9Wq0
 JIg79yEyBuDY6DyuDv0ZnxWnDJhE1QYLnOahSQb00RcsEgHdqezdGuSA8/StDDWgiljjTdGBg//
 bfoDnbTVjOq6LIkROyMWpipobHTpMQn0UC1AqFQg0gWNFywEzKpZ4dVfsEWZj8ckEEwa1V6zoPr
 aDXSUHSAYgn90HzLWz0+RP3adKobRC0IHzI+btDlKe3T62ioe8nq6Krc8HeLAcAdtSYcP71PzuS
 91QsxG3ZTnJbXixWlf3ieijysx7oQd31UVs2hmjS84ZEPt4Tygyl7ryHHb9J2Nx9uDOjH9yHtQ2
 OkjtMxa+UPF+5ubvEIDwalFPN2IjPZbr4TftSDbqN9Rl4O+p95V70jYhpfP/0cMb5m12SSdRSlz
 lBGwK0wG1TfYLpg81sKkGaQV4b9xsqehsJzoXe8wr+bi56YEkNY7UzuuthpfP3vYW6krRgnYx4j
 PyCZCnFrt+K6sF0vLtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX9MQv6R/wFxOT
 2f6Wc1YaYCdlVTk+P6lMU8/NJABFGXbKKpWxUvuLW0xs+UzjTna8g0eAaA1IoqvPzpi2f4WWFub
 40H4/IBgu/T5yXsv8Awu4KsarGkf7ps=
X-Proofpoint-ORIG-GUID: QpyIqtwyYQwSDiUkUQYRf196HmmbF0dB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

Add a read-only "Speaker Protection Calibration State" control with
each speaker's last calibration state, so userspace can follow a run.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 51 +++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  2 ++
 sound/soc/qcom/qdsp6/q6apm.c      | 15 ++++++++-
 sound/soc/qcom/qdsp6/topology.c   | 18 +++++++++++
 4 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index f05033cc3f7d..3eba0a9a0372 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -21,6 +21,7 @@ enum sp_vi_cali_state {
 	SP_VI_CALI_RUNNING,	/* Events arriving, none decisive yet */
 	SP_VI_CALI_FAILED,	/* Run finished, no usable R0 */
 	SP_VI_CALI_SUCCESS,	/* Run finished, @r0_cali_q24 valid */
+	SP_VI_CALI_ABORTED,	/* Graph stopped before the run finished */
 };
 
 struct sp_vi_r0_result {
@@ -28,6 +29,8 @@ struct sp_vi_r0_result {
 	u32 num_ch;
 	s32 r0_cali_q24[MAX_SP_VI_SPEAKERS];
 	u32 seen_states[MAX_SP_VI_SPEAKERS];
+	/* Last calibration state per speaker (enum vi_calibration_state) */
+	u32 last_state[MAX_SP_VI_SPEAKERS];
 };
 
 static struct sp_vi_r0_result sp_vi_r0;
@@ -1616,6 +1619,21 @@ int audioreach_get_sp_vi_t0(long *vals, unsigned int count)
 }
 EXPORT_SYMBOL_GPL(audioreach_get_sp_vi_t0);
 
+/* Latest calibration state per speaker, 0 before any event */
+int audioreach_get_sp_vi_cal_state(long *vals, unsigned int count)
+{
+	unsigned int i;
+
+	guard(mutex)(&sp_vi_r0_lock);
+
+	count = min(count, MAX_SP_VI_SPEAKERS);
+	for (i = 0; i < count; i++)
+		vals[i] = sp_vi_r0.last_state[i];
+
+	return count;
+}
+EXPORT_SYMBOL_GPL(audioreach_get_sp_vi_cal_state);
+
 int audioreach_set_sp_vi_r0t0(struct device *dev, const long *vals, unsigned int count)
 {
 	struct sp_vi_r0t0_cfg new = {};
@@ -1695,6 +1713,8 @@ void audioreach_vi_calibration_event(struct device *dev,
 	for (i = 0; i < num_ch; i++) {
 		u32 state = cali->cali_param[i].state;
 
+		sp_vi_r0.last_state[i] = state;
+
 		if (sp_vi_cali_state_is_failure(state))
 			success = false;
 		else if (!sp_vi_cali_state_is_terminal(state))
@@ -1753,6 +1773,37 @@ void audioreach_vi_calibration_event(struct device *dev,
 	dev_info(dev, "VI calibration complete: %s\n", success ? "success" : "failed");
 }
 
+/* A run cut short never reports a final state, close it out */
+void audioreach_vi_calibration_abort(struct device *dev)
+{
+	unsigned int i;
+
+	guard(mutex)(&sp_vi_r0_lock);
+
+	if (sp_vi_r0.state != SP_VI_CALI_RUNNING)
+		return;
+
+	sp_vi_r0.state = SP_VI_CALI_ABORTED;
+
+	for (i = 0; i < MAX_SP_VI_SPEAKERS; i++) {
+		u32 state = sp_vi_r0.last_state[i];
+
+		/* Slot never reported: not part of this run */
+		if (!sp_vi_r0.seen_states[i])
+			continue;
+
+		if (sp_vi_cali_state_is_terminal(state))
+			continue;
+
+		dev_info(dev, "VI calibration channel %u: aborted while %s\n",
+			 i, sp_vi_cali_state_name(state));
+		sp_vi_r0.last_state[i] = VI_CALIBRATION_STATE_INACTIVE;
+	}
+
+	dev_info(dev, "VI calibration aborted: graph stopped before the DSP finished\n");
+}
+EXPORT_SYMBOL_GPL(audioreach_vi_calibration_abort);
+
 static int audioreach_speaker_protection(struct q6apm_graph *graph,
 					 const struct audioreach_module *module)
 {
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 7345b6d15f58..6a08f52b7786 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -1141,10 +1141,12 @@ int audioreach_set_sp_vi_r0t0(struct device *dev, const long *vals, unsigned int
 int audioreach_sp_register_speaker_map(struct thermal_zone_device * const *tzs,
 				       unsigned int num);
 int audioreach_get_sp_vi_t0(long *vals, unsigned int count);
+int audioreach_get_sp_vi_cal_state(long *vals, unsigned int count);
 int audioreach_add_sp_telemetry_controls(struct snd_soc_component *component);
 void audioreach_vi_calibration_event(struct device *dev,
 				     const struct event_id_vi_per_spkr_calibration *cali,
 				     u32 num_ch);
+void audioreach_vi_calibration_abort(struct device *dev);
 int audioreach_compr_set_param(struct q6apm_graph *graph,
 			       const struct audioreach_module_config *mcfg);
 int audioreach_setup_push_pull(struct q6apm_graph *graph, phys_addr_t bphys,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index a4502741d87f..41daa02febf4 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -813,10 +813,19 @@ struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
 }
 EXPORT_SYMBOL_GPL(q6apm_graph_open);
 
+static void q6apm_graph_abort_vi_calibration(struct q6apm_graph *graph)
+{
+	if (q6apm_find_module_by_mid(graph, MODULE_ID_SPEAKER_PROTECTION_VI))
+		audioreach_vi_calibration_abort(graph->dev);
+}
+
 int q6apm_graph_close(struct q6apm_graph *graph)
 {
 	struct audioreach_graph *ar_graph = graph->ar_graph;
 
+	/* Covers a graph closed without ever being started, e.g. on prepare failure */
+	q6apm_graph_abort_vi_calibration(graph);
+
 	graph->ar_graph = NULL;
 	kref_put(&ar_graph->refcount, q6apm_put_audioreach_graph);
 	gpr_free_port(graph->port);
@@ -852,6 +861,7 @@ EXPORT_SYMBOL_GPL(q6apm_graph_start);
 int q6apm_graph_stop(struct q6apm_graph *graph)
 {
 	struct audioreach_graph *ar_graph = graph->ar_graph;
+	int ret;
 
 	if (ar_graph->start_count == 0)
 		return 0;
@@ -859,7 +869,10 @@ int q6apm_graph_stop(struct q6apm_graph *graph)
 	if (--ar_graph->start_count > 0)
 		return 0;
 
-	return audioreach_graph_mgmt_cmd(ar_graph, APM_CMD_GRAPH_STOP);
+	ret = audioreach_graph_mgmt_cmd(ar_graph, APM_CMD_GRAPH_STOP);
+	q6apm_graph_abort_vi_calibration(graph);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(q6apm_graph_stop);
 
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 8bc681a633d8..75381d9a1435 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1551,6 +1551,15 @@ static int audioreach_get_sp_t0(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int audioreach_get_sp_cal_state(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	audioreach_get_sp_vi_cal_state(ucontrol->value.integer.value,
+				       MAX_SP_VI_SPEAKERS);
+
+	return 0;
+}
+
 static const struct snd_kcontrol_new audioreach_sp_telemetry_controls[] = {
 	{
 		.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,
@@ -1560,6 +1569,15 @@ static const struct snd_kcontrol_new audioreach_sp_telemetry_controls[] = {
 		.info	= audioreach_info_sp_t0,
 		.get	= audioreach_get_sp_t0,
 	},
+	{
+		.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name	= "Speaker Protection Calibration State",
+		.access	= SNDRV_CTL_ELEM_ACCESS_READ |
+			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		/* Last calibration state per speaker (enum vi_calibration_state) */
+		.info	= audioreach_info_sp_t0,
+		.get	= audioreach_get_sp_cal_state,
+	},
 };
 
 /* Kept apart from the topology SP controls, so FEs have them without it */
-- 
2.47.3

