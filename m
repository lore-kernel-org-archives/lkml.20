Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491EE48A8D8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970302; cv=none; b=W32Wh1u3ftrIwtsQUKGiQp9LJruw3F+fobsKHYKm603QeUa/fDAWHDsu2urHPpOSDJMrxYpUZFBiBZ+hwWQ2JqGoG84XYWxCNF0q2gjRW3klL/SFTW3+OTGSxvEkFHkn9QJfjflbEopr2ekEv8FHeuLFGpvi/ekmZzLb7LxbVNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970302; c=relaxed/simple;
	bh=TaiRS5P5fOIL9sIPrFQC0WNVuv7tcB3SoZ8snli9MIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dY0e3fd0P39dDzHZF/zgX6X9e1nyLKI9mSnQ+hdqg1iXr8d9rrpytOuAICIcyvPFoL3477AvxEm+onDyOZDT4T+LfAeXbtnwB8M33Ns+sxdXlLSR7/MMYyRRpJFiImesM73gVF111fL9mJDQq0dfa4F1oTrd/EsoKwwfSGv5tOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XLvNh1YC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=InH98kJ7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XLvNh1YC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="InH98kJ7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692IY7kT1320671
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 19:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=enfwIbnhH/C
	SB0TdnUwnbQ+pUkNZL4kfBdvjTEYVaF0=; b=XLvNh1YCf56lWz8uEQVJXVtuujG
	Dk6Rssj8A3DcN96YsknmaUPkovU27dRdKe/1SufvqKzkeVXl1tQNaN/i+2+7+m/f
	eXKFSYFojp4RFZYh6G6uqCI9LkWXFFGadrDKC4ztcH5rf5ERvfoR///5sQ9qjYlS
	0Q1fsa+VcsYOmvNsxLlH9TLBV2fgoW/ZwiOrYeCN96j/daozHPdF3jKAke/8AEfo
	w2GWZn674lnhmI9+1yAPIF49/lUaThaEt6FV/FwfFxrKUFU87+bdZpo+eoJsRaW/
	n6CJCnGrqKfutUGtaowQ8mORSxYaVxbM3GGIG429DONNY0yFDzpjcaJDJ9A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2j0kr77u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 19:44:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93dea1b6c89so143078785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790970297; x=1791575097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=enfwIbnhH/CSB0TdnUwnbQ+pUkNZL4kfBdvjTEYVaF0=;
        b=InH98kJ7bJd9bP1qs0XghvzjxwLKS7JDdiC15G/7twuEs0tGI+bUG9oAFDm0v/a8eM
         Owf/dkgCA4mXG+/V+CddMhUN7nlBvWI7W14a6E6p86dO3B5vQh0co5BmfHMnxaC8tRDZ
         oe17ErmtTNlokR6weku+BLZpmKAWcWVcdgtcqUwABY70aW7KjSDh/nS/QJ/voIJs1SvP
         GWWTCjo5DQjwYdVUi36QfAgrG3fFR5JneXuhKHVZDN1B9gYsrS38HF64Ox6hKzxk0Cej
         Th/QbqavITZapPEg+5AtoIJz17+ne3b/DFbXGnda6xueqPOPsXdHcEYMkb5L9FGZgbFK
         893Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970297; x=1791575097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=enfwIbnhH/CSB0TdnUwnbQ+pUkNZL4kfBdvjTEYVaF0=;
        b=sEsl7T2y86AdNgjVQfDGYcYIg9LDrjoXMR1yQt9u99zD5tj0UsYhwBZNRi/ytx4lwB
         7oBG6TXd8OV7w1R0omblCLUxGRqZu0kIaRzV4GqL+9UDVh+b0QLkLxtxPKI8foI0/Ubj
         uDsZQKUdA855g1o7xhbVHqHMAfj2IkDSkK6VmOoGkxEV4Yqknuc6xuZI6HKXdbZRB1Gf
         5bmsDYYB2d2XIvJhU/zjUmSIAcWaiD3X114t7L5CwJsEJkyvyC53F7p/b5oIJqtqe6Mw
         ADm1Js/1XKBxxEHaY8Nt68p7OKgDYsgCh2xOU6A1YAZGM7KVmLEiLWWiGHww8H7RhYpZ
         90bQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLiWl+PlSYJViqzV6RL2Ap1zzfhedzQchtN309xqsiqf3Q6BQ70A0JknQIL8uXqVMOs7snDUmuoZE1+Gs=@vger.kernel.org
X-Gm-Message-State: AFuF++m3eZX85GqUYGQSYP5Vuw0XOiGwcSLbNikxScUrYM5z5EdlVsyy
	uCHiVZiHy42UuQc2/LwdfGHASFGGRXraXZTLlgRyEWHeZESqz09B8ogFW+UFlcpRy6rWn8LB7oy
	T8PbpKtjA4pMw0NRzo7HZAFJKmbqz+CIcH9iAdlt+iQ4Kb6QipmPpJe80+4380npY5vE=
X-Gm-Gg: AYBFou2bMu2HJagmr0SfkogGFZLKlEOlgN1D0ljjuUYYNfbk0n8WyBCYUdZvofislou
	n17jMdIsjiYxxVwDNDN7UUIfcgARt4t8h5Bayd2z3FjUMZlueQ5WMQmZ5Ucok5Tf/S6gR/q5o2d
	Xd6TAbRsP8Ljc0XtVWuiQlw6s6Mzu5pyu4oGG2TnIrNll0FQN2HQHVgB/iSqvP+gOiBkXI+WPxa
	r13Eu5+HSGRKsGafyBAaBMZ+yG+TeI2UpCyl+JORLVD7DSP15Pa56WJ3kzJBTLqfWnZSNKkLymZ
	8QDUcZV+xmipCYLzKmyRGqVI0atyuuuImI+4BgU3mZnyukliAMAvpSH3ghanwph6o0+SbECNevw
	uL++ubqO7ZKZp
X-Received: by 2002:a05:620a:394b:b0:93c:5c60:c3bb with SMTP id af79cd13be357-93cf19ee3b0mr711558485a.62.1790970295393;
        Fri, 02 Oct 2026 12:44:55 -0700 (PDT)
X-Received: by 2002:a05:620a:394b:b0:93c:5c60:c3bb with SMTP id af79cd13be357-93cf19ee3b0mr711552385a.62.1790970294774;
        Fri, 02 Oct 2026 12:44:54 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff3cab2sm37791495e9.2.2026.10.02.12.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:44:54 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 4/4] clk: qcom: Add lpass clock controller driver for Glymur
Date: Fri,  2 Oct 2026 20:44:35 +0100
Message-ID: <20261002194436.1275056-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfX/rn5ObUTsMf7
 aMJcJK/iH/V8LJaO1hvhHzD3DkTzgnKKrSIZGuNL/7ROD7v6lengfu3udylmt0qhbBU1/CvPdSy
 3vtXqD0RW4yIGi26TBKPAjvUZouf/u+ZjQveE+dc7Oh86ipvPffF10OM/S41tzLapmM9RO6yEJf
 naiYK/9C7tjvuMa2jstDnDIRp6uVHvh6S8073tkHu4KHKVZSE0SwhHa6zEVoImyBqmw+ev6ZtG8
 zLaw9NCT6NA4xxJqGryT0grZTJc02EFen6IcVewaF6QaNQyFErKBB7RZKQo4GpwBM2Sdpb55kZ6
 YZFMzl1Qdl92lE8GNvQdxq8IMKQdGQOUI1c4CdV6Fi06JZplaP0ABUHs+udJ8w1+vwLJVzu+H3E
 DNGUFLAnLmsOivB+ock1YmgMLCXgXeWzkstjUEaK27Wy+CY8W/c7JdWr1sZB42w6MiyfrpkYXpb
 a+jrrkjSTBB+HbDMY4A==
X-Proofpoint-GUID: 8c1y12nN-LQBqcoMWfgl-6HyvcK54ICP
X-Authority-Analysis: v=2.4 cv=Z8B5j3RA c=1 sm=1 tr=0 ts=6ac009b9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=9d4qlcpUcIswrQQTxZ8A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfX1J+T2sMDwmTG
 4GNu9xwSBhlKP1HIFyPqpVcKI7rPcugQhah0apqsGUtuSceR7RgcM4zjPV2g2FXcwAAOH74nh5I
 g7OlG3oFftQG3nUo5tKYXiOVCyFn3YE=
X-Proofpoint-ORIG-GUID: 8c1y12nN-LQBqcoMWfgl-6HyvcK54ICP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020078

Add support for the lpass clock controller found on Glymur based devices.
This would allow lpass peripheral loader drivers to control the clocks and
bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/lpasscc-glymur.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
index b7fdd76df2f5..742a88ed318a 100644
--- a/drivers/clk/qcom/lpasscc-glymur.c
+++ b/drivers/clk/qcom/lpasscc-glymur.c
@@ -37,10 +37,31 @@ static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
 	.num_resets = ARRAY_SIZE(lpass_audiocc_glymur_resets),
 };
 
+static const struct qcom_reset_map lpasscc_glymur_resets[] = {
+	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xa028, 1 },
+};
+
+static const struct regmap_config lpasscc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-tcsr",
+	.max_register = 0x12000,
+};
+
+static const struct qcom_cc_desc lpasscc_glymur_reset_desc = {
+	.config = &lpasscc_glymur_regmap_config,
+	.resets = lpasscc_glymur_resets,
+	.num_resets = ARRAY_SIZE(lpasscc_glymur_resets),
+};
+
 static const struct of_device_id lpasscc_glymur_match_table[] = {
 	{
 		.compatible = "qcom,glymur-lpassaudiocc",
 		.data = &lpass_audiocc_glymur_reset_desc,
+	}, {
+		.compatible = "qcom,glymur-lpasscc",
+		.data = &lpasscc_glymur_reset_desc,
 	},
 	{ }
 };
-- 
2.53.0

