Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670E83F075E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394594; cv=none; b=n33eeyQmPrFe9fhiXMc0Y5Pf6E+MyxDvrzKeVeOFWqdlqrzVz6td7xBo8aeHCCkSibSBwZtqboVP8uIAG3iWsuS31CswicUuWN5/Dkm65uHuBKvIxClWVwJ34oG4m824Xil6QaHZuPF+IlRoUwH6I9bZy4avfw9dRvDIhMpajX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394594; c=relaxed/simple;
	bh=cOHqmVUhQvoYFpyRXKtzKiBJLjArGS2XQUGFfv+fWvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gm1d6wc7M2X6z/MXCz1ra1V4uIfOIEbAU6Vfiwgm87e3swd2irmJkcZBihzPk9cYMbb+RqLLSNA1PGg5BXQWGGRlxffS1n1GpuGcMLw7eFKuV83Z/0AT0qozceKJZDMgZXccgfmd+uIcyyN1F0LKAhXSmeR1YT0LgfltfD7oLtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=l/FmnfS4; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="l/FmnfS4"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-9178aabd30dso21416976d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791394590; x=1791999390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/VlqFGo0rooEVFXp50d0ZL1DlxYf9r8iYztQPM4wKJk=;
        b=l/FmnfS4Cmxq4e3W5JBChJnJJPLK4k562w6xXu120UDOOW7AyFSJHxlKx2L3gBgrER
         3NL66oX0McZssBE/OVQrMlnofGJFnbwhKBBoRKhowUEj+vxEOz0bXWKKU2VdmmenSXFt
         rGdhbwEj4kPRgegab8DxkayUlfJ1wAZRTD11ql7DZCeBr/SD/8N1kMr1znWU2kOoFcZD
         0zZL8xeNaX5xmwpXXq4z7Xo3udVnFbbku/3j1EloOK2x/sPsdPRj3x2emmHvxZfcRRgo
         5sC9OAkYLz12Z4c2tNwneNJ2PyqmjjWKA3Sgiu/Xtqgz6o9RmO6mKhsMW7vXGVC0MvfG
         nboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791394590; x=1791999390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/VlqFGo0rooEVFXp50d0ZL1DlxYf9r8iYztQPM4wKJk=;
        b=UWbexPEwK5irHb8ITqGgrbkuFh2Q2H9u0+3FtX1v0CSdLIGuCp4UJZGiO0NZXCOYjm
         gQtI0j0qYEH5/olNuCOO7jMnu32WVczviIXq0gN0TCbyctfut4DE4xXDuT7lEIXJBdBl
         gcn4D4WJSmnygxmZZ65KFPbSfmRmizzsCFQD6qFvptVcDSeHrdr3mm56+muXiPKSGCGW
         cIRvFEXMZ8C1HrfT7ZrNa0mUNQBh105/crUUiDW5tp4ICnBJwwHPYIRDHZlMvXZwzBHq
         nHV/XCbUbqfWWvZCBq6mPDoJbZ8viYeQbcq5EegPGITFZ7LoXty9EPfqaGKlX3/rMM9M
         yhKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhKw/sASI0S96y1xGbBVHfwPwclfMsbuCd57hY0/oM9FY/JEkeA0Eq5KwLXm0IwsXhYQ4ssU4vgABEm2E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDJYhEkT45MWcSF1Tr+9Lpco9ZIVuG6pAxS25cBCuSnqld1tuH
	qU5Stvlm0B4GuU0kZD4TxldIiCuZAAoaPjDq4ChKt5paYuGIHgb3NGx0q2zMBYi52V4=
X-Gm-Gg: AYBFou3MHTlrOsj5g2m3V/qjg4OQw8FR/4+ngcUUBmptBdGEe86nRkuXZjhva2KVLMq
	MybCsZ4mlvtQIYVKmFLgPRpPujiMyo81Z1lIIGuAWj2OlA38OyADvh16QCmkWMgpfTp4ZS0Y5vE
	HG/wVWmFCSLvZcCJiD5+QmhvxMO44ldOiwmE3eseYpBcztQDCNVrhIhUZ+rNOFLY4ZFR4ejQAr4
	NQy1YDbG/BMgoxh3DOCo8G8wWoO4Kr8UNnXwYlXF9h8yIPok+IzWl8iyE/6dQsBgQrf7pZnTGek
	9elS/XWENMkBPkiJ5BrlPd9sKcpnu6XfFRjimsks/wNtVvEkLu8Cb57mD9kwAH/Ym1d+LArRTaR
	Ja/NgLkuj86wg7WA1DmLuJ+1WOLgj3qO6hI+tAeexC346QHZImJdp4FyLGjYX0BI4cE4pq8x1tR
	Y04ji/daCqhrsrzXFxDtkF37hpeVpapuooh3WZ9nX4UeStrW0VbZVz06LdcJsYIofJAYl+b0KG8
	2ZXMFpFqdXLVRI=
X-Received: by 2002:a05:6214:27ef:b0:914:4511:9271 with SMTP id 6a1803df08f44-91997829f28mr49446246d6.22.1791394590326;
        Wed, 07 Oct 2026 10:36:30 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91996cb6108sm25287516d6.13.2026.10.07.10.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:36:29 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 17:36:07 +0000
Subject: [PATCH net-next v2 8/8] net: skbuff: remove the BUG_ON()s from
 skb_shift()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-skbuff-bug-on-v2-8-b9a5f732895b@toxicpanda.com>
References: <20261007-b4-skbuff-bug-on-v2-0-b9a5f732895b@toxicpanda.com>
In-Reply-To: <20261007-b4-skbuff-bug-on-v2-0-b9a5f732895b@toxicpanda.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791394570; l=2315;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=cOHqmVUhQvoYFpyRXKtzKiBJLjArGS2XQUGFfv+fWvk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKvo7jLUt/Uh4c6yB2BExknoMr7WR6kKP9E8FPiHlgT7ctnX82eh4pVdQ+xX9F2Xqv/Or77tWZE
 BYH+maOhZ+gY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

skb_shift() has two BUG_ON()s.  The first fires if the caller asks to
shift more than @skb holds.  Nothing has been touched yet, and returning
0 already means "shifted nothing", which the TCP callers handle by
falling back.  Return 0, with a DEBUG_NET_WARN_ON_ONCE() for debug
kernels.

The second fires if the frags run out before @shiftlen does, but it
only checks after the shift has been committed to both skbs, when
there's nothing left to back out to.  The loop that builds the new frag
layout only writes @tgt's frag slots past its nr_frags, and the one
branch that modifies @skb's frags also finishes the shift.  So if the
loop ends with bytes still left to shift, nothing visible has changed
yet.  That's the same state the MAX_SKB_FRAGS bail-out inside the loop
returns 0 from.  Move the check up to just before the commit and
return 0 there the same way.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 629de22d98e4..7d23c2d10550 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -4331,7 +4331,10 @@ int skb_shift(struct sk_buff *tgt, struct sk_buff *skb, int shiftlen)
 	int from, to, merge, todo;
 	skb_frag_t *fragfrom, *fragto;
 
-	BUG_ON(shiftlen > skb->len);
+	if (unlikely(shiftlen > skb->len)) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		return 0;
+	}
 
 	if (skb_headlen(skb))
 		return 0;
@@ -4411,6 +4414,14 @@ int skb_shift(struct sk_buff *tgt, struct sk_buff *skb, int shiftlen)
 		}
 	}
 
+	/* The frags ran out before shiftlen did.  Nothing has been committed
+	 * yet, so back out.
+	 */
+	if (unlikely(todo > 0)) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		return 0;
+	}
+
 	/* Ready to "commit" this state change to tgt */
 	skb_shinfo(tgt)->nr_frags = to;
 
@@ -4428,8 +4439,6 @@ int skb_shift(struct sk_buff *tgt, struct sk_buff *skb, int shiftlen)
 		skb_shinfo(skb)->frags[to++] = skb_shinfo(skb)->frags[from++];
 	skb_shinfo(skb)->nr_frags = to;
 
-	BUG_ON(todo > 0 && !skb_shinfo(skb)->nr_frags);
-
 onlymerged:
 	/* Most likely the tgt won't ever need its checksum anymore, skb on
 	 * the other hand might need it if it needs to be resent

-- 
2.55.0

