Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7336B475346
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052019; cv=pass; b=H0/NaRBFD28ZtUlaYtiNaDgoNh+0ynN1zVVBqZ8LTwZLSCZfUREbaRtXJFGgGxzeb35DLbXwJ2BXV/kvVrzlMn+MEoYVny8WOo21oT9MwcTBVvLDC21vo9ZKenUJ6z5DmZRO22LEaiKxs/Xjur4BlRHobaC3thr+uc0n7VItkAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052019; c=relaxed/simple;
	bh=BCYd5zKHIb6pmPgog6YamRVpW3AdTCXLTOKv22hGEBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PALW3yHN0Wn9EXlZV2DGJcObJBMnYPQFtj2ad+FMgiTwDHTVH9GIdtibT69NGfSlbYQ4mU+gXloIqnhJdHkbvC15sdBlkgo27c+3xmmMxJPDoKvJchTwTzKy4/lfOOyZg9UGSI//MgmOPp++ruKTa/OdLBiKzBaLHVXA/2Gg3GA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cUOuTWyd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DHbiBRZS; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cUOuTWyd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DHbiBRZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792052015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AU0xO7xiIuUh7YL7a7ID/AwdZghoxbnnTVjxgl5m5Bs=;
	b=cUOuTWydqwcjWyKGt6y4dAeLfJ6ccHL5pAf/NF8Oz/Y4qs1x+437PTd3zjaho+fXM1Q99O
	SER/QFucjUc6bsWaQaployP+JJcik0cZgKJ4XZF6nYBZ2FO/GJd/YVLQaT/Dv0wBTYIgqj
	E014tzCEUZ/6rncnTBW47+dbrGgNtrI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-AfmUGWK9MZupZsome0JDgA-1; Thu, 15 Oct 2026 08:13:33 +0000
X-MC-Unique: AfmUGWK9MZupZsome0JDgA-1
X-Mimecast-MFC-AGG-ID: AfmUGWK9MZupZsome0JDgA_1792052012
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1b11e7837so19728465e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:13:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792052012; cv=none;
        d=google.com; s=arc-20260327;
        b=o3kg3BWSqSlIcDoKHJMdgjCGaj68thcTXUAv9lZ9Wv17+cXzfCp84VADwH+nrpvSrt
         51bH5gs0c5NOiqtsEPMLjn90ISFysAJt5yYIOmOi9gKLA6u9aQ2OYcU4r1zJqUXEe55B
         EjE1s2102U01fycIxbwluHTxdmLIoskFjzwbz7qOTvA3rGogR9BYi8glm1+XSXDsgSoj
         cxv4xox31R5SzSFgMTXHZLf90+FY4GLZUL8Z6P+HNb3vEggxKQR9D3nNT+ALVCLRHlkY
         Emhsrw3+sVQAS5pEcxWmK5MhRWVeZHaMbrHvSqTVrO/OCnrKHCD3/f/XeeiLjZnkSaTX
         4pQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AU0xO7xiIuUh7YL7a7ID/AwdZghoxbnnTVjxgl5m5Bs=;
        fh=0AxmfQ/dxWLZQDX8FZGGiGCehWRx33h5JTV7saqYNek=;
        b=WXWb+3KxGvMRNdVa7O6lvHjTB+Txyti8EZYaIvqP/O+rU3inHiFcF8YCzTLb7IgDwq
         1w7YFtlbLKyxQ6oCOcLViqni95/sDK9FhZ0fQJXg+39OzEwm4URZwtwC+fnzz5kl+TqT
         jxZqfzZhXTZYppjpq4agjBnBPMyzhziwzZofXCOGCOm0YJJlInRzBrUEV4BdKJfa8IZM
         mnFXSWcrB4w5vcuP6ZXeKgq9p1PIBy11eqHW+A/JZiRXKS1uJK0yxCsqjTkke1FOHoXJ
         ZPwztkgSgS6tLmDthXFMGGKRQIptzejTadi74isy+vXwdBhGuLw2IYvcmRG1l98pdkad
         qdPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792052012; x=1792656812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AU0xO7xiIuUh7YL7a7ID/AwdZghoxbnnTVjxgl5m5Bs=;
        b=DHbiBRZSPGqzkOaf/JC+AFSi+DjxBp5k4SjCnioQY42SGhkFBfLsIpb/8ki+gSoJ8A
         EquRJ9l8i9Fsn/3ZLKuFXonbsAnTBorzlgM9UN5zR/+YJ9B00DCuQIHoMhyZXrCD5F2T
         WBQUndSAMzL+itT1eG01Sj5PV1NDsNLg/JdkOb5psGZtMh1RQ/m8jXVSMCHDmVW/UcYe
         oiW49q8lUvWAqBojq/cX+J57PCDYBqY1Dk1ti5sfd9sfWY8pt+QpMB/1Fe4VlsEcyZfr
         J0kzWMwDiY01I0MtHC5T15sPUziqNZnqZFRVW9eblkH6n0Vu7UW2rT3HLaaeXTKLLylH
         6ZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792052012; x=1792656812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AU0xO7xiIuUh7YL7a7ID/AwdZghoxbnnTVjxgl5m5Bs=;
        b=OT6wheaeMZrpXuZ5yAISD2yyX0HpYV3fOElvN5P3+DgqnxuNdzOlNYCtokr7SRP6A6
         p1C8aiLseQVpY4R4ORVR5TqnvJrBTGk+IOYdFP4xREtZxsuC5ssy/POAboJvPb4L3mDs
         SNbCFPWujk1JlXIAJ+dESQbMv0BrAfTLtojbeOFEkHfRVrWBwL+9wqivyd6pbl7qJ582
         1/EPvabEQVURZQn+o7YMJkp+U9AWbPj67WT0XACOuti3Ee2D5E7BhHyTKrxghBY7ebAX
         4QzPcGpapFyH3dyF7ZHpdZvVCUSvwa/cRHZGORKBOe8KnuMWqY7WWsmOy0T4ztIBRJ4M
         NgTg==
X-Forwarded-Encrypted: i=1; AKwUvBzLI2YGznBswBgNBrNCvEZrzFNId2oIxvhFeBO8f3sUCiVPfu2Q9sZJ/xHWY0b3AsrF2o6rzoyyWdbMNIA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQpNb/pn70x7NA3dH3LOQzlhi0+WeTSMpxn4PrUSkakqbRijXK
	gk+Z4sTIDe4mV94yQL+dxGT3EY7He/Q2rYFpxTywC9dIPZc2IQ37oMUCbRnqDSbhbA+FRsYHqkc
	8SFlWHeGQHIWTswSbLQYVocvdBRpMd0PAA3TeMtEGAQ5sL3MlIy/Byv5tITCNyzLG9iplqx6V7H
	x5x4KSFWjSknY5UURSNQ432MFJXNnKkdat7ywGUlsW
X-Gm-Gg: AYBFou0dTm9vELGRa60dcgB5FVrefDQXcqIqAVEGhsrCHm4haATEgfV8fhe2AXhSDPV
	XtQduS7Co/V5Lucbyk6NDS/PY2TEIoSE3YbyCjX4ex5Nl/t8yevBQ23lgbWDwHxDNYYW0Hhg2hm
	WtOsJXMeLZnQ7RygvkHuYB4mNKeXHS8zwZGf6yqWiaDRlz92VOASpfMCdZhEUrpYc6bPR1CcALR
	QfrIKJDT6gXVNiN5HQ7svIyBbRGTUh49HnYqOiUrg6bkImYXmqFkdxST/RJTQ==
X-Received: by 2002:a05:600c:348f:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-4a18e4c05e5mr370153145e9.19.1792052012082;
        Thu, 15 Oct 2026 01:13:32 -0700 (PDT)
X-Received: by 2002:a05:600c:348f:b0:49c:fc6e:8caf with SMTP id
 5b1f17b1804b1-4a18e4c05e5mr370152605e9.19.1792052011600; Thu, 15 Oct 2026
 01:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015064656.1525830-1-chenhuacai@loongson.cn>
In-Reply-To: <20261015064656.1525830-1-chenhuacai@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 15 Oct 2026 10:13:17 +0200
X-Gm-Features: AclHuK-N6y3qu8Vg7-uaSs-vNc8ppvQ0yoTimFzinJPuSt1vYpru_CK0wq-a7q4
Message-ID: <CABgObfb1GuJioOC5WEEY+ZJ6zCDH-gXr2Sg+20eF4AAVyE2_NA@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch KVM changes for v7.4
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 8:47=E2=80=AFAM Huacai Chen <chenhuacai@loongson.cn=
> wrote:
>
> The following changes since commit 24a19b953e2a3d0ea5a8c4951a0ab8f32720c9=
07:
>
>   Linux 7.3-rc7 (2026-10-11 20:04:55 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson=
.git tags/loongarch-kvm-7.4
>
> for you to fetch changes up to 34f4ce22cf25802d8026c60c13c2db81f8c8e3a0:
>
>   KVM: LoongArch: selftests: Enable HW PTW by auto detection method (2026=
-10-13 16:49:05 +0800)

Pulled, thanks.

Paolo

> ----------------------------------------------------------------
> LoongArch KVM changes for v7.4
>
> 1. Add separate vmid support.
> 2. Simplify MSI intterupt injection.
> 3. Add hypercall crash support.
> 4. Allow to set pv_feature until vCPU run.
> 5. Enable HW PTW automatically in selftests.
>
> ----------------------------------------------------------------
> Bibo Mao (8):
>       LoongArch: KVM: Add vmid support for stage2 MMU
>       LoongArch: KVM: Implement vmid updating logic
>       LoongArch: KVM: Probe & enable separate vmid feature
>       LoongArch: KVM: Remove parameter "level" when injecting MSI
>       LoongArch: KVM: Remove duplicated checking with DMSI irq injection
>       LoongArch: KVM: Add hypercall crash support
>       LoongArch: KVM: Allow to set pv_feature until vCPU run
>       KVM: LoongArch: selftests: Enable HW PTW by auto detection method
>
> Chaithanya Lagisetty (1):
>       LoongArch: KVM: Return the actual error code in kvm_ipi_create()
>
>  arch/loongarch/include/asm/kvm_dmsintc.h           |  3 +-
>  arch/loongarch/include/asm/kvm_host.h              | 15 ++++-
>  arch/loongarch/include/asm/kvm_para.h              |  3 +
>  arch/loongarch/include/asm/kvm_pch_pic.h           |  2 +-
>  arch/loongarch/include/asm/loongarch.h             |  5 ++
>  arch/loongarch/include/uapi/asm/kvm.h              |  1 +
>  arch/loongarch/include/uapi/asm/kvm_para.h         |  1 +
>  arch/loongarch/kernel/asm-offsets.c                |  1 +
>  arch/loongarch/kernel/cpu-probe.c                  |  4 ++
>  arch/loongarch/kvm/exit.c                          | 11 ++++
>  arch/loongarch/kvm/intc/dmsintc.c                  | 36 +++--------
>  arch/loongarch/kvm/intc/ipi.c                      |  7 +--
>  arch/loongarch/kvm/intc/pch_pic.c                  |  6 +-
>  arch/loongarch/kvm/irqfd.c                         |  4 +-
>  arch/loongarch/kvm/main.c                          | 71 ++++++++++++++++=
++++--
>  arch/loongarch/kvm/mmu.c                           | 25 +++++++-
>  arch/loongarch/kvm/switch.S                        |  5 +-
>  arch/loongarch/kvm/tlb.c                           | 19 +++++-
>  arch/loongarch/kvm/vcpu.c                          | 15 ++++-
>  arch/loongarch/kvm/vm.c                            |  2 +
>  .../selftests/kvm/include/loongarch/processor.h    |  3 +
>  .../selftests/kvm/lib/loongarch/processor.c        | 16 ++++-
>  22 files changed, 194 insertions(+), 61 deletions(-)
>

