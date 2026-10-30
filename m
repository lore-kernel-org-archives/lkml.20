Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793358045;
	b=fvui8Wys5bSzPx1Thfe/2VL4JUfRyINMy3+Sxr9ipW7VXQA/bL8o95N1nDRIsksVKx0D
	 9qpc9ocUTHtnf3JFczvA7L1SrpXCsv/CFq0A8XDhT+z0WtSB2yxlD1ejZeLCJHpHgpmLY
	 sLXpyj5hWZMOmZ5RMNFU170bsBGhq3pqa/O12Z9E7ACGCEkdya64HnEKgTT+nsRkCCU6B
	 XYQxoxExuJ8Wq/6fscQKDQbP8kbk2QiNLGfGaZQtJ9RrjVGGiHTwt68FN/vOui4D1oiSd
	 mWl7hzVT0ETCi8YFvcvxhzHwdvL6y7YOSAE6KaY+t8ZMjTtbdFlHVfY9gdvINoAcD2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358045;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=S7Xg2vGeJzK/amaGgwLRI/lApgi2Uub6jwZHNBWQ3u4=;
	b=L2Dz5NscWPlcu/AAooacS1nMSIpntaNu2gM82CZj9w3WcKqTgRru/5V1CtfRlV+XNHkI
	 +75tbZy8h7U7BJH9wWb2CAsnIgzPmYe+d0gAiT9x6Lh964Riksd6ASaf8MG+UiO29bJHk
	 VIN/UZroqjzLMOkoyP58NlWJydy/CxZLJqCV7wkPDr4lkX0abNtDG3wfibc0eDmsis/kW
	 Qg6cKJ4z8hJMq3KmzwUBTUWxFyyGzqhrhlpHy+sxHi0XpofimmvaL35GtlRER2RAKlt9w
	 /3iEYJB48KW39PHdEtV5HIIiEsMf6Go06FwCiLstnK8W/tMXNqICVMswFgru1aK4XvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Re4nznSN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z8FfQ7g5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF24606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CF24606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Re4nznSN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z8FfQ7g5
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F9IU2374161
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S7Xg2vGeJzK/amaGgwLRI/lApgi2Uub6jwZHNBWQ3u4=; b=Re4nznSNXCExMHMm
	9m9s4nt2irbhXDYytwghS+frh2ODnBR9PC7dVYIMdgcGrD7Tsv5FtblauPJDb5CN
	RN+ApNHAzdVpA1lcXHDHDnjjPA16Qefq2urBpL2LWzv+mQSPYr7cKPCtbajK7R22
	JvGeRvuGeJesNmSi/3HPOi5iRYaCLVZ4CXDe6k6mW2McRyFkHu68yNBV0+B6mzrQ
	7fBGfk0Q78xP//M3NxUrxxep729h2K4kijeDXwJai5BzRSB1+VQmOhoAYb052wm8
	kZKha3wRDwoPtXyRJOLVBk8Hnsp1f0MjFbhadl9pdOfd5L6iY8pX7E9rTX44aSHN
	hmcXJQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qjkb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adc5b185bfso650029a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:00:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793358042; cv=none;
        d=google.com; s=arc-20260327;
        b=NoPqH+EXRc9ZFiV8EODRD0ESHaXtB634nS0c9zzK8/rK/Rw2I+AnyKluZhBagV414h
         XJ1kXnI6hiLH/bZdlK1al3ghlltA7r4boL2dGHaYieDQxsIHEk0MxEVo2YO60qOohtFc
         XNtOFEX5aaqmc+K/5BH/YKhPJZ/lQRXf6sXmuV8ydzjimOmVBkcNdvA7zUAHYzJXzrKo
         vg7YN5bGmQzM8wCDQj8X4bbsUlQDIradlkv3/lf5qHl9aPvJOs0UL3lHIQQ9R9q2YU/J
         R9IX+esGJhHBDjqcF4wXcWvHFBnYUGwxH6Nnj1/w5KCIQhgHeKQsZjn2nOo5CJTW5Oe+
         hD0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S7Xg2vGeJzK/amaGgwLRI/lApgi2Uub6jwZHNBWQ3u4=;
        fh=dJc7owqkk4i9XitJMVQBJ47kpMbQ88fWHeG2dq3Al7o=;
        b=O1/5WxPbAVIAZdxyAS+OyqLAfu3eZ+/JNK/FtZ1lTQOvseAdQxgHcj4cTQtfpm3Njj
         IWWM9HHsYxkQ2jmflo6zs8DwDApKkRzlzPHUGNP2BhivzWzTf0l7mFzSz/qNhY3cl/6y
         S5lBLeeBjyYiucwmseaFLqhK06X//XT+Zk/SByOi+TfszlxIAayeH2v82JNygJZ8bA+4
         6jepnwO1hLuY9EkXtWxtkQU7kpelB8WFPnNFb9xxYkKEjqAllNw5vleuluta/uBVJKi7
         5JvwUHyIyfkWlXiLenG7f5cLicT+Wc4qYzwT2Yfu7Ed9PUioZc/Del6bwf4V9V0Tc8A9
         dBsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793358042; x=1793962842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S7Xg2vGeJzK/amaGgwLRI/lApgi2Uub6jwZHNBWQ3u4=;
        b=Z8FfQ7g5bbCHIHkZuI3LJyyxjJDRyaw0uFexvwxJMcEJtnxyyD/DlGXJf/LmpG1un5
         kNRqsvkGG/2KT6elkCT6smtterY/nhVsitCuRRYLgX3EEy6LLWQ8nTDI0z0lnpAA5A1F
         TnsiaEfogQkHeHcJY4GvSLvshxqxmaSppwKNnoQekF7Q6LAsjLrUj2uErU0yRSRzIusH
         f5HU1//YETQLx8mJKkm/LNoU5K3pJKxR47t6cAohjawrCJJOG+dproDlu/Hoh+uR863O
         t9Pn+8GGfEkRisCLZX/NRudX42zwlgNzKYe0xU7O2j2RHz+uxTRGb7IqUj3cKoF5qBwf
         lr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358042; x=1793962842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S7Xg2vGeJzK/amaGgwLRI/lApgi2Uub6jwZHNBWQ3u4=;
        b=TFqNE8auUYMfpE1cZd81YZzvgH3jo90wJRd6bSLYLPe+j+sWrduEo1PmSgk4Ozr1BR
         2SBFirPqcruJjaYFzWe22eFUOEEbesJi1EoY58c9cDi1EXc+leBA0RXCWQcgeQ+yc/Dv
         hfOlGmros/6zkJf8ubehCICzBj5szFnFS+S2j7/vpGVW1KM9rXjmI/An/WFV81FRRS2o
         UEGBr71rnYJ5Rrw6VcacDfvTBJ8pixQpex6z9jTq2jOs1YBe3KccmSnBG6oCPZbyaGvm
         mgkWdunI6DHFF3VlmKUjHcxe7uJSAYSDfWHltgwP1LjW+iVaaqR3Q5Yoc60vKtPlLN75
         rYUQ==
X-Forwarded-Encrypted: i=1; AKwUvByV2C/5btzeY+oLTw5jDseLH8HxuOA2o4rLsVkQcYOPA1q92ATyw3rwXrc9NmoggYkxoCPiE2Dt8Rsf0+U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeN8oNo0TBmAC9hn5mu2l2y/etqhHmBmdnyPAtD+B2lLgmZc40
	V5mjwAvVOZKT1FjMf+X0SNh5bltclmYM9Ko65wOyv4AGeaBnsz3SV7OJCWYitucWb1IhsVe2sPm
	cKkuzXDFlCXqP9g5Z9/Aw8rEUnmXMt6oLiRl+vJ2XZO+xsfbV9FFptNpGInLujBWnIiQgJKeAtX
	njRrDtLgAu+CqbSs0mmQsJugt/V06GfVk/h4uz/U8OTA==
X-Gm-Gg: AYBFou3vZLCcd89hTpDe0qJb72ktc2NWVjzLAJacqfcimIrH4vHxH/eN1PxG/XKxNQ3
	Z/ecSZO+ucNNljywA8ag8mmwn6kbkNn12uUl7j3eb6b/avolI+bWhhn9Kbjel0VwEt7Tx7P+jWb
	ob1r17SNT+c+PrCbxaZqXh3EcTQuIRPFFJ1zfuvurSGJGDwXrQJEegHTPkMw==
X-Received: by 2002:a17:90b:584c:b0:3ab:d26b:c2d1 with SMTP id 98e67ed59e1d1-3ae89724955mr1586105a91.11.1793358042339;
        Fri, 30 Oct 2026 04:00:42 -0700 (PDT)
X-Received: by 2002:a17:90b:584c:b0:3ab:d26b:c2d1 with SMTP id
 98e67ed59e1d1-3ae89724955mr1586088a91.11.1793358041880; Fri, 30 Oct 2026
 04:00:41 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020140743.2765011-1-bruceli20040604@gmail.com>
In-Reply-To: <20261020140743.2765011-1-bruceli20040604@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 12:00:30 +0100
X-Gm-Features: AclHuK-8I4I6OlbthS0jN4vk_MeSDsmg6sB27-NI9aRz5ijsyEpNPQ6o5hrWtN8
Message-ID: <CAPx+jO-fVQ1kt=aeOG9fkZGo8qBNVBdNk7PdKNOEFWfDAPkXTg@mail.gmail.com>
Subject: Re: [PATCH] mmc: atmel-mci: fix PDC bounce buffer use-after-free
To: Guanxin Li <bruceli20040604@gmail.com>
Cc: Aubin Constans <aubin.constans@microchip.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae478db cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=gKiUwDw30W1Mxb9jGGUA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: lQqN2P6YlwOJp6FvL-HGTO8tbloUm5i6
X-Proofpoint-GUID: lQqN2P6YlwOJp6FvL-HGTO8tbloUm5i6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX8AhJ2hMZt2ke
 O5+7ItM82/j+Ilfczs8UovnEkknN1Yd6CUz4RzkozdmwGFRV+TN5piRQ+TA8MNaRPMkoTIlvKq1
 KCLclN99nztNnxCteYv/u3mPm2FKTo5vLhyJtZK0Aj1g7G+TrAQB6uM51X0Rj4H9PFEiZAyqkkL
 B+LlLS+LSDrApsiXpj2iGNcJ/xfHHZteQ96r5MujRoo30sdfXiuvPbzoIg1yrKcH/92WReikpqJ
 XCXm1fmc/Q3bA81rCFKj0Mq366hlr8zcOXAqadE/8lYGfb2ceEVeHBl3PxiZGudoCyb7ENBPlh+
 5LSChtVS572rQnx3zyEKjW2ds7aeC0gyciWAC4pUcW6ue1Tduug3lSvdxSLjrV3Al/eWsfmvoXI
 HGmmyTt7CDhvISrmtj3iE7rd7xbH1FAk3jntT9rVx6en4x5uOC5xCyt64jWSkvUOy/+HdQtoYUJ
 mbQL4no45d6TQthWu+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX4YmfQ5pgueMv
 86VArR1PSivu3yR+YPb5jwRDdhPP/w5o4bR6Ls85Mm7gYTH7BMj3nB6wdjl/Ho66oP19/n4IHRc
 woBdispFJ73FFYzF9SZxTM+MxEB1aDQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300043

On Tue, Oct 20, 2026 at 4:08=E2=80=AFPM Guanxin Li <bruceli20040604@gmail.c=
om> wrote:
>
> atmci_remove() currently frees the coherent PDC buffer immediately
> after pm_runtime_get_sync(), before the controller and its interrupt
> handler have been quiesced.
>
> A pending RXBUFF or TXBUFE interrupt can enter atmci_interrupt() after
> the buffer has been freed. For a completed receive transfer,
> atmci_pdc_complete() accesses host->buffer while copying received data
> to the request scatterlist. When data remains, the interrupt handler
> can instead call atmci_pdc_set_both_buf(), which may program
> host->buf_phys_addr back into the PDC and make the PDC access a freed
> coherent allocation.
>
> The buffer must also remain valid while atmci_cleanup_slot() calls
> mmc_remove_host(), since an in-flight request may complete during host
> removal and take the same interrupt paths.
>
> Move dma_free_coherent() after the controller is disabled, the timer
> and IRQ handler are synchronized, and bh_work is canceled. Keep the
> remaining teardown order unchanged so that in-flight requests can
> finish before the buffer is released.
>
> Signed-off-by: Guanxin Li <bruceli20040604@gmail.com>

Applied for next, thanks!

While at it, I noticed that a similar problem exists in ->probe(). The
dma buffer is allocated *after* mmc_add_host() is called. You may want
to fix that too!?

Kind regards
Uffe


> ---
>  drivers/mmc/host/atmel-mci.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index 8f4df250a77a..7f1a5864da96 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -2592,9 +2592,6 @@ static void atmci_remove(struct platform_device *pd=
ev)
>
>         pm_runtime_get_sync(dev);
>
> -       if (host->buffer)
> -               dma_free_coherent(dev, host->buf_size, host->buffer, host=
->buf_phys_addr);
> -
>         for (i =3D 0; i < ATMCI_MAX_NR_SLOTS; i++) {
>                 if (host->slot[i])
>                         atmci_cleanup_slot(host->slot[i], i);
> @@ -2612,6 +2609,9 @@ static void atmci_remove(struct platform_device *pd=
ev)
>
>         cancel_work_sync(&host->bh_work);
>
> +       if (host->buffer)
> +               dma_free_coherent(dev, host->buf_size, host->buffer, host=
->buf_phys_addr);
> +
>         clk_disable_unprepare(host->mck);
>
>         pm_runtime_disable(dev);
> --
> 2.43.0
>
