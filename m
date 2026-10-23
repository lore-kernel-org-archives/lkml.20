Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775904;
	b=wPQPIsOIHXW/YPNApW7Af887MQtRT8+D02JqmlVW7mM2Y45krDmyonfaPQpmyzXeSrDE
	 2KpBbDLBwAnVwcYVDhJZQWhuDU5q8ofo3vdZohRwIOA/ZrN0oU5FRLZ3iE7zu+L9q9TdO
	 4f4Xspz46rf6Hu4UBs4y4Qkpdx+OWL/F3b1wLe89RoSRZ2n5EeZEQVn5Z0glFsOCrkqB8
	 qtE4mwhHg9b0E0K2cVN56tEymhgSbLDMbkIQA9BhJ6jUqfCCdVyXGXSCaN3nEWXSVJRlS
	 wAkujp9/zdeHsD71NjdpxGR0/keVn1YZCim/5cKlbUc7OFQJeBLTJaURgSkT06X+CTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775904;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M9b4xWrqlE0Kv3+ymwpxhoecVabQr8ouhVupqXjGu1k=;
	b=wT15n1U8H/NafDzfKt+AY7NRZeaD3eOp6Xb15aPmcLHXxcsGo0LKx66tc2qOV78S7975
	 QWR7sj/v5iWUOOzYYsynV7cyPOauCIhMeeoXPudCTZeBYfTlQxAgtmJ1S+H7GsTsqeJge
	 rFvnZZvi7iGJLfKGjmj/TyZ4k6QGrfrQZfegnJEZUHP2iFtOSVDl3ld34VcUBfAmMeHIP
	 k+J/anq3PWUyBCs641HuXb54SK5WHbWdkVe/4tb17N6odI+9ohgAIiUaxrtTgPHbf6HRD
	 lsPIeFvy8G1Z7n56vNY6Lz83lxO+DVcTeWt2bh02ZCWWSPxr7KjArI8mwp9oeCc/wZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N7asCZYZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aoY4qbfu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5DC60A3808
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C5DC60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N7asCZYZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aoY4qbfu
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6BPp2999842
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M9b4xWrqlE0
	Kv3+ymwpxhoecVabQr8ouhVupqXjGu1k=; b=N7asCZYZQ/M79q0CDhsr6wTFxhv
	5sGz/fRJYD/XXFByGPOAcdh+zXgky2vNSK2rm3lRpd7pYj2ExswyOEA2f8R3C2XK
	+hTA/KAgPw2FJJpGe5yG4wBXWXP36bpn6cWbwiLQdmENul+wLYUoY555IG1nL4Bb
	HKMLAkPXc5Ev9C3UvoN4yjuZHy6jD4T6aR9DpKPT7YOXd8STzrxSHtxiMOvUn2ru
	1cNrs6UU9RXb7rTRMZna+CUlDhWy6A0Zy3+MSBDZ+UxF6nlcnwt8pCHOMT3i0AQ/
	i1vgalvn3sc3Xkc9hbzUyxAyc/xhAz6HJqMXQxXxHD8+FijP1GNpw2bXXuw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn14j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so227222185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775902; x=1793380702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M9b4xWrqlE0Kv3+ymwpxhoecVabQr8ouhVupqXjGu1k=;
        b=aoY4qbfuWYIAR8W9rBEtMQzfYepdax1UjkB4LVKkV5tzbmhf0kf+H/Uw3vshdnHMXC
         KvhCrG7XyBaDdYOK4z582xswZn7GcU/h+cGUcNVMDTXm8JHFisv9cIZVk7Y+elhzpgGW
         L43SIbkWwz5Sw37NQp3t/figIeyOfCZcxOxn0rLoYCZ5n4x6QcbjRZtNeWtJYIBZrU+9
         zPqabqsfv1wiqiLbKeZtkOqpe3qrOdaTPFoeaQFBKv1mCAquJHLHgZMdziN3pj+bCiC8
         lI8KX642n29RVhDfk7O7fw4CN40kMN8LRZH/LPbyuKaq/+zNTGHnTMn9etno0WY850mk
         qemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775902; x=1793380702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M9b4xWrqlE0Kv3+ymwpxhoecVabQr8ouhVupqXjGu1k=;
        b=2vFCo0JJoQDzUdvK+q8G4dPdnP9jzm018fJVC4msJP8QXDf5c9NBbwr+gQwl3rHLeA
         1bQnd0lLx8Lo6ps/r80Vl/NB3wsNBuu0Cc5NJDkJ0xoOjOX2FRC3LYXQMxUXyrf2Na6k
         weqysZGZ2tDb2kEm9LRzV2SiLqQGqYsUmwV1sQpcax0DjHSWsfOQ7z7Phoy8hJup/bnu
         R/Q/6g6/4JZES91xrvliAAG3tIfIU7ZZREDu3Y2/DDAhJ6F8jsvs4mdXzT2peNvz74Fl
         nHboYPu6cPq1JKSbWx7r6j4SlTwQBPnUmI3eFX+kfP6OWpAaSC4mMZhPwe2kZuuSOQJE
         m5IQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRGhVuC89Kaa+/in08/5YRLL9ZiXx2ca9gM1EJT6mtRwSD3AT43VJoLBc4C1RRaB7wz4VsOBEQfpMQwBw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWB28+WYiezZAPqjXhblxLSZ11IjSXrlPJ5Q+tj5GxglOalsgA
	nLBX5njWc6aefCsz0EuZA2tq7w1V8HflN0UHxnOcjhrF88nG6kBI0WsjtmPZkO/dhzdzo4FoD3p
	5IuIQyhZAlQX1QnoR+Rfnn+bxxeXD/LcTZP/W3kzkkj8BoHeh0lEfLQQeXp9fyMWQA0c=
X-Gm-Gg: AYBFou3XUsCTqT/4+ImGeMGJIklpQV+0Zn84XqJ+VBmre5bo2qRUssw/9zHqubisTpM
	y74/9RDZtpwBz6hFlloiqLIKxPeC9Uqaw1nGtulsMBViQ3wXpVpQCuSf1DiS1RW3qucvlREww3b
	nbAFf3ksl7jcd3IWAVrNjhBsnBSqCou3/1pSodwwQysQ6env7HA2BsvSddOiCHDekj8ibuxQqRu
	BzYNK74bM2fiARj1uy/I1zbklOK0BLaF3J27USnp6nYxPTsE4hgSiC6J6jt3b4pI8FQUrUTrBFI
	JiG0sHwxSTnQRzAE/gj0eLrurbgjQs/4f9Pm8amFNQzV2RkIOfQQrHaKrABzrrYfQL7H/M1oeKw
	LhYn5CQRPbtg3
X-Received: by 2002:a05:620a:880d:b0:93e:53db:d59e with SMTP id af79cd13be357-93f627233d0mr922231485a.23.1792775901732;
        Fri, 23 Oct 2026 10:18:21 -0700 (PDT)
X-Received: by 2002:a05:620a:880d:b0:93e:53db:d59e with SMTP id af79cd13be357-93f627233d0mr922228285a.23.1792775901279;
        Fri, 23 Oct 2026 10:18:21 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:20 -0700 (PDT)
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
Subject: [RFC PATCH 19/23] ASoC: qcom: audioreach: keep the last VI calibration result until the DSP reports
Date: Fri, 23 Oct 2026 18:14:29 +0100
Message-ID: <20261023171433.820092-20-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX77m5dJxp4tUl
 B3BFmIGyTBjGLWfKAMvgZY7JxOeRSWVUZqQDxwP5gMnlEdpjpxgpDlDJFgB4DwApvno5ZqLbl6g
 e56wKf1/4hHEe2XhQz/aat5YPMnVBfYoT4Dboy8SJhE/YQTcbX6vNYwiaFbelbMFqFuvvZX9oTj
 YQSWNPdZetTAEEYL+/lcCmyj87LZDUqnp1N5RcHGukppn5y6X/pRVFqioFJFCNichW3R5c5J+8u
 EAEzbDU2uPScwaAMC+VVtKxj6WynjOZDtpEsi5kWMdYzhg3W0R/xK3iPzbbz/xNw+DFSi6iySnu
 PT5m3tNUt0OrxFJxLFwLyOV48D4QYqqod2k9ZkvwnONh7GEF1VGQ3CiRU/kjzs7GfQS1T0luTPA
 IUjt4/VMs0wu0izp6QM3BwI007UhUZe0ojCeaH22L2Zlh7yuvKW1P2Xq1vxD1UBWVSFOmBZSG0u
 wYOVPHxEuPJEd+Lis7Q==
X-Proofpoint-GUID: Nr3FmiClEDFdVQlEBOi08731gtlxiJJU
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adb96de cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=IK27QhZfs67nWGHMqAUA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Nr3FmiClEDFdVQlEBOi08731gtlxiJJU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX9FzCnuzNH8ig
 SibGhGcvDPHnlzimoHOc7LapZBPL3X8y/OjkN67hOzy4nIjgdaYAE4LZjtt9AZP9hI8UAZR7hHw
 ejQGe5nS2sv24zdEB4zqVdzIp+MZMkE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

Preparing a VI graph in calibration mode cleared the previous result
straight away. A graph prepared and stopped before the DSP reports, for
example by a sound server probing the PCM after a calibration, wiped a
successful result.

Only mark the run pending when arming, and drop the previous result
when the first event of the new run arrives.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 3eba0a9a0372..e996be54c42e 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -25,6 +25,8 @@ enum sp_vi_cali_state {
 };
 
 struct sp_vi_r0_result {
+	/* Set when a calibration run is armed, cleared when it ends */
+	bool armed;
 	enum sp_vi_cali_state state;
 	u32 num_ch;
 	s32 r0_cali_q24[MAX_SP_VI_SPEAKERS];
@@ -1707,9 +1709,16 @@ void audioreach_vi_calibration_event(struct device *dev,
 
 	guard(mutex)(&sp_vi_r0_lock);
 
-	if (sp_vi_r0.state != SP_VI_CALI_RUNNING)
+	if (!sp_vi_r0.armed)
 		return;
 
+	/* First event of this run: drop the previous result */
+	if (!memchr_inv(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states))) {
+		sp_vi_r0.state = SP_VI_CALI_RUNNING;
+		sp_vi_r0.num_ch = 0;
+		memset(sp_vi_r0.r0_cali_q24, 0, sizeof(sp_vi_r0.r0_cali_q24));
+	}
+
 	for (i = 0; i < num_ch; i++) {
 		u32 state = cali->cali_param[i].state;
 
@@ -1731,6 +1740,7 @@ void audioreach_vi_calibration_event(struct device *dev,
 	if (!decisive)
 		return;
 
+	sp_vi_r0.armed = false;
 	sp_vi_r0.state = success ? SP_VI_CALI_SUCCESS : SP_VI_CALI_FAILED;
 	sp_vi_r0.num_ch = num_ch;
 
@@ -1780,7 +1790,13 @@ void audioreach_vi_calibration_abort(struct device *dev)
 
 	guard(mutex)(&sp_vi_r0_lock);
 
-	if (sp_vi_r0.state != SP_VI_CALI_RUNNING)
+	if (!sp_vi_r0.armed)
+		return;
+
+	sp_vi_r0.armed = false;
+
+	/* The DSP never reported on this run: keep the previous result */
+	if (!memchr_inv(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states)))
 		return;
 
 	sp_vi_r0.state = SP_VI_CALI_ABORTED;
@@ -1844,9 +1860,8 @@ static void audioreach_arm_vi_calibration(void)
 {
 	guard(mutex)(&sp_vi_r0_lock);
 
-	sp_vi_r0 = (struct sp_vi_r0_result){
-		.state = SP_VI_CALI_RUNNING,
-	};
+	sp_vi_r0.armed = true;
+	memset(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states));
 }
 
 static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
-- 
2.47.3

