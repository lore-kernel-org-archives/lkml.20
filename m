Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE2A2D5436
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789793198; cv=none; b=uncp9bvX73O0BhXn0zSuDgPh4EJJYz16AzC3Deb0BO0JB1vBdSAdJM+viRmgsKaHToBlvIFGQgD6RIbMX//HQYZe2p2tYcK2ig2/pUkQJ9FiD4B5jF5JtYjqHVRaS3F5QmbPwqO8P9g7GWe3FKpRdKFsx5p1pwNVrETAg+SHWYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789793198; c=relaxed/simple;
	bh=BQQxLILovActXhqPE1A/OvEVONecyV1ncI8gnzZasIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z4QodonbBnbYCIfcBKlp7cG+n6meM/TWzkKmeq5MJEySLC4hoQJ6x9CoEeg5bG5ClsvaPf+UNvAEgQEIdf+KgHEI6+iAw4+hGbagfP9kxbxVAxzx8cqvKy9Tq6hZaxN7ixWADvK4BulnEtcQE8bHXPb1LrV7bGSppctOlSxTntc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dpCVwG72; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GJjqEH2D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dpCVwG72";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GJjqEH2D"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68J3LXBc2564710
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MorW452OLeeM2Gss02wx04L33zU1WHVlvchDvMEsTPw=; b=dpCVwG72DifJiz6t
	pJBm2vI6GCoW0Uk1DwN4mC3HP3Ko92YhvD2hKFyzJbYe8fuwqy0mRvdHlqm9nRCq
	QIoZoeNj+PggEdFn5m1r/D9coK07WJHTHY6oPG1L76lGLHVoTeSOmNAjqeZZBg+Q
	lea3Ua2einxR+VifdE28a8GOUoGHgcd8/qMN2XQiWzu8RLzKDI4VfYG+7g3VuK9P
	sCvJYxn/VZMhkJYGCaTV7trMKdc/QDmtRtHnLJYxFliZ5YM52kdl4Vs32gDmRHkG
	ZnzuYLSileGawQlEGgyW24Bd1de4SXygMWswQ+CawEg1S3yfT7p4kt2Jf9qgDgCw
	SL8Jzw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsfrnrgdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:46:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so2774483a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 21:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789793195; x=1790397995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MorW452OLeeM2Gss02wx04L33zU1WHVlvchDvMEsTPw=;
        b=GJjqEH2DvGBlg4topHPKzfg2b4Tar7N7Cl9AzQkVr2tUI8mxpI5TQrWnEGJ5i1fp9K
         EmUKKCILu81iFXRI+uZpGtwN3M9vwzPOjoYxRnzAsRfqzIKNQMz6Xfq12pBMe9bEbAMz
         hgxJ6DOxBVnuum1kRVjNh3TUjRRjzZ3BqCv5sR7e/yXkwOBqLwYQsNU7MYYdVaTaPoR3
         aRy47tntxLF+ANWl1xgbDw6G4DP72pKhwy87ZutazqgVdNO4aPKtxFWVQRLD9qYmdQHv
         5k04FTvtyZHWOX5HlxAdzQj/HZ4EA9IFhegmulBcBUQhOIisglquiWE2w6WyCrPRB61m
         sO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789793195; x=1790397995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MorW452OLeeM2Gss02wx04L33zU1WHVlvchDvMEsTPw=;
        b=XKSP9Qe+4rSAdUuZE55ecnmEggtvyX5nlzXklRpiw+8PEO1b5TZkZczuP4UOLMjrhX
         HMppi1WIDJdLRbAlt6979fFYazOdWR+5zVtFLsZEjT3LXWN6eV0BGjoQf1PF+0uBfPxd
         FCKdeKn/XZ3NwOqmCkoEstDchpXcQRRMlD9DLmedbhzgjmHb/02S3/pIna4zVzE8nS0P
         6eDuYE6oIlbSIUoZRLJjVbEpTYc85ztyGa8apncjpZ3xFgYceXOTxMT9ZiZ2KL+BR4Nn
         Ps7bmOzhmJm7aV0OTN2sj6dS6ZiV30MiKs34ihapzufg9kyzuCsufpv3+Njh/ToQlUsc
         45/A==
X-Forwarded-Encrypted: i=1; AKwUvBzFo8Tw5niGzOc1Rfpnzq3S+PmCoxOkmiZNNwRcSP7og83WI0lLgay12Y4SJFZH6/LdfVdtGj4Vr6+eT0o=@vger.kernel.org
X-Gm-Message-State: AFuF++m8INyHkwlYRQgAOOcV23f0U3ivLIBmwNZHxrrnRChFT2NYmfPn
	XHylo9bNB/RYfo3yLcanIctXTvhiIxkURdHSJvi8L9f+1CpWlgOBI+tIKisi7EmusqQyriaaftX
	gW5x+rLxW3Sgd2iixxvkjZbzM20zLLPAvThQaDHKMYuj5tK8UAMMFMwM049s7HN3pnBNO+SjL1u
	0=
X-Gm-Gg: AYBFou0M059Nkx7qseBJxIRbt4rRGxdMBqfTYb84a5W+rESF1NY23x92FNdoWumGtt4
	Fxjj3T0wXkd8FJzeRNFJj0NNR82i/du4y2hpNTU00eT10jNIrCJ7tdyupeB7bIvssGWC+fA++P+
	9Ic8gFeOZPD74b7KipXFXKiREnqLHm9NjWWF6a0fuzUOHNhA0NtVzwAkWXc/msXpitEHwuIPIer
	HpoHP+SaSsUwwUfcWAN/6GLW64zBu9w6KHIWhkj8cXNCLNk10lzt9rf1W7L5W8vOGstfYuPBgft
	2pFxvRMuAtQPYTvEzgE5KZ5s2lngJP62TUPhXp6+Z9JmNUs58fS3GYn9c/1k5bJ/acItZc0xojC
	pruWZRUmKPYjLPjuRd8kb7olawMfVyoiF
X-Received: by 2002:a17:90b:3b8d:b0:39e:6c69:34d5 with SMTP id 98e67ed59e1d1-39e6c69362cmr2322968a91.57.1789793195389;
        Fri, 18 Sep 2026 21:46:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3b8d:b0:39e:6c69:34d5 with SMTP id 98e67ed59e1d1-39e6c69362cmr2322951a91.57.1789793194977;
        Fri, 18 Sep 2026 21:46:34 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55bfec0sm3839771c88.7.2026.09.18.21.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 21:46:34 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 19 Sep 2026 10:14:55 +0530
Subject: [PATCH 1/4] dt-bindings: media: qcom,nord-iris: Add nord video
 codec
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-nord-iris-v1-1-94428761ec06@oss.qualcomm.com>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
In-Reply-To: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
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
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789793184; l=1062;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=BQQxLILovActXhqPE1A/OvEVONecyV1ncI8gnzZasIE=;
 b=l9nC25NOZVwv4fkln5mf3yA3vziH1+ZkEkTeouwJcbmiXfDhhug4iKuQ8XkRsB2GN9fu9w4ab
 RbKI105ii6QClLBdLoM9fT7VX7qNao2OVrFazgOeNV+w/yUDgmpYe8j
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=W9mtxhWk c=1 sm=1 tr=0 ts=6aae13ac cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ba9tQSLWzef1rn2_u0MA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDA2NSBTYWx0ZWRfX0yv9q4p7p+6q
 KZuBI4upcbEvwhJVi/HGUs0cK1S2koWpx3jDDxvqQGDSv4qfPnDaaITY12ikqtEzynXT9RDjN7p
 fRDegN5bwdMncJLn2tiYHOjogSOVyNk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDA2NSBTYWx0ZWRfX+Duloae8Mhx8
 UyHUxyREHCnlgHJyt1ge3gdcUdZIP/UyXHaAwn6i49q9iPi+4vIarfvc5PWP8nYthA4N095qG3O
 btV6HeIDuVZLU+q3E0XrZLy1x2Zk4kFXwUc4s2Sz3H+6HkPwP/PNrKez4SAz+Gvy+x0PanqhzN7
 ibGdLaX3e6Y91A3TTjHC2nhT6YOOcKpjlX2eFaeqUqK1hSTy4hbdXdVqFS07NDL7sG9TBZKzWK/
 b9gveT9P0k6wq76e5xRG1ojf5YVWbAzCCzAZkxNKQW4XYsS+3rkHFuFYk9pyjHKhkHIAFwbuaax
 4eDw3PJZZIsa9Nr/rabuk/ENcP/iZBBu8zX2nlOoGK6KfsI0Zy416Hp4iNS16TUVVv3SiLYVBk6
 KjTP9dJxlhRxkQQvmtkkUImUCwtO4X/Qi3HdWMtHTV+TWsWutJVoqh8NWiix1DisYxiS5kn0Xmt
 CeJQgAyUvisrY5Z6+TQ==
X-Proofpoint-ORIG-GUID: E0heUk7jPwn7aqgH06RbKOYMr5DmZlUF
X-Proofpoint-GUID: E0heUk7jPwn7aqgH06RbKOYMr5DmZlUF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190065

The nord platform uses the same dual-core iris video codec hardware as
glymur, with matching clocks and power domains. Add a qcom,nord-iris
compatible string that falls back to qcom,glymur-iris, allowing nord to
reuse the existing glymur iris devicetree schema.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
index de4792f3b658..558b85ef9ea0 100644
--- a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
@@ -15,7 +15,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,glymur-iris
+    oneOf:
+      - items:
+          - const: qcom,nord-iris
+          - const: qcom,glymur-iris
+      - const: qcom,glymur-iris
 
   clocks:
     maxItems: 9

-- 
2.34.1

