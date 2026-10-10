Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FAC3C1F
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596127; cv=pass; b=E2mC5zLiZv3ynLp2RainXv/R3ia2K8iDja8P1RmdkV0hOlT5vB7+8njdDhvokUgsda4BfcOpzH1HD6dRJxaknb3hIt/l/bDo5cph2qEA3gWHVkGt6vWE0LaQ63Fhp4kv5HSh1SKaAXiGq2cQMq8+uaJWvo9XCUXSy60xGnEEyRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596127; c=relaxed/simple;
	bh=Wv9b/dFSHpxedb0iwRWO+tjnufr/6VDhHuR/YLZGbtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K6/bnb65sk9piwyCTVLLuU5akLTNKEWsvIlEETj3Zp51dNX2+34WZarVW9NQdaZvfjfRyk5FNQ1M9kEsEeHx5+7nqek+DEoCrkEaisunae28K0hnP0PTtDSmmfrLXaYuiW1ZZVv6E5PlAjc8c1a2HuH+WxcBVJwXGTLZhbG7ado=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NprT668N; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NprT668N"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bcdab9a82bso279429e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 18:35:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596123; cv=none;
        d=google.com; s=arc-20260327;
        b=Ez+4RmGW6tQOrvvNVtgfOBnw4Fz1MbWv3n+/wYXxkG1sanwnBT/LQcUb66SG59DQDD
         IEHhhMvZr0aDqBR6Q/k9SkajmvJm14AIvRFwaA3LH+oeiQr/JxyL7I0Jzyc7hY4sKQFH
         kIxW/RT0BnAAKUZqyb4bgiej03oq+HWHqrJn01c5Bv2ZTMrBhgwhBXFkJQUgFtdOrTdq
         rvYHhGl6sKblfgUvU73RdaRX5z2Q0RYFnfE7oM5sBO0Rtb1bqWXSxbJ8UBmCBS73NQic
         iggMyGY+6/jQ5IOoqiXEJVjFEgHNdeHcXNh/ZtJqb3Fw+f8F3M2rNHXPogQGcU45PDiV
         FUQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zejVRKXMz791oqNwhKPCP6K/7f8h0cFo5JM43ONmEBU=;
        fh=8fK7FdgBqeOPc3s4Au+b7Didi1mK0908GOZ2tMqIlBU=;
        b=LJrpXtWpySy6UcV9G+0n2zp9d330/YdR3LSkb72OZlaf/Xz8Tqne02g4mtE2naxQHH
         omNDTG3B3mhfMapMIwDfuOZnvyOWhosB+wHS6PB9Q0ZRq6eH3qXY1MVR7/YL6Ak1ai4Z
         5eDwp74r4MDhpQ71Jf40YoYwhBe+XWKBF6boeqwO/yk89ZwMSwls50Qs/rX/Xus76AlZ
         woGO4miS4SfapP4w5o3/8amRTK4Ox100l0OdCXGcG4vien2sB7JJxJ2h2uePSzSpi/VO
         cxlWfMglDMd5ENf/yGgnhqOc3HPHaZuFdyn6gSLiXDLha+MWGJMCmngARGi01n/A6n2P
         x6ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596123; x=1792200923; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zejVRKXMz791oqNwhKPCP6K/7f8h0cFo5JM43ONmEBU=;
        b=NprT668N6QdFNZFeOkh3WwwbiuwV/8nOameUxhTnLJ4rCyOllRoxdNxj+7HPicUK7j
         zFJhykYZfxwLwJPbOHyW7VkYGp6BGpgNUdbucVAB/Bhga0DfAY4mza2EWnmD+ClgGNb0
         xVZ01u3lOcDFkjL8P2rnLbnNe86DkDSJjV10/WbAyDeM+Tg/K8AJZbUVq88J8Th2BJUY
         UL5St18IisUIKrAxTCB0a1nYd0Gh+xTGOKtF5L8vflNQOghjEdM0/sYZo8tdaZ8uY6Qk
         9tCN5zgJc3J+B6QfssiskdmVzOM1kplQTVDJPi3zdir+oxfXpPl6RWr5Dg9xfW1+6qfn
         r1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596123; x=1792200923;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zejVRKXMz791oqNwhKPCP6K/7f8h0cFo5JM43ONmEBU=;
        b=W6TSZ2dlg4WKaQF2cVAyguMDXuGichZaMaOWm3YI1i7sfIL6Fl7WVj4A0GyVyxM6tN
         GozUkwyYTyXS202D6dKhKAKK0JWQ4/G6IsZ4b8i6XlubBl62l6QRklwoYpYRF6JAJccL
         A26LPKKS6cpRlqmL3uy75BTQaVBWwraradR9I1BF8z4Mxj5I6G1ov6gGLAVG4JTg0esp
         nxQ8tPyMGFXpoLzh4K1LQwDAUsHksXqHNe7RqubGaKl91myMr+9f2u1sYF+Jk3cjsR+4
         QbRyeSiXbG/xGq+UoJCteM7yW2DH/7FqymvZW5QmiccwLX0jasaWPwDXUA+d55gn2BCU
         +6fQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqmjcTFSkYaqUxDKMM2S0wqOc5V7xdwlFcLWczQ/TbMRZV/MnqZ8JDjHxXGU0EAKl/z86GB27IpAR7FS8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDB44EhNy1tJYYKyNImAOKYT+w3n4lbPSY31Iu3J3a7SNPW9Wz
	Ya/24rakONDjunruARZDyCIK40d0xXzLkUZleAQP7q52hQP+w0HvNxp6fo1WRRfAhXJM1ty8/va
	gH+RGVa2c9QkIYSvVvakpH8f9ZKF5mMc=
X-Gm-Gg: AYBFou2XCOktSBhkh8mUZ+S0W845ePZfhsoUIKCg/sIpjprtwhkG5Kie3gSyE1gLYqP
	TqHTa7weoIx8c8EMrf27pbgl77Pl1JiDC+aW1L3lZzJ2TJ+HSGzS6M2+hD9cjZ6kPMHYyJvpGEc
	7k95Twbs/ePRemztd7/ftFKjFFpsnsyvGSdvRiKDXOM722Nr7G/efVkKOaGou0WWj+bYuu8+kPN
	kP3s5E/ivGNN+ZkpU6Xg5Oqk7hveqKKSBDPtGb2YjbjoIyTx+R6JLEDVVxRmQEVoAfOSUbWpZE7
	Her0CUf/CNhAqJET76mb5dk+jAKPkS68xRimrN6YnugAmtdp+mkFtm8MoBNoaH0mYOlDND6TVWj
	t3v6+Pb2pb3pSEWkli6CU/Vx01YpwHEtAcfGGJatgtTJmCa4fhvZY3ZafSDO7cCVfZMyelic=
X-Received: by 2002:a05:6512:3b99:b0:5bc:b67d:ad05 with SMTP id
 2adb3069b0e04-5bcde6bdbe3mr1095860e87.11.1791596122879; Fri, 09 Oct 2026
 18:35:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009212501.971158-1-linmag7@gmail.com> <20261009212501.971158-3-linmag7@gmail.com>
In-Reply-To: <20261009212501.971158-3-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:35:05 -0400
X-Gm-Features: AclHuK9__AOLeUIrfKM5_aOsqjMFrmHUxw8TEZQfjZHjbxOf5LFd1-CxAppwYVY
Message-ID: <CAEdQ38Fdbx=pZ5=HmCU0C1=O+gAePAQEtd7w3oGSUX-gkQM4EA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] alpha: do not skip TLB shootdown IPIs for
 kthread-borrowed mms
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 9, 2026 at 11:19 PM Magnus Lindholm <linmag7@gmail.com> wrote:
> Change ipi_flush_tlb_mm() and ipi_flush_icache_page() to test current->mm,
> like ipi_flush_tlb_page(). A CPU that only retains the mm lazily then
> clears its own slot through flush_tlb_other(), rather than publishing a
> new ASN on every IPI. Once these historical slots are gone, the shortcut
> is available again if mm_users remains at most one and no other CPU has
> taken or kept a context.

ipi_flush_mm_and_page() in arch/alpha/mm/tlbflush.c still tests
current->active_mm, so a lazy CPU allocates and publishes a new ASN on
every migration rendezvous. The next flush then finds that slot, sends
IPIs, and the lazy CPU clears it again. Nothing breaks, but with
compaction running the shortcut is lost after each migrated page, which
is the case this paragraph says is gone.

I think the handler can take the same test as the other three:

diff --git a/arch/alpha/mm/tlbflush.c b/arch/alpha/mm/tlbflush.c
--- a/arch/alpha/mm/tlbflush.c
+++ b/arch/alpha/mm/tlbflush.c
@@ -66,7 +66,7 @@ static void ipi_flush_mm_and_page(void *x)
        struct tlb_mm_and_addr *d = x;

        /* Part 1: mm context side (Alpha uses ASN/context as a key
mechanism). */
-       if (d->mm == current->active_mm && !asn_locked())
+       if (d->mm == current->mm && !asn_locked())
                __load_new_mm_context(d->mm);
        else
                flush_tlb_other(d->mm);

A lazy CPU then clears its slot and still does the tbi() below. Any way
back to the mm from there gets a new ASN: ev5_switch_mm() sees version
0, and kthread_use_mm() goes through the next == current path. I have
not tested that change.

The callers have the same asymmetry. flush_tlb_mm() and
flush_icache_user_page() test current->active_mm, so a kernel thread
that flushes an mm it only holds lazily publishes its own slot. That
one also takes the shortcut in that branch, so I would leave it alone,
but the changelog could say so.

> Order the slot reads after the page-table changes with smp_mb(). On the
> publishing CPU, the store in ev5_switch_mm() precedes the scheduler's
> post-switch barrier in finish_lock_switch().

The barrier there is the mb() in alpha's arch_spin_unlock(). The
scheduler does not promise a full barrier when it drops the rq lock, so
this is an alpha property, and nothing at the store says it is being
relied on. Could the changelog name it, and the store get a comment?
Something like:

                mmc = __get_new_mm_context(next_mm, cpu);
+               /*
+                * Ordered before any use of the mm by the mb() in
+                * arch_spin_unlock(), when finish_lock_switch() drops
+                * the rq lock.
+                */
                WRITE_ONCE(next_mm->context[cpu], mmc);

The rest looks right to me. I went through the window between
finish_lock_switch() and check_mmu_context(): an IPI there clears the
slot under asn_lock, a flush on another CPU can then take the shortcut,
and check_mmu_context() sees the zero and loads a new context behind
the new smp_mb(). The three points from my v2 review are addressed.

The fork numbers in the cover letter are from before the handler
change. It would be good to have them again for this version, along
with an SMP run under compaction.

With ipi_flush_mm_and_page() changed, or the changelog reworded to
match what it does:

Reviewed-by: Matt Turner <mattst88@gmail.com>
