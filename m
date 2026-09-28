Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B31048094F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584561; cv=none; b=Mzd02UMWFFpxth9/b5Jnk/tUCF9jdAVCFlVe3yE2JeBaH6yj6cvh1r6dOuyy0uLLVer+oXYdhYElAs+zgn97UObZmlnB8AbZP5R/4nfscmtyT64l2TL4NVV9RhyO9YxjXegQJRN/TdiZ13M3sM3jUVawR+qNQI1AQFwl0JQqrdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584561; c=relaxed/simple;
	bh=v7CiBOA8CHdycT0JLNHiNya6IPx7eS3Y3iq0Fpcko5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YjdvxlZGkWqJCn5NVAWjEjEcKAP1j3z+IEASWWqNRRCtL8L7IFdFqY2FXq/JzONCLDZR7QAZP7yO93LcQGUrI/CRocMg8QpvlCvQoswbvSbraVo505jTpvg0Tzr098NOWP8wGd13Sq33GmQLaB4Jvt3++U+1ERarrymr4EGXCOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AT+I/C23; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fni8VNkS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AT+I/C23";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fni8VNkS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xVgT1982716
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wgTkcWBuKdI2G+CM174I8QzMT6qUrNOJ8fH5XMp7brk=; b=AT+I/C232ss2o529
	FQeDGzoH6UQJK9vlkeJoul69r+93vP/FBl0/VzcPFR+zf1o0FmJ3U7D4KUj+pSGA
	agv5L3X2qMnGowJVG+BJlX8bKz0zxbaq4/vEoLVV9IdIWWWLPfThOtJem1yvtu2+
	Ro1668EWC2l9lQBDKLxeOuIJD4QlJgGSetU1uShgrg9AjYmz+5cVxX0L+u6XVW3y
	FYm+qSDzBY6IVoLS3qq59pmt8+MRXUSklvVHsGE5HdjhnOdEgAuFHe75qPDKM+kn
	+vvKcKbRtJzSaSB3dJSvUmlWSLIUZQCpc1ymzDs7DPQyB9f+EIh2XODf58/2IK99
	Yn8e8w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj6t0md4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:35:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936708f129aso552940985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790584545; x=1791189345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wgTkcWBuKdI2G+CM174I8QzMT6qUrNOJ8fH5XMp7brk=;
        b=Fni8VNkSes7bqzzxFcwt8wRhC18ZLsGIYYyizUJZiItLQCfAHHYQjf5OHOR8LKTmLG
         HRDYLEV41JC1CzuEa91zKtd2CeMpkzkT+p7dMz83790nDxupLVw8cC9G18EkfduYB7YR
         1odgA2lIZU8fT2oElqO60qXa+hmYtSgPGLt2dmr+aMV2hWTC247XNAjZNQI/8WBjKwgF
         vHDQvg2XEDTAXChXxV3FcqWVwh7mX2qOZpQdNZggPqo3EdAzf66mev8xyRSYi12dgO0Z
         YVF20v98SzUUQx1DErzhUh4A95gO95wYVL/a5fguDmGUPJj8y3qybnLFECvWnRwhNCrH
         iEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790584545; x=1791189345;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wgTkcWBuKdI2G+CM174I8QzMT6qUrNOJ8fH5XMp7brk=;
        b=Vvv7JQgrBZPub3/cZ8ABpV4BmZu2dss7WocxHvEnxnD8YDl/uQ2D1q0oK3f2ph17hL
         l+trKjZoDPTJosFaLI9ADTrhFwZEodR1nnwVCoWX0UhLcFAsG38sOmFcNALn9jcuMP9U
         BKjI+G9bBP1xK/4jZjauBjHgVjeDgMKXiH5yLlFv0BBI24LVvhfR9of40XvVSZFLfNlN
         +ClH5QSlaJMq4kBQDut/eB+i9Vi+rK8WufsJYTqno3AH4HZ1Bp9MzDuOiRgwYDxvxmTd
         5dGurT6xBkOGscVL4cGOQOsVnYFl7qmWIeCcp/+LKAvKVzLGNPpKxeFMVHxU5G/ZiQpw
         685g==
X-Forwarded-Encrypted: i=1; AKwUvBwpEEZW6ZcbnufTttf/BafCNXils2i2PCJ88Y9DhbY1tIOgaIgkGw61uivEXlMcQy4V3EVUkaaboyH2Hs0=@vger.kernel.org
X-Gm-Message-State: AFuF++kGw9twzUA6w44LVcYiZO3AbpLuB+0ioEffdYoOl/eb6ji941N+
	4JLlaL2HBP3ZALCewE/jfDpL9T1qXLrn/VlAETEODMYjdIkgjJi5x81uyVvJRjNHREQward1TSP
	8aD6rCnolpNHkCoUojfqhmf0/JgRF43KudIiSV/HJYGQJ/oN7vb96DfBWMhPZCOijs/IgNAvnpj
	I=
X-Gm-Gg: AYBFou3Ak5NwzV2pBpjgbYTVlp17rT8Eti+Y9eI0dAQfI2x+n+tW501UJn7ysIO7FM+
	n6jNXjVuLmgzLMR4b1M+n7ttPE5NUj+txUjcLIi01RneJDgmNgJXa9dHne/37Fzqbq2+CkhAwzQ
	/c8eWwMniuOvJw+34ywU2LstPWVmIPh08qqgN31wA5l/XFijKjKopWGGFmkGQzoJmO8JYLqWu5X
	vJw1l9mBPxSdjkmD9/A2+7ysicynWyoP1063fNM98G0FW0WapMR4ssxCMQaaQycicmZDf4A/qn0
	doS/Sh/x/LvG6xqI63qpVjS3OgtVb53XbViiTJE/3AhpyQ4tuoluawh/0kAqVjoKDKYNHdXCqZm
	LvGetpYgZTvA0GEbfqe8u2yOgHW0=
X-Received: by 2002:a05:620a:2953:b0:939:a45b:76ee with SMTP id af79cd13be357-93c43c8b51cmr1871364585a.23.1790584545378;
        Mon, 28 Sep 2026 01:35:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2953:b0:939:a45b:76ee with SMTP id af79cd13be357-93c43c8b51cmr1871362485a.23.1790584544923;
        Mon, 28 Sep 2026 01:35:44 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d5f4:8a0a:ffd4:396a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a007fd1847sm36343235e9.1.2026.09.28.01.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:35:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Areeb Ul Haq Mirza <auhmirza02@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: pxa: stop reading gpio_chip::base in direction callbacks
Date: Mon, 28 Sep 2026 10:35:41 +0200
Message-ID: <179058453795.16676.3348413064558617829.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924140242.126159-1-auhmirza02@gmail.com>
References: <20260924140242.126159-1-auhmirza02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfXxgh8yiCqJcbN
 XiLNM6T4KYPg21Ge95ug59YPsuod9ncL3TQCR/2aVusz4W2rssyhmclMf/IYLYccbrTDkO7ViW7
 YZNW+ipe9V92GDWf/NVXhA75YZPN0JosGopz02OzvfD5LV3j8bEnQzYmbEcnhoZSpZzR2gkBxkC
 o+bBxlKRCS+jjuXhFIvUtemLKz7CWYGeEvnCc2fEFAn5aJ4CcbDBAPL1Kb1AlIk3lLhQQe1hB4t
 v8BefHdobUClqHlJMgvdaaf31rxcIsw192ARWxsk46WWBBCBWvbiztmK2s09Eya53nScqXqU/5a
 lwazXxG012fkkDfEultIhj224RZrNVNNcIWtMYfUNtFJCnvIdbp2qxCMePttEsooOfNGgharbhD
 hLjviwWo3fQilbTKfHPesGFwtnhMOeMAAJjfiR60vTNaCBBEC2HVRcm6hkrM+MBrKqjLgmOy9SD
 d8x7A/+UX/46zXy16pQ==
X-Proofpoint-ORIG-GUID: t4AKwJ2V6mdOhYneOpEnXJzSV9uwxilr
X-Authority-Analysis: v=2.4 cv=dZkVTnXe c=1 sm=1 tr=0 ts=6aba26e2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5KF4HZeer-FmC3Oeya0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: t4AKwJ2V6mdOhYneOpEnXJzSV9uwxilr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfX9mAp0RYJv7yQ
 iLNuELWKqIWXUK1Wan062g/cpqv+AwheQX5QPpIibAoWljLrleILW+vrUWXQcB231ZDoaH6usLv
 EXHpqVG0CmqlBA4FdaM/5nWu+0tl0gQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280034


On Thu, 24 Sep 2026 15:02:42 +0100, Areeb Ul Haq Mirza wrote:
> __gpio_is_inverted() identifies GPIO86-89 on PXA26x by comparing its
> argument against hardware line numbers, and its other callers pass the
> hardware index from irqd_to_hwirq(). The direction_input() and
> direction_output() callbacks instead pass chip->base + offset.
> 
> Pass the offset directly, which is the same conversion that commit
> 566e684e70cb ("gpio: pxa: use new pinctrl GPIO helpers") made for the
> pinctrl calls in these functions.
> 
> [...]

Applied, thanks!

[1/1] gpio: pxa: stop reading gpio_chip::base in direction callbacks
      https://git.kernel.org/brgl/c/c4e74a7058b573617f142e07b4b5bc9eee04f4c8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
