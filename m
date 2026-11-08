Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794109134;
	b=Bk7okmbzyRmF41R+hA0qLUdC9j/fNiqdRXxfA4/7Z0lIKlDPlInHeCFSJR4mZtu72ZLY
	 jdk+PxpZB9DMfnbxn+Zp2eqZl/OQoNd4ouZIakY58+uBBJGWbv4gjZlN7dSF0MV2dzBIk
	 RaJxeUslk/AIMnT99q06KzaRGhu7MOp2gdL//yl7lJdhfuOcIwvZk6urmCifWm2lsAI2a
	 537EqtBkH3uZ/++nNVO2LiDzzc1ck0OhSb7QevLeffwyyozsZPSvT/0MG2T6u2WVmmsPU
	 n/ZFj1X662rhchqY89gry2ncy82DllEMCPXpQ/b4a+/1T8SE3PH9JlQUd+e0Y9/a0aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794109134;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=aqIBkvYtPDzucqzURlNJHvsSFZfARn8ZXT0xMDf3Rh8=;
	b=3DwSCGUI7AAkBEK4MNWbmae/4RV0cIebK2L+JP1vUr/3KUTJ8z4ojaaxaoxlx0pjv9re
	 PB1hz7uKheITc/J/+mP53Cjg6TKw7tW8+tNDhCD83awavf5BNLElGEmGAaVfU4BkaaZhs
	 ucavBCKUbQ+Gn0rOoXU7rWRLzhuQ5H3dZUy8r+fEa2P1jNtOQuFI/FJ0FK6A7sYZ0/OeA
	 KtP8+SjqqSzeM3bYj4nA+ZH48WON0NDso7u8A5bvK4v4oVCbz/T9jZARBu138m0ZkNAr8
	 jz+tqzh+AaTsRam9hSbfBdUNyXZRYpN1RPHWlnzX0rCOjYhLLhYsZeuSGI0FmbAkF9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=afLoJzB1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2689606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 03:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=afLoJzB1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D9D1F0089F;
	Sun,  8 Nov 2026 03:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794109133;
	bh=aqIBkvYtPDzucqzURlNJHvsSFZfARn8ZXT0xMDf3Rh8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=afLoJzB1WJd62ZVIdjlUhcM4M+pnhm1CygxJ49d0Dh8W1jKx+sCyLJh9NKPaNiO4M
	 0jaeBPIufSpBUfQZeuzGXCgpF0Jznn4ssk1SD4r5xejfYLoNWxt0sA1g477AkjlHqv
	 ZKUfkDSwJe6juqWXaGr0YlcQ5oMdoMR8D0XIJfKQ=
Date: Sat, 7 Nov 2026 19:38:52 -0800
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
Message-Id: <20261107193852.8320bdbf82cf6899c3153171@linux-foundation.org>
In-Reply-To: <20261108-plist-v3-tags-2-yuehongwu@cmss.chinamobile.com>
References: <20261107-plist-kunit-v3-1-yuehongwu@cmss.chinamobile.com>
	<20261106230658.69acd5b571d1ee361cc2c849@linux-foundation.org>
	<20261108-plist-v3-tags-2-yuehongwu@cmss.chinamobile.com>
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

On Sun, 08 Nov 2026 11:37:00 +0800 Yuehong Wu <wuyuehong@cmss.chinamobile.com> wrote:

> Hi Andrew,
> 
> Geert pointed out that the Reported-by/Closes/Suggested-by tags in the
> plist KUnit patch do not belong there, and I agree - they describe the
> history of earlier revisions rather than an upstream bug.  I am dropping
> them.
> 
> The copy in mm-nonmm-unstable currently carries them: do you prefer a v4
> with the tags removed, or would you rather edit the patch in place?  There
> is no code change either way.

np, I edited in place.

> For the record on the TRIM_UNUSED_KSYMS question: I measured both
> configurations on next-20261027 and saw exactly what Eric described - with
> the test as a module the three exports stay in Module.symvers and
> __ksymtab_plist_* is present in vmlinux; built into the kernel they are
> trimmed, which is harmless.

Yeah it's a pain and I see no general fix.  

# CONFIG_TRIM_UNUSED_KSYMS is not set

there.
