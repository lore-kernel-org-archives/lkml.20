Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30994F0536
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412772; cv=none; b=b0GJf3kwIFHTDXMHnqWZ1f9TO/WdTczbXkxCX9BBmdcadVAiJmit0hAoU/nycxaNz4n8gpZYuQjSjxJaETU22GAR2XKf7AQKWBXKkinzui/yGtd1ZyTjb2PiSiKB7ppg5HLQBIdjHfn6xc2EdduYmN9VgEnqiE1+ELWDyapC8gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412772; c=relaxed/simple;
	bh=coX7CxmJbXEjUMce/FGotua0x8wQqtZM7CV8gpGvvEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oVFKz/gOmRhn8kmgBKseuPe6jEDTWQUFHBw1xrFMFgP6mlhhNwk4RIip+zbviXH+hZT46fdH2fmw6yKt7ZHHohLHVmY5/Uhkb9/Bxuz9fwHP6qCNd96YiJWY2VFnS+dUcK2VTXWajydutRr49j7zeuDfxI3noB5QUaq9Wk9WgQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=oxKXAntM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DG+N8HCx; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="oxKXAntM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DG+N8HCx"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 07B247A00A1
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:26:00 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 19 Oct 2026 08:26:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1792412759; x=1792499159; bh=MdASMDGpFK
	RkKxdgjA/oaPeU6OleHGRGoHF0xQ6IVUk=; b=oxKXAntMaXXJcRjyErNNnCR01v
	Ai6EqFeBWeyI0/NTHSXabnVEFre1FiqR7g6/9fm5zPI8h3JIXQbt7+rLTELaKbAA
	8usd9SmMXsrlC087/1tyOLv27KxbPQvQAo6vle+/kVS9wdVmL+jGj12B+wDZrL3s
	02SoosKqsp58fbPP7myk6/Zc9IMdosn+u2vhilpkZgBunEXdYeGqnOBRSkoAPcd/
	5JVsIW3BsVJl+ujyB7GWNXkAK0Tvoz3Lf5hqzyOS5SIEVkQe+Rewdc8zT11Q33xl
	EbnPUVH46nIUN9EdNAvTM5BtPS6IwcKfjbTnY0+/Uk+lbD0A4qVvdin1Lw8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792412759; x=1792499159; bh=MdASMDGpFKRkKxdgjA/oaPeU6OleHGRGoHF
	0xQ6IVUk=; b=DG+N8HCx6y5ggHgFXQy8nCTX2jGYC+Bh3zD5QsKT7dJBh9v10Vu
	myH5g0EnbIkE+tqLKK8f+Z6BfsP2C3w8lctN+vmF7TpJGXg33jfTgieLPBdpn3WL
	FoBexJ1N/W4oTxT4qjtTBS1dnRRfMkmDMovPQNuKtKYkc0leSGWrdUcf8bdvXjx4
	iiENEsGyA82Zps10upPqNyX7tc567S8oOmeDWWeeYR3YI1Q7Td6osIsdiqBf99e4
	ohO9C9ldMa7c4OsfaC+L2omYK83ho583LmSDIkYYTMDcBuBmsGtbNtJ4nOfhob/F
	ch9loeevxkirJMbIGIub9F5olc6iTJI6Yyw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792412759; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:O6Ct5c0dzjV3JSVElMocy9T3ONDdIbTmXo9jiCEjX8h/l0D
	+u+zx1Wl6+ezWWOT7PjAUKtqHdtqouwDThC9MAzh7wgBTaqiXf2RvFkalPL/G1ae
	6ahmcTu2k+O5Fc1OCFOD5QiFu5EvBV749S7HunUTbx2OXPRGZDO9IqHTwdEIhi6s
	LRJ/rget61eEpOM+DLPv0HlRc/E1RMZuU5+TrZOFM7OtcnN5cBKTkxcrKccJFF1O
	R3F2GX6+HeO37UO8EFbZSHk1ownMOEy3SSzMYMEisLWs8KdQFR8ONYAJQeGR/D4V
	dXQyGmRBVm8HRriNB+Op1nYEL/BqmrlWv7h2kFg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:bJsMI8yrhNtVXenQzI1cm6IbAmWAZPQqKgOwWal81kw=:coX7CxmJbXEjUMce/FGotua0x8wQqtZM7CV8gpGvvEI=;
X-ME-Sender: <xms:VwzWarDrmdRv4C6-mc3WK518Sj9FyVbakF-o-2Z48iMhjnyA3zyhiA>
    <xme:VwzWavfCY91ZJ2WEjLmbEa6omoCKJ-R3XM75mry_hEqrCevOSTKd7khUkzhwxk3fd
    aVVcyooZ2K__RY1SYRzAFGqYmiIiOEGzVasLig5rlaoGlLJVIGU0c9Q>
X-ME-Received: <xmr:VwzWauJqHrwF21ol5UdMrSdcJybCtFbJEOS5BLOmJ9HCM6ZmWF5J4xVT7FhaiZkGB72kAFlNpuN1atDjKQjY_fXdJHMuuF5VHfw0OGlqU97kVA>
X-ME-Proxy-Cause: dmFkZTGPdMTuNm45W1NXZhI/Orrynkr7q86g5qpCxcwCt2R+fGrkSvCjzUzlhqx+p22AdN
    MvP7YIha50EFQ5oEGhSaoPFAFMDLd36P7QZ29ib2ANlKvKAYjdr8qOvRDC0k8vbff5d8hR
    5+CdXwqbgjMNtfl8TPR04ZiBQKrvkJ7FOl16fQQ3arTIQy1ejT8VpeppkPjqthjyBAl6yI
    ub5FA7jkjnVcFfYZi94WJFGCi6MDFz1SnaiyPOXcKnSF8Wy4cKT/SEGVfRYMVNIvVQuQQL
    c+NGI1GUayGOl4bQF1P6B9X9SQ1W6stPNIfzrf9Gpmvr7wsW6s3zQVZrReEywPvwpGDPWW
    oy21sCD2G1aexeTb9G+iMJae5uUGWV1gMYO8NSq98OxTcVEbQsk9Dkmbm+e/YvuljEv2em
    MosN0SJynQSMjYInOYDaAbP+BzejgCI6m63DoPvp6o1x0GbQEYg9ist5F2J4k4+wpq1+DV
    FXYYvCsv1B5RV2awG7gADGEX1a2CBRod47ofVEJW/FyWOmqSh/XoQv8RS2l8+cSNHI/hmW
    8teHOwcCwqNXQejgfybeDC/eLhsibCnFOcWl+FQF/4wlEJnPHgphoLlqhb19KC1z0UGjQw
    SgyY+p1Qv/I5HHAcJyCcqfLXvd4ObC/R2pjxDwdBDcpn2UJkfutAV6WZqfHg
X-ME-Proxy: <xmx:VwzWaqd56o5Mkpx1CTL8coHYCZGw3B3kA-LrRcCOCw_fJ9J3IoNjLA>
    <xmx:VwzWat2IqlaVb8dMf6k0m63WlIWcMcOMh80T2tZ6Nn0ytqVw7x17Gw>
    <xmx:VwzWarjLIKF5IpvuNXPHjtHapQIGrojolxjcK82im3KHYeemA7DZmA>
    <xmx:VwzWarQVHKSxug-a4d2TsTXFVzPF8fdHN1kKnNQx6EIRM5r3NGeHoA>
    <xmx:VwzWas1lr_tLfWc_YBBWLGcDoJKsVjFCPImLOXERgTcENBoUrw_8eKv8>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 08:25:58 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] firewire: core: misc fixes
Date: Mon, 19 Oct 2026 21:25:53 +0900
Message-ID: <20261019122555.328060-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series fixes a few bugs introduced by recent changes.

Takashi Sakamoto (2):
  firewire: core: adjust context_unsafe() usage for lockdep checks
  firewire: core: replace drain_workqueue() with flush_workqueue()

 drivers/firewire/core-card.c        | 4 ++--
 drivers/firewire/core-transaction.c | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)


base-commit: 9a513d9f68461294a6a615986becf619b9549f37
-- 
2.53.0

