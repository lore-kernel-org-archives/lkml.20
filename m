Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B3547F78F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246455; cv=none; b=ekt1hHpwCMHwrdZ1e62kFsctqxWByjgdSheeSFGTVLsPltIqIz9lLsYMaFpDuRtmC1BtdABy8NKk+ZED7nFbHBll4VVzTYHNbor+05r0I4R6buB+xqRq31qRQVYE9ulropXuhShMOXkJW7eQkMm7kY/TPDXHVsIW3qHlQK6l8N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246455; c=relaxed/simple;
	bh=252SuBWkTFQUaNmgwEjoBdG98eVOzYs/Rbxfl8e3N5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BA9Pnn1rdZZ45gENuDglv4/fJsxo9mdrwUrhwNOT8A2W56KSuMREGl2iFkVMQcXfEmcwQacGniJB7Wpvvy/1CLZN8uazZPUJ7Lt5Cl5m8wwGGr0eEkWfukg7bhOs1y2mJAGR8K9/a4CJpYW7KQOI32A3dV63zEzSdnMU9tHY/L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YfPGEmZb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gxi32fh6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YfPGEmZb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gxi32fh6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA5Lip1175629
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2RLcXV2PFUspAL4t5UC6lEmS7T7l3SwUB8Kze/pYkXI=; b=YfPGEmZbrLraYFiO
	+nSKk0OxZj5L2NtmiOFgVV2jc83Zvqlrj4HsA2Gw55QYPNzjkEKx5CBmjUy/i07w
	Yol/Ac92nagbK+rQxQARtXKLWW984OMnedZ5w8mZBeEXFsueB8IuZarjInLP+kZC
	6I3dgl7yPV1GlqpcSr9UuowW3ji+QfEppd8Tju4/5QT6cRcBVB16uizfZJLbOU1+
	dK7zBtTCHJT6495AGUm+LE8kRAO8ivbi6UFvw8xElMNilBk/4COMYJy2QodtCqB2
	Ba6glTUKBMElwtt/r9dS9weG7uImfCsSVp0jH8KacPRC52y/nxHQC+SjhVt0T8Eo
	AlPw5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7r44q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93be6ed214eso291906185a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246451; x=1790851251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2RLcXV2PFUspAL4t5UC6lEmS7T7l3SwUB8Kze/pYkXI=;
        b=gxi32fh6c32HJXiVL7B2M3IKvB/RaciLPtvXvQNM6BxIKz1PabDAexf7F7A5rvA/PC
         crPBLVqGlnc4ZhNnukiQsPSEET+lapTrB9Y3oaarnauzh61wLE7bdfV+7YWbyVxqOKqw
         W3+q20mydRs4el0G/O7KbHZgmDDZI1rlEYy2QHeTaV/LxgqegbeTRhy/MIcJ+ypZrKRv
         r7ysPnbfnn/hbhg+Kp/pAGmaMo6vmx0e+WA1AZqHZ6tYRrKtrtuR1O7Z6aQ//HSGqDJF
         I8o+SLVZ99rV+ggYTGSSJj1+1Nq1U3G2iQ4ezDjvQBHpQW8CbdbM4ilNaSz5Vu2M8HEG
         uuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246451; x=1790851251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RLcXV2PFUspAL4t5UC6lEmS7T7l3SwUB8Kze/pYkXI=;
        b=QXx4uLj8l6VWrcM0fGy1ZnZfNrLnlTt7UjzHQIOleIqJL8dbn8krRGx1nTAO4eomuE
         zpB+Ws6QcqzgSC1+s0xbbGk9Wd5uPV8+PduUJCr98sPAK7+va4JDh8niOcl8BPk6olQP
         hA0g0WWRRR34FBLIY6TMeKUbec2ivYLR9f2hsvEa78d2O1aNipJHv8LIhO31wiGn5HLj
         mN9mvHmKxMCCOeDDGAyC/+7DxEDNot7VDxF/7vZkv1TCUD5fl+jcmMFuT1f6Dz8ElvoB
         3bDV+8qX8ROZ1hvU0hM2kHGfMpaeu4aOKrLRJibTVIzROkA5XBqnncBXF18na8irIKIP
         xAbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwu7aQEUhy1VeIB6RHXlmf+OH+Gfw507E5LuI0weLbxzn/PRpBUpZ4mOQISNlCY193/exvLcwb7SB18QUw=@vger.kernel.org
X-Gm-Message-State: AFuF++mitjY2gWmGpSjdHbkERxdZ50bdRqID89qvpmpjr/EUtqs961wi
	/+jMVRrWzIVgFBRfyuGuyD58oP00H0sTyVRGRxUR1DOJ/GWCFfrHG1tG9Nn5Ckr1lSVKIDphFAK
	QTCC1vRdzJTNEqgUhjFktjNfytXUM1+cVFRSBvau5ds3oDSy15TfsYjQ/sw03aasTZy0=
X-Gm-Gg: AYBFou2F+56LNfh1VKsYiTSeWe+A5qya1YhIOOr9fzj5FwoCUf77jQr67UtdyNOr4pc
	/MnYzBFPkl+PDQunYVUwZKA7+4JSmm2TcCE2Hal5b9Z5fM0fUk4y72fDhu0QgaHkgk5KKEbdFaM
	3U4vNOYrNsqd3MIVPS43L2LwZkFcv+OD9hbGAJ7Fm28yqT310PhbPA3cpRnxcwi2hWja7U8dljn
	N4K/KBtQbx4fFf98oanupF94UEDOXf7M6S8qsM6oF2kbqdTannie0X5BKHcpDPPEEl5VD0emdpQ
	NyvAJR+PfofQePV+N5tP/PgGqDDVv+G+xKDAK73UmXsJ5ErdogMlERPtKUONEzJ5SsazNc9zJGu
	ioDwhJSSx
X-Received: by 2002:a05:620a:84c2:b0:939:d459:4810 with SMTP id af79cd13be357-93c3628444cmr214565685a.26.1790246451211;
        Thu, 24 Sep 2026 03:40:51 -0700 (PDT)
X-Received: by 2002:a05:620a:84c2:b0:939:d459:4810 with SMTP id af79cd13be357-93c3628444cmr214561185a.26.1790246450622;
        Thu, 24 Sep 2026 03:40:50 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:31 +0300
Subject: [PATCH v5 15/42] clk: qcom: gcc-kaanapali: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-15-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=924;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=252SuBWkTFQUaNmgwEjoBdG98eVOzYs/Rbxfl8e3N5I=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3oWwfGp34JH03+eBeSANU6Tc4ZJl2nG2Wh5
 9XN3zLFBCOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT96AAKCRAbX0TJAJUV
 Vu32D/47beIYVfzSauka+DrKi0+iOEAPyWRMXRgMCZ4Ux1dcmlPATVAj3hSeSRF0WAdBiSoe02d
 cB+dcdhZQCGUcjEHiafbxb6dqUJDaKpJUB+F6bEKfTkDDwDfuvRyujhk2IXB0bPKaGGDsNky4uu
 CLrAYl+IXzvGpkodGZ7bf/+pAgCq8VjTwLiZE3jsNIUacCRdCR2KqXt1zaWV5uON5lpnI7ViBpL
 AcPykkQo6CzhcmS4UrPHvJo36cawlfRKfi3qFa5iwrIWiOKZVbY/6CdpsZPN/W2d21Ejvps7sd9
 XZUS9mW4HfL3jQ9vRv4hEEfEymdM7aUvVrbOsJ8BPZGB1tykZO3G55hlcKZ7OjaibHOZNuKRT2p
 ZyQXZ2yTS/cQ7ieIgvUvPdEBzQEsFP3iMLyPPNt9EbuaBxOwmhj+OB9sVr+1XCQvOVs1Av3TMVb
 wFOtaPRaqz6H7177ib79ZQtJA5EsnJkGi+Cwe2+FeH+2ghKnESGnJ511LVYYERyrXKNGoCawnIs
 WX5lL7rgy9Vqx3aZSjha8A6hp8XBuzRFwHJ6HKL+J3jGN+38biNLK0K8LapIl5Sc7xrJ0cDqQcv
 lZPCCAovmpnouVxmSeY4RRBX948NF9uH3FvtLGEkngFrCNLJabpMtc1xdtPlJH0ZOsALjkEo693
 sz406ntWVa4Weag==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: HBykx2QzMBtnkM65i2I3wlRKJ6AthBN_
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab4fe33 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=gcpHbPksm3HONcV3VD8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX9q1E+NRjnaf0
 cf/b96LAIRofJCZ3KxfpJE1Z8cjcUHVOtXb+/Uu5qBUQNg8S7i5n+FJmNVM2fRKSG0qUMfb90OS
 R9i83OGqcQaILtzcpiXG25hrGRwpFHp97ZD0gRrEAb4tD2tYvna1k9k/u42Ju/+IIZ6hbsTCwt3
 2tHg0jqPzKlYA1sJVvfyPDZOSG3tZODRkjou9rOSH7yIoGmVpgqTw3MrO6xCzYfBsy9zBwdNRg9
 moU+9PYDdfDiPEBqZLzDisn66tjg8pK70boP8bSCL/pX5vz6MlSWDoGwMbthJ5hPfvZ4ze94mPi
 gKYah0cNbJmwih7W7z2Ya4N8vh/t6JlqWz/DsE9TdSOThtzJWb9PaNi1foQnHnSps6kK/D3mOWg
 4RAaCnN8DEAw5/OoQjHHP4GKMCt4+yLzxFBKtD/r4S/Ltg5eIDXomqD3TW7x9gs3qSlXBpViBit
 uQkollPzTCTlUFOAGBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX5NC4BWaY8NRB
 /G7qwMY+fNpVC6ovw+CLgQ0SxkIHKWFwO2vgxW7S5zHPVAByt3PkrNhEQMksA+o8aO/RfLW83fD
 ApV//BNWFlXDBKCv03TXFMCojOPDSZk=
X-Proofpoint-ORIG-GUID: HBykx2QzMBtnkM65i2I3wlRKJ6AthBN_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index e310b5c9b5c7..c9473fb79ccc 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3502,6 +3502,7 @@ static const struct qcom_cc_desc gcc_kaanapali_desc = {
 	.num_resets = ARRAY_SIZE(gcc_kaanapali_resets),
 	.gdscs = gcc_kaanapali_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_kaanapali_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_kaanapali_driver_data,
 };
 

-- 
2.54.0

