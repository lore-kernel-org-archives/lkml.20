Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086430;
	b=E+ATnE2ED8FUEfzSAoqQlQpIKKOilkf1NrOA7QdC8Uf6JEmGBu8JL956O2CCO//P9ux+
	 cE1WkIHLPSF5+Cf6M3w6wJy+70LdThoE6khWcRxUWevgB/Vd9oCWe4bcT9ZlEaHjCSnu5
	 YxgCSehNHCo6Qz3RhWG/nQ5JiqhxZSDiLK2KjinzT+Etm2bcN1eE361xbYrcFdGxk+7TX
	 hMpScOq84ZnoRgMGxM5ieEW+ZjAJ5M6U8hQpwHIwU72If4PU/9imfU100mimljh8RQ+S1
	 qo9Nu2q9vxAx4ZM+WjVZVnZ4ZD8VR6I2Qz9mEAzuxhSFEaVTg/x2nei8gSS0q3yTe9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086430;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Mydu7/v60eKg1fWnzz92JlLJTuRpZkA0odLBmNL740s=;
	b=psHl1rgJW+PDoUWf24H32uOYwkbwQUkT2Zn7+DX5qoyemgBi/mei1WAcC+3H2XL2OAcn
	 nA+TPgfJE0Zdk1KlJcykG0PKuzHLfTEd46YPmGx5VobX7vp8L3h09uAnFrQPNNEioL3s/
	 Gbzn+m41iZqIHBZ43Tr0aw9hQ1QcFSKzlMAigrgfZfrxrM9wiDir6c5RI69fqk5CI0KF3
	 MPzI/X49sGofIxjYd5jm1kuwfazED3cbWhm5Vy0uW9yxPOXS9ieP8Yqw84yiOLbY0ar+Y
	 dU8cOGZFp6AWih1GP5/9vklcJ/zHOhTefW0SfxiosM/xH1hvkDlovpCWjZgjZ81Y/bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=puo2TPrO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ettIUmEW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2652C606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2652C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=puo2TPrO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ettIUmEW
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5Z9AC1779949
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mydu7/v60eKg1fWnzz92JlLJTuRpZkA0odLBmNL740s=; b=puo2TPrO9ZnxtzoK
	480dMdguwbZGkc0BBkFiVPMPQYfqu52UY71Cq1vtN+82NXkd91t2OzBLToU5XlVV
	EkwexV9XX2Tb5hV+lupTVN7ReCio1QIIw6wiS9Tz5rE/7plqoFJ1IFOXAZO0100z
	nKgUq61jUv4IxK5QMFULHWsM0HjKzlhycZQVrNK9tY6BqHGnCeDLE/zVvcLbN3+P
	snIGjNI0uGz8W4omPJzGNRBmTdobp5/Qg58C9U8VspQ3gw4sRr7tAcct0qlxW/Ru
	yyuhOVvGNYKPbAYmgrNYNEw/r73lqNO+Si9VpjPU7WCLLNQSi+DqLWR4CwgKu0SD
	gs15Fw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbt948p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:33:49 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-451d80641efso7401367fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793086428; x=1793691228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mydu7/v60eKg1fWnzz92JlLJTuRpZkA0odLBmNL740s=;
        b=ettIUmEWqkItOi1TkFwZlAxKoR8K9W4GGwFGAGBq02rn/WTwuHL9WEuEP8fuuOnhSQ
         gy2+NHVoKC8qoI0kGux/m4wEQ1SD2gjo9LKcvTS49rJwhh0qBcLQzOqNCIgS9zCQ8Nc6
         L1Hs4Xof1jU7S2jrENx2Xsza7E3BYBfVk/rs4i0qFt9AiBVe09XLkoE9vDKLNstrvw3Q
         Tq5UQbQMw/Pp2FxbaADtGLHRhavOJBFvZKnDNPKHuytrKpxdBIjwUi2/xzxRog1KIW+f
         GXjxiZjeSj33LiHFFc4F7iD3nq1tjhCOW7kKgX7HWjeN3nahBkXoJDuDHUMSsudVXlTp
         ephg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086428; x=1793691228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mydu7/v60eKg1fWnzz92JlLJTuRpZkA0odLBmNL740s=;
        b=hPBf2uHgO5copEU4YMvX3vIjFpPlRA/Gs7U0mCiOw7xmyj5hzkv0sBeAzBDYVZUoem
         PV3FGTwd6CznWlLNAXnsJxYehU1tmnoYj1D9sbPWQLQuFi0uHldlU0puQNlHoXFq1j2n
         M08qRsyXgCpaJUmSZZtBeKQiiRKiV7YW3MdqAYK5IIjpGynlfdpMB2aDlm8z80AvXkyI
         uMBnMiGTVZtQxfY86iPT7sjC3bVQ04Nh6mFbDwpDE2NcQzbxcB1j44mwk+QNls8mvBGy
         WIlaD34X/EALXPtc4TxdUdcMby/+ezBOSKEM5pjS4k/6OWWvYRvR2sIir0/09aU3aopY
         u7iw==
X-Forwarded-Encrypted: i=1; AKwUvBzaVUr+tj4ctXjDDqFtKKN5rDGHtjj/hw9HuHntYBjx+ou23I0U5jJ4igT3kNUJOrsQW9zpOvMHXDm3tuU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKA0U/UbOk/qcgA9pk8Yr3/fPvroOBHoqNuUu7EL/7W201UPyvO
	D3MkI0rGSN6c8DECmF6e967hiFuWaTdxBosSMhul0u4ffpAvsqQhk73Z0fNJThmP3S2O8GIvxza
	fae7l2GtGcTMSUiSxW+vm1zWlkfQo3qncmbqq8t8I4xM+E/OOgvyaCbGeq6qURnWDldQ=
X-Gm-Gg: AYBFou0fQOXpB+h9mXeWLT7LLuMC507jzuwSyVOX+4TcVktYv2vd43JkUfNONfIJnyf
	vK/p+XN7Ht9HQu+/y9wgNwcmUnHS0bnhGKv/60wFpGxyU69tQ5wpNxNdJ1DgYAU0LFVg9rvbzeO
	gSs8w5ueaIsp8dHYaOALrowFx+DxWvRS5aYWnJCoeWICoa1/AIleR1sJJiCP6PdZHYAerPSau2o
	zjtcbUZpFcJcZdmkXYI7Ao4dSxE+EZI0sdeZ/etYewdJNte7QQmYlIjkCj45DZtyhDcuZAePtF/
	yqoNCOTOoSIpyjNBweWFcjIBkjL1MyVlYkypuOfo6Oo6F1tWsYY1cEM3njlTZGN4XkTVtctrom6
	GQP2uZesPchfDeWZCO+Vkp/1SMSIUAdbs9pPmWRltzyN9tY7Y1/gA+562QRvkogeQ
X-Received: by 2002:a05:6870:4690:b0:494:9254:5b75 with SMTP id 586e51a60fabf-4a83f492564mr5150377fac.27.1793086428393;
        Tue, 27 Oct 2026 00:33:48 -0700 (PDT)
X-Received: by 2002:a05:6870:4690:b0:494:9254:5b75 with SMTP id 586e51a60fabf-4a83f492564mr5150357fac.27.1793086427823;
        Tue, 27 Oct 2026 00:33:47 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm6181923fac.15.2026.10.27.00.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:33:47 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 00:33:34 -0700
Subject: [PATCH v2 2/3] firmware: qcom: scm: Allow QSEECOM on Surface
 Laptop 8th Edition
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
Message-Id: <20261027-mahua-surface-laptop-v2-2-7dd903a12d22@oss.qualcomm.com>
References: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
In-Reply-To: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793086424; l=1019;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=wNF7GM+GdxYCWdEaZL6S2MWmKjl1DuHJFAVWJMyUK3A=;
 b=sxTRZvchOqzGOxsqy3rNazQ68L4xmxe7cYMXP6mqGCxVJZZZf3jH9mGgIdHDfyzrrjE8YaRCp
 f44seOeKIdYBmhty9RNSeORb6oMZxW+15uFCR15jjdom8aTM9iYNecp
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyOSBTYWx0ZWRfXzwzs0xzFkN9L
 BqxhWRVV+u1SIj/XrVpbvBSnnx58DlA2K2kYQ/bFWTzjKXPzo/09viuSNp2uWVoz0lPfr//o60b
 qwB4bIpM6alNMl0IULpv+mEABYQLJ68=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyOSBTYWx0ZWRfXwVduCKRNksw2
 ZwEsVy+gECQT3fUSqtUXpi21JDj4Dh01Cx+k6DP9inErXL1PdruOk2oSwjyFLTUVx4bVAvxCU0l
 uHOiDvsSaoGhucExTwBhGIfrUrOLsq2O5RcQdBq6J7uw6iKH7Cy7bfjrSFGyiPqNcgQp0Vs4ilc
 bdBoTstyIZ9h+VzJ/CYSXp+r95Gy2QqIp3dzxhtMmtLVgmGCJ+uabD68TSAXq1zZUGEZslzd592
 e9nPR5+sYjwIi0rrIFifLahbtXSBFItiDMMHLBVwm/cvhAM5UPp0fz25pXGxRsUsAOr9VUphctD
 kBUNb7MMIUNGe1psMB13lzQO1Kw2M0DvNXC8yAnBhVR4Jo9w01AllY73UF8jRPg9tqikOrz880G
 884XpP1OYAJb62AzGwuCjN6X0ehcnXsXdmlqBvKRelckWFbL+mCqjiobLMkRtnfMnXCHYwMlVTp
 VEX2srk0ovFVR1QL1Gg==
X-Proofpoint-ORIG-GUID: 6GmlC3zFkm7A43QxvT25IJW_A8oUhvjD
X-Proofpoint-GUID: 6GmlC3zFkm7A43QxvT25IJW_A8oUhvjD
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae053dd cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=iOO-S4HMiWNIuKyz5uAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270029

Allow the use of QSEECOM on the Mahua-based Microsoft Surface Laptop
13.8" 8th Edition, giving access to the UEFI variables and the RTC
offset stored there.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 43e250faea75..30d87fd939e8 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2255,6 +2255,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,denali", },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
+	{ .compatible = "microsoft,surface-laptop-8-13p8", },
 	{ .compatible = "qcom,glymur-crd" },
 	{ .compatible = "qcom,glymur-qcb" },
 	{ .compatible = "qcom,hamoa-iot-evk" },

-- 
2.34.1

