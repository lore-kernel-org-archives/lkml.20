Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595157;
	b=Tw+FZ25lLXL0eJK3TaPy/arHhu4NL+ewzr0z6fNgnmwKRYezGialBy6JU2MdfkMNNAdf
	 UGkC95DfYVEl0fu/by8EWmvHJ9db1w3DnN2FEfHEMlAtZ3DwC3bdMZ8n+HrPMbokYXeY0
	 4LVDgt1she5FLzPnkq9aGkzucaeyx01mWCTp9nIVRe9kqXolZRO7qID/NhHJ0HLiEufgY
	 /1lRa4E/uz8ijwyQwfsXDKJkix7AwYd5RM/AlML5oAFo/iw66z4s9qMjru7Z88Dk/3ZpI
	 EqixlFfRHYqhQSa2oHlpW/tkP+Nwe4UPqYv02kpConxW+9LXcf/uW3KpWg13nwftLpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595157;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=hYDbl4umyRX8oh0AE2DeiWPxBXMm+JRB6zjUrINsNvs=;
	b=IMyATWLfqGP45d1oMlieN7NE0qO6+OblMLlNo2ObRiBn3TK46FdjzanDVNov9zYCaFGu
	 FpwTnUO7ETlBEMyzjq2LDXRYpgEYNwucI6ARrsE0BVLfqsQx63dpwI2UFsKFldaiBL/VU
	 97pmFKqOXXj4YlxSasV1DlemtjoJTgcFdA/MA3IXZjPpf/LFRWAVmEXBA9sFAgX/z08H/
	 +1/2JIhCb1VIiI1GdznOrqRKKncWWM3M8kLI2B27+G3DEfC4Co1CtiHj4jlC4S4jutPbf
	 cdEDh9GuXZkTJSlhrU7jVEi/yVSLyXTmDJq3j1K38r2HkI4ZcmIDiPMxrXGvyzeyV0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OX9FGclq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C57607037E;
	Fri, 13 Nov 2026 18:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OX9FGclq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E911F000C4;
	Fri, 13 Nov 2026 18:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794595157;
	bh=hYDbl4umyRX8oh0AE2DeiWPxBXMm+JRB6zjUrINsNvs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=OX9FGclqUCUTyrwAtzn/gyAZ1p7+jTngdEku5mow/eGIU4WVktlv+LsCcj/kVWA5l
	 NNDiVVcZIvqB7kRzYpKBdYzf8ZJRhvR7L4N4xNR6xR5u2QDu9YjurJQHC8CdBgMSoS
	 FZZSF+s8sv9EJEci68530WkAXzViCyknIu7vcDIBcIfyTXI2um+T0p18IJVmFcY1cj
	 +1xIicX7nLRHgvLgjuoUZ8Z7R1emjJ8eIC5jdQOe40/sZajjraC2EVSBoMwNdqR2v1
	 g9luXCVvn/NTRqUdlvKomqSkUQ72SQx95Sl/c/i5whclEJYxrjleXw4jZKQRAGIN/X
	 F7cNsItlbsmCA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77687392E998;
	Fri, 13 Nov 2026 18:39:17 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 7.4-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <87pkw8pvsi.wl-tiwai@suse.de>
References: <87pkw8pvsi.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87pkw8pvsi.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.4-rc3
X-PR-Tracked-Commit-Id: bca568589ad118a9b0bac086760baee2a41976a5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2800868f63227c8237d70c41e70d441c919620d6
Message-Id: <179459515613.1691752.1951028645356072024.pr-tracker-bot@kernel.org>
Date: Fri, 13 Nov 2026 18:39:16 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 13 Nov 2026 16:59:09 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.4-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2800868f63227c8237d70c41e70d441c919620d6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
