Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419117;
	b=lUzqpvH9eKPiOyH/ZiE+Gl/NDn/EF0eA9WzwpHKFnzodLs3VQG5Q76wuPyR6LzHEhA7e
	 427HmRNg72511GUcgedbekVq78vGEOPGqt0dEcCZXLX2dRRLPQriY3IzK4aG6gkJMCCpc
	 WyRhDAzb09d8plyI5S6HdYDS51zR0b3XAJr+OjEpgne3D8KnPr61eC+Nww4GtQ8b2DYoe
	 KwXk6q3Rpki7eRNV+XYGt0GNQXf1//KtVX9AJzs6t+OIC21/Jncm2t7RV1wdi6K7argkA
	 JSydGG5r/CwbIVfXI5PwwmhiYPeOfmnwl/CT2hPp+4/X8dgpjesuXDQg8+LM9AHHw9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419117;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ncvx1kc+KnyirfS/u1X4r0v1xWirGVewXCeeeqzrG2M=;
	b=e/u6PHm13H6utvd40WgvQRddvzkj3Y1c3GdMC6W7o2157vQk4U6IrxpwJYUR64mO6px4
	 t10j2evsay+yFARBeh5Wq9shvJgv4aTrvPACp/8BIo+vdyjTwP5ddpvnHQuH6Cuo0blgq
	 0r/DSUU0f+lOH3Ghu1QX1XfRJ1n+qHASpHR9yL3ImNPYC40tlX9ozoKxrq/RX5GXfCo9s
	 TmfY8QCMYm+oItO3CMsg7JyWvYGgKrSR2u6+tP6ikPvrDh0H42G3sJwLfutNAbgxWbdNA
	 8ND+wyazy8EABzwE+UQml6+yvrx8rfNJDe4oQveqGfhQAc+tWcFc79vp8cr/iw5zpuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AGBbzFaX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YDAtrCry;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D298606A88C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D298606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AGBbzFaX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YDAtrCry
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0MX52665062
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ncvx1kc+KnyirfS/u1X4r0
	v1xWirGVewXCeeeqzrG2M=; b=AGBbzFaXTQcH7ATZsrVb3OY+ZD9YVm2yYJLVBc
	iwC5BvJZr4bFELQW3pC8bAfQLxCOXKEypHgsBC25ZFPd7ZD2qpg7NoZ/vuEr1tec
	oMf94m1BtIquBTxMnNPB0S0F6Din9TofUW4g4mGp/yF5GsDfdYbkCHKU2C4n1qe+
	CJtF4URKI+DbvyZTLt2uNIFhgQ5zK63MxcLgrhRNfTkRNPAHVKkqMsb6HDa/Gqtz
	th09VJSHBS2UGNde+lQE0DBoQf2sT+10q9Idp6Ike7v4AnY2Wd6m8tAQiiFzmYbf
	uC46NskzqkjTLFN6zQazwD9LJDcNzUTqtGedKc/GvO+iXOTg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdk2ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:45:16 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99b92772710so2592251241.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794419115; x=1795023915; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ncvx1kc+KnyirfS/u1X4r0v1xWirGVewXCeeeqzrG2M=;
        b=YDAtrCrymui/hYobhBfrJvjNrmKs0AzhnFq3wP4jMBJMW8UnnorxoXDEEpEOyFbcwG
         Hsqjp1CkPahfGxt0xDBf5RR71yeXQi+Ns3uDvmg/yLsd3Z/vcLtBa1mgeQgdhaV6Xu4B
         wUOhF+IoCZbDSp+Wqwc80sadyjt012Ijgjs6qPtSgtDv9fM91JSvrbwRkrIfMeaEyUjw
         3tmeV6a8CbSTinnZw2qO9tygtLE0NlC+3+hjWXbMbZ3VZd92mUeWy2yRFUQfA+T7g5Zh
         Q2bKRiJ4KIs8DQDHPTX+CWtU/4frgXNegOLVIuYtwLFI02hJC4HFGpPHf0YCoUtmviiM
         wYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419115; x=1795023915;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ncvx1kc+KnyirfS/u1X4r0v1xWirGVewXCeeeqzrG2M=;
        b=E4e1+TPBcYhtKwbztd3Apt4N7rlMkuOgLC3NUdxHpuyTZC9j71P8cu5XAvcVb/qbtd
         mgtmDE/PrcOfWfoGz3KrupT02jIeXToFsHkBzzH/IRtKeG8V5dSAIkSZug8gNqQ++JTP
         bjv3YVBMZ3Z82pkavclNakN5NmyQZJVueVU3G/2o22ZU/nmxN8Qi7xibE/PkF/H2112W
         l37QqL4FNwZBvyWyKq814PGrN50w6l0gMFqJKd+VxeGmBBmMw/oYyW6VUdc0jcKhWYQA
         DhSlMIj/SFd7SkIJQS5n33KHQhr2I/ONnrFpQGW3G1x7bWHLsw0ZKF22ZwW8/Gr4/PnX
         W4bg==
X-Forwarded-Encrypted: i=1; AL+hErEIuUEw1ItJdjKVRtbATcGyyw4mL1O+qwov6oSlCk4xpuv2+ON5Tkks+7cFrj3Y1eEGVPSApp+O4mNYQyY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Y0b8RnLxE3eRR4lIEyqL4aTgB5A56hyr3+0QvVZrpIllJ4Zlu
	eRQXTHStL8tfDZGmiio+fFG7WfyTve2SlqQEoHcfriER3tnsm/7kSgmPkabZudpCOiiI6z6+cOJ
	/CmwM6LggGdTnq+BwgQy2RIWz9T/JH/OJegiAjvsrv+D7fg1w6NcqBUz1g1t1/DLssGs=
X-Gm-Gg: AYBFou0o9rjclY8zhMghCdze3XsKaBV8U3vWf6fsQWNnRKVGfQ6/7HiDlDgxv6Arwxc
	ydazgCOfonSMa42zTLBn47YYQ+JPE2Ox+N0dXmSrS+cwheWj7wpmHUp/3334IUIHQdD53naBw2U
	L1HhIUD6Z+uLFvqstg/iSb+UFh/FvuZQsvwMEJQ6Z5Y1GFYIeWLenXD2wKhLkE+u9UQ1pRR8y45
	w7X7MCe0SKi9lWwI7DbLumo3NR9waxKgcmnyjHKSx52LduiCvJ6kwOCM46IePIiJHpI3iCmM4jp
	ixSq1z3DPUpBo7J6neJTRv1cZC3fqHI1+JPd1n0GNPmA+wAIg7khg7sR48oSf+kEckXCAOf7LEw
	Iua48oM2J16kUE5IfMkKlrOkADZMEpHRo6RhONyh12BtoGfDD3UO6CfOIgyO2doZvo6tbCQ==
X-Received: by 2002:a67:e713:0:b0:7d2:d9f8:21cf with SMTP id ada2fe7eead31-7d5061e6d25mr1449136137.29.1794419115350;
        Wed, 11 Nov 2026 09:45:15 -0800 (PST)
X-Received: by 2002:a67:e713:0:b0:7d2:d9f8:21cf with SMTP id ada2fe7eead31-7d5061e6d25mr1449109137.29.1794419114825;
        Wed, 11 Nov 2026 09:45:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e1f5810sm4846525e9.0.2026.11.11.09.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:45:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm: qcom: display/msm: Require DSI graph endpoint
Date: Wed, 11 Nov 2026 18:44:59 +0100
Message-Id: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0K6dkgHEYkr72FYlNLCGGqxA0RCu
 LsFD+DmJy/5/79VsAlkWNySVQQzE5N/RchOidCderUGqIksMpkViCihIR56tYBjB95CG9TQgZI
 lqosuMK9zEadDMJY+x+2j+jFP9dPocf/aGx3x6MNyeGfce38UM4IEac8oC1vitc7vnjl9T6rX3
 rk0hqi2bfsCp0dtlNEAAAA=
X-Change-ID: 20261110-display-msm-of-graph-a081a5c614b4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3375;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=aXbJomZ5DO59KV9VjzL/jOUnmaWmH1KHQxCz5sW5hBM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9KmeCDRuPXZQNp+DC6xqfi4nA8Ma4N62VXzkl
 jjJ5Jk2HzCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavSpngAKCRDBN2bmhouD
 16MfD/0QnpTOf/4Fs23G1SKNkJwzDl5wtvoaxXE4BgjPpbHV0gdtL4k6fDz4pRBab3wXhWVODvX
 Z9VbUU0uryAhuP8rNvQlqNvjOIZ/dT4SVMwtZIfcpuNx4BXUiofqF66iJxX+6xYg2xhps19+A4w
 UkTQEqdk1AgcBQlI64KmzXer8FwdsAfRRQh9nCOXRnh4XE3yJHQaWRiEjkFdg13e0qbdhCaz15F
 A5ad0m7az1E5BYfnwHfcK7KVrt9c1KhuF2gzBPftvtavXb8GkzSTXdKADYTz38juILTuRhx5PJO
 JdLj91aH+ru1irqQHIIqKht1/4gp3xFc7upB5Zs+8iUJep+WGcuTbX+dyraDunKRHEjRILHyf7m
 AkAY+wt8bi4JH/1Rno9sgmW/n7czN56Cy5TnH1vrhmEjDIJYWuiu0KhtcYH/BxAmzvs87tvcCCm
 NiQffrtaQj4PtObnUOdOhM2Jq9GblRc+wC50z87yt/3e/3+3zjbprCl9OsyJ56rCrUV1IfZrRLt
 Ipf9bkzY96aH/U/zXztUSiVXKEtUonhZSBxlF55tBy1H013O68fv6mfAcJxxNT+kFwJBaF7EIEe
 prZqPFXlE3/m24KoU5dzvM010/H5xqhPj2JLvR+G7AujovIYjLSrRoQDh0NtzMsUoqg8WlocRaD
 nMr1jYBBML53SPA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af4a9ac cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_iFXmH2w7s5zJ4zlvgEA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: kuh9f_fIO91uDX_LQaYoX9DhQwKabx2a
X-Proofpoint-GUID: kuh9f_fIO91uDX_LQaYoX9DhQwKabx2a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MCBTYWx0ZWRfXwSsfeHot50iA
 Y/bRhdVDC+exppZfGCvHw748MsqijwISLU7O5tE74kxKuvbXKziABap1v5Yr/IGgXLVf5DZ9IKY
 HoPaTI35y+99pSuryctlbBHvcqlFYxrRMOqFKlvzByhu1qPnxgKXZNILhbbrO5IVIUvXnu3dUc9
 K4ABTO5Xa0thEpBeUS2tYfcw4An3DrewkTzgvbSx3t0fCepWmYUXnaw5B1xH3WDKeHbMgx+cASP
 5n1DIvzuNXUqguCCy01zdwyGHrFXqZvUvfMhWy+TpVyxg6XSTV+ScVizkHvCMux3w41CTrfX76N
 8IyRCXGIvqzA+soGy8qOTKEu/HuVPUG+mgTx/3mUhkWAl3myDQuIpWu4LdZ48ZjUTfZdkhXu22m
 ebKgamZKD6Wui+GkNjDZMzJKoTMDBbgox/ryxsoeWV1dTHVSp1R2BtY2zfj9w3kvwN7tDuPGqy0
 uVEeLdy4+XHw30bEqew==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MCBTYWx0ZWRfX+IjYUxIszuPE
 0GjH7RrbhKMmhoHSVY9zAU8KI3+LraanyuaOm+IBI1IEJ/oJU6gGyy+ENc79NP4Cq0YDLOgYr7H
 HaKltuQgzLBbyp/FF4/BmQngDmQp67c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110070

The DTS can be applied as is. Then the bindings can go independently.

Changes in v2:
- Patch #1: Update also apq8016
- Link to v1: https://patch.msgid.link/20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com

Qualcomm DSI display drivers won't work without proper endpoint, so be
explicit about this in the bindings, so we can validate the DTS
properly.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      arm64: dts: qcom: msm8916: Disable disconnected DSI
      arm64: dts: qcom: msm8996-oneplus: Disable disconnected DSI
      dt-bindings: display/msm: Require DSI graph endpoint

 .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 6 ++++++
 .../devicetree/bindings/display/msm/qcom,milos-mdss.yaml          | 1 +
 .../devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml        | 1 +
 .../devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml        | 4 +++-
 .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml        | 8 ++++++--
 .../devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml       | 2 ++
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sc8180x-mdss.yaml        | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 1 +
 .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml         | 2 ++
 .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml         | 1 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts                          | 4 ++++
 arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts             | 4 ++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts              | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts                | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts                 | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts            | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi                             | 4 ++++
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi              | 2 --
 33 files changed, 84 insertions(+), 5 deletions(-)
---
base-commit: e4924298116a18e6fb5b86e8a3b7bcd3b4ea0f46
change-id: 20261110-display-msm-of-graph-a081a5c614b4

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

