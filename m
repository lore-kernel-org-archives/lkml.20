Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803065;
	b=W7ySOdfbwm4FxZ42cbtrZGYjHeGR2yU4GrD23aucURs6W5smyMEWqGGNcI+Y6/1s6AmG
	 wIxiZ20PShdeuB1p0AQd7d5QivzHb8KIR9KmCQuEKhWAX2afos2FKQRA4NYJP0cU8lumc
	 3vdX1Ns6g7SlP14bpqv0H88mtxE2DmYZvqU38nIo045a6tsMJ2ZMH9ET3Vl+eYfFuShPj
	 +uAAi+tUkmiDHC0ogq8MwTXwVoBdSTnmiF23wojyw3CuJaKcnE8Ln7OTsL9XOqRs5alJO
	 gE0CqVp0th/vJUS9JCUra/BojfMyV/ijMIpp2HD2racDJknYe9kB3/RBirJz/L2D8OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803065;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=0hwVZZz07iUe3KACc8i9KQSWC3eXwm+ao1NTrInwjeI=;
	b=q79pSSqcK5ex+MRF+Tt7HZKD98vMsM7c+aj6BPoSsD1Kq6LiA97wK6kHWYp3YGtzIFWy
	 WXbP5pm2rb20rFhl1b3jk8fxj2yJeIigPQJMuV7BzUhbzacZ/1zZQcX7lAF+5pa1LP9jD
	 CY36y4l2YHZEYA/KjSpuptcLxYi9v22BptxS31sRiaNOkDM7NbMo0lN52KlzgbqaTC6Wn
	 +RL6GFiEYUOk5Z2R4pHk870FTKt8QF15gC60KlX5+qR4qEj2b3UahlY5hDrnIlRIsg0ea
	 jiKzBNOdKcgjUslmR7k6XtBkn0s1byXa60k0c7815OnsSL1oZtTeE430s9zissTLQ7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361C0606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 361C0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-547ae874949so1110765b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:37:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803064; x=1794407864;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0hwVZZz07iUe3KACc8i9KQSWC3eXwm+ao1NTrInwjeI=;
        b=e8Jn7IWk+3Gk65CcqN9y/Dv8Reb8NmfDiO/g2g7jIdKKXIXce9fKNepBcQH/UHYFsh
         NzlcEDLL6XBXV5PFUczokEO+SHAyfgFRb1z41kCQe7yFabuFWMxSRBPZ4c52xZHnlWRR
         NLI0JQslRkwslHJzzL5JdB6x2XD+PiHrXgB6G2X6FMWBP1kJlKdPz1pmJSXPLhamqYlv
         Uscz/njpwDbSWD9dnpK5lcmgEEIRVdLfMUEsrYZyo7cvF0mS1UsO7PQEudRTBrSlkPrD
         dY3q2f8gm1J7vcJUdDzuKUJn6HM0J+2aNSBpH6+I1Y4tBX9u9uAsiy8oVS3gyNAGEGr2
         Fp/g==
X-Gm-Message-State: APuU4Z84t6QEysPjBhM1WpuHbEWcLTMagh93LOCKMK0uOFMHPZkRhilo
	zixGgr0Q/u6/X2ietM6MgJFlYCv47YdXRpI/2OdHuwSN7ogrNDXXZbIR3oSAJ7W1BuEQOHytg5p
	f+KKyw8NfTWW202yff7n+d4/pyk/4LXGkfMvglBsetjGVp5V3BayU8rF/hMg=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3502:b0:4c3:9892:96fe with SMTP id
 5614622812f47-5640dbd6783mr12735983b6e.3.1793803064172; Wed, 04 Nov 2026
 06:37:44 -0800 (PST)
Date: Wed, 04 Nov 2026 06:37:44 -0800
In-Reply-To: <6ae3d50b.9c6421ad.36baac.0003.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aeb4338.3389765f.1918dd.0000.GAE@google.com>
Subject: Forwarded: [PATCH] net: skbuff: convert BUG_ON to warning and error
 return during linearization
From: syzbot <syzbot+f15a6eff7a53f6eb7dc3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] net: skbuff: convert BUG_ON to warning and error return during linearization
Author: gowtham398gs@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


When receiving an SCTP packet that is nonlinear (such as an SCTP GSO packet
constructed with fragments in frag_list), sctp_rcv attempts to linearize
the packet using skb_linearize() if the sk_buff is cloned (e.g.,
tapped by a packet socket or shared) or not recognized as GSO. During
linearization via __skb_linearize() and __pskb_pull_tail(),
skb_copy_bits() fails with -EFAULT due to a discrepancy in frag_list fragment
lengths or readable offsets, triggering a BUG_ON assertion failure.
In production builds, this BUG() results in an invalid opcode oops
and kernel panic, causing an immediate denial of service.

Fix this issue by removing the fatal BUG_ON() assertion in the core
network buffer layer (__pskb_pull_tail) when skb_copy_bits() encounters a
layout or length mismatch. Instead, log a rate-limited error message using
pr_err_ratelimited() and return NULL.

Reported-by: syzbot+f15a6eff7a53f6eb7dc3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f15a6eff7a53f6eb7dc3
Fixes: 90017accff61 ("sctp: support GSO")

Signed-off-by: Gowtham S Bhushan <gowtham398gs@gmail.com>
---
 net/core/skbuff.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 48f676411724..f76fe6972859 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -2900,8 +2900,12 @@ void *__pskb_pull_tail(struct sk_buff *skb, int delta)
 			return NULL;
 	}
 
-	BUG_ON(skb_copy_bits(skb, skb_headlen(skb),
-			     skb_tail_pointer(skb), delta));
+	if (unlikely((skb_copy_bits(skb, skb_headlen(skb),
+			     skb_tail_pointer(skb), delta))){
+		pr_err_ratelimited("skbuff: length discrepancy"
+				   "detected in %s.\n", __func__);
+		return NULL;
+	}
 
 	/* Optimization: no fragments, no reasons to preestimate
 	 * size of pulled pages. Superb.
-- 
2.56.0

