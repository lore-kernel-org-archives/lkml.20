Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689BB2BE656
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 02:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788058005; cv=none; b=ZAOmHFSHts9jTypt9lH19XVJPoV3B2NLI+lwUyTFRb6n9u4cty33y1Z9FkHz3hgfOO81RK23HP277aBa3NMqGDTojhHxdIzS5DNOLIq5ilxWAojchc72gEnZ60QWd7hoKtEV6nHXXQ2f5jZ9HyXunyoOAsilompY+TtWF0S2iag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788058005; c=relaxed/simple;
	bh=vBtNJNW457j7BNnyPQqYWb81GSxNuVRCeHAERbUvB+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YpNNFbudXYCUa35E9j7gW1a4ZIM/MbOqABaNofN0WMgGzlPEfD/URNgEK9F7H1+NfKhkhLXhz+tWobfd/DwlpFPGADdhwzmdspR5YFk5H9tuoxqQyOc0lSFYYBpjdwLjy2JrKgN8tJCzuFgwQBLikYsLEsBXFVvNIkT3wNerUVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbgRkOzK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbgRkOzK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E835A1F000E9;
	Sun, 30 Aug 2026 02:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788058004;
	bh=g43uc1QmRkP6RENguZs4jOVBKObSamnVOMpqJVeiHDs=;
	h=Date:From:To:Cc:Subject;
	b=GbgRkOzK/+8PPYSy2+D9gvsZLhA3ubf+YMkR3vquVyxQ+wczQoTlhee/mjguSVH60
	 R8lgeI9/zCtSWGh8GU1sO1YjrTHnScOVFcwvrGTsbts0AVEUoKMXoE/iAKWGKM8LaH
	 r4MBYZNVu1zasFDl0UDnQskcqKs002QkGhht/BNSZa8RcWVs1yH/GEYLoZSv7Zvzgf
	 7XGFYapHFd6psM5Fajx8V0f9PtID3AgWa6chRG9luaiBvvdCsWaplnLpkLxZ2WTlQj
	 7fte15/DWeENc2SYajj1f03Jrq3LiOb1xdeq+mM+Av9ap4rnqLjWMRjDYlbTRgOZ+h
	 TEWFqnzjGZf7A==
Date: Sun, 30 Aug 2026 04:46:39 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [GIT PULL] timer subsystem fix
Message-ID: <apOZj2iOQp8cDjKP@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Linus,

Please pull the latest timers/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2026-08-30

for you to fetch changes up to 64f74d8f728877858372c52067e5c0c091f8db24:

 - Fix UM build regression caused by the removal of the UM
   specific timex.h header. (Thomas Weiﬂschuh)

 Thanks,

	Ingo

------------------>
Thomas Weiﬂschuh (1):
      um: Use asm-generic/timex.h over the host architecture one


 arch/um/include/asm/timex.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 arch/um/include/asm/timex.h
