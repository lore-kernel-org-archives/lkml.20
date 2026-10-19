Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424414;
	b=Ceae+wXrETrGc2IqaD4p94KmILMhRZIyUls6TYXWViCxrdQtCPDWnOtVLJ7Z0MfOBvAX
	 O3yFXTk0F0biOktRBbqPyX9OSUoD2Obod69dXWoH1VBGT9yC2p3ToeYWsppIN/e2a3Eoc
	 NZVR4pAO6660DEDcbUSVejeICGKZq6tmkSojfJleVEMNKHVPkmX3hWmTD/zL77hjXXzIS
	 5JS6BZI+M4c/pybHwtUO2pQoq7sx5bPEJcvroKVQcu1DaKw2dONSwbF9y0LVhSN2OBGTL
	 mT9lxUFiBdlP8A55F9kW5tp7iwEiplaaGpyJfd8UPPuB/4OMbBu5xOjsDtl+CZeTlFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424414;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=G+V77N/C1hhL9FyqAqomXKSSOjqKQTkqb31ANrBdi4k=;
	b=Me8fukumnhERKN8tjLHFtq9Q+PG6wEMOm3iFMCIwf7MKH4IYW+NzTsPpclAPxPaIFncr
	 P0LlzRVIMosUDnzhg21MLkAblzLn5CMnKO+DqhfCjd3d0e4m4zLz6myRCe2aPvIamxl39
	 7KWNUO9/PCJusFhI5X5Xz2gesYrBljIQPU9Mr+/iiTsjZUig9wO2k/hxXTZiJF0xmk876
	 h/Ajf3NWIefivg0rGrr858FNRDR0E2nO4Dj7PaSlSv+HF3lDqnK0hyw5VQZbOG1EZ4MYd
	 awXd7ClkDWQEqgWb0rYgNUJOQ3HKrKqmAkQvvM5vJ51BfrSuSaoS49/uxbfa3G0iw8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="T9li19/3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE4E607DC4D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T9li19/3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A96F1F000C4;
	Mon, 19 Oct 2026 15:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792424414;
	bh=G+V77N/C1hhL9FyqAqomXKSSOjqKQTkqb31ANrBdi4k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=T9li19/3fZy52ILjRKJqVsjGWYfINbXA8858L5XmVyCnH7WghntxOSPg6VboSID57
	 CjsneiJm3CNeusbrI3ClAU7R7JbbIYjkrEQ6DelqbYXedZii0zFrCIKD5L3Qx7v6AK
	 2MsR6XEbqt1kbqWkaDe/jjOpHVvIVlA6vX2kQYdFGnr2KfQfcy8FtpWZoWnZkD6xCw
	 VA3KMWAN16k008CRM7yvZYQ3BVbxivcFGRMsx3LezV2Tqxx+XxNrb7P1a3oCYTERiV
	 v58FZPjwNfT6tTQbwd3jSCvRSeXdYMqbboMQ5/KGviGFsYvuyJhMv0zabeFUiC6KkV
	 5OrzODbwt8O6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F151E3811A71;
	Mon, 19 Oct 2026 15:40:13 +0000 (UTC)
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
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix submit accounting for IPU writeback
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179242441252.2714099.14576361716575033852.git-patchwork-notify@kernel.org>
Date: Mon, 19 Oct 2026 15:40:12 +0000
References: <20261014112629.59861-1-jsjlee1020@gmail.com>
In-Reply-To: <20261014112629.59861-1-jsjlee1020@gmail.com>
To: Seongjae Jeong <jsjlee1020@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 14 Oct 2026 11:26:29 +0000 you wrote:
> f2fs_write_cache_pages() uses the submitted count, which is set to
> fio.submitted in f2fs_write_single_data_page(), to update nwritten
> and decrement wbc->nr_to_write.
> 
> In the OPU path, f2fs_submit_page_write() sets fio->submitted to 1.
> However, in the IPU path, fio->submitted is never set and remains zero.
> As a result, successful IPU writes are not accounted for.
> This can cause asynchronous writeback to continue beyond its budget.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix submit accounting for IPU writeback
    https://git.kernel.org/jaegeuk/f2fs/c/6d1f622b9c06

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


