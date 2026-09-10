Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C714434A79D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033734; cv=pass; b=FJzuELMK5HU5Z+rHHw6yDFncUX8VsxeKK9rVeDtFGAtJLWc5sbqRU9Em44QUP3aIjy98Wh5h4fpqqOqfnWK1dOtDUY8YWxKnBGKsQ7GbPTHZ5kH566iA1w7/uNv2wtxU/zLB35+yW0cbjsq5WbAdA7i7fRi8RYe5/qJmy/StDUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033734; c=relaxed/simple;
	bh=P9oAoZ7SecBGhbTjR0WqYokr5JGDD2Bt/xiDHYc/qjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uaz3451E3MXYGQj0nwHhADb+iZQ13rh+824mJYFNSAL1k4k/syENG53h5bpvJxXvfgwEnj9Y0r03lGL3SUfaszPDnjyi9Kw/3nMHAHzYYK76W4OR2QiUlzA5gwL3VdEpcoYMNhTpU+JiM2dBl7jaU66kIYrnz8pVem81x9/FLqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F4KnF94T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OwseXXVR; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F4KnF94T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OwseXXVR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8pkgi1589590
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fe1R8wzIKX66YSLfrokubx/6sXM/pQiZhT04/7N60Yo=; b=F4KnF94ThZPlCPXB
	ELuACDM7vfX4nzSaDQPZ2nwfPYa2kiethzdgojbYncp/GJlM1PpgA8MVhziljHN0
	BMbRolZ5FAeZf0jub24aO0L3T9DtkEcfIEALAv0acWO/t1wPgcEvOs2sWoRn+Aap
	biHeqtD079eamRlmvVsXGYHa8r81KTcGP2nxsCgF4ukpAjn2rsbbARgaSROcSUJK
	LQtnlrO4tNxIrr74DK8xfSTLUlzJcbwUarRsEBHldvcrGARMsOxRqzMQfIJLLWeL
	nxhu+fhvZkFKfTrgJKhnQ7en80JXJF6QQ+mGHAEc0W01WGcqVlzJZWR84QN/6KrO
	PYr4dg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyhb5xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:48:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-395543dc382so3168890a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789033730; cv=none;
        d=google.com; s=arc-20260327;
        b=jX3U7mH8Bu5L4Wbqbwa8+7lAFnGQUPVK5th3FaZwTOxs4AjwAdMNln9BKVNWZxsQif
         66kDkCUdguiHWf+pIiD1rCoaQimL5vMLqjMGEfgGNQWn3EVoo0Tno6wK4RJpo33PAPo8
         6Td6/RGD+lI7mBqn6Hzwr+JvEUMM1L1fP906yOXhRLakhHuejzwIYkobK4iLEg26pWUB
         CAvTbgS/YBxxFtiOL3ciYf4X+33cmvaitmMIJgKb6Io1glXwyUzDz+3Jj2MFCYKeF74V
         6gr982q35DLO3czg9YAuygMri6ikBD3Dj4OCEsxZBGXOHTIq4OkEh/yuVqm+uOvm31ew
         B5pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fe1R8wzIKX66YSLfrokubx/6sXM/pQiZhT04/7N60Yo=;
        fh=//vmh8He9niYyFuVBn07yAs9ymcEcKJVOPEH7LWz49Q=;
        b=X+BtExML+7odqI6eu5sxV1lgD5v4DNzBGgfLua6VTEhXCcj3E4d+ZyhyYNO7YfJyLD
         KVcC6F/bLuZNfAFfq+gQnAUwNa2RKUJUjCArSwekyYJ/T3qs6r/aw7zbLIiGNb8xOvi/
         AOwAwS9TJLd78cj6gm3k4Ba1lukq69vaxXwx/7lmQafn/K8sUEjJT+k+ENGCIxezO0Wr
         6KC7rYtMQIag1gr18PAZbOlEyFnhAH0S6mCUnJYONi9LYZimPHBU3D5aotXUEFQyfpaY
         u28ExVr08kz6w6jPta8XUu++yWJrbke8PbG0bnfiERemtBoymK4fCAuLqn1vUdxmTQsa
         vlNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789033730; x=1789638530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fe1R8wzIKX66YSLfrokubx/6sXM/pQiZhT04/7N60Yo=;
        b=OwseXXVRLXcLF8Q/LPoSjzcEiRysHr0EM17EG8aa4L1CrcOSNiXP6yD2eO+93JtM/V
         Umau0lahU0kxuWa2G9Q0bxTAXotnAC7GAB5KGcpysPKXrEmmJtNy0zKFHWT+1uH3TLYF
         xqlR+uWqLXPEAyyWp5+zv2xsEw9hQvC0sHmy09rod0ZXKL8HjOiEaY1vpiOpETcXm5d0
         dHysh7jXqzQCYAAhBK/jMbQHTOT+AQ5uVQIBtZOT4QdlBsG+SISwyejnEmW7IQQswpyo
         ctymM3jO35TWL7/l9wkNXWOEiaOGAkAaKXZpQK9cN9Lh2L/f20smPNXtjkf5ormpfVlI
         ITig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033730; x=1789638530;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fe1R8wzIKX66YSLfrokubx/6sXM/pQiZhT04/7N60Yo=;
        b=n4sT4fKRUC99CJoOHqpBOUyYsXvQjdPNDYBVsOIR3cnu4lX/6/Jto6SUFv7lde/V06
         JcwwCPpjmR+l2dm0ll2Nno4AY/NhZUCLZK3aarmDwJhy5dT4D4f9HVRh0e1eghi7v4ac
         GDqwI5tnROSya1G7fjUmkpmjS1bj0tReAoAcTmxZuuuJ9bI9M/uE8Q+GJK+Qi7TixoL1
         xueuBb6MyyJhiPNN9rAYl+em5mVx0/bRleHQtpgRwJz3aacA+DJSXm0v+4JPxWGpLwfq
         NVihttdGsiuzIbhHtbQs0M4Cwhc7Io/2BuowoNqkStvWiSzg6391xjF+qyfv3Puwvhy9
         m3Gw==
X-Forwarded-Encrypted: i=1; AKwUvBzHPnUeRHchgE3SHpOkdgCVxBpmvK0WJE+NxrQSQ61j2PrLqzk6F8u16B4xG8xh8R/mThBxEAG6/CHQ+fM=@vger.kernel.org
X-Gm-Message-State: AFuF++nKfVhdZQgHkzVhC9TzOrLp/q/SM9hzQm0/6XVCaAeANHICSBhA
	SqvMNeWO0uk6QDqzOav0LTGJS+MMsInJexmk5XuBtnZFApcbLYslblkfFNNtBUiOWqmvQCc8mO+
	KBHqgr0bU4iCyMQsBFCJ0RT2yBEUoaCNXTIvIAzDCH7dODAVbkrJ0t8wZZZ+az/myWohAwDrwAp
	tI6pndk5q7lsW4x7HxPYJeIsWRs+iEXhWiVtrvI+VmpA==
X-Gm-Gg: AYBFou3/yyxfC1GUxTnYtqvahoQA2q2ivJkzQhRM89selzkiZu/zQGn9Ogr1PzQ4+Rx
	vlrMwvfBm2NmaFZJYRUQmy+ive8lT0iT40D4/ZVoNK7bHH5SbJweBIPv3X6/0Yx8Ye8/nPeC0Wq
	KSuU2tjV7Fdu3bgdVBmPoJ9Ol/+MRKbhfukQxmqsfJsLNSWskv1cGvib0qFA==
X-Received: by 2002:a17:90b:5485:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39d70c2f16emr9938802a91.24.1789033730184;
        Thu, 10 Sep 2026 02:48:50 -0700 (PDT)
X-Received: by 2002:a17:90b:5485:b0:398:9be6:f999 with SMTP id
 98e67ed59e1d1-39d70c2f16emr9938760a91.24.1789033729754; Thu, 10 Sep 2026
 02:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721073612.137259-1-xb@ultrarisc.com> <20260810-imsic-attr-race-v2-1-00ed95ad321e@ultrarisc.com>
In-Reply-To: <20260810-imsic-attr-race-v2-1-00ed95ad321e@ultrarisc.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:18:36 +0530
X-Gm-Features: AcwNN1VtrgITlL2Xz8ROk6p7GYj2cQAUch2tRwnfxZo4Abg2uCG431NY2Z7hSEs
Message-ID: <CABBgwmtrZY_KB+ffy5At3sz4FjOqkePiDwCEsF-pG7ZBJBOxBw@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Serialize IMSIC attributes with vCPU migration
To: xb@ultrarisc.com
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX8E1QfboKiOpD
 rBgnVTAgSsgW3mFSsAT7dcXYfqGR2zknJxb/Q1uCkh1mvccUb/mFz3fDuVrFMtn5yg3TS5ZrEj0
 xUlFTw5tpY/GF76vbIZ8Iwqe9HeWgxzfyzIpiKE0p788wPfLFSQBJs5+nmpTzfFRAsfm5hwQPam
 rzUi982bvaG8O8AGcjEyfh67gacPzQw8Mdj7O7r52rGTgHBUSCtrZamhW5G6YGJCuOjaLRczAdD
 yaE5HGQZ+iXNRZAJrU4I+cyhXaWvx50caJ5zNNjYVfaGkqeYXKjM5vBP3bU2sHciZVl4JxFYEs5
 DWKDx0A4tJa/1hRRo/AOdTa6mskHRy2daxexFrgl4DodVXnu9ijjVzem+4SeQFZ2ghsYHl2cCiN
 XyQa1Qq1+97JFR6hTH9I78hwojpJjCOeaRbCwm3MfvdEXET3TAhRPRwn8/1xTIwn8xBGFOEh9fe
 5Ay7I/EyCzyGNuPDH0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX9K8ohTgX56Vr
 eX/fKEO3f5ILKg+8nHucMOU22QkvMa0iAETHQEgyFTn6nNnUFKJWdNS8hhoyoZnTVoh+dOslNQF
 s9Lxfu1gEYgdpvazAMnDbGGRDMeOZEY=
X-Authority-Analysis: v=2.4 cv=YKgKWhGx c=1 sm=1 tr=0 ts=6aa27d02 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=Lx1EvxgrAAAA:8 a=W-_n0kkjAAAA:8
 a=BwDWKhTLMd55pYuKsv8A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=ZFi1QaP_tuf8dODdgmj-:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-ORIG-GUID: tJKAC4nJGyWR3LqIu_AzakFP6zbhSibi
X-Proofpoint-GUID: tJKAC4nJGyWR3LqIu_AzakFP6zbhSibi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100111

On Mon, Aug 10, 2026 at 6:51=E2=80=AFAM Xie Bo via B4 Relay
<devnull+xb.ultrarisc.com@kernel.org> wrote:
>
> From: Xie Bo <xb@ultrarisc.com>
>
> KVM device ioctls are not serialized against KVM_RUN. As a result,
> kvm_riscv_aia_imsic_rw_attr() can snapshot the physical CPU and HGEI of
> an IMSIC VS-file before a concurrent vCPU migration releases it.
>
> The HGEI can then be allocated to another vCPU before imsic_vsfile_rw()
> uses the stale tuple. A GET or SET attribute may consequently access the
> new owner's interrupt file.
>
> Serialize the entire IMSIC attribute operation with the target vCPU
> mutex. This prevents the VS-file from being migrated and recycled until
> the attribute access completes. Acquire the mutex killably so that the
> device ioctl remains interruptible while waiting for KVM_RUN to finish.
>
> Fixes: db8b7e97d613 ("RISC-V: KVM: Add in-kernel virtualization of AIA IM=
SIC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xie Bo <xb@ultrarisc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch for Linux-7.3-rcX

Thanks,
Anup

> ---
> Changes in v2:
> - Use mutex_lock_killable() and return -EINTR when interrupted.
>
> Link: https://lore.kernel.org/r/20260721073612.137259-1-xb@ultrarisc.com
> ---
>  arch/riscv/kvm/aia_imsic.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
> index d38f5de08..74f520e57 100644
> --- a/arch/riscv/kvm/aia_imsic.c
> +++ b/arch/riscv/kvm/aia_imsic.c
> @@ -969,9 +969,14 @@ int kvm_riscv_aia_imsic_rw_attr(struct kvm *kvm, uns=
igned long type,
>         if (!vcpu)
>                 return -ENODEV;
>
> +       if (mutex_lock_killable(&vcpu->mutex))
> +               return -EINTR;
> +
>         imsic =3D vcpu->arch.aia_context.imsic_state;
> -       if (!imsic)
> -               return -ENODEV;
> +       if (!imsic) {
> +               rc =3D -ENODEV;
> +               goto out_unlock;
> +       }
>         isel =3D KVM_DEV_RISCV_AIA_IMSIC_GET_ISEL(type);
>
>         read_lock_irqsave(&imsic->vsfile_lock, flags);
> @@ -995,6 +1000,8 @@ int kvm_riscv_aia_imsic_rw_attr(struct kvm *kvm, uns=
igned long type,
>                 rc =3D imsic_vsfile_rw(vsfile_hgei, vsfile_cpu, imsic->nr=
_eix,
>                                      isel, write, val);
>
> +out_unlock:
> +       mutex_unlock(&vcpu->mutex);
>         return rc;
>  }
>
>
> ---
> base-commit: b95f03f04d475aa6719d15a636ddf32222d55657
> change-id: 20260810-imsic-attr-race-06772a04450e
>
> Best regards,
> --
> Xie Bo <xb@ultrarisc.com>
>
>
>
