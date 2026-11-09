Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213417;
	b=me6MBc4LyXrwa9wCdWLBqe/ePok4Qpef5mjTL4h1LsoMvVe9w4tbAcTfdeug1T6d+67g
	 uMdAjBvYDTe65wYoUDdiRcXXBsmreRU157vbj6J35KLlDvYVOV8BSvv0FAYOJq27WyOg3
	 kPKOXD35H/QkCwCNfrZL2ga8TzzEjLMaxKP3fQya6aOZ0r6SRUsPhXCKuebtRZbzAmGxp
	 7F56ZJ9Mv/HavEGHwtW3r9vhfaAuHuCYlqeZU3iFH8+gademhsvMB7zBSkO0x0zfsYYyI
	 6ezaiXPSJbNSHwOGt7TsRTqbSIpbPDPKbqhQZxaDoIhdfc0bdkTaHEUxCNzmeEqH8Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213417;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QlQZJAxO1Sv3Et4pFgTum0IApIio5YpzXsMhTuabOKQ=;
	b=POKsDgp2R4FiJFgB0sbToHp3f7IZWGVPQc4yEuJHLQgGyKxS0FU2td0lbYRfyKVDrwD5
	 kTLgMBdReoyp3hY4qUTfFsufAIm9NhSaXET2XHAIpQ/zCUa2PNarBnbQpMZWXNbFGJM05
	 /5S8vDaU3f+Tvs2b9AvfItE9iyCc4yWqadINo5tunT4zHNYw2MZH3995uYG+HsVVGaov6
	 7WUyuCfMQjg70BJscSG9coPFqC3ieJuMmOKREs1drtUdJYSF3ZbXplbTwnHSnfs1bJW8N
	 oJL/G5+fPMuzj/Z2/CdknXBTf8l8IwadD6gnaeBffOZxCWVvr4S9B4qVxQOAhd+gGIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3Y7bnYm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dzKYvDTv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1209B606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1209B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3Y7bnYm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dzKYvDTv
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A97p2na3325260
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 08:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QlQZJAxO1Sv3Et4pFgTum0IApIio5YpzXsMhTuabOKQ=; b=N3Y7bnYmtQ3Oupim
	X6wMIAQC9ZhmqQ2Vgg5pOkd9Ue88q1gu7WSF27cAZn6es+NQy1F1zq1MoI0glqm6
	zomiTk0bctP63LVEttJtm8q+FUGy/U5qfkcUYU3NxRYP6S1oVF0202kabQNf4fAd
	YsrUPypXSYSVBMuRvQRDHOM96J6GcRsT+D0rzS94mlqp3CSkMhf+45DDML5fuPE+
	xDANDXOpZ5TwzJLj2kMhExBY5tJr3axj3FhY+kjaNjuBeCcudopOoHM7Yq7hkIdf
	hmgcsOf7417/oBluY/Fav5uV10xKaKcuv1z5prJR3TMZkLzHIsoA/plVdh1umch1
	blEqhg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua5884xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:36:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f62934ef6so151336685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213415; x=1794818215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QlQZJAxO1Sv3Et4pFgTum0IApIio5YpzXsMhTuabOKQ=;
        b=dzKYvDTvzH5BbbohQ1WOqpQevESHKYur/8kK0ccAUP3R2f03k8cvLYTEtxkGv7+Rm1
         s1x/uzSEVkFLmDayYRRe7J3VbQUp/mJ/LuOWy/fq0OYfuLXg1uzxSdPxMu5Let5sumVW
         qEeJcjWvkVeb6l4S3bEjbV2JF9dUd72NRO1wh4tGLxUffLsQT7qT7ADfXnaTCI6+6kpE
         f8WHkX+GDD/0BzTrSJ/W1XO4t/ZYwSv9FCtHRvHzvr87QZTEuqXz1rwLDgu6O7WBjW22
         vrYM2jDhZDmvDoTbfaPhysy/Uzlm6sDvXBPlwCqH9cpuYIva/o3MvE8nWwzvOdQwrAJI
         5TiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213415; x=1794818215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlQZJAxO1Sv3Et4pFgTum0IApIio5YpzXsMhTuabOKQ=;
        b=2wGIs7ZiaVdiGteJhZwSCm6pEFf9Vr+6MAs4TQbmfuyzAOXiDyauU1wAm34qhqZuiq
         lSwbeC/hJAVxxhMpbZ+er9jc0TwqbzapI4eFry/lIctoGh0lBfLzbtuEgi3ATflCHf8t
         CqzQ6UtVC1DzX5t6xZBytcoXrfPcftloZ7Mx4QC975jDDXb1xsM0GRMBYGRq3oAQnx9F
         T+tqdnVz0GPen5OkWcEAOruKchYS8ZTuZcQifMNdrteSdNX7+F5aonHGxluStDEcC6Wi
         mdGXY1NCO2IAYBzLMUWRCU2hTbxnt674uOGTSVtha82VmeP1uMMxqLjX/XwWTieLXoj1
         Lhww==
X-Forwarded-Encrypted: i=1; AL+hErGutyRrPJ0bxnfdjfonimfP/eZWUGZjD68LOZycfrAuiFX7Zc1h2KdniCoF4q9tJLj/EttTIHJTfTweEpU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yZAeg6h55VYveNHPZHvzRlFp5cvNQfUnalJetY0ieQL7LwMts
	rWLcPKhV9ogY44sQpZ9QR/ekBmfn1U2cnICeCSqqVz24tQ7SI1QUo5lMumFgAZf8ILNSQSXKAU9
	ugAMtaR02CVxpPYLd5xqVswvoxN5n5d1R4dldNyC65SYSumaH8aoCPcyeulmV4TfgfO0=
X-Gm-Gg: AYBFou1HWdreKP7vd5B4Si9RiVLJWRYdPrakZ2wC2MhChrNxPdwa7JEVRfZUmycoY0J
	rwvVRb+ycLJogS5/Ji3nd/dG58lb8r/ftYXIWR9XdaRGuoojN87GDrYIpMCjliCMKQmM/6jD62y
	70dGhWwoqNAgfRWP3kzgCdSEtjx4guswJbJALyyc5SBSZUKI8UW01S6Kfhu56Bup09Zo/2+8n5L
	VlHM5D6FkbKhybK8/vki7nol0c1uCx5opPOcxum76WGkouFNrv6GNz4Evi7hqqshjg44BeQxbdL
	rAjuxL/A1U8GjI6OfDXrQjiet1P1mAXhJJZ56lXgnTbAu9nD2lb7xi/KvtWWIxKaelFtgkHfclI
	dHXVevbCuuHQlatwHXphCCmtk6fMCHdxxbn13WSUuJOamELrxnyCGFRXJCrVP+FyHymoAVZYvXa
	RYBlLajIurNCXg5SKbYeyc36F8CT3NDGUxctA=
X-Received: by 2002:a05:620a:1a0b:b0:92e:8310:7369 with SMTP id af79cd13be357-9478421ae5amr531300985a.37.1794213415083;
        Mon, 09 Nov 2026 00:36:55 -0800 (PST)
X-Received: by 2002:a05:620a:1a0b:b0:92e:8310:7369 with SMTP id af79cd13be357-9478421ae5amr531297785a.37.1794213414549;
        Mon, 09 Nov 2026 00:36:54 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782dc37e5sm418223385a.34.2026.11.09.00.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:36:54 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 16:36:35 +0800
Subject: [PATCH v5 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-msm_gdsc2-v5-1-4a3159b5e4b8@oss.qualcomm.com>
References: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
In-Reply-To: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Joonhoe Kim <26rote@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794213397; l=9906;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=KfdZuvSWZwaiZF24JN3cwwsiGYbigawCngmZ1N3bIwk=;
 b=Nc95XLCZD9zVCjX6yjrNsRLKMzLVQWzGQwcdEVklh2PVV1dWQE8tkYFqLsBiLYffuqy+eBoiO
 Qo574qgDzc6B/8E5IZSJmNZtpreMEgDZ0XeroWGSRmFsou/725vVma2
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX7G5Sl/jJIOBz
 gXDRK5rNH2X4bbS01oTMU4i1meL7HRKwW7pwZ4WA+7GBtpXQn1ZMSstnWhH6hhH490mfJm7uWEK
 sgPEjZYfgaA+WIiwlDmKaolOnSekK9VpawjZU/tNg1fReON4P0SkFmz6yhONDYFP+NMgrHq/CYs
 qMv/PhP1KkxtlYmAZTbYzsBQ9LmC28gCiuY1IAfnMueZ6ch2PqGHUmA8DFPJkO3wl0o/joFsEF9
 EvbFv/DvNTS6rhh6vSILurC20yNcwq9Pc9iaETDHrqiB47YB0hidv35vxGgteC4P31zwLpvN4wl
 0L8opgLHVK195WrBlIuidFA21D0RT6SFn4iQpuIGBxZ5EdzIr6rh7FvIhmJGDQtaE7vzzwx3+5c
 3jMieLzvHW6B2kHIRHUo3+P+6cSm060SHdepl/zZBVFN+uxlT04KF+UDy5SEM2D8hutIuSwVuwf
 6gcCAo47kvRc+lBq92g==
X-Proofpoint-ORIG-GUID: Buad4VX_w6aKR7tD5UbsKqeugAUhC1F9
X-Proofpoint-GUID: Buad4VX_w6aKR7tD5UbsKqeugAUhC1F9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfXyjz44RqAwtN8
 lLkw4QJ02USgMwe/4U1PKBapYzuGahDspRfDtJPoGZkdn4L98BpJzb3IWvRPnTYI/E6uyTUV886
 MnxXM8LlPUuxqShOryaAtBIb9ztWf5U=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af18628 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=3e6MG95HUu93SJj1PsAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

Kaanapali (SM8850) has two display GDSCs. CORE_GDSC supplies shared
MDSS hardware and most of the DPU, while INT2 GDSC supplies the
VIG2/VIG3/DMA5 source pipes. Without INT2 GDSC, these source pipes
remain inaccessible.

Describe CORE and INT2 as power domains of the DPU device, matching
the hardware partitioning. INT2 only supplies DPU-local source pipes,
while CORE also remains attached to the parent MDSS device because it
supplies shared MDSS hardware. DPU performance-state votes on CORE are
propagated through the genpd hierarchy to its parent MMCX domain.

Keep the widest valid power-domain constraint in dpu-common.yaml and
narrow it in each platform-specific binding. Require two domains and
their names for Kaanapali, while retaining the existing single-domain
constraint for all other DPU platforms.

Repeat power-domains in qcom,sm8650-dpu.yaml because dtschema requires
power-domain-names to have a power-domains sibling in the same file.

Tested-by: Joonhoe Kim <26rote@gmail.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../bindings/display/msm/dpu-common.yaml           |  3 +-
 .../bindings/display/msm/qcom,kaanapali-mdss.yaml  |  4 ++-
 .../bindings/display/msm/qcom,msm8998-dpu.yaml     |  3 ++
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  3 ++
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sc8180x-dpu.yaml     |  3 ++
 .../bindings/display/msm/qcom,sdm845-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm6115-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm6150-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm7150-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm8150-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 34 ++++++++++++++++++++++
 13 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
index 3f953aa5e6949..c67199011f263 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
@@ -26,7 +26,8 @@ properties:
     maxItems: 1
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   operating-points-v2: true
   opp-table:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
index 9f935defd6b12..6d6391970d6b6 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
@@ -125,7 +125,9 @@ examples:
 
             operating-points-v2 = <&mdp_opp_table>;
 
-            power-domains = <&rpmhpd RPMHPD_MMCX>;
+            power-domains = <&mdss_gdsc>,
+                            <&mdss_int2_gdsc>;
+            power-domain-names = "core", "int2";
 
             ports {
                 #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
index d5a64c8a921f1..bded43a34b87d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
@@ -15,6 +15,9 @@ properties:
   compatible:
     const: qcom,msm8998-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
index 034d3df8d2470..6c1476a0faaf5 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
@@ -19,6 +19,9 @@ properties:
           - const: qcom,shikra-dpu
           - const: qcom,qcm2290-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
index 8137618237ce7..3fa0f02f44892 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
@@ -19,6 +19,9 @@ properties:
       - qcom,sm6350-dpu
       - qcom,sm6375-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
index df9ec15ad6c3c..7703d9b017cfc 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -24,6 +24,9 @@ properties:
       - qcom,sm8450-dpu
       - qcom,sm8550-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml
index a411126708b80..8e10f9e0d1769 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml
@@ -15,6 +15,9 @@ properties:
   compatible:
     const: qcom,sc8180x-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
index dc11fd421a27f..9dafe1d827e13 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
@@ -17,6 +17,9 @@ properties:
       - qcom,sdm670-dpu
       - qcom,sdm845-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
index 510eb6c193649..173c2f034241c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
@@ -15,6 +15,9 @@ properties:
   compatible:
     const: qcom,sm6115-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: MDP register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
index 8cbf99f9fcba5..b8344ff8895ac 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
@@ -16,6 +16,9 @@ properties:
   compatible:
     const: qcom,sm6150-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
index c79b2d4428003..8e50942f3e1f2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
@@ -15,6 +15,9 @@ properties:
   compatible:
     const: qcom,sm7150-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
index a88d22f30a602..b407bc3994620 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
@@ -17,6 +17,9 @@ properties:
       - qcom,sm8150-dpu
       - qcom,sm8250-dpu
 
+  power-domains:
+    maxItems: 1
+
   reg:
     items:
       - description: Address offset and size for mdp register set
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index aa0cf0ec5b93f..c3bf4e7ca1ffe 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -54,6 +54,15 @@ properties:
       - const: core
       - const: vsync
 
+  power-domains:
+    minItems: 1
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: core
+      - const: int2
+
 required:
   - compatible
   - reg
@@ -61,6 +70,31 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,kaanapali-dpu
+      required:
+        - compatible
+    then:
+      properties:
+        power-domains:
+          minItems: 2
+
+        power-domain-names:
+          minItems: 2
+
+      required:
+        - power-domain-names
+    else:
+      properties:
+        power-domains:
+          maxItems: 1
+
+        power-domain-names: false
+
 unevaluatedProperties: false
 
 examples:

-- 
2.43.0

