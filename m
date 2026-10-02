Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76135361DCB
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 05:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790918798; cv=none; b=Qa7G+pnG1yO2fai7A5IvzOWKWJmesMHLFBIiMWyvBph5D17H2AfJSdRPTfm4cwBZgKGiE7ys5kgmX5l/9LTCzK1os+3EHUKkktQ2T8HXE4Njzl9V7/9TpsJJTOiRi3HePrKU/HXcD4Y5BmxJjQ5shqKrSzxikaqtMHbxbw6fwF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790918798; c=relaxed/simple;
	bh=w0LXtbSWOXzGc1Kg5rybGtKsBK1WeD6W7nEAD61Xakw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DTW98sKQn6Dkdx8Tl/z0MCiVsZ7cmj4EvZVKa5dmg/DphcK6wDzvn3PEkelwPVphVVbxKXBC0CDECI6QN05YFedPmGjK2nHwPDrK4YIuIZZXeSMzhSS4KqnbjZ58DARA7oXentfQIRM9qCdRwdE2bHcdkYrdco/Gekl/2FnC0as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Lld0KRP2; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Lld0KRP2"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 509AC40E03BE;
	Fri,  2 Oct 2026 05:26:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qMfPHPZ5DK2f; Fri,  2 Oct 2026 05:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790918784; bh=LYQHhTY1gIGq3mrxOxu3frqmQh0d4r1dhLXf3UmjL3I=;
	h=Date:From:To:Cc:Subject:From;
	b=Lld0KRP2bd+HRsMg23mfVFiYjvnkCaA904nMpI9Szt0RLAHNKawePR3bnT9UVDIsl
	 DjVeKRbXPiA7heW2fbM1mthR9zDHEl3uvdpILnU3ZbqGwdcqr/7NanZ5DoBncx7ENk
	 ZeG8A9IKPnbwNB+DY2o0HGK52ofLWZ5y2pE8QvhelmdCKxGf/czSTjqn504TZLqdX6
	 9EMvq+sXQn4WekfwRTnh2ZQVNw04UI/dvIn4eVxQmcLafQUxhIZh2iXT1onoD9h3rJ
	 MCKRPLr15+a05HqQ5JdFZn+vp4iMGiFIfVHBRJYz46RXsNoTehm7rPa18k7IiilVyg
	 m2aVoFORpmjM9JlOyHBDV/64DV+jb24Gl9byUk7PxQm/nRxxkgzXehHdZq8M1ZI9OZ
	 8Y1rgEkO8XO8HZjbGdw09KnjMl9Bnou12zkZ3AwQOIi9RVwekw8KBwOHYJjWDjBe/E
	 Ano6AFDOMO0AMzOr5scpYKkgDhYdrpZEdtD+iYUKk2kZYa2Q1X/eVao8LKfcU5VVDW
	 MuRlgj1T501QjA5Ls5Mux2ogimQWfxNYfolPjQcfHfcM6nYrzhunx3U1AGcIVpMuOS
	 2gSnp3HV0FbPIICBZy5l/qPqaCHjuVNOlvfzM8+ar8Q8uJCeCFjcIHGc+9RKWM2BmG
	 JDH4T+GguEycfXVkzsR2cEsw=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AA99840E01CD;
	Fri,  2 Oct 2026 05:26:19 +0000 (UTC)
Date: Thu, 1 Oct 2026 22:26:16 -0700
From: Borislav Petkov <bp@alien8.de>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: x86-ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: drivers/media/cec/core/cec.o: error: objtool:
 cec_received_msg_ts+0xacb: ignoring unreachables due to jump table quirk
Message-ID: <20261002052616.GAar9AeK8zhwN9Wm5p@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Yo,

looking at

eeff7ac61526 ("objtool: Warn when disabling unreachable warnings")

I figure I should report this thing in $Subject.

gcc is (Debian 15.3.0-1) 15.3.0 and interestingly, the thing that triggers it
is disabling

CONFIG_MITIGATION_RETPOLINE

Holler if you need some more info.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
