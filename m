Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D484A483A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594520; cv=pass; b=XFgQxNsM/YPMmLwuVEsUCIXCdDGiLj91QDF90pvOYlajIYFOAZUFuXo3YBKaKScXDgZZ7yMl2Ko4qpEkEg3D3xCeCniNZOXmm/E2frLKsHP/uhX5W0K1QxI+qpYLshCfzh9wuHCap3R+ldmcrTe64IDPuDRqxv8CUxsDDDt6uGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594520; c=relaxed/simple;
	bh=Ocd9zXXDgFZ+AJQPS0jBNgJx6ox6aU5Dl7QmVCaZbwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dz6Sx0L0h+Af0i5KE6IP1eyjtU4xSy+EPynRLixsQyBupxcPJMh42UoWFNyiJBav23ZmYOvKjrIdtd4K/pEFjNIPZEUkg1keXb6qvQEYvqNdUH8YT5GQUGGiIzw6dfW+ZjMdT6ZHEQiLAgu2YVlmrCvVkf4+JwV+JAt5kvklL1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ce7c9O47; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JToNP96K; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ce7c9O47";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JToNP96K"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBANlG2294784
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=vEol6TW939SVBwS2LYfyS9kRHzntWvKw1rsJmaCbjOQ=; b=ce
	7c9O47R9GFrf2ufQeGLAslfvXpcTqCG+8Hf7/gz0tgFPwUvUitVHwn2oG2jcRdVX
	P1yBiO91/Co8apRbEwazCRUPcXwmK6ohEvpMijxp/dzEg3r2EXLB5MKVYyDiWb16
	0kszagorsBZDn/qVYBsknXcitxsksB2PK5Rj0WCz8n9oNTIM9aIxs/leeOCOnPcK
	clzHlmw0xoyYrXmCKkggJZsN1tBvBu2J6Ye08K5HJ68WzwVJUyjveY/9mOjV6hKb
	NZcxyUsBdrvhYK8fID8WeCx6wZB7I4TBCwZCt/e/mcf+4Ufb7NWS5Fxhyrx2kwBD
	AoRJBJnrPHzdXRETckZg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyhubh9q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:21:53 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-81b5ae9d488so2066018a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:21:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790594513; cv=none;
        d=google.com; s=arc-20260327;
        b=WnCST5LoeVTpACLzpYWgvMvFs2uDdH2/FambV4ZRMzJ58M/OeimyY3HBc7cE1apEYw
         Q2cDwZH6MD7h2/74ur0TY1lFxOohR58/DdnWoGfU1PWX/3948rXeZFaZxOih32K5ei4s
         lPToq2ZJALuOnmZRsCecYKOxGpQkYf42Oqadif8qAJQzt1iQ6/A71gSxjoQwuOZNt6sg
         2pBQlNM/JF2mwQGzkfu4f6tE/Lg8K/HlQdHF+b+BpPKywqRkqjYHCCso+8XNNat/NjJG
         uD2vi8OG4E7hl04eDVGZ2RW4mFCv9qkdk8DMWDW8xR1Wy3wK4LjpGxKQTvNI0yR3c3PN
         DOGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=vEol6TW939SVBwS2LYfyS9kRHzntWvKw1rsJmaCbjOQ=;
        fh=aRHe/hI2tZLKwx+ncroAam5OIOOpwH0XsJDA9av5JWw=;
        b=cCckFwCE9jR20Ffkfk7k3n3+rVWMDLWmvVZ2ZB7znadxhXFDUIbQzx74Nbdqj0dEKw
         MUhh+UBGry8JwQphLFTeeRTAfA8novKJlOYcCSeSoG++9/YczoMl9qTV6bqnOj8m7o/9
         TmrXZTPtMaoyQfuaeeLHla2c5UMRY/lsptFA7xxGQvexvtNUZFDth9+9oj8TQNduV9ny
         MmM2QUKHC2qoRPBeQUOwnJ/6oP1qc+ntjk3FNgx5GZC9I/urRFsOkDF6bJ5SCrd7UDaO
         CwnK+oktLKWuHNOqsY7md/lV7IZqgkTwxjpIb9Hj4Vud7f/ccrzLXCUlvDr/6lnzrysT
         MMFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790594513; x=1791199313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vEol6TW939SVBwS2LYfyS9kRHzntWvKw1rsJmaCbjOQ=;
        b=JToNP96KhFdTw3mOwrNg52zSHijm2vE3xckBuk3H+toWAbyafZU0FnR/EQxDExVSPU
         kksozqz33ok7Hml+wLchCaKk9BiSlIYDnV3max5sAPc02oTXN7EQEjosfUhwwuXt5ggZ
         xXFG4Ewwif23hZao13+WkFK+lvm5sb0ZOzniBCFRe6XJOQ+b4LkXFPDYjjHhwxhUyw6O
         MJStz7vR15Fn8viDI9gKeMF0oeBggmvg3JH2vEToDkz/ClzWyrHwmozt2z6kxCGXGBwc
         IBkIkU0zuiT214pEdj01qHVfUolMZ88g2kEcz0UED33LuiyWLALaSBsziFSRGw0XbPLT
         PuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790594513; x=1791199313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEol6TW939SVBwS2LYfyS9kRHzntWvKw1rsJmaCbjOQ=;
        b=DZx+3At3/D+GzpFUB3Y+24539dpg3F3GX3tvkawEayWfZ+R6aXF2DM1cgBnY95S6Ir
         kUS4ye7QXn8Mx0IVkGgoBtBBy0ZtWhKB56oOyfAg1jE1H525BL6p4tNK4iT5/OyHTCOF
         JeKY3gaUErcYH6RFUCh4MdUMt1D02OUrCY4HE3VDMcB57YVIrkrPTBihI8xJipFS43pu
         n1NHwMv8X24sDm8AluK1psdyKmMQEZr9qqmsnHQWxbLBd+GQj0CzamBSGlAlE2KtbExX
         ZfrzOFoSMqpUqDIm9mjA/SVrTAOEnrhT+rxGRLVI8N8+ldD95kyzdeC6G6h0kGVyaD3X
         3Khw==
X-Forwarded-Encrypted: i=1; AKwUvBxpTInRWPXNOvZCkw725BguVNV38Qt/+UmFph7S+f3wZaZyxFQf5CgfWSXIvfhU+PRb34MoNKOjQ5CKUdA=@vger.kernel.org
X-Gm-Message-State: AFuF++loLsh9d+UQlwp0PnSdAt8tZlJTNUGNbqAWKEF+/2dEcdThN+j8
	9oa7IvSPBCJU5WGbMLMlmHQNCWSW4cVfInEEgVGYL1mXyngRfeSUqsxa/h5O+UsSa0qAOzj7auS
	BwhGvF4j52T6Jo9oRv4gobP4CyDhp01gJatLI7helwTRGpj3H/Ngxl/QcL2dqmrYQFN635QjM9w
	1T1EExFSE3cekNYDz0KMwVHsE/+DgTajaSuWk6Lb9VrZpFJdlnQT7WqEk=
X-Gm-Gg: AYBFou2R+QFbiGdF6WL/fCOWNp0f4RCxs46s8jYGzKtss8ss49xu72HkAgOAsmmdovh
	DQlQlQZ7Xkmnwx+XEHebxZf5rwA9/GaWnz8+IFhSi0+KsViFtHGylP0Un1eWBm/T+9A0zJ691ij
	qV3kxNymqT4rxHx7PNO801jx5s11Ul14hk5KrBe2iZtnEpwDMY7PveY1bV
X-Received: by 2002:a05:6820:859b:10b0:6d7:4142:8b78 with SMTP id 006d021491bc7-6d741428fe0mr3459534eaf.6.1790594512880;
        Mon, 28 Sep 2026 04:21:52 -0700 (PDT)
X-Received: by 2002:a05:6820:859b:10b0:6d7:4142:8b78 with SMTP id
 006d021491bc7-6d741428fe0mr3459516eaf.6.1790594512410; Mon, 28 Sep 2026
 04:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926022026.10539-1-liujianfeng1994@gmail.com>
 <17bf71c6-2442-4eaa-847d-29ef625870bd@amd.com> <CACSVV02WCQwQy9BpUUqziQTtKV7QyJruiM+iTiLE_SEVKtpVNQ@mail.gmail.com>
 <50a9c1f1-6889-4bd5-b4f7-0500d30d3dd9@amd.com>
In-Reply-To: <50a9c1f1-6889-4bd5-b4f7-0500d30d3dd9@amd.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 04:21:41 -0700
X-Gm-Features: AclHuK_NwDQDsbrMuZGC8NlkccTPkeI6CyUHvdugPvoIb7ACoIyYXlrPqpyu7j4
Message-ID: <CACSVV02BPHGeGFo0vs8-Q2JvcvQ_gw_xe4kZj_nuzk8n6sW7kg@mail.gmail.com>
Subject: Re: [PATCH] Revert "dma-buf: Make DMABUF_DEBUG default to y on
 DEBUG_KERNEL kernels"
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Bryan O'Donoghue" <bod.linux@nxsw.ie>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Karl Mehltretter <kmehltretter@gmail.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: BioA1T3hGY-G-gP-F3G_7MsELld6qW87
X-Authority-Analysis: v=2.4 cv=C7F8WgP+ c=1 sm=1 tr=0 ts=6aba4dd1 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=zd2uoN0lAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=jDRU7hdYw16n41J9DU8A:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BioA1T3hGY-G-gP-F3G_7MsELld6qW87
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0NSBTYWx0ZWRfX1uSKAlue5wDN
 bFMxnWN/5Qruq/5flPGzLkf/xyoW50Blrv+sdiCz8GMjQL1VvwsGkBP7f/5Ma4YB7ISR5cbtCO+
 xEtHacihirrOPeYzQJdo02i7ToYJ8xVXDaajLTuCQcrMR5w0I8f0KAZwSjDjFoXgoirPRRcJQJK
 8Fe0q+fwtXXjBqTQg/CYf0rYj8G0bKrTJTQRwNq5/qtP9A5dY3PLTyFloFJ9pKUaAmWhjp0uCoK
 pl+pmihRzwlLvPUEnck0qyu8j5nS4379fhNrM2d/kf8PsHfoBv9XkSbfdkEFeiz6hSGkN8j2hvC
 BYj7mbHnkckihUWCK4VDhHIYJWD1XhvnUQ2dEmK7vioDggKkIhanRgY6k2dYm4XVl4i7PoCpu2m
 hK/YvYv1AyUimfaxFlMd9p7vta2ipwzcF4zat6041MvaP0qmRpusvWACXqTH8x0AENqpuHniOXD
 rIP/+ZH06xq+Prjiahg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0NSBTYWx0ZWRfXxsuzdR/5MVDo
 xHo2syfztle9YWrYFnJriAOP8SXgTlUuBPbC+GKPcwwZtRLxDJe5Ujhrwg3FqwBKhg7EoKc6rKo
 8SfJXUb5kLjjeyT28+9mh4jmtUJGSWg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280045

On Mon, Sep 28, 2026 at 3:48=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 9/28/26 12:36, Rob Clark wrote:
> > On Mon, Sep 28, 2026 at 1:19=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 9/26/26 04:20, Jianfeng Liu wrote:
> >>> That commit fixed a dangling reference in the DMABUF_DEBUG default
> >>> and thereby enabled the option - and with it the page-stripping
> >>> sg_table wrapper that dma_buf_map_attachment() hands to importers -
> >>> on every kernel with DEBUG_KERNEL=3Dy, i.e. virtually every distro
> >>> kernel.
> >>>
> >>> drm/msm is broken by the wrapper.  Both of msm's map paths consume
> >>> sg->length and sg_phys() of the attachment sg_table:
> >>> msm_iommu_pagetable_map() for the per-process GPU pagetables, and
> >>> iommu_map_sg() (via iommu_map_sgtable()) for scanout.  The wrapper
> >>> zeroes sg->length and strips the page pointers, so mappings of
> >>> imported dma-bufs silently map nothing, and userspace observes
> >>> arm-smmu translation faults from UCHE, e.g. during hardware video
> >>> decode (clapper, chromium) on Adreno systems:
> >>>
> >>>   gpu fault: ttbr0=3D000000088a889000 iova=3D000000010741c000 dir=3DR=
EAD
> >>>   type=3DTRANSLATION source=3DUCHE
> >>>
> >>> Bisected on a Snapdragon X1E78100 laptop as v7.3-rc3 good,
> >>> v7.3-rc4 bad, culprit 143755bdabaa9.
> >>>
> >>> Switching msm to sg_dma_address()/sg_dma_len() is not a trivial fix
> >>> either: those fields are only valid for sg_tables that msm has
> >>> dma-mapped itself, which native non-MSM_BO_WC objects' sg_tables
> >>> are not, so the conversion needs more work.  The msm maintainer has
> >>> therefore requested restoring the previous default for v7.3, to be
> >>> revisited once msm no longer consumes struct page and sg->length of
> >>> imported sg_tables.
> >>
> >> Yeah as I said before the problematic part is MSM here. We have enforc=
ed correct driver behavior for over 5 years now when that option is enabled=
.
> >
> > The problem is bigger than MSM here
>
> Well, so far I have only heard about MSM.
>
> But yes I mean the config option is doing exactly what it is supposed to =
do, pointing out when driver need some work to get this fixed.

It served its purpose, to expose some bigger issues.. but sadly those
are beyond just msm and not something that can be fixed quickly

> I also agree that we shouldn't have allowed driver to touch that stuff in=
 the first place and better document how to do things but yeah I can't chan=
ge the past I can only try to fix it now.
>
> >> What we can do is to mark MSM as broken and/or give a warning in MSM w=
hen DMABUF_DEBUG is enabled and you try to import a DMA-buf.
> >
> > sorry, no, we can't mark MSM as broken.. we can mark DMABUF_DEBUG as BR=
OKEN
>
> As I wrote the debug functionality to enforce not using struct pages has =
been around for over 5 years now, it was just not enabled by default.
>
> What I can offer is to set it to default N for another few month to give =
you more time to fix things.

If it is disabled by default in distro kernels, that sounds fine.
I've cleaned up the remaining use of pages in msm (which were not load
bearing, but I should have done before to remove use of
drm_prime_sg_to_page_array()), but the problems extend further and is
a bit complicated because the hw uses SSMU in a way that dma-mapping
doesn't consider very well.

BR,
-R


> Regards,
> Christian.
>
> >
> > BR,
> > -R
> >
> >> But making the check not default to enable on debug kernels is not an =
option. This check here is exactly to point out broken drivers and you can =
manually disable it.
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Link: https://lore.kernel.org/linux-arm-msm/20260923074256.9357-1-liu=
jianfeng1994@gmail.com/
> >>> Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
> >>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> >>> Cc: Karl Mehltretter <kmehltretter@gmail.com>
> >>>
> >>> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> >>> ---
> >>>
> >>>  drivers/dma-buf/Kconfig | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> >>> index e4f078a326a41..7efc0f0d07126 100644
> >>> --- a/drivers/dma-buf/Kconfig
> >>> +++ b/drivers/dma-buf/Kconfig
> >>> @@ -43,7 +43,7 @@ config UDMABUF
> >>>  config DMABUF_DEBUG
> >>>       bool "DMA-BUF debug checks"
> >>>       depends on DMA_SHARED_BUFFER
> >>> -     default y if DEBUG_KERNEL
> >>> +     default y if DEBUG
> >>>       help
> >>>         This option enables additional checks for DMA-BUF importers a=
nd
> >>>         exporters. Specifically it validates that importers do not pe=
ek at the
> >>> ---
> >>> base-commit: 93f51579e7df248780214094418f205253383cc5
> >>> branch: revert-dmabuf-debug-for-7.3
> >>>
> >>
>
