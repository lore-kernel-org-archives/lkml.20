Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40816431E68
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792136494; cv=none; b=WRWXooyjcrZ7si+NVPaZXp2aQQo8nn70aR4U4ZcvVW1pOH5IgFgZaxvy1r0xWggk2DW0MkBsulUIyOhn7lK4MnQV/ukF+SQstcXoD1/I/pcbStdVHXmVGJE7AyoiC2ep0g8FR90E4LeY/lj2cVpFMOh+g2qSogEOPeAR63UjR+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792136494; c=relaxed/simple;
	bh=kPWxjPPGP6jtCzLfvrCUv5Tgos0ZJM+YpPBR+U1ld3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AVzv87FdQqiuRfXhqdYW/pqI6fpnIJbz9f6l96wr+DOajbtaJft9rHEk2pNjVHlwwmpbFPU9wdSH15DJVXjBCtvJe9Ysc/6edeNwtuIUvAkC0QodRbIXnkZoi6mDyrw6iShbunDYtNYbPrrevwcKsT1nvtOyU4nxoJ4s62BnV4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1rnitbR; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1rnitbR"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dee593f18so932639f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792136491; x=1792741291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TOTRRbTqkUt5QQM9REwuEs6V4HIikB0VLV6DTKCbGLE=;
        b=q1rnitbRaE98pF2VdWAg2pjRgF6e2LmA6favMjYHCAxzmstcG1l7dpjpqfmh4LNGOT
         mxNYPixaPt5l7oJKEar8oVUVFFbdGHLy7LbwVpU6XeZIavWgVEfH4Zmdwtq9AuXe+u5p
         CoWT93CeYbEtVC+jp4Msip4mseIjvpepGHQyVsEHRfVI0P57+KTtKza7URwALH5qFbU2
         XtxPc4S+XI2wF+SrM8EqCpUTg2gAHPchhhNpXh3UFfCXreIT5+3o3l5xmS5M2FUacqpQ
         sngDv/M5vpT9i5RsuU+pH5/QUZLvYZRwNDKlQK01P4/4ll23OP5xE/O6tnlz0JPERvRT
         upSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792136491; x=1792741291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TOTRRbTqkUt5QQM9REwuEs6V4HIikB0VLV6DTKCbGLE=;
        b=N4nUZMuk/zF3YmWdd4aVDAbBn3m4THWEdWr5NtHZnMU7MIeVlUK/IdLiNtgdSA37wA
         2FccCKaEJjN6zqWvsnKGHTQVULcgsu9Ip/+D1V92NVKoQIcmTUH3+MSdRwEm/1mfqaA6
         NvNUBX/l2VNZu6ZPRqBa3xFUM57QsQS7pALjGWNAGOl35TRnbxKyx90tSaEt0xFlcVfG
         Zv1qfd97gWw15nefeb0uVcU9hHyuMHIfD5uevRucunn4IEGGIy0FqVYMgsw8Hr4OffXc
         YY7v7frEUrOcy9xajVquxAY6hTrfamphlcDkmBy82InpR3JMCgxdEVSBmF/uu8NYBIPc
         Ujrw==
X-Forwarded-Encrypted: i=1; AKwUvBwtOkk7GVLow/y7ZPBH4Rq2sZCDj8W9RA7WfpPDMORDssYWufA4SlE7KxffT+UcZ9OfYtajglQJxWyRrcg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjf5mDop/6DDKPJeZqw3m+vv+HRCy3wKzgNeWpJbbSYf0APTXs
	vDy6zNg0kUT4SvKG+6oB0kNr6Qnspw6AzVwY5lU6/KsTyHKq1iDRQm8+
X-Gm-Gg: AYBFou2f39Ri/QzDkSfZS6ptNajSWqbK2YW/lXjGO5W01q06eeH4hS88GZgJu1XK8yx
	zfi1pQw0nG05/XOj2nYPXlNEEFL/9erzT1BTn1K5S9VuaL1aHPYjgI84cugNB8XeRwY2GDgiLnQ
	ef2pvM9+lPWI5N/QeGTsLA/97uUquPPn9o8qQYMRFpf9exo20ZmLTmmIJd4KXwNcJkkNYGTnE76
	jYajjkGKud/4iIX2LVU7Yvwxsz80ZZqfs8QNE3wJixCHklwlrZNQTPsiM2ER9ggs+TwbPrgPK2k
	IROeLAT/BK9X9tV/b/wwR1G7cs4kdgMe38YTdKBlWry53WNA7QBQonmccZoeT5lvx/2xPluccPF
	qdcLYq9GXgDiA/J5B/AmLKcnpQfWUHkh+/4yDbW68LmkugNaWa+vvRe0qAHswHmo6KBTJRnX6Tm
	2DELn23NNJqMBffP9kv4fbd4uuB5+HVkTz2mU3KGHnQjip8EqGmYAusA6563FJD293V6JuRJmQV
	ZvxEg3TJgaD2+Ob0sE/qKqK4YqsNN5VN2WojdVqCou7VScjfpQ=
X-Received: by 2002:a05:6000:178a:b0:48d:fd4d:7fbf with SMTP id ffacd0b85a97d-48dfd4d8272mr3048376f8f.4.1792136490979;
        Fri, 16 Oct 2026 00:41:30 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a35sm2822036f8f.7.2026.10.16.00.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 00:41:30 -0700 (PDT)
Message-ID: <f5548d05-5aec-42d0-b9d9-c14fb575dec9@gmail.com>
Date: Fri, 16 Oct 2026 09:41:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vma: avoid spurious write locks when mm->mm_lock_seq
 overflows
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daehyeon Ko <4ncienth@gmail.com>,
 stable@vger.kernel.org
References: <20261015-fix-vma-lock-overflow-v1-1-01beb245d9da@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261015-fix-vma-lock-overflow-v1-1-01beb245d9da@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/15/26 10:31 PM, Lorenzo Stoakes (ARM) wrote:
[snip]

> The reset, performed in reset_vma_seqcounts(), only needs to WRITE_ONCE()
> the value. The stores follow the smp_wmb() in do_raw_write_seqcount_end(),
> so a reader observing a reset value also observes the VMA modifications
> made under the write lock.

the writer side looks fine, but what orders it on the reader side?
raw_read_seqcount() is just an smp_load_acquire() since d0dd066a0fa2,
not the smp_rmb() the comment mentions, so the earlier
READ_ONCE(vma->vm_lock_seq) isn't ordered against the later vma reads.
couldn't a reader on arm64 see the reset 0 with the old odd
mm_lock_seq, pass the parity check and read stale vma fields? would
smp_load_acquire(&vma->vm_lock_seq) be enough?

[snip]

> Cc: stable@vger.kernel.org

the parity check relies on e5e7fb278e59. before that, mm_lock_seq only
increments on unlock, so locked values can be odd or even. should this
be limited to 6.14+, with a note that older trees need a different fix?
a straight backport of the odd check would ignore write locks taken on
even cycles.

[snip]

> +	/*
> +	 * The VMA seqcount is always odd if locked. An even value can only be
> +	 * the zero stored by reset_vma_seqcounts(), never a write lock.
> +	 */

vma_lock_init() now stores 0 too, so this isn't quite true, is it?

[snip]

> -static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
> -						    struct vm_area_struct *vma)
> +static struct vm_area_struct *vma_start_read(struct mm_struct *mm,
> +					     struct vm_area_struct *vma)

is dropping the inline intended?

[snip]

> +EXPORT_SYMBOL(reset_vma_seqcounts);

since it has to be exported for the inline mmap_write_unlock(), would a
__ prefix make sense, so nobody calls it outside vma_end_write_all()?

I tested it on x86 in qemu with KASAN, lockdep and DEBUG_VM on top of
mm-unstable and saw no issues, but I'm hesitant about the points above.
happy to give a Tested-by on the next version :)

-- 
cheers,
jose a. p-a
