Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006140;
	b=eJNHXPKcHZiND36Egru5Rn1KWFzVq5SLsV4T1nXDi+SZnm5dTSogCu4X/yYOf0ab4S8C
	 zmeWwGrDY/WNe9qnIH2vAwVoyQUsJ3D9xJe7nFi0j3V3/u51j4hZ02q33ny/hy7NZuLtF
	 N2WSSbhBHWPDPDK+bTI8g5v1qDlQwuxC0h69NWyygE681uoKJywq/hEG/6a0EpK3PcZMs
	 XegOxulmq+c8lyU1qbmExnxmHRwrFsU9WJQG3VcipodmZg1vcyi7v1udSn2mSsbO6AoOx
	 Ed6WCQGg3DN9nqHeA0PPjUKb9a215KK0tx36KOQGw0t0n7SzzQUooZtWV5z0xdXqvaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=c2xXoHXxXOmiBow795UfR0gDHVbeNq9gSE/Bwil+gxQ=;
	b=CGsF2NF144fRRqXfZ/pxtzWOb9qkVgeBaNVZUAYSrO11kZf+OoC/rOMYfo1NQFJUytNI
	 Zy++e95+0yq2FeC6RdDq4FGE90rytrodUruJjVGUkMtUxnp6MePhV0W5w+omCjBOxdQ9U
	 K2EsCnSPzhVMghFY7r7+Co/kBDFoM03RarGM7roNyQcgJ3itf1o9Jcqg1cSTDVkGBvEjo
	 1xAr4pVZOt8lEFWu9t+9G+Vj6Me1uPFCKz69fNdEyBW2fl8pmYBH7jnljXVnm/dvrClV/
	 hPySWiooxDH50kdpDHIWcV1d+XQvt2x8aU3MhO8vMnMdoqdSIkvOyW2qtnBX0j9OkgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WUgYFR4s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TzXRPRSy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF08606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAF08606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WUgYFR4s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TzXRPRSy
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b1XK2206175
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c2xXoHXxXOmiBow795UfR0gDHVbeNq9gSE/Bwil+gxQ=; b=WUgYFR4sTGtWjFKY
	66jXQhx0WuLCHICfw5AYC6k356oboZqmTcAx8JputT4MnDGKLVG6kxeogx5gJaFx
	QEFnthrgms2Bq1Tapxc7NEU9pQcxs0EBOyj9PD4D87KKLPvBfOdZr/EpPNx3bnyz
	/TNHhQvZj0F12A6F+7WcAizuC6DrUpIrJmrx0eV0t2PEVHfFiEDlQxpxDk39kwN2
	xlj0D02XC+eZzkOgyH23hJU1E4M4/Rfv0TDaDXTxy7qYaa6tTO1iD6J0BhkkJtOd
	tFfBxkeVD5oI6aDlsK7j6YJkSV2lo7/xBulgzCyJ7IhEoz2uPnGYLXRyQSIw1ub3
	zj6gOg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrunn56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:15:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea6b66e53so35595685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793006138; x=1793610938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2xXoHXxXOmiBow795UfR0gDHVbeNq9gSE/Bwil+gxQ=;
        b=TzXRPRSy78Y7KUyAI8JsvG8qh2sfXgU3jTWLGdEjLfSkTL8C9t1AWtXCOBlKXHZTmY
         0EXmfoToscLg05w/zN2Om5pwyCM6Vm8Xy2s/Ry5qX+jTo4HZNgry+ZgdCGgC+lB5kdri
         JuldAJEQTWDGodEYI8bmpAIBcT3LA3WMNPOAh8zd13RHZaiQ3SUpr4cLN9IDTlhvWXV0
         7nZe447BL5fjDwFPkKQEUedF8WU7fDlKswrPs8NYxsRJvk4ODET19hIPbYSzPVmSmeDF
         poxQNhNVcjco4DG2QIWQeed16Id1c/oqd6STFv8hTMK+Zs2xBDFdFIskScCPLSj1F/yg
         dpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006138; x=1793610938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2xXoHXxXOmiBow795UfR0gDHVbeNq9gSE/Bwil+gxQ=;
        b=h1ehCsuojJi5owFlL2CsBL9ixHR+eYgGBuNzEEFMjs8wh9ojsUihWJonoUJvoH+Hve
         D6ZhkBQs0I5oEccq2fhJL026POg+0Yiq5SXlVMi53lU6+fYyPAFj5INLWVhpFZdA0z8a
         wpk/svp+KK26ih0XwQcdKZJDvyNrBYcaqD0bBNkNdqE8E4NVbD1QhyVnqJ9FZ69i5dEl
         3VfAvoDkCRTMUkaFEQK6iiC0aWIfbZvcDAXhAKQn+ry+XP/NOuMizOBjSZw59IrBUM22
         b7UqiLYYkA79dNQfWsABnNUNZKzx1k7oWp8DW/URCDBXDqLca48SS0GI2/iMhUUkc7AG
         fDYw==
X-Forwarded-Encrypted: i=1; AKwUvBwXcmA9LV1O8FC7gP2YmCdO2G8dEVtBTF+a7gaLJo/2i9gcWKPpznRC6toKnGSOwRo2vjdEwCfx5BuavNs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIOMnlLKSQg4gty0p2NY0kpyZQ7QvZMRRGP4/HupSgfn4tJiFj
	Onf5cEKvtGXITYRuSn2gYn/0sTBuQp44nuunEgqCfLhRRWQcQjd8G6M+TrhzZaPL+pNCVhuNhKL
	AVAVL+CgZYbT+yCleAtOJI3kLPuQPTkTj4zNHU76YS9nY2yPpy8LjpwafuOU3ZOWy9J4=
X-Gm-Gg: AYBFou2qRUQsldyxpLbSxVxBE7PansohxqvgAHEJei6ttDDNbvc6oIYw2qtDUmcaYaa
	KNjBf4hXu1onWy+EgqemBmgqTli2yF9QJXUNAWZ4sXniO4mcky4ibKWxR7844h+ItsrlnQXJqNQ
	rla0bDq6ip4AqFHzL3Te28OsX+Q/yoIM/1zH0Xim8UX14DO9jV88N9yUB5r+JBQPHbez+8GXQKE
	+cmRjA8EI9SV6Mjrdd7SEbbGUYbIISmwYpZbiXg1G7rMoI4hY3IPo1vECDGBn4LZxitkn7fre8n
	cIi3lkD6+QFLLSJuqk9IpXesMYoHpYfAwOSNDnsHr4LoDzd2MZjDISrGCWhpNi73uNSqmQjcCIB
	MKtanlbcAOQss0rl11ZB07Q==
X-Received: by 2002:a05:620a:6e9c:20b0:939:8148:1e3d with SMTP id af79cd13be357-940ef81147amr890466785a.2.1793006138098;
        Mon, 26 Oct 2026 02:15:38 -0700 (PDT)
X-Received: by 2002:a05:620a:6e9c:20b0:939:8148:1e3d with SMTP id af79cd13be357-940ef81147amr890464085a.2.1793006137625;
        Mon, 26 Oct 2026 02:15:37 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595e70asm3496891a12.9.2026.10.26.02.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:15:36 -0700 (PDT)
Message-ID: <ad790e59-9de2-4f9d-b2cf-1be9e7ebe292@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:15:33 +0100
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
Subject: Re: [PATCH v5 06/10] drm/msm/dpu: clear the CDM block left by a
 previous reservation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
 <20261024-fd-kms-fix-smmu-v5-6-a5b0b284aead@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-6-a5b0b284aead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfX0bnTvX2QYV1D
 Cv4XUN552ZOrPueR+BxpN+OlmAwVTkiucsm0krkLf1Q323TQvG52Cxjgvl+sNfdaY3685Ctk2AJ
 1hMdVksREIFGJz9KmZbLVOGHMy3c7kZ1jCz7+8ds9RO1SAYtIGdRWOB03SORCBQ2PSe8aMxVyoz
 PbE8nKobEZWncTfIGIbSiskN+r5jJTLHhk5UiLoflRL6xT2qDMWrZyTL0cAyu6fYbe3YHxmWgQ0
 h0iva74AwDCwe+OMmD4PL816234amgToI6QvGXsIXCfpVE+o51rzuEZeJlkJWFa8eHXBMe8zeHG
 915RokNsJsfdhxeUw2Mt7iPYpdLpDEfrAknWeYIO1i/sOEmuP1VKJbAF2F9+/GlcgMDizvRa6Ut
 oy18X23JIN+T+k8f3ZMtWrcdmaZVUAXIP7AV2Z5fGIZGolaSASZayPoXyz8z4x2nJ3jz0tEcyFC
 HElLdNSBaRmQ6iR1XDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfXxUafEqGmXwQe
 32kq73N71IjDHhWwLgJPA7p9UzBXZD0X0ViqB8dvJ/Kw63szOyJ/gDwgzfJsaDG3I+4UwFucG4e
 rq2L9JWXtjFmVO/Bj5PI7f+S3kQOHuk=
X-Proofpoint-ORIG-GUID: WaA7XgCt8G5aUHMUxDPwzbPL3PEhbf2J
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adf1a3a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=h7YTzkf8KlyT4Ruvd0EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: WaA7XgCt8G5aUHMUxDPwzbPL3PEhbf2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260036

On 10/24/26 1:25 AM, Dmitry Baryshkov wrote:
> dpu_encoder_virt_atomic_mode_set() only updates cur_master->hw_cdm for a
> writeback with a job or for DP, so a modeset of a writeback without a job
> keeps the CDM of the previous reservation, which the crtc may no longer
> own.  dpu_encoder_helper_phys_cleanup() later unbinds that CDM from its
> pingpong and flushes it, changing a block which may by then belong to
> another display.
> 
> Store NULL when no CDM is assigned.
> 
> Fixes: 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
