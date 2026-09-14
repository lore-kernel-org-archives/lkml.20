Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC1448EC7E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399878; cv=none; b=RpxXGF+89R2eQKTDO9yeEV3oHhXcglw2fSrbaeGMcb5MnQOlhIG+xBew7PRoWTgMvnyfUDFGPY5BSSHO2Udh7aWyFQCf55AXYHk5SxCEBUasPFO//+UWkUkqSlmyu8W1d7zUeFHptXIRlozJ4AMbrdd/CSbSfA/p+0ryfe94MsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399878; c=relaxed/simple;
	bh=ZcY8SABgPXkKny6oz5BHftfuclktYgM9jHIQ0TexRls=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=B6oXJucL3rr3imugYThDuUJIHyL/Iyk+BMBB9crI0w82uHxffLmcF7m/NyDmQDgIltLkIogE/t6JHw7TWNewdP9IcL3zGN49S19rWvyPEPdj6/1eZyw85DvN3ALz6GFRXVhRmQAPjFDnnxArx9cUGAur1kgZMv9Eijrv5wcAWlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZZjLU4/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZZjLU4/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4371F000FF;
	Mon, 14 Sep 2026 15:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789399876;
	bh=Re1i4sxxoleOm+ySs5id+c1pqQekipxz63TkYx1a97Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=iZZjLU4/h5KOpGUjbl5lDSX2WJE3orl6Lqu+uEH2s1bJaILl8Fr9dLU/fcLRJ1ioI
	 JONqn4kvX4j9Y5avy2xHVVg9oa+7EywBMxlLefGNrRpRdlTHESO1aXAFh1qVktTB69
	 qU6aE/fmV+oFFkurd3mBJJthRUT3tP7i7W2oSV8rv3Q7mEWVQkVJpq9DNGzGDVPfxi
	 3CqTVZsUx9vx12Ce1Nh7uAHOWqPWJRGbFqftWADOsmxcgVOemZgBUZXw2kqh5k8wrN
	 Gl4ppbGtSnYp5LIQ0KEPTkkvc2ydGm5FcD3aAZP6rqPYioMcYxWk4WHjRFzKpVsq1q
	 /ijvCBQOnWjpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A063924A79;
	Mon, 14 Sep 2026 15:30:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: fix to handle race between
 truncate and writeback
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <178939981087.647967.11998154111003241428.git-patchwork-notify@kernel.org>
Date: Mon, 14 Sep 2026 15:30:10 +0000
References: <20260910141126.1309794-1-chao@kernel.org>
In-Reply-To: <20260910141126.1309794-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, zhiguo.niu@unisoc.com, stable@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 10 Sep 2026 22:11:26 +0800 you wrote:
> From: Chao Yu <chao@kernel.org>
> 
> fsstress reports a kernel BUG in f2fs_truncate_partial_cluster():
> 
> kernel BUG at fs/f2fs/compress.c:1238!
> RIP: 0010:f2fs_truncate_partial_cluster+0x292/0x2a0
> Call Trace:
>  <TASK>
>  f2fs_truncate+0xf6/0x210
>  f2fs_setattr+0x6b7/0x770
>  notify_change+0x33b/0x520
>  do_truncate+0xc2/0xf0
>  vfs_truncate+0x153/0x1d0
>  ksys_truncate+0x78/0xd0
>  __x64_sys_truncate+0x16/0x20
>  do_syscall_64+0xbe/0x540
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: compress: fix to handle race between truncate and writeback
    https://git.kernel.org/jaegeuk/f2fs/c/c0337e331b06

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


