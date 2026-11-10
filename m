Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328768;
	b=IX2iLmwz5AK0icGvq5YzgOzWGFKBBkUFfbmgpZVL8aMp/pdJ07Kx2Zrg3WJaMfGBqBOK
	 2Tkv2G2e12Ilri/vWsOEPPMKLv1siPVIu7IUgOhXzgT5l6mCGqBQhDdmmlY+Hdc6HtCjA
	 jbYfliW+KJTUuH+W8nBLOm2I+HRdz+XSwWC/Eu3uFDZjNUeJSZQFOGp47UeFr/o9Lw6w9
	 BmQ3QqpZeJrobtDCHM8sM25SZH/BtRC3zzurG/nImAZ5+GxoEoaDlD+o8d6SQwNdTsfrE
	 mXASIHuQm6FTA5U5RP9gfgrYMABTmpAyVd7SYnJlYza9OD57NBfH4Pm8xBkukoi25ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328768;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
	b=BWfl/5jeFMTVlg78q5CcWyf9xoDh4sc5fjvfcpaBj2YnsL19Fm0YYINRxy5wrS32+fMw
	 4jZx+pmsKIbXAMqBjNY3E1Bpv3oytjch7+kEl5pkL/N9fm0TFd5QkpiwrPJbTGQCceF2l
	 ZvCo7Gm06b2WWuPcdNEZf8QMnCpHatLLYhr8Pw17kN6nPpBBh428cAw4N2dy18td0jVk6
	 SIuEYogBcy2oCSpQIQzjImeucp2nc/wuwRM/s5595o8AkEwW+xXl/t55WcdI+FtkUQFVa
	 lFXK1VNO1oakWiM1N9zsmmxVXaQ+tKRkb5t/jY0awWamvU3V1a0CbqK9DOdaoWrdG7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="B/tGTLUl";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=POxdAeS1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AE7606E813
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38AE7606E813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B/tGTLUl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=POxdAeS1
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0Num485163
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xtBrngpMGCe
	Q6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=; b=B/tGTLUlL4K0hJ1Q1MWsk7HzHGo
	wLEaG83DQtjsmlsenGMR46YrTnIVk1Kakl9QDejjuxd6gNdon+MeSim9TPrRooxF
	RlETV3dDdY3HrJKJKRHOeUyNui3JqvWz7VwQbBtYakjHBbSeweQqnRoRyhoEqcWG
	kv2syDYc0DOKLqRZ2oM5oOi20vEjOm6pyuoX1GY+RzqmYIzkpmy2pZ/zcuOhwDTn
	UIjkXNKZBTZeElsbQfh3AVzL6FseFPER83WfLb6n41Mdiv5aFXN25kVcpXfI2F2g
	7xlHLk0NAeIc5hH/UsfbeT1Xx7E3ZAaITl3Tgm8g7YKo+RAMQ3Ky1FhhuIA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwhs09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:27 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc450e6dc2so1898326137.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328767; x=1794933567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
        b=POxdAeS134a/bHTQP67miwPT7SR1ie8Rh3La+Ea7PL5jU6v/4O8mLYt9n+Mwhnh7e3
         XxR5xnAsgP/reK2x5s+L3pmkis0jjBU9nJcfP1byfMA6D5HGWY4rmZqhGirrLq3kLJXA
         EpdlfAoVE+0rAbt5655CBK3sSIaRguZekV3lHwLjNnOaZAuYp+thbs4jO1Cbfa/0nhvF
         If5H+rkcsv77MkPMrJmEzgelAKQG4+FU+o0MH+cgiuEqMCqi93qIFqw0FmLmQBVvud2n
         j2kJvoglStuUBbnXOKVPgZ4A8GBjOG9Vz1L4ekRSvbOIVd6IzJfK+2kok2lf15rFgRI8
         EGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328767; x=1794933567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
        b=wXyIjPKPFAuolftKo3FeF7P3ivpFW32MF2dT4JPsecTFoxWbLNtrRKqQkVYGj6s09j
         GDxk2DRLYbR4G1bRI0Sa4mq+1KgRkWQ210sWJvj9ezM0FhK0Y7BOLtk/aJbCjrCfIOk7
         17h3/SR6Jbnmj2DFaW+jODgpttftw/BUuyx6guJecYX/R0JgOWMloRScouCj8OjGgnxo
         QLCLNeoCmSXjcZRUz5T0oI1eHc7mhqlAT04Dnn9oCUUyPX7nUqgMTlxauGiwkKMpDs33
         e47zKzgGpSPewBVn0qh3SmaDblbdD6aeF0CT+3x5NeKj4KjG9uCQ+rMwk7puHFpA2PYT
         f1fw==
X-Forwarded-Encrypted: i=1; AL+hErEq5iTLLcy035wIsxKFE99LeJlFy4s3EvRt6LEdV0fcfp5bwmUF0vIo4rQ9mzgjFobip6mp163wSlKmGro=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xelIrZvpEMUaOpsMaHESRdZncNPmvViqiD2Fxg3e9g69g4cm8
	sBZ1/na1czNiKQW/8IIeYIZ0p/w7LuulOhIiUU+BpLZ7K8//mlkM1JGMiUH05WJijFj8IOrMNI+
	j/OYpERE7Ua85GNqfiE+0LODFrr4R8k30iDUTSAxhhL+fe694omq1uWz9lu+/darnX3A=
X-Gm-Gg: AYBFou3IhaZfcv6PixKESf3MeDUJH5rS8lqRLBvKbNafHxBXP9ucZXwD51w+Fq1gESz
	3RreZiIUc9yhO++aMmSonJn8bipwybEWBhLoJNZFQyG+rKlLbCSR710h7YtVnHQpqTciXplwJW3
	ILJb3J8sNFWZVGUgjDUNYXf0YguVF/q3thvoGSSy/LJzzjnRF4dyaJoQuo8F62shIJrUuoQgqIM
	3l77UvRMVegY5ksbU7H9t8L+6Rygj1nq/fkXE3b6Hg8G+smGlPYXwrp+mw3Vf9di4UiAuks0uyf
	8cNczu4ElsY5QmkL3VT6Bi7x1bhaB0fDTiIgGXBpLl3NYrhGW+2J5SqIj5JTeYsofre0iWHg31t
	cjqlTuoxK9oUddrZOhb1heGG+8W3rx2xhatkIxoVzGD/pgrpESanOgzhBXNWNpsODNyKUtyQD/A
	==
X-Received: by 2002:a05:6102:3910:b0:7c1:8aa5:36c8 with SMTP id ada2fe7eead31-7d301c3ff3amr1254811137.36.1794328766608;
        Tue, 10 Nov 2026 08:39:26 -0800 (PST)
X-Received: by 2002:a05:6102:3910:b0:7c1:8aa5:36c8 with SMTP id ada2fe7eead31-7d301c3ff3amr1254799137.36.1794328766120;
        Tue, 10 Nov 2026 08:39:26 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:25 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 6/8] arm64: dts: qcom: qrb5165-rb5: Enable JPEG encoder
Date: Tue, 10 Nov 2026 18:39:07 +0200
Message-Id: <20261110163909.78085-7-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: p95gSU2vfgfETOYjVW16MHztrB1OZlcp
X-Proofpoint-ORIG-GUID: p95gSU2vfgfETOYjVW16MHztrB1OZlcp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX0z6x0A4YLM2J
 JaEbp1hxAJ1fzbUUt7sWSXvEicaIoD8Q3PjszV2+JC/nQN4tZIMfh6nzzknk67HoKzAcwT2BJ/K
 5Up4pkZNLrHHZpcyJOCf+yNLMcBzZ1U=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af348bf cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=YFy_RbSkoLDF6nbOkSQA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX7O9uZfJGfGT3
 /K+HQ5TN1LvR5oCfblkpOGqsonmgrkIooqHHkQnohgNE/rW+KDJmGtGCmNdCdoJ+6dkUcJ4b38k
 BXmXO9+8oA5MHd5/O/xagMVgGTmnIzFmwp4MfHNoLcWUtGBXIa49WDLlqb74d0JYh4t6ZWyn5yK
 y10MTtMkm5CKdYm7USoQB9ENWviqTCwhW11TEiy+tp9VkzcjyiVdMpOveAjlvejBDP/Aipq1/Oc
 CgKO1yTQP6sH4xCRSssqrSFgR3POipV0hKJIue2mDguqKGTDw+TytYgmBHPBiRXjFb39BgG5pbM
 LHjqUdqa6Ds6b+VLIAUSIWOS8q7pfKHZQKpdgInC+ylqmaXzFadI9bf2hvL9Lg/PR7WiGe1s5OA
 EhgHcYEhCSQcoFKoenuN0x++d8lk+Bd6n0J5iB/LbJM8z/Kx7+l43pCJLxBLngybCvJWvA5XfXb
 adTZQMU3Pm6SrQE69mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100066

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

