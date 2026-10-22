Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792646971;
	b=lLw5xy7uOXvlPD7v0oyP3XtMO5CiSgVF53g+ukpC3YyYxyRUcozg1WKdPCi3xvFOgiBQ
	 6WbuzYnrwDd7sBBDn/v8hrCh7Aik2zfGsldOnRxDJYbWRMYAQYPqDo/k2pis+igq5f8ZA
	 Olxlcc6CPmPNIZrhlKrxjg2aVQshyICo6+PNn78vYCi36jMKKh2OP/6zcNBEw9YMjP73O
	 M3VYRAe2TfHU7Zvd/1SDP5x/6X8Cz52K0Rdh9QnbdTGMVqBYcdUhwFAox+/Knbq4vQf1Z
	 7DUsNsBCafW9VROHU5oYVPjAOjJdJysfM39UupRdxgRmr544U27JJokjakIE5ykpmHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646971;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x8nc4lFKIflj0031U24QKhHWYfSWWl9JsVlW+Zb/WiE=;
	b=AyPkz7OlqRCmAq0xeut6yq//0GsQnS8bt15GBq8bff+OPjl5lQShtZkkGeA+0wMPfiEx
	 uMEx0wQtFaNVUttQyuSuY/5r5pg4PKjCelJKCV76Kd+Fw9N8Z1XyEJWawGKNQa4pgntE7
	 fWzU4SU3qi4h6e59DGmk9+o3nifcTD99wuQSfcWgmYJueDK0fcCoUwn1Z7kHGRQdC8aaM
	 zfSNNxkAnfgEWzv1gLSLAQ9chkKOFJdv+5K63k3sHVY6nqeU8vTYyVzFE7HzQ4LDzLuo8
	 Qp++iCo1agmWsk+lyiZujyMc4GpsuDhSxl3+tS8d2m+a+ucdQ5jPgbFOwI2uZm2kwtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NMifBLZB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AQ4yC2s1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E68606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11E68606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NMifBLZB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AQ4yC2s1
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M4wlg33326173
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x8nc4lFKIflj0031U24QKhHWYfSWWl9JsVlW+Zb/WiE=; b=NMifBLZBvyNscsIS
	OlUvMCfKkwPCFkBrMlfc7wd2xwjWS83v9cCeScE1nB6BCWn5HCDwe/Tiw8VDEg4d
	+3sqA44Bv5Hy6mnTkOeUqHsMdcfDTWCBgaxzOzveOc1lqCsE3Ea/7YsLgmTzf46M
	z4ryNy9OOwLujW6rFsRP4E5zITTRbakLd1U6cPhRO14HAk/F/nP+goKmIhTfwXZL
	CNpUHfBbQfJYO0RgUCm8iXkBc5jDVCqftFHYhYgHc3VPVC2wMLNhl2jUK4eM7Anv
	y4pEupXJmpgtUeE+3RG9vHFZs7cMiLTtcevvnw0CXLLIi1SlCGltQREdCvY5UzcZ
	csveKw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93c8rne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:29:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so3410709eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:29:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792646968; cv=none;
        d=google.com; s=arc-20260327;
        b=SbwNn32QldlfrUdZbG9dMoN1wsuSBUuFqTLKY1umwawnHdLiotTkeecniOdplDkjqD
         fR5LhJhFd63D8EuaWSGpmAo1qzYuaaLo2C56RQzH/4ezF0Cd+n4aX02SWPvkKas/juWd
         3ZMpbpLTyyScAvoZpoi94kBURpOcbPNgdBxZ54PyV17fULDwpR8lRxohoh3e70gnnKSG
         iyGUflZOsBcoeVo2qp+6z1mAknowfPyFuGk8umI/oPD8V7R/d/D0STGqOsr4GTBA0AZ6
         /qf+W4BKP7DSZwq07r7tGIf/F6L4BHi7QnBKOVjCpATHhgKsk5R5/3aDfwdeT3CwB3Ir
         mNPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x8nc4lFKIflj0031U24QKhHWYfSWWl9JsVlW+Zb/WiE=;
        fh=UFpiPktkb9lVHAFnv3ar/4eg4ffHyu4qJWwo8CDsSxE=;
        b=k4M063osf8hyaKotkv8Aj++HYrsPeXexOu/uJcI90LY0Co2k84RIq+5x0Xjnmidwwd
         MHyXraGakAmNCITaMlmo+aQ7kcUcaxAWv8PkYxDTKn3H+Qvyo8+p8H1Ye04h8zNHI3kz
         wCVEKxA7neW9lHZCTwm7cSWa02jTWXyxB6psIOlMl/9SPNNlzi8p2VPnNsIVakxhcvjw
         6Eyxuun3/pSRg54MElMHNymUjgLLb1Xw6u4kOSSl8Vlu7HtWaoaH/SHtA7YD4XzSBgNE
         aV3Lbr5A9+asMVzhG0gYwCQflAr0dlxcKCuVOI0v3I97uQt6ukMRvuy+IbgDwX/X6PTU
         gleQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792646968; x=1793251768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x8nc4lFKIflj0031U24QKhHWYfSWWl9JsVlW+Zb/WiE=;
        b=AQ4yC2s108bfpJrkMbPBnfeCuWrSvhwcQTgQd109va9mEopX3uSN4SoQkAAxyHAgOY
         Xrcdehus0Br/84fvcZiwQjqf7ON1qm4PoXD7mF8LLZTXFPsNugratu0Urmme+fYX4+8i
         1fSCx1EG2KIW93W97FSvHtMNr8Wra4xl8I9M6CN66u0PM9cRxLaAngQoFkFbqw0mZhci
         7Mg3fyyt3/MhERsgRGFnvBzAKfA82d7s/iLBJDNlikfcW8eUQIw1teSEHttLy1YVHtJp
         SQif1cSAJOiz8BaHfohAy8+yb43FibaPY/F2EjOFuXhgM8ZeKUgRNQROT5EmwROVqkK7
         RNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646968; x=1793251768;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x8nc4lFKIflj0031U24QKhHWYfSWWl9JsVlW+Zb/WiE=;
        b=k54ZVXIc0jxj7nniwjeXJ8RYoNnsutjmAdxq1RO19NNK0UzT3ZPE+FYfqFPZPX+e3L
         801+elN697TAn9Jm2AkKhbp6rLVzub3frX9MtCjfdp2SdjhIJ+m37gOu6ZH18jpdfTWe
         PPiqLISyDUu9IPoyFlYB5HE8HLF92Nmnbg42qWHFDWQ5tyLTMsHsJZzyY7z7qzWe6WyJ
         7zAMq9oVAG1Q1jaMwkgfGgdcRI+EDMEDVE+/OowdKzsLnlP2QXRcMapBRDieFZ+4clzU
         uMFxoGuetCUWhIGYOelTfSbH7pF0ndbPwIYw1sMft3d+F4Jqa6oPG0IS9nmD+ZsSi9GA
         BeNg==
X-Forwarded-Encrypted: i=1; AKwUvBzhRBuwWTu85RniGX1fa9XRNQKFQJYtc3/Ij4JKmP/0qzVOu5EyPxOojJKs2jHuM3fEE33C6sLoAoG+ECE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhYYCADc5JT8ggXkt6y+hRvo8QS9sMOAyBbGSPOOdSkqX5whUL
	buWpymAR9YoU+3MDIHz6BXh8NqhaMIqWAcRsLlH0vVmoOYXJrBZ1RXqMZrtMAlB6EAVLTZiRYPp
	1bkygnjwNEui7FXYg2VcuCIMu/KMZIwDwjX15nliO9L/6JOTi3HDneMZmGfg4tIHJNmq3H6arS6
	K7VAroGFYszyr1jzRelHIUEjQDxvKZeGRklf6KpnPZuA==
X-Gm-Gg: AYBFou2tGLUALzUQdlFsmueaJfP6f9pbmaNw3fjxHMubpWwT5KRMsVpYBd6nq9rewPy
	CtrLhgNo645XZCreoJFXndyXRW7u8lsb0b28Uwww2bQpbypaTNQJQ4h/9deN4OFXKRJif2YcDOx
	sPXrdjE/yRiL79xFxNPSmez3gl2qm36x43OXs8FQgPe5TbR8isgVib3C8Cs7g=
X-Received: by 2002:a05:7301:7a08:b0:368:a679:7fcf with SMTP id 5a478bee46e88-368a679852cmr1863350eec.25.1792646967840;
        Wed, 21 Oct 2026 22:29:27 -0700 (PDT)
X-Received: by 2002:a05:7301:7a08:b0:368:a679:7fcf with SMTP id
 5a478bee46e88-368a679852cmr1863324eec.25.1792646967328; Wed, 21 Oct 2026
 22:29:27 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001-b4-mmio_load_protect_x0-v1-1-90515d86f201@butz.st>
In-Reply-To: <20261001-b4-mmio_load_protect_x0-v1-1-90515d86f201@butz.st>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:59:15 +0530
X-Gm-Features: AclHuK_iYzosfJ5Dr7--r4SAxXJKbvTYWI4tQYeVRKuVqR1ywsT80cvntNZ8DOA
Message-ID: <CABBgwmtE4ZX+wAs9aRTeUDGkWtyfgpF_Ou-Kb5UoFXE88zdkog@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Don't write MMIO load result to x0
To: Stefan Butz <mail@butz.st>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>,
        Yifei Jiang <jiangyifei@huawei.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAyMSBTYWx0ZWRfX9K9c4x3kM4Ig
 KWBoJI3Gf6lFPzlOeMUvP6qgmXitSEYOJAQ6P3zKvnUpjUW4ldwrSVgMnJuV5lWBozXZXU2WHxh
 Bt5zEZScdRjVPEgKMbkhXQDm7jvuXjk=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad99f38 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=W-_n0kkjAAAA:8 a=OiFHV6dps91ajMyZhnoA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-GUID: 6VLPkL37bAcVFK_zhFUUw-lilRYfvMEo
X-Proofpoint-ORIG-GUID: 6VLPkL37bAcVFK_zhFUUw-lilRYfvMEo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAyMSBTYWx0ZWRfXw7vrsE6Bmn/I
 i6lXIxip5BBVmAZXsAupz2oFCbkScvpmQFwgEAJQ4+o3JEbmH7pBXvP4HqocJaWre+kr0CRpZGE
 gg7fJDizYGV27YUnfwCIY2vS0SZurce7hiMk6P6fTHP2Z6d4Hhenpr0bl3bLeJJrYW/M2RqnSAE
 ex2ao824Y6sbxsK/3oMYcMyosbmWVmqzk68Bb7LssKGmnyzGort4Gmsz/vHi5DgQ9QFiu9miYMW
 BCNoZ34+2OT/ONqExSvK9Z7Ti9o3B0Y6X2BMjJLRjwcQykQ59WR8AjV/iuZJI2w6Xicdi74bcqx
 ZHmzl/vVv89AT+dBUJzKg68UmpiBovfvKXFVPKIBu7jRUrR9utRsO71VjdMVTAwSQqQdNoU7jxj
 zartxbPf1B+XAXMvCdtezcnkjJ+iOVVgusQ9yKYB3hHllA9tIA4UNh+TBJausVVIR4+cFAK/dvF
 OmEILyQ5vDdOQlLm1OQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220021

On Thu, Oct 1, 2026 at 1:05=E2=80=AFPM Stefan Butz <mail@butz.st> wrote:
>
> An MMIO load with rd=3Dx0 writes the result into guest_context.zero,
> which is never cleared, so later emulated reads of x0 return garbage.
>
> Fixes: 9f7013265112 ("RISC-V: KVM: Handle MMIO exits for VCPU")
>
> Signed-off-by: Stefan Butz <mail@butz.st>
> ---
> An MMIO load with rd=3Dx0 writes the result into guest_context.zero,
> which is never cleared, so later emulated reads of x0 return garbage.

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this for Linux-7.4

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_insn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> index adbbb59a0f36..2a8dc2b88ba8 100644
> --- a/arch/riscv/kvm/vcpu_insn.c
> +++ b/arch/riscv/kvm/vcpu_insn.c
> @@ -647,7 +647,7 @@ int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu,=
 struct kvm_run *run)
>         vcpu->arch.mmio_decode.return_handled =3D 1;
>         insn =3D vcpu->arch.mmio_decode.insn;
>
> -       if (run->mmio.is_write)
> +       if (run->mmio.is_write || !((insn >> SH_RD) & MASK_RX))
>                 goto done;
>
>         len =3D vcpu->arch.mmio_decode.len;
>
> ---
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> change-id: 20261001-b4-mmio_load_protect_x0-5f5fc11ea52a
>
> Best regards,
> --
> Stefan Butz <mail@butz.st>
>
>
