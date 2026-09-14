Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1463D49B1EA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399886; cv=none; b=V2l59BqpELxOVn1tDwxQK5/dTJvW/lHxJu9QDIM7ucp8NPRH5qNTsbLK+6JiI6xqKS8Y/bEwHfr4084XqqAPN8qyKCc1Soe+u04BlPssl2/HPW5MLHgtLCMRyHVw+JK6VmohWPgZm2tQMXCed+FNqqu6OhiqCBnLdkLZUBywpLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399886; c=relaxed/simple;
	bh=mtgNUsfBcJ7HJwIlpE2Rvx4RP9eTIbiX2LcX1LYCu4Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nrZZQHOMw7VPfv1sCqH1gng4tb5c2T7RYlXFm0D4Y+ZqpCAgb03jA/NT7vr+1Ll/yYWxTGcH4h2fBBZHu6hfkc00xh8Od3twylghXnp8HfmwobA0CI0RC/cpXl65KOyv06mLeD/Zv2iwUadGUqZUlsMch5HwfD+S/Siz9Bo3XoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsA9mqB2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsA9mqB2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9171F00898;
	Mon, 14 Sep 2026 15:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789399885;
	bh=Av5rO3xR8J4G3fFOaXx1q8wbgKJL0nYhymS+qYV868c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=LsA9mqB2qYDtJsfotXd4ggdqiVYDq5h1RPJF5zcOB7ZrKET6TLS80zq9baLV/gk0V
	 XmN3BrqRX2KMDWH3KFu88+PWJnt0x9Ai07yq76RT6/ERPkbLFmlDJoLqF2IOCDcwH7
	 U6PGg4fm0YOhf3APqy2rGSZZ53qZw3NhXTS8XRvRBT2HcCihlQHTavBQGEyklE0P9o
	 NEqsZE35TlXAx4XiQ3SwNx9+DkL4PLgPoytMfuTXwFz/z3n+q1UFtGTpVRoJeUnzkJ
	 Wkt+HS2eykvpvFWJu/6L9M0Lduncj7pOUzBmMOlxkYHbvDJXMiYUore38LAgXAxav6
	 EdmTsf2KwgYMg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569733924A79;
	Mon, 14 Sep 2026 15:30:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid folio->mapping dereference
 in
 is_{meta, node}_folio()
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <178939981988.647967.8103343136989536572.git-patchwork-notify@kernel.org>
Date: Mon, 14 Sep 2026 15:30:19 +0000
References: <20260910022026.3301257-1-chao@kernel.org>
In-Reply-To: <20260910022026.3301257-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, zhiguo.niu@unisoc.com, stable@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 10 Sep 2026 02:20:26 +0000 you wrote:
> From: Chao Yu <chao@kernel.org>
> 
> Otherwise, it may cause NULL pointer dereference in race condition:
> 
> Thread A			Thread B
> 				- f2fs_setattr
> 				 - f2fs_truncate
> 				  - f2fs_truncate_blocks
> 			    	   - f2fs_do_truncate_blocks
> 				    - f2fs_truncate_inode_blocks
> 				     - truncate_dnode
> 				      - truncate_node
> 				       - invalidate_mapping_pages
> 				        - folio->mapping = NULL
> - folio_lock
> - is_node_folio
>  - F2FS_F_SB(folio): dereference on folio->mapping
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to avoid folio->mapping dereference in is_{meta, node}_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/b5a71253c5c7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


