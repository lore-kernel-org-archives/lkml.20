Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775891;
	b=M3t6powFwdbNVRzJx5UUPrX6dmn4dUgVNDEG9zwKr1wQMurFe/+PKtT2pl4FDLSEOj7d
	 dhbd0eVjrmLPJ3+0fJcgG1e2C/+3PIhTjZJ7jS3miJalC3U99gkbDIIVoqoU1Wfl3LoDV
	 VTy1vNZ01BWBoPoMcnuq47S4Nllz31qhXzmGfOvS662BmQ9/3iPlDLko3iBJUgn+nLLaW
	 V/xBiHum5F2G05MIXtMe46ejrtY9LM14tnShtmou0FYomKRFrp2XLNZK4dDaLqSIe+dwY
	 YT5VkySfj9070o0VuAZ3fQHWmaQKIxOtA4BJaIxiwCzKT+S6wQCvsLDWZPJXbhotYcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775891;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZMEl1ZvfXo6Wbrob9hc0DbCtcYILed43sPXM8KrPWi8=;
	b=1jspuTax/WvxhbudyY3B0uMnfC8CftvZh8GhqAkZdN2+sBkhlZAA8UlA9gbl8pS/hu6h
	 swanoU2fJhezj0ckmH3GltUOg4xZRnXDu5NE4gAKzzvj/LQPUMovooMkQ7oa8WxSM6Utj
	 sjP2bZjX4tb2bzmtBs19dDK8b3XNyuP6pNtLI3ZdqZ8+7k133CendFUMnYu02SfEqEigH
	 HYNHedNrxb6WqQF+LQIPOmOyuLx09mvtTB8JA3TXLxjjMTvIgryRe6MIs35+be81DF4j1
	 Y+Vsc5y7aNEo9l/ha26U2DjBTCOuIl/K573LJ3nkB+O0Jrzc8Jh8cKlloBdj1xXbVKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGJfnuK8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WrS+X+Ps;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CC1606CA05
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30CC1606CA05
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGJfnuK8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WrS+X+Ps
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5xkT2109275
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZMEl1ZvfXo6
	Wbrob9hc0DbCtcYILed43sPXM8KrPWi8=; b=YGJfnuK8lbXkG3AECT9VuaOHy4j
	vRZPDzh4J/M0b3ToazSyEwNOhZnUwz6BGEhBLPr3UpBVtXsz8mIDg74NZbnVLo2K
	gXuoNsANsSWfyJ1uuqsW4k7km950MyxrBXg9yNI/N4jPbdv2jD+lL5pVrxDazkuE
	OqjSaHp5v5OLsm532Nzid0hDHb7BACq+inG7OL2lQozhdBATd9MLEwOUDZSg0gcp
	QkpPI0bzyP9EY7l97TljeB4PfmVPiUDjdeIvmU+cVO+0/++Gj+lX4e7Cw8mhuxjZ
	paoMyWpgmtqzFZOvjFrRh17u6sqJEQAeiqt0SsjjcUgl2K1QpQUWcHhc0bA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms4qw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb6391e89so242621185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775889; x=1793380689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZMEl1ZvfXo6Wbrob9hc0DbCtcYILed43sPXM8KrPWi8=;
        b=WrS+X+Ps+1jtWTUi+/LzMFtCLCexxSwS217lPrH7wKTnhxoHCH+5stN9Hru2fnrP5b
         YOvSWB7m6hGFgnRoaQqaxry5uayv8Vk5OUtPpi9O9rPid0iSIjrXsnadUxg6bK3QJSwC
         SXFjKnrszqPSwrT2YbImHHsXJUP5t7S9E43wd70at7GzXOg3gmpvf8pSmgItrC8BZN0W
         fK7UxcbevtJ30GWB9iAlcbZ+bJn/U8sqFRXW2yDyf29AOZFQlECblWoiV1Nflu+EXczI
         FequaVYuWUvlLp/RGC9dZyFPgXwa30XYEjA4IXutqjpfz4tMWlvgndBL6uMfL96f582A
         UzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775889; x=1793380689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZMEl1ZvfXo6Wbrob9hc0DbCtcYILed43sPXM8KrPWi8=;
        b=EjaSTX9kK75ygupFkFwxjAG7cNY6nt56bX4bXv7QnotJlWlbPbRRZOCJnUIxWI5CgM
         BF4R8B8O00IoFwtHjuqiFjl56q6CTU+5FVkgEsTgpiyAnLCfOFWkiCz0zitoQ5B5LJNx
         Jt4sZ+x9J0fSCg4DgyHOz8HJa+w0k2VeBgBjalqHD23G7E8NSQfQ8zTiQUxVAGBnWvI9
         AyWEB1HtKj2EvkEYjtmztoD3d/HOdz872nehoazjF3VgoqImoZJ7MhkqnIYgGD8xODuJ
         /pg4EA2yqvpIuN1whNZ/GXjiGS2fFm+D68FoCyTYtyllXDGTGMQ5r47YmFC9TdUWKITI
         UVoA==
X-Forwarded-Encrypted: i=1; AKwUvBxnCaCLLsHP2pMy2x4BA28D3snVdCRk3IYgrBCWJm3qxGwlewrgxloCdDDhcJV+1jMRLNu8E+vlhtFAE/s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMIcwVCgApvgUBQW/itLpLGNR94hw4M9nq8mCryFRqjgBZDfb+
	wZquWqPQDKNo7Rld5O1m1nHuCdHWRL8xejcsAKIWjbzrka2JhJdRd+2uyFdA3crg7A9vXxXuPT0
	cTQpwDsqnAKn+QD/txB7+1BvhqabZXfPQR3mkQmndEJhhDQefTFd+AceXCztnH/hH+tg=
X-Gm-Gg: AYBFou1TVzOq2unv1/jyd5EWnMCBmTLJzmh5UP/zncChviATkHQOV/wzUG2pGlP/PJz
	K7efFwCKITl18+qVRwiS3OFH8CZbjI0Y1SpE8ggA9lNHOPTPUUKjWVhmEwskUf/If96RQwmOLn7
	c3iYHdDLWBb+YUMSl8NDZ+uSLBnKZhbLGgI/EF1fxAGT5k+KoyP7yfSAPFZNrc0R8lOY54BJK9n
	L+8VQH8X2/kclSbfsuWBJNEBRylnfHw2fThmwwtGW5EHt/t44G2mbnKHzEt94QRIsVSckf+DVFI
	kHkbTwpUdBvq1cYAbanGiVgOPi/wsrsVYFgk5gEY1ZUQ2xeY0J/nEFBoZnHSoVxQczujWxHripA
	F8raWFH9HFvYo
X-Received: by 2002:a05:620a:690e:b0:93e:c12c:43f7 with SMTP id af79cd13be357-93f6f86e1c5mr485525685a.68.1792775888947;
        Fri, 23 Oct 2026 10:18:08 -0700 (PDT)
X-Received: by 2002:a05:620a:690e:b0:93e:c12c:43f7 with SMTP id af79cd13be357-93f6f86e1c5mr485452785a.68.1792775879329;
        Fri, 23 Oct 2026 10:17:59 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:58 -0700 (PDT)
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
Subject: [RFC PATCH 07/23] ASoC: qcom: audioreach: add control link support to graphs
Date: Fri, 23 Oct 2026 18:14:17 +0100
Message-ID: <20261023171433.820092-8-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX6OeVXe+QAFZM
 2UMxQ3pByKgbAGPENiTyxYF+tr7ds3F1oQGeXwoguLMnjjqnbhP1N0IigSnd4J5sYGm6vy9IH6X
 WVci0IrBrZjQfJiHhgb4QDTEqK/UbbPaeS/82yr/XMep1kAo3gdvQz7Wa1xubc0l81kSbkXa2kZ
 Zh1xrh+Ka7SHdm6TADEIf7pHfVLC+IbPYLZ5iFxMkLwr2JsG9VkFIExsC+se536SBAXSiNtl4FQ
 m/J/W+IJyVaOPSk/nyMbyKG64RXf9sSh4p6HEePcbXoW7tyKK3xhuk6yRJWMncX/ZhPS0b2eA4W
 Azm+jjSPrVpb2lwCpuIZDcaCL0rmVIlwvBO9sgTDrCYJDCP9tJGCg8aom6qmOUabZ3tcHblvSXM
 hD4eWRThXbuSN11t8KQcWqwdP4tXEvrL2cOdUh64L+r+e7ocXnzsfhHATaKWrWDREaWX5LrkjkZ
 oqpCz8ixgxo40ImKO6Q==
X-Proofpoint-GUID: v_-1PYTgx9bLbXG54scl0Tq83WO1rUX0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX7Cz3H8e3uRGr
 lY+RUdYPsWv/vgk06HvEyezOoJZuJ9zpu5NVbnrYXF1SVpgK08M4ojlLFBScESWkr9OSTUEOuhz
 vaZiqMqaG8WeIa0J8Z8r9mv2rTGUWNE=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb96d2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=8-O9kgZlvKaYWh8tphcA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: v_-1PYTgx9bLbXG54scl0Tq83WO1rUX0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

The speaker protection modules exchange calibration state over a
control link, which the topology describes but the driver never sends
to the DSP.

Parse the control link tokens into a per-subgraph list and add them to
GRAPH_OPEN. Both subgraphs of a link usually declare it and the DSP
rejects a duplicate, so send each pair once.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/uapi/sound/snd_ar_tokens.h |  11 +++
 sound/soc/qcom/qdsp6/audioreach.c  |  90 +++++++++++++++++--
 sound/soc/qcom/qdsp6/audioreach.h  |  18 ++++
 sound/soc/qcom/qdsp6/q6apm.c       |   1 +
 sound/soc/qcom/qdsp6/q6apm.h       |   1 +
 sound/soc/qcom/qdsp6/topology.c    | 134 +++++++++++++++++++++++++++++
 6 files changed, 250 insertions(+), 5 deletions(-)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index cf8ab6b85e34..7ab8e11ca5c2 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -234,6 +234,17 @@ enum ar_event_types {
 #define AR_TKN_U32_SUB_GRAPH_DIRECTION		4
 #define AR_TKN_U32_SUB_GRAPH_SCENARIO_ID	5
 
+/* Control Link Tokens */
+#define AR_TKN_U32_CONTROL_LINK_IID		50
+#define AR_TKN_U32_CONTROL_LINK_PEER1_MOD_IID	51
+#define AR_TKN_U32_CONTROL_LINK_PEER1_MOD_PORT_ID	52
+#define AR_TKN_U32_CONTROL_LINK_PEER2_MOD_IID	53
+#define AR_TKN_U32_CONTROL_LINK_PEER2_MOD_PORT_ID	54
+#define AR_TKN_U32_CONTROL_LINK_INTENT0		55
+#define AR_TKN_U32_CONTROL_LINK_INTENT1		56
+#define AR_TKN_U32_CONTROL_LINK_INTENT2		57
+#define AR_TKN_U32_CONTROL_LINK_INTENT3		58
+
 /* Container Tokens */
 #define AR_TKN_U32_CONTAINER_INSTANCE_ID	100
 #define AR_TKN_U32_CONTAINER_CAPABILITY_ID	101
diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index d2dc5d37bccf..9e45634cafbc 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -109,6 +109,26 @@ struct apm_mod_conn_list_params {
 
 #define APM_MOD_CONN_PSIZE(p, n) ALIGN(struct_size(p, conn_obj, n), 8)
 
+/* Control Links */
+struct apm_control_link_obj {
+	u32 peer1_mod_inst_id;
+	u32 peer1_mod_port_id;
+	u32 peer2_mod_inst_id;
+	u32 peer2_mod_port_id;
+	u32 num_props;
+	struct apm_prop_data intent_data;
+	u32 num_intents;
+	u32 intent_id_list[MAX_INTENTS];
+} __packed;
+
+struct apm_mod_control_links_params {
+	struct apm_module_param_data param_data;
+	u32 num_ctrl_link_cfg;
+	struct apm_control_link_obj link_obj[];
+} __packed;
+
+#define APM_MOD_CTRL_LINK_PSIZE(p, n) ALIGN(struct_size(p, link_obj, n), 8)
+
 struct apm_graph_open_params {
 	struct apm_cmd_header *cmd_header;
 	struct apm_sub_graph_params *sg_data;
@@ -116,6 +136,7 @@ struct apm_graph_open_params {
 	struct apm_module_list_params *mod_list_data;
 	struct apm_prop_list_params *mod_prop_data;
 	struct apm_mod_conn_list_params *mod_conn_list_data;
+	struct apm_mod_control_links_params *mod_control_links_data;
 } __packed;
 
 struct apm_pcm_module_media_fmt_cmd {
@@ -410,24 +431,26 @@ static void audioreach_populate_graph(struct q6apm *apm,
 				      const struct list_head *sg_list,
 				      int num_sub_graphs)
 {
+	struct apm_mod_control_links_params *cl_data = open->mod_control_links_data;
 	struct apm_mod_conn_list_params *mc_data = open->mod_conn_list_data;
 	struct apm_module_list_params *ml_data = open->mod_list_data;
 	struct apm_prop_list_params *mp_data = open->mod_prop_data;
 	struct apm_container_params *c_data = open->cont_data;
 	struct apm_sub_graph_params *sg_data = open->sg_data;
-	int ncontainer = 0, nmodule = 0, nconn = 0;
+	int ncontainer = 0, nmodule = 0, nconn = 0, nlink = 0;
 	struct apm_mod_prop_obj *module_prop_obj;
 	struct audioreach_container *container;
+	struct audioreach_control_link *clink;
+	struct apm_control_link_obj *clink_obj;
 	struct apm_module_conn_obj *conn_obj;
 	struct audioreach_module *module;
 	struct audioreach_sub_graph *sg;
 	struct apm_container_obj *cobj;
 	struct apm_mod_list_obj *mlobj;
-	int i = 0;
+	int i = 0, j;
 
 	mlobj = &ml_data->mod_list_obj[0];
 
-
 	if (info->dst_mod_inst_id && info->src_mod_inst_id) {
 		conn_obj = &mc_data->conn_obj[nconn];
 		conn_obj->src_mod_inst_id = info->src_mod_inst_id;
@@ -442,6 +465,47 @@ static void audioreach_populate_graph(struct q6apm *apm,
 
 		apm_populate_sub_graph_config(sg_cfg, sg);
 
+		list_for_each_entry(clink, &sg->control_link_list, node) {
+			bool dup = false;
+			int k;
+
+			/* Both subgraphs usually declare the link, send it once */
+			for (k = 0; k < nlink; k++) {
+				struct apm_control_link_obj *o = &cl_data->link_obj[k];
+
+				if ((o->peer1_mod_inst_id == clink->peer1_mod_inst_id &&
+				     o->peer2_mod_inst_id == clink->peer2_mod_inst_id) ||
+				    (o->peer1_mod_inst_id == clink->peer2_mod_inst_id &&
+				     o->peer2_mod_inst_id == clink->peer1_mod_inst_id)) {
+					dup = true;
+					break;
+				}
+			}
+			if (dup)
+				continue;
+
+			clink_obj = &cl_data->link_obj[nlink++];
+			clink_obj->peer1_mod_inst_id = clink->peer1_mod_inst_id;
+			clink_obj->peer1_mod_port_id = clink->peer1_mod_port_id;
+			clink_obj->peer2_mod_inst_id = clink->peer2_mod_inst_id;
+			clink_obj->peer2_mod_port_id = clink->peer2_mod_port_id;
+			clink_obj->intent_data.prop_id = APM_MODULE_PROP_ID_CTRL_LINK_INTENT_LIST;
+			clink_obj->num_props = 1;
+			clink_obj->num_intents = 0;
+
+			/* Pack the intents that are set into a dense list */
+			for (j = 0; j < MAX_INTENTS; j++) {
+				if (clink->intent[j])
+					clink_obj->intent_id_list[clink_obj->num_intents++] =
+						clink->intent[j];
+			}
+
+			/* The list length itself is part of the property payload */
+			clink_obj->intent_data.prop_size =
+				sizeof(clink_obj->num_intents) +
+				clink_obj->num_intents * sizeof(clink_obj->intent_id_list[0]);
+		}
+
 		list_for_each_entry(container, &sg->container_list, node) {
 			cobj = &c_data->cont_obj[ncontainer];
 
@@ -477,12 +541,16 @@ static void audioreach_populate_graph(struct q6apm *apm,
 			ncontainer++;
 		}
 	}
+
+	/* The dedupe above may have packed fewer links */
+	cl_data->num_ctrl_link_cfg = nlink;
 }
 
 void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 				 const struct audioreach_graph_info *info)
 {
-	int payload_size, sg_sz, cont_sz, ml_sz, mp_sz, mc_sz;
+	int payload_size, sg_sz, cl_sz, cont_sz, ml_sz, mp_sz, mc_sz;
+	struct apm_mod_control_links_params *clink_params;
 	struct apm_module_param_data  *param_data;
 	struct apm_container_params *cont_params;
 	struct audioreach_container *container;
@@ -494,6 +562,7 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 	struct audioreach_sub_graph *sgs;
 	struct apm_mod_list_obj *mlobj;
 	const struct list_head *sg_list;
+	int num_control_links = 0;
 	int num_connections = 0;
 	int num_containers = 0;
 	int num_sub_graphs = 0;
@@ -511,6 +580,7 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 
 	list_for_each_entry(sgs, sg_list, node) {
 		num_sub_graphs++;
+		num_control_links += sgs->num_control_links;
 		list_for_each_entry(container, &sgs->container_list, node) {
 			num_containers++;
 			num_modules += container->num_modules;
@@ -526,13 +596,14 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 	num_modules_list = num_containers;
 	sg_sz = APM_SUB_GRAPH_PSIZE(sg_params, num_sub_graphs);
 	cont_sz = APM_CONTAINER_PSIZE(cont_params, num_containers);
+	cl_sz = APM_MOD_CTRL_LINK_PSIZE(clink_params, num_control_links);
 
 	ml_sz = ALIGN(ml_sz, 8);
 
 	mp_sz = APM_MOD_PROP_PSIZE(mprop, num_modules);
 	mc_sz =	APM_MOD_CONN_PSIZE(mcon, num_connections);
 
-	payload_size = sg_sz + cont_sz + ml_sz + mp_sz + mc_sz;
+	payload_size = sg_sz + cl_sz + cont_sz + ml_sz + mp_sz + mc_sz;
 	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_GRAPH_OPEN, 0);
 	if (IS_ERR(pkt))
 		return pkt;
@@ -584,6 +655,15 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 	params.mod_conn_list_data->num_connections = num_connections;
 	p += mc_sz;
 
+	/* Control Links */
+	params.mod_control_links_data = p;
+	param_data = &params.mod_control_links_data->param_data;
+	param_data->module_instance_id = APM_MODULE_INSTANCE_ID;
+	param_data->param_id = APM_PARAM_ID_MODULE_CTRL_LINK_CFG;
+	param_data->param_size = cl_sz - APM_MODULE_PARAM_DATA_SIZE;
+	params.mod_control_links_data->num_ctrl_link_cfg = num_control_links;
+	p += cl_sz;
+
 	audioreach_populate_graph(apm, info, &params, sg_list, num_sub_graphs);
 
 	return pkt;
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 587f14ce71d2..38b71aefd845 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -171,6 +171,9 @@ struct apm_module_conn_obj {
 	uint32_t dst_mod_ip_port_id;
 } __packed;
 
+#define APM_PARAM_ID_MODULE_CTRL_LINK_CFG	0x08001061
+#define APM_MODULE_PROP_ID_CTRL_LINK_INTENT_LIST	0x08001062
+
 #define APM_PARAM_ID_GAIN			0x08001006
 
 struct param_id_gain_cfg {
@@ -893,6 +896,19 @@ struct audioreach_graph_info {
 	uint32_t dst_mod_ip_port_id;
 };
 
+#define MAX_INTENTS 4
+
+struct audioreach_control_link {
+	uint32_t id;
+	uint32_t peer1_mod_inst_id;
+	uint32_t peer1_mod_port_id;
+	uint32_t peer2_mod_inst_id;
+	uint32_t peer2_mod_port_id;
+	uint32_t intent[MAX_INTENTS];
+	struct list_head node;
+	struct audioreach_sub_graph *sub_graph;
+};
+
 struct audioreach_sub_graph {
 	uint32_t sub_graph_id;
 	uint32_t perf_mode;
@@ -903,6 +919,8 @@ struct audioreach_sub_graph {
 	struct audioreach_graph_info *info;
 	uint32_t num_containers;
 	struct list_head container_list;
+	uint32_t num_control_links;
+	struct list_head control_link_list;
 };
 
 struct audioreach_container {
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index b6b1ef6833b3..bb2f18a64644 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -885,6 +885,7 @@ static int apm_probe(gpr_device_t *gdev)
 	idr_init(&apm->graph_info_idr);
 	idr_init(&apm->sub_graphs_idr);
 	idr_init(&apm->containers_idr);
+	idr_init(&apm->control_links_idr);
 
 	idr_init(&apm->modules_idr);
 
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 9092359ccf90..96409075b294 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -67,6 +67,7 @@ struct q6apm {
 	struct idr graph_info_idr;
 	struct idr sub_graphs_idr;
 	struct idr containers_idr;
+	struct idr control_links_idr;
 	struct idr modules_idr;
 };
 
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 612d8f03e6e9..5de7e821e5f4 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -97,6 +97,7 @@ static struct audioreach_sub_graph *audioreach_tplg_alloc_sub_graph(struct q6apm
 		return ERR_PTR(-ENOMEM);
 
 	INIT_LIST_HEAD(&sg->container_list);
+	INIT_LIST_HEAD(&sg->control_link_list);
 
 	mutex_lock(&apm->lock);
 	ret = idr_alloc_u32(&apm->sub_graphs_idr, sg, &sub_graph_id, sub_graph_id, GFP_KERNEL);
@@ -113,6 +114,51 @@ static struct audioreach_sub_graph *audioreach_tplg_alloc_sub_graph(struct q6apm
 	return sg;
 }
 
+static struct audioreach_control_link *audioreach_tplg_alloc_control_link(struct q6apm *apm,
+							    struct audioreach_sub_graph *sg,
+							    uint32_t control_link_id,
+							    bool *found)
+{
+	struct audioreach_control_link *link;
+	int ret;
+
+	if (!control_link_id)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&apm->lock);
+	link = idr_find(&apm->control_links_idr, control_link_id);
+	mutex_unlock(&apm->lock);
+
+	if (link) {
+		*found = true;
+		return link;
+	}
+	*found = false;
+
+	link = kzalloc_obj(*link);
+	if (!link)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_lock(&apm->lock);
+	ret = idr_alloc_u32(&apm->control_links_idr, link, &control_link_id, control_link_id,
+			    GFP_KERNEL);
+	mutex_unlock(&apm->lock);
+
+	if (ret < 0) {
+		dev_err(apm->dev, "Failed to allocate Control Link ID (%x)\n", control_link_id);
+		kfree(link);
+		return ERR_PTR(ret);
+	}
+
+	link->id = control_link_id;
+	link->sub_graph = sg;
+	/* add to control link list */
+	list_add_tail(&link->node, &sg->control_link_list);
+	sg->num_control_links++;
+
+	return link;
+}
+
 static struct audioreach_container *audioreach_tplg_alloc_container(struct q6apm *apm,
 							    struct audioreach_sub_graph *sg,
 							    uint32_t container_id,
@@ -348,6 +394,85 @@ audioreach_get_module_priv_data(const struct snd_soc_tplg_private *private)
 	return NULL;
 }
 
+static void audioreach_parse_control_link_tokens(struct q6apm *apm,
+						 struct audioreach_control_link *link,
+						 const struct snd_soc_tplg_vendor_array *cl_array)
+{
+	const struct snd_soc_tplg_vendor_value_elem *cl_elem = cl_array->value;
+	int tkn_count = 0;
+
+	while (tkn_count <= (le32_to_cpu(cl_array->num_elems) - 1)) {
+		switch (le32_to_cpu(cl_elem->token)) {
+		case AR_TKN_U32_CONTROL_LINK_IID:
+			link->id = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_PEER1_MOD_IID:
+			link->peer1_mod_inst_id = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_PEER1_MOD_PORT_ID:
+			link->peer1_mod_port_id = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_PEER2_MOD_IID:
+			link->peer2_mod_inst_id = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_PEER2_MOD_PORT_ID:
+			link->peer2_mod_port_id = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_INTENT0:
+			link->intent[0] = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_INTENT1:
+			link->intent[1] = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_INTENT2:
+			link->intent[2] = le32_to_cpu(cl_elem->value);
+			break;
+		case AR_TKN_U32_CONTROL_LINK_INTENT3:
+			link->intent[3] = le32_to_cpu(cl_elem->value);
+			break;
+		default:
+			dev_err(apm->dev, "Not a valid token %d for control link graph\n",
+				le32_to_cpu(cl_elem->token));
+			break;
+		}
+		tkn_count++;
+		cl_elem++;
+	}
+}
+
+static void audioreach_parse_cl_tokens(struct q6apm *apm, struct audioreach_sub_graph *sg,
+				       const struct snd_soc_tplg_private *private)
+{
+	const struct snd_soc_tplg_vendor_value_elem *cl_elem;
+	const struct snd_soc_tplg_vendor_array *cl_array;
+	struct audioreach_control_link *link;
+	int link_id, tkn_count, sz;
+	bool found = false;
+
+	for (sz = 0; sz < le32_to_cpu(private->size);) {
+		cl_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
+		cl_elem = cl_array->value;
+		sz = sz + le32_to_cpu(cl_array->size);
+		tkn_count = 0;
+
+		/* Module config blobs are not token tuples, stop here */
+		if (le32_to_cpu(cl_array->type) == SND_SOC_AR_TPLG_MODULE_CFG_TYPE)
+			break;
+
+		while (tkn_count <= (le32_to_cpu(cl_array->num_elems) - 1)) {
+			if (le32_to_cpu(cl_elem->token) == AR_TKN_U32_CONTROL_LINK_IID) {
+				link_id = le32_to_cpu(cl_elem->value);
+				link = audioreach_tplg_alloc_control_link(apm, sg, link_id, &found);
+				/* Skip on error or already parsed control link data */
+				if (!IS_ERR(link) && !found)
+					audioreach_parse_control_link_tokens(apm, link, cl_array);
+			}
+			tkn_count++;
+			cl_elem++;
+		}
+	}
+}
+
 static struct audioreach_sub_graph *audioreach_parse_sg_tokens(struct q6apm *apm,
 							       const struct snd_soc_tplg_private *private)
 {
@@ -617,6 +742,8 @@ static int audioreach_widget_load_module_common(struct snd_soc_component *compon
 	if (IS_ERR(sg))
 		return PTR_ERR(sg);
 
+	audioreach_parse_cl_tokens(apm, sg, &tplg_w->priv);
+
 	cont = audioreach_parse_cont_tokens(apm, sg, &tplg_w->priv);
 	if (IS_ERR(cont))
 		return PTR_ERR(cont);
@@ -1108,6 +1235,13 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 		/* check if there are no more containers in the sub graph and remove it */
 		if (list_empty(&sg->container_list)) {
 			struct audioreach_graph_info *info = sg->info;
+			struct audioreach_control_link *link, *tmp;
+
+			list_for_each_entry_safe(link, tmp, &sg->control_link_list, node) {
+				idr_remove(&apm->control_links_idr, link->id);
+				list_del(&link->node);
+				kfree(link);
+			}
 
 			idr_remove(&apm->sub_graphs_idr, sg->sub_graph_id);
 			list_del(&sg->node);
-- 
2.47.3

