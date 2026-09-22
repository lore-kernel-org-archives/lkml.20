Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E158A47D478;
	Tue, 22 Sep 2026 11:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076945; cv=none; b=XKBvo4YPirWLkBwuK2b5HvEWJQXnRpFsaMbnaIwGR0dt9/Sg9dK2lHZdFTX7mG0ZYgXJT6GHNpB+9IGlhbHPYvKGCU/gLce+U4ckPOk4VrkcUi+eazjTD8AVe34Bk2GeGk3j1MB+MsPm/4qwayOca+mMWxoMwry8KbDIUXtWgJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076945; c=relaxed/simple;
	bh=Wo9RXS0kSITj83Hb2CuQE9Dx6nywd4yGsAvptF6naic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cquya64jAVSBnAzGjgE+4ZBZXOnPIUScsinigSRgJCBn0KrPhgKauzC25RJcbUIC0i+JYlZv7tNMn2cPLUKWCaT3Kp5/NvzsaK6u1AkehMwGpwl+Uv959ZG2fhJR5+eBZyTdJZZgpjI2hHZyeNXlr/7FZk4EGYAutmx9MBOowug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VaTVPvQE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VaTVPvQE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DE91F00898;
	Tue, 22 Sep 2026 11:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790076943;
	bh=ecd9LSXJtZ8rxLwVQiJYvUqPkFGTHzw1TxeisN7gO4s=;
	h=Date:From:To:Cc:Subject;
	b=VaTVPvQEuOOtU/svouiQU9EQPumxKCJf3iyj2plioiwzd8DDMW2dQNo9ZdBcAqJO0
	 gVI384ERpwS2kDjBvVvPLHSYjTVJldo3wCjA3ZTGru/HIVBu9i8k8ZI/Qr9gHnGQx8
	 fV7nQY5qKsEN9kIp7asiAKp3DMrGs1+J32cdLQdr4q10UAa1G/jjMC7s5H8LjkXZn6
	 umeSpGUrZ5zTrszFEKVX7MoLOq7v+fi0jferx89hRcSbv3AR9Kv/Vn1hMrrRt6JKwf
	 avB83HZOWR9H6xdFygE/XEgUiSMzy2yDOrDb8iTqiLGaQzbU4ndVnYTHywPluU6QLp
	 GjFz/ixLLrMZQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id EF37F1AC56BF; Tue, 22 Sep 2026 12:35:38 +0100 (BST)
Date: Tue, 22 Sep 2026 13:35:38 +0200
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexdeucher@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <arJoCiRM1hRbgRb5@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/dc_memory_pool.c:87:37: error: stack frame size (8264) exceeds limit (2048) in 'dc_memory_pool_create' [-Werror,-Wframe-larger-than]
   87 | __must_check struct dc_memory_pool *dc_memory_pool_create(size_t size,
      |                                     ^

which I am frustrated to see that I previously reported against the
amdgpu tree:

   https://lore.kernel.org/r/aq0vYhZXtMqA41wZ@sirena.org.uk

I have used the version from next-20260921 instead, also pulling in the
build bodges I've been carrying for amdgpu's bad interactons with
changes in drm-misc.  There seems to be a pattern with failures in drm
trees sitting in -next and then getting merged into the main drm tree,
it seems like there is some process issue that needs work here.
