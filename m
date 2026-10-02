Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE2C33F8BE;
	Fri,  2 Oct 2026 11:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942303; cv=none; b=r76opVkdGsbWC0jksvuMSo7+LzP7VA+G6WvYePRKyHqQEUboWqqXskseRb9u9aSsIT9sjGqjwtqT8zpfbjD3qGMcQpBXQ6tHT4NsZsab3wWuuKn4uk3GTVo43mMYflmW/zOXtABLd1u5bqbOd75zNHbIkEhTu8ym3HEaECwXYsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942303; c=relaxed/simple;
	bh=y8jPDf+6mm3PC8XWaZvvFSGvCBKYymreyrtCjqLKE38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qxWj0GZzOn4kTyjiC/k9SrfyRZck6sqvL+76f9hIfoqXefnmQTWBn7a1Lmtt2tVDCHCFE8T7Saf2whE2JCbYT4LNvl5nAOTWKQqt8eQD696NRUYj+Hs7jBGoccKF8rmPpv/NtOpR4nBRlkbqWQR1rHsMigZmu+bPWLhYvC621Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCPAhEJ7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCPAhEJ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6CC71F000FF;
	Fri,  2 Oct 2026 11:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790942301;
	bh=hzkSbE7lAnQLxmBsoqCgYHqsGr6wmuyBs1kj6JBcB0o=;
	h=Date:From:To:Cc:Subject;
	b=VCPAhEJ7TKw+7pjNfnQofcOaAfBCxZso9kEe4SLB9wbZ8DXIgBdYIxQ5JDatIUBZM
	 fO5KZN2da8yAlrNUYeiZEPcbDgH4fUmceyHicvcjjGg1X5rX6WECR/3Az7ahylUJn/
	 JN9+m/54FZaKyV1mxKWhZFqhM405OPqO6HxYpWlDLtkY2uCT9lOYY60GieLgqNnn75
	 xlZ3Vf/MCMakvSCk+3SCt4/EnD9r1bFIy1nff/PbVpLpT2LquWv56te1/j+R0oO7ci
	 UEeNy/nCkB+uIk2TbvbsGQxw/TKgQtHLGhfzOJ1V+GoQdxC6u8I8cqJ+vyjTx1WdLJ
	 eeQy0M43epJCA==
Date: Fri, 2 Oct 2026 12:58:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: linux-next: manual merge of the rust-timekeeping tree with the rust
 tree
Message-ID: <ar-cWpOhcuo85ttt@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,


  rust/kernel/Kconfig.test

between commit:

  cd56a1c858ff3 ("rust: bug: add a KUnit test for warn_on!")

from the rust tree and commit:

  a9aba476d42df ("rust: time: add Delta::to_jiffies_timeout() for timeout conversion")

from the rust-timekeeping tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/kernel/Kconfig.test
index 966b07872ba15,0087749995d2b..0000000000000
--- a/rust/kernel/Kconfig.test
+++ b/rust/kernel/Kconfig.test
@@@ -83,12 -83,11 +83,18 @@@ config RUST_BITFIELD_KUNIT_TES
  
  	  If unsure, say N.
  
 +config RUST_BUG_KUNIT_TEST
 +	bool "KUnit tests for the Rust BUG/WARN functionality" if !KUNIT_ALL_TESTS
 +	depends on BUG
 +	default KUNIT_ALL_TESTS
 +	help
 +	  This option enables KUnit tests for the Rust BUG/WARN functionality.
++
+ config RUST_TIME_KUNIT_TEST
+ 	bool "KUnit tests for the Rust time API" if !KUNIT_ALL_TESTS
+ 	default KUNIT_ALL_TESTS
+ 	help
+ 	  This option enables KUnit tests for the Rust time API.
  	  These are only for development and testing, not for regular
  	  kernel use cases.
  
