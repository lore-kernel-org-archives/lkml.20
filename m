Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA444B8285
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791388494; cv=pass; b=b/+Zh2Q5QTFuFzjBowm00m59ByJDmfBa0tckiu51vFsftlst6WG/V7tvPb0hps2G31oc69SkcmAC3xw8kTPlhErTfja8zZiwL68tShA5pjO0rB5MdXXgbfXw9FuP6NCEZo3iIat7Pmh76ADo7z/b4VairjhVQQuSUK+byN5osuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791388494; c=relaxed/simple;
	bh=pwJa8BaFaUlr/o3p+oE/Sl8mnLDMJHG38kHTjzu4gVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIXWp8QWOpoQRChkkWJhuMuvO7F5prnsYiEUF1psod+XJzFL1Dbx3HpdKa2KSagOo1vQiKlTAX/V3KKgTELjASn/W1pyXK16w0VRjXRaxgZOKOzqJl5D34ISzzDu2mU9SSsidl3oXqWLsdUSmSzaKs/IEONA0T5pU/BHZvi8SWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pklZAV+e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jbgri3oO; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pklZAV+e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jbgri3oO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EtVZH3646978
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 15:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Wn/eF3+D6S100Mm1A0q9mTWa29XtPz46LOWvNb0UqIc=; b=pk
	lZAV+eC/gcSTolOMNnBZPjxvRmtcGRUSGVmNasznAiJhX6oInpKlXD1fMtOlvzDm
	pbjnlVgWTH/8MVvpk2Awu8dUejQFLHhHl3T1KbylyysniMO9IMnrq1dYrlkOzeaA
	Aaq4cip4T7hjTIYqyOMUA2tBkNX/nbR7VtM9P4Ejb6ADG5Gp+ljLK1r2qfHB96g/
	VBWp6MFqGHUuf63KJkxeiGryQWkok7o0XZgPo8EEdla3laHofYP2HC/rEUUZsKc1
	PE1TBsPCAqzVdzkrTE0rYZUvcCa6WDezLY8zIcekxyeAZGiqpSEK/UvbsnDgubZ6
	N4jcJXtvoRZKq4a7at3Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s2xqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 15:54:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34d49d8dee1so3845345eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791388489; cv=none;
        d=google.com; s=arc-20260327;
        b=g6/uteXKbzz0hMMV/AvEr5qZU2hyiQtuPAzKb2SdeZ/owy9iTov9fgxQWPv315UKVJ
         1HYl6a9MQ+15Xflz8A48gPy9xGpu1K+etgT2830X5kaSqiTpAw4gOoOV7hkv6I6i/5Pi
         qMsX6B5/RPdHt3gzQR6AIx2X4uaybaYK4tzDiPyJl6zUfQDYdBku33qqxGwc9qGIcjMc
         Prg8ySyoYdBuNenINqdycd2UH1pNUY+hZHiegPAAH179oqIYG96kZgM2iHegACdnGzUx
         X0x3D3gM1lWs78/+brx7H7Ypii67qMWKMdOPHHbmkQqOJ+YlTtA0mrb/ZTJhM5EZKFUX
         pm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Wn/eF3+D6S100Mm1A0q9mTWa29XtPz46LOWvNb0UqIc=;
        fh=3Ly3kb2nfmWXhv6hpjCNvAymRaTiwabJ8+WQ5Jxg+EQ=;
        b=pVyB0Ci9nsy2ft3eIS2CxmN7jR42kefv99Q+jgKvJc1bDpY68o7P6189N7V5UAMSUG
         6KFZAXHW/+iPUKrRJ9XN0fdEbIt02JA544p7GYMPOMM2dOPAl1kuow5v0hmC8cx9AEGH
         TJXaVCHRGpYy0BOwv7mIegWx/NMyEpMSP7I97aEIZhrYEvefY+5hz+PtyXwQzGIcVWsg
         X1KOcqITUDnP/jLLUa2y8rtAeCqS9XfPWYyvIGtWCbet6diEst/clMB4DVM1LbzOCgab
         HCU/LuI58VE2Ig/vJN1wdw0cxDNhZxcs4zNkNES4jReX3sy1+q0F46RUswXtJUyVrAUL
         jbYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791388489; x=1791993289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wn/eF3+D6S100Mm1A0q9mTWa29XtPz46LOWvNb0UqIc=;
        b=jbgri3oO/4UaExQgXcbVabk8bnsLeA0GT7TvTWBLPOtxsQjglp/GYRw41hdcWr4z0F
         RuUQbewkOcm+TmXVZt5+7D+2eTDOwzyVbf4x6VAqNz0GWNA1taB1jwin0tJCDGx2JT8G
         nveV1K8FF96wrmgTXNevZzYENNaVrHGdxKHKlTYSVJtEzP9S8kCX8bolXi/DCjPz+Yf8
         RqQl1bBxhfETb1hBxeXKDyJzZ6GzL9OeX0RT7/C/jcOIqS/wEjycFMoQab9Gg2UhFSTA
         oiwJIz51E+fRzGRJpXQrFYmTYQ/WbyEiPWFUrajmLUSFBYjCwxhAYQ/vwwqNVxf1GFN6
         mdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791388489; x=1791993289;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wn/eF3+D6S100Mm1A0q9mTWa29XtPz46LOWvNb0UqIc=;
        b=BmK5BHRznNr3vbQTKrf/QbfmhwlHFLxFRhWXWN3QBOqbbQjIkaND539ZF1cLOkEK/b
         PXwUJtf5c8EuvYAv8LPxiy0UHuDzyKTfvG9w7WLeth2i3ua+d482PMP8DteH19Rx+0n+
         Gloq0tmBFQhxM+Z/3UD6jzMp+AT7ZJel5nxrDN+RrUd85BqGcqHYFqUXWX8PYU1+8kd6
         TWJPpdCdiwqN3/R3SzUxwxF3uepjoEFtXUilviP4+2Ohfw9dfd/tRjro/cB+uqA6lSSo
         8SWWeP1uQaSvMvti8g5BUtU/qSPY2Rp9ziWTk7ASuj1+SUzxv+jwjvTIJ7L+g+RMsf1W
         T/0Q==
X-Forwarded-Encrypted: i=1; AKwUvByVbp92pBKsZGq/3wTfPCm/LAdzTpoBIM/Y3kyUdBAwspMtu4QUYD/QG9IuCW3JlwwHEm0FN2DDXDfsT78=@vger.kernel.org
X-Gm-Message-State: AFuF++ni3xsdbUNEIaWjvFvtj0JPH83kDKMJBR7QhamHrDAD4uenn9+K
	/03uTI+kdAxL7pMg3Me0VEX4HyYxqzQgW+8BnY4GKU3asQTxXOew1B+NaYX9eoRIPgBE6k5Nv9Q
	abpQqynLBU0YwJG4OGpATjxDT2h1aMIXMWh/CSyGuBa+oXDemxqwreHeDslZyE4sWCdioZm/Pyo
	Ys9d7NrT7gONyINMakVg3xRnv9E2tLU6B93dJPzfY2lA==
X-Gm-Gg: AYBFou3ydbU5jcYjO7HbwIHvlFcm4gunKFi3VwtbE/UJWvWgAEhlryk4MnhRlP5h4cv
	OAwuXVzSyOH5f6xG9yP3ikMOrKrOMtF+795R1V5h87w5Qgip7hnKjIK1SvY/Xs8CvP8TByzqOtj
	v4OaSRTIOnbvKPFW8ZZStltkwTt1LJYSspNCpy5FXyHE+M/oWm3PZ8+9UM
X-Received: by 2002:a05:701b:2806:b0:14d:c7ae:85dd with SMTP id a92af1059eb24-162044bf3f0mr2885589c88.7.1791388488592;
        Wed, 07 Oct 2026 08:54:48 -0700 (PDT)
X-Received: by 2002:a05:701b:2806:b0:14d:c7ae:85dd with SMTP id
 a92af1059eb24-162044bf3f0mr2885557c88.7.1791388488032; Wed, 07 Oct 2026
 08:54:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006131000.81501-1-robin.clark@oss.qualcomm.com> <20261007131543.7634-1-liujianfeng1994@gmail.com>
In-Reply-To: <20261007131543.7634-1-liujianfeng1994@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 08:54:36 -0700
X-Gm-Features: AclHuK9GXc0-XXuEkvshyXJ-4VCucnnUec19JgkYED6meMWxaPoMrc6_lJWUEQc
Message-ID: <CACSVV03imsi930GwjSHwAAb0D7wAAmUpbkPRzQwYThfb+A58kw@mail.gmail.com>
Subject: Re: [RFT 0/5] drm/msm: DMABUF_DEBUG fixes
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: abelvesa@kernel.org, abhinav.kumar@linux.dev, acelan.kao@canonical.com,
        airlied@gmail.com, akuchynski@chromium.org, bleung@chromium.org,
        christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com, jesszhan0024@gmail.com,
        johan@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        lumag@kernel.org, marijn.suijten@somainline.org,
        pooja.katiyar@intel.com, sean@poorly.run, simona@ffwll.ch,
        yuanhsinte@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: ZiLVgPrDsZOXcksRuB9UgiURNsGiBIJt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2MyBTYWx0ZWRfX0/izGMKC+9mr
 g1+cXvGS+kAHYIQGY9oCTnQfMo28XZF1DBaTXCb494oBkrb+zcdiHCYq6JA+sdteJhweRW3thbe
 RuVQzM/v2fFu7u80FcUiL6n1xpvl+hjHBuexO4fiex5j/4FuYemGdkJGs3mRkUYrBt+ZVYSC8Et
 o04GjJM4NFagY24qsg0JksGrMvcBMJI0n/5pXyhCMjoihkcF5LNkPXZkRtBBd+SftcB3Rhdiy5h
 1ZVlqRxvB5UCN5Gan/phzccefwzdye43mIeZ9za0TNZkD+UHW58ACSedMIg354KWgTXYsZp+TnV
 XvSZ5dlgD+Fp0A8vXAip/nGOLZfqzpq7pxtWngw5D9AyhKvvXnlMzPVFBYBJ7TIm+SpvBybqkC5
 rjb//DSUx/zSN9s/YFUVhhLm0xcH2T+DhRddY5nbOjC0Zp3yxoFQ4G30LTo6nl803R1w87LlGv3
 IsPEmbFMxTZ935kcPPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2MyBTYWx0ZWRfXw9FIx9mzY11O
 ylaEAPkJLPzWc9MeK02OFwLUthrn+l1k+tXkjf8BcO3tBOhS2jHvTI70Ij3axS9Wke6ELALGdlO
 zlj8bgWWbGcwu/A5+DpPIA0Sxr3MyiM=
X-Proofpoint-GUID: ZiLVgPrDsZOXcksRuB9UgiURNsGiBIJt
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac66b49 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8 a=dfe0JtAcDOuVnXIYvJMA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070063

On Wed, Oct 7, 2026 at 6:16=E2=80=AFAM Jianfeng Liu <liujianfeng1994@gmail.=
com> wrote:
>
> Hi Rob,
>
> On Tue, Oct 6, 2026 at 6:09 AM Rob Clark wrote:
> > With DMABUF_DEBUG=3Dy, the page information is stripped from the sgt th=
at
> > we get for an externally allocated buffer that is dma-buf imported (as
> > opposed to an exported GEM buffer that is re-imported). [...]
>
> Tested on the machine that originally reported the breakage - this
> exercises exactly the externally-allocated-buffer case from your cover
> letter:
>
> Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer
>   SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=3Dy
>
> Hardware video decode in chromium (V4L2 decoder capture buffers from
> videobuf2-dma-contig imported into msm and rendered by the GPU)
> displays correctly, with zero arm-smmu faults and zero io-pgtable
> WARNs.  For comparison, on plain v7.3-rc5 with DMABUF_DEBUG=3Dy the
> same workload logs UCHE translation faults and a __arm_lpae_unmap()
> WARN storm (~470 traces per minute of playback).
>
> This is also much cleaner than the translation-based approach in the
> follow-up series I withdrew - mapping from the DMA addresses is where
> I should have ended up in the first place.
>
> One small suggestion for __do_map(): panthor treats "map_pages()
> mapped nothing" as an error (panthor_mmu.c):
>
>         /* If nothing was mapped, consider it an ENOMEM. */
>         if (!ret && !mapped)
>                 ret =3D -ENOMEM;

Yeah, that is probably a good idea.

Thanks for testing

BR,
-R

>
> With the DMA fields now populated on both paths this should not
> trigger in practice, but it would turn any future regression back
> into a loud failure instead of a silent empty mapping - which is
> the failure mode this whole series fixes.
>
> Happy to run more (heap-exported dmabuf import test, kmssink scanout
> of V4L2 frames) on any revision.
>
> BR,
> Jianfeng
