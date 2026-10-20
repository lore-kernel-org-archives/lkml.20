Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501174;
	b=CJLc7I5887uJM9+vEm2jvpX5MwN/ku+TPp4JjI3cmbMjB/sjvGxWaJdJjc8Z7eZWzc4A
	 8eVj9jK1dLubg2BaT/g6GBO7J32XV65aKTMmHm7k85Rf4XLa1a+gjruWoR8JOflqy0VjY
	 p7hBoegPlX5FzfRleyim//0OIUzfGUufHJ1TXYvAJa3SDJOlAidJNPi5YkuFdPf8nxqOJ
	 i2nyNv7THmOt3e5oaEgP7YvXtP4vjsVL5MOGqGrxb0uAUGCwg7MDhVa+qaubfS/QxcuAU
	 BXVT8GtZlbv6VxJqpyjROMLr9e9ecq0FbL/RWVIVazMb5GXqesFMFIFY2dZwYNVB8JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501174;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=T9RUmLmMu1KGYjGG2ltedL/onlV4Qx016VCDjCFQv/g=;
	b=hW1NnG2AXifrtsOcBVuVuJ1pa+cVIfoRY28BJg7hTiMSsp4Ezkc3hLoLGByHqjjtnqpC
	 1CPli2mdtESyTzSVUjIThILGqrjmfbE864c6sID4D6IkCWX4I+qEcx4eRVRdTqaSrqY/s
	 ntxMa3s0crNlwDcgwijZKMNX/gu+leG4Ex0pvL1XQ3kIsD9AOiRMwtnAW/1AIpZihI8zl
	 VTz42QXjnDcuzD+wor9Y9FMvTwQ2a9mXFXc3Jta/C2CzMvKrPh3dsplYRWddAW+Y354xE
	 77MU6mTKGh2AYABxJl0TIn6wBJO6I4f0uOPNK4n3x0FlRoHU98qvjKonEBFF0YBjYaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ny7xibCq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D33606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ny7xibCq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D0F91F000C4;
	Tue, 20 Oct 2026 12:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792501174;
	bh=T9RUmLmMu1KGYjGG2ltedL/onlV4Qx016VCDjCFQv/g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ny7xibCqSRC4KpUWk4NQfqIwK0iffFjwPWWzmNxQ1hrSEQRHhJTeBRNDhlOl9uoE2
	 /tThHfSCbz8U8niQDTCTdRaRCZPMRIkgNShXWTbS8ltb4u2W1RGIiRV9bd6Fr7NOI0
	 hZIU2F8u9khb7dIeu95F8gravV0Qbu8W4GFfSrh01mXDhXob5kCsHfDkJERkK2hJ+w
	 c/IX6vHYuGShkCcnbUiE+ku5Ss0O+68FgbzxTTHuQ3CPHbsVylpxGoWaarHg34++7A
	 dXpr6wj1L2jJ23hxEXgwj/M3RZUnCI9uVXBory1bQDQHsM2sALggSorc6I/ifM8Ntl
	 FhPK/gnhGiiew==
Message-ID: <58126141-6915-4abd-8e93-93c4aac474a8@kernel.org>
Date: Tue, 20 Oct 2026 14:59:30 +0200
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
Subject: Re: [BUG] mm/ksm: KSM merge drops userfaultfd RWP markers
To: shaos <shawnq1@163.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261020110757.960025-1-shawnq1@163.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261020110757.960025-1-shawnq1@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/20/26 13:07, shaos wrote:
> Hello,
> 
> KSM can merge anonymous pages in a VMA registered for userfaultfd write-protect (RWP), then replace an armed PTE with an ordinary accessible PTE. The VMA remains registered, but a read of the replaced page completes without the expected UFFD_PAGEFAULT_FLAG_RWP event.
> 
> The RWP PTE is represented by PAGE_NONE plus the architecture's _PAGE_UFFD marker. In replace_page(), KSM creates the replacement with mk_pte(kpage, vma->vm_page_prot) and does not preserve that state from orig_pte. The PoC observes pages_sharing increase, reads the replaced page without an event, then re-arms it and receives the RWP event again. A non-merging control keeps the marker and continues to fault.
> 
> The same replacement path also loses soft-dirty state; that separate observable is documented at https://gist.github.com/shaos26/9db36768f01eb83c6aa14ee9fc057388. This report focuses on userfaultfd RWP tracking.
> 
> HEAD commit:    24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> source version: Linux 7.3.0-rc7
> architecture:   x86-64
> compiler:       gcc 11.4.0, GNU ld 2.38
> QEMU:           6.2.0
> 
> console output: https://gist.githubusercontent.com/shaos26/e887665d7868dc323d73a1d678cacd3d/raw/e3e39212903e5bd5ba12f55a94ba7ae5b25bb238/console-output.txt
> kernel config: https://gist.githubusercontent.com/shaos26/e887665d7868dc323d73a1d678cacd3d/raw/3cd943ba8c6026b43ef016a37d07efd2533a317a/kernel-config.txt
> reproducer: https://gist.githubusercontent.com/shaos26/e887665d7868dc323d73a1d678cacd3d/raw/7fc8685bb0cc01fca488fc096d4859b8b70af3fc/poc.c
> 
> Build the kernel from the revision above with the attached config. Build the static PoC with:
> 
>     gcc -static -O2 -pthread -Wall -Wextra -o poc poc.c
> 
> The program is intended to run as /init in a disposable initramfs and mounts procfs and sysfs itself. Boot it with:
> 
>     qemu-system-x86_64 -m 1G -smp 2 -machine q35 -nographic -no-reboot \
>         -kernel build/arch/x86/boot/bzImage -initrd initramfs.cpio.gz \
>         -append "console=ttyS0 rdinit=/init panic=-1 oops=panic loglevel=6"
> 
> Two fresh positive boots reported RESULT=KSM_RWP_MARKER_LOSS_CONFIRMED; the close non-merging control reported RESULT=KSM_CONTROL_TRAPS_PRESERVED. No privilege escalation, memory corruption, or cross-process access is claimed; the defect is loss of the caller's RWP access tracking. I checked the affected code against upstream master f47d223627f8; this source path appears unchanged there, but I have only reproduced the behavior on v7.3-rc7.
> 
> Thanks,
> 
> shaos
> 

Always a good idea to look at the list before posting stuff.

https://lore.kernel.org/all/20261019010934.697895-1-samarth.colleges@gmail.com/

-- 
Cheers,

David
