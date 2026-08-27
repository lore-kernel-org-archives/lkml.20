Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAD94B049D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853184; cv=none; b=BOe1eEkaP4xhxS7/8O4pHg5lf1Fp387zgsd1tuYf7zZuqIkCZK55EAevJ/B2wFg6o9G21e0KVXGDdfXJ8itfLYr5wjju6IGwfZtCgQta6RBardJh3mFoz8cB3LgdCB4dEsUkQUbWHnOJPnTUZcLhiX5VS49WmIvN7tXVZFHueAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853184; c=relaxed/simple;
	bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rn1SU/EHh9GkS/V6FsVFn9lrp3z+sAgLZJ18VaaWaU55f+8rlYZs1izHiXEO4AjUySRTYM7X6JeC88aJll/bHZiQ3uyDR3i8Z0RlDhG6Q/7+74d5+KaWlOdDiqUDQ7tkS4I/9B3AKB+6rz6lQWuK4CZHQpZigET5MgoUM2GfJg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XveKuayk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dRWcldDQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XveKuayk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dRWcldDQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXaZd540921
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=; b=XveKuaykkN0fyFu0
	oyzT6oSjYAB1CC8LaAlXMiNGzxKK4bODPslUpyRn/9nO3Kf/QBwXzzRvR7ddSitD
	UIoK4dEm55z0GU1r1+2qSljuF196tNvAi9zQS7gh4FPvYUppdo0DVyPz4FQ7mmk5
	jxIH95dYG1D4Zc1D2sdeIUJs5Wf5ZNMibzEES444Cpib+vFG7MlqyKjtVDLTBwRO
	yUjBy5BeP6my5z6ISXHM0M0rfOs3yiDQoiddXcObRTvE3WzBNT64Ndb5aUczdYSP
	8/h5D76PWHQCn9Q3M3UlYJTnKjox8D1QWQ3NBdethPYFzjgAsudHoqDfmtJuEyxg
	Drh2Og==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garee0pan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:52:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfca8558d2so997115ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853179; x=1788457979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=dRWcldDQlJI+HqvNLey3KHeQbbt2jP2S/GOyDeLVho8zLcECDhpIvpAtYeI0SfW6C6
         kkf2zBYMbqdCICQ2o8+r64+uvgOjM4XIKNRNoqTFrU3UrsW3y6V18WCySQemJ6cpnDnD
         +hfnOssj1w/vD9LFU2AhirQBQcrKazVxz5HKRXfHzznM2JOfT6sRuxU/wmEXzBmcRkdM
         5g+V/lUczGdVplEjSLdVV7tOFP0golZXrvEGAXKLEnB2Btd7DhKdEnH9w/jQ0jOdi8Wv
         js4e/rVmTX1VAUR5u9SnIiw0klZ8J6Y5hBs6fbFQL3TU4TPPMnmCGPEcG3vnJR8XN/Ud
         5nbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853179; x=1788457979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=L0V8guc+4iNqUM6Ec7Yg2E4h21yXawX6Q+317mzhsHj4GULhTyfr0JKJTePbGo1Bhs
         a00HDKiNRFvKPe3mP4sKLC0fsvcsjpHqFZRUj7AlLwXRzpBkBYDkavbx8pGwid/MEaZR
         SOhGqfjZ9JNIHnNC3AYLVATeEf6GCNTvVmbAXHmaSSgS5mEVC97KNWNkYOJw9vZNjV/5
         CGVZ3PrUfUjVYTa3BljJ3JteF0/ObZnRdcwe6fjFc2RN+C4VfGn5vlxSDShXOTxMRsr4
         oxyh9XLgUXbmGrn/VvK9hwTfIOZS/GNajrAsk2s+TgEJ5ZBo1fesB3gIzKJ5QkEm3ey4
         Jogw==
X-Forwarded-Encrypted: i=1; AHgh+RpEkAMQ2fnGJ72p9psgJKKW0s4NF6FAxEHqXI6lQpznTtOz9b5koLAGnJn31bX4xnOP+Ah3FdrM8pXQZGk=@vger.kernel.org
X-Gm-Message-State: AFuF++m1hua6P0QhVGA8psVjr3sCXdg9W7lTYLhX4RCzpwcGDS0lI7L/
	kSyWoW7LM8bZxezFwFXlp6RY9KE+LbxLTSDqy+pb/jaZYvvPQ5EiPpgjEcfmHho8Bb2Mo2+7I4S
	/Gyj3+4/Fhn70wdRTGD/184iRt8dj0w/lLL+GQGIhL3xmnEOd+c8T9BBdTI/l53pYe9s=
X-Gm-Gg: AR+sD10oTQCQPwueU/5JgRVxGoy/J+Zxt88qVQnbSwO0V7oj7vFPmQ6vHyWfehR9fQ6
	koERRdGf/OliGPHrZ1k2mL4pf4GgENBRWLmynQ2OCZj5LZt/Wl6nlBx2L44nRPbrxeOsAyVS34C
	7IkTNjx0DAongLl2t6Xo/SCxj6O50dygdlnIQnMfrBM97FAz6SLmEXInFUQigq3ea+XB4cfgPIq
	sjIXVNDQAoGmEzPAdaCXO9T7kcJDa/TnlIhMQinmUHiwbXORY0/lhK6j0Nps7wI5JB2U+IFHEGX
	l2LvCzOvgBFhSeMMyRcMYeIT5yg2j+DViPgnIgdHsrRRcTVM6u80PWZYJlGVo5L/079ZLoPcUZG
	bpwS0gmgJKDRKHBtfKlst+jmyXbu6vO1VUi0kxxMPn/cBX+aJ2tQq4+lkAvMlN1XQRC76kRwgU9
	UY5WbtQJawokWyF/tV0EgL3rA=
X-Received: by 2002:a17:903:15cf:b0:2d7:1aeb:739 with SMTP id d9443c01a7336-2d74e1295c2mr11086795ad.13.1787853179211;
        Thu, 27 Aug 2026 10:52:59 -0700 (PDT)
X-Received: by 2002:a17:903:15cf:b0:2d7:1aeb:739 with SMTP id d9443c01a7336-2d74e1295c2mr11085775ad.13.1787853178763;
        Thu, 27 Aug 2026 10:52:58 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:52:58 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:15 +0530
Subject: [PATCH v5 12/15] dt-bindings: interrupt-controller: qcom,pdc: Add
 Kuno compatible string
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-12-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=922;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
 b=5+UqgzWqWAt2y8pw+wO8S1gQhj+ILFb5zZykxqwlJVi4SL1guDDGpMcNI/73AXMXGq7fNAD8n
 e00Bc2sIs1UCSRq9bFhRuWIPh3sI+xeXRdBycjDqBUkKY4tQG6SPHpa
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX9V1QYlWaS+SP
 jVpMx4MohIj93l6Sj6dtPbEK5YlwKKpXUOO6zuGc4BRMmLrrQtQztBO4HQpSHdmiR7vHtGH+qgw
 VoClQ0enCMYFxcQxlKtn5/C8mgkDxmeGIatiUVWq9BbsV+Doki3IuLO9S8NlZjNq1E56Om3uQ/i
 nLVG129OOAHeajFl7e3vLqH84MFatmSqq8WkuFa7XqOkilAEpUVLBanLln+VOImpYiDH4acxyHu
 3u4E0DsgIet8YdvvmPqkXqtpJhlfnTptfXyh+dX8Mpcfi+Vu/Pk79IaTEd78zNKaxhIUiuWnd/M
 1Q8QTkqOi2vNVuqjPO56t5vLJHyK8Gnaa9ZzcOjcUcmUJy4gYM5obKw3KBcHQ0U5i8Op4CeS0sb
 thDGNWk38ecPvLNadk2DFpTotpBKWpavu4ZkGjV97nC2F8d0R/HsGqa9r15O9BTbIJbTr02JQ1t
 uPF8K9jN67rKDs1EMFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX+RD0zUsed7ph
 Vwx/nXSWNccSDVbCGAbRoljLdGpDVs/PeGuio73bvjhVL1YnT+BohjytFeJPRbOO6cPqMAQMagh
 8NvWtC8hsCQly4DjsF+RfhAjM7CFFKE=
X-Proofpoint-ORIG-GUID: LDe-hjQcUI09B6FJEI0i9Mm4OE5fAS0f
X-Proofpoint-GUID: LDe-hjQcUI09B6FJEI0i9Mm4OE5fAS0f
X-Authority-Analysis: v=2.4 cv=e8E2j6p/ c=1 sm=1 tr=0 ts=6a90797b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_KRvd0mH2JNXacczCDAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

Document the Power Domain Controller found on the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d49a6..518fbf6b2761 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,glymur-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
+          - qcom,kuno-pdc
           - qcom,maili-pdc
           - qcom,milos-pdc
           - qcom,nord-pdc

-- 
2.43.0

