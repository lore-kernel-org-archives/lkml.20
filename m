Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897288;
	b=uq59S58iwTAyOS22UWhuVlj7px5HeGCYotodXHoHGvOvP1F6J0oPLjpsF9xSwyiBbzSK
	 8Ra6Rrak5K6ZJQDku6M7mtIdZvmeMy3vVoRrlVTlDgqHuxuTZceGvWs1eD7WhtA2JdrCP
	 LvVMuzidI/0DS2K2QtsU12PSqJAKrEQlpXaDxjqQThyj2Qv9RtPGEdBQ8ljxrbBPCdgfe
	 fFoA7Y4Mj5Ypf4fvds9ScJj2GGvCqq0r/U4rGv0GY/Mr0cKHRhaiRbxSiF9k/aGsyRk/A
	 EmHqxHlQ66T+Gmix3JCMm4bsduzfH/WxRvzWKwyVbrsuKZFGCGjL2KvOGXv48TMiIyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897288;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wPvc2pJmj3uvOPPQhbVmgAKXLpjRqYT7Sq42BxhEfNc=;
	b=yRfwpy7exZ7cXpsXFhq2Uyb9hs6e5lvDbCevOx78qalUvPQ2Ee8Q7INowWhgNtkiBQSf
	 ExZ8EU28l9fWFvJlYRFLhX8eSZwuNaOzH+9QN3J7wypmu5u9NzhKolyS5Bry5/i40I/NZ
	 cG0asope2lyRQpKqWhDWl52g4S2yFbvA/0x0ma3E2DF31zMXDLqEu5JAY2SJxjoc9opTn
	 11dL83G3t3fS3yqRCcVgp8IKtbQOwjNHRJSFyt9ZqVFKd0XlYit9siKrFxzEh6Y+vZIyS
	 DB9bWj8Gk6M9oOTZv7fvkYLXhPf2pSx26e6TkU7d78UIBsEvKv0et3kn2Su7i0fWzUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hplfNUYI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g0q0nvYp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26B7606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A26B7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hplfNUYI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g0q0nvYp
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6LqFr3980776
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wPvc2pJmj3uvOPPQhbVmgAKXLpjRqYT7Sq42BxhEfNc=; b=hplfNUYIrkS5lLFO
	ikP7yKjU66vTaAm9iesw1Yn8ux1tqMu+ZSv9YcI43bs+11n6DH/h7euySh5E3MPr
	kyPzPP1WdIqOJTuFuUEVAnlzODtvdEn6tLeBjPlqwzf7Ha+Vr8qKhMNjARJPOWcc
	qmKxyTtTYh1ljlXBl7fxqr0cEJz8mjs7VuQAm2pOm3NatvpqAIutMOkBzTmvfIyz
	QFsM4VjfsA9W3e4HFCG4bZAeiu9TY49vUb+HLl+PdxKIb7ZsgTM9Yg7biagtVLMY
	JJVXwxpthZfjZRi3dxJ7JI/oJtK7BRqkZHR2M2Pgjn5jodvWIenjz07fj2kMYiBE
	LvqjcQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd01k6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:34:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb86c39250so2237955a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794897285; x=1795502085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPvc2pJmj3uvOPPQhbVmgAKXLpjRqYT7Sq42BxhEfNc=;
        b=g0q0nvYpgkL78uUZCkBR7CmRT77W/W0ugpCjBAs3P7JIFTaS9QM2LOT60Wu7gKArUt
         NtFOukgSFMKqRy4H1gVhpZj0sx7smCGa9W2AXZYZsgMjYWZuTKfAXsh85Dl73sMsmO7S
         0F/v+XYCBMATDrekO0Tk6+cjHYocS6rWKQp6+1FPOvYLXTLkEHEB7Fd0rqrFwUseIx6X
         c/8NY5qU0TqJhooHmMGeVg+DdJzUBWki5jviRC3TIhX7/S1cJFyWodMQjPSGfSboYbn6
         oIS55HIJc2/Zts6WTq+zbxu5rRtVtBQlQKSjRsvtB2p1H+AvXMD4MYiTZRIZ7UOirha1
         IsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897285; x=1795502085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wPvc2pJmj3uvOPPQhbVmgAKXLpjRqYT7Sq42BxhEfNc=;
        b=bhKKr5DhPeYMHa5yP/z0eDMS4864Ww/xCQG2FTYl8vk4z6yvXdf6JkLPcUEyHw9Uqk
         zeTnvZuXf8WaC1NMsCvTd8xS8ijYroR+xCIC8PzV6zDptLGUdLSOh9zwpWU98LqdFrOI
         YRhn2fZf0AfUBVMQUVmBKopc0tfdhwCcG2pKLXtSQLgJA9W0H4g5nHPQsAXDho8YvDP3
         nV5FaTrli6CfF+lqpHmn+xoJ0iBy6NDUlxs6nQRCedotixO9x1BVjGFt+XPToTN0aKGs
         3EUtK6OS/9RatHMqDIfmsM2rChrbGWd5M6XIPujn3tZSUQgF8rkfsNWUvFCy8netGlWj
         2t/w==
X-Forwarded-Encrypted: i=1; AL+hErGvGbqMkZCIsKhNqJaTO3Fhf/pjxFSLqVQGQ1EZBtx0AMNNKrwnDy1sBJHGg8BnOYWGmUPTApmnGisIcCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z83H6K4hBiPLTnASnJuO0l6c/XPfja6TZ1pQ/B4rUK/hoKYmqwV
	5ZsBe4DyLdJ3GEwCoATXksHRKCYZn3FfG3TGjJvRINSR/0HkCVDxf/K99YpKmMNHwSn/Y9YO928
	ZW+a646snG7OGb4LJJeIL5+B3m2L7TBMwto9Z6/BXqMadrw+ePKce/An70zcc5ZWB5X0=
X-Gm-Gg: AYBFou1EAR1GR18JRkmk7cd0U4ivOyLnlm3ZuNVG2N/vKP8w2mgwysoueJawiGALj+W
	yxkkUo6v3PsONEBFqOHj+M/VGKCGf6NJJdyUmLrMlBZR17SnzKwyeCgRs1IJjHlPq8Gt93jNVeE
	xQibT48pnl/pYOC3Ei7A2UurOwxRug3zP0RSSQsSbYfEhwtfX/IudtetcS1VmVzBT4c5qt5evvx
	sOwe5YueCwMyvLhrcB3Q56UXtKMtYG9zaODVvDaxtTp90N5hR6xIl5vVcBiAfRgJ4Fj6AtFvrww
	ZoxPs0gIDiIUVZjMIXzJIod2qV4XON9Dcbtu+dypP/iLONSlkccKSjkDdXbx6voysQ1CJLSzuMB
	nf6GirbJOuyqT+BncLvjdvFpgSE02Rh8yiaZkC6UH7e7vKL2MKQMVPdCEV2JepSu4tU+yTwTFe8
	GmZTMWa5zZI4fnboECLENjYyoXNNqiPZPFW+dNqXl+cJEzlnYJ
X-Received: by 2002:a05:6a20:2591:b0:3e2:86b6:9bed with SMTP id adf61e73a8af0-3f7a81ba72amr12380192637.57.1794897285513;
        Mon, 16 Nov 2026 22:34:45 -0800 (PST)
X-Received: by 2002:a05:6a20:2591:b0:3e2:86b6:9bed with SMTP id adf61e73a8af0-3f7a81ba72amr12380168637.57.1794897285029;
        Mon, 16 Nov 2026 22:34:45 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4e68sm5202219a12.25.2026.11.16.22.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:34:44 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:34:30 +0800
Subject: [PATCH v3 1/5] dt-bindings: media: qcom,sm8550-iris: Document
 Eliza IRIS accelerator
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
Message-Id: <20261117-add_iris_for_eliza-v3-1-02a55a9272ef@oss.qualcomm.com>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
In-Reply-To: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794897274; l=1458;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=ERwzmO8/pMXME2fZDOM0QI60W9iJpQBHJoJKsOsmInk=;
 b=QeYf3Y9llgzNBkc11s6iVXzSN2QcXuqIUobXrnbe8UUkztWuA92wv1c2DE4TppWmTfDYWJFak
 xkN0cNUbYisBG1ws1TRrhH5x/9E/iGAZTypg8jhwGFBgX1JzFTTosX5
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afbf586 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Sm_iIEVIus1u_0tAx5AA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX5BOiIpEAPip2
 QT3p+aRbhs3pTS1zBCmHFUdrFi7zKFZZvV8qoJe98CtV5l/13FhmISRmT8x3+Ea+9VOaZH8bBh/
 iy+cvpKROkiAS1PCieAQmsW00vdNUEs=
X-Proofpoint-GUID: u-h4FygR-SFF6f3Nb3C8Gpiz977xdNMY
X-Proofpoint-ORIG-GUID: u-h4FygR-SFF6f3Nb3C8Gpiz977xdNMY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX/H1mMWkwoGau
 csgr+r8/ygo4zT4E0iFQsZIM1GS7uX8bpCmszl9AQfGBPj8W0VYha97sTBFxFT8dD5pAD9RXYTi
 kX0xGkKTnz6pa0RDa/FU/OReXYopKO9MPGinlMz7wRuCVZMsTYiCQW5T8FjNL6Cqs4A8VMUMdFn
 yoOOU3Me85FchPqMBCqmJr/OVtRObZEwjYMsIPnfuTHcahOT3cXRRjA8wJIb72jRepsHac6dm3e
 91eSbwIxEKJpdjM1SZvqOZQd649EW79VHf1U1PEP7HS73BFR7nsVju/dg0aM1yOGEGafeXjReUo
 JUMjqqCJXO1a5iuAAVgJAty8QIG28GOadv0TJVqvXFHVtgejirf2/GA0X2vlIbBlJ+D/e7/ytKS
 AKBQ0qEPzTNjcRc94lBQJjxQdmo898xbFd1ySLWnoi9sV5CxopkN6+/IDFbGy1UJcYxuEH11OHN
 v4j4QP4LdJK6FidJwqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170025

Add the qcom,eliza-iris compatible for the IRIS video decoder/encoder
accelerator found on the Eliza platform.

Eliza belongs to the same IRIS v3 family as SM8550 and SM8650, and uses
VPU3.3 with an SM8650-compatible clock and reset configuration. Like
SM8650, it requires the bus, xo, and core resets, so include it in the
existing allOf constraint that enforces resets minItems: 3.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..e06f2d844bd2614f6bc5237e3a246056daf28821 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,x1e80100-iris
           - const: qcom,sm8550-iris
       - enum:
+          - qcom,eliza-iris
           - qcom,qcs8300-iris
           - qcom,sm8550-iris
           - qcom,sm8650-iris
@@ -106,6 +107,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,eliza-iris
             - qcom,sm8650-iris
     then:
       properties:

-- 
2.43.0

