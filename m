Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793532478;
	b=rha6pGlynO9MxNqBVdcJDaXoxubGcrqZuJrlY7rTeq3iDm6eleRJUMSbxprwO0OSxxKb
	 jCQrMf0X4tOOo2fQHWX/irilxJCDJa/KUGTpcpEtLMEATfvY3Ax3xCh6k7RfiMmpjpvn/
	 kXermCCDs+9KLm/1qjGTgWXSNQYb6uFHmI33QnH21qiE30oFZ7qcMzLtwPS/igFWn3bF9
	 R99Ap+YTEyRySur29xBtrNpw5Xy+19cDzfyeb+bmDwgJMg2dIBjT6jHdV4kLNWv/DbdYI
	 meFUJC5jItBVWLR7V/RHQurTR2KGSo3Uhp57+y4Z68rp7Twda3cq5adSS8/F67H1aPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793532478;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=siqR+D9HkbI6+sWgtn1cpXSgsKhOnoez6zawNDWUpYc=;
	b=cOw1AaZ6bk2HNwyQhCHAaJoyAMs6VV3H8cpdbyc/CgiqABlhoOjHkdYSuTIdnJv404Uk
	 9lzPvVM3sjJNb7M8bOgg8it3llEOXTbDuW+MCRKEnY5eWAIB6/UpEuz5xU4Oxg0ZgiSIG
	 jXCdf17SKNnnN7JODBecpsx/dOkyJmubksFStT0o69T+pkVhewThudfotX3af0/VaybEx
	 TbU6A3BfQ22FugzZwtCkQV8s0eheTd0URDd9W9ohXKcfe/LwL5J5VxS2oMLvGt4aYlYKR
	 dzCYTonNlJ8+tGZbJMfbmGyMNQUwzAg2kRaNI4cMUhiReSm/wQHFbXBvvGIbJ22TlJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cB1Hk1sN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C980606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 11:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cB1Hk1sN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8D21F000C1;
	Sun,  1 Nov 2026 11:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793532477;
	bh=siqR+D9HkbI6+sWgtn1cpXSgsKhOnoez6zawNDWUpYc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=cB1Hk1sNxBlDNzC+BygHOB0Weos2tKXuaBV7tar8GHJCQwSgp7IrGYkNyisex/DRq
	 t7Li6T/8l0AKgO40Fa74Y2rf1MxMOkB8zgqocDos5g2HK/eYCUsX+natjhHWWftQBm
	 gNb9g9xFCbHCfK5QLbTwAuhl0NlQR+08yqhhHJUFLv2wmP7p0r1ZEBi8Co4xzUc4uE
	 bL4VPOSSbvEz6NvYiKJPexnRAJtX2ByTA17NccAaXfAxkTjqzrNcSF2eE6Mx/rUXBu
	 9UOW65ULWO9Tz+fWc0bFzyttc+kFbhFo14mwaYoWQk9QzEGULqH1fDwHwByRAlooYX
	 +2zKpBltKmxZg==
Message-ID: <bfaee19b-355c-4ada-b1d9-f95b4f1fe272@kernel.org>
Date: Sun, 1 Nov 2026 12:27:54 +0100
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
Subject: Re: [PATCH 0/3] x86: Make processor vendor selection available
 without EXPERT
To: Borislav Petkov <bp@alien8.de>, Vincent Mailhol <mailhol@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
References: <20261031-processor_select_is_not_an_expert_feature-v1-0-6227bdbbe5a9@kernel.org>
 <20261031214351.GCauZhF1l6ENBfLKIS@fat_crate.local>
From: Vincent Mailhol <mailhol@kernel.org>
Content-Language: en-US
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBAhsDBQsJCAcC
 AiICBhUKCQgLAgQWAgMBAh4HAheAFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmrTM8wFCR1O
 HxcACgkQq1/riG27mcJ2KAEAhG19xBSkjiA9dtatvq2WJnGaes4SUmY+LSn7dh1Lf7YBAIwB
 lsMMmigMTk3Qgwymg1nT+Z8z1Owc/TGtRlo4ZcwMzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmAhsMFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmrTNKcFCRUFdT0ACgkQq1/riG27mcLEVwD/VmnQtTf6yhowaIFj
 AjUtwiyQz9ja4NRu9GOvz/pb2L8A/3QcADR0dcxADGsmOiBpN2M9KI7nqdNIq3VPM/3/5fcB
In-Reply-To: <20261031214351.GCauZhF1l6ENBfLKIS@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/10/2026 at 22:43, Borislav Petkov wrote:
> On Sat, Oct 31, 2026 at 08:51:48AM +0100, Vincent Mailhol wrote:
>> Restricting a kernel build to a known CPU vendor currently requires
>> enabling EXPERT.
>>
>> Make PROCESSOR_SELECT available without EXPERT. It remains disabled by
>> default, preserving support for all applicable CPU vendors in existing
>> configurations.
> 
> What I am not seeing is git archeology about why it is behind EXPERT and
> whether that reason is or is not valid anymore.

PROCESSOR_SELECT was introduced in 2008 by commit 8d02c2110b3f ("x86:
configuration options to compile out x86 CPU support code"). At that
time, it was gated by CONFIG_EMBEDDED with space savings given as the
main motivation. In the thread [1], Bodo pointed out that this wasn't
specific to embedded systems but his comment didn't get any replies.

Commit 6a108a14fa35 ("kconfig: rename CONFIG_EMBEDDED to
CONFIG_EXPERT") then did a treewide renaming. The commit explains that
EMBEDDED already covered nonstandard configurations beyond embedded
systems but does not give a PROCESSOR_SELECT-specific rationale.

Beyond Bodo's unanswered comment, I did not find further discussion of
the relevance of PROCESSOR_SELECT for non-embedded machines or the
Kconfig user experience. The main point I am raising in this series is
how easily users should be able to disable all the features specific
to CPU vendors they do not need. I think this aspect deserves further
discussion.

Finally, the size savings have changed since 2008. As reported in my
tests, an AMD-only build reduces vmlinux.o size by 8.88%. What used to
be a micro-optimization back then now has a much bigger impact.

[1] https://lore.kernel.org/all/E1KRp7q-0001pd-61@be1.7eggert.dyndns.org/


Yours sincerely,
Vincent Mailhol
