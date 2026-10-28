Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793228087;
	b=A2admKmKAKSydHMq8ugrHmwfPqH8glxGmVShS/n6q6VimyVNuMmvB4XSUOh6FOPy3foy
	 CoPpzk+A6Yjcgd5HowiX/hmbqS5b9khkAHuW4CNFZIndxH5rRFewhUqj6gRxA4dz5QPhc
	 0dUgelqKots4sGnI4V3FtMw0Vi2bzzfTXo8S5itHi+MzmiA5Wn74PdBU/Ox3IMYTyYhT+
	 LAq0n4UccW50uCIPTP9IumlJLhtWL2zLzsv4354S7AAxROwEnJ08tm0YhMtOy9wcGgILx
	 F1girdat7uvEqFm66v0M9kcIlTetjU7zvCBOVFvx17bWk8kkVoEbnu7XEiaPu37Ysxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793228087;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jmFCGmNACFlPFrISnOMUVqVZ/JE+SOakAXip1lWiLl8=;
	b=MJ++BEc+VFTPt3DaUgfUNcauLb2kP3wTBvngkAT7TS2NO2ZLk+8RiNSK/aj4flJHfAhH
	 OuSuCvHnvm4KY6L4HR4+GC+naUhvvMElqni2myKNWjoA+i9RamKrZQAi6atXWqahywBO9
	 Ug/9qiaLJ5HimgnrwDbeMGJRm1nUoU2gI/30DCvT5hndP+mB+luEfLvdBzaV7turOl0J/
	 VP2p5i+ZLxfnVoZI6xzN5vy/GvU+zeqe3rS25j64gb6wcVwU0kk9eVskNThKnKtlbvDWZ
	 u28OG4zbbACF6/yGT4VEQUkrPSg3O48KAI54wwVULxWLEad+uqX7bDyRLnn1WKN1Owg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=GlNWKs5A;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A59606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96A59606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=GlNWKs5A
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D493440258
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793228078;
	bh=jmFCGmNACFlPFrISnOMUVqVZ/JE+SOakAXip1lWiLl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=GlNWKs5AA3HFd9yDKNvf8szc4/4ln6F/ZFFj2KISUp6T5GVyxC7XD+jRjP0xgMw14
	 QQRylVsAjSy44xPODa9nZuyrQ52PiEiDzvRpP2d0jrtay8H/oFlpjI4lix0QF97LU4
	 Npp53lDoniSjudT8cQEz7UjAx+C6037Do7xWboqTRECefr+ndBzBBJAWrA2wm70cH9
	 P+EijXweqgJGKqQ4gTWXuFZnrMTXUSiFfoVySB3FXVMfgL28wVv65uO7hNdyygIyhG
	 0JoDD+kTcghDvtwgDJxZebBdvoKO6k8SaZTTMjwuQEuCfTLZDF1I4Jbi38aO0KLnTf
	 5F3u656VXa0f/WMpiaweu34ZlilEvjB7VYPoKEquL/+DdhQGcuv0ca5ZFTsrBS53oK
	 nJQd3GtvmZf14xy0EBp91lFDwe1Fy/GRVTN7xBh/f0f+ixy62ExkgfGPohT4kEJXAD
	 bwIxIoJf2J4VGli2wvLFIathAnGWKdcj4BmQX/MjQxoWJezxIdckhhp1nWp9b83vvH
	 sZvSvv5epr8NbIh6Ixpo4pUmIKcHh19va7EAFX2KuFpos/hVVZzDv6jm+XaKlPW3MQ
	 MvoiIF+96KdFIWe4i8reGAew8azyRoYMSCC9hKr9QQ/LcvBIQ5JGuwkoEZPUE9qUaZ
	 coPB14Ww6u2J2eNn866FdudI=
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6798c4b8894so1928949d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793228077; x=1793832877;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jmFCGmNACFlPFrISnOMUVqVZ/JE+SOakAXip1lWiLl8=;
        b=esU+VoHDWxH/o8fJkAuS5Nh9rK4Jt3M/3xLhZ4fmxhXE9PulkrWjse9w/izDdg/BtQ
         2UVP7PKpEIrAQGeUp/xQaBXTZF0thp2UEr/Ze4CvATzRkLz/f7+ttFUUOZGtRnHxSa4V
         9geIwnB4ruRuaylmYlk4qBoACP1b31fWpjHBnkK4iZZhmAvV2L847tIAw7HyDZ8DoFLs
         TqJTrBJ/qlEqFUXSSoqR0HiAR3PL35LlgNZ1eIxtqREXlCMrOuJ6MiyX9c6PF6mBfdnr
         mwolgTLc2s0z4j5h3+Lno0F6Zbdg+kponMIz5IxrLcchPYWeUK6Xa92ASVo+/TXW0y7t
         v3kw==
X-Forwarded-Encrypted: i=1; AKwUvBz6ECuzXTvnYDFvbOYkFjuSE4Q8WN8TzaSOMFu2KyxNgQmalaelkbgJNcpEhyxvRAhPEQfcVnri4KD5mSk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnPRVZLzIhQoA19pyhIPLELWbt3MknQYN+z4U62saiYjG+3cdX
	LgarfTGZSVVxHcHvPRWDiEYga/47SPSOLl9pi4s592zrPYwVCrLhEanQuPvUsQ24kl5Xz6qJAnz
	yqCHcF40PlO5JL2LQYGsDjZR6Q97wgvQifeOvycjqAsMuexaeQGQt6ZhYu0XvkeDGKmc5C/daxg
	7ockrC9w==
X-Gm-Gg: AYBFou2mApi7BVQBKdCi4uP1M08puaQYnhTtZtG0Y83cvGtJ4Y79kBiLOHnuUiLCeai
	wKyaft44w6QsnLCfu1STQ2neauvHu/nltGefIRseOzbGu9Qlgy5NhFsV8LrZT7oYz3ca2z2ONy9
	wYLme0HkHFCILyD8KqqPi2lAXYZM02cfvO40OrZnAWEdQph2uhdY4lKrq5dOXvozRHQxivHjMFn
	zUpc0LnecAVIzDNzDg0+851aoL01oxucPKZLEOci+b3dKkowfNyKheIhwxD52mbCpadCjJKN/dK
	3LTwlIPZ6gUP3eA+WhHhb5zMM1T72Rc948EcpAOn943tqXjHv5z7x3JK0x7+9M9WTlyVCKN8fy2
	qfdErZMCy7Wq7N45TWL0O0KSfC+6IRrAwWfZSwg/ACslvXfY2SgQ/lT3D5wQ2+ojSTXttvNgI/G
	RHYhxcN26TpQ+n+Cn3epA1bZm6TR05lg==
X-Received: by 2002:a53:a78c:0:b0:679:5bea:d3e9 with SMTP id 956f58d0204a3-67a7bcbb663mr2324413d50.55.1793228077243;
        Wed, 28 Oct 2026 15:54:37 -0700 (PDT)
X-Received: by 2002:a53:a78c:0:b0:679:5bea:d3e9 with SMTP id 956f58d0204a3-67a7bcbb663mr2324396d50.55.1793228076692;
        Wed, 28 Oct 2026 15:54:36 -0700 (PDT)
Received: from [172.21.9.52] (host-209-35-187-178.broadbandcancun.mx. [209.35.187.178])
        by smtp.googlemail.com with ESMTPSA id 956f58d0204a3-67a7a07e163sm2391204d50.8.2026.10.28.15.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 15:54:36 -0700 (PDT)
Message-ID: <fcab58a3-1a8e-4bac-a96a-1c2f60742d1e@canonical.com>
Date: Wed, 28 Oct 2026 15:54:34 -0700
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
Subject: Re: [PATCH] apparmor: handle diff-encoded states in leftmatch_fb()
To: =?UTF-8?Q?Patrick_Gr=C3=B6ssing?= <invarianztheorem@posteo.com>
Cc: apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>,
 stable@vger.kernel.org
References: <20261026133600.11252-1-invarianztheorem@posteo.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20261026133600.11252-1-invarianztheorem@posteo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/26/26 06:36, Patrick Grössing wrote:
> leftmatch_fb(), used by aa_dfa_leftmatch() and therefore by find_attach()
> to match profile attachments, open-codes the DFA transition and treats the
> default transition as final:
> 
> 	if (check[pos] == state)
> 		state = next[pos];
> 	else
> 		state = def[state];
> 
> For a state flagged MATCH_FLAG_DIFF_ENCODE the default state must instead
> be tried again with the same input character, which is what match_char()
> does for every other matcher. apparmor_parser emits differentially encoded
> DFAs by default when the kernel advertises policy/diff_encode, so larger
> attachment patterns end in a non-accepting state and the exec silently
> stays unconfined. No conflict is detected, so nothing is audited.
> 
> One visible victim is Ubuntu's firefox profile, whose attachment
> 
>    /{usr/lib/firefox{,-esr,-beta,-devedition,-nightly},opt/firefox}/firefox{,-esr,-bin}
> 
> never matches. Firefox then runs unconfined, is moved to unprivileged_userns
> and is denied CAP_SYS_ADMIN, losing its user namespace sandbox. The same
> profile compiled with -O no-diff-encode attaches.
> 
> Use match_char() in both branches of leftmatch_fb().
> 
> Fixes: 21f606610502 ("apparmor: improve overlapping domain attachment resolution")
> Cc: stable@vger.kernel.org
> Link: https://gitlab.com/apparmor/apparmor-kernel/-/issues/8
> Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2172229
> Signed-off-by: Patrick Grössing <invarianztheorem@posteo.com>

thank you for the patch, unfortunately this issue has already been addressed
by daa9ef365c0ed apparmor: convert duplicated dfa transitions to match_char()


> ---
> Tested on a kernel built from Ubuntu linux 7.0.0-38.38 (upstream 7.0.14):
> with this patch the diff-encoded reproducer profile from the GitLab issue
> attaches, and the stock Ubuntu firefox profile attaches to
> /usr/lib/firefox/firefox-bin (all processes "firefox (unconfined)", no
> unprivileged_userns denials). Without it both stay unconfined, also on the
> stock 7.0.0-38-generic kernel. Compile-tested with W=1.
> Based on apparmor-next as of 2026-10-26.
> 
>   security/apparmor/match.c | 16 +++++-----------
>   1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/security/apparmor/match.c b/security/apparmor/match.c
> index 7713484..796126d 100644
> --- a/security/apparmor/match.c
> +++ b/security/apparmor/match.c
> @@ -751,7 +751,7 @@ static aa_state_t leftmatch_fb(const struct aa_dfa *dfa, aa_state_t start,
>   	u32 *base = BASE_TABLE(dfa);
>   	u32 *next = NEXT_TABLE(dfa);
>   	u32 *check = CHECK_TABLE(dfa);
> -	aa_state_t state = start, pos;
> +	aa_state_t state = start;
>   
>   	AA_BUG(!dfa);
>   	AA_BUG(!str);
> @@ -769,13 +769,10 @@ static aa_state_t leftmatch_fb(const struct aa_dfa *dfa, aa_state_t start,
>   		/* default is direct to next state */
>   		while (*str) {
>   			unsigned int adjust;
> +			u8 c = equiv[(u8) *str++];
>   
>   			wb->history[wb->pos] = state;
> -			pos = base_idx(base[state]) + equiv[(u8) *str++];
> -			if (check[pos] == state)
> -				state = next[pos];
> -			else
> -				state = def[state];
> +			match_char(state, def, base, next, check, c);
>   			if (is_loop(wb, state, &adjust)) {
>   				state = aa_dfa_match(dfa, state, str);
>   				*count -= adjust;
> @@ -788,13 +785,10 @@ static aa_state_t leftmatch_fb(const struct aa_dfa *dfa, aa_state_t start,
>   		/* default is direct to next state */
>   		while (*str) {
>   			unsigned int adjust;
> +			u8 c = (u8) *str++;
>   
>   			wb->history[wb->pos] = state;
> -			pos = base_idx(base[state]) + (u8) *str++;
> -			if (check[pos] == state)
> -				state = next[pos];
> -			else
> -				state = def[state];
> +			match_char(state, def, base, next, check, c);
>   			if (is_loop(wb, state, &adjust)) {
>   				state = aa_dfa_match(dfa, state, str);
>   				*count -= adjust;

