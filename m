Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794114351;
	b=XDyVC+L1yAlvLJ5B2x1rCLs8JP5naEUUw0MKb80gKl9EbqA6pTneF+iCt2NWowIH5a2X
	 uauviPg06zwOddjuemlAIZj31rQsZD735ABNCJ6XKwDgoBi52x/9O4ofVMg025pxSRMlW
	 02cHyg7T8C+q34DibYFn56860auO82nHYEc+vtMs1kLz7d4rCVf9iClh5clT1H5N+Yr8B
	 ZIkOWRKtLGm+UI39yvVFuAolG0RZDVzYeAfUnj9CcK+eLgULiAlM2kGGxUS+P1jEBpVQn
	 dn3g0bk/g5639PUxokRZndrQmIwHN1zQr3DlsJqiggC+uSmSoFglIgzG+dWNJL+MFtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794114351;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DMAnc9Xs3KUNlFWK24lYx3EB87h8Uvn2c/RHBGCf0T0=;
	b=wFJ/jtcWDf+hBrf8+ZFxvvDz7a/3v9HwEt2QVRW3C7t9E2m/6wronbed3s9QMkOyigAF
	 /DvgpQ2QnY7AJqTc3USeNIn9WrowmEofmnIt9Vrc+dA+a8F6BiwL6KBse/rlUTAfdK4VO
	 xqRyhIqsut8OW0a15bhxUaMWBXmrGBLaFOQvIhK8LKi/vGljBWmqP3WMvMA6jEKmGI85c
	 yOnXYJXvTjggsUqfSTsRzulRApcLHBRMnnFRb9AX8psJJ2HZ/fYsjfZl1zbhVsVZoTgEC
	 fjFK0DYnJHs0Ijp6g6TGuCD7r6se0UraBA5l3+ZtnTepoUiHuO/0ryedIwFGnZfpV8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vum+POLL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1287A606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vum+POLL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37EF1F008A5
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794114350;
	bh=DMAnc9Xs3KUNlFWK24lYx3EB87h8Uvn2c/RHBGCf0T0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Vum+POLLdPenwWmmEFX+OR/z0AOexlfFNKekeJXHE3QB8MvTvXKgbiEexpO+DAqGR
	 rKO2ptDcp4QW3+4DDvXRUC9ZBLeAVVLjTlm6zgvMsxAl2Cf/HNsL+O26s5qR+uPHvE
	 0jwVARfEzJp7jsOn/YvLgLxGruZSZ+b29o9dy3GhCj6wCA9zC5BeM/PlQ0215I4jT5
	 +97JQELF0tywlw51Mj2MaE3S88XX1KHIAQi5NIVwFjWXCSS+IoPaSV2Y6vxMhJ9tvM
	 2+8r6+BP+REW1lxNVbHrNLhV+lR27VCG4kWWX+dyMDQg+4hqV96tUcFeJUK9L0ie1P
	 HjzPmBLtzChRg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so175566a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 21:05:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwvE8B10jG9CEVAcR5A8acNhDbzSGOiptHAonPkhaLjI+VNAhVeCR6U5tc4wiG2TvES2h5tbKmZOD8YeIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z80DHCFkFjWFL6fMwvljyUJ7Oy+z46hsBcBy2Jc1zhG8NtbQdJd
	hynEtara4hlWrkemqejn/BULrcIGcdV/7EbDlj8fvya9a4EAicy6MEWZqyhqzYiDQjDIKyi5HS5
	rT794/9xYWE//BmV0vhZX5SEXMsbZLRI=
X-Received: by 2002:a17:906:d550:b0:c4c:e344:ecec with SMTP id
 a640c23a62f3a-c4d6d15a575mr44829966b.6.1794114349578; Sat, 07 Nov 2026
 21:05:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016095151.1155049-1-cui.tao@linux.dev>
In-Reply-To: <20261016095151.1155049-1-cui.tao@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 8 Nov 2026 13:05:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4ZU1KaagDfObCZFYDTowG5EYf3QpdUebdpBdtozzF00g@mail.gmail.com>
X-Gm-Features: AclHuK_a2jTQjAVHTLhyRW9kDvdj1qOm6NVMjMG_Ua0PORpvn7SJ5WZ1nS5nXwA
Message-ID: <CAAhV-H4ZU1KaagDfObCZFYDTowG5EYf3QpdUebdpBdtozzF00g@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] LoongArch: KVM: irqchip fixes
To: Tao Cui <cui.tao@linux.dev>
Cc: maobibo@loongson.cn, gaosong@loongson.cn, zhaotianrui@loongson.cn, 
	loongarch@lists.linux.dev, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@xen0n.name, nagachaithanya9911@gmail.com, Tao Cui <cuitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Series applied, thanks.

Huacai

On Fri, Oct 16, 2026 at 5:52=E2=80=AFPM Tao Cui <cui.tao@linux.dev> wrote:
>
> From: Tao Cui <cuitao@kylinos.cn>
>
> Hi,
>
> Three fixes for the LoongArch KVM irqchip code:
>
> - Patch 1 clears the device pointer in the destroy callbacks: when
>   KVM_CREATE_DEVICE succeeds but the following fd allocation fails
>   (e.g. under RLIMIT_NOFILE), ops->destroy() frees the irqchip while
>   kvm->arch.* still points to it.
>
> - Patch 2 aligns kvm_pch_pic_create() with kvm_eiointc_create() by
>   propagating the real error code; the kvm_ipi_create() counterpart is
>   being fixed separately (Chaithanya Lagisetty).
>
> - Patch 3 rejects repeated PCH-PIC CTRL_INIT with -EEXIST, using the
>   initialized state of the kvm_io_device as the indicator.  The check,
>   the MMIO base update and the bus registration are serialized by
>   slots_lock; on a registration failure the state is rolled back so
>   that a retry can start over.
>
> All patches carry Fixes tags.
>
> Changes in v5:
>
> - Patch 3: roll back the base and the device state on registration
>   failure, as suggested by Bibo.
>
> Changes in v4:
>
> - Patch 3: update pch_pic_base unconditionally, as suggested by
>   Huacai.
>
> Changes in v3:
>
> - Drop "Load dmsintc pointer once in pch_msi_set_irq" (v2 patch 2),
>   suggested by Bibo and Huacai.
>
> - Patch 3 (v2 patch 4): reject repeated CTRL_INIT by checking the
>   kvm_io_device state instead of a separate has_init flag, also
>   suggested by Huacai; the check stays under slots_lock.
>
> Changes in v2:
>
> - Drop "Guard against NULL irqchip in irq injection" (v1 patch 2) and
>   "Rebase steal time counter in vcpu context" (v1 patch 4) after
>   review discussion: their trigger scenarios are not reachable
>   through real VMM behaviour.
>
> - Use the one-line destroy style in dmsintc suggested by Bibo.
>
> - Track repeated PCH-PIC CTRL_INIT with a has_init flag and return
>   -EEXIST instead of -EBUSY, also suggested by Bibo; move the check
>   and base update under slots_lock so they are atomic.
>
> - Add READ_ONCE() to the dmsintc pointer loads so the compiler
>   keeps each of them a single load.
>
> Tao Cui (3):
>   LoongArch: KVM: Clear device pointer in irqchip destroy callbacks
>   LoongArch: KVM: Propagate real error code in kvm_pch_pic_create
>   LoongArch: KVM: Reject repeated PCH-PIC CTRL_INIT
>
>  arch/loongarch/kvm/intc/dmsintc.c |  1 +
>  arch/loongarch/kvm/intc/eiointc.c |  1 +
>  arch/loongarch/kvm/intc/ipi.c     |  1 +
>  arch/loongarch/kvm/intc/pch_pic.c | 19 +++++++++++++++----
>  4 files changed, 18 insertions(+), 4 deletions(-)
>
> --
> 2.43.0
>
