Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7150353EE0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789969059; cv=none; b=sjVaR1+K6gyDQccS38XgfSmRrIfmBM4OoCXPvEJK4VesudADeOdi7wc8a6WTy8WZ8YYG/9OLzCSz1C9mBIrq73Hjza0EblwfL72egWBxYIEB+kZ4ejnGkBm+ZvaGkcBgpbB9ckiYmR3nwl9ihbOt5yiE13Hu3yRTBl14zTsDLt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789969059; c=relaxed/simple;
	bh=5BpZafnsEX7T5i/WZquEyzAEe3ckLbNCfbpYPY2ev+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E+qlVl8ZKebJsdqpNMNQdeecwh77RUKjMH44zTqFXr48/alcXuuuNJgWl9rJ8Vi2Iyz9mcwCmepSlgA5nnK5G3zkaXGNXzQGTtnbPPf2ruUb6DiTxEhv9RYsNd22OuRThFT5UHto0f4/Klr/psx/j/XcEqVMq+7GuSmGzf6yiDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aeurDXbn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ISf+BSRI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aeurDXbn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ISf+BSRI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3ZdXn007258
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VyK9v7BIQIUgn5FwyNENWCRWZneiieaKP064jjyjGUU=; b=aeurDXbn/MsKIUKG
	x+nG9cEN0ZgZobOkB6vuCeShjXipCEBH1vPWSq0ivDZ/xJ9KPenoHJJ/ICEFKMBG
	IySns310qB+bTCbdDXdkI4FiIqQVGp9FUq3Pu2hrAdBmeGow1Hz9wNKe4HFjZ1Ey
	/Qmulusbd6X+4s8STAHipPsV7bpJLmD+2E4PTxdMuOipYos1SAQUsJuxqLUjk9dt
	gVi3f+HNGyaRVs5sfeif3kglnX/V+VORTWVovlPtD/N3O5hKI+Vo4RdDV1cLHH5s
	x1TPpXK6qBuHt4RpfGOfmqngIJpjERY7uYXBCIqx75zZ51hTjyb99/dQ3b+7xvQG
	Q2AyOQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8b91jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:37:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so3521512a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789969053; x=1790573853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VyK9v7BIQIUgn5FwyNENWCRWZneiieaKP064jjyjGUU=;
        b=ISf+BSRItVRC66ijWKexQLogOgi+dWbUCWNiK2HkO8Ut4LLB5U++76pM4EclBlZ0TK
         o59aEf617Ho+C02ZtaByTDQ38LaAX/5i5S2Iuz2z/Tki6xszOmZBjIbinMTnOFUZWOMH
         h5XLNJQfmIWz2HKZgN6lyzXf3V4JEDqW8i0aDg5640oKMYbNJtKfpbBEmGe/KUu7qk/s
         z0/jMe3GoPiB4J/bduQ+2g2SDgZTMZfm4R4XE/l+IG4JtsE5j3UA9Hx0VDJWtTYySeG9
         JdzMl0pUv6VDtjxxzLD/XXU/nmQ18jBvkHEKjK8TNyS7j9LH4WaSZybPy7gkQ4Os8Kmd
         ouRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789969053; x=1790573853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VyK9v7BIQIUgn5FwyNENWCRWZneiieaKP064jjyjGUU=;
        b=o9OMPBbD22jIF1ItTLWtK32ZxngFOWXfaziMEw6Kl93S/Sb16G3mwrXBRf0x4qD7Ul
         Z1dkgM2hNMSe50WXkKri/HDLTHcHTd6Al5qhAMl0caGpHdtccZmZxPYnmF5Smi/gzjh7
         bA/mrElYSTfMNrJnOohLH3QmUlW/W1pTmK8DgzxowAge9Z059+mxyagThqWzVlNvWCtq
         yEPrWmymPvwO/rid3QEtHROaykJ2z9BjdA/XJFVNEqzRlquwJRjWBWf9CRVkfAjmkB+2
         sJghRxcdTFd4zuQI6Lc3zK2kPjBOci0BbESLI4UWZJslV7t1V1MteoCL3r1DPtHYCBEw
         F5pw==
X-Forwarded-Encrypted: i=1; AKwUvByF7duY+QOGuQMXqrUGK0EL4HxWMMuQqzR1BCOWJ+Esf6CJsgDmM+F38m1gxb8OphO4Jklztt0+iBsTmUU=@vger.kernel.org
X-Gm-Message-State: AFuF++lQYy+36vAtsEy4gqWLrregJFnT2qzXXjBV7OYYBA+wH5pJpEFy
	ri11jjUcy8ja6167Afem8ut5+jw/qeJ9uWh5sQJ+BNrlC6H5CmEpZCrgulp79QUhmQNFra8CVim
	N7y9dWOM8a+I7mkEGbFtzUCNCGxAyvKTQG3TkSt+42KioQW/+pZKqPlR8SuPvhzvTobE=
X-Gm-Gg: AYBFou2uX5NjA5+JCgbdCutSp9IOT5LYVmgooAcM4mmgmd/0TkgSH3hrCb5HBMnYlmz
	Ni9Zz27M80r/XxidOle/ZoTqANPqN7qB19EJ7m5jde8HvMzJX6weNHAC1fU3rSaOnXzE1eRSJdD
	osa7ApIho3imP49VEovsnNir1Q8/9rN4HY1j2TCr40DmerMdSXZ+UUtBLjX3VRrwtMxopMm/dzE
	+KkXNFU18IJnRU6316HQh2Jwyetd5ctyfUTlwEVuWodZibKq9rjfxQi0qLBs6WkL7pAle+KiiUb
	SiyT5zzEr208H4KX4sbV+JJ8kF78HpkzNHeg3wM0/WbDXf8xHsehmy/JHEFj0BRc9wEf4XiHsZE
	hTgeE8ZbURJSxTpexc0x8qxF07eRi/zSOxA==
X-Received: by 2002:a05:6a21:1f87:b0:3dd:a196:5397 with SMTP id adf61e73a8af0-3dda196546fmr10465705637.57.1789969053496;
        Sun, 20 Sep 2026 22:37:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f87:b0:3dd:a196:5397 with SMTP id adf61e73a8af0-3dda196546fmr10465682637.57.1789969053073;
        Sun, 20 Sep 2026 22:37:33 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55d45a6sm15054568c88.9.2026.09.20.22.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 22:37:32 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:07:10 +0530
Subject: [PATCH v4 2/6] dt-bindings: pci: qcom: add Nord PCIe controller
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-nord-v4-2-ed05c6e09240@oss.qualcomm.com>
References: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
In-Reply-To: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789969033; l=1074;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=5BpZafnsEX7T5i/WZquEyzAEe3ckLbNCfbpYPY2ev+A=;
 b=qPQQ33Qv1h2OpSHMvPj2DQlR2892pCG40LT8YpKZkA7jH2hgQunN5ZStmTproBsQ5lzbExt7N
 UP7aAnruBYRB7EelY2nyoVDQj4AKvIzAZKmTugIXGNa1KMKo9dwBH4h
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA3OCBTYWx0ZWRfX0Pky3OG7lAMx
 UASUZ5dOPNGpFAbtCk69oZjtifMguUZ9tEwr08iRvY7Km0O8+DUJ8eN4I5mHbeM0MwyhpvGohz6
 ssCaSktHr7Utx/+nH+b+Lgb3Q94YSIBjfgsmztpTP2LtpAhPGxEfwD/35Y6nS8k528j29P7L0oZ
 h9QMjR0099zQeX3xjZ1zwwqFUg2XODpu9cVingBE9iIcAWvPEpwKFpGeYw6RbWIan4HqbqXNr6n
 YX9m52QtO8zQ4oljc+MA47SEQOU7S9V0g81Grr0P+xVT3p6qi9TvgStml6Uzpc/erLLU+rn/zcX
 ZWJ18E9FANgaopDBscE87+53vUW5O1ZyFZ9t+IkV6qJ4Q7UGAcUByu8uG9yy7vK097le8xfJzS+
 081XYn42Y6T7mUDeSNeF5o2sws5YkLqxtsoPKR7bFSefz3UY1oq1qXtcfi21DVskmRzOD8nLqtT
 ko97S8Ii7W/e7X0SHyg==
X-Proofpoint-GUID: C62Qh2aObBW4O8Y4yxnaNJujoIsEW2DF
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab0c2a0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=AUvBg9Asf6StguVY0UIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: C62Qh2aObBW4O8Y4yxnaNJujoIsEW2DF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA3OCBTYWx0ZWRfXy1Zl8PiU5fWz
 l6C57CL+PQH3nBurX8vEdCQwOOremcUFtBAtMXLFf8gfDkTV5Rnop/lUuQyiAjrzvDlYQwAwxw+
 CxuB641TKMoATinrPHpqJr08BK2q9Qw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210078

Add the qcom,nord-pcie compatible string to the Qualcomm PCIe
controller binding.

The Nord PCIe controller is compatible with the SA8775P PCIe
controller implementation and reuses the same binding definition.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
index 63630a814f28..b8ba2c4449b7 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
@@ -20,6 +20,7 @@ properties:
       - const: qcom,pcie-sa8775p
       - items:
           - enum:
+              - qcom,nord-pcie
               - qcom,pcie-qcs8300
           - const: qcom,pcie-sa8775p
 

-- 
2.34.1

