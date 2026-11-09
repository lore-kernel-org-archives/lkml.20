Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221590;
	b=occZus7LedZrVf0zrHViVcXuth10pPK4hjME8SAFPFXoX6D9oXEJplBLaZz1MROqWEHd
	 gkRWwRo6015gX61sTaVicEhiu9Qsa7Id0GWPkEduX/d0NouM/zHNUKSe6JWwU8scNyzcS
	 WKANcvMDP3jSxQ7Vu7g/MzVuD+EKjJqpFrVEU/LwVoMEm3UnybObq1fSk5pA6e/WV8AlX
	 xvQitQw18oHaa66KUel84rvS4hk/LnaXirJTWyN6Z0e9wjU1EDCymnqLWhJRxI1Cl02VL
	 hyevPT1RalgZZs/OoAZg0A74nr0LWtjU3Rux24lwyvJQiQLC9vmL704YqZIX6SfdzAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=B8wcRySJd/dlTtht6qCP4yFXYl/Td0vFc8lSf/i1WTo=;
	b=AqWm0oA+N34z3qryiB6PbMcJ08wk/lA5Q6yaMbIT4ByvUBpo/iyw7uw7I03JUXM8/EO0
	 AWA+IiBGCyFKBoWg26XYDpYW43t9lOhwJl+7ppQWafUJthYnY8/aR2+IrYIjvVbgsODaO
	 lXBElNoYflrL0q8GPXL246hS2aP1NVgwX+cIDR+j4ld4fIoVHxwszY4BXmyjx74Bsftc3
	 /DXsrLZ5jMyMAF8/xgqva7WcOodSnjW48mUHNStQHmq6Qe4N+0Xe4TvlOyn2jej9MAEo4
	 j1GddLpdTpYtFBlvBHthwgp5rphCt8VhPfKdvpqHCg7lulE64XKAi8ZRbns9B2FnYIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=ag8s8wnN;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B3E606A33C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29B3E606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=ag8s8wnN
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1097207c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1794221589; x=1794826389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B8wcRySJd/dlTtht6qCP4yFXYl/Td0vFc8lSf/i1WTo=;
        b=ag8s8wnNbir+9Lof0homx1DDFO7cebbc0V5YP8kmlt9OiSkDrztC71N+5LloWADaSB
         MIREdddFLzjBCDaU0rAYi4jtosvgp8pMYdFoMEU1ZNPxC2goflR2DxIb3I9Cx+gb8a9n
         JVE5kUuWlyy1Pf24t6JML2CRYGzkC77vA3Q0zTWoy4dHb8TELmrSXj0P6SBBTQ8CqBx2
         dmAWpkESG9SEXIpJJYKsap5/hJgXdaMdE7I69eWpbbm3+ww6WEfftwIVKPOxXSJ3eRSe
         WDQDkcbTey3ZsEiVlEaOdKz3mo7VVHjP51GUND/XC0H0BWt1eztty6c0/ddDZCK6DL0n
         VXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794221589; x=1794826389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B8wcRySJd/dlTtht6qCP4yFXYl/Td0vFc8lSf/i1WTo=;
        b=beE6cWYJ1/HjwlE4mAXR8RObzQGehISAYOBp83M5XkhzVztLrPxYy1FIYmyHwIilt2
         ismhidoZkKRxg89nfGlALYQktQpCiaen+t2f7Wn4BxzCDyrjcyoWGcaWP2+R7p2ykMka
         JsHPmiKAMNIwbvCM3HskU063RpuQ2SMCF+0PX2VvmP2OYwsz3sTWqKDxgqIjtfPX0y6y
         cwJAaRKGnmGkNKfcVDwH8h0OatkelfL80Ba/YZ4aEi3/9C0DCPLzQK6ThfP/nuC+S528
         V9VlyrhFXpz9LAchpEl8C9hEKEX8y6bInCQFLbmyugrmd2v8jZwxuiFQVodn9l6oMmMl
         5T4w==
X-Forwarded-Encrypted: i=1; AL+hErGtRU63VTpKJdTRO/25rnzcLUHc+VV0M0NTM7NjpHuwkgqdWDwEqB0dk/rrYj2f1+Q07ulMfTGD0qhbGuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z93JTXuWM3GMpssTPeM+ny0vx11LNIVjv6utLS54nfXS7faer9R
	RgXVNGQ/esh72i0x9U191o79z06no8XourNkG96wLkt4Uk4v0Pk/N9HRY0+t/Hjszw==
X-Gm-Gg: AYBFou1OFu+ecavbrHZ5EF4HVdeWiQ1t5WXr4BMJojThqemWeIsbgqyIwIc++Z0hyAH
	Tiko2co1H4ok1nZ26Hutp0+7eXlXlq2YSrTJo6ZIiOVV0PPMz5iYbALItSUgfQPXQ6pYMa7rVp/
	zGh3FSzn5Tb4Ll9qa8/CzYaesnQ+liTD0F6LAb6iAD9GpZpHQaubJ6QwI5l5vyARR33n+tREnTL
	lm1BQB11ndWIzoZrwEwyupK/enCqoJVugQVnT6VUZByvVErCVQlfBPwNib3EobFF/owYxbKMl8c
	BTMamJ58oVW7Ia79FInHWcGvwFO8TUHWPiDl1oVwnCNyj+WQiEUWw82BvaWCvjUeeQJZ9i9JvcX
	3gmZizIqGDBCIALC6MST2JOw3deVVagHPyX/pjqAtTNOqUEKHjy9AisWkF2ttmW1Twgxxba3nEb
	AH8eYhW3gPnU74KQ3jJqxc0J1XQqNijw4ofZq5wTK+xpKEXXjGdspKR70oJCXg9wPLryTg1hcM7
	q3DGiroHj1tFX7ZwGyFfq44npzlnXXtwu8P/t/MWlI24IwQDUrlbn0ZKlWMD+JbUQAo0Dm/jNKl
	k8HEE240zQxkrFSd2WKJaWxko6bNmEFx1EB+tA==
X-Received: by 2002:a05:7022:150e:b0:151:6e80:baa9 with SMTP id a92af1059eb24-1b39fe7f403mr6653083c88.12.1794221589238;
        Mon, 09 Nov 2026 02:53:09 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375726fd1sm12228744c88.14.2026.11.09.02.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:53:08 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Simon Horman <horms@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Tomas Bortoli <tomasbortoli@gmail.com>,
	Chirantan Ekbote <chirantan@chromium.org>,
	Greg Kurz <groug@kaod.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
	v9fs@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH 4/5] 9p: take the tag of a flushed request from the request
Date: Mon,  9 Nov 2026 19:52:50 +0900
Message-ID: <20261109105251.2545764-5-lian@is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109105251.2545764-1-lian@is.s.u-tokyo.ac.jp>
References: <20261109105251.2545764-1-lian@is.s.u-tokyo.ac.jp>
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

p9_client_flush() finds the tag of the request to cancel by parsing the
header of oldreq->tc. For a zero-copy TWRITE, however,
p9_virtio_zc_request() adds the payload length to the size in the header
after marshalling, so p9_parse_header() fails on the mismatch with
tc.size and no TFLUSH is sent. As a result, a zero-copy write
interrupted by a fatal signal returns without waiting for the RFLUSH,
and the server can still write the data after the writer is killed,
overwriting a later write to the same file.

Use the tag in oldreq->tc.tag and drop the parse, so a TFLUSH is sent.

This patch is assisted by Claude Opus 5.5.

Fixes: d28c756caee6 ("9p/net: Fix zero-copy path in the 9p virtio transport")
Cc: stable@vger.kernel.org
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
 net/9p/client.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/net/9p/client.c b/net/9p/client.c
index 66980ad52bca8..15bb939087165 100644
--- a/net/9p/client.c
+++ b/net/9p/client.c
@@ -477,12 +477,7 @@ p9_client_rpc(struct p9_client *c, int8_t type, const char *fmt, ...);
 static int p9_client_flush(struct p9_client *c, struct p9_req_t *oldreq)
 {
 	struct p9_req_t *req;
-	s16 oldtag;
-	int err;
-
-	err = p9_parse_header(&oldreq->tc, NULL, NULL, &oldtag, 1);
-	if (err)
-		return err;
+	s16 oldtag = oldreq->tc.tag;
 
 	p9_debug(P9_DEBUG_9P, ">>> TFLUSH tag %d\n", oldtag);
 
-- 
2.56.0

