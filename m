Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794362992;
	b=5LdLCO1qdHugntaiaNJHtEVsDvxmIdQNHdPVnnJu2rz9BgPvvGVSQSk02bkWufTe/B7k
	 +nXmneoX1iXGRRH3Z4xoTpChRbhYrYmgmAnRVcW/iaZ5f+IimAL1C6P/w4RWv+T5BO2c5
	 nsNXYv5PCXAAHNUdcsb9pCRinTthJTEhNhvreTwpsNe/RmAIAkCcZ/63ky3w10eUe5qs0
	 859cYecemUB+1XxzFiE1leBJLXuIWLt+iRByhJyKJtesHJIycDuaiXmL7SdIP4ITtURji
	 0sjLK4wUxwOLR6vZk4Z9rlVR3zENgprQG+K7LxXGhn3SrzBV9KrESrKmciRi8G9AEUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362992;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0kXzSum4pTfZnfSChBeoD4QV7uGtSsuxwhcI8m72H3k=;
	b=SXqE/f5sw9YE9I9JiTHCnyRNONQyydSq8HzgLQL1jwiLh8aFgcR8JGZ9q+kmKyE5jrs3
	 VZQtF+bPcvb20s1m1tojLTBRB3CTwjxPhUtIesbCUILNk5Q2+wl5vq+FehwSvFSZxkuD8
	 d5U8zky745edP4JFLVPd3pR4VTRSRjh2bIQwRgFl3u1Y7SfCh3h0XMYsh/zoGm6dA0Bsy
	 vBDYIKfFsVmIlMTxKXyFdUn9E+r0o5xixi73QxG35NmnqxDcXAAuljsloWlhUvZxkgc0U
	 Xn38e+YB0CQCD22PX6fEvEsRrvQySPDcJQ547CYIoqs2R51JuoF4pdFbExyhocbO3PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=bzctCUCF;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44206606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44206606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=bzctCUCF
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C99A240E021D;
	Wed, 11 Nov 2026 02:09:48 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id n-2Tkrlz7k30; Wed, 11 Nov 2026 02:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794362985; bh=0kXzSum4pTfZnfSChBeoD4QV7uGtSsuxwhcI8m72H3k=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=bzctCUCF3Z6MW/KbrvszgDjNcIqSgHxEol2u03uViTR3dSLlPOqnPLY37dtoCE2JN
	 nJEXlYWlYNUS3wCTZ97R2PgMNk+sKCemwzyjvPBo+iqDEnDV2NikR962c6VfSQsvuH
	 OnIgQJijFBXn2OII/mTWMx8ERcv/YWau4x5LVy3nqls3P4F1Y/aIAevtTIgI9B4oLs
	 RcrFC+fH5xaT0WJB2dSb9/n/MaqzwEUSNcJcKA+fiwwd0SmXSiUkZ27JewLU08g2zx
	 34JqjlYq85yXgejXRHD+td+MkMFesnYJ+TWU38ACSVTTfmbX+4SFjiM//R+5ReFN8u
	 dQRsPs9g5J90/1FNWEcNtV7yGVv63xxRHSoTXCQAhgD85QodvWdMUGF8acHYsJpPRY
	 VBb5cgXGh6Q5akQ0omEv/s0xoXZq34TaZrOuT31BTipftAMnUKvBDjn67fr0ITizgu
	 VSS5A8GXh9oTet9heifPrkU6Ss3eI+EUBxMnsH1+wu1H666h5A7E7qxyDDhp+C1gum
	 VWdlaGggbeckRuWXZVp/okJMoYptc4KgL3XfoqalShXiuc+X6E+bKXSuCBmh47ldpr
	 8J6poe46rH/YutybZjK29mpRZRfZTJxU3bM4q1uA0UnSzNeAAGqWCawkHTAyHOvIvh
	 264lUE3s8TbNCxACr/ICQIwQ=
Received: from ehlo.thunderbird.net (mobile-166-176-184-237.mycingular.net [166.176.184.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 374BA40E0218;
	Wed, 11 Nov 2026 02:09:27 +0000 (UTC)
Date: Wed, 11 Nov 2026 01:16:37 +0000
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 "H. Peter Anvin" <hpa@zytor.com>
CC: Usama Arif <usama.arif@linux.dev>, david.laight.linux@gmail.com,
 dave.hansen@linux.intel.com, dsterba@suse.com, linux-kernel@vger.kernel.org,
 mingo@redhat.com, terrelln@fb.com, tglx@kernel.org, x86@kernel.org,
 kas@kernel.org, hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev,
 kernel-team@meta.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_x86/lib=3A_Use_REP_MOVSB_for?=
 =?US-ASCII?Q?_large_memcpy=28=29_on_ERMS_CPUs_without_FSRM?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=wjXc16n7ppqhuCDXj3WZMiACupW63+BQh0x0OQFTBpf-A@mail.gmail.com>
References: <20261104222806.1826508-1-usama.arif@linux.dev> <CAHk-=whPF8CD9zC960jPUi2rMrJ_pq9ytdSYqWoef-R6AHsfXg@mail.gmail.com> <719584E3-A730-474D-9061-BFF35EA4B02B@zytor.com> <CAHk-=wjXc16n7ppqhuCDXj3WZMiACupW63+BQh0x0OQFTBpf-A@mail.gmail.com>
Message-ID: <09B273E6-9146-4489-BC46-E7455CD8CA16@alien8.de>
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

On November 10, 2026 8:59:02 PM UTC, Linus Torvalds <torvalds@linux-foundat=
ion=2Eorg> wrote:
>On Tue, 10 Nov 2026 at 12:18, H=2E Peter Anvin <hpa@zytor=2Ecom> wrote:
>>
>> On November 10, 2026 9:53:07 AM PST, Linus Torvalds <torvalds@linux-fou=
ndation=2Eorg> wrote:
>> >Let's not do that=2E
>> >
>> >Putting magic things like RET in alternatives is just a bad bad idea=
=2E
>> >
>> >               Linus
>>
>> Why is that, *given that it is in assembly*?
>
>It's assembly, but it's assembly that potentially gets rewritten=2E
>objtool already knows about __x86_return_thunk being special (although
>I think it's the _target_, not the call site, it cares about)=2E
>
>I would like to not have magic in stuff that is in the alternatives
>section=2E We've had issues with relocations etc before=2E
>
>That said, grepping a bit for this, it turns out we already seem to be
>doing that in memmove_64=2ES, although it was hidden from my first grep:
>
>  #define CHECK_LEN     cmp $0x20, %rdx; jb 1f
>  #define MEMMOVE_BYTES movq %rdx, %rcx; rep movsb; RET
>  =2ELmemmove_begin_forward:
>        ALTERNATIVE_2 __stringify(CHECK_LEN), \
>                      __stringify(CHECK_LEN; MEMMOVE_BYTES), X86_FEATURE_=
ERMS, \
>                      __stringify(MEMMOVE_BYTES), X86_FEATURE_FSRM
>
>which is pretty disgusting=2E But I guess that train has passed=2E=2E
>
>           Linus

Yah, I never liked this piece of gunk=2E Lemme give it a fresh look when t=
hings relax a bit=2E=2E=2E
--=20
Small device=2E Typos and formatting crap
