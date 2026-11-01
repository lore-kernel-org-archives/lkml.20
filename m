Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571433;
	b=BJf0ugtXhDvL/7nLqzyzO8GveYeqyhMMA1em0I3pf7E5g0s3+jELuat2LaelIzYzB2jZ
	 KUYh32rmLZ9u+uNabYEwLzC4AFIlyjjrO0v1SeGRsH79DYFYN+eFU+vSoedNqJjkzNaFx
	 ffvc+7OGHjUVRj/mdBdmQJmtau0Yz1KakgwrnNlLnX7gSOapWXk2H2FhSo77ghSV0+m+T
	 0gR8wWuEiK4mRJHMB9CfXAcceQDaduVnTrGnL0SAX0Lg0i2TPgS8lcHivs+3y4HCLdk3z
	 zxsnsYcq6VnhEHCGmi+ZMNebrg/6vOG/sj4aTfrpKi7o58HSXT46pIVNl5g7/zjWozw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571433;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=0VUu6Q3iQ1FQir9zMfLK4+e/rrsGptg78V82yq/1WLM=;
	b=4bLqF9ywlLPwocfuICj1AAA8vNeBmpSsYShJHJ/bWgkp6r9BHH+4Lwrn3CJCBJQ1ODbu
	 6PsIccJaBRc9sGIGF7nnEG51XfS0TqsDVS/4TYTuKvJCPGZs3pnez16jst8rkNsQzvCsX
	 A+yw3QSVSyDrua+WiVrPlV1zqUDoCN8JvyKXBjXuN8SR/ikoWQqvqtI/X6U0G6E74B7WE
	 +pvMzqErW/CS4SPQhS5K8Zv7lHWvTThzBy8bsSGa7Ijm8Hn/fRGUkIsJY167UkT/0bKdD
	 xU2FX+L69rDopsYDbkf2Z9nKaTRK7x3MWClC7C1MdGpKh/TycIoCTDq7IJ4CJrDF4mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oa6XY8H0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4721660A6F7F
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oa6XY8H0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C383C1F0093A;
	Sun,  1 Nov 2026 22:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571432;
	bh=0VUu6Q3iQ1FQir9zMfLK4+e/rrsGptg78V82yq/1WLM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=oa6XY8H0fpx7lSgfUce6a2Ro+FE0x6zYQkloDozziCJBx9XCKaN+W3QH7mNiF+J83
	 QgYdtjEWChc25JoV2Rf9+TnfSBOHkPeztjTa0eR/FkoOzV3usJLSOGOZ98Wn0D6cqm
	 lFLzESsUiAwShrYfvzcMF/rBSDxVguVKBV4DStBFt3FkpxJS5VaDI+zdcFLYTJd0dO
	 Jx5XDZschGj8UaY9Yx6/l4V15Et1mcLV5uSLvR2gXkJ07E65WL5eC8MB2cjT6KnaeD
	 NX+DV9hcerAW1g31Nwg5WfylbS1b6g8bO6GuUH1fApCr2PvubIBTS+z3HiC/i0UL6u
	 2u3ewTEIT0rng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA31538003B8;
	Sun,  1 Nov 2026 22:17:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
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
Subject: Re: [PATCH 0/3] Remove deprecated static key API in scheduler code
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357143129.2624073.6891423921734394986.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:17:11 +0000
References: <cover.1784538478.git.hongyan.xia@transsion.com>
In-Reply-To: <cover.1784538478.git.hongyan.xia@transsion.com>
To: Hongyan Xia <hongyan.xia@transsion.com>
Cc: linux-riscv@lists.infradead.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, kprateek.nayak@amd.com, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 jiazi.li@transsion.com, linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Peter Zijlstra <peterz@infradead.org>:

On Mon, 20 Jul 2026 09:38:02 +0000 you wrote:
> From: Hongyan Xia <hongyan.xia@transsion.com>
> 
> While working on something static-key-related I noticed we still have a
> few sites calling the deprecated static key APIs. The old API with name
> static_key_true and static_key_false are also super confusing. Move all
> of them to the new API.
> 
> [...]

Here is the summary with links:
  - [2/3] sched: Convert paravirt_steal to new static key APIs
    https://git.kernel.org/riscv/c/a5576ebce920

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


