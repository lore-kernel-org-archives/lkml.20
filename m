Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A62265621
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 04:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788668560; cv=none; b=HIYxbMpRdOt9dGCXcHuf+m6s0P8Z4B9FkgfvgKXpocqsgajFlibd2l+462UA3fcNr+mjgegqRNuTO4Dc9DFdMVkMDdRIZluDbfW2KOUXP/W2dB6vhwD/SZLE/kIiCANHpgH5rNfc+1f53j6Loub73dEFjmUbG6ym+t+zCtPOODU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788668560; c=relaxed/simple;
	bh=lSK+ygaN89Qf8NuWacdgk2BCoJ6BxY5UTHSSSwk++Nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZP7xK5fDt2YtFG78H2hqv4jOaHubr5zVYn2ELNPkSM3ZoO7HxjGp7NOuy5yOROspK8bmICnyByd/JPD+6vRP1UdUAlbRt/TXfz6lIBHtkIjRn4zQ/bafxNnVAk+p8EOGs69ubphzBiksmZhH500JzLhqLL1WistYx10BVBxdSk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=c6GKeJQg; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="c6GKeJQg"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc328b43a56so1991631a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 21:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1788668558; x=1789273358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSK+ygaN89Qf8NuWacdgk2BCoJ6BxY5UTHSSSwk++Nc=;
        b=c6GKeJQgI8Bd47Xh2T1n3gOZY2BfKOFanplQ3Sj3A+5lRFOyZTUimAOi52LFtcOX/u
         +bIlg1HYaipv+BzFYNQxS26wplnDaOOYq8G18zw+mzW9WRVNRXW2gyncA+8bZult0hLV
         +kQHA1+3KCHRynAlKnMPGs/9ycTymwLxoeFYDp036WiagxnFOT31X5ccvj/Y9H0f7zDE
         YU6WWCOBG/6iVHI32+4AsY0BQGC7DowVl4QMuqxDNTIFfjAOzezhH/2zPbdxyO2tEoDw
         GE+oi45VRvGR8hPoVIYLr1bWFqMQjEtIlyWEYv9WxeY8H1sRImusZB1KiKurueZNfxVC
         unZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788668558; x=1789273358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lSK+ygaN89Qf8NuWacdgk2BCoJ6BxY5UTHSSSwk++Nc=;
        b=H/ScGeQ4lM56zDc0Pl1TaHSB6IuB1uw3b9g7cxExCJ46Y5nv9vIS0owA7LuT2j1bao
         QEgp2FJnTG0eWIV1D5tEJ+I625UC/IPOScNigwWvi47JE7PM1cXd1e/K6RBAyoUSaO3j
         3nEi2uVH56EPSriPq2LLQrcE+lAeeK65ahEpd7RI8SqGXWLfiT8lgKlsjTh3X3ego5G4
         DCHWRNPjmzwmetTh12onN86X5PPM09RNE1i4B4QeDvscygJUtcZimCLNQ8bzgqZFyds0
         vY4cqJNgfq4i6/XsoPkFBJGK3l1KvOz29p3xxJPW4TVuFTKjbtMDeb9AGtCfsoe6ecu7
         JfWA==
X-Forwarded-Encrypted: i=1; AKwUvBxv6ApPh+co0T6eJHYNhM16uVyGJQOnsMfqBWz6upv5wJUabyPz3SsTMFNm6qBNJlLrvSvpPi7rgvZzMPw=@vger.kernel.org
X-Gm-Message-State: AFuF++nEKPn5OP32r1s0KCNrzUxFbuATRTAYUzDTPQ5ejTL7d2rkQQ5F
	VQ7LwhPD9QCe6skgUzVe+hge79ko9GhKzigHO4FV7H5xB7LDFWdruGiYAODTBjHqcRc=
X-Gm-Gg: AYBFou3GTZeGkUWVtOmKUNm8h1pQaXpMYNfACpy13J3D18Ce3qpBH4OrXDZ2YK7B7Mw
	OJYANupzm7/JBUk1KoWUexbeGxOHNIjkU6T5jqJXSP/83y085LX+ZgmJhooCYzM81I1xK3+vBwR
	BSHDucIgi6PtfQ9AkmxuPPzx96zK92gHg+YPHWJrpOP9RXc0wMcEsm7/V9BWPN+SOwX1YDEPCxI
	B7GWKrcdao7MD5Hdz8JzRYoTT63eU04AHCA/aW52V+q5jgHwvKdRdTfTdj7tWAWSzB2YPuBcNSI
	4F323mhGNg2JkPt11NXJu8gNF2Y2J+M/kO+nMTXIUj0n0wGU5OegostTBxriME9xQGC1cIcSm2d
	lKz8o7LoOb+Gz9WK5eP/HKsQwu9o7jSsPaIr9MhzWvkuQyQLpUE4A8qXbKxHdbmpr1Lzvr/Y5np
	+2VIamf+nBzUrO8qUE+cgZJxvFGm7lMjJ5fmLwZAp2Gm6r1Zz2ZZIS7lCaFRs7a+p68yhKShTYn
	gsm2hSo4ERlDfeLBMvnFWzxNKGE2o8MiruHEg==
X-Received: by 2002:a05:6a20:244a:b0:3cd:9f0b:f788 with SMTP id adf61e73a8af0-3da39d12327mr22845565637.12.1788668557997;
        Sat, 05 Sep 2026 21:22:37 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([2601:645:c68a:b830:c4e1:d17f:f4c5:c097])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm17316962eec.9.2026.09.05.21.22.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 21:22:37 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: sagi@grimberg.me
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sj@kernel.org,
	saravanand@crusoe.ai,
	Krishna Iyer <kiyer@crusoe.ai>
Subject: Re: [PATCH] nvme-multipath: add fail_io_now sysfs attribute to fail queued I/O
Date: Sat,  5 Sep 2026 21:22:35 -0700
Message-ID: <20260906042235.71778-1-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <6b8ff0b7-c606-471d-b3be-12df3dac350b@grimberg.me>
References: <20260904032605.65758-1-kiyer@crusoe.ai> <6b8ff0b7-c606-471d-b3be-12df3dac350b@grimberg.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 06/09/2026 1:36, Sagi Grimberg wrote:
> I don't understand what is not sufficient with fast_io_fail_tmo? It would
> determine the time that IO will fail when all paths are down.

Thanks for taking a look, Sagi. fast_io_fail_tmo is indeed the closest
existing knob. Like this patch, it fails the parked I/O without
touching controller state. Three things make it unsuitable for this
case though:

1. It cannot be engaged after the fact. nvme_start_failfast_work() has
a single call site, the RESETTING -> CONNECTING transition in
nvme_change_ctrl_state(), and it returns without scheduling if
fast_io_fail_tmo is -1 at that instant. A controller in the reconnect
loop stays in CONNECTING, and the sysfs store only updates opts, so
once an outage has begun with failfast disabled there is no way to
make the timer fire for that outage. That is exactly the situation in
which the need for this arises.

2. It decides based on time, and this decision is not about time. For
deployments like ours the right policy for an outage of any length is
to keep queueing; that is why we connect with ctrl_loss_tmo=-1 to
begin with. The exception is not "the outage got long" but "this
particular submitter was just killed and will never consume its
completions", which host software learns at a moment no timer can
anticipate. Any timeout short enough to release such I/O promptly
would also fail I/O for every healthy workload whenever an ordinary
outage outlasts it.

3. It is scoped to the controller. FAILFAST_EXPIRED marks the whole
controller, so with all paths down it releases I/O for every namespace
in the subsystem. The process being reaped owns exactly one namespace;
the others belong to VMs that are still running and should keep
queueing until the fabric heals.

So fail_io_now is the failfast expiry made available on demand and per
namespace: the same nvme_available_path() mechanism, and it likewise
clears itself on reconnect, but it is triggered by the admin, for one
volume, at the moment it is actually needed.

Happy to work any of this into the changelog if that would help.

Thanks,
Krishna
