Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596786;
	b=ieYXmkBIWtkfOa1XjkYfRQmvEs+0/Lu+iIC/eKNBro95wUhUdMUv6Y2VcvH2LWvMV9ck
	 iKRs6O2D68k0sJPG2HUsPCSSwHEChNYFd6OtZmA5QXU191sG9pGY4BpbbGHqWTIPCKwyU
	 A9egz0S4z0362C3/tYqB1WFxpdda4Kkh3LKsLszkW7yWg6CJBIybEStI4ADzYQ/jskWsw
	 G/VwVfs1bxkkqRiem6aIMT2lY8ybzaBoOrLK2QKbhXv76ezI35lHId5f4ScjB+q9Uvkb7
	 vXatsGU1ox6aru8eaIhvwM2m7ahymZYlZSVLtkxHThF6KcW2hLJS58Z6IRaH0JWxHeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=P+hij2RJGRcms9m3f7cKiI6fQXltPcS0EJhEbBOodTE=;
	b=lwPh0ingPkqeBnTYI4s+NrYomLwEyn25Xps4a4ExSmP1WovSP+s4u0xxtb927ZrDSKIK
	 a/k/B+s82RpeDw0ccDUsPqC/oLYez7z/4CgzDVauWpFpCVBScR+DSKVtje7OM7CgnWjBz
	 9B6Vzc7rKlPOYWaujMemYyQr7hfXa9w/9ChjsSQkMfo1YBmFhDayPYj77XY6cchoisqim
	 KkGAGvQAdbWFVBu5fP/DprtCkoYwp5Vqvd21yUoDG51HQdtDuR0HNzaaO0T7SFoAJKzg4
	 /rTuydOhF04bs42oAMFkHA8EnpQlet8eEU8LF0od009RhH/tQ0p9/tsZMg5xgJ7f2xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oBFv0g16;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA98606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BA98606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oBFv0g16
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49d64a88222so374885f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596784; x=1795201584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+hij2RJGRcms9m3f7cKiI6fQXltPcS0EJhEbBOodTE=;
        b=oBFv0g16ax/doGag1fbmlBD5jMji7uaIN0FWUNgHl88yM+BC8cWot96cm26a7D4VBt
         MxfME/7i5AO9juEUrb2796+zt8pN0wd0Odl5f5gOA3bRYILMs6i13iz5IEcnK5CI3eXt
         Z0uojPKR1+hx5hprkk8DAY8g3LRKWydTnKJoFNnXHoNX9xSkCZpUOVQO/kk14CALcfuH
         0MIoJ04DZrcxRXfvU19S4lhAIyBLiXJkN1Wti5Chg+APdc+B4Mj5Kbma2S+NwGfkwKcg
         muh2zVsxsojvRLbHtXORL6QDib5hGgJJ6e301LFE+SHnLDlXyOeLWwtyEbZqbmevGCd1
         fYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596784; x=1795201584;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+hij2RJGRcms9m3f7cKiI6fQXltPcS0EJhEbBOodTE=;
        b=tz8IVSelNh3VK/5mAX8jG9QVdNooaZO4RVlVqSUMb8nrhwT8XqrUD+A7oclUbditAX
         Rv2l7MyyWPKV0SeRk84laWNozSUY9dt4TU4tg/Wr4ScKsVIkLhjAaoyDHQdQQTM62Bu5
         +e91ZbrEhqLDYxuf+Ww9SALMPgoWkMpje8cY+VEHHUrZaUOvAsoENQPskmAXUs3J9xOO
         coPhZJyFcTo9WOX2FStSUJEr50XOix3PxCzOb4cWl8qDJop/5UgsqSFxCDEGcrcOwRV2
         iMrDi7meP1VwLyiu5YtH0tznms4Nk1Fq9AxCmzL4RmJ5AwMfsaodlYtvq5uv++WZcxJu
         5c8g==
X-Forwarded-Encrypted: i=1; AL+hErE/hpxVBtdmnBwToPbllO7zBkLpax0B80zUrOhpeX06lzNqFOEaIqCPkoTyvqyJsfpDIfQMciPAp6F6MIg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CF14LicvSvGRn1UQ0wWpM+2vZOGtOj71ttwoQTeB7ycPghvHC
	Dn+59aDWelBdbsz3VK/Om2TIPOXvC53SwGjBDNZ3MRBemKzjFnTzALxA
X-Gm-Gg: AYBFou1Xa5TTXsyH93t+cAI0YXxKQ17AEVz88Dae6xKE66F+Ei0zo+HQkzzfhnE1JaF
	AW00gGyawckxWLRw5ZYTYgQvme2Cef5YouacTlTxpwRxsDRRvxvr+CN0OmN95oxLW08TPWqIH3h
	CSH87gPwSVWNRJ2JMFvGu0+LDhnAxtpdQ8NXWYylaq/1DOIBEY3Lko65W4SYSnYw292O+AO4y+y
	0yLxrKf3Jh3yOSBzqzcJMxUDqp86+SF4lrN0iTFVs+tx1ZD1YGSL81HTXY0KnPGGQGbvwCHjxvK
	dSEaDD2KjHmkdPfXcEoW1RlMvRqOk4mZZP06r/irtr2L9/mWbi7wFoo79Pgtemaw8w0a4JDW+t9
	CZSAttYaGbWwqqQxZWYZ7juchhg2fkQYnKb0fiu1MXF+/XeOtbtUJckjIQHaVTACVoZJFn3pqlK
	KLkqU3sxLAD2XdGX72dfTTCLas9seAHp0LXPaqTUVj12cOIPpGS7D1cvoO6p8Xb3OUHnzUERyHS
	XOEKGVhwjjTQI/wXtdmBCAlo8Kk8XwpdPBzy4eI2++l3urLs4CbQx3L9g9hNdcZXjeErVSX7u9D
	7thJ71IxyQmr8CUmmHqCvevt
X-Received: by 2002:a05:600c:4e44:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4bb55c5f5admr66669225e9.1.1794596783524;
        Fri, 13 Nov 2026 11:06:23 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb566220edsm112996755e9.0.2026.11.13.11.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:06:23 -0800 (PST)
Message-ID: <8f4ab543-66ec-4aeb-8cc8-5279c317008a@gmail.com>
Date: Fri, 13 Nov 2026 20:06:21 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/userfaultfd: document RWP behavior when the
 PTE is dropped
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport
 <rppt@kernel.org>, David Hildenbrand <david@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Peter Xu <peterx@redhat.com>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20261113112806.109578-1-azpijr@gmail.com>
 <avcCRLX7unFGeaHf@thinkstation>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <avcCRLX7unFGeaHf@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/13/26 1:44 PM, Kiryl Shutsemau wrote:
> On Fri, Nov 13, 2026 at 12:27:42PM +0100, Jose A. Perez de Azpillaga wrote:
>> "Scope of protection" lists only the PTE drops requested by the user and
>> says the range has to be re-armed afterwards. On shmem the kernel drops
>> the PTE as well (page reclaim, collapse), and RWP has no marker by design:
>> the next access is a minor or a missing fault, and the user is expected to
>> register for those. Document this, together with the modes that sync and
>> async tracking need.
>>
>> The VMM example registers guest_mem with RWP and MISSING only, so a vCPU
>> write to an offset that is not mapped there can be lost during eviction.
>> Add MINOR to the registration and describe how the handler treats minor
>> faults.
>>
>> Link: https://lore.kernel.org/linux-mm/856cdf21-7982-475a-b244-a7ceff4eb6aa@kernel.org/
>> Link: https://lore.kernel.org/linux-mm/avWnaR7VVEGa7yNp@thinkstation/
>> Suggested-by: Tal Zussman <tz2294@columbia.edu>
>> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
>> ---
>> this is the first time I'm writing documentation, so I accept any
>> suggestions to improve it :) and I tried to follow the documentation's
>> own style.
>>
>>  Documentation/admin-guide/mm/userfaultfd.rst | 65 ++++++++++++++++----
>>  1 file changed, 53 insertions(+), 12 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/mm/userfaultfd.rst b/Documentation/admin-guide/mm/userfaultfd.rst
>> index 97daea83b7f1..19bdac668f93 100644
>> --- a/Documentation/admin-guide/mm/userfaultfd.rst
>> +++ b/Documentation/admin-guide/mm/userfaultfd.rst
>> @@ -384,17 +384,45 @@ normal missing path (``do_anonymous_page()``, ``do_swap_page()``,
>>  the population itself, co-register the range with
>>  ``UFFDIO_REGISTER_MODE_MISSING``.
>>  
>> -Protection is preserved across page reclaim: a page swapped out while
>> -RWP-protected carries the marker on its swap entry, and swap-in restores
>> -the PROT_NONE state so the first access after swap-in still faults. The
>> -same applies to pages temporarily replaced by migration entries.
>> -
>> -Operations that drop the PTE entirely — ``MADV_DONTNEED`` on anonymous
>> -memory, hole-punch on shmem, truncation of a file mapping — also drop the
>> -RWP marker: the next access re-populates the range without protection.
>> -Unlike WP (which persists via ``PTE_MARKER_UFFD_WP``), there is no
>> -persistent RWP marker today. The user needs to re-arm the range with
>> -``UFFDIO_RWPROTECT`` after any operation that explicitly frees PTEs.
>> +Protection of anonymous memory is preserved across page reclaim: a page
>> +swapped out while RWP-protected carries the marker on its swap entry, and
>> +swap-in restores the PROT_NONE state so the first access after swap-in
>> +still faults. The same applies to pages temporarily replaced by migration
>> +entries. Shmem is different: reclaiming a shmem page leaves the PTE empty
>> +rather than installing a swap entry, so the protection is dropped along
>> +with the PTE.
> 
> Migration is not anon-only: migration entries carry the uffd bit for
> shmem and hugetlbfs too. Keep that sentence out of the anon part.
> 
> And please call it the uffd bit, not the marker. "Carries the marker"
> next to "there is no persistent RWP marker" reads as a contradiction.
> 
>> +Operations that drop the PTE entirely also drop the RWP protection. Some
>> +are requested by the user — ``MADV_DONTNEED``, hole-punch on shmem,
>> +truncation of a file mapping — and some are initiated by the kernel on
>> +shmem: page reclaim, and collapse into a huge page by khugepaged or
>> +``MADV_COLLAPSE``.
> 
> I would not list them. The list is not complete: splitting a PMD mapping
> of a shmem THP drops it too. The next tool will find the path that is
> missing and report it. State the rule instead: on shmem the kernel can
> drop the PTE at any time while the page stays in the page cache or swap.
> Reclaim and collapse are examples.
> 
>> Unlike WP (which persists via ``PTE_MARKER_UFFD_WP``),
>> +there is no persistent RWP marker, and this is intentional: once the PTE is
>> +gone, the next access takes a page fault that userfaultfd can deliver, and
>> +that fault is the notification. Which fault it is depends on what happened
>> +to the page:
>> +
>> +- The page is still in the page cache or in swap: the access is a minor
>> +  fault, delivered if the range is co-registered with
>> +  ``UFFDIO_REGISTER_MODE_MINOR``.
>> +
>> +- The page is gone: the access is a missing fault, delivered if the range
>> +  is co-registered with ``UFFDIO_REGISTER_MODE_MISSING``.
>> +
>> +WP cannot use the same scheme — a minor fault would trap reads as well as
>> +writes — which is why it needs a marker.
>> +
>> +Without the matching mode the page is mapped back silently and without
>> +protection, so what to co-register depends on the tracking mode:
>> +
>> +- Sync mode: the access would be lost. Co-register shmem and hugetlbfs
>> +  ranges with ``UFFDIO_REGISTER_MODE_MINOR`` (and
>> +  ``UFFDIO_REGISTER_MODE_MISSING`` if the file can have holes), and
>> +  anonymous ranges, where minor faults are not available, with
>> +  ``UFFDIO_REGISTER_MODE_MISSING``.
>> +
>> +- Async mode: neither is needed. A page faulted back in is mapped without
>> +  the uffd bit, so ``PAGEMAP_SCAN`` reports it as accessed.
> 
> The registration is fixed, the mode is not. A context that switches to
> sync with UFFDIO_SET_MODE, as the example does, needs the sync
> registration. That has a cost in async mode: minor faults are always
> synchronous, so "async -- no vCPU stalls" in step 1 is no longer true.
> 
> Getting it back would need MINOR to follow UFFDIO_SET_MODE: in async
> mode, map the page and let the next scan report it as accessed. That
> could be a future project if the stalls turn out to matter. For this
> patch, just fix the comment.
> 
>>  **Fault Handling:**
>>  
>> @@ -486,10 +514,16 @@ never traps on its own ::
>>      ioctl(uffd, UFFDIO_API, &api);
>>      if (!(api.features & UFFD_FEATURE_RWP))
>>          /* RWP unavailable on this kernel/arch -- fall back. */
>> +    /*
>> +     * MINOR: an offset in the page cache but not mapped in guest_mem
>> +     * would be mapped back without a fault, and a vCPU write between
>> +     * the pwrite() and the hole punch in step 4 would be lost.
>> +     */
> 
> Not yours, but the "if (!(api.features & UFFD_FEATURE_RWP))" has only a
> comment as its body, so UFFDIO_REGISTER becomes the body. A second
> comment between them makes that harder to see.
> 
> Adding {} around the body comment of the branch can help a bit.
> 
>>      ioctl(uffd, UFFDIO_REGISTER, &(struct uffdio_register){
>>          .range = { guest_mem, guest_size },
>>          .mode = UFFDIO_REGISTER_MODE_RWP |
>> -                UFFDIO_REGISTER_MODE_MISSING,
>> +                UFFDIO_REGISTER_MODE_MISSING |
>> +                UFFDIO_REGISTER_MODE_MINOR,
>>      });
>>  
>>      /* Tracking loop */
>> @@ -550,6 +584,13 @@ progress. After ``fallocate()`` punches the page out and ``UFFDIO_WAKE``
>>  fires, the vCPU retries the access, faults as ``MISSING``, and the
>>  handler resolves it with ``UFFDIO_COPY`` from storage.
>>  
>> +The same holds for an offset being evicted that is not mapped in
>> +``guest_mem``, except that the vCPU blocks with a
>> +``UFFD_PAGEFAULT_FLAG_MINOR`` fault, which the handler leaves pending until
>> +the page has been punched out. Minor faults on any other offset are
>> +resolved with ``UFFDIO_CONTINUE``: the page is mapped without RWP
>> +protection, so the next scan reports it as accessed.
> 
> "Any other offset" is too broad. A cold offset that step 4 has not
> reached yet will still be written out and punched. If the handler maps
> it with UFFDIO_CONTINUE, a vCPU write between the pwrite() and the punch
> is lost. That is the case MINOR was added for. A fault on any offset
> this pass will evict has to wait until that offset is punched. The same
> goes for RWP faults.

thanks for the review! I'll address all of it in v2 :)

-- 
cheers,
jose a. p-a
