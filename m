Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A384D4E8E04
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969268; cv=none; b=F5M8+xfDEIZXfJKKvkKhPzWRTCjtv+OvjUW6O90EkTx7btFs1UD2+DRUevyHVd2dUGxcZzbbdWFJ35M+g1Rc8tFYZRQGksMA2McQ1Fl/KQE5Ih0QYS4xzeo1Qgm+VjHeMLUROpVL/zMQae1xKo8U/1WCYQTkVtn45WR7cDvAV0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969268; c=relaxed/simple;
	bh=ubWfHaaUXVvf0YQc8C8dFRG/yatLpOHVQwrf/Ep+x8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QXc/u1vKdrcweXBK13rKGa3vpL4lEDEIjum5zWfSRxX1mzrHVBJ0xWj5SFTwz72AirsHZh2mglxp/awFOjMw+dSuBixHL+lVFCR2UejX46UiaaD9MgBqK9fcAjaqBzZ+SB/ZUjNNEliiqlORIV35th3dsgu+2ozr27J1q2YiNsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwHQeYU7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdAPfUie; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwHQeYU7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdAPfUie"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E3tqpW2222086
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Ugfh6toL4o+phi1v622Lh/y1/Z7SzRdGvZ8lYNyq9w=; b=iwHQeYU7N86SEjO5
	rCCPaFSwY+uUNPw9w0+3QA7j2ZxBh3r8L7Mcc+C3CgQkjZahn4bWkirvbajF0tlJ
	eHVhtNHTtoFVHvZEnVRiFo4GWAaP79Vc44imFIpIDe6ErFmYefy1jRKj1Hf0M2US
	/lUqkElQTwzcgxQIEyJD1frpsaU8i7YNsuABtfg8yuvQci3AFSwq4IsEP+AYsJ8k
	KvzmQSD0Yil/QtyyV7x9crY3aEentiE5d9Cr7mdkoEioIpK+MmWU1QFB+HvhqIjB
	n1/A805JZR3KxHJhGt1ioWkwuHqF/mJ1f0MXPriVbYiU7mr3SBgzqCPRAHOiqjQ+
	a8wtHA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsatsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:14:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e818ca61bfso7836095ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791969264; x=1792574064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Ugfh6toL4o+phi1v622Lh/y1/Z7SzRdGvZ8lYNyq9w=;
        b=YdAPfUiekadDinpxUGxwIYcIuda9lTvM/5ZGExYiK3CSB3FiTucnuHtVg5FmNuebuc
         yQyz9gLYGAippwrIFnV3OlKq8Su9QktKXKbetvkP8XFOWycBnTeOWoxzQOnagPuXrQMM
         dnZf6T1bYLAGzIV1pgmsQMP3h6sgiYIfFRpPyQXPzfBT2Q76b3Fa/ZNBaw8Dg5p6/++d
         bEhyDUUcE+mLsktB5Z+Xd9/WxvjPZxs1JFejb+pDR2dacPdgyRi/bYZH7AsYBvPD/8NM
         /voXvW9TyFDQPgXkYlsb3StTDADjyS+JDmdAkNLvtV3iaMQbJib4feg2I0V9xqL/z/oR
         utFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969264; x=1792574064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Ugfh6toL4o+phi1v622Lh/y1/Z7SzRdGvZ8lYNyq9w=;
        b=1u+q3XG7wXb4onQHnd0be1c6JiD+UU56AzkwlXeVb1S2zVwJWWI9lsUqvZ3LVZd3hx
         559itEUneNnH8zwQC3HpvOrSDjQ84qB4ygdhBfayVnWFKS2fzM0PiXa6RaYYPlbvDcBD
         E4LVYGLpHNkQhG+42GxmFScDmsds0NNtS9tlC9pa50I+2nFLmoHFa1vUI1EEnceinxYK
         NvckcNyueOz1Ubb1bvcJRwXqOTnScrGhqbdcUznZeltu1UI2X0piirXOw0CrEmXQ8XqT
         otNl9jqJRKPlVzvCxHg2o19PCAZiyilH1T7PlRv7GuK9r151jO90hh18BRhw2Pn76YLg
         YpYg==
X-Forwarded-Encrypted: i=1; AKwUvBxs891N7sJmLq/A01GQMqkAGW8rAZcVraDJXiW++EpQAPwK3fwqYqJ6vO644BKfUdzS14WUnjomH2EJw+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9uNUUl7iccgWnpFAoD7piLdA5IeCezOHCKRluNsA4oiIPeiWm
	h/fUJFoMGVXTdPY1ZDn1rhuPHhiDjbMpBzq4/8tvIJ9HibFjA5pxD7pFRQuryrUeLXFMtXmsKGo
	o6E0ht8J5NlF8RzmrclKVutxDv59nm7osE/eeqlaDCDjvWxLiroViPGQ0tw7XVM+NVYs=
X-Gm-Gg: AYBFou0E48bdyYgnnJAGEfbBgwUUqg39iCcfyWbgW3jrRGp5MNYQzjM9Xdjy44v13XV
	knBWStDmn4xxSSC9zFAizJuPdhwI+qH3pi2o2uQOtTnE2+8WFY3yvEDNckXLvM9TGKX1namSpGI
	sdic8w7B/4CnjLoNnYoy3quDXzjxKuVe6kfWjyv3u+WJKGzfw1pmAi4dJLYSWj3NvpvWPDnX79B
	KjWC4wodgU5KlLQVGtlE2s290Kaml2GWUAy9BF8zsFf9v0mBAhPVDp3ELZxenjaIDD0o/XTVmbu
	nhPJn5S2T3On4XwLZpmGFV0ZJT6c83JVAhhYs8LZjsduw1Y/1eCpOILz92ewFAwnR1MLsZastsQ
	JGoeXVGf+RFN0tnqmjN4WvKsPiLYE3ZyHyn8=
X-Received: by 2002:a17:902:d541:b0:2df:8f19:5db8 with SMTP id d9443c01a7336-2e842f136acmr131951195ad.59.1791969263930;
        Wed, 14 Oct 2026 02:14:23 -0700 (PDT)
X-Received: by 2002:a17:902:d541:b0:2df:8f19:5db8 with SMTP id d9443c01a7336-2e842f136acmr131950915ad.59.1791969263437;
        Wed, 14 Oct 2026 02:14:23 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16b3sm67088595ad.30.2026.10.14.02.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:14:23 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:42:53 +0530
Subject: [PATCH v5 7/9] ASoC: dt-bindings: qcom: Add Maili LPASS macro
 codecs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-add_shikra_support_v5-v5-7-fb9f0667e613@oss.qualcomm.com>
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
In-Reply-To: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791969222; l=2665;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=X172senOJGEpt1gOkSVMmtQdNj4w/1OL1At9lde7tvY=;
 b=tAdFsJA+m9R6QtFjHUn6cCSVwjy/krexQU5Al0ZEP7+fn9rbQS4WbzLQ7UbgJ77i1EydHzmcv
 ug/GHAdQYQaDPdJV+Y4MN5h9yjOccxJKpHFUGsVxzDB2z0m5BJN50eR
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfXynkHAGgiNEYY
 w3D5rlgURr4NoHvev3i3rXWMlBt9ZXW6uV5GfNmDiLTDgK/kuuA9JOS/qRYlSuqygtJTVwFSt/3
 vqesIkfGQtQW3L+nJue4WS4ubOErMst2COJtNsfvt8+RoRiBc6TekrghNvfT8ns2jQgR/NFricy
 cS4V9SMKF2jl78FsZcB/aQ2W6MRMzBOT4LkefODEb/73ywEhSOy0iP/y2l1kpDrig2wXNDmyGdD
 QDUSdYNULJd1q9AJGGpSuk5PClkNYZ2nTB9S4sfsJzMpSbryL64FWEEEQ1A5TJ4miMsnRKwsfWj
 JtsDS3/8TzlFDw6FAJG+oH7MSs1aTF8mipkC9k//iFNmW9Sm/WpsUGzDgWeAB0ZVpqtKHLLHzqK
 RfEtzOzS23777vxZ1ZxdukQz/knCgxiychYoMzinYUThHb0HT8JP8rdi4huMOdjBVNhU4iHTfIA
 AvczyJ4aDbwW0B4wGfg==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf47f0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WGZyT7xzyh4_t1xe9HgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfXzqihlwciocIG
 ec/Y4jfJaDBXso+GMrnNYqWwqpnpcxafXNR3v+q/iNdU1+ni05vI4JQ8hhL2DtBZaUaQEbjLWop
 tfPpalyrPaaIxom96yfceIzSgnVljp4=
X-Proofpoint-ORIG-GUID: Q7EiMwbRIDCmDJPposYAmDxnrh-rghKJ
X-Proofpoint-GUID: Q7EiMwbRIDCmDJPposYAmDxnrh-rghKJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140036

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add compatibles for the RX, TX and VA macro codecs found in the Low
Power Audio SubSystem (LPASS) of the Qualcomm Maili SoC.

The Maili RX, TX and VA macros are identical to their Hawi counterparts,
so document them with the corresponding Hawi compatible as fallback.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 4 ++++
 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 4 ++++
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 142955b85..41b578f83 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -29,6 +29,10 @@ properties:
               - qcom,sm8750-lpass-rx-macro
               - qcom,x1e80100-lpass-rx-macro
           - const: qcom,sm8550-lpass-rx-macro
+      - items:
+          - enum:
+              - qcom,maili-lpass-rx-macro
+          - const: qcom,hawi-lpass-rx-macro
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 2df72450d..900ed97dc 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -28,6 +28,10 @@ properties:
               - qcom,sm8750-lpass-tx-macro
               - qcom,x1e80100-lpass-tx-macro
           - const: qcom,sm8550-lpass-tx-macro
+      - items:
+          - enum:
+              - qcom,maili-lpass-tx-macro
+          - const: qcom,hawi-lpass-tx-macro
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 7d56f9c36..9b8d9afd0 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -30,6 +30,10 @@ properties:
               - qcom,sm8750-lpass-va-macro
               - qcom,x1e80100-lpass-va-macro
           - const: qcom,sm8550-lpass-va-macro
+      - items:
+          - enum:
+              - qcom,maili-lpass-va-macro
+          - const: qcom,hawi-lpass-va-macro
 
   reg:
     maxItems: 1

-- 
2.34.1

