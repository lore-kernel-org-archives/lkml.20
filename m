Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDDD285058
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 03:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791691142; cv=none; b=au7cWVfshi8VwuzGBewmJp9o5Pn8lESwkCoZlXGgwrUnEsCgLTRxneElqCtGlp1lXx9poi6AKQjVh+2CpQOmnLv25ZzAi6VYQzxG16VF+rPYSQ4XtKrt31i7ALba6l/cNO0colXoIeJgA1+b5TLSZwMUowXMbYwZWVzoegYUGhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791691142; c=relaxed/simple;
	bh=0J6KM9fRzjqw5+f0Q3pqKhpkKaGUB7fOzBCb/BuIyQY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=sGt0O1STkpAKP48wn0TSwaxaPleTEVNB9FIDRFRUlkqB95GbMdXO6U+L79fb6lx9bbT9MX3VckrxmRkaUFBnEUauymANuJU7N4zrwxFdL6gJcrYP5bhZsNsIpUX+6z2+ry4F4rKL5fDnYRTu1Ot6UDZflcMrkwKEJO7Bgd7dzd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=W+Bh9bR/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="W+Bh9bR/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E5A1F000FF;
	Sun, 11 Oct 2026 03:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791691140;
	bh=d+JuRINIxjhyEQNvDL0UWgjp3o9kGqohdq+KTZsToFc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=W+Bh9bR/anKUfh63AzcnypPVZa0Cn8hl8CTJSgv6eHCF3mnZ88Ukvkyf0HKtIL85/
	 C1W0dI9C6h+Us4UAulig/ZOmM/Vz6Ve+S+jzkOg3MCtMfC7urXaqV5/ydlbxbsaLNA
	 BF+1tM84Yd5IdgHhsVmva41ob5C5XvZpGS+1Dy20=
Date: Sat, 10 Oct 2026 20:58:59 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ting-Han Hou <ue081723@gmail.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham
 <kbingham@kernel.org>, Kuan-Ying Lee <kuan-ying.lee@canonical.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] scripts/gdb: fix radix tree lookup and stack
 depot diagnostic
Message-Id: <20261010205859.9ff913500e7a2005d99f9738@linux-foundation.org>
In-Reply-To: <20261011023044.1722-1-ue081723@gmail.com>
References: <20261010141712.2db4491436e30110ccb5a25e@linux-foundation.org>
	<20261011023044.1722-1-ue081723@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 11 Oct 2026 10:30:42 +0800 Ting-Han Hou <ue081723@gmail.com> wrote:

> Andrew, here are the two scripts/gdb fixes as a series, as requested.
> 
> Patch 1 fixes $lx_radix_tree_lookup(), which dereferenced slot contents
> as if they were node pointers. v2 also handles the XArray sibling,
> retry and zero entries that Sashiko pointed out: they carry the
> internal tag but are not node pointers, and the v1 patch raised a GDB
> MemoryError on them. Large folios in the page cache make sibling
> entries common, so this was worth fixing rather than documenting.
> 
> Patch 2 is unchanged from v1 apart from being resent with git
> send-email, since the earlier copy was word-wrapped by the mail
> client. Sorry about that.
> 
> Both patches are tested against standalone GCC-built fixtures that use
> the kernel struct layouts (details below the --- line of each patch),
> not against a running kernel.

Thanks, I'll queue these for testing while awaiting maintainer review.
