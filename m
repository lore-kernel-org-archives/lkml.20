Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610324;
	b=Cp9SS+NaXpxFRtOnkXGBqCOiQ5y3pUrWiWPYZVs1Mwlgao4x+DB2lg3Fk1xC56b7sq3m
	 rFafqtN2pYqaHf6KdD8qUMe0Z3Vqv59A1hWbM2/en9wr7t+9koHXhy6oSkhbow271g9qa
	 Xbq3zosNssDfQLQTXbIzWGvUkzssMiQ5uy/7+ogSnfyq82JGE/TblzpuNkBN5Onyp1kAS
	 5dbDKKC1rb6PexVV+ms9F1XowiLM4NVNmlFbOPHtpnF+JZmZ3OSKPWXL4lflU1oV+J3iT
	 /po1L8fdF9L8gh8YsW62QvFsvX31p5iP0YFzLEjIWthvBORZPXl03mJjpWQcZ4/YDkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610324;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UXOzgWLBPI0HSZWw5ePXFl3MWdfWtmydjnBYKW84RMg=;
	b=txryYSdkwBRGdDyVfdl70Kz6Ax7M09irUSdTJmoE+NmmCWLFy0YqWxQledV64sjnqZMv
	 bA+mDqYQfvwo7qOkl614if6f7ty1eGAM7OEW8ob1GAKROEsyW14vurnM2xAzUcYxAT7BO
	 sjY8xbgIFxicF90ly/gdqnjUJ3xSggtRCpmSGZV6wNfsNjYhHdSgXs9ilYVp3yf9aSy6E
	 lvYLWm0YG3jM+HBS6O2DGrMPvEaLrbgn1e5bWo49JjxRuTjhhuHKgCdvFaMPUPSLzW8Nm
	 UAV/o2k8VrCcpd5aTdjvGsGVO/4hYVC3D8ZndfEFtRacohrasrqwgqPIehZCuHSa/3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="b5HWdSW/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AZun7WvM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30882606A33B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30882606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b5HWdSW/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AZun7WvM
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A27qfbK3862983
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UXOzgWLBPI0HSZWw5ePXFl3MWdfWtmydjnBYKW84RMg=; b=b5HWdSW/zSgKoz1N
	L8Pr8e6B4Xo/4s69tTk1iuZlXzbgB67yQlMXYarygb7OvwZ64hxSc9IUVeSGWwVj
	SWQOltrTAc4Q6OvHAt/3ETz3HW2JXLt9DVCwbi+cBKsaCkeC43/ozqr6Dr6XqZoE
	yRaBW56IVOploExBc2nJFnUMSpskY9+CKKlug/xO96N8ha8Re3IkNX1b0dPir1Hv
	NDZnWvpOiG8eenpu+docwuW914w3MHx8IPckko0c/wUm8Tbldh8QvMY566H3nIRr
	3TygUgnclbyzO7dywYsgJAyKn7EDP2CHNBO1GIN2tbBU4ZskaFeZyZdJbn50QpSH
	n2tzJg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph189x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:05:22 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c10b8abe29so2310811137.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610321; x=1794215121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UXOzgWLBPI0HSZWw5ePXFl3MWdfWtmydjnBYKW84RMg=;
        b=AZun7WvMi3jnGpyhMMt1R22R5BTKMCrsWMSiz0mNHGbl/0qCTSJJ28zg42g1HAA3/r
         9uqpnEIF5PpWkmdUAkwOa9bhnAoW7p4d2OIaHLgBciXbKo2fJT0GwrzQ1DqlkHCFvsQY
         dliQ6xfw5EEyoKmwPLpGajWsBl5gXqz3sE8O82xvRHVtZCvcytnLHu0C36qrArxeRJVn
         pWMef3BR9NgV0yJWzuKdjjGdo/+rMTRKNECroE4GW98IePxvkzNsqGHUZPDzQ0vM5AeM
         gNEoxxbaqLJn+Xx22xAVpDmtnG89fpBP063VDMx2CJsesgOQMHs73Y4C7xAk3YSya4yg
         1uwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610321; x=1794215121;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UXOzgWLBPI0HSZWw5ePXFl3MWdfWtmydjnBYKW84RMg=;
        b=VvgKp0beMFKVoHMH4ULatSQbtaOW/giInyJ855bYneQT/5I6rOXrYUnBm2aSN9pbl9
         xDtDhSBne2e5C7oLpn50BOQt5k+qYryAIi7FZfjGVTD2IHWPhyuNAp5aDHAjAryLkiDS
         2agaVJR2xP7VUE093g4vYnisicVF4XP1Elt4QfyO9he31fJy/XTIkakBDWfprKo0gzpX
         +jgfScYTDFu+XKGidJT8mga5hBarDePS/n/LKvSn8xeVL0wcyXSHZz25SbCo/LhnX1br
         dvWu6kr/UcvTVM5WcMTg1GUItOjIoqR9OLQ6qlWeX88dNQWbuYnAsNorLYMv+G2lK6T1
         iOOA==
X-Forwarded-Encrypted: i=1; AKwUvBxXN9M9jVyfB7gsP623CTKidYa1Uv4d+LSBveQX11ZWBSZbD6gI9WS+vm+7SpFJJsIuP8YoZihCq9KM+oM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LM+SMZBNiBHQIJ/lfogfQlSru5/EFVO3lvRnswI3nuIf1Z31v
	e3DN9by9eXEz+c827Uv6uwHDUWVewAicdTB2uERUr9dUNkserVdzLLZld2Z2sh5W2fuHD2OIrJ6
	LP//MUvJkyYPPfkq+6mhylvJ4l+A75v5hoRlDAJl7/972CxqytiiiBoMmq69MwHYyp/0=
X-Gm-Gg: AYBFou2kt8q5q5EMLDkpRcIEK2eKoh+OXhUaitSRZXM4xLuYz8yvlTnAy2raGdxAt9K
	B8IojuU+7ni4XK2rspU9xgkP9mcv3i4Xsl32TIROayoaUC2waFgKDNrSiYi3u2mGi8J/2AbE58z
	OrAcmK3uj66fBTzsoxlSixZT6/9OwIUKKytyiTr+wHHpbc01xijaEiQmiZIXQvT+gDigZkamagJ
	YEhQ5cNgsoX1jCdW8b0/bh4BNgAsrZ4mvxRn7fpXc2P5bL16Bgb9EbXgvEgAJ0PKZq7WsaMvTeI
	U0HMsrZkq5XWMIDJqvzPfu4sT5xlgk3QWVe/EXVtuRToj25gCbAwCGKOMcJ8439WWpu8mmlq8eZ
	n/4VsSLnOvq2b3mx2bqk8LHVwoL7D8IE+ZyH0vWdYvS/9yNtiJPevUO1Q0ax5iNkVnniTDYvsGw
	Uu
X-Received: by 2002:a05:6102:3706:b0:7bb:c382:2ff4 with SMTP id ada2fe7eead31-7d0726ca2femr3388981137.20.1793610321472;
        Mon, 02 Nov 2026 01:05:21 -0800 (PST)
X-Received: by 2002:a05:6102:3706:b0:7bb:c382:2ff4 with SMTP id ada2fe7eead31-7d0726ca2femr3388971137.20.1793610321039;
        Mon, 02 Nov 2026 01:05:21 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm17342081f8f.28.2026.11.02.01.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:05:20 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: sim: constify struct configfs_attribute
Date: Mon,  2 Nov 2026 10:05:13 +0100
Message-ID: <179361030998.39187.1516178621845255943.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020-gpio-sim-const-configfs-attrs-v2-1-ca4b79d2624d@oss.qualcomm.com>
References: <20261020-gpio-sim-const-configfs-attrs-v2-1-ca4b79d2624d@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: M-zPAxAkoerL11Hr2jFWFryGu1yo_cqn
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae85252 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=C7DGWjJ-WdxfBjvmcCAA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: M-zPAxAkoerL11Hr2jFWFryGu1yo_cqn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfXxSlvmpPDiP5S
 K0XMiW9CfAvFgD66WYu/mIt/PsgvZ+X+BCmG6TSwSMptYS7jcExBNa+T4/M0bt9J9PAn3hcTjhO
 5XEfY4XsoAkOeCrPWwakcrlG3D2QVUkj4MwxqEc61l9axNavapTOfGjBCQkOG2lOGj/e2K4zlZG
 YqUI9vO6Ri8io4Hak7Ht1BrmJRlboUOgpXiixDS27cKgElyqS2PZ3KtaoCo7sWmZP0CzCtT1Ptn
 ZQ+2/nGrFda0ooaE5zlKWS0eWbnkdlPxrxOlkf19qtbrUrlslgH8cPtcPxMtRTiISoKaBp7SSEU
 ETDKcxhyZb6tOPG2nk0sb6rsvffnfTrahP59vKzNhAVkvXTb9f3IjQjae1ISYx0uy/swafY28TT
 O2kQ1HQNVqgsFWbD3Sg7KqGh3496eNdFGt9ko2bL4HzZFVZ99tEXmfoYsV1sWgTTFQmqhuq2Jj6
 5Wx2am2kTKBSm31Efrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfXytO98Nns7Cc1
 MFU7bHhDG+jZi7V+wsLRzFsEdONoJDPJ5dorphONoKSGRzh6srbzMQL+U6Gc+H5SgIMbj/PUcIC
 Xdp22uKLSiZsjHmjBfHNWFCiYKp2qpA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020036


On Tue, 20 Oct 2026 14:39:23 +0200, Bartosz Golaszewski wrote:
> In preparation for the constification of configfs attributes, make the
> existing instances of struct configfs_attribute in gpio-sim const and
> use the new st_attrs_const field of struct config_item_type.
> 
> 

Applied, thanks!

[1/1] gpio: sim: constify struct configfs_attribute
      https://git.kernel.org/brgl/c/b4e991a98844f240d1db005e65992c9246c9e7e3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
