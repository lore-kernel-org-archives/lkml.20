Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253A63D6475
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507953; cv=none; b=q77Y4yZQt09vg9c6yBwA+HtpA+YJhfQgxtfaYqY3KXOOcdSSozgH+R3fLQ8GCg8oRt7E8P7694HIy/5s8WklIGmTmHMZVYJk8k84n+EY5WAeHcnXTS6yvuZXx6HD13o57x4t4hbS6m7Z8yyP6/liu7NoTDiGSQbNJAhpY80OnUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507953; c=relaxed/simple;
	bh=nkM2qt5R1/uUPdCckueCKlJxJ01JG2RhAEHpxcPs2t4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YV56k57rXERmymHEyDK12t8wcufKWepIV+rTl8bI/rFHJ22A8/hXBFWf6ft4hL9aEmrz3hg8HiWWwynUcQRx4NSwhA8bQGkTjQnAo5qgJ1KF+daoWl+PnbUCtF3cn8VpaAzb9mWy1TjjhvPkaZTo84REPqzDgVaI2/Tgk33UrBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgY9HWDk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KOcBBkW5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgY9HWDk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KOcBBkW5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68462b6j3007023
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 07:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XKTncCRMH/pUckJkjeysZYspaWdgUPV+H+N
	Y0DIrMe4=; b=QgY9HWDk9emaCdPY8/Bdpc7mHHcRZjYWOuOhaGRv1XPQWHC/pt4
	br2Q1LEEkBaCYgk/8G6lJvjWRHeJeglJDlAyO78yMKB6b3RmnyIj5Y1hU4YJc4H6
	UxXFAjCDddpLEsJ8zjVAwhdeiL0YMWyHqj17BgdtK0xGUVp+v5g57UKh6TfJdqz1
	x3rTXKMpGOCH6A/fp2DQFlL6g9uYY0XGeW/qdIIclet3uqp4163/O6rTBUS7dn8A
	rgnFEQg47qrgkkfAPXB/VUmxzSwLpx/u79syrN0ecSZmJxhQYZjYBGe6oICPqA3V
	m5B8kMWwBFuAb2capvHBWS3XFQ04Qv2eH9w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp0r0rcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:45:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d959904658so13348055ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 00:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788507950; x=1789112750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XKTncCRMH/pUckJkjeysZYspaWdgUPV+H+NY0DIrMe4=;
        b=KOcBBkW5deB9TO6KYO+KUvV76T8YC4RpBgh7PvxgXrFpGb7a5wp19ciNErfuVLweBn
         vGX0qO+E2vBADDJAkVXUvsdH7BytQnYVMj0cjuf/+mV96fvHwgpCMMfE4lKWl2XohrIP
         ULcUvNCp4yeZIGEq7XGxFdDYFDOHAKshZW93rdHbMPmM0opZGTZwlLByBocv43P2cnk6
         /v1s26tEopk8JTGyWmk8Oi5xurN20dT/8BBzgKdN1RNkBrZCD4vzte4MbbDzAQysrHMb
         LsO30ybIsAwO1VDMplvOLjd6ACjJ860Exw3lE+kb7Vm4XOSYURY8qTqrojZW/ieQ7wzB
         4kgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788507950; x=1789112750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKTncCRMH/pUckJkjeysZYspaWdgUPV+H+NY0DIrMe4=;
        b=M4WEnObHPiZQUYFACdQGJDt7gOcPWZcLFcAF/bMl7i/48gY+qDOyxZeoT6POnBEWe/
         2Mvk5zRLOlpC9yVFyf6T3kjJdxv9/gw9CDhqp2WwJXbmpIjNp4hRAgOhGR0nb8MQRcBX
         5HViqDbJPQ4CgI/4wGXvZTPYcGT0D+zFOip0vXwLjAhHEeiZ91z9G4A7emIcCicK91Nt
         qqsM/Z7BciNY/qRzBgE7jSVQeGlVWlnCe/CxST2JN+llQwTbjLe+ABPxx27mt9vp4M7n
         XgOVsp0SHvwSw6ZAMSgt/7mn37xeM4qTOBUTl3FBdA0MbCxsyVTV5OKIin+F9N+zhUXC
         uBzg==
X-Forwarded-Encrypted: i=1; AKwUvBz780j7hz2g7NN37NzXHeEAfZ/8PJY2R279xqRJ8llmGmu4KF+uPijWbKXlx4CAi77vniKPXN2ebhslTP0=@vger.kernel.org
X-Gm-Message-State: AFuF++keEpSPNMlmbK3iXHtkq2JZJoe48PmPaLAOveLATNV0kYoKkajr
	OGtOfcBsxSUYU3tyVoJTHG9mb1M7scxwitBZ2/Kw9hCZYbeAOFQvApOFjt/8SkG62zMjPpNgcEk
	wlJZ3NzFeMBilwwlwh9JN3kCMJhmtFFWjY1b3IeTnIE+VB4PURq2gr6+tCu/NDT8iwSA=
X-Gm-Gg: AYBFou37+3SerjWfsCBQVRYFmyEhNRDibVHATyzZ/3pR13TEvk1DGF3uXUNe9PMUWuy
	H+V+oKhq4U0RByhe9ly7UpDJPDk1dg5XogIa8nlXpBiit9PWaihaPvi9kqy81vUSsqlupPwkerZ
	VjBng2aXOrcC2r0a5qgQ9DnrFCMTxGcr24HVsOapiF8N8G1RFRucrRJOMsKAVhMVNP+TRr7MOcp
	VjeHraodz54KDlGx/41Mtpx0v2TrL3ls2T7wo0hjj+4qMPg5owr+Ii6LDOuH5z+C/YE4GFQFknz
	0UtB1Hmdt5gqrUhSQQjCrLgUpfdGOsa9WtlzhQ5K23rrR8hf0F+rTBzM/ijFNzBOmj8waCjxsJi
	4wwpxozi8zMdayAnfhw/nEYWiWDTjeQTsicBG7d1p3pn6wge+U+g8/fxMFu26
X-Received: by 2002:a17:903:46c5:b0:2d9:123c:8c49 with SMTP id d9443c01a7336-2db1975804bmr37599935ad.14.1788507950008;
        Fri, 04 Sep 2026 00:45:50 -0700 (PDT)
X-Received: by 2002:a17:903:46c5:b0:2d9:123c:8c49 with SMTP id d9443c01a7336-2db1975804bmr37598965ad.14.1788507949336;
        Fri, 04 Sep 2026 00:45:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm5130365eec.1.2026.09.04.00.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 00:45:49 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: rtc: qcom-pm8xxx: Document PMM8654AU RTC
Date: Fri,  4 Sep 2026 15:45:41 +0800
Message-ID: <20260904074541.590485-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3MCBTYWx0ZWRfX6jxx8IHm+ZGa
 901PAR8EC4Y8l6FOMRGT4d+tVCCvf1u8vzWD8wpyhocexGagCT9O/1gH77dMj3IT9CoBmLz5r9X
 Z8MjZYI0yKmoTH9sfarxG4VpSxO9Ycc=
X-Proofpoint-ORIG-GUID: z9FtubuB-Mudct-rIwHWFYUTTYA7xC2z
X-Proofpoint-GUID: z9FtubuB-Mudct-rIwHWFYUTTYA7xC2z
X-Authority-Analysis: v=2.4 cv=T/S8ifKQ c=1 sm=1 tr=0 ts=6a9a772e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=yylTr5QwT-72qLXmsWIA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3MCBTYWx0ZWRfXxF+E0KYUGzj5
 JJkVTEVZBJ/ZhjEGxFUsvnb4EpjuwYVhyqpwb57pgvxbSS7r+kFNOD+7p0w3V0KDBBPRbQ8IjMy
 7s+dG90inOofIa/YXjtmSoJHf4ncAz80/CXqIzzoSqWVIhlkxmyZgsjq8p7wi/p58f/w3iYNB8e
 4samldyb+dsWXHBxziez4dfeQ9B0D0RaT75WXnB/ViR9JDYPDiIPJ4hC70qcR+NyRuyYD8TJ0aX
 wEr2pULlvXDNrQWudEe+VWOazYZTND1Y96aPMhlTP2/qnX/SJ2EzPF7Nmno0OSE6gi/6J41Yrc9
 +32xCEe/+QWpbn/sPnc2JZPPt+bbMYMxqIcH79gJbBh+43ccZXVwel0k0dn1qDzAVP0atAscQ15
 4/bgnZJVFfbeFyWK7nC+QN9273ik88ojb7CPYY0JbSYp+lvMXr2mjq9lqtiPSTzKpz9UFReX0rk
 km1ymg4RiKA0f7rCsFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040070

Document Qualcomm PMM8654AU PMIC RTC which is compatible with PMK8350
RTC.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
index 7497dc3ac5b2..78fa1d5ed028 100644
--- a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
@@ -17,6 +17,9 @@ properties:
           - qcom,pm8921-rtc
           - qcom,pm8941-rtc
           - qcom,pmk8350-rtc
+      - items:
+          - const: qcom,pmm8654au-rtc
+          - const: qcom,pmk8350-rtc
       - items:
           - enum:
               - qcom,pm8018-rtc
-- 
2.43.0

