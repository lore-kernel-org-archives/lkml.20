Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793148055;
	b=QEXYWlP6hvccjuDZXG7H7DP3Z3Wu/NDWiC2ARTWe0dx1CHJ/23T8u8mvJVXl87hnNuBk
	 /Q5us8vKj+5WjbPawpVOHM96HA79QvNHk1t2suubc2zKmbz/at1yPO5SKeMCrOYDr/3U9
	 hTDT4RxYJrhWsz615IaeYviebvXftN4M9Sj5vCh9DZXjzJFoShUDvMkF+5M9jZV52Smmm
	 Hb5GL8eXECAT/7kJOxIlIrjcyZQKKPS5IQGLsMJVFtwaKyQZFIGoLVBcZL29UoO5Hv3NW
	 CM9Jb8h2NTZLPCf8BWFOJbKNaZkl5PG96qpRiATRNs4x+uuh38uMHqxNBBTzJ7bFFEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793148055;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ZsT62UrOKu5ehmONQfEamwQ9FD9QNaqPUN74IlzPbT8=;
	b=G7C3U9WQ6nGEiUy0GblrVzbGilbp4MtMZB0fOS6RzR/AYsICJyE/0lACEBqpSUK80KSh
	 QIdDrjr5uKx52tvWceHqWr+Uh4eqqU24ByvKSm2qsaDK8LM1IVQXgJRNTkIbw7aq1p2FM
	 0hY1j6TRSrkURTrdzcsiFb23n1sA5UGA6PrvWUd4amepsRst1K8n/HgpQO9MitBYGKnsn
	 wt1iLajYB7NF+LPM0uVqxok6ujL9oss7/ISdviirXXTMLBHJ//RK9koz40vb4VbexH5hh
	 69xXyC5Y2L79TQgE2Y+fu7EW6Ki7hnQRp6l1sAL+fQ1Ie5OvoDqO6/wy3c6AtMfDlRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nijYtPeM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4D6606A31A;
	Wed, 28 Oct 2026 00:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nijYtPeM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1831F01825;
	Wed, 28 Oct 2026 00:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793148055;
	bh=ZsT62UrOKu5ehmONQfEamwQ9FD9QNaqPUN74IlzPbT8=;
	h=Date:From:To:Cc:Subject;
	b=nijYtPeMwjyzXB1D0/H0bENnltbW+qg6hmDIOg5VP6Wo25pZQCUL8HanRG+mqdbiz
	 TI8thfDPCQx1pJ4GjlxtXH7HlTb6ViZg9W+TjWXmYjGaP6qwe0r5e6yyiU6mH7jfkQ
	 OZY8/rtgclRGRmRzViF8choKMp/wCQ/1ZiM108X4crH1CK+g6kPS1Q9Am6bcBVD3ow
	 JusTwRFwCm+E+tEOfAMPWPx8jN6nYa/rOLFKRiW4dsCuSinTuk/MUXjeLwTXfgKPAL
	 TN3cWaal/TL8jkS4ey5LUcxOxv+5I1nj/JPgqdhgPIJNQySY7Eb3lhqsqiG7bXZ7jF
	 OrC0vTmRYpaVQ==
Date: Wed, 28 Oct 2026 01:40:50 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v7.4] media updates
Message-ID: <20261028014050.3614d83a@foz.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git medi=
a/v7.4-2

For a patch reverting "media: Don't hide I=C2=B2C or SPI drivers by default=
".

Regards,
Mauro

---

The following changes since commit d7e7bca7169873b46e857c025c10f3336c1258d8:

  media: i2c: imx576: Fix line length register (2026-10-09 12:34:05 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tag=
s/media/v7.4-2

for you to fetch changes up to 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005:

  Revert "media: Don't hide I=C2=B2C or SPI drivers by default" (2026-10-27=
 14:16:20 +0100)

----------------------------------------------------------------
[GIT PULL for v7.4] media updates

----------------------------------------------------------------
Sakari Ailus (1):
      Revert "media: Don't hide I=C2=B2C or SPI drivers by default"

 drivers/media/i2c/Kconfig | 11 ++++++++++-
 drivers/media/spi/Kconfig |  4 ++++
 2 files changed, 14 insertions(+), 1 deletion(-)
