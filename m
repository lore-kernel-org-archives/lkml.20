Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03A43E8C78
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789897345; cv=none; b=SlCMq7ukkC9fwdWbK/Bq9LnSY7gn+FmHLEp0K6KG2PaPINSzkLOKmYfEepVkJbDSC9JZUm++yz0Y2afTtzdGDSlGfyWpPZ61igUXiEtCKla4S8mhBwdT1GFLlYLmcVIrY7XqNyQ8YOtzpNQ8mgjxYpu0VbH6VKd9boJIpyL7jIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789897345; c=relaxed/simple;
	bh=IXIX5cUfOGNC/uNcgegDGRAYeFM4miEL0hxDzamEkv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sQXpG/vRVwMeOEpnJQ3mv+r2gwp0NVdFcbrRIk1FbFycYgUsP8lmDuIoczr+HuReunv0vhctRA6XRsACTy7/U3szfP14cDAHsAb47EJ00pInqDGwzegS/mVIw5YmT/yRvYmbcI9GK98BamsGlOjZ95Jj9Ugx8WcXvtwSBr8Mghs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=keNEpaAX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="keNEpaAX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EF21F000FF;
	Sun, 20 Sep 2026 09:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789897343;
	bh=lSZ9GiakNcXcruhnq4z917OvIUrKh6QVGiwhpHcHGfg=;
	h=Date:From:To:Cc:Subject;
	b=keNEpaAXtZC+i/Ol/dssgVKIqfb2rdf+7ia1egp1eL8oivKePGYYIQOXb9XjF0++2
	 nNzaZVdUmyW5NfCGsrVTAVO5LYKQs+Uo8uEo1y9RUsP8tj36DFNMHEJcyUo9/capbo
	 oBgczFaAr+d1AeGgiBffC2e80+qgJ1Vb61orHNhNhZA8s9dflL68QFkMLp8eE5bh33
	 U9MbhSS+LvmGSUe6LQpKT2bMQTglBOzxlEq01j89Zyy234/rZ95KZb4cDkYYXzykH3
	 L6eHttrJtLHNlp1k/3VSj1DIzVXHIm3sWVFWLY8qo5/xb3lBrbzuo6YYKz46JFzU0p
	 FRPrUowi+rIrg==
Date: Sun, 20 Sep 2026 11:42:19 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>
Subject: [GIT PULL] perf events fixes
Message-ID: <aq-qe4JS7tAt7Swi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest perf/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-09-20

for you to fetch changes up to 88aed0422f39b22406f35f1e758cea25e7bbcfb5:

Perf events fixes:

 - Fix crash when probing CS CALL instructions (Jinke Han)

 - Fix NULL pointer crash during module unload (Vinay Belgaumkar)

 Thanks,

	Ingo

------------------>
Jinke Han (1):
      x86/kprobes: Fix crash when probing CS CALL instructions

Vinay Belgaumkar (1):
      perf: Fix null pointer access in is_include_guest_event()


 arch/x86/include/asm/text-patching.h | 4 ++--
 arch/x86/kernel/alternative.c        | 6 ++++--
 arch/x86/kernel/kprobes/core.c       | 5 ++---
 kernel/events/core.c                 | 4 ++++
 4 files changed, 12 insertions(+), 7 deletions(-)
