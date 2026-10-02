Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C46476060
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933767; cv=none; b=Tnzqf7JQSF6uvl6kknhy1amgisFgGMZSHWF4VVYo+CUEFjIz3Ek+8NNQ7fHY+39VRGauqE3MXbAoLxHQMQSOOA5Liwyo2/Jp1OjbB+q66GUuZcaPu1DQSoiHAVrUlMx1weqSFGk7PrRhqXwcLw/YQtg+RnzKDrkXlxxZUSyY/VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933767; c=relaxed/simple;
	bh=Zsf1pQQB4VKLLPcQEDPxR20kxES93Ju+kbUXY1R7SuQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=QnMIcnUHsfym3qREO1V0GsR7EECy81DVVe4cTnm50xnVNjPZI+37vuN2pePNvKCaJBPOsIeJogWDAiR1LOvX3jL1+i6UC3rEaTxCE0SwYgNBIjjyRWqhZUidEUAUDDbCYC2RVFIS6N7yHKWHrnjcAyzPXr+bWwvOyyPMQtRyXO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B3xDb/U/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B3xDb/U/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADEA51F00898;
	Fri,  2 Oct 2026 09:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790933763;
	bh=2HOOhH0E1YJ9KgLS3UcZUXn52umFkKx4pRVoJtCyU9s=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=B3xDb/U/o64r/OF6zXASGxFRhoz73eYAWHYZo5Fh6ICzTQLP+niukQnagQTDIKo05
	 0AKfHH/R+x+mapjUL2E55ML3rlXZOoNEnAqHBmuvZZNHiz1ApVOb1lm/2xIF1RGW7N
	 eEyRyHSBQw59hcjlArcLdx6FU5jj7jCD5dJEF9QKJDP3jyYQvAdUq3Ee6lp7IOvQA6
	 8G2uX1KQAN63nJT0IWGDblaqnSzF59vU1kB0rAbGfKSgzYAG0TkI4+P/YQyDQtHehL
	 B+1VtPx3WQRsG7gfLhOWWgAQQN+TLpH6lCbC/mmfdrBTgsFR026r1EyuP+Vbq1oK++
	 S0lLcRjLeNvGw==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id F09B31980047;
	Fri,  2 Oct 2026 05:36:00 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 02 Oct 2026 05:36:00 -0400
X-ME-Sender: <xms:_3q_ahh-HJdABBbvD_5im8EdgMxCGd-HrnbiGai43kR6XB5hWrg-gQ>
    <xme:_3q_ag0UGtrnrbEgI1FL-EmYj3GY4pWocrmSSmAJlpXb-RqgtRJBGhWRhYfgcaq-S
    oV1Gt2tis8nnCL3rRuMsRmiRG7TRXyACMq2xQI4gzWu3FiWUbgUkDhL>
X-ME-Proxy-Cause: dmFkZTEhlZQ+oN4nxptpdl3sC99hekWaxst6CLnUWxQRpCoMQJgi3Wz0gzlx5qkinSJZ54
    MpTXPfc5XR/eI61UzzKUdjoJYu3IeO2xiwOiaWbhY4kELxV6g6mv3TwoczCv8tNBeNvQ7Q
    YgKIBii7K9yk66lcJPvzm7M2CNmI/le/J/jYKDKLiDn4S1RAfi/HM76HbE8KLmNZ4HgcOc
    rdWBwJWEHaTWWi+bj+8hDUtjf9QY/HnFeai8UVZzwfyYKi22zo25Y7Pu413zalqpXx2G3h
    XeAGHhQcjGQuWFHVOcl40qPoAGNty4JOve3FrWszBiTXVIPqzSf4/CcxCrz5vPHiJ+dwAw
    01elM3Wvi1cYIb+WyvKpe8kaJ/Oo0GKtD0nn6YkH7ndfqmR7sMdO1/gY4aV5SVswMVjg0C
    d9ZDexBgoiOmSDu7NsfJQNJsPFhXq5ZdEVvGLByCF4f1PyNuqDA85Fi9kp4gg9EwhSYK6A
    S2b4NjC3Zp/V42E1qmWSIT9zbNHGzrkhTIvEPxW1aEKMCl37kVU3Hy8p4IwwYzJEfyhilD
    kG4vDfWsmjzwluc0PdaWlpOvlen4h85Y/1QJkHh2wiIwyMhLuD2j4h0VPplgbg4J6yDPiF
    NW8DGOZDGsWDspDKAsYqNG27BtLY/ruEKkFXLFAgzoY6M82ZPgqeUOgBm04w
X-ME-Proxy: <xmx:AHu_atM5k9v3fCIN5VRm7voLfSgKeeOUgJNvXez69ALCaNTAkBo1jw>
    <xmx:AHu_apSgFPDPqUcYi758DZEcooKQLfUzSBRIV_LzGk-GoLsNL9s5ig>
    <xmx:AHu_ajgm84fgPKnX8C14KAETTKvksQI5uqEblnJH4xhs4X5PMr0hRw>
    <xmx:AHu_aq-0rbETmmenGgxPHk8WNvlbo8XHHmW-G3RozenZ15F8n15n3w>
    <xmx:AHu_aiGfpxiW2scrgWq9kkbhZNLVJYqD5QdC7EQsHsBr3qSPe5RZn9AG>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4E3B9F8008A; Fri,  2 Oct 2026 05:35:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 02 Oct 2026 11:35:39 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>
Message-Id: <421b8d6e-1a95-47ad-9e0a-35b390cb6ade@app.fastmail.com>
In-Reply-To: <20261002034405.49886-1-ebiggers@kernel.org>
References: <20261002034405.49886-1-ebiggers@kernel.org>
Subject: Re: [PATCH] lib/crypto: x86/aes-ctr: Remove some unreachable code
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Fri, 2 Oct 2026, at 05:44, Eric Biggers wrote:
> In the AES-CTR and AES-XCTR code that handles a remainder of '4*VL < LEN
> < 8*VL', first 4 full vectors are processed, leaving 0 < LEN < 4*VL.
> After that, five different cases are handled depending on whether there
> are 0, 1, 2, 3, or 4 full vectors remaining.  But the case of 4 vectors
> is never reached there, making the code handling it unused.  Remove it.
>
> With that done, the '.Lxor_tail_partial_vec_3\@' block would be reached
> only via an unconditional jump.  Therefore, relocate it to the only
> place that jumps to it.  This allows removing the jump at the end of the
> '.Lxor_tail_partial_vec_2\@' block and making it fall through.
>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  lib/crypto/x86/aes-ctr-avx-x86_64.S | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
