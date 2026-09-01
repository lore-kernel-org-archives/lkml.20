Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB7F371068
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271715; cv=none; b=knAeOl9f8DIoTzcge0FAPierxayvoYVcJ6AxmN50CZrOOL5EY6ccHgbcnq7tavjBba+KbKiQv17XDtJkrbtMxX8dy7t5v0M5KN0Xu9EZYGuBcIIzy03mATF3gLqTq/C/Is72PPckmCdAB+dXAblqXTerBa5AKvIA6qIOq4S0EfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271715; c=relaxed/simple;
	bh=colpSvQ380ywH2w2lEES0eevoSl8wWJBS0QAQ8Hjf1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eByCwM1miRZEuP2WNisTDMXOUZrbgT86eWHr4VPSkk+AZtK1iTzGKJ7AuHhnlr4khbYGsCnY+1NsHA9Qik2aFH6w7lE+1fndTl+oIYJ0v8yMySLlBsW7ArtroYQ+2nT78g75pXVcwPEdw0YXpayvtE+EMd+FxAh4HKQtjEINxfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kgIepFhy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aRf6FOKd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kgIepFhy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aRf6FOKd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681DWB8n2743990
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 14:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Oa5JSaR2HXZbUmoPEdwIB4s32xvCS0qi1Pl
	yRPcXY4M=; b=kgIepFhy1XHtm0FYuPNVqACvHfAd8lpc129/YWZ0kIP+tvQ/MDs
	QpXkSjnSAS9TgmamOYXzRjoRh/34hn5xFIcvhxjAeJvBRruXqynT3+s0BJxgBVbK
	aDg21qL5AxhBhmgoix+HqsA4ifWsbRATbzG8I9enKZDB/WgessrYES1khb/TUfeq
	CBdnTd97J/1oTw94F8d0NwboA1NGyr8G1001ss4vT6wo3nsjEsiEFrr3V8ikzww5
	OtSAuPmUwtVN6RqCIGuMve+6Xq63BPQjxptYqTLlw634fzqz/ntGKcyAnKIezbR5
	jurnC5uJn0qDoOcA/WJyJ6Dte4eeNRdRFcQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7cau0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:08:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396901263b6so7405048a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788271712; x=1788876512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oa5JSaR2HXZbUmoPEdwIB4s32xvCS0qi1PlyRPcXY4M=;
        b=aRf6FOKdm0+NvWSv6U7O1pgrjnbo4kIjswr0zGXukJ9oY1uYVjzCte5YN6St/OtwKk
         MXcvOTjYYEvs1ax7/Pp4HrP37rpZ8+Oz7W4OvirQSExRy1l6y4qjoSH08N2/1p0HFtG1
         up2yRRt3aLmgbyH5OkgtR1FT9C8o+TNEzVdtUaBpfxNOb8fVfunwU+pWylGLzY1+y0Ds
         Yq40vsK5jXwTmdfA3nDBE1UTh0M8mRYD7iqW2bSJqjFL5GTBjPaHW3Qhk3bhAt0Kztzg
         jQqixRls49rz7wmLad/uHaUI91KLDlVGKcwdZcbxbvPanCUIiLCAIU90f5hV1Zbon4Gt
         I8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788271712; x=1788876512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oa5JSaR2HXZbUmoPEdwIB4s32xvCS0qi1PlyRPcXY4M=;
        b=GEx/PrusfLVHvnjTQrDancu7dhvG5qOF/CgqQjP8myP4QTsn4Tbx4Q9wdvWDlxfYVy
         MJ5UAOC60ZNg37/AqjP7+hfiFg+8XqzEfPsXXaUfyXeTUJxCo46xt6FokS+agVJl+Io3
         s6Q2z3/juLx3cPOLWwZjUI/U45uiae/P87X1p7L/TnCUtHw2M+6GqH4s2OcPr+48M3tA
         D9rGDsrHHDhTKzdAKUur0tXGBsh9oeuV0/LwPjDhnupCSc4Qe0xcHgUhl0ogCpT1pClW
         xL2YTmqEkkLqY+1G6Fr7NwJV/5jhzUB5YnZL7MF0uRCFnuP0Z2W8VE50+Gieh38Mfq5T
         APMw==
X-Forwarded-Encrypted: i=1; AKwUvBw4qtAW+PdqT/0zBv/f8png8PgLvyABF9Wu8KTHCG1RIEBx0PoLktTQ7SgFivptvN4/3DDDKtKdy3lbxbw=@vger.kernel.org
X-Gm-Message-State: AFuF++km5vClke+t2G1WVB5U11G34w8cUEYwX2PC9iza9OjKAZbySDZG
	7SwG6MlzXHdDBKypzAWpyS17Zp+0Hsw/R6qV1yslKnF5EDRhM3aHvoDN9fa4RPzoX3kQY2uGwSj
	QzIXL1MzzyXr8/1rqTiXhBfF0OHQrnn3mlsMuDzQvPuKj5ceSS44t5YnsZaSvjbO1eeRlgJPooc
	aCqg==
X-Gm-Gg: AYBFou1bfWX/ugn7LiNSDrcCB5XOSVf5Of8FKycht53NGv4lwglSi+HAM8HxmAeSxCx
	VnFrf+Wp4YyWLWPhceR2Y81aAnD7HVByrdh02+nJ/xKL7Eq8BgywplVYafpaWgva/Brxx9eU77D
	Wy0nzmiqPx9U5lT2VwzfUbcm5mOpNMZuhwHwYcPd6n0MM71sIikKFtnjLr8z/qRCtCfyRxNhvdX
	J5vb4dtggafwVQtf+KZK1Z697Ohbos4XwBwLz8DWd+ZNFKOs76+zuWYjk8v+pfABI2PYFEw7u+C
	BYA++/h9DrXDft7vsXeJfqkYFqGzACXUH6VVEJH5B6zDTRUkSULq9UknV2hNiQI31p9AM0LHfY1
	IRdHQlhehhp0C7xP8/HQaCxbRsqgv8FJDrDZfswq9QdY/xRbQllcalTHprE0Y
X-Received: by 2002:a17:90a:d887:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-39907e0f87bmr12734700a91.14.1788271712084;
        Tue, 01 Sep 2026 07:08:32 -0700 (PDT)
X-Received: by 2002:a17:90a:d887:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-39907e0f87bmr12734531a91.14.1788271711452;
        Tue, 01 Sep 2026 07:08:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm56447342c88.0.2026.09.01.07.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:08:29 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: arm-smmu: Document Adreno SMMU for Nord SoC
Date: Tue,  1 Sep 2026 22:08:16 +0800
Message-ID: <20260901140816.74200-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a96dc60 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=W7vQhCiC0Tbq709-ndwA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: V-I82t1EDVWX-qGsZ9RSY8uPfpufwlba
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfX4dpMmuF92bLC
 /LKWBUKenSSeW5LZ9iqupaHrUwCaNmfRSkGA2VL2HWKshHsDO2Cqet3ZQZhhxrOL8b9IJV+kIFe
 EU3kWYuFeDhtczYJP9ftfg91uo0nWyM=
X-Proofpoint-GUID: V-I82t1EDVWX-qGsZ9RSY8uPfpufwlba
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfXx5Tm8xcvE7bB
 m1lyrtzoL5SfcaHG6XG+LTY8y3S5cYTMfizDNt/voSj05OhWufy31qcSVU9d79wjMvfcafKehX8
 NT49pmLBiiXC1CIWRYWzLXRvdXKVGyatNd1P+Dp+PKb58jqlqiYjI5IeJNjgCKOWhbtoaWFkD/8
 pDGuwr2uQtEm+E36EJvunpUJFow2fb1imrVSfOgbCjBmA/yKphpn1VHgw4ZnBFttaWZi3SwuXnE
 bIiaVBHbrzXsbSY8q2eK7kblNzFc9j65v7Lfud6VhmRP7rA84d6K/D/6sW3Fy1rr+n+kaaeK1Y8
 uQko866oH6lIbo7KMmNXuEsfeR2933XkyQOq54lBMuoz5+4oDVjh2iJ7oIzn6rcLFn8g61lsnye
 8SDXjctttfu0Csqy0GAZWpvwd2hKI0iZ5Y5Vfk42Ha4+/VpWqt/fd3eWdNyO+ZZz0547Ee85QCa
 uYWl2bgGyt7zIJDd3UA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010125

Add specific compatible string to document the GPU SMMU present on
Nord SoC.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index ffa33b7f4a96..ea338d313c05 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -102,6 +102,7 @@ properties:
               - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
+              - qcom,nord-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500
-- 
2.43.0

