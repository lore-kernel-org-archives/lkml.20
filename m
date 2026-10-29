Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793278881;
	b=wcUWT3UZseLGXOin98b68lHRsOmWEw1fupWnF1yz0j9G7VB3KncpsKYmJNPsKMZFqDot
	 id7JWE5rd4IvpLsb9P8INgAlMKJlfqy4xgG3KJQ24YsaIm+72KkEk2dLnqLdpK2wrp8lM
	 PRgiAMPb9CoWA5in6tnAh/96y/g8JxqD1f3UOezuUJH1gF4lENT744vdsu/X1GMQ9w1rl
	 Sj70+QqKkFROWoXdgJlGmvQe8jG/Dr4pTfNhJqcknsoUbp8oGbj2PL1MJuWXRZWFadR5I
	 yojf1xw1AsgeI4kmvciH0wAdoLwpYxAX6ofx5Gy073al4ONEq7KA4xJzvz+1Md1Sf2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sCqBj1P3O29v2Iuw4QofabghHgJM2zebox9CahTqtSY=;
	b=pvuQN8KMaDf/tDXqyL6zgtj5JJieiiAYKLIgcsUbJ2SR3ho3Jw7hYYMX8g/GybVPJs1s
	 ibSvZuZuPAbifCujYQpZib1bydwk6XNFAQqntEwopB+SoTie3YfvcvyRya9vVFF/NCVJp
	 k52xwRsu3ZnqjQgO3yYCDs/aYfwiJs5KQFmddqJ9/Kj4mLpuSmOwzrUl04LwZI3XzGCHF
	 bKZWiPkDlNYF9e/U6t98MklXO1MGDE+U0bvsIh8eXfZt/UjEkUUeS5VSq70rwBSMkJ8YL
	 zgkN3SUe7APNQFp4jtmDRg28G34Xs0wPddYiVTLEvO0J7wh1XZJ3PSOBtGB78Nqq6dQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ns1FYDU2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CkwGn0z0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EB3606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15EB3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ns1FYDU2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CkwGn0z0
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCe1tw3943774
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sCqBj1P3O29v2Iuw4QofabghHgJM2zebox9CahTqtSY=; b=ns1FYDU279IfpQgI
	5Xn4h2MdKmuH+/u47439F3pYrN9ZIfaGfINpAuaShNOCWkF4Bc0lRzVXnUlIyHYL
	E2xPmefscZQNq2QupAGPPTw1/XQDMLZQgN00sIkzhP6/cEbKOwFoYwCYCTIwcNfL
	17hidvGCkZFvFOWUF7ZkuhXzVLNW4x3g84gAJIyArxWiz0czk4S4WucifBOn3qZU
	65SZY7arYllhpmon8p1Fh90/PzWxPNUv1QyG/nRo/DRCgbzNFf76+88UV5G6JNPc
	+eYi3U4KNCe+BOtxD+8+jCxgjp8OHbrpwVkpsNbyidoqq0TYmRJgO1GEB0r/WMBQ
	h+bOFQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm42fgk0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:01:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so371983785a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:01:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793278879; cv=none;
        d=google.com; s=arc-20260327;
        b=QZ9ZfKNSnKDE7zsGfSZp+mSeG4nxbGv212+kb1O8L6sFFhK6rw/UFU9ONlqLsGbQ5g
         GjfWN3OkoiF5FhQRUhUhbQHg3DDng/+qD/qycumsYof+WJM5GzFKsyAzVKzRPeIgJ383
         rr+OeoSHQWXO5i1q1mARz6p3qJYEiE7zd70A29JGZyDqKBq1Kjz9tmCOJI3ftqBAu9Q+
         Isx1AV1WxYSsVosSn1vQsn9J4ABtvsIwim8Cdq4YfKIsLLrwI7YhqOfFhf0K+CafzZMX
         Y/1m/DT5afxYIeKsxyBrYRO/CauceDMS1jj8ZjkqzC+RdYUkpN5BgxGKzEDtaa+LbTiZ
         j0ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sCqBj1P3O29v2Iuw4QofabghHgJM2zebox9CahTqtSY=;
        fh=BsDCbL+5taVzE+IKiKdmFn8kMo0QwAx2a48yXVu54gM=;
        b=gwvJl6fk0ro2tFgfGz4tkrKZ/h4xOCt6Ft18l1brvaCnTQRnWu810k9VyngwnRzBVQ
         5eTzvbsLONkY++nex1gXXPxdYOXt6LS/ps6472luLBcr6wqx/WQGdqxM2N/TER+QsDmm
         +nGaiR4tcW+FID9XQmSWzsJsu3Js2TFvpuRSMQ3rxPW/tXFktliPfLb1PxmAcPWL6TQ5
         dfCtIVmcecfi+nv36oBkCFibNHaQAyNHzsvrLeECVhjI6pRqvmkbodS4tM3H1qWEe10E
         Y5lLyjVvUvo54oXh76PlrrL278jlMRPFkDSFX7Dpe7yQX8wnEV/YkVAZQ4nYwdY8oVpP
         H7ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793278879; x=1793883679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sCqBj1P3O29v2Iuw4QofabghHgJM2zebox9CahTqtSY=;
        b=CkwGn0z0gTGQf0rYI3I0ZqNYBhs2le2eBDUjSnYWTxj0RY93vcT4hlucRb/MQJHmmM
         gA7eRJF78LPDo2McYA/TujJrCobCa4KpvbSaXXNvlZ9qpBZoyYdx3lMqM8XV5B0EniHp
         Y2vNn68tu59hZZ1jHoxtzJlodjpS+7EX2qqb/t+3FpOYXhnWgnTjiqKlrAb3e76ahNKm
         DDqznOPfcPmI2OUnn4G0WhUa0YwYhAuGMekr7iCiOTyc457J7wm2SP14bf4puEM3WWHV
         iIaMpZNhpairsMyyzXRoSpYixjI0bSdL5ag7OWYKrhk0Vl2uvjrSfgesb0+2jtKuoZKD
         oYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278879; x=1793883679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCqBj1P3O29v2Iuw4QofabghHgJM2zebox9CahTqtSY=;
        b=alDP/ZTFPcQPVvJiQpjfGQJPZEKcFz40d90k6o6iJ4vm76YYdJOGXSwCUBHjJhe5Z1
         CHyuvYnXxju2/HkFSQUcYj61AEAv88QdkreFdA3acQl+MuSrIENUtqerm2sZSyZSwv5C
         7Zi2Tc8/DIAeo9DeCSjrlWh7dE3zCZ7gNq5hNxNQz1HWwAItN8qSMuVJRP2dq5anj+SD
         FcS2jlMcAtPG5swWXuJ8g+yYkVBjwJg2PTSI1TlRyuhzMi+YALReAzZFEG3U6z2YtigC
         Mcprq/b9K4VLp+K3pgpttiRpb4lXe3tTIVpvIFCXdwovR3E+zv+zZVvwyCvuAPcm1MPT
         MEWQ==
X-Forwarded-Encrypted: i=1; AKwUvByzOSIgP9ncueZKHwgnb9JU3jNELdT8IJbz8A/CgWAPTMm1lH7/E0ecpvB1ixddZKYEU2IXDu8q1MMgUp8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLedsRwqSbBcaFDyHegzfyl7Joe3XhS/YUMTTIsUCr5957ecIEq
	ak95z14fxaAqe/FfpneLnfbcroqXL8pZ55+7027za3a5VvJdXZejHlUW9EsWgswjBGQQBtdBXmU
	86nUbm4JF7bkZrhmMcM9IiVYh8VkJfV5BvqxW5MXvEwImR3ehXoUyYGWNBu/twt9b9pL9Edw1K6
	f3/MaSzfucliLVrrj7H4q4omvreRXHG4SmyTanDNQyRg==
X-Gm-Gg: AYBFou386Y2Is1faeHipOni90Q4D4NTkV1YyPUv9gSkArJperkqwnMIeP32ZNEwRZ9B
	idxzD4c3xESlWoU3NXOtAxflWLQw3n8hxuLgxXDQAc8hxT9MxFuKYiP1C+rR8xeOA2pLcCLGsq3
	Djlyqodzo46GFZ0EzBQ8PwTKvPjwh17kl7FfivwG9/K1t1lhIZ9S27BfIetCzIFMtmWtzSqSwYo
	9NGPrQRSXbdK5gZIiARxFWpLF+THWj+k2h1Mq0rQLXulT9BdthrUpr+ivrhSrYKGLNNZlY5LyWi
X-Received: by 2002:a05:620a:1725:b0:93e:fb96:68f5 with SMTP id af79cd13be357-94408a8c3b1mr790977185a.32.1793278878832;
        Thu, 29 Oct 2026 06:01:18 -0700 (PDT)
X-Received: by 2002:a05:620a:1725:b0:93e:fb96:68f5 with SMTP id
 af79cd13be357-94408a8c3b1mr790970785a.32.1793278878266; Thu, 29 Oct 2026
 06:01:18 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029123107.28705-1-xiaqinghuan@mail.ustc.edu.cn> <20261029123107.28705-3-xiaqinghuan@mail.ustc.edu.cn>
In-Reply-To: <20261029123107.28705-3-xiaqinghuan@mail.ustc.edu.cn>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:01:07 +0100
X-Gm-Features: AclHuK9HHjKdAV_87O7vafl7ryiBF0S_hg2q2SY-cNvI08xHiOvoE__qojfybps
Message-ID: <CAFEp6-0sLQfiNP8e+3+ZEXnjPG4GzJSPtiyEGfG2tXt-DuptGw@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: camss: video: check that a buffer is DMA
 contiguous and add a prepare hook
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MCBTYWx0ZWRfXz5DdpN+FlDBq
 SDMsl87lbxhAGbjlq3FF0YS7jBZUrCg8187ZVge39B23aGPw5KBHB9UDpewBM29jLVUeNTLfkV5
 khyG8KtkSQMrgiPQBTXkD4UNa6hBbK/jNxFByxAVLTtzM5e9/7zU+9H24De4GZalp9yrsnGUXQL
 mklOGH7soLphgwJjGNRtnsQdWz4efNQZxcJe78to72mfWe6K/d3txwCxFiZei5tAP9jyLMteBDv
 ARJe3UdzxhsFs/12uYY0Ws9KyjC6OEW/lGMY77qwcLLD5LvjRlquFCM/90WzE/gic4mstHHJZWq
 f/wCx33uJWMcnGhC3ASyKTzKDmV0fgsLP/gLAe+csDGJ93GYrLoVdMElxjjZ4oaw+9KVEq8jDPF
 Q9Gn95WsnJFl4m51E6O1ulvSSYHIzobS+idoXU+V5vmoDuQI90LzQJmMr8GLLh2kN3G6Joyz43M
 Zo299xC5dXMsNHuR0jw==
X-Proofpoint-GUID: NjZ8CoN84e4zvsQ29fBki6vcD_A54_5Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MCBTYWx0ZWRfX+vVoNGXkdB7C
 aPIWv+eOUHFUKBbvnkzuAlIP9Od/dCaJ3pmdKMMNWPv9zTfSb2a6lOXgY4q4UahwYOBHwlSjAIy
 gn97FU5BmtlAhA86qyRTKVgNZBAGlUc=
X-Authority-Analysis: v=2.4 cv=UN9Ijyfy c=1 sm=1 tr=0 ts=6ae3439f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=5jp7TkJpA6SZ9Z3lt2IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: NjZ8CoN84e4zvsQ29fBki6vcD_A54_5Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290050

On Thu, Oct 29, 2026 at 1:31=E2=80=AFPM Qianhui Xu <xiaqinghuan@mail.ustc.e=
du.cn> wrote:
>
> The write master of the newer VFE generations can only be programmed with
> a buffer whose payload is physically contiguous, because the frame
> increment registers describe one linear address range.  Check that the DM=
A
> mapping of every plane is contiguous for at least sizeimage bytes and
> reject the buffer otherwise, instead of silently writing past the end of
> the first scatterlist entry.

Have you tested the non-contiguous case? It=E2=80=99s a bit surprising to m=
e,
since the device-visible IOVA is still contiguous.

Perhaps this is related to frame subsampling, in which case the frame
buffers themselves would need to remain contiguous to take advantage
of the hardware frame-increment mechanism. But even then, the relevant
address space from the hardware's perspective should still be the
IOVA.

Regards,
Loic

>
> Also let the SoC code add its own alignment requirements to a queued
> buffer through a new prepare_buffer() video operation, which runs after
> the generic checks.
>
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  .../media/platform/qcom/camss/camss-video.c    | 18 +++++++++++++++++-
>  .../media/platform/qcom/camss/camss-video.h    |  1 +
>  2 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 0852eb6f13..027cf024f9 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -155,7 +155,10 @@ static int video_buf_init(struct vb2_buffer *vb)
>         const struct v4l2_pix_format_mplane *format =3D
>                                                 &video->active_fmt.fmt.pi=
x_mp;
>         struct sg_table *sgt;
> -       unsigned int i;
> +       struct scatterlist *sg;
> +       dma_addr_t end;
> +       unsigned int i, j;
> +       size_t contiguous;
>
>         for (i =3D 0; i < format->num_planes; i++) {
>                 sgt =3D vb2_dma_sg_plane_desc(vb, i);
> @@ -163,6 +166,16 @@ static int video_buf_init(struct vb2_buffer *vb)
>                         return -EFAULT;
>
>                 buffer->addr[i] =3D sg_dma_address(sgt->sgl);
> +               end =3D buffer->addr[i];
> +               contiguous =3D 0;
> +               for_each_sgtable_dma_sg(sgt, sg, j) {
> +                       if (sg_dma_address(sg) !=3D end)
> +                               break;
> +                       contiguous +=3D sg_dma_len(sg);
> +                       end +=3D sg_dma_len(sg);
> +               }
> +               if (contiguous < format->plane_fmt[i].sizeimage)
> +                       return -EINVAL;
>         }
>
>         if (format->pixelformat =3D=3D V4L2_PIX_FMT_NV12 ||
> @@ -193,6 +206,9 @@ static int video_buf_prepare(struct vb2_buffer *vb)
>
>         vbuf->field =3D V4L2_FIELD_NONE;
>
> +       if (video->ops->prepare_buffer)
> +               return video->ops->prepare_buffer(video, vb);
> +
>         return 0;
>  }
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.h b/drivers/me=
dia/platform/qcom/camss/camss-video.h
> index d3e56e240a..af046ecb7f 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.h
> +++ b/drivers/media/platform/qcom/camss/camss-video.h
> @@ -28,6 +28,7 @@ struct camss_buffer {
>  struct camss_video;
>
>  struct camss_video_ops {
> +       int (*prepare_buffer)(struct camss_video *vid, struct vb2_buffer =
*vb);
>         int (*queue_buffer)(struct camss_video *vid, struct camss_buffer =
*buf);
>         int (*flush_buffers)(struct camss_video *vid,
>                              enum vb2_buffer_state state);
>
