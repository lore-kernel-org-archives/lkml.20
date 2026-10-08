Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D736E347C6;
	Thu,  8 Oct 2026 04:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791434836; cv=none; b=MMmzsdctloqGlwn6lE4isYEi9oEzpbSmOLEq6LZOOvYnoZozwaRUxr4XMS4EPjkkhfrAUfvPRbRYCgeB+40A5OQLDDlqSvrcuOmd0z7tc/nMwVbxcRReYTk2ahW7iLp+lwz6YLJfOxS09RyKACYmQcG4fZ1tnbpExZau0X+dNhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791434836; c=relaxed/simple;
	bh=nyc1Dg3hccNvNnseRhUeN5uSGvTiIoCAdq/Q68arMBk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=M1BHJIekfGhT+0/JcZ92GQdphEmoEe6FGdcPlljCMNxxbWXDwAJh3mmNCD5eR2p2/5EXLGkdPC1STYgqSNJhgm+siQrGLxwQ+odCJ7992Y+T1t8qAw/wAglNxjiVdbzZBprHXuvpk0+DnXHfPAnnQffcIrr3GuRp0ODvuHoZjZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIHlcj3q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIHlcj3q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8091D1F00893;
	Thu,  8 Oct 2026 04:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791434835;
	bh=K+V99tD0dAB278UZdrVVbEhFXi9UBbQWSwdIYxhfq3M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=IIHlcj3qVjsUm7oj8dvns9xXQgqD2bQT6b+hNHON0IWGsxjKkZyzOHKwaDEdwGaos
	 npkdtJHw3/v01cjPPFzrOumYM0Yqu5jhnlPXG+5ZLLuKUawW5eSxwUvgTTHrB1pvI4
	 mROFAJCNP/uu1FT89jSFd9VXg3f+P2b5gS2FvjaODfBT2s2CK1654GJA/SRlWjmWxA
	 bkh1z4BCjZ4Iga75ybslYMazM5ZCc3FNfSPHKwfQJ3wQ9MkT07dDwdbvQDc+Boqc5J
	 dFv1e7JDVw1weya93j/59joa5fvDqTlg7ImVaVtryaJgsb91xKjBh6ZQjZ1MyQMr3/
	 BNhIYaIzTl1Ng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773EB3809A13;
	Thu,  8 Oct 2026 04:47:15 +0000 (UTC)
Subject: Re: [GIT RFC PULL] Fix double dereference in TP_printk() in usb mtu3
From: pr-tracker-bot@kernel.org
In-Reply-To: <84064d39-6f44-4b4b-98f8-895a0294a3cf@paulmck-laptop>
References: <84064d39-6f44-4b4b-98f8-895a0294a3cf@paulmck-laptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <84064d39-6f44-4b4b-98f8-895a0294a3cf@paulmck-laptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tags/usb-mtu3.2026.10.06a
X-PR-Tracked-Commit-Id: cfb3293c4573289f11f913611f530ea6b1926d67
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8fc6e594884a65ec99c78ad05e7fae110ad714d9
Message-Id: <179143483406.3815904.5949191380648245003.pr-tracker-bot@kernel.org>
Date: Thu, 08 Oct 2026 04:47:14 +0000
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, Vladimir Murzin <vladimir.murzin@arm.com>, Mark Rutland <mark.rutland@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 7 Oct 2026 13:23:39 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tags/usb-mtu3.2026.10.06a

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8fc6e594884a65ec99c78ad05e7fae110ad714d9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
