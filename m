Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6226532B131
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790746152; cv=pass; b=lICIxlgDoagz6TpDA1jGii05I62IPAKCG69uoFK0eYVHQ9vY4ZROVy9FFBmd0idsYVqRzXoK8oKvFLfYvL1VdMb+JpCPyWPFciL6zzNDpJ91xvbO6nF4e4EY9N9+4wIJv5nz+vCyRwAOfBIa2Dhn7K7kiXth3d0MLq7uC5HzUyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790746152; c=relaxed/simple;
	bh=tmkV2mmrDajYN4om5U0hwK0CBQDJGtjxBhnoqqbgOyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jqf3QUtUHu/wF4Gxc0OgjrjhWQLnKXO6LBm9ygoNZRxYOs+RPdQXvVWIn1sszZ6nmpakRcpzxRhuz179N4HuIOJkh0G1XUqnxdBdp5KgxYOX2P2BcZU2GgtGWQlm28YbvqOU8n6AQGym5hqavXSJVF4xdfK0OcqoEbYc8DdfrqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pjSZTXfV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJoz0vFj; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pjSZTXfV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJoz0vFj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TNQeV52010471
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dx/vIXhRvwG/JlTZaI/6ZuIX
	DRsDVwL2S+wzlVM9WPA=; b=pjSZTXfVK5pKLSc2tlWVvF+bggB8RgSlMVso3NBO
	in3EqWupw5bRKnJhOmltx77ioExVOUg90cnrtmtRENoKTecmwXTlD/dow5qZAYV0
	KP9Z+YtGZOTnWcjL7scN/B+8PH8jTT03tEnvuChgp203ZQ12res04g3zUtkKNVYz
	sstctbaGkJoGR4mgQ/wR5hOUrHc6d6U9nf+iRFSZhf7zivrYatuhSAUGUrnNL8nc
	KzSHnJmi3XJlc7oURLU9NnyB7mKBlNRVWWJQ61HWOZRm4MVUCzs/4TnJZ5n5J4Vq
	gnjoDIydEfNEvLzhNSBgr5yCr38lw1JIJEi2yZGsJZfoHA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0ftuk8v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:29:10 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-892af0d1bcbso31075177b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:29:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790746150; cv=none;
        d=google.com; s=arc-20260327;
        b=RECIf65/4PHB1WwI21doNQuew0VRYiFTaj8dnwd3TSoXgaI0Y1SCK4UKd9iUhZadhH
         Qf1crWGkJykBh+3WcUE4UuX8pss8xLef7Ssd1N6XnA3b76uxYqFYt0FWRwASxJkwYhwJ
         J9eraewJaEqu85rTTREt7QGv1KDium9S0h4BorTwfXrerD6yttvkpnMtjx3VdLnoM4+I
         kTtAT5+UOZU3NI8FsqVXqHpjVHHJ2dX5r8ZsBNRP4wn4EPDWWvwbb7SjYLyyx71+mTxU
         HzWfo2pgnzI5boM1XbRMGzFP3Imf9YdfwQk103u0XDeh23KXX2TCpy4Y2BXWZR7xh5hz
         CjtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dx/vIXhRvwG/JlTZaI/6ZuIXDRsDVwL2S+wzlVM9WPA=;
        fh=wCcZlKMi+amJ3q64nTyfZvTYpOdBEly33ZzOxmLUrJo=;
        b=cOowa5brsRktUX5+2XnAWJmPrACGYDxqA8QGw6tyz+2XQ3IbTlPQaFKIz1gdKFcf/p
         X1Ij6w1sXfQ4xdl69SnyxCx3m2x4CefoPzAPxPAJ+5zaUgjOrW796+Wf501W0WPNjE1I
         0290S86G39QAXpZdb7hItN4yLNWhcCq0IQHNwGl/FbifwCEe53lup1iswhfqxSWtl6oA
         ELINd+uIltobfNS7dYZwF48TYHk1jmkXfdynXZZljhQhuZnTsmD1MoQCD0UFnG4w9bas
         PW2cGKk+ielKNPGhrqEson7QK7NkwPXTxxFATbAbb2XKHr2PNxrKgs17XyGy4b8wLpCj
         v1KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790746150; x=1791350950; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dx/vIXhRvwG/JlTZaI/6ZuIXDRsDVwL2S+wzlVM9WPA=;
        b=CJoz0vFjqksus96ZF0nl4mlNfSiDP6EkBClOsXIIYbZPHOBr4FTYHaFN9hNwmxUJ7a
         Qbhr8RG5KZx9CNyWBCd7/2KVdEzPqLzx66D7P89sp2Ga2lt7n6T5tLx9mdW3ER34eRYG
         6k1+xmiZeDX0uSBU/9L1UGh7d0OSXWkX9qrbfC8q0qmBeJtJJqLhFCiiLJ4jbHkvu7Aw
         WjPnkDDrtpEL5oUR3/9zuWeyZFjbQ1UVmoDolqEC0R5ACkvAX3BQRBBfQ0HIVoGhF0v/
         oDJGiVhCa17T7zlADd90hSidopTSjfUbABIRzwPzEJBqF02Yil9qdycNZhc8tqbwaVWU
         C9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790746150; x=1791350950;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dx/vIXhRvwG/JlTZaI/6ZuIXDRsDVwL2S+wzlVM9WPA=;
        b=rYhu6iYWwmbb0OSrffmZcv6Bp/AIAARoiZcxaQAlMCD3sZpdcIv3NBEQWU4L5QJx2b
         r7BbnZTZNZWXsyiEsZkYxHeX2EppK0ICVXmlY9x/jswrs7BLFcLeMYSfxwhY7en4O2Na
         LlOgP8doPn3oZA+V3UXdX0I8Af+udU0GElWSonnfDMSAqA4I2gwoNs//SavBTq+s38Pm
         FDRYCtlcu+uIpL7BcbkNjQOsZr6s0fxNSEp5wkjdQab6gvI9+md/AFtQkCIATo58pgfL
         eihzhk6EH4zUt0NACpJtfKfzqw54XJX9BIT2wSgdT0PJaI4GsIXFKhwU6SJYt4SRgK1M
         p3tg==
X-Forwarded-Encrypted: i=1; AKwUvBzu3OykIJFA+MN+ihCEhm4+SG8H96b57+bqJA64ipwsYcrjRWekUg3ObLUe3JIY5Ij0uk+uSG8dyFiotKM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYHGfRTiB9h1OQWQQ5q13Y9T4ClWlHif5Z7RDz/OL/IPn5La06
	NGLQK9QEjBCEg+n1N+smX2pe3FnaXqMT3jYIgDaRe9+9/rwb+ATq6bV1VIHUjV0PB/vw1XC7Ttz
	XwJkIQrT/nTQVBduRGOqmxUQiYJQQ4ybDd+MmSQQ3MuPyhx8MY9goFlvbcQxSyhwqo5f2/lErMk
	8sjoJTByoO0o+ngr2sqQwz6xbcKpLQ2nW7kVuuqWstPg==
X-Gm-Gg: AYBFou2nfv/pRygDECGoF0CRSnlD2pKlTkSgsxTHaQk2+s1pIQb6/pDP3T5YbewIi8z
	mCAs3CbnAKJ4rlU3AZdxJkFyc88nbbCnnSn5ZNGq7s8izXnFyQXlVM5PFBJhkBRGTwTR2hhPeO/
	XYXrZ4F3a9mwsj/yzGV54M5pw/m9joLUk5SxuJ9dAc5ed5Drk43kgALuvgIgI=
X-Received: by 2002:a05:690e:804:10b0:66d:ca8:bed2 with SMTP id 956f58d0204a3-6768341b8efmr88868d50.40.1790746149640;
        Tue, 29 Sep 2026 22:29:09 -0700 (PDT)
X-Received: by 2002:a05:690e:804:10b0:66d:ca8:bed2 with SMTP id
 956f58d0204a3-6768341b8efmr88852d50.40.1790746149235; Tue, 29 Sep 2026
 22:29:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
 <20260928-b4-qaif-shikra-audio-v8-8-ac618057fe85@oss.qualcomm.com> <35e41446-631f-49e7-83d8-bdfca469bc09@oss.qualcomm.com>
In-Reply-To: <35e41446-631f-49e7-83d8-bdfca469bc09@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 10:58:58 +0530
X-Gm-Features: AclHuK_2UWWBuq0p1Je2wHGBs_QJZlSZJ2ybw4Wpxuz_xTntYkBQ0_fPsF_Bplg
Message-ID: <CAC-tS8CTOcAZ-x+q7mnvJgc1ZgiRLmQgvsqAFWHOK7YLSfCLog@mail.gmail.com>
Subject: Re: [PATCH v8 08/10] ASoC: qcom: Add QAIF IRQ handling and platform register
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyMSBTYWx0ZWRfXyYbw9wOyP4BI
 aFwuuczm4d88G6GfiZZ/l4P+fLUl5gC+0pKtlETtFt8M5XshFzfK2tNF0YuN7nUapWWLCKg7Yf9
 xh9Smq1AupLPM3l+BI9ABCxkD8hOgRX0J4irJd1f8AsNOxZDkgVGXUPVRKs21Fuk1bWiRkMDe9z
 B6SAnMzyxDJWhP0sJCUJosMb2OWdVKjDkOSTLpkC4W8F5g5e6lRO9RtKZBztcXzE6/G1ET/5rey
 m3nKiIYIevuOZCkiWYuNZv+CUsYjsEkubBajdhYZXwlI7S59ybVzgO6cY+gu6AqpnfHJHXPNjv0
 pcSAGyYiA4oXjKBwlnUvvPbVMEI8fw9PFm8SnFzpMdfVOeCpErlJmyDk3ikbe6q/rWkfi1wvUFF
 ec7TiL6BFEGyYPHfJETNHLFBw+biZUPO5emNsRxkyAaXON4VTi8j2xpzzQMP9KFWwn0Dl+1C3eB
 5WIo5NzGohRj6hz8k8Q==
X-Authority-Analysis: v=2.4 cv=AoB7T+9P c=1 sm=1 tr=0 ts=6abc9e26 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=ub4Fp3YvjE6bfjjF_tYA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyMSBTYWx0ZWRfX3vwqLS/T8HMd
 5k/A9r+WcqB1UZ+lIoqiIp7JmscM6KCNphFQI1C4Yy7dPpOjMZ934bZkumLys4hDw2Wrjt/R0nv
 ziE+dKo5rLnkadbSueX2VIWpFf3aksw=
X-Proofpoint-GUID: F56EvKTAEvRpWUFnoldV_483UrqAN2Sp
X-Proofpoint-ORIG-GUID: F56EvKTAEvRpWUFnoldV_483UrqAN2Sp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300021

> > +             }
> > +             ret = regmap_update_bits(map,
> > +                                      qaif_dmacfg_reg(v, idx, substream->stream, dai_id),
> > +                                      QAIF_DMACFG_DYNCLK_BIT, 0);
> > +             if (ret)
> > +                     dev_err(soc_runtime->dev, "error disabling dma_dynclk: %d\n", ret);
>
> Should this preserve the first error while still attempting the
> IRQ-disable cleanup? As written, if clearing `QAIF_DMACFG_DYNCLK_BIT`
> fails but `qaif_platform_irq_op(..., QAIF_IRQ_DISABLE)` succeeds, `ret`
> is overwritten and the trigger callback returns 0.
This was overlooked. Will correct in next version.

>
> > +             ret = qaif_platform_irq_op(drvdata, substream->stream, irq_type,
> > +                                        idx, QAIF_IRQ_DISABLE);
> > +             if (ret)
> > +                     dev_err(soc_runtime->dev, "error disabling irq regs: %d\n", ret);
> > +             break;
>
> The QAIF programming guide's STOP sequences describe one more hardware
> completion step after clearing DMA ENABLE: wait for the relevant DMA
> shutdown status to complete, then clear/disable the associated IRQs.
> This applies to the AIF RDDMA/WRDMA paths and also to the codec
> RDDMA/WRDMA paths.
>
> This patch already has register definitions for the shutdown-status
> registers
> (`QAIF_RDDMA_SHUTDOWN_STAT_REG()`, `QAIF_WRDMA_SHUTDOWN_STAT_REG()`,
> QAIF_CDC_RDDMA_SHUTDOWN_STAT_REG(),&QAIF_CDC_WRDMA_SHUTDOWN_STAT_REG()),
> but I do not see them used in this stop path or in `sync_stop()`.
>
> Should the driver poll the appropriate `*_SHUTDOWN_STATUS` register, for
> example with `regmap_read_poll_timeout()`, before disabling DYNCLK and
> IRQs? Otherwise a fast STOP->START or suspend/resume path may race with
> a DMA channel that hardware still reports as shutting down.
>
> Thanks
> Ajay Kumar Nandam
>
Thanks Ajay for the deep thought here. This was intentional, on the
assumption that once a stream is closed the QAIF IP is inactive as its
clocks are gated. But you're right, concurrent or suspend/resume
scenarios can be affected without a complete shutdown. Will add the
full shutdown sequence in the next version.
-Harendra
