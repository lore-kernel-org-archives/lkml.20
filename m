Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794035220;
	b=zCmLO3tOBNkIPTGGYNCg/uT6DN8zQzkIp1d6WIXy7Buq6K0LdNikAEs6Mm1jKBebMg8y
	 czxtM2xEhpmUfkqkKsayM7K935UNlj+mFPV++GG86XkHoB08fECccY5S9UrhEgVXZXLtl
	 XvIfgmCGggd7K+abDqdA7Z82XIT478NVgfsBkqBrQw7qVGyP73+8zjzRshdY/QIs+xtNC
	 C00ydzsEuJz+YRzv4af6nGsobAYld3nQ9fPcyZ8O4S62Msd/OVWcyuHBqSstdYI0bp7o0
	 +taGrm7IXIxmLthui3vyBXiMszY8q9mJFsXbpmn7JC82ulkw00My3myZXkf3tfiVLpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794035220;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=rzwfw6jkDcgbHZM805i3L92R8XrXLiJYNTK5GehanlY=;
	b=Kj49+4iu5YQGHlpY1emw/fNv2R/OFb/OsqhwJ8eRb8b2LxEUG7/KJ7Mg918FEjZz8qE0
	 e7tB3lWLzIrUP/zihgY3rWsIFPDTGAX6uFtXOoAJrFcVRyOF5b4J0FQNwdI4dy2NkmZ6v
	 NHitYjBt+c4Sb+IzQ5OU3fIC9G8ZA8of2kHyWfxUD5W2WeOqOF+ZwkLZ51wpbBE/wSuQY
	 FUMbhjvZiyeZdWc1jO8tzK8cVevKsS1Vs90pGXL0rGA2c+ip1gA8RI1+FvZctpx0wlio5
	 iRVksWkoTd2qr8Oa93RjjSCgvqBksQ4+dbglH8TEyDafG14mHhd+sjYM7ftPxSgoCvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=T7jxcSZo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0896606A332
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 07:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=T7jxcSZo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696431F0089F;
	Sat,  7 Nov 2026 07:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794035219;
	bh=rzwfw6jkDcgbHZM805i3L92R8XrXLiJYNTK5GehanlY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=T7jxcSZoRCJpfIdslfQqVZBSbuRAsEqeb9p3II0jZQ9j7zdCxuaFVKSDNOK8tOIHN
	 Auh3UVFh7L1qbPxcnMuVXPb9o+aqI8LcXYH27ft4BFcj/w3//2MZonwQcrc4zRY36g
	 CiF4QDVUXIGnu4MTSSUb86ng0/EHAtwbrZhqwQ1o=
Date: Fri, 6 Nov 2026 23:06:58 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Yuehong Wu <wuyuehong@cmss.chinamobile.com>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Breno Leitao <leitao@debian.org>, David Gow <david@davidgow.net>, Tejun Heo
 <tj@kernel.org>, Ryota Sakamoto <sakamo.ryota@gmail.com>, Karl Mehltretter
 <kmehltretter@gmail.com>, Marco Elver <elver@google.com>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Kir Chou <note351@hotmail.com>, Lorenzo
 Stoakes <ljs@kernel.org>, Borislav Petkov <bp@alien8.de>, Kuan-Wei Chiu
 <visitorckw@gmail.com>, Petr Mladek <pmladek@suse.com>, Eric Biggers
 <ebiggers@kernel.org>, Guan-Chun Wu <409411716@gms.tku.edu.tw>, Andy
 Shevchenko <andriy.shevchenko@intel.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Dmitry Antipov <dmantipov@yandex.ru>, Thomas
 Maarseveen <maarseveent@gmail.com>, Nickolai Zeldovich
 <nickolai@csail.mit.edu>, Thomas Gleixner <tglx@kernel.org>, Adam
 Harshbarger <handyhandyman.adam@gmail.com>
Subject: Re: [PATCH v3] lib/tests: add KUnit tests for the priority sorted
 list (plist)
Message-Id: <20261106230658.69acd5b571d1ee361cc2c849@linux-foundation.org>
In-Reply-To: <20261107-plist-kunit-v3-1-yuehongwu@cmss.chinamobile.com>
References: <20261107-plist-kunit-v3-1-yuehongwu@cmss.chinamobile.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 07 Nov 2026 12:45:00 +0800 Yuehong Wu <wuyuehong@cmss.chinamobile.com> wrote:

> lib/plist.c has no KUnit coverage; its only test is the in-module
> plist_test() under CONFIG_DEBUG_PLIST, which BUG_ON()s on the first
> violation and does not report results in KTAP format.  The
> ordering-sensitive code paths have been changed three times since
> mid-2024:
> 
>   commit c8dab79f9eef ("lib/plist.c: avoid worst case scenario in
>   plist_add")
>   commit 95d4b3450ebe ("lib/plist.c: add shortcut for plist_requeue()")
>   commit 43c91b152243 ("lib/plist: fix plist_requeue() corrupting order
>   in the last bucket")
> 
> The first two are performance optimizations; the third one fixes a real
> ordering bug.  A deterministic case for that wrap-around now lives in the
> CONFIG_DEBUG_PLIST self-test, which only runs when that debug option is
> enabled by hand and stops at the first BUG_ON().
> plist_kunit_requeue_last_bucket() covers the same shape here, and the
> other cases pin down the ordering invariants the two optimizations rely
> on.  KUnit coverage makes such regressions visible wherever KUnit is
> enabled, which CONFIG_DEBUG_PLIST is not.
> 
> Add lib/tests/plist_kunit.c, a KUnit suite that exercises plist_add(),
> plist_del() and plist_requeue() and validates the invariants documented
> in include/linux/plist.h after every operation:

Thanks, let's get this into the pipeline for testing.

How does this play with CONFIG_TRIM_UNUSED_KSYMS=y, btw?

That darn thing removes symbols which no in-tree modules are using.  So
the 20-odd selftests/ which build and load modules can break in
interesting ways.

Although they're shipped with the tree, such modules are out-of-tree
for kbuild purposes.  If they work, it's by sheer luck - all the
exports they want happen to already be used by some in-tree module.

I assume that kunit-loaded modules suffer from the same issue.
