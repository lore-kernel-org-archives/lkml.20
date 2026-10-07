Received: from mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B131340680F
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355221; cv=none; b=o2Mo2D9fMF8i9VarODHmsreldy5ABR8uiKUSnN0VBGx5qM2PbLyoLyEpt5cgekvobjVkoC7PeQHEpgEoEtHaM1sl4xoJtTaPqx9El8zDH7o7leupcWDduksrhZcXON3UoQXo8rsygdltevJPBzOPgwBwDLiN/8hJ7GV+XF1Git0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355221; c=relaxed/simple;
	bh=hMXg57aAgl6g/Q1Nhdv8T99f47TCD6YMcjWTjqANCfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W5X1VRhFbuG7NrGJOC3bKgdwLYJuVI1toY0queGde0Dl9S4RtTeAYbQVnpDHeXQLYLjvA8aOBPEm7Wsjz4jzaw11Hih+l/qocLRyWWn2I7WKjaLzfwJAU8bvzwgYvPnc8C3NoXfQaLNwUBHcx7R8MkLAtJJouWj7N/tHi5GT5vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NkokHNTq; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NkokHNTq"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hMXg57aAgl6g/Q1Nhdv8T99f47TCD6YMcjWTjqANCfU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791355216; v=1; x=1791960016;
 b=NkokHNTqzez/O+Cy4wSAXej3TlVnRMcmuy6XQTXQuvOIyoDyFvaC3ywrC868koSLY8D3r49j
 EKGRDCHiu5VyBv38nxzS8aJMfyFeBR8hSZsBf12TmNghwDmbXU8wA8UYVVpp34sN80Tf8UQtzjj
 jUOtAcNWKEysF85ksWRrW+7Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 827d5bafe38176b3;
	Wed, 07 Oct 2026 02:14:44 +0000
X-Mizu-Trace-ID: 827d5bafe38176b3
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: ljs@kernel.org
Cc: akpm@linux-foundation.org,
	liam@infradead.org,
	vbabka@kernel.org,
	jannh@google.com,
	pfalcato@suse.de,
	david@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	lance.yang@linux.dev,
	syzbot+c181d3198e98f8aef8b9@syzkaller.appspotmail.com
Subject: Re: [PATCH] drivers/char/mem: mmap readonly MAP_SHARED-/dev/zero correctly
Date: Wed,  7 Oct 2026 10:14:36 +0800
Message-ID: <20261007021436.82381-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260924-fix-dev-zero-readonly-shared-v1-1-153c2111e323@kernel.org>
References: <20260924-fix-dev-zero-readonly-shared-v1-1-153c2111e323@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Thu, Sep 24, 2026 at 03:48:24PM +0100, Lorenzo Stoakes (ARM) wrote:
>Rather surprisingly, opening /dev/zero read-only then mmap()'ing it
>MAP_SHARED gets you true anonymous memory (albeit in a VMA with
>non-NULL vma->vm_file).
>
>This is a by-product of MAP_PRIVATE-/dev/zero being how anonymous memory
>was mapped in Linux's distant past.
>
>It happens because mmap_zero_prepare() gates on VMA_SHARED_BIT and when
>mapping a read-only file MAP_SHARED, do_mmap() clears VMA_SHARED_BIT and
>VMA_MAYWRITE_BIT.
>
>The gating is incorrect - the (poorly named) VMA_MAYSHARE_BIT flag exists
>explicitly to tell you if something was originally mapped MAP_SHARED.
>
>So the fix is simple - gate on this instead.
>
>This isn't exactly a common use case, but it's unexpected behaviour which
>now causes an assert if CONFIG_DEBUG_VM is set.
>
>While this bug has existed since the dawn of time for linux (or at least
>since 2.6.12), it hasn't caused issues in the past, so while it's incorrect
>behaviour, it doesn't seem necessary to backport that far.
>
>The mapping is now accounted at mmap time and can fail with -ENOMEM under
>strict overcommit, and read faults allocate folios. However this is normal
>behaviour for a read-only shmem mapping.
>
>Commit 93c0c8dc87f6 ("mm/rmap: use anon pgoff to track MAP_PRIVATE
>file-backed anon folios") is the first patch at which the debug assert
>fires, so target that instead.
>
>Fixes: 93c0c8dc87f6 ("mm/rmap: use anon pgoff to track MAP_PRIVATE file-backed anon folios")
>Reported-by: syzbot+c181d3198e98f8aef8b9@syzkaller.appspotmail.com
>Closes: https://lore.kernel.org/linux-mm/6ab4ae75.80e1c6cc.1e8e5f.000d.GAE@google.com/
>Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
