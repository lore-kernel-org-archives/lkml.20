Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794341942;
	b=KSjElKu85t4MIpOvO2EcD1+JntV3D+xG9a7Kr13qs3mnQ+UbOFv2sRYeevzY0K9c/Zl0
	 f7jbTS2ltPBp5oGqO+ipOKguJUFTkuCP19ErNWzynbdXHv7+u5890KleagiWmQlodIOn2
	 f1yyzaUUB0YW/89dMLayq2F6wyMQFAYEQdreOWesiX8dMJ+TarA72eeso7LLmLkQ5nXei
	 zn6t0QZ/VhL224wk+r7jp/iG734OT1tAN+gbkGOt4iqm1Owxc5jhEFRjUl+Tlqx27lIo+
	 1Lnfm4TjeAW8moUtrZw2WsA1xdwmrF9WHVRjpF3bEVLRNZb5KVwZdAdlRE2+CevvWAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341942;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Date:From:To:CC:
	 Subject:User-Agent:In-Reply-To:References:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=/95DCKLnTjjSvDhq1lx6rNnEdA1D65FoSfzmnFJ5zBw=;
	b=Qa3d06DmylYIoeiXrD8H2JSVzMJKMXfqD554jD+iOgIY4BYDXD3dYY9LfR60tIu0n3CJ
	 mDOxKDZhnBtSetXK+OygOcat3+vKPQ+7LaXzOeZA2n/ve5DFArMRKu1mq+vYSGvkqnwsH
	 x/ruxCrfyGLTzl1dI9nWv9sjSLfGYnJ+KfgfibdqePrbn76yEvyBQxUhtNlnJTvGQHxDV
	 udc+xEC21vu8pxI0M6wGSSRqhByinuvOA+vOv920ElQpMcdb4XOTBo67ghIB2PqaKIKE8
	 7zgjHpNCaPX8Kut9rJwPWb4xRjJGTvKuDCGfaOTDkPhZ6Y+S0QOnKl4A4sQlRbKWUxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zytor.com;
	spf=pass smtp.mailfrom=zytor.com;
	dkim=pass header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026102901 header.b=VhW9qk50;
	arc=none smtp.remote-ip=198.137.202.136
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7078606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7078606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026102901 header.b=VhW9qk50
Received: from ehlo.thunderbird.net ([172.59.161.232])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 6AAKHuUT285035
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 10 Nov 2026 12:18:05 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 6AAKHuUT285035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026102901; t=1794341892;
	bh=/95DCKLnTjjSvDhq1lx6rNnEdA1D65FoSfzmnFJ5zBw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=VhW9qk504QfVWNDRqC3QQ7xPaIx+qquriOzz6Ea+ClKoiRF3ZQZiNsWfDFJ4wKUVG
	 cx9WDodcNwKMXV6flih73TARDeHGunGu2N+6LOWZKnawU4t6lH6sdIgOBxEUXE4V1e
	 3k/LmL+lGnbQJWo47xQn9Mee0zirictONqJBbjRpwqhiWP+zpjmWinQFL3VN1Jf9kg
	 LPGbRaMd60RIXuUtXM4r18nsS2XCGaAB+d9FfzwcrQq85SaaX2C5IPGgiup2Ob3pDn
	 bxfDFGZGex+nzgIhz5qrnKc7SxXiR75chJJv3/1X5gZaYF5rpyLd2qu+QxpTVd+1Op
	 Op3u/79mBDDBw==
Date: Tue, 10 Nov 2026 12:17:51 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        Usama Arif <usama.arif@linux.dev>
CC: david.laight.linux@gmail.com, bp@alien8.de, dave.hansen@linux.intel.com,
        dsterba@suse.com, linux-kernel@vger.kernel.org, mingo@redhat.com,
        terrelln@fb.com, tglx@kernel.org, x86@kernel.org, kas@kernel.org,
        hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev,
        kernel-team@meta.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_x86/lib=3A_Use_REP_MOVSB_for?=
 =?US-ASCII?Q?_large_memcpy=28=29_on_ERMS_CPUs_without_FSRM?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=whPF8CD9zC960jPUi2rMrJ_pq9ytdSYqWoef-R6AHsfXg@mail.gmail.com>
References: <20261104222806.1826508-1-usama.arif@linux.dev> <CAHk-=whPF8CD9zC960jPUi2rMrJ_pq9ytdSYqWoef-R6AHsfXg@mail.gmail.com>
Message-ID: <719584E3-A730-474D-9061-BFF35EA4B02B@zytor.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 10, 2026 9:53:07 AM PST, Linus Torvalds <torvalds@linux-foundat=
ion=2Eorg> wrote:
>On Wed, 4 Nov 2026 at 14:28, Usama Arif <usama=2Earif@linux=2Edev> wrote:
>>
>> +       ALTERNATIVE __stringify(cmpq $0x20, %rcx; jb =2ELhandle_tail), =
\
>> +                   __stringify(rep movsb; RET), X86_FEATURE_FSRM
>
>Let's not do that=2E
>
>Putting magic things like RET in alternatives is just a bad bad idea=2E
>
>               Linus

Why is that, *given that it is in assembly*?

For C (or Rust, or C++, =2E=2E=2E) it is obviously bad chicken=2E
