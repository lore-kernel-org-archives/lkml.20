Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2BD3769F0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973539; cv=none; b=gg9xC8o2e5Sx8ZzEdf5B2ZxMmrKOQLosQqdXC2qGNY3wkZ9z/myyI35arKMeJ6DyBzNmhzGk3KaDYQpTuxAra1FGBBQgmXAwbLMTnRQrTVb4aa+8V0awZ0n2NJRJVIvdpSkatUor2126ZAxF3PG0tLyYDUYHQD1dku7ln8+wIJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973539; c=relaxed/simple;
	bh=fUNMC3JGXhbiq9Y6lFVg/e1xZgyALQ51mRBs5zUcqVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XHshj5+HMH18+W8ehN/hKRlBo82d52m6efD9IhmxyditGNauNIctbCD1o0heO61y67eOpyFaeHRs1sVr82s5N++vFZOO1y5AZv0p5UxY/AHBghY6eCCTGTliDr06NPD3YctxY65R79hN1PcW4Txm7kk3mRBMbla8NGqCuJ3N7/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mz2jlQLa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y8g3Iubp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mz2jlQLa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y8g3Iubp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Z1U8993273
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TY60H3UdmFbtKd/s2I1ukfh4of0UVPIOC5ssJn5IVMw=; b=Mz2jlQLa4MitRAzN
	o6M8FFA9Apdn7otmOjy1wkaqlS95thEvUQ59NLP7sSNqVNUiSV28gv86ZdstVogf
	7vMLDLsBOmIBYWqG2Y75Xl2zaFqNoMIIQN47Wp9J3nmVHMSY8GkTy+b6FrmR9krI
	Brdah4U8ibKssLiR1ns7yZUlAqOXGFwKrBO6g2mh7Ca//EBPpDmuxBpftEH6oJW3
	u2QIc6F8Mo3tNyTwmjHCmkUzh9osLjDkOgUP5IX+A6mZjebsGi9U6nSNBGpTX/3k
	M1q2xMB9bSaOFTIBi87QH59LqU3W4XI+1bQQOZdV248m1HZWCxBYzjPqeBU+x1fp
	mXDyMg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3v91n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:52:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1a439db36so2428331a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789973537; x=1790578337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TY60H3UdmFbtKd/s2I1ukfh4of0UVPIOC5ssJn5IVMw=;
        b=Y8g3Iubps4/xlr8vSEkhYQDgzWw35QkKVHu+hYVebPeTQblB9kume7uzThsUTc5Vnl
         Kky+fi0uREYM414iph2MdJiMJufHSExn8e9+4Wiw1YZwgqVt4yAoRupOUoX2OagE3bj5
         szJAHnG7+K59Ew5JDux+wdGPCStWO+CK3/QGiNn2/ZXavnxU+AEFmXDrtdxu9JN8VzbI
         K2jHcrInstCKGJuw+mpnbP5FqEGhMP6RrPc3YtscNhvorDYVvVSsQGjOqIWHlht1IH+a
         vxnOpurfpBkP98uJMB9+V0zklJsSe1zoZMCkPasVIy6MYkkh3rYr5FEZ04kN+A8suENo
         pzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973537; x=1790578337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TY60H3UdmFbtKd/s2I1ukfh4of0UVPIOC5ssJn5IVMw=;
        b=evtCJE0++vf/DoksgSz3AYeEWw8N2NoOBeYBj5ejgKvk6Iy7yCoRHduvKZRhFrJ02Q
         25HjTgnZm7UpNil3Jcy/m8D2ICa5hxftil0fr5XyM2Q9TjTe8jUKPC6TmXdDOiKYq8LT
         vUj8lF/SEPxu1ixNx5+HOlq6QbiOCx2W2hbaz9hn/gjllqC/ChI0BFMQMXFaRJpRRkTM
         7L46uAM5VLlm4VY+nnkxPI+1q9AFdVaD++cp/fCGT3Ptw1k+BFLnWvVlOfVr1f80BIlg
         gRqrg7Sjd5a1xW5/ylEC5raWR8v6hNmhNQtvF/jaV9gUecFpnWpjRONeb6RGrTVfujE6
         lyOw==
X-Forwarded-Encrypted: i=1; AKwUvBxQqHHdHBRv0a57wnCZ5Qz9lLKYH9895pnCdoBBCQ/VieM/GmLuPILl9YqwP6Anud4Ka/jATWdo8h0QG+o=@vger.kernel.org
X-Gm-Message-State: AFuF++nVV4+J+orgwuPg1T9qLpbPZdeQn8hgSphyGD7iX2ij9nsuq6zj
	oXwr/QqyYwW8m1SahO2fXTJHd1Pv2HR1HPxlVBe9nkwCdJaSw+nYfNZig4LFleJp0JTLZJEbGaf
	BkZiUZjQuzd10B1RtO6kw5I7sB8+G3vzrj3Ndac6v1caVb3J+Rz+HKBF9npOv1djKkOU=
X-Gm-Gg: AYBFou1eoqqkudPaCz0jlXUQjTCe10Y8vLHRtZIS9WIDvFZ6xtcCx8OkpiI7qhrY8vV
	PaEqvdAoOryLFYxoadpssfyPlIn95PfZGnxdFUQNmrGXMvufeTiJM1aZoFSCpX2LB9VULHv7H2m
	oXp+6/vo31j/DwpKShbMQo8zGpQLGG398gYYuRzWCXy4VRlZ61+L5gsOl5b0EF1WGNzIdMJwn+k
	TCSDm5nWgS2AsckP97MOGW6KolZ6Sv7AapdgvM6fmcXBIZHzbbc0+x+z64o5WPsQpMVuDC+PnVG
	N5f+LMEaneT+o+8CXqjoJCl5vHoiSGVK7PnP1VZQ9FOd9mOWRKOrxWQBy6NoQUAb4hqXX5uVN1M
	9JNt07nXz0moZc2XLnyjyaIcXmR3rmhzROX3bH24uZ+wPq9plz2GUcaK9Dq0vj+zIWa83jqn8vy
	/5ZmYaAUW50oNP2QAuabSIZh03keSNEIl01w==
X-Received: by 2002:a05:6a20:4307:b0:3d1:39e9:b267 with SMTP id adf61e73a8af0-3dd8c3fadabmr16962965637.3.1789973536995;
        Sun, 20 Sep 2026 23:52:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:4307:b0:3d1:39e9:b267 with SMTP id adf61e73a8af0-3dd8c3fadabmr16962948637.3.1789973536618;
        Sun, 20 Sep 2026 23:52:16 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm31342975c88.15.2026.09.20.23.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:52:16 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 12:21:52 +0530
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: add few more SOC IDs for
 IPQ5210 family
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq52xx_new_ids-v1-1-63d68a11bbff@oss.qualcomm.com>
References: <20260921-ipq52xx_new_ids-v1-0-63d68a11bbff@oss.qualcomm.com>
In-Reply-To: <20260921-ipq52xx_new_ids-v1-0-63d68a11bbff@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab0d421 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Ieg599Pkg-FuY5gSfokA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: wyWBSqnLCzmj5p1-60fFkpYR7ohxX45s
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA5NyBTYWx0ZWRfX//6qYar4nasd
 TJUbXOilYD3//uUokgU+0kYYywyWaGSLcDGST4pBfT51dEJuynIO5Rqc7j2dt+QSHSs6ctfItR5
 0Ipd2xctVgXHKEdwapNWRdlCtKGhDQE=
X-Proofpoint-GUID: wyWBSqnLCzmj5p1-60fFkpYR7ohxX45s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA5NyBTYWx0ZWRfX2WDmJIVn6OHF
 Gyhk020N/DODR9A4U8DDuT8F9KjC0Qe+30l074Qi44tJ96468BH+p7863uGB3D+9yXJFI0LxcFO
 xGLG50E8UUpJTkRxMnk72rFjpox4izb4ulTgHwH2ayBLj2yGNaFlaHF3eCcO261q0Sk+ohz5tWD
 V+D7FBe1Di33emOlpOLi+9c7LVbGh/mglCRZ1AdJ/MEz/gF8wTZqPgY8VRYx1DdRM6bfvFg2KOh
 Pr5HcR+syBKk/Fpt3gTONvCdJKegoUdJYuCyejhI0sy6w3HWzGJBxj53Kc3foO1zcwEVNCodKB8
 nhsly6wlvF56K94PBL8JBeomLFsnzxByRzFVILv6p8MHMg/wDa4Rik2P+UQ3I33ItICepjoOhTu
 OLMcJwWeJz2tir698vwtJt3Ub1RH9xop8zwKPiv3AkP8ZxLSG8mjy8MorrsnDaQ3RtJ/Uwi7EmZ
 r/G1SMxBCtkDtjyX7Lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210097

QCF3211 and IPQ5211 are the new SoCs based on the IPQ5210 family. Add
the SoC IDs for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index b63e4a0b8e54..f251d4c75612 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -317,6 +317,8 @@
 #define QCOM_ID_IPQ9630			779
 #define QCOM_ID_IPQ9640			780
 #define QCOM_ID_IPQ9670			781
+#define QCOM_ID_QCF3211			801
+#define QCOM_ID_IPQ5211			802
 
 /*
  * The board type and revision information, used by Qualcomm bootloaders and

-- 
2.34.1

