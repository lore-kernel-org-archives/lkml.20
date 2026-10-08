Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79E827466A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 01:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791424261; cv=none; b=gBOKku22tNChDfB7JZpKJ7/LErs9KTbdvUdc7KasQ8QEtk5Fp1l3g2LIru5INGN/bId6ti/bK84qm9RRhaLyo1DTwCx/htrkDZZgYse0fC1VYFnKQCYOz3ELV168cvH6uCMwPh4Pcuaf+9LxY8MRROSqefWaXfcTOa2CL0dt9Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791424261; c=relaxed/simple;
	bh=sCVLeOjiJE0GZh+YstipYytFVnCzcVwgUUz5HTXAiws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QY/3nSUmBRHMthTLdx4loHNauECjLbuMjidA5DTDF7ISX8BN5mFvPxuLR9SuzZLOZCl7TSwBvHcrWesvfAlqzALRMF75TQsjEo0E6nREZINa3OJHNSuXq2hT6Gr4p73jQBYfXclFh4ujNzSbzCMN+IPcR4xMkoQpPQVzNfhrcSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GckDxWNB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YRZh4F3i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GckDxWNB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YRZh4F3i"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981i4p41335286
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 01:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sq1jFandZRs
	D5YZ+BLbArAFYRvw6o4r3gf1nHfXPy88=; b=GckDxWNBME3sbgnc2qvaSuT0L8n
	ipi3DE1JjRFn1eyuoQP3+QMJs9WNxBht84k0eiloFn8SoRocbJSbYA9B3007i4K2
	3rKAzpT8oeL+6QMK/a+ezbW2iy+d69fpzKu6igvxs3BjxJk9XWEXoIbNcALG56aH
	lyltAft3HVUksY52Kz5ZZm1rrIAwNa55cNqHVw3gHJe6iQPqqDyKhgAg6Nrzrtj1
	du6sf+CCHCaanzjOVYFP5o8vtFjgteBe2Np1ZMpnQBPlt0G4127+6O27dNWOqvZu
	+qCS40aW9dm9g7IwONrKqphYF5Uwe6nXoHGDqxPVmllVCg1fpJPfhjQy/Ow==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3gnc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:50:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso8978154eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 18:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791424258; x=1792029058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sq1jFandZRsD5YZ+BLbArAFYRvw6o4r3gf1nHfXPy88=;
        b=YRZh4F3i4QlzgP+UCGJG8NUzfFFY+kaianV7f7AODoB3LgbfvC02Gl95pR4oZa2kH5
         R84jRtlbdgBU6QizLe2q80ISTHM+PAX/jnYinjQOBJY4GIjEO2iElVQ5dleB0pMGUfxz
         fyEkmwKFquyL7EbmiR6MMXmf1VKkMa1rDkWP/JdUWTFU955cVgA42NvqQChg1FvMl83R
         6T1S3TYpLEDjOHcmYsiUL7HoG1Zev6gJIH8BXDC1Dd4ApfZGT2zcQtQ91v64F98twP0e
         fdzTFs7zsdfgmurIyoG4ankHCrjVsToeJ201VOfSqTLkQufigssFmc77z7cw8vLmk96W
         dTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791424258; x=1792029058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sq1jFandZRsD5YZ+BLbArAFYRvw6o4r3gf1nHfXPy88=;
        b=KjINb1IcqOdn1Ad9neiU1PodVuOSh1AbZ6czro2DU6yDtAPHZeULGCbkj0d1/SkkFF
         NrNlrlHIrn3xEc109tiSbfxm2WA0tqVmz3dmrbFi51jjSCA3mKsHaZrIYUSpnX9mOYXE
         Z0ePS0w4Y7pFR4xZtadtp1bbWkHWdk+pKgb5CdD9cF+ptz7jl1V3wKrGXHpifXmQ4NpR
         WDZJCDs4joNk1axPtE4aEG0OX6yJDQlQI3dun9hOR6Cu3fVuM/eHi4bIGeH39bYJWxfD
         3QUWklZs75hPviit5viGIU4htBESfmNYVr4Q9+xToPvnGl0QVtykA7F665hK6GK6sKqN
         SZoQ==
X-Forwarded-Encrypted: i=1; AKwUvByx0vp5pXZKybz5kqZY4Jj1HhnZnfldjUJG4sLqGlzG8VjWb3LhRvxwZRAWIOZ62hag/M+3aykW48k5dfY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGZUL9ZNpAr35qxGiTPs0/J0EHGoodglaX2SrnR1IWQjm8Z6bw
	AOVtvVl9UhuFEWvq6tMJydXXDVYQZ663f/Y1AqkdvpRDouwbT3sq3uBxuUlzYCNF80XHT2W8G/z
	ja6Tir+9K7x6XPf5eDA0D+vcqtJrTCZZRlu4UmuXBMt4IwAqPp5p6wrQhdUbw/4qif/g=
X-Gm-Gg: AYBFou1f2y1E7tS5lKA3Llwd02EKcYrZezPSjYPN3d85jO8lDe1Y5Q1YJmwcunWOwCU
	GUu22rm1AQNb8VCn7vvA2WWh2tzy4CJp/xTjSN2y82lBciW8AZvIADn9f6q3yJ9Y87vB/EYk5NE
	U1owGdi4BQvh25kTZnYj3SSKl0+NPbcgVzr5dKhlXU/rxNRc3xmjtveOcTHTF/1spEEeFqpdDOI
	pqWuPxZvqU6sNRnSWZukxWIP5L11tGDKmluSF/zXfkTj4EzWlieJURC7RRYUrBuvW4d2m168Rfg
	eUvxe1emlKr9HNB/Pr50GtyFeVqKi/P0CYRrnLU5ncWwNQ+C/oCY92+KMT0+4ZykAfaZLp5geFV
	6dwUIEQr9Nfg32nBaU16Tq6GXj9kMqZqGa9DnpMIK+De1NBFTXurkRWJeBHU=
X-Received: by 2002:a05:7301:4208:b0:342:39f5:f9c5 with SMTP id 5a478bee46e88-3515dd7e704mr4466011eec.18.1791424257723;
        Wed, 07 Oct 2026 18:50:57 -0700 (PDT)
X-Received: by 2002:a05:7301:4208:b0:342:39f5:f9c5 with SMTP id 5a478bee46e88-3515dd7e704mr4465976eec.18.1791424257171;
        Wed, 07 Oct 2026 18:50:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515abb7117sm11761823eec.3.2026.10.07.18.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 18:50:56 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Nord cfg_ahb clock
Date: Thu,  8 Oct 2026 09:50:15 +0800
Message-ID: <20261008015017.3359804-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
References: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac6f702 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=8IMiPDtIn6OAJiDpRukA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAwNyBTYWx0ZWRfXy/IOGO6bm2DT
 8I+5zyqJLurvMsSYF+OHgUJZ8yS58sEmvXj1urw7WH7cDVS0wSbb4np/hQAcWh9JJgMhNga2yng
 17jvwzss9ucRy6q7B8iQ3jlLtbEssqY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAwNyBTYWx0ZWRfX71Z7c+HuMNwt
 T3tF3+M93cHRy0QwZ/LQV4443ET9yDp3vyWvlV9jIiNDPzzBANxuZsNddBP1NviT6SRa1u1vtJV
 6h+1fbJRjlO/k1VXGa7gnFAJtyWz3yRRSbux5PwUaBFZMHdzFBFz86Z+gYt9r2hx/mLXz9d7aZv
 MuV+mYfK6pUoH4AlObO43CVUPCOaBJMoAAJvGW2HGwKFeUVSUWluwvf+bzfssXhV1MdRMZaL10V
 TpgxiNSufkNnibYgk+DR9EIz+lF68VZAvCd2T086KFpd04ItL6+yKCNfFhYupY567CDI0Lclbrl
 WjNfMCluhtQ979Lc7LjO0hURvxgt8DoPhcmx5+OfIdrdU4ty7wlkDHJ7aLHCvTBJEZUChAJiIiJ
 Xl3yhqSU5A/P8OLNjAWh/rLcNY/ZZHxNKYdYvc2CksynH4GK1L5Cwr0s6URbRHHCSW92YTZcYvs
 Sn2E2y4wL/gJ1DuBReA==
X-Proofpoint-ORIG-GUID: Mu9Ok3VXroxo9Bmy9O38vq0lv9NE4lMY
X-Proofpoint-GUID: Mu9Ok3VXroxo9Bmy9O38vq0lv9NE4lMY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080007

On Nord, the USB3-DP PHY registers are reached through the AHB2PHY_0
bridge, which is gated by NE_GCC_AHB2PHY_CLK. Describe the bridge clock
as a fifth "cfg_ahb" clock for Nord, using the same clock list as SC7180
and SDM845.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 13e64fe510b8..809bd4e1090a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -209,6 +209,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,nord-qmp-usb3-dp-phy
               - qcom,sc7180-qmp-usb3-dp-phy
               - qcom,sdm845-qmp-usb3-dp-phy
     then:
@@ -229,6 +230,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,nord-qmp-usb3-dp-phy
                 - qcom,x1e80100-qmp-usb3-dp-phy
                 - qcom,sc7180-qmp-usb3-dp-phy
                 - qcom,sdm845-qmp-usb3-dp-phy
-- 
2.43.0

