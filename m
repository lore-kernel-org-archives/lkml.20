Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789369;
	b=o6uGiu1AZCuDAO6S2Ix/X8jvpLtsxwrTOPQBnmBU4BhlOhPPnQ2nnLLh0UU4RtbiRdXx
	 oRq8erJDh3GNr3nKO+s1fHHmHjGe5Sdp420L5LU20fF57giAFx5iMVzPMKbPwtq58xF/d
	 CXbwLhXGOgdt+3L4w3+f0PT74aUp+2CaUmtPN8wP59e0dHxR+xytAlAUEHwJMzQzCy9aI
	 tm8nbvlEfUmsABiF04N5pbDnI3IvBeeEtbvezNyNM1LF3pgDyi+fDGQ5ahjetLBZFBwKw
	 8SR8ouCRCgUnDuE7JVMPP583Dw5HQsoMZypX6V2FucnLt0XNv9U6UA06ygJZKHL5prA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789369;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=LG6G8th4RYYpIMQmVioeS6bsnFXlnKDIialXfud1Kvg=;
	b=x8vLULPq10VeJNa6RdCgUMkoguqY6AiDiSgsR1wTZtvvF7PrqXM2cOQNs80YvUubUNA3
	 xBX7K77i2Jk4vEXdbmIZtaLy1FnYk9v00DwZzJaN28v4+MLt+wvw69CceMv2DvBeyaA6T
	 8KrgnxM69JjkavUye/R2Kz0xE+Xq9KuHkeejLA8/oJl2qLm6n3QV46r8t7UTgRn9Q9ndv
	 7cbx83kYqNh9z6c5otbAzqO5idiOEAZeYT6NB+y8WO9jz8zpUuy2PjiRogp92LzrI+Sqs
	 QqynMrRSQ2JhNfLjz6GQY08kNn5OTlRzPDVHnbogz4LXUehw4+C94LC1wh5n/+wbQOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90406606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90406606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cc89e86e9eso749476b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:49:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793789367; x=1794394167;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LG6G8th4RYYpIMQmVioeS6bsnFXlnKDIialXfud1Kvg=;
        b=C1sYhE9g1BnZ2rl0+ZzQVp3TWY2u4A6HJX0pf+AIQOzLKns16qZ3IypAIbZavqH3IC
         IDmJH8Qx3njSbkLOsj7iZxr/qDg4miN2bqqL1xOlS9/tTT8JZ0Cwg9OTZNhA3AjBqOMK
         U510qJd8GbO1WMCcPs+kUut6xVVLzIkE/jOx52T1y9BG81EAOKHxwupGSDGiCnOXYzQU
         utSCeL810WU3GmBWeMdy7WP+mdhteOXkoOF9mHgTUUondPQYfE+D9VGv3RXRaIf0wdqy
         oMYc3F2VbpXQ3pRTYqW+PstTaNnoT+ern0khBaQ+zi8F6AjmBkM6YB/kYbR0Gr7EX9LB
         +PtA==
X-Gm-Message-State: APuU4Z+3LGAMI/bBXXpRhFxuYJX4a4I+UAk5mxr8oRUVukU8HphGqjV2
	71spL9SG/qgwlREz1ez9JmLKpwu0jzOYGuEPRxkjIc1hCca35+7VVBnX8EgT7lGaB7MNjjF0cM+
	YQy5lfySC0Ent+M6ojK+4fjWahVVnW2wgCvIUPT/gtN9mlbzVn6LYuyLqSxw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2219:b0:4f4:f3c1:72c7 with SMTP id
 5614622812f47-564609f27admr4636573b6e.61.1793789367631; Wed, 04 Nov 2026
 02:49:27 -0800 (PST)
Date: Wed, 04 Nov 2026 02:49:27 -0800
In-Reply-To: <6ae3d50b.9c6421ad.36baac.0003.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aeb0db7.bf891901.a11b2.0004.GAE@google.com>
Subject: Forwarded: [PATCH] net: sctp: linearize cloned gso packets in sctp_rcv
From: syzbot <syzbot+f15a6eff7a53f6eb7dc3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] net: sctp: linearize cloned gso packets in sctp_rcv
Author: gowtham398gs@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


Fix a kernel panic bug caused by an unexpected layout geometry mismatch
when flattening cloned non-linear SCTP GSO packets.

When an incoming packet is cloned (e.g., during packet capturing via
tcpdump or Wireshark), sctp_rcv() must flatten the packet into a single,
continuous memory block before parsing its chunks. However, if the packet's
internal frag_list has tracking discrepancies, calling downstream memory
handlers like __pskb_pull_tail() triggers an operational failure.
Because the kernel treats this failure as an invariant violation, it
executes a fatal BUG_ON() assertion, resulting in a system-wide panic.

Fix this issue by validating memory linearization early in sctp_rcv().
By intercepting non-zero return codes from skb_linearize(), the kernel
can detect frag_list length discrepancies before they reach the core
network buffer handlers, allowing malformed packets to be safely routed
to the discard routine rather than crashing the operating system.

Reported-by: syzbot+f15a6eff7a53f6eb7dc3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f15a6eff7a53f6eb7dc3
Fixes: 90017accff61 ("sctp: support GSO")
Signed-off-by: Gowtham S Bhushan <gowtham398gs@gmail.com>
---
 net/sctp/input.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/sctp/input.c b/net/sctp/input.c
index 9494cfa51106..6f66ae656d70 100644
--- a/net/sctp/input.c
+++ b/net/sctp/input.c
@@ -116,8 +116,13 @@ int sctp_rcv(struct sk_buff *skb)
 	/* If the packet is fragmented and we need to do crc checking,
 	 * it's better to just linearize it otherwise crc computing
 	 * takes longer.
+	 *
+	 * If there is a geometry mismatch, length discrepancy, or offset corruption
+	 * in the packet, skb_linearize will fail and return
+	 * a non-zero error code.
 	 */
-	if (((!is_gso || skb_cloned(skb)) && skb_linearize(skb)) ||
+
+	if (((!is_gso || skb_cloned(skb)) && skb_linearize(skb) != 0) ||
 	    !pskb_may_pull(skb, sizeof(struct sctphdr)))
 		goto discard_it;
 
-- 
2.56.0

