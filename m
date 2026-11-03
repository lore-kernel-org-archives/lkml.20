Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736359;
	b=AEjULjdFBHVRblhyKmN3S9ZJP+pWqYUEe6sGChT76f294TRy4DxmvcIcxH5YQS7jY6pi
	 wqUVUjrph3JJatcrKIgBTtMoTPwB9A4KvdMqJ3gOpSvXEQP9RFs+i1HRYBZyfhQEuh3PZ
	 nihWq1br+rMKU4xQOA46eTwALnCTLBCaZq8AP38vrloY+jS3fjn9t9t3RO6l2+dU07Idu
	 qsPP92gN2C03CLy89TsP3mrHEW/N2UHxmIiXtvMp6nzocx4Bfb4ZEDt0JpX2mZRjiWf4V
	 USrKemxOeoP+HvBx/CVrZaMO/w5mrgLf0PNTpOz1MurdueQvM7QNcbOrH3Wl3DLC7ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736359;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
	b=pnb/8KL02eB2zPBJR6gNZBdfU6YSBrXyWKtnNxhY8s/Mrf9/YjQ/rwictimsvJy5PQQc
	 2T6S8Ox/vhU1QNZ58yQac7YQPz5xfSq3hYUjiEbgMu9ju3xipQrtnRoytVSVh/YG/Vqzt
	 GAxsJf3B1DOO+2jUqiOK/G0n8b4XU6kL0p55DxGwePpn9pHGDn2UBFpHU0lBZxbeOo0gr
	 /Z6bnvHD0HU1ErjRHN8SI9XcgWSFypsm5AO0ldte6YGLd11fK11SZGpIBFYmRu+ylHz9O
	 rW7UoqP9xr1ZDGsInQGpl+6BJtMVhwKRsdge1l07fypMyEuAkwvm3zIXkNJ3vhORQLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d5Iv1Cnw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OaepFRxH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4A3606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF4A3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d5Iv1Cnw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OaepFRxH
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IpgR63673778
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 20:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=; b=d5Iv1CnwTgATZ5kn
	F2knie7kyfihVHGZ45g6zCc5TeK6vVdIDTuBIlPZaKgw7W/k5PCd0iB9gMIbXP+s
	H5yYfg6mwWxb31EFFRDeoIjIfv7JJwuL0QC+WTvlsstRD/fAsjVklLA87IPucSl4
	NiWYUlOiLnalFyDo930YH9B6uCFUSzvXuYBA7iTu3784Be31kmkfRtdv8bAtS3P7
	Is9DawMStKYd0+jZ3HopCEXbtkf+Y0j3WnI7+aBHH5G7ssyFsMJo3T/IN+06KBPc
	J61tnRAxyDhNhkJBgPvqprvtodC5t1qBH4EdxORCqAyumOWGWtdGxa6DWjVkOm5Q
	+RpWZQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8ng98x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:05:58 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d07a14a71cso3631842137.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736357; x=1794341157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=OaepFRxHOzH8r+4ygD/AlHzH47tHJ1o746zasJWN6N2zTh91YFgfazPWcfv9qgTzTZ
         POeO9ury4U7PQRD8ZJyr8XCOvvl7Jd1VWHRgqKF+oa2mLbnqyvx+K5Kre/wvvKAODq+E
         pcYIWgyF1T8nqacnD+wS+hEa4SfegBJV9Rb0VhbJFX45NpbHxtCXDovURo3Je7uVxQOu
         +c1clA6cefc/N4NSlj0YWzdJa6pK5oNN8HwrL6vM9xL4l26IVATZlOZ3XTHDK8FvUozl
         8VhYVveewaYQ5+vgepzl6gZv5liGe/z3LmZ/kLQCH6nf2OuQ25MJ+LcsG7hYBglrbQtH
         en4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736357; x=1794341157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=f3b+RT7P+gbmS4cUZXxJttNyeQauvTqWO7i1tRBRQtoIIjUgcBFdiqbLvjKhezfPc5
         iFwMHubA6j0z10LFcqRZxrBztqeMNBWDijqNtDj/LvIfCZp1TBrNduD3CVWAWEn9gtJD
         g7ARyV3pqw9aj61GJlmb3Tw/+D3wY/qxcUrFNOf0coCuKaHLfaaHGfi/ksXd+Uq/zA1P
         wC3Wllgny6jZHbp8obUICw6QyT7DffxKrwUpbkDAITDid4KiW5pY0AY57BY/VkoNvtdI
         wPGeVXnyUEg2Y4Gc3HIKhAftCvuZM9eNYSQHV/3sgO6a7FkUl81YgWereHuWmRglFCgu
         SMug==
X-Forwarded-Encrypted: i=1; AKwUvBxCvPmWiRifjKhgrMPlXkCY9CSywuuYpZHOce8d78h45ZsSF3fQrxq2NKRNfWvUe87uj9R3xBAcApj2/u0=@vger.kernel.org
X-Gm-Message-State: APuU4Z96EQMFGLAQSSjW6yn/J0PPX/k0ehWWypI53oRfrpwlKWcx7I3i
	uBXc7+dqOpTlG4+D9MKL2fFjoBaYbJTKHQofvqRMdA/VnH9CFxn0cSoFpTBbgZCVC8s7I1iZFcc
	32uI8CTUShy8/N/IG73SV+MFct9txUUd/GNk3yqKKMsgsY2vLdigyTvSpih3yLemvsm8=
X-Gm-Gg: AYBFou2ET7seg7tSanm58maxBWiifb87OVp3q89SzLJDuVAD/DQEg6RRnakqavtjxVL
	0KN7RDWRkHr0Z60nZArFcsLTpsqozXewABlNo4IwI96ktVRN30xYt0Blh/V4GuzVlAjKWYIW3O4
	K/t5LT5TdbFd88OwxPyhT5Do2c/i3bMpPlCAIJJuFAwp0efdG5uhy0wYEw3ujkYYbybrpr2L91l
	HifDYo9yGSjGP3k/kUU0d49HigFDAW2CgZGDqm0HesH5Kv2o89AoTvoV3SNXL2oz7NfU7+K6Pc4
	Q9Xro1Dy4nPJGNy0WyWHdFK192sNDKs3nuYXOS2qxnuBUXCUys3IDYq2ep9Krhb8kbfpmKj+AsV
	m0UEJFKUS7EncCAy2YWYRkK79d+hZZqFabpqZntfXZN0CpBbXoEThPRUwDz3p1LrOL6h7A+y4oz
	EHbIPW1/PkyVFxmsEFd/ddJfgUU2qEuJPR9idm0TqHQqpvzLQuSQ8okBjuqEzr6LgnqahBIQJ22
	5UgFZDVzXyGuptpOsjH5PJq7cJ5
X-Received: by 2002:a05:6102:5810:b0:7c3:39a3:f65c with SMTP id ada2fe7eead31-7d07226defbmr6266301137.1.1793736357111;
        Tue, 03 Nov 2026 12:05:57 -0800 (PST)
X-Received: by 2002:a05:6102:5810:b0:7c3:39a3:f65c with SMTP id ada2fe7eead31-7d07226defbmr6266274137.1.1793736356506;
        Tue, 03 Nov 2026 12:05:56 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:05:55 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:47 +0100
Subject: [PATCH v13 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
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
Message-Id: <20261103-camss-isp-ope-v13-3-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
In-Reply-To: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX1sboF63bC1Di
 imawc+zDfL2F06Dt9wplDUxZnCryljs9RaU+915B6XkPn4fXCnkiIgEBEg/f4WCtYAid+JEVcah
 857O5NEaIil9K+mKbI+hOI0Z+rtfeiiaLVw9/vqRrUGgVfyT0L5SXgJ0klq5xSSc98Mkyz5Bryt
 pMzeo5lwn6YGcDskwUZHqrPjGwDYvcmnxe2PEWAMP5AJ1NBSQV66OK5D0X1BCkikXWhHif9yw8p
 RHRJKFkA9cwcP+KcHoGe7SB2iRxDQbvPpE3hB+n+Ze3LCPFE+EN3WljfBfL9OJ9id+QD2eVb221
 tHTIE6eGDrzeZp/IJivLy6uF5TOCpd3pEOgMKtPjIA7sQKMUIS38UiXcXkKnxAeUN/mJZ0qNdZV
 AyTBU8/tZjaZXbYr8wfSqZzZLS/uVTNgh+PVvn9hy0ZEynRFsobyBn7Wt/AwIp4tlBrOvkUeBX1
 UMa4t/tssCPXC55H9KQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX2tNyqt9RZ7OX
 WUEpbjdSnAz+ggbUPgxYwE6MZJ7N5tZslJrZM5SkdXKHlCIEit9GBpmfF4GHQEoNfPPYfXqzAxq
 wxrqoBlAZwGTmtb1KVDTmYDxIzpw6Ug=
X-Proofpoint-GUID: MgRKjVmyRv29wWO3A-5vE7aVCprbtxux
X-Proofpoint-ORIG-GUID: MgRKjVmyRv29wWO3A-5vE7aVCprbtxux
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aea3ea6 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030080

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

