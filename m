Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623678;
	b=0lTzYW37zu66nh4pbiPf6JPvLS5rTPf2TOvwGDMkcbB6lvtsvgtBWE53ZssB3LtLqMFQ
	 Q2XSvLseBIJ6AgMyxLFrYHPkOJoVc7HEhDD0e3W+15HzQ8vX3UnmI0M8fBzHjmdZGDa84
	 TzhKhrJPhj6o5L/wA4VOoKDsJ9bYNDRscCC8VtGR/1jfLJRvnh8/6kdWrv9sNXYdRqM/k
	 c6nZUlpZ3xF0aDCemjWWrIxtGzTGa33EDJLT6C6F9nld1QzVoUD1ZnMnbyYR8Ffm/2U4v
	 AhzZzdMHj7PQ2YiZG5tMA9p37/OtQK4oULf0sYmba1ZDNeMMz/+Z/9wgdrhRmggxyAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zqoWqaP8cnZQxZpPL5UVASrgtfs6Kly9E6CJOTM41tU=;
	b=NZVV8N10MMyWYKl5FOGqkCHqwHHIEZsHhpfeH8q2F7uIOPunO75DERE4vPmnW0nuHO1z
	 7OKtAb4GTv2QXIDhFDwJ50zobU0FHSc5NQh5P5mWBpaVbAB20+plP8DWRDLQsu0wH2y4o
	 hBu9jQoeG8G8TInt1IJZwos/f/ovGA9ohvUDJiq8j0BKwKakyh2L8X7/idpX0nJ1jJFqt
	 mfZl7v0eLE02u7Hp3LFzkIDFMncWT9GC82U0fZ+pT9SLW4urPtsOzVAUJnh/bMRBxNbgZ
	 GW0wveNP+eqHzwHtCLSvcOQYofPvnuNd+wWxzl0MhPOgp66Z2y7jTKpkrmGsMNfmodQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rw0n5fK4;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759B6606A339
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 759B6606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rw0n5fK4
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc758830601so1781646a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793623678; x=1794228478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zqoWqaP8cnZQxZpPL5UVASrgtfs6Kly9E6CJOTM41tU=;
        b=rw0n5fK4MnaD3IQJIzm+vgfsJelHJJy6+EQ1mLdsTyeE7nAx35qWOOW/mWoj6tYKjs
         +8yF4uneyKymfwNOiZDic3km4qFPavWLlhB9ZyBa+Y2qjQ4fttIyZPm6nW6mOIVQjd1g
         KyvI3W220e2TeBv9Jt0ZKs9KW8psJhnbvUhlbsbIt8dyCiYfUZMxlHsoVvBNxV8Z2Ihk
         YXms1PI6KfpFETKzXDT3JONi4ocbKLoZLl59qNggXiCn4NO6Qax6NWQuoteytEqRSI77
         X4kD5MVZ+mK9jHTkczscbYPnvxfck5NX9BbdmyHR0KnYFnkZkuVx2IHPK4voN0KGy6Jw
         n6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623678; x=1794228478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zqoWqaP8cnZQxZpPL5UVASrgtfs6Kly9E6CJOTM41tU=;
        b=j7P5vppDhV/Nil9t28Jj0dLMvQWXbsy2pczNVIPHxP9Mzq23D8RZwKcdpSAO+43sUr
         /EgbU8/t85nj9g8LdyDX9fuWQOZCsotkOVwoevmGMuV+5sgC+aHWuE2Tzf+1fy/4684l
         /T6uNBoDU1PMq/Vc09oURnY2Dv86Km18qZ2bqwuPOXj+R4StUjaKXbxbn+Ewh7UPDa9o
         xQ6A8Dt3fWkvb52IKH0dDeXF/ELAryc+qWl70TDfqwsHjvkIhvyvkcume+6IMoLky9JJ
         fPD7ricMTWjW4z7osV4uPW9eqIqmxr5HdxWohEWmPrnZQECvHu6D4PAZSS4W6BqLso6j
         d62A==
X-Forwarded-Encrypted: i=1; AKwUvBw8y3SwKqUzFhWb3bEs/YW54g731e7dHNcgrwTw+6Vs9Z+bcVnuPIq+NxcnCkc1cCCVdCIFjABuEMxm0t0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ59TJ4aMnSKu6iOTswlI6CC5SuVSDE+z6bqfNMmuaOaC1CSSgX
	Cw3qgDOTgSVVRPX4RLGYasNausSyHI5ZkIkkZvD7xH+iejCNvHUbqFY5
X-Gm-Gg: AYBFou0QEMu8RpgUaDKTR4WXKfbtYr74rMpR1LvwSPWOMDcyxcAs0JI9Fu5WEBcoIV6
	gqmAduJx8EPdwn7HkqmgK3lMoeMW1yncyQRyeWP9h3P7nvsiK4pJLO4a6/dknATLYywiMpM3CDe
	ScGT+LZbl8j6vgi+caRf/fReN4WtvbweWzmOlcF4J0bRToY5HUh1tPdVTtfjqAUz2CeOjHhqyhy
	30U8Z1N0baHpEpxzl8JvwyPT12teov2l4gErgbZ7Ef9me4WaSOqf7pMDnQZc8IJOX1wOsDW8CkR
	o53henF2qiZjXjTSaHNELBA/gSvrgxmhBSH+oGr47Oksk7OG5JSZoGy3s0360Ou22GIcTzYuuFU
	Fgx3Z5iB0EQNk9DGzYOHQABVgjcBZG+N6hrED2FfYyvTW75HXgsKnOQVg8jvEkjHF5ItcNv1jlO
	rlIJyEo/XPLgZ6ZJvK+37ohXP2YoFK9oPPh+hD4mee2gcm0K42ycsB1fhRN+ZPfGQGlggcF19Fq
	18uo751J3jn0e8sBCYryp3K7NoiBFy1TrNkmWpSvBjplrEIwt2vwrO5xtqyBAp3XJkiOqTmpy+M
	yW8GeEQa78y9WSgA13b4Kb5TtHpQjbYXgbjF1/76nt0ctMHWhY76K2QUD9OE//w1cGq5
X-Received: by 2002:a05:6a20:a126:b0:3e1:c1a4:91f6 with SMTP id adf61e73a8af0-3e928c5c937mr9229349637.13.1793623677157;
        Mon, 02 Nov 2026 04:47:57 -0800 (PST)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad77fda1asm1908357b3a.6.2026.11.02.04.47.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 04:47:56 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Johan Hedberg <johan.hedberg@intel.com>,
	security@kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Bluetooth: L2CAP: Match LE responses to outstanding requests
Date: Mon,  2 Nov 2026 20:47:33 +0800
Message-ID: <20261102124735.23199-1-enderaoelyther@gmail.com>
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

An LE peer that can reach a local L2CAP listener can use unsolicited
responses or Command Rejects to bypass deferred setup, remove an
established channel, or leak an unaccepted socket and channel.
Authentication requirements depend on the listener's security setting;
whether a default configuration exposes such a listener has not been
checked.

Patch 1 requires an outstanding request of the matching kind before a
response or reject can change a channel. It also completes socket
cleanup when a reconfigure failure or reject arrives after local close.
Patch 2 clears incoming identifiers once their responses have been
sent, so a later ECRED request that reuses one no longer matches the old
channel. Patch 1 is the security fix; patch 2 is separable.

Patch 1 extends the BR/EDR lookup from commit a518b9a9ef6e ("Bluetooth:
L2CAP: Only accept connection responses to outstanding requests"). Its
stable tags request 5.7 and newer with that prerequisite or an equivalent
backport. Older LE-only trees need an adapted backport without the ECRED
hunks.

AI assistance was used.

GCC 12.2 and Clang 19.1.7 builds passed at W=1, including full x86_64
module linking after each patch. GCC also compiled the Bluetooth code
built-in on x86_64 and as modules on i386. Sparse reported no diagnostic;
Smatch retained its one pre-existing diagnostic. Coccinelle 1.3's
use_after_iter rule found nothing in the changed functions; five
unchanged parser gaps also occur in the base.

QEMU/vhci testing with patch 1 alone kept all 445 established channels
alive. In 40-pair close-before runs, failed reconfigure responses and
Command Rejects each destroyed about 40 sockets with the fix and only
boot-noise sockets on the base. The success path destroyed the same
number on both. A 1200-pair base run retained gross Slab memory after
listener close while the fixed arms released it.

With patch 2, new ECRED requests that reused the identifier of a
closing LE channel completed instead of being refused; partially
accepted groups were not tested. A KCSAN kernel with both patches
reported no data races in the close-before runs.

Hardware validation has not been run. Patch 1 does not apply to stable
branches as is; adapted backports of both patches compiled at W=1 and
linked as modules on the seven supported lines, and were not tested.

Zhao Li (2):
  Bluetooth: L2CAP: Only accept LE responses to outstanding requests
  Bluetooth: L2CAP: Clear request identifiers on incoming LE connections

 include/net/bluetooth/l2cap.h |  1 +
 net/bluetooth/l2cap_core.c    | 87 ++++++++++++++++++-----------------
 2 files changed, 45 insertions(+), 43 deletions(-)


base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.56.0

