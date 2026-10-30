Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793358055;
	b=VWgwx9hYXshzKdvUrxenK8L9KrSTxzaiMfYTh3Uh/dgizzd9oK5mpwlPvKdOap8KWnN3
	 09xuGaHBX71KS3Ri6HMkXHttyly83mBO+09CYagVdJ/Qmzi+x7tNB14DRAo/2K4AtPMRk
	 5a9+UKQBCZ7SpTH4QrKNt+BNQy73Ry+8UjRhEn6H028ixNmZgIOD3m23SU333LADGTeZe
	 XyKDLZ95hWXI7NShl9WhBdTCdDy1LvU4PhV2g8KsZmmfY4JMX3CO0hZ/LZaSREJ+MIT9n
	 k5+52BuZDAV0C588OcWbjfKtjl+R2sIF5qoaRQLQydTg8q+GPd0NKfNcxwYvP5hZ5Mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358055;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pa/7lUjDdXTS9RhoIzZiDYW3IqD0/QbxRwCrozSE9pw=;
	b=k4F7vuU6AC6zFZB/jMcZOBE8oTFXIvIX3MIxICLMHAhvKzu9VcIIhIW6en1htX62KfX9
	 Ta41pcMkKjeEOskBFsluYOxcikvU6J50R4K+lIiPdXQ1eg0vzNxrHZ+CmMCEP8MSE5niq
	 2UQI46Zy0XgchpJCK79pFoBscsane4uLBrCmDV38jEodLjjK75OBCh8f1XN/nXfuaxemA
	 08h2QEj+NOEhLQcX4n+R09OTa7KTLQJ6xP6CCWh/hAC13WdwZlSYy2gURy/6HbymAWjPD
	 bsyKD/w+NUq/2Oq2X9aGNz0nVn/EZzkwpJ31ib9SfY7G5xCLoUH3Yp02EgsGlY1byoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KrP87kak;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EENX1TOp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B71606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7B71606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KrP87kak;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EENX1TOp
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F0hM1119731
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pa/7lUjDdXTS9RhoIzZiDYW3IqD0/QbxRwCrozSE9pw=; b=KrP87kakQJ2XDvf6
	GL6qn+zOC3yayE14cU+AJMUjXvXNSvOPqM/kkFGF61cFM0k6rI3y/ACIDiaCrnoN
	XXh9+Yo2gV6lw4CqxaZ+A070oBeTCiv9vmsPeXDJoKRjFFuitb58Db2EMvB0MTwS
	60v+VRukaAd7mawTtFBkUKYo75BzEssj4j2mZlubPxEw8UeT6aw3OhvuxXe5mQnt
	A0p8LEfFDi/E7BcTOmRSVF0E4KH/coAREYXCD3/qsJ1QSZnCf/bGoO5EduJc8QBV
	zdpzdGhIJkuLRNRi8MazeIlip/90dHznxqIosw6Z6duXu+uL6L0P+2UDeeZYat3Y
	jAzF1A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pjjtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:53 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9907de400a6so49252241.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:00:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793358053; cv=none;
        d=google.com; s=arc-20260327;
        b=Ap0v1DIDWqAM1h4uo84W04c3NxEJ+s2MArS4HDSpK2Xq3NDwKA5ls2qoS8PkI18WKR
         pOpT7BxF3X6YLOIuNEB+xbOTTTLRCyjMaGoKKbJv5yI3Ug03j/avHgjMmD3q5gDZpoMT
         rxzk+uHhfU51HazsxOloAXkesR9q0e0e7MkdurUda/O+FHrIwYUpAM0+7iUo9oeH0DDF
         G9l0h6+zK7UsgTf1hn1PUux1ZhuAXOCszVdvDqIJnxuUO/KjKxfE+ldd+a+V9SNpv+Xg
         IDMN2fn7Yvub1rbo8oY8pWXa5/0FEsGnSxb6Hsa8iRActZY9b13cyScGNa3ipE7JM4RG
         mytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pa/7lUjDdXTS9RhoIzZiDYW3IqD0/QbxRwCrozSE9pw=;
        fh=JsrGF0x0nPlqL3lsgkFgiyLPEYx+fxVjGH662YhC57U=;
        b=bYdK43j0kRulm3HTe1tZsGXJG4Ar/OKAoWrOXBcd0FQSGbmuYDLJB5Dd5uqBHqSEyW
         mrmLYjaa9otZ3TkysXUm6VM3MHn7Nx2BGzkK4SMmWEAksPVHT4DEbBXOhvp/pRvaHu7j
         470+ZqmEIw5tkCcbF1xbSjS7eJykhzRpDoLin/6UHwIgP61GYeuDFohqm9hetF+Ph6fe
         7GJmFITv4NlqMypoeYRqWiXFQHPOeKTMVTNQ2YWxeXOIuT9QD4MJkdnuGahieBQNV0Yc
         RkdMbaFpHY+Thc+shrawmO619ayWcrxtw8xlYDJj/Ausrd3zyz3P5K7n6EfmynfxQfSX
         K78Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793358053; x=1793962853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pa/7lUjDdXTS9RhoIzZiDYW3IqD0/QbxRwCrozSE9pw=;
        b=EENX1TOpMqnxTDAqgSeqUVCyBSTUiMY3t24upAdjpwZEG14TJtStzD4UkUlnzQp/Nb
         kHUHAo+2PUGmAAGoWXCYhWTx7BWOjQvBpHaCK1ufX9m0JJogjadsgio0AjcXqaIkPWho
         6HJKn6AUDE1RfJTya0hri/9kSYjBif66iHNsRyHN+dP8Xp8P1oQs3SoD1AMtO9H9B8Od
         llFzeYWmRXE/xS5hHzwCIsUlctjyfXmyMjMnLGlkTnTZlL6tZuKcvt0eNdNuEvl+lWIM
         pokWOTj8hgbETVuBAq/m5bHz7VyZ0Ccuj+i19KXKp/VfOnmr7aIrgpHeFgJ42cmSBRuJ
         orhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358053; x=1793962853;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pa/7lUjDdXTS9RhoIzZiDYW3IqD0/QbxRwCrozSE9pw=;
        b=zMB0M4ABorWxk/iQS7nHKIC45YdSdeSS4fneXCb/AlnF28s6H1cCyai52R8p9+4Cn5
         ZEaGBIUnCh9FOZctJJlQu3FNIR7EqA/v1hd2Wbkbnt4ShtG/97AM89St95/xS+GcPdSJ
         bUmvDU3P0q28Q9zm8JfJYtwJl+3PMqYWk8hRFCNW2h69AZlQuRSRsJeTPtLTja5ufHJs
         ir33U5yijMw/edZT3GSGa2CswfvNHGDa+uRivFneQhXyqBDxRFrXS2vuCxtx1AzWvNjP
         jTrJxjWmNhqMP24LqJcc8LMDR7wcXrorPvgXrt5WpKXkZODn9AHkv6XescLSq6Ul94lQ
         o1Ug==
X-Forwarded-Encrypted: i=1; AKwUvBzLSfBhMCofOu2oBFpgZhMHKaTHmLk8gyzI0K1wLM++BJr6C1b8TxDgUBmJztsCy/hYbeygtP6uUBUy51Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPHkbFWNBwejjmzZXOzen8it0CVUFQFl9SY0FPI00OD+2tJats
	gIECX94RXJ5sgDt14Sus2SUguia8v259zNJN+PkaeEaBHFOKpG/0NL5iFn/6OoaKhz4p1pZZV9E
	1pKs8RWYkNhNzeSjLB6EZNhzCaE0xRDbzvEFuBdP6hd76CkisWpjQnWRbfnwZt9nUR7OhT+qYTB
	NZf0of4MTyjOHdREr/csDXbi00lpFFBKlktRjvys+VAQ==
X-Gm-Gg: AYBFou1OeDP9sFiwXyPypGOocBkWG5BFbkkdlhBrISPjq7RTxqWpnXaYQaILAwuwL3O
	oXbZRyAAyl5ArSFH5tnWlsykbnl5wen2WiV0uLqN4nAYbNE5V41KitjTbZG41qMTApUOK/EHcOS
	UaXtgkRZGNWq6RKvQy7P0O0SRLJntHmbmCydgT5BVyLeYhSzOboXA5AdAOYA==
X-Received: by 2002:a05:6102:3eca:b0:7b1:6028:5475 with SMTP id ada2fe7eead31-7d072552480mr844767137.12.1793358052397;
        Fri, 30 Oct 2026 04:00:52 -0700 (PDT)
X-Received: by 2002:a05:6102:3eca:b0:7b1:6028:5475 with SMTP id
 ada2fe7eead31-7d072552480mr844758137.12.1793358051740; Fri, 30 Oct 2026
 04:00:51 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021130625.1616753-1-bruceli20040604@gmail.com>
In-Reply-To: <20261021130625.1616753-1-bruceli20040604@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 12:00:36 +0100
X-Gm-Features: AclHuK9H-GW3hcfuq7Vj7wFrWZ7OS9x0oiGneZjy6o6H06oS_BtIg-QIKT5naok
Message-ID: <CAPx+jO8DrjkbjhC+zXpYPhshgmexsXNZULTjR-yyY9b5-mAswA@mail.gmail.com>
Subject: Re: [PATCH] mmc: moxart: Stop host before releasing DMA channels
To: Guanxin Li <bruceli20040604@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Pengpeng Hou <pengpeng@iscas.ac.cn>,
        Rosen Penev <rosenp@gmail.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX4wcD2Z4uAVzQ
 IeRI/H3GZuis2wZwhY3ExJ5VMS1RE7rNZWuqOTbEED/Eh/3JhuSI+Oom9UvFtdlqs8e3+Z/RQd4
 5kNNlxTSfPytyKJw0oMJAxnRYxJ11I4VIKNJfHZBBDQy4wqhZdrw0IO3tlV5Ggc0+RYa51NA3Zi
 cZspKJoDyRb7Re2BjbGUzlxMgN4+9u2ymxQK6P8H2o1DluuYV7NRt0S130VQCnmOP4OMqjsRYN4
 +H+9kxQc1RKEYbDzb7k3mcayYKzAJ04Fs6g4sHPy5Wq73H2CwFhp9uZRzcH5wGwMnmNz+E4DJrd
 kQxk2rNI0t4V9Nl9ZJ1uuG0AklFNo7UtdjF6TW/5otJ5R2NBCxoyWwMt5Y8kh40aJh686Ou7nxX
 WmOn42rz8+djati2yLU4h9JH0mTbUWM00VHvaeb/AqRP7tMyT0dBH75adpDTiCIagcfSNfizoWi
 iSTdWut8tU+SVOSRQ6A==
X-Proofpoint-ORIG-GUID: Nm4xyCCeEiToZNnJ-Nv8PKt1Txfoo_Ni
X-Proofpoint-GUID: Nm4xyCCeEiToZNnJ-Nv8PKt1Txfoo_Ni
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae478e5 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=q1By_c-HthyZdKZ-7M4A:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX4GnLZ7pIU/fO
 g2V+6yqbsj4fwMVfzJFVwT8aJISd7LfHt2IT4Gu/7/rMU7QpHhhUVuH3VHFXHcnZXWwdv+OG6M6
 tjl3VGiXLEqUtR+EwZy/0BXJjwFF4m8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300043

On Wed, Oct 21, 2026 at 3:06=E2=80=AFPM Guanxin Li <bruceli20040604@gmail.c=
om> wrote:
>
> moxart_remove() currently releases the TX and RX DMA channels before
> calling mmc_remove_host(). This allows the MMC host to remain active whil=
e
> the DMA channels are being torn down.
>
> Call mmc_remove_host() before masking controller interrupts and releasing
> the DMA channels. Terminate any active DMA transfers before releasing
> their channels.
>
> Keep the power and clock shutdown after DMA teardown. Do not call
> mmc_free_host(), since the host is allocated with devm_mmc_alloc_host()
> and is released automatically by devres.
>
> Signed-off-by: Guanxin Li <bruceli20040604@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/moxart-mmc.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/moxart-mmc.c b/drivers/mmc/host/moxart-mmc.=
c
> index 28aed13549a6..bece33f4792d 100644
> --- a/drivers/mmc/host/moxart-mmc.c
> +++ b/drivers/mmc/host/moxart-mmc.c
> @@ -684,13 +684,25 @@ static void moxart_remove(struct platform_device *p=
dev)
>         struct mmc_host *mmc =3D dev_get_drvdata(&pdev->dev);
>         struct moxart_host *host =3D mmc_priv(mmc);
>
> -       if (!IS_ERR_OR_NULL(host->dma_chan_tx))
> -               dma_release_channel(host->dma_chan_tx);
> -       if (!IS_ERR_OR_NULL(host->dma_chan_rx))
> -               dma_release_channel(host->dma_chan_rx);
> +       /*
> +        * Stop the MMC host before releasing DMA channels.
> +        * Keep controller interrupts enabled during MMC teardown.
> +        */
>         mmc_remove_host(mmc);
>
>         writel(0, host->base + REG_INTERRUPT_MASK);
> +
> +       if (!IS_ERR_OR_NULL(host->dma_chan_tx)) {
> +               dmaengine_terminate_sync(host->dma_chan_tx);
> +               dma_release_channel(host->dma_chan_tx);
> +               host->dma_chan_tx =3D NULL;
> +       }
> +       if (!IS_ERR_OR_NULL(host->dma_chan_rx)) {
> +               dmaengine_terminate_sync(host->dma_chan_rx);
> +               dma_release_channel(host->dma_chan_rx);
> +               host->dma_chan_rx =3D NULL;
> +       }
> +
>         writel(0, host->base + REG_POWER_CONTROL);
>         writel(readl(host->base + REG_CLOCK_CONTROL) | CLK_OFF,
>                host->base + REG_CLOCK_CONTROL);
> --
> 2.43.0
>
