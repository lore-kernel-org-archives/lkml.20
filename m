Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B8B440652
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139691; cv=none; b=YLtu/WVpbB1R1V7bR8N6X3KfQjU2mSG5R3/OJnqYaxMnMJ/EirDm8bsJHDNnZ70BwKGHd2KGAPWQ508uqJfdZc8jEZQzI8yUaD0wkPL1OdddcjhJat84thTJnS7y3+bWKvBUIDzmfPALUhdlm0MbycmaHYjdStcKTfBuL6itBWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139691; c=relaxed/simple;
	bh=SSuj8LFNZYXIFKUXZ+/sSEiSbuuweVosXf8LwS8ZC/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LNb0oScxuBnzv+7Fs7pxSpMbgm8bG7bkl8+sIzgOLz7Yw6GjovaWGRnYuLy1ZPz3t9Q0HmDPrfmM0qCk/VVBhhIhB1sZzwIUSllEjPmpvxblVfvbczSGPnPewsywo8yaoM/r+V/QNG8Dp5bicG/uxvaUci7iCPq8UysPTIzU1F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bz1tlsBk; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bz1tlsBk"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1082893f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792139685; x=1792744485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wp1mQzm08hLd1tOFds5YVaqYtr/CBX6Juw0wzqMGF6M=;
        b=bz1tlsBkVICkne6Lr9EjstwCvfK9avY+wyF8HoAEY4m1WjaNY/V+4ftyNu/BS8mYxa
         XsC1g3WhgVS3Ui6p/odIHOkJkSymZ9rm/EyZ5R1AI+EMVAH1RRz8HqWkb2whZggXuJmE
         zx+VZTlE3TMsPtAc4cqKawSQR3Z2PfSYlFgvb4/l4db2kt+l/Qz8BY+k4o/ms1CKo/WC
         YbPjIa12wYjd+9wZaIHApjYnHNes62dIAGhVk2Sb6jppdi6VTRmALVbrm2Wh0QzdWSnk
         EPA7d0qy5KRItOH7JqiWD48Qm4iVQIxJS3zWzurcTvijwbVq8g1c9OwcKOkeTsF8ga8A
         NpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139685; x=1792744485;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wp1mQzm08hLd1tOFds5YVaqYtr/CBX6Juw0wzqMGF6M=;
        b=iVaNQrBeV16325DvAy5BrQR/Nbmiq5HvrXUZK0bSIrXNyiKaTZXVfG5qeuoGuv0l3w
         IiEun8iL03M39IsSbDApVi67OWWlRiLpNOWlRS3tUQbeuKCtr2Ut0IBiNo8phuWHMtLy
         chZFy0kG+XGmIJNMNzCBlEevG+lVj8KkBp93dd5WbuWL6d7PkXbhS44RwZtbz1bP2yO5
         +uSp4sIYE2fNqWHFhfeHhckH4RXznwqkmcclyqb5iwoWxVSNCOsq4UVuTwxJnSNE7NrO
         Ib8xscnLedScl/4RyE+t1XZFBMwOpKpwOYum6vR7UqWVT2UXmrosE30UyJcwsQuIHPen
         dWxw==
X-Forwarded-Encrypted: i=1; AKwUvBx94wdtVYoMJkvFvlxnytujzFuQ/MWCZCfAsq7MxA8ThSzPbjFWtw9rJNe3Cx5ycVBmLGModXQqqJ1Q3yc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNDSSUT13DM+RLmSPv0GqhiLcEnp4t0E990JBhPPVJL8igqt6z
	WkvuaM4LO+OpLbCBjgGFJpONhvLy07H3DvCo63zpIPE4kF5kMzj5eynN
X-Gm-Gg: AYBFou1YsjhQp2gUMPm/hGeL9V8h3D++rPcthM24Ar4gFhnrBqchAjBT5Q9i0lG5vIX
	VYqBqapFeXQAhu21uFUQSNJyA6BPrq1qu9uMnEqhv9paD2sbPuYUst9Yad12xwgCywDhZChnNTk
	dzQxOuHUIsN1YIvc7mTgfMSyyAIx9gLEi0emsN/1PVMfttaTlqLmpNiGEIa1hivZJiAljtnLDta
	fQ8qbfAwI7HBtMPhY8pVntbkbrg2iDb+yMo5bDaE/wVZrcZSgAJRH9sSC7Oc8RtdwzOoeLbaTyH
	5GE9eah4/H4UIet3do+cEzTXba7G19KJIA0ec6ZbyS6q6DYGZYsxPo6gQKHXOw6vLT2xpBfs5R8
	TAFbeiO9PrxIAAioscU62Cvj2gZ/OyTgnI4YnwjcwB2Z9B1XbVpLI+I+6VKAR4mTIAoaEwvhP28
	R2T8VsbUuPrURr6u8vTl3aSnbJMK/e/xo2ROPqOWic4oHAosdONfqznrkjv7aqh9sBJA==
X-Received: by 2002:a5d:5590:0:b0:48c:6cdd:ba89 with SMTP id ffacd0b85a97d-48dbaaefa6emr31965430f8f.36.1792139685280;
        Fri, 16 Oct 2026 01:34:45 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm3422534f8f.42.2026.10.16.01.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:34:44 -0700 (PDT)
Message-ID: <80ce78ca-d971-4530-afa7-43b0b4a175d1@gmail.com>
Date: Fri, 16 Oct 2026 10:34:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] mm/vma: don't leak the commit charge on mmap
 failure
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Miaohe Lin <linmiaohe@huawei.com>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>, Adam Litke <agl@us.ibm.com>,
 Mel Gorman <mel@csn.ul.ie>, Rik van Riel <riel@surriel.com>,
 Peter Xu <peterx@redhat.com>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261015-urgent_fixes-v1-0-42796911043b@kernel.org>
 <20261015-urgent_fixes-v1-1-42796911043b@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261015-urgent_fixes-v1-1-42796911043b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/15/26 6:07 PM, David Hildenbrand (Arm) wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> When an accountable mapping replaces existing mappings (MAP_FIXED),
> __mmap_setup() only charges the difference between the size of the new
> mapping and the VM_ACCOUNT pages it replaces. It then zeroes
> vms->nr_accounted so that unmapping the old VMAs does not return their
> charge, which now backs the new mapping.
> 
> If the operation fails after that point, the error path returns
> map->charged, i.e. only the difference. By then vms_clean_up_area() has
> zapped the page tables and closed the old VMAs, so
> vms_abort_munmap_vmas() cannot reattach them. It leaves a gap and
> finishes the unmap with vms_complete_munmap_vmas(), which uncharges
> vms->nr_accounted == 0 pages. The old VMAs are gone, the new one was
> never created, and the charge of the old ones is never returned, not
> even when the process exits.
> 
> No privilege is needed to hit this, only a file whose mmap hook fails,
> for example a socket (sock_no_mmap() returns -ENODEV):
> 
> 	p = mmap(NULL, len, PROT_READ | PROT_WRITE,
> 		 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> 	mmap(p, len, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_FIXED,
> 	     socket_fd, 0);
> 
> Every iteration adds len to Committed_AS for good. With
> vm.overcommit_memory=2 this lets any user make all further accountable
> allocations in the system fail with -ENOMEM.
> 
> Once the new mapping has taken over the charge of the mappings it
> replaces, it owns the charge for all of its pages. Record that in
> map->charged, so that the error path returns all of it.
> 
> A failure in __mmap_setup() itself is not affected: it happens before
> the charge is taken over and the old VMAs are reattached with their
> charge intact.
> 
> Original fix generated by an LLM and sent in private by Josef.
> 
> Fixes: 4f87153e82c4 ("mm: change failure of MAP_FIXED to restoring the gap on failure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> [ david: call variable "uncharged" and make it const, adjust/simplify comments ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

this LGTM.

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
