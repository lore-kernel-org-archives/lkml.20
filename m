Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE99480320
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390142; cv=none; b=d5MqKqD5ARHK0QCgmGlQwT5tnF2vyuoUOxmetsisl8cMCkhEO/s8jZr3CSuMl20+H0ddKitAJNWWFzarRtw3QyPM+cCXRe3vgUiuHjnXSdSlM68cLRXRrgKuWMh2ScFn7y1jM5u4bf5w99eB46yStwdLT3Gjmr314HP4g7OlB7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390142; c=relaxed/simple;
	bh=59MxJ74vpUH4TMLPJbZqNrnZ7WIN0Fa1z9MpubowHEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jPm8l4xh/ZPmf2gP1tOhyf4KDt8cr8qqWOzNKR7apym3bxiP1iLLmV9SYZHIQHgHQzupWPFYyS5e1oOn2NaHLYSTcy0eKTnS7cJSGn5wun+AxZZ8l4TGWsnkwffWPDjXWBN0c0W5hBOb79PyyaduKROLDm+pCg6j8NX1ozC/IJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnAlHCBv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iG9aE9MT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnAlHCBv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iG9aE9MT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ECNAlb431302
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qN0ApeMbMDjoyqaP8EXkX4ds4NYn9mbqOQzihITsKB0=; b=KnAlHCBv6duV3YEx
	r4f6PgrTCYZWkpARFFTTq3xrbA1MTtiU3Lhvsjt0v2tCaBLVo+4b/Ko/x/X5G/3T
	0YdIscReyUvzq125nf5XXEQHrlUhWznvDXw5CeCCMz54+gbFe29Hb66kDdHKuiWx
	ABK8UsUF7ut20WPa1/5cdaS47vhD1CEshkWLV/s0QS18k7JdEuxGwLSdg3yAYGt/
	jZtnf4nddwo5hhUd3145M+y1mMFrPPJqeUgCy29XmdMnrqrJk2J3CfIUSeaakeEN
	qvSRg35MI+L2hlBG9B52JMbFmPMtU1jBRDm6Ie+stwlCdzkCKgMFwQ6xOEAGxrYb
	bfp2qw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtg2q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1b824e84so228808885a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390139; x=1789994939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qN0ApeMbMDjoyqaP8EXkX4ds4NYn9mbqOQzihITsKB0=;
        b=iG9aE9MT9wrQOLe4NIcrQV380/9g0t0ossYtBMhZUw8YLvDoGIIpQYW3KPBb3thUCp
         pS/OgeSe8tAnKvQpDgFPHuVTqjw0+bCpDpOxxtY6czG6W+JmDfOqLprjCFSmqQ3TwjBY
         IalV1Ale1UOxpbYKop2eNxvVDjDSb+y/mWS0Er+4iD4r3ofKeFnWLANf59F5h8XG+tWT
         4upT9i7ladQlS5FlSiMdp9r28MszYe6oF4qt8KVAyi6MXoI93sQdx3TYmKZiH5hfRnA6
         f4/pfDWihj5ilrxy6izmSUQvPw28orrDbShX8ZgIPsMmXT+3Hk/j/RoxSwiDGq033LL2
         e1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390139; x=1789994939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qN0ApeMbMDjoyqaP8EXkX4ds4NYn9mbqOQzihITsKB0=;
        b=n9hbXVbX4DUaH37gt5xiHOav5jIP9ztXkx1tQHRHwQCbFw+TOIgaivedZQGmVtOtrz
         PfyHnq0puW2DyAz7ReiEdL4LPtbdQyshaC2+5WHZcHJz11wlWcaYYIHA8z+Kod20bZOw
         X+YTQWw8Bap3PLLXghrXGnDP1QU7MC+5Q/xGCYMFEOJDZzI7ZHhGpt+9zWRbE2n5R+DX
         x7+E3r0H9kG9rI70ULb888haznvxhe6wY6Ns4JhWF24VAduhCc2D7xCWh4oc2XYzXSqJ
         OOWH0k2IOdi5xYZ6g5i3b3/X6/6yjN4MD29MNWNy9vVuT/Mt6kPBHUlMvG2bML/uJJvE
         lMkw==
X-Forwarded-Encrypted: i=1; AKwUvBxZLhSqs/NrRIZ7sMUpQhZ32wHscbGFAnve0F2nK5x/b9Qv8O3gPL8T2FGul6YTwvkA22KG3ikBAFFq2R4=@vger.kernel.org
X-Gm-Message-State: AFuF++n7ueJqeMINy2JH5L4JBXOt7r1CWQi4+OjdD9r2zaS15MBUfNt7
	In3WNpIVnxENmzzvJFYOLLUh06TyOckMHvWHGCtrBY4kqfygdm0VLp7WQQ/AzKmlpcuckRtbxFA
	eG+LTi4USlZXs4uSZ2mw7RQvYTTowcFLT9ytO0xuHZIVbUUCAPQMYxCMeYhTqO96H0v8=
X-Gm-Gg: AYBFou3j/fdfNsIBwtOJWKUYTiFHJxohWjJ40Z9iJIRDgX5g2ba4d3elX+KDzBk5cyE
	FNOtbfI2nOLumyy9dsJwC527OTwvlcAFsSzCQlzsHh7l3iM8mNkhmb1Wnmu63axBqMII7FZWG4D
	RcwvvsN7NVs1C6RUjlQIF+APgQADDfm2AHsJbvEvHW6jij+3zlK4hWpD0fakDQDvuLlgJGbxuoE
	c8ThA9wxDvggtpPeMHJEEzQXoqF+/i6elRXyxCWegRGwGHlMhEO3OGV855iFNrkMAkN+WSdCMd5
	8skTqqSSYbe/2NMZN/PWJornGnyG6/ZdylrMEFftll78NSN4Opvn+pTXR5oKqX17f0ZojvZiTS/
	Y2Q2tWHWt
X-Received: by 2002:a05:620a:2588:b0:939:2bbb:b266 with SMTP id af79cd13be357-93a29723f09mr307862285a.8.1789390138445;
        Mon, 14 Sep 2026 05:48:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2588:b0:939:2bbb:b266 with SMTP id af79cd13be357-93a29723f09mr307852785a.8.1789390137835;
        Mon, 14 Sep 2026 05:48:57 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:20 +0300
Subject: [PATCH v4 21/52] clk: qcom: gcc-sar2130p: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-21-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=785;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=59MxJ74vpUH4TMLPJbZqNrnZ7WIN0Fa1z9MpubowHEg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zgJQHQKEKFHdly79cOiLhTxl1odoYUhTXBt
 tFVXsT26j+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs4AAKCRAbX0TJAJUV
 VrKREACoL7jIuTu6kWT2irdWG8dsWQHRfjqkTuefoIhwfyFHaT9hM2hD2faorwEU3Yfai7SLUMw
 JpMl4NIjlm9k8KcX05qGU0MabGSqN5j9L8ZAP6bBAAT2DMBa905mo0Z9ABmHRqh+hZNXbMW++We
 c0EwGWZ2Xa0iEaIVqOHrd5/O9kmNZsj6mukQG11aQTFGhM59hNAfeIjknwonWueET7VMLch/fk7
 X1HhXlI6qt9tK8JReZBA8b7rIlDUzhqIV2QqzQggW2MSACn0hOiO3qwaYYyETjcpidpz1IP2p60
 D1/mIIKs/1FqHGmWsk/616xeOrbC5Q6xTsU4PRXtKGZJcHGFRhYUajaJKBlyRl9JqpCFI410pON
 vRRJo4TMxlKmedooo9wlL1JcOTRWCA6df86En98UPZ35RIVJZLslUuzt7adeHMX8oJMQmRqtJ4/
 CoRgDdEW1r1zNkSX0pB6eWocAgl8d/ERgm62VqUc4CEantRNXzU6bR3PQGaCbje5pUqE88a994J
 90N2sAVWrqPg6L2EN47JjIzErsk4tP3f+kBhWv+Rom/3MFnteU45XGp6Jc1MAZeJxCU5JqCKc3J
 KLbl7mRQQsPACG+ui321mGKWWIcZ5Z8m+DwEPhMyM90wwtAswStz9LiOHE+qBobLckrcQYdncas
 nEMrleS3Zb5G5Ag==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa7ed3b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX1I7eIAoB66Wg
 NuxnzgJgVISEIcaMoX4knOcW9qUV/BF5DwF6LK+ERVOA55swC1x8ZGFjrytCR+ooRx+l95IeCoC
 0VSK/Ydsty1zCezaxm330Y8U6TH7n+Abz2QzibqvThpOFyORyVCyA/jcUYujRJxS17vElWV4lxr
 nE/dBpyUOcOPBQgrDBSKoZ11ATOa7dAxy6OvoOhoFFJiBy4oJ0brdirs/pUiDlu9hiR0djB2T7u
 i/ixiKkCu1rFWhWQNNinqjLFTRXRumXfJ1TxeiW8+sDLAL64rN96Ue3GgJeYs8rY1vqlZ3gSIvn
 bxaZLUK2ZqtRypITczNOh/WAsrT8K3tE5RGzlU+KljxBBI+pr1A8SMvvPuDFDt9XQBvHapoL1Uj
 Uf0FMbxu4QTZtdNUWca8NPZR3xjEglQ0TDL9rolYRl/kG+7C4GsDUVbe4gypxHEd5zEkGS0nP/z
 JlVo9B5QTU6e+oi/T+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX5QMvMRxOc+pB
 7yq/2UQ5g5MJaoPGhgZLaYEXNyPlwI5wIqLNNxjjaSC5wkrjpgOTkq4HCp+uf7X2nVrFUqU/K6Q
 oJtkALIX8EPwGGgw4BysDSuB210QDCY=
X-Proofpoint-ORIG-GUID: myqVusB-W-VhhgH4QyQ-9iXNIJLU_hwv
X-Proofpoint-GUID: myqVusB-W-VhhgH4QyQ-9iXNIJLU_hwv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sar2130p.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sar2130p.c b/drivers/clk/qcom/gcc-sar2130p.c
index 475e2cda3618..1a16f9d68bab 100644
--- a/drivers/clk/qcom/gcc-sar2130p.c
+++ b/drivers/clk/qcom/gcc-sar2130p.c
@@ -2308,6 +2308,7 @@ static const struct qcom_cc_desc gcc_sar2130p_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sar2130p_resets),
 	.gdscs = gcc_sar2130p_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sar2130p_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sar2130p_match_table[] = {

-- 
2.54.0

