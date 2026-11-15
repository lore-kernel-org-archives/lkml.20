Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794750216;
	b=bx6TMgNJAhM5qWtuUs3LX0pZyiaaUs2HHPp7R5PANmsS14H6EejkiXLcAC3b09N8OPkA
	 Tj7N03eQ/9nfJR0Av9zkXFp1y4PQ8xDDR1mJd7WbMEqIPyelbZo0YngP5BSSTTsIxOI2T
	 5d0IDnl4C12g+FG6mNH2qd7lI51GG535gAmEBgHOvECGjW8mJgWqCNUZwMt5VpK14iwde
	 tPX1i/MjUJaq4oCr9ayQwslCFaypwPVrQCIkceCd7MKLUeR/W5I3+B2D4wCix3tHPoWv+
	 TkS7cPGCZg6Q43ucLBPB9zFwYZdlVirqBXcnMXySpoZzfZSVxnQQ5yubIzq2G3Z4Oyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750216;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=r1BWchFZ0F6U4eL8O5cOuqHAnPS3YQCASCANNaxwnwE=;
	b=NjgZYK4/rTElD2jtyM9Sme//X5UcvOxp5d40j7iW00vcp+0QiWYLlMmLBTPolgzcUmI4
	 Lo+RgDXyqY+qCkyW1BkqpZ6Ts96onvZjYlkpd57DJPS0fUSu28UGOV/+SJK4G1NeZqbRM
	 zH08XtcPE7785GdsyrUAbt/tK9AvJa865ejZ8pPo+7jxAi15B86CHo7/F3TwREXSYBfQJ
	 PhU08bUt+e/NnB8wXm0CtqRrwWKHrlYP23FGf2MMs8rbJmUd41brfsWR/HORyg9txwtM8
	 jAK6FvaWp8+LNSCN/pDjxur5MRRS+mCxVlnp0FjRv9DUgP7lyv0ByHJCo10fNjCJYiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=spfOm6x7;
	arc=none smtp.remote-ip=91.218.175.103
Received: from mta0.migadu.com (out-103.mta0.migadu.com [91.218.175.103])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF037606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF037606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=spfOm6x7
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=r1BWchFZ0F6U4eL8O5cOuqHAnPS3YQCASCANNaxwnwE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794750213; v=1; x=1795355013;
 b=spfOm6x7sfenH13qNLn8ER6w5DV/ryfpEuDUr6k65eZ0IyHssOKHvWFKP5H8wSFHWD4aa2IL
 bnOOtMo4ckeH71SbJnOt4KCzb4y+meL9n+3rII5AOGVdALJhDiSNfSAo4iGeM8N02QQ3iaQqDfC
 gk5ehHnQbHaRrLv0eWS9908E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8dc64cd74b0b1ec3;
	Sun, 15 Nov 2026 13:43:33 +0000
X-Mizu-Trace-ID: 8dc64cd74b0b1ec3
X-Migadu-Flow: FLOW_OUT
Date: Sun, 15 Nov 2026 14:43:32 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v4_7/7=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?12a=2C_8821a=3A_respect_peer_A-MPDU_size_limits?=
In-Reply-To: <20261115114336.1739863-8-hjf3108@gmail.com>
References: <20261115114336.1739863-1-hjf3108@gmail.com> <20261115114336.1739863-8-hjf3108@gmail.com>
Message-ID: <68091FA5-A6C0-4485-A01E-E1D3C2132552@linux.dev>
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
Content-Transfer-Encoding: 8bit

Hi Jie Feng,

I have one comment on this description as well.

On November 15, 2026 12:43:33 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:

> Honor the peer-advertised receive limit for transmitted A-MPDUs.

Could you mention that these chips had no set_ampdu_factor callback, so
rtw_set_ampdu_factor() returned before programming the peer's limit?

I think it would also help to explain that the new setters clamp the
factor to the chip limit before updating REG_AMPDU_MAX_LENGTH.

Best regards,
Luka Gejak
