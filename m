Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCD04A2079
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 17:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791306644; cv=none; b=dzfvAoK9NHo8RwKaNTNpKBJl5ML+3+65m+n0Q1y+xRTMonEabHHVTbhcrsJonlYFMmvgsoBYfHELB0ALgQzsi+oxigthJQNFFiINKgFbnAa+XmBD7RUG7fVluSyGHeXknloKTItrbI2n14iE/dP5Pj2WLgctABA3ZrHU+C8YqzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791306644; c=relaxed/simple;
	bh=f/7Qt7bAqqBllp49t2DfPlqJObj6PO7P5VTG+kUcK84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bq7APUJmp8czjL9XilKizPGC0Hq5x0yUxW/34ry+jHyY6hytAkeU+qd2P0HbLTZEiOHWmA1nOmlmXCTitzpXNBJ23dp1pzCqaELg6RCDqst15MYa3vMY7qaVEcDouRCOUd/J1BmE+RJLAuSHmDRLiWC7V64Rio/qT6K9xKeM/3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=TLjN6i9U; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="TLjN6i9U"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93cb9e9405fso163547385a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791306641; x=1791911441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRjfmwgWCioxIdOZz3qjvttDw7Xx8iaB+ROKEnxisvE=;
        b=TLjN6i9UsjwYnH4xKlJo7QyaUaZThOJqABZCVSqASZTZgGxgMqb8dlrg5+Dq6F0iM7
         i89zsQqe1PUTlCbj3gGqmFyLhlTHMl8JOdIDxUGhTNxuS/SZB+5OQvnYvmpneRgcdbsB
         ozs1tgAo3VGdnfu8Fx9WoEA5chPSYwthaaqBA3duTQy8gOlsWEST6N5QeLsVwISBZwR5
         QVZVHbJdL5ipAIdwuCwR5q+QH4TH9LmmALUiiio18umyzCe1+BQUhyAyCoV0Gn5LNLEu
         aNbJSHVHwefOboOGr5Dzb/7JYtISf0g8KB5CVJ/wyozE2MQuFSjcuCdd8V1dZdIhbobD
         pEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791306641; x=1791911441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRjfmwgWCioxIdOZz3qjvttDw7Xx8iaB+ROKEnxisvE=;
        b=uWllTgvHH73zbLeatq/EoV3ykNT35fAYNG8hR5CAUZydoDZHIevr5ydldRwFbMYac5
         L6LQDJEs5D1TzlpeW3jT/J/wb0VIeoHeW0PuO+r+1V6P7QS4uql4+xAYU5LnZrLLzuKv
         6GqC31Q6TldK16ekMJY5QUZaif9mKtVJ2FxxrWv2axlpkyqcPiB7zldKbTSxygozCdeR
         BTzqwn0LkfpW5IGcD+uf2qK9zLVyqFM30+hL9F9WTI/3bGEAmCCKFbh+61REMZoEOam4
         K9CoZhNrd7/onQL+tJZ5hKRU6Y63gpmpCSkRtAaGNRsL3eNRqXz84w9Qh/1oZxB2j7o/
         +Pnw==
X-Forwarded-Encrypted: i=1; AKwUvBxszfbhWZz7vpwm2psNBtbsDnbIHLMYgzfh1w4aa3VSlLP/Injmmpix+YBTogVZfKp39JSjim4LI629fP4=@vger.kernel.org
X-Gm-Message-State: AFuF++kytKlfYHCxI1WjwEngilZSPPV6NZ2/3Zt52XH0Ng2IGs7CpLj4
	S6xtXaLrNrj9swzYhfQ0fT837ixYRTndCkYNlmwsGI13M6h0KBzlYUvxaIR6B+kUs9I=
X-Gm-Gg: AYBFou0qK/jlUZriX3mCAwLwovjdF/thnSMvJkEMHtIUuD0hP7GQFrvJDpDmsQ/CQEe
	LhuDTAJie/buH+HcK1kUbumrt9qNkzkYB4PiTg7Uw5ueXtngLDFasPwfuwKwwLTh53WeFC8VWMB
	0lHlnuh1kTx+nTcpaqgjfaMUGSQBfAHYWusSfZVMu8CucyvTZkDfSW1DkK3+DnEMoUa1HdbNqtq
	ParbjRKPubwNFo+Qi9tpIGrOGdn6S0xI5epFSJMwyNS1j8lEUcuI6d4f+jpFUA+SM8dbjFoXfF5
	gy3SItli5R/1BJPthcRelD5Z0hnPsJL/9lb9ug0Fih9WOyCzp+d8X/F0BMklcITSkeXWsD1nb6U
	n8yGcifriXrU633i29vdFoTRsACY+IHqUjTzyDEcT05ToPQWZt3AbayypVZrKXFWc/edvihUjO2
	En5CNI5wbQbzMGuyWB12C+j1nqeWncQuffHylQZsLwctIRi9++PexXNWClFmHVdsSmeuOhdSmFX
	fgmYGHXGjrb4GQ=
X-Received: by 2002:a05:620a:2956:b0:93a:2611:270f with SMTP id af79cd13be357-93e50fd50e8mr1939604285a.13.1791306641376;
        Tue, 06 Oct 2026 10:10:41 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e991583eesm5698285a.24.2026.10.06.10.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 10:10:40 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 06 Oct 2026 17:10:17 +0000
Subject: [PATCH net-next 2/9] net: skbuff: don't BUG() on bad arguments to
 pskb_expand_head()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-skbuff-bug-on-v1-2-1b4434c5357c@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791306633; l=1244;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=f/7Qt7bAqqBllp49t2DfPlqJObj6PO7P5VTG+kUcK84=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIit/penLhirf0bNPQWI3WtNZB67EFqiOJY+szuEawUuRP4mEsvOMnAltCulWiG10mevs0TkoUm
 qj1dY1eh4Cws=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

pskb_expand_head() BUG()s if it is handed a negative nhead or a shared
skb.  Both are bugs in the caller, and both keep getting hit: commit
2cbb259ec4f8 ("bpf: Reject negative head_room in __bpf_skb_change_head")
and commit 64e6a754d33d ("llc: do not use skb_get() before
dev_queue_xmit()") each fixed a crash here that took down the whole box.

The function already returns an error that every caller has to handle,
and at this point it hasn't touched the skb.  Warn once and return
-EINVAL instead of crashing.  Anybody running with panic_on_warn, which
includes syzbot, still stops right here.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 512ff9cfa269..5d856948cef9 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -2303,9 +2303,11 @@ int pskb_expand_head(struct sk_buff *skb, int nhead, int ntail,
 	u8 *data;
 	int i;
 
-	BUG_ON(nhead < 0);
+	if (WARN_ON_ONCE(nhead < 0))
+		return -EINVAL;
 
-	BUG_ON(skb_shared(skb));
+	if (WARN_ON_ONCE(skb_shared(skb)))
+		return -EINVAL;
 
 	skb_zcopy_downgrade_managed(skb);
 

-- 
2.55.0

