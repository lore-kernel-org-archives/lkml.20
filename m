Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619960;
	b=LPNy15iCJF2YbxUhGp8HnuDYM/R0s94Mj9rn4X9QlVn7MbuocdeDyv78aUV5adtd4J1A
	 1FXMu3ScqTy6w7C5oKbc6L7lTUBJNLz47meq/6ttpKnuPCqZQfhxda85oLPVSaaUWybhC
	 IlX1/zvVBNYN7LhybTRQ6GXcfVTFZh1XYRMCLz+LbtO4DBFE9W+c6MbXKEswAvxdIWPpb
	 JZYdHvI6AEir/U0sra+0QOoEOlvXSpjzbi6IZIN9nFy79Q4oRcsz0U2eftV6WTH3ZBAfA
	 7kaocYhNBfZK68A4afvpBjJXPibA0wKRnC8+9ap2p+OKhJ5UgkmdKwgIAqlBC2vgUvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619960;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZWlFwcxl2xS4n689x8a7L4fhFq9uoke36N6N4X0UXRU=;
	b=xSsMOBsM3kAoPdKwC9uLjYIgsOLVVQ5x26fyOYcau4Yiv7fLXDseiBn2wOPAs2sDZgO0
	 2RHZxQQYiB9sEN9r3lnw5bwU/ssAq2t+CWcNPwCvdTgj0IUapR33GCuMJWk+9fM4HdBts
	 UY5z6fN42d78jX2CxlwuD/QogVw7aj/puc2kwx1oO2P1AjimFLbm6coPMSLmWqRgJuL1J
	 bmQYJ9hZ9LkgoYgmmFWhRXPMPEeOPS3j71JauedMlbDbAx3Wv2HkpM6R1Lj5ChjU5bgu8
	 pdqanDMNEFZBlt7shwj/BS9HoA5W46QUvrNzBRzLtMxPljlSQA15hZ4Jo69WcS0C7rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SBEApJVi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f64+2Ohc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632E4606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 632E4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SBEApJVi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f64+2Ohc
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ALbA2880833
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWlFwcxl2xS4n689x8a7L4fhFq9uoke36N6N4X0UXRU=; b=SBEApJViBHSkDqW4
	JVisjVeacG339NzlxoFxJd6O0+T8qDa6jW9eYnuWJL84ZiI6z2/b1SeAM9oXP1uW
	SF8/qI5ioqTv7UfMIz4Ay99lT8EISO3zL8+b79xRNSTrZYn02K3WP8DW4CJn3KK1
	7376RSXCa5A7D9pJIzNvoRupn7HuJvlpLZ7N0uKCtIi5k0UOJBCdeyaZwUPjMlhy
	hd0yi5EX87hv5JElC775RIjE3fKoqL8PGVAOsMyOth1XebP3n4xSRdzQuP2slCGX
	K8xPXO4ENMS3Vx10Iq/0G+7UlyuMce3xkxfFXULNivLoDxrKBluEExV8sIBVd3HB
	jys7fw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgn3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:45:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536540909e5so8507171cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793619958; x=1794224758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZWlFwcxl2xS4n689x8a7L4fhFq9uoke36N6N4X0UXRU=;
        b=f64+2Ohc+nBOQnsvS5CWWk5t8HRX4iGeDLQ0PnQ5cDrfE5W5ReMsJhUyvQILLhjndz
         21DMVJqmsZi2Lrz8xbZQynBWoOdrem5VjiafoInHlkJI37qFm4mqf+78dtvKkpX0gsvb
         L9P8XjueW8CH+xK5YHyA7rLbknNpNdnqXLaaIB4QMTbFS/eBGcnJJa9f2oxRq+cb+0Nq
         5E5MADRghMu6bkb7Hu+xgLdyxKFdvkIgdfJjs3GmI0xE0T85Ou01Teomzg7+eFvafgsn
         tGm9J/FBOqQvepGEfzPpURN+Y62R1G6pHnPDZvHbIG5OjO1hHfAoMdb7VpOExdORaJG+
         VcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619958; x=1794224758;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZWlFwcxl2xS4n689x8a7L4fhFq9uoke36N6N4X0UXRU=;
        b=w/HtaWoYgtF1fauSgFFCwe1F1+9UotNWvIs0QxbmlJ53pGw6XLSLj6f4Y1Men6wy3L
         grEkqbrKLPs8hdoyAWgN9X3xFKG0xhXF/Eay79m52R24rvrEv33jjT1iFMoOECJj4myf
         fh+jUQlKAMq600QiUhzcUtDd29mJ05a537ekzITsKYG/9Piz3MGIgF3VVDHMBrMtStJE
         zTP+nZbcOMct5RJjn7S0yZ344EJKaVX30fnc0+hnr90GH7xf2gBjFFIpCXSd5nU0qtdq
         JTpkiZM5hlqZQMHIo3g9M5tmO9iXh3d6kEjsL2L0UnPTa+ZT+G3qaQ0q8Pv3aAAwBs6P
         QHBA==
X-Forwarded-Encrypted: i=1; AKwUvByqiUD/M2q43eayehA+GawyGzA6qD7gd4ZqTcscjppKLOqLq+zB6VzkghHqSD0cpCo7spVr4iBFD2JVpN0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9nZly3rA+t2KlBmCfA8e+t/l246X3onvSWo8z4wk9Dv7AgKtA
	6eTNvtlQKia+eOtS+yc3qug+NoN9/c/E2qgHnuXqanJWl0tvxVFnwKR0BgLtnwge/mYX6nJ3wtY
	2+XpheSCOSG340Aci2V5RxqShqFGQxvNi5jyPgVrYy0zLS/z8YPkm9hXufCeaKSCUzb4=
X-Gm-Gg: AYBFou2S5vkhbZidwcDc0pdGoT4KE7qZZO9IjvdD+gp9lOjZBV1Fqt3ElBQQAF2forP
	RwxBy4KmkOlzBwrAu5nHNRwtt35wwRC/u2msRHC+yrxrJssP/8l3lO1gn4tdeZb4k5042fopi+B
	qa/VzV4IuqPGGASJkEBEzcd7Lq9r3QP44Jtxt2bFKMBrqpIpsuUZFJt1O7sUHAYSQVQCnp4IQXl
	hh8NvTJzsbl0L726iSHLyltkdbKt/2BU/AQLE0zwnqBukVC8Cdo8zuCWf+DqdmMxlfz4Dwp5D07
	Fs+u+BP4AMpu39dglIkRShrTPWLulWZG14bVGUV4LdsynRsmAv9hEb90wIyJtddkyTu2gdcAMCc
	D1mmN8aH37v0H1GHPQt7oET/BxmkS1GnbWwk2znpmVTrvjN04D2hrMY+WUTtIbMBMxX5bdjw=
X-Received: by 2002:a05:620a:a7d3:10b0:939:8bc:8826 with SMTP id af79cd13be357-94421529babmr1591536385a.2.1793619958353;
        Mon, 02 Nov 2026 03:45:58 -0800 (PST)
X-Received: by 2002:a05:620a:a7d3:10b0:939:8bc:8826 with SMTP id af79cd13be357-94421529babmr1591532385a.2.1793619957897;
        Mon, 02 Nov 2026 03:45:57 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0fbd6sm3168706a12.24.2026.11.02.03.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:45:56 -0800 (PST)
Message-ID: <34b84049-f3cb-41e1-93a8-786ccfc3697a@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:45:53 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] drm/msm: Attach a driver to the GMU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akisaira <akisaira@outlook.com>,
        Vladyslav Tymoshchuk <tvlad744@gmail.com>,
        Val Packett <val@packett.cool>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
 <20261030-gmu-sync-state-fix-v2-6-89d3082d97af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-gmu-sync-state-fix-v2-6-89d3082d97af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae877f7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=_eAPKBbB64WD-mPM3f4A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: xzIBgAxs0yLnxFTO7uk5SYn33ECpmM-M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX40zZTuYM2oH2
 LY+r/qZK9VJczzfYMBVF8JEnQo99SAApSUxP+T7dUsP5UAeu6WAX4UDrx0EerDJW2XIHf2X4i+s
 8Etq/UohIMr/jJiocLIkY9sB0Osr8ak=
X-Proofpoint-ORIG-GUID: xzIBgAxs0yLnxFTO7uk5SYn33ECpmM-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX1ZDq0hs4c/WX
 31xDwRFJGVly0ayBw4B6Siuo91UWXMdNuZcVXjWWKSgREuZG0P/6Z6OfugT1L2E/D0eeA7+epEz
 aqXVUVyWYqmMvDkP35IEuaU1ZwkUqT94FfszJV6zVjjOX9JrCtGTrHXC/3UOA/QmNE4SJ1pQ4/p
 n6uf6//6cmhimnWWrn0/OZf5hd6xVrZr7UEMMisQaxTYMhHtIirDDvcMz3pbnzJtBJ6PZUhIlxq
 9EUJx1es/Dfxk3wh8PI+FxhiAB09Fi5Vq4iCMshCAqjtxJerW/13uv3vCaNLJBVg3vD3m2JlhjH
 TcAXtwRSwXGxuU/ZkLWKhW9zdkJLtvCu7a+20ojlHpBHC3basZ5XQTRkVycCPGhOKKrlDiEJ4ns
 8YZ8LRARPeUc5J0jEHpJsc1DrFtLpp7TI81ZD01rALT4T77+9Qy8O92yV3tMvhYu67quQ17Iocw
 2BGo0giUqke9jXzSv+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020046

On 10/30/26 6:09 PM, Akhil P Oommen wrote:
> With the introduction of sync_state in the genpd framework, any consumer
> device of GCC and GPUCC which is not bound to a driver will result in
> bootup warnings like below:
> 
> [   24.362666] gcc-kaanapali 100000.clock-controller: sync_state() pending due to 3d37000.gmu
> [   24.371210] gxclkctl-kaanapali 3d64000.clock-controller: sync_state() pending due to 3d37000.gmu
> [   24.380268] gpucc-kaanapali 3d90000.clock-controller: sync_state() pending due to 3d37000.gmu
> 
> To silence these warnings and also to have a proper state in driver core,
> attach a driver to the GMU and set it up as a component device for the drm
> master device.
> 
> Since both GPU and GMU should be bound to a driver before a
> devfreq/thermal mitigation request can be handled, move the devfreq
> registration to the bind call of the master device.

Can we do that in a preceding patch to make this one smaller?

[...]

> @@ -2308,6 +2298,8 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  		goto err_mmio;
>  	}
>  
> +	mutex_init(&gmu->lock);

Can we do the common init (just like this mutex init) in the common
function?

Sashiko has a number of comments on this patch

Konrad
