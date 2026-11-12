Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487906;
	b=n7A0QpYWB/veNBD+8ItQZ1Qk6YqoNtA6dG0wa1KoJ+ux6I0IzzcPuR9kSxQlujn4t7b3
	 gzadYlSJGhRSjn+izK8S7XIcBDdkPrqk/FR89fFlf0NBYB/Ki3bvDHbNjS3lEHrXvZGiV
	 4W3dmadMSB6wd4U5Phs9z6rA5n0+93C66c60XJvosdTl7w4o0OZIYbUZLtS/zBgYtUraK
	 SmCzjU/laSN3VEnFy+V3eX6m55iU0ZYnXVoQ01nP8RrIOol6BkKB+Gt2rC2zjjCxOWNxU
	 5kZgTX21K6HjygN9SSMzx/W7MYWoM46pi6xX+WgTOZmmRcul0VLNj54l3IjZpe8epEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487906;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4KzwRoG5YP+rqPaS1TInFPrQ2vlnjrd/coRwFuyNkx0=;
	b=K1b80q+rEedPvOdQVgiltkSi7+RpYfkyDPb5E7MsjrxRhjMZ4N3FJMBNpSyel/6OGoge
	 F9wPFFd1x9uxbfEK8tB4sJq1bR1GtFuFtvZKOgLyf6RBS/9j35uYK41zyZY+s0D+NLAG7
	 n0qNPstVavhvcOxbB5fgD0SMGn2r2onkh+XfkF4aRcU2EZbzYnLQZ726CvMYrtmyznMgf
	 W7RD9vCRNis3NLs+xNUnRfG1jpcWPNVvO2DtJWS83NtjOBgweGEXNkXt3cgdpKMb3EN0F
	 XpT/Dw1PkS6ooytYVwCyFF+wjzwKv+vtigd+xvVfuwLQhn9mToffUxnwl8CZmIeg1eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AimTuc2Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHL1JtWx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96199606A335
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96199606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AimTuc2Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHL1JtWx
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAmoT32555635
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4KzwRoG5YP+rqPaS1TInFPrQ2vlnjrd/coRwFuyNkx0=; b=AimTuc2Yo9yJik+V
	+PM6lUNbKSS30/q+gCO4oJLZRjVqDRk3xFpQPxLuGGu5XzKf3gDfyyWjn0L3TB7O
	1dzsDAGOhNkftxBUeWAn1mxEtV9EXRx4jEzUBVhtPjnqDZL1uR7H1Pjs5WZUGb4T
	tLVs0jA6laI41zLrqaTCAjIL9xSBV5J1u/QofStmX4fshJUw0rJzBrYratRr6pcK
	tXyJ721YUIe1K+CGhzPxY1zBM3/u8ajzDDUKcUIhYBLLSK4BrkxdTOAsJDuXaGIp
	l2oQLVuMDwmbqdQGO2xNdnrutq/3sv9lT4qb1ME6mQFMtRkZ9LBcfrkivVvzXtOH
	DNOB7A==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j0cxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:51:44 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-83c2311eb1dso6332112a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794487904; x=1795092704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KzwRoG5YP+rqPaS1TInFPrQ2vlnjrd/coRwFuyNkx0=;
        b=WHL1JtWxsFZoY6QW+h724nFvARRjE/mCmVTP+TlGS41IAcp9Ypq0gjnWASBB8umgB0
         yAya+eq/mc0ZahVrVUcAItpQO77pbxgxir9VT2frV48kTql1XpC+Xb5aYYGILN3iMDGi
         nJwAAkJRWK67IEDobXVJGPG232XVE96QS3BLuE3mmZ0Tjw7PRfwpWzuJcjuZ7l2nPb0i
         VG5JF05pzO7ouzIehPBEoUvUG/uoW6zjiiSjEjWcufsXpra+qOsb6rvn9DYUVbRE6DKz
         raqdNqg8SeM9okhDPf3fHi9UL/E2Duc2ATBvMcu9gtf9Sw4ouExuUG6lt6hSybJs+gTB
         TMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487904; x=1795092704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KzwRoG5YP+rqPaS1TInFPrQ2vlnjrd/coRwFuyNkx0=;
        b=GcQC2DrxwU5qsjxLbLVItUsxFYD1o6T6d6GHA2PQBone+DP5UFsQN0Ipk249vflzep
         NWtrt6wNE1z+REoMwnZr2rWd4kgMZHFKRa+vHrGasu362CBh3VnloLq3ZuKL5L/8WFeA
         iYMF7QvhcWFYhyH8m8J40fTWiGr8hzJl1wmVFMk80aSAahpFdp1ZoT5wyyr2uMHnHpoH
         aZ+bzohKdVeFNNr6sdZ/GEjtXqfofrWAQUePFaRpEETc3qccQYqsiLN4X4jRjPNAs+jq
         NqzhVlO3RgdS0RnBdSVKtMNEeM9Hpv4Y63NLBORc7H4i8S3I8AeUpTm3i6KdMqsxT4xk
         E//Q==
X-Forwarded-Encrypted: i=1; AL+hErHasq/9hMSZoWuI1hzQEBnkQZqSwm+msuor8nL3al+0DZrPssQiKn/p/NL7qOWMKpaplMoPcxljxIDmN1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YQlzJDeDK0UENNmsDb/j9iWfZQjbfurfBnSo+dKHO1znFxJcO
	KzGC2DuLhtE4aeOB/15e1cKcK6r+sVRBZR5QBKk9iu73arsOF0rx1u3Skhin5I/L8LOQwOvF4yb
	9eNQn12Mj5yQBGHCWEKt83GJfUsvXfWsJJwk9jUZ5QNlMzRdWRxJg9rOdg6kG5MplzG4=
X-Gm-Gg: AYBFou22uJ31GksfS4FoUnTKH3aYQcrlDDTL+p0pKk1L9e8ztDy2Rk2lBPXRoPIrFaC
	PJ3nVxB8TwbjtUPqh8FlyEzE4HGnIFbV6+5HWp0KAAAdkWJ5kngzZ8Vz1efjMWhZ6PoyQBeVY8Z
	M+3aO5+fLfRUZCbxgpSMUVQANjtY4KBsq8XQN4+DJhEuzXZQTDOvnkyV68eZls5egnPPUnzpLP+
	HHV0yW6bGNeKXkaE5rIl3HpuQ9aqzjJZehntXCalNxxrvOsWMqLTq7x5odgIGhXlE9JaW0Yizd/
	PJe/TyvNewLxr8U2Vg2Z80Frcx4VpnlxSw/UjfnZYoTPzQ3jL5kKRkq0hVcTu36SMYb/RHfEKUp
	XHyRDJaBKZj5ussraqKjjdmG1z4w8NZu1kbwe4Im9O6yvYhdkIcTIQS5EP6enEDpPogAKcVeqNN
	HiECUpwA==
X-Received: by 2002:a05:6830:922:b0:861:f4f6:1f81 with SMTP id 46e09a7af769-861f4f620ccmr593986a34.31.1794487903740;
        Thu, 12 Nov 2026 04:51:43 -0800 (PST)
X-Received: by 2002:a05:6830:922:b0:861:f4f6:1f81 with SMTP id 46e09a7af769-861f4f620ccmr593973a34.31.1794487903345;
        Thu, 12 Nov 2026 04:51:43 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcbc7eecsm7608191a34.15.2026.11.12.04.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:51:42 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 18:21:07 +0530
Subject: [PATCH v2 1/2] dt-bindings: crypto: Correct Shikra QCE compatible
 hierarchy
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
Message-Id: <20261112-shikra_qce_fix-v2-1-2ce112cc2ccf@oss.qualcomm.com>
References: <20261112-shikra_qce_fix-v2-0-2ce112cc2ccf@oss.qualcomm.com>
In-Reply-To: <20261112-shikra_qce_fix-v2-0-2ce112cc2ccf@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX3pgMekMgqD69
 bVl+d7VherYwTaAq1q9bEpPoLh6VMDuvlts1kbhZWKeZCfnB1tenbsNqdJqva9iuQ6s/3sIuqG0
 oajEvFuamdVkEMdqaEWeYVeLwTitdfg=
X-Proofpoint-ORIG-GUID: yHbKRxffDmAILBNZqLIqSx8edsO22I4I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX9FSzg9PZXtOO
 xKhkl2kMx71V2Mr0YR/sVRdcCldmN4xCpCtVD3wNC8MzU5MBM+0q8aOTm206oMa4xY8XQcTSdRw
 wRimAQjBGBVDMKe6QbXxsx1V7vn+X/dqye3tkbJf0u2+CM+OCInrOruDB4GBoeX76o01aJ1bfAg
 IPHCp5Zh1L5y7SVYx8zi3mF8Xs3eRXhXOVwsBmSCavalWRX12vTXDs/7755H72DlI+hXMgXXzIp
 0smKzvuZxSblNC504MhMzM/PPk40cPzbLcNmpWQyPo0AVuDyHMbjKcVUiv1c9zqhvJ/d3fhlHJA
 v93e9odKu4rohyFBC2M8v65dVM+nwY+GZoLl/JzKmIaiXFIUwGVsryQ5FcMYCOvq25Uzw2at+pT
 dUWSHR0DbtVsuJogXip4YIDEQ7ZIq5EaaE8CNcDLdDkKuuggcbiT6tL6dy1Bxexme5LqOcNf1KG
 Fte6S6sKz4KvHhGzS0w==
X-Proofpoint-GUID: yHbKRxffDmAILBNZqLIqSx8edsO22I4I
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af5b660 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BEl7XTdPtaVR2fHMDO0A:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120051

Shikra QCE requires an explicit core clock, while the existing
"qcom,sm8150-qce" fallback allows the clock property to be omitted.

Shikra follows the same QCE clock requirements as QRB2210(agatti).
Update the Shikra fallback to "qcom,ipq4019-qce", which requires the
core clock to be specified.

Fixes: 45834ff95a6f ("dt-bindings: crypto: qcom-qce: Document the Shikra crypto engine")
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 5a653757ee75..fcf725bfa36b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,msm8996-qce
               - qcom,qcm2290-qce
               - qcom,sdm845-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
           - const: qcom,ipq4019-qce
           - const: qcom,qce
@@ -54,7 +55,6 @@ properties:
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
               - qcom,sc7280-qce
-              - qcom,shikra-qce
               - qcom,sm6350-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce
@@ -133,6 +133,7 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
     then:
       properties:

-- 
2.34.1

