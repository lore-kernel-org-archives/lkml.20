Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B328473C64
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390198; cv=none; b=ZMm6aW+v+nZs/35A1L7XWJKqyOIuIqM04MKMyKq4e7cvGrPfPKsh8Czp7ykSol2TYbIuQ17R1doC/BsZUPKK2YjEiEPs4upYvEcJAujYP+PpluqRhlYaTsnGQ6iYECX5sfGlwIPTrmLBTfFylt9BYeUm4gvfCkJbCFlR3/+k5/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390198; c=relaxed/simple;
	bh=ECGUwAnWWtrvRGIDrz2iEnixPBVwxwoICYkBOaREyUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OiRZ0hp3gVNwbYwS8gvtAgLBS+UkDrc0tnq2IMrou21KPlSFWSwYt9KNlZHGVi3KKIHEgm3vU6YLn3aykEnikTq39U17/adeqSLaVW0HGhxloQL64kY4sCvm/VgukWVws33jFqnlaMMsvqkptOEJYe7W4GAD9jcqM/8rZFfJjbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IkCKxquE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bgsb9fHa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IkCKxquE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bgsb9fHa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlv5O3860374
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LlLWpD2/COOnrjTBBzsyYlqJiJuOnZ+H6FYN8wIyv1Q=; b=IkCKxquE11ET6vEw
	CpkD/55abyQrgpZkvHf5m7F2JJnMqPm8YLpXMM9RlvODv+9Puial7ySAfnC1NBQB
	YEkM3OmHwgia93c8fF94sJE5s8GzNHosBHR0t8y5iqQHY6RNTjee4ir33Sz0ZEPh
	hKWge3UfIzTFGLDX/+4sLjeBTbaHtNJP0baKMiRr4dbI6gI5MS/fEnUFTn4gKEK8
	c1bT0JrIPdWw4JzJ++OFsDkrv4P0UeqaYo8sb2MXxi4zZ9klfGeoDCaA1QDtnIaa
	iLRjdN0/LV0dTrRFhNvma0lprfZS6wjH86iNc2WV0UU1oh++j+JstpQv8N6pDUCQ
	/ivS2w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f11h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so601587385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390194; x=1789994994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LlLWpD2/COOnrjTBBzsyYlqJiJuOnZ+H6FYN8wIyv1Q=;
        b=Bgsb9fHa/xnzXJdBOgltb5NZomIt+rB39VDw2/+hX85A0PhzS6gEMZPsT7h+F/evaa
         QZ2opZmAe3+3a8PptJj8VjQw7cVtODPewCWeahhbYDvDoPzbSUz71+rT5bBrTxfG+2sl
         R/ZjYwCSq9zN9mvMxk1gBgn1KBBW7wbjDm+l12BLdTicGPC2VR9wG2suMHjT9V7PKXYI
         gwX+0TFwHy5z5aOZbyjBCWK8IcHp0TH8M74yzVUxHoKiP0K0b7bBx61EsWO/fDf+qN/w
         3BNjMVdO+h6jl0OE1ZJWNYRIBs3YANAsaXn+Uph9pH+3eu25RA1eyjwSFV1ufJk0Lzvf
         WEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390194; x=1789994994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LlLWpD2/COOnrjTBBzsyYlqJiJuOnZ+H6FYN8wIyv1Q=;
        b=p87nBvfO7U7ESzX7oYbm4M6rMqMq1vWAQkunfNLMNWpwLuooxxdAiD0Qko0Xj/1+mA
         vCLaO48cYA+eFVo6Y35fmIOtmhDGCy7f/MRGrXGC0YxeikDKFXOmDyAYHxWP4G2yA2HP
         evgnb99dbVDbfwt5odXOB7MiQqFTEy4S4BufHA/5ChKmax1jpw6fwbt5At9P14P0y10Y
         OBzan+FyLueRntiaq0/BszSQXeJ0wwqMq3ThXEV7lz2eb+7UaPwG8HEK/ctVx4f4UOQl
         LEbAeNdX1F43D6MFvTvnsBFJEitQcyT6ZUoYAYX8/wxN4Q9cnksXGcONKP1HoVYWLEIW
         h3Uw==
X-Forwarded-Encrypted: i=1; AKwUvBz9LBhVbVAUO3HZNzGD3QqSbOFbL3NxY6QTkRF38Luhpg5vtZ9UCt1aS+o3nlPGY1ffwZ+0nbPjQBmyUZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++ndOISlklggHgRSe2VhsJRZvWpVrXVfOgAgjMM4/j08pB90E58s
	Kr2FuqvLRFkKntogtNxXpUZ7fWn8Pye0oXayEdO5Uq9I+NWq6Ov0ILXPX0B6h7jzpxqHxLz4uGE
	FUkOlgfZW6n8gBDz5GzK5heO/h13BrJLXdOrh1DGQPOYebabyuE+2QnfQBCHl71eOIOQ=
X-Gm-Gg: AYBFou3u4v3pFyK39FHh6SEN4e49gCWu7PvNURVNFWAXQzka29jfDDBLa70mjO22fat
	eGhd6GXFM5xHAFv/q6uv3osZf/OJARH2koB3zLfI8Xauac24h/JR8/eEcyN+uFU0j9bhFuavp02
	7cv8S/gvospXxrxpPuuh1JYD0J1LwVGXqPvOPLQEk6Np79GON+lOMKUzDQlMeOjD5FC2i+wWzjN
	VKeZwYixmfbG3wYw4ydnyx31JBL+vA8cOQE2YHxLfQpzpbLZmYKIamV/9ZQxvIE5AudkQrRrwwc
	sbgKKsiAiXJ5zA5zQTkvOGEJIliQzyFYgTk7kbhXiUHQQFvlO14v5krLa6nZT1QF2AgmCqcfM16
	mp51ZC4fC
X-Received: by 2002:a05:620a:170b:b0:939:6cd7:9706 with SMTP id af79cd13be357-93a298071b2mr312572085a.21.1789390194260;
        Mon, 14 Sep 2026 05:49:54 -0700 (PDT)
X-Received: by 2002:a05:620a:170b:b0:939:6cd7:9706 with SMTP id af79cd13be357-93a298071b2mr312562485a.21.1789390193633;
        Mon, 14 Sep 2026 05:49:53 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:41 +0300
Subject: [PATCH v4 42/52] arm64: dts: qcom: sdx75: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-42-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ECGUwAnWWtrvRGIDrz2iEnixPBVwxwoICYkBOaREyUo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z0urqGtUGIFjJ9nnW+kSDjGCELZGKpvry54
 NXEa4bWNriJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs9AAKCRAbX0TJAJUV
 VliMD/4z32Ro13/erD7Xl91GbCUUZ3I1gKZ3KHmCKIkzA2PLHCMB810cd7qrbJxenz/Xa+IhQpE
 hO8aFpYfKQg+RoPy6oxxHe8sg2VnIuZ4svLj6LL5PLgGNyI3U1qAC7AJLzqViflHHksQDU5VDaq
 s8QFQO+K0K7xYwvnzsqJA6BCokyYAlCHQ9sYs3ug0GclMqj6oE4g1+Us/FtIDRhH+8Dq2rK70uT
 4Ej237+eNX4qH1YEe1iEF/gMRfbJFBCq1wcIeY/Jez+o+8io17I9iz72BbLuOv//DqlMteMMIz7
 hrKmDeuPi1NxrF0duKWjnN1FuMGd35iRRat/KNq9Sw2jDXTk8fDuDtUoEkj/JRRlU2ZQHB5jAwr
 w3ANsWUWkFfXB0j2zqyeBzYhfsf/3MzhMBccPsX8c9GFzsAAyVoBAofUceTeLtYZmMl/fDuVaDE
 mX4GTOQwTrtwMz3zG9da7cGgfQX3as3njZQdYPfpple5C8dUosXH57ItvryoIvv1poYkoHELmlL
 /qLETzifHvWed6ngPNerF79bpmtW4cz6xod42YQnzWHTPTGEGLGw8D6+4icxPh9uJ7H8asrQ5I9
 BQ4N4i8pXY7xxjkQ177exhRFmHOK7vtu+AbIWUAnZXCkZYqG5SnOSymY+boMDD08vRZWGeVqiBh
 bYAWKFjXPJzDsLA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: a6B6hSliCebZ8q0t-Vc88QoNMlXQHb0a
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX38SRVScl13s6
 ACgEvt0OzsWKGH3m11e9Y5cJyTsHSm8btBUgRfdu/wLhLT/t4tMmk+0Ab9uu2RHIcRC5mp9ddGI
 49OFiXyjszo0vqLS8fDz0IJpHCcarVE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX/ydchl1RSywh
 kylWRIdfZvQGsEliX1acsAFwTA83XW+mJcsJJNsUdNnz5gS4hQ59KRwgORN+cKoHBcmV5G2SOhx
 pnxPvO+ZNHf739/AMXyZ2tGXiotTew26kOb21VGCyawfeARGxxYPCis21fYHVXbEUrVwe4lFPBV
 rkTTi8Wc6nlw5QZwtScFC6EeNA06LgvSSOFDqFrmllEnuWQecO1uwfmP29VWTwwv2GLg/iplCKM
 uKjOUAmk8I33gZb7AsiE0Leg+crP8lgF2OQv962x7AppFwOPkB+eUTzu0uPgxFkrX8cF1EwWz6Z
 et+K85Lc7OeCq/NgvrQOXL4BdCAcy6Rvdny9qMb23vpGN0c+sS1VenIoIl2LC2Z7RETX0f4JViR
 tF0pbE8YUifi4XZEN6/UdFWy1lfSyT7igUdzKGkOpq//eSvTHMuuG1Lds4SWsD9npeAWf8Tn/D9
 QjNIOFaMXAbvMiu2ywQ==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7ed73 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: a6B6hSliCebZ8q0t-Vc88QoNMlXQHb0a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

The GCC GDSCs on SDX75 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 81292850e531..c66f7bd9bf9a 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -486,6 +486,7 @@ gcc: clock-controller@80000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

