Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794569490;
	b=xdXIKC6n5p1ZNjO1QxLOxwpl/I06VyM6Q7YgTqGXkhmt5Q6k3ub35buLqGUvSIzaGEi+
	 o0QOFP+JLUV/7xklkCDRdNA0SlDdsEkU7EMbGucKi8MYOWixVgaeQph4xwK8dQhqW1Nn5
	 WNoEXserMSIBgeZ3nPOsAhBoZXvmWUc/q3VmNnOsJ452ObeyyBhqXIimAKAFUnOZXMopE
	 RinowoATa4n8LEVHRemWYjwTBAUeV0EeEyfH0OAo1Pm8Aw48GC3+Y788VaiSW117TLf2H
	 Q69fMqe6lm+eKQOEBxnW2i40t3pQeGq5qp5BtK5QPrtpPDXMVey00Pq7EbRN/wEPKgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MW//+eO8ifeDOMCGO0P1S62YlRWi+XpqU3MxHUVvu60=;
	b=ivHnH2/SGJLv1+0LrMKlwSCmXmJyV5ttNV1ZpdquzdCa4RqFXFupGz2Rm8cMA2Ntj17V
	 KeyAemWHcl0ilLaqjcnTpBZRh8am4/o7LaiRNRYOQ4neyGiz+K8mrS9E89UDqs2uoEG3c
	 4LaFp+f704+8nm/Fg71yMRWJG4/WRRJ3zjGVvhGiID4VVTn5AJEzdiN4ZFIdw+bhEFGqy
	 eKKvK00lyWIRowhKumF6AfAI1JAhFpZyYKkmPAdpPn1BrE4PDUkDil8gwVbGz1Y/ljMy/
	 XE9u326zx9sI1I0UrKW9aUK+++HUp47pr3pbvKI6+ZPyAjMONLviiX5pXph+9aVEwiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=eZzmiXS1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C33606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10C33606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=eZzmiXS1
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so11873115e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:31:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794569487; cv=none;
        d=google.com; s=arc-20260327;
        b=aDwPNdGQW2bIpmIBx0XiDjdOfZHlNKaH2KnzLu5CbfJTbOHsqzd9lLDj5JaiEPzRGR
         xKIT06uoNTg0XI+PECWc5UpoNFoteUig9vZAjy9OByCRAa/JmwXR5pUZgzyNZi8qoGm1
         YU3Laqkg8ukG4QZ4ZD+3AiZOBaaQqAqEopTpiG3QT4bPWRop9Mn6TdhPlKeG9A3wP0Qd
         kTvgPvO/Cvj2L/WG1lBKV8QYZccGmeFRaOUoli1i8j/UlaWFBrNuQ3tE78NTv1ANtJmy
         zQmrjSei29rkQb/Rrx3DdnKooLYlsRhGosSZyLbFwLOwQQ5+V9b8XamFHZQntlowtxBN
         3ecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MW//+eO8ifeDOMCGO0P1S62YlRWi+XpqU3MxHUVvu60=;
        fh=jSTYiFRSBxUWSJG1E+RUv0/afC/ZqmyKWgrLIk80FSA=;
        b=fP0CFCewRcxty7zQMyh92+bBGGVh2wQlUmpzZ8vHL9nmLVw3MXXq2lzOaCcXdfhT/d
         NcCONnNP06dNBDs4CwFh5BHmcJofbH34yIixGMRM7MqHNbGI1CAVs09/+52/HcgG2M4A
         /NjSbkNM4q2L2AvB0PWjKoK6//fT1YOxdmwkUHowUSD47nt73W9ujJsRBVed1wRaQYF+
         DLiI5EDG1KPoUIT5+of7lpxpEROtLi9iiv3FpuUZi5M9haQ3pCJmljD3mMffVwLxVqP4
         fW6URwoDvhetCTbcv1RM4lKwKo1WbQxH6+q39B4eRB9OhMrrzi/1vRf0jgSehiyeaigI
         vZ2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794569487; x=1795174287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MW//+eO8ifeDOMCGO0P1S62YlRWi+XpqU3MxHUVvu60=;
        b=eZzmiXS1W7ertC3npfms2hQkBYqVgQr/LcUUlflv3tneq8J0mJ5P444hFb6/978208
         TbXAYPI9LkJPCQDpp/vCAYyIP1zaiHEDCIuJm+8Sb92+VIJCIdvVYA3iNoyTK7+6GE5u
         NqCfPMFxDINLqS8QqzmHmvHQMJ5+04z/ZTfYxx92fZrE7nMy6V2KRcS6ZXcA1PZColJT
         oz8+gg7kexH3CBh/bs7SW1hx1tH6G17iOXVD0i0jK8W1lEjEosxo4nV7A5mJ1DCHINzE
         lzBcz4OyivQBIVK2zmKovz5UEAA18tAObIxRKdgWDfBmJKIIsl8+TGObguqwlyCZyYaK
         9yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569487; x=1795174287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MW//+eO8ifeDOMCGO0P1S62YlRWi+XpqU3MxHUVvu60=;
        b=i+NrLap6gP9ekmYQ8Q0amM5g7ue/FRHJh8NElD+ciGl9qCJ3JV4B1Gaq2fuL6vLP+H
         mQ9YyFKanNsyHDDgTq26kKw7BON5GU0IUcv9+YMd3H7O3wLnFVxqFxo8NfrMfUAqtkoj
         wjYM1yFmIZJpvVYOQo1Rdx5+UwnAIoa9CwRAZgLZLdTzni8hxwLLHSn7ynjKGeoSWoJJ
         EpJ7OfKcPkrikEp+JCpHDn2C3D9z+C+gPxAqI5kZwNUw9xLP4CJ2knZa0YAX4TM1f2Ff
         3WMkTeRGbptt0VQigUfBlNmF72YHRexGMDNfmvtXLIcV6VA1jskfY0OrOFY7xlhjawM5
         hCBw==
X-Forwarded-Encrypted: i=1; AL+hErFKk5YSRdQdefOJsBvVvhyedLNvhk2kTzTXZ37pnqPexYtCGSOKFXR3JwQ0EKiTue1/SMNqOtYSbi+a1hI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mcAtORCaEPWnxtc9Y+zhTE2HKwUppak1dZPGc9z9ATbYLCCpZ
	buLcRnBfXG8LGHEZN+2hqM1bfB+hODJeWbxJePdwn0otgPcJ7Gxx6Fsg5bzB6AkVw37fEF/4mvA
	MQmWO4mN4gSdUTV03zlXrvP+qqdJLkfydR6e8Nlq3jA==
X-Gm-Gg: AYBFou1vx5uLfzkCw52ZAUs0CXXatP0Q0nck7UBNE4br5X/wtPgbBAl6/Qh66i0Bmlk
	vrhvgpMzuOhlYT5pUbuwFo/OSoNDzn+ZZpEi5NwxrN/2HpCjK6js6yEVGnHJxBtnah3PVChqpR9
	h5E48lk+I7+Nah8kBRcMnZmUtL8qj1fdsVUdJtEXwXFM1BjjjJg4wfN9vQEI/Eph3vYtU4YQFQ/
	AuuIBsGKpx/BhexYhwsffojg6W5rUlOQ2CLB/r6uYn7SELbyE0Cr21W+azytgv2s4aOi1VzZuDS
	4wLbl6r1af8oGyfeK1bJroIJ0quLnCXT1qaP9skBRGlezgan2Iq0jUjM2YJPPGMk6tqOhEccFe5
	UCCajsJDDkAyJuyN2Mz5a5f0CEv6blC+5DSzu5svmMOoFA9YiGRmCPCEw+420vvhY+qWXrQwNpE
	8IwYHH9t5bkZ04MiFDjjztRxwjVhbS2HJEblHMz/EE+1kaqNZuUP4GuOw=
X-Received: by 2002:a05:600c:8b55:b0:4a2:a3b:7aa8 with SMTP id
 5b1f17b1804b1-4bb55a02927mr44985235e9.3.1794569486922; Fri, 13 Nov 2026
 03:31:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016101458.221648-1-suunj1331@gmail.com>
In-Reply-To: <20261016101458.221648-1-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Nov 2026 17:01:15 +0530
X-Gm-Features: AclHuK90R6Cy2P8s5V5asYEwdHQCx6nGX6JWvDYYKndKeaNm5EjrRpe8coA3QcE
Message-ID: <CAAhSdy2KUD5xXFeKY0OD=iUzQzRHW87KjCamPQxcdxK-riq9FA@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Set Accessed bit in dirty-log write fault
 fast path
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: atish.patra@linux.dev, tjytimi@163.com, inochiama@gmail.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	andrew.jones@linux.dev, pbonzini@redhat.com, seanjc@google.com, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 3:45=E2=80=AFPM SeungJu Cheon <suunj1331@gmail.com>=
 wrote:
>
> kvm_riscv_mmu_dirty_log_write_fault_fast() considers a leaf with W
> and D set already handled, even if aging has cleared its A bit.
> On hardware that faults when A is clear, the fast path returns
> true without setting A and skips the slow path that would set it.
> The guest retries the same store, but A is still clear, so it
> faults again. This repeats indefinitely, preventing the guest
> from making progress.
>
> Host reclaim or page_idle can trigger this while dirty logging is
> enabled, potentially hanging vCPUs during live migration.
>
> Require _PAGE_ACCESSED in addition to W and D before treating the
> fault as handled, and set A along with W and D. The existing
> cmpxchg loop retries if aging changes the PTE before the update.
>
> Fixes: 7705be59eb2d ("KVM: riscv: Fast-path dirty logging write faults")
> Cc: stable@vger.kernel.org # 7.2+
> Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch as a fix for Linux-7.4-rcX

Thanks,
Anup

> ---
> Testing:
>
> On a HiFive Premier P550 (EIC7700X, which traps on clear A/D bits),
> run:
>
> dirty_log_perf_test -v 3 -b 256M -i 3
>
> While the test runs, repeatedly mark all system RAM idle through
> /sys/kernel/mm/page_idle/bitmap.
>
> Before the fix, the test did not complete its first iteration in
> over 11 minutes, with lock_stat showing about 16k read-side
> mmu_lock acquisitions per second from the fast path.
>
> After the fix, all three iterations complete, each taking about
> 29 seconds under the same aging workload.
>
>  arch/riscv/kvm/mmu.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 78a1826c466d..042d1e3b3547 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -591,14 +591,15 @@ static bool kvm_riscv_mmu_dirty_log_write_fault_fas=
t(struct kvm *kvm,
>                         dirty_marked =3D true;
>                 }
>
> -               if ((pte_val(old_pte) & (_PAGE_WRITE | _PAGE_DIRTY)) =3D=
=3D
> -                   (_PAGE_WRITE | _PAGE_DIRTY)) {
> +               if ((pte_val(old_pte) &
> +                    (_PAGE_WRITE | _PAGE_DIRTY | _PAGE_ACCESSED)) =3D=3D
> +                   (_PAGE_WRITE | _PAGE_DIRTY | _PAGE_ACCESSED)) {
>                         new_pte =3D old_pte;
>                         ret =3D true;
>                         break;
>                 }
>
> -               new_pte =3D pte_mkdirty(pte_mkwrite_novma(old_pte));
> +               new_pte =3D pte_mkyoung(pte_mkdirty(pte_mkwrite_novma(old=
_pte)));
>
>                 if (kvm_riscv_gstage_try_update_pte(&gstage, ptep_level, =
gpa,
>                                                     ptep, old_pte, new_pt=
e)) {
> --
> 2.52.0
>
