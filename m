Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38BC3A1E92
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792315794; cv=none; b=E/Jn1+M4JqZtf0h99Xk3Xb3ddXwI63H4Wz2prrqsRlhKoAA4xGjJqI6I9p5b1LlamNQ4VbzFOxeRfjWFQT2BkzfsjlPU4FNYMf3CMKaH/CF3JNz/7SS3WYlsCDnuUpZHYTnqKhb+fZHH7iZnHqxzpCC8qfxUicMbZwNdKOFbGtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792315794; c=relaxed/simple;
	bh=DFXfdG4cNzesdPXH6zvZ8memRYwwCi0q0PIv9s2ob28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n8O1fyeDuwThnd6LYn4zoA3/KIC/s2lDBHIVrcCJrfX5VZ7pOKw6GCzpDDqwV+wDXJkzWmQ6RUaseDpBBk1M9bhcxyOpRQt+Ss3LXH6aBnFgwIFNMxp4Y9Gg4zLl0ZfuIeWmS2SpfINEmcY+TIaw5gYo/RFLmcpdGmoe6kfAsuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JbWXBBBd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JbWXBBBd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBCD61F000C4;
	Sun, 18 Oct 2026 09:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792315793;
	bh=8V0LbVpFse4hjNlOC/w49ua2OAZngQNrApUr84pJf6g=;
	h=Date:From:To:Cc:Subject;
	b=JbWXBBBdSlOXhHKgBuNrzr3Cy8L5nLVX3rbXVvzjpEzsOcbaZRAKg2zh+gONfm/eI
	 chU3bnb1WXxooooMTsq1o02owHbvygw4+zwN75GPsX3+3iMZeYh65O7Mj6oDDnHmyi
	 gY/UbnQmu3cMUVV+kWAWb39QUQBy3Gq6X3rbJ+qH3XIydzyrvb5snX6g8icBdkJfJh
	 lnRK7VKO0cgUj5V75LYWcv6OCVqBecbYwDiHjQ77xmi5R2np5NCyCqdClqBEHFYnUD
	 gNANfmB5X9EB5TFz2YxQNi0xyOqth3PjKr/J0A2uIVimIAONoVgSEtPh/fgLaUy3i1
	 cX0r+6Xkp9XUQ==
Date: Sun, 18 Oct 2026 11:29:49 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [GIT PULL] x86 fix
Message-ID: <atSRjVcnu7ltxwdZ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest x86/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-10-18

for you to fetch changes up to 4505a262deae7df06e33617dfc104d5541eec91d:

x86 fix:

 - Fix kCFI decoding bug on CONFIG_FINEIBT=y kernels running in
   kCFI mode (Kees Cook)

 Thanks,

	Ingo

------------------>
Kees Cook (1):
      x86/kcfi: Decode the kCFI check from the trap address


 arch/x86/kernel/cfi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
