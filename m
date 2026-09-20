Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FAF39A04F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789897073; cv=none; b=kcarnY9nF420B3ZEacP6MTnidxhpedgPvla7Zdasv7xx1vYON6nbslJpSM2RRGAEwwsQwiGbSY6je7jpWm1aYJmOOnxP6zMODHjKUruFPQeHlMs+MJA6i8s2CZZM+FepJSnANcIfMR9GkY/dO+TlPYiD/4yPo9I6cy9UKZWyFnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789897073; c=relaxed/simple;
	bh=A+KbCJHKBvqSs0hz4jYbF6yEJ+7ddJMMu38vnJmJ5TY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hq30oW04808Z4ZWKAs0nZ/UssEhqj7xP66N9+EGozDx+i7n08NPO9ridipFpv4sLyIilJUbZzcD8VfRY90B2oZGnSCOrDHoJryA8Jc4XbArwSN6OjZBzcXC/zeDvQ/5MRJd2tdKMVyZ2Bx3pAWQ3BxekBkce+jFczseGDET8QaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YLtCzGDS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YLtCzGDS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6161F000FF;
	Sun, 20 Sep 2026 09:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789897072;
	bh=ZcHW4q9b1WyVwRo7EH6fnP2mqzs5skuYqJ+2NNw6nwA=;
	h=Date:From:To:Cc:Subject;
	b=YLtCzGDSESbYeGFmzE38IUWbTYJUMrk9ZmELV8vo0ihq/UIu5FqgxHWsw8xsI7w6T
	 L9cwdS4bW1tgC4mhEMfgKBGzABpDs9NDNvVKJK6xX/yh1Av2EyS82zPm8YPlvQKjfl
	 f3LEkz+lPZqyqbPhoxiEBg0PIhp2XjrxSb5TwFBTwOaJE59Qhj3eBZwoCUdidUQ+6Y
	 onQlN7GQiXBaEYKKyF5btsuzaGC9rV36hBrfknkh8wUXzdgl5cH0HmTnRLCWGk2ngh
	 nfqBI/ibKWmSsXSkxG8uncu2gTgrHMjjiUeIcNgctfw6FhGbkSw23DlH6fWhF2Bp1u
	 Zr4sujnRyHO4Q==
Date: Sun, 20 Sep 2026 11:37:48 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Josh Poimboeuf <jpoimboe@redhat.com>
Subject: [GIT PULL] objtool fix
Message-ID: <aq-pbOlsNz7HnVZ1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest objtool/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-urgent-2026-09-20

for you to fetch changes up to 7e61560628d17ea6b1d8ee370f6d42694cff8758:

 - Fix objtool build error on systems where libopcodes is
   present, but development headers (binutils-dev) are not
   (Ulises Mendez Martinez)

 Thanks,

	Ingo

------------------>
Ulises Mendez Martinez (1):
      objtool: Validate disassembler headers in libopcodes probe


 tools/objtool/Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
