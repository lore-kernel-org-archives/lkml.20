Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793499926;
	b=VvyEQ9Bm0d+WhgS5e/zIn3zRfTeJPQY9f+Sf95v+BWr4ERa0eQbZI5vsyvw2xHERu/iC
	 v5QH0/b6HDxQ07gnxaql6Du1wmc1Ykz4eE++mmW0JzU1DmHBnr6pprfAwY0Fc8Qx7ny3o
	 lPi71UGbT3h9YMWZsx4YaQx068TWFnNDSQ6lgojHbcWV2lg1Ocg3eJY4xrugxQPES3LsL
	 KrMichyv374jdnEjkygrUSUJq9AhNxK35TCR/xu8TvRifUSDe/bovbsn6rFbjMGe73jCS
	 95u2wAXZb+EJvErreH3ZRg9vc0FiY+Lc18CJod9OW71SQd0uyb2tyzdBKC0jgELe8YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793499926;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=myvjcuz215/LP7voEFRNC685vsIgpbLmNooviClWzRA=;
	b=1l6NtAdrRWHm8oJE0mQFQa7o9V8hqxM4ZigQxRdpfvOFb4rWFkz1rUdvP8Ef6LKG8HMA
	 CtIvZb9NWKBPdZL6ntw9w+WF7hAZMeQX02ITWWaaVaNI+DXxLBHPMaI4NL5iMxNSOaDkx
	 Cfo3ID+0Skrnau1hGL3v35KNbqw38jdUhs3blQgfSUHLS+YAMsJMVHrDCo9nTDg7ceCKG
	 dTPPySoO4To/LkeO7U7bNBVO6CoAtS5KTfbUngDyzLvAyFI2oQriiurCZLZRK3lEGKFpF
	 VRq1zS+6snHNZvu0WuD4/l5dpgwOA3MhVlCpRh2u0CM3zqv243woLXgjuiOdR5OILWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KCyOENOa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DBB606A329;
	Sun,  1 Nov 2026 02:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KCyOENOa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAF51F000C1;
	Sun,  1 Nov 2026 02:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793499926;
	bh=myvjcuz215/LP7voEFRNC685vsIgpbLmNooviClWzRA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KCyOENOaUM/Sr4yXfJCh/TmtbbNYSMJ28y/BbEt3h7HawjKW14QkfopuIfo8JOmwJ
	 a1QwR7yxekv/byfE+6+8HefJvlibmL1I3INoxJN0mFRTOKrrovy8tJm5PBzJ6RJrG6
	 r5hCRmgrxfx73Y/fK/jjggYq04g2nClhfvjZbOuAV1lPSishtr8v6vFOwA0dUY+W0K
	 Qsxzh9SymcBIjHhJipJeNG/C6XgYaRBou0piFSBP3xA1xxkRq5khy3JD1t+kWFudU3
	 WHvF126Z9KTHkem6FgBmD0HhE638Z5NV4U4VHCZp3fR+KRNcmeoKugZHH8Nf2YXnva
	 p8Qy+hYwaKIKA==
From: Sasha Levin <sashal@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL for v7.4] media updates
Date: Sat, 31 Oct 2026 22:25:23 -0400
Message-ID: <20261101022524.1005227-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAHk-=wixKLm5ahcYJ0tZNViP298RNJ_QwDcXN-AheH6uOfLZwA@mail.gmail.com>
References: <20261024185058.20410953@foz.lan> <CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com> <CAHk-=wg0+RmcNDKQ4Qf82-miG4gjZ+CzqjTBET1ZZhkrPBp5Kw@mail.gmail.com> <CAHk-=wixKLm5ahcYJ0tZNViP298RNJ_QwDcXN-AheH6uOfLZwA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Oct 31, 2026 at 02:14:37PM -0700, Linus Torvalds wrote:
> It actually broke git this merge window. See
>
>    https://lore.kernel.org/all/20261031065525.19883-2-torvalds@kernel.org/

I was curious which 283 commits describe was overcounting. Funny
enough, they all come from bpf-next-7.3 rather than media, and their
dates seem to make sense.

A bpf series went in with five commits in the same second. A bpf-next-7.4
series without a base-commit then got applied on top of the middle of that run:

  bd2466ed8fc2 ("bpf: Roll back stream capacity when allocation fails")

sits on

  af22d273aa1f ("bpf, arm64: Fix exception table metadata for arena load-acquire")

The media dates seem to come from tooling too: The media CI merges MRs with
Marge-bot, a GitLab merge bot, which rebases each one onto next using
--keep-committers [1]. That copies the original committer date onto every
rebased commit, so an MR landing after a newer one ends up older than its new
parent.

GitLab shows the same pattern for all the commits you found: the copy each
committer pushed sits on an older parent with the same committer date, and the
rebased branch that landed was pushed by marge-bot. For your example, Sakari
pushed the alvium fix on top of

  b38d06ad1e13 ("media: ipu6: Fix up missing IWYU issue")

His MR with

  63c578491cb4 ("media: sun6i-csi: bridge: Use V4L2 subdev active state")

merged at 22:10 UTC on Sep 16, and at 22:11 marge-bot pushed the alvium
MR rebased on top of it, still dated Sep 15.

So in both cases it's the tooling being funny.

[1] https://gitlab.com/marge-org/marge-bot/-/commit/3fb8ab74b8781505530c21a28ac08080bc7deedb

-- 
Thanks,
Sasha
