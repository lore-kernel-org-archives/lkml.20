Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DFF534451
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951079; cv=none; b=kYjMXjPGkDgNOlwpZhMKVLNSiP1LGAOIujoBJO7/FItCXQPqSY4O954P/5csnCe3ycBUSaH6MgcwyLmdSIy/y9AzfFZFYoUo8EfgKZQbs0t+H54QXwNwIj6b4TdI4pHj0HV3X4YWDctUx72Ech6o0SOPZTcbTNDLNgsqnaOMcV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951079; c=relaxed/simple;
	bh=O9f6hfp0eJOnXdSOlQWDVVs/akRlJJL7XlXjA7mu5GY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qhV9/4OhQAq/mzlPu0ZDq5OALWw3O0xGGJ/DMxfI40/x8PlR49aYcWbvmJnZjrDTnGZGXbTdLcPQX6ceqoF0l5dRFNKbg1O8n1o6rpsF3z63YwvTBvWYgIZ788MKnosz3Dej1C0mO/tDUX0zSJHwgKcXKz7emPcvIfz1tLU1iNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MpPzIskl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DoRNpxJ8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MpPzIskl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DoRNpxJ8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689AS4Zk462929
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 10:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s3bU5CVGxsB
	pdkgDP4LaGaH4/EM25sITQmXcPZ7cZmg=; b=MpPzIskld4wNR1Cdu5P8xe6rK7W
	J+A8vcKQ2RUhqgdW0YzhYuPcpeKsy8VsesdWiUeeetwTZwfEfltTPdj0GTvDqnif
	8NlqUH4nGQOvltoxyu6UUb5/tHDzudTN+IIYJGSHm60mdfH+RWXctLK+mJ/sYOwl
	mdOkjDgIIqE+rJP3CPI1DXX+evHekV3V41hoToLF73HJebHNiXhAUMZOwv+dBtrH
	5FLDJBhsMoq6OYIQhRa1OPCNatBeuEzQHmKTOYDLmDD7MHLc/yyalO5IOTMZalnj
	im2OHKSnR1Vo8GuGv6KKHuBJk2BPEZDpPnVX0E7gsq5Ent0I7LFJXSg66hQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr1k0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:51:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d932ef41c4so1088075ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788951076; x=1789555876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s3bU5CVGxsBpdkgDP4LaGaH4/EM25sITQmXcPZ7cZmg=;
        b=DoRNpxJ8UYBfrTbAJdKIT6pcJVaXt4PE548Je3QT4itHQm8yOx/vUea2+NcRb7iHqI
         IffipotUAGAnIioIdXsMIBkRCmP8pwuoV/tmtsfGnlTUf7SOCoLfYsR/OBcxR9QjyONC
         l/vuEGZ7jJbtB8JX3YLSeIA3jqBt8u1E1t3G0X7qprVa97pM85090R1+QiP+9DwUs3+N
         4tOG01PKaVt0JNiha0eDpM+gF7z4LrCl/bYn5zm7Dgl9LFX4q6EmhKoDs2D/OzyVfLhh
         soucEeMRYkMKQQ6NgwxgGWML+4sbBLP8WP6aDm7NTm61CUFLw2p1EUKb4JpqXk+BspHX
         F6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951076; x=1789555876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s3bU5CVGxsBpdkgDP4LaGaH4/EM25sITQmXcPZ7cZmg=;
        b=ohN6Id6463ORH/GYqeXcwpGx38DOPEb5NpWz6anAE1bCdrRsOUOPXZx8NS6NksJStd
         ZWj38GWWGlQqbLVk4LylLmYe2BNgSYrRxVAhHb4E88Kwl0Yf521E2N6Fe/Eo10DOqupq
         MyoFxtTpdIah7sTsnNTHPY7hfh8JFHolRDrHPGXNfMiRs87YjGRUHwbY8tn3UszGNCUM
         e+PbcQTTr+/JbOXYi5vSBAQ8fAGKCm8FkLBrp9/ea3QbBPvijoTXlTO/zWXMifZeWJ9F
         u+JQRYKoPwFGsTECYewZ1nY1OM3FcJ9forf+CGOvGuvD9Pw57JyrQwHbCbMElBh9r9II
         O9Qw==
X-Forwarded-Encrypted: i=1; AKwUvBxI+XX/bmrmcDHJbUVA9IFcdfGV9PsGN7hFe5CfjvLneqnzxVmqzlKYxdGrGvVKLaceCNZJmmdtJ3UVglA=@vger.kernel.org
X-Gm-Message-State: AFuF++mJTFfA+09TAUXAeksBkVi44FuULFjulDmYHAj3AfNyOM1x2+r/
	StVRWmyX2sX8nxX8KlbYiL11bKhAopmLRuhM6BaUmZP4FckVOT9YS33BbDnK5BXX2hwmC5gq7Bv
	HcuouY9s2yGvtGpnLIzHRkfDj0OJX/09Jsf1LIOGSXRQ2JQIipZRlomKwdq7J/+szSnc=
X-Gm-Gg: AYBFou3iL2lxU73LL3CSwbB9wqCnfA2TWSXDEQEqXMDTIdfnNnQItiPrtyfbj8SpQo1
	w812UNHiq6y1HdUCBkhQlDX2spyTvxVUYyLX0yO8ZGWDAFT3P+uYRYZi/sAybBnc4I7kPSrUzk9
	suMPL7yr2d2OWUEyCH0ClqIXlN4rUhdAHHFGLbTzoxk/yZIK1fKq2eAXBltxay4tSP4lCjZaygL
	8yVgjB9YJclDy4NTUym1SibXTPkrlzDZbDLj1i8v86/mg8TLgNS1MUKA8HX0Urr6j0guozwSrke
	Wz393g7xZKkwfYqId4nSQB0WAtZqm2kNY6jkBWm/UXThLfFpTfgmJ6m0VyQQjgnl14QPnrW4zkp
	O8h+rVeZiEnEmVSv+SfE5asTwyYc=
X-Received: by 2002:a17:90b:538c:b0:398:9beb:a2b4 with SMTP id 98e67ed59e1d1-39b087992ddmr41223155a91.22.1788951075734;
        Wed, 09 Sep 2026 03:51:15 -0700 (PDT)
X-Received: by 2002:a17:90b:538c:b0:398:9beb:a2b4 with SMTP id 98e67ed59e1d1-39b087992ddmr41223096a91.22.1788951075144;
        Wed, 09 Sep 2026 03:51:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434bb7d71fsm12084678c88.15.2026.09.09.03.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:51:14 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas standalone
Date: Wed,  9 Sep 2026 16:20:48 +0530
Message-ID: <20260909105049.1317985-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
References: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa13a24 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=kGc2aUUJYeWwMdlnZD0A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyMCBTYWx0ZWRfXxMU9q9XHzXxx
 2nGbrmbJ7e4XKH9qkI2opDIkqHxjH2PYVcdo7T7xqmbdZIMFOpPr4bwa9Yu8+dTA4rBvSxGztd6
 jmcHWwKiwpIvOGhhEPg2If9n5AJSqNU+XMRCbKkQ2ZXdXphuvNkl8fSonX3HoXmlqMWopkOHfNv
 UjOqcXm/beRvCOczPRfNMUrJtQ4BPMs1FMC//SqWwgSIUDsEZ2mOwNkjikz2MAy08ZlnkLXbp5Z
 OQZOUn3wO1BM24onpg0f/I5O0bXiLKlGa/8FuuLAtEKSStLy1hLkeKpdx3goPbzX5vN7ITUDhdG
 0QqVt8wrRs4CQ1kxL/DSBR57dbZ+PaTi0GdmMt2h6pQXdbcAfpbntq+1h/O9ydeSkOi5ynaa1Vp
 rb+VuPQN4na+T0+8RVMB6ot8amTwKHr8WHBptOqM8YtNwAJB+DdU69hPxZODNGAyr7fOtmkBfvU
 qp3DEwaTDd4Cs9IIvtg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyMCBTYWx0ZWRfX3BqeOpJA1fLY
 8T4vKTAyPxkX2dzcJXZL9dXvEuYSbhCMy6M2lsUljUJh8PLOx4kLsgXYJzyduCGQ+iRKU6HS/Vo
 rUSBw4uQM1O051RfWSvnSulA/sdiuJQ=
X-Proofpoint-ORIG-GUID: MmWNdb6VYZBCxk7c0DuhX6-G-E_Pp7Wm
X-Proofpoint-GUID: MmWNdb6VYZBCxk7c0DuhX6-G-E_Pp7Wm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090120

qcom,hawi-cdsp-pas was initially grouped as a fallback to
qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
Bringup revealed that the NSP proxy power domain on Hawi requires a
specific RPMH performance level that the sm8550 driver data does not
provide, breaking the compatibility contract the fallback string implies.

Remove qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block,
add it to the standalone compatible enum, and extend the existing
cx/mxc/nsp power-domain constraint to cover it explicitly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index c58e8a6c7fe1..cf57095cd49d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - enum:
           - qcom,eliza-cdsp-pas
+          - qcom,hawi-cdsp-pas
           - qcom,sdx75-mpss-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
@@ -40,7 +41,6 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cdsp-pas
-              - qcom,hawi-cdsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,maili-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
@@ -273,6 +273,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-cdsp-pas
               - qcom,sm8550-cdsp-pas
               - qcom,sm8650-cdsp-pas
               - qcom,x1e80100-cdsp-pas
-- 
2.55.0

