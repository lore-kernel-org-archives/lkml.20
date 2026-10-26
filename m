Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793025562;
	b=WRv5Pm/islfPZwHZRbhAChJCZb+mP+X3EFc4ygw1ETyqCnoxKXTdflcrKzopjsafj9Q4
	 4AIS3xUtdHA4WZvZCfQmRn4nxB5CGsxDE1XgKvIgmBPoWoNRhZeFtmtyb3IwOiKJ4NQ5J
	 1HKj1CaS9EDIJOqTyyHyKyBPPAn2/GSqqXvF4FNYO8jaX19MiPnlAuKDbRo+QAVGAo2Vu
	 qcXraaTdkQTO/MxL3FDHkxb7Uo7Oc97ppmUzjLYPHV9GZhd0yT0MmwRFXlnvE3qkpI8Bb
	 6s4gLCmex4L8rEt0NTjh6Rb2ZW87LH+4bW+aLoDvHtV2T1wG5rOvZ8RxOGlRAx4cfOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025562;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cG+5ZJDH6WTFQd7f8Ue0mRhz7/NIdNLfzYpxPElRQvk=;
	b=Z4ME5QhTdBeTg9PqanTqQflVI2K1j4I1sP8QIw9+nrzY8GMTayeIAZl1/rx5VBx/+Zcy
	 6lpYpdn6ZiCKtC/MY6mNsSZEz8uNeuBR1FHBjYZcl6Zm7PA4x7TIexawgFa3zzJ3soMsJ
	 2ozvvsQvHUc1tgiTPORIf57jSoiYO1zedvvFdCBt45FyP0uOG+2IVb4vDYrH0sFkAqx+D
	 kRTGCWwjd/DbQUsIOBURFCHNiI03MPqloJOpJYpUpZSgSIE44ozCkmmr5eYufFlsxvsqv
	 bpCTpCpjJwQOlMPyZXnxzxn6vrK1r/YN94Jy52hRCjuJQbQnRCRsVNTBDf9E7W5CCGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TufGs7rO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HHsgg6+m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B87606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77B87606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TufGs7rO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HHsgg6+m
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QCtZ523349005
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=cG+5ZJDH6WTFQd7f8Ue0mRhz7/NIdNLfzYpxPElRQvk=; b=Tu
	fGs7rOZCp6A1hqyc2qJ5uLRkEggOlKOGyyqM6/4kD9/ZasENiARjpeDx2YoA9IzY
	qAyNvqEaUCs0cZTWD/ztIOS37mpskD3xpy6CsJqZi2HTmE11ZITZN/81SU8OoY0X
	BEUEBffdJErskTqDZV75oSXbjrF1njOX4GPojLLFj1RGbOSpQ8DRpxwU0ynd4IL2
	KkQGJEyXU4q9gbm7COSXQzxVjq4rOwhFNJAq86LCvWS0Fo8AgOhlddMKXz2JEwzK
	Q1PTuBvQFRHsgpN4SafjC02VlFmPIQ3e3S1zxwFh9/bkO9myXP8joEDyhJCCBL4I
	UzMoh/fy01o75ZtD2c5Q==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xrdg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:39:20 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4574f1cac98so3981447fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:39:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793025560; cv=none;
        d=google.com; s=arc-20260327;
        b=FZm+XSSkHz3NmJz6Es2S+4PEgY62/xkx1KRc+cFa4jk5f6kVcyUfsTVJd3P/Qy/9mq
         Uhim9a1UaMElci2X4ZubBfsTgrxX/HMwbWm8TFlLvaJjaY+tihVLNN7MCGG/hfrfgzSF
         wWeNs2GfW7UrEBSLjCkY49dEurHWi1+luCxwt4K4EAEt6zPYKy6XCw4xiZasm8uvS4Et
         WyR5Mr5V6LzDCxSQa/DTJoG+h6TqWWpcdUldTZ+f83KizTgISBlR4Qh5pB0O7WNv8bJZ
         njQsoaF+1hVph2L+RRWMa+cpdrVpNUgWcyP36fR3oIFm6OpbQU/vnIrwGgxmerAE0+KS
         cHwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=cG+5ZJDH6WTFQd7f8Ue0mRhz7/NIdNLfzYpxPElRQvk=;
        fh=eRTA125LRiEKl8ahid6X9vw7kl59BZBhVew0viip/Sg=;
        b=s2n4S1AiniO1GmTDNmHfjr3pIr+tGVI23sVxjLxFm4PPBsscvWU/xpNl+GiJixlJOO
         Bdy8RIvE/g6+kcDsw2AEX84E7pa5Fkl0zrPsnirWnqBHIaKnT5rUrosUE2K3TDy/9g5f
         AIyUE+lLecS5guVPwgb5qh5AMN9GUCS2B7cQqUbTw+KwrgmOKh1kQKKa1akf+2QcN/ml
         WJdp4WKw4sq+2USE0IjFCXhuKoRupLao5d/B1Sv63ULTYQcEuAwHDXAoID9FPpoQadLF
         Hzs5aWul5+jGKmueW9R6vtLnL7W3r5K9WEnAQ750n8OxgkhdFrziOHB+9TyWdblkGQaO
         ucTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793025560; x=1793630360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cG+5ZJDH6WTFQd7f8Ue0mRhz7/NIdNLfzYpxPElRQvk=;
        b=HHsgg6+m85J7EsdN8nHt7o5kZjYfSqOi4PpnlzIk36Bs/pQ5Kg/+sLimLWLweTU6uE
         LYu3muy0jn4Qk4P93TTfy8bVeUhXQLqnZrILrOQ5SzNCbV4EbMtniFloxj1L67W9G9dL
         0WaGkUxoxUs6rFlBPu0tKyS9JDkwR8XeZ0vC9qfRcYxFPQINM/dxbzaXOU3Gm6IpVpCG
         9VeEbJF/4U85EWwC63MrxXSnlPgkXufjgbhUy/RYIHZFTnWEpUhr40umx9URLPRHtOvt
         zRopu3bZt/I62qPpmthQi1yKPZs7uTI5bWDFr0CFKFilpad2we98kxtcWEHxS8vmp2P+
         z7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025560; x=1793630360;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cG+5ZJDH6WTFQd7f8Ue0mRhz7/NIdNLfzYpxPElRQvk=;
        b=HtsrcnlRXapc664O5krj7hENALucBFNjYmVfHRSzqa/VOS73GWVhSx7yRF/qoh6HKy
         Sbr9m4xJUrSwIlNNf/4njzoO14tqgCAYyHH0UDxYd/vcJKkiUP0eQZf0CAdekilKwAMr
         ICHmaIb/6iGJjdv3/OsGNn/a4XHhSiOkoKJJnd/00lnmOLi2FYvEpJmAbNNzA4zs3G0r
         sv57VFFm4tcvSRbGLjOaxV1SHDL4nW9AW9EuUyaQBuZMi01vkYbx3bu7lRpgl3z5yCxE
         Jo076ji6x/REdMh7Cfg7Df9YdJ5/dAhQYC/13l1vhl7SwPVWpwVIdHlsg+Y6RIC3dUR9
         Axmw==
X-Forwarded-Encrypted: i=1; AKwUvByIB/bOvVKOl6sYaswOPf7s0MhbAz3xP/WBAg9LauFvKjdjHZZfY74NfTpDzNJtA9V1dskFpad9Mp5lxzU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3g+GTXWh0CaKzCDkWHDAMpOTJbnHWdq9HnMbqMtPXXg6mQhNV
	lUc7vPXjgJ1pME4FOxkA0n4UyAhW6pP9Hnvk+6ZEh0e95bTb09JzCPQj4D8qbSUy9qfVYIL8hvT
	lo8WhtwQj9ATNbdxPcFLzE4otOI1ajSTjGs6NQyiIO9VnNz8nuHWsZ23qUyXINsUgPyoxp4NdqS
	Kp1aR7+P4kjqPVisPeA/MtwrDdPq6bnsVnPx7ZsApqfw==
X-Gm-Gg: AYBFou1Xko2AHelUU+a6fbDkMezxyeYlDx4E7lIGgicUFSTzoaRvVSvAu2EXpa9naD7
	IqXZNaE/dyIF5+0DpOXM00hrUKppIyNadjB6GV9Z2sUQFUTkHbE/rvCvYFqMQPYz2x7cfGs4t+E
	rciFlRfBEskuGNr8wI75iz64FVhX4hjYjxylnq7YCRm92lJDILQ5WEqhC//A==
X-Received: by 2002:a05:6870:326f:b0:46a:fcd5:256b with SMTP id 586e51a60fabf-4a83f40a990mr4068921fac.10.1793025559619;
        Mon, 26 Oct 2026 07:39:19 -0700 (PDT)
X-Received: by 2002:a05:6870:326f:b0:46a:fcd5:256b with SMTP id
 586e51a60fabf-4a83f40a990mr4068877fac.10.1793025559024; Mon, 26 Oct 2026
 07:39:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-topic-vm_bind_rs-v1-1-6581465f2428@oss.qualcomm.com>
In-Reply-To: <20261026-topic-vm_bind_rs-v1-1-6581465f2428@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 07:39:07 -0700
X-Gm-Features: AclHuK9moS-wK0T0Ay7yI6-qb5zwTR6wsc5zXKwz1o08nyGnkulQq8j7YSMoXE8
Message-ID: <CACSVV01LdgUEAG+xyhWRoWe5Y=N7KztU1p4kQyzeW_KeWWAA1w@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/msm: move VM_BIND op validation to Rust
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Tamir Duberstein <tamird@kernel.org>,
        Alexandre Courbot <acourbot@nvidia.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        rust-for-linux@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 12GjpnlUs8VX0E525qdaPPWOs3ypwzLt
X-Proofpoint-GUID: 12GjpnlUs8VX0E525qdaPPWOs3ypwzLt
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6adf6618 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=SuwJAg6KbAu1AtQxkoUA:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1OCBTYWx0ZWRfX876UQPIslseX
 OfHJbjfp4kVHFqD3j5l0/NPC9G5Whk6peE3MDwDi+7t2OixvPSZvURkXI7r5VmH0ObX6EdGrR+d
 vSOcBm/Nvbeo4XX/GH4GbDPAnGIsLNU7SSrNAvlVWhOUUglmYtg3lNjaZ+BSrwfD3gl2gp13reu
 KiuSvdEnM20m+3g5cLBlkYLfdcNiugxAefvtizMzbB1X8EkRyz46Vn8YIeyecvHjIklW8VwZsKn
 wcbXuh4fT3hHc99fp1PkK06+S5EJs7tO02YARvZLUl21g9hABYKQ9zSK6ac3drNqaLCNvQkH37F
 A94XSzE7j2Ly+gASMDsBAk5ykmLePer7WSCOe8QFoCO++oZIODFmu97kgHjun7T/CYqr6vXAuHJ
 hPEYLdIcBfRdsN3LWeRpfsICZSN+3E9L2dWuIuL8Z9i4cxmh2RjLGPmKOa/1Iwlfi25PANgl37g
 y7UrAX60fwGvhUVI/pA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1OCBTYWx0ZWRfX9ChxKAKe0fzX
 I9H7CksT4W1uBiPAtH2wiXZFruRclX8itcHmpf5uYcZW2QgWpt7SHorUoXKawqCzL1VTowLydtg
 AzJBYdvqGgjjZ72Kb6zKcYk0rk+AECo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260058

On Mon, Oct 26, 2026 at 4:40=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Much of the VM handling code is a headache to read and maintain.
> There's a soup of mixed-signedness/size types which need to be compared
> and added and getting that wrong in C is very easy.
>
> The "(range + obj_offset) > obj->size" check could wrap for a large
> obj_offset, which let an out-of-range map be accepted and then mapped
> as nothing. Oxidize it and use checked_add() to fix that.
>
> This commit is a "get the foot in the door" type change to make sure
> that folks building kernels for Qualcomm SoCs have their Rust setup
> ready. It may/should be extended to the wider mm code once the
> appropriate abstractions are finalized.
>
> Worth noting, the C UERR() macro expands to dev_dbg() and the Rust
> implementation for that currently doesn't support dynamic_debug.
>
> The DRM_BRIDGE dependency is dropped because including RUST exposed
> some spaghetti dependencies ending at DEBUGFS and it's enabled anyway.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> (if this is rejected we may just patch the C code).
>
> Notably, this will regress some ancient configurations:
> -- arch/arm/Kconfig
>     select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7 && !KASAN
>
> Smoke-tested on Glymur
> ---
>  drivers/gpu/drm/msm/Kconfig        |   2 +-
>  drivers/gpu/drm/msm/Makefile       |   1 +
>  drivers/gpu/drm/msm/msm_gem_vma.c  |  66 +++------------
>  drivers/gpu/drm/msm/msm_vm_bind.h  |  16 ++++
>  drivers/gpu/drm/msm/msm_vm_bind.rs | 160 +++++++++++++++++++++++++++++++=
++++++
>  rust/uapi/uapi_helper.h            |   1 +
>  6 files changed, 188 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index ed1c4775d1e9..f5c4749f8e95 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -3,6 +3,7 @@
>  config DRM_MSM
>         tristate "MSM DRM"
>         depends on DRM
> +       depends on RUST
>         depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
>         depends on COMMON_CLK
>         depends on IOMMU_SUPPORT
> @@ -63,7 +64,6 @@ config DRM_MSM_VALIDATE_XML
>  config DRM_MSM_KMS
>         def_bool n
>         depends on DRM_MSM
> -       select DRM_BRIDGE
>         select DRM_BRIDGE_CONNECTOR
>         select DRM_CLIENT_SELECTION
>         select DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 1e246616f83f..826759a820a0 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -129,6 +129,7 @@ msm-y +=3D \
>         msm_ringbuffer.o \
>         msm_submitqueue.o \
>         msm_syncobj.o \
> +       msm_vm_bind.o \
>         msm_gpu_tracepoints.o \
>
>  msm-$(CONFIG_DRM_MSM_KMS) +=3D \
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_=
gem_vma.c
> index f687a629629d..3c453b034e8f 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -14,6 +14,7 @@
>  #include "msm_gpu.h"
>  #include "msm_mmu.h"
>  #include "msm_syncobj.h"
> +#include "msm_vm_bind.h"
>
>  #define vm_dbg(fmt, ...) pr_debug("%s:%d: "fmt"\n", __func__, __LINE__, =
##__VA_ARGS__)
>
> @@ -981,23 +982,12 @@ vm_bind_job_create(struct drm_device *dev, struct d=
rm_file *file, struct drm_gpu
>         return job;
>  }
>
> -static bool invalid_alignment(uint64_t addr)
> -{
> -       /*
> -        * Technically this is about GPU alignment, not CPU alignment.  B=
ut
> -        * I've not seen any qcom SoC where the SMMU does not support the
> -        * CPU's smallest page size.
> -        */
> -       return !PAGE_ALIGNED(addr);
> -}
> -
>  static int
>  lookup_op(struct msm_vm_bind_job *job, const struct drm_msm_vm_bind_op *=
op)
>  {
>         struct drm_device *dev =3D job->vm->drm;
>         struct msm_drm_private *priv =3D dev->dev_private;
>         int i =3D job->nr_ops++;
> -       int ret =3D 0;
>
>         job->ops[i].op =3D op->op;
>         job->ops[i].handle =3D op->handle;
> @@ -1006,48 +996,11 @@ lookup_op(struct msm_vm_bind_job *job, const struc=
t drm_msm_vm_bind_op *op)
>         job->ops[i].range =3D op->range;
>         job->ops[i].flags =3D op->flags;
>
> -       if (op->flags & ~MSM_VM_BIND_OP_FLAGS)
> -               ret =3D UERR(EINVAL, dev, "invalid flags: %x\n", op->flag=
s);
> -
> -       if (invalid_alignment(op->iova))
> -               ret =3D UERR(EINVAL, dev, "invalid address: %016llx\n", o=
p->iova);
> -
> -       if (invalid_alignment(op->obj_offset))
> -               ret =3D UERR(EINVAL, dev, "invalid bo_offset: %016llx\n",=
 op->obj_offset);
> -
> -       if (invalid_alignment(op->range))
> -               ret =3D UERR(EINVAL, dev, "invalid range: %016llx\n", op-=
>range);
> -
> -       if (!drm_gpuvm_range_valid(job->vm, op->iova, op->range))
> -               ret =3D UERR(EINVAL, dev, "invalid range: %016llx, %016ll=
x\n", op->iova, op->range);
> -
> -       /*
> -        * MAP must specify a valid handle.  But the handle MBZ for
> -        * UNMAP or MAP_NULL.
> -        */
> -       if (op->op =3D=3D MSM_VM_BIND_OP_MAP) {
> -               if (!op->handle)
> -                       ret =3D UERR(EINVAL, dev, "invalid handle\n");
> -       } else if (op->handle) {
> -               ret =3D UERR(EINVAL, dev, "handle must be zero\n");
> -       }
> -
> -       switch (op->op) {
> -       case MSM_VM_BIND_OP_MAP:
> -       case MSM_VM_BIND_OP_MAP_NULL:
> -       case MSM_VM_BIND_OP_UNMAP:
> -               break;
> -       default:
> -               ret =3D UERR(EINVAL, dev, "invalid op: %u\n", op->op);
> -               break;
> -       }
> -
> -       if ((op->op =3D=3D MSM_VM_BIND_OP_MAP_NULL) &&
> -           !adreno_smmu_has_prr(priv->gpu)) {
> -               ret =3D UERR(EINVAL, dev, "PRR not supported\n");
> -       }
> -
> -       return ret;
> +       return msm_vm_bind_check_op(dev->dev, op->op, op->handle, op->obj=
_offset,
> +                                   op->iova, op->range, op->flags, PAGE_=
SIZE,
> +                                   drm_gpuvm_range_valid(job->vm, op->io=
va, op->range),
> +                                   op->op =3D=3D MSM_VM_BIND_OP_MAP_NULL=
 &&
> +                                   adreno_smmu_has_prr(priv->gpu));
>  }
>
>  /*
> @@ -1118,11 +1071,10 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *jo=
b, struct drm_msm_vm_bind *args
>                 op->obj =3D obj;
>                 cnt++;
>
> -               if ((op->range + op->obj_offset) > obj->size) {
> -                       ret =3D UERR(EINVAL, dev, "invalid range: %016llx=
 + %016llx > %016zx\n",
> -                                  op->range, op->obj_offset, obj->size);
> +               ret =3D msm_vm_bind_check_bo_range(dev->dev, op->obj_offs=
et, op->range,
> +                                                obj->size);
> +               if (ret)

I think the ioctl surface area is a sensible place to start using
rust.. but seems like this patch could instead be a 1-ish line patch
to use check_add_overflow() here?

Big picture, I'm a bit more interested in the
goto-error-unwind-spagatti-monstors.  Even there, just using more
cleanup.h would be an improvement.

BR,
-R

>                         goto out_unlock;
> -               }
>         }
>
>         *nr_bos =3D cnt;
> diff --git a/drivers/gpu/drm/msm/msm_vm_bind.h b/drivers/gpu/drm/msm/msm_=
vm_bind.h
> new file mode 100644
> index 000000000000..e8aa6adb9181
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/msm_vm_bind.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __MSM_VM_BIND_H__
> +#define __MSM_VM_BIND_H__
> +
> +#include <linux/types.h>
> +
> +struct device;
> +
> +int msm_vm_bind_check_op(struct device *dev, u32 op, u32 handle,
> +                        u64 obj_offset, u64 iova, u64 range, u32 flags,
> +                        u64 page_size, bool range_valid, bool prr_suppor=
ted);
> +int msm_vm_bind_check_bo_range(struct device *dev, u64 obj_offset, u64 r=
ange,
> +                              u64 obj_size);
> +
> +#endif /* __MSM_VM_BIND_H__ */
> diff --git a/drivers/gpu/drm/msm/msm_vm_bind.rs b/drivers/gpu/drm/msm/msm=
_vm_bind.rs
> new file mode 100644
> index 000000000000..164208e0a1b4
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/msm_vm_bind.rs
> @@ -0,0 +1,160 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//! VM_BIND operation validation for the MSM driver.
> +
> +use kernel::{
> +    bindings,
> +    device::Device,
> +    error::code::EINVAL,
> +    prelude::*,
> +    uapi, //
> +};
> +
> +/// Validates a single VM_BIND operation.
> +///
> +/// Returns 0 if the operation is valid. Otherwise logs the reason and r=
eturns
> +/// `-EINVAL`.
> +///
> +/// `page_size` is the granularity that `iova`, `obj_offset` and `range`=
 must be
> +/// aligned to. It is the GPU's alignment rather than the CPU's, but no =
known qcom
> +/// SMMU lacks support for the CPU's smallest page size.
> +/// `range_valid` is the result of `drm_gpuvm_range_valid()` for this op=
eration.
> +/// `prr_supported` is only consulted for `MSM_VM_BIND_OP_MAP_NULL`.
> +///
> +/// # Safety
> +///
> +/// `dev` must point to a live `struct device`.
> +#[no_mangle]
> +pub unsafe extern "C" fn msm_vm_bind_check_op(
> +    dev: *mut bindings::device,
> +    op: u32,
> +    handle: u32,
> +    obj_offset: u64,
> +    iova: u64,
> +    range: u64,
> +    flags: u32,
> +    page_size: u64,
> +    range_valid: bool,
> +    prr_supported: bool,
> +) -> c_int {
> +    // SAFETY: The caller guarantees that `dev` is a live `struct device=
`.
> +    let dev: &Device =3D unsafe { Device::from_raw(dev) };
> +
> +    match check_op(
> +        dev,
> +        op,
> +        handle,
> +        obj_offset,
> +        iova,
> +        range,
> +        flags,
> +        page_size,
> +        range_valid,
> +        prr_supported,
> +    ) {
> +        Ok(()) =3D> 0,
> +        Err(e) =3D> e.to_errno(),
> +    }
> +}
> +
> +fn check_op(
> +    dev: &Device,
> +    op: u32,
> +    handle: u32,
> +    obj_offset: u64,
> +    iova: u64,
> +    range: u64,
> +    flags: u32,
> +    page_size: u64,
> +    range_valid: bool,
> +    prr_supported: bool,
> +) -> Result {
> +    let aligned =3D |addr: u64| page_size.is_power_of_two() && (addr & (=
page_size - 1)) =3D=3D 0;
> +
> +    if flags & !uapi::MSM_VM_BIND_OP_FLAGS !=3D 0 {
> +        dev_dbg!(dev, "invalid flags: {:x}\n", flags);
> +        return Err(EINVAL);
> +    }
> +
> +    if !aligned(iova) {
> +        dev_dbg!(dev, "invalid address: {:016x}\n", iova);
> +        return Err(EINVAL);
> +    }
> +
> +    if !aligned(obj_offset) {
> +        dev_dbg!(dev, "invalid bo_offset: {:016x}\n", obj_offset);
> +        return Err(EINVAL);
> +    }
> +
> +    if !aligned(range) {
> +        dev_dbg!(dev, "invalid range: {:016x}\n", range);
> +        return Err(EINVAL);
> +    }
> +
> +    if !range_valid {
> +        dev_dbg!(dev, "invalid range: {:016x}, {:016x}\n", iova, range);
> +        return Err(EINVAL);
> +    }
> +
> +    // MAP must name a handle; UNMAP and MAP_NULL must not.
> +    match op {
> +        uapi::MSM_VM_BIND_OP_MAP =3D> {
> +            if handle =3D=3D 0 {
> +                dev_dbg!(dev, "invalid handle\n");
> +                return Err(EINVAL);
> +            }
> +        }
> +        uapi::MSM_VM_BIND_OP_UNMAP | uapi::MSM_VM_BIND_OP_MAP_NULL =3D> =
{
> +            if handle !=3D 0 {
> +                dev_dbg!(dev, "handle must be zero\n");
> +                return Err(EINVAL);
> +            }
> +        }
> +        _ =3D> {
> +            dev_dbg!(dev, "invalid op: {}\n", op);
> +            return Err(EINVAL);
> +        }
> +    }
> +
> +    if op =3D=3D uapi::MSM_VM_BIND_OP_MAP_NULL && !prr_supported {
> +        dev_dbg!(dev, "PRR not supported\n");
> +        return Err(EINVAL);
> +    }
> +
> +    Ok(())
> +}
> +
> +/// Checks that `[obj_offset, obj_offset + range)` lies within an object=
 of
> +/// `obj_size` bytes.
> +///
> +/// Returns 0 if it does. Otherwise logs the reason and returns `-EINVAL=
`.
> +///
> +/// # Safety
> +///
> +/// `dev` must point to a live `struct device`.
> +#[no_mangle]
> +pub unsafe extern "C" fn msm_vm_bind_check_bo_range(
> +    dev: *mut bindings::device,
> +    obj_offset: u64,
> +    range: u64,
> +    obj_size: u64,
> +) -> c_int {
> +    // SAFETY: The caller guarantees that `dev` is a live `struct device=
`.
> +    let dev: &Device =3D unsafe { Device::from_raw(dev) };
> +
> +    let fits =3D obj_offset
> +        .checked_add(range)
> +        .is_some_and(|end| end <=3D obj_size);
> +
> +    if fits {
> +        return 0;
> +    }
> +
> +    dev_dbg!(
> +        dev,
> +        "invalid range: {:016x} + {:016x} > {:016x}\n",
> +        range,
> +        obj_offset,
> +        obj_size
> +    );
> +    EINVAL.to_errno()
> +}
> diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
> index 489748ef642c..38741220270a 100644
> --- a/rust/uapi/uapi_helper.h
> +++ b/rust/uapi/uapi_helper.h
> @@ -7,6 +7,7 @@
>   */
>
>  #include <uapi/drm/drm.h>
> +#include <uapi/drm/msm_drm.h>
>  #include <uapi/drm/nova_drm.h>
>  #include <uapi/drm/panthor_drm.h>
>  #include <uapi/linux/android/binder.h>
>
> ---
> base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
> change-id: 20261026-topic-vm_bind_rs-5551b8014396
>
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
