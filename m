Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C58F242D84
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540461; cv=pass; b=hpwlDpLEcyq5yUvx4q9R68m0GbpFVKgiWtiZ0LLKcEiSrQG/aWPMPZtk2k8WHNyfvrFognUPzh1C08Hs03HGq9mb1dP+XUtsVcgEereUz1wAJd3jt6ZLabXBi80lNZfbjA78kFxA6dKEE2nn9cuBJqYgEdDUgu5+UkY3ChlY+T4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540461; c=relaxed/simple;
	bh=GkWN5edVJbSqZ/Lu7tScH+pETGbwVkwJGGt+4owIDBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ty6qeGWHFYRmhfNB/gJjlL2vR1HwHEkUsEqrwqsc5PYGL7PyZM4npN8wQaXDIqh2L9SIv89pSOeUYXZdskUUXBU8tITbOslh5vmRNQn9UJKfmcWMqZG2p14Hr5VdQQCvV1MT8S86i3fn1DTZwdblJvaeyQemW68MxVCrhxfYHKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=gR/5hSI2; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="gR/5hSI2"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso4692849f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:07:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791540459; cv=none;
        d=google.com; s=arc-20260327;
        b=H0sQqCElUe9SsM3orxTRvX/Y8BuQcKL5nrkF6Ol53Uw53EWy9wKJoN+Oja9NMD0idw
         u4uDiQHUEalKl+6ldp2/P0btO6UzdThdRPum2D+u4xiohFcUNkXrHkjCxsR1eUwIo642
         Wqbb/XTziNlGnEbLbTAE3cppTb4zVJJFIrbdj0K8QRXfXqYt+fkjo0snCA0ePuZQPpkr
         84nOCjOejvMkTAx8qRM/FYK+4AgsBOMPfdzMpgCrt22l6Wyv7DKaStnWCyoclTDF/3Mj
         otEG4ZDgsfSJzEZM3dlH7ISIAs0iZGi+HeKiqJlK9yKi0A3nKYZhydL1YqPQ6DlovsFo
         ScaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YhlTmiSSnyAhAbjv/VolTrl3XZ08TdurV9y8UvnnMXY=;
        fh=s5PZHTQFjMcvhw22aDg6uqY98TZSNSZ1g6xKkiA8Ang=;
        b=CYrB4Wchx0BSPkd+yzv06jHk8cb4tQ1pPvnqBlXy96z9Otpuaw10/34Jqjbx9IrvCB
         rjknx8Ty7ZdurMNFkP4pTd8XNEo9PWEvJ9tbvrxsykWx+YTN0VlInXf1KptVRrzoxPck
         X6WgWwwWEoL+umMkj30n6Lu9UsWP7P1NGj9NX7CTfXRUnbxCeaOuCFWTTndo/HERUN55
         BRavXpIhzEzlOkWbk5d+lJsf+htISD5MawFJjUU/cx/eUASTZoy1OC/gjizU/pLKhuuA
         zVoTeJ4mEsA85nXxGX0kJxMgLRTxKOaW4FeJmvKxyPmaXFqSMdQF56EKY8ry7WvgrvJ4
         Tk2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791540459; x=1792145259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YhlTmiSSnyAhAbjv/VolTrl3XZ08TdurV9y8UvnnMXY=;
        b=gR/5hSI2Yeusppe/jk1I2k41WyZpPYsJp9XMOYQC2zVFAdTu6CKhJep31XoaXX4oTD
         7GJVek8p6rDxlQRWLGGmi+NrmSahlHWnm9VqT7SHUzAcn41GTBRQd9Bki2DdbI/CF2In
         TKj08i9skPnr7MJ3zGzMyUW9RfnxjvQtdvulxAY/FerMjOwOdc6QaSk9UF8XzBI1JFas
         5GTtgQm/jiUtjr603dgqFB/Klivj6NEieuYYBFfeEq7E2ZfE3XvArQKhnN+YtRHFLkaE
         c2CfrozvEQkUANPqxW6wsXYh02y5kNhoKDc+K8ZAuOdtl4pyzR0BTfBxuv8/7ECV/scv
         rOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540459; x=1792145259;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YhlTmiSSnyAhAbjv/VolTrl3XZ08TdurV9y8UvnnMXY=;
        b=aYu2nCNviWsAW/GwePhCo2ivy4DxRkGtkgOz3yPavzDuuV+KqhY0zQM4KfXNXKXb7/
         INEnD4g8+V6xh21CQ2fJSpPY5mxl/xtBt2t7xCfdyuVoEBejbE48EJl14KeCxCXb1plh
         TAfJ1WgQbzRlMheDy/F+U+HNVbwdXL/kvnf/QS6NZyPKYo0HzHnoq/AsVwQ5mDtHR6GG
         H+vqspMpyoyr1ehq6AW5lDvkK2MGL4DcY3F71J95lbL4C236Qlg6gRCO4/gIZ69SOEBy
         nytNZgUJajjSua7HIB2tLbkiVLdWi7tC3f3vNjgiC/7Av82s0wt+h8ibMkxSzftGIKWK
         JnPA==
X-Forwarded-Encrypted: i=1; AKwUvBxy0N5PAe/qFeELDCP6poaKOhAIi27y/mfnJi8CWEaeaAtDNmwupvXjzfSZEAZZjerGbg/fdDTizf6mOus=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZE9hB51zHBkKrmb3gQBwvaGlbYgjzfbV5bzIQAcH6hZ16Ze3A
	klfUwCTFMJEej3xP8wskZKCgezgJ7OD+6IrJ0p5AZKLiiUf+fkSqPCTAL/VOhzsP3G0Hlm7UPtP
	cRXSmyoeeIe3MWYeCH7LcBdw0Uz6BfZxx28xnTx1TUw==
X-Gm-Gg: AYBFou1293ZvTfifac/ju8KU7rRxVWAKQgQzLrDoW3R6Yur27IhkLo6EDyP6rG2YpPA
	VIaRPW6tMGdsssb7xZdWoT65KebwWNzDp1O5MhDluLdGV/WCbFvMJjBRGDmZRiwogfe9UTG/xAQ
	pWyeSZUnaOt5wD7vuebeIGuNDh3RwojQA8ZZTFUkLg/ltt2edHpHdMdzgAcGSnWR8HtKKHpjgYy
	3U8hAjY8/1lKCTLe4UMIltHcQvXiNhuB6n1TP6HPcQlUSQFFGCm8YHS5mNFsePNdVH6JWunU+fB
	Eh5dw06v2OlWNCyFeJYZ+Mf7St5oPcty6QJzd1oqFH+nPkzFgdkJtB9Ac/nGbH5qBfYUw/ZXs6h
	wNgZ2NOxibZkwiuq6EL9TJcGrOD07oRibdqlchDbcc2X1CXHKJAZdy8cNAUoXM7EUss3sz2OV4g
	==
X-Received: by 2002:a5d:5d83:0:b0:48a:efed:ac97 with SMTP id
 ffacd0b85a97d-48dba9d326amr2435668f8f.33.1791540458537; Fri, 09 Oct 2026
 03:07:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-kvm_kselftest_dump-v1-1-55b022c6ef8e@sifive.com>
In-Reply-To: <20260831-kvm_kselftest_dump-v1-1-55b022c6ef8e@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Oct 2026 12:07:26 +0200
X-Gm-Features: AclHuK8s2qRUsbqTNG8YPqEmgy3yDujBoTHugKHr0lrqk5zZyltW7DxQdyuRR9k
Message-ID: <CAAhSdy3TOK6B5SUpFs+dQBzfLDy3-otMxTPEPwzOsoNsqY3cKg@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: selftests: Dump sepc/scause/stval on vcpu_arch_dump()
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, zong.li@sifive.com, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 5:57=E2=80=AFAM Yong-Xuan Wang <yongxuan.wang@sifive=
.com> wrote:
>
> vcpu_arch_dump() omits trap-related CSRs, making it hard to diagnose
> unexpected guest exceptions from the dump output alone.
>
> Print sepc, scause, and stval alongside the existing register dump.
>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch for Linux-7.4

Thanks,
Anup


> ---
>  tools/testing/selftests/kvm/lib/riscv/processor.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/te=
sting/selftests/kvm/lib/riscv/processor.c
> index ded5429f3448..bf355afa8486 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -235,6 +235,7 @@ void riscv_vcpu_mmu_setup(struct kvm_vcpu *vcpu)
>  void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu, u8 indent)
>  {
>         struct kvm_riscv_core core;
> +       struct kvm_riscv_csr general_csr;
>
>         core.mode =3D vcpu_get_reg(vcpu, RISCV_CORE_REG(mode));
>         core.regs.pc =3D vcpu_get_reg(vcpu, RISCV_CORE_REG(regs.pc));
> @@ -270,6 +271,10 @@ void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *v=
cpu, u8 indent)
>         core.regs.t5 =3D vcpu_get_reg(vcpu, RISCV_CORE_REG(regs.t5));
>         core.regs.t6 =3D vcpu_get_reg(vcpu, RISCV_CORE_REG(regs.t6));
>
> +       general_csr.sepc =3D vcpu_get_reg(vcpu, RISCV_GENERAL_CSR_REG(sep=
c));
> +       general_csr.scause =3D vcpu_get_reg(vcpu, RISCV_GENERAL_CSR_REG(s=
cause));
> +       general_csr.stval =3D vcpu_get_reg(vcpu, RISCV_GENERAL_CSR_REG(st=
val));
> +
>         fprintf(stream,
>                 " MODE:  0x%lx\n", core.mode);
>         fprintf(stream,
> @@ -296,6 +301,9 @@ void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vc=
pu, u8 indent)
>         fprintf(stream,
>                 " T3: 0x%016lx   T4: 0x%016lx T5: 0x%016lx T6: 0x%016lx\n=
",
>                 core.regs.t3, core.regs.t4, core.regs.t5, core.regs.t6);
> +       fprintf(stream,
> +               "SEPC: 0x%016lx SCAUSE: 0x%016lx STVAL: 0x%016lx\n",
> +               general_csr.sepc, general_csr.scause, general_csr.stval);
>  }
>
>  static void __aligned(16) guest_unexp_trap(void)
>
> ---
> base-commit: b5060a4aa33d7d78a8c1837ab08ef0c81ea96650
> change-id: 20260831-kvm_kselftest_dump-3f8d4daf5c60
>
