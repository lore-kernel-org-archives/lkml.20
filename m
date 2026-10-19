Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8E54A92F5
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401941; cv=none; b=NkXpo4g5eU4h5p8OGZzYoctKf+V2uTlOXDlh0aAYQMAS2I06VNH985xo32ut14tF7bfr1LzWV0peohnNXd93wv0j3IJkY0be3H4T18kVyFMbfHTJtkkBuAT+Mnxn+da1yngkbzAamq4IOT/D7aZgusGRPJxqTlHJnNu8rlaDy9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401941; c=relaxed/simple;
	bh=e+8UUpMKcnPf75LsVbXBo8HtX9Fgl0mPigLSGru5/bA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eDWs56O4MsUFMrEVOITiCdpYlCHsW8LsoWYM+ruJjlqsjrzdFpoafwq4CDr5Muu9morVSqGvcL8arqdlKeEVt2AuA2w9Og+fzbZRG0HL1bc/EioPI+qKAm4A3RDGHMNoQyOgMQUaH1MQKgLl7GCStbyvc/TX8Ymofi5GmM3OIIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqO9ppiy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cQ0hGwAF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqO9ppiy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cQ0hGwAF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OurG2752288
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M16eCydctTBsxx4X2Yc0HeC0QuajReVm95RWjvQ7sNs=; b=mqO9ppiyfnFBXPOH
	8fCdmJOAlWbT/IuRkfFgT0LXN1O4BFSUWo/ZInA0Os92X20CNnTlg2SIYfajjwYC
	jpGXq/4psNhzh091LCtzuKg9RQII+QcV+fhHZeO+bUMHboonR/xojjJkw7KlTDiz
	dGSuQPMYmIw2AI8vpCAeDQnczQ5cIPschIZB4Esr5p0aaCJbeHcoYgnps7HuVfwk
	qNSzkq39UVsoq5EM1CXp9EMcht66NZrAJl4H7HZ2434Qu6MZAiKRQDBmcLGnNBzA
	f+QyH8+jjbCWDrtK6YadPt1/ArOFxMTOfMsqZpkxd3QpIrYZygXoEO2ieGRBE3uO
	b7kcPg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48gc68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:25:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a4d2e39acso4693072eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401938; x=1793006738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M16eCydctTBsxx4X2Yc0HeC0QuajReVm95RWjvQ7sNs=;
        b=cQ0hGwAFtvZGz0OMoly9HTrT71yeHTtkVyVpcQfj9j7bkUl8jACmZFTs8mX7mpdJTe
         +9kCtfH8px4Ilvo6VXfJDfd7QzLluQ/AQKmRXdQj2BNvLqOBqfT2gMTTre79UmtFFycz
         3nWDH1CXNgTIq5FEtC4WD9UGebsEgFdsATUyOyTAI0SnOyZZwb2oJgRIcbO/Ul4ei68V
         mQER+k4JP+jFSrGaizW3kBHodf7x4msfFB+TZi52mEVbCww86RqOLPzFwHhbr2xl98eH
         k4WDk1lXYzRABm31Bw+k54vQXe8MmSnSbPN+Y6A1ypmJjnX1cClRTJYybQ3cBFkzNO9R
         sqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401938; x=1793006738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M16eCydctTBsxx4X2Yc0HeC0QuajReVm95RWjvQ7sNs=;
        b=LfgvQX/SSAIn8RtA65EZt+qUdRQ8yortpaEI1/jfujUTNxiN+u565OShnGdHHnVav/
         TUo6VfkzQLurYuI+u3nqsfJBYJZJQdojj4UYSixt8uaNO/c333e5FQQ5mBPtzf87L4l4
         PhWhVo7K2YXynIVlYu9PpThmwXBwk+YZb94kxHOX6+6+IgdkdvuYM4eJO3qLST+y2mIl
         ZUpt2Lr71tVtPNsLvzVymRrCrvqKduSGGj/F4FnRGYsk/lqxR5L9sR9gDE95CRWufwk0
         Hid3RNUnpcHOeJVnZbyWO5bbFVY+Gc+hJmaiosRqF9xddsrqyivwUa41E4P489xqY8y1
         gJQw==
X-Forwarded-Encrypted: i=1; AKwUvBw4jy6raJZCmhCWq5Ha/tguWREiLXYivFcUIHI1PbpRtSYXjHuIYJDhfJZKsaWmH54RbLZw9K4lziVFJWM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZDDhjPeUA7RNyUCg7tfk498A1tp7zcRHjVNkdS29+phDYt/MK
	ijYz5KfnWG1NRx7/3W7TjWul6nuM1WiTqZkL75lbnFoRKt38UMguep+/3zI1/IHnh5/1iKt0Iap
	Mskz/KVtxAAHvizlXrVZ0hxolDvV77pYnWi+O5+Za98sE8aBiPif7zht0WDgbOEpmx0o=
X-Gm-Gg: AYBFou0HMNVRkujnQNxp4eGuBOugZB6izjJ+1bAmbXcMBTW20En2mtSlT5rAomBzRTK
	giy/u+huGYd7zh/UqTFIF8HA2rlBWCapLnbI9HW1CR6WiGJ9ViKCJ25GNyr6XM0LZpCEie3UNRX
	lBWNwbaUwQbLPwWYyh4VjuZj6S7aP1bqoDrv4rVfWZ2Z2qqJiMnTFBS2AmqozM3HSuKwe67q9o4
	iycViMfCFJRo/aGIt7g8xmRO7Q9VRVKQleRDN+hzStgB2xZFYAjG7lfnKomg7sEu944fycmNpBh
	p5hcIPBg7g1TFaTM4Ax9mdz7HnhHnyIhH3VQVSzfPms84E5QEEgNZBDBoK8n0TSUrkntHCXrh6L
	wugMmXqbJQRlBw14FdEI2WOX48CPjpJr0mw==
X-Received: by 2002:a05:7022:e80a:b0:15b:722b:4bfc with SMTP id a92af1059eb24-18513b99f8fmr14119625c88.31.1792401938003;
        Mon, 19 Oct 2026 02:25:38 -0700 (PDT)
X-Received: by 2002:a05:7022:e80a:b0:15b:722b:4bfc with SMTP id a92af1059eb24-18513b99f8fmr14119568c88.31.1792401937362;
        Mon, 19 Oct 2026 02:25:37 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm26682584c88.21.2026.10.19.02.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:25:37 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:55:10 +0530
Subject: [PATCH v2 2/6] dt-bindings: PCI: qcom-ep: Add QCS8300 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-monaco_ep-v2-2-852cb9f5d012@oss.qualcomm.com>
References: <20261019-monaco_ep-v2-0-852cb9f5d012@oss.qualcomm.com>
In-Reply-To: <20261019-monaco_ep-v2-0-852cb9f5d012@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792401919; l=1064;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=e+8UUpMKcnPf75LsVbXBo8HtX9Fgl0mPigLSGru5/bA=;
 b=Bs9h4/gScBQ+ICpGxT6UyZSLyD4UgaAYJ7CkTR6oMPjiE5t5vCjr12WRJ+wHfdjNiOmOjiYmf
 Su5PUarPnwEAcBhtsfCOD3YXoKgSnXI14zFwO7v+KrsG9hrk3OHRxkz
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfX6UChAVD4JXn7
 wcytL/o5rlgdFnVkbeRt07SwLuyTos3shmTN6K6Z46TvzzJbNqFqFfKNNOUVc7+gusJXcSCPvnB
 CK5/0PL90hMwQpL0OErMLX8g/0PH3AEMkWUpVw4c6c80/GaUdXCVz2/NzbFxjmr8wu/GbPCvH4Q
 NDsGRvceZqC5KWZIyIqinLggeCYCeClual8/ocwY1c4+EkK/rE1P2SKiOR/S1prhtnFppcomz4s
 HILgK85cBv/QWiGgaY6LNnHu95GU7nTqvJdPs0ZkgGnys/5YCxkrZXc+zVW6UuAWgMHLlz43x33
 F8KlRANKMMnTsXsLsUThI3IGcrLKBxfAvBy973LkMhZfbbg/0z6Pd3pKWLUdHtL24IAGQ60tN6H
 vy3FlgWx/tSBBVimEXgeuyy1R44iqL84vAsdx33EQfoS6ij7PSSdJPVkvrX41lZ7medkTH2ZPd+
 B2Ssn+BU1gHhgCSnaXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfX42oSwwdOgf8d
 +DmGOyzLyK+07qNRPXpvJ+gVFPI37Qy5xBf7O6OXB//3bVSfR3goOTSq/uhQtinRKe3pHOatGHI
 6inFqh3K7oU28TM5WL+XVmzONyeJsOM=
X-Proofpoint-ORIG-GUID: wWCqXLt5T0TBZ-VCsYMIwjKseRvaNMO7
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad5e213 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=AUvBg9Asf6StguVY0UIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: wWCqXLt5T0TBZ-VCsYMIwjKseRvaNMO7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190037

The QCS8300 PCIe Endpoint controller is compatible with the SA8775P
PCIe Endpoint controller and uses the same programming model. Document
the QCS8300 compatible string and its fallback to the SA8775P
compatible.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index bed9a40b186b..1ed0b97f883c 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -17,6 +17,10 @@ properties:
           - qcom,sar2130p-pcie-ep
           - qcom,sdx55-pcie-ep
           - qcom,sm8450-pcie-ep
+      - items:
+          - enum:
+              - qcom,qcs8300-pcie-ep
+          - const: qcom,sa8775p-pcie-ep
       - items:
           - const: qcom,sdx65-pcie-ep
           - const: qcom,sdx55-pcie-ep

-- 
2.34.1

