Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793891523;
	b=AHgaozaAHcgFAjsu/8HO+k3xA4f2cy2KSMlQHG101b9EuRN7yv6o2rjI+N1dhW9iBx47
	 N/0QGKgGWz84F9GLvsHAhxLMnLDbdfPwSES1B2muN1VgfXbDLUdwTzK4aEqqJLm4E6EVa
	 CGcGYMgI+NZs93q1xkkVuf+ab5b6CEMz2MhaX03GMjGT33xkSjalZ9P58fX5pOtm/n5C6
	 lbfv6sKuW4vuVRfsjxMUn5elQq4dEKewav9qHuqBNinKPAVMF5tke1SqfiEjyoynGGGI4
	 zljJ6KjEQxIpzEqy7xyOkdDabpLsxcNXWrxsjUSz0VrVQEvxUn92Fkaz4P5UDLWd+Rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891523;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NMveQ7/yT5IkErQUuJiGEeH/rHIZjVK+NolGDNiwJPU=;
	b=bXdb++jN+Yd2d8SGxsqZ+l6WbKIy7RHuaDTOY9W2NsZDNJN+K4QyRU5G98J6GxI1TpSC
	 Q1xLGVAy/En5McQAGtlDH8j0zTEt5HcNedbXMvVtTzm2O8lvnU+gxV0sMGiP6gBKmwa3i
	 Khwe4aNHiTtAO+YBiNI27KBT2FRcNTJnj3IABLnLgZ0DjGoAHOlmkPNiehQWlaY58fI4h
	 q3ySDtSTNuRUILsE4iUInWodIZJ7ouQ10/6KwmGTwXMYiPFukD2whEMj0lQzG/S1u9jXS
	 QlyAbvkqjfNCyS0ZNcqSlZUKF38IXt8F/W6svzE8jmr/tf2jif0+OaazXR0xlmRNOTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="QjCI04V/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IuE7pDHQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28375606D821
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28375606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjCI04V/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IuE7pDHQ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQ7tn1008639
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 15:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NMveQ7/yT5IkErQUuJiGEeH/rHIZjVK+NolGDNiwJPU=; b=QjCI04V/kzMoCcbD
	nekpPVtwFjBdQ8hWq0FVWTb484XTF9yuHiaAljr4ep+hJeBVMXvndSz5iJKXpUGp
	iVzHuFmxS6SDeYx+HWPcxC4pTQpda1yhcKtzGXnpgRtxl0fJIPVxQGe9YVrKj8OY
	BQzvGgHzkiahBTxj9QltoX2/ghoV1QPB9PhoGkF+yivJR/5iTy20Nu1yI3DjAA5/
	S0tfGhtqMRNBzrycN8SL+aXDAp2hvFy0n236eH1fmfhl+mnaDs85Ofo/kQRHWkOY
	xuZB5Uor3dr/KUvYZLzV7JvLfFimGepBJxfUeXQJFTEnsexUC8/sCXKO4I+9DYkS
	PR2SUQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v27qk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:12:01 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-54dbbf252cdso2852100b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:12:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793891521; cv=none;
        d=google.com; s=arc-20260327;
        b=j7FquVhqA1Jy74WPSVMCF9o8HsrggrnCLogM1D4AeQFjiC5P76t86baQuQe039TMyW
         MRQkJx5aFve1o40AWHYVW/9MA7QO3xoKI2PpqODp8fkbyy1twA1dv8oqDniLZpbwtKwF
         CGj+4acb0Ji2XIcgC0Tgo3a+/hZ2DNp1GNVXeSzHSuJl0g1CiwZeC/eRmTorXF9fefKK
         8r/jpQECu5Bkk6IZJ5hXBVuf2UbrrqV2DefOjM6KuOjsi4wdbE+/u+jsuaMqoUdAJexP
         Y70ReW//wpmueR55qit9CKUGEYVpmdEv62vmk7p1cp8VyY+DhmEiiri+hAMjpRsG12lg
         sjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NMveQ7/yT5IkErQUuJiGEeH/rHIZjVK+NolGDNiwJPU=;
        fh=+ymBFmCB6vdNQA3p/xydMRV2ICiCBRBLux3wedTPO04=;
        b=IszPZwYoc+Wbl9cvHFBLU4e52SHRuPt2Nt/BvQV1JtUCBpweLIIX5Y76qwKUznhULi
         dVTexNmEf7grSwih87DKlJqpino6Ia7HIQn5mJ+k3CNquzVeiBB0227u7t6lsvWmMKFR
         ucXv1NaMWqS5d3S4XVUETNrQVGIkBdSZKGgo9qwPTuX5HT+9NzEiogmkPa4DCJTgABcr
         fcnDPWCWCc8Zn45uDSNunTy1VVOo7Bw7pCT+H/3TrlDkaI7E6E3zZnV3pgiKF6vjAkt2
         2Wyv6TxUYD8p25DT/z7UiW3KtFNrF07qQ2fLpDVgioTpk50GZ9J3S6cFyajcpYCQ5R8c
         ZT3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793891521; x=1794496321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NMveQ7/yT5IkErQUuJiGEeH/rHIZjVK+NolGDNiwJPU=;
        b=IuE7pDHQ6PfU1kFNvamXYka058eIkzJ0vtK1IUtTeNBRaHyhk5BSz8uO5Ny9mZ4hBH
         ryDSxqWVnPMIhDpSqBrI3tMEa9wCBqfAcTEbVs994zE/7S+FzYStjEuka8h6WFkZP7/O
         OidbEV8x4C8OqoEDb+pH8ozGBrz/8paHxOuSJ+3QmAtSkBDiYQ4LhNNmRKva5qXZXosc
         4irsf5isOMNDFFgoTT/+rplWjJLG1vQSIufMasi+qTGsHZkKoKsk1TM2PteXIGq63TKl
         H9RkjAoyurMQ4PESPuND0Zx7SwOaaRZYBQMQ+TmyqVysg8gqNZUkYYEOcdf/s2l8pHN/
         GTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891521; x=1794496321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NMveQ7/yT5IkErQUuJiGEeH/rHIZjVK+NolGDNiwJPU=;
        b=NMedA3ktJMeci8Om9pgkz7qL9UaeNWCLIV8//WrmD5FDTx46MKCNmGbGpEv1RK0tQA
         NNQh1DEAM/UkiWNqtMqOjiWzi3NcfqeVf2dCge0Hk22yGB6peYWtHIXE6sNsyb/sEddn
         rZrFRzuIjUFfb1g+F88KwQyoFKghWYjDFWQ0eIfSUf+4rqiTQiVfIxlcYM6wUF7htmC1
         ov6zg1xVLMfOYxu1WScEX/EAog/lfNc9QbY90WNjYnIszYZp9BN252d8z8f5Fnj3y17e
         EHvu3Z2qHQoyrJsx5b8haEEm3Z2vvsx51km3Uy6wmmWR10eE3wFIcJ0SaIXkQ9AJ+kVi
         QN2Q==
X-Forwarded-Encrypted: i=1; AKwUvByzA3WqzQcpqVHwOK3kEFILk5epxqUYlWPPySrAZwIdZbHh2o028c8me1jHd/cG6/DzwXVQBNoSzkVNFNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IQEW21r06Ycu+VF6KGOBMd1hImm8UhoeaTw9wU2QBK3VN6+kw
	yP4PpG54tgoVhMQM2G/Bac3HKfzv9NLOd/Vk+9RCCGtur1U3mpJOYQYVmlKccXnyjlMiwP/ozQp
	o28DSBd4R0q0bL7yAuYw+A4598/ehQSbbDrKGS9Q/GARxDyc1vbOfCRR7fvaW5EPs5PZuh7Qt0g
	UVUrT/qcex2/TbqK8Wbjp+F2bAjGrSUvx3sf/hbriaWw==
X-Gm-Gg: AYBFou0YTjgBpbbH75lZNwOfUiEHpebN7wM52knugqQ9kg5rCYZoq+6YLl0qxgqZZTm
	oAPpagTpBeZGTS8OKkWLCSGlbAJXfmCiBnl3xig0h8PPOiy3cyj9ftN0CkA2DmKy04+CBcvpYiZ
	2I9lWvER64ag7Y+zVdq7ekQTiYQfutbmKHRb7ERQMDFC3bAJ1glxX5IQEUmP3568/OaCZjsQmAR
	S59z3tsavWx/goYJkHs0k/MktR1SIx8WRqfL51ky/W/KJ3C/cDRc9yivcuTssRbUqV4wkU7z6s=
X-Received: by 2002:a05:6808:3206:b0:522:1ac7:a573 with SMTP id 5614622812f47-5640dddbb38mr15160687b6e.43.1793891520421;
        Thu, 05 Nov 2026 07:12:00 -0800 (PST)
X-Received: by 2002:a05:6808:3206:b0:522:1ac7:a573 with SMTP id
 5614622812f47-5640dddbb38mr15160662b6e.43.1793891519949; Thu, 05 Nov 2026
 07:11:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-camss-fix-dma-v1-1-74e9ec56e518@oss.qualcomm.com>
In-Reply-To: <20261105-camss-fix-dma-v1-1-74e9ec56e518@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:11:48 +0100
X-Gm-Features: AclHuK88d_-DIiFJPT3VE6CsjWU_UolOKHe_xA6uaq4HpdexcKU8842YSMzPGiI
Message-ID: <CAFEp6-3yTi8tnoO_W_2pZZds03qL1TMVX2S3H2xbU=LALtgy5A@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Use contiguous DMA buffers
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Allan Siriani <allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MCBTYWx0ZWRfX7zoZSgTeNzfM
 WHymibAgsPm6vl7FC0H6wrfgqXnYd8wfq++GhWaz5/J+T1l4sd21ZIxHYmzrlswAMRixbbcspKE
 /gQAVM1Zb2wGqUNVxjZhanNoPLvM+gU=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aec9cc1 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=i_ZfCgqcnrk0lUYW26IA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MCBTYWx0ZWRfXxINz+M2g7mFY
 NZZSHUJRccB7NWF0bwY7LuQluH9WwfGpZyWgY6ZC6qbYxzirJoR0Mxkx2tZ8OVan8Bll9UYQNpK
 oHuEjS5TNeOJ2zbj0EGJ5lHzeSAH9NIFXWIpy7XBOZATnO2lKgHT4wuzLQiREsXYLe3u4Ab5d0U
 I+N0zhsBRIzbpG0X+KK8t9RxLrfvSh1N9MvL5B3hd6Vj/E+/Bix8TcAPHS3Kzgab4Iezv9zpXIz
 Pz0GA3NPk2yipzS4019pAeAjOghPyODjcK+y7I00+ZspxZdeir3EKqCSsN0h9RsU9Oo48y9dzzF
 b95Zm6T4mIV+wuAhxAdvTulAy0hmmoT10a6tHFdSYIixq3cfujvy2fzJUmh15ahpsbPNqXMa4EK
 NmVbno4bNTkHHi3JMiAJ0M8qX1/ieyB2xyM1WI2xTaaEKobY83ZrsJ1olDPaRCwhS7qfXDyGghW
 CUTpxT19gDqlGztWDtQ==
X-Proofpoint-GUID: N6OpKZERithA8SoVXQcZ8sypSOF9cd5f
X-Proofpoint-ORIG-GUID: N6OpKZERithA8SoVXQcZ8sypSOF9cd5f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050060

On Thu, Nov 5, 2026 at 4:08=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> The VFE write masters are programmed with a single base address per
> plane and then write the whole plane from there. video_buf_init() took
> that address from sg_dma_address() of the first scatterlist entry of a
> vb2_dma_sg buffer, which is only correct when the whole plane is mapped
> as one contiguous range in the device address space.
>
> Neither the driver nor the hardware can handle a plane split across
> several DMA segments, so scatter-gather buffers were never really
> supported here. The issue stayed dormant because vb2_dma_sg gives no
> IOVA contiguity guarantee but still tries hard to keep the number of
> segments low, and with an IOMMU dma_map_sgtable() usually maps the
> whole table into a single IOVA range. The mapping therefore almost
> always came back contiguous in the device address space, so reading
> only the first entry happened to work.
>
> Where that does not hold, the write master runs past the first segment
> and writes the rest of the frame into memory belonging to someone else.
>
> This recently surfaced as patch proposals enforcing contiguity in
> camss itself, walking the scatterlist to verify that the DMA segments
> follow each other, which amounts to re-implementing what the dma-contig
> framework already provides.
>
> Use vb2_dma_contig instead. It guarantees that each plane is mapped as
> a single contiguous range in the device address space, one IOVA range
> when an IOMMU is present, physically contiguous memory when there is
> none.
>
> Fixes: 0ac2586c410f ("media: camss: Add files which handle the video devi=
ce nodes")
> Reported-by: Allan Siriani <allan@fatecpompeia.edu.br>
> Link: https://lore.kernel.org/all/20261104202313.72494-2-allan@fatecpompe=
ia.edu.br/

Feel free to review either this version or the one Allan plans to
send. The main goal here is to provide additional context and
rationale for the requested change, rather than to get ahead of
another revision of the patch.

Regards,
Loic

> ---
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/Kconfig       |  2 +-
>  drivers/media/platform/qcom/camss/camss-video.c | 14 ++++----------
>  2 files changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/pl=
atform/qcom/camss/Kconfig
> index b51745c942c9fd71a95d09993213bde4b7e877e2..e1967bc20cf03ea1b0b159c51=
75294eeb40fe1c1 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -5,7 +5,7 @@ config VIDEO_QCOM_CAMSS
>         depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
>         select MEDIA_CONTROLLER
>         select VIDEO_V4L2_SUBDEV_API
> -       select VIDEOBUF2_DMA_SG
> +       select VIDEOBUF2_DMA_CONTIG
>         select V4L2_FWNODE
>         select GENERIC_PHY
>         imply PHY_QCOM_MIPI_CSI2
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 0852eb6f13154cfae7147ce39d22de64d14a5cba..5de6ff5ecc76a2863e536fca1=
c40ae6b2de6dc0c 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -13,7 +13,7 @@
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-mc.h>
> -#include <media/videobuf2-dma-sg.h>
> +#include <media/videobuf2-dma-contig.h>
>
>  #include "camss-video.h"
>  #include "camss.h"
> @@ -154,16 +154,10 @@ static int video_buf_init(struct vb2_buffer *vb)
>                                                    vb);
>         const struct v4l2_pix_format_mplane *format =3D
>                                                 &video->active_fmt.fmt.pi=
x_mp;
> -       struct sg_table *sgt;
>         unsigned int i;
>
> -       for (i =3D 0; i < format->num_planes; i++) {
> -               sgt =3D vb2_dma_sg_plane_desc(vb, i);
> -               if (!sgt)
> -                       return -EFAULT;
> -
> -               buffer->addr[i] =3D sg_dma_address(sgt->sgl);
> -       }
> +       for (i =3D 0; i < format->num_planes; i++)
> +               buffer->addr[i] =3D vb2_dma_contig_plane_dma_addr(vb, i);
>
>         if (format->pixelformat =3D=3D V4L2_PIX_FMT_NV12 ||
>                         format->pixelformat =3D=3D V4L2_PIX_FMT_NV21 ||
> @@ -699,7 +693,7 @@ int msm_video_register(struct camss_video *video, str=
uct v4l2_device *v4l2_dev,
>
>         q =3D &video->vb2_q;
>         q->drv_priv =3D video;
> -       q->mem_ops =3D &vb2_dma_sg_memops;
> +       q->mem_ops =3D &vb2_dma_contig_memops;
>         q->ops =3D &msm_video_vb2_q_ops;
>         q->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>         q->io_modes =3D VB2_DMABUF | VB2_MMAP | VB2_READ;
>
> ---
> base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
> change-id: 20261105-camss-fix-dma-c32288664dd2
>
> Best regards,
> --
> Loic Poulain <loic.poulain@oss.qualcomm.com>
>
