Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8973D47A872
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014431; cv=pass; b=SQpJKRJxTxxFRvi+Jbn20kbqPGVHAGwR6tGlRKK1gR/GVMmtDnsZ+VRzhCcyCqZdlA1IqIdndWDU4KJBsC5VTAdHu2Gr6oDpb+K3XQyQMp7JonqYsm5r3/gjgzeK3nvSXATyZK7JJnln/jChadxOpuaR3HdM6HFYcd+CiF5O+hA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014431; c=relaxed/simple;
	bh=MCaOs6wYNSB4LFrsDrFCk/QlJZrshEPv8X72I3y+9V4=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IfEv6SFTqlVOr59mKWeUiUwxGUDF2CnNOymUD/KKuvTK/mJ/q3Ppy2LC8FXIFOgpFgZaYlZSNFAwKDcU6RuItGgPiUDhIIWy/63iGdNRY1bG0+4PHjX16yd0nV0xRsT4vcjIJzFJWaUKFximEImY875Ox+Gl/Q9SKJUWGdShd24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JSlx6hcL; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JSlx6hcL"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91ba702cceaso9518906d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792014428; cv=none;
        d=google.com; s=arc-20260327;
        b=Mr/TB9oUXGws+R29ZWLYXMmGwQsUhZgd0pkbdCnj6h4qWGxJRYk5PMcJpcfYYlnExq
         5gJeqQud0gS9fD08hlBtG3tOiTLzbvYXeFOJQU883h8imyic+F+uNNZxWgxUDU0uMoqt
         5S+9kksvsuq0XhhSxIMmMYeii8oc1T3R+LaRm/uZ3OfMpcHBKYxkNJIMlCpSZkDNp+98
         yyvIk4wiQ5L7b3v77e4X7IdhJYA3PsXyL825hWWb7nEMb5lN6RqV8ll032vecPpVdVEj
         X2/I36f6iFcnGq/kWGI4UEmNKCLh/dx2pYEG0mQN8O+tP2SjbmVilw+kFgU6tBDZUQqF
         YAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=OmdjCtO0BT/G+HosYDOiIQ+MFbY+P6PHIY8xmD++EWw=;
        fh=h1YsPR1bMcso+sXo0lYzqfoCOd4Gw2GBcQrpLg4J0gY=;
        b=Bj8P4c9TbQH6HhmZTu7MhC9f9ByDOy11F9ksA9O5lvQyg0/NCQ8xLQZhoynCIG0qoK
         x7ch9f6fpt9WpBm50++L5ZattEoPIs7DbNuUU1SevWO2kr7zmwm1QLo1cwbJu5h0SVvS
         WzaVXK5oahT170DzIlqhdNzvUJsZH3+/yL+8PPTWVlA+OtRkcvUVOorb9XAmt8tTQnLC
         ArBCf6lkt10ch2qkK3mw1fFwhEHBgLO+3fjai6IBFdez4HoVAzYPgZ1pu2adGhC82oX0
         FBY+ZqlQfgHHh69QpD8YCEXIBZKAO4FhXRWpnCM0A3TY7CqhQAKVV2x2KGEJVrWGri1C
         maUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792014428; x=1792619228; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OmdjCtO0BT/G+HosYDOiIQ+MFbY+P6PHIY8xmD++EWw=;
        b=JSlx6hcLclOXuJ5rv3+BmT4OEpImG6UFCv/raPoxbZEOidM0DzSBwdQXAGriIr5Edi
         TX49nUQL9NtrVe4u+GPwa7n6xU/AhixY0AegBACIRbdRq28mgasEndHIualDvFy5LTPR
         Yd3gXeECBDYDxwABK6N/c2Y5Bd569usZ9CnVMiPRnI9BCDNLO669UbiMbWpWoG0hybMP
         Fg3j32XupqTXaDb2z4g+fRVyyR+vUo4P5ieSz11ab59S9VrUJWGyQvPd537Na+l0XY/n
         aR8oZ+YeefMeUY6gOU5UGsAW0Pf7GZUucXuC3HiPHqoHE81Qasn/aee2qAy7sGopm65T
         szew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792014428; x=1792619228;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmdjCtO0BT/G+HosYDOiIQ+MFbY+P6PHIY8xmD++EWw=;
        b=GGPFzi+hcqB40SAMlvk/yXC4R9y/+aRq5U7iJ6JHA1AddSrSDjP78PwfiUpLSn1DUP
         CWF2vM8Hc9fE9Tdqyrlih74MVH3fr9nzrEeXcbNAuePAAcrGMS0aHR0MLIl1NedKWQ6s
         IwmU4nqny8PGJuQKiy9RqFQd1IFK2DWjLLKCBg8UsmVu9RAXUnwFpLWPv2DFdoPTrmMe
         wHDMXBL72hBuYkQBfOuJb8KJQNxXXgXVBYODQ8RVPcl58Rl00eNC432JdtP5xJOzmagR
         RXLM0IfrqVXHww93Hn6YPtvGw0i+HUAoo+xG8yL21NK0/yk4GsxBEeTazYuWxEtjHfZ+
         yJgA==
X-Forwarded-Encrypted: i=1; AKwUvBxBXO4VYi2SNnXv1dGL3aJK9sn1L0ue18Ff+J4yz/EdaWNdnfO3Gtx2y9aGtxXFyPS0d7oE4MwwwY4Vmxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIth/NXzqtSf0i9A883B927sf+vDX6EQiUgZamA27/dEXdeumAF
	TOBy5NMiNYwJx4nBZB6FFHVDrSHxBFT+V7bOdIN/eB3vHsA/uPQZpk4ZFlsEDr1pcoyin/cpy5o
	O4C7vLa+gIGAC9fMtnHStKpTvvMmAjny+WvCZ0SSa
X-Gm-Gg: AYBFou31+K70ZIVsVnnfAwOsBkPjXI6KatN2ut4n9PgwQUk9bf6IVsP59VhodT5wRC+
	Fl2ghzw0AlStBd/cnhVqRcGNjjjqtObm4TIAtNGubKKFR4v/VliUc8UNiov4U/11xI7ZaUv1Pn5
	6+ovvp8WpPJDmWL0e5HschgPzVaRDpFpmgOvbp8Jf3EKWwTm79gVY/CJSMYBW97quNUVS1arDJC
	bmHuaUeyFZ7U0hcC4CEnkXUIUp+gMh3KiC8E/fMMZxpJZVsu+ie+Ft2cQNDVe5lePt0wF1oGYk2
	EfNmyaGB6bjiiyVnnB0LL/cauZKgoBKTXZMnU5ryAtocCM7H/5f2Gx79jqBPP6yhmS63ndFQTrE
	xprJsAWwXWWqvfFX+Q9TlW5K3Dkz45eoO9LR/QH9FmdMv4MsEcYaz
X-Received: by 2002:a05:6214:43c1:b0:91b:8e06:73f5 with SMTP id
 6a1803df08f44-91b8e0680ffmr139578016d6.15.1792014427625; Wed, 14 Oct 2026
 14:47:07 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 14:47:06 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 14:47:06 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261014095702.39676-1-griffoul@gmail.com>
References: <20260720111259.122911-1-dwmw2@infradead.org> <20261006183235.16576-1-griffoul@gmail.com>
 <CAEvNRgEseLO+LbkwXrEit0H2LH5Wx-srSvHEMpt0=upPL3tF=g@mail.gmail.com> <20261014095702.39676-1-griffoul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 14 Oct 2026 14:47:06 -0700
X-Gm-Features: AclHuK_bDoENPFsEJnePb9piUrHFuROo5b9vCnTZ7F3PMjuUH-N1Jl6pvQGbDQg
Message-ID: <CAEvNRgHtB8j6=9r=txjsKvQM0F85nRN4KW5sdnuv_-Og=cWEfg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/9] mm: Memory providers for guest_memfd and iommufd
To: Fred Griffoul <griffoul@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Fred Griffoul <griffoul@gmail.com> writes:

> Ackerley Tng <ackerleytng@google.com> writes:
>
>> When the provider wants to revoke the page, the notifications/function
>> calls flow this way, the last [ENTITY] in the chain actually does the
>> zapping.
>>
>> + [PROVIDER] -> [KVM]
>> + [PROVIDER] -> [DMABUF] -> [IOMMU]
>> + [PROVIDER] -> [GUEST_MEMFD] -> [USERSPACE] (AFAICT this was not
>>   implemented in the RFC.)
>
> Thanks for going through it. I have just posted v2:
>
>   https://lore.kernel.org/all/20261014093733.90312-1-griffoul@gmail.com/
>
> It changes two of these chains. dma-buf is gone: iommufd attaches to
> the provider file itself, through a small interface in mm. And
> guest_memfd now maps the file into userspace from the provider's
> frames, so a revoke also zaps the VMM's mapping:
>
>   [PROVIDER] -> [GUEST_MEMFD] -> [KVM], [USERSPACE]
>   [PROVIDER] -> [IOMMU]
>

Thanks :)

>> IIUC guest_memfd conversions was not illustrated in the RFC: what
>> happens on a shared -> private conversion?
>
> There are none yet. Only VMs of type KVM_X86_DEFAULT_VM can use a
> provider, so all their memory is shared.
>

To borrow David's words, the part about this that makes me itch is
conversion. We have to support conversions. Even if it doesn't merge in
the first patch series, we have to have line of sight to how conversions
would work.

Conversion requests originate from the guest and then the host handles
the guest request by making calling an ioctl on guest_memfd. Hopefully
this part doesn't change with alternative provider support.

Suppose guest_memfd still gets the conversion request first, in RFCv2,
to reach all the mappings in various page tables, it would have to be

+ [GUEST_MEMFD] -> [KVM], [USERSPACE]
+ [GUEST_MEMFD] -> [PROVIDER] -> [IOMMU]

since guest_memfd must ensure no IOMMU mappings to guest private pages?
There's that extra step through the [PROVIDER]...

>> Does your provider need to know if some memory was transitioned between
>> shared/private states? The provider can be notified too, if
>> necessary. If not, then isn't guest_memfd doing all the coordination
>> better than going via the provider?
>
> Our provider does not need to know, and I agree: once there is private
> memory, guest_memfd converts the pages, so it should tell the others
> what to zap.
>
> I think the two models meet there, and the v2 cover letter now says so.
> The iommufd side of v2 does not pin and keeps no references: it asks for
> the frame behind each page, treats a page with no frame as a hole, and
> maps again on a revoke. guest_memfd can offer that for its own file:
> shared pages return their frames, private pages are holes, and
> guest_memfd revokes a range whenever it converts it, in either
> direction. That is your [GUEST_MEMFD] -> [IOMMU], and it should work for
> folio-backed guest_memfd without memfd_pin_folios() or refcounts, as
> long as guest_memfd also revokes a range before it frees its folios.
>

This part makes sense, if I'm understanding you correctly.

> The one difference is that v2 also lets iommufd map a provider file
> directly. Going through guest_memfd would add nothing without private
> memory: it would only pass each revoke on. And memory that only devices
> use, such as MMIO, does not go through guest_memfd at all. Both paths
> would use the same iommufd code.
>
>> Does the revocation model work for you? If it helps, I can rebuild the
>> sample provider to illustrate how the revocation can be done.
>
> Yes, the revocation model works for us. v2 replaces David's sample
> with one that moves, donates and makes pages read-only, and a selftest
> that checks the guest, the device and the VMM's mapping after each
> change. It may be a good base if you want to try guest_memfd as the
> provider for iommufd on top of it.
>

Thanks, I will prototype what I have in mind too to make sure things
work as I think they will :)

>> 4. [DIRECTMAP] Kernel direct map.
>
> Agreed, that is separate. The memory we have in mind is a range hidden
> from the host with memmap=, so it is not in the direct map.
>
> Thanks,
> Fred
