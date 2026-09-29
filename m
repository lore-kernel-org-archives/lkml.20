Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB86032B13E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790641616; cv=none; b=UA6r+XqvCq+CWYpMvxQphGWeHWuquPlhKaos5h+O0mcdHcHsUT/H+2gnNknFODlcpzlEtcP6WfbKi11Pyx6vQoYQJZmqdl0fMjWhSwvfcNLEsPL1Bq2DtPhRcb80QnbreCPYS36N1juUxzR/RfBIReY90e4SEUATAx3038Qrhfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790641616; c=relaxed/simple;
	bh=3Bv0P+iQhJsHl4zzlCq3k9nReRooY4TCNEQuPFtNO5U=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=M+h2SS4abFdbp65IhVloeplcKDKg2J/bO5t27I7drOi+d32PEWaQm/s5i7xO1cDcXn5QzNU4qFVEaGBVOMFUux9EczsW9b6vHuqn8LVw9QZt45+kQdrYGpwHvwD2px0CN3sMxnohN2Z7jPauUREOWUHYpsx/pHhIXQQsUlBtSZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=rM8abSJi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="rM8abSJi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A1C1F000FF;
	Tue, 29 Sep 2026 00:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790641615;
	bh=zlkW1KaRsH/v2Yqvm3jPDzSTULrt4WXrqo90mO3Ywz8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=rM8abSJipd+2kXzuONq7RkkMTtMCsw3Tzq2Y6uYXwohjlwx+4eToWEGmvsj6g0sU5
	 dnklmCbQ/b0hbiWK/3Q9F/f/UGeRD40WxiaE61aDW+hpU9JSG5CsGHIhdluh8HeSbu
	 Sc+ge/+B27KUNHKsxV5OO95BJ+B8Pm7KWCW//v6E=
Date: Mon, 28 Sep 2026 17:26:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn
 <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Lance Yang <lance.yang@linux.dev>,
 syzbot+c181d3198e98f8aef8b9@syzkaller.appspotmail.com
Subject: Re: [PATCH] drivers/char/mem: mmap readonly MAP_SHARED-/dev/zero
 correctly
Message-Id: <20260928172654.7030810755eefd2a1503a0ee@linux-foundation.org>
In-Reply-To: <f78d2f52-1135-425c-a3e8-460a6e80e19b@kernel.org>
References: <20260924-fix-dev-zero-readonly-shared-v1-1-153c2111e323@kernel.org>
	<9efc7bc1-8d9d-49ac-b856-003e81558411@kernel.org>
	<20260924195826.70a87d6fb78d754bc73892cd@linux-foundation.org>
	<95e91b4a-ca16-49a3-9a1a-5b38afa6f08d@kernel.org>
	<arYnXJHW-Rh4eNzt@gremlin>
	<f78d2f52-1135-425c-a3e8-460a6e80e19b@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Sep 2026 13:59:47 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> 
> > 
> >>
> >> b) Do what Lorenzo proposes. This will allocate real memory. Someone decided to
> >>    use MAP_SHARED, for unknown reasons, so I'd assume it's unlikely that
> >>    something breaks, but you have a point.
> > 
> > I would say this patch is the right fix for the moment to fix the assert, and we
> > can chase up with other approaches afterwards.
> 
> It will get backported, so we better be careful.

I don't think it'll get backported.  I hope not.

The Fixes: target of 93c0c8dc87f6 ("mm/rmap: use anon pgoff to track
MAP_PRIVATE file-backed anon folios") is new in v7.3-rc1, so this will
go in as a hotfix against this -rc cycle only.

