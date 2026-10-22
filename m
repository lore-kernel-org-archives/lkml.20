Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691378;
	b=TGpg3JqFKcj1jqwYhO57hUp7E7wipeO2hskxXTUkW7Cgbe+m01mtLFzeqRarGfTGblfj
	 RXzoOTeneSCSpwWpWzjys+fOX9IP59Zsn5R6lX/9El2oQTQK+zeOXUzE5qL3wWW4Pt1FB
	 I9+O1KAs8I6LbN7tC4AgEzQqD8z53PtJzadxCMEafMWblPV1BZb92E2iAEp+SAk1AJjAU
	 XKH2YpSiK+sM2aqX89yNv65Rgr5vHPOnd8ZsucBA++ljwZvsJnTa9w0a4jpD3z8q+HCoI
	 KBNmQSBj+7RsWhGC7SZxW+laihoX4XpaXiskQmGmgEYBGkFskJUyheGEI0eShr7eN7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691378;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=AwIS1i3ffZKVAhd7LsOceqlLuxbwFIFXGY5DCgZ5zaY=;
	b=ZUdYCTB49LaScwCyjI9P6Wn4tU/i9w0unV3GVC0OMeF9EqJanotDMepwSGW4NDMPE5qd
	 3L7036/9dSZBw/JFnShgKRwbMIDy0h2uPvxIYmRB3Mk/2VEgjG/Cm7N0PTGb1B/vWk1Jf
	 NWlfwFA+DoBB5yiru+XCtc2aMWue5BUMbog+YXoF56r1F7wJfnj62B1MrvbunE3bic2u0
	 UlxllnhpBurczeNrnIE/5UU5wHhMX/SLeaMuxbBmIbXurMY/Z9i+hX4l9DN5cYS5kzNHY
	 okbfO26zBzW7YO0J0Ta6ocbT8jjc4Q5DvKGAzAzDAQufBdxKY6Jf19XfgbY2+c3KGPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MEirMU9S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F825606A324
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MEirMU9S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C9EC1F031E9;
	Thu, 22 Oct 2026 17:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792691378;
	bh=AwIS1i3ffZKVAhd7LsOceqlLuxbwFIFXGY5DCgZ5zaY=;
	h=Date:From:To:Cc:Subject;
	b=MEirMU9SAyjAAKvjexPnSDEoBzdMYwuZ5/wHDN/4lnYpBpJMWCD1pMCmAhraymlmI
	 KHNretVB+c+J6SVMce4K9EUhHES+0jreVxoMNC0fWNVdphUFs5vrg4lnzcgBAHb/fU
	 v1kK+G3W+PRuANK0+x967EWhttpas0xBXrWYldy9V5almuEStni2neLSAoB3BVprbp
	 pPybgoInRt5cObvpNvaXilc3R/iRBbEv8ZUpZ1cJogV2XIveeKVUF3gEfeaC2ovxLI
	 80n5IqMGlYaYpzZ0vQb7nQ4NkqGmlGz1FA7dY2u8fwKfulhw8F6HTILg34VU0yph1i
	 SR+vJ9aXyh2QA==
Date: Thu, 22 Oct 2026 10:49:37 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Andrea Parri <parri.andrea@gmail.com>,
	Jaidev Shastri <jaidevshastri@vt.edu>, Kees Cook <kees@kernel.org>
Subject: [GIT PULL] pstore updates for v7.4-rc1
Message-ID: <202610221048.DB2F64A17@keescook>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull these pstore updates for v7.4-rc1. They're mainly fixes for
error handling and corner cases.

Thanks!

-Kees

The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/pstore-v7.4-rc1

for you to fetch changes up to 7c756181175d50200be487affa905e973f6cbaf5:

  pstore: publish big_oops_buf after max_compressed_size (2026-09-21 20:55:04 -0700)

----------------------------------------------------------------
pstore updates for v7.4-rc1

- don't leave an ERR_PTR in the ramoops zone pointer (Andrea Parri)

- reject persistent RAM zones too small for the buffer header (Andrea Parri)

- publish big_oops_buf after max_compressed_size (Jaidev Shastri)

----------------------------------------------------------------
Andrea Parri (2):
      pstore: don't leave an ERR_PTR in the ramoops zone pointer
      pstore: reject persistent RAM zones too small for the buffer header

Jaidev Shastri (1):
      pstore: publish big_oops_buf after max_compressed_size

 fs/pstore/platform.c | 12 +++++++++---
 fs/pstore/ram.c      |  1 +
 fs/pstore/ram_core.c |  6 ++++++
 3 files changed, 16 insertions(+), 3 deletions(-)

-- 
Kees Cook
