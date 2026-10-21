Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562829;
	b=kjoPS1Ab/xgtcuX0KeyLmyYlY41nqr3wUP5WED9Flmj5q2cEQ3DjH79o3nxtfK9Z8Nnw
	 rXObJPTNnpJqrsXOZTwE4eRHgpAYDNA5yLDx5zq/HiGBMVE0YwoO2xnF2VjrFcVTmOjnZ
	 buB/cvhiXCgYFs1x1f9z96t2DyaNp7Mz6g1EsbQyewAaFD3t2KuMd3gMxZX84cNZ6XzHD
	 M6sg3mTiGa77ljegoSqxytNF9FwaUwxwphEO4krDOWUR7ik1Uin7b3t5Oqaxess30bh9R
	 IPu8CZiZy/U2oIyskjaJn1sPGowou1YEDLz1B1P/l7tqxz7yBFzUaB5MTwga5oAY7GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562829;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=RWXu4jpq1GrCvUDpKd/ed8T68hCMT6wRiDitfxefxoY=;
	b=g8e/XiR8G+XfzpZtNK0MS+rcHMfty3GY/+4c2xobOwMo7FhZnipFUf4D9L5Rexxmh5JV
	 o88Z78YFPJvJOrjasSn5ErW3HZKqLagzcdAO9Sd2/0Ow35P427Yeez/MGFttgYWJCPM7+
	 ftaLJHEISt56XpUcc0h7lE9FajI9ElD9MnfMGWtcZanoHUkvTCZjxN6ccg1GWnJzcULAa
	 K4d3aeFdGWvP7sA9vT0mmv2cWB4QHR1fclsAgQZR2atUlh4ZtFjbXmAYUi1TsCXyUlysC
	 5f4/wAb2s+LOtEAbdMM2bPoRvm5zJxJZ8bDMDmWla62IA76C6lS0j0DoF58Z0nCoq6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UFtZhN0F;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD58606A32E;
	Wed, 21 Oct 2026 06:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAD58606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UFtZhN0F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=RWXu4jpq1GrCvUDpKd/ed8T68hCMT6wRiDitfxefxoY=; b=UFtZhN0FIOqU8GkqMum6PS8cia
	29pzu+E8MdtpMRhmvTkW+y/+wnbCl3gvk+Ti9uP2mgnAy6fFYhgOPcKceYudFmmaovR/r0ohoeCbH
	+WWQEA6+mh8DS40Ol/MwsXAicv9u+wCTOd9QhV7GEFPXCy9SLAIOFx71IzvsG0zh84we/tJocRtMU
	mh+x3J6OFOVsxWUzLizi4QwnObOvNXB6C4xJGij9buyYY8Oq9Hz1NKtCE+96NoP9ojqUW3AmmFa1h
	GbuI3Onm7hnbTnjhwjmZhAuRvF6XzCuEuM0STnJAf5F60yTcjE4f3PmiqrsuFMq/uvoQqFI66Ay4c
	Za1Bmn0A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPTd-0000000B8H8-2CWa;
	Wed, 21 Oct 2026 06:07:05 +0000
Message-ID: <f6d6d8d2-03ca-498d-b5d2-578aece560d9@infradead.org>
Date: Tue, 20 Oct 2026 23:07:05 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Eric Biggers <ebiggers@kernel.org>
Cc: linux-doc@vger.kernel.org, workflows@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel@vger.kernel.org
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <20261020-brown-potoo-of-relaxation-3e9a72@lemur>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261020-brown-potoo-of-relaxation-3e9a72@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/20/26 3:07 PM, Konstantin Ryabitsev wrote:
> On Tue, Oct 20, 2026 at 09:22:35PM +0000, Eric Biggers wrote:
>> Many patches still don't include base tree information and can't be
>> applied.  Such patches can't be properly reviewed or tested, nor can
>> they be accepted.  submitting-patches.rst already describes how to
>> include base tree information, but it's characterized as optional,
>> appears only towards the end of the document, and is missing details.
> 
> I'm happy with this change, but I'd disambiguate the title a bit. With b4, we
> started providing both a base-commit and base-tree footer, specifically
> because often times the "base-commit:" line by itself is not sufficient.
> 
> Imagine this scenario: a developer is working on some code in a feature branch
> and come across a pre-existing bug. They create a fork off of their feature
> branch to fix the bug and send it in. In this situation, the "base-commit"
> footer would be meaningless, because it references some transient commit-id in
> their feature branch. In an ideal scenario, the developer would rebase that
> bugfix branch on a known tag, but that doesn't always happen.
> 
> This observation doesn't really preclude this patch from being accepted, I'm
> just recording my own experience that, by itself, base-commit is often
> insufficient.

Yeah, I was wondering about specifying tree as well as commit, so thanks
answering before I even asked the question.

Most of my patches are made against linux-next.  So: is this going to be
acceptable?

(for linux-next-20261020:)
base-commit: 053966c344dbd346e71305f530e91ea77916189f
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master

linux-next how has over 400 trees in it. That's a tad prohibitive AFA cloning is
concerned.


thanks.
-- 
~Randy

