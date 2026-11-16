Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835049;
	b=u8NciQV7+Je76Qgh/hxkp+QLx5SJFBu/pzdCnyHimS2auzv/Di0CtfnvkLAtvn+inwxe
	 +rzOMOesJ9DiayW1uGIbw+XuX4F55yLLISvF7sKSSc5EHoghFU2tUpJC0c2M2n78SLXcp
	 3IhbybLB5oyeV1lYs9+2m8l84+8GWOl2X9xyhXyb14RBp/nm8DROar14g+6rb1Vv9/uwx
	 /S5/lQbR1YFzxmPYwxu6tJeYZVyNLBVdFI7FmHnpWXzrm5dRmQgcB0koSJLp0QFeh3V5O
	 kBHbp9qXda+gc2+mYOC4qaiM3HMrwzvRREhlrZrOpgybnuZBvg9JQNxELo6HJBvuS2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835049;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UjqYFlsGYQ1BQRZcmH5d7N4ve510rUSjekhHGgLagxw=;
	b=O5nRSzhzw+sB6t1R5xAtyy01kRbCQDW9Ng+CtZs71a7kPJrgjPEWNOYfMNZHkZEDHQvF
	 UU07SJOLhnQ+E//2pPDPZAeo8XgxFgvIenjji9a4zRVl202FjU6supzYAYFDu8ybin1Ug
	 0a5q8X+mB1syzohPG23gh/M6ntUj2pMTXBpymVyiZUxAY2MqV4u6Kwp2apyzv72QOuM1r
	 4/QEIJaWnz44Pn0i6fYoN2LQot5MBvVcn6Y+FyH8E//tec+8GLNZ6YvxGiNltEapZdbwu
	 iQJ2TvQrHv9j9LTT83vDJYPvgnEWCYc07eRrzW8UhG2VkIZ7Qn6rPISJ5YZ7OlgU6VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjgWI7YI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DQ9tHAwi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82D4606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E82D4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjgWI7YI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DQ9tHAwi
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC1MDx1004669
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UjqYFlsGYQ1BQRZcmH5d7N4ve510rUSjekhHGgLagxw=; b=QjgWI7YIpdtgeP0n
	w5Tkt6XKngbzdR+lvg+gkpmH2poPymIDAu/Nxg6f259SLON41kBrIbBRLpC6pqtB
	DkGBx0jdXV7lMP76y2/MF/I/K4HfuhQdzfNGgixDcOV6lSQUX/SniloQgerVi9OR
	OIOqXpzuLI0xKHxyovsPT4Xo6SyzCF2GEQZxm0LfV7+iSs7iBdyc5qsaoB8Ufje7
	cNULvOMVcUPquoVRD0zft+01AhTCpM6Q1M2wf1/k7oLwWEP3F+nk2DG2k5kYPWq9
	C4RSiHSZyZLWaAKY4JQU8S+l3h2IxxtTb+ZVIyjPaX5GPHW+bthV/YCJIsk4Gdw+
	myH4YQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j000g0m12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:17:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so650593085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835047; x=1795439847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UjqYFlsGYQ1BQRZcmH5d7N4ve510rUSjekhHGgLagxw=;
        b=DQ9tHAwiQ5VPLDr7ycd/81zrL7AwqkhcvOU5+g3lm8sIfZ24a+FXUo7wg5BzxgbxnT
         6QNOlWwhskv2kHL3BJFHkFTnYHmbUlncXmf0vC07zPhafu5dYxXznlBK3mq9Mfd9Jy6P
         a/FCVaK5rS5TzlkaZumhPBdoh0PRRP8kLG3CAY5QA/UM9a2FkVkcyoPcQPLFMpwkHJSt
         RW+dw4g1hlf6m9g4RbtpHRi7ceETbXYv7AHO/RSRKJlxC797z8OKmnH4+tm0y8i8CpGO
         k3NtQPfWO85kXquk2pURHaJMk13NYk5t2QAjzEY7Qn8uk5nfHhorNMOuKi+ZfZ9kQtCY
         Y2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835047; x=1795439847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UjqYFlsGYQ1BQRZcmH5d7N4ve510rUSjekhHGgLagxw=;
        b=t8OhOkeLDPLJitfcpLIhCMj7C3O4PCQFf2fDETkPdJUx7eDZaaOMPsxpSWohZtXaKa
         XppCS/9/vBntWTRx7HO7Cw5GnZHJO9ow4az1vXBR9pcObyXctLSMN7i5QpJASI2N9P9r
         euXnnQxQF/bIAy0Qw7SrbB9zJl/D1Sy3pikmDrDC+f+bD4RoAgTCcSdNb7zzmmYK0M20
         arlBE7NUjNYyw79aLrdTc7nGWI8s1rTkIDYPCRMwpfQLBNPoh7mFd4lEN5MYoodoqVnL
         KMLmEw3tLoMC3q+HIqKSmuYurO4u6mCBff43kV2KHoxKYrlN9XlHMNAyXbX56AxmRd5k
         eSTw==
X-Forwarded-Encrypted: i=1; AL+hErFc/8giQWwuUo2ZQ4RfYXNyUpeRVGpfInxdgJMSIVZBzQ67XWQ+qaDXhw2GGXZ1szJ9r2/u9kosHtWSdlk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tzr3gC1cWlORs0nXmxkwO43MmYFwlPSl9HeRqN05QYNj1lDWy
	2eG3KzdnhbxvpAD/8cLkcnOfcQH3O/2lkwjgHmki5GZfuifVVjbP+/RUiwC8sadTzC5cibRSnMK
	E9ge317MGzQJb7QmYJZsVuhCt8IynjwhInsXOipXTc6AHROKruvxil4JBamWz6GQhyLU=
X-Gm-Gg: AYBFou2F/LY2Vty4eOiYS9QiJe8oG4aoVpzkJooyD8C6m1vfs+TcXKQm8SMoGrv+av0
	XoSeA3WkijcWLan++9g2I0c2nxloMGXs0diiay0hD2bPTTpFlv9jF9zbTfjOepBe5Z5ucOf1pX1
	vq24Rq68rIikeQhW64iLXFmwpf0CYNysjq+2wuYUxqfLop2IiarXOi7xxELnXhOV/974GmIWrNA
	/eCEG6aRVml37CrFvkYGrWaiFeIbbSKPAyg/72lnRLaB6ts8xS+IWGGGrjnTTSLBLyMIER5ZOoC
	Y5RTTByioNdh8Z71id9FJkJTeH0qIo/sl5s92A8iKcGFzc71z1b5D3CBEoc9UxtB02dvco/8VrU
	oPThZ7vL4HfOLjg6o1a9OdHm91Qy/G/x9gjB9p/2Cdc3Y+P+1ebXgTnSkySClwxbvtDTSzXKEPh
	3P
X-Received: by 2002:a05:620a:3915:b0:949:7572:e76f with SMTP id af79cd13be357-9497572eb07mr622418385a.46.1794835047008;
        Mon, 16 Nov 2026 05:17:27 -0800 (PST)
X-Received: by 2002:a05:620a:3915:b0:949:7572:e76f with SMTP id af79cd13be357-9497572eb07mr622412185a.46.1794835046441;
        Mon, 16 Nov 2026 05:17:26 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:17:26 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:46:41 +0530
Subject: [PATCH v3 02/11] dt-bindings: display: msm: dp-controller:
 Document Nord DisplayPort Controller
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
Message-Id: <20261116-nord-drv-dt-v3-2-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
In-Reply-To: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=910;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=nRlWeo6qwZpE3h30qNK372PqbYIGf1MFndG0VIRsKqc=;
 b=i6ITwZfY21YuZyrTMvYWrpTI+9AHfbQ5K3aBNJlABaLA9eT/NNIL0fXWuALzmd8XnCtpQd0ZR
 F2hraEx6/IlBVnXX/+Dn0+ng9V4wOg1HwNGpnrt86PAM/eN7YQy/6/E
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX2aeyFPnHTXVr
 fgTIsMnRkugothZMhTK4CyKWRqSVwTyrelk2o2Gq1or1m6K72J19ZMFCwL1U+A8QdPR1qm/FLYi
 e1cLY3eM/u04cKBM0/5TAQekSSHTAuybMFyVd7357raaVrZd1QE1b3D2aZ/VrXk0XkkWkMPhTQT
 hrqtODGCjj0xQZ+JfVxo4TMqkRUM5dZP1HfV1ZSWkqRH6AjByjCKj5Xd2Sn9UCuJC1wpRi1n94D
 dvmOZ2ecwSafTaxrDoOUMV49aEtG4GR5fDq1CXVLoZV7EZ962q35zZ1MuEnQ9lAjPf0U6c20p/u
 QT+M3dEsrhbTzytYA5ZushXbNLLnkHikzBVCw5DVptdoW9cva0VXb3YBFPk61frSQBspXXacCw7
 52S4xf6LOPpFM0c605Aj+1ITnkSX9B3vPlNAYSe7eOPl0kpZbGAo9617K8vzbXmRZqH9oisTqtq
 a1aYV0FAnUuJreYGQQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX0eQtyF4sNsVi
 Lf8g0axA/TIzC8e+EpnEk7BfLQZ1AiBX3aXcys3pv8Mxq/FFseyfu2FAPRMT5EILdMJzoiTXaeg
 vjP80cv86WFC/rg+JzmISMq62raGAms=
X-Proofpoint-GUID: 3LYXCD1Akwbnrk0023BUsTlaoN-Q2deW
X-Proofpoint-ORIG-GUID: 3LYXCD1Akwbnrk0023BUsTlaoN-Q2deW
X-Authority-Analysis: v=2.4 cv=Vdtir1p9 c=1 sm=1 tr=0 ts=6afb0268 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=lCWEfuFUYIIHy-HYLagA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Nord's DP controller is compatible with SA8775P in terms of register
layout and clocks. Add qcom,nord-dp to the sa8775p-dp fallback group.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 094a6383bb77..9be0288261e7 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -35,6 +35,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs8300-dp
+              - qcom,nord-dp
           - const: qcom,sa8775p-dp
 
       - items:

-- 
2.34.1

