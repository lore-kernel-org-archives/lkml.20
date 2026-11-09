Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794264331;
	b=tbLtZaYkeXVTHWVhA/XzxUWr4uCHCJo1JQ3gK7/nlu7qGy4kGrcLeNmzZnQjAoQXYbzW
	 Tf2ToctroM1lwTymmHBNPehuqimhCZk1VrmshOBUc0jPrsv2DhJs7YDNz4TujkdaSVTlz
	 EZqeCLhtmSOZUK/ZvWe+oIvfMJKK5NlRPVkITjeScY8t9urrOQ6oqSBF9m2TeM4uuIeBx
	 uLwFUAdXkUmeNWDqlBXLkHkdUVhd70G9Tz2Xq+k0/x+pt9WJaPKxLuK4w7vu/hSFXqxq5
	 VsS+DIYykW6FpHMaBE0CgBoqyFEgi4y9+g3hRuN7fLc0Q5mQj7uT1mqucLZCfcsdtUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fazzd23XuqkczbJhKe+9++OyaNsMKZLfRujVe7uBMk4=;
	b=ZGwNa6BDM2wEV5jOMswgoiNp8nKGm2FYQOToq+bMr3y8sr+2RADQ5BgXRaFnj3wHo98l
	 EhvC35bM2jV9Eros/Db+wTr9e2vyQJo98YX4GCSL9m8Rw1V9mKEnEsFgZMRiT03jrQ30v
	 l8d4OZn3iLc4SvPjfswq/HheqsdNjcpmMuPoWtor+jSx3O9xXb3RFJQWxx/mbhtOAMzri
	 UCR5WQCXBmcB8mkEWdkodquDnHoCSQQ3lR5VSAFoNaJ1vIeQo+xKOgtRr6jwxKgal5ENS
	 vyiJYUNwxv0SX3nP7DasvzbKhSq6SNvrsdoWwj8FS3kST3uaWOCHI1+dXV86TU/IoBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NFgfbiwC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+FBRnEz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6D6606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E6D6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NFgfbiwC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+FBRnEz
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LA4hR870321
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 22:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=fazzd23XuqkczbJhKe+9++OyaNsMKZLfRujVe7uBMk4=; b=NF
	gfbiwCqucCQIhNyCQ0Baw1Pni2GDajRidGKROS2z7kjLLu8d4aBOA8atlRRxLxcD
	UrwOSA+aAlrA7Ya9ZCWjha9w7BqQUULyp6l3LylfC6qXRVNYmYW0Yqm4dAh4tGfC
	dRobK82aLzJSD99N+Fo6UekbzDH+aQpNoFR2A6YOptRK78JBI5aNG+NDg2YK9c6w
	YHyjhtnxXoPS3KioKaqX7m6l+xabQ3yUw87Sw3kqzCiFWm0zCkZ0ILspHlpDJNRx
	mlA0eQm+6f5pw36lfb2GIf+s7c3c6LRxZjtnCBwxMIdCyXvYqBsDRLBEhWQ6b3DK
	D9S76qqOgzEMobkxgv0w==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua58b302-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:45:30 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-716e12adef7so1544458eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:45:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794264329; cv=none;
        d=google.com; s=arc-20260327;
        b=f5f+nWOhAIMiQEBvfRbYEeUPBsF2qs3NV5bhLWWgTG4Ke0TtY6hnhaSvEOj7LYIM/q
         wgr1qg7rlQM3acDzjKsNfTYobr823gm/ArjZsfiUqoL5k39lV48cwLwGs6uS6j7NLyoz
         ufOwj5ptX0B1D2w9UY0X1IrnqSJ1Ig6AWxxPK0LG1Xcw8Zk5XNN/cBtNKUBY02TsyToL
         mkZbAmpsey/xiWqYrrrvPsmnvjGMTKBf1EWgCPVA8zSjKC2FMKIovNUC7HWl+VrH80hz
         7fysNC7RSCpT4BCwbGBCONNFRdl4uLExA01Cc2beG5q5HI63Bzw6PXdbDlscNzqyQVWg
         dvIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=fazzd23XuqkczbJhKe+9++OyaNsMKZLfRujVe7uBMk4=;
        fh=bm6Kt46XoBdwNADiUViWqgirVKcX2+V8uUqMovwTLxo=;
        b=pdRoT1DaiC7jq32zlF4F4sLHbYahSUeNy1YDyf+C+j6HV3Eglt++yEZ6XnMv9jBzfG
         3gchbepoF2YjUYHOmdKh8/n5uRikCoRxoIT8RDa7IVf360120A61Zi8cuztcyP7tT6wI
         PFOAbVGg9f9dPxYQZQg0Hp/Gwg/lvgVmDIWgn/i9jaq8XKlvSdv0TMZLZUZGZd0JahSO
         wZyF2T76JZd7nphIwwslQjZ4fEDS7iVTv+VxbecbnuDG5eAoK/LYeOB6r7lBJU/QXp7Q
         aoQSKIb2dq8sGT66bsqHWcUqiQcgyWpx4tAFkv4yAhxQw/+rbfpPlz5oHdIWprFuwipz
         gy7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794264329; x=1794869129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fazzd23XuqkczbJhKe+9++OyaNsMKZLfRujVe7uBMk4=;
        b=A+FBRnEzgZAZQL/QPe1SMYPBpQb6t8mFAt0DUpVVTrio0yGrJxbYL1MJ+OTI3Chus0
         ZSkcB4bRB4Gsqu9JhRyUFnD0G4PBYilK+Gn/zH55mHcl5j7c9Q7kFLaKkYXpO+3QSZSY
         HqlTopoZEdPDTlor1esZrBdagpWKIcaYfBsBtrNgpRl6D3ioW9EiOdvcJn4F7Pg4mSXs
         +S7lMnMypw97xCAeP0wXMq91OWa7446em4rQt9B06N0dSmvYhSwH6+j2hTpK+92IzE+c
         ZpUI66rOIoPpP6KxHZc9I2uCgMn165gRy7oAq5C+6JB0x+7vK22agAdtSa6AkvB3TDTh
         9bpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794264329; x=1794869129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fazzd23XuqkczbJhKe+9++OyaNsMKZLfRujVe7uBMk4=;
        b=MhGcLlSYpw0Tdk9UlfIQXjtv3OVaRumHxcoM8XuSs5PQforvVi49ADpz+RD35KHn8l
         VZgzvG9pVLVCTQcvElcbhif5dzRt4a6aLyT7ZYD0wH+UfDRs6g+q7fzzU86tFQuMJKu3
         e4sQ2wUADCnKIeWLIfk4DZ2u9txyUz1BZY7fl0a5UH0ycXRxVcBpuXLNvsjgkXbhxOLc
         zadLgOkrcfSZ2IKw6EAIXUO13UbCrRH8/0wy06kKheABxSQWYbrQAL45G6UXy5r0kqMZ
         9i5JyB3BuF0kGDxHTO61TsnKydTkgxG9dUAGHchvKOxyTyPgD5tXlEUH6lirSVk/2k7K
         R5tg==
X-Forwarded-Encrypted: i=1; AL+hErH5BP6WO++M5U3J6KJraSYfPlvV4MO25xrJQJfpgc/iRmhvC+N/hRuluWArkZPMo5AIh4hARcfxp0icAlM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0obwg8T6npkHJAvzNl1EAf1ATYtf7ysOGzWsUKimqEJLAQP0b
	ayqZYcam/iOa8QEcWv5YNVD4UKsq1s/Af7Thz9DS7FOsHyh7Qq2Gp3V7Fld3+uU9zdBz1lYknU1
	HNeoDtS/diXA5sHHNGmQCIn6YptWEB9/kBClhL95A2NcOZiAYdLxY4nUZrLt4WccbcwtcdRdrMv
	e1Xe5CXt/JR7r5q5IL13XtA/ZB+zPjGil8sfzGUhKPhnBL8cFkvbJp
X-Gm-Gg: AYBFou1ApWYFBJZ0u72MQGJJq+7/gEZ/BHBjWPDnEJlHLNKZtgvjbJbSlM81jPvAhP4
	dkMdj00z1b+JjaKXXa5L+vE8EXi+xuWPhU+Ry9250EbE0z3IylOJL/CRq6ddggv0k9YZFqvr71F
	8joOEyw6GbJE/HXqn1AIlrgEE0qrsM05/pPANBGrj9XdEFoQJPCajiCdh6gn5dJcBsOvIjUM0FI
	R4Gv1D1rQf+od7yuYENLA==
X-Received: by 2002:a05:6820:807:b0:70b:8cd5:8925 with SMTP id 006d021491bc7-7189943f411mr493682eaf.12.1794264329480;
        Mon, 09 Nov 2026 14:45:29 -0800 (PST)
X-Received: by 2002:a05:6820:807:b0:70b:8cd5:8925 with SMTP id
 006d021491bc7-7189943f411mr493668eaf.12.1794264328974; Mon, 09 Nov 2026
 14:45:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-msm-va-align-v1-1-2e9b576d2e4e@gmail.com>
In-Reply-To: <20261109-msm-va-align-v1-1-2e9b576d2e4e@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:45:18 -0800
X-Gm-Features: AclHuK_svB21z8Zydd-btaDPqYjJTLzzkRcg1ZIp2xV-hHnPyAoFyw35lJK_YnE
Message-ID: <CACSVV00paci9M7mkvNoqTjTupBCE6=Sw5VxrDca0n1NdSXLfNA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: align kernel-managed GPU VAs to 64 KiB
To: gauravsuman007@gmail.com
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA5MCBTYWx0ZWRfX98Bg3d7iMpn3
 V2GhqYpJmGnOnjf2VOEpmjMPd6/sO65FMJVyMm3E2hHC1p3UWekfz7OZoFAOZgUSIOrBVANrfyh
 QDDQWXd60pUOh8zkOOxoZU+sRtdO2HHd0w7jO8Dy7RemV8oweUfHwr9hYGfxhvUGr6dIQHyLy4Y
 pL35i/suU+dvF3fGL2ua3eLRziHJYRj7SB0eUP0AOWIqd6QOlJa7p9U2boOaIL1+HHjvAbKWF6m
 Cklg7nLeeCW8xpHAARFj12kyvgkH7cenXZpl01HmQctN9aDNqBnowSAgUKu5ofRTzUGpj5fjRvt
 cw3YHMhzUPmMSZ5Bvp8FQHjW8jfNMItIO1oS/xMpe8XKXRdPd4hCFt/2vvOKehOMd7UmBaF621x
 3ofWJuT+C/0PTxqW4nuwcNuwvoJS+p6BQmffm4+8oFZuOSNqKJZ3/AyibhElvc0//kslGSO7lgM
 q75RUV59UNHAePiu9DQ==
X-Proofpoint-ORIG-GUID: 4FoPTHCx_53Xg58YRjCC5iVqwo68U3mH
X-Proofpoint-GUID: 4FoPTHCx_53Xg58YRjCC5iVqwo68U3mH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA5MCBTYWx0ZWRfXznI86b4Pesqb
 EU6wEWXfrTCAajj5GYYitCRZmTLDL8Vocm0KUXiNRSnpSpujCcKKldlj6BvCVXmRsXThwcaY3mK
 fwHYtYq7aWNYpsCwvblcxl8djkvyrZY=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af24d0a cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=e5mUnYsNAAAA:8 a=ZpVaWaFtAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=5wWQRGSUZCY4pMmLUQ0A:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=Vxmtnl_E_bksehYqCbjh:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090090

On Mon, Nov 9, 2026 at 2:34=E2=80=AFPM Gaurav Suman via B4 Relay
<devnull+gauravsuman007.gmail.com@kernel.org> wrote:
>
> From: Gaurav Suman <gauravsuman007@gmail.com>
>
> On an Adreno 640 (SM8150, LG G8x) GNOME Shell triggers SMMU
> translation faults with source=3DCCU, about ten per login, when
> freedreno uses GMEM (binning) rendering. FD_MESA_DEBUG=3Dnogmem or
> =3Dinorder hides them.
>
> A stall-on-fault capture decoded with crashdec shows the faulting
> address at an exact 64 KiB boundary (FAR 0x110690000) while the pass
> drew to MRT0 at 0x110695000 and depth at 0x11069f000, all in that
> 64 KiB block. The block start belonged to the unmapped tail of
> another buffer that was not part of the running submit. A ring
> buffer of pagetable operations confirmed this for every fault: the
> CCU reads the 64 KiB-aligned start of the block holding a bound
> render target, and msm packs kernel-managed VAs at 4 KiB, so that
> address often belongs to a different, unmapped buffer. Batch
> reordering makes this common, which is why inorder hides it.
>
> Align kernel-managed VAs to 64 KiB, falling back to page alignment
> when the range is too tight (a6xx_gmu_init() fails with -ENOSPC
> otherwise).
>
> Tested on the LG G8x with Mesa unchanged and GMEM enabled: in an A/B
> run in one boot, 4 KiB alignment gave 10 and 10 faults per login, 64
> KiB alignment 0, 0, 0 and 0. No faults in three further logins, a
> GMEM stress test or the full device test suite; glmark2 is unchanged
> within noise. Userspace-managed VMs (VM_BIND) are not changed; Mesa
> may want the same alignment there.

This seems like it is papering over a userspace bug..

Could you file a bug on mesa gitlab[1] and attach a GPU devcoredump[2]
after an SMMU fault?

BR,
-R

[1] https://gitlab.freedesktop.org/mesa/mesa/-/work_items
[2] https://docs.mesa3d.org/drivers/freedreno.html#gpu-devcoredump

> This was investigated, written and tested with the help of an AI
> coding assistant (Claude Opus 5.5, Anthropic); I reviewed the change
> and the test results.
>
> Signed-off-by: Gaurav Suman <gauravsuman007@gmail.com>
> ---
> Tested on LG G8x ThinQ (SM8150).
> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_=
gem_vma.c
> index f687a629629d348b54ebb379d3a2fa956b8e472e..2af43291289945d54326287af=
feffa7e72645880 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -388,9 +388,20 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_=
gem_object *obj,
>         if (vm->managed) {
>                 BUG_ON(offset !=3D 0);
>                 BUG_ON(!obj);  /* NULL mappings not valid for kernel mana=
ged VM */
> +               /*
> +                * On a6xx (seen on A640) the CCU can read the 64 KiB-ali=
gned
> +                * start of the block that holds a bound render target. A=
lign
> +                * kernel-managed VAs to 64 KiB so that block start lies =
inside
> +                * the buffer itself; callers with a tight fixed window, =
such as
> +                * the GMU, fall back to page alignment.
> +                */
>                 ret =3D drm_mm_insert_node_in_range(&vm->mm, &vma->node,
> -                                               obj->size, PAGE_SIZE, 0,
> +                                               obj->size, SZ_64K, 0,
>                                                 range_start, range_end, 0=
);
> +               if (ret =3D=3D -ENOSPC)
> +                       ret =3D drm_mm_insert_node_in_range(&vm->mm, &vma=
->node,
> +                                                         obj->size, PAGE=
_SIZE, 0,
> +                                                         range_start, ra=
nge_end, 0);
>
>                 if (ret)
>                         goto err_free_vma;
>
> ---
> base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
> change-id: 20261109-msm-va-align-072b585038aa
>
> Best regards,
> --
> Gaurav Suman <gauravsuman007@gmail.com>
>
>
