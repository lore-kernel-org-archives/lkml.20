Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18433AFD0F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787890801; cv=pass; b=Dw5g42Vxiqphp4zSMxQgc127IE5ijp97wIsEefjGDio2jqSFSvJYlz5FN8ChTVnaJ6+q0BCIWHRHTjradn9fbO8MZEsg1jFDJKMBLqqCNayqTQgrBq6H9hlMFWc4jVuETpiYHhUG1luQ3QS59cBNvL2JZ8erCFMiQFowoFCX2zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787890801; c=relaxed/simple;
	bh=mTQhz7RgMxAC3d9Zq6Msa7p3Wk1sBx7SdhDb5OizNys=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n/4euj5Zv7UOsXIOOoJPZCWOeUjSb0EyPO7b4Tdh3xwSDZBB1Rj5122tL102eGASTFLxZXOI1yQpu8PI50VAt5BQ5eyGKqQWYW/whN/ki4s+PYjFCMw5ulnG4bL/dIZeD12mcgdaGsu4khUQVr/Q018H4M1SPD9287kWNMl7/Ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=srbbmPsk; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="srbbmPsk"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-90cc0ebbf4bso2181256d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 21:19:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787890799; cv=none;
        d=google.com; s=arc-20260327;
        b=QZI0vD8QzGm2eYoFA7pj/HunRMD345cUnH2HBlgFp/+Xtuca/CdlGuUr2e0WSPvBWn
         8fC7JvsABw0ZWNYK3x85tfcZj5hib0kKBbQNqKz78WNjWL/W1dBJwJXKyffczWV2p0+O
         cNNA3sfkNdMp7+0HUn7r0z94BpfGZ5mZfxxwHauaHR/j84+ge1XiKeIdx6WcTi/N9MXP
         C/CkTyCior68kN+An6T4ttG3Xo3k6jfBtvM+nvQggaJaLQl27+YHk57gbBlaLqnE8JFO
         aW3roGOhE4bJ2IRJnJ6T1O9qxh8oPfd+ilp/nFQQL0MggkZzDYjRM6o8c8x9Ncye31FD
         gikA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=QCDy9v0wvCJe6b4tDkyj5x2hkmiUIAeHKOf5Q690ANY=;
        fh=r450F56mpgnYJhGxb5CEALxYIAWI8AmDJA1sVjQXBQU=;
        b=SSpwrEDohMPqYheXa3uIOy7GDa6BkygDCNJcBTmKfXm6say8wqPk5m7YFgtybH9dMx
         4sNr6UeJym+Yks/JDLSqad2GTT8CpfAfBjiUBokVSclb6cYvNkxvIhfWTcNgaSsFZ//l
         UJQ1Jy+uyb+NTcXlJso87ZwoaWiPWS6ivdknlOQrHgyoXjxzH7LGIBQ+m2n/a5kLbTQI
         Cy08y5yOK5ps3fgrbPBHGAvkJVjETrRGFZpLc6vHyfHkh7Mf5j62Ui0Imml9kKCqMO7I
         S95HlkpZgJsPRgszBuEI5tcwSbEXozkOHrZqcCoufx+fo9Twac0jX3Z2XRzv4IpHMwmB
         +TUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787890799; x=1788495599; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QCDy9v0wvCJe6b4tDkyj5x2hkmiUIAeHKOf5Q690ANY=;
        b=srbbmPskM51SfvHLy1ZZPy5wqi5pSxCobpWjCsAtf9kdwbwev+Xzpwi6U163DrfKMz
         EGxcCb5XQX1Dianl/W2/dd91aW7aDdhaaeW6C8RGa3DJvQheicg39H1I9M0yGft6epVx
         FMBQBfmBQWhd90GZWLA3cHE/1c7j4RKng7E1q8OgfxXonFab78oK+/zUg+OUfTz2iGCh
         0XFkoUpzu2K975n1NolP8Xjrf06b0xWylV6V8L1LhpKm9+eGjTAApjskU/A7gWYqKZUw
         uJnA5IVLt2Zjr2ly63TJrSO56jUWMlZt9SDTZmk8Nqb8eN3+n8XkqQ3vw168TbyBaGNE
         NMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787890799; x=1788495599;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QCDy9v0wvCJe6b4tDkyj5x2hkmiUIAeHKOf5Q690ANY=;
        b=MX6IqGp0rgIBPCBLZPAGrU3e11i3wK1Fi6vB1Hewr4szAqxJjxAqTg8JEXq0VOh4xK
         FA5UO9EHDhQxKN63KHa08YZXBfqW1HwT7Me60oy/uzDGsICoPhk3NGa2XqBhoEfWAelI
         ICl53Y2nO4vTVoFzS6tSJxsf2aCm+wD9qMYVASDfswTlMKW1XgOlFgB9S+WxjmK1V4Hm
         vsmSGeTgYfuEsAfHSTEsp0cPxZy6VegG9ogp7v8zMLV2EaJT6EFsoLowuZ1ZsPSaCGMW
         FcOeWlZ8Df5nVifuyboLVnAbpupKYlrO1wqd3B3ntijwOy0bUsR8S6a91LspFVYjFwk6
         T1mw==
X-Forwarded-Encrypted: i=1; AHgh+RqR5ltQTIqI651lxkCf8b9n6nCwsh1hOU2+u7G3C8ScaHIOrS/hlYoXd6PbIB3PytrLQm0J0eZHd0uGU50=@vger.kernel.org
X-Gm-Message-State: AFuF++nqYrKgVeDjrImYRCyIbSl4UBXNYTq4CnHLsKfuRxNPeje2lIvm
	SabhDSnDQN/8NABty0Ne+0FewwXg/LP6e8GmP9yYtRNQhX9qwhuCFXTBoXhUr2mBVuqjlVz/0iC
	6IIC8hvuwAjRhUiWUqIuiZf7tYYKnJtXtmSjyuLmx
X-Gm-Gg: AR+sD10h7f9Iiz18qRC/iPS//KtOkhlFSFaMXNQ6OV85DWrE87bKk9reD3nr/yT1vh1
	JfcF+Tjbso8L9z+if978yQwcPXXH1Ma1O45ASB9hkBThhrrwyW5Mwjz1ANjB55HgNcW+NXmHKRg
	PkhGa7PnMExwp2ZGYJlpXGssZel5fTndOJZ2Zybv7PZ4+kWHa0nkLuOffbCYKRpKg38/G9tRF1+
	M2gpfAEP8fyXh/cRVoGrVTR0Ooil4of8o3n3CrHgvZTbOehypoStaTAUOaGSH6a8IMxrPJll1uR
	X9Z7CZgRuMC9zlBwqorAjegJMNkOuwYrM7WwNXO7+uwJcD9k+FwwDwjoHsCyYCCpdPlsVDqpveK
	L4ObWzl4J9zbNYQhtDK2xHvj3K+2VXKHFb0J/PVdEGg==
X-Received: by 2002:a05:6214:212b:b0:90c:4e5e:754b with SMTP id
 6a1803df08f44-90ce0f45ea4mr46165856d6.28.1787890797765; Thu, 27 Aug 2026
 21:19:57 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 21:19:56 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 21:19:56 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ao9CKMXAX-hScRSa@google.com>
References: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
 <20260826-gmem-inplace-conversion-v11-15-0a15d8a799aa@google.com> <ao9CKMXAX-hScRSa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 21:19:56 -0700
X-Gm-Features: AcwNN1UAGJ-fGOM9zD_UvTf06ZrP54h7-np3dJjD_6mMPjXqsGS1LGYTBF7LEzg
Message-ID: <CAEvNRgG7n6F=dW9V_QqQPDDgLiZ7x08uLDanJgSzerNtN8sqBQ@mail.gmail.com>
Subject: Re: [PATCH v11 15/46] KVM: guest_memfd: Call arch make_shared
 callback for to-shared conversion
To: Sean Christopherson <seanjc@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Fuad Tabba <fuad.tabba@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Wed, Aug 26, 2026, Ackerley Tng wrote:
>> Omit support for calling the arch hook to make private, since SNP, the only
>> implementer of the arch make-private hook today, would actually prefer
>> making private only just before faulting memory into the NPTs.
>>
>> Calling the make-private arch hook would require iterating both bindings
>> and the filemap to find the intersection of bindings and allocated
>> folios.
>
> Why would KVM need to iterate over the bindings?  Only the RMP needs to be updated,
> whether or not the RMP is currently reachable is irrelevant, no?
>
> Subsequent calls to kvm_arch_gmem_make_private() from kvm_gmem_get_pfn() would be
> superfluous, but that's already possible, e.g. if an NPT mappings is removed for
> whatever reason.
>

make_private takes a gfn and pfn, so __kvm_gmem_set_attributes() would
need to iterate bindings to get gfns and filemap to find folios to get
pfns.

>> On top of that, SNP would need to figure out whether to actually
>> make private based on whether the memory is about to be faulted, or
>> whether it is a conversion.
>
> This is a non-issue, no?  As above, sev_gmem_make_private() already bails early
> if the page is already assigned in the RMP.
>

I'll remove this, you're right.

> I don't care terribly about how SNP handles this, but I do want accurate reasoning
> and justification so that if/when we revisit any of this in the future, we can make
> informed decisions.  Because unless I'm missing something, this is an optimization
> choice (eager vs. lazy to-private conversions), not a complexity tradeoff, and it's
> not clear to me how we decided the lazy approach would provide better performance.
>

How's this, to replace the entire commit message? I hope it captures
points from this discussion:

  When memory in guest_memfd is converted from private to shared, the
  platform-specific state associated with the guest-private pages must
  be invalidated or cleaned up.

  Iterate over the folios in the affected range and call the
  kvm_arch_gmem_make_shared() hook for each PFN range. This allows
  architectures to update hardware metadata or encryption states to
  transition pages to the shared state, instead of leaving hardware
  state as private while guest_memfd tracks it as shared. Transitioning
  hardware state ensures that guest_memfd upholds the guarantee that
  userspace only maps shared memory.

  Invoke this helper after indicating to KVM's mmu code that an
  invalidation is in progress to stop in-flight page faults from
  succeeding. Calling the invalidation helper also calls the arch
  invalidate hook. For SNP, this kicks any vCPU with a registered VMSA
  within the range being converted out of the guest. This ensures that
  make_shared never fails due to the VMSA page being in-use and is
  important because if make_shared fails, the RMP table would track the
  page as private while guest_memfd is unaware and tracks the page as
  shared.

  Omit support for calling the arch hook to make private during
  to-private conversions. Making private lazily at fault time aligns
  with how it works on other platforms like TDX.

  Furthermore, making pages shared only requires PFNs, which are
  obtained by iterating folios in the filemap. In contrast, making pages
  private in the RMP also requires the GFN, which would require
  iterating bindings to get GFNs and the filemap to get PFNs from
  allocated folios. Deferring the transition to fault time avoids this
  additional complexity.

>> Calling the make-shared arch hook and not the make-private arch hook does
>> leak SNP-specific details into guest_memfd (as in, why only make-shared
>> during conversions but not make-private?), but the additional complexity is
>> not worth taking on until guest_memfd has a user actually requiring an arch
>> make-private call.
>
> [...snip...]
>
