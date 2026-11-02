Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634806;
	b=HF6+K2F9Y2rJFpY7MPbe/IN6GfKDvGuR/pG5G4j3+Mdlm3yzwvPY0RvUTYfF4V4v0aHk
	 o0xqB3mfIMnQHbkbY8YWJLuaJ+Zyk1IPFKzybz4uBq1JC3zORospwnfK/Zuqtq+bOEkoc
	 GDnFQMZN5NvmV9owmqGX9ywoeFlSzurQeYkeyS7SEDclGWwVieJPkWwTSh1v4qIyj51Wx
	 nF2Ir8CvYXG4OkNtqSakBpV4X+vtAlO5n769HKgwqfzGGap6+KDojbzPylKL0uLHYnD5C
	 t8MV0QbyoHBzF8OYGh+F8vEPRFzJnx2Ffsz4t3Ighuy6DeW9X+4V2iLYkjK59+hiKQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
	b=AeDNQmTEkzbMvjkNMZwDPEhLNLhO/wg6rjhl08XfG9aaFwQvB7xDBkbx+YrJOgu/p63V
	 l6IlTMb70PzRb4RhtCS+/Jv+672cd2dNXxLX8uKESGtADFs0LCChYUfC0C0dUk3ociCtx
	 7jXOCzuw8Hf38r/HDLx1GgFRDT79a/TxoMoBuIZnm6tIzrUcpWdT48dz0fA98RAsYGzpR
	 tV+cjvu6TkiB2uBS8wqAhh6QPTqFBoBvA99Gkjuerf5JO6JjeaKbBifAqPW42M2kjDbHm
	 Yshkh/7o/7jntFcWLuCI/eTqzaWCB9hEe7iJETeJ62OsI9zXg9gGadAKaqBk/5vmwuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pa4dKkB7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ea8nyh+X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8C060A8C31
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C8C060A8C31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pa4dKkB7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ea8nyh+X
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpQgu846145
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=; b=Pa4dKkB7FS/RPmpr
	4MycTztlI2IEOMbUxMKoE2U1BIwIGcXTEhWZNav9AXAMbgLRbuRh+o/ePhzk7WPV
	a4W0EslWihwIAtEmhhwdd9WdslD+aiWIihz02+FIcEAgQg9GWA/Fyqo68zdpH8wu
	A2Gmx1UG5SkR5lkjYGPMJfCpE+nO+XiihC9unReG17IpHCJUgxLlZ4poWXV1w6i5
	FA2MZCew5ueXmQE6l5YH8bxX3asLSvLvBtz9ce0zRvLCvpu96UvdNrD7ea6fc5rf
	Y9tcrqfL6qSSKGN6nyMTDt3D9y/QFdZG7h7i0Q6mOc/qyLNqKhuh44qcH9bYq0EB
	Ctd9Pg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1tg38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:53:25 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99082f450bfso2495211241.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634804; x=1794239604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=Ea8nyh+XA0oeddX0lth30wFRUuW7ZmkKz4W3zjE5qGRXar+E81WnGSphha+OGvCyMt
         jLXmm9ncRWjHDlrK71ILiEiLeer59jxAzVT1IS9tki5RTwzh7PItCMHVtNGtesoCnhDt
         z8ckrzGzIgQUBs2wxo94d0z5tMQqdwpi7NKxV3x7NqAvZI1lJiOhWUVCEiOlW0V6NSzI
         +LOuAJbarJ9HtRrk40B2UEz75iz28kH2W41tufUeENumJPX2prqAYcgI/reF+CeLzTOs
         ocThDgh2Deq+e0px6F72jlRw2jib+mphad1eUacauBNPqwps27Yo2Uol+XexUd6tMJkX
         9Ilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634804; x=1794239604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=WMdkl64EOk9xUmURhowyUYh2pctYEQdl5MotSsAmnk1pPd0cXVPGgQPLSmDNbbcI4F
         fPop/xlkZ+K9LzpStpE42wTmSQ7Ikiwz4BQyFBEz+lItCXMxD3KRclY7GcJ0hQMt8wsd
         qvK0UNGnuKJZJJO6muGpcmcVH0SYDu/dVZuiwDu6kYPlUC0JrYwgduT9/2OK/NyFFGy/
         EJ4ojT/lfDavvA9AXmQ7kJZaUMiCAWQixviI/tM8ifDaLx2Hj9J/9n6TSnosJ3csefKX
         uugGHD0WkkH2kBTgo4q/Sq1tYXitqsQuYTn62a8NwcJ1CsfVldMyAgjctrDH9HG9+53D
         5T1A==
X-Forwarded-Encrypted: i=1; AKwUvBxLXtrSSyiME4Br3/sr35aR6tCXIbIOj2hTYbFQhHx5V9ncpWSgynRdUwPrHTcwxCp3Z2kp49uFi9DT4NU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vs8kpWYnxCmfWTfTvokLp6uqx310HNYVKrUJAi0NQULNFnmvc
	Z+1EQ+0N3fmn8OFw+60W3vyJ/k/2cbHGsskStnwGtwvbLrAqKyYB2ycgtmdlRXm0hrD9Buu2ua2
	dypgRG/y/roHd1AHexdkqhN8rO3vfXkBvitsPyTRS20Np/quO/PbcZCKCXpXt4V8pNy4=
X-Gm-Gg: AYBFou0fGTlXuyGT7J3rO8dAX5/LG4Lxjzl9DT4nE5FW4AGkD5QqabgZ+vI2jj/OLTg
	UUNJ/UAAqaCEUCXlstBnjMdmFl/fpRwbuZiwhjzNGzsrIDQveWB7d970+TNwjWsaVq3v9lTuB7P
	ttUYsLx2gs6Y5OAXIYPglGYGiIuDd9rdvgfkgrMkTcWAjJdkCnKeMdhJQmRwQ3+XMIpEpHNjemW
	ShV9xBvHFW7VhBFM0ctRb9EVBxz3JtXJkxYng9A/wQ70nhZWvxaQAinz/eO2QuCVJgamyhugz/r
	7PX4H2ke927HtqHAjjwLmCVNCaNb8aL+MtHTYYUNTbJgWd5/v4VPRvY0MSuN2PQGWFiYqkEfoW7
	YdgU+N9B1SX8DGXKeY9rOi8tW6jq717tmfPtT4iz4fSc8Zy7QbqYBEPefFfZMM2cRpTgsCN+lbf
	DVuNrQNYhf6pk/DlzB5A3dhXUmmuiSnMdUI7bhKHK8PqgH7HFyqydOou4GFcitwGnSEiOvfT03u
	TX8lL8HBEB7nn0km2Au62h1no3F
X-Received: by 2002:a67:e102:0:b0:7cc:2086:34e0 with SMTP id ada2fe7eead31-7d0728b1cffmr3143646137.4.1793634804341;
        Mon, 02 Nov 2026 07:53:24 -0800 (PST)
X-Received: by 2002:a67:e102:0:b0:7cc:2086:34e0 with SMTP id ada2fe7eead31-7d0728b1cffmr3143636137.4.1793634803840;
        Mon, 02 Nov 2026 07:53:23 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm20700323f8f.38.2026.11.02.07.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:23 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:47:34 +0100
Subject: [PATCH v12 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-camss-isp-ope-v12-3-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: mBqNKh8lW5rBYQay1yTHXs1frdpQZuFl
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8b1f5 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfXw9kxq1lQCNZV
 GWy1n60gtf9jEjMTIE00ZzXQmVA9D3NXTzacpmZEo27M62w0yu2LzfNoLTaj6ToJCvLw9buHAt6
 5YtnyE/ytwZQnRVgSYCOJvMleY0pYNfgKm9xjUcx2wqaxEyaw555AgcCPO8YZ2NClDRQzidnPgA
 Wke1XvU4194M4Fr1GkqMfQgSJo+jWpTgkHPhpa8y18m8z1gVNuOSF288lps54+G5JhiVaYfU24v
 kAieuC8EJtTdpWPaeuOqCjlLMbC2P3Fg0dSJD7BOBw/b6W5ClR3ImHfD21RWxViqO8Z/pygNdK4
 2g73vzoOozTfNO2Q3OoCTeleaEshH0Af5nD4MRC8Q4jzT/dhS4gznkDGX/ReHBRJddn/NRL7z22
 NR2e4a+HPAMjG14oNeAorK/0aO+jZSQGVBMllT9TlAMkkJVG99SqFZ/HnytFztauKlP3HZ81MX1
 KV07orNpnHUf6AABLNQ==
X-Proofpoint-GUID: mBqNKh8lW5rBYQay1yTHXs1frdpQZuFl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX0VqYqeswB49V
 uZdhjjnertBVrSv+ta6HFQEbVxfQlt0O+MOQ5m+9dAgTCpXREJmEfxkf7sLxeyZ3UyDCFDyiKHb
 BA4pEaYnE7S7Z1A4mo5Fx7zG61bSdow=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..3359581bfb13e918bb4efb3bc41749e60d772ef4 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,7 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
 
   reg:
     maxItems: 6

-- 
2.34.1

