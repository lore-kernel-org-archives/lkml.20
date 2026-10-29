Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287530;
	b=udEhynm0chQXkiG9jHGNQx/L5h/5a943usxEsAKG8Ez/dBPZeeM28wCp0xNlATuCe1yR
	 1hfO5eHq7LLxozM9SaPQyid/CzdG66DMWkZAZDmOr+TzAEMyF7PUHvvcux6kt8cFpxCe4
	 V3Q24eG3aiBvL7FyeSQEvjI6uSkSURSF18J8UER4USnbasMgFsEcnnN8JT1Fyw2UBi8Qw
	 F1sNbqJXxbIFG2G9skApwRad+NhL+cA3sUVWv+cQJJ2annH2JoD3WlIr1uwZXeu2TtZQw
	 UR5d6WQ4xAxFDR01SEVKBNfvRz5NwgNykfMNfCYYpaAlQyXvIatBZuwFgzfRut1e0YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287530;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=MzyMU44fX/KbRLhEgJffdyMJh6VGZdEGMFpzkYJGgv4=;
	b=GnP5PS/Mo6GvqOBN1Eiw3wVK9SxbRYRMc4gkwnAAlKqZTYZtNDQEU8gmVI/X3WPIajH+
	 X4gAX4uDr7zUPyMRhMNGP+bSo2LCd0QeTkgGJ5NutEYdi0NpZlDtRAHaw0+xrsLndBKOc
	 cHPXQ6Lt6vN62pVxieYK9kCY+N/oDuAIS91W+qg//mFgXtXI3WAHqRZ4NUxzXmKAvzA4S
	 4Uk+vYDt3UMrlDT81uOvjxb7PoBYra1zOG+xGyBnT2olTm+xcMATOwbxVC4F8mxCpxuWr
	 6wgby3lo81HmunEPWhwlMUwM9dHxnHQk5BcDO5wMiTt3uF5b/orCzZH10FEfslL64+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bBTnpE7B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44236606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bBTnpE7B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B9B1F01816;
	Thu, 29 Oct 2026 15:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793287529;
	bh=MzyMU44fX/KbRLhEgJffdyMJh6VGZdEGMFpzkYJGgv4=;
	h=Date:From:To:Cc:Subject;
	b=bBTnpE7BXXk4L1YfFuLpQLiTM0JVbh8rCelgZVAaYQAspYgz9AVeE74PJzyXKDUEx
	 2TGL8pzkIMeo70IWeb9QCbXf+LwlvhNmZKTm8EyQdKIfJxyfa+1xhsf8XFtlQsmuOa
	 5qQZDKrCgimiAGCYJbR3R7E9k7rO2yd8c/6FVQ6jGuwtvQgtXjD8abKtSLOr87tP4C
	 kR+a83elSpOulfYTMJ4LYdHeUInQWn3sW/IUnYcHRPLAKYo0aOu8rJrp+jOXAcR4Xa
	 VbnsAHL+ftDWWvTCqj6K4UHKje3M1kwojKcNB9Nhr9/GUgWZVIKdseZWuw4G8eZMjo
	 +zDpdiNp8lk2w==
Date: Thu, 29 Oct 2026 16:25:26 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [GIT PULL] kthread fix
Message-ID: <auNlZtFskpC1ijA-@localhost.localdomain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The following changes since commit c03c1a14507dfaf8b856c2608f9ac216021fc222:

  Linux 7.3 (2026-10-18 13:14:58 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git tags/kthread-fix-for-linus

for you to fetch changes up to 78ff77ded78f2d3d6040705a3ab5a83cc45275e3:

  kthread: Fall back when no preferred housekeeping CPU is online (2026-10-25 19:53:54 +0100)

----------------------------------------------------------------
Fix a bug where dynamic CPU isolation through cpuset isolated partitions
can move a kthread out of the housekeeping range. For example in a
system with 3 CPUs:

_ kthread K has preferred affinity to CPUs 1 et 2 and is affine to them
_ CPU 1 goes offline
_ An isolated cpuset partition is created on CPU 2 (so the only
  remaining online housekeeper is CPU 0)
_ K is affine to CPU 2 but this CPU is offline so it fails and goes back
  to its previous affinity where only CPU 3 is online. Yet it is
  isolated.

The fix makes sure the fallback affinity is always a set of online
housekeeper.

----------------------------------------------------------------
Avi Weiss (1):
      kthread: Fall back when no preferred housekeeping CPU is online

 kernel/kthread.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


Thanks.
