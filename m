Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E14549C4B5;
	Fri,  9 Oct 2026 10:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540697; cv=none; b=PC8VmNIpN0zyH8JQnL5TcVTH7RWNlPUoY3lxCwPrqOWbIUgJpZIR1v3/FkjJbF/Y5Uf/WByFmIekNLypYwFFCeeHMP41Ov6wrBiKQXoZtzpuTDI1wXzq4K3B4z+yNuFVOW8r0bts/haOhkfHcV3pS2BPh2rOAonSdRUvpHy9bO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540697; c=relaxed/simple;
	bh=+AHeosVgImrW9M5js3wM4bugPrJ9Mik12isPB5SVCbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdSo++idLmTNHSIkJujWJJJSmn9DHOlYO+afLlocibOMoWTBQgdWetbQFeZyjnNwPXpi3JHncJtXSGcMEa2T4lHVUmTxWmqjUnSicGmJ9MwoFqws1auUaZ2iqYX/jZzUHU4R/sATY0eHIG2wrqgue0P/5D6S5TscyzalPSKeg4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCt+dML0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCt+dML0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BCF31F0089D;
	Fri,  9 Oct 2026 10:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540695;
	bh=ymPuZI0fAnFqsqK7TjwwxqbFews6fz78UratcRfYtSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bCt+dML0SAdglO4kkzkeVe//bmGvNFJRodvxijUGlMkyEDhFyt3sllslPPmTC1UEx
	 oNUFAJD85yHsqX6QY33G1BVZ5sx+FOzEYnsKEuFVPyb76Zi85Q36jwu8X0wAUXrt6e
	 m0kPbChH/CykDsxQxF1h54sSHZIVW5hIohzUl2G1HlfKjcaHAa+iJr9F+BcW9i48zA
	 3CoTRwzDDnKb7R8rD+8W72JIpvAMGDP01i02ZOVVc9mSKpDqCr0w81a8bM6Zw04Ssg
	 xgbr0rL2Rb7B3pf3GKJJZYUH1CqhVlQ7g3srJX7TDsavkAFWMI3BmlRLCSK2IV3D/6
	 UMv4O4oi3rPng==
Date: Fri, 9 Oct 2026 06:11:33 -0400
From: Sasha Levin <sashal@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: workflows@vger.kernel.org, ksummit@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	broonie@kernel.org, tytso@mit.edu
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes
 attribution
Message-ID: <asi91eAf5veKEUA3@laps>
References: <cover.1791499378.git.sashal@kernel.org>
 <20261009094237.GA693830@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261009094237.GA693830@killaraus.ideasonboard.com>

On Fri, Oct 09, 2026 at 11:42:37AM +0200, Laurent Pinchart wrote:
>On Thu, Oct 08, 2026 at 06:54:51PM -0400, Sasha Levin wrote:
>> This grew out of a conversation at the Maintainers Summit.
>
>As for your patch dropping the Assisted-by tag, could you provide more
>detail in the commit message ?

Maybe I should have omitted that line altogether :)

Ted T'so asked if we have a way to handle incorrect Fixes: tags in our stable
tree work, I pointed out that we have LLM workflows to help us determine the
correct Fixes: tag when we determine when the issue is first introduced, at
which point other folks showed interest and asked to share it.

Please treat this as just a regular patch adding functionality.

-- 
Thanks,
Sasha
