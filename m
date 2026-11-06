Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793958605;
	b=VzeC+zFS9PxnlPu4bMs6CU2YGLVVY5yNF48i8QSkPHd1SiLP2arqJVcXi6NznlkCULmW
	 Ss+4Vft7KOBCDJEMXZjTg1coDd0UqkYP2RshKP8ABvs3KMmdZrkgXXAlLivFMOpu4iOq+
	 JhjGJ6uNW9OAIqnv4vV/J7baJh2yE0E8RCTCS/wPC1nids6x/F014f+Usys/nMaLOMCrM
	 vz6TNNsWC5387ltpQUDPBM/CGmZhRbErH7nS1HKWDX6MblYAaXhiKQqrGsa7yoOpjVx3f
	 wNZRS2d6u7BtBL54LUoI6CosQrD3wNZ9F+CiEimxKOCaCHhCzIK5fVLlduNb7bzbi4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=i0RXhXRHqPQplgUbaoUrvnlIZ5UbVQs/4MlB5+exT+o=;
	b=bjknvtj6FQFMH6vc29tiNs1pSZo8nMlD85crMx/oroIsN3FElacT0xVZmrPQ8tw3NdZA
	 Wi9MFKEafKkVzZ03k/piIEGg5omY0rH3uo92lgxglmEkqmnWYZ+ILOnFJfJ4TM3gGv5qz
	 p/lkh2nIYRGGx8pKvsNajraCSsOD1Vq9D+krni9NuT6AS4NBWvMRnN1K4D1OJVbs44/x0
	 dKr94MI8mUBppmMKCtd34YqrDHlHXwoM5cdV5F/AxslnTIjeU6ebxYeKtAF5ZMDte15BE
	 vsoa3PkobJOTMKhcLgWDJ1kapDjvGykuOQ2u2XOW/9Zo3xho8BXWTtSb/r8Bg88yIpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzqR38H4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C13606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C13606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzqR38H4
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so444399e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:50:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793958603; cv=none;
        d=google.com; s=arc-20260327;
        b=cGEQ+FqeJYlXPtRztxrUNYxboD5BrvnXtEmKJPGWPR6G4nGJRpFT7ArSawBzrB2vkd
         NhtP6iJarn6BeIE60Z3+c8WYqPp9qJ3R3GQ+0ZA5vn77I4QsG3v6/P2BMHmqVFwBtMmR
         AzfvdXSdqcP/usAL05RB3JF88Nu+e3DG8VoAuyIlXd2oQ0tNSI6QVra4RLEIFSPR44xd
         1duIBPoFbMlSSv5lIvihRABGagI/yYhyDYrDgxlO1Ntc5NT8nhFBQLfec3cqObhlOBxD
         NHN85Y1YI1mEJFq1dl7QwuzqSWbN3slW9d0IQuT/iXKbgRmcgatbdbrv47MckJcxRQgl
         UUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i0RXhXRHqPQplgUbaoUrvnlIZ5UbVQs/4MlB5+exT+o=;
        fh=bd6SaCJDlJWhRSx8CjaBNCJ37w1dG/aJ+k1U8rCt8Ks=;
        b=XWID8+NcyNOjMRvH6q9hRummGA05jaC/p8zuCWrUaFIGwVetSjHzudGs6qkHWllbOg
         COjv0ynPXRrDUlxoCEavG4eZhBzp3S82YxFlkviVdUu/JLWO2jaNX4aBmkQwVIEb/1UY
         3GhyZmWLbh82/q5eJ0ZzhqR0Squ0bwYBrtkL/jHahkXjoKkTDU8v7GflwFhCv2eV9nae
         v1lM+meLIX3SoLpjkjwrqIXN3W82KZyyQ6wH7SM/O9pxcATkfcdyxuwc3ncL7mPxPYzy
         u+aktpBvtrSpeHNk61mVsp9P+7af2wNCuZcGZO0R/y10cuyInj/QACgFfOF/kTKKEy4M
         jckg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793958603; x=1794563403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i0RXhXRHqPQplgUbaoUrvnlIZ5UbVQs/4MlB5+exT+o=;
        b=rzqR38H4iEVTKI+W8IRWYFkzq+tJB5Y7OYE9A4p0tEOBaQNsBTdTA7sSi1pfsAY1gG
         7QzqTwgXkb2GChWskkYKohzYaCfimpwZohcZRYXI5LPZIdrMA6g7TisHn8U7fkyUXuc5
         U/YenI1adZs2ilmqX4Pgvr7Bs7vHRHF7PiYReq1EXz8HxxEqDio8FhdexnCgFeiO/w1f
         +H6PTu+wk31z+u3rJvDtXUeF9MmDkKwKJ6ZJI2154C/4yzyF+U2IHBRZUqC1zOB1LJmZ
         /fFUHYTr0qn1emJpZ+d/AlxRHbtK7oDQUTIL8ATlZnPPGHw5I8zXcqoTmn9j5pcnh6in
         fpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958603; x=1794563403;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0RXhXRHqPQplgUbaoUrvnlIZ5UbVQs/4MlB5+exT+o=;
        b=J98DufqRVppi5faWLs7EW5uU58Ckyqs/d7TN0x2S1RNI16TmAy/zwqTm6MY7WhMWDg
         yh06/GYiwaUWhvmIZXZ+aB9maMvQ+5Ct36QozgVlsKdGThOFfT+1ctE5d5YZ/IPg6+ib
         +lmnFwhoW6gSDJXpv+V0+58wL92AAJT2iGvz03VuemrN59BVlkHGrKtDs7jkUptHHAQC
         DNiyWqAJIBGsNX4JJu0dmKxx/bw1bExEt+2YSQFQjPTJsgfkl+AkyFU96wuFcrEb0XLc
         KVe0E97Y/Zp2L/q8a5aKc+13H05oic7JwbaH6iOtkX6MCtmsw2K9OwyRMI9dqfcewqMw
         2xIA==
X-Forwarded-Encrypted: i=1; AKwUvBxydSL9B11ryVx+Wyucfk9N4wrqFNxCod1ol82xz3cmZMqLx7EtgxynZRvAM0IiRq5YRabV5rHIXdCSMU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ItMsMrmyv8BUjsTDe9EZfE04sW9trJ+qvydC3i3Rc0W5PWvJ8
	uoh9muDru5BUfe0Sbu9kOialhVnmUwRdTOJPWsUPaBgGz17g2omxQIseHcotLtasqDnOSfSqmTx
	sFiWVTuJHEXpI6gya/aS0vfmgMNniihs=
X-Gm-Gg: AYBFou2CXRc9FU9X9jBf47CIF7afv+U6l+thtQ9NcqWc3pOI0uHC992NSiJk7xpofuQ
	3IJlDFXzQxEp5TAxJeAebTfJX9MaC+XxnA8hmHc3l1CXXrU2Bp4HXjC7K7CRp4XQMhxfFjEwmsr
	rbGs3kFHDrkFnqdLXTTW92qm1gYCVjdcP28dx6FSTr8c3PB1DLwmAFBjzqeXqdUrm9FLwvHsCm/
	iYGjA4wtMXp2fFFZJK8+djpb899Rp2y5vYUPiwACLSsnagLcyCsUSo25ZlOXtddveLiLz0yiqBf
	G9i5Jtm3sARzt1UF92qA8ioNnDiaAShiUJWat+AHIkH3xOQ9slc0iGujs6X4hLYgnbdDr3XTdsZ
	Pvo+qEbyyPSQd+CeYR5REFTOgXo6iDvLPRfPf09MXOjg7uzvVKTjJNYslt1gPwUCgEqRQ
X-Received: by 2002:a05:6512:3d93:b0:5be:3d95:3c7e with SMTP id
 2adb3069b0e04-5c003c084f6mr599060e87.65.1793958602580; Fri, 06 Nov 2026
 01:50:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017030927.345454-1-suunj1331@gmail.com> <au01Qocxd1gsXs42@inochi.infowork>
In-Reply-To: <au01Qocxd1gsXs42@inochi.infowork>
From: SeungJu Cheon <suunj1331@gmail.com>
Date: Fri, 6 Nov 2026 18:49:51 +0900
X-Gm-Features: AclHuK_aMmYFw0Il5my2_hqoI2l0YbFq5ppI5iN9PgB32Mkgeg9mxiSxKYMIzIU
Message-ID: <CAGwK=3q7MuQQxMZSS=c=UxXX08xgwPqs7kpsPy1EiXgbZbknCQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Only fast-path dirty-log write faults on
 host-writable leaves
To: Inochi Amaoto <inochiama@gmail.com>
Cc: anup@brainfault.org, atish.patra@linux.dev, tjytimi@163.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	andrew.jones@linux.dev, pbonzini@redhat.com, seanjc@google.com, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:03=E2=80=AFAM Inochi Amaoto <inochiama@gmail.com>=
 wrote:
> I guess this fix miss a part:
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 53bb25a5a60b..1b35ab980a10 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -761,7 +761,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct k=
vm_memory_slot *memslot,
>
>  out_unlock:
>         kvm_release_faultin_page(kvm, page,
> -                                unused || (ret && ret !=3D -EEXIST), wri=
table);
> +                                unused || (ret && ret !=3D -EEXIST), hos=
t_writable);
>         write_unlock(&kvm->mmu_lock);
>         return ret;
>  }
>
> Regards,
> Inochi

Thanks for the review.

Sashiko also caught this shortly after v1 was posted. I'll include the
fix in v2 and send it shortly.

Thanks,
SeungJu
