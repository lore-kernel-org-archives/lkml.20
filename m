Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042413;
	b=v5ZRzSyaKwtDrCEFXb5zfRxsz+gxA1mgUQge1VhKTTQfJorSTHRmxNgIRj7N47zK1Rma
	 PT/T5cksgtU03qx2kIp/EGI064PqKKiB0TCiGTNMSgeZdTixOtm/MWXrvWso1AV8/2278
	 Vfa8f8oKp9ELtPWfMl5KvMwyJCbwa8aGdAJO2vClwfV80G86U0NO4uwQX0XM8LdmaSSw+
	 kxbP3WVAxS+cgN2bmta4OQ6GLSQxnN/c1XeEy7Z6CnRvCde3pfAkUTyvN92K2d1VCNtty
	 eONSHb3149Czb+Jf7PdCTPVpZYiipCiFX+fYtnzULWqRNsfLQliDD5XbvngH8s8ljgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042413;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Vyq1byAebPUDAG7/uJneDV3HWz5FYipaVUHy+CCCkeU=;
	b=pCZ0DBnYyA4gX+WzHWcaKdt30Mc4KC51m9nCcLyp3wOOrGRfAnFgFEqcUyIZSvy/PU5F
	 de/gVvy7GOavdo2T9X4v/Pg8kgy9bX4acC3WRb3+frrEKPHA5Fitlw6yQ3B9NLrwZlzmy
	 NiIYsS6E0wOfp8YNtrSllQtm6L+B5FhD5brjYjzNe5CMKOXxZVY9Wk0Mvb6dEyBy8/9Gp
	 QUW9T/mDfsS+iESbHJ6Pj8wdPCFBjRGVn0VoXSzdyopeNGpyDijPCpyWFMryuwJSnPIT+
	 lO+8vI5ru+Z0jvUHrXlDlsLP9SfFmSfV87Ny7/TYwpvziXWIyB0JNoEfj4TLbfZhd5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f54+hHpO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CE7606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f54+hHpO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914DA1F01825;
	Mon, 26 Oct 2026 19:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793042412;
	bh=Vyq1byAebPUDAG7/uJneDV3HWz5FYipaVUHy+CCCkeU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=f54+hHpOFlUJXUIIgA6fjZzKIjjMZJyALmlbAnTGR7Cqdp2he/HwuRT+r6njghf5p
	 GAKA65iiyfLuyMDBQsFeaaCHjHx6tWsmfGag1RNkTNToz1jeRk1SdkIInIgdDucrn7
	 UjLJIl/HufyCUmO6gjJWQnY58BYjDSHod69bM4YTj6a/WJAZ0jqppTUcbpLiU56w8r
	 1xXFqLYp2QulS8WdA8Xcu2++bVSNzjYRTnAHXzSKwhSBEWN2a+XbslPOOCQqe4ZWWF
	 PLzBG1dbdbwv+NBrNhgrCDtaxGpWks6qFDd4IQwl9GaRSBMNptiNW4rp8zJmSO2+Bz
	 836lFJU5dZN5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 816EB3AA80D8;
	Mon, 26 Oct 2026 19:20:12 +0000 (UTC)
Subject: Re: [GIT PULL] MFD for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261026151904.GC2195460@google.com>
References: <20261026151904.GC2195460@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261026151904.GC2195460@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git mfd-next-7.4
X-PR-Tracked-Commit-Id: c8132247fe4df52e9982d74c986bb199d792b85b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d857e1f3faf998f2614dcdb52a90a27bc83bd71d
Message-Id: <179304241111.3342836.14956831736905267580.pr-tracker-bot@kernel.org>
Date: Mon, 26 Oct 2026 19:20:11 +0000
To: Lee Jones <lee@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 26 Oct 2026 15:19:04 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git mfd-next-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d857e1f3faf998f2614dcdb52a90a27bc83bd71d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
