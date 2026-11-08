Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794108740;
	b=deeWQWUSfIyeWEnSBexNKmDPCvCoIF6yvBRI5Da1uPIydk5FaX1SL7r31/GXVuqFp5XR
	 xnh8yUDWC9G79eLQHy01ZZH32Yv5iGvkzlaA6fu2kZmLhlEokZvLYiFbGvM60GHoNafmd
	 1+hukBc+wAUksMMn6K/cgyLmSaJhHM14FnYE10kTjb3MMvJ6f0O1X/nQgWQHqxgqlC016
	 zXyrmJgtXSsJ9Fy+83w975PXBTdnHQsy3XdFifw2BpOQaxI73F8tAJF7uNGU5N+PwDTtf
	 SUNBB+uCWvEgfio6R9jm+NLkOeieflRGjug2DqlWPqYpKi2uml3HEoDMJlSQVkMEwBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794108740;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=yzk0wQ5hCxurXnNUincHOu3kWKjrcfCti8AeEhsWyE0=;
	b=yt3iUTwhOdCyjn2Wo3EX3pbibdg6mTS79c9UqTnlnv0ogkxy3eszQ+z2ZRjZzI9EZgp5
	 JcOnuskLGGgx5jlG5vx8HxKjL0vITuCzVlHad4kvG0vWX9s1AhxEUKf3zY9VzBQEqo0M6
	 39GZ5gEBGKhJnWA2517GLheqCyhg5gcJrLyivOUMcD6FYokl7uUKmAnpQ4oVjHT7qsv/L
	 nsexiohAq4AkCLKZr3gknIA6zgads5to2pqK1jrjrmqnV2rCbH+nxcAjYe2rCS4iKLJpb
	 XOLt0+B3blDHHvT+YtscaRGAOTxa1ejiKLyFocfVggvEU4sCh4W5h1+UeLyNqoK/qDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=iVS65pm0;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BB9606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 03:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84BB9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=iVS65pm0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=iVS65pm0HcQvYaIHonlXj+gXgML26/k0jD2I8Ej1YcA3EKx5pRGR8r1NNNHFF6WIgLEn605EmTokY
	 vom4ffkzfXe2sooHNFJSoDSY7O9dbQfs57e73zOfVs5hun7/+9Zvv6mGBhGr8qq8BHJWvwgl70Lx3A
	 zqyMnoeBgRLMoVGI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86aefed3ea5c-59a05;
	Sun, 08 Nov 2026 11:32:16 +0800 (CST)
X-RM-TRANSID:2ee86aefed3ea5c-59a05
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from cmss.chinamobile.com (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16aefed3f743-5bec4;
	Sun, 08 Nov 2026 11:32:16 +0800 (CST)
X-RM-TRANSID:2ee16aefed3f743-5bec4
From: Yuehong Wu <wuyuehong@cmss.chinamobile.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Breno Leitao <leitao@debian.org>, David Gow <david@davidgow.net>, Tejun Heo <tj@kernel.org>, Ryota Sakamoto <sakamo.ryota@gmail.com>, Karl Mehltretter <kmehltretter@gmail.com>, Marco Elver <elver@google.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Kir Chou <note351@hotmail.com>, Lorenzo Stoakes <ljs@kernel.org>, Borislav Petkov <bp@alien8.de>, Kuan-Wei Chiu <visitorckw@gmail.com>, Petr Mladek <pmladek@suse.com>, Eric Biggers <ebiggers@kernel.org>, Guan-Chun Wu <409411716@gms.tku.edu.tw>, Andy Shevchenko <andriy.shevchenko@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Antipov <dmantipov@yandex.ru>, Thomas Maarseveen <maarseveent@gmail.com>, Nickolai Zeldovich <nickolai@csail.mit.edu>, Thomas Gleixner <tglx@kernel.org>, Adam Harshbarger <handyhandyman.adam@gmail.com>
Subject: Re: [PATCH v3] lib/tests: add KUnit tests for the priority sorted list (plist)
Date: Sun, 08 Nov 2026 11:37:00 +0800
Message-ID: <20261108-plist-v3-tags-2-yuehongwu@cmss.chinamobile.com>
In-Reply-To: <20261106230658.69acd5b571d1ee361cc2c849@linux-foundation.org>
References: <20261107-plist-kunit-v3-1-yuehongwu@cmss.chinamobile.com> <20261106230658.69acd5b571d1ee361cc2c849@linux-foundation.org>
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
Content-Transfer-Encoding: 8bit

Hi Andrew,

Geert pointed out that the Reported-by/Closes/Suggested-by tags in the
plist KUnit patch do not belong there, and I agree - they describe the
history of earlier revisions rather than an upstream bug.  I am dropping
them.

The copy in mm-nonmm-unstable currently carries them: do you prefer a v4
with the tags removed, or would you rather edit the patch in place?  There
is no code change either way.

For the record on the TRIM_UNUSED_KSYMS question: I measured both
configurations on next-20261027 and saw exactly what Eric described - with
the test as a module the three exports stay in Module.symvers and
__ksymtab_plist_* is present in vmlinux; built into the kernel they are
trimmed, which is harmless.

Thanks,
Yuehong



