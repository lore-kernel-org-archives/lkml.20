Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C4A3C65FD
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789286280; cv=none; b=rdLWjFuanrXhD1snI3f1KmtZtOex6FMnWVistA/wcOSdfVITHb/6O7TCABhPSGzRn1cAqAh7RNmsF+VI+CPW7knkNMtOM6LuQlMbPN1nfRR0waNxYQKc1qIKS3C0ayGqkPUipVrLhH3pJUExp6quxE0oDCUBXaE6tnP8u1eAkIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789286280; c=relaxed/simple;
	bh=FiUVCYA+4AAngjhVOqJ84dnnRm3uUN/LfC2dOOSn/Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o349No7oPbayreqzvNyhb7pVbcvt7PUFlI7gPJzlcDuVhO/zJM2g/rVVxo6j6IKqjV34bPkVgjGPSLV0HC3lXyhzs4FLpZW4LQs7UJQd/94RTcXyzxp2tJMAenL8oTAr89oz+PxuqpmCwkw9t+GZGExOHnnWdfh8/0bhL7oFh0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZBhGfQu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZBhGfQu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97BA81F000FF;
	Sun, 13 Sep 2026 07:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789286267;
	bh=9Pu+ZZ7EY+1J5Tfh8O3EMjWKfOuWwDKBRxQYgchDnwE=;
	h=Date:From:To:Cc:Subject;
	b=mZBhGfQukrESBMzbcYOE+oZKp+GP2qEnVqhInqvqSix6fuDxlaj8AljzURRERZ+WY
	 kBolYFk5sPnl3zgtTA/cmT6lnDzF/y/bsE8TGhI/NzmGi30pi9eIh2WyeQCno0Ydp2
	 P/GHBByTdvRM7El76uHWiNHEC0BhxjvI+ov4kOIHgv4WTdOBVmFESlIdtvg6ip4Gq6
	 SbDb3WQYLHbTxMVclFZOIo8f3zjQvyG59GEo/6EL9BplSZpGVvRsjIeRA8TpiP5UDx
	 NjOAVDvhzJ04DRxJysVStycLzWGfVZKTTgN9GIEldAk/vTwh2rBm/b/YL5fLtJKb9q
	 zldBnEQVi102Q==
Date: Sun, 13 Sep 2026 09:57:43 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [GIT PULL] IRQ fix
Message-ID: <aqZXdwK5-GUh6Ryc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest irq/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2026-09-13

for you to fetch changes up to 1017911fcc03584b6854b1b8f0aafeb25f5a8d25:

 - Fix ARM gic-v5 irqchip driver regression, where its
   enable/disable functions may corrupt unrelated
   ICC_CR0_EL1 hardware state (Sascha Bischoff)

 Thanks,

	Ingo

------------------>
Sascha Bischoff (1):
      irqchip/gic-v5: Preserve ICC_CR0_EL1 state


 arch/arm64/tools/sysreg      | 4 +++-
 drivers/irqchip/irq-gic-v5.c | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)
