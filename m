Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424410;
	b=ACi6Wbx4xUSzdoN5e31eHMvAAEQonZKkgmd/xgWCk6o/JRZPj9UlcpEDG1//lGDBl8yM
	 YXn/Xqd2jqaoI/QoizOdrzF1/tPJ9RgB2DQ25zSKiTEXXFwR/3EUP2VCBgArXdrE537DR
	 KMX9Y8E5VWwTLj4AG56phmmF+7XcnRDxSDLp0fCptHvskj0WMgWyDKbYZY8tt2azZn9A1
	 y2MKUyY0ZZjvscNVFH/SVGP49iXgSX7I1U448u8IoZX7ZWyXK2z4VU9DwLPYuSZNh7g7H
	 Uo9/bJ0fkFYIU3zRpStCvHn66+Z1mccQG14jYG2NRLMy6iMY+zQ/bpqDWNwgGel+T/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424410;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=qwGM5xmeEPX+GaVpTSduBVTgYgRIBuVMbExrrgClW+Y=;
	b=CVnNNskRHkAFYORf6jG+sm+cY7UZBYwreEvf6wG0YAgqrkkTTTH0Na56CpsT1r46M8hL
	 k0GOpAHixwOJf0fjAvx/teUostUDsC4rNhyN2mDOF8O+4QgOgQpY83h9v2rOMM5FzxEa6
	 r2ZJXcJykLUz/lVNzWZ46M4SWoT776a0E8LlUwMAM78AF4NxgOQUrwR41D+8LByGa3lgQ
	 aJuZzJwpqmjCxFwlGT6WcdMIOKhjmG/hZVIT0DNfhu8ZF7PfpxaSuc2O0VnqfjNjXmQq+
	 HrrxIoFZohn7bEShQv/voET/qmRWe3g7wOah/P/iEaKSu4S1R7XosUOUT49PbuUYXdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="crLbjQ2/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D612260774E8
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=crLbjQ2/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800BD1F000C4;
	Mon, 19 Oct 2026 15:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792424409;
	bh=qwGM5xmeEPX+GaVpTSduBVTgYgRIBuVMbExrrgClW+Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=crLbjQ2/0i1E5J+f61nXdnmUhYI8V+mKmbI5ryzsA2PSbcoe+DE5+maPSO6oIdxZo
	 0ZtO+0eub6zceTLEA23QkoGnB4Slk9+YAwkieK3vhRn0Ur6AmZE2vLGy6TgJoFgX59
	 J73Rur9/1ohJaEsTuvkAmWSgpJNY0m2IDfyMChloo6mM/KpzsRM7umMNAwI5t4JMhW
	 adFYTv6l6g1pcxSPNoJRKYSvM7iiA1eDvu3vbAL/wtOfER6Hn1FjcjifmtAivX9o4T
	 70UzRrureUYhoERZCLNmzpPPVFl2arRRyThOTEsSF7G1CbCBIxCNso13EqpbNAhewX
	 hSjxdRn9a5r1w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773963811A71;
	Mon, 19 Oct 2026 15:40:09 +0000 (UTC)
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
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: flush SIT journal during filesystem
 resize
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179242440802.2714099.4838078075531499701.git-patchwork-notify@kernel.org>
Date: Mon, 19 Oct 2026 15:40:08 +0000
References: <20260828141240.2391915-1-qiwenjie@xiaomi.com>
In-Reply-To: <20260828141240.2391915-1-qiwenjie@xiaomi.com>
To: Wenjie Qi <qwjhust@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, daehojeong@google.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 qiwenjie@xiaomi.com, sunqiuyang@huawei.com

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 28 Aug 2026 22:12:39 +0800 you wrote:
> During a filesystem resize, SBI_IS_RESIZEFS prevents new SIT entries
> from being added to the journal and forces existing entries to the SIT
> area. However, f2fs_flush_sit_entries() returns early when there are no
> new dirty sentries, leaving existing journal entries behind.
> 
> After the main area shrinks, a later checkpoint can access a journal
> entry whose segment number is outside the new geometry and trigger
> f2fs_bug_on().
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: flush SIT journal during filesystem resize
    https://git.kernel.org/jaegeuk/f2fs/c/a6ede4054551
  - [f2fs-dev,2/2] f2fs: refresh pinned allocation boundary after resize
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


