Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794177931;
	b=E7QBqzdo2wNIjw5olnzIVTTm7d/HDvOlqbS5Tj7juf6lPAhab2INateRkh+jB0pcuquv
	 SOSEpuDK1NxIPm8NOrWHqLs/zEXt1dW8dSnJfobASI5msyM4q1zBDZsbYNKWuAA4dHlwk
	 vUoKjsrAAWFsIG9VnSWU0HZxkF5zURZyIztF7lT3IAIgIOYoOisEoDkxbzafEgh1bDOzw
	 9AhRgJXjGZU9sKO7OI/Jp+ZeeQFzNj7RxwIrBuPBqFaTpD0750RUfoaLYXOBgBBBKoUx7
	 XqTkeyUlN9bpZrc0tah/s+pmNJmfsimcPC3XqX1Tac+tzbVQ4YRJvcEX0BoRblBfmJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177931;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=tYKORgexMp98ESSW/UdTb6q8ju2i5dIJv3ka+amXAdA=;
	b=GpRYwat81HSQYbVYwKxQpNpgkhhKtnFivh8fV4nYuM9n1QgxOfCWgUifX/upQ/8xyAqJ
	 CKXixOsylp1ZmYxH6Vqfv8Ko3C7KLnySR3RCs0JXkWBttJ0a9MsG0UKq4kIAEFdUfH+Qu
	 OTWsn9UUxXY4ZEPyECTyom7DeBsKOPTpuUXgf8ilgZ4dvbMequisLkzsUv4YFNP+ffqJe
	 cFFQzgiKSiDFz6aZXfBPz9ALUb5SmAAJOBt2zUnJTGf6OZ6Eo1OeZkCQ5Z/m2sOOydLwj
	 xhmHJE8PZ2XN3zJpxdtabHLyJqxloQYKebBrBr/QeFs5ij9j9xbVsVoRlpfCpyqtn8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ThFvBj8O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028FF606A320;
	Sun,  8 Nov 2026 22:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ThFvBj8O
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794177930;
	b=rF+mg5SPbXry8j+WVb0KUg7kXeVRm+FE0aYSd3NxUEafNpMm9vMdAyFeYJz7BnnW4Z6L
	 gUKrCZBUnHgXenT1eXuQtNymiCY8/E99iyHt0pPLazIpizi3rCoOIXuKqmzCdRSpRRHPo
	 U6nthPWXU5yxHz1G2FEZAYwaqgzFM9yPunYcJBWgJ7f+3pL+ZQ1AHAmbI0l4b5wBWU0yl
	 QeHKk4JQ+Gq5ttHtoWEq6JyDVkB+oqfX557sE5tro9neuUOvFX/s0QnjKwmuuMlU0+/hN
	 0XMM4T/1wRuHzwlhz4S7VngwQkpFd0KEHwH4DxiDrJ50qoNQD4A+A7y1xMVrPYBPTAA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794177930;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=tYKORgexMp98ESSW/UdTb6q8ju2i5dIJv3ka+amXAdA=;
	b=xh27UYNWoDR/DnsL8cTQnvGq6t5EkeX9wlizCAm4LvKz8khqRnmILxBAD9QDLnqqyUDS
	 fYiGIpQBFK+e3ahrQiau0Pex1zkCwcaVqUnsUbSpvXDZGUKOO07mNEKCcOiyji145FNat
	 JOA4kkmrxWiD+B/Po/W1P5EfCa/HynvrF0oNUZa5323qoCuXwHIC7n/4P7m+DzIxUpb6u
	 qxC1dvUuTKJuNVdnPzeEM1PjhGgpn6QA0UB5eEfU6hv9fhAoVANxNWVORiOuRNyzqI8yb
	 NXAn8YGaC24EGXpKe/H2gsP0x4CdZiRX6rn8dJleteCH6ehqGDRap9wcZnCvyVMBltw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB1601F008A3;
	Sun,  8 Nov 2026 22:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794177930;
	bh=tYKORgexMp98ESSW/UdTb6q8ju2i5dIJv3ka+amXAdA=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ThFvBj8O0jLH+AiRnoH42KbKIdKORiF//4WuedDYLyOoAyEgNw0tpqaoA2eFlV66k
	 B7VM1oKSTapDrTeLKaf0uThAFSRI4A3i1c/jRaqZ8CbC8OQU+NaflDZ0gt7PMTgA5U
	 pHMJPzbC8P8BqMWG9n76eLvvBu0jFwXw72QNAN981tyyOjuw9KTxasmEkC9f4jGasw
	 GTS49QvAqyaDJGa0M1flaP6aXStGL4RoyhJ1CrHS1mPageOUlg/ZcWo9RvW8DCD8u6
	 7GcdpX2ZCljTcJDR+k1SPpGqgIJ8/Y3RwgynKQeZvg4vSuQEKkJ9ZdlDkenapRsJ9t
	 OEG323vMn8BXA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3994148145;
	Sun,  8 Nov 2026 22:45:29 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Subject: [PATCH 0/2] wifi: ath11k: feed mac80211's airtime fairness
Date: Sun, 08 Nov 2026 16:45:28 -0600
Message-Id: <20261108-ath11k-tx-airtime-v1-0-f1a02b2372d4@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIj78GoC/yXMTQqEMAxA4atI1hMw9Q+8iswi1qhxGJW2Mwji3
 a26/Bbv7eDFqXiokx2c/NXrMkfQKwE78jwIahcNJjUlUVohh5Hog2FDVhf0K1hYyUrDbc9ZDrF
 bnfS63c/m/dj/2klsuEZwHCdhC9f+dQAAAA==
X-Change-ID: 20261107-ath11k-tx-airtime-5ce362abfa34
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794177928; l=1972;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=XIN8sZMXV6vtgjXMXA1MUFV8xymBm0XeIvXZSKIKisk=;
 b=m7xCdn3PX3XqZpB0fAoMoUJBb/tw02ZLgvB3bgHJoGwwhx2wcm03/bQ3z90IEyKZEBeWCcNyP
 7jrop2ClLl5AHwK3chMLcL4c17O/MnYOAtBdVkkJ4vBi6OOO9AIB07w
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
Reply-To: christophergriffin05@gmail.com

ath11k never reports airtime to mac80211, so airtime fairness does
nothing on any ath11k radio: every station's deficit stays where it
started and the TX queues are served round robin. Patch 1 registers
each PPDU's TX airtime from the HTT PPDU stats, the way ath10k and
mt76 already do. Patch 2 fixes two paths that free TX frames behind
mac80211's back (REINJ/INSPECT completions, and the datapath teardown
during firmware crash recovery), so that mac80211's per-frame state,
including any TX status a frame asked for, is reported.

Both were tested on an IPQ8074 AP (Arista C-360) with a QCN9074 radio
at 6 GHz, 160 MHz, against the same AP without them, with one and two
clients (TCP download, 30 s runs; for one client 6 runs with the
patches and 12 without): one client 1777 vs 1672 Mbit/s, two clients
1540/1524 vs 1569/1566,
95th percentile ping under the two-client load 42-50 vs 61 ms and
31-44 vs 56-77 ms.

This series does not advertise NL80211_EXT_FEATURE_AQL. With AQL on
as well, the same radio lost 22-44% of its throughput whatever the AQL
limits (5/12 to 20/48 ms), and lost more over minutes of load, while
pending airtime rarely reached the limits; turning off aql_enable or
airtime_flags at run time did not bring it back. That needs its own
look and is not part of this series.

The changes, the messages and the tests were written with Claude, an
AI coding assistant.

---
Christopher Griffin (2):
      wifi: ath11k: report TX airtime to mac80211
      wifi: ath11k: hand freed TX frames back to mac80211

 drivers/net/wireless/ath/ath11k/dp.c    | 12 +++++++++---
 drivers/net/wireless/ath/ath11k/dp_rx.c |  9 ++++++++-
 drivers/net/wireless/ath/ath11k/dp_tx.c |  4 ++--
 3 files changed, 19 insertions(+), 6 deletions(-)
---
base-commit: ad6bdd5f9030dbcf29a67f40ccdb3fa57afecff5
change-id: 20261107-ath11k-tx-airtime-5ce362abfa34

Best regards,
--  
Christopher Griffin <christophergriffin05@gmail.com>


