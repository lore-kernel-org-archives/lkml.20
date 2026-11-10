Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315787;
	b=fVD+8nt2Dr7sTZoMuRMyVYcBMmH8avBsA1Pkv+rm6Tu1nX0ZPgp4F+onvpbiaGRr9Sfp
	 Kb5eMAbnS9s16GdAUHBHD+O1tllCsqPe8QFcy/GP4WCAKvCHYqy1ZBu1Vq5fgDmnphXCu
	 XFNC+Gj35eWQUMagPpuZBcqcUnpbSMmsW8KY/W00O4Obj6oyUzT5jfyktH81aYO9drRl8
	 IGUUawMlVTKNPxJLmn7Gdcicb6jROUTMFGmg23ufLe0VgNayIZNZoQFcCQk0hfBc+BSC7
	 FN+7vfUfCkvo1ZuuSUN0C/ovvV1wh7OyZT35iL+ApU9Zp22LpzzS7Mq0hUnMt81wDkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315787;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OALV8vUNInuby80JCyIJlfai0hgF0F+FwNbODqepVpc=;
	b=utve9Te4mt8RNjeg+6nWtacl49S9uqiZkGwIF9XxVdy8znno7OPZfahrfnoQSDFznWg7
	 Bl5hDdeDENB/PjidumjOpEsmzFKQ/daeV91h9gWenPoPp6zNfivdnEZG6WxDQu7VXtZ1+
	 Hhk1F39QFxX1goxISmrH83chNZCa+4h9Gngj/Jh3h+LB+bcvFo50KAkVSGvy0QMtqLcMg
	 VQrjQLBjyUXiqqqNfM8Jv4Am/wwdqgFydXKtM3alUp3c2dz1Hh/JkofPrhmSHRqjKn0io
	 Q5YpFpGqvw1KC9h9JtkhURaxB0M1UwedrtaaSKQz4k4IPQCA2nyXyHK3Xylztyya8tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YvX39h4p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QiZVWoRZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC856070C92
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BC856070C92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YvX39h4p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QiZVWoRZ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAB9uaa3195889
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OALV8vUNInuby80JCyIJlfai0hgF0F+FwNb
	ODqepVpc=; b=YvX39h4pORto6tcpRFvnzK5hYYt3WBlKs/UU8rpssKijGYuCc0j
	lrpk+ZcOd3zDJrWTm9zAUHkYArNm24IEABX4HFVQ4eWNj4cFFPMexV2lYJYboioj
	EwJnRxIe7h4ru2S6gEwgRSR3Eshjo+cc+lNVzVyT4Vnt2rMA49rxUqLBhXx+oXnb
	jHyj9oG3VePfLUjdM4PxF7aL996dQChZNfTViT5xqVfWqKK1dqEvhBHzrGKCHTeR
	5pVGf48m1BOjBZufKnMAzhF5Bo1rGHu95gGO+3X0TO7ZYayHSxcL+/5cdMBFEC/u
	eMGGvXlfIvGGeLbH8q5QHspKsPSuxM65LsQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv03crug0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:03:06 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ece56bfeadso1662572e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794315783; x=1794920583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OALV8vUNInuby80JCyIJlfai0hgF0F+FwNbODqepVpc=;
        b=QiZVWoRZ6PV7R0nFyph/MQjzx86Dxu92HN4WaA4eeO6/5gtE6i4cl6y2ueqr1bMiq6
         bio0mEUHQI+IjJtSIC6kQW6IBAySY6GZuB5IujnLA009xhkeEZR/qEB/xsFSO7r5jUBV
         VrpYaFEtl0ZP0t1qP214mHba7oYFmzWZXEjFCTRTyIqml6Gv+ye9tQpBHTzjlViOPFoa
         HrcfBRQcWZSGUzcpQFX+L3ZEXP7uuLbvjN9XGx8vY3vHocXKEiOKxb3KuYGmW0cqfbWK
         5koTE4qa5cfZmFXqEkDVdCi7b+mqYCcHFpnIEbOwC9iGia0rPQj8YMXAENgKXkfHkJHi
         wJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315783; x=1794920583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OALV8vUNInuby80JCyIJlfai0hgF0F+FwNbODqepVpc=;
        b=2wZ+jtIIXxqSZj3F4rjJ22Jh9Q4YSptbjcEOllYEHscv7xhczJ8/TdYS6TCY9+Yl5x
         JDQW8brYmMX2mAlWfHCGRS/ZHyoHaZEqjPMfM+gmPLYrdtj0sr58BRp/dlINx2UdC+cC
         R2V1E6akLhFbazxwPyhIvXdaHcv4sp/y3up3RNAAoXPiLHmgzp8ImObt4S+jroAnmndq
         GTzx+4gJrcn5x+fLEGxbBdsVj8ZU0eFO8bdvadmIM7vgLLcItX7K0oEJbogPAFxZvGiw
         FBQqi1RhBTCZrS7KXOtOBbrABJU/NwJFeoxdP0G7dLzUYjuuZTSQmyKKe97wwvZuclTX
         68bQ==
X-Forwarded-Encrypted: i=1; AL+hErHvJrKBNlOeSZQxqSJ7LnBDUdhSLYqi1rwZRJr/NFh5ODj+m2aweMR95snKz6np4YsotSNXKA3h8XISRSw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8J0mi8p/7tAz42FzoHKCDz5D+3pr1HMbL+09A7IudLnXNXxg1
	p5gUWr+xXWti855toc+6R59prMFYTAHptpAOsZpoL1p3QFNrVTxfqEBWZpI8IY8bwmXrXrVsez7
	QsF4U3fYwsSY5QZJopHjgcnD2aDV+3Ap9sHcKJlzA5MV6NCZj84UohJW3cj0S+rn0m9k=
X-Gm-Gg: AYBFou0idKjVXU/HkbBAXJNl+sQfwQZ0yIpS1OD3fNkJLMG4RpCXBiEJWpEwuKk0GcJ
	ti8eq2Ssu74cqqGwwqxnGO8BfiYj8Zh+L809R60kshQIbrHEZyXVPD+1uFOJMEZ8Kr8ifsSjIZN
	KrVTMMASDafznobeB7G1SZGx+GxhJEGvDdmM7o9JQkG83U5Z8rCTJeSRSYPhcbHLk7amSt/I8Bj
	zhJbqcuPfT1KOkeo2D/64tuTC+ALVwieyahNwj1/i7Iqdft3ywCVQVzh4jm5LDwafhU5AARRvbj
	T7Yr1eG+eNYaj8FPCyscGI6K/3+w7NO9rT3J3kugol/7tCAo9LM3/5eVQRBLyK35g3+3TVdsD6W
	VvW8QnkUQSq9Nl++jp9xmZRu9Nvs9YUUIf3v3IDbWWNRDbYwR1VQeY76i2KnVXg==
X-Received: by 2002:a05:6122:8c8c:b0:5ec:5f1b:f725 with SMTP id 71dfb90a1353d-5ee0d1eac60mr842140e0c.23.1794315782363;
        Tue, 10 Nov 2026 05:03:02 -0800 (PST)
X-Received: by 2002:a05:6122:8c8c:b0:5ec:5f1b:f725 with SMTP id 71dfb90a1353d-5ee0d1eac60mr842031e0c.23.1794315781206;
        Tue, 10 Nov 2026 05:03:01 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0236f03esm49121585e9.3.2026.11.10.05.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:03:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: display/msm: qcom,sa8775p-mdss: Remove bouncing Mahadevan
Date: Tue, 10 Nov 2026 14:02:56 +0100
Message-ID: <20261110130255.134252-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1082; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=gnpSXTmvxtdhncMRhWieLAr3GFCRnWpMUR0hNvdBVWI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq8xX/gD2I5kvb1YaQbaK1Hj8UhSJ7L7MJAvGQJ
 7k1aiqFbcyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavMV/wAKCRDBN2bmhouD
 17/CD/sGFI/+wjlERaJ3BaT8xEiNlo4WsdazaWIt+yqGEwwmOGNnspemY6phkyMur0Ch/yEal3a
 a0tuhSFEl1ZsKnrVf5TyrKwbM0tO1fwW9H4NX6Zk5TFnC7IQGqlgM4UFFMgnD5TxKhZqiNQiHF+
 mW7ybexMFHJ2x5JAdfazGmya8YfXbrwUxGTFTVaEWdYhsocu4dHR3dcHaoKaUcr6Cjq5W4y7IW/
 ipdwwqFuB1NzhcwepfHTokkewlD7NKUmng7EmN7H2/d+Q3fsHye8RHRec2VJU5JfE4C94KLkNON
 zFaFlTJPRVevVce7u4pAmKFQTZoAbB0H5EoGP8Gkl4AE6yJ4+YGzKVetP69EHmnWx/NYl8rnwvf
 j51L3lxJ+U9QaPmTSITfdaTWdBqW8xSFHMyu70gYKdTTqQqqRo8l522iB3DQIaJEVyFdPhSBQnm
 9TwE6DQVBakI2u7Wq6BdWA4zuiXfLZbTRD48o07rnK12NIQbIDI2HBFj7uJ4/Jdkje3tQ2bGu/c
 f1F1d20nWvI1MipHiWB/kSDBH4TeA01f60/GpPIpHnxIKBD24cYH65wtnF8Dd1sHIeqxinWT4Ua
 iaMIHCTyW3T8+7TGz0Viyro2IOAlOrBa34uluDdzL1rrzjccOzXbGRhRZzaPv7Y+uoBcGUC0TqR /VlewK6oh8hBQFA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YzA_pkiWKmblBiPZg4vcxyuEPBLDX_VJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MSBTYWx0ZWRfX1y4/v/m0lPqY
 6NJ8y/tSQBfbZgSRF07ylmaj7lm6TrEfWRfzPYsXq7u8mQEeYgFm9YpkeW50JukTFOI0tB/nmFp
 BH6R5LgVTcwu0+FX7h1L7nBipzJketg=
X-Authority-Analysis: v=2.4 cv=FuiQbGrq c=1 sm=1 tr=0 ts=6af3160a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=pRY3rvhn6SD9K9aC0tYA:9
 a=hhpmQAJR8DioWGSBphRh:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YzA_pkiWKmblBiPZg4vcxyuEPBLDX_VJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MSBTYWx0ZWRfX07yg98OsnMAe
 tUTOVeGHpRiZadGuFKor8j6a9s34x4UQQIhFR/ZN3xbr9US5B5yxBvb6A01/ntXNlTv3MoFGKdi
 tEq9BM8dNx5kTPnfCLWZ0MCKuIiwKRJvvNAuiYmDWEHk2yEBzDeoQ5XjBmQ2sxGHbhXydkM9PRg
 NynmloETw4rG3hihiGBj/wjlPVeE5yJwEMIhHQTqnrJ6Z3I/XP9HyxXlkHOWqe37+cV4pq0VcKA
 mAzlMeWPnP5S4uPnP92WAneb2QWV+qOZw8ptectu3tDJUcSy848aQXrgI5hqwugCje2KKjsFvxp
 enUS9w4fglwdvDnZ6uZoCJX8vntRMXgROTxwpJKXbZaOz6rdmZAIQsWRsNJWfTGln5WlI9huna/
 J5cdD1XUWiNPS9zmR3L//LuRmqnjWU9Hyg8EPIQTUwSkSFMWWkuVjgL19fovKzYXoYghCasqJYq
 tYE7bjiIFdmlWYKgDJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100051

Emails to Mahadevan bounce permanently (error 550), so change the
maintainer to DRM MSM maintainers (Dmitry Baryshkov and Rob Clark).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index 4dc0055cd841..48dd897d5d5b 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Technologies, Inc. SA87755P Display MDSS
 
 maintainers:
-  - Mahadevan <quic_mahap@quicinc.com>
+  - Dmitry Baryshkov <lumag@kernel.org>
+  - Rob Clark <robin.clark@oss.qualcomm.com>
 
 description:
   SA8775P MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
-- 
2.53.0

