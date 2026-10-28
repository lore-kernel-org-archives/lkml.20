Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173873;
	b=p67+3hKQDc7VFE/6IzkjzFbFiaDbvfac1ux1fH4Ga8Q/sN/jLxEAInft5S+/xSExgrA9
	 bogjEbsTMYKp6lJHxocrNp69r8JS1ImydQhH6n/y+6Fv2tb5tydT6GsHm9+ReJkvQLY8t
	 aY5wopisy7nwYUnNQ5+rs9KnxMicw1RdmgHkA2M6Gz3M5oMSTYiUBpIr8BrGJhkBu0dyw
	 U1Z6XJYSEeiJ/XvxAcsjaMXlLXgjutAC78LLYXYZ4Xv0+fIemX7gnsKh2YD1BAr2yNhKT
	 ULY1GrFN/CPcI4aMYJNUm07LVdih4ADHm5zCCjA7aeByPcSH/bxwCeljMRzqN/IRCXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173873;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k6VnyTbD/yiL2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=;
	b=0mOwJ//9LksejAaHnB0C35ZeKnKRos1pS3kR2yXXyjfdxB/7xtJRA6YMzkP5v14IQGl8
	 M834ALx+uUYKV70P9yb/weWJ6YP5Trffu90NhExVEzLFNYtWxp3/h9Eiei8RW+aeY7Dfw
	 Z4gN/hxoKbu0OjFRaF7rdOFM1uMym8saV/y4OPhqo4nUFBBGvd2nFO3greE5sGsZ6GE63
	 zguql2u6H6XM71GHCnScNMJmbFjGdpoamVyCX17CbrbOJbhgHIeMBNqb2HTNyW2Ma36Ok
	 n2/d2uhDGyprA3LDnJTAczjhaVLZaW4bOg21B9gHvEOqQGgjC35xtzjoRdB1mDfZAhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cX6ynhjc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RHdPAH4o;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965E3606A336
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 965E3606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cX6ynhjc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RHdPAH4o
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PQkx3381206
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k6VnyTbD/yi
	L2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=; b=cX6ynhjcWQLegGYqt2PlZxHrH/4
	33tLiKzsu5NI8l8hWf91JIPbMcZbate71X7kW417JsYBdbA1Dwt3d/n85n0HtBk7
	4DWUQ/SO7NBB9Li2zhALLDnTNWdbWoM4h1ybbaAFyoI+HssDW0CpVFpNFezxlpR5
	2lYyEF9GGAkfgoz49Pv9r6F6dZGwIcdJ5OSmhWJLRnsJXYsAVesh4MpI6I/c7L1Y
	uK7Rp1EXVu6Y3/rG6Wn9s3Gp8/AKE6pPkOpidebH+1huYVwHf3pgQLdf5x/osEv1
	WjYEXP4JBJPqOPzqhKoqaBMwGywFdCtXp/8zrG06V9li4MrJOqwhCejcysQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f91cmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:51:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-359b81ad4e8so946395eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793173871; x=1793778671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6VnyTbD/yiL2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=;
        b=RHdPAH4o+u3F2kiNstRsJulip4pqsDC/1bx00kRPSPnj71+n8uBVG9s/QQApn+g2Rw
         Un9odswaPGiRl5+GE4OD1ElZBZMsTAi9TNOy1K4HMbsS/HIGkVTvsZqeiCktKi/4rPVY
         X+b8ZW3iG8cn4EG4pHGTsgz4JHpjQcywkj+E20ntVH0it9x3r25N2GtRNA1Th+AHWR7X
         LGqi6FQXzrW1WNAMzhMYm7nCJnOFJTDNpwCVrAdv6PuQWgvGkRvoQhSJAvVP/pHzeo2x
         6TtEI8ORX7BdLJLWLpXT4Uj7wIR5Ic+nqht9Jauy4h0XXwihB+FsADs13PsEQE+qaTwm
         KAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173871; x=1793778671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k6VnyTbD/yiL2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=;
        b=jaJa1NHn963NjT2QuJpPf1TMeTKVdLSCud0Px/1IVZoFHbHu8/wZjtGhcXsXvTqjJ7
         VYC3oF7oCUpsYM7bqLE8TVs51zLyTeQilZTanvUW+FyI+E+8JtMT2Dfj583or0XIcZ8j
         KmPH+DlT+cLHzMoTmv96+yqeyKX7FNwDFG7kstybxuxQYb9tItaCKLU3cVPAeVh1bSC8
         SZMrJluBuq3M+9fj1QEtZscLc1OTPkIyQqiECsT2U9/5Sruk/UylbPEReVFOTvjVSDmN
         N2oKskILqouQTj/KykfqGG3LTdogF7oWnNdm4U4eMdQxZDnceYSuwhLaV9QPwr3dIDrh
         W5lw==
X-Forwarded-Encrypted: i=1; AKwUvBya5xBN6Hib5YiKwJytGqagd9Q7cilCxJZK66VHjtyIo8tClaWY6sf+SaCsKAI/OcJyusQ8CTqc8A/re5M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZsa1CdN0MGVJjmf7SJ6fbdYoorC8YUW3/rTDFTF5lDYlzbilq
	Si+tDBV93dH5sBU8hgzpOr1dSZcF8VlPsvXbw+70x53HTpCYbsyj/XyE7Ln4CKB3sZgiL5mO8MF
	upFHSBgVA7Ys1Zll4UdyYGboSeGELkcXM3aUIGa4gGcuOUqS9lLT6AWTJ0ynlkS85Bfg=
X-Gm-Gg: AYBFou2vctHMvNM4v+5kTMSxBeuzLsCcqmnxDRHIvUe60e7PpRRPGvjmUzoUEcAcNfF
	WiLKYbARti9F1oSBf1Ei+Ke8aKkUCvqToQy/nvtxLNqLNeBHcugrSbBJ/aUaKLlbFajwbAvN8hm
	cFAzky7HqVNUqPU/rGEew7uKCn0a8rou5C38vbvjryfp6fnIfQe92HYFXwJwq/EJrGgQ8Ph2drq
	jBWoeHPnQ2AoLS5hwtL5+Ch21cFdQIHtKWFoO1p71qMN8QHOqWfB9ZSobM0uBFSUJVHz+hlBj1S
	oD9QVDil6Un8m+geVpP2/oYI8ADnhsxw0CElRaa8ZtX5AJZbxfyaZ0TJReH0nu7zbKoom8KXr/H
	40nEDBp8AzZfmnYfZ2adzWMBs55htmR1ydeAJcXg87/DoM9Bvq5xpnqqTQ4OPWoKXnxl7EkZdIC
	Klht8OBuELw4jAg83zgjKhR/gbzMpe3ngX
X-Received: by 2002:a05:693c:808e:b0:36a:1434:c691 with SMTP id 5a478bee46e88-36a20054610mr2695938eec.14.1793173871087;
        Wed, 28 Oct 2026 00:51:11 -0700 (PDT)
X-Received: by 2002:a05:693c:808e:b0:36a:1434:c691 with SMTP id 5a478bee46e88-36a20054610mr2695900eec.14.1793173870461;
        Wed, 28 Oct 2026 00:51:10 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75c814917sm3430261c88.5.2026.10.28.00.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:51:10 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 1/2] dt-bindings: arm: qcom,coresight-ctcu: add Nord
Date: Wed, 28 Oct 2026 15:49:33 +0800
Message-ID: <20261028075044.431228-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028075044.431228-1-shengchao.guo@oss.qualcomm.com>
References: <20261028075044.431228-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae1a96f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Pbp3yVwj6iIoPtAh08QA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMSBTYWx0ZWRfX0kkVgz8wcUbt
 tfNpJh6bY2B5yNr2iM/UPIAIrDol9fZ5JPkCnXROOSFeiMrL3xebOTgVC0gYPxDBo9fltr+FhB6
 66K//vbYCF9Bx7K559CN822f2CNBMpA=
X-Proofpoint-GUID: s2EvNdlQrZNLBo_G3g9myiuFMPxMib4Y
X-Proofpoint-ORIG-GUID: s2EvNdlQrZNLBo_G3g9myiuFMPxMib4Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMSBTYWx0ZWRfXwv+q3GX7GbHL
 l6JmcMEIPHdsVa5AJVxGIe2wY+eBEX+49jcSELprbB+CKKTJDVFbohWjchpsg8VBd2nMFOrPnFg
 RcpOKHdhesg2CiccgI3Iew5syw+DmsLN9gk2n9eov0lvFCu7Si7rURUSaLMZCJdq3ia/81zNQI3
 MA+kHtLqR6w5VqhTQyQC8xjmY/bY63FWrC/O8iuVWM9j/vwZBh/hbSMcj/OeFMa+NjGUtMfskxa
 zeki9XefiIvHputNA46sqn7xyGwdjco61WwamKRu14uUwV81Lbf6k2xovP+0Us7kj1QJuk2O9NB
 i38l0jnMPP3XImRvZBVGGZbDXbtN6SDmKABxPqNglEtD+GC2pk3NnSEzw7rp6Vbpl+tY0dwNQBD
 ur+++YwNtgvLTp+V6/WTRB/hKe7f1jIFTwc267zii/C4ghHaLPgW6KSfMbhgLWXl1M5bwczXghC
 srJ1OunYJMGsBaFJ6rQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280031

From: Jie Gan <jie.gan@oss.qualcomm.com>

The CTCU device for nord shares the same configurations as SA8775p. Add
a fallback to enable the CTCU for nord to utilize the compatible of the
SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..1d5bf79f4984 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -31,6 +31,7 @@ properties:
           - enum:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
+              - qcom,nord-ctcu
               - qcom,qcs8300-ctcu
               - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
-- 
2.43.0

