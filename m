Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADDA37F75B
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789286645; cv=none; b=lbuahSydgrWBoz0yYXrTS2LcM40COS2GC+0hULVyyRPNonR2hsEk0Myk6pRg2X9V7hjzmRZgPZPjB0e5f/alRuNPzWSwWBv2xNVt7RJvyBj4CwYKsVTuphSp55aF6Lx1akrw49CwOqSQgcmRVm7Rin7OPFrUbcgwthe8did5/DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789286645; c=relaxed/simple;
	bh=8L5qTq02ZBtLClpPUjpQBQCZgAn9gywJo62wzTcJ/G0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D4CnaH8pJuhfU9QNq3mCzCa9wy5aNjB5Eysr3Dlkz4vVWydrRZ7ft2uZV8dDz0LX0BtvGFVEv7LcfZPXfCnOZc05WNFnvVx66o7l1osoNZ2QVjNSSxXsGiLlolEhxluoyN6DPjefPT5takbCi/D4Ry9ctzlh8z77d7Sd+V7JKCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MFIOxt7G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MFIOxt7G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19DF1F000FF;
	Sun, 13 Sep 2026 08:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789286634;
	bh=6pQx824tn/PmvNwk9MzLeu2s00Uo3nqMBw3Fd6c+qz0=;
	h=Date:From:To:Cc:Subject;
	b=MFIOxt7GfaRdeSqLdH1oSBMO7h7sytvNO2Du9Kg2NTtZSQLl/cWZP46+61id+/C6s
	 TTqx00BBAJqQz4ptZEO0nhBsTzz8WjY/r+bN0i8FEFM/QZzDav/aAwaHhN3s0h1Csu
	 vT4gzWDdunrGXNQhsLTymo2AYrumvxcvBLhgYaTPxTgFwF7mk//Fc+iTB/fiSGOPdy
	 vQwbRBnqFILfwXZe1Cm8kJMChQeefwX2f9fYQV+Agd6aYgJFBLdYfqqzOeOuv3zvU7
	 5gEAE3Zj9LiRFSbPrnOpg6IXtfDRdEMp+PQ3qwZAovup4sWQruxIV63twV+ZQ8Va/5
	 vQDgH+oFCiMjQ==
Date: Sun, 13 Sep 2026 10:03:50 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Josh Poimboeuf <jpoimboe@redhat.com>
Subject: [GIT PULL] objtool fixes
Message-ID: <aqZY5nsYd-4pat7G@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-urgent-2026-09-13

for you to fetch changes up to ac323c9467092479dc1e5bc138c9abbe015b0069:

Fix misc objtool bugs:

 - Fix potential klp-build allocation leak in
   cleanup functionality handling kzalloc() failure
   (Yafang Shao)

 - Fix KLP checksum false positives triggering with
   GCC, caused by quirks in string literal symbol
   generation (Josh Poimboeuf)

 Thanks,

	Ingo

------------------>
Josh Poimboeuf (1):
      objtool/klp: Fix checksums for constant pool references

Yafang Shao (1):
      klp-build: Fix wrong index in funcs cleanup error path


 scripts/livepatch/init.c     |  2 +-
 tools/objtool/klp-checksum.c | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)
