Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272279;
	b=wHnh1ASudn4PbAghu9fpWtISk4KlWJ9mXiVc3HMt7UzGfTxwbbe3ZEzASBOkn8jfILqA
	 WGJ8NVPi3Dz11fIuMB2d+dZd7D34RbJkxMlyOZ40EhzXlNpjIfvdSJX+wDcIn3N5tQ2RH
	 4Szb8oW4tiBAA5S90+J97VQQ5xQYtO6mvGFuz52spyvVO77OIiH9hgp548CMD0i0A7Qu9
	 YLxTQx+Ge0ffrnCqRBYJQ0FTEWH/pAbJaMd9j7NX3hsFi2Mz8tTAUNjBsWQZ+eqyqNND9
	 HywWP3EuTuedlZ+rA8+y4yNQkqrbCBMkQjfgkrcj3mPHYMmVFqv0IowB7Ifp44n1SdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272279;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xvIsNDweHBCtSTHMTawIeoOjWb1OTtE/4WnhwFaWBsQ=;
	b=Pm/gorb3uOnFwefd5wfzBOVztkTbGv/5/5YFmioJZ3KJVcg7pug3jD2Zopm6tH3ALlaM
	 jCIt28K6sJFujUNavK0GNLSSE6JVKeN046cheaPJnwWoTomeIjrpai1rrziZOCgBlBYE6
	 zzDNCTFA7qz50E09P3mDLYB8RYK9IuijTEsuu5DXrW0VYHckS0SoOK1tn5qFUkBiDBbth
	 YqezPny2mKhjvV1+Hh6XAgS1G2tXMrfSu4/j6+3USAmQ+FGRXRnJ4/nJDn/1YlU6vC1RR
	 liY1aq0eKEWkO2tIiFwT3nWamqwky8USixoNdazapR9vjbIe13VxoHQ0fCrIh684lXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C2a5xaSw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="O+3m/h7I";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207B9606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 207B9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C2a5xaSw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O+3m/h7I
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vE37120118
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xvIsNDweHBCtSTHMTawIeoOjWb1OTtE/4Wn
	hwFaWBsQ=; b=C2a5xaSwSSEgUjAuMOhFvycUmxAD2CSNT7lifxYcgzUfh+wL8wi
	HVNqAqdYmq8cfrgvoc7iu44N9xlwzgFZYUuo5BNTrbTxYrtox2VaXGh2xdX8hrCw
	hrI6GFvObLa1AyZO30K7sPa/8+NsVJsuDsmtyixEuszMm6rUvlaNwq+gupqFEqqC
	CMEITGty+wGSLt/bOo+nsMU7HqZeBvfEfe+xMPERL7Pp+JJXJQfAJuUTetIfNhEE
	cf0WM0d5DvM6QD+PoiwujcDG396BSK+hs4iQuJruZ/malGbdsXFuRcT/ePa3JBSW
	oqQwrgSOXbo34MzJYyzcsNcB7KaUsKTD9vg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hktmpabby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:11:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2c0e6653so159230985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793272277; x=1793877077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xvIsNDweHBCtSTHMTawIeoOjWb1OTtE/4WnhwFaWBsQ=;
        b=O+3m/h7I2RSg6Jykt5bGXTksXjHoGdNHCyEw+NhlepGKFUsMxojmxhqlWmkjJnV/Rq
         7bb5v2x2jqcb7kK1SMLdG6vts5Vxv5ah1xcCFAkke+VtOIDnJWhzShtlMZZwo8RyKImr
         pbb1QpwAWwO5IObHKXhG1gU+2baTrKSrhlG2Fj6XqUt/8Tg7mjzPXeGPWWjIB8XZsTDL
         eLuPQTlciT//8LqBP6DUW7vANhZIPx+8tPlqJ8kMKYt3CHju5vBJHR5ndWWW0lgvLQJb
         aY41UpRsT5DNCwXhFA7eKwEpM1SyzXjsvFazvZzQyJ/VPUn6YYTwhCne6BWcYrVFzhiH
         vqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793272277; x=1793877077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvIsNDweHBCtSTHMTawIeoOjWb1OTtE/4WnhwFaWBsQ=;
        b=QLExOCdbtrBuF32IsvRykZAiHPZfgL08n21LmNWLDGGfEENBlHpmc6WrCppflEULZZ
         EbAJswjxI4wmsJZNpqoaLJrATELB79yjmGCkIXtVQfxrGlAOiSLvo85bDlh4ytUm2m8S
         kGnJLBUpflXOE4yszbEp6FNZx7e74VgKfG2OFqF/uBn4pJ1+fxnJCUUGVHBAE0/qFgzc
         L3nIwmbCg+al4lYsjtrst8+gzKWpFbXeUig/iYMDzk6Kbl4yVJ3UoSqTGX27nrojEhFk
         6lnEZnCn9kbFsXS73plPyF2pYxwIkHC34uylll8Ra8Qb7G485ExAXXU1HCQEC7GeUKCO
         vtvA==
X-Forwarded-Encrypted: i=1; AKwUvBxHg20XIM4KFjFwKp4521vSd3Q5xA39f1B8wuSV1/MyPXHJy/d4qDMD7og2hMpAqhihVEZr0j8EEd4HrpU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLl+w1wl4iiBkh1Rx38gj1isQqTjkATUbHyTd+41QeMttQ7o24O
	WvNvIjuwSyxvWZ3P0wDy0Fbeapq/CphjlKYH+fzCrqJr+oiV06IyCN4ei8yPFCYAYKs8ubmT6xV
	c+XkWLQ8zQ4yDuZYqC0IzyFxe5vLdjjT2nAC9AU41zJvvwf260gny5YYjP5AnP5ib3s8=
X-Gm-Gg: AYBFou3HbviuJHhV67DpGK0CpB6rKMYVWgnUBEwLgxvDMZvOxOTJ7krXXoWCu/SEmZT
	CydeQBobgWEx7vb41qURJ/5FzLcgIqr4RCY6YCx18g1lN5qdBVeyoNQurW1LM9MpauYCIG49uyw
	D/6N+bV2kdgT39r1IzYF5a7NOzKclZ6jLsmRPB9ELaG8tZcu/5rLv5ZI4Y8s0dhWsFZDbchmDSD
	AgdpFlyrXJLaKN5vOGlOpVs+GTu8v4h81Cbja++1TaUbd+5zARcQ53iC35EgoqrNsfAwMwxo/ER
	gPsW2svJr7qVVPTnaZL7Y1Wiv0baG9W2dtWA2u4RAPZJVKAI7WVVYzn5Y5f4+SQ+G30r1Ve2CTP
	IUyAWpTXM5UJuuP8/SRmYo7D7kcWszuboAyavMzJcfQc88w7vFo/e+oaGUiP6Hg==
X-Received: by 2002:a05:620a:4553:b0:93e:e175:ee92 with SMTP id af79cd13be357-94408d42475mr785080885a.39.1793272277143;
        Thu, 29 Oct 2026 04:11:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:93e:e175:ee92 with SMTP id af79cd13be357-94408d42475mr785076885a.39.1793272276717;
        Thu, 29 Oct 2026 04:11:16 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94eb8dc84sm45707065e9.2.2026.10.29.04.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:11:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net-next] net: ipa: Drop unused qmi_elem_info arrays
Date: Thu, 29 Oct 2026 12:11:00 +0100
Message-ID: <20261029111059.85020-2-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2618; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=7I0Y7JHmJ29bNgzq7Jmf9HeVPua9HONMiPF5u8lP2+Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq4ynDRfNne/u3D58VUP/DTooW+TgoYSjkrWBQk
 qUq3Ce6woqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauMpwwAKCRDBN2bmhouD
 12hDEACG5WcuL2D3Li2t+0dIcJbpZYDsQq3Ri3KL6102x/pbMuqWhTrsH1uz+mzlvxkFnCu6xbj
 xISVGGGCKIFoYnM8SQbTkRnYjXQUFY3DGEuxFf0YznXY1+r60X0NX1ony/tq1vXQH2bLy4sNbn0
 ojYWUaDKvheojdWyBU5zlN8wrMqUlFGu1UIcBV82pxLOoscb0HP0s/wAgra6cPdqvFnud7XO+bF
 4sUhrmIatwWSvODgWGTS1V1VzeyNtOL6BHJvsTOIwf3lWJKCJYgoaA1ZS/7xIJ1lFUoLxrqcIhM
 VFdczVIWMftQ3+NAmDSppluo8Jq6+RU7foIOdg2kcu9M04pBVxB1ztYTFeevtCoLLlLc1OvIa+u
 6flzSYwLMHv8G5w4J1XD+/AbNR+DAUOYTx/Z0q2uZpk9aukY3wurvHpxkwKx9oHlMshc9VtRUbc
 bgUAuMu37EMbKhQRZACF39mrhbN8ELAOEWXUdyPdCDJfETZqLggp5n8oVWWcCpRVVqTOUQ5+WMn
 hxGYb6pGui6TBuDicd95nuEMj+GmbVvRqCfxybT6zPm3WlAdUZ9ca8Q0X+gQjPJ4+eXGfeuZYlp
 7J2ujdEOwbkSPdrzS6bSg+xFDqtUA8oaa/NXEu7OQhPlJjkzX9J9s8R0Dig9NBK0CXxHMZaHgno U/ejEa5jYUhZkbg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MyBTYWx0ZWRfX0IU4Vo18667N
 PWq7dNw9d13sKZ71W6O3UBXNZdXdWvSspUCHAzToLLEz/G/Lj5oTTP5YaZh252ZJfqeQlK1tYnl
 Erm+NcvMgiyEuxwV8ru8vn8s4wo+hoP5VzcpZdB9Ikeo3+k75MI0X15Ci5xd3uFnNuGT374eUCD
 lEhMQUo+Koywavw79lqaY4KN4I9Ix1cwEpFYa6y6Q4HNyY8jIq03QHy/3zO3EyMme4rIgSe00Fa
 euI9BSy50GdftRJsoq6nLe0GDUO0sBeBPXb+CiarUnit059xbf0pWNobNdo+ot36DXHoXasawae
 OV0z6nnByF463i+x2Pa1DhEE6DDwFeJZWW8g1L614UNXy79W3mn4+fzvFFDL3owiduDrDGoMNPO
 z6p9iaFgjxctYkvs75OXWKpCNE/cDRav4Mu6FzoJ47STHCCHybliRb7pFL6Ytp5qH6tn0PI4Q7K
 qgMBP0vtpNjXPYUFkxQ==
X-Authority-Analysis: v=2.4 cv=crYOAF4i c=1 sm=1 tr=0 ts=6ae329d5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=e1SKIdZ0hHplv5p4F20A:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MyBTYWx0ZWRfX0ZJd9+bC3J6N
 DfCm0BhLe5PjjafM3BrfGawkwpO6zSyxBntcR5IE+JrxhB9lNh9CAZHwOdtkrvxEb617wPZPzrw
 GRBA/nKaJSGZUEOGMPFBlOHOtDU/rY4=
X-Proofpoint-GUID: 4dIYNQQEbjc5fQm3AARjFmvS8OpZyTNE
X-Proofpoint-ORIG-GUID: 4dIYNQQEbjc5fQm3AARjFmvS8OpZyTNE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290043

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

'ipa_mem_array_ei' is not used anywhere, so can be dropped completely.
'ipa_mem_bounds_ei' and 'ipa_mem_range_ei' are not used outside of their
units, so they can be narrowed to file-scope.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/ipa/ipa_qmi_msg.c | 25 ++-----------------------
 drivers/net/ipa/ipa_qmi_msg.h |  3 ---
 2 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ipa/ipa_qmi_msg.c b/drivers/net/ipa/ipa_qmi_msg.c
index 51dc13a577a5..e2401d8475b6 100644
--- a/drivers/net/ipa/ipa_qmi_msg.c
+++ b/drivers/net/ipa/ipa_qmi_msg.c
@@ -188,7 +188,7 @@ const struct qmi_elem_info ipa_init_complete_ind_ei[] = {
 };
 
 /* QMI message structure definition for struct ipa_mem_bounds */
-const struct qmi_elem_info ipa_mem_bounds_ei[] = {
+static const struct qmi_elem_info ipa_mem_bounds_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_4_BYTE,
 		.elem_len	= 1,
@@ -208,29 +208,8 @@ const struct qmi_elem_info ipa_mem_bounds_ei[] = {
 	},
 };
 
-/* QMI message structure definition for struct ipa_mem_array */
-const struct qmi_elem_info ipa_mem_array_ei[] = {
-	{
-		.data_type	= QMI_UNSIGNED_4_BYTE,
-		.elem_len	= 1,
-		.elem_size	=
-			sizeof_field(struct ipa_mem_array, start),
-		.offset		= offsetof(struct ipa_mem_array, start),
-	},
-	{
-		.data_type	= QMI_UNSIGNED_4_BYTE,
-		.elem_len	= 1,
-		.elem_size	=
-			sizeof_field(struct ipa_mem_array, count),
-		.offset		= offsetof(struct ipa_mem_array, count),
-	},
-	{
-		.data_type	= QMI_EOTI,
-	},
-};
-
 /* QMI message structure definition for struct ipa_mem_range */
-const struct qmi_elem_info ipa_mem_range_ei[] = {
+static const struct qmi_elem_info ipa_mem_range_ei[] = {
 	{
 		.data_type	= QMI_UNSIGNED_4_BYTE,
 		.elem_len	= 1,
diff --git a/drivers/net/ipa/ipa_qmi_msg.h b/drivers/net/ipa/ipa_qmi_msg.h
index 644b8c27108b..1924ac2dfa90 100644
--- a/drivers/net/ipa/ipa_qmi_msg.h
+++ b/drivers/net/ipa/ipa_qmi_msg.h
@@ -253,9 +253,6 @@ extern const struct qmi_elem_info ipa_indication_register_rsp_ei[];
 extern const struct qmi_elem_info ipa_driver_init_complete_req_ei[];
 extern const struct qmi_elem_info ipa_driver_init_complete_rsp_ei[];
 extern const struct qmi_elem_info ipa_init_complete_ind_ei[];
-extern const struct qmi_elem_info ipa_mem_bounds_ei[];
-extern const struct qmi_elem_info ipa_mem_array_ei[];
-extern const struct qmi_elem_info ipa_mem_range_ei[];
 extern const struct qmi_elem_info ipa_init_modem_driver_req_ei[];
 extern const struct qmi_elem_info ipa_init_modem_driver_rsp_ei[];
 
-- 
2.53.0

