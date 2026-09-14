Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1539B48EC89
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399880; cv=none; b=Uu10iv2gZBMxGsL0FsVKybehGzJ2rRWmYGFvMxMUI6jKCgODtuDdhqEmw2g196DlCbW+kB4zYBDQHsD31zHtCdMDZ5CI79GWL4PkdiUfkma/IvB8gyAjIGPQjGGWw1nbWN6kM5Jl8R7vgrMR5GbeXWicL/ThR5AjLQqeoQrxBBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399880; c=relaxed/simple;
	bh=QQhSj5DIvqDSSuR+U6bZg1rzXVeC0LRx84lHkuflY74=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=aLLoiWSJNlRfhECg5Qu9cjc/M7E71NfP0aosPPGbUoeDYhFdpFwcAuaPjFrrpJ5NZAyTlVjGLWrZaWJiZOLC9Jd+2O/PWrmCPBUudlv/7VjwBqwjVE6GyMaMgOIa3VUC12VcXlVT9+w3MDBW9Y3AoxbmAgi3dD53lCuzVI5Or8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lH+o+RSZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lH+o+RSZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB81F1F000FF;
	Mon, 14 Sep 2026 15:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789399879;
	bh=qOTkNlqynpQr0wKRF6ie9yvPhlZ86hsILtCFmgTcBN0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=lH+o+RSZCJCSUbtuSA23oc2VyVjuSxz8KhlwnhjYbV0tk5pBg2044hs8uU/MDk97K
	 JEiBZ/R9ggfncJ5LmIdGXtvoJ0DiJtBj1f4OJLP1VrwkF+wYExtaj8edhZzLHz2X3a
	 9P9XkvxP/bBjzfBR/9901F0KkcNbP4psY1dqdfj7J9Y/HsE0JV01Nm4rIpXs/vxTqs
	 OonhoW8+uCXfSZYSn2n/y1KP4U9s3UCAo4MDdkyJkt2Y/u7r6HhwG2oeswK19T1ICt
	 OEgzYWwKsQ7lNa0lc7INTxamvXq8Q5r2XmP3QK69HJLjl1DKkqS74pvQry4EKQ73M3
	 O8+Sah7eJMPoQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5696A3924A79;
	Mon, 14 Sep 2026 15:30:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: parameterize node helpers and macros
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <178939981388.647967.9712319040788657342.git-patchwork-notify@kernel.org>
Date: Mon, 14 Sep 2026 15:30:13 +0000
References: <20260908100032.3141988-1-chao@kernel.org>
In-Reply-To: <20260908100032.3141988-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue,  8 Sep 2026 18:00:32 +0800 you wrote:
> From: Chao Yu <chao@kernel.org>
> 
> In gang-lookup loops such as last_fsync_dnode(), f2fs_sync_node_pages(),
> and f2fs_fsync_node_pages(), candidate dirty node folios returned by
> filemap_get_folios_tag() are inspected and filtered before acquiring
> their folio locks:
> - IS_DNODE
> - is_cold_node
> - ino_of_node
> - ofs_of_node (called by IS_DNODE)
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: parameterize node helpers and macros
    https://git.kernel.org/jaegeuk/f2fs/c/ea3eea801c5c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


