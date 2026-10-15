Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F674E9C1A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792103071; cv=pass; b=dmCHR19luaSYnye4F3bjpAM7UURVb0YYCasdOiigVpUo6DovGj3vI6VNrucXtbc0Ki2+dbtOvMOyrjdvsxPoBLjhdEsuOfJlapSKrnRxqXkO9bTzhKYHACcrBQUqDFnPFcf5DQkM/chwsvuyj3VTGbcfqbidLHdnHbzuT8NsDho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792103071; c=relaxed/simple;
	bh=JsHIw7j65xDVOcoDPikKv7uu3ebdMMVU+ZxDmQjoXQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a5/U597DCcxDfai2ZZFtzPdWcW04CC3MyeI/VEAKAHhsFwp97iAcCt67j0H24oKZoJQRbupUFtCN0vb0IbeaZVP6J+qr6XkLTqlR/57sOqAVpMMZOJuonfHC1G4D08Oq4DvyoYbEvz3d0oxuOPSyiG1Xv5tchX5BQ33ii0PJS9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eatGLZ1A; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eatGLZ1A"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-535f598d126so52731cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792103066; cv=none;
        d=google.com; s=arc-20260327;
        b=kpvqIlyjS4fh0IlTR+Q4/DYE0dZyYbRKWwRJuJd+Y6oQxg0azm63WSq+NnG+hTpGHP
         nrThYtPk0u2jKw7IZW5JZhifxGX2JlyOpB3j/NOEw0arTp+1BUbQU1KXp9oIoHNYo4F4
         EPnc2ZyTulyNu8I6+3JxfUpSK4dR2ucqCXn5dBQm3zitLd22PyidR/GwRaWrUDfOcDHC
         Ll7xsTApShjPw3SCyMTAN4W99u3/CpeH4EyLhb4zygeM7v+t+Wz15h7vH/D3fLxNdwLv
         7So8aAA0smbLNtETCdJZj0wUJJCFEpoi3oVlFiL8LlGtHCC8Qb7mzlhHkkp93I8wd+Gs
         7NLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JsHIw7j65xDVOcoDPikKv7uu3ebdMMVU+ZxDmQjoXQw=;
        fh=qmvJEDcAy1G94NL3rvl3Ot/18gX92wkRUz85lSIrLLM=;
        b=VS9UWwYtwRQMjLtQtGgxPxpOiLjyzavOgTa+WHM/2jr/r6wyXWyJx6JyIYL5P1HR66
         FCxrxRZ4d4f1O5kogdZT+RyPUpiO99H64nR6SnV2SKSIByohWSUX9vTzhUnEEHqItJvc
         5+7uySZbWejBMOTeu4LyRki0nqr+8qcBlGnRy95uExe3WT5JHJLngZkpVymRI/6mA897
         BZvXh/HRNkVtqAnAwLyCInErYKGijjeVm49WYi6YRkdxXwfZO3z5rTnmc7T4bApUl4+A
         gUhQ4vYoQdqDXazUXHMJKmirphqDZUxmlLaD6bmKOC5FmF7+IGpO+YGAIjlUaAeyMqza
         sciw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792103066; x=1792707866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JsHIw7j65xDVOcoDPikKv7uu3ebdMMVU+ZxDmQjoXQw=;
        b=eatGLZ1AkoVbXnXQdacqidMYMM+AnC7mrJ5iXHKfFHuP3kt0ZVez1ReUPOVVqoyTxZ
         A9hu8eVjCkWd7XJz0u+NOhDTAU12AvKItrHAPxM0z6TOVzIpZg9+JK6JZR/4XSMoF+gp
         Q2A4Lg9Fu2u4SG8gP5WHgZm2ndXNfl+N9m6EZFwFTG4H4iio5BS6mkDCe8biTV6NVm4j
         uONFOtVH+RUPj45EdPEz0OMAMyPjYbZRrCBO8CjfSPKjtbIQKodEGnXFeUeAs9RnN2y0
         Xpt50h6a5hByIiXAkFi5QumsS+HxCakADE6ev1yZTbdOwyVfzigz1cOlMSClL60fnnCN
         1Yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792103066; x=1792707866;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JsHIw7j65xDVOcoDPikKv7uu3ebdMMVU+ZxDmQjoXQw=;
        b=NaZWN6cIiU+lwk1q3zldvmaIAkfDiknfgKEJzFbPQHJTX38QUVctIeGmZF4xuInICn
         3tYmKYiULKz0FAn/Di8vhTAq2DkBQS7suQ9Hdhmgr9nDoulcSxaFiCiC759ieRpKx8pv
         86cplZmsbo7KOgMadGjlkQFeDrNDFOCh72KWZD/pYdsCpLfwAfkctxqLHgIYT7zfqYvf
         xpG0m7WDRwIR1lu7JGqj+j2me2Jh/Xq5mQJrRygDkMjftbeko46C+Isq1ZSfdmh5CmiS
         il8C5Hll/2tqHdOqZ26DpPBMRprfHHyyYpnoAjYsbtR3JkuILOTGi9wrv45Q6cwEBEYF
         Qj/A==
X-Forwarded-Encrypted: i=1; AKwUvBzuX2fELVogJIFcB6vI5jqlhZVHvgxhDDphkxYJtL1h//7KWjljYuuw/ZlBitFUC0phxBlej7IqQHiCkrw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIshR3h2yyEmMfvol61O2WVqjKy82OSd6PZ+AQLjuy6KfYI2bmS
	a3PNSVPWJQAu8UGbSpEmnCxqCIyISTm9awz+pvNheD3kzRPGhHpWlsLvPaqqZILPjKoQZ0egV+J
	5tgvj7D20ilIQyhp83EDnz82BkS3qVWqOs6Rk3kNh
X-Gm-Gg: AYBFou2TYBy9dcoAbS2yMIx2Fgszp9/pL58Y+YEfvUFT0uC2iZuBquvQV43DynKR7Ny
	HMqsDyWOqtN0o1Kba+iK6pMQKsdAoe+RWPOwtoKpiK138U44yi9qBaPgwyArS5WIaxFoQJXth6M
	ywOSW37lLC2RNTRdcBoYXbTkwh/NSruqgMS4jP+nQ2Ibu07LstvdMEMJL7sv0yr6gyokU5H8121
	xKClnFdicjM5BKBjHHOXYcaj/8snfJtO+4WNf6vbPDAMLB2VkX3Jv2nBnWAeMlmOdQf6cJSSlLr
	ne2mpIKNp9uVOx/wPRqx+YoZ7pciTBpvVP5SyY8AhIJqFhXPp/B2ogY=
X-Received: by 2002:a05:622a:1648:b0:530:2f98:cebb with SMTP id
 d75a77b69052e-5362b40cdc6mr3161581cf.11.1792103065023; Thu, 15 Oct 2026
 15:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-21-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-21-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 15 Oct 2026 15:24:10 -0700
X-Gm-Features: AclHuK8DXmxx-rfYkJXFdOtH4DbmnHj5hrHQbPjPUCKI-95-Z3_uO0rgyPy3uHg
Message-ID: <CALMp9eTF2NBYafgbRCfo=aEcTyC1DLB4gVpPM=rZd_zhqSuzQQ@mail.gmail.com>
Subject: Re: [PATCH v3 20/27] KVM: x86: Add KVM_REQ_MMU_SYNC_ALL_ROOTS
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lai Jiangshan <jiangshanlai@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> Add a new x86 request to sync all roots, current and previous. This will
> be used when syncing the shadow NPTs on nested VMRUN when an ASID flush
> (or new ASID) is requested by L1, as all physical translations in all
> roots should be sync'd (since shadow mappings are not tagged with an
> ASID).
>
> Refactor syncing all roots (currently only done by
> kvm_vcpu_flush_tlb_guest()) to a helper, and use it to handle the
> request.
>
> Clear KVM_REQ_MMU_SYNC when handling KVM_REQ_MMU_SYNC_ALL_ROOTS as the
> latter is a superset. Do not do so inside kvm_mmu_sync_all_roots(), to
> avoid any subtle behavioral changes from kvm_vcpu_flush_tlb_guest()
> clearing KVM_REQ_MMU_SYNC. It makes sense to always clear it when
> syncing the MMU, but there might be weird dependencies on the sync only
> happening before the actual vCPU run, and kvm_vcpu_flush_tlb_guest() is
> called in other code paths than handling KVM_REQ_TLB_FLUSH_GUEST before
> vCPU run.
>
> No functional change intended.
>
> Reviewed-by: Lai Jiangshan <jiangshanlai@gmail.com>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Jim Mattson <jmattson@google.com>
