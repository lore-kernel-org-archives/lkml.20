Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6537D43C07E;
	Sat,  3 Oct 2026 16:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791044694; cv=none; b=RrBig0RfAQOPLAguvTlc3L7XciKxECUWpaPnyql27LbB79hYIJRPd1vyW06yy8eeitUUGoI9JoqJdAV7lfxGt0xyQWlgQX2Uv0pWGefqUomK7+aGMxEYiWeP32RENzWNFFCvwDr1RanyaqruosmlasJUD8s8HL1/iu7YVDEJyk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791044694; c=relaxed/simple;
	bh=JuYkT8Emc2oEARxEj8bg+JzMp+iyFYK7FM4qg6lr8xs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=lVGAEygK1Hu/stTtn3f4Z//1JrvgDOP0DUswSQkEHa1EzayR1FhbvflQnPNQ4Mpz3gs3LNoVArjeflt1yVTbdXmNURdYPT9hDh0Axy7NmLdBzU04prKDgac36tSQCOv6JLUCCq1Jid8luHX+chNAZu4jqOu8/04DBpN2UuHunkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSfsnJ2r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSfsnJ2r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457501F0089B;
	Sat,  3 Oct 2026 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791044692;
	bh=oGd7D8hJeP6o9k/vcien6VEvBa/8Lsxlnteb9/+YRxw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ZSfsnJ2rrwlFWxF1phxNenBGIPm2VG3FXs7Ql6X/PJ01+Bk3QbclMj9ars5OprVM4
	 InHXiVecxjQX+/q0CQRiy5i+ljtR0EdLr/fD/wDNYL1QERU50Qks8YmNwTv5coeYdo
	 i9pL9BAHeAliSXqslkYl2Fv/+CE9JDoQOkElBhLmLy0fX5dgFqnx+YwvcdSwntuw7X
	 CFzi8RhKTcxv/AdLvQfy0OLZDn/pQbJNEX7NXMDr59aC2ntqkmv2F2wVGL3Cj9AOmF
	 gL3mleDIrydtw6FYAxhg5OgpBePV+g10BW4E9iETG+c00pMUhMQ/Hd/EkNt4snR7db
	 f/74o1IPyuq2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2883924475;
	Sat,  3 Oct 2026 16:24:52 +0000 (UTC)
Subject: Re: [GIT PULL] USB driver fixes for 7.3-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <asDo8cZTIkqu5jfo@kroah.com>
References: <asDo8cZTIkqu5jfo@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <asDo8cZTIkqu5jfo@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.3-rc6
X-PR-Tracked-Commit-Id: a93862fa670a9c99fd9a24fb2ef69e4f948d9bd5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 903e23eda5af2a5491e698838645f84a8f90379b
Message-Id: <179104469082.131116.17315097982313728465.pr-tracker-bot@kernel.org>
Date: Sat, 03 Oct 2026 16:24:50 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 3 Oct 2026 13:37:21 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.3-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/903e23eda5af2a5491e698838645f84a8f90379b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
