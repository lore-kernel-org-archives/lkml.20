Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793330963;
	b=MHLx2ZsMddusb7sQbwI7ujrvTDGw6Z1u7BlpK0QB03zcptZGeI9qzKMuzz//UBmET3wm
	 Fd4FYLiWaKZPwx9ao7crfIuIOtNbcFoSrqUq7t+tyPN5uuRzUstHedwCDNY9MEjBnd8yD
	 VRqv/qwP5cXtNYM9fyNkVB3TQZa26R+1SvtTh6YWPO+d5i1EZ3z5bcjSwANj2k6HdwfV4
	 hSkf9NCixprn//I0sboXFZIuhkKrHq3BVTeSClHSuZhGBacfmMgjU3UFpIZy+Uy+gFX+j
	 Hi9s0ZEe9vHn7kc7+0hUEm7CtdgcAPN5xjw0i/9B2+BIVjf6VzyhKNl0APvnW3+Af1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793330963;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=2tZmbcSKWQK7L/mdY6RuKKSy0YQetsmqeAoK/q8sghs=;
	b=LkJeilrYuT/bZpYF07aXn38geejSgbXM4Oy54IsT2/UEqtjW140znIOA5hJ16HQtHBZQ
	 8wB9gk26GF6TzekDZe/SEq882tLq040JWytn2HudsglF6+OAjTKin9CulriC+rzNmOH/9
	 1edJyG5lK+7c53mmbJrOWra34kXmIX2zYJg+ac8hUeB2M1TKvwOuQA/qD1Q9JBXAaWGWI
	 19g4yH2kS0/2WW6ZeU0SRRr1+9y0onQtMpS3jpJIkLMrFQK/lUZlZdsAJGUPD2m1Or+Xm
	 g68xVGQbSYTMTu5md/k6qPzcfnVfN+FdCQVwwafb9l3LBWtWOVWQcUGCrzm+3qFo1aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b="ufKWPCQ/";
	arc=none smtp.remote-ip=91.218.175.71
Received: from mta0.migadu.com (out-71.mta0.migadu.com [91.218.175.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD7C606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DD7C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=ufKWPCQ/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=let52JAYL1yo6Z3XNcDSB1+0YuvNRPHH4j2gpOXnijM=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793330960; v=1; x=1793935760;
 b=ufKWPCQ/iM9Pxe81O52SNfrM0pKj7Ve7yBpWurGyn2dHmZPBf93OnIdTSGE3PjhMjxGx5l2D
 03gtpPS9KHA46ISDALt2O0gJWixBwS4bwckfrqHy3mflK2NnKsCWsBZjnfLLDZWkVZ2sHno9LFp
 rXvK0LhC+i7/Mr1HuPkBb637c8HyOxebJcTZLaM1PD/kLfysZ6EalvbAeLBjmEcbiJpuakFH9d+
 gJpu72WcmKIcAwefosszIN+9LovpXaZQYYYAucVTnur0+3q+Q6HyyLhyjbiuehsfnjf/qUIIMBX
 zAXr5yYOq2buddjQ7k0PrpTHdC5LslZ0m264L4Q4q+VQQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b73eabd191509bd1;
	Fri, 30 Oct 2026 03:29:20 +0000
X-Mizu-Trace-ID: b73eabd191509bd1
X-Migadu-Flow: FLOW_OUT
Date: Fri, 30 Oct 2026 11:29:11 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Weijie Yuan <kernel@wyuan.org>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/9] docs/zh_CN: align translation paths and update
 guides
Message-ID: <auQPB6S1VAFOLuhs@wyuan.org>
References: <20261028034134.4144660-1-dzm91@hust.edu.cn>
 <auGucr4smrSp9g5l@wyuan.org>
 <0ecb719c-5e0a-400c-b1b3-da2923c40bb4@hust.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ecb719c-5e0a-400c-b1b3-da2923c40bb4@hust.edu.cn>

Dongliang Mu <dzm91@hust.edu.cn> writes:

> 
> On 10/28/26 4:12 PM, Weijie Yuan wrote:
> > On Wed, Oct 28, 2026 at 11:41:25AM +0800, Dongliang Mu wrote:
> > > Several Chinese translations are no longer at the same relative paths as
> > > their English originals, and some Original fields are stale. This series
> > > moves the translations to matching paths, adjusts their indexes, and
> > > removes stale Original fields. It also updates selected translations to
> > > newer English commits.
> > > 
> > > v1->v2:
> > > - Drop the unused top-level readme_zh label from the translated
> > >    admin-guide README.
> > Hmm, so why still keeping these labels here?
> > 
> > [2/9] .. _zh_applying_patches:
> This is necessary and used by another location.

$ git grep -n -F -- 'zh_applying_patches' Documentation/
Documentation/translations/zh_CN/admin-guide/README.rst:82:   :ref:`Documentation/translations/zh_CN/process/applying-patches.rst <zh_applying_patches>`。
Documentation/translations/zh_CN/process/applying-patches.rst:11:.. _zh_applying_patches:

Seems that it is only used in your patchset? Because I didn't create
this label when I made this translation.

> > [4/9] .. _process_index_zh:
> > [5/9] .. _magicnumbers_zh:
> 
> The above labels needs removed. I forget to clean the same issues in other
> patches.

Thanks!
