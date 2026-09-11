Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3986130566A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111484; cv=pass; b=bNI4M2uXFkroHzWmf33z679Shj6BGRX6Ispji6DuAKyp8PDQrJZM4ILMy5JwM6Z7ScoLKkut7oom0aTooFtdarYAwpXhvyUbEsVDROYPExqnKM7tP0Ba55H+wcZGoSyaT6aP6Oev/Puv0WNQMsHN/+1C/Uy3OGQ/SWNQz/WxLkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111484; c=relaxed/simple;
	bh=+8tTBn8vkpHIXmkwGk2okXiTKep6AzUHo71M/p9GXbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DZzRFV58IXGCCWbC1zfL15p87R6ubLdgnaifTLjBkUD/aQJoVfzu3lJVmMsHUfJRg946O1NcjleVGA8zOjTjrmjOcwb2h72sHUjeMkB+4+OOtV41+hwcWBSu1/0A0xpCcIjyWsDv+G0xfXI3L/SH3igGvy7WhiM2JcYtGDQCzZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=CGTri4GC; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="CGTri4GC"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-486e934b0c9so134917f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:24:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789111478; cv=none;
        d=google.com; s=arc-20260327;
        b=OaqnNJpUyVYMvFhjkbL4ZcqGJBKUTMkyS7VQv5CaKmTDZ0jA+7iMShNECL4KT98enF
         UaP4kcfugYJgZUlBRHWAvfdBB1LM/5Sr0rI872CBxkV8g0FcqLONUeSOaKKVGkDFGkAs
         klsAau5NbVbj5qis2t5ZxGjj4gr198nddMEJ55QQwmXEYWPvl+nc6OLFZ5Rg0wfRGnWR
         iqXGXMhaN7ieBIlgkYSNGW4HnevdiwH11rfIAXiQkPqbKTjN4a0mfi1Awu4Db7q58l9+
         4ePjWEXU1VO4qHIzkuTAqS5bfwIlazgSzdqV3r7GBaItwYl+z7iJhO5UehChp2cKMpBg
         E0TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ZBw3ZTwOIgY959yo8ebXtIDcCXQztOd/7/v3zr0SCc=;
        fh=lqXeSD2o3JowX4gElUk0KFho+V7Eu+jaDNTUStc2ZGQ=;
        b=syrAV3c6SbeNJfHLjj/n++N3o4o3HeyrrqdJG077iYmZtGbk3hxEQZPJ99HbgQg9QZ
         xS7Na2aE3z9MkwwmyNaiiB7o3OabjZiPXoZl5KIJJjQg729VtsIcyqLEXbQAV2XZYu5U
         ecQzepFPzH1buE7+kqxq3ra1cr0vVp+0uQ8wgix0wXvVo2tp2cBb6iUd0Qf6j28pet8z
         Zk1ylD8pmUmHxP2hreMJ35c/7VLE8Enrp8PfV1PeFvJpRmP9Q9TtKBW0Z/sCq6wiaC4e
         Pg2V5C2t5ID0joyuWcZQKG5b2M4MuaEe5pkmrcT4Bs9GWknFffwv+zvIUmKIHM/2GZVq
         YLVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789111478; x=1789716278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7ZBw3ZTwOIgY959yo8ebXtIDcCXQztOd/7/v3zr0SCc=;
        b=CGTri4GCS+YdFymUSllkltgWEgqm9YkGQKXeum7qZPkalrilIYeskMf3Ict6CDbhI5
         Yp8hAIbSawRnSlWzBxIoUqLPPiVQOG1pYv6+6eBZxA0xyZ9T9UKbGQMipzF+lm5SsDN8
         rjZdCMimOTBMWvzftIfS9DSm3YErHoGeftVdaLUcBIxLG2eAfwGhCcvE1CWrDVi3l//m
         MIARRwlLNz9SnCnNhHe6IvRKxqdbDYH1iYrSpCQSeATvkMiuFqILlI33uNQwav8SbtM2
         8jNaQhvMcewvjCFC3+DuB3bhMTY4iy3dq/XC0e4DpZKQGTF9zon9kWJiGgNefN0CSCjX
         C7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789111478; x=1789716278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ZBw3ZTwOIgY959yo8ebXtIDcCXQztOd/7/v3zr0SCc=;
        b=RpdH0fzF7wusJoAJQ534lBEhfPAvZOl1Igr+8gPOTKYDFdCIVNy0JB59gdbfMxX5zq
         e2eKAxKQv/hcj5JfTe+OYX2E+wv/I1DbMOBTGHrPuVhslZxpV/AkVHU69zWt/EFjEn7e
         ggL4Yei8pXsvUai4i7vPAw7g2uq+YBi2Wwm8HdtmQWifbLbmaO4l0vAUqJ8TzmVZr2KS
         iwPsQm5aWGCmbjMSltVC+glY9C0kne8xTlz5uHvKJhRFzxOTwvn2NvAzvIcLB9+D2hiz
         EXJi7060nwyk82f4PtuOOsdPOsF9Uos5WVx+qxMZq4u5Cdp6RsJy4QlAGSee1bwMb5ZD
         sLuw==
X-Forwarded-Encrypted: i=1; AKwUvBxnGQao6tVfdKZpYJfVu19ZFC6OZlRFdxVNID6AuD8i2x9tjR6KCmVd0kI4oSbbV0pEhD8wDqnWv+uZhMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kkeInAPsRQ8AS/5vr4Ibem2VaztAeNTbIlCm4BOCeueOvqCFe2
	UDp+xWtI3/4ipuR0ifRYLaDxekLjdrJF6QZpwE/8BXewC/S0A3gkCuz0xudYZkoH1rzQkOVC5wW
	6aodOemvSJWeqnfhENY2ndZfnv9QZEWTEYMB73eieuA==
X-Gm-Gg: AYBFou1z4gLCEeU2guLbrJ73h4ZdakZCJX6OSYLcjian0MO/84TreqUnlF0VutXmp+f
	8yf9AteOGsPrCTMufwaDb0P8LY/W1NoVCJdiXANmBWiS80l/SqJX/03+v6iUx1TUPZvZcpj8iFs
	LZuJeu7+XGhOWaGrD8egJKhZfFTPGhZurHbjqCSxpFxakjEu3BeGF67jnzUPn8TMKViJcqq4DsT
	E9GRd878CswjUOvjke/cdw1ZmydZd9lwmk89eY9ygHEJSuJBIpREUDjCCTWgytiOSOec5r7qk8b
	gibhduQO0TxWJuQ0fkrHO4tsB60/xGJhGGXrTzsSdG+VnXFDf2LlBvd0EdfX27YQlxfhOObsYAv
	xkBk0W080aV7lDP3p/MuPJcRoDtokRanTLFmiTJc5D+ttVsp3uBKj06gHkLcx0Zah/k+zRD6EhQ
	==
X-Received: by 2002:a05:6000:2005:b0:485:9233:a5ae with SMTP id
 ffacd0b85a97d-486eafd5eb0mr3126572f8f.3.1789111478364; Fri, 11 Sep 2026
 00:24:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786512671.git.pengpeng@iscas.ac.cn> <4852f3b8985c353811fa065e4701d76dc9a7f086.1786512671.git.pengpeng@iscas.ac.cn>
In-Reply-To: <4852f3b8985c353811fa065e4701d76dc9a7f086.1786512671.git.pengpeng@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 11 Sep 2026 12:54:26 +0530
X-Gm-Features: AcwNN1UilFvQBMBFE1D37iU-TcFZA6Ymj5ixovFg4tSLMmtpRh77_3nZieaFccc
Message-ID: <CAAhSdy2gxgY6yjQRVhgwV2kLB8ZGwsuseOVPWF6KJsjPOLeP_g@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: KVM: Disallow GPA-width changes after AIA init
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Fangyu Yu <fangyu.yu@linux.alibaba.com>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Guo Ren <guoren@kernel.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 11:09=E2=80=AFAM Pengpeng Hou <pengpeng@iscas.ac.cn=
> wrote:
>
> KVM_ENABLE_CAP(KVM_CAP_VM_GPA_BITS) allows userspace to reduce the
> stage-2 GPA width while a VM has no vCPUs or memory slots.
>
> AIA initialization can still complete with an APLIC and no vCPUs or
> memory slots.  In that state, the APLIC MMIO device has already been
> registered, but the existing checks allow userspace to shrink the GPA
> width below its address.
>
> Reject GPA-width changes after AIA initialization.  Both paths hold
> kvm->lock, so the check also closes the race between final AIA address
> validation and publication.
>
> Fixes: 7263b4fdb0b2 ("RISC-V: KVM: Reuse KVM_CAP_VM_GPA_BITS to select HG=
ATP.MODE")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup


> ---
>  arch/riscv/kvm/vm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index a9f083feeb76..66edfaa86243 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -250,7 +250,8 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct k=
vm_enable_cap *cap)
>                 mutex_lock(&kvm->lock);
>                 mutex_lock(&kvm->slots_lock);
>
> -               if (kvm->created_vcpus || !kvm_are_all_memslots_empty(kvm=
))
> +               if (kvm->created_vcpus || !kvm_are_all_memslots_empty(kvm=
) ||
> +                   kvm_riscv_aia_initialized(kvm))
>                         r =3D -EBUSY;
>                 else
>                         kvm->arch.pgd_levels =3D new_levels;
> --
> 2.50.1 (Apple Git-155)
>
