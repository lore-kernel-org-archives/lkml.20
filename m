Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26BC2A1BF
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496555; cv=none; b=qNQ4J35m4L3emZeBphIDKeKaQzA9V0D3TKW01dduwp4unuqJ4G+1Ul/XwTaNvQQMcFxCja7n3LQEzwiKQjyvpQcQvwcRDW7SgCv7YrODbqyleoVlz5p+6RJABpl2ePHlFrklFhJQO8ZP8Sbwf1BEte+yEiDWtfhs1hvBrAG2TmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496555; c=relaxed/simple;
	bh=xTzac3SXii/sXGc1jkFSzD5XSQqg75MUzW+SCmL+Sec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AKcQWnA/9rFZL4rCgOcxk4sxPCoLxX14UjKQ9wvjjEkfS10qr2sQmGLyhx0Hly9mew6VLmg3cIHBG8xVqZOnV0m5J7ZVEn3TcFe/gmT+6Buh+nH4igbtmIPs7x4M3JkYSOO/0e2chCN7MJegp3gX3/yV3S4K46luZ5dZ+opzQvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBbEE4tk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBbEE4tk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDDE01F000FF;
	Sun, 27 Sep 2026 08:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790496554;
	bh=WzwDboM7aXnMZ0uO3rLw15dHtXU1JDjUjVp2LHj5LA0=;
	h=Date:From:To:Cc:Subject;
	b=YBbEE4tk6ucvrfdOPL/IPXUc+HEF1x44k366LfdjVYnU8hAxKdqpcsWinHeE6BVyW
	 5yUggxlZwCJr9qYisemiMSuV61zouEynXA7xsaPk0mc3Vh/XJ62J0Ya5wnJEu9zKOh
	 1U1nyqRemtOeKFQOvitu1LoA+0JNrdbCJ+lGEQGw1mU1PB+FannJIcx6P+IGvhAnVo
	 eafqaEzvVoDmr5uhCUGeCeLPYgPQEE9cZaJv3wpKoy/etxy/HuHjXyNs2Kq5b31sLn
	 aVmiif0ZLPG9ClszOccYYNsoSBj+t8MHTL18kRl9SNlITaghX2fCU8XJBT+EX2cScn
	 UnsJyvUtwoceg==
Date: Sun, 27 Sep 2026 10:09:10 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [GIT PULL] x86 fixes
Message-ID: <arjPJsw8xyBRB0Tj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest x86/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-09-27

for you to fetch changes up to b8d1d5b63a8ef532038eebd9d97d406860385668:

x86 fixes:

 - Fix preemption bugs in the SVSM vTPM guest implementation
   (Melody Wang)

 - Fix MCE-triggered hardware debug register corruption on
   task migration (Masami Hiramatsu)

 Thanks,

	Ingo

------------------>
Masami Hiramatsu (Google) (1):
      x86/mce: Fix hardware debug register corruption on task migration

Melody Wang (1):
      x86/sev: Make vTPM SVSM calls preemption-safe


 arch/x86/coco/sev/svsm.c       | 10 ++++++++--
 arch/x86/kernel/cpu/mce/core.c | 27 ++++++++++-----------------
 2 files changed, 18 insertions(+), 19 deletions(-)
