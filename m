Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953542;
	b=kDohmr+xBLodyZ+vGLpZ4vJwtWoxRjus2VTZ4G9HkCAiH2YR6i/2aX46c9luIdD3Nj8m
	 Ka5vjRRfzuvKB78bVJ/i5XJIxl9+bGXzJxp/V2aaNpIWX5KRBea9dFZasZ4SpDFNjZfXn
	 bcXEZjm98kPpl38eaKGt9VXecO5VaZrkXxq5j8rqhpDQzgpf5DUQOm0R6TGAXwFlSQ7I5
	 sS+HgeX06utD5ZlHqCcW86nvdMKL61i87oQoHnjuYTYDZnj4kFrJcAxHnwHSdki9jFYt7
	 EU/LoL7aLCeuW2ymhMMLmT7zsTjZ8DAsgf/ZNkDDbfFEmGC3G5NegGz/UDXFZqnj5Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953542;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
	b=ox07Ds/XGGlNKmr4nlNqdpGixQ7eRkWugvxrkFN7kVNl2bKjOXm/otf06DUOTmX2Bs4r
	 fnEKfcCaNae2gtbXaxLGzZuBMUlYNa8aYOLhW0jmmtZU5adGD0LYgT0apWGPxg361jYDA
	 4k+NOthIoTh+8R0RvkdOpMmUrOx8YP6siAw8wGA+naO8gruJSeyj0pTPdHLoyzFTHlyOq
	 VSJXiqWBdE7kLQCf0GJ3fv7Mr6lv7O/7DrM6/nsUSPyufPEl65p3kaRiizGP6s2qtZysw
	 ZIc0LlyLfRaJ1DAkquW0b40p0ylCuHJDdBDvH/4UrIS7t1NwvSlXf+4ORWEswbhgUSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nb4dBQpc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zvx9t0t3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841DC606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 841DC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nb4dBQpc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zvx9t0t3
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RlWI3883435
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xtBrngpMGCe
	Q6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=; b=nb4dBQpcclDhdFZH0+sibeHUTGO
	TQqHVBm1saZQDojMKIWH5sg7pqbDZBmpqp4G3nu58L2s0l3r9nn/w8lZgu8wZ6ci
	9olI2LL6MDGIsy5VtkAtShcbh6T/eHFWdSx3gyYiszIOG/eL4Bb9fb8KPAmcbB1m
	jwigN+hiNKyFtOpczbHyANviKXFFHr4s3e6da207ft4B/1WE6+fzc6Bko29jfFOc
	kwvGfsYng+CwsxhOfzlnKZaz8gzEE3US68zmEnPy8QFc8KVqDBF/yxcePFzNXVTT
	BBWY8lLRiReV1U5LYv1ohK4gIhuPn+f5yvh135MVXj5jJDmIZCGquz2Pr3A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pb1upw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:25:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso308976285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953540; x=1794558340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
        b=Zvx9t0t3INy99PSqbz8YgF19vLw60ALAmtA2ESpaHKS29oDotfcMcNPL6IfYK5CIRr
         g3ITS2ckuXPDS7Q/EDTHkfppKoJkoYCNeS/9h1/vzvvzhFbcNmzp1HkgaHamUloMtQED
         BRgCaNAQyWDbQPgM9Paxwmm/I1MwzzLeFHJxY4q1dfLfkEG1qZ9qIpySEksGaVu4etLW
         82jVNB00K/a3Cffw7C+ATyaJ0Rj9UFWDj+R0/LnCwRbqU/Poj1D7DRmVtfNNLfB+xfGx
         8BNOnqwGI+oelKpZE4/gW7P1eeKMLdvJogR1FRf9vGIuEVln3eck9m0kdLdwRboEt/IF
         H1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953540; x=1794558340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
        b=HNmVGUF2oOuGQ5obvn0lFeyhA0IN4W+VV77A1eai/MyzihV4qZgEqSG44zVWicm6IO
         TSDr1noTiF350OB/6+rc/VAaTTdXqIATfSvAnVocovVBPg6uL+tGecoIKg3dd6h1ce3A
         PQsZ8BVqyuhZ6bNh61IMLCsdNG9JpBYoX5gkun84eFIwTfUqZg9O3kstb+nQqjAsQ9Bm
         l8yL4s8qxDxYcGX4ZV/OSMDVxVJ/S0wC5TNiAe6M0Rh01+Xp2kOYI8JNF0hZaCl89gBm
         8BeAkoWqp2PuNz6z0wOnMH6W0LCdSRScMsAwYdrGrmxfZsZk8BJNh9HHfWZL2ForMIFz
         RKZw==
X-Forwarded-Encrypted: i=1; AKwUvByy9xu4SsKU1yx7LowYuJUm5/aEsBg2C1k7SGZdqAgcebO8bcJ2WTjacdUHTUa4+RabyUGAIc6KTDU5FKg=@vger.kernel.org
X-Gm-Message-State: APuU4Z875tfIi8pgDy6fgfG3Ve6m6+0vNLiQZW0/7y1Err7VZP3PVdLF
	vhOxTbiaEtrkNvUG/nT7gDwGrSmhBgexajE26KcoRV4XDX8mTimsOiZVWtVQf0Kv5P8q6NYh/37
	67JWBMVQRnlqmMAwqlEVxueHYD/6q8HZZI5RCOb2ZSFS7XaGDcDn9OqvPbOp76GcgIgg=
X-Gm-Gg: AYBFou0M00OjlvqEbWRn01OIZ3HytVQcmPnunMU9KUpCkOnjyZCDe7fVliOQo4/T5mq
	jVUbI4zq0P+/xxSBYFykiGpu9klOYcQXcxxflOqcqfMnVsy5v93Eu2hG3sSitf5OH2ykSUgnJYx
	X99wFV51TTKAWr9uuz4sn0W29Qk3U1UGD7ZyAu1bUn2nBSePx2t6oIZhYQAirt/APJ/rQx67wpJ
	K/JRcVZMPFFeIT5NoZMt5ZXcYAASIzNRGjBwmjKAHoyjO201RBrRWuhDAkj7Y1BxPTJjAG5ALDx
	2qc9hTTBNZ/XzA7YiLKbPKb2sZ88LkdKdPv8kwNiM+Hk+D7Yp+vgFygclkmM3gGAJD5Bw11/dz5
	whtQbXhULs4x9tg2NG0uGO/XlqobCTPHYKFUSG5s/cmn4hnbT0IE1b7PUUKtJlR6UlGK1zN+8LA
	==
X-Received: by 2002:a05:620a:4407:b0:93e:5677:317b with SMTP id af79cd13be357-945e174b3e7mr852292785a.25.1793953539834;
        Fri, 06 Nov 2026 00:25:39 -0800 (PST)
X-Received: by 2002:a05:620a:4407:b0:93e:5677:317b with SMTP id af79cd13be357-945e174b3e7mr852290585a.25.1793953539438;
        Fri, 06 Nov 2026 00:25:39 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:38 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 6/8] arm64: dts: qcom: qrb5165-rb5: Enable JPEG encoder
Date: Fri,  6 Nov 2026 10:25:20 +0200
Message-Id: <20261106082522.1448390-7-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rOs-ZdrVXRjRH3mVyEs8aWekZqrzCgFO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX88RLCVc0kY+/
 KEeOv3Bcj7Oyu56gMm45pwfMFZMpwwdXoCR5JY6m/FnIs9yjtCJB/iT7U49VSz3vgQa6qw1cWr5
 NuTh4veqDHg7bVC75r1mt/jxHrTgVOM=
X-Authority-Analysis: v=2.4 cv=LIrz05W9 c=1 sm=1 tr=0 ts=6aed8f04 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=YFy_RbSkoLDF6nbOkSQA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: rOs-ZdrVXRjRH3mVyEs8aWekZqrzCgFO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX+6lVySBq7OFF
 04/Mu++TDQN2MeRtcB8tlhRjo3EPJ8hCrCJhUY3y8pPC2GyYqcE8aGaO2fctS+lfa7Mof4dEBjz
 7sGqCmhPZnn9lTntEAg85ALUpEMq5OO0HBVlGs8QN7lUrs1R9PAvXqfQwfZo3NBv0yuTNWwMZNy
 hOYLE4UxlSfXirsFd03Hkd5wL5PcCNrRJiYcpWIYGYc6Zy1dqHUVjjM41lYtGBvOW3B4Zqf9fMA
 Ls7xiGxB8fYwV7DpI9zNj4Aoo53YRY6XBYKETEufzRlbm1hyyQSHjLFzVj4qxsBeddyL5LvIPkD
 AQJQOLwT7giBAmgbef9SSwFZX5tjkk/cY/rvULKodQw1iJkf9PJ5L/MOs3SAsrMt/+eBzOiTki/
 oCi7aqh8u96IH5z/Klf8yd9Jrxlakmt3XaKRxMjnRTfLGS4Qqg4Ukqm0SLfugKVUlqOORcsswSw
 hSjtwFjKouHvkCdCrsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060033

Enable the JPEG encoder on the RB5 board.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index d6af679abe1a3..949328806a9de 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -668,6 +668,10 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&jpeg_enc {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };
-- 
2.34.1

