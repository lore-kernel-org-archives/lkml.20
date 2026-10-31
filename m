Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793472456;
	b=XHXN8y5yMmaNRqW/HXhT20fLXOVyHGUSn1OVFEnNsv3WDRS/zCajNJkbNTwjH43WVL03
	 5Tw/IMcwM6DkSZDu9blR7Xpq35GY8qO0q4tSe2MHb36aZ2z10W3pw+BEWQrwUq/sXsG+a
	 EqivDuHy20SuhRnmDkfeUXdSDVhnS8f/4ThMPMT9cr0NZ7Z7yEY9IZIRndw1LCsR2OEjl
	 RmgKAvQUF2M3GpQrbw78H1e3IKJ7/ZZbVmre0x9NUGoPukcQW+KaFnzCLiTcv7A26pbcn
	 NoyACmgeygTAJiz/yQJY5NHpxFAWAWuoBCRFYxOnwwsHZ3+oAtcDTpQWL5krzT9oV2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793472456;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=vkmwKYf8zQRpeat83U5XIB8sH7pruLs+dStmkRuX/bo=;
	b=w7fm66GTklGJIPIClQvVogjwchrLucnFfyplZvu0Rs+CfaDGLJedD4iAM+6+Q/H9GA06
	 tNacbYEI2+iit3H8TaP7NZHmlKnrH8KUO/VcPM6nD0QNnDt0alQK9fShkgkUqLWfkTVI3
	 hI7W0cYycjyp8I3fsClzzLyHDreuLMNKiWzdZ4SSpYvJQi0zMJr+MxVYeih/Uh+ORPs76
	 KJWRiTYctE9BnCdtI0wLmETzUcZpwWilBBA9PA6z1XAzENkzcg74FCmcMpn7ERt2KPLpR
	 ONkIMEvYnkUKXTiGwej2QYjJiUXGGAR4/z8C3mwCDr2iZf21RT0W03ZHqcLMypxyxpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P7IXyzz7;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rgrcU8Lu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC4C606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDC4C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P7IXyzz7;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rgrcU8Lu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793472454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vkmwKYf8zQRpeat83U5XIB8sH7pruLs+dStmkRuX/bo=;
	b=P7IXyzz7L54/UHRuDbbWUU/tm/UDc92eXqPxIC+hUuSpNx+7DN3CUtDgthxbrj2PHu//kR
	7jcct8vXn0hZlTekrg0OQTzonw9WJCHfhScorHP4ZF2LcW67ZNw6nKItQemz2JkFBupsAi
	SHutzoE3YotFu6AbuBDBWr+qowP1+jI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-LlAAZsulNvi76o4o-aDB0Q-1; Sat, 31 Oct 2026 14:47:33 -0400
X-MC-Unique: LlAAZsulNvi76o4o-aDB0Q-1
X-Mimecast-MFC-AGG-ID: LlAAZsulNvi76o4o-aDB0Q_1793472452
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e0389d6f9so877910f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:47:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793472452; cv=none;
        d=google.com; s=arc-20260327;
        b=DrluTductSNrIMV1hp1Q8iJgXiqt1BGcYI1CoOH2smz3vtRdQF6ersjxT6YtsrSHoV
         +52VwWX9VJNn6yHq1ay4Eb7rfy9D9ETjPww8ThAlP5+8rpAyHKossOrzT2L+yF3Gte7B
         Ztf++KblnoCTOusNqbvbssSE6Jk6kZ3ttU0SJj+CMMsCPn3CU3JOQ49KTc50IO0sAaz0
         pcztsjR83xUFR0ymExQ83BtHU3QiuQU+mJOJvdlikN/LWMX4HCkWFNdxAltSoHFT/hVc
         yeVlraYBmJ2f6/8Xceuoe12unO9p5eshK/Ivdc7D0mAbSBQJE5gg7ClDdd7/Udxj8bMI
         EO0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vkmwKYf8zQRpeat83U5XIB8sH7pruLs+dStmkRuX/bo=;
        fh=pE5HBqVU4DTSJppn517o2ZHUkFrFmcuQ6Z82y12OqME=;
        b=Wpy1hrPEBe/hWpcZwrMZ0Wb9NZEWku1K5mpuoNn6wLmhCbawi6z9OkzPrDjSmMqHHq
         BR5GiiuUolfexU6iBZuN1jxdopUGJqkc/qKm0s3Rj57ntqYTbFYuuLirLLzr22Kn1+1V
         LJxsaH1/QfMwvj4hRWdGPvSSCckMPMb/9CpXEyc+G9EWHvfG3Kdxi4g5jwHsKgrmbJkb
         1eIrxvdfA/M8d0kkPIMoG5vaO3hCl+zIsd2wKuZq8qzsdnfDzVNh9ERz0czMkJHiD15v
         18epE4N/Q/Qi3htdzE7t42KW4+5yuZIB46UdDhcGVehHhRyh46QX3cehQMfDku58iegS
         RYag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793472452; x=1794077252; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vkmwKYf8zQRpeat83U5XIB8sH7pruLs+dStmkRuX/bo=;
        b=rgrcU8LuZ/aUTGXonYVT8EYo/DbYN7xdSW4HZsjM1uMp/pMZWstNcwn9CpQur2eZkB
         iOjIsTZkAAPdESEQCaeU8e33i31U8ZR6o9yE42T7vZBteYhHO7W5TbYzKbpFsTAZPwiO
         Uk5LK+RitXQsr1zdzmjpeSTQJNDb8C7Iog5dddm0zzW9JyeDGXCNxuLcoaxy8Hsesq46
         7WQPaSrMfNGjaum5gnFaw2kkWwjSRudTFe7+2ktVCv9EMkU2YMImC24QGWorXDgNw9oZ
         9rRP18njy8mP9jM1GlCAvo5MkqK+kvxchXAiDMyXkcTYJnmsqXIMVshiUflSnaO6DAyU
         tr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793472452; x=1794077252;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vkmwKYf8zQRpeat83U5XIB8sH7pruLs+dStmkRuX/bo=;
        b=tVwtnjC2htiZP6MGngR/pxnqSF1HeNmpGYlwdd96u7X8LZQhturjUC276sLfNxkgD3
         xZcFexZgQsqeM8bl4jABYGIbGVfpOKCw4UR0RsBrn78UBBng6uAAAqMbcWa1hKeYwOnr
         nUJD2CFghtaEpLfq0vfIZgSvB1oKO2SRuUbzRLm3AZxmYqcorQOxjFCsAAyrc8ZxIqUb
         3UEgWmXMSqoKJ+uG+qY2HCWmlS1pDrwcBNZWfQpdNz9MDvgIZkp3OFQGwDUFwvDf+ZFs
         P3vjWhq/w5myp9q+K7yWR4lg3BotjuHwhF/ygN03OOAd39FzUQZec9vV7FoKpdHidBwK
         T51A==
X-Forwarded-Encrypted: i=1; AKwUvBx9G8qrFN6z0qAYpcIeX4mYiJpSkQBu2JNxZEnzTYNsCH5wWdHbXdzqomQpiR8EXj2Um1gwRcV4NdL05Uo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAWX0ag7KSPqkNmg/gWDgHhtGXxFzj9u4K3LnWcBCwis6LJFIh
	O3b5kfu9Qw8i1uBExTQFQWe0TVbe1Ia4KCM8x4vjp8JVKIthfoR2gtqV3tYSZpog/nARD2rhnge
	4kdKan00yWX1V4OLzcRPsHsxe+gRVS/TeVlw0I2A75bEZvGZ+9nhJuZiE41cHyUP8B869szGwHN
	dPJszfe9mTLQ+GygYidPXu0hJjRUFHR8SuD4+h4V49
X-Gm-Gg: AYBFou0FtO0JFkPn+/cRo5/WDmDTKEA37suL2rRSXBAzGs1hC9jilhkOcQn5ge5kZW0
	tgdLolswA5NxgdAuraKlO0CSICuBvYJS9cCn7n07WCswtDjBvP9VBqsOSxz8AzBykpP5GrxFq2b
	naIRXqEn/GR82CDgK0eEre5r0aImrDKe1aNotdQZyCkPyq/XAZfoLKGJ2cftF87WF4SU0jMYvWi
	h85HpRncAetI5WlEo6Vm3WVDCuBRjoNmXJcBmYz2rZJIjJZDspOUxeXVxi2
X-Received: by 2002:a05:6000:310d:b0:48a:f59f:8b70 with SMTP id ffacd0b85a97d-48e6e4f8c71mr13594320f8f.46.1793472452516;
        Sat, 31 Oct 2026 11:47:32 -0700 (PDT)
X-Received: by 2002:a05:6000:310d:b0:48a:f59f:8b70 with SMTP id
 ffacd0b85a97d-48e6e4f8c71mr13594299f8f.46.1793472452215; Sat, 31 Oct 2026
 11:47:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030183604.3e8e373c@fangorn>
In-Reply-To: <20261030183604.3e8e373c@fangorn>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 31 Oct 2026 19:47:20 +0100
X-Gm-Features: AclHuK_9y-00d5m76qSsFcMjJfOv9KZyclM-AmIVcVyuVMir0oD899CQbDHFHvQ
Message-ID: <CABgObfYRHc0ELLdqm2gF+9y=ef5871TVPy4JoGy1XwPChQhsCw@mail.gmail.com>
Subject: Re: [PATCH] KVM: reject VMA straddling the dirty ring on mmap
To: Rik van Riel <riel@surriel.com>
Cc: Sean Christopherson <seanjc@google.com>, kvm <kvm@vger.kernel.org>, 
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

Il ven 30 ott 2026, 23:36 Rik van Riel <riel@surriel.com> ha scritto:
>
> kvm_vcpu_mmap only tests the VMA's first and last page against the
> dirty-ring interval, in order to prevent a MAP_PRIVATE VMA from
> getting mapped into the dirty ring, breaking dirty tracking.
>
> A VMA that starts before the ring and ends after it has neither
> endpoint inside, so the check passes even though the
> mapping covers the ring.
>
> Getting this wrong is observable from host userspace: the VMM
> (QEMU) mmaps the vCPU fd to reach the dirty ring, and a MAP_PRIVATE
> mapping that spans the ring succeeds even though it covers the ring.
> Faulting one instantiates a private CoW copy instead of the shared
> ring page. The guest's dirty-ring writes then land in a page the
> VMM never sees, silently breaking dirty-page tracking.

This is deep in "if it hurts don't do it" territory. Unless I am
missing something huge, it's at best a decent code cleanup. "Silently
breaking" is overselling by a lot...

> Fix by testing interval overlap instead of endpoint membership.
>
> Tested by creating a VM with a 16-page dirty ring. Mmap the
> VCPU fd covering pgoff 0...199 MAP_PRIVATE, then fault a
> page inside the ring. Succeeds before this patch, -EINVAL after.

I probably would have applied it, but the commit message and
especially the comment in AI English made me change my mind quickly.

You've been working on Linux for 30 years, I would have expected a
higher standard; and if this is the kind of commit in Meta's
8000-patch stash, I'm not sure I want to look at the rest...

Paolo

> Signed-off-by: Rik van Riel <riel@surriel.com>
> ---
>  virt/kvm/kvm_main.c | 10 +++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -4175,9 +4175,15 @@ static const struct vm_operations_struct kvm_vcpu_vm_ops = {
>  static int kvm_vcpu_mmap(struct file *file, struct vm_area_struct *vma)
>  {
>         struct kvm_vcpu *vcpu = file->private_data;
> +       struct kvm *kvm = vcpu->kvm;
>         unsigned long pages = vma_pages(vma);
> +       unsigned long ring_start = KVM_DIRTY_LOG_PAGE_OFFSET;
> +       unsigned long ring_end = ring_start + kvm->dirty_ring_size / PAGE_SIZE;
>
> -       if ((kvm_page_in_dirty_ring(vcpu->kvm, vma->vm_pgoff) ||
> -            kvm_page_in_dirty_ring(vcpu->kvm, vma->vm_pgoff + pages - 1)) &&
> +       /*
> +        * An overlapping VMA is rejected when private or executable: a CoW
> +        * fault hides guest writes from the VMM.
> +        */
> +       if (vma->vm_pgoff < ring_end && vma->vm_pgoff + pages > ring_start &&
>             ((vma->vm_flags & VM_EXEC) || !(vma->vm_flags & VM_SHARED)))
>                 return -EINVAL;
>
>

