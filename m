Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC8635F5ED
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 18:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790448041; cv=pass; b=WqC8e+kD6gF3rBSquYDDILbSZtNXP6vPzC+Pkb3053BfbICdhTV7BZoEl3zjWPCUD8rTtOeZALFl3LMVV21ca6bBovmkTDOtDHJ936OE/4CE43AQ+fxZwqlIJ6VrFOADBgUDWODuZ3l4K1dRYDLN/swoIeGNaZ5AXLzcIoOipxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790448041; c=relaxed/simple;
	bh=M3nlaT3i7/r69WEHgeWcSxub1p1lj3ONSOirpahJcBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7I8ZwCYHEbbAbKMsXbEVVQcuQdYFdEyODH9HYQZe2asaACw9Csrx3VnSfy4VwQsDvxUXgHKbhEStaTYejGOCCRfSqYwyPlbdKHcpAOUBJsr65TZfQnP/Z0qqbIGiYIH4bS3RsMaQbjz3y7f1DM4W8YNvpBLqGXlYAZN9hT3qXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTVklCbL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0P8pxQj; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTVklCbL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0P8pxQj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QGxQev1329832
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 18:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=YDMsqZuuxwsgxKD8S0rjlnvTctu70wqMTJY40/NHwEE=; b=gT
	VklCbLGlsR8PPgLyl9EewSUX+gASolwObCNZrmi2lje0j7Wsezgk9/3vYoPbR2tr
	WYTvbP4Pvl6AOrTnmwSWuIyEvUAIqGUHC2uBzwAssVg1Tczc21eLWUrhTQEj/LvJ
	ijNtU+D+Q4u2SmHcaAXm7Bpjj6aoM/gf/9fYmqN1X+nRYoPn5NI3JE9tGM7i1dFS
	uv/AcW7t1WXQS5tk5ts0XB/YLBRjGpCaE1+4E1B5bGPSykVyxIiI56FsX6PK4r8O
	zmrOwgFb4vW+A1w60cX8fU5awfqi+S6kKtUuHvEBlWhjfrtCsbZdgtdjYJXgmnwj
	rw4PO3AUGXOg8tTY3X1w==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx50s9mwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 18:40:39 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-44899f99756so3251013fac.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:40:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790448039; cv=none;
        d=google.com; s=arc-20260327;
        b=LC+aByFTLhExbguhEwQ07CWPw4b52ZZ7FhnVptdSkWq65rLMx50Kbg3BfaXnAkfKkx
         l58hsiRyaHCLCBNbfRZEx/PGknIqRj4Rt6xCBxxmKLA6fN6XaMgXsDY8CcxBlvhsR7/o
         frgzXF6pGB4qDGLtiTdo35M7741ErAegnxbZAgOfKEH4nqRuvncgdidvb4jh4nv0QKP0
         dAui3863kDKeiqsDqxCqqRlYLCaMchjBMQTT2Or2jf6KodODeCrn/R0BI/gxaeKw5+hB
         4qktyCN1WJvPxRMc9cDldrpngfskubmh//sPg1XEu98lTQzf9iBzunW56ynXN8JpTGoh
         iCnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=YDMsqZuuxwsgxKD8S0rjlnvTctu70wqMTJY40/NHwEE=;
        fh=owFwYqCCshsjcE74xEBNpWYhfijMsOm5TBDu0WgLz0U=;
        b=dcZxfNPp4nvyspgvhg6El39NExmb5muA4Dx73EO73MYASa9PeRHD4OXtj03eCYE0dN
         3JktdHdDzyGnyzZFPBf7GOIEDYz8ydvaoMFA7yulfChqxOpl9petZy+H9AA7O6j9VNpF
         KcOaXGP8MRIh4DA/p1cs4Rzd8w20j/EdhaWUKe0ASKH+8PiCmQzpm2QxulUiUbSKj/wA
         zdvD9O+1o+0fA1QX8208VPVvwtEDFqYdUerQ72W0pEFAFqW7I26ginACxQ55IKeO149j
         4hQaqHnBqXKhHWVUwyjWrro/Erv9chdOgWzlhQVUz14pWE+MnP3Q+/0dISMUUAQUfBVY
         WA0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790448039; x=1791052839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YDMsqZuuxwsgxKD8S0rjlnvTctu70wqMTJY40/NHwEE=;
        b=Z0P8pxQj07Q0eU89tIDWxmP/hhURy89ZLXGMJluie4qRG925jxODHTDizYhGaX/y5d
         pREXhH4v9+8vYCsz0ME/WosaHjTr9uqljQf1gQrki3nPwNggugfDTz0F6rGUumvX5jl2
         bLLX1efv4uaKNVIFzcuWdyZcBB2uJkuFYuxJyoy6z+22DL6inTnDP9ag3usj7wzOh7Jg
         doi64JY1A+eDcoJ0bCQxgn3TSxvrX/DjV2eb7AxzRq2n/q0xF1iM5kNnzpIV1wLXtfX7
         gRcygto1ptDBiN6zscVFnVNx9QMUqvxfprAwY2CTwoZT5y/IXa3fstQfkbt03KeK8s3K
         JIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790448039; x=1791052839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YDMsqZuuxwsgxKD8S0rjlnvTctu70wqMTJY40/NHwEE=;
        b=QMPGCanDUFXc42XPxZ3VwdtNRt0Z21FcJA4zhJidjkuygcgOUcDAlBGZZ6N8JHcXUd
         1KxxNjXWKd1s+3aq6+Izt+WcPCY0NO9fNvMPiN8g48fc3x1P5qAC7h2T+bpcAV7v/Ntp
         JyG6NbjZYJp2fL2uR8hRPfWv62B2YMCTzGCjOyy+9Sz0RyrNDI2fEB+PA2T8Z4YIdtcn
         9tDQ2TI1dU84pKlSMO59SmEQNvOZmlR5Zdii/tT13Wv5aH6GyCwwxVUp1soltvCwVXsU
         M8iFdiCRPWtLoP+sJ94CZqFsnGrGAzDeFTkLzxKZ9vwqEaoCj2SqRciRn/YEJ1WrJtBg
         byGQ==
X-Forwarded-Encrypted: i=1; AKwUvByNS6bl9UprwkvNhs8R5tLDGywcu8Gna/5sEUGiLxnyd2plmxSZIJpH/rmREEskL3QX4y92gaQAfmxbuBo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKI47+NouwkHWn0aR3vM6GB9S0XpFpsaoDTypQpO8Edl/CdDk/d
	iqgwooCsSKnG5OazTaEFwdXb8NHgRNXhE9+VXv1mBiaa8EBjlN2kNUbTHd610yhGD17YzksYaFZ
	XQSD6cpOB+MDOCgoNUTIfReiZmLcVlOFLQ84y+jlxU+R0EoLAZbYgf6ZBbiHdJp8izNcmyvYQp8
	bOYZ/RCLOr+wk4/TNjD9f0oIo9s9ffqaxjsp/MchnQPg==
X-Gm-Gg: AYBFou2xaYnvQjGO/Ks4uxctX5qCrFy93amjmM8QcyixaSio9nxtEyaUBjkT5UJFVs6
	+Tgr2E41ste99LTZCYeQk7HjwMrFt2S8d5NDJUiEqC+9hEc+1Yzes/RvtyoNu66LFeukxU8/lXI
	1oLAI5Jw8TXvUC7pDU1CWnjgSnBTMMFckZpp6n9NQj4DOsvHUcz3J9aAQP
X-Received: by 2002:a05:6870:658f:b0:490:ccdf:1931 with SMTP id 586e51a60fabf-491e79675e6mr7629109fac.55.1790448038812;
        Sat, 26 Sep 2026 11:40:38 -0700 (PDT)
X-Received: by 2002:a05:6870:658f:b0:490:ccdf:1931 with SMTP id
 586e51a60fabf-491e79675e6mr7629097fac.55.1790448038374; Sat, 26 Sep 2026
 11:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926022026.10539-1-liujianfeng1994@gmail.com>
In-Reply-To: <20260926022026.10539-1-liujianfeng1994@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 11:40:27 -0700
X-Gm-Features: AclHuK8ym8-acg312rqWr-pMv-9ORiLGe39RqXxyk_EMaZQOc4Be3_B5fffQ3PQ
Message-ID: <CACSVV00iE210xVONVT+XpuqmCn6E_RBrtBW2KkAB5YRP5DuZiA@mail.gmail.com>
Subject: Re: [PATCH] Revert "dma-buf: Make DMABUF_DEBUG default to y on
 DEBUG_KERNEL kernels"
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Bryan O'Donoghue" <bod.linux@nxsw.ie>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Karl Mehltretter <kmehltretter@gmail.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA3NCBTYWx0ZWRfX9Zh+N9rWttYM
 jwONH55PngbmI4h3x4ISkAmgY6yMtkZUE7ab+lqiDQxo6QWQTfw9eIH8mNCzDntCA4uJi9Fz7pk
 PXiPh1w0SHdNc1f+KpVp81PmHzQk0G0=
X-Proofpoint-ORIG-GUID: zEW77yxIU_1dlWU8GrWRi9N-vrgCwI7v
X-Authority-Analysis: v=2.4 cv=WuK+otfv c=1 sm=1 tr=0 ts=6ab811a7 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=zd2uoN0lAAAA:8 a=KKAkSRfTAAAA:8 a=tFjpUJO89rSOa1QXy2UA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA3NCBTYWx0ZWRfX3S8Bv4Ey9iPg
 HHps16ISJGwFgBSruNdDlKzx87gRjxcdU0/oGAUpB1/02qvKf3elSnQGYj62M78iaeclyeh9fVS
 9k3iTw6qzKsDOi/H7L/kEYLHQINpDIFUPPo0bwdONyNPdpfdInsepcy3a82z0Uw62OX0aO/u2sI
 VOQRijCEDdy1udJ3XeItWi2+WBlqW+jcx3BwFJNvnMey5c4LDBAQ4mRg3x4d4dxQyRsld2tI+Zs
 ltPAhuCa6STEqeoKOTcJ6qOb83S2UxzeasclHn4ZJ+dloCxffJxJEiuF+xQSaerSeyQxYbN7ICk
 /er8XnTMkSoQ108Q+e5e5/9JPpjd/bEp1ByYn4rfwzI6FZqHtVGfBNNdWHI3t2iS+Cs1Sk4Pmiw
 3D6OIIWQcN6RnZNCGLwaGWpRMGrRZeqNPUHKOdXwjdVdqtLdSY8x7UuonTAl/U1WE+san5bM4bx
 y1u+4/0bfMUg7xBSbqw==
X-Proofpoint-GUID: zEW77yxIU_1dlWU8GrWRi9N-vrgCwI7v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260074

On Fri, Sep 25, 2026 at 7:20=E2=80=AFPM Jianfeng Liu <liujianfeng1994@gmail=
.com> wrote:
>
> This reverts commit 143755bdabaa96776c24f878014608e9cb44f930.
>
> That commit fixed a dangling reference in the DMABUF_DEBUG default
> and thereby enabled the option - and with it the page-stripping
> sg_table wrapper that dma_buf_map_attachment() hands to importers -
> on every kernel with DEBUG_KERNEL=3Dy, i.e. virtually every distro
> kernel.
>
> drm/msm is broken by the wrapper.  Both of msm's map paths consume
> sg->length and sg_phys() of the attachment sg_table:
> msm_iommu_pagetable_map() for the per-process GPU pagetables, and
> iommu_map_sg() (via iommu_map_sgtable()) for scanout.  The wrapper
> zeroes sg->length and strips the page pointers, so mappings of
> imported dma-bufs silently map nothing, and userspace observes
> arm-smmu translation faults from UCHE, e.g. during hardware video
> decode (clapper, chromium) on Adreno systems:
>
>   gpu fault: ttbr0=3D000000088a889000 iova=3D000000010741c000 dir=3DREAD
>   type=3DTRANSLATION source=3DUCHE
>
> Bisected on a Snapdragon X1E78100 laptop as v7.3-rc3 good,
> v7.3-rc4 bad, culprit 143755bdabaa9.
>
> Switching msm to sg_dma_address()/sg_dma_len() is not a trivial fix
> either: those fields are only valid for sg_tables that msm has
> dma-mapped itself, which native non-MSM_BO_WC objects' sg_tables
> are not, so the conversion needs more work.  The msm maintainer has
> therefore requested restoring the previous default for v7.3, to be
> revisited once msm no longer consumes struct page and sg->length of
> imported sg_tables.

I sent a series[1] to remove the remaining (direct) use of pages for
imported dma-bufs, and remove use of drm_prime_sg_to_page_array() (so
one less caller of the deprecated function).

This on its own won't solve the problems with CONFIG_DMABUF_DEBUG.
There is still the indirect dependency on pages when mapping sgt's.  I
won't have time to work on that until after XDC, so it won't be a v7.3
thing, and _probably_ won't be a v7.4 thing at this point.  But
hopefully I can come up with something for v7.5.  Until then, please
apply this revert.

BR,
-R

[1] https://patchwork.freedesktop.org/series/175045/

> Link: https://lore.kernel.org/linux-arm-msm/20260923074256.9357-1-liujian=
feng1994@gmail.com/
> Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Karl Mehltretter <kmehltretter@gmail.com>
>
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---
>
>  drivers/dma-buf/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index e4f078a326a41..7efc0f0d07126 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -43,7 +43,7 @@ config UDMABUF
>  config DMABUF_DEBUG
>         bool "DMA-BUF debug checks"
>         depends on DMA_SHARED_BUFFER
> -       default y if DEBUG_KERNEL
> +       default y if DEBUG
>         help
>           This option enables additional checks for DMA-BUF importers and
>           exporters. Specifically it validates that importers do not peek=
 at the
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> branch: revert-dmabuf-debug-for-7.3
>
> --
> 2.47.3
>
