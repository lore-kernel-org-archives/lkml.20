Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DE24EC671
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982130; cv=pass; b=H9h0IpOaMTL49+eyv+IbJsiDk914+FgFr/m3POBtdnM/cD/wZxIBP+I4Z4tqKXGA8oWr04UU4NUMdyTLDfMBJ1cZ7FWozE7JxbhIAgi+UgrPr4eXXSIH8Jt4Ovl+wt1zklJSov6RKMTlQ4yjD6Z+5Z9Lcl3B+UEOQIxfVW0D77Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982130; c=relaxed/simple;
	bh=PErefbjRur8+lAPuSaGWtGt6QpUAIajC81LrxVlpFMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZZcVXcheQsoxIy1vehH8C56kXkwMyctU4mtIoeoQH3J/8k3/0Hw1P+1mGERnb/mGQKRFteLXdOVJy9rVyA+W6eawl93rpVPq8H5JLv1ujoEygPglNAxKciuJQjM0MYtbjp3Fxu/0BTi0SyV0Z558Af4mTVaEL6BwGj3fjO+TGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ArcUYW7P; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ArcUYW7P"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so39328a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791982117; cv=none;
        d=google.com; s=arc-20260327;
        b=B/JqlQIVQ3rSiC4wQrCtwf0Up/QjhCOlubFNRP66ltyM5RzNeWndnh3TDrl2j5lfkR
         Ufdw+eDjUboOKa8js3x4aWEt71ExYZbnb987yeitEFlmX9AY+xCB8BOkj7Sny1Rjl0FW
         3rFIsAcya5nwpuZlHgYFaw9X5PhEhHbZFJNBuruuEZ7yi8roB7fxIsxx0u9raFDeL76I
         51bi2duq8nyYJb7sv/zNPHuXiLeXt/aRf/b3cjJE5eDOUFyINfBkMleD0N3qveERfLyS
         B9YNEwS+OhXGn0o5r5veC5DJCRX48enDGgxcfdaDcYUmK65StPtujiZdJaJWM1DfuW/h
         ccYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZQL2xas4nG18KleQ+fT63AHqIIDtA2su0UrfgqIbaUY=;
        fh=zhoGh4kb6eL6sxeUEjV3RDjbT97Q0KqzS0b1EpEYA9A=;
        b=plky1BjhXWzegS0ucvQmnS+nlPw86e5++U/W/OsITZ5S6UfxBi3+0APgvsLefE7tMm
         FyILLhYvfQJODe9PUllbQOFwxub/IsAwuhSYdHFW/lV5b0/3HRF+6oQzuU0FXeTzDmd5
         EqdazvismolTHl6doylfHdr3ND8QpdhLQ3qa3IjuJyHjEt9Jd8Dpz/axYerhIFzanWl2
         kzocNxHIqlrCFIbjhPWXDOEqOgEk0A39BVzuDfS9pJXWidIFBsZmej5K+ZaP5i0LZ8IY
         Im5U4rxEpbyiDp9CUNxMCbT2XV3hY7EVtiVWLpenTNRCyDlfdub06grK/geErMT1NTfG
         6V1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791982117; x=1792586917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZQL2xas4nG18KleQ+fT63AHqIIDtA2su0UrfgqIbaUY=;
        b=ArcUYW7PlGRQMppwNESL5NfTwEdvl54Oot4YOC2WoKwUCaoA7NsFTGNXVw7tfUthDd
         6KABLnr7CEb3SUwCV1D1LVst2kJbBZZH0GB7u6PXSNGLHs9fp7yGwXPHlb0yQw6MXRfn
         1FHe+2wZ52Y2NR0bru9BeMi+OvJMMEMMYe/AbVL/5MGckfBa3T5KdzzEH+UQLtG7MkEj
         He3bPtJQD5QNx3SNrkcctMBlwB9MF9gbOAtm1PNvrbegs+z1oj0rDIrD3e0Fg8bV1X7H
         X0TaJU6JUh6crWo7To8GvDW3bzJiMY4WmRAsLZ0+EP7TicXpkhu//e3heGs59NwUkdij
         iNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982117; x=1792586917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZQL2xas4nG18KleQ+fT63AHqIIDtA2su0UrfgqIbaUY=;
        b=rsGDSNuuRFYv+R4AKitQzJG2LwcGVSge1q3IF09bOt6w6JN9jED76YruRP9X7W1iEA
         kA2JBNOW6QEFocVWHlrYiAZa/xFUYz18kadx/DrsK1bpsIjJIta4vJ8OYV4pYcg3lqVd
         BrQI/M3uK3vW78SdHKXdd+4bJua/gyuzF9CoG/6nXaau/QlPHrZTT2hS+wA95ObHz+Hh
         ekHtEgGFu0+0ujPHHyrvGtd/dXP9aQtBxzQ3ofMZEFykreXSFZfRYoOeQTsMlKSKS3eK
         irHtZDURuNsSvIz2Cw3I2z4KyuWRvxsFlCfbZQgbpKhEaz5qjdc1rfuysOQR4PbFnGvi
         2T7w==
X-Forwarded-Encrypted: i=1; AKwUvBzojRki2ACA8Tml42YbU7A1clPc0lTSgKvh7jmZ8FN1XAsqKbuu8hHRsQp87ptwU7tVm1lUQyB6ZL1aaQs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFuZyQGTM0fIGWHCIQoqKcrR8LRF7UkBg4iBKQvpuvtuugZcJD
	68sU4GtEi2eqCvobzNOQ0zELbbZt349SI6FDGiIaX60X+Rd4+XStQlXIhyAmZdLfU/g25NZOBMX
	x601lN66XgqTRCxWsKGNjIn5c78EmVruY1PR0JbMO
X-Gm-Gg: AYBFou0LrE5O89R/oRMI/43HtZ5ZSWcrRM1BA8PjpQd6KEK7o/IEXPeNQqLX3dzyPQK
	zg1Z8mMILYh7SwTvZW+iamkPFw16handcWCZGpdexoXANBA/QeGLUxgqQsTbqTnZYZ5vGR71at5
	RUnf+IG9upU9XzfsF9H44Rml6+ur6AIQoPVM8ChqS0TvUqAkZxiUYECap2dpndITinXqWxhIgnL
	zdyvEDJxYjIbU64WW2SZAeDKma6qhK+7hwohXc+UAdX/oXhTk2RDACEiSDD/M+dKX4M4osHAhfV
	4M8fFwwZ8UfhiA9Db2mxtryrx1MJexxQPaoGit1+VqkIsm01pgGKMnU=
X-Received: by 2002:a05:6402:424c:20b0:6ae:188e:e119 with SMTP id
 4fb4d7f45d1cf-6b20aad471fmr31158a12.9.1791982116138; Wed, 14 Oct 2026
 05:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013231728.883001-1-yosry@kernel.org> <20261013231728.883001-2-yosry@kernel.org>
In-Reply-To: <20261013231728.883001-2-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 14 Oct 2026 05:48:23 -0700
X-Gm-Features: AclHuK_eUHrZ3upceONbVQEejfpEzwYMGcSk3TlD294BOAEgQl9aP_4IrxL6XqQ
Message-ID: <CALMp9eQ3mz_EiV4AcmMC2CQZ47s_uf7XCbhnn7pfvVjHwsXdTA@mail.gmail.com>
Subject: Re: [PATCH 1/4] KVM: x86/mmu: WARN, don't BUG, when walking a cached
 root with a PAE MMU
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 4:17=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> Replace the BUG_ON() in shadow_walk_init_using_root() that guards against
> walking a cached (previous) root while the MMU is configured for PAE
> paging with a WARN_ON_ONCE(), and terminate the walk if the WARN fires.
> Walking a cached root with a PAE MMU is a KVM bug, as PAE roots are never
> cached, but there's no need to bring down the host, as KVM can simply
> bail from the walk.
>
> Note, the BUG_ON() is currently reachable by a guest if TDP is disabled,
> as KVM walks cached roots even if they were created for a different MMU
> context, e.g. if L2 executes INVLPG while using PAE paging, L1 doesn't
> intercept INVLPG, and L1's 64-bit root is cached.
>
> Add a common error label for terminating the walk, and use it for the
> existing invalid/dummy root check as well.
>
> Fixes: 7eb77e9f5fcf ("kvm: x86: Add a root_hpa parameter to kvm_mmu->invl=
pg()")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
> ---
>  arch/x86/kvm/mmu/mmu.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index aadd5bdc2c97a..126faef5a6476 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -2558,10 +2558,8 @@ static void shadow_walk_init_using_root(struct kvm=
_shadow_walk_iterator *iterato
>         iterator->addr =3D addr;
>         iterator->shadow_addr =3D root;
>
> -       if (WARN_ON_ONCE(!VALID_PAGE(root)) || kvm_mmu_is_dummy_root(root=
)) {
> -               iterator->level =3D 0;
> -               return;
> -       }
> +       if (WARN_ON_ONCE(!VALID_PAGE(root)) || kvm_mmu_is_dummy_root(root=
))
> +               goto error;
>
>         iterator->level =3D vcpu->arch.mmu->root_role.level;
>
> @@ -2575,7 +2573,8 @@ static void shadow_walk_init_using_root(struct kvm_=
shadow_walk_iterator *iterato
>                  * prev_root is currently only used for 64-bit hosts. So =
only
>                  * the active root_hpa is valid here.
>                  */

Can you please rewrite this poorly worded comment that now explains
your code below? What do 64-bit *hosts* have to do with this
bug/warning? I assume that should be 64-bit *guests*. But, even that's
imprecise. Aren't prev_roots tied to 4- or 5- level paging (i.e. long mode)=
?

> -               BUG_ON(root !=3D vcpu->arch.mmu->root.hpa);
> +               if (WARN_ON_ONCE(root !=3D vcpu->arch.mmu->root.hpa))
> +                       goto error;
