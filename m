Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B4A481A87
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390155; cv=none; b=MVJo5RW/TeSSa04FvDdL9T6sdtw/6H2DEYIggBQndND/IN6bkD6eGP0wnBNAKi/M8caoIbXLdgJHWmdseEB+X0UxgyWj6VzoV7JpadwsLrVPH8dc2WsmghPIieXtE5D24VmcnvZ0f+WTktkKOezZXhcTmeGiKrkViu/ulY2WL4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390155; c=relaxed/simple;
	bh=qhXhEgON+LM47eHvoJewyro6o0/BcD0ZisNe20dtg2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O46mlEp3ajOej0wTEtvYRXVVB5+dU3PpwVM74mBYP7njXLP/15GmfhAdl70IdfCJ6o7oQaeoVJquLO7TYyodzjswqFhKiDwaivq/YZk1usnzFjybzgG4uuzSWEjKf8z57on16UIro5LvX9n7vHU4H0QEMjKtYRP6Je7V2eZIIPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=URC1sLJG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jt4zJWVp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="URC1sLJG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jt4zJWVp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm2c4901935
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UH5fHPdDSh6OGSS+K594hFkncJUiDRu9BWlILDgoXTo=; b=URC1sLJGF52jteSa
	zKw47YMaLrg8EWYL+K2tT2P4RVwWI1vHW0002eUnR0MdjlXLlIci4gf2JEKp/EoI
	NK8qEBM77q6REUpefHvgSKxpTXCn/fIqRnX8plpthtetcn2jp7UWWERQGPG1Q0rJ
	06lNYqq59Uh81JeUn2rpQFACFfDac5PQAkD6haOp3Q99IWai/KgngarrR+8blarT
	78cAtIn7DOZWdivE6oftNqzF4lRgWK3BjzU1Yk2IsqkWFXVCStVa5alO4v/UnTq5
	dhhE+C0bQ50x2+R0yiqLevkDZnCtWq+5ud7D99UP0RUi6hti+jC6Biryeep9XJFy
	UKXc3A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevrwbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a07b5b5efso305166585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390152; x=1789994952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UH5fHPdDSh6OGSS+K594hFkncJUiDRu9BWlILDgoXTo=;
        b=jt4zJWVpotDu1PiodejkAjtSAcWD4xZpWr2LgYzYRI2eQ9UrDcUvOFYCTUMY2DyJY/
         o790EPbEYR5As7W+xF4gvw8JEF4IfJMuIB6rKUGMsOrPvpAZ6regfMwUf7i1e6dGQ0AS
         V2tw6GPwcSEqRwAXHd6GBdpNbSmewKj5E0ZW14L6FjSGNjlJ7x7qJLAadRJL7Oi+ao1c
         7tdw8kE6W6/DN9061zoQ7AysIZttLUMqm8YNKeQ/4X433fCZZSsCOwhrE9sgpUbJD7CJ
         rGg6/NILsCrx/PGH09QRHtk9YPxKYpHqrju9aeSei8ZYIHePWwlfHOAiicezjkmasY0p
         78jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390152; x=1789994952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UH5fHPdDSh6OGSS+K594hFkncJUiDRu9BWlILDgoXTo=;
        b=n7cN5aRx6mZQI/REJ21TYe1AzewpdSmC61QW3+LfVMN1vrlYBgEGGKjngiHkPx4wPT
         XfDWkKv9FqBueBuhgOYR2Mo+6PbkD5c/jz+vL0w4rZhuSEqsJ9OPmvOK379v7bAINaf2
         QE4UcKbaANXJMDrE4nrtE+D24i1/i/5Fdmn8IzASRdKTy4rB0JHU+sfezqdqcebjfNqm
         QinIRam+c/SOS3vPR63yBNQSMYWydKW9ZeEZDy/YPgHgrYFjLZe1wDLf5vlX8PjpyqYe
         VwMgoGXuVGgfdHV2Vba48TuM8fO8ooK/kXQUSDLWyZp3dTrLqLsclUIKbSboaj6CHutC
         b/Lw==
X-Forwarded-Encrypted: i=1; AKwUvBw9nUc2goxaW8A45W8bOHPeIGQu1XfbgvQziiTJj6PSZSMI+XxbnWCnTBQ46sR81V85JjFLi+COQUE9FGw=@vger.kernel.org
X-Gm-Message-State: AFuF++lXGrW+olBdynzO8ZsR4S+C7WWIzsRwGYTOjQqUu+XRsSKhUOeJ
	a3RhzX7YYCJ3ZdvcL1/owH2TSTu77MY+fAbINlz52rtHgh5NnfoNXHr+YDIVtQDXGfRvUppCRBl
	OloCBfHO8TKBwchvEafkuGf3Xi9CsJWposeH3RGf0Vq14vt5LMno+SsSVUTUodDxnUZQ=
X-Gm-Gg: AYBFou3oqZiHEei7++VXhzSC6//+ChnEWBJLsRmb2bELm2BUB6SNxdH5aGhxqmHIeDC
	vM2utGtxkcJDNIIyTE9U3/FzTW2WqxK0eXtbc4p6kVNsvtyoOpk+hLnu+TcantM3C0sTl3NXQ9R
	PxkiaqcGok7BiuqxM9yT2L70MXlLH0tddW1IWtOpdiEFbo9p0P/gnF4M9uBS8940KiFBN1TL32p
	WCP/BtyCpneqU/8Z/YDz/Lat9k27FSaHugFPnC0RhwooABAJLgK9tpm0h2s6oqFiQlr1BdDE7+6
	TlRZ1Xh2I9q3rLYekwWS6ICuQCNUD/S09Zzr3YauOkGX3Vq6GzViCfdfnSnimi3CpdZiAvfap2B
	x5U0qlClg
X-Received: by 2002:a05:620a:468f:b0:939:db29:4c11 with SMTP id af79cd13be357-93a187d69demr638372885a.46.1789390151879;
        Mon, 14 Sep 2026 05:49:11 -0700 (PDT)
X-Received: by 2002:a05:620a:468f:b0:939:db29:4c11 with SMTP id af79cd13be357-93a187d69demr638367785a.46.1789390151289;
        Mon, 14 Sep 2026 05:49:11 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:25 +0300
Subject: [PATCH v4 26/52] clk: qcom: gcc-sdx75: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-26-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=755;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qhXhEgON+LM47eHvoJewyro6o0/BcD0ZisNe20dtg2Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zkHIEMg3DmAPdIokleQ+KpnF1/OMchaQpB/
 8r6ypzmEE2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs5AAKCRAbX0TJAJUV
 VsfLD/4/7MfLAMydm9mdflM+W8f9IBtm5ZG4AVh8MwV676S6fNBV1u/eKi2oVw9PHXEQq02iJsi
 e882R9FEtxe2f/L3IjKJkWT/6oVLAFXz1L71CS1CWjUMFFJ4IZqPIbwhsBqRjH3QrTBPoqG/BYJ
 r0yXUVGg24Jg1euAciCRwaadilDbVIDxqiRdakmwzbSMrHUOJKwOjOzXIwc1uK/Dgpg0R6lOTPG
 TliU60/OQfqITPgrQfjPvKWuSD6immSvoYURsW//+JX3StBSrXFR5pesuRWhxXQHBOUIOpboXdz
 ar5swWhjskUTnfPcTBOyRJ6ZAFKzpXgZE3CQL+ocR1EsXGN7nfSoObJK79+JwV86TxH/OKuXRoV
 vrOOHC111SmnFp5j2+ta2PMYR6FD8HArdQNT/h25jdPHuy56E20x5D1jDp4BMBDLafQuCzerwzH
 OrzFvZzRuP6MvCUzwENKjgZ9ahwd67jSKzKjR7SufbUM7Ea46Wa7oU10gRMqFTA39sN8SyKw8Lz
 pB4fcOcjaSB6YKW6jadx4ImkLvU7lBJXVYTNsXWDd5EZFsAPPcrVkyQdpKMpQnKTKumH3vU2FG9
 ncAiyci7Ln84yatIcKmbmEb6NxlTrHBWmuCCanavsb8RlV909x9K5mTTgAI/rSnwFnBz5jcI6Bz
 RnYEgtz91hfr+AQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: tTbYoiL_FStXjLsxPGGYmjgFmlk5--sQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXwtm5wADfREDy
 zdAqjstpCPGhLhNhvwLg7lIicqptU3EWtZv9Yc5eCKeVMB6He+Mu2GgEeEeAEnag7t0py9Lh8Nv
 odw/guonFu5ZhDqCAHZ5e5yg/QODjxk=
X-Proofpoint-GUID: tTbYoiL_FStXjLsxPGGYmjgFmlk5--sQ
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7ed48 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXweb8gpVZiOUq
 CocDOYD+GWZOlQ0trmm9Yg/53nnP+RJNeybZfY+uih20esQOJcFDgNQzqsu3hdHdIBFby8P9sp/
 ojtjBx7SGnFo7TSFVbzEBbsAIXqrpyrYRQjvEfKnjUojca3chmcCn3JtdVQ85vxzP11/cgZyICU
 JBmUU5E/Rhw/OjXHsVTNaJORIVvwkAOUkEK7xi79xcUYxUIUq+nLYJahwXmPU/WAGqJ/6WuBRES
 PO6LdM6HhhCPLGj2zqnJ6HDVXI/UPkrQS4w5TorsbhpfsKyHhN1wLEWRM8nryeZ3zWa5ZlBsR00
 Sfci488pO55zsJovVItApg3FpDcAThaPJCjgQ/SBRxv8yPY4+ZWyRLyr9q0VLv6FPz9D6fvrk0Y
 4lkgNwvNMRy4xs/m55YAhV2VWRKLf720azwc1rEM58AsfgeTHCXxoI9Dqdnv/7nB0p3ElaSqvGQ
 DHDeY86au9/N8OhgEJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdx75.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sdx75.c b/drivers/clk/qcom/gcc-sdx75.c
index 6712e76f875c..7a17e300abce 100644
--- a/drivers/clk/qcom/gcc-sdx75.c
+++ b/drivers/clk/qcom/gcc-sdx75.c
@@ -2913,6 +2913,7 @@ static const struct qcom_cc_desc gcc_sdx75_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sdx75_resets),
 	.gdscs = gcc_sdx75_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sdx75_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sdx75_match_table[] = {

-- 
2.54.0

