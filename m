Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F7D3563EB
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 19:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791143764; cv=none; b=tdx5kBHmmFXYBqd4w5N+oQ4mpONvuEcUn9e5mUymyNYt+smvT69gba+ciEKlNVt4y7XszZmiTNj1zkqKCQM33xSyXj9sGl0474oVtDQ0irK61CgGWglloN/9ulJC27J6nLKZXc8UomPepnFbih9ihRvI93qu+Ob+Nd2McVJRWj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791143764; c=relaxed/simple;
	bh=OeLLvHWmWEsKpUO8bOwiRamCOzEASpvnMBwwSYdqw3U=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kh7VMwUbCVupB10/e0MMBAfzLucha0FR7bUfRnhNoHTHb2Wy6JhQccOo8uiJRCclu0GbP/FwTaOf1N22u/OTDcjV1taehQSN+1Lmd0FE75GK8hwA6Jrasn7koInggWO+rg2S9hvzJPtVPrYRjLYLviLBA5MuW3jMvjSPkQ0D3K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bsc/Ldmj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bsc/Ldmj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BFED1F000FF;
	Sun,  4 Oct 2026 19:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791143762;
	bh=hpkaiXvdHhIcWibB9SYBycVYBcgkusfdPB8A5buHEEk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bsc/LdmjzyZjLRf2S+ltcr9UoQpASsvsad4cpVvRzBRa/bXU+oDQcpooSXbyMetul
	 RsbKSU5SV6H6QLjDtc1lcov9ztMd2PZHkxZw2X5vcu0BJ8E2GyOkHq4fpIHjB4rsjW
	 DliqWVNiUt6/tBgXYYAxRdEg4b6mHcfWTfymaXTA=
Date: Sun, 4 Oct 2026 12:56:01 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nguyen Duy Nhat Anh <neganhat@gmail.com>
Cc: david@kernel.org, jgg@ziepe.ca, jhubbard@nvidia.com, peterx@redhat.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/gup: fix NULL pointer dereference in
 fixup_user_fault()
Message-Id: <20261004125601.c06953a6f0660df9859b0c2a@linux-foundation.org>
In-Reply-To: <20261003194846.205918-1-neganhat@gmail.com>
References: <20261003194846.205918-1-neganhat@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  4 Oct 2026 02:48:46 +0700 Nguyen Duy Nhat Anh <neganhat@gmail.com> wrote:

> In fixup_user_fault(), the 'unlocked' parameter is checked for NULL
> early on, allowing callers to pass NULL if they do not track whether the
> mmap lock was dropped.
> 
> However, if handle_mm_fault() returns VM_FAULT_COMPLETED, line 1597
> dereferences 'unlocked' directly (*unlocked = true) without checking
> if it is NULL. Callers like s390's pci_mmio.c pass NULL for 'unlocked',
> leading to a kernel NULL pointer dereference when VM_FAULT_COMPLETED
> occurs.
> 
> Fix this by checking if 'unlocked' is non-NULL before assigning to it.

This code is too subtle so you aren't the first to attempt to "fix" it.

The key hint is in the kerneldoc:

 * @unlocked:	did we unlock the mmap_lock while retrying, maybe NULL if caller
 *		does not allow retry. If NULL, the caller must guarantee
 *		that fault_flags does not contain FAULT_FLAG_ALLOW_RETRY.

Trace through the
FAULT_FLAG_ALLOW_RETRY/VM_FAULT_COMPLETED/VM_FAULT_RETRY logic
to confirm that the null deref is a cant-happen.

It would be great if you could pick through all this and propose
addition of a comment which will make this code less confusing for
others.

Thanks.

