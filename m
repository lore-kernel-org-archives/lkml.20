Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794548222;
	b=cFioGkEaWQNIXdD7RxBWy9/VGkMtEmhdob19iNNkX6cYEU0WJ25M/mVon/iiLC82MJp7
	 3VumEF39gZJhClkN5bcHA4ywP5R5oDktN2a9OROxkopfGAcVtdMBlgLItYCnkr5hw0Qaa
	 TW+Tun24cGeqTxGk6wDxnBu7+zSWTqkAJMWFkksPO8hkYZfS9fyFQK/aB1LcQ2UMZyXIt
	 HE8fm4jMnxIRaohvX98y/1A/5DKQZTqLxlnTvXSsdJZDTTkRoSwS/YQZZ7WPt6uDag5TY
	 sCLDCxY8N9rrjEo1qg5aj0MGzetY08FeS/M+cYj5t3z8MF0VflzREzpDsuO1FKPUQMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QarEwHVG8bVm7bZjBedKgl5vOWWE7Gicj7qr674GGcM=;
	b=sliyOxuN8iDEXvhHk7zfMx5g7NwnC8OQpapuBJ3thHw/uT1c5LLXv14+x7nOVQgOeqOS
	 S9yh6SKpG6FFgnfVYc1RekYOZsvrUOvpPCplwi0E9its5nFtyo1MI+2NZG4zw3JwNYTt9
	 UgWgwysMPVuwC3LpqJFby1eIrfpdmBODeulnL/sYg22YEDMMxErICRXxH8MZT55jH9GuF
	 Txrj1OPx7Htwpg6wb7iESuUGb00hpBEH8pt+PeBU1CFnqxZc9ao66UwuzcjzLoEwW+rtU
	 IUteiChf9Fa7xTpUgUzHqaNSnBFiPbQJzmaX+k9zNOrlLKiewhJWpwqxHkcCXjJRCkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=LrF+y+kL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F103B606B2BE
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F103B606B2BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=LrF+y+kL
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490585eddfcso478960f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:37:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794548220; cv=none;
        d=google.com; s=arc-20260327;
        b=j2D3nfWceSy2M2oWL+GlBkkzGOvZlrc2NaeTuFPgRVlMx+lGtE1FMOldE1PzLgSK2P
         8nRBdwX8SozST5mYZmA+Z/+SWZKtm5Jml5XCYVFGLqYaBQMhBrtk83BUlxdQR/Felsw0
         HP0AXMJhMlkAp7ooYhAc43OOlVZJV+7xlQ4If1bxI+FgY7WrYnshUzctgIQkhQ0jDa++
         +3uH2WEUP/4LS7bF1DtmoSxLgmtRfrXD7vMTKIyOg2GiMY/IGEsR8sRSnRBd+jTuGj0N
         oY4pSURmcSXGGFT43VEhEY8zv3/dC2WhMcSKhdrDjwZiVOZT6XAVtbnqcfW1YBz6zTfk
         +Ebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QarEwHVG8bVm7bZjBedKgl5vOWWE7Gicj7qr674GGcM=;
        fh=KanT7i6LTIyBGlaEGHvsD27834VShlQQA7rhaKEZpS0=;
        b=aSQ1WBlFXz6Qlc3WygV6y0f7LK+yPCVarjhqq89SR0EQvDqeXtezO+fmrsOdbqbb2U
         8vwitWK/xrUSGK2RMtqBjc8A84kErgLbNI1OVbxq99EsfFGQnUwHVmnmp2BI5H761NY4
         35YOkp2aVxV2B9o9mbPj2KD8qfb/jVOD+TJvVRjVip/G2/D4tXm5BTfq/AdzJaVDHYMh
         tGWa7ZmjNaVzWiIVA2Yywt8HsipSXoc5vhbr0IP1MhOX5CCzPACS/WajXhFaxb8C6waj
         CnUm97meIPfCV6gFQVut3pz6Avw8FbvpJfv37KR0XETF4V/IzSEueIA7THHw/G44vtjf
         7eCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794548220; x=1795153020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QarEwHVG8bVm7bZjBedKgl5vOWWE7Gicj7qr674GGcM=;
        b=LrF+y+kLolu7fexQ3wcMkemKa/uN4SPoyXEfx19KAyO7Dt5yXQRSLANwIHzxw5Qf4P
         DbVqU8iv69aj6S0/5tlv3pIwe5kF/L6zQik9+FA8HtdvuC2sgDiu4wOU9Um+CWERg95W
         45prDOrxAD5jpkux4cA/6j8DUHkVWDWMdFN+rpQwjAbbhnmojf2TRrVG6uvS0PGzFO3D
         WnHjUN54edRVfrmT3MKR00Ee7VpBwGm2zpa7TncTpCtl90FwooreD2RpThd62Im2pk0U
         IY32h1rkJtUm6rvXMI9cNvl8TlqHwfZnr8bVOnAQFtdF9cRzUsYooMNulHIn794trRFN
         AQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548220; x=1795153020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QarEwHVG8bVm7bZjBedKgl5vOWWE7Gicj7qr674GGcM=;
        b=TCiAc7zXwbMI7Ff0KMp/ZYfxyvS9zGtu/Otj9mZ31Sym4JyEUjej2JZYIgV32mtMCK
         DnThZG2EasFHZs2IfPVpbIDEzIF4nxpE19fQDW9O0PYO2fk++FoO2SmrkOShh+aQ/knp
         wxhML64qvsb8gzcjJbnmuJfPq4jZQpNBd/RzJIBQriHmQrJ574cCvZAL/zwff1Mp/CVt
         kWMWAhTCRCcQ1Mn7HLneprFpCrjTayF9AMjGyz7LOfa3nkEj3P/EtspkzmEnBpVe5ob0
         M6GQFtdTXScfbRU+1HcbPyPpvE3BXnX4cREw13OjSc6a1fy+24n23lFSHgXWYDAFBXi+
         b5vQ==
X-Forwarded-Encrypted: i=1; AL+hErFodici9JXfKhsHMeCFYC25uuG9cI1JsGw0rdfXo8c0mj0Dx9XyRd+dgOLubWta5DNnTqTlG6ElRwM/RdU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FgJ2PCMQ/Ts3kbycIDysbyHF6dSRWaQBSY2BkQWKMG98hC9Iu
	/FCjV2GF8rN5QllW1aQ2NH44nZy1xg2lM/xcrH6Gcp/r7CJoAmJ8AjBWGWSxYU5+OQTLxzshd4/
	l6TD5gP2QRUwjwTCBbOTxI5AV+ijj4kF1MZT4O0nMtw==
X-Gm-Gg: AYBFou3wnWj3HimmIoOAQAMHaR7dIMnB1a6MAPl4HGMiTBQqbVQ5vV0hqfscM11Wsz0
	CMIgrobrkgKofuY2TSFF6j99up1AKjC6sp71paDNRoNch639GwRxgTvYuXdozZBiu5JH53NTGDY
	+cw0dRAerx3vLKzGV0UZQ95YB23o2/ckEs7J/f6UnDZiDWb2J6cdwnl4Lc5L3nuX47tqRwT6MUT
	zO0uqf/H9vGIo0nONMCVdEnHlkrWJbOY9t5UNAenr/s2OsPkOy+UEJsZz7WNxv0fszBaiClrCj5
	r2pS4eHLrbrIAwodai37kIzqEUddOWoF87CoY2xT1/+vPooZQGVifvcDlZomV5vua/k5ljtfhSt
	doGMkS0wa6JVVfJbsKGi66ZB7AvdoK01T1YeBkdaalpeZnLf/+ILppJgHydKjprWdGhN9q+MFCV
	tlPJ3RWKVHPNqfmmKfeAlzMGZLLl/EKT7VdJ9CcxZrB2qk6HylgYJag6Ib1Dl3SIpAki61s/jL+
	roVxA==
X-Received: by 2002:a05:6000:4707:b0:48e:e98:8b6a with SMTP id
 ffacd0b85a97d-49c6d453ed9mr3163083f8f.4.1794548220458; Thu, 12 Nov 2026
 21:37:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1789872556.git.hppiscas@163.com> <fbe7337f6989994ad4dbc4dc03a67e8ebfa61f8d.1789872556.git.hppiscas@163.com>
In-Reply-To: <fbe7337f6989994ad4dbc4dc03a67e8ebfa61f8d.1789872556.git.hppiscas@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Nov 2026 11:06:48 +0530
X-Gm-Features: AclHuK88LJjsYi40jv-VHQ1EhoNonVCEpnzC8CHgPBMpwYuzpNXU9bTUnQfxb6Y
Message-ID: <CAAhSdy2KAtv=4RAo8aaOjeHWga-JJsLympDWAeg6MjkfAxstoA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] RISC-V: KVM: Disallow GPA-width changes after AIA init
To: Pengpeng Hou <hppiscas@163.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@linux.dev>, 
	Fangyu Yu <fangyu.yu@linux.alibaba.com>, Guo Ren <guoren@kernel.org>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Nutty Liu <nutty.liu@hotmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 6:40=E2=80=AFPM Pengpeng Hou <hppiscas@163.com> wro=
te:
>
> KVM_ENABLE_CAP(KVM_CAP_VM_GPA_BITS) allows userspace to reduce the
> stage-2 GPA width while a VM has no vCPUs or memory slots.
>
> AIA initialization can complete with an APLIC and no vCPUs or memory
> slots. The APLIC MMIO device has then been registered, but the existing
> checks still allow userspace to shrink the GPA width below its address.
>
> Reject GPA-width changes after AIA initialization. Both paths hold
> kvm->lock, serializing the width change with AIA initialization.
>
> The issue was found by our static-analysis tool.
>
> Fixes: 7263b4fdb0b2 ("RISC-V: KVM: Reuse KVM_CAP_VM_GPA_BITS to select HG=
ATP.MODE")
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Assisted-by: gpt 5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>

Queued this patch as a fix for Linux-7.4-rcX

Thanks,
Anup


> ---
> Changes since v1: https://lore.kernel.org/r/4852f3b8985c353811fa065e4701d=
76dc9a7f086.1786512671.git.pengpeng@iscas.ac.cn/
> - No change to the code; retain Anup's Reviewed-by.
> - Rebase and clarify the locking description.
>
>  arch/riscv/kvm/vm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index a9f083f..66edfaa 100644
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
>
