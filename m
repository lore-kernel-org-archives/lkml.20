Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794154331;
	b=o+q3ZO5OByZ1KMOp/Diql3RA3Tjg4hiU685vpzpT0By8rHLFCc5HlGk+l1QOM4CpbByo
	 s7VONZwmM3OEp7Sv4mLbCMiDLioQMTCfFElao9Kxm02VRqBrGU0HqBSROR6YHsKEbFpm9
	 TquB+7o0rKXKVN23GOJwOA8t7cxBt4wuO8mnZt69N+8uDSLrKnS8E2Glxsp+A8myXdtTK
	 jetunmcWseDUw0DycsG8qdSJ+/vRg3Aw4lEchYo9nIPrF4mf+ou7Td88DxstXieSUugFd
	 oG35jsDZnZZ1lGatvZMXKmHBcBiEqFk50xbnADkE8I3lMPlquTazr2F6gfz7grNZTlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794154331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=89T9eyf/7pt2w5bHMloyOSyIASgmUej+LCY3qWFQwTs=;
	b=Vtz05G6RIUSr86cncqxMtM2xads1QQjYLSZ7amEUvjfoYpsk9LhAjrMa4BIt+AIBEz3u
	 WjN3Y4NrCm9QA+ahtoHgRxmczYA4n1ZZGHFfZLtaHRhOK47t96jaCULqH8fU9ifrwtDNQ
	 4eNx86oIKQo7ET2I/IPS/FDHlVkKdud8cRE2QUgp37B+jeXZp7SP76NgAz9F1rb3ZpF8o
	 ot3HtDzhygOB16CFia8lOr6NKEkQ+XFya6IdZ2DxCbaeHDxjbkHUsJqyh+51UTjoeMZMd
	 ac2CHSETuaBzCkAy/1C0+s6rh/v/LRl4izIzaO7hXWTBc4hgPYV5K/f4Y42S3G4+RUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JZ4Gby2F;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD402606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 16:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD402606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JZ4Gby2F
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1931ff67a29so447762c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 08:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794154330; x=1794759130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=89T9eyf/7pt2w5bHMloyOSyIASgmUej+LCY3qWFQwTs=;
        b=JZ4Gby2FvC2DBELHKFx4SybDLlGtuB7SQ5XgQ5eR59R2j4Wg931xxWyqTJsGcWV8FI
         leBHwUTE0i6796d8QedyDtdwFxpDyWOw+9Y4q7WcrU7TRHMlMTw3w76jZSSajMGMDJ4v
         4XdIGavyeSMSmY6yumPOTrqDSGHXfU6Z85RMvzjKYX87Gd4vmexl0CSQ6jbxpB2/YLRC
         NstZsnB6mkmNZ1PoEAGSqdyn6ZZ9Ohhg4+7TwwfTeOLfE+ggP9wOjYQkp8+DdpD+bxW/
         vQi5cFukX7xg1v0XtHq39C7mVEfVv0amHiDB67Ntg0Zh87z0aGO6trfKrcugE6gm+8Qa
         BxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794154330; x=1794759130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=89T9eyf/7pt2w5bHMloyOSyIASgmUej+LCY3qWFQwTs=;
        b=OJjkMoHs3TeK1O05LhEkXQ1GfzHaC2duW0J5wk+fVNEsbaKxe6nFxeZnLRb8m+qHzr
         bdmTOnhlRCN+dJbC5aon9V8y1cTJr5t9S7FiHzGpZbDx+fzCk50oNed0oCc+1k/FLwd3
         XO5iVTz8D7Y2c9owGgeFvz4cR60etipX1lDF2L5LOpd9hI5jU6KkSN5JRpRiKctq4W+N
         sVPMe7S/Iu/5OBmVkiM7aMMipB0bEtOeDsLHzrlYn7okSGOSKNxabsSzVE8IUveBaswU
         e+erTizVX63DgQAuVP3J4AqzoxzeCATT72N40Dtt8em2hWPQYdYLRmBJSngzXN5vsJL6
         Jyqg==
X-Forwarded-Encrypted: i=1; AL+hErHKRurdSIy0tlgfo1OvzH+fDnr3NuLd7Q8l4FeAXJHp3Rw+ecz1/5kMqLgWdtNiHdHwPdfUBCFbrARhgcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PRtGkdX56XqlOUsRT+PksSi0qWqmPNCNQDrPEcUoom+qepMwu
	vnpYu85djif3PPcACju7eEVQAhHX6HaE/xjAskArXxeBW6+Uc/JSECMS
X-Gm-Gg: AYBFou0EoKdadYrPRmuLM3NUQlAPUypk9+rirLB0kr0Hfz9QY8d+jw2FCoLCW0jSY10
	k9SzwHGpB+r/Iz8uNRm3KxhkDRuE9T4JQDi0OVOTBn0Wo1qBZ2KCFjzMzbTr9v0aKgZmzmGHctt
	ddZCtZnDWdr0L/Sx6jv87bjANf3DA8bRjcdjNpPB+huVDi4TlPMwKq1bgw+zfcVqwYi2QKTqiW0
	SrG2RhnDrwqROmW48CWsMjJ4/OwQvurZKSYvpzn8B+N0GWm8JHqKQGjpeM4Opilsj1Clyhx4hsB
	4Yei1sOj/AVDd30RTFkyFs4xbVltfi6UtV+6B5N69v0TZfQwf3voHolNcWHT8ekQHNsqNa/UYej
	5M+VDmAGg6SCR5zgd8nUIPgS7yaP9ItaS/DQDxhHIogUvxZG7w3OZOBZUVdPHB/IYcvws+rCgMW
	prm2EHnlBHWV6BAQDiCFdkKvXjOZWxi/y+kNwSnEf9fuWZirXZsJjHsPOPP2Y06Haxp6cpEVp0R
	7DWLBt2mbvIh5fsVZQYgi5+YGG+YZR1SUajUYY0SWZ05kDj9ayrQbpmtBkgw641Lfk92bjRH2D3
	8SpfcRC81UzdLn0l0njTsMU60UGcFWsCqjBVo2Vk3HBE/HksTF3Z99mpiCSWRWeGQie/N6iRrG7
	LtM4=
X-Received: by 2002:a05:701a:ca05:b0:18d:ac5a:89ef with SMTP id a92af1059eb24-1b39fef0c5cmr3037830c88.31.1794154329553;
        Sun, 08 Nov 2026 08:12:09 -0800 (PST)
Received: from Terra.tail0ac356.ts.net ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3731487edsm7103369c88.2.2026.11.08.08.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 08:12:08 -0800 (PST)
From: Weiming Shi <bestswngs@gmail.com>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Yongjun <yjwei@cn.fujitsu.com>,
	Michio Honda <micchie@sfc.wide.ad.jp>,
	YOSHIFUJI Hideaki <yoshfuji@linux-ipv6.org>,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] sctp: reset stored flag for each association
Date: Sun,  8 Nov 2026 08:11:49 -0800
Message-ID: <20261108161149.2774119-1-bestswngs@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sctp_send_asconf_del_ip() walks every association on an endpoint. The
stored flag records that the current association took the single-homed
deferral path and therefore did not allocate an ASCONF chunk. It is
currently scoped to the whole function. Once one association sets it,
later eligible multihomed associations allocate chunks but skip
sctp_send_asconf(), leaking each chunk and its skb.

Reset stored for every association so only an association taking the
deferral path skips transmission. In an A/B kmemleak test, the
vulnerable kernel reported 210 leaked objects from this call path and the
fixed kernel reported none.

Cc: stable@vger.kernel.org
Fixes: 8a07eb0a50ae ("sctp: Add ASCONF operation on the single-homed host")
Reported-by: Xiang Mei <xmei5@asu.edu>
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 net/sctp/socket.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sctp/socket.c b/net/sctp/socket.c
index c7b9e325ec1c..ed91ceff45a9 100644
--- a/net/sctp/socket.c
+++ b/net/sctp/socket.c
@@ -771,7 +771,6 @@ static int sctp_send_asconf_del_ip(struct sock		*sk,
 	struct sctp_sockaddr_entry *saddr;
 	int 			i;
 	int 			retval = 0;
-	int			stored = 0;
 
 	chunk = NULL;
 	sp = sctp_sk(sk);
@@ -784,6 +783,7 @@ static int sctp_send_asconf_del_ip(struct sock		*sk,
 		 __func__, sk, addrs, addrcnt);
 
 	list_for_each_entry(asoc, &ep->asocs, asocs) {
+		int stored = 0;
 
 		if (!asoc->peer.asconf_capable)
 			continue;
-- 
2.56.0

