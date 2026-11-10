Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794319410;
	b=do6ycVOH7/Fs1XeaeP/tha5QngvkZKgtS7MvxPNI8TU61SNgHg/KbcSe3n994iV7rCpA
	 i5qxkCe/JJbEFwoy2Kq5Ohwr5R1zs8u87bJhU+da9KEEWsde0QgCXtdACqR9vUIV/2/sD
	 E17t/0NfVdXnMOoF/Mzo49djRFIgUl92JYnVqBplHjomZjCWQE/95Vi0BUFEgYD/w8/zn
	 HAKc6gDZ7gbuFzIkFO1qdx8qXW0c9mK7crz0ZHmFbI07cECCU0Ao0MBHLVle6RXb+Q3W0
	 14gDniIAXvnUg3fzbsbtrzNCpRIewM+2xF3LGBb2Ivihscsyjp+J+isqazR5XI4dGdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319410;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HKLUOKp24Fh9UrEupb2eimvqyQLsemEwdcF5Omu9p+E=;
	b=N+h0wYHyG2nyMvwgwtNPtaynxloJh6S06uHTnhC1cG27Z4odJziuPkn035hBJfs6rM1c
	 O+VNMLfJWLUwuxfZZ43Cu670yij6EFhs3EEYNMq/yOQIwASHvfRmIKv28tFWfTfTtBk2J
	 GduVuShXifDhPnYpbfTH+Ahz1WSma7FJ+vyKWElL0+uGm+2ULr6dCOin6UOZIunIG6LA9
	 8d59dBFeElO6mkZToIqyarZeCd2EtffQNl2l/EHyxWoDVTK4cF/UOFoz1Y8YdAU/EJEBZ
	 ATT3DYS+z2Momg38corLTwXPpGXu7L7A/TI0f7e/z2ZUAqsDblov+3d+tqaomygt99g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4czr2ng;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=da+NbqeD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AD5606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9AD5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4czr2ng;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=da+NbqeD
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAFXK3178179
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HKLUOKp24Fh9UrEupb2eimvqyQLsemEwdcF5Omu9p+E=; b=E4czr2ngf7h32vEn
	FX/szMZWoKtVpvCmjxPfOLr4ozsCzUZ5hz27Pi+ErJJHsKwBhbFCb+jFB+GQBTe2
	PZs941Oexn6I/MBI3oP9Lb85HE2zYE+4o1KCxSpo59thXbSEvyT1xhtXKBfgcx3V
	KtCmC+zvX43LyCgq9O1VedQ2z+1VLiHhC4QuN+BFc/CKoIcGkoXcweOQUs/FqFkW
	BqbFpgbVMXy0n7MpFDzmy+/5vXvRyThXRnS4iptjM9vbkOdfa42BClbNhkWKbthT
	WgcXUYlIVOAwy9325VbfI6sYIbFGc+5+0z5nCO8Fz8m9tv8gN8ygwcBTVPJf8WYF
	ybfyqg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufs310-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:03:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so1987648a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:03:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794319408; cv=none;
        d=google.com; s=arc-20260327;
        b=gsK1rqZs7srSGv5MwkYctfayehSGln3nhkRjvG3wigPk5gBy3hWiHSGwD/99BG5EzY
         R3CiX6e1KrRB9Nz5QEG/l0zKrKa+RVQ16mC2JrLVgsko8rmjtGtvljjP1hRL//UxynlD
         OR+B9AsT1yKRuQLVRrlZgJI83yCK7elL4HEf+G9PnLJxxB2r1FsnIfUzsC0E8ucFEfV9
         jQMzqh4qFeFkNONMCY4cFO9YrIh17AxhqWVtvJWKq7Ze26euTPiwacf/iY3pB3g2FGmV
         uqRR1DNqhaH8nQTe/dWmZE9hbAVA06KDzZeqC7mkcwu4G/7q7SNt5wof6NMqX4w/JJiq
         2vgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HKLUOKp24Fh9UrEupb2eimvqyQLsemEwdcF5Omu9p+E=;
        fh=epCdDRO1TaHXk+yQ7UH6jHNhdl4uaBwx6Q/gbMqnYKk=;
        b=XEB9qRYkXVZ7U792FKX7YYODvqSPSpUaa2WVCoM50U/TKwZN5K0rpux9uK6o07zFEs
         N4c/ogNBjeiuev9LDFr7eyAHfUqWmp+GIivbMVHez6miYvLiqVjrMNfc1JRDiBLhJvWU
         KlenQDk5toIiY6BPL+NGwjVI/ZncxsuIFkUkBnI5pfkD/nhbXsXeO4qFR1fj0tnPiHRx
         WSVZmoVm1M7oxsyzRLyBTdPju0brW/3jc9azuS7NkxTBPKzNxfanmY9KxXSclltyP4NC
         5y9el6GPFUUJbqnQXzLRvJZoQcGsB4a1kBLfSDXVXi7QyRQdskuwfNyuvpY3KI/TDZX/
         PPjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794319408; x=1794924208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HKLUOKp24Fh9UrEupb2eimvqyQLsemEwdcF5Omu9p+E=;
        b=da+NbqeDLDGcxTGnR4c9JYZIgeOyZuGrREwI6Ashsu1+qRxzXR0yd/g/51xttgUnFf
         s9XpDgGhF/1FIEXMf8iq+4uIOae0jIG3Mcp5WhNlR5ezzZDqwn4F4t3TVmhbahh+muhW
         a+8hPzVcce51j2yo6EwWmSxSbD4CiAf1NZBba/slfXTR0U+yYR34Rrqpx0bgpDgZgLOR
         usZ3hVe+gn1zz9F50V1cP6LsQhXxor+aiejr4CX4gtWJXrH8B+rBzlrS98w/CsruS4Yz
         zBtRkUxRtx9JGwgiYyQMBGOEExoOrfLKraZckZvYwxB+fNyaU0gm9xw4SvaK1E9UPRbV
         sPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319408; x=1794924208;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKLUOKp24Fh9UrEupb2eimvqyQLsemEwdcF5Omu9p+E=;
        b=et9nlWCIDB7TMa51n2P9cBjvif6ykOtCIITASvtoptHuRt+II+grPu/hKEP/A8Ttnm
         8CyRnr+430zAu5QcIK6knVrWE0kvEAiJE4h6t1G7PmoD3MnCM+YqcDLmGlQDnZx/ag1V
         jjiVkbXT9sXtdy2kECwO7DSwqkk8kETAD/qTINGC2w7uPNqZjXHkCNlfsFkqN/VjzbUf
         PXIz0P+U09gwGMep7pvSBCPIYx64ROklS0TBhV3JKNpKSQ4GskBU51b9gnAenI3CrGPt
         h48WcbpO4wZlWFNLsF3F7iqYPK3Fc8l2tQdVdWhgF7p5farOqcpxlJFck7d5e7tBBNQ7
         J1Kg==
X-Forwarded-Encrypted: i=1; AL+hErG32zcu4GkNHNsSoTdxgYYA5c11zqQEMHe8L0ylRtK9iId/Dezg/TiU3cRzp1nGD2mj9DMc+HCmp35Sfmo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xj0vMqi5U31nmHoEMyEH2jPrhNeuJ1y94Oj6Jyo5BGzCZ1TMu
	I6AF+xPZo6h005KMP9AxT48ltRWMcov54WvtNr7iP3BDmHJVra1ejhMaIuK9/IYxOO71JPR03OB
	KVH1LEfOaLrd8uJ5d1nfXrGcv84LPbCWh/Qjx0KSw35rQmgfu74BPkGdetFq1LehKcYeIpJTlfF
	s2fiCqR5jC1Uro4VeE0QYpgSkP59l4m4Y50gT1tMhzYA==
X-Gm-Gg: AYBFou2lxArjw2YlN9IvYwoZg0pV+0cN4kS+t87wA9aKfN+c4h0/Cld01U0Mx9Ao8Dj
	xWWF4hrftczzZ0Y97uETfDCwITZLP2mfL2LN+2EcA9em5INEEtcZ/4aK+KzT9kfuk1aZJFIoxR5
	PngsehNldB+Jn/2AbI/v4STZet1VubjFhy+mFMFGZ0KKpX8HEWNhi4dfPWww==
X-Received: by 2002:a17:90b:55cd:b0:3ac:9925:72ae with SMTP id 98e67ed59e1d1-3b166cddadbmr2321953a91.31.1794319407881;
        Tue, 10 Nov 2026 06:03:27 -0800 (PST)
X-Received: by 2002:a17:90b:55cd:b0:3ac:9925:72ae with SMTP id
 98e67ed59e1d1-3b166cddadbmr2321927a91.31.1794319407353; Tue, 10 Nov 2026
 06:03:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030123647.2356647-2-thnkslprpt@gmail.com>
In-Reply-To: <20261030123647.2356647-2-thnkslprpt@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:03:15 +0100
X-Gm-Features: AclHuK8KMiLyeH5HgBM9NESXCQaXze4wyF7gWrDjuSUQtT7rBS6jklpCRNO-j7I
Message-ID: <CAPx+jO_NViokUMtgjeEG5_=Z=b9DpwJCpwX2HjLsr-Yitb6G6Q@mail.gmail.com>
Subject: Re: [PATCH] memstick: tifm_ms: use the correct DMA direction on removal
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulfh@kernel.org>,
        Maxim Levitsky <maximlevitsky@gmail.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: n7glgGaSKoZEWyrnJC__7qCHr-pDl8Nf
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af32430 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8 a=PtCAOrcFS5Iqh549t3gA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: n7glgGaSKoZEWyrnJC__7qCHr-pDl8Nf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NSBTYWx0ZWRfX8yd3KnA52kvA
 U6ySADs86hZJ6Mgow+FkqeeEwm3BPT+g8yMQDgc82WnjDmbinqkFCwPG9NdY5DMOJQuq7DjTskV
 7t49noUx0N1WGBKJ9qtgM01s6xwYZ6E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NSBTYWx0ZWRfXycs2+sEWQ+7O
 DraOwqZns3l/1Ygn2Wwvun3AA39vWNmm2bv9H/TwB7Qj0W6+PU3fI4dNA2WeBlSecxSr0z5jOwJ
 jVz99LWQ6Ofm/jz0dPS0lDEEGSb8S9U1b6rbRCy/ol0vU94wH2v+9ZWr1NfSPCa4IfOyB9FbA5I
 6gXX1JeP7aX+7gdXEB8Rxm9uCmZbxzmgHB8Dy5P3tAc6fNzDQNiNgR2NjW0Nro0cbwhS22AM2wz
 iehqA8bfba4tDNmcoVzt3HgtsOPiVxmlmOTDdsyB+hXmlMjIFVQW+2rKh46buZZos6bMpCcAjpZ
 sAUmKqQQKGhiMbLhKuVFbugNUCqbcEI74k8m9WZ1gsjTuHoqxiIBx3IYkU/RhuK8DXEU+wu4lya
 gColqtZaKzav3/6kpkeHItMeeHTHDH9daAZ89CBriyzLjCuP08nJbjplcvBbn0HrHyPRKewNTzC
 90E3qWnA9XSaMiYs76A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100055

On Fri, Oct 30, 2026 at 1:36=E2=80=AFPM Avi Weiss <thnkslprpt@gmail.com> wr=
ote:
>
> tifm_ms_issue_cmd() maps READ requests with DMA_FROM_DEVICE and
> WRITE requests with DMA_TO_DEVICE. When a request is active during
> removal, tifm_ms_remove() unmaps it using the opposite direction.
>
> Use the original mapping direction when unmapping an active
> request, matching the normal completion path.
>
> Fixes: baf8532a147d ("memstick: initial commit for Sony MemoryStick suppo=
rt")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/memstick/host/tifm_ms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/memstick/host/tifm_ms.c b/drivers/memstick/host/tifm=
_ms.c
> index 0a54586aa54e8..171aadd4ec71a 100644
> --- a/drivers/memstick/host/tifm_ms.c
> +++ b/drivers/memstick/host/tifm_ms.c
> @@ -606,8 +606,8 @@ static void tifm_ms_remove(struct tifm_dev *sock)
>                 if (host->use_dma)
>                         tifm_unmap_sg(sock, &host->req->sg, 1,
>                                       host->req->data_dir =3D=3D READ
> -                                     ? DMA_TO_DEVICE
> -                                     : DMA_FROM_DEVICE);
> +                                     ? DMA_FROM_DEVICE
> +                                     : DMA_TO_DEVICE);
>                 host->req->error =3D -ETIME;
>
>                 do {
>
> base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
> --
> 2.43.0
>
