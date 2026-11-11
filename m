Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403475;
	b=VWSyRTmSzoJgeLEcKLetrhv76tiTVVVXWZg6g6xPTL4rMZOyVJoq3vXV3l+Oj3poDeSW
	 BB7PIWOqkj0l75PSFx3awKN0yz+cTsweodT8WSsqoB2Q2d69BuC3K7FgRwkSLdsTbn6WV
	 pZjcnKQ3i4Y/lZvou1UFCiGmzuLOhcr2nr3bK2Y6332ayWSvlUi/VSOhBh7D01qhQvUry
	 Uf09zgQl0gXNOAUuw5DRFHqRS3rco5221ed9EgjzSmlwdrFkvBXl9QRxp5CZ8fmsF85AI
	 DHRYXcN2pPvd7KA0y4B19LCXbDcRIWH34ziRPZY93Ph2Pkf4YIYHno4Cp5AK9Wveniw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403475;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QdhZGoOS3qaZkdUk0ZzfVt9fX+1wOi32goX1UT0WCnw=;
	b=MwKIV6OpkkwzVAa8KjKLMO6WLPR4jHKhHhaV8eDTe9+/+xiBkzD4NHF8rfebxhenVeQ6
	 TguqxRwnuQTamJV139FWOko26MgttsfsN7vZeAPP09/Vfi+Qcw+8XYEcUlxprflKy60BT
	 YxlbMLUcgGcJUrSoK40t+F9/fPp13N4beBNA+tr8mqax05SUcAJP+ghBRwh+qVtD3ODOQ
	 UFY9RljjobZltA8n0zg2kChT1yLZvS8B/pbR7rlciRs76bXeWVuebtG2Jcn7NsDJ4QgEz
	 flW/KnF3kcCodSsjjeoTbTVbeb2qqtEH408VBzRMG+S/QIIi99PgYrtIEd7LPulF+sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NSNzciiR;
	arc=none smtp.remote-ip=91.218.175.52
Received: from mta0.migadu.com (out-52.mta0.migadu.com [91.218.175.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B34606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5B34606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NSNzciiR
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=apRcNPV/eAJ6CX9Q9DtjrLM8bFgnJ5Z52He1vhxJjy0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794403472; v=1; x=1795008272;
 b=NSNzciiRrH1ZrJanImF+mHk4j5IdG8JlRwdity1+uzm8k0ohqLXAwHwG45+SRXgGkpVDV1YU
 FbTh+8yrQqfg10DPwlqr9Zvwm13GDK4okSPnqqq90Dy+s77ImjG55ytVadD3obB/fj4/jhIVU+y
 4v7KWL0i7zCg9XKTMK/qh/e8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 7e6ccbf188bf925f;
	Wed, 11 Nov 2026 13:24:31 +0000
X-Mizu-Trace-ID: 7e6ccbf188bf925f
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Borislav Petkov <bp@alien8.de>
Cc: Usama Arif <usama.arif@linux.dev>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	david.laight.linux@gmail.com,
	dave.hansen@linux.intel.com,
	dsterba@suse.com,
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
Subject: Re: [PATCH v2] x86/lib: Use REP MOVSB for =?US-ASCII?Q?_large_memcpy=28=29_on_ERMS_CPUs_without_FSRM?=
Date: Wed, 11 Nov 2026 05:24:27 -0800
Message-ID: <20261111132428.3050403-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <09B273E6-9146-4489-BC46-E7455CD8CA16@alien8.de>
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

On Wed, 11 Nov 2026 01:16:37 +0000 Borislav Petkov <bp@alien8.de> wrote:

> On November 10, 2026 8:59:02 PM UTC, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >On Tue, 10 Nov 2026 at 12:18, H. Peter Anvin <hpa@zytor.com> wrote:
> >>
> >> On November 10, 2026 9:53:07 AM PST, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >> >Let's not do that.
> >> >
> >> >Putting magic things like RET in alternatives is just a bad bad idea.
> >> >
> >> >               Linus
> >>
> >> Why is that, *given that it is in assembly*?
> >
> >It's assembly, but it's assembly that potentially gets rewritten.
> >objtool already knows about __x86_return_thunk being special (although
> >I think it's the _target_, not the call site, it cares about).
> >
> >I would like to not have magic in stuff that is in the alternatives
> >section. We've had issues with relocations etc before.
> >
> >That said, grepping a bit for this, it turns out we already seem to be
> >doing that in memmove_64.S, although it was hidden from my first grep:
> >
> >  #define CHECK_LEN     cmp $0x20, %rdx; jb 1f
> >  #define MEMMOVE_BYTES movq %rdx, %rcx; rep movsb; RET
> >  .Lmemmove_begin_forward:
> >        ALTERNATIVE_2 __stringify(CHECK_LEN), \
> >                      __stringify(CHECK_LEN; MEMMOVE_BYTES), X86_FEATURE_ERMS, \
> >                      __stringify(MEMMOVE_BYTES), X86_FEATURE_FSRM
> >
> >which is pretty disgusting. But I guess that train has passed..
> >
> >           Linus
> 
> Yah, I never liked this piece of gunk. Lemme give it a fresh look when things relax a bit...


I have sent v3 that doesnt put RET in an alternative [1]

[1] https://lore.kernel.org/all/20261111132214.2979125-3-usama.arif@linux.dev/#t
