Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FD64A6897
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 17:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791306658; cv=none; b=pVJE3keFJEpP6atuTJxqAu1A/UbtkpSxhgcDKfvwjXoU2X4vFR+ofew01QIDFvSSkXRf5cvCS0fkrG6qDcyMCF3jmwqkpoT2SnipxmmMaE7KkUxxgIhq/fpAUtOdyA/k1A1b/phazkzuFsS0Odi5Msk+gAJ5Kdfmf8Yjv5/xb7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791306658; c=relaxed/simple;
	bh=V4dW52eDXHK6uhMs8F6D3iSCnEm8jKk+XIf/KueATSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l58t37tg1nNl2H9C5OXm76vXGP6XV3SyYw71NK+52/tmH+LeYQEdjFIPsKW7WV8GrWiGpIdTGEH9bL7itHq4/qdFWsQzgPDqoG6vemSTZnQQs7KDdFcHr3NoUmwCRGyCPtNelou448zCgrQ9OfJU6An00SnHOhxLTrVCarAGyrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=TXdEZZMa; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="TXdEZZMa"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93cb9e9405fso163559985a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791306656; x=1791911456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KUHlBvrgH1Sokxh7wl9jDUI6adWOp3bGBqbvD0HL4p4=;
        b=TXdEZZMacjLZ+lfiGbqq9paqZbLE8SmMVCGAZjuFM0upLz5BNFT6XJNqjew9NMMyK3
         7edWTUKgZH1lBgEtfh10WBWidMzu9j0U6gikjIJf9W3111T8W2nfWETAx50QNgh3178B
         vFrk5SYD7eBpqxnfZGUEHall98Vjbb2hgA3IPEwRsYZPLhAIiEesShZhYXakrDtmD5zd
         Bwn4ufvrr441M7mqqF8gMeaF5fEw2t3Sxd1W7R0WpH9GuP4QCTIQKdhHgZ3B05dOcgeA
         9yKSLvYijRcfkQlwR4bXQsE5s7nKvRACcfSKSyxaK+2Lz7bCLaQmjgLPFCll/Oi6hOY3
         nNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791306656; x=1791911456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KUHlBvrgH1Sokxh7wl9jDUI6adWOp3bGBqbvD0HL4p4=;
        b=VnUmkdrC5nrdAh779J2USzuTsb/7JL48T14/SqodvROrmIguOr3+W66/1GS5TIyTRH
         6GKJdX2u0Hvo5KTmxItzcRXR7UjkrPblrV7058J3cIsD2n1ExNhO1694urzd4dp+6sKQ
         2kOJcEXLjA5YYahbDOFs1MWSwUZtZlNctlh/hZoZ7JYHPTYwyc+CjI1c12TcpQtxmZkb
         hgOjfrXWYNN6OgzgXI4aU9cHKXwODcj9syQR+Upm8ttrHIEdvhNwh6sT+o5nrQ73yq/9
         Rj3TKgnmUE6wygxQCsQ3IvlYENlMc77HwcvEH7evNUHT5TXb23G/8tWjc//bEV9CKVKe
         TNEA==
X-Forwarded-Encrypted: i=1; AKwUvBzvNee/vdg6wzrA5dWjlQyFx5OhS/a7XUci16L4HMNgch5Yu8AQq0reauyMsh7IFnSbnaI4rsy1xU4nVjQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lJYbxhQcHhzUJgovnaVxqaQhdEFFPq0tGyfE/63BleXLkEQGpJ
	GW9r5A3jZRQ9jait5Ixh2/LiO5cNTK1ReYAeO4zJ7WrlBgmnKFJpF3K7ktRWYfOYYC8=
X-Gm-Gg: AYBFou1Gk0QSOKQhMC3fa+/5RxSgwHAPucwr1zDmcYjM11kkkHKq3J/CSx7ZaLHKlzZ
	/Uwk2jg+wbRy5l+lbz8N+G2dmjZ0awa+N0XprT+lp+cy601vOnA9OXI9jjbHYPNVSrd8hPtfikQ
	Q1ykDfZIa2KfRM+37wsSnsfL/ru0jYwdFs3v/JfHjOzkKPiHmm2Ci+AzM46FQ/UkwRq9wbODhae
	oIBU+DF+g3dKRVv6d+p70/4J31j5KO84SOo4Bas0FmfXdLvgoygxEdmGxj4JstNPBdGQWqjXyTb
	SIl6Z5gCI9GxB3o7VdwIdS1zfdDCIHk2bx673fNXhQAd4ntGHaNKgkmcWlOerBQU0tbJqLZfPu3
	EaOBqwurqcNJCg79NqdVmW4Tp3cCg9ogc9W/4wVMoviYk28qxuqlMH8krJIRnoeLzrSLNFMKpYW
	cA23z2lxno1CyYAhwlUarKGmZ0lc/vksbHB+XRV9DRczrW84B34OiVdikNYf3Wa9xZFj0vw35J7
	SeFPLeMcpXEeck=
X-Received: by 2002:a05:620a:27c4:b0:93c:5872:ef48 with SMTP id af79cd13be357-93e510d5c53mr1988917585a.50.1791306655510;
        Tue, 06 Oct 2026 10:10:55 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.249])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e990ef6ddsm5897385a.15.2026.10.06.10.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 10:10:54 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 06 Oct 2026 17:10:24 +0000
Subject: [PATCH net-next 9/9] net: skbuff: remove the BUG_ON()s from
 skb_shift()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-skbuff-bug-on-v1-9-1b4434c5357c@toxicpanda.com>
References: <20261006-b4-skbuff-bug-on-v1-0-1b4434c5357c@toxicpanda.com>
In-Reply-To: <20261006-b4-skbuff-bug-on-v1-0-1b4434c5357c@toxicpanda.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Kaiyuan Zhang <kaiyuanz@google.com>, Mina Almasry <almasrymina@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791306634; l=2201;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=V4dW52eDXHK6uhMs8F6D3iSCnEm8jKk+XIf/KueATSU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJ3N5aQPYQYBSlkhDT9yZ1gErXsaIx1dg1V2H0JEPm6+mbmwC7HeWOjnReeWbExroBDnZly5bJC
 a+VoxtkFLww4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

skb_shift() has two BUG_ON()s.  The first fires if the caller asks to
shift more than @skb holds.  Nothing has been touched yet, and returning
0 already means "shifted nothing", which the TCP callers handle by
falling back.  Warn once and return 0.

The second fires if the frags run out before @shiftlen does, but it
only checks after the shift has been committed to both skbs, when
there's nothing left to back out to.  The loop that builds the new frag
layout only writes @tgt's frag slots past its nr_frags, and the one
branch that modifies @skb's frags also finishes the shift.  So if the
loop ends with bytes still left to shift, nothing visible has changed
yet.  That's the same state the MAX_SKB_FRAGS bail-out inside the loop
returns 0 from.  Move the check up to just before the commit, warn once
and return 0 there.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 8c6a45a20eb0..59f74850150b 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -4321,7 +4321,8 @@ int skb_shift(struct sk_buff *tgt, struct sk_buff *skb, int shiftlen)
 	int from, to, merge, todo;
 	skb_frag_t *fragfrom, *fragto;
 
-	BUG_ON(shiftlen > skb->len);
+	if (WARN_ON_ONCE(shiftlen > skb->len))
+		return 0;
 
 	if (skb_headlen(skb))
 		return 0;
@@ -4401,6 +4402,12 @@ int skb_shift(struct sk_buff *tgt, struct sk_buff *skb, int shiftlen)
 		}
 	}
 
+	/* The frags ran out before shiftlen did.  Nothing has been committed
+	 * yet, so back out.
+	 */
+	if (WARN_ON_ONCE(todo > 0))
+		return 0;
+
 	/* Ready to "commit" this state change to tgt */
 	skb_shinfo(tgt)->nr_frags = to;
 
@@ -4418,8 +4425,6 @@ int skb_shift(struct sk_buff *tgt, struct sk_buff *skb, int shiftlen)
 		skb_shinfo(skb)->frags[to++] = skb_shinfo(skb)->frags[from++];
 	skb_shinfo(skb)->nr_frags = to;
 
-	BUG_ON(todo > 0 && !skb_shinfo(skb)->nr_frags);
-
 onlymerged:
 	/* Most likely the tgt won't ever need its checksum anymore, skb on
 	 * the other hand might need it if it needs to be resent

-- 
2.55.0

