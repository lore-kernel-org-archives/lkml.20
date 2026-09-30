Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E87348445
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760710; cv=none; b=RrJYn64WtgjItQZefUJFWDVtjyVKr+jam7KzDEyWeRo95so1DKxsDwnTLgUNHpfBuacneAooOlaSsWYBW5nbQoezdxBz2AGz1G36DxLf8ywdASnQUKfusT66Ced9oZ+9qv2pMvw7KpBajtSYJRg25c8AK7D6GkP/hiwefITOQlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760710; c=relaxed/simple;
	bh=p0gH6VhX6KjMP+FtjJ8plJhhVTCWn3ruBIwY/HkF3H8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BAgp5S9FTqS4MzA31kn7m8xbwSby3L5mahN5CV2fLJIjpIQ8nRCA3m0E9DRmJg7hV7ypk0nCoQqozXlFG5zv2RjKqMTyLhqaOwG24ayYYQ9YJEUwiUYYIOaQsrfRAZ2lV5k4fd3sV0JdFDl2aqK8RHvIXzz3yp4Ah4IkFZgyuSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security; spf=pass smtp.mailfrom=octane.security; dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b=XaQQUDej; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b="XaQQUDej"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34abf779ac9so1462246eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1790760707; x=1791365507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YQCbSgazPMjYU8lcAbB5w+2GY09p0ZB9zD7aYR/EAW4=;
        b=XaQQUDej1lb+sE7thEnG9sluKhCdjZfOptgMX5Ny70IkfnKsB7XrWBht5YgGyFfE+q
         6r10++Te31B6JOLogbSU/I9xBepikW8z9nc69tbKcuLt31oUfbfUwL9UlIIuDY9CRFT3
         gZaJpe3KUHMEZanlS/j5GnMUmhkqbNnGTUo+hgUSrGvK+ev+h8A6S76rogqU4/AqHRRv
         IAJuR73FbMOB4ZMSkMEYjNwzhIA34YFQ0qLYsgW3V9+p2Nwof14l2f+g58c3YNb49bBW
         YKh52ccZlO6EhlPHje2VBSfhKeQj0GU63l0oAw4SagaFV8Yfy2pVecX8oNyEElofP54P
         NsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760707; x=1791365507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQCbSgazPMjYU8lcAbB5w+2GY09p0ZB9zD7aYR/EAW4=;
        b=IhqPNPpyrpT6kf6i/al4s7LZBkxE2fjSCbzkcbIj+TYkG+9VvmMORwJIifVJHJh+6a
         3n+NsYFBtiB8UEJ2r92/X97VUcG/B6CvOVaCDPvoXmJVUf4ssPlOJok3kcL/rko24NaV
         ydJHErCm0v487Txj//ni5gloTDNOlxNHrKGVQe8dDyXCb6l85pnRXI9mnWQ+0MX9rJQt
         l9a7UGdxNcPguQ74PDr8Jae3riui47Om7gBA910m8jzw24lsHArxLaX7gHqYPfcHf+QT
         cJF31KDM5iGnU0w6s2GfVSsjpXBjkk/ZxybB8F6joRinnkumbs7b64ad0m2uEYTPeKjj
         qtvA==
X-Forwarded-Encrypted: i=1; AKwUvBzBxnT3DoXN1TVPNHhyFa6gVDuOMn7Mv0sEKS0wch+YH7nfVEEJxsPckXWNM2A7ohK3lz+ryAvZjznWKAM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8JPV36tZmeQcq6xAZagX8NkjusWLxdMawIKP9CuTMBRlopbsA
	c3cSXU/ZqIC/tYnwyPxG0PyplHLume1l1ocaz1MLwzHqGRzMMedLW7rMlrjoADfcwSA=
X-Gm-Gg: AYBFou0othXvVxfuDd3Glf7LItFsm2LlalaAoqqZgjsj/5S/ILVl8UqoWUNgFdEbBxS
	9mnmjykitEo/3h4/690+8pXWCTz3V3+OaTD0+NALxAa9xShhzXM1pXpKF3bdsgoyOybWL1BKL7X
	mzndqIapGWKLviwq03+UdHL5NkkFvHtxIRwqKEPWUk6PabNv0Io/lJjbK9otn9hvWVnWluDFP+G
	CZ7yEK9e8+DFrmeOFPwZVdPPgSPFFPzkdajSr6/9I2RikTtJyWW58NyiHeyxvbaxN5OE9lkf5Wq
	+rAzctNBlBw6bkSUxNVsLXuvmsmJl/LUAX9rrDDJvxTmduEFHLeJWVQgjYmXdICAaxB5O1NNKlH
	LCVrbzUn9LtHwRGRk4lUZ+Pate7a6Glb2LlG/keRZEDsdMFI2VdZNIeK+ptXGc0MJutJqnAJkR3
	a4u37pp0ufiw2oKzfMcHXXdHaxJvflru2uv4/mlo51SM9Cgv3NmUNhSLIHJmW+0eYMlGcTG+Qfh
	PUa9q3WRsLmesv2FI8z3ii7QYVRXTXRfsgak8pNzQW8m8Bhq/TH9CFpeWK1FILcE4yjLU90/5nr
	niF6g0gntsp5Oktu
X-Received: by 2002:a05:693c:66c2:20b0:34c:7e54:65e6 with SMTP id 5a478bee46e88-34cd91735a2mr1060753eec.5.1790760707160;
        Wed, 30 Sep 2026 02:31:47 -0700 (PDT)
Received: from localhost.localdomain ([45.125.62.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf4a64113sm3727804eec.8.2026.09.30.02.31.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 02:31:46 -0700 (PDT)
From: Shubham Antil <shubham@octane.security>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shubham Antil <shubham@octane.security>,
	Giovanni Vignone <gio@octane.security>
Subject: [PATCH] xfrm: zero-initialise km_event in replay-notify to stop stack disclosure
Date: Wed, 30 Sep 2026 15:01:37 +0530
Message-ID: <20260930093137.7163-1-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xfrm_replay_notify(), xfrm_replay_notify_bmp() and
xfrm_replay_notify_esn() declare a struct km_event on the stack and
initialise only its .event and .data.aevent fields, leaving .seq and
.portid uninitialised. build_aevent() copies those two fields into the
XFRM_MSG_NEWAE netlink message header via
nlmsg_put(skb, c->portid, c->seq, ...), and the message is multicast to
the XFRMNLGRP_AEVENTS group, so two dwords of uninitialised kernel stack
are sent to group listeners on each replay event.

The request-driven paths set these header fields from the requester
(xfrm_get_ae() / xfrm_new_ae()); only the kernel-originated replay path
leaves them uninitialised. Zero-initialise the event so the header
fields are sent as 0, the correct value for a kernel-originated
notification.

Reported-by: Giovanni Vignone <gio@octane.security>
Assisted-by: LLM
Signed-off-by: Shubham Antil <shubham@octane.security>
---
 net/xfrm/xfrm_replay.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/xfrm/xfrm_replay.c b/net/xfrm/xfrm_replay.c
index dbdf8a39df..9394953247 100644
--- a/net/xfrm/xfrm_replay.c
+++ b/net/xfrm/xfrm_replay.c
@@ -40,7 +40,7 @@ static void xfrm_replay_notify_esn(struct xfrm_state *x, int event);
 
 void xfrm_replay_notify(struct xfrm_state *x, int event)
 {
-	struct km_event c;
+	struct km_event c = {};
 	/* we send notify messages in case
 	 *  1. we updated on of the sequence numbers, and the seqno difference
 	 *     is at least x->replay_maxdiff, in this case we also update the
@@ -304,7 +304,7 @@ static void xfrm_replay_advance_bmp(struct xfrm_state *x, __be32 net_seq)
 
 static void xfrm_replay_notify_bmp(struct xfrm_state *x, int event)
 {
-	struct km_event c;
+	struct km_event c = {};
 	struct xfrm_replay_state_esn *replay_esn = x->replay_esn;
 	struct xfrm_replay_state_esn *preplay_esn = x->preplay_esn;
 
@@ -356,7 +356,7 @@ static void xfrm_replay_notify_bmp(struct xfrm_state *x, int event)
 static void xfrm_replay_notify_esn(struct xfrm_state *x, int event)
 {
 	u32 seq_diff, oseq_diff;
-	struct km_event c;
+	struct km_event c = {};
 	struct xfrm_replay_state_esn *replay_esn = x->replay_esn;
 	struct xfrm_replay_state_esn *preplay_esn = x->preplay_esn;
 
-- 
2.43.0

