Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FCA47ACD8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390106; cv=none; b=RBqPigKV8NEorz8/YMuP9c8MlXHXbgHUZBKZjTCqLVYo95yHOMFmHd4C3A31/Uww6juhBaRj4D9Dwzqzd9EZlh14aHLHkN6SrmoKcrDATs8LZ1SOgddqzoWqd/xWwm1v4EblubZyrczWKhRf28Fhg1w4g2MI7pOcb0XRIwWPiCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390106; c=relaxed/simple;
	bh=LvvWfbXuyJlvm8eskwUL5IeBcesN2ImrgD9wZBjLG7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W4k4qtEDkDp5fQzeqv3ozOnSeOZ5/CtYvKC6jgDfGC2S0gRRE+JNM3LNUPUP4XZ5XsRDdBNGIWA9WtX9K4YKrx9GxnysKpBBJ1saEkkGLkNXcVdhrKFmKIW9WNpLoTCchhmmMkhLkTshGmrrKKk3Ot7w7lhbGF6+NjfGIfGM6mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J4Wwdsx+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1GO9gWP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J4Wwdsx+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1GO9gWP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRM9U407210
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZz2Yu+1ZmUpDgt4rRtOsrqf21LhHDIfRsUyFBdeHvE=; b=J4Wwdsx+xUYqZNqo
	bpmUYl0fMBbVKdY7ImH7pVBg9XPQwWkCTbDImqjplsZyGuj81onP5OLKZrzNSyIm
	QjqhwtJAYaYcpkaVls8hY4Hf48uBQ2BlJMl4L53jPMoOOgWYTnjan9g01snKHmQ5
	/bm7yXtmCRk5zS95ngulYZQPy2rUpfoxC1FH+OEJb39MbZRjXBXb78I+Hxr3S3ng
	ZDc+qzttvXZray147IUUXrBuP1XrQemQl3uZOUEq3zVpDL5MqZlfG72PxAVqi026
	x6KLgBat3bqe8gDEL+roMy/YhCzaXjVxYYzwad1ZGNCJWNB/x9V1cpJuNXGL5bjM
	00nt/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr875-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a07b5b5efso305020285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390103; x=1789994903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZz2Yu+1ZmUpDgt4rRtOsrqf21LhHDIfRsUyFBdeHvE=;
        b=d1GO9gWPK0ffQd3OVlky45GdFLSZHbhTAqTDa/2Hx1kEJFkhRrQpXcgkhh6J51X2WS
         vxh+m9gQq2UDOg+hgy0WKaJLivwhJTZPXq2onOLX8fAaVfT4pS79YdNOxofTNf+jTxL7
         yp5Ffnm6gYlOqsB2wq2SPP2fwG1qw7MrsHtecM0iR8N91+ATT+6OJFWRh3Ek5CGLjRzl
         /X3R6n7FM7AbgYH3gEMIpEFyr7RIena85yP+dzDgxnMfccAbqaYnmEu+HPpXY/EP8oIq
         mEw3n2KwLzHEuWpbPpSCoQdov0fMU+SsOoAF7rLW/ckr10NuQ1DRzDUc6QEZ4upPA4Rh
         3T3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390103; x=1789994903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZz2Yu+1ZmUpDgt4rRtOsrqf21LhHDIfRsUyFBdeHvE=;
        b=GAXJW6I/pKK889o1h+8w0qzIniuRw1aEfP2aTzFNaHjZ4zu9PxKFj5gHhOtF2gr/X6
         WeyP8d7FqoIaMX3rpUOCEUYZPdeG1ghC2mhgK06xdxdTOBUg5YwI8r/pVaCU8SxZomfx
         0lGzHRHVRDiHNokawEA5imIlyfrDUWKSpJvjwxC3pviiO/eeZ79GB7vIT6IrhTj2ACOQ
         RRU1NB+V2cF85KXze32S6TtNTDUnFllmthHO71NXN4Gv3PEUS28JqIlXwC4qRvXH9nZI
         GWIFcMhsr1si8+BAqZV2wsxbayH9KcYo2anb4Qkjs79F1SEm0DbC8PtJQnJ3MH2Z4rVL
         8LyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsNvvKt1JP7wvYLhHjc8/kHVHG+p23O6SCOB+yrzvF6FUQxBDAODcSh8fng9TemfjbIezCZziE1gwyiWU=@vger.kernel.org
X-Gm-Message-State: AFuF++mUOXmUUasyfjRvgvyvApPIXUsRUas9+ZBMM+SPzwkqh6C3cdrY
	w4svufdibvAH3nV0q0fIEAj3wl87G570yJPe+mAJbnzdtPNln5XD+y8oRoKAmzHkGWbV5aMsyHW
	HZ1cQcGh4IwIVTLFC4u3WfSrdryF4o3bJCHZK7Y0/w/rowVbrd1kifBU6AiSXGJf8qbY=
X-Gm-Gg: AYBFou0sXcnp2iNI8z5PyycKKFKmkAj0hAMapYNHpYl44H2lGExPBKuiaHWBi8ZCsJu
	6S0B4L/Iy1xx/xNKCg088nizBtFYOJeod2jvrnEs9oiLoEL5/gZoHr9UtGDmW2VrQQFwaXIoz2t
	DmByo4pn9QUVAKIlAgs4CmHr7Om7MD/14IQ5ScbYLoAqjB+sy6oprmSKQ5ytsJEf18cnlPgVXH6
	2rA8oad3wINMZEQDCWVml0flnAbPfbyWFV0giFpq1Yw/qdLgnB85TNHdWGjG96ZDMBt3wwDuTaH
	XDlZTh7GVaIIx53t6XfIC+8Db0sliQVfbYCwoDokPSQEZV2QvS8cF0RTFLrtOCpqP8fvrUmWA4r
	NM5kkwaRj
X-Received: by 2002:a05:620a:40d1:b0:939:f861:8836 with SMTP id af79cd13be357-93a18601143mr607444185a.20.1789390102986;
        Mon, 14 Sep 2026 05:48:22 -0700 (PDT)
X-Received: by 2002:a05:620a:40d1:b0:939:f861:8836 with SMTP id af79cd13be357-93a18601143mr607405985a.20.1789390097762;
        Mon, 14 Sep 2026 05:48:17 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:16 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:05 +0300
Subject: [PATCH v4 06/52] dt-bindings: clock: qcom: qcs615-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-6-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1712;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=LvvWfbXuyJlvm8eskwUL5IeBcesN2ImrgD9wZBjLG7c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zRk2lGPPuDCS3iqc8bQCNDBapOLWB/ESxba
 vl+GBlxj9eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs0QAKCRAbX0TJAJUV
 VrxLD/9oyR/iGz4tV85OCfXs7U3RmOZBtKQwKPkT0Dww7xwh3xriuGvYqh3cK7CDJ5NeMix/6Fo
 SWblMwACcshnDMnMzQHpyfNvlCvnqcm31nRJIkOfM0Nod+0Im8xRaEmqNwfUp7dmXnXEUHqMXbQ
 w85P7lqsgOYaPPYcptx6rE+yb1aZVEDC54xOA5Kmvg7vhThZLzRKl9WgSzTVt7OjwXLkJr7XC/L
 14EQRE6OIGiUNAKp/ydrpbiMmp7633GVE4pzIQ3fmLD1RoGgk0mW0qOgya+zzEENUdBTvwAonNo
 p26dlUB9Lo7q67ebMPzIwQ0IQN5Mc2UPF2HZ6IyvfowTGZ2pTXRDlWRsQ4ZJrRwG0FFaYpqayYw
 kYvFvaYae85LK7uP6PlRi+6PxW92hPmhltfGwEOyEXIvgT9gEoIWuzXAisYnQrrcxG0IEkC5dTz
 ngRrq9KaENHd27D9xpqQm9LGEUCzihAVt7e58dseKzyzF/480r9Uc+UbMZDuxJQg2berzQrnCGi
 Af/POskUYBLmrNE4K6/AJ+lN03QdjMqVtgKt2sisPByHd0eDIOjpWWH98GyqeGAssJqC3jP7DXB
 AZ0wlLf6iUBGZLxBXKteX8q7x8x680d2EjviMGvhUGBxPqVSrFqQOgocejOEWbvDbqpv3v049mn
 gBD9g5KdRUmvVig==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: LxRX-0hewy7S2Bn9wVtqOACub3t-Is-p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXz7Ol71yRiR4h
 FFps34pTG6Iv+wMKlN99XdOl7/nksdiuXKEiakpg0Thg8Xqqg2/bo6J30A7jy+QyjD8XvMsj04p
 J71xETkWQDfWL9AtSDkTgw7nOudrzuGFe+OZP7d/NregoaXvIv4+cIg5csJOBnaTTarCXqVTmPn
 MJjrOIhNJU5m5eyt12Edb8P9HhWVMv8zZHHZpDZj7LKjpmvgP7OfIAQx64bKI51dt9hX+9pSTLA
 Hy544XsmMj2f+ZXPi8g18t7PkBxhOfVpM184MG02VfQcJYxdQJpV96FG6IqakDB/VtBpgHvajAE
 BP+p+4Mf+a3Zla6csLT6JUICGpvQ2oFdxUsEKcAt3cLdLYIhB/Xg0JKxlnw8Wq+QncSWEBX3+e2
 OSF4lGO0pu6wPkySAsAiWoSkahwGJAH4AdU6VczSy64PswpVvXpwjr6jZUWHOlbADH8HVFOdEIE
 EJofkq9omL/vXuWE3Ug==
X-Proofpoint-GUID: LxRX-0hewy7S2Bn9wVtqOACub3t-Is-p
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ed17 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXy9lAc1gSdT6S
 8kEK2Jn1l1RYof0kWGz+TYwDdOQmHyos+4NVdUlcLW5qIEVIz1QXYso2XIsTgNhZTuQ4adzb5t6
 DPwqeT2GCo0naxnVjqZbJtJMJg8yddw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

The GDSCs provided by the QCS615 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml
index 4a828e102d25..c87248531563 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml
@@ -31,10 +31,15 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -45,6 +50,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,qcs615-gcc";
       reg = <0x00100000 0x1f0000>;
@@ -52,6 +58,7 @@ examples:
                <&rpmhcc RPMH_CXO_CLK_A>,
                <&sleep_clk>;
       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

