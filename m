Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C560B45FFD0;
	Wed, 26 Aug 2026 16:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761395; cv=none; b=kJPOImIm90kO4VXrwUJEAAi5gTGHBYfCusCr3NA8c85hQFdJpkIa9MLRHObxaBbKoCbgyNYXEuzhnoNzpOGHXGyWSF6A1rkbMSTerYxEdVjT/XT7f9itwFhetKQvZyfKGDCRtljIVK3MsZOYpWNoY5/NEqKwQkpHtiiihdz0GQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761395; c=relaxed/simple;
	bh=0kRUQaAkfyjVa4m9iKPJWuafjyDKdAN3URxxc/EvIrU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U5g4wymmrRg1VklFJaizkv36Se/uicgc4wOJtQmy2TUvPsOQZc2977ASUMKcSF1jyL958vs+hjW172Ch6ZKSpRcCPb92ELlhqMYTZxYT4Rx+2YlpiKUh+6ELq9klZehXwnvGvJd+xVKI1i3Cw0+PfNYsnEre5oQfvnjmXWH9KAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=V/4jl8av; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="V/4jl8av"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EBD65408DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1787761387; bh=WOOtGfVPOhJ14xleDyOFuhJfnq7wrWMzXBq2zA3Gjts=;
	h=From:To:Cc:Subject:Date:From;
	b=V/4jl8avFgq4h73uYB488D0OZklsx5qtimdz2NQJ18rMIoilu697zbgZ2zSDlAYST
	 tGeZIBTdmf/OLIy/Dvl32+WusxWl7b4BDH9wE84ON/nzW5HVuYuO3W2P9SSs7PvSnJ
	 qRdTAvKkdQAmpMk9cYLsEiZvv+zFVrNBPDyoGdYrEYrTqNnSFJ4CnGO2kmdjgT1TL5
	 n050iVrNs2WQgtY8wo/QA00mc0+ea3TrNqb3NX4JrQdQkLoPn0VPauLrU9pRHhlo1k
	 9omNRH3WQeVdJq3iH2zL64LbBeVuRCyTbGBo+Yp0cXfEd5Ud4cvtvepF2zlTowsNUH
	 RTNuZah+CnHlw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EBD65408DA;
	Wed, 26 Aug 2026 16:23:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [GIT PULL] Documentation stragglers for 7.3
Date: Wed, 26 Aug 2026 10:23:05 -0600
Message-ID: <877blcsvfa.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 791e420360669d55b7f90ca0c6d61b10e4992aec:

  Doc: admin-guide: pm: Remove unnecessary backticks and fix a spell (2026-08-14 12:36:43 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.3-2

for you to fetch changes up to 94509f50d696bff745fe26457ce421cea8525bee:

  docs: panic: Disclaimer about console verbosity when using panic_print with pstore (2026-08-24 11:12:29 -0600)

----------------------------------------------------------------
A handful of late-arriving fixes, a Japanese translation that was ready
long ago but fell through the cracks, and an update to the Italian
translations.

----------------------------------------------------------------
Akiyoshi Kurita (1):
      docs/ja_JP: translate submitting-patches.rst (tag usage)

Federico Vaga (1):
      doc:it_IT: align Italian documentation in process

Guilherme G. Piccoli (1):
      docs: panic: Disclaimer about console verbosity when using panic_print with pstore

Jenson Johnathon Reggentin (1):
      docs: block: fix dead http link in blk-mq.rst

Johan Hovold (1):
      docs: threat-model: fix /dev/kmsg reference

Randy Dunlap (1):
      docs: kernel-parameters: add CPU_FREQ, CPU_IDLE build options

 Documentation/admin-guide/kernel-parameters.txt    |  21 +-
 Documentation/block/blk-mq.rst                     |   2 +-
 Documentation/process/threat-model.rst             |   2 +-
 .../translations/it_IT/process/1.Intro.rst         |  14 +-
 .../translations/it_IT/process/2.Process.rst       |  59 +++---
 .../translations/it_IT/process/5.Posting.rst       |  34 +++-
 .../it_IT/process/7.AdvancedTopics.rst             |   2 +-
 .../translations/it_IT/process/adding-syscalls.rst |  94 +++++++++
 .../translations/it_IT/process/coding-style.rst    |  33 ++--
 .../translations/it_IT/process/deprecated.rst      |  85 ++++++--
 .../translations/it_IT/process/email-clients.rst   |   9 +-
 Documentation/translations/it_IT/process/index.rst |   8 +
 .../translations/it_IT/process/license-rules.rst   |  16 +-
 .../it_IT/process/maintainer-handbooks.rst         |  15 +-
 .../it_IT/process/maintainer-pgp-guide.rst         | 172 +++++++++--------
 .../translations/it_IT/process/maintainers.rst     |   2 +
 .../it_IT/process/programming-language.rst         |   6 +-
 .../it_IT/process/submit-checklist.rst             |   9 +-
 .../it_IT/process/submitting-patches.rst           | 214 ++++++++++++++-------
 .../ja_JP/process/submitting-patches.rst           |  94 +++++++++
 20 files changed, 635 insertions(+), 256 deletions(-)
