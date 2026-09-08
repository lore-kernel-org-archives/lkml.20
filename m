Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD91939E6CD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788897669; cv=none; b=W8+FbhAGwTmyQUPnlc7gcnC+VhTmfrTAOvefslq2XoC2wN0bIbfqwOcXa2eOe8p/Sn0I4x433dhe1Mx5olC1tZMuaRcCQlU6cRqo5TkmziUsOw5VK+cgtCDX/6D0wGPZbaIoahuCb3OS9ofxIupuHVRu/3YyElgY7bJuvBLffkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788897669; c=relaxed/simple;
	bh=/dvF7Skzv8vPsCa2LdD4Jkkz22ghIwkl2NtnE7AcCsA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=IH62LWDUuQyUeS4FHCPJ93lE2F85mjR0l3C3U54p7hlnEVz7mIEK2kKiESws6AUwF34Xtz8SOaxPDt+GpZUMGgwg+PLtW3PMOQo8xIC0cWpmf6lTPdee5B5/Iej2FFkVlSW0TeWu82JGGYlw+2Lnwrd11MDNqXYPefL1Mc54Xco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SwasziLr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SwasziLr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B091F00A3A;
	Tue,  8 Sep 2026 20:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788897668;
	bh=weVkAE66PuFA6ueVLI0Xd/LFcQkJbuYpx8zORck9hV0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=SwasziLrkOuMlx81wWsx483cNYNLzF+oZCc9sKNSse/cX4Vx9Cs+ElESNljJRij+n
	 y/OIyhWwQlVYaKUqMfDFAN9Gx8GsfdA7AHx5XcmfcKyaI2XU+d5ya3fjCQFjRoPZDD
	 CfEIrlrCFglzvOgvkvF4J7apH8lB+5/fgoMRZs4UqEhiGL/1+9Sgo1xTXFbIJs5cj0
	 6Nj4P8oQsN2UUExnKkPWWdD5oU8vFItVK5MpXDgMr6WODxkqqzzc6fz6479udQUtzI
	 RZQlpPV8qtpQsX1BzgbdSmrw93iYi0+jd2TVBu9J8rVPXZqgqN9bwwFenuXd7aZMIC
	 0BtKR3WTZIPHQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09A6380820D;
	Tue,  8 Sep 2026 20:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v9 00/11] f2fs: prepare metadata layouts for
 runtime block sizes
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <178889760650.3720652.823497895203817513.git-patchwork-notify@kernel.org>
Date: Tue, 08 Sep 2026 20:00:06 +0000
References: <cover.1788479509.git.zhangxp1998@gmail.com>
In-Reply-To: <cover.1788479509.git.zhangxp1998@gmail.com>
To: Kelvin Zhang <zhangxp1998@gmail.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu,  3 Sep 2026 16:54:16 -0700 you wrote:
> F2FS currently describes several on-disk metadata layouts and filesystem
> geometry values with constants derived from PAGE_SIZE or a fixed 4KB block
> size. This series derives those values from the mounted filesystem's block
> size instead, as preparation for supporting filesystem blocks smaller than
> PAGE_SIZE.
> 
> The patches initialize sb_info early, describe the SIT, NAT, orphan, dentry,
> node, and xattr layouts dynamically, parameterize sector/byte/block
> conversion helpers, and derive node-tree geometry at runtime.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v9,01/11] f2fs: initialize sb_info early in f2fs_fill_super
    https://git.kernel.org/jaegeuk/f2fs/c/425a464e82a1
  - [f2fs-dev,v9,02/11] f2fs: describe SIT block layout dynamically
    https://git.kernel.org/jaegeuk/f2fs/c/b41496b999b3
  - [f2fs-dev,v9,03/11] f2fs: describe NAT block layout dynamically
    https://git.kernel.org/jaegeuk/f2fs/c/4b1fbe38ce5b
  - [f2fs-dev,v9,04/11] f2fs: describe orphan block layout dynamically
    https://git.kernel.org/jaegeuk/f2fs/c/0e346faac20c
  - [f2fs-dev,v9,05/11] f2fs: describe dentry block layout dynamically
    https://git.kernel.org/jaegeuk/f2fs/c/2f5562816fac
  - [f2fs-dev,v9,06/11] f2fs: describe {i, d, id}node block layout dynamically
    https://git.kernel.org/jaegeuk/f2fs/c/49d39bc4b877
  - [f2fs-dev,v9,07/11] f2fs: describe xattr block layout dynamically
    https://git.kernel.org/jaegeuk/f2fs/c/fbf612f85437
  - [f2fs-dev,v9,08/11] f2fs: parameterize sector conversion macros
    https://git.kernel.org/jaegeuk/f2fs/c/87f159c1492f
  - [f2fs-dev,v9,09/11] f2fs: parameterize byte and block conversion macros
    https://git.kernel.org/jaegeuk/f2fs/c/7c8fd5156c90
  - [f2fs-dev,v9,10/11] f2fs: describe node tree geometry dynamically
    https://git.kernel.org/jaegeuk/f2fs/c/a4bfdfc5d3d8
  - [f2fs-dev,v9,11/11] f2fs: parameterize block size and mask macros
    https://git.kernel.org/jaegeuk/f2fs/c/6a0dda6838b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


