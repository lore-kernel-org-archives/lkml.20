Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4B944A3F9
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 23:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791503089; cv=none; b=ty93+HaL6k1NP82zC6Ca0uWidCTtkb/di3JETuWlF7Wx6zrD2ur46bkZh4QYkRwcZuMJ1BTP0ZuSQlprOKqu+mP8cgIIHhJst5dA8jIvPOOGGwF4F26vBF0St3AqqQjTLIC8yFlBlApwyOkMt5cPnu0HAFJ8qdpjkGGI/Znyjqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791503089; c=relaxed/simple;
	bh=9HuaQy5Vf7BggUvtTvBVaSE/2HYRcNVeNZ/dpLR8PEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SOVTLuU8cNusPxVccuZtPdpE546fz4T8y4uvhJUvBF0ajTy0TqQqUa6h+jigZDXx5VlQZ8LdWbRU1ffv54Ymymn1dG5ruwvvZIepvtMY2g7bDLBstNWTI5QnmhYkYxC58pSzYrrBIandRrJcZyJ7BFb+PCk7TSf4V5i+wcYjLLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=pUHW7pBM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kmrcBtIn; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="pUHW7pBM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kmrcBtIn"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D2BB17A007D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:44:46 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 08 Oct 2026 19:44:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791503086; x=
	1791589486; bh=lVz2VwwQQ8EJeze6CYRF5JkuoW5YOEZSnjPhu5c9PHE=; b=p
	UHW7pBMDHbqVaANgsmPDx/Pi+ix4HWYt+3BMP2V94cIIpryN7lgVDxxOT9M7/ug1
	k4UEhwsnQGMGKkrcH+JJDxElcNAhEKdn2/AK6yO2EuOJxOAFA0O33ZagsdXZMplX
	y5sy0kE46ey4YpYjW2yfZTfZgFWjG9g6vrNrz6s3TEyL/Hbt0SJmgTTDG46YATij
	h3+uYsVeFPg3kFT7ymgcoHZRdujUGEa0PHabV3jVnFIesyfufowL+iayiKVkceNg
	ur6Bk14JoNTFb/0yjfaUs+kh7BlpaeMiXiNunMeXCqXGV1WMH5k5GHYQAC5mrvV1
	mdlKxc5fJL+cO54yi0zZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791503086; x=1791589486; bh=l
	Vz2VwwQQ8EJeze6CYRF5JkuoW5YOEZSnjPhu5c9PHE=; b=kmrcBtIn9B2amNWGw
	bLMSBABzmCqB9xzWUkStlYaoo8Qwu8ywv8BF7aj4HD3+EITZpNkleqRZmTo7A9fJ
	F+GuprVn1TvAOT7juceX9QN2GVOUW1d5CBuH9ipfdxmqkgd+pnuUIJS96iYTP5qm
	2IGHAk28+k7vpFlzk8F61VT4ICuNkhMtm4jhYhYAT0E34gxa30xfWBKDJMOieriq
	k1Q1WGfpGtWDHB2I/gVp7lo1knxHy1LznVNt6X1DslziPuRY007JTBKgpg2gug/L
	Ksm4EoZRZLg+SRIdtufeENzb3/7KvncLLzoNtRWVBLU2lguVU894ePlBSwGoI+oy
	jsK3Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791503086; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:N6StiDG5OPCNiy3I50zNENJqKR4bqksOu/hQNQEfnuvFv0F
	OeqmuT8kDkDfxOFIggpE1PFiQMXeMEIX7W33CGreMx1vvwmCH4zQZqmncNkEwzWL
	8gMTh/MVMUxVT08qN+Pa5wToemX/Z43usd3dLIJGztjRr20cBGQ8KjgcY85XpU/Q
	aEXqv8TNHcliDoaRQ02pnTGiFUOCqWl6MyANH9JgKSV5DjDmjZT7PGGJ0g8HOhgM
	SX7XsM1lkPpvPNn0ykrOrEDIMX5Ri+6iI8iTvsyxx6nQtNf9ky9VYJvElIZp+hLz
	LQlPhUhMoZwjWTG6iZhFHMndSWJS/Z3XTYX/Plw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:tkDIA2o1lxrPZZ/9dLX1mJUHO6yg4h9/n1zw5Milv10=:9HuaQy5Vf7BggUvtTvBVaSE/2HYRcNVeNZ/dpLR8PEs=;
X-ME-Sender: <xms:7irIakbvAeIQvMSw2jeYNQUuPV6-ZHjEcuFQOgjuxGip3jl6NtOLvA>
    <xme:7irIatUNLmjuk3Hv0ToDNL4JJ6WmxbRs6BoVxbcwXE-3s9sAjWt7QIWlTFCHQk30J
    skVMSDLeBDcV9qQ1-J6VrGRs_i63aIRTXqUjJMmKo93YuVrQJlfq5A>
X-ME-Received: <xmr:7irIami_Kxxo6dyTHkUKLmyoQPdl6n63-bWHvMZqJ9CWw2pgSeXdHvcxg5J3iI_Lk1pYmgRswDy3wZXnBu4pVTIdhIaYk9UsPKoZeZKGoY47hg>
X-ME-Proxy-Cause: dmFkZTFXiP3ByqRhi+bwfuEeoAus3yLRLtXhJHCwP6MTIYwZlCSl48rCsY0UEii+0QwUS9
    xSx1ysA4oMb5BPpT1i5hTXOpWF8kB0fBm+jF7w8IjL9KNqD52nb/FIROI28s5WcMn/Sm3C
    bb0rs+G4cgc9GOF7iMufmCeAHYWWbaMdrGiimryatdAJwvTko+Yk8d0JfUesu/g9kjRbuM
    GszrLhc+YMK9NFdZ55jRsRqoU5n5N2Gk9DnvUfk5ZZ82Ux4K7iAVHDrwSBl0tF19iwVNWg
    vr0npOA1jDggXakKdKRzmShW3vvNSVNQ1/A69o/HOmrHHA8oLUp1XCgW9uD0Czwoo/VLT4
    s7kTTg0hOnqqkBqjwJsrKrnAzs/mEVrPTW00gR5KQ4rMik2co0xC0ZrVdrK8ETXobLJ+ql
    OWo1MM8jB1gwJjRScAYSHJRgvSIH6LRxcnpAehtL9tv3AbvINSdrOH/MyqGkZEL4a0orbI
    29EsvWd7Ueizg9bQRN3ldvyTrmR8P9HPQLUucXUszWr61Szx/ZEiOgKRpv/XegIz2+La7p
    QlHdeTXtQpYplOed/fwUATeyjV39XKNt0eFluAzXAz/zjK5L8inbfp0supMdUwR0StoYPj
    U4fv7fykdkMnBMJsNZU34vwddKGu1e1nOoQbFl0BHEe1GSwyHqEe0WXaalWQ
X-ME-Proxy: <xmx:7irIarXaD45fOuQriKUUxK7mO71t9cx0QUzIEzQPtxZ1V7b3HKP8Og>
    <xmx:7irIatNvrytR6F9Daba-a1DvncOo7xJ8ShwRHtOLDkM_euGJM9uVZg>
    <xmx:7irIanYmgPrWnlAHB-yeYie_wEXnbwR8IUw-bnfW_KxEzuHd46F9gw>
    <xmx:7irIappsZMjEQg64SewuJUF_Ve0oMOfGtknFhc0pc3ajzeFrUFt56A>
    <xmx:7irIapPiglGzthpEYGvapihTUVZqo_V-VLcMhDxCFvpvOuPdsVFPV4Jm>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Oct 2026 19:44:45 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] firewire: core: narrow the card lock scope when accessing node_id
Date: Fri,  9 Oct 2026 08:44:32 +0900
Message-ID: <20261008234432.251412-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008234432.251412-1-o-takashi@sakamocchi.jp>
References: <20261008234432.251412-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When preparing the request subaction for an asynchronous transaction,
the node_id field in the fw_card structure is accessed under the
card-level spinlock. However, the lock is held across a call to a helper
function, unnecessarily extending the critical section.

Narrow the critical section to cover only the access to node_id.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 7d512defdeb3..4da4686fb28c 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -439,11 +439,12 @@ __must_not_hold(&card->transactions.lock)
 	timer_setup(&t->split_timeout_timer, split_transaction_timeout_callback, 0);
 	t->packet.callback = transmit_complete_callback;
 
-	scoped_guard(spinlock_irqsave, &card->lock) {
-		// The node_id field of fw_card can be updated when handling SelfIDComplete.
-		fw_fill_request(&t->packet, tcode, t->tlabel, destination_id, card->node_id,
-				generation, speed, offset, payload, length);
-	}
+	// The node_id field of fw_card can be updated when handling SelfIDComplete.
+	int node_id;
+	scoped_guard(spinlock_irqsave, &card->lock)
+		node_id = card->node_id;
+	fw_fill_request(&t->packet, tcode, t->tlabel, destination_id, node_id, generation, speed,
+			offset, payload, length);
 
 	scoped_guard(spinlock_irqsave, &card->transactions.lock)
 		list_add_tail(&t->link, &card->transactions.list);
-- 
2.53.0

