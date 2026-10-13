Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6053311C15
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791855349; cv=none; b=LDp1CzOgQHIhh7398Pa4ADQhRvGSzH8RNIG6ztCTITiDhVEpRmK2sPfBtz/b4vaRx6kBNrEoBWQWHieHFgRvC10Vmr+c09jHxV/9JXmu+qYn/B05anIGWpm2i/hWehoXtSJKM/2BYitJX379fUSFXXnQXzWlBqvzJIYs6Jo6tYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791855349; c=relaxed/simple;
	bh=TCNbQGeKRAXh2LRLq1pF3WRun0kySjQuoswn8eVi6ZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jEKxpSrfYovhtlUuYjRsptpk/yCoFbbvhuNKz9dPh3/ci0kPPG/ajfEM3aZyP4U3r3uKfStLzlxvXEOd2U/bhmNh86oILEPvAZJisvcLJl9bSxG8KavET/c03ptfDbW5OpH/aF4fHmmB6rD13wF5qgzIkYyZ4FV3dhuViMBp+iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=timdoug.com; spf=pass smtp.mailfrom=timdoug.com; dkim=pass (2048-bit key) header.d=timdoug.com header.i=@timdoug.com header.b=YxX9qm0h; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=L9jaAj2y; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=timdoug.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timdoug.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timdoug.com header.i=@timdoug.com header.b="YxX9qm0h";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="L9jaAj2y"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id CABD5EC0926
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:35:46 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 12 Oct 2026 21:35:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timdoug.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1791855346; x=1791941746; bh=yocduj0ABMyh/bTv9hbcP
	rlJvMoW1kyYLcIfo6RegkE=; b=YxX9qm0h1gyNDvweeV0CHnOxTbKTjjUtU6Foo
	2zaHLRoh81zK/ZOaR4nCxsQjdVcpVPSyTsWBCCLPt14oqqBAsxmUIZFhie824052
	p1ehC0AfVd8GNxjhOfaNXph23nCJ98GpfA7eHf9JzW/eTCExt8sI+nr4IuoPVoZe
	eN7AMrU54gmxqIwYXtH6JeIzzIHBVPEPojVMrzowx/oi6uRvAbr0Dyv+UFbLDQGe
	lXIYkWGWa77NA3i8wDDGK1q0/bYqPyvzDw2UV8Y6/b0dxrOBJAj8bnpFxDZ9dq0e
	g8ffDLKkhYnxxOTz+Gg3HL95nsdg6MwbOPe4Ta+jZ5x639RiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791855346; x=1791941746; bh=yocduj0ABMyh/bTv9hbcPrlJvMoW1kyYLcI
	fo6RegkE=; b=L9jaAj2y0nI0OWKSVDxKvoARZg7/bnnqa+LUOVkRqOKeAtEhXzY
	w/Q29FbPy4wMmDFJnrTcFUpvLokkrZ/Tgt8W2h4VK35XeVGFDnFMFUNUl0rg7z/u
	bHaKsOyqgJMMMymxpNw3e1BOkZHXwS8HzI7nfnpg26vun210at1iNa2J/rMqk7+O
	U6sX4vpnXFJuJ9n6BJ6+neFJ9etLzM7hxKsyNgR8UcPUu8qGguLEvds8RSy2sjLe
	n2PblY95PoJuP757NxEl9dfWbW0TvY/9kHswC6xfnjQK0VYSY20Rvnc11wrLOVwv
	7RbhSF65FH5ghappvA6Mf+9CwqZvuvaEwqA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=timdoug.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791855346; d=timdoug.com;
	mf=PG1lQHRpbWRvdWcuY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Trh/zUBvEIcbVUKUA+F1/bE6iiP+yFWg5wq7Dw2xrK7jQe8
	TvO8UehXfaGvaLvaJ74X5k8R8vRUZgr1pwLa+1TrKd4o/kHaB59uAyKeWQGLjoNK
	w1CJcJYaFMdgsJozuo20VYFAkqjU7a4VyoyH3gCqlZgRVvWos74fzM711/804neX
	sGDrONKQI+nR5aubNwD08CDVr4529koS7pqgNYrSKR2ogYe5UBwQAKZxVSusfrN2
	5s+5IKqBb+lP/nZxtgchmT/wNFr0KeI0Dco1SCzuVcYzmEhRuUyleVAMpWger+ho
	7dLNTOFITag266yOBx1L2SH8qUhFQkPwxznKv/Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:8WelGVUf5dphIQ2F89IJTaWhXv1ZAojAwJqZh9CFkd0=:TCNbQGeKRAXh2LRLq1pF3WRun0kySjQuoswn8eVi6ZY=;
X-ME-Sender: <xms:8YrNaqKIlB6MxsRKi7XpVa_XPMMVxODrdU1PvTsRyt5V2UVOWFAhlQ>
    <xme:8YrNagY_0EuzN2WovgO-vo_lDi5cA_qI-0L9liozhIklzZ2qSM25fS5QWclGWQRme
    zYXLx2JD676wnTojLt0hpjmYnOblZ68ISrgf90Q-0y4oiJwW4Bd8Q>
X-ME-Received: <xmr:8YrNakB9IKVDSJeBp47CaeCrgjFFDaGvC8YeW7C6xMqDTk2rhvuCsztKPt6y>
X-ME-Proxy-Cause: dmFkZTF67q9b7fmY2tTOoiQhmTSVWZXwqMvJEdwkUZ8DSEmFTt29UUAIFfkcFFqhCEpEXv
    R3kqLflvBe6WUnJo1ku6LxFHkPzgFM/ILqkAHvJZ6eEux0LBThdrCGn+hFniXwQelhmL6B
    GapF9C+LeWGzk3PB8qlmDgM3xgCF8lgeK5JOTiLCio4o4RlNQEWrIONQsWbClWvBGYfwbw
    lpFfmrGR+yFLeFcp5UmxB6AvuOm8UKABeidGNPVWo1KZ7Q6Yxo9X1WAx0cwGgCXAfbP8EG
    OgRLVARpMopZ64aF9Xu2aEjuM2rGfBBHLx7+k5QNwhxQrosCFvKIx9TRg/pVf0qTumS2Y2
    +8OQw4nQX8C4bgS7V226SKYgqLCDBNISAzXMW+3Wt4MsHe4uA7yVxr+Lh0dHOdKX4GdDIm
    ZSAh8GPIY7i3ijleSoIuDAhnGzjm/OwSCyEdJ9Kbx5qoAi+s/z8PoLRoxwIKw8xpu96YN5
    6TQrnqgz7g07UeoDHd9sOoAMBqy+thh4g8BH+SP6Zh2PthQisXkVCwt62Gf/31+guT5c0o
    TwPXCrSZJx8LTNIjTtpk1Zgmve63e86YTgMmlt7T5YL7PZUD1yu1AboQwBT0WDDfFiSFLi
    TuI+PEEj1T3HV/9EEiRDD8nex5LO1twHV8yPjaPCZf27WXcZas8uidvfYdgg
X-ME-Proxy: <xmx:8YrNaianQW1TEM1EThVf1H1E4c9wNpd2zAsNFNJbcj8p8sZQGDaWFQ>
    <xmx:8YrNaklq81slHKomDexCgW_W2Tp9V4oCHCRpz7KyHvwIXVBlaYmGig>
    <xmx:8YrNavpBn95l-Ttu_riva2Tii27o9ATVHEFgGY8H2pjf9UWh7DY8Ig>
    <xmx:8YrNauDs3kUhIdPmGWucNT7hKsnEWnNBXNZANXWkU4DMJakHmP1FMA>
    <xmx:8orNanZppZXtrKeMQ2kmdyDT0W1j2GAdZg16aNsgPRGeR7yyqLmlas7D>
Feedback-ID: i12bc4175:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Oct 2026 21:35:45 -0400 (EDT)
From: Tim Douglas <me@timdoug.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	Tim Douglas <me@timdoug.com>
Subject: [PATCH 0/2] serial: pmac_zilog: two receive fixes
Date: Mon, 12 Oct 2026 21:35:39 -0400
Message-ID: <20261013013541.4535-1-me@timdoug.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These two patches fix receive problems in pmac_zilog that I ran into
while bringing up the serial ports on a Performa 6200CD, a NuBus Power
Macintosh. The first stops data received on one port from being left in
its flip buffer while the other port is open. The second makes received
breaks visible; until now they arrived as plain NUL characters.

I tested both on the 6200, running 7.2.8 with an out-of-tree platform
port and a loopback plug on the printer port. Without the series, only 3
of 8 bytes written to ttyPZ1 came back while ttyPZ0 was open, and a
break sent with tcsendbreak() arrived as a NUL with no break counted.
With the series, all 8 bytes came back, the break was counted, and with
PARMRK set it read as FF 00 00.

The series also builds on v7.3-rc7 with pmac32_defconfig and W=1 without
warnings. I have not tested 68k Macs or macio Power Macs.

I found these bugs and wrote the patches with the help of Claude Opus
5.5. I have reviewed both patches and run the tests on the 6200 myself.

Tim Douglas (2):
  serial: pmac_zilog: push received data to the port that received it
  serial: pmac_zilog: report received breaks

 drivers/tty/serial/pmac_zilog.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.54.0 (Apple Git-157)

