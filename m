Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF86374178
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791785911; cv=none; b=RbtJJaA8qHqZhndhm2hr//I0DwEACf+IbKgM23YJokDkl7DdeGoMLUVYjsmMyI4PSdM5gJSDpNrjySdHW9r9Siy+NMqhcPjujfZLzY1Ymr+1NxonsN79v0PkBSGoA+TM+fh9YDcAVxrC+8SmvPu1vSlyWonLHZ4Bj8KsVGuunQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791785911; c=relaxed/simple;
	bh=WXqvJM+D8J9+hqIXx80EQDblZxafQ7vdENgEXKGGLZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FM+9VWZ7nWSaZeHaa+WWrmjRZnJVlJ+3BaTdzm36ivhT+Ed0PBx30lP9Vf3SAr+mI8ZcJiXf2GezlWZkUquxv8av6X5hpMMAPRHgkXpjWBuxwk+TNMqXcVyb7/b+Ruim3VZRpcS7X4iU2CBDAA+ymRw8ERhOEsUAsrd65s1YAjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UqTmWAiR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kDMdRJC6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqTmWAiR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kDMdRJC6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55cYE2436472
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	48nDiI03hrqB8u7ZOj3j4kE+m9ZExo0E95r8MhUaGIY=; b=UqTmWAiRWJoeQsRJ
	tmHcgl4q20mPydX+sXIT8RxNsCeyS4YqtKIMyVcBxMo1JorYLfreyHykSnSC5vE+
	KkHPsazU0seymLzC5KivBI3hlTe7KynpOxmoV2sgdedGh8sAnIvMBB5tnoZ9h3y5
	IO9jAnQpsFNObzTWE1Ou/kyQ+RcGBl04ZWh1lShBI7/7Gg8cE7ciaisw9hrjTdFu
	Ms3/9uH9/rGlHBchWvqln9qXnmTQ01TfA2BKzAhro2yBkCkrhbFF0WPCMxi2ropM
	KKM6NQa/jADcLKq9BFhNxRnip4C/vL7ocm2BQVAQJkKfZ+uXi5VQ4sk6cwCIj1yW
	oqP4Tg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2fdbtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:18:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a8ae5154e7so1328672a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791785908; x=1792390708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48nDiI03hrqB8u7ZOj3j4kE+m9ZExo0E95r8MhUaGIY=;
        b=kDMdRJC6mqBGUP/FmY66eB24uMq/E+zyddHnRu2Z7WenZQeIcl9XtEntpWufjXznBp
         /qi31pqg0AbYPHEdsIU6UrWRVggNp7kFjaCmaJ+IUGcgMg8D4ng/UxY3zx5p0UFTTVhn
         bGh48b4Isonxw22pD6TyXAzuPhRsVrorPF8Lh7DKIhtssZNxrYuHpl8Jq55YTRm89SK1
         +Ci6ng9czkyJAFFD5dRpbLtLsDjyoB6j7xIUtrJ2UBDeWAA9kWWSqJPEuUqnsnLMtR6W
         JNPtTPM5L8ctflbxlLs49mDcCHCV6WNQZAG6+El/LFcdMqR83cG2BaRK9kSl7zxFbqqc
         NE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791785908; x=1792390708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48nDiI03hrqB8u7ZOj3j4kE+m9ZExo0E95r8MhUaGIY=;
        b=r5DXyiUXV7U+ENrlFqSiogU6oPqRvflWp0iXDu1AzpGBBs6rYM5HcDrQ2sKNNItocM
         MOHfdnRz/NyMVSQgvwbQv0QV9VTAwUu5KBq/EJYUhCa89Sw+in7bY9jbIksn5nKx3ipa
         fQDhzy8247tmSLiDK0a3zDuzUTqZj9JVB3KehbLNmP99bYQ3JZ3VvfugMuaVPUKEG3DO
         m0oxMctFnKWnNV2nlIy6KvodeNeJMeYHLqASIz5puJOt9R62RTND5ztbQdAa1gs/lcPe
         gal8gLdUYgio28ArWo6Pmgs0Gg5zzXZBUgxS1+bcCuTokr3Ot/BBPnYeb6lyEEere64R
         PPTA==
X-Forwarded-Encrypted: i=1; AKwUvByW3HNU8r8eS4AoREUWJOTgI5Pf3wPmSdvE6qKbMtWdaHOvP80dJLzupV5JIcMQQYiAEVivKQnwL6NS+WQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlOVQ/+eDcBfYeg9ZAMCXA+ASTg+c0KEQt971H+wh3WbTSJyAj
	F7FZvaNLSsg3tF3LjSR5vyqTea0UpkLwXSPcRUC1m2Yh3z9GubuIjpeq/C4SXqDmcmqi4qxB+XJ
	4AtXWC5bvzLOlU2ypqGTwGS6uXIuaCdahqo4Z281ZymuF1OZAy4qYXwph3dltghFqRac=
X-Gm-Gg: AYBFou11P8imQYT0/eW6VUUfOVaJf0IF5M03Ong/qgNAWdvKcXnzOWEdUJzpRjMVKoV
	P2yoQYKIkeHbSYD1kkOH8XKve72lrcT/rs+sEHrVWj8T0OA16+XmHF2q5KH0LXp0hVePz9ZDepU
	ogR5KY3CNV+JmaGAo1ImHWdjLL0Hf0BjyIkrKJdhoEMLSv2RoJ8N4CoS6jNM5uMOmqhncbzZq3r
	q+LJLn5aKMqPLpx3/xKC8wzoYWlPTmc8eWug1zUfTh6YEshmLM2DhWx7gCxG6vrytQQu1F6ILR0
	9xP4TumvazZaGyyn7mfvdyHpdtKO98RLUcdKZ05aoFplWKIQlcIK6IZn56ebD+J5oWj2lD17uth
	qmjXLfvlegtbf8G1NKrm1
X-Received: by 2002:a17:90b:3b84:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3ab3a364f8bmr6096587a91.4.1791785907755;
        Sun, 11 Oct 2026 23:18:27 -0700 (PDT)
X-Received: by 2002:a17:90b:3b84:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3ab3a364f8bmr6096571a91.4.1791785907278;
        Sun, 11 Oct 2026 23:18:27 -0700 (PDT)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e07329sm3770481a12.5.2026.10.11.23.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:18:26 -0700 (PDT)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 11:46:26 +0530
Subject: [PATCH v2 1/4] dt-bindings: arm: qcom: Add Talos Lyra EVK board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-talos-lyra-evk-v2-v2-1-dcc9316ebb59@oss.qualcomm.com>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
In-Reply-To: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfX7VmHxoltZcxX
 w4Y0zdAjVvUsX3+t0Zbx2D3wt+xUWd/6S9qPuAubNqDtq2hLBuaP2wSbqV1cjRBXhL7mnn/RVPT
 kBcZPuYRqvu7AEt9QvWmalnFTN4bb64=
X-Proofpoint-GUID: lRs83NqXTOB90_DFYoEq_83570mEClMr
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6acc7bb4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=9mM5XA2LrqDQA0higt0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfXzaTHyKuEuDXK
 5OBCjKL6Wzzc9w7hRs8Ant3mYdCtHn3LpOywlgJUFehZa9jcaR3PrS1BHIfcQAdFPiIYbdr4vd/
 IjiDTEG5J4OLMvStsHOEp7Wu3waZacUsSEAyXMp9lZSVMnuuojWFUZtAgdON+ZFy+HoG0na4zkm
 i1Crlk4/FdAsds3BW+9/gOLyZNz36vXMac+dA7rOmay7mOoqr+v1WVmQzHvHFnDv/NQpFUoK931
 bIHdbYriYl2Vn5wETsjC2Vv3R3/Uq8ECxobnBXvoY0AB9LlUFUw+0X/lWQnuxqTihiKOGZfyU/0
 WF4hrwUqEa/h3EDiSFAOZJEEn3H+tM8BzzDFIwwpTDbVe+vpEQ+YWAlKf+eXuWAw/nWdWYDcfEg
 7afzYqtPXZcBCg3MbnUtYyoeF9HtlffeoXvuquMLu/TqN5+/hlOubZ/3olRHQJg+yFZqTA9ennG
 tVTWNu5xTSugJLjRV1Q==
X-Proofpoint-ORIG-GUID: lRs83NqXTOB90_DFYoEq_83570mEClMr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120024

From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
board, which pairs the Talos Lyra EVK SoM with a common carrier board.

Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..d0e30d6c1d4c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1089,6 +1089,7 @@ properties:
           - enum:
               - qcom,qcs615-ride
               - qcom,talos-evk
+              - qcom,talos-lyra-evk
           - const: qcom,qcs615
           - const: qcom,sm6150
 

-- 
2.43.0

