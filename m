Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591288;
	b=W/9cMFxqNraG8wADJlAGo2dK5YL7KP9qP/B9XOQCByrYwmI4LaRcact1p0rU4xvvTt72
	 wnxbbxl5Pi85p1JWq0KUEZgPdhUgB2mtB/aC2QA/51ytDN4fQj/jS9bhzBIfBJnN7uNW0
	 gNLLdr3emonU6KrZYtzXHXP6Ez4dBmRU/b5e5d70e7hg5AhRtReUGMAXwNNh2oW2YQ2z0
	 nGn0pKj9LmF9OZ7ozmRyUIF3esvM0ofPMOzXbDWsqj1j1xCv8SmXBrkTaAAn57i63PWHK
	 i4UwqxYpbonTJQOjQM7pgBO3KHSS+t4bNWbZ08WmM3+zssN/BG+MKfWdmwE6UmCeWHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591288;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=MDvH/FBSJTVav3sJuSh9WDPQ6jFwgaFnTIQnsrLH4CU=;
	b=xtcTiHCIjzE6FX7lYh+6lOn5TD/daJdHjEMXGl/TvXl0iIFVINpqWaDICQXQAQv7CYq5
	 aldd5TfIvGHgdad6rd0W+dy5PIoTvJffh97Q9nZbcOTFIkA+3cJD51UwSUtsoB8jZsIza
	 v5dgSGolBziMHIvOWawOsosyc4Wac2ICAwcF3UepZP7HhgWlleEK8luumxBM4CtiihJA0
	 9Ny7HO0dGKHBZr1CXywWTCW8AQ9IORaLHPYRn9JEylligthbyRHw/Iva2zHXK2KPSi+Xs
	 w7df96cLch1TRcrSPbQVyVzZdhGEC3zDCG6ViSzFiTHmfdBpL2ExOBQH1q5nR1sVkxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W0ptMar3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F14606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W0ptMar3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF631F000C4;
	Wed, 21 Oct 2026 14:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792591288;
	bh=MDvH/FBSJTVav3sJuSh9WDPQ6jFwgaFnTIQnsrLH4CU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=W0ptMar30pjG1Ngjd05xOqsPI/09G93tXIl1GHD7si0UYP22TOl/mPYSCPfIrRxSU
	 PaxAKH4eOpoFEDylBdx8WhVhNB0sC/FGM9QuJZmbrwbWsyXxMGooOGuOz7me/g5EpI
	 ilqPbN5H1b6n5D2g5bjC+s1jLe85RmoIC5pAI8bH4iFy8RzpkvKHYLmt/tWO6imSx0
	 Sf6sour4zkI94oTt0AOh9u8k0UEJ6YGq0nVXmsh3xCjndail+y9ayFfLSQKRbDCKCY
	 g4G1spJdxn2P4WZ8rAG0w1TUX3MDkANTp9oDL8vWe/tL0ZxdkfJNMgYZefzhwuHvz/
	 AXvgLWeJaEHkw==
From: Christian Brauner <brauner@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Oleg Nesterov <oleg@redhat.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <atObuVZXbl9n-zFq@redhat.com>
References: <atObuVZXbl9n-zFq@redhat.com>
Subject: Re: [PATCH] proc: use pid_has_task() in proc_inode_is_dead()
Message-Id: <20261021-analysen-binsenweisheit-drechsel-2dd89c45fc43@brauner>
Date: Wed, 21 Oct 2026 16:01:25 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-3d1b8

On Sat, 17 Oct 2026 18:00:57 +0200, Oleg Nesterov wrote:
> to make it more readable and consistent.

Applied to the master branch of the vfs/vfs.git tree.
Patches in the master branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: master

[1/1] proc: use pid_has_task() in proc_inode_is_dead()
      https://git.kernel.org/vfs/vfs/c/af74053005a2

