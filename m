Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501210;
	b=qoaal2sHnrhpGS9m7uz7/54QclxQlQceNzCAS4Dp56VbfyR+G4eA32Z0VUiqAtUTXatJ
	 9G5Cn3pB96gVFkpqNVjDyAy6Jd5KHUtaTUlbDiJie2eJNrqQ8SCXXKrjLt+oJe4pfYznS
	 5V8xY6aKBopjUEl51mRaUywlF+zARd0Gf/DLekR08f+//MROtq5Tcq5o/nrhdDpiQUuJ/
	 vOhlmZXjUg+LOc1yEyg8iysKs9DO2etdxuiiXKmEQDl+EZX3MAfz+cjObQSHhYdN5JOeI
	 PhTilddxTdR9W74ovGVQNwuIYR/cGW5N+YEHXc00AYaZQj5SzBbOCLeKcxiVW1+/kkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501210;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=0SlxZ5UQXu81xsFhH9I1ceqg/5A7Zf9sbax9KJqUchU=;
	b=fpz2IhJgWqddxjSW/kdd4c827J0LdfwEl3zbQ3VjnGtu+J9mzRENZxoU70dKNkMdVvpZ
	 eJYO1H1a4TCTRlynguMzIjAwuZdtoLtPPsO97cVAMH+zEZlIUhIrXyIJyZFesuOVW3hG4
	 0H0l3fIXW95a5h7Sw4vPc3pd2HHTW2hULYKxfxUL5U8CjOWNXAPvfgitqOD402n419rg1
	 QSIizOMkyVhlKtcWmCs3cryTlLpeL32EOOYHbRXrQGccDM+Js3/JFISJRHiZGKFx3ZM46
	 duCiLxbOpAJhrbgSE8433wGTXoPZ2Y9VVVoampImtcN7hlmn7hmtP5Az14w0rqQyUFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=htGvWvY7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9E8606A327
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=htGvWvY7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 877C71F000CA;
	Tue, 20 Oct 2026 13:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792501209;
	bh=0SlxZ5UQXu81xsFhH9I1ceqg/5A7Zf9sbax9KJqUchU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=htGvWvY70hcOTpY92QXwy8gTYzLILBSSisBX8mhP1sRKfYjNS6z09IxQOvQBMZm7Z
	 HaiPFoXiUlsj7EF2GdaS3DckfqOcJlBx5eAZmOR8drqfoFb1OWgj9srtF825m7IO+G
	 2Eaa29YIujwB+KexjanWX0jOM/ig/GHCHk1O6MUJy129SfiOabCY5J6Lon+eKe8DrT
	 sBmXMH+3Uvvj+ga2A8kvkYsvuv9M9lWU91nP0W7O5WrUUcq2Tdle92kI5GZ3TTrE5n
	 ZHCbpxm/cqjOqbaze53ai+CDC6++u7Q2WEtyGk8SYfmQdNa1RRwiF/MTjbhIAWLfTz
	 2KkdmVuPKPb7A==
Message-ID: <3c80ab1a-d86d-4986-bfae-d513734a0d90@kernel.org>
Date: Tue, 20 Oct 2026 15:00:07 +0200
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
Subject: Re: [BUG] mm: userfaultfd RWP drops a populated shmem PMD
To: shaos <shawnq1@163.com>, akpm@linux-foundation.org
Cc: Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261020110759.960089-1-shawnq1@163.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261020110759.960089-1-shawnq1@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/20/26 13:07, shaos wrote:
> Hello,
> 
> UFFDIO_RWPROTECT_MODE_RWP can return success for a present shmem THP mapping while dropping the PMD mapping instead of leaving the populated page resident and write-protected. The next read refaults the page and completes without a UFFD_PAGEFAULT_FLAG_RWP event.
> 
> The PoC verifies ShmemPmdMapped=2048 kB immediately before the ioctl. After the successful ioctl, smaps reports Rss=0 and ShmemPmdMapped=0; the read completes with the original byte and no event. Re-arming the refaulted PTE and a separate 4 KiB shmem control both produce the expected RWP event. The observed issue is loss of the mapping and protection tracking, not corruption of the file contents.
> 
> The source path splits and clears the non-anonymous PMD for MM_CP_UFFD_RWP, but the retry does not repopulate a PTE table because pgtable_populate_needed() only recognizes MM_CP_UFFD_WP. The ioctl nevertheless returns success.
> 
> HEAD commit:    24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> source version: Linux 7.3.0-rc7
> architecture:   x86-64
> compiler:       gcc 11.4.0, GNU ld 2.38
> QEMU:           6.2.0
> 
> console output: https://gist.githubusercontent.com/shaos26/3c336ea98e1e8fe09b5270c3a82ca268/raw/da13df3db0c05df09952f74bedb457f57c53b78b/console-output.txt
> kernel config: https://gist.githubusercontent.com/shaos26/3c336ea98e1e8fe09b5270c3a82ca268/raw/baa5ee61ce748667104c480560ab5116a100e3fd/kernel-config.txt
> reproducer: https://gist.githubusercontent.com/shaos26/3c336ea98e1e8fe09b5270c3a82ca268/raw/420975783e9d5dd88bc4a69190d8ef194faf5fdc/poc.c
> 
> Build the kernel from the revision above with the attached config. Build the static PoC and initramfs from poc.c; the program is /init and creates the shmem mapping itself. A fresh-boot run used:
> 
>     timeout 300 qemu-system-x86_64 -m 2G -smp 2 \
>         -kernel build/arch/x86/boot/bzImage -initrd initramfs.cpio.gz \
>         -append "console=ttyS0 panic=1 oops=panic loglevel=7 kfence.sample_interval=0" \
>         -nographic -no-reboot -monitor none
> 
> Two fresh boots reported RESULT=RWP_SHMEM_PMD_BYPASS_CONFIRMED and exited cleanly. The affected code appears unchanged in upstream master f47d223627f8; I have only reproduced it on v7.3-rc7. No privilege escalation, memory corruption, or guest escape is claimed.
> 
> Thanks,
> 
> shaos
> 

https://lore.kernel.org/all/20261019010934.697895-1-samarth.colleges@gmail.com/

-- 
Cheers,

David
