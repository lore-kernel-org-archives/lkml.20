Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424413;
	b=p28TA0YqDFzdoUcps5rxeJ/y4yrPmu+AH13XugLcvmtVRWfcUIg0gQaQpOLIu8ClmjI2
	 LJZjR0NoqWSofPyv7yTJNrGU2r99ktwMbFnb8YC27PXeN3HguuwpWmD8P2xCMjyDewWPE
	 FdWC8PKBWza3Z4n6PCca/zwhjHxechzr8eFI4pnjf7qTVcAXdORc5rO2TRmJNjH4x+BbQ
	 DUFCsl4KZmZHCMx5DzWWlzZpGxPZaCmWMJd2tFkb5Js4IZKUz8qCx07rCS2a9Yuadpq/a
	 703fuZKgfr/XAMCt0at0KLNx95s+/XAaN4Q5sy+LYqkRpV5+nJBu8+9qp4EndQCYEIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424413;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=ci68KtTSQTCl4pbfvwKLg1OkLhRNMIEHq1Jt8ehNTxo=;
	b=drmqNs5JcuQ8MnRlWiAfTYs35RFwErrlTZ048swS93L3qqAGvWYbp4QDIDGs4VottqrR
	 LYZ+DRIq6vZjL2p/2Bny+vNVt11pS/mGs+VbiM9P7+HTuhho7etWW+Qv4/ihHl5Qm0Y7r
	 1tP8sT477q6RuULXFVbk+CAtmg6ZAqdCxQh6wbQOBTE2p6SSGyJbZAiWpi8huHwbeQLin
	 VMCROW1F3Nq/hK8P50BQn1prVYCfIolWSwmUgYuVKmiTK24PR7+vKbH7mhVMdh1sj5Qwq
	 ZFxLXj2uqHszy/e83hoHKiOb1mEPzG0X1gItfnTf8YtXogMkj+mjSMhPACMOKj1yrog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GkONaV4H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF19E607DC56
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GkONaV4H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8428C1F000CB;
	Mon, 19 Oct 2026 15:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792424412;
	bh=ci68KtTSQTCl4pbfvwKLg1OkLhRNMIEHq1Jt8ehNTxo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=GkONaV4HRj8e4w3XbHTPLKmyvsviiS7aCu3NNC0DfdaN7+IJMrsTQG6M3XnflUFVe
	 ll1qY4GGT8sjT4DkcJDY6l6HSCz+C2BdNOw/TJ8c2VxXCNi9r2smBYZAkplUfbaPXc
	 7HEWWUC7R5hZm/CIe0qa88eyQDjaZ0ta30zyHnK6t9M4aTJF3TJxErSa20daSknFET
	 S06VW3S+ZP1dBVhcOxqwI6RUupWtfpIZjlZSTT9BxPhAOKtViG/62nvNmY0wjsnD5w
	 XOtJZussZOpV5HezZDeOdutJ7+4iFb/qX3Kgo/LpJNm4IJI00ZE5ICxRjyBLX1WPll
	 EcKpeKpORF5eQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7741A3811A71;
	Mon, 19 Oct 2026 15:40:12 +0000 (UTC)
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
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't use truncate_inode_pages_final()
 on
 live inodes
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179242441102.2714099.12259742398143364059.git-patchwork-notify@kernel.org>
Date: Mon, 19 Oct 2026 15:40:11 +0000
References: <20261015161714.1586334-1-daeho43@gmail.com>
In-Reply-To: <20261015161714.1586334-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com, daehojeong@google.com

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 15 Oct 2026 16:17:14 +0000 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> truncate_inode_pages_final() is meant to be called from ->evict_inode.
> It sets AS_EXITING on the mapping, and nothing ever clears it, to tell
> the VM that the inode is going away.
> 
> f2fs calls it in two places where the inode stays live:
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: don't use truncate_inode_pages_final() on live inodes
    https://git.kernel.org/jaegeuk/f2fs/c/256d5e27eda8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


