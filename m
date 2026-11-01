Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575984;
	b=2ckMqeaGkaupL9OhlMLKKLwZM35/TZlv0fGSdsdrL5BLZ1G4MPGoCjL+r1sGDEMqaXqX
	 5k2ggUW2nuXZ1wCEm4g8RCWb52jhsLTdDhQt6WC1nk0DQVWPX+9BoEr9AQ9lmAgi8gncZ
	 IwRBHJo7jtXKrFP+EQfgZ6iTN8cPvrMX+Fhscrn2rjRUh+cxg9QV9zpnOZjesgNy9XHUi
	 IeoiHsjGZWVdt+bdMdig/D3Cd7tsTEhWp7I9aJ/4tFfe5RqBgGdC4uTcSpvAszIVKGz9n
	 76DG0JnOCzcQm6EIl++da9/VP8u3vA5tVy9+YxXbfMdGxQTaw+e3G6PsZ1DV+hZRTgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575984;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QSLh3tDgf+UO2VbPvGHueD1hNyph2JTi/4qbDhaCBDw=;
	b=jxuxnXRDkAHGJDzxktKah3zdjHV5BqQ2Zn9wLYiFfUTrFEbl9q2haKuuhpGo4YlSm29i
	 XL+W5ORHr+zFezEdmw38mhXHDtX20rbHBl4gx2pFArq2LfqpAS27lt3RRFM9ddpxY9RO3
	 mdOlSaJON4CyAvXdKgdkZ4Fh1lnh50eO+sjCYZXExeLYZ7dlI13xlEF2fLg4dnddNcK6S
	 ttViIxh5WBzBhZdEasRQ1oC3K/xlNtsAYatngctVxjT6wi79z4WEX0580AiNVi8poQl/S
	 ylvfYU5OdJqutMatgVeV+CDAjKCH5Y1Ma9jCBqlTHdaYEZQ24jijh5G4Qw+p+Y4ZGlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=WHz69DzH;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WoSpoV++;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A43B606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A43B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=WHz69DzH;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WoSpoV++
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id AD836EC0662
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:33:02 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 01 Nov 2026 18:33:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1793575982; x=1793662382; bh=QSLh3tDgf+UO2VbPvGHue
	D1hNyph2JTi/4qbDhaCBDw=; b=WHz69DzH+gBfjU0x++/09HHhzNepZk3oKEJ/M
	hA4A6nXcnHcYIJbDGcvoTAvtBhMzN6wam7ozzlsbPh8Wk4iuZEQlO/oW9Ep/gE73
	EyE5kyMXUxpblZfIOqaLSmvU3CKKEOLNa6tromXRbR2t2gMS9xKtHUVaRrj6VzGL
	VgTJq3FFrJZuZt3VYiny/TIyfvflu3+VhHZkULXlN9VP1t9kLn23RuXKNboJ9wf7
	hpLjM5fFWNoNxpAIN330vHY7IIYfsBFvCVvMH5r0qjbyL8EvwRfKLtKaPxmNyHL3
	lvsByHEi7JyldbgVfLavzPI1IHzkRtKVgagEWmzl0T17Re+GQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793575982; x=1793662382; bh=QSLh3tDgf+UO2VbPvGHueD1hNyph2JTi/4q
	bDhaCBDw=; b=WoSpoV++cIMpLUnfyBWaoVKDMsO8Gv4fUL0m1e+lnlzD/dJ7Jgz
	a67gh+G/dlceffmtEqhyw7cwSkn/1AA4RSFlMTy8Z5bWaKXE/XlzyOOkSpNegpRY
	mxi3QpHmKfWMBU2wcQ7m+29P13zBu3snRRseqLqHouZI8VQ9v2L07U0GX2/AF9ne
	rRu3jGw5TEJ/NIoDWkWX7xtRHBqKQ78Efw9K7X01eAjsNtAEFlsNrfY0m3NqeyiA
	Gi91/23Vh6KOcRsAYn15OKra4qFX4/zITDwo7QW8wiHJE/136Yyb+TciXJX0s5zm
	4/YFu+uH2gXPy/NMDr1OEALPcJlhg7mTOGg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793575982; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:m5GBHUnMGZFqpvTyMMDAmLFiklioKk5Zk3WWeTqYBQJATje
	6IavvocdJPuv9MrsyTPy/+zc+P1adGCAEuYUEkHXkEeC3il7x8FrNTJdyXOdqWAt
	LnxapD5si85hFxsCtsUWCNjyb45dYvupnTBz88EufYkGUSB1LebfE8kIW1RSa82k
	nbanotqluzCoRWCpCMOkvlQAL/MSWMP8+o/mfB7SZb2QZaCNi1fBGeiobHY4riNO
	ytfOtwumjLuvZ4bhfXbBGu+NJYANZKlqDF6L6L6822sVZY3RDuuzZczg/F4mRjrP
	tZVmgmf88okIO2jA8TTVhPbTJLUKbBEolZjIb7Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:ZMJbov8JuNSIqCHKXpucecxq3AQucTYHUURh31DVQlo=:l0dmLBO2hFFplbUBvVLQcMNvCDDH0si9qJ44zyYnnlU=;
X-ME-Sender: <xms:LcznaiQMzwtXnpV3h4MMKgNDkUAg7-AvE2eBnfVQtai6FYSRtL8KGA>
    <xme:LcznapE0EhOiBY_7eGf3GsNP2TU0EkDb4iT4YDzRMaltg55N3wZNbxHpOa7TNXlO6
    HA3UnSSEo5vrteHrsmaOHKclflb68XCuc3jXnWXP318PEfuVl4Vh96m>
X-ME-Received: <xmr:Lcznakes1UjcXHp1P5OllDFrgvdS9ZaVw6DuUOgiJZvEybXgDYWoUmKKlL4XGYHpqWE-iZXAbwCpAxofVc8>
X-ME-Proxy-Cause: dmFkZTFpN6cLuvQKoAKCx5jz9voSAJeR9s7tpZ9sxXPKgVaVrUL8JZW/cW3sWX51kAxmWN
    CUKFe+OsJK0mC5ws13OYOpN8CgDgPqNZ5bsgPBeCgq57LsYKOheODPq6tG7uOuFWsC2jA8
    xMbqyccghezmyZRVZv0dQJBPYtlFpAu6fowqjeWqjdY/hdM1obSKLSpRspNtqjPpgD0l/T
    DIqJSqsU7csgSwosPXNsQCMXgfYFCoxoXpLNRlfPKuQyk2qR8BCoSKm/WfFhQZ0xDy9zuW
    zegaptOJyYvWLDEMrz2Y3yPG9ygGs3rCoOIPKDiLLu/LaxvtLG+LYEQob4q7XJawP/8iR8
    4XhLWyQKU9L4iiEDAe3MTV4xaN5xEnrbVor//8TBV94eh7M1aj5j1QBM4GbEtG2Hi3dlxL
    slNFjNqA7OXIjgIwE4gGsVbDLf9T66KjTiqhdpZcbfL8U99UD3cSFTvt9bbHtFJ3hD3iIB
    aHf0mX0zrnFrGXqxylwE0mLqQQ7Y5SKsOOHb2DDTUyEYp6s4SQ98JmipHOBHprvptOgbFp
    kvF1H78p5vWIhPc7g0SSZDvluNU0B+JpLOtYsk+csHG1UpyRD0zp5fFTp3+fqE+G1th9HT
    Kayn0A18QXl8MO46v8ehKHv8l+wULZx1IPESfVynMWgjgIy2MnK5qZUZ52HA
X-ME-Proxy: <xmx:LcznagvM8QmMbuNZNsvpdCyiSofzw6xBVhVaKpxG2mqzfT_BZIcziA>
    <xmx:Lcznaidgj2NH0nrJsIiXpCqqi5ixBGSUR56gjQuMMZDAFQ3iWoq7dw>
    <xmx:LcznasrBz8WLSLxXse11-BMWBxkuRWrT1jJSVzKRFa2CTSF584H_kQ>
    <xmx:Lcznao9Ch4iY5jH7SdwF4jlIXBET08KPRKQe01COHgYnid5S9QOhBw>
    <xmx:LsznagwOdPhpce0ZRVhfBpKIsKtvZi2zTfYauEqgOIxeROnzFIRAiwZg>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 18:32:56 -0500 (EST)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	gary@garyguo.net,
	ojeda@kernel.org,
	tglx@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1 0/2] hrtimer: Add hrtimer_forward_safe_from_callback()
Date: Mon,  2 Nov 2026 08:28:27 +0900
Message-ID: <20261101232829.593680-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Safe Rust code can arm a timer while its callback is running, so the
Rust abstraction cannot offer hrtimer_forward() from the callback as a
safe API.

Thomas suggested a helper that does the check and the update with the
base lock held [1]. Patch 1 adds it. Patch 2 makes the Rust callback
context use it.

The helper is not Rust specific. As Thomas noted, it can be used for
i915_pmu too. null_blk can use it as well. I can send those
conversions after the helper is merged.

[1] https://lore.kernel.org/all/877bk3ixp5.ffs@fw13/


FUJITA Tomonori (2):
  hrtimer: Add hrtimer_forward_safe_from_callback()
  rust: hrtimer: Use hrtimer_forward_safe_from_callback()

 include/linux/hrtimer.h     |  4 ++++
 kernel/time/hrtimer.c       | 30 ++++++++++++++++++++++++++++++
 rust/kernel/time/hrtimer.rs | 25 ++++++++++++++++++-------
 3 files changed, 52 insertions(+), 7 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

