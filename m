Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794344522;
	b=YTn0FF8lS+otPts5/sl0HKysY3xhbw9b809VLrj4Z1oZl/titXH5GRWjcrKhY1H1rF4C
	 OhM3gIs6kd2dfKnYct7AnafvpNfieut8YjCnrc5UrGZXVTMGeUeG2jrtFopHeVYCYGdQQ
	 8iAbVR1XTBqSELBBplbPtpiQXPGT966s8/iPSjE27MABkDs4sMH8UXzE1EE10ZHoQsUkX
	 QJnHuv03o2EmpVb7fhSGfrqYalbLdinavtsFvNfzKsPCTP5eZCOr4eLJQ1Y7V6vMsv6an
	 3iciEfdW9RhGMd+KISS12jCTPJvx+aLZaxP6NI6qaTIRYblXlSn1vjU+OuUpfkOKxBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794344522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dy9zjtNbr6qe/+euwDS4ARapr6gYv28sKl4aRiD8Pk8=;
	b=XySIdkaHARvKxS9nIdQZSzNDsHBeKlaoV//Fw33tFoSDNqD6aX6zlkDRRwBA7oxzK+E6
	 Rb2ROzejMxfcyP4pbda1E3NNHsLE+0zDoLLBEI+rHQXWfYdkv//cF6F7VuJRK7fum96B2
	 XeE/sZ9DHxn9vYBGNvQx/Z1fazDCImhlYdRwlqhik0JwrLnF/sYnO577puu7S0pChIF3w
	 FgXIlsl7uVdSEma4dpT0pr5WEwIiodHkx5CHQ1tfaI7rh7RuxZ0ZmwPANeYz2SpDJT5GV
	 9M+90HUNWcXid85fywDinLg1oGr4DCfkpsiM+vR+LEcrtpuNufNn1pZqcTLL+gUY0eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=dxfashKj;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349FD606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 349FD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=dxfashKj
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so4108219eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1794344521; x=1794949321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dy9zjtNbr6qe/+euwDS4ARapr6gYv28sKl4aRiD8Pk8=;
        b=dxfashKje26Pt4+PcyN8DTxdB7ClpF3jwBf9sqFwKvYJA0U2XxemiEeMp9ff5RNliY
         wWsSvFbVMJ2VIqCUy60jSe5YxzVmRQLoBVzAae56KUU0EkW+SJlte7hcoeORtzUB1fRL
         CteMdiJ8dLSHOr3MAkLERXqEKNzNEp/97dRQyuMojSS+M6YpbgOiHi4npa8uQmH1SXL6
         tWecPnEcjIheSaEHVyuKWBKG1RguOEEc3705nYCRSSxHM4YkNTM2M6eb4B6vYQs6EvJ9
         EN04GiiZ3CyOA7OKvkp28HWFCg9fJxXAFQU9fgKzgbpe4qxqSZX587UPu6IyO+K+VJDU
         ghAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794344521; x=1794949321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dy9zjtNbr6qe/+euwDS4ARapr6gYv28sKl4aRiD8Pk8=;
        b=zqbI4IX1ugJ/Bh2k+pDLlYJ6EQKqisBOTUFXGPriNaM7YljUI8YLAJwq7fug2KS471
         MqGHHjderN4fDdlAWTL/hxV+dThRlO9NI5rDIo5jUZfOAu3bpjqLetCvkO0zMKfHxV50
         i/vgF9ySbMK1I3wqmKxy0cyt/Ws7p42SKKKKmdqiz+HHyubNPISOFqe7HNvM1nuaEPBD
         d4yWzsT1O3WsyucXhHV2WeHmELs6xJGB0ETw12sdbaCRrBlLEfW9AI8Dq4cyGeCsBPtu
         qOb/OB/5/cWkxbkijO0ozK9W+CnCDfM7Gf03dWYy1pr/9omlRkEm0Fd5xhEhA6AuQcuU
         pQOA==
X-Forwarded-Encrypted: i=1; AL+hErFJr+u8Nx92RqWZW0WrnIqwlm4XYdZDNSHMGdU1S5JNg5gUcKWN9qbk6arvXicWHwXeqPBkCfWnTIv8/G8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kijmFfhTfOurxjes9oywkmNm7B7XZxCxYBlKS6e8DFvuFezhb
	IW2L23aqrfDaLSBH0U2/RrDbuYvjfc5rBzdsxfFNn31vKf51WTuybuaBZVrj5wRUc1U=
X-Gm-Gg: AYBFou00lqC8nIcj54YOV37om3gPqeR0e2ml4DEhr/V4ZgKEp3FRpsIlOdt7Uhs2xSe
	QdtEWNBB4L+BK/T5KxW+1Otn82MB8sOev5bU+luk/NVWBg4qhg4GtAbBgDtxhZONdp6Yhlyk3og
	6zV79AtiYT7UbKIWqzl7O1atg6UJ+y1/NKvpYg5xg6sab2xDzoB8k2xQzZvqELYevZf9koj+hN/
	r4HPPRm/OLTI65VX6vV+OXrdi59/Ru1ddn0au4o3to0q4UNkZes2P2OX1OPgzGDhxT2frA/SLkt
	eymp0m7zbwWExJXG5VCYDVuGhhoYCok3yfEORLkTNbPRvpRlymYQq3T2SbeQVr0MA06reqryJ5R
	g7f9tNfgWRwTADouiv12CN0MFpVqbequWCHFmkYT2iUCSh/cgVcJAXKFIfEaLMBmAh+W0KE5nYU
	brXK9RowJemlmQiLpGJ4glkuCpEvaq8sLEvbepQv9eLf+P2oge9AVbkwFN4s0NIoijLzKygMyTX
	JNNHDoBWVPPX1TAbqteMk3GqH5PDPyAOCZeG2HYuTFjMndembhRo5MWeyDPX3WgJdroPvvUOzo9
	lkMLgcHnmxKRQt/C6sEESHqGQV+BMUXej4xpcHHNmPbeckstf8sEINxJthZFq9Wmy6Gt/0E=
X-Received: by 2002:a05:693c:414c:20b0:376:703c:8819 with SMTP id 5a478bee46e88-37687211c61mr720145eec.38.1794344521014;
        Tue, 10 Nov 2026 13:02:01 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512b6asm8770814eec.10.2026.11.10.13.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:02:00 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: netdev-bot+sashiko@kernel.org
Cc: ap420073@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	horms@kernel.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH net v5 5/5] amt: harden relay authentication and teardown
Date: Tue, 10 Nov 2026 21:01:51 +0000
Message-ID: <20261110210158.103856-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179423576119.994134.11181391213411379311@kernel.org>
References: <20261105125010.1107546-6-omar@blockcast.net> <179423576119.994134.11181391213411379311@kernel.org>
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

On Mon, 09 Nov 2026 14:49:21 +0000, netdev-bot+sashiko@kernel.org wrote:
> - [Medium] The patch makes several security-relevant behaviour changes
>   that the changelog does not state.
> - [Medium] AMT_MAX_TUNNELS_PER_SRC is fixed at 16, but the global table
>   size amt->max_tunnels can be set by the administrator.

v6 has superseded this posting; this patch is v6 6/6, "amt: create
relay tunnels only from authenticated Updates":
https://lore.kernel.org/netdev/20261107004935.2627329-7-omar@blockcast.net/

Both Medium findings are real, and v6 does not address them. The v7 I am
about to post does.

> Should the changelog describe a few more behaviour changes?

Yes. v7's changelog states all three:

- Key seeding: b9022b53adad seeded the secret after amt_socket_create(),
  when there was no receive path yet, and cbc21dc1cfe9 added amt_rcv()
  and the per-tunnel copy of the key without moving it. Since then a
  Request arriving during amt_dev_open() could get a tunnel whose MAC
  used an all-zero key (first open) or the previous key, for the
  tunnel's whole life. The existing Fixes: cbc21dc1cfe9 covers it.

- Expiry: a MAC is now accepted for 180 to 240 seconds after the Query
  that carried it (60 second rotation, four generations kept). RFC 7450
  5.2.3.5.4 has the gateway start a query timer it SHOULD compute from
  QQIC (125 seconds here), and 5.2.3.5.5 has it send a new Request when
  that fires; the in-tree gateway re-Requests every two seconds while
  its Requests are answered. A gateway that never re-Requests worked
  indefinitely before and now has its Updates dropped as Invalid MAC.
  So is the first Update after a new join from a gateway that, as
  5.2.3.5.4 also allows, runs a longer timer while it has no
  subscriptions: it is dropped until that gateway's next Request.

- Replay: any (nonce, MAC) pair minted for the address and port within
  that window is accepted, not only the latest Request's. The MAC never
  covered the encapsulated report, so this changes only how long a pair
  seen by an on-path observer stays usable; off-path senders still
  cannot produce one.

> Could the cap be derived from max_tunnels instead, for example
> min(16, max(1, max_tunnels / 8)), which needs no uAPI?

Yes, v7 does exactly that, at both the Request and the Update sites:

	static u32 amt_max_tunnels_per_src(const struct amt_dev *amt)
	{
		return clamp_t(u32, amt->max_tunnels / 8, 1,
			       AMT_MAX_TUNNELS_PER_SRC);
	}

That is 16 at the default 128 slots and 2 at 16. Below 16 slots it is
1, so there only one endpoint per address gets a tunnel. A configurable
limit stays net-next material.

> Is "teardown" accurate in the subject?

Fixed in v6: the subject is above, and the amt.h comment churn is gone.
The netif_running() recheck under amt->lock in
amt_tunnel_get_or_create() was still undocumented in v6; v7's changelog
explains it: dev_close() clears the running state before amt_dev_stop()
drains the list under amt->lock, so an Update still being received
cannot link a tunnel after the drain.

> Do these two comments hold on the renewal path?

Fixed in v6. The comments now describe what the code enforces ("no
tunnel state is created or changed", "No per-source state is read or
created"), which holds on the renewal path too.

> Does this need amt->lock?

No, but v7 keeps it. The full check is advisory, since
amt_tunnel_get_or_create() repeats it under the lock, and the lock is
held only for an O(1) snapshot, so a lockless read here would save a
lock round trip per Request. That is an optimization rather than a fix,
so I'm leaving it for net-next. v6 already reworded the comment so it
no longer claims more than that ("a Request holds amt->lock only for
this O(1) snapshot"), and v7 keeps it.
