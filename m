Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB26C46EC72
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967518; cv=pass; b=Em0D5Rrg4jIGkH0JAKZUk55F/fmQzLb0kC0ph4IcK/Pf0x8OtNX9FCWECjPDxxtz0dk9niUHOB927z1SmOzIyHsP5Kpb6HCPhxNf5fKSSOj5wUKwiBxCMJiuRdpGjIBEInZmzBKEZnlMY2C9fOg09i2c2X0oihfKySKGQElZ0ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967518; c=relaxed/simple;
	bh=uTvLvNOiD2VaPyg22uQpYQwhoB6nWQlo6kn+/rYg9tw=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fcw2wLXiXJgQj+3yv96QICQEHQs2MsjigmNFwJ94L4Ak2sx858LMUtadwySy4P943jkH0ryxpS4bLYke/83VtrPLekfjxdtdhoBucjAc1hUVseP81E4RpJ5MhicM04Q3IzZKyZn1pzD3i11XD4g0MI/+uwB9uJoTz58Hw3yM94A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XiLJ+LQ6; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XiLJ+LQ6"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-671061b015eso1218261d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:25:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788967516; cv=none;
        d=google.com; s=arc-20260327;
        b=UU2l6E2vYyW9gm7GlUKIMy/eyCWb+WRGETijzgka0qBDuPxF8Yem6110s/SdSUNKdr
         FLfgeyG3/wgjT916v7bnfjiWVZjVu9zXOow3lCNf1oFPxq5hMnZE5Z4cP7J35PT45ev9
         BrmmDPBANaGk/qSwAkjT525TsRVpN8/vi+pcxgrlcyEJCSytw4EcoAlyvn5Ensa5wHw5
         LXtPblyyqBuKyjcyOV7mPQX2RXMvJgVuiFvla+/5/YrqwzaQQsmbDPteZbC4SSibMOUV
         4Wx8kQ7/i6CqR4xYU/FdvjBFlwVOqNCUgYyuXKxuha4v5lK9mf3ZSwFZ68zGJhBAhOJr
         RjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=m4jJh3TX4gx98qaUfn3Q4oVt1KTvxUkS7IflLLQjx2I=;
        fh=zNMRzWwE60ssa9cwrsfnNFj29sQ2XW1niDo27b++lGc=;
        b=XUzHBmUumrWhrfwjkibsFiu001wnV1YsijmbKDEtEuITFS29oEtpgy5oYuE7fc1tkO
         acGpuotdGUuL4m+cxSg/0IU0zttAPiajTys0XXbiQU7SqccZ9GSbZx2VmpNNglzV8twK
         9eZd7zyl/MyQENq8cSJJF/U7MZMCW1LHq7h+W95ApaLvwNWQtEMHcK1ZMY+GdjbLAYxJ
         DyDW2k+tD7/KnUu6jxPyxoDnwkTfMBEjIKIA0HpRSaTUc1SprRvbyDSg1Lsc4exjgwz1
         cXFy0rwiOML0QBxybzIDT4ZAUsPGdusdSMjgMZoP+R2oowhjvI7TseocBKL4IzFEJmcL
         TkgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788967516; x=1789572316; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m4jJh3TX4gx98qaUfn3Q4oVt1KTvxUkS7IflLLQjx2I=;
        b=XiLJ+LQ67pKD/CPoxjWWN0BzTE8hA3RtMQTXlSJjvFNdNTjDGjGWcazbtvA6kzoUQE
         0kmMX1JoQ/a9U86L2bfn3RQbXEo0SVMbnjTw1DlmCxQTF3tBaei9a9G0D2zo5y4XcEDQ
         b8qX3PiMDU9SarF/w5UPgEvj1q5Cef18XWzaGiiHombmud9iUjbC0XhavuEEBJJHkp0c
         c13ObbAokZYfEZyLFX9XJXMmhbieyfcl26VmAyQ7RV6q+u7chi1nk4+5k/S4GH7XbgTA
         hqXJ04zXBSYQs9Vj9mTOvHCEZg7Mw/aY8RWR5zJXbqi7xaPOfmTHlR4nkeIeNBe4s+dw
         OJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967516; x=1789572316;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m4jJh3TX4gx98qaUfn3Q4oVt1KTvxUkS7IflLLQjx2I=;
        b=mH/9qIh8Bxe7t543nB19sFpXZoHkRM8C8QdC+FizNqmxA7as9BTmqLKrqdqHxtNQ2/
         sB9Pg+DAawbTEjLtSETfDp/PQEMQBT1d33F4RKQdDH4r/oxyilLWF4mbe3UkO2S0i+Ex
         ZFQIcINuZTUEQslbQiR67nbhRCCeODY4yfp8thTo6bCvc3Wa7OICRihauKzxy7TGVd6X
         GIDrbdue0kqWIylQskFQowiLcXI31FVrDm3iVFTwYZgF1SS1yej6j7oTRsBj5wQ5BJOs
         5sdYv0IReZ2qMcAOtLfwSpxMJ1oUpkfPeQlME5AcOPxZZMngku4wRctIueLzp67gIqBB
         ILJQ==
X-Forwarded-Encrypted: i=1; AKwUvByNzvBAujib+nJ1VrP+afcmiTSexmjCZjCjgtWcSgOzoP4sZYZ2JV2rKVKUyELGXeGXzHgMlm2V9aqKj5U=@vger.kernel.org
X-Gm-Message-State: AFuF++l+lT41F+B1FXUGZ9GcHcHxHO9zU1u9op2CiZxsxYAT2uZHU7/h
	+itt+zgTM0Czrg7LDBFW/05TmQtcswJi1+bJu5/VQk6aB4XdP8OMiF/JEMkN+gs+xV+amxIaSAb
	jaUixe0467jbHWEPbOZNGnApXKD8FklDIVGRBmi9N
X-Gm-Gg: AYBFou1Gog/PlYzoYU0Q4yrDnFziZJVGzdDiDIEh5OH/C9x+N/6AbOafrXb6VCp0Y98
	5EqOow6vXJphtNz2CVHbGj9bmIYxmW7kXMNsBGX9HM0rRWri7UHfd7MPemj+ucMbtdE7lLush4D
	s81l0fvCHbOaHpU8VMoZiBcKZlCt6scuhfZoAATzwqZYiOr+5Gyci/qzTvz2Jfn8uTU9oKLsF+/
	vCxDIJ96Ek2uPZMou0bhYlC1Zf9D+KDypFSOc4+nOviVBUWGT3xDK1P1vikkBEA74wWoT4GDPqy
	nYaQHY3rFVFBfVO7hW+35mqji3lbFnsfQCB5zJCnpSSo21XKCg2uaJ6SHB8JiouCvrvhsUfnKmo
	jX30aa0GOXT7P
X-Received: by 2002:a05:690e:d0c:b0:66c:c7e4:2ff1 with SMTP id
 956f58d0204a3-66fb59519a7mr10665340d50.15.1788967513698; Wed, 09 Sep 2026
 08:25:13 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 08:25:12 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 08:25:12 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <bd6c9c74-e374-a9d3-ba1f-8b6f430894fc@google.com>
References: <20260830-gmem-inplace-conversion-v12-0-85e5fd25252a@google.com>
 <20260830-gmem-inplace-conversion-v12-18-85e5fd25252a@google.com> <bd6c9c74-e374-a9d3-ba1f-8b6f430894fc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 08:25:12 -0700
X-Gm-Features: AcwNN1XO0ky4otDKucsugFRBan2HEERm69mRZ8ScY2_txSdjnOuds0rILhuqOBo
Message-ID: <CAEvNRgEkkvk11_atVj9=+OBym-7SbSMB7MpHcoN6-Q5KS3Lb_A@mail.gmail.com>
Subject: Re: [PATCH v12 18/45] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
To: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Randy Dunlap <rdunlap@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hugh Dickins <hughd@google.com> writes:

>
> [...snip...]
>
>> @@ -926,6 +927,7 @@ void lru_cache_drain_for_folio(const struct folio *folio,
>>  			*drained = LRU_CACHE_DRAINED_ALL;
>>  	}
>>  }
>> +EXPORT_SYMBOL_FOR_KVM(lru_cache_drain_for_folio);
>>
>>  atomic_t lru_disable_count = ATOMIC_INIT(0);
>>
>
> I don't mind about the virt/kvm/guest_memfd.c part of it, but I'm finding
> a KVM patchset modifying mm/folio.c there hard to deal with: and notice
> Sean also suggesting to separate this part out.
>
> As you know, I've worked up a patchset "mm/fbatch: drain lru_add_drain()
> and _all()" which finally removes the problem lru_cache_drain_for_folio()
> works around. In the initial version posted a week ago, there was no
> lru_cache_drain_for_folio() in the tree. Now 7.3-rc1 has it, so I
> intended a replacement 13/25 in my series, giving you just an empty
> inline lru_cache_drain_for_folio() stub (and enum lru_cache_drained)
> in linux/swap.h.
>
> But that won't work for you, if you're adding an EXPORT_SYMBOL_FOR_KVM()
> in mm/folio.c, and of course conflicts with my removals (in context both
> above and below your EXPORT line). It's easy for me to remove what's in
> mm/gup.c and mm/folio.c, but I cannot remove what is not yet there.
>
> I've wasted hours on this, hoping not to trouble either of you; but
> seeing now that I shall have to rebase anyway (an unrelated mlock fix),
> I'm electing to take the only clean way out: I'm going to submit this
> mm/folio.c part of your patch to Andrew tonight (with a shorter Cc list!),
> in the hope that it can be accelerated into 7.3-rc2 (or at least get an
> mm-stable stable base-commit id) which we can both work off independently.
>

Thank you! Will use this in the next revision of this series.

> Whether that's acceptable to Ackerley and to Andrew, I don't know
> (just as we don't know when either of our patchsets will go further),
> but let me try.
>
> Thanks,
> Hugh
