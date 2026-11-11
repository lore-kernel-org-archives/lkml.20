Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402251;
	b=Hm6jlH2qVGfvqfRdZKLqlM6PSqawD5NOfTgQ/D0frNj4ig4W+i6EYvTgqyQ6VJU5/vKA
	 ADzrX4UmsQFgwoh44jfGLP8tR5NHHcFVSBcL2Hx3wu2aoStjj3EAgT7wA004+avgNdVRT
	 wp8W5j/jZ3W38Pu3I5uBxyeQd7zpwqbbQHYDPhsjPheuwArFOvvfDvFNmAkdn6j7hryG9
	 eLKMaQ+5SfXU8WnljbTESVdC26u7evmly9mTGcFRrIN9LsC6+j6UhPsjTPLiSrw4IMqrg
	 WKk9Lx0xi7PuG534D/CU/baiCT8tKliTBt12Z8/HNDaTE84AXXP0QkEbumHgWD5nmxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402251;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+ibl+xs66yD86wh5INakXzfw8v0V7RfphGaR6jB5XrI=;
	b=kkNE1gjamYcogjW6232Tairc+kiDh5Jsar6j0rKm+PGS8M/CS4WfnNrMpws7wyrJ0WFy
	 GW88+Ult1ui0KlxQoCPTFd1XZD8dEDbXADfwO7invToIhFkzXWkjZmsfeo0rfJ4nhUIZl
	 c/eu5XKrynKuV5abHEtnUorVchWLZiOgNAWhZkW7rKTghXmaLZm1sBVnb6f+8/9qZ78h9
	 5e9vO3nFiTJx17yTi1DHsb4e6giXEENCYR2SZBlGhxp5u/LjJRW2ELJFEfybWL3GahVI4
	 g5mtGef8MvX9r3WObP1Idbn4Km8wHY71PRVEpoBWHr9LYr5l+3iz49+MLs8C9NlY2Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ULpQmAld;
	arc=none smtp.remote-ip=95.215.58.31
Received: from mta1.migadu.com (unknown [95.215.58.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F46606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35F46606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ULpQmAld
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PNo9eQqUCQ0H6xEIxoWm0pGinAn55h2xXAqO/yeQE58=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794402248; v=1; x=1795007048;
 b=ULpQmAldDNEGQPEemmARZ/j2g2idpw6brjJcB7CsGqeZtC3PDHwc2vFJXumhZ7p2nwa0S7GY
 9jE3EdmcW3i/FKCI0CQ8LrPfERXOOUKGEHGFkV7WX7KWZa8bMKswXehGY++PXgCcDuJ9Y5500Pn
 KVnbc+de6aVQIV2EHRA5wXQ4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 42f504bcf6d2e3ca;
	Wed, 11 Nov 2026 13:04:07 +0000
X-Mizu-Trace-ID: 42f504bcf6d2e3ca
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Usama Arif <usama.arif@linux.dev>,
	david.laight.linux@gmail.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	dsterba@suse.com,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	terrelln@fb.com,
	tglx@kernel.org,
	x86@kernel.org,
	kas@kernel.org,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com
Subject: Re: [PATCH v2] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs without FSRM
Date: Wed, 11 Nov 2026 05:04:03 -0800
Message-ID: <20261111130404.2662582-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAHk-=whPF8CD9zC960jPUi2rMrJ_pq9ytdSYqWoef-R6AHsfXg@mail.gmail.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 10 Nov 2026 09:53:07 -0800 Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Wed, 4 Nov 2026 at 14:28, Usama Arif <usama.arif@linux.dev> wrote:
> >
> > +       ALTERNATIVE __stringify(cmpq $0x20, %rcx; jb .Lhandle_tail), \
> > +                   __stringify(rep movsb; RET), X86_FEATURE_FSRM
> 
> Let's not do that.
> 
> Putting magic things like RET in alternatives is just a bad bad idea.

I will send v3 today with RET in ordinary text.

Thanks!
Usama

> 
>                Linus
> 
