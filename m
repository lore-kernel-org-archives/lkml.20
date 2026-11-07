Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794077897;
	b=bQPsWGen35h3GZ0kWglGmDmjaho6brjKorYEAMTWjxVTpOXdmOjqYa5ZkSDVoRvakQUx
	 c8SKy0qj4kd+1jASYbIEjESVJ198rBuJ2zI6bKMnbzcHehfOcU+8wJGToAHmkTf+6ICZ6
	 4PxRw8XTBr0KytCOpKXRicqGeqbnB2MpHV8NrHxd09Tv850KDesjBY7hy2sAK2XBSKOag
	 lnUD/Pgba3KoUlPpuZnqoFTWEIx0vsDyY3lY9R1iiL+e9wSychRSXedcO6jJ1hpm3w3vs
	 UhFOhWYzSh7BJNCupi8MZuDoFZh47NUMutH7K1utGUFHpJU3pykn6uh10AIVmdiNS7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794077897;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Kb2SdKY7TRgFMRSZ4IEHmItIjirnjeiw6nwbIiz4KPY=;
	b=FbR3THLaBqf/sIAQw5rX38zSyUaMLtKyGFtMErDflKlV7Y85hvhLRqNcj2/yVR7+UQuO
	 5jV0MZurd80d/p26Dzj4SmzlywqjE71nEoYu4imYIGbowF+5vK0k/N1+dQoSvXiOMr45N
	 qllDXu4etQ14CPUey1DG+uQXpgIwtBxcPKyTOKH5sKBc5HRkc7ZMjvVGRrfryv9/tAvfE
	 phUlND2VlERiCYcF2NPETRM0Hzr99XYToQQ8N+Yr+OilQ3L2V/NRSUo27TwcZ8TqZWRnG
	 fcoVKHvcr2UmCawDfQ/gOxugKs7Mw5eZeposELtuvJK1cL5UZrQdJeZEH8J1nmBbDsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DbiVhYc0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE71606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 18:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DbiVhYc0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0FFC1F0089F;
	Sat,  7 Nov 2026 18:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794077896;
	bh=Kb2SdKY7TRgFMRSZ4IEHmItIjirnjeiw6nwbIiz4KPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DbiVhYc0edtRx/stz9drgghPm/hDOn58FuLzmsL9OFxSeGTWDA9SK/pDhv5+W+VRd
	 DEeydMGrCOqun/0ZGS1Bo4eiGWrF7nFoVaMliZCmX9gLdup4b5fVibSzntBwgS1YMg
	 hMPbIO35PohNSmQkvPF5nOJb9+epzWa2zcXY+M48ToziyvnvmPOgKhOTyJMUDdPupn
	 cKbJQ+bqegQwjv2WlxHBwT8Kw7AraTLpUoduqKJ9UYizxOi6SgE7gD1qaxhjebqidX
	 hv5XoVOUNEVJzhBmds8F2M/EruMOUgEtCPVecpF4BswRT7s0+rZf7Ep2iIRVF5xWjx
	 fDzZrhDkIMsuw==
Date: Sat, 7 Nov 2026 10:58:14 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Yuehong Wu <wuyuehong@cmss.chinamobile.com>,
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Breno Leitao <leitao@debian.org>, David Gow <david@davidgow.net>,
	Tejun Heo <tj@kernel.org>, Ryota Sakamoto <sakamo.ryota@gmail.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Marco Elver <elver@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Kir Chou <note351@hotmail.com>, Lorenzo Stoakes <ljs@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	Guan-Chun Wu <409411716@gms.tku.edu.tw>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Antipov <dmantipov@yandex.ru>,
	Thomas Maarseveen <maarseveent@gmail.com>,
	Nickolai Zeldovich <nickolai@csail.mit.edu>,
	Thomas Gleixner <tglx@kernel.org>,
	Adam Harshbarger <handyhandyman.adam@gmail.com>
Subject: Re: [PATCH v3] lib/tests: add KUnit tests for the priority sorted
 list (plist)
Message-ID: <20261107185814.GA1976@quark>
References: <20261107-plist-kunit-v3-1-yuehongwu@cmss.chinamobile.com>
 <20261106230658.69acd5b571d1ee361cc2c849@linux-foundation.org>
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
In-Reply-To: <20261106230658.69acd5b571d1ee361cc2c849@linux-foundation.org>

On Fri, Nov 06, 2026 at 11:06:58PM -0800, Andrew Morton wrote:
> > Add lib/tests/plist_kunit.c, a KUnit suite that exercises plist_add(),
> > plist_del() and plist_requeue() and validates the invariants documented
> > in include/linux/plist.h after every operation:
> 
> Thanks, let's get this into the pipeline for testing.
> 
> How does this play with CONFIG_TRIM_UNUSED_KSYMS=y, btw?
> 
> That darn thing removes symbols which no in-tree modules are using.  So
> the 20-odd selftests/ which build and load modules can break in
> interesting ways.
> 
> Although they're shipped with the tree, such modules are out-of-tree
> for kbuild purposes.  If they work, it's by sheer luck - all the
> exports they want happen to already be used by some in-tree module.
> 
> I assume that kunit-loaded modules suffer from the same issue.

No, KUnit test modules don't have the same issue, since they are in-tree
modules.

Also their kconfig options use 'depends on' as needed.  However, in the
case of plist.c, that is unconditional already.

- Eric
