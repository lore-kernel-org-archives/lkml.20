Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794556858;
	b=YObMqbI7PBhcRGUo6gBW7nKeatJrBobY6G/WLkm3aOTupfkalQeyDuQdR8cdOR4LmQ95
	 TNWZS1w91NhR2WUCjnBsc8QEC8sktUijAaVv6UEw8NR/HfRdfDI6HSbeQiQtuzjImO9he
	 ppy47PipMqStoDJoZ3WeEn9olAAWarYbkZXp1f7iY37+mNtlVC0qN3mDBbXw1WtzaSqqN
	 QQ0z+gKrZabXrW23ig8yTxSDwHOyL4NrnwJPJRcyaWD4w9zm0g5OfoPoe56LDPpPj8CwH
	 G87gteD/Q+waSUEPhR9YnGV+DtvrUt2rlc+wt154y2VFcbyrWCe0izT4e13zfPG0FwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FNM0+Gbs89qhYCIsRWQ2+LM6nKtUULmAfqDYB/OAGfk=;
	b=5ZdQLrCb5rJPZwF7MVcYBg2f7Yi6+ak0NCJ3jGpMurxCyXB8FaXF18vXMAMaXOMWgT7a
	 pm+Zoc59+AtF5UezxYBf9OiI/12XQfiAYL0oabxLvA5KSyAC3PpBTyxsnvA9k3D3vF3dh
	 Ufr366apnpr6WpDcBc+oXPVGFsCtE3RhHtdghQMkpju8jFTmsX8fQ/ofrECBiHrctNgaQ
	 IQZ+tTudZlaIfHV56j7gLA1OmAC7DXgK+clmzo0xMbEX/IrPboxKhlx5zKz1L2K6gpVom
	 5uh0JaxYZDTqqezOXxVlhyhg0l+2q2h3KUHT8UxSdsBVW7kYbjmjSBQgv8eUW9I4iMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kz71YDOC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PmAsxdDi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281F7606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 281F7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kz71YDOC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PmAsxdDi
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD56w1k3556933
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNM0+Gbs89qhYCIsRWQ2+LM6nKtUULmAfqDYB/OAGfk=; b=Kz71YDOCG6MGa4OO
	omCac5hqmQ8LB6GGuYtwxpMC8O5C2E5AgJCvsmrKeQXyNvJIuHbIMTCwUTUmmoPp
	dBpjqftP24hkxQp5YR6oxPSajBE64d6hxGD2nJ8pjqIDtYmzySzzmLdA/iXh/eAH
	/rnXG2CIi57BVkDsZsRCUPtXF8YX1EKQLpiOR3b6oenFbanMvu0T34Ne0/3x+kAm
	r3t3tnr2KZBmoB4pkvQAxHTXAYOePUnU5Q02J5XGJVuf59h4SEOdmlDdiRTJf3EC
	cxFXjaVocK+D0o+mAsCzMcIUxj9/KkcoPadzhdCunDEzqx1pZawYVNoMoplsJR3n
	ukoKzw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdj7ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:00:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36efb506f29so2440164eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:00:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794556856; cv=none;
        d=google.com; s=arc-20260327;
        b=b+2muldi/ehy/BR04hQIbf+0ReqA697mWizqcfYXWyXblDjibLDDsv59h/ILSrR72R
         lX4cWQ6wubnRb5+93zk/6QZ6PA2sgQMZp7UoiVAxBLoqWNr7wVOLFQwEd8sUTlgLaUxM
         NCiTDERWfPZCWw8aHKjd6Wf5RPuYA8mimhyw58Fm6KK0DPPKgBFBnHpQcUPD9obOI1ui
         mA1wCikEu7aabxn7RWY8OLndOi72qd3AXxhBWm1l5FCOZJeOL2UuafDFPwrTHi5cU0U/
         w/+gQBYp5+j0+eYTp2MMmtQSt9rsWVQxHdK8QQ9GATtoRtSTRMlFHGTrHoTmCIaQzZ20
         akZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNM0+Gbs89qhYCIsRWQ2+LM6nKtUULmAfqDYB/OAGfk=;
        fh=u9/mYT110TsmdxeNamqI0IT3VLKWHls5UL5T49BuxYU=;
        b=FGiq9ovm9zx3jqkmBNT/y2G4/dWeA7pK/7AuXs/2fzGMEB6ClXq5wPNmW+UiO5rFvD
         CYUuqo1oO6teAZm4AW2BjxKsaLrIEGl5j9hHK2B737K6rMXE4A7VPWSwBAZqRxWvEL0D
         p8WJxVBwPQPS3goVaDVVk4IvCMk8X0jcEbLo8z5AiZ4VBLRNM+EZx7XvP7ow+Io0Qyud
         cr6OtXrJMD2mS0QLYLBYyiqwT3CaLOd3K74PUw/yMTYHrU5UKKeZC8JFT8rvMDXij0w/
         JGGdfyMmUxmOfY1EBgxW/WOm0DeuBhoorPkf8LvEG9RbnkcG3m+8362lCL1Pw6uQU7JV
         EO3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794556856; x=1795161656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNM0+Gbs89qhYCIsRWQ2+LM6nKtUULmAfqDYB/OAGfk=;
        b=PmAsxdDivcWKEr/vppXhflFQ/pSfWJQQvCDU+wjw6o0boU5YZE8Zzj7+qe84zwNgWD
         4mVrmE2Q/SKUb4Pk03hItackrmri40LEAvzhX7+omGqwoiTLycjoZh+P30ZyLs8CUEty
         QRkFDQ3fE+yEUV71v3ACiQN5wue5Jl/ePhMVfkyJT3kC+l8E7rDLyRjB+HYNkgMUekDs
         uo41ASwa4FhrqjPUGvDah9y8jJDyncASE2TwhFk5OiZv3bdfU78R7TXF5KJvgKFN7pyZ
         6dcZJJnyAXkkUHIzYqJZyLnSgaz7VjMw9kKz7Elamc8+mjgfWN7pkb+q0BdNKLwCZjpS
         Lq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556856; x=1795161656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNM0+Gbs89qhYCIsRWQ2+LM6nKtUULmAfqDYB/OAGfk=;
        b=bGvqeQ+6E8kSpC/4qripjUnmwVIJoAMzJiXau6ypSmIN4UK8mF6CmpToen91cPYJiN
         wPSxc4839QGCggmxvn3nQcCvyHjXpYGgRnd1b9mWqDBpY5uQs9bSpkRXtp7WMHEf30Jk
         Q2AnSKUj7Rw2bYFy37f4OOtKtUTxao9o4kYsQaovLajC+B6GU86NbmYbkpPNvEHZvA5u
         XbsMezXZl2KRwOkJj3Ju4xuoPpxrNZ9l8Qa6U+DyVkqPRLfLS2pGlyU68bPhD5oneK5g
         PKr08eA+hOnFuIY2loNw4e/Bajm/4vy26CanJU07MkzkLvPAuEDQja/UUcfb90RYjKfw
         kC3A==
X-Forwarded-Encrypted: i=1; AL+hErEIGbiMwM7d5e7CUHDH7inLjQ/imBke0frK+KqBHczNfVHI+H8IEDRqh2IVv+1Tf90FMo5KAwX5nCjokzg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zbjHxpaopl+IMSuCnQYPatccAvt611UU5WPvwBHRe5ljJHqzk
	xhdahvC/ees8hILkr1g1H23iBcUsTsl9dGIx6EwITIpuvjNZJOlRzqO/rHWYgwfbLiQYalLut6R
	ci0kw+XC5fEQQNqHcyjpOVoSLxInqnSSf9O6z3p01LBsxEbESFtt/VogEomLlEaA7/+wPIJv7NL
	LAOKafy4nCpX9vIGDkMufZO86ZIN2d/FQiHdbA4ZjEVA==
X-Gm-Gg: AYBFou0ARfiUK98G6h3Hlzu0JhUDbvItLxuKqmSJSa1z6tSMXAWrP1jTYAohF0CZkeK
	f1vrq39xD6E9V3JdYJFu/RaRj4HEhGVCwEM7RncxwuihhVTLLBzPpUgmsyit3nAy+DPKC7da5so
	6yOYxl/mgrJBMxMK5HoGYP5QJVuqEd30ApuBLQ3Aj0tpRJFhjZWyl7Awxk1CU=
X-Received: by 2002:a05:7301:c02:b0:36a:50f4:ed0d with SMTP id 5a478bee46e88-37966766d98mr1454882eec.25.1794556855271;
        Fri, 13 Nov 2026 00:00:55 -0800 (PST)
X-Received: by 2002:a05:7301:c02:b0:36a:50f4:ed0d with SMTP id
 5a478bee46e88-37966766d98mr1454857eec.25.1794556854546; Fri, 13 Nov 2026
 00:00:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023142550.148604-1-oleksii.kurochko@gmail.com>
In-Reply-To: <20261023142550.148604-1-oleksii.kurochko@gmail.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 13:30:42 +0530
X-Gm-Features: AclHuK9I8L1Jkoa68vnSH3mJyt49oobnf7EDpmkY2TDzdHkp1PyujMbXCJ4T8rI
Message-ID: <CABBgwmuBBbyBytwRBTeAqF=0c1m+TFK8E3yPopGNQAsrMFO2vg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Order IMSIC VS-file write before releasing vsfile_lock
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX7xojVtgSWb3O
 uAqCU1mbRtALwYc/qYlfRPZAiWSy3W7BKZbwAc9fVccOR02my/UtPeaDhvTVDlwG1tDJUjXBeWc
 Hgk9aVENJtQhEqxFs6qD97fvkF2Na70=
X-Proofpoint-ORIG-GUID: LpZA75nROixPYwahK9XmwZoMq3F1UZm2
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af6c3b8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8
 a=loDQXBK_udfRwOWNHxcA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfXx5l7uqiBW9ma
 HmGRwXUzgquAz6EfhGybfh/RvtN6n7va70I8Q5VqwzghiOoVWs+2dt+ipcfvLnNICOw6WjI7/zX
 sVtaDotqegjkT7BsSgcgSjAKOQVTKgEB6nmj0FWdm/A2mA6jp1ITs+bppha5gO8EWYbwyuxtYi9
 ocVMpXX+Kx/NWyTiK+3m1vWNz1Z92Z8wkbd/s8mMEBwBW2sjWvN2HjBPUX63tt/0S2lAEXMT6R8
 Of9Y1Nwf87XfGDT895xj712y+SlWRyaA5vszAvvtb1izGljZsbM7bGzTtjgKXx8vHm15FX7bk+0
 OYfftmBHSHRalfwW6hFZMVdPgRwAg34TyDrvI+up8+ZWD01iRfS/WWjWy1IQPT6vq1FNstnIckn
 th5DiigB1tJIZVsHNCQfmfbLScvn9kPVWhYxRRcZQIutkzVPD6CPMDCZ5ofr67Ubk8b71ZFs63U
 5rEfsNM2/x9ynMM4r2w==
X-Proofpoint-GUID: LpZA75nROixPYwahK9XmwZoMq3F1UZm2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130031

On Fri, Oct 23, 2026 at 7:56=E2=80=AFPM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> kvm_riscv_vcpu_aia_imsic_inject() writes the interrupt identity to the
> SETIPNUM register of the vCPU's IMSIC VS-file while holding vsfile_lock
> for reading. The lock keeps the VS-file from being switched under the
> injector: kvm_riscv_vcpu_aia_imsic_update() and
> kvm_riscv_vcpu_aia_imsic_release() take it for writing to move the vCPU
> to a new VS-file or to the SW-file, then read and clear the old VS-file
> and free its HGEI line.
>
> On RISC-V, writel() is followed only by mmiowb_set_pending(). The
> trailing "fence o,w" is deferred to spin_unlock() by the mmiowb()
> tracking, and rwlocks don't take part in that tracking:
> queued_read_unlock() issues just "fence rw,w" before the AMO, which
> doesn't order device output. So the SETIPNUM write can still be in
> flight after another hart has observed vsfile_lock being released. If
> the old VS-file is read and cleared before the write lands, the
> interrupt is lost. If the HGEI line has already been handed out
> again, the interrupt ends up in another vCPU's VS-file.
>
> Add an explicit RISCV_FENCE(o, w) after the write to the VS-file, which
> is what spin_unlock() would issue via mmiowb().
>
> Fixes: db8b7e97d613 ("RISC-V: KVM: Add in-kernel virtualization of AIA IM=
SIC")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Why RISCV_FENCE(o, w) and not mmiowb():
>
> - Since the mmiowb() rework in v5.2 (e.g. commit 60ca1e5a200c
>   ("mmiowb: Hook up mmiowb helpers to spinlocks and generic I/O
>   accessors")), mmiowb() is an implementation detail of the spinlock
>   code. Explicit invocations were removed from drivers by commit
>   fb24ea52f78e ("drivers: Remove explicit invocations of mmiowb()") and
>   from the documentation by commit 915530396c78 ("Documentation: Kill
>   all references to mmiowb()"), so adding a new direct caller would go
>   against that.
>
> - RISCV_FENCE(o, w) states exactly the ordering needed here (device
>   output before the store that releases the lock), which is fine for
>   arch-specific code, and it is the same instruction mmiowb() expands to
>   on RISC-V. wmb() ("fence ow,ow") would also work but is stronger than
>   required.
>
> Scope: this only orders the write before the lock release. Whether a
> write that is already in global memory order is guaranteed to have
> taken effect in the old VS-file before kvm_riscv_vcpu_aia_imsic_update()
> or kvm_riscv_vcpu_aia_imsic_release() reads and clears it is a separate
> question, see https://github.com/riscv/riscv-aia/issues/172. If it
> isn't, these paths will also need to drain the old VS-file, and such a
> drain depends on the ordering added here.
> ---
>  arch/riscv/kvm/aia_imsic.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
> index f17dc559a709..807bb73a129a 100644
> --- a/arch/riscv/kvm/aia_imsic.c
> +++ b/arch/riscv/kvm/aia_imsic.c
> @@ -1056,6 +1056,13 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcp=
u *vcpu,
>
>         if (imsic->vsfile_cpu >=3D 0) {
>                 writel(iid, imsic->vsfile_va + IMSIC_MMIO_SETIPNUM_LE);
> +               /*
> +                * rwlocks don't participate in mmiowb() tracking, so ord=
er
> +                * the write to the VS-file before releasing vsfile_lock,
> +                * i.e. before the vCPU can be moved off this VS-file and
> +                * the VS-file read and cleared.
> +                */
> +               RISCV_FENCE(o, w);

Another fence after every writel() is a big hammer in the path.

If the intention is to have correct contents when VS-file is read then
better place to add a fence is at the start of imsic_vsfile_local_read().

>         } else {
>                 eix =3D &imsic->swfile->eix[iid / BITS_PER_TYPE(u64)];
>                 set_bit(iid & (BITS_PER_TYPE(u64) - 1), eix->eip);
>
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> --
> 2.56.0
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

Regards,
Anup
