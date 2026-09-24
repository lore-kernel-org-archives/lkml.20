Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED69A37FF46
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258520; cv=pass; b=HkEnlQFz2u/oh5jyAqO49FVVQZ+66cNLcJ6p1EBqm9cL86fmUC6TthiMTpoMXOvrd+YkHk46JRQWO7IjrLXYofbVDXhgtDrbygEjMafa+EgM4rE5y9OofY6y9Zbi2rhPWGHdh1IICTtYy6ROq+qJ7qb0KXdtsW/UwJjDj5XS/pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258520; c=relaxed/simple;
	bh=tdJyJTnBDHp4ZjjlmGWLTbMPtruRmMD9xWxDu8H5VaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZbJrFB7WGyJT7869bM+0GSdlY0Btoz9+RBwPmJB/NVcckf2rBTcIbrphgc5BEBgdqKoFX5F7sIzHi3I49bFJ1XtwsGVz95IeSPt9Kvw2a/+cRoWQbqR5cNRhA/5MeasaofeC0Z19xb7XHhFUEYDOBZ1VHryPTzvhGoC7JXMhkNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BlgJG9IT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cqPf2Ee5; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BlgJG9IT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cqPf2Ee5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4dqg3134203
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Y+5dXl8x9fmntpeFxM19iIhvgt0k/LL7dD1+C5hddi8=; b=Bl
	gJG9ITL1KLa26czRDWH5FL6HTQZiUh4Aayd7GRzDH2YRHWbWFm1y19lHI2EbF023
	PKSHxZgkQPGZ57OxZ1T2cL7yOcpxC6JnLtFYMvh6/ls22YixeU2YCkFaYt+J7OHt
	qyhMk+nOQMnDctXoHdlUT62K/omXSESpdyysD7EglnJND1UBo3YfbZ5MJXq5tq/3
	ec7Q2Q7dP+7rIvVXBFG9wHD6NQnDxGrFfqfPAf9cSzMhPMgAL13rZomlnjTtklEV
	YlRQXY198PYemdgOzz0CQZyy26LPjGK/RjQfb0wflZ5jYjkB+xdgfRjXyPJLhyio
	kCBh18+ANf6JOpdp9uvg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1ragxtd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:01:57 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1ac969b92so3007117eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:01:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790258517; cv=none;
        d=google.com; s=arc-20260327;
        b=I0evmPD6aCgPHjOar3KCeYPFZ796kRLelU1k2pVRCGCryE74AfpE5b147J86E0mmer
         r/eZOlXU66yfRSncsOaMFqf+lEj5mGGlAoPDfnNKarUM51i0DssQHpnEH1lhNoy5RzE0
         XDQw2ipbWPD989xlPcBs48iVFaf+BZ/uxdkiy4X0j6U/ZLJLc2ovvDcejva8SyENiOOW
         g7AXAT5foKBjPZkYq6CSEvnVnbMI+H8itFQ+YL4IueqN45OF37j0Fuo0pu1xZfM9ir/S
         5TKjGAHLd3BAkWeNSqMrVxjqxWXS/sMnRDds++t+/RMvkoyGMmD1GrjRTiIp8PZL8vYg
         2myg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Y+5dXl8x9fmntpeFxM19iIhvgt0k/LL7dD1+C5hddi8=;
        fh=dZ0PP01x82uxfn/EIxcyAIaqmDNGRi+ODySN+uvhA5Y=;
        b=HXh5gQWa4pGxKs8Jprsut74J2lSCgvLKZlTIaJPBiHJwzdSxO/x2Kt9wOsBDcI/Tud
         ZVW8jQ4KuCrkrI80husQ/VZW3EZOhDPOtc+ZypM0Ky6OsSHAlv7jse84xh4irMwxAx20
         PNzgaL2o3+wyMJiEuqgbdc1qiXxR+hoz0Mw4hqLuGoJuzmKlanby8vtdM/pRRVoeycHh
         c30VTfDW9iqz8TTZu/snWehfLna9IyuvKLVAEnes2QEqtYFsQ3fEKMJeZoho8nKKBhry
         Td5YEMhmbxd5jZONXhrbF5bodyDqF4DO7BgbO0Q0hh8DIIq7NA36JuD+ibwnbI7ktoly
         rK8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790258517; x=1790863317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y+5dXl8x9fmntpeFxM19iIhvgt0k/LL7dD1+C5hddi8=;
        b=cqPf2Ee5+CLD9+TxVVClg7Awkyd4kUp2oDi49jWs86Xq2JV3U4qKjTmbIwovazPs1t
         2OfNaAP0pD0dwTmfoSu879bXaT97NQspOBKilL1BCVsPO5zIe8Oa4+ERuH8ONxFHxDwv
         OUcPBoi+vgLkbD5I16Bgpx6Ky54HsndDZJ1lmKX+MiRtCBobhzKHQhZf+3RDCpAx5DP+
         fjflEtFC35Cjk2iHt3ijqsWMHnPOpVqnIvYtRtLb30HAXMK/nTgyF/Em4cpf0TTci+zJ
         /D2qDXJBX9pJ4q+vJgWv1iCwRq/1GilMyRp/vkp4onNGfehEpvC/0rvZqYYf1UJLvKiN
         HjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790258517; x=1790863317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+5dXl8x9fmntpeFxM19iIhvgt0k/LL7dD1+C5hddi8=;
        b=aIVJmbLx5UR8VgrtLafzKwizR19gfQbhYPwCdijoR7AHSBIiIiJc/RcDq0GDD3ZNkE
         EbIulmqrp/RaYxHMOuZNNYmU6BRDOVQ8nqbJM9WWADUm2IWLifzZ40PWFKWL/vCUEpGk
         tjKEy8Gq1pdKFU/Plw2ptdVGZ75q/GGBuCg+aHoLgT/RCXGkFzD4QTRZ/JkHT4gJqvVh
         skk3qV5oYEvrSUku8/WxXjhqgekMHANjx3PwaNhn7LFTQOpDIIh3r3SwrXrdtJV2sCWc
         XFUFL1DdLBozZdS4WZ7auK0qnGAX5tnTDV1TCjrhDiPZAQPwtgWS/QbiJJAsPaGtWEUD
         hTHw==
X-Forwarded-Encrypted: i=1; AKwUvBxPzFPLPVy6gyP4OFIHBDZQLUIBDWOUJjxa/uNzA9enYJE8ngLXYdUKP3hvn1Nu0SWBDcddJHhpF35ikqY=@vger.kernel.org
X-Gm-Message-State: AFuF++n69Sx4+HH6ONRIibvT+lAjN0TcYd1QTNiTUxSeuKdY8zQq/3B2
	Wri5JGE+0NlKrq8tNwdHWMqju+bIf3ZP6tx6VLiPSaw4a2xp5vNpsXJnfRfVX5++854epoqSPh1
	hZGL92zV1S3EpYeZBexthFJ5f1qw02zhi1hoa8UuNZWVHbX1DBn9AIx/wdlapsU9uuVHYcCjeSR
	u0LfR9yeBw4dhUZhnz2ijFnU2Ms/39f48io/fublLMkw==
X-Gm-Gg: AYBFou36syNf4ZibgbWNoiLnIF1svfmIR0sR0oqj3FKAjNjTaOmYkK/aUgzlaolwV50
	0k5N3qjkNfLNazS+uWzzAtPeYJRbD6dbtTiVYXpjq4EwEti4ciDY3XALZPq9Cm+u9uNpygXoicD
	zUi4QBtRAOBLlAVmADn+Rmk9mb3WX1hVygHimD/2bQUdUYiU060MvlcXrj
X-Received: by 2002:a05:6820:180a:b0:6cd:3fec:de81 with SMTP id 006d021491bc7-6d441e6d077mr2471552eaf.87.1790258516949;
        Thu, 24 Sep 2026 07:01:56 -0700 (PDT)
X-Received: by 2002:a05:6820:180a:b0:6cd:3fec:de81 with SMTP id
 006d021491bc7-6d441e6d077mr2471495eaf.87.1790258516334; Thu, 24 Sep 2026
 07:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923074256.9357-1-liujianfeng1994@gmail.com>
 <20260923074256.9357-2-liujianfeng1994@gmail.com> <fe3a4297-f300-451d-9763-0b3016706111@amd.com>
In-Reply-To: <fe3a4297-f300-451d-9763-0b3016706111@amd.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 07:01:44 -0700
X-Gm-Features: AclHuK8PCKMtH5RJ_KGTSVVtHj2pbRynhRsLbl6BgMXL5O4KYIi_8g5-kxz9ApI
Message-ID: <CACSVV01NZROH9U5Qjd1TSDu+BPyyPLC9pFByqSfrxXrPJV+wZQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/2] dma-buf: keep DMABUF_DEBUG off by default
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Jessica Zhang <jesszhan0024@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
        freedreno@lists.freedesktop.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Karl Mehltretter <kmehltretter@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1NyBTYWx0ZWRfXxNgWrzqhbGKc
 exAKnHoNWxfDfwKSCm5nyBMnv+a9HXCrXJWamuU8z1p1BzmenH4PfXcCh7REmMRZH1EEzGm8r1H
 SmbQFVWU/Bw3jTzIjJKKUedgOAtCCEFtI92vt6nzvOcikWoDkUlk0WlGbczYNYGkLinpcqnbqBy
 WlPaxNPtrr96Di9B9XFdNPIBbxU9QsenQjXwrIeOOYVUkggIoz9UnWPQSjO7V6nN83SLHgWI1Tm
 SYr0oqNypfmZUetDYA4lxz7/ao8oSeHRLd43qZXMLySfmg+ckHDWyT+lBZeEUIcM+ZGiZ+nYuoY
 wb07A5/bY6J58+2Uq1ixmTtWMVl05gleDSpBU1RZ5NoG3bmpkfF46d86XEHIFbJCPRSfKUCRDS4
 BUIZixr1ZDlwVtKGoZxSDtTZYz4VLO0dwHJ5YEkGj7QcbI0zOLuhUWCmmY1XgvgKCqGuwGd5N1G
 RiK0bcO8k1TEoNYmepA==
X-Proofpoint-ORIG-GUID: HHwZrvdcQqwKmE67bwOFOPc_QLRbX3YA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1NyBTYWx0ZWRfX5NKQ2c0y6ZUX
 6/U80jiQkQS7N8Z0OQ1EcZpqk9c5HsFHxHWf6IYaulZx9KSzUwdWaaEdS5EjT4Y+ZAoMp29giPJ
 L8KdZH/N5wUCDGzGk4bvr6g2X8N8IuM=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab52d55 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=_EeEMxcBAAAA:8 a=zd2uoN0lAAAA:8 a=pGLkceISAAAA:8
 a=KFY_g6KMpv9GzmgDfC4A:9 a=QEXdDO2ut3YA:10 a=ejeoeQMvoq0A:10
 a=czjwGCTIUPoA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-GUID: HHwZrvdcQqwKmE67bwOFOPc_QLRbX3YA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240057

On Wed, Sep 23, 2026 at 1:03=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 9/23/26 09:42, Jianfeng Liu wrote:
> > [Sie erhalten nicht h=C3=A4ufig E-Mails von liujianfeng1994@gmail.com. =
Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka=
.ms/LearnAboutSenderIdentification ]
> >
> > Commit 143755bdabaa9 ("dma-buf: Make DMABUF_DEBUG default to y on
> > DEBUG_KERNEL kernels") fixed a dangling reference in the DMABUF_DEBUG
> > default, which had the side effect of enabling the option (and with it
> > the page-stripping sg_table wrapper handed to importers) on every
> > kernel with DEBUG_KERNEL=3Dy - i.e. virtually every distro kernel.
> >
> > drm/msm is broken by this: it maps imported dma-bufs into the GPU's
> > own pagetables with iommu_map_sgtable(), which needs the struct page
> > of the attachment sg_table, and it fills the GEM object's page array
> > through drm_prime_sg_to_page_array().  With the debug wrapper in
> > place both silently produce garbage (the wrapper zeroes sg->length,
>
> Interesting point, we should probably change that.

So the assessment of what is going wrong looks pretty wrong..  VM_BIND
should never lead to iommu_map_sgtable() (which is never used for gpu
per-process pgtables), for example.. but is used for mapping for
scanout.  And pages are never used for mapping in either path.

However there are a few places where sg->length is used (in iommu code
and msm).. AFAICT dma_buf_wrap_sg_table() zeroing out sg->length is
what the actual problem here is, rather than any use of struct page.

(And yeah, I should get rid of use of drm_prime_sg_to_page_array()..
but that cleanup that I haven't found time for shouldn't be the
problem here.)

BR,
-R
