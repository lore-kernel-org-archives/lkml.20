Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514072;
	b=QqsDZav9qgYm/cg9W+ZwanBBz4ZeI6VN1JlMI//cGyu3EN5B7E9wSAv/ewlRCPwn8yzp
	 VrujRXnlNexflP0v3mWmXZ/BYDc+soCkjBhLV5NWn5bH13x0ULH99fydFSXyY5uDEQxqJ
	 MZlm21d3JMnZDh7AqIL/6bZVSy40MLTjzIiAZAX8q5iT3yHnRBVXwVLUSwbjCCOnCF6g7
	 hO8m1KEU3s+CzJRT3hEtfgGNL+IMF5K0fH6Nsj+205lchphx/tkX0RShx0k95xXp8JS/5
	 lolxMQjRjVv8oIGN/Ywk75xHOh+3GL6Da5vTBp80PETTfQrqchMLRyf0RT+wtuiLdJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514072;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hHqjIUhFvpVsVhV+I45YnU6GX4Mvwsm4gRW3Mvd2/jY=;
	b=aw1k0a8IL/KL2jlgtHfWTBK+gYjtsAs1KPbrsBYTFs1KbvH+N0iqzKzs2GPkeViUh0Cx
	 HT9zHF/22qld4K2f8TY0WOnS7cTaMboRDCvOb9pKAcDjN51gmeRwfpVMEIKH/PWwpGDKZ
	 n8aVpWuwYk8vpk8fMb2bzuReF1Bv0gCq2rhKG61T6NxBKWg2fgg4b7FgN7Xcv9uD4yxMI
	 wejQ7BR//Mo06lwNbWOVToTN/pZcUOzQYSywSajXxaGVw0VegrQjZ4d7+zKVHxg4zfo2X
	 nAMgTXpPmQNH8hOwPdWPzL8tQNZFnBKJuQcDM45BQF5STaipdaN+bazqVglkQz7hG2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MI6QgEO7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D77606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MI6QgEO7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9C81F000C4;
	Tue, 20 Oct 2026 16:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792514071;
	bh=hHqjIUhFvpVsVhV+I45YnU6GX4Mvwsm4gRW3Mvd2/jY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MI6QgEO7Qy5M5PYZMphw20mRiOi8/KO4htwUkAd/ccDBKZql9WT3W+ZEN7RVwN/Sx
	 U6TSVS2tToYfivZyDXihd5ZL+XatFZDL5/HLDP88POXLNJgXjJJizBl1NqB3vqEnOD
	 qmZRLHOhsHWPVyZ0nWAjEg3opj6MKlQjXcYGhGRFpU4EW3ihbQPM+PS19EQ7RVZTIP
	 XA91ZMgjcXzBRYVgh70zCC/TOt/pqhva0mPqWyeDrM+2Rd1OddxKK75vnnpI1Jrqpk
	 97iBi34fsYO4bSHzVilBadICPvyu+JElT5WSrFgNfNmCnssaUaJeoO+/gKrp+aOxky
	 IKWu4LiprgO0Q==
Date: Tue, 20 Oct 2026 19:34:19 +0300
From: Mike Rapoport <rppt@kernel.org>
To: shaos <shawnq1@163.com>, Kiryl Shutsemau <kas@kernel.org>
Cc: akpm@linux-foundation.org, Peter Xu <peterx@redhat.com>,
	Liam Howlett <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] mm: mremap merge clears RWP state from an untouched
 neighbor
Message-ID: <ateYC2eXPHuy3HK1@kernel.org>
References: <20261020110748.959870-1-shawnq1@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020110748.959870-1-shawnq1@163.com>

(adding Kiryl)

On Tue, Oct 20, 2026 at 11:07:48AM +0000, shaos wrote:
> Hello,
> 
> An adjacent mremap() can remove userfaultfd RWP handling from a
> neighboring VMA that was not moved. The moved VMA and the existing
> neighbor use the same userfaultfd context, and UFFD_FEATURE_EVENT_REMAP
> is not negotiated. When the destination merges into the neighbor,
> mremap_userfaultfd_prep() resets the context on the expanded VMA,
> including the neighbor.
> 
> The neighbor's PTE remains PAGE_NONE with _PAGE_UFFD, but the VMA loses
> VM_UFFD_RWP. A read that delivered UFFD_PAGEFAULT_FLAG_RWP before the
> move then completes without an event. The same-mm PoC reproduces this on
> two fresh boots. No-move and nonadjacent-move controls retain the RWP
> event.
> 
> HEAD commit:    24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> source version: Linux 7.3.0-rc7
> architecture:   x86-64
> compiler:       gcc 11.4.0, GNU ld 2.38
> QEMU:           6.2.0
> 
> console output: https://gist.githubusercontent.com/shaos26/3b44971d9385a0cd18cfbf2e9bd730c6/raw/368568c2dd47417b54a957c8d9cc09f77f28b236/console-output.txt
> kernel config: https://gist.githubusercontent.com/shaos26/3b44971d9385a0cd18cfbf2e9bd730c6/raw/4989bc843fa61b5eaaaa53422238ec39e4356b70/kernel-config.txt
> reproducer: https://gist.githubusercontent.com/shaos26/3b44971d9385a0cd18cfbf2e9bd730c6/raw/109dc86c28debcaca07aedb2d450ed1e95ae5edf/poc.c
> 
> Build the kernel from the revision above with the attached config. Build
> poc.c statically with pthread support and place it at /init in a minimal
> initramfs. The positive run and controls use:
> 
>     timeout 180 qemu-system-x86_64 -accel tcg,thread=multi -cpu max \
>         -m 1024 -smp 2 -machine q35 -nodefaults \
>         -kernel build/arch/x86/boot/bzImage -initrd initramfs.cpio.gz \
>         -append "console=ttyS0 panic=-1 oops=panic loglevel=7 rwp.mode=positive" \
>         -display none -serial stdio -monitor none -no-reboot
> 
> Use rwp.mode=no_move and rwp.mode=nonadjacent for the controls. The
> positive oracle is PRECHECK fault flags=0x8 followed by POST no_event
> value=0x41 and RESULT=RWP_NEIGHBOR_ESCAPE_CONFIRMED. This is a
> userfaultfd tracking defect; no privilege escalation or cross-process
> access is demonstrated. I checked upstream master f47d223627f8; the
> relevant mremap/userfaultfd logic is unchanged there, but runtime
> validation was on v7.3-rc7.
> 
> Thanks,
> 
> shaos
> 

-- 
Sincerely yours,
Mike.
