Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com [74.125.231.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A57456DEB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790890144; cv=pass; b=RuhgzJZO+mkyiDydBnBRcavpEOvGFqILQDGtyf0C3foxU5SlgEZuaxjfTwE6XIroMVvR7JGCOUzbmuC59aTV9tKWb9Z2vGroivkpFajVRZHSaGi9g8ykm+ilJQ++Ca1zxdTEevBzJ/0ZVX1OUV/auiIA0nP7c/mu9/Bxk1zRGmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790890144; c=relaxed/simple;
	bh=oTN0XACxPdP2godMJRwnJKugf5Nebxe6J04znKJsbBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WSH3W+LZHWIA9AN4xmevEVTisq1MbcRQovnxiCKKfTSJYF0it/XHBllihkT0ldh+K/k/yIy6VWXU6Xe6+tBFog62Lc9y5gSxracgTX7H1gTjpjox3uY0U49i+021wMMYU/Kps5vmyrYu7qdCDhzC7kLnx1YBk/gJDeJYP5I9DT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uGq10QFE; arc=pass smtp.client-ip=74.125.231.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uGq10QFE"
Received: by mail-oi2-f42.google.com with SMTP id 5614622812f47-4e849c5fe49so4406932b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790890142; cv=none;
        d=google.com; s=arc-20260327;
        b=oYTxYN3h56AVeUwiBiGiaDp9KsdGj1yUKwYn+B6ztALpf1c4Q/b5YDwrnqAJ6nacRx
         D71KQQFp/YQNgY8mYUVHEgpr5/DIDbHT+NbBCzs+LCyyhfbf1hulbtpSIj4RqCiEbma/
         6ER9P7Zlherut+euGz9PsD8QBsUgZEPaMMEPDbM2fDvXgV4TPhXrneWeWNX/PoaBzrDH
         2FrsRJ7vBOTxD9fOfFQe3qvukGVPvGs5ZDa9+CZmZGvKUCLpcLEkUQvXT+CzeUn82lxh
         b+7I+pUWZTjC4mamluaeX5aOfsP0elNWRiod2IKUOIOS8KkMkZDvRs/UyxocM+22++My
         OKXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WQ1yE7SGQ1qvkGbYQM1t2aSAp7h/GwrmhNcmVEqa4TM=;
        fh=Qd7LZY0EF0JAzzlOOiyFY7SMhkSj98vtaILIVSClMFY=;
        b=o/Dcncl3LUboAQeu9NUkFB40SQEPRd47SIuOV3uPSn0KSVpexH7FU3e16C9mdfmRMn
         okNaQca9TyO+TWtlLip7QGS1xeerxi09MC3RejF77xMFAyz/fRoqllKQIuY4qHmqZyHO
         5Rw6DylJB2dDrCXJE+2ld4PkmIZCJBa6i2buCVbKRHMARcd/xZzcmRiJQF5uq+SqNOqz
         AOW1ENwv/MdURdwLpxnVa/GpaPG7hhzeEstvdhcw0ZSpP9PYhzNBA4ojUMSR9SuKTycS
         utZh1XuIlSWiO2+zgrrxUNBHpvYxoNU8K8DDWvY5296OxZaJwlGxBtJ/QQpCx9jlJfcF
         4L6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790890142; x=1791494942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WQ1yE7SGQ1qvkGbYQM1t2aSAp7h/GwrmhNcmVEqa4TM=;
        b=uGq10QFEvWh+lGhFin+raVvBTvkM83tp6DIaTrp2mTg35Cdip4h1PU37Wsrycm4BLe
         Ryug7pcJTkucAtWMO4D1+OTpF5yz86DUyZDHiq/2M8v0P9/3j+pfaNSik9PO34XjBEND
         yjopHI8MQPbIIHhKuurSXK+oJEHixX34B2hhRFGbj1whX6EnZKQhucCfkQAGUcpob+k5
         GyYDuSjBwkovKwkoO0WZZADSmpceSDI22ACqgFl6REZ9hATKYfez2UacDLG6+rGP3I6e
         xxXGDYCsEhDlvxbK98+WA5Z0FLKPVv6tetTmEA5KtMRnYOf62MRWucYuWEm3zltLIkFY
         0ppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790890142; x=1791494942;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQ1yE7SGQ1qvkGbYQM1t2aSAp7h/GwrmhNcmVEqa4TM=;
        b=EzxG86zY78Qczhc2ntRRVpooyk+G1xfXezapElE1Ea4ADI6NIP4fFLAMTp2Toshdix
         3fJFncw6zIXUHmi4Zph/Dtc/ypXnkuJo7v6eoT1r8FVn/9CbwyoMm/yy5vc7dtGZ4W+k
         LrbnjDdBci59wD3iEajQ+WgE1p8Ae8VHzfY3+8rmUSBNOzO7PjUSC/eEHMTgi7V6XWoz
         d4uYW7Y5OsqVawnolSd0mqfZCCCepp8N+6Ku33H6rybBMSBrox9TjIIopk4bvGoyLNxc
         T6L6DaHf64AqpnlyY14skeVLiygmcKHT50kEm/kmbnA5OZYC8PFIxTnyl7tpmHR9tLFV
         +EAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvdW0FZbRLlWpxyr7f5gy1ia2Bt/pgZzCOF6cmNVW4+p+gihjz/0NR3oLYfxBi8XmjkmkBWv/9Zo5cVVE=@vger.kernel.org
X-Gm-Message-State: AFuF++mwvAPUzK1y0HdJJ6FtdKMYqk15j9ZTagtXCBiZ1R4qxBk4fDBo
	rwRPi2A88PVa4NvgHIXWT85FEMB1nxzgDMYa5Oy0GdI6YcDzCACwgYoNm3L0ChARJXdBgKWr94r
	O62MPTdayFUxk8XvqPR8TMvnUtSpYNO00C/sPzROR
X-Gm-Gg: AYBFou2bS7j6LDXfM9rGmA0yCYA1oecjk4x4YUaRvGS2zBLeH+mpZV5jM2eLqpDxeTn
	fRtgWov9R1ICsRF5OeTMfhY7toN/oy11RWxtojZaK+WC5LUAif+glkfWC2C9brdcikQhMvI3oI4
	LLXRPl8dDCjAyMDsQqs4A5icTxmaYUM3qEdVy6/9makZv3DWUDPl25ORLmAkRkQxIfEZpmAJgO2
	PWohMO4iBtw8eIo427iRe73OvlCn6G8s6i8hl7c9EwUCH+DhYIaQDZ28CjQ2wr2pr76Qzpx68ql
	hwhOdZuf5abgC35Ms76+oiNlBT0SrthNfRP6Umuzu3d6BpyCuJlrS9AWJvLSHgZg+Il/CEUy5ck
	Qnf0Ii/+jzNsqTxPl9k+7AD/Spf6IdPphrkXPx5er0Gs6LLpivqcO4dUmgGXLpMqEeTIrcNjlqB
	Ve2hx1+FoovL9hq3MVU4sUBfEsue93e64BQg==
X-Received: by 2002:a05:6808:c161:b0:4c4:a240:9c3a with SMTP id
 5614622812f47-4f526a4f2eamr499736b6e.4.1790890141800; Thu, 01 Oct 2026
 14:29:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001202234.3794060-1-seanjc@google.com> <20261001202234.3794060-2-seanjc@google.com>
 <CADrL8HWDy64UH0N4RCtvgL6zP93jnwr91xjkWerEs1MBV9JH_w@mail.gmail.com> <ar7OMwkZ9bc0tbzC@google.com>
In-Reply-To: <ar7OMwkZ9bc0tbzC@google.com>
From: James Houghton <jthoughton@google.com>
Date: Thu, 1 Oct 2026 14:28:23 -0700
X-Gm-Features: AclHuK9a_Pc6Thc4O4ojJav2PU4YvfKX_hMsholjFG7-3LGP_q73xLDGlS33olA
Message-ID: <CADrL8HX3GeCKekMoxMuvD7kM3ebHRCqEohiDHDqK-4_XX4rHxg@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] KVM: Reject user accesses to guest memory if
 current->mm != kvm->mm
To: Sean Christopherson <seanjc@google.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 2:18=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Thu, Oct 01, 2026, James Houghton wrote:
> > I wonder if it makes sense to add similar hardening to kvm_faultin_pfn(=
).
> > What do you think?
>
> I'm not opposed to explicitly hardening kvm_faultin_pfn(), but I don't th=
ink it
> would add much value in practice.  Far more arch code uses __kvm_faultin_=
pfn()
> directly, and that doesn't have a @vcpu or @vm pointer to do the check.  =
We could
> obviously "fix" that, but nuking the memslots (patches 3-5) will prevent =
all but
> the most ridiculous bugs.  Getting anywhere near __kvm_faultin_pfn() with=
 the
> wrong mm would either mean KVM is doing something amazingly stupid during=
 VM
> teardown, or I guess maybe the scheduler or preempt notifiers went off th=
e rails?

Yeah, fair enough. It would be of pretty limited benefit. Thanks.
