Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8473EC6A9
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896721; cv=none; b=M1S9T1+Q49aRdNMrcJkkS/JUpSvH2mkY4G2FS4m1ZI0WCg7xxbE5aNx6hFR1W+/rCqjJUdzTtcclIHm/ByrN3oesHl0tunCCN5NZLknwoyG+zpYZq7PofE1amewWnpzCTHYSiVI5FS7uwMa5PtGzholaKGPSJBP7okTprBcm1ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896721; c=relaxed/simple;
	bh=hJxIE61o9r69iir9p7Gx3Mhs6lf3OFFz6/ZhaC+9i3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C+2QGsAi2LT92fuWEd4frak8mwGNopYV8SrBEJtc3zv4a5WZ0ttJpIsyV6Ut82z7blkgolY3RE1OZWKovNCvm1sNeLexwIDMDBDKovaAGFl4nHVHfYvEb2ucKbcGuIwQttd/2yjnTda9reTAI0+j1R+rlwSs05TXtGFaydc1tC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1br2nGO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1br2nGO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63FB61F000FF;
	Sun, 20 Sep 2026 09:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789896715;
	bh=/Sx8Ye2hw8cXd6B2gPwZ8VtMHSJw3UYfr8DhJcjPCr0=;
	h=Date:From:To:Cc:Subject;
	b=l1br2nGOHTJ1w2ARYrSG2Fhd+BRanz4c3u5FlADucD2FD7sugUsLNCnkRHmAZLnN3
	 URVASyMi1oVBO6ddLTuiktvAlkXsIHb7G5NxbBHBnwKonXx8bPIduIc6b86o9i31jD
	 mgAKAS+vadWFtZXyHLjTKulnlQ4mQaBIUONAKC1VbSOQIqrIx0X1HVr8azAoiLSXoc
	 GZXjxAXTsL4Xg3IwByjTqZuZHO4fOBJJh68qqmFRf4ATZmoYhtxZWTO5ERaVmETFxm
	 oKzDPeS5MypIvYEsALJRtOqGDkZeR8abx7m2TIsnUYFPxz1MD6YKC25HIYx+hPXAJh
	 6BiT1pb3eodyQ==
Date: Sun, 20 Sep 2026 11:31:50 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Subject: [GIT PULL] futex fix
Message-ID: <aq-oBuMuZKbqIPtq@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Linus,

Please pull the latest locking/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2026-09-20

for you to fetch changes up to b61b6f95d6722ddbbbd09e689fa41b55fd36f9a5:

 - Also allocate a default private futex hash on vfork()
   as well, to avoid races with (private) futex waiters
   (Peter Zijlstra)

 Thanks,

	Ingo

------------------>
Peter Zijlstra (1):
      futex: Also allocate private hash on vfork()


 kernel/fork.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index a5934a317634..5ef413368912 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1996,9 +1996,9 @@ static bool need_futex_hash_allocate_default(u64 clone_flags)
 {
 	/*
 	 * Allocate a default futex hash for any sibling that will
-	 * share the parent's mm, except vfork.
+	 * share the parent's mm.
 	 */
-	return (clone_flags & (CLONE_VM | CLONE_VFORK)) == CLONE_VM;
+	return clone_flags & CLONE_VM;
 }
 
 /*
