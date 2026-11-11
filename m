Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434329;
	b=dyDzq+2JplE/LaAotSXP615bJHpMQXrZqP3kOIVvrSu1t9iS7ecrWQsA+5NETfx6I+gW
	 oAUyZE40jUcfAqbVml9q08vWl3esCQQzFrSseXzLjwhH5Wi/VtFsBSH52xPX4VSQiHZ+D
	 6MqjQjVrEB8TDw2hgACvl2x9wu3LuolFWV/G5oMZJ3TfczjXE6YHkdn3tnFxPfw9yMCMO
	 rMfgt0pp4omcLMhrjBlMpzDyfXxDPkqB4GQhtimWBJj/TlDbxJk1Bel9hImYMIwosGOjJ
	 za4EtieAy+9MCGdN8E8qDd0LUvtW6V5cShBoFMOLbKHF0TuJFWIPuc/Du3+ZfbWqaag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434329;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=hgsipuaL/nPkrvd++ekAvRrCwo9loHK4VYxFcf9R04E=;
	b=kwlkbKStk+a+szMfrX/X1B7clGM5ktszAOEwrYhyBTQ3bCjBTqpgU4bImbaQBJbixScQ
	 hnYnRNLfil03ZTuohlLA7tQCcXg/VtVLwG1fvL40MjLRbGuY1r1XImo8w44YtC6vDJKNE
	 cIIg/LBtZjVNN/dDohgOK/e8U5VMEjc76hcv6Cd5ikkfgXMfXpepKcqkSGbmyPH11Hpwh
	 YZ+paJj4FS9CSN87HlDBKxjjr+yO2VbctyYuucKhiv3LRqZ9gfuivXBF94TO7l1ogS88g
	 8D1R1dPL/yb+mVEixtkQGZ/fpKDsix8qJ7FU3eBWqAjnsE2e5Sh52FKAqJd+LRJgakg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wZ1BzPlc;
	arc=none smtp.remote-ip=95.215.58.167
Received: from mta1.migadu.com (out-167.mta1.migadu.com [95.215.58.167])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C93606A335
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6C93606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wZ1BzPlc
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3ph4Vs/VB5qe6KjUKpfqQwTICzKcmVO8q2/wRUsGmTU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794434327; v=1; x=1795039127;
 b=wZ1BzPlcU4Czh+AylARKvseeOR+06glxeWEuoV8gmhvKEysynxSJOKOV3FwXRuvPwSiwHe/S
 06wVqtb+NHU/QmJ76OqPHvH2n0R9pdMWCT4FeRIRy/RfOuSCdU8om8p4P08hBix5zytvQjHRems
 kQN72Jl1/5CC81F5yLQSeElc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1d1b02ecd1481e3c;
	Wed, 11 Nov 2026 21:58:46 +0000
X-Mizu-Trace-ID: 1d1b02ecd1481e3c
X-Migadu-Flow: FLOW_OUT
From: Md Haris Iqbal <haris.iqbal@linux.dev>
To: Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Md Haris Iqbal <haris.iqbal@linux.dev>
Subject: [v4 0/3] block: delay support for error injection
Date: Wed, 11 Nov 2026 22:58:35 +0100
Message-ID: <20261111215838.103356-1-haris.iqbal@linux.dev>
X-Mailer: git-send-email 2.53.0
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

Error injection can only fail a bio today.  This adds a delay_us option so
that a rule can hold a bio back first, to model a slow device.  The delay
happens above the driver, so it tests the code waiting above the block
layer, not the blk-mq timeout handler.

A delayed bio is marked with a new BIO_ERROR_INJECTED flag so the rules
are not applied to it again, even after a split.  Christoph asked on v2
to avoid the flag by allowing a delay only together with an error.  I kept
delay-only rules, as a slow device that succeeds is the more useful case,
so the flag question is still open.

Holding a bio back reorders it against bios submitted later, which breaks
sequential write ordering on zoned devices.

Patch 1 is a prep cleanup.  It moves the rejection of an unknown status
tag into the parser, because patch 2 makes a rule without a status valid.

Tested in a VM.

Claude helped with parts of patch 2 and the documentation, and was used to
review the series before each posting.  I went through all of it and tested
it myself.

v1: https://lore.kernel.org/linux-block/20260827000115.128093-1-haris.iqbal@linux.dev/
v2: https://lore.kernel.org/linux-block/20260830012002.80275-1-haris.iqbal@linux.dev/
v3: https://lore.kernel.org/linux-block/20260928221634.43239-1-haris.iqbal@linux.dev/

Changes since v3:

 - Patch 2: share the failure path in a helper, return early in the work
   function, fail REQ_NOWAIT bios with BLK_STS_AGAIN instead of skipping
   the delay, warn when a delay can't be allocated, set the flag as soon
   as a rule matches, and drop comments that state the obvious.

 - Patch 3: document that REQ_NOWAIT bios fail with BLK_STS_AGAIN.

 - All patches: drop the Assisted-by tag, following commit 1e035297ffda
   ("docs: remove Assisted-by references").

Changes since v2:

 - Patch 1: return bool, rewrite the commit message.

 - Patch 2: drop __submit_bio_noacct_nocheck(); the flag alone stops the
   rules being applied again.  Log the error when a delayed bio is failed.

 - Patch 3: trim the documentation.

Changes since v1:

 - Add the BIO_ERROR_INJECTED bio flag.  v1 only resubmitted a delayed bio
   below the injection hook, which left the remainder of a split going
   through the hook and matching the same rule again, so a bio was held
   once per split instead of once.

 - Patch 1: tag_to_blk_status() returns an error and passes the status back
   through a pointer, instead of returning BLK_STS_OK for both the "OK" tag
   and an unknown one.  A delay-only rule has no status, so the two have to
   be told apart.

 - Documentation: a delayed bio is held once rather than once per split.

Md Haris Iqbal (3):
  block: Reject unknown status tags in error injection rules
  block: allow error injection rules to delay bios
  Documentation: block: document error injection delay feature

 Documentation/block/error-injection.rst |  39 +++++-
 block/blk-core.c                        |  14 +--
 block/blk.h                             |   2 +-
 block/error-injection.c                 | 150 +++++++++++++++++++++---
 block/error-injection.h                 |   1 +
 include/linux/blk_types.h               |   1 +
 6 files changed, 175 insertions(+), 32 deletions(-)

-- 
2.53.0

