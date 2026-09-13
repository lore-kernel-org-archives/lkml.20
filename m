Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79242DCF67
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789285608; cv=none; b=npugs4pby5FopDGx1spRijd3eO2fveezvW9yf22lTiDns3d32PDG7WX+1yFG29meWbv6lqhW+m60uQkUCIDiB9PnqNkirZLyAVcSUGmDB9gtBDERkPsIAxU8CtmdpJDWVqaGGeHuaZdEFRt2qdw3CygfkObjrg7+2rg4qLFrZj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789285608; c=relaxed/simple;
	bh=t48LjibEB3ESsOzNW0HV3ESegtg1jeUiBULdYYPJ2sI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IzpgN9GJaPA2jmridZxuaveFmTgM8sBWjf5AqCNwOfcCaTFfzr8L89UpHGlRczLh/nkSb61bOhwnkFD9iYQkAy74obGl7ZnvPG+8rcb1rPjZeMNMmjGnaCYvR/0iuk1HZ6qNX2U5GtXCeOCXMXFpYPdXzQnXuB2IYIhqM340Kwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqJdfT/f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqJdfT/f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151371F000FF;
	Sun, 13 Sep 2026 07:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789285607;
	bh=eADD8f3Tb7byR/jDrgYKOk59fjFqE1SV5rQMVhCPIOI=;
	h=Date:From:To:Cc:Subject;
	b=eqJdfT/fmJdJnh3dltEi/s0iB9imIY/nWQX6fntTVa4+5RaY54H7TvytwXGralsrm
	 MsSEiI1dnKIZfX0TXu/y/+o56Hn06h7ZmRGA3ryoWe18u2vCzd2T59hOz9hJKueWXy
	 +LhhrLwU5Hh4p7+kre1MrtfjFMhmXt94x+DH0N6jyonGSleyuzEX/6JhKmXKlFWgu+
	 ZKgXXkH7dXeDbzGUE43rQ7lsU6/7dpuoc7OV9EAIpYz2ZOVy1HI8qGespKT9OZIXcA
	 AscxVoMncwlbVC0qd8bZf0wFpmuJQUPz97WyVpyJYCscTzg/bknG0kVIi2OjZ3rcZC
	 N3u8qlVogfWJQ==
Date: Sun, 13 Sep 2026 09:46:43 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [GIT PULL] core/urgent fix
Message-ID: <aqZU44Da1o6Bo0q6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest core/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core-urgent-2026-09-13

for you to fetch changes up to 954f7a48fa2ae7310c67729fb556caf726783436:

 - Fix generic entry code cross-build failure on
   !CONFIG_AUDITSYSCALL kernels using older
   RISCV64 and S390 cross-compilers (Thomas Gleixner)

 Thanks,

	Ingo

------------------>
Thomas Gleixner (1):
      entry: Guard syscall_enter_audit() invocation with CONFIG_AUDITSYSCALL


 include/linux/entry-common.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)
