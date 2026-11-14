Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.34.166.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678232;
	b=4vdbYBRfSf0cZU2CLo/G6NqmNiAPR+Xv/3oenXUgXAZZpoLFkflwqQnAEXdzulIumLni
	 s0QoExsRk5hF+mPFrH6yrIgTODP4xTBEZXhBK/EV2Rh7UhojbJ/pGH6B5aridBdTuyh9o
	 xx8voCh2b7OVn7iZRVgdiinSZLe2EhrLVYlPoBgPrpCHBQEthfgVvy5i9qyzKzJZDnZ07
	 57nh17cSzCU177TxjejSnOSdGnst2NEcFfcNyt0qdiep6L0oFhGD8Mb6IjuCvaAB5gUO7
	 WeDq9b0LJ5HLeNBnU2erAxRCqXYYPJMKo4pmHDJbsshWaWHPBFDIeyuxaaqLakfptdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678232;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=gUYd6Ak/U7tqSCyFOb05qtHGlID7ctSNzNFFW6QWUGw=;
	b=2naWW3VxeckHmrXNee/jmldIhAOjJ/JC1/LDVj1KsM7v6C7MGi8Pmmujem37fh/fACK9
	 nOvdBoRIRPvpMtyLF0pHjLS8hx9mOKtVp6r6VoMQZKtWEts87cKZto2pd6xDlG20FHzm+
	 xh38W+ADPvvWmWXmGgYujih41lYUfaNWkQJ3QbSXn+kHHyXgPZPI3f14KrQCf4uOIE85k
	 sK4OlVSWapTBSq5abQW8NAgWb0BT75YLmzy3idbXbyyX73mGeYBazyMnfF3dr38B8j7T+
	 ApzrEIamzuTIHC531zHcLL8PWpVQNBiq2v3O+stYkeweDnRsvB8RyiCoqdlVFaLuIKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tukaani.org;
	spf=pass smtp.mailfrom=tukaani.org;
	dkim=pass header.d=tukaani.org header.i=@tukaani.org header.a=rsa-sha256 header.s=x header.b="D+trus/E";
	arc=none smtp.remote-ip=84.34.166.10
Received: from mailscanner01.zoner.fi (mailscanner01.zoner.fi [84.34.166.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05E7606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E05E7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tukaani.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tukaani.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tukaani.org header.i=@tukaani.org header.a=rsa-sha256 header.s=x header.b=D+trus/E
Received: from www25.zoner.fi (www25.zoner.fi [84.34.147.45])
	by mailscanner01.zoner.fi (Postfix) with ESMTPS id D20E7419BD;
	Sat, 14 Nov 2026 19:43:41 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tukaani.org
	; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description; bh=gUYd6Ak/U7tqSCyFOb05qtHGlID7ctSNzNFFW6QWUGw=; b=D+tru
	s/Euix0V7GnIIN10kqk8G271q+z8bL8BkIf8iNvj4nXCzEVfmjvptHDxV2clb/9WEH5KiIOztA60+
	5u/Vy9tWJiI6QvE75IP1/iT3dUg8AsVtsr7eg60rggzC+qDSgqyLRFS8BUGCa7FWLp4UQgrjXso7I
	1hbHbFI4H/Nkg6NoN2xigVTUizLN5AnKMV1Vyle1mXnLWUMa0Xv1yMamMqT3qSGkiPypBwjc/Xntw
	C2XgeScozK9mOT33Dg/euq0VGKXC6183amqxVfpj79X16/z2SPjL5AZX1SRho0Rp8L3kj/jBJ6leC
	v0ztLyW4P4bOf3rHmhKb8A5lKOj5A==;
Received: from mail.zoner.fi ([84.34.147.244])
	by www25.zoner.fi with esmtp (Exim 4.100.1)
	(envelope-from <lasse.collin@tukaani.org>)
	id 1xSHmX-0000000Cx0S-2r7k;
	Sat, 14 Nov 2026 19:43:41 +0200
Date: Sat, 14 Nov 2026 19:43:37 +0200
From: Lasse Collin <lasse.collin@tukaani.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/xz: Decode LZMA with local range decoder and
 dictionary state
Message-ID: <20261114194337.0197caa7.lasse.collin@tukaani.org>
In-Reply-To: <20261113115937.188894-1-pmenzel@molgen.mpg.de>
References: <20261113115937.188894-1-pmenzel@molgen.mpg.de>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2026-11-13 Paul Menzel wrote:
> lzma_main() and the functions it calls access the range decoder and
> the dictionary through s->rc and s->dict. Every decoded bit stores to
> a uint16_t probability, and every decoded byte stores to dict.buf, and
> the kernel builds with -fno-strict-aliasing. So the compiler has to
> assume that these stores modify *s, and reloads and stores rc.range,
> rc.code, rc.in_pos, dict.pos, dict.full, =E2=80=A6 around each of them.
>=20
> Copy both structures to local variables at the start of lzma_main()
> and write them back at the end, and force inlining of the helpers that
> take their address, so that the compiler can keep them in registers.

I tested quickly, but I cannot comment properly yet, sorry. I hope I can
some day next week.

> liblzma=E2=80=99s LZMA decoder does the same [1]: lzma_decode() works on a
> local copy of the dictionary, and rc_to_local() makes a local copy of
> the range decoder.

It was done when GCC 3.3 and 3.4 were still in common use. Maybe
aliasing is one reason why it helped. Maybe it was that variables on
stack can be accessed directly via the stack pointer, which could have
mattered on register-starved 32-bit x86. I haven't checked how big
difference it makes in liblzma nowadays.

> liblzma has copied the range decoder since the first commit of the xz
> repository in 2007 [2], and the dictionary since a restructuring in
> 2008 [3], first released in xz 4.999.5alpha.

History about non-kernel code isn't needed in the commit message.

In late 2023 or very early 2024, I wrote some compact x86-64 inline
assembly for XZ Embedded, but I never polished and released it. I try to
finish it.

Thanks!

--=20
Lasse Collin
