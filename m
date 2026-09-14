Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EDC425CF5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379679; cv=none; b=n/skEOJkRzk5JtyWLRaga4hyUMX0taDq0fbQMwZYj4TrICIHjOk9dC8uC9wMUCh6PIRFIw26GCJLybXmw5NzAQ3KKUrqHZ1oaN3vNcj4IrxTpWu8SM4WKx07yQxKvjnTZMcGIjY5zutnYew+qWw3KwLGpN416H/Cw96XdrnWkWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379679; c=relaxed/simple;
	bh=EwOnmHR2YqzdNUjVjA9ZU3DKaWkxGqevotYj/IaX2y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XRK2VJhrr8NSLUPbgkCVP41kaUq+OlhJ7/JuiOhO/NSdAZYy9/FPnT1YnY/P2UPhDIH6pdHUNsN9NRCYO2bFd0k0Wvwn+gFA6ebisM7+bPPtlZ7TOvOqKWXao2hLuylb6mJOGC4xwHhzYpR6iIlKhVogpV+pWYcYJ+ye2/5yu4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HmIysWor; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I170aPyr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HmIysWor";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I170aPyr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nNQ33663357
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fLdjzruDw33IEE2LVJqPDaj0inmZKXe26+hwkIPMElU=; b=HmIysWor2MGASLbG
	c2oaY8NfbrwHJkNV2199yK6aFDdal/2plxRdPRoqforUZA6Cmww5qn3OEn+kbtiA
	DkQzdt8lUtEnxxRk/N+FrVvByKq83MZ5oH1EjLjQWuTmWJjgZvO8PYOtVxIHduX7
	q6oRllAfYmYWa+/uxnaA+U9NbtU1rshQtylU20w7f4oDBJv+GIUTdAL91eaOh+vr
	NjhZzhxCM7z0nVqWJD6wrOykOcfWPUXw3zlK6MWWFbFDlWY07lJcO7k19DjQB6//
	3HLWb9ZE/ptxaxQdUx5ghWkp/6k0y6ccaSYnygu/Aq0HSYxyDuxxTVyMCMmBCEg8
	51F5cw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg0g6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:54:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so1314792a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789379676; x=1789984476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fLdjzruDw33IEE2LVJqPDaj0inmZKXe26+hwkIPMElU=;
        b=I170aPyrA/NZRf1hYWeK3VPSo1+oYun9fSYB8C/GeDnIfmMwUWYftL4Hyn6DlSbhFr
         HRKq+h1wyiFuwz0xx0M9g+8Rpp2U9LYUDUZDdvydDCJb8SPzLQ5R0gMCR8u4bBKv+IYh
         7pkvyVnSehGvvJ709QjS9SrY8x/9kaefa7Jkaqzo+a30pAHfYRiHNGknQ8KavuVj0KOu
         7P+sd8LImc+vWcPgpyAyGL1gjchowv3sKqPccRQkEEADDNVnxWxH7Lz9bry2L479/C/L
         hWb2a5esccZz+1SMSHujmXpxKqAGvdoCzUP+GIS5K5ua16XJ8nPtxScarb6E9gbNmdxT
         W4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379676; x=1789984476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fLdjzruDw33IEE2LVJqPDaj0inmZKXe26+hwkIPMElU=;
        b=V5fp8b3JZDR+LvLtG5nPYRgYZ3LOxs1qCWLqwHGU/3GrzvsN4Bk6D3fb8jvNFRJXrs
         SZf/tEkzcJyx1ACHoc/4Ma+CBZTj4ANQGnQgjhyipLX29Qd2tJMNx1CEKSkFBU5kdxKp
         jwM/lCYoTw467fBnDXgImQcaAtNEsBLH800dD6i5+Oev7pa4BqkJomDtlQ6FxmqjrvGt
         hWXn+lQm2xmcbdWizvmN9mnzErS6vkV82I/nrxZQvIujJoJEHCUmV2unKKkMfxZiHpbF
         LXCgoWXyF+mJk9B3BSpRzXxn+8wn7RtXn5TuTDdD6k1BvSqijBUWQgDvVWNzpVIrDWEm
         nvPQ==
X-Forwarded-Encrypted: i=1; AKwUvBydqBi3YMUCJWPoCsW/JtXv8tRrJi0CfzY9NCE2MJV8TZ9oYNwqaeVDLwE5SxQcbJ26d+otB7TheLDHgIs=@vger.kernel.org
X-Gm-Message-State: AFuF++keo8ZAFxGHZd1FUl5sDDpUfxAFjzCvz1LGSllnJBN4alzETMrP
	PMnDORp6oD5l2EZpdfCLWWSNZoCgbjhCg0EhuwPz7JN1ODFE4WLYj74/k1uATbp//GHZANpwE9k
	LPjFbD3FMH8hZ1GtsPscxguvRerAf9boe1mdgwzJFwLc8BNFuToyexh7gbwkFuR9vbrk=
X-Gm-Gg: AYBFou1YLutcPyjgjRscRXIM+lXmDmqCE8mmd6BFSnXgehxkfhdbV1/0dtYtsOzJGVT
	aiAo4Lxgyps67CO5OBOGxqSr24X1rXHNodni1+OdFYzqNB0veygqHdBUxZdkTTcYoE8/4tChRrT
	qjBsjCmosd3FXUQc2DjP3COxWwkTijFTDkNgIMsuGQAp5Zw/a1DFp0oYSFNIIB6tVBpY4k7oD9c
	rlHNk0zqH4cCPfCJecKLfRcg/nNE5uIwS7nsI3J18IVV5fef/0j3kX04v3a+6V5kA1FCq8z8kBp
	SGPVJQDug9PEdkfXqBdleRa333kzEwvLXpE8LrvMlRxs6UYqOX1rJzn6rhOGMGzKRmNzftZF9lq
	gDPWJf5h2nP5gPAhvQbomJ1EFRvueqpGPwqKjR33GzH/l/Xct9vGgjah1Zm5A5oolAGEG5yGxlB
	0=
X-Received: by 2002:a17:90b:4a47:b0:39d:eda4:43f2 with SMTP id 98e67ed59e1d1-39deda4487amr3431378a91.7.1789379676228;
        Mon, 14 Sep 2026 02:54:36 -0700 (PDT)
X-Received: by 2002:a17:90b:4a47:b0:39d:eda4:43f2 with SMTP id 98e67ed59e1d1-39deda4487amr3431335a91.7.1789379675814;
        Mon, 14 Sep 2026 02:54:35 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm20664313a91.1.2026.09.14.02.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:54:35 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:54:23 +0800
Subject: [PATCH 1/4] dt-bindings: media: qcom,sm8550-iris: Document Eliza
 IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-add_iris_for_eliza-v1-1-e8ccd9b8cf7a@oss.qualcomm.com>
References: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
In-Reply-To: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789379665; l=1385;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=EwOnmHR2YqzdNUjVjA9ZU3DKaWkxGqevotYj/IaX2y0=;
 b=KNjWu2jJPn/5Opj1cC0Y0s0YaKB9tFcTwfNBbitknROo3Gq/8tT8oZ8eyl1ahAlSe+Ieh9/mW
 mjnFv5d4eDiCKnGRvu6am9lBOFq5LPwapeXBumQQEJ1NdpVchIeaRzn
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7c45c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Sm_iIEVIus1u_0tAx5AA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: wKSR5NuqHxWrI7xZ97YV02_vgW6wMEje
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0MCBTYWx0ZWRfX8b7vjOi9LsnM
 l0FNEBjfcBGprsfDiR/Ef3d9tREQe6aL6pGMW+X5s7EptcW8IFWnlhkVmwZly3faV3SytapUfMN
 /21SE+B297ystaJawhMhNjm9qWA+lRA=
X-Proofpoint-GUID: wKSR5NuqHxWrI7xZ97YV02_vgW6wMEje
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0MCBTYWx0ZWRfX0lritswE79Qo
 j//r1MENdL/VCMxvxzpZ0s+uOIDZCbyen9PDdHJ24n1ukHS7tMROpYqwpeomzbQ4jNOrMR8diId
 Ji0w3HJbri+ONOxDt5WZ2cTJv0UnMER93de/axj/nLXRtcF7174kk43TMajXNq+22iz073zE7DR
 EpCpL2i3XVuVFAaBKAvdI+TX7bvF+MHa4tLWRJizn3S3eRuF2PwvFZCTT8JcibSQZE+83SHCJGi
 L17559w8xIwWwjgQWisEywmGcgFAJmFoH5/fexWm5FbGc5oDic3Xj/9u5LyTo76twpvmPN5AmF+
 ghuzGleF/PseNKyg2GbgnOPOZQFIsIAM7awWJoKc4oTBUcVNLk2yg32MxmhOKoPPpsaBHgG/8pK
 4851vO2ZR+5RkQFLxZRSi1oEMi828W6bO9cJ1vFWjLvg87O2ADFQXBLcCNeesA559fhR0vEFZbb
 Gxap+j9ra4gXxtWgNhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140140

Add the qcom,eliza-iris compatible for the IRIS video decoder/encoder
accelerator found on the Eliza platform.

Eliza belongs to the same IRIS v3 family as SM8550 and SM8650, and uses
VPU3.3 with an SM8650-compatible clock and reset configuration. Like
SM8650, it requires the bus, xo, and core resets, so include it in the
existing allOf constraint that enforces resets minItems: 3.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 6ee9d23554cffb30c92017ef99de15c2493455ac..b97f50bf16f6634bef0e0dc598f9268a654c75d5 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,x1e80100-iris
           - const: qcom,sm8550-iris
       - enum:
+          - qcom,eliza-iris
           - qcom,qcs8300-iris
           - qcom,sm8550-iris
           - qcom,sm8650-iris
@@ -106,6 +107,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,eliza-iris
             - qcom,sm8650-iris
     then:
       properties:

-- 
2.43.0

