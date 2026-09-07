Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6145C3446CE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755811; cv=pass; b=KAjUWb7CloUtnF07rjSVjhlbU3l3aMorrqfb2Q+r3ufqD6eCK1iKzYPC0N884JGg68V3AfEEMviUvQ0OBB8h7Wn8S518g+ClGI1K6iwMqVpxNwQyl9nNdSjp88he3TAXQgxIzHWSitNzexXjJVvBznDPM91EwARM1dPo0CDJ/Gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755811; c=relaxed/simple;
	bh=hUnGH29frAUOv/0EuRdjA8PunMlslRH8ulu+jotd78o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hd27wZh9S1L0usrzNAVAdlBktKqRWa+/O1yS19EmXiulZq9wDtTQ+VYx+GvqZPLpqM7y2eLs7NHGGNzY5+VP2BBxmYhiX47eAVEMkvuowg0zRI+mLCM1Dmgymqz/SWOZW5TxsbZfy++nvDAOZEZGX9i05x2JAAPAZhZyyTXfElo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FiljLwxk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H8XR9sEP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FiljLwxk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8XR9sEP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873l3fq1699694
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 04:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bXvOVPq/0G9Af1iQjBbrByfRCSP5jsO6db1GgQhts08=; b=FiljLwxkZ+eG73E1
	RsvV7XSB2GVymZn2gg3R9KWDIAmbOy3hiL0PJT9up2MxSTuKpkyfzZXeHRhY5jZH
	mHBO2/NAqLIppSNvzn/Hl4/KdGdT2WPjFr3w+dJcyBpyJG6M+BWO/0Qk+mgdNAwX
	lrXC/20md7FR0ZW6PNiSuX4+a22ElBT0sOb6FTMQBKL/6r6uWCn4z2CD03mvr73n
	1NbX49uAYrxydeEGCjfuv+w2cLLwEHkNhrKQd1yoWWSO3xjh/Rb2vNtt6RJxDZW6
	WC+AuTSBzMOn/Nn/VcwawEtjkhRWSKRalQYGTqdrso3+BFStYZr1AVJWYxiLYy6f
	11KYHg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jcwvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:36:49 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8648f12d52aso39179167b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788755809; cv=none;
        d=google.com; s=arc-20260327;
        b=FohhnUgJYqSsOIC/tU/fXWMgUi6PavE8ph+bdPHcgRN6V1fTzJDz9hfqT2rZaI5Jzj
         67aUcnPy3WijGdHupURQQzJUV9BaHKjr9+cFSK8EWoh4szCLrg1CBx+Ji3ZtpkqQrqX4
         FMjy2zcna3vBgEwYDz8hxOAmntvf11K7DIn6+3CRomNen4wJUUN4I+k56/FGwL6kLvdU
         /Fxzw4krAUm1Cqzz7oZWBB/VsU3X6kdaEi5lJw+WaI3Vu6gQlfvkFwyNo0nB6GECt7B3
         aEGl5QlbVVICmZFja+rGq92tsnhMqaMnuQu3RHI5yuMJqs/ZHooLmZ6q7oqwna16QAMz
         yqGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bXvOVPq/0G9Af1iQjBbrByfRCSP5jsO6db1GgQhts08=;
        fh=eXw2MV0qyv9tCx3JGiYv3X2Utwk/fqnxRwqutYNVscM=;
        b=Vvar/DUM/9CYLhzFkSTuxOlP6JRMAtLhnzk32gXfeu5UEwGwtOGsTveLxSrw6v3/dJ
         dFtq6y1p3UCyAHqDq+LQS3d1ZU5t1tMxqXJAowyU3HuOGWA2dMaW2wInHOjkoKGOQ0iz
         wtb1+inXioDPiQGWVDQpiabOR2yHTOpHYbuwgJzp0nmSj6oTrwVh5AbildSScCCUuxeT
         aFoeWuVVPP7qMXhlc8XlZvDzmz5fR/FMowybd9cLZDRR8TAVP2FDVtuRfci9CY4Lwsxs
         IXVm3RlBMsOYIcVGo8G8mRRjpN8jEvHfvk19GykGezJ2dXGvg4A6tJ06j3mCFeE62qWp
         4LlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788755809; x=1789360609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bXvOVPq/0G9Af1iQjBbrByfRCSP5jsO6db1GgQhts08=;
        b=H8XR9sEPNuAdIztPqIeF6oS7KntDjPjj5DRqiZwCiHfJ9BnNhQMFdSJ4VI6pbouHyk
         Zqwnj5+gJtGlNx9u7T8fNLjVTfDvGJFm5CqPb/TdYUXr+Fzdej7GXjjlZ4N0qGgD18eR
         FyhuKJkMYxfGsgUAPuDekZI2imqmUx87r/FMppCn46jrheyt1bo3LiKRmDeTHIBvsMQK
         CuGaZJ091I4HdtXpP5X+yBdd3Hhg24zmqct/Jtq8lKp5AUwNuZoa1mhrURtZAvSMa/RB
         mHtLGeCz3IiUyF17QmamBT12bbCxjoSVpIRsAZIBjcDI7B8IeVZFjfuX6fkhNT2iEjeE
         RcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755809; x=1789360609;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXvOVPq/0G9Af1iQjBbrByfRCSP5jsO6db1GgQhts08=;
        b=C+f/sEgaV+gtoBjzj08e96ruVJUmb/aKxI276XpuEm27zNYZLauiynNi0brnWrnW0H
         O0zHpurCzx0ExS3gZYRbAzfrIY4qn/4I9taDxcpDFKazr/ZHRhrwj3NwrjSaq2+YxLvp
         2vnN+CUjNbA6KRjy8i87eID1YapGs8TQei8s78GwurxzZJ7QSi75ynH7KudbrJwLnRHz
         NaLb2q8giuAWYWatd7KDlWzYlKNfvhXk3wsovIJefCduzijWcx9zibdYKfV2CtwU21uV
         PIJ4fzm+ejRI/xvJ7DJWuKLZ12biZqV8q7QRuK3ChRGG+61XBv5Vz4Luke6+Jd5sEbos
         jHhw==
X-Forwarded-Encrypted: i=1; AKwUvBwz9CoeH/ve2f0+UpuoB2odcwzRc/qW0EwFckh9j5v+JCQ3rogYxRhH7eY0wqF5a6N9FLjAgprST6fRzm8=@vger.kernel.org
X-Gm-Message-State: AFuF++nkaCR8zxh8DpEqvGFiu5wOvVsRP5P1oKkb13lCZ7HSOXVEd7Pv
	yEHJ+rbgKLPWcNI7hjIfo1PMXGbQ0ZUJbPg9RKbFxRBRnpQ9mh5I69Cj/kWgald7ArN0IyVFbUv
	pM+LJnBBicDspZ+R/9uL2mFd+CyPxDTqx0+fLpHohFeLkSHcAzpLdQWOekHKIqDGO3mabzoqJhg
	Kcnj2Ya0Si8qwgkfvxezSi6vhy6N9R63yO/AUPWp5Vxw==
X-Gm-Gg: AYBFou10/uT9Wsq2n2ICnLiM2+grszd02HecWzWbg3jlcn2Z9XAWHNaC60LnXF09RBI
	iE151AkiDagKcrxw9BOdrGv/PkRhXL9SvxltkdNm+t+iQVVRRXCo2p1mWrb7M2YadP9bntaTx3I
	7XTOm5nkJLxYT14Gvm10Di4+oD9O6gXzAXdDg04xKiQmzT+pO0nm7QAXFUAzI=
X-Received: by 2002:a05:690e:4508:10b0:66f:c7df:1442 with SMTP id 956f58d0204a3-66fc7df14e4mr1070541d50.40.1788755808750;
        Sun, 06 Sep 2026 21:36:48 -0700 (PDT)
X-Received: by 2002:a05:690e:4508:10b0:66f:c7df:1442 with SMTP id
 956f58d0204a3-66fc7df14e4mr1070527d50.40.1788755808367; Sun, 06 Sep 2026
 21:36:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com>
 <20260903072902.3870009-8-harendra.gautam@oss.qualcomm.com> <1bc82ff9-87a2-45b6-88cc-43acf92c84bd@sirena.org.uk>
In-Reply-To: <1bc82ff9-87a2-45b6-88cc-43acf92c84bd@sirena.org.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:06:37 +0530
X-Gm-Features: AcwNN1Ut4lERX0ImtklUb__wwFFA1e6nLSim3GBD2KDrKci5MjcsTbDpGSY4jXQ
Message-ID: <CAC-tS8CccoonxXUEeGhEd9Ct=DuQWALJJr6S52fonPG+SRoNXQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] ASoC: qcom: Add QAIF PCM operations
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: o-bjpS-RYsqVI6WO9e2t_jlkATit90OH
X-Proofpoint-ORIG-GUID: o-bjpS-RYsqVI6WO9e2t_jlkATit90OH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA0NiBTYWx0ZWRfX6lWNCDIA/NRR
 LkFy7SPdv2DI9aw3ULRz4DYMFD6hLfj7tBAwQeLBMS0duM7LlWrrRnch8LPc3b+bbswL64ZqsUi
 58UC0IUw97JQo5S5xnyLymvXCU+IWAF/bfE/NHaw6QzriTLOqPKIr8jwnnWGAc/6vQPR/reXXbI
 vkOrctd1rdi5j+JUuuunnLneFbWzczYLT4ayZK9iKjEiofKx+qnTH4EqjMUWIcCK02PCK1eZagq
 4P7soL23Y4MJg1/j19Fz0lddgnTQtgSFTy4/UeaTy8zfBmt+j3hzVtwlLRdP8bXH/82BDstOX0o
 EONdLe5O4XcJdr56yxli2savcPtHoPpM+Bf16+4QIon4k3zsaX0DQ3AYXvkXd5/gmC9w6Cl9MMe
 kFBDowBE2NoEtgL8XI9w4XhgTo5Xivoa6+iA2win1GQjZKuZhiknFEBE1GayvJiUcy7mxz23kGh
 N5aprInsBIWVYJcm96Q==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9e3f61 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=WyqP0FlduNzGPyTG3yoA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA0NiBTYWx0ZWRfXx4bXLGmSK4Lv
 fWJST7foOexYObOXdnWiHDvU4I9rsdusu+2I8Aox0NQkJgw9au8Z2i0X0WWWFROFo6j0VMeI41V
 IbHC8oe0xXa684eH+1qfl0iJuiUqxug=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070046

On Fri, Sep 4, 2026 at 1:04=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Sep 03, 2026 at 12:58:58PM +0530, Harendra Gautam wrote:
>
> > Add the PCM platform callbacks needed to use QAIF DAIs for playback
> > and capture.
>
> > +static int qaif_platform_pcmops_open(struct snd_soc_component *compone=
nt,
> > +                                  struct snd_pcm_substream *substream)
> > +{
>
> > +     dma_mem_info->alloc_size =3D qaif_platform_hardware.buffer_bytes_=
max;
> > +     dma_mem_info->vaddr =3D dma_alloc_coherent(component->dev,
> > +                                              dma_mem_info->alloc_size=
,
> > +                                              &dma_mem_info->dma_addr,
> > +                                              GFP_KERNEL);
> > +     if (!dma_mem_info->vaddr) {
> > +             ret =3D -ENOMEM;
> > +             goto err_free_mem_info;
> > +     }
> > +
> > +     mutex_lock(&drvdata->stream_lock);
> > +     stream_dma_idx =3D v->alloc_stream_dma_idx(drvdata, dir, dai_id);
> > +     mutex_unlock(&drvdata->stream_lock);
> > +     if (stream_dma_idx < 0) {
> > +             ret =3D stream_dma_idx;
> > +             goto err_free_mem_info;
> > +     }
>
> Shouldn't this be err_free_dma from here on?
Thanks for pointing this out. Yes, you are right. This I overlooked. I
will correct it in next version.
-Harendra
