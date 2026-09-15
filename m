Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219FA439327;
	Tue, 15 Sep 2026 18:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789496452; cv=none; b=pRSX5ZErE6wJ4OM42S7TjrYKll53ZNTlXykFo7V8wPkjmR5bpqGmLS1XYHrv0L3eu0sI7p4m/sQ2nrmQS6T5Rkk5vtIowlUWMSlnRIOHvOiNfqfdzrhFhOjUNrBYgsPCj512WoZTHcb97u2HyktPLTtE96aCUFuqJuZ87zD3gGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789496452; c=relaxed/simple;
	bh=QVpzudcs12YmoxMnlyYz2+aXWxmdZtdql0WCQhrR/ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vA39UN/3nVxbkdDH+/DxvXswybfIZQfvch2h4Xkg2OE7LwXmTUNqnYkRwx/NTvzyIkJC9/J65IHl0jBHNMyeqDtysTxdD7HmBpKXtFM7QpvnuuozJaT3kYibH3TbdP0Fz2+/e84ssYwzxsRjvMRpDvlClOjDy14bYwn8irZayOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZ2lPtPl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZ2lPtPl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC07C1F000FF;
	Tue, 15 Sep 2026 18:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789496450;
	bh=2vvC5jP7S//NdAMJmyPx5MczC9XnOgJSok3xX6ctcqg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nZ2lPtPlqb7HiX7K4hXMmAIVqrUfNAExBPMxcIvE1S8L9KUB5Bv3axo1BDyBIrzzk
	 MGva9Y141ylE/Lh23HYo+I2wYMXh8xjsNv8hwqF124we+b5pKdh/4IfBVjKXRqAlNG
	 bl/k3Ua2gINMKf0nnrXrlMCOYozU64+Tyq83GObdQerJIwHX5HEBORXfTRx32fJB4S
	 sh+ZM5e+ZIckeLh7V9NgsDTto1FqV8U9u1nEDW9pJOqbsHbi5DXXUxZ6wimEf7B4g+
	 F+1PVbcS5br1amOD+moIggp5nER2aVaDhq4MEIYQfaOS7WLfnX8WdHiA3YlvM7ZWT+
	 /h3S96viJtvGg==
Date: Tue, 15 Sep 2026 20:20:45 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Akira Yokosawa <akiyks@gmail.com>, Masaharu Noguchi <nogunix@gmail.com>,
 Chen Miao <chenmiao.ku@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>
Subject: Re: rst2pdf (was [PATCH v2] docs: sphinx-pre-install: warn about
 unsupported Docutils versions)
Message-ID: <20260915202045.4fe8eb4c@foz.lan>
In-Reply-To: <87h5jqd1ls.fsf@trenco.lwn.net>
References: <20260914-docs-sphinx-pre-install-docutils-v2-1-6a2a6deedd19@gmail.com>
	<b5df5eee-661e-4f46-9abf-1bd9cec8069d@gmail.com>
	<20260915101638.76e3bf1c@foz.lan>
	<87h5jqd1ls.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 08:35:11 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > On a separate but related issue, has anyone tried to use rst2pdf
> > lately (https://github.com/rst2pdf/rst2pdf)?  
> 
> I have a branch sitting around that, on occasion, I dust off to see how
> it works; every time, rst2pdf crashes and burns.  I've long wanted to
> find some time to figure out what's going on and try to fix it but
> ... well, we know that story by now ...
> 
> It would be *wonderful* if we could us it and short the LaTeX toolchain
> out entirely.

If someone has spare tokens, perhaps detecting the issues could be
delegated to some LLM agent that would try to address them, generating
enough feedback to have something to submit back to rst2pdf maintainers.

As this is basically a transformation problem (from rst vocabulary to pdf
vocabulary), I suspect it won't take much LLM time to discover the main 
issues. Perhaps even small model like ornith-1.5-9B could be enough to
deal with it.


Thanks,
Mauro
