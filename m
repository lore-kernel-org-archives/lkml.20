Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DAA46AF2D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798564; cv=none; b=ftZmngx2aOCfGRAQz/WnKgHv3GfqSdh81oK4FPR/5bh+3PCW4TYxECpkXM1OErftLtuIoivTx8UQlmxY2zvOTa6RTfcLaPHagzn1MTQeyomFL+WW9R3zfiMfx0U634GIcWnQqre7wzxsay3KeghViDpjk1PuvFzJJpMr+Tb5+dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798564; c=relaxed/simple;
	bh=V/3IA31vPqsXG2097rTKWi5nwgyBwftt9ccti3G8bUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XULau5/fjqYKwxP42LocXZInD+QPqr+z2TbSftpPAOTcupxpUZ89W5SptR9ODdMDmpP2b9mZuwZzEoGWp+TXIXJdVN53tY/fPn+t6CyqO70p8T8R0AZk3uqMeiXvC3Ehh/Wy92iuVGYURlz0aF5wbNxBKWpajvrtH8BZCOa3I6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtayOct7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihi4XcLz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtayOct7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ihi4XcLz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KbW82873944
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aZjGkZ8ZHV4WDuLpmW6lz4tk3ITtCil1WIS
	F23hsLQk=; b=LtayOct7YJMGuwRhZVCkinpNhCvzxLipEalzIqtg5dvIqE/Bs0c
	+wpmGmrQSnPrPn8WRZo7RFgkRKpwXE/TXJBW9ZBNukv/cjOozfRfxZImu652nK4x
	sAAjP4Tm00wq6pfcegpsOFDLGI+rFUCnzK2yt2Qy1+0Z80WwVbznjqOTKgoc8ZJL
	oV/XjX5X8DSoG03nx22A/Ud2+MJH86utI9kfndKG/HDe/AbGTRJazlL1Tp1+MeFY
	L0pNTxerxHkIoJ5hoCOytqr4yqY/BRkSnJiqXgm4utB8eEB3SHc0YnfvBHUf7dW1
	AVE/eVgHSVqeWpY2v+e1Ma6Hzvje6GIpoQQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2fe9tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:49:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b8c60c550so8805346d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791798561; x=1792403361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aZjGkZ8ZHV4WDuLpmW6lz4tk3ITtCil1WISF23hsLQk=;
        b=ihi4XcLzWoC6M+SgVidbFx7QMsn+J1gIcA8efJsx9zgSBqRX35ZU49b+6zrfE9G+Yk
         HTqpEAd+r0cuMT9ZrlwG7FNEwcM7ILRFz3OGzlI742YlulculdPcjfN+S6sL03fFotc5
         vcT9nDxhCsDMZHqf1LmCDtFpNo1PzYrOW7roOGW9vr5p/6nOkipBbGjiTjS331ZQkKUL
         yzF3qRYreCvQcM58nM88P90PFAHsuYFa6llhmVQ4NpvVASpwUfoggRj32Uev9yENhVGQ
         iDttyzxRkGRbGgs5SxS/XHnjf1T3XrX0uHUmiLF42IZDc5jnZxMaTrNtknIEqS1nKXDw
         fKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798561; x=1792403361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aZjGkZ8ZHV4WDuLpmW6lz4tk3ITtCil1WISF23hsLQk=;
        b=LL+SVPlq/MNsdmqQQ+t871mCdO8Lzh/ZTFfkIzrVHzXXBjXZj/pG+s10Qt8A5v0Lm2
         uNORuVDA10MWWVwwYgIct2h+x0VCCAw0muIkVmXzI52eA13/q80qbHD/46paJftaTMHH
         EXZMlT3w5ZdX2OrIV0xKFMCnGFqSYcNAVF4ADTTqtJ7bGqsdySp78YxgaYNtBOy3bc5+
         IPIWkhIGLwF5hkx3Dyz/xKnnbCWr1ktepyA4AXVGefpFoj56r0cIfNWxBbGW1OBXq5+P
         6HdHZFHj81SVXwRl33aNpIMUtIfA7ShMWAhNnhmZ9ZOuTkOJi7sibvgz9nDriizbDLgZ
         cccQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZEwlwSEWKsm0raQ+VEYJxPmUZmmqbsgu5AL+514tZTmxu91Z420K9j9R14jgnJOiJakv9j9b+4Jn4qzM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhcxS9N3pzqAISsbUytY/qFzJ7X0Sokc7Ah45xq1eZ7nARUpDA
	bZTP/wBj+rcAg7bvgAnxXD4AqJyRr3es2z9AIttizBly58wCoKCapZxErbSppSkWLrCRlyXnyKS
	b0f+JcgjNwzvlqfVDY671vD9uYnP/JpGRkyjv1V9ZZayNq+D4YiigjOqOiSpfaM1BzCEIb/zvjK
	Q=
X-Gm-Gg: AYBFou1fknmv1hmgMTBESSQvGmwGAaV420NWYGzDiTXpjIrvy9W3igVu9SlpWGMkq/n
	pEXB05//KYR8i2npis70SAsdbItIHv+Bbq4uc7DEy0G6TeRPwRpAt5fQO34QHLijMFF93Hb60In
	6/GB+7+mKTkHfvZ0/nYMgdjh7ziD4P/rNBu8ZdBmEBwvzp/dEx6S/MlCrYemhp1TSLnkT0qPYjy
	MEiq8kshBgfiMSPclJRoKhgvvWsIbyG/sar28VntXwjZpK9enL/Y1/U24657UNXa+px6iHb+nHy
	DKnFZaNNU0SDBGN4lEl0lT02KFD3nSHcCxIjxZl4mIEfZkrpvrIYgBvsTsFWwNBtyONTZhEPxY3
	khS2THy3GPYjxTo0=
X-Received: by 2002:a05:620a:c50:b0:93c:c7c6:90b5 with SMTP id af79cd13be357-93ebd0df5abmr1539955985a.9.1791798561048;
        Mon, 12 Oct 2026 02:49:21 -0700 (PDT)
X-Received: by 2002:a05:620a:c50:b0:93c:c7c6:90b5 with SMTP id af79cd13be357-93ebd0df5abmr1539954085a.9.1791798560508;
        Mon, 12 Oct 2026 02:49:20 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf135fasm243381415e9.5.2026.10.12.02.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:49:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: arm: qcom: Fixup sorting of Eliza SoM entries
Date: Mon, 12 Oct 2026 11:48:44 +0200
Message-ID: <20261012094843.66537-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=V/3IA31vPqsXG2097rTKWi5nwgyBwftt9ccti3G8bUY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqzKz7jMMTDHh4wHsjQVbqjEGmiKi/z3hR1c8ba
 RjfY0DK5LuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCasys+wAKCRDBN2bmhouD
 18woEACNQ1EHH0AHlHsxMw4Fm5fWzxJ6Z2IaD2UDW9TzcjZW9KGTfbitPMZjTVrk097fNbKTcwQ
 bjnmIqK03BfqRp1P35Tw8qE9kNA2juQbOy8wlvrah1bEoxUUGaT+8ayPDAU1rkouwgLKzrAb23W
 Xt+I/jSc0dHctoV0Lapyf4yxcIQ/NYs/4bRybUgsNAPSFpEOgajC8Bs7lgdTZqeKargYczalI39
 sZ0DLL5qKa5/v1P/v9yb15w7fWGhr2hytVdmEx4RooyE4vq5DWwbKc8Ofto7lRLsiaFKRZHi4zK
 Eg5m62B3INVVFnCP7G9zn8HXw6kC69VFWEdCk0mqHffUH+iSFollLteuuZH8zMaA9VuYPwW5Qh4
 L1zOe79tPnvYMcTkvcuJXywvd6jAqu36XSPPw4wj92OTvqcIZjrvQEknmh6s2gEMetz5GuXCK6i
 F234R6gbQqgI2ViEOO9VjNYJ1LlvTE861ykoWZ1bUwMQpK5WRvgsuokYpvKwdKyizr75SP08NCn
 Zziabm7ru/BdtxYZ2r/E00YEzlP+776lMTmsvdTSf44fcJQG4rCKtrvmG6UTrbvTIbPXbu3BZbq
 E3jbt+II1U0Wm4pdQm22exKBDyXGM5W+h4MLAuuZhExi0Vqv5NVqZvckHv+a4iGYCgSfXrHG2Is lJaSIodwOUeAv6A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX4cdZzXYMgiBY
 6uaS38eaNP9dfiXULVIPYtqeC4WXcMzNHhzYjOjJwHVyeExvhS9PYfbJmjvkjm+b7dS1xSxU45o
 LC5GqWYdDVUU1XE8EvVYj/g78c7MD7k=
X-Proofpoint-GUID: cWSAVSpZMVSxeF66Fn7b1d263ogMLkgt
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6accad22 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=EASxALMklSPAlHyK5eoA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX09jMLYC3tD3O
 wgosOuciGcqGWfwUdwzyu4I52RYvipoI+3LCrZ0zUnFYi+oDJiV78htErIA8biDWIY/gf+8xS6M
 2hTFFx3pNY9EYPpINhsC3RGtS9FmjUD1X1kfM2hoXogvu92HsDojGtNOpg5bYSYryartPULwOju
 qYgiWQWPU9hDwXxxzGlM+o+9d7pb8hTrs9ynJczEybndtgXlZo8AJq0FU9ZQwDz9oHMDFZ3t/MI
 qVc9a03n+vQv8ZVsUmP8A/hKcxIDyFChwS8GrMJ0DsqTM7rh+XRH7x/1p3ud2XyRdgVHTFHa0dM
 MbgTYrbLT3LvTWDSzEdl6Ft9IsdDWop2dHe+anqYjLWM7YED/0cHjY7udylpwNq2BpumqKc4GDR
 Bh2+VzWaBiU4TOWtAdlVLel//VskH+Pf1CQ/WBHVcaH7hcCudTc6giCzLEc/zzb+7gZv+ZD3tn1
 gOMFewA0RKMG8L84gNg==
X-Proofpoint-ORIG-GUID: cWSAVSpZMVSxeF66Fn7b1d263ogMLkgt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120038

Commit be9222a4f92c ("dt-bindings: arm: qcom: Document Eliza CQS SoM and
its EVK board") when applying patch from the list, placed the entries
not in alphabetically sorted position of fallback entry (the list had
correct placement).  Fix sorting, so the code will be more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f28645b0088e..1fc8c03e4401 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -55,11 +55,6 @@ properties:
               - qcom,apq8084-sbc
           - const: qcom,apq8084
 
-      - items:
-          - const: qcom,eliza-cqs-evk
-          - const: qcom,eliza-cqs-som
-          - const: qcom,eliza
-
       - items:
           - enum:
               - sony,karin_windy
@@ -79,6 +74,11 @@ properties:
           - const: qcom,apq8096sg
           - const: qcom,apq8096
 
+      - items:
+          - const: qcom,eliza-cqs-evk
+          - const: qcom,eliza-cqs-som
+          - const: qcom,eliza
+
       - items:
           - enum:
               - qcom,eliza-mtp
-- 
2.53.0

