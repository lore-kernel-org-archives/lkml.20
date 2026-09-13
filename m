Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7706237FF76
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789287939; cv=none; b=nZblOj5GJwWtr8o9BEpn1dYVJIe2y2WvroW+oFxIwIdwSYqhdda80y+VR87Xy3SIG7yeoVbdqaTs4YrjqK1/eaIB/yBeB8iap6z5A/F6MzNSeMuA8OkHVCeuVrOfvxnB6OldcJG7Ar9pj/qTOVBRMH5DBIAHVc8t37rXol4700A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789287939; c=relaxed/simple;
	bh=cZjxuuHR3PR/1ywuGxLn0nbynF/D/jN9KQEIEkwWgg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NhEKiKMJgD4oL7A757SFDDVfHSUv6eMYNgpxmKDvoN85S69OztjKPlsdM1NGlTF6JCUI0BuuNHIeHkfRVDoIG3WVM5kRdHU8lMaQtATM4sdUUw2QJgE7D4aqE4ab8/Qjp5QhUGNR/ULe+n57Uld0SLJi9mQp1mDMN5UYu51PCY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4LdYSCD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4LdYSCD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E13B1F000FF;
	Sun, 13 Sep 2026 08:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789287938;
	bh=hKoUs7pPORqcBPYXM/o8AnPgnsWBnINDse2DjeWSaZ0=;
	h=Date:From:To:Cc:Subject;
	b=F4LdYSCD8d27+GrK24M25/3Iz2grj06KOKaV0/4vlvK6OZPE31/C6N0gtLTEnVsxl
	 BB8zKCWdNC2YYjsTHNQ5u+oP2l2Kuzou6Oc5MlKiedDiaeS5pLeJ5TzvT/uxXyGrJK
	 uZp2RkKHzMzA9kSiu9uF6m8BqVi+HP6++Y51Ekwi2STy3e6jrh+71Nc9Dh4rhMB29X
	 +OS23UATeSvN5RSkf/kMtjtAt4gatCUpWf0OmOZEDdA+Wqd35TVJ1AGBv4Y6CAWvvz
	 ODYuKzTI5OoifM5M28eVj/5zEb0ifnpb3FCw9U6VfT9/r/mGlNBGZeJJUUfKqN9+Tl
	 5s1p5fJtQ1j1g==
Date: Sun, 13 Sep 2026 10:25:33 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [GIT PULL] timer subsystem fixes
Message-ID: <aqZd_ZBZXumbuqAK@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Linus,

Please pull the latest timers/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2026-09-13

for you to fetch changes up to c5dcb3aadc18d7b82ba64790721b005d18193d35:

Misc timer fixes:

 - Fix clockevents replacement race when a broadcast
   device is replaced which may trigger a BUG() crash
   (朱恺乾 - Zhu Kaiqian)

 - Fix potential timerqueue ordering bug when rearming
   a queued timer with nonzero slack (Andrea Parri)

 Thanks,

	Ingo

------------------>
Andrea Parri (1):
      hrtimer: Use hard expiry when updating timers on the same base

Thomas Gleixner (1):
      tick/broadcast: Plug clockevents replacement race


 kernel/time/clockevents.c    | 33 ++++++++++++++++++++-------------
 kernel/time/hrtimer.c        | 15 +++++++++++----
 kernel/time/tick-broadcast.c | 36 ++++++++++++++++++++++--------------
 kernel/time/tick-internal.h  |  2 ++
 4 files changed, 55 insertions(+), 31 deletions(-)
