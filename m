Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794857824;
	b=VZxkKNIkBqApW7yiqL9qNwck72O/QiI6NOVQ8SuYDm2EB7OXY2Dxrxw/o5qjUeGpuem2
	 1mxYsS57IUoFKI/mSZTVUtDO6Zu1G39N1+PaasSVX3zIu8/HIOEXP/ynsKBg26GgxmSsS
	 Y8HnUOefy7lgcLrWlQNX8nTNjr7XMY2jbLf/iTh2widC5XmeN4I1ayYC/yfAFelCvcdlR
	 cvrQ+741wFmzPgtVhM8H6YfNG8/DUgGzVUmrXpCFXF+s3jrkv45o4+Z7f7gO7eEiOgSEJ
	 U/rZi6WT36puhIg8TCSJXN2FaRWzQNR80GD+9Y2GqClTJ2pDq60nFHJj/v6PtKpKWXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857824;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=a0K8lr5jk5XWVgJ/UEpvtq0hIuOeWcwshx7945Bw4bA=;
	b=m5TdGipGsdXj4LOqHznYPRaN0sitY5tI2W82pTd8Yt5yHTBXmJMZQRrMxm7sjBDyg/65
	 rdS7NLs0nt9Gidva8VHuO+Yhz6g9ilzDjmj4D4wMfPLg3nFxUlWVvh3RcrEoou3tWK7Er
	 p51NbzAnlMmAkqrMjMTO0+lXzNGB309h9kh8ImOsFe5bb5ZTLjh6+exHmqEZbb8Sx/954
	 v7JsqB6M+Z6G19u1aqEEDHGH7hOYvC/Zu9FPQmlW1Oz6NTlaPY/DQMdG1Y1nVxg6IzDLW
	 TxZe5cVwAXp0h146XbJIccabfIcUVAuESGUylDboxq3A4SIhUtMlOC+oBkdfrOazLqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="RV19A/iV";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CE6606A31C;
	Mon, 16 Nov 2026 19:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RV19A/iV
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794857824;
	b=e7gnd0dt5awoK7dS+KCvBKCFiJ0+7RzRtX23DCVveJjA/qnVxGloNOpRzu+a6n/Qhz0B
	 QENqKYNBrFsKYWCOi3qAkeeQCNGl0ohFozAIpXbqVpwrvsJg9igZ21niFSRM3MlVTl/Ir
	 0WMgFuDHTpunU11X1aMTNy2Ntj9gVwDb7Fe5Cnz3InHSJglj1IuZ1mMEQtZ1rT99WhWo5
	 Eg6sZu6LDlkmCI0HmH3z85jk4Dsa18oyjN2180SmcK6kHctzQebd5sIoD6+4zWCadBbkQ
	 A7M0ka8gFAVGgeDX9sbugKyUrPFhXs4NCj2FDQUM6OyoxldbE5xGVdx8NHGk7ZynA/w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794857824;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=a0K8lr5jk5XWVgJ/UEpvtq0hIuOeWcwshx7945Bw4bA=;
	b=XlWvFKKDSWjecF4DjcVFjdBub5Lso5g81WzyZKJT+leAcAoSrLnU2fMmOfB02ViQUl6R
	 Tx8B10dgOn/hML3kqzTE6981xNYEsg9c4kJaqDSbGMeqagAm9YT1iUrcNvgKUp0E8f+vY
	 lW2tQ19IMddBxO/27t9NnP03G9HZFTVnRH1d8/zz0C14CIGujCl9QNk9vI0ZDh1/Jdt/f
	 NCkqAm/h5AyySpHhlKnzrVkVSeNkKw6hBEzODnL70sgLLXavMdWo6K9ZXYNoX4JB3MmHJ
	 em2CBiWrThedYYTHAwxC07Y31ZJXgxSLaHWLujfk+QPwiFEe80W61tR3GfFsorn5QSg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B3E491F000C4;
	Mon, 16 Nov 2026 19:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794857824;
	bh=a0K8lr5jk5XWVgJ/UEpvtq0hIuOeWcwshx7945Bw4bA=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=RV19A/iVx0kiQu+ah6k4t612fqY45bgsLVrjoU5kro0GvnLI2w/bsJRLW9ubq9Yil
	 lB1Odd5xZcMEzBGOUiw2+pmCPrISOMAI89AoZqNBjH4Hv1RbdEp3GRD2f8Aug+OzDH
	 aXmMjFRu1/nFhWI2cf5adaaL/Vlt+EYLsJ3mULBY7msQ0a/QXKplB2o8XNg6J233le
	 XhJV3pZK52bPiGKesxz6tj6GroTK9Qakn0f49tM4YxEECypEEJ6Lg36gH0kKdz10r1
	 /WP8uovi/DFbc7HqId+RHl8pJ2jldu/5cAmNKsT2NOP200jHUEJJeAs0dQJ3zmu+b3
	 BJ5D4ppGVinJg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 04C704A584;
	Mon, 16 Nov 2026 19:37:03 +0000 (UTC)
From: Joas Antonio dos Santos via B4 Relay <devnull+joasantonio108.gmail.com@kernel.org>
Date: Mon, 16 Nov 2026 19:37:03 +0000
Subject: [PATCH wireless v2] wifi: mac80211: check for a NULL link in the
 MLD station RX loop
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261116-mac80211-rx-null-link-v2-1-ea512ae98139@gmail.com>
X-B4-Tracking: v=1; b=H4sIAF5b+2oC/4WNQQ6CMBBFr0Jm7ZhOiZW48h6GBa0DTCzFtFoxh
 LvbcAGXLy///RUSR+EEl2qFyFmSzKGAPlTgxi4MjHIvDFppQ6Q0Tp1rlCbCuGB4e49ewgNNr1n
 Zk+qNtVC2z8i9LHv3Bh+J7DklaIsZJb3m+N0PM+3+TzsTEtZ1rayx1LizuQ5TJ/7o5gnabdt+A
 FfmVcQAAAA=
To: Johannes Berg <johannes@sipsolutions.net>, 
 Benjamin Berg <benjamin.berg@intel.com>, joasantonio108@gmail.com
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794857822; l=2604;
 i=joasantonio108@gmail.com; s=20261031; h=from:subject:message-id;
 bh=aZzRCwDrJjSzerq/sLcLnuuDLZ11aHczEbNwIJoX7XQ=;
 b=jDCpi/RFWz9PlMH8/eSEDk4bEOkTS1I0UhEAtDMX/w3CZ6EcMKTc68kK9071y+TcF2Y3Nn+ue
 /FvMJYHQFAlBqCIhYoIvWfg77Lw3W9zThE8ZT7UIHjZwlcihaU9Ez48
X-Developer-Key: i=joasantonio108@gmail.com; a=ed25519;
 pk=ZxAznJT/FcPPdzLrDDFJQm4LLjjHVGBBqDSG3TXS23w=
X-Endpoint-Received: by B4 Relay for joasantonio108@gmail.com/20261031 with
 auth_id=1371
X-Original-From: Joas Antonio dos Santos <joasantonio108@gmail.com>
Reply-To: joasantonio108@gmail.com
Content-Transfer-Encoding: 7bit

From: Joas Antonio dos Santos <joasantonio108@gmail.com>

Since commit 6d531b9af16e ("wifi: mac80211: rework RX packet handling"),
__ieee80211_rx_handle_packet() looks up the link of each MLD station
that matches addr2 and passes it straight to ieee80211_rx_valid_freq(),
which dereferences link->sdata and link->conf whenever status->freq is
set.  The non-MLD loop and the interface loop below it check the link,
this one does not.

The link can be NULL there.  ieee80211_vif_update_links() clears
sdata->link[link_id] for a removed link first, and only later, after
ieee80211_tear_down_links() (including its synchronize_rcu()) and
drv_change_vif_links(), calls ieee80211_sta_remove_link(), which takes
the link station out of the hash.  RX runs under RCU only, so a data
frame from that link's address arriving in this window finds the link
station but a NULL link, and the kernel oopses in softirq context.  A
link is removed this way for example when an associated AP announces
removal of one of its links (ieee80211_ml_reconf_work()), and the
frames only need a matching transmitter address, before any crypto.

Before the rework, ieee80211_rx_data_set_link() returned false for a
NULL link and the frame was skipped.  Skip it again.

Fixes: 6d531b9af16e ("wifi: mac80211: rework RX packet handling")
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
---
Found by LLM-assisted code review of the RX rework and confirmed by
reading the link removal path by hand.  I have not reproduced the oops
at runtime.

v1 got no replies but is marked "Changes Requested" in patchwork, so I
am not sure what is expected.  Please let me know if something else is
wanted here.
---
Changes in v2:
- Rebased on wireless/for-next (763b13f622e2), no code changes.
- Link to v1: https://lore.kernel.org/r/20261102-mac80211-rx-null-link-v1-1-3330b6b18c76@gmail.com
---
 net/mac80211/rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index f8cfd04c0c6c..a1db6488e4bc 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -5505,7 +5505,7 @@ static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
 			sdata =	sta->sdata;
 			link = rcu_dereference(sdata->link[link_sta->link_id]);
 
-			if (!ieee80211_rx_valid_freq(status->freq, link))
+			if (!link || !ieee80211_rx_valid_freq(status->freq, link))
 				continue;
 
 			if (rx_data_pending) {

---
base-commit: 763b13f622e2758726e8e3ecaef819db8fa0430a
change-id: 20261102-mac80211-rx-null-link-6f2e0b50f6bb

Best regards,
-- 
Joas Antonio dos Santos <joasantonio108@gmail.com>


