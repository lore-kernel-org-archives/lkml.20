Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792543375;
	b=oCKDYT7qz3Ukskw3+XaBSJr7k10chfLP8ahBos/Nao4Fs+OFHrj21dhaSTx+p+gmO6kA
	 HZ7u5yRj0sMUGBwS06eZmew2hxvr8gAraksGA2tpGKeBwh+k192i11t2zTNViWpFnVeCH
	 V5H5g3KvMijp1et2Mwr/pXZmz0nzIaNhALbRoqtwMFhi/yDeZrECP+j4vdyPaEQv+mjls
	 h2g387z3SIW0Gl0IvRUp1PZM2h4b5XZfZ4nPaPLRjg0/OG2Q+Q92WEXvhaOM45bG9uA86
	 mFmPLcufyvYYhe/qbNQsCcEy/Vn+zDH/hynEoipm4yen9vGd14yFOeO/Bop2n6EtZQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543375;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=6MApKKppUroJrGwInpbacI4d6dh9m2fehxTh5QLV/wk=;
	b=KO28F3JIblramCWgIxKGk9Uksj8nunG/U6Fgpi2HAYN1JaihSMJxM6M/ftl+U/j5NdNL
	 Gm85aocBIqTlx5N4S1zcF1N6IgI5SaXce2N9o+/zUcKYCrn93GUoKLuGJttrqRKcMT2wK
	 /Ex4Intc8ZfgQ+wKBaPzEetbHIVduno9rpmJj27haOwK4UgFa6tyC2c+4XUsjGzg8CoXl
	 Lr8mvqz3goIf4sNf2NfyL+CtppXOl18/F2ao/fFBwk8yXxAsnkri4fhDZaAzYlOVJGEz6
	 aw+1jAUKTDCo/kCiZIna8NJt/IVabqF6cag0j2reB8ThaqSEbmPAOuF4GL41LSK+ZCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nH71b1ih;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D0E606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nH71b1ih
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084441F000CC;
	Wed, 21 Oct 2026 00:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792543375;
	bh=6MApKKppUroJrGwInpbacI4d6dh9m2fehxTh5QLV/wk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=nH71b1ihcfAvGqZVm6o2CMqsXFaxhYm1AIvOqFq9gdnLTKxYvFXPmUCCe2ZAgldEP
	 P9Ns/tLa0ng7naKoxzShtaGC0cVdMYmxlYkiCoSslos6nmVJm9nweLATTjUOPFP/2i
	 8ab1WvNeBamb17BGc0INJqvNtQyToFMz7IBoNBk4GNewR2/rLqnDeWjKMjB1ak+sMt
	 r6wD+0ltxDvxr6hsByC9LTgjhstkujOJtfH9qvAdPIvwIJE9WGibe9FzuE4KfIcrbv
	 4osZg8E3kfnmRreSR50rqeeZmo62LnXL/ZWCg8Vx9ayBOoafkTtpC2Rp4CWlpFf0Be
	 nT+Ek1cwIsNiw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F19D33809A0C;
	Wed, 21 Oct 2026 00:42:54 +0000 (UTC)
Subject: Re: [GIT PULL] NIOS2: update for v7.4 part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261019145729.2619867-1-dinguyen@kernel.org>
References: <20261019145729.2619867-1-dinguyen@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261019145729.2619867-1-dinguyen@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/nios2_update_for_v7.4_part_2
X-PR-Tracked-Commit-Id: 2180d11e06fb56fd13643ae59964f144896870be
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ae3af2d105b224e91fd5abefd96af5f9760e1744
Message-Id: <179254337376.294156.6972801222637084036.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 00:42:53 +0000
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: torvalds@linux-foundation.org, dinguyen@kernel.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 19 Oct 2026 09:57:21 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/nios2_update_for_v7.4_part_2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ae3af2d105b224e91fd5abefd96af5f9760e1744

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
