Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD2C42C50F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235197; cv=none; b=VEq11WRYleTpXCoAEmsX5mlFsrEW+Y064jwSfvLk9L306iqqYtjlNvO1dtsGWkANRSPivwI2hq3LjVebJj0U//KO4xzYTXgn8mNsiAjPoUR7iYHZdQUzJ6JfS+Xk0juNVL4tX1IkHJBR8wGWFnNVuoM/BKT4LL9/tTLvZx6rSFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235197; c=relaxed/simple;
	bh=GzcigBc0rbTXCdNzeexiRkY6jv0CY0+K5WGUqikGLwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OBnYrg63PsPmdshiE7Gk2//ycvQnPghH30DF1ivfiVd/2Ek2Dgp74hi++lWoIpXUI17w0yE+9HP/+EP2kHKcsPMKMRR/t8iSmssxWFbtdGaTzp05CEgJwHNt24nLhYFhcZkzDgP5jzsIB/mifAI1XVAsGz7lUQxs0kr0hVFpGUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S20WMevN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtUmkwpy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S20WMevN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtUmkwpy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eWBj1741986
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9vVNqesri0r
	EOoI8xD9HaZc6ZJPnV9h4oo44NefXgPM=; b=S20WMevNicUwksszgIY4oRrCTOV
	PHdAImwZxs7am4pOBGFf3IK5oPOD8jX+b2xfxQOJgYIJ3cPYtu0zUsSXcEiFStT0
	Jt8N/gIEtAOwNOPnvjrJ/bMxU710/ORYBf2wMqVgdeaY2FvveSOciB3pDheE2kWB
	94Kz+Fvkx4k2WNvDrHaZuTPJlbC0bYVjZvonCq+qo6rn+OdZNXZrTvJxx4U+nKh/
	wimPkCGqHmJ8rYxnY/mdi21Gut/iGrC1Tg2zdVdIhHXdNhl0TQyrmnzc/7trVqT1
	D49nuyfRYsh8PK/7YPAv/wzp8yK81u59FoQJtsImAlX4R31yg8wC9Bs/mJg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbkvhw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:33:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-32850005b6bso2290970eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235194; x=1790839994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9vVNqesri0rEOoI8xD9HaZc6ZJPnV9h4oo44NefXgPM=;
        b=YtUmkwpybR1MBdpgAJafuVEeS47yFZCA40QlMc2vSVzsKEFi8VD45JBTI7t4JMSM4S
         iVUfbBj/SOrN1jS1jVr1c8yMGWUZDVqKBcbC8xjlJ28AHq84N50GmxopDjXXx59HTamF
         UxjaXobmfWWszra1JkS4T+RgOss/lea53PdzzGV/hxAOre44l8QXN/LKxuFUrBMRkc//
         wCRSQmyomyLWU18LMh30NrnvjY7o3/iDpIaBEf0srzak97hziHhOI3FTpwgbszmNHPWm
         Ce05YtveSXEJer4TKmwlz86jmnTVVtuyDDqmrNKd4hoa9Hksug0qazj+0qWA+/9UPQjk
         JLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235194; x=1790839994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9vVNqesri0rEOoI8xD9HaZc6ZJPnV9h4oo44NefXgPM=;
        b=t8gQByycXSA3QgMiy4rnCPYNEbTe9YoyzGI+E0eRpZ/QCEXvXLTaDKZi9eX7nU3uEP
         MddejLPaERmA6A6zMgcEC8PW1fbSzBhruiiG6RKMz6iCU4ziTeaPviH7o+o7v294EFTO
         tVPJB8zJeLu4JqS4l+ziJyizkEyroJjfbOvldu2Iq+43UTMw+IcBTNb62Iki2OM/3b/Q
         wDj9j33n7XsrNgCWDaqXHxkO+50z8ITcrVss83QJ6h5KmteG/UzMp0N0iEQyNQ2boJmt
         QzJmZyQS+XyeJcMsuk7O822Za2m8i8tb4mpn0BiofZ46a/epdpND1kGzryP3W6ODZ7Pp
         b5KA==
X-Forwarded-Encrypted: i=1; AKwUvBwVtEZ6zUo7LSFS+eJY5QVvmAhMwB8nZFuaLWWhZDW/bwq8DapDTSFoVRovOY+x3mUSaFTBW8htTD8+n5g=@vger.kernel.org
X-Gm-Message-State: AFuF++mWhQXHKp0W6HMomNU21LLuxoWWsRD7huLvFB1FTeoibMqi/HcA
	ZSL6HlsYxUW1HcrBP4f9pMBabeDa+oo6CjZXWkjyLbrEqgZ2v7wc+AcJAfUNdzsKDVCIjwEyfTW
	dycQije1Hu8ye3jAiEHPsbrJIYZWw0pt9QMXE4eC64N6GKgw10cLOjdFt2O/7KygY8wY=
X-Gm-Gg: AYBFou3XZEk9DTJNVtO82wiKjZ+SEZp75OhV4kPCaUUz5Hkth37aOXy0OkXfnY7+u3Y
	/DVgM6E0LP02XIPmNxVvTX0ixB9GT1PiuogFSOpjpI04jh1aQ0Rp4OtHnxuEa5MauoQZCZzZQSh
	iaf55fXGiOfPFLMbyIqJhcFTb7BKfacuUALgdMnrhMvqNzhk0db+xqz9SmZsFkoul5AdzaUn/OU
	/gKiH6uCKiw1sXO698PGebmJLT0SDHi03dguTxdEUnSgUf0jeHSDRFbQvsafEWoJz4OAYks4J/l
	i56EZNu5OjgYd5CCmfTtgnEmW5lvuoCEsMgmjaKIcX9tefPyfSrcrj12DhppZMLSkpqsqQuhslT
	0tvDUxd2kolomNQHbLScTPot8CBVJmJOV0ANa1YcdSmPK5ZFOQt566LEng7c=
X-Received: by 2002:a05:693c:8802:20b0:340:7a8b:7286 with SMTP id 5a478bee46e88-3407a8b7623mr559850eec.25.1790235193863;
        Thu, 24 Sep 2026 00:33:13 -0700 (PDT)
X-Received: by 2002:a05:693c:8802:20b0:340:7a8b:7286 with SMTP id 5a478bee46e88-3407a8b7623mr559814eec.25.1790235193146;
        Thu, 24 Sep 2026 00:33:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fe502sm11052635eec.2.2026.09.24.00.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:33:12 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Pushpendra Singh <pussin@qti.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: interconnect: qcom-bwmon: add nord cpu-bwmon compatible
Date: Thu, 24 Sep 2026 15:32:21 +0800
Message-ID: <20260924073222.1000666-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924073222.1000666-1-shengchao.guo@oss.qualcomm.com>
References: <20260924073222.1000666-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfX0Av3cv6hpBFv
 wyFhdxW5c71fXjBtZ0yGBENUx499ZYpZdeajTqa28pb95lGBcDQ2ikEhXSkizSXJCwFFRhPu9lS
 JGPmwLBGKbhqht30hMVHmaI86IviWoM=
X-Proofpoint-GUID: Fo7WvYDz1YDU3xOycAsrF-h30qaF2ySD
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab4d23a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=0xkv8-iTUpmfRSWBdI0A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfXxsdJKfBKHR+p
 /h15PYx2Ytgn31IfMpn3d9J16CVMl4DdMum0R1mmCDnU8B9X/XADle5Y/AUcvfnp/2a4+4rFCHp
 ZRgb8jZE5BQJYF0zsmknoJO3d3wlawlh5f9QS0LJTxY6wmgLcFAjkKzvlf3ngnB2HOxmVZOhBqq
 Q2eMNg1o8XW2EZ63PUeaI7elKxEgIzKR1AQeBfHxrwSuwB3rkn5xj7zNE3/IGHCcdBHKE2ValFL
 KSf4O49fBpqLVkj0mO/sRa4/B2kNvz2pFQs2MqUq0kL3hdSWi13DucGkR13iArQLEon3P8a5wdX
 pm4xeEdVrSJkVHqvgcChItvvJKbAnKP702OiwD9tvUVNCdUJn6S8DJK9IyfFAFTQCsA9IJzJqyf
 dZlRzI48r9Gh8/KQ2Em7C45gWgaAhVKu+rbYn7JPqeFE55vS11XYk9x59W59YtBoa1Cg+uaUcW4
 Jb8DonNLW9ZO42V+hKw==
X-Proofpoint-ORIG-GUID: Fo7WvYDz1YDU3xOycAsrF-h30qaF2ySD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240031

From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>

Document the qcom,nord-cpu-bwmon fallback compatible used by the
CPU bandwidth monitors on Nord.

Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Georgi Djakov <djakov@kernel.org>
---
 .../devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index f6969910bded..3db61c38e2e7 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -30,6 +30,7 @@ properties:
               - qcom,hawi-cpu-bwmon
               - qcom,kaanapali-cpu-bwmon
               - qcom,maili-cpu-bwmon
+              - qcom,nord-cpu-bwmon
               - qcom,qcm2290-cpu-bwmon
               - qcom,qcs615-cpu-bwmon
               - qcom,qcs8300-cpu-bwmon
-- 
2.43.0

