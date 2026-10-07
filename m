Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8033B42C3
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791386007; cv=pass; b=Fq6pECPmx8SS38eYBr/bvYSf9cB7cgvJdh04kuw6tZX+5KjJ6tHf7KQK+VyCpPNKDp4Dg0CmQZT3uPuvpu1vV2bWzrr6CjrESv0pj/63HzYtdbraA7V2qplVJTQVpY0i+g/nNVFYE2yZ7Vi2aAhxfdfYLmKwQ9ANnJmeMoPBLGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791386007; c=relaxed/simple;
	bh=5Y3mvlPgWnVhVrSmLRzbDGbZ/FvqqdhHvWuSdDemWX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oGs0maMwNIwq31WieevytWOL5Qa7nz06nsJMEzxctfDyadGI6lJCw+Flinixlr2OH2E8ZBuhlzlYX0JszKCAo9gBYVklaaNGQywO1vlYmuG6MI6L4ayBqEfGtdzFNnQd4SkIxZEjrxDYEbaz1AM6RDrwweO9u3VZOjpGuHpQymc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kSi98iNB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KQLym1uX; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kSi98iNB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KQLym1uX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EtZe0436161
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 15:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=5Y3mvlPgWnVhVrSmLRzbDGbZ/FvqqdhHvWuSdDemWX0=; b=kS
	i98iNBmpK6Komj36szarrvC6suf5CZ6Kh4dWhgWXLkJV0G2t+T6qpoKtysNp++3W
	WwU7aaKSyy23XxzoNCgSgrGfSY3JI7mO6jnnDNdRuTzRzpRvDmLOz8Bqu/LIzyOW
	4ez2LJUjPNvThA0bBhKHXuD0azIyDa82lU7GgthU8JLqda60ozoc85hwHRUxhIjx
	/+xThhJglZUlX8gBMTrSxMujIzO3HX959eQ3Urfx/gxgTiL4y+Q+v8Eg4XBjygQA
	53rpeVrMxoxRXi6I6n6JDOzNvQ7jXUecS3YL8fm/BC7fGrhsspy+14LGX5Hm4kRE
	aL59suyZS6LmvK9RavVA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c60as20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 15:13:21 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-81b50ab16edso4948128a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:13:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791386001; cv=none;
        d=google.com; s=arc-20260327;
        b=kmzpPl3EgMibgr4obJKIXJlfsdKeCHSYt2Gqb5TacfaSkZP5TT1F/L0RKe3Att0JfO
         UTbTWK1sKsy79K6KvYe3DZ891UXUQ/Ou0usmAzeM8rb7w2vlaCARdtTNPryLXWb2CEjH
         ZdASIvc/8fLZzn1neAiIEOBv7N5wv/gUzMpeLC95uCvsviyKP/vJyCGPFFlohqoN12eJ
         +Nv6msY4lda1IjeLZE6bqgkKKmPGeHacHvfCxKZ8rWvOA7+/Mwatw9wjYMdcAvAXuHN2
         U/eSpLwxVsVW6hKct5qHWiPAU5T+yzrgo8g5DQLV92q+w3e59eDYOFa7ESdQzHjKAKr7
         08ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=5Y3mvlPgWnVhVrSmLRzbDGbZ/FvqqdhHvWuSdDemWX0=;
        fh=Ooq+diFnpRUUaUJRHpLWy/NIV3YlxwRPzdCfFCw8tho=;
        b=qCsHDRSOgFKCXW/jdr4fdyWKhumW0F6CbdZ9zkbO5Y0uAXwrP5m4wFTHcdRcq2wiwV
         pGI2Be48Z00W48U1HIIULYB841gDInyoxc5Aw7Zj78c7/CtTBIJK+A3Kez/rkIClsQjD
         Y2TRW4tuF2QJOLG57/cbpgZ4dMHb5vXyMYba8e4a6+n6sfx9d6gSI8zxA2GhdICuDkLF
         VCVRL5KzpeLaEA9ideJQWyJUH80bGD7JcjbfOAWDoZ4+yxlPGubMf0QxfcJTDZUA34Hg
         O1LYNsS1OvTKw2W2WrXCXj2aWIa6ysq8tj1UNVhk41ouEyNvq/uSeLgtR/rKCUlfJFR4
         y7Sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791386001; x=1791990801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5Y3mvlPgWnVhVrSmLRzbDGbZ/FvqqdhHvWuSdDemWX0=;
        b=KQLym1uXMCc7C9/BGgHDM9YawD5tHKF4xOd7n9+ekI8yFMFOuk/E73KjzumE0VAyJY
         EzQNYlwkwhrIF2wANODzH1TLpWthztHTtLLNSbfLRGqFmKI7O+WQCYePSt+rRynQpLFC
         w5FwPtlv8x6ZimO47enHPsfv3N8T2WnqUX2VQn6WBTvJH07sEMKbmiPsgaoFExJhlxuv
         SSXJxD+KFv89LC4UyOhNvziAfjbFUlmtIDhp/+ZrcPi7TvX6+AyoLwLqAgsjUBBoAseV
         Pt0LpEV1ZYuJGP7qZXm0IcE5Bi4L8kQaMHef34GonNjut6heY1N5dkLDRfKOBSZKpHPN
         hkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791386001; x=1791990801;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Y3mvlPgWnVhVrSmLRzbDGbZ/FvqqdhHvWuSdDemWX0=;
        b=d0gaW+Ja9dYqWxir4EkdrqI0v+hwXIfH6Dg+9BBK7RR49htOz0kIMj9Rfckc/03Mxo
         82V/Fobo7M8xKLemMcwaq69vy8U1UnNiU/B2JD2ZqnwkmaSXvGdWzL+k68nwS4uU7IVM
         Q3pO1rLilTcVchOCivHTki3m++9RS7Mh3PV5Zxpp8nOwFh2PIEBKok2dgulgc/SwxFln
         y7OkEJ/tAr4KAZC/jyqN8SDavzKOMGF7Qw8rpAR6XPZ9qdmCoAgXM7Osm0XSAGh51Phf
         kf72PARmObbm6NGg4im1MyZfqFbGg0a7l43xWXmlQ7+88dEB/0jKK68djAc1EvPz+Ns9
         ZFvA==
X-Forwarded-Encrypted: i=1; AKwUvBxslpsNidriGMY5H5XlER8RYZwKueHi8m9LFzpUcOZKo+OF0aJPF2U+iM5yoq1zH1y+ulc0R3dNNHJHuJA=@vger.kernel.org
X-Gm-Message-State: AFuF++m4AEHncbqR2+94nQWk94mqyoNk9WgKfXFxNVVWoHSq/6mazxlu
	GZT4fdL915HoGrS5O8JMJyb/XRhXhOYaQUm1xK8SJN2DxrR5IrvN1dxeotL4ZEKQRVD1CW1TK8l
	BWGRfW25d5hRHGAH4cHWyyF/eUZrYbPGgVVJZaqWujFDUJMNv76DfKN7jf0ufwyoCmZPEqiqF8A
	3uh9x8AYxqj3fbSZhFJu4zt98a2EbVzxwCPuOKZJt6iw==
X-Gm-Gg: AYBFou3JeUVonIqtc4UDBbXO39/pERyQIGup/so16PFB5L5JWP4SFoGUCGlwr104Ebd
	9QqD2LWUhnLLIR/7W5MN8WwQF65WsvVuG6KiFQg6tSHNyfE1AYc3b8gPVRWAYS6wfhEdYzrpdgC
	DW9tCX0BcFx4yMRl40+E08hRaM4LjKzRURKAfLofqHl3OMip6rwSUe5/d7
X-Received: by 2002:a05:6820:200a:b0:6b3:61fa:102 with SMTP id 006d021491bc7-6e7a8ce1653mr2316132eaf.34.1791386000845;
        Wed, 07 Oct 2026 08:13:20 -0700 (PDT)
X-Received: by 2002:a05:6820:200a:b0:6b3:61fa:102 with SMTP id
 006d021491bc7-6e7a8ce1653mr2316108eaf.34.1791386000412; Wed, 07 Oct 2026
 08:13:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
 <20261006131000.81501-4-robin.clark@oss.qualcomm.com> <20261006131920.6870D1F000FF@smtp.kernel.org>
 <20261007051924.39963-1-kmehltretter@gmail.com>
In-Reply-To: <20261007051924.39963-1-kmehltretter@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 08:13:09 -0700
X-Gm-Features: AclHuK-DPg5smaCdEYcgCX8G5Ae8CeG9zJ66mUOBvXkaQs85IPOEuKUidxy3v_Q
Message-ID: <CACSVV00nzPAOEe2yTrt1n7_fpQTLmdxnP34Mm3ovG7rKZsnbTQ@mail.gmail.com>
Subject: Re: [RFT 3/5] drm/msm: Extract out map/unmap helpers
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, sashiko-bot@kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: HYP-GawWFX06w1nSWWSvfve5meJUsWaC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2MCBTYWx0ZWRfX0RZEGX7UbJFy
 vi5uMM9GSiJDxXjdgyOy/eCmDfABrwIk22frZFGgNzLjHIE4GapwRlfIjF9jAhqWFhIQKBtoinQ
 YoYpEaA5WeGpki4e43jUFfx7TPWgudc=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac66191 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8 a=z0c7nXvavwv_fPd8bKcA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: HYP-GawWFX06w1nSWWSvfve5meJUsWaC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2MCBTYWx0ZWRfX6vEGBSFwwIvd
 f9LlOmpXIM3gUKiGMSwU7RQYpeoO/SWNd938CoX4eQ1qqcRp+x7KFUNNw8jFj2Rq3xRc4R87fwT
 mWLC+P69oOYE46Rx1iTLm3UwzIfHWAATlTqJXN0p0IXWUpcIrKHws1UQxii/uJD53n185Zwxjg7
 sTetsBNRdMeQ45AiCB52ZX8n92QMfo4kshJfahvT12zjPUrrxuDHun1Rxl6O75pld+vth679cKL
 I+hJ1dF10istC7w9/fh/y5k6HFjYSnOiWuCv1G/gVNUxDY9xWEcQW11TYlOZvHmM2JA11HZm28x
 uqK3p7IHDgQ4MZmzAC38nPI6WLQGJ60mw3V/A8j7MwrV3IkdQyB7aEuBfjN072QKL7CdNr5BOof
 VFANFirMTz79cfeIjMNQVVdqDR2/8k13w+ZqClPUtyW3M46Wc/3KZAIsimafnYWYJiITk/Fm5kZ
 MmaMa7Wqn/lra8MhWLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070060

On Tue, Oct 6, 2026 at 10:19=E2=80=AFPM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> > Does this error path miss an IOTLB flush?
>
> Yes. msm_iommu_pagetable_unmap() called iommu_flush_iotlb_all() after
> rollback. __do_map() now calls __do_unmap() directly and loses that
> flush.
>
> An arm64 QEMU/SMMUv3 test:
>
> - mapped one 4 KiB page,
> - hit -EEXIST on the second page, and
> - verified that rollback removed the first PTE.
>
> No stale translation was observed because the device had not accessed
> the mapping. This tested the low-level IOMMU sequence, not the MSM driver
> or Qualcomm hardware.
>
> Restoring iommu_flush_iotlb_all() on this error path preserves the old
> behavior.

I have a fixup, but haven't sent a v2 yet.. current series is still
enough to verify whether there is more work needed on older
pre-arm-smmu hw or not

BR,
-R
