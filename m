Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44BB4AB1BC
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792330201; cv=none; b=T3cA795wLc2T3P0oLu/+ENv5mI7lce5KDzL7hHsygCDGXXZt4HkpBtxL6Ppx3uWnn7sUZovFx9Ohiv6BPQ1xpdVl84JuJRBO5y1MQzBjivgAQ3to7LKBDMfnegb/yZ4Lrtbw/d0E9HSLR0TBBAap0YQ7NenYdkU4BShYLuLy4Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792330201; c=relaxed/simple;
	bh=uUEEWAjMYzrWD0uWwaJnom9EO/kriJDbQo0ckx1o/kc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rFCJLunau084lp2nwv1PqX4C/ePc2jPXeK1cv7Z297kbZCbSHES48vtY+Hvt6WeSjdkdAC57BdCSdxNyFoy9Rn1HSOy4jImAzUCmB2+orP+k40X2skW8xS9g2wKz6rTeCz/4I9zgnaVCqRqAkw9kAMV3qzN8fHsUjosrl40gb3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=k4qX51JX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=c25PpM5h; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="k4qX51JX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c25PpM5h"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2185F14000F3
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:29:59 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 18 Oct 2026 09:29:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1792330199; x=1792416599; bh=/A6IRjuvd+
	4K838l6G9kT1IibAAs1qwwEHtgmweq3c0=; b=k4qX51JXKvhSjLDCY1VJkrIV3V
	h2pQEbeLUbxYb+w7Z105YPKKv5B41+2PCVAmDwv7aey2eW6VATc2iB3g1sGn4mhB
	QASrzOVnYeS9Te4yu4UzEaaldwNwcdbrC+I3IkeKVCAWNVdpJZJ5Q1Lw+wK93qde
	i+aphzG4rtSCwX9y6tqgS/zD5A6KQ9EBWhaVblT0ZrTOLx9HQeM/mD6S2B2VAryX
	BoHovfmObBP4IgXKt29TnkzX12AEU3AgJMKwHXL6tM06pQ7DQ38xYChnaeUMTlCY
	CQ3BuBCE3w9JWBUD0f5g7ExX2hNMF6wCJHJ9rQrCUvYmnvpYI95kImW3rWpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792330199; x=1792416599; bh=/A6IRjuvd+4K838l6G9kT1IibAAs1qwwEHt
	gmweq3c0=; b=c25PpM5homcGBodOkPtS8XKti9KV2HBmREooiVrF73dSYtyUrwV
	PIPz4+SJepzh8s1D4StcrpKiyUq+ZQxNBDjsp7ZIKlsSPhwWzJ6Jsbaf1zhrsYeq
	iHh9PoqD0LvVqJGE9kk2tsRyr0blv7N9kVEPFtpRVPWFUSKQVfMEui3mjl8ojC1G
	iKBTjjh5AXx7zqgOiuOyfCQFIa2KmUPpGDKKaPE3+rC8Id8eboAyyW/G6CgijATr
	mBGGK34knuGsLJP/dBDd7if8RryAIO+otr8SnYnrhILEJGCWWj0RgGO4Kw75VWFk
	5iN2kNsdBA/STNDfPERXWCSfNYmRb/ziTpQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792330199; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:p2rZ/3FTu4KxlUKFLE8HBmhrOq46oD5Fd36dxkGt39hH7h6
	E5VqOOqkXonTZo9sIeUa8vGdp6dPZfdZ4e/q9ksDCOrWF/ugIxMsAef8Fsgmx8Dg
	/otkO0FhEqZEw2LiogG9xzrpW0QDrwg27DJlRnwkE4Ms+3T5mk5JvfHut0ZkwTu1
	QlOs08h1EEIbWF8gKF7uv1vIb749QIh6NsDimrsxQfQ5N3QePDaGzcLKF6qIl6l9
	IsQ933Ru6xMqoBCZc/Ud5BrVQD/z62uf+xMJzI8gNeiYepUc/pTEFwHIPQOjQWQw
	RxtvKP40sIDUnpcFyNF52T6Oyltnn9mu35FM3Ug==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:tL0NC/VqnXOGMRIVoyxomwL9UpfkKOPgXvRBxwRVkIY=:uUEEWAjMYzrWD0uWwaJnom9EO/kriJDbQo0ckx1o/kc=;
X-ME-Sender: <xms:18nUamv9eUujr9Qffzm-GlYWtaVJNsYb0KU6gz8HkhiTKJTFVrX0Iw>
    <xme:18nUakaGCQ9no4ZfbqV-bHC07aGmOIv3k_lIrLdhzaJ5tbjkcRqnuGh-hsWjMg9-M
    nFI849FJ2gFIJsZX59Pv2upVDd_SxUPm62UxO_fkh5mbq0pxR9jUsw>
X-ME-Received: <xmr:18nUajv70A_biQYcX_nDIfHjpKz2Hyrw1yUMg8oVz370o_ANr2Z3UCGyZ7csP3Ko_ouT1Uo-gIjCeFPrIRtUamciRZ2Fs2w-oRtFJbLQhNmW>
X-ME-Proxy-Cause: dmFkZTEQT7fUfMXMbPUpGDsqoNFZuMnHIgnrQeA11imlqlVCm1mnlL+yzQPsx/OHC/2Kyy
    U80NBhhINM0+u2eXusO/8iaSCiLuKnPV2MzkPGp4o4w8hL7xy2UrcYlM02K4H5XpV8lWEc
    2Zc13qcPHKFIIY0SK25LWDWHKtwiyEH7GwwJFlYLr7S+vwmGZCjbVWYpWgecplRwcSO9Lt
    cVFQyvFh3/PyYeqCjiQFhlXznTjSSVWyLlQSu+lfcn33lNp2lVDOUm1SlBnDLLwuyzWNaq
    7xKcIEfbuUch/Kijo398ZfmccQ5uWsRhDrAFIqsYjrR9P51sXXZjmDZ+sPLvkEw45+ZraI
    TnTbqPNQ75uZr3TTU927GUNO+L19tMYvd1EGxluInkXFvRygIrYUzCfkBjmQoVqfT37fPm
    BT0la/HnDP4oXv/3dCgGUbrtshutLqqKuj4zO+lKUQ7RINSQhcdN+YIcRK4s9jQ8wAniX6
    h8GVgJcPWvt8Lq1TxfyGIZuwSyMhN31nVJuDce0S+HPLpbLUxTZh25bLev7lbrdKkthu5q
    NFp2j0jjZ4FcTU1IHIL8PVxlzNxMj7Vm+t+clC1uTjbTiyPAf3OTdG3GoI+AUfFj/PzY0G
    WuFi2/0UZGXXgvA5YZhf/wsGx1KyIPOhZAI7OKXE6+b+4sf+V5xuuyxEH6EQ
X-ME-Proxy: <xmx:18nUauGsqh3qKWIRNKVMthuYutvlvP2K315AkTlJgk_6VCboKDDjjw>
    <xmx:18nUamy5OygHCCThFdmIFVIdqHmExNkoBuyLtd8Eu1AnepcYpkgY-g>
    <xmx:18nUalgDE5bFjsebzb4mFefapVU8V8ffTXu5GdT1lOXjMMn8h-9ZgA>
    <xmx:18nUahwABElFmsx_SvawWB2S39-RbrDfFnnznS5yGOzpvZnxu1pkwg>
    <xmx:18nUajRynjUK4b-xGFELf1WGYTRJTOXEgWx4olATaZ7bwu4T_s5CCqX8>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Oct 2026 09:29:58 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] firewire: core: invoke packet callback from workqueue when removing card instance
Date: Sun, 18 Oct 2026 22:29:53 +0900
Message-ID: <20261018132955.391090-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series is take 2 of the previous series[1].

This series updates the dummy driver used during card removal.

The first patch switches to a designated initializer for the dummy
driver, which contains mutable variables.

The second patch ensures that packet callbacks are invoked from a
workqueue in process context during card removal, maintaining a
consistent execution context for callbacks.

[1] https://lore.kernel.org/lkml/20261016135948.85343-1-o-takashi@sakamocchi.jp/

Takashi Sakamoto (2):
  firewire: core: use designated initializer for dummy driver on card
    removal
  firewire: core: invoke packet callback from workqueue when removing
    card instance

 drivers/firewire/core-card.c | 88 +++++++++++++++++++++++++-----------
 1 file changed, 61 insertions(+), 27 deletions(-)


base-commit: ae20f20e962cffe9a3baf189b12eb176f4058c63
-- 
2.53.0

