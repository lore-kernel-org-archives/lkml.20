Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F15C2F747A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787806261; cv=none; b=Dh+HsAXr13uj9bzX7mwETTmzrzU0oQlpwFz/qD2a6pvuH+W7YefzA7HQGwlKJEKEXnmMjPZaAns0ZP5mrSzOqaRghG/Ep88FaHZUo2X6jvOxYgS8inO+Rgi/1SeArSzwq2azHEZAMXKQGzGQ61qtUX0aRu5Pgi6qqtnCBUwFXs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787806261; c=relaxed/simple;
	bh=RngMslnEsDZt710u/WCDSF3CnM2HgjjDFWd3ijCJbOw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VDTaEjngVIWeLFLeAe+Z3HW7fAKuhZ45F9nc+elA2LzHRiKcfmsh8DORNKsEWSrGwt6esQSpS8ZAlJOI9e2xDlvzh9EZUOItmo7ooyPBrtGuyQXQKH4IJG4e3MowgXvZzMyo4+srD/Ly1sOR9qUCCcYsfCbXxfLCJz2kQEOlEL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lggyxxrh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lggyxxrh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4A31F000E9;
	Thu, 27 Aug 2026 04:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787806259;
	bh=vvGk1crCtauscGk1nFnoBIsLPmCPQOJaGUPNpfjpKGA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=lggyxxrhppmWvXX2pKus0eLv3iaiZMp/rJrGoF8VUFr/yOwbdyEmyGA7ZjR8OU5ws
	 Vei08A6RfvD0siOxg71A/aiaU18JPe/oPCoxQVydkN2WHmHsnbzNLMAtnFaCpM7yYM
	 1QDoy0zuDRRFTnoLDrJSZzzsEDfYCK7sBjiQggWaPQjHrZVZE4EDC6I+BbC7pGjDAy
	 TQW4vBDH7MPVc1knRbjBQyzgqf15OnuYI+UVtoCfo4ui1Te0nHE7cY6xPjfhodReR7
	 NNRek1V7+VNhZ1eTOEuGqLOMcOlSkFpfnZSup36cVEos2tSGXXuRMvGKtUYe4RrWoX
	 dz4fSnqN3r+eA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A173809A09;
	Thu, 27 Aug 2026 04:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: support resizable tail section and
 unify pinned allocation
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <178780620540.1022614.4204248099313944136.git-patchwork-notify@kernel.org>
Date: Thu, 27 Aug 2026 04:50:05 +0000
References: <20260826153644.3726384-1-daeho43@gmail.com>
In-Reply-To: <20260826153644.3726384-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com, daehojeong@google.com

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 26 Aug 2026 08:36:44 -0700 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Currently, zoned block devices restrict pinned file allocations to
> conventional zones at the beginning of the storage (before
> first_seq_zone_segno), triggering range GC when conventional space is
> exhausted.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: support resizable tail section and unify pinned allocation
    https://git.kernel.org/jaegeuk/f2fs/c/c966d29e01bb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


