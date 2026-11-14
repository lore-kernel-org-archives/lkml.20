Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794630515;
	b=jFHYLnDVLfvZpLhmFx11ztorH4e08Bxpx++feb+aJyf5l/swP29jXTWa3e46akNSbYFy
	 kdheXCrDVtp+YVTOmVlL9a1TxpP61XKS7rPjr8zN99KXsGq5qoEGOx3SpJEZE02vOntju
	 yuDoVPSrWntJIDADFX8iQjyhp6pieCYYA1QQBuqEA/zBQy+1mAk1qFbXpr7+WX5Vt8z+L
	 jbfkuILvI+YgADj5akGGehNwLzt+l5qnYRqs6G4aJUpBTGx+gYZfhwcDggk2ytiX9sJbo
	 7ND2T1peLkNsJ9/bZKgBhuzvolbtS4oC1+LhO18cn3b39y9IsK0/qg4QauZU/2sYWjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794630515;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=T9UbsSp9/GnIXIjjFyJeCzkRon0iAucPinHTduzdxeM=;
	b=M8e8IeALav63nEEhLRRjOUL0ESWNfZcKQ/SZfuXlKsNtnh1RpeFFWWWozU20wgnQEE9k
	 p5dvtYCFTKOFmvMXoTWJXV1GZs3ewQdQ3mqmzLJeIduber/1Lgx8EeaaVj8wOrMLfGYlR
	 25poqRM+nhNlvIkxY+h5xuxdaw/nuYW1ma8hTLzQt4XZtTySWLf5lC5NCTgiRQMz5VWWS
	 c0m19rHF5oVU3LQrxV5pvGCO3bxJ+b/lnHfqwPLg9rG91TJ4c10A7ag425falMByeUWSi
	 PI8PDoxTvDGpgF+/0iJJmYXvAL+U8cblLaNpq8GbBj3hSNDHEZDy/Qgp8haRYd1nfdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jkDSJNrE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECCw8Mo6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7848D606A88C
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7848D606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jkDSJNrE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECCw8Mo6
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE3YfkI2864136
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9UbsSp9/GnIXIjjFyJeCzkRon0iAucPinHTduzdxeM=; b=jkDSJNrEc3mpOQwu
	tctDgkoNIe+3iHVJggkzgUDt6pFD9y3c0TPC6S5M5S5RcZMpIhvkKxZonTbyOTKO
	1ZENoUyS1gpUl4vLkMnJ89L+xh5MT2PinDvUX0Y3zqpp9vT7nd2kBsT1EQVSvJ/7
	6DX0snAaSLLZFhfotW/oi6HeqvwZcO1i9kEKDTFW6vbZeqlQwSh3acfnLBiz9byS
	hM0vc34c34rAxmyEas7SY0w0tXSDFcVE1dDgUZKEZarkdzqBFPJvCOJYwl4meesQ
	+i0YO2Q15RiS885Qu5iw/RM33kfmwR2TPQu01v3yFp9UptsO/+Baj3WrcaIRjYKe
	lPwkzw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxfv303a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:28:33 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-71ad7f06ab4so109354eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794630513; x=1795235313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9UbsSp9/GnIXIjjFyJeCzkRon0iAucPinHTduzdxeM=;
        b=ECCw8Mo6JSwxLM0LtFVn66FS4CYHpMH9rD6/6uCZyMqm/91EZrsyNKduQaCGIM7YnM
         Pxa73xv4Q/w3wVXj6ObbP1mGIZfEsr5AQa/S1ajRc+0BFo/LnL2Wr5vr5918CvtLbaIj
         4iYEz497sLbIbn3W8pMf1bOy66Iybxy2T7dpDhjIzYeo+Qk3qsAMBzpIDrGQkdZ/WJL1
         KUbLj1Zs92H7ozTyQ4WKLkwlTDurBjapv5l50HyS/U7grQpXSxKD5ydc87uUZqhUQnIG
         g+LsGZ7bj+LkkKDj5Rogykcuuy5fWoWB/OcVHJoQNoCmS1TSbvnn4MTA3WmYRxuHjoX/
         WaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794630513; x=1795235313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9UbsSp9/GnIXIjjFyJeCzkRon0iAucPinHTduzdxeM=;
        b=hE/F0F5vYOw5Bn9R30NK5tg8UZELqb8elv10lmHepLXumxWYPfZ8RWgJ1DNk3tFwxg
         PwfGJhpWaZASSGnpkUT6MbCYcHerwsTEFwtRNR19O9XVIMg0hVnFBynHQe2Cx9ah0E3R
         bKOauVaPj1d+yZGkkFz7MWXGlOklSuawgTjD4YGplqhCr/0/tTLF3jgeR5OYk7Lkpd5c
         S7tPk4Z3gtOSCQ5B9V3jtGPLp4ZITSiGWoMn4OV1SvPlfwfL4YVRDYwnKLbL1yNUD/yD
         C7hThyRHd2ENOjJ3/n6q0R00vBj+1cgjD5nUYqGiXLzvy85h709S2FhUHbhH5F9cYbm+
         s2Kg==
X-Forwarded-Encrypted: i=1; AL+hErHxvKjo1MQpaaaAGo7xR5pbsSBDdDlJ8eoXuW3j1kJBnPcJrM44AqMhWoPdhbREG9ojYmgUBPiQPiF+5gs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+w0I3jCmNG72J35N/eYaxJ5Jh5hSvUnd9Pjmi+VwgGAYKrWXdN
	OTQrbyAf7Q0jjXK+xtiKJQad3qJIWW6b6DWRRY8m78Ki7XenbvYNWCMDvWfpEC0yQCYRUYxxR/Q
	rA3L8ILnaEzR6wM7lbWLPpyrpJRVszeCWDWmrc/ur/kmRhEfAI9tk1jwmJbj1Id98KfQ=
X-Gm-Gg: AYBFou0ED9rJ2fM8GNyVHRIpKg0ycejRdkoFfYEnYOACT7B7Q64/F8VVVDnzy/xBxmA
	G/xpVvPbmzYDlJhZgVZF1vnw4HUOCxdurliQ+/6TuexkWjWrx/V35ohsMWDwnCmOS7SKRYdFGn+
	bZ6hfih+m0xUuMzx4QkZb4qQNQmwJxrZussKsWCc7ihrsOmH6mGAGC6qNiQS/JEWe7DYdBC1DB4
	dG2F8ILcJFJaNnI6e3P3XSQu2TrgtVVo57jqdX6atBlRjA+ZFv75L/wgIIDRRVMd6LHpoRLR2gS
	XFYKDJAYSh/Z/jFs7YEES627EO+yQhTq1nMuJK2Emrjbrd6oLP41D13Sfu1L/0p1iAnngbCG+ne
	RFqw7axUTlkVQ38b2uLSy6+1IbocOjyUIml7CrT8OnCP3FcHr7xj5SVZ+baOgM+V32UU=
X-Received: by 2002:a05:6820:151a:b0:6fd:e28f:ad38 with SMTP id 006d021491bc7-71ab5009004mr2987095eaf.32.1794630513164;
        Fri, 13 Nov 2026 20:28:33 -0800 (PST)
X-Received: by 2002:a05:6820:151a:b0:6fd:e28f:ad38 with SMTP id 006d021491bc7-71ab5009004mr2987085eaf.32.1794630512691;
        Fri, 13 Nov 2026 20:28:32 -0800 (PST)
Received: from [172.17.0.1] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab3f44dc4sm3292269eaf.0.2026.11.13.20.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:28:32 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 22:28:27 -0600
Subject: [PATCH 3/3] firmware: qcom: Allow QSEECOM on ASUS Ascent QN10
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
Message-Id: <20261113-qn10-v1-3-e09b2aa7ccbe@oss.qualcomm.com>
References: <20261113-qn10-v1-0-e09b2aa7ccbe@oss.qualcomm.com>
In-Reply-To: <20261113-qn10-v1-0-e09b2aa7ccbe@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=877;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=xh76U6IOsJ9uCmSSVXfGSwpLhEJoGHaAUmimAeWEo04=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBq9+Nrfu6H2iMY82S+D5ICGxWCanZlmpbYtSpjG
 Oh7HojLQ9KJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCavfjaxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUFRxAA2Zp3gYccXh5/DQj1uTdcPOS2kjnUrhLDk3ejanO
 VR6ZhzLVWwzVUcLrAQeKwSjB2LYsivhh8H80+698WL6+8vIFNtH5Xn3Cx46rdsYXy9kUQTxw1Ua
 cxkuKJ9BGC9vrM0INYj1C0iZ9df3lIaNd6XdUw/iJrWxH2PEonZlRqCld+PDJ7WqIyNTp3Jf19/
 vaU1fk+AougMFZJ2JtLX0YJL3ya/I4ObnmXa0yep/mTqC5sPOpDV+si9BuLOzyPqeIfEE08QSWw
 uBGG9BniH+av0+dP6yIwqBwtngGq5j8kwnhNrWWEd89yVuaeg+l/I5a5J36uPf5B+++v+J0nBvJ
 MvxO3GSnUevJxxBnsZ9vwH9UJhf+Zs/c3B82yYEtyyTjFOjwBqcaZ/sUSMT77EnOSL7ZPcKgXj6
 PEIWoce6FFFeMdFMnJacQU2IL7/+HQY97h18fZ4uozrjehP8FOuSMOfefM693UEXCI+sUvJ1yqf
 lM9hZSVrqsQbB3prrPbwYpTffVfzWiQDHo6OPIrGElxhHjWFVKBz4Qt7PbSLnC/U33q4sqVDidR
 8Qgi6/2qNueQInX5tHZJrzIRtLSdohdzvrgrIxW8kNUh85eweE0r6xF4BcN+BztUdiIoD7/DAG7
 e6h31gXeEsHJ9fZQGoePfCkwFkSR+2tzAbxnVRMZ78CE=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=D8/SufRj c=1 sm=1 tr=0 ts=6af7e371 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PMzojMwlkinoLF_R2aEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfX4ZiZbw6SbDXL
 x0lrenZCOcic1eavQ71Cj0Rn2To/HE+tbfPyxxfFAJL/AJlkPlWQEPwKbjVHZhVmquSmV0JNA2W
 920dw7KjiKNeMXj5B8JkiZZrgeB+fLQ=
X-Proofpoint-ORIG-GUID: uAtYB-WipvQRkLwpAVkLxg589nsGl9Li
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfX4ktjtCqgUqho
 3gq17Ix5+6lDxnFwmGqoDJqRWWGHHqb+ZnOSKV6bsgh3yaWjOKc4wj7rlD3lML8KxPQRYptplTN
 789Hp+PdIImTLBsjdTeri00Eaq9GCFEN+6IXvsrU9wa7cJX0MH0an91HYi1KoL6I8lxpkbuQBbL
 oiwnZkoOxB/Iose5Q2thbP7oqbJhpO83KTc/0Rn1RIM2NyONjZOR/r8cRjfegnidiLjlFJz/2nr
 GJUK81om668RwzpQQHU1jentLErJnPUMxQcFzAH14TgrlFdS4+okTkPUh8QRZaL8+NMPCeue5RI
 G6X9WtyofjdGw/LjXXcSsV8TNaTjgBOm01KXvbCSI/TDqJ9fjzkyCpXyRjCuD2b8FsgnKihhCZ4
 RxF0RGuDRVkxzNrSTR+PhOBmxw2+2dm64UuDr7kl3UadlU8odaxfTyBkp9m5zopUjMEnZDuZrRp
 WDJ3gxvTsFCrfc2Qfjw==
X-Proofpoint-GUID: uAtYB-WipvQRkLwpAVkLxg589nsGl9Li
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140017

The ASUS Ascent QN10 provides functional uefisecapp over qseecom for EFI
variable access. Add the board to the allowlist.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 030e4ba90812..fa94eaa020c3 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2226,6 +2226,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "acer,swift-go-sfa14-11" },
+	{ .compatible = "asus,ascent-qn10" },
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "asus,vivobook-s15-x1p4" },
 	{ .compatible = "asus,zenbook-a14-ux3407na" },

-- 
2.55.0

