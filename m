Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444581;
	b=QRKj0QnDqMvlKgdEWYINQfiRrAV/3mKTZqsG8NOdvFiXuIGnDot/up8SJOZ/I6mEmTdB
	 TU6lOuwMqCclFfJ9erx7O/lSlSXRruFUjlMO2yVkw85N6P8UP01aKNLUtXkZkA43aSoX7
	 2ieNK5kdeC7O3Uzp2LTyMM+oW3bQSSDh5h1oC8KYLg4L8YrORrwvZud7Rr+zobkAan943
	 EHynDRpGWTybKv/mfNRU8cPewcSoEp+ypejIx431nipOVTbeeD8E/ImcnVFAYlnLPt3ht
	 9p6bVZqbxPRziW+wT9KN7bSpyJpMjSqKf9Ke6J39+5K2YxTfy59hhCas86DIBnUOePw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444581;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ZtBdZZ2y/x9exxNcRQ/x81Vnjl9bfZz0OPbrh71ClLA=;
	b=jUSAV8sFoNg1HTmSP0BND0rVqRCtALT3XKP8/N6YeQnakAX8yM57zvC6u1W8ukhdtu9P
	 FYp+vmfNadL2e0gR2Wj++iRhQDmPeTwaeBJk8iR+M8BLzP89sReXhNTh2oxAe6jkXQvQT
	 muR+S05tNtOZFBEcrCGsJoSCkJqTmhh+Xi/oyZEvkf9nVX41KifUrdl2TH9L4oYihnpjS
	 Pdk7JMPDCU75b7rnxKCFag4Oj4NLGXXGTkBm5nu3YnriUvMusDtM9M1xmiAB49TAqNvtZ
	 cIR986TYh7fgkusISv73iBjXVIZbto/0TK9USF3prbhtJDsAJlorUpC461EPCCgHSEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fluxnic.net;
	spf=pass smtp.mailfrom=fluxnic.net;
	dkim=pass header.d=fluxnic.net header.i=@fluxnic.net header.a=rsa-sha256 header.s=fm2 header.b=tIsgrW6N;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HWD5y7v1;
	arc=none smtp.remote-ip=202.12.124.146
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58006606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58006606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fluxnic.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fluxnic.net header.i=@fluxnic.net header.a=rsa-sha256 header.s=fm2 header.b=tIsgrW6N;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HWD5y7v1
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 84B821D001EB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:16:19 -0400 (EDT)
Received: from phl-frontend-01 ([10.202.2.160])
  by phl-compute-05.internal (MEProxy); Mon, 19 Oct 2026 17:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fluxnic.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1792444578; x=1792530978; bh=Zt
	BdZZ2y/x9exxNcRQ/x81Vnjl9bfZz0OPbrh71ClLA=; b=tIsgrW6N9iEE1pq1nD
	2zIE6QBvAz+RYPKuOGVgqidtcmv2NYqFZUB14YY0YNOo13vyUp5vBjM/tWSeBObp
	InS9oLbUOvVjOvK+4x1NKaW3W3FvZvLi32LE06sJYRXlF39vmRAvfeGDWz/f3LAz
	iiuC7gbdp1kI23UaZWFm+NQLCOsnNomy+jLZEFkxZRFcsd6WHvhhmximPxYkg5r4
	MU9/6FifpoOFE+H1YkSkPY4MYqSGcW9KiQhYNhGUzKCaCyU9942GHDTY1/7rWvu/
	HuSZQdv0sSpDXvPWCAVofzCOSZiMTeKvID4kPvc2B4WwgzOQu5PJ7/KEZjWWk+Ic
	5+QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1792444578; x=1792530978; bh=ZtBdZZ2y/x9exxNcRQ/x81Vnjl9b
	fZz0OPbrh71ClLA=; b=HWD5y7v1O+MQ7atpJd0sxKsqRtZdg1lxjmNdwvl6uyIn
	r50taiR14+u4yE4G0SuhBipYUfOsFKxTE/dXcpqY2GZh4+ZBnlgzqIxyuPCnirwc
	r2j5mLgYeNXLT1aOPu4Vvo4bSZWBm5f96Dficd31Wc8y7GDzFHmNZt2LWGTZlnfm
	Z5dcYswHbQ3NcwrcY4m6leIBx3tkxg4L0t/7rMbCMAzjtqZ0cqjBg/UVQ45TPZwS
	5LUOS7J3sUL9E+1XG/Zlh7Csd6zV2qctALuh61eQStTnEee6ejZdm8R9B2Ko0dWu
	HyzXWjsnFahgYypSyuWX34h/bxypXpldZ7WvGrEHiw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=fluxnic.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792444578; d=fluxnic.net;
	mf=PG5pY29AZmx1eG5pYy5uZXQ+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:ad222t7MdM3TZyXSOQKvEpYK7EAuSDCuBMfHcIZkEr9NOus
	uoHuvGSlFZbmwIhhZzvtFE7fYy8qpO7WYSezlb/qH3qkc2h4TCqoZFQbYu/9RX9i
	XDVScx8Cw/aTf28MnKkEKxl4KRQalMLyDvzp246e78GWpFctuySAzSr6mbMDjqLf
	o/O7SRHZZ9wji8C6R3cmFZrXJMOB2kKX8svn1ADDbaXxkzHnXi27nAWSiDlywIX5
	03QVIf0QmrkdL8GX7qscuuLnPZ9b4pqBMieloPR6w5ujoUldAMbAfAB3Jq++XJuK
	gWBr1LnBaPfW37FTbHth7LDuNjoJ1Vt5B0NXnvA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:P5mBBhrlimBV6DrfNmGzM53q0YO49YrjTpqqeZT9vCo=:JJHiI3/hLn0rInVn0mMjdDHNO7GtSBwE6VotVa8hsM4=;
X-ME-Sender: <xms:oojWakvmRR_ZWy6p7rugEtaGTVJef82bPRHoPU-TAB3-XHqLV1mPEA>
    <xme:oojWai-ab_ob6TrjTMLmtdf5rPahRm4Elh7qhkq8OeTqscLRMGBqoLzhXA6WaEv1M
    WwpLZ72wELp3-jyTa_4QKxLamVuEI6H2surXzffn6nvkiT6D66wLe8>
X-ME-Received: <xmr:oojWav2cdADV4VfvDjz5GwcPtLveNlGaKljUvSw5tA1keCIWShuQ4mMkSLW024aWP8Dbk6Xkh7Ry_GXI6PN0jGD750r9C7G9ba5ZbuDl5_LypJs>
X-ME-Proxy-Cause: dmFkZTGO0ea5rJ9QuY2j9jB/Yx+yAw+H1ve6nHtaoJ8TvZG/de24ggAhiZWOrhz5c2uqgx
    ocETIfIwHdgCYYlMnPihRcGVLhZcPs0vreNbc6y6wsF5cQHdLqUnEBN+6pajwAQ2Bv4PR2
    andGNcGEo2KHhXLLomi1E8thUcCduCvWcj5dkma5xTHm6dX+Gm1doScAXTlpI2MvppxEsk
    kFpOQyiot1X/sw9bZ+g0SKveMgEJ4UbGdEPcNjsBeYTa0XVrJYPCVjaGwZNg7nqcOgVf4K
    uVW9IOqr7pdu550TuFUKcSDhuTz/60KLpxwMz+XpgUilPBGEiGzIrW7EAaCYdU+pnd9AXw
    UwRxONUDrNPQ6iun5Qriifdf6hHCuz1JK57jEBNgJ+5e5UQ4ofunBqFhpnl8YjDDawTvCh
    TMisEEBYlBbgv3WXSviYvygDUsAQFgv1EJrLuj+CNUglmb7++VriQo8oNQO18UrWucpeoB
    W6gNlASU1EcGDAoBf6kJ1KCe/V+5xtuBpp0+xEjECm91+JvPom7gN9UwzHKbI+6bL7or8h
    cgxc1EYM72AsmOvaJ+AHb0msOkuVtP/EjtRgE9rRBWCgnVzPge9bnDwyCteF5NnwARuNf2
    XcZeaI0+u3DQrneHR0JmhrIZSAujVHbwQSCTVqdt5R1EwsOAgrYF/fKO1nlw
X-ME-Proxy: <xmx:oojWanB_6hmGvEQdCcszg4PVCwl_-xy29wzScMfUUM8mISWDsKNpOw>
    <xmx:oojWarcq0Ki9cLOr8MF-fEjHscRN8Lm6hgik7jmWwPUpJQfUif9sAg>
    <xmx:oojWak7bJ_GHIYyYy-x85DabJuMLIzEsKFcd__wBQVaAbQy18Lb01g>
    <xmx:oojWauXOq5XqeRRfeLUBJ8e7S2AAQ4aIuxcnI3ItabhtQdPEoXGaYQ>
    <xmx:oojWaguzq71yMThf19VrNrrPRWr0ebrk8U85c_p0FZK1Il87i-gaaeaw>
Feedback-ID: i58514971:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 17:16:18 -0400 (EDT)
Received: from xanadu.lan (_gateway [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id CF80B23318;
	Mon, 19 Oct 2026 17:16:17 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nicolas Pitre <npitre@baylibre.com>
Subject: [PATCH 0/3] vt: make VS16 emoji widening controllable
Date: Mon, 19 Oct 2026 17:16:14 -0400
Message-ID: <cover.1792443833.git.npitre@baylibre.com>
X-Mailer: git-send-email 2.55.0
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
Content-Transfer-Encoding: 8bit

The VT turns a single-width character followed by VS16 (U+FE0F) into a
double-width one, as many terminals do for emoji presentation sequences
such as ‼️. Applications that compute widths with wcwidth() consider
VS16 zero-width though, and those tracking the cursor position
themselves get out of sync. With mosh, a single subject line in an
alpine message index was enough to leave the whole screen scrolled by
one line.

Terminals are split roughly evenly on this, so this series keeps the
current behavior by default and provides a way out:

Patch 1 fixes VS16 widening only taking effect after a double-width
character had been displayed, because the Unicode screen memory it
relies on is allocated on demand.

Patch 2 lets applications control VS16 widening with DEC private mode
2027 (from the Contour terminal's Unicode core proposal), with
vt.default_vs16_wide setting its initial and reset state.

Patch 3 adds DECRQM so applications can query mode states, including
2027, rather than waiting for a reply that never comes.

Tested with a program checking the DECRQM replies for all supported modes,
the VS16 width with the mode set, reset and after RIS, with and without
vt.default_vs16_wide=0, and that other CSI ... $ sequences are still
ignored.

diffstat:
 .../admin-guide/kernel-parameters.txt         |  10 ++
 drivers/tty/vt/vt.c                           | 114 +++++++++++++++++-
 include/linux/console_struct.h                |   1 +
 3 files changed, 124 insertions(+), 1 deletion(-)

-- 
2.55.0

