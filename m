Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501204;
	b=DBZr6ohDS8ahoJClOIs34/DC2iKRa9+wx/DEujl6vmzWPiH6EmNXogQvH34RS71+PTWv
	 IMiraUlDcjm5Aa75F4Za7Fh7eFG95g7fA5Zz0tsG2oV2kSwBRzNeV50D+Pj33+tIGMUpI
	 EDAPSQyvszXl/9zx8dPI8Ajp2Ed8BLnvxNlxSMve+xhY7ZPY/A3daDMfKoPZwlqI0vqbj
	 ijIlNS2yTlJEVyOu167/yoPxkOEUEoIFgsuAStPgLhxWiF8hKBlvGC3ZhfKFVfVhj/HY3
	 GiJS8ToCLZVtAsQXybh4aLAYwr7ZcciwS1GU1RALqbscBFfq/P3kSnu0Zhgl66YzFgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501204;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=jeB9r41aTDoKdoA+kCZsJ2XWnJK4z4zZ4MkuJKrc1ow=;
	b=S6ZIJez/ss5W5Upipr5bAUcPUnXR01PTSeWtmXhx2WjrSHXld+EkZt4nClsd+Ws6JdIo
	 COoYM0iwlHXBeJJ9eh4FgOQYwPNpRfBCDsN1zVdhZLy7gPb1kyHqATv1lB4jUVvL4SPin
	 r30/c1awyGB8UEg11Z1BbvivPHOUBVmuB/WDKvLOK0dgMiUZuibqgSbwzeGF/xO7CgfDz
	 F20tYyHaI5cDtKBQ3Gyy5B88feovXXnJddgCSbfYlrqqLGn/RiBwCXilpO47QNB8uYr/Z
	 u9kO47dmYU9ysnJvOG2YHDJ8oQU/+Qm4vcdLQWR1t4Ezz8rEY3uGh/URZNlCzUpnJCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hReMojH2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CB5606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hReMojH2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 236841F000C5;
	Tue, 20 Oct 2026 13:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792501203;
	bh=jeB9r41aTDoKdoA+kCZsJ2XWnJK4z4zZ4MkuJKrc1ow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hReMojH2z5Fv4dGLKyixYESLgoxtiRUynJpJtAzqb3shE2lLmDBlTNCspH7vqWj9A
	 1/SZWmKQ2msnYMUGK/lWSQ5oA+Y1R9OwOqLSCK8K9UVdb6aCqmVCJCf+/NymzwB7n0
	 C2yK7DXZQjGkC+zl8iAm+PJs1PgejmG03zuerPFL92asiWatcLfJ1b12UuKTGLkEUs
	 hIS/PTom6O+tCIPTSF4h47w7Vx1hfb3JfAb9AKJ1wKbGIE0FY0NdO4M/DXvzqteRtF
	 440MPGH8lyFxY5XjzwgERy1jwMGoxpdSPgqytq6SRdI+kMCgiX+IVjZsR36tauwcI+
	 i7f1E4IJ0ryPQ==
Message-ID: <3a3e48b1-b5ea-4d73-806b-3c2801484b66@kernel.org>
Date: Tue, 20 Oct 2026 15:00:00 +0200
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
Subject: Re: [BUG] mm/ksm: KSM merge clears soft-dirty tracking
To: shaos <shawnq1@163.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261020110758.960048-1-shawnq1@163.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261020110758.960048-1-shawnq1@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/20/26 13:07, shaos wrote:
> Hello,
> 
> KSM can clear the soft-dirty state of a page when it replaces a PTE with a shared KSM page. After clearing soft-dirty state through /proc/self/clear_refs and writing to two identical MADV_MERGEABLE pages, both pagemap entries show bit 55 set. Once KSM merges them and their PFNs become equal, one entry has bit 55 cleared even though that mapping was written since the last clear_refs operation.
> 
> replace_page() builds the new PTE with mk_pte(kpage, vma->vm_page_prot) and does not preserve pte_soft_dirty(orig_pte). The marker loss can make userspace dirty-page trackers miss a page modified since their last checkpoint. The PoC makes both pages dirty before merging, so the result does not depend on which page KSM keeps as the stable page.
> 
> The same replacement path also loses userfaultfd RWP markers; that separate observable is documented at https://gist.github.com/shaos26/e887665d7868dc323d73a1d678cacd3d. This report focuses on soft-dirty tracking.
> 
> HEAD commit:    24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> source version: Linux 7.3.0-rc7
> architecture:   x86-64
> compiler:       gcc 11.4.0, GNU ld 2.38
> QEMU:           6.2.0
> 
> console output: https://gist.githubusercontent.com/shaos26/9db36768f01eb83c6aa14ee9fc057388/raw/59077135f035791493d6d487c9e619c16380518f/console-output.txt
> kernel config: https://gist.githubusercontent.com/shaos26/9db36768f01eb83c6aa14ee9fc057388/raw/baa5ee61ce748667104c480560ab5116a100e3fd/kernel-config.txt
> reproducer: https://gist.githubusercontent.com/shaos26/9db36768f01eb83c6aa14ee9fc057388/raw/06005564982eab5cbcec26c5d62ad86c7261a155/poc.c
> 
> Build the kernel from the revision above with the attached config. Build the static PoC with:
> 
>     gcc -static -O2 -Wall -Wextra -Werror -o poc poc.c
> 
> Place it at /init in an initramfs and boot a fresh QEMU guest:
> 
>     timeout 300 qemu-system-x86_64 -machine pc -cpu max -smp 1 -m 2048 \
>         -kernel build/arch/x86/boot/bzImage -initrd initramfs.cpio.gz \
>         -append "console=ttyS0,115200 rdinit=/init panic=-1 oops=panic loglevel=7 vivid.n_devs=1 dummy_hcd.num=1 netrom.nr_ndevs=1 rose.rose_ndevs=1 max_loop=1 comedi.comedi_num_legacy_minors=0" \
>         -display none -serial stdio -monitor none -no-reboot
> 
> Two positive boots reported RESULT=KSM_SOFTDIRTY_LOSS_CONFIRMED with equal PFNs and one soft-dirty bit cleared. The non-merging control kept distinct PFNs and both bits set. No privilege escalation or memory corruption is claimed. The affected KSM replacement logic appears unchanged in upstream master f47d223627f8; runtime validation was on v7.3-rc7.

https://lore.kernel.org/all/20261019010934.697895-1-samarth.colleges@gmail.com/

-- 
Cheers,

David
