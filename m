Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA7D4E7814
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742656; cv=none; b=nz54K26L6D/ekBpqA1iLikOEF/Ghj62dQoI2DnGgug2dM51ixJQg/xQTXdlbOE4PvRX42X2FvtPDBXxRe4qgOYfKY1llKXTn8hUvU4sP6HMeQtMAp1AfQXix4v3Mpu1sOzKJNVnzbbkKTj+iJLiEgrK89bJ6fVpsvenxyFdEQzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742656; c=relaxed/simple;
	bh=KTwqKeLIYwxZ+sohGCgPejmgR+CqFMYSDXsLVWF+Gqg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=szrtj7b9RMHhDwJ0silbheZn1/h01be/ZkKe0l4JAdZAE2kiIxoP7A0ec0e6yxpS1pILREQs0pPiDZSnwCPJVd1HpMorfstn1mVA59TwriP9onK5AJdNX2WTxVQiuJSw2H36pzqXx5zPVpQwrhbp2lSa/t7NfjKGQ2ip58mAHzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RwCF55xb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RwCF55xb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7761F000FF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789742654;
	bh=Wk3X+OTXHp46ZG2etNnzA1BIX08tmGA1s+Ws23Gpz8g=;
	h=From:Date:Subject:To:Cc;
	b=RwCF55xbQ4kHxmWO9OoXzUx/6Z5dQythwqazCS6KV7Cq9so0myj5HWgMxYgUUB4rz
	 XIlaI1i7POwfrpxauIViwzV7KjcOf6UBIkELfXcu1cAEebcN68kkFOr/9MIzILs8k/
	 e5mD7VzC+vuOPVNaMIyRhggIfkj9Vp2xu6TqicpOzeaCeyBKbdreNs+g82EvD9kI5n
	 /hd+x2Fx1lfY4OEMlnkSnWHLMEf0oP2V/gzat1Iwjj0HjWXwPC7BIoLjmskn96yDCq
	 QUO2cihkxq23hepEaSqfJP4e9NGnK3JHSPafK1ssTdIkVLT3tmnkW0K0i4apUhrx+J
	 rZuslhvTZMCmQ==
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a98604f6b4so1116751a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:44:14 -0700 (PDT)
X-Gm-Message-State: AFuF++klxucI8hMYn3xjorFB5XIXLqg9r3yo7kw2/e1qbvNqeMZmOMer
	aXCnZ98q5qDmYPuFvOGVlaITRTjUjVCXDx41AYBBJ1J30gh1YkMPKGd4Q9Gr6gE907iSJYjwLaH
	hBvzjpLgZiAKaVt4LcdymmEqEBK9gzc8=
X-Received: by 2002:a05:6402:4496:b0:6a9:aff5:c6d3 with SMTP id
 4fb4d7f45d1cf-6aa5797a266mr1784473a12.34.1789742653175; Fri, 18 Sep 2026
 07:44:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 18 Sep 2026 23:44:00 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9JO_5Rr-09YbFKdxr6jARFDgqK8+hd5JP83_PB9TZssw@mail.gmail.com>
X-Gm-Features: AcwNN1W_QoFcpUh999uiMpPSY9tl6k8ivmsu0AEtuHyUpcU2TqPfnHwtWQBzf5k
Message-ID: <CAKYAXd9JO_5Rr-09YbFKdxr6jARFDgqK8+hd5JP83_PB9TZssw@mail.gmail.com>
Subject: [GIT PULL] ksmbd server fixes for 7.3-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

This is ksmbd server fixes pull request for v7.3-rc4. I add a description of
this pull request below. Please pull ksmbd with following ones.

Thanks!

The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/smb.git
tags/ksmbd-for-7.3-rc4

for you to fetch changes up to 9fa26285ae70ac2d3d1b47459a6b4463ab053e1c:

  ksmbd: keep compound responses on query info errors (2026-09-15
22:28:52 +0900)

----------------------------------------------------------------
 - Fix session expiration so that valid sessions are no longer removed
   after ten seconds of inactivity when a new session setup request is
   received. Sessions now expire only after credential expiration, while
   stale unauthenticated sessions are cleaned up after a 45-second timeout.

 - Keep earlier responses in compound requests when Query Info fails
   because the output buffer is too small. The error response is appended
   without truncating preceding responses.

 - Return STATUS_BUFFER_OVERFLOW for partial
   FILE_NORMALIZED_NAME_INFORMATION responses instead of incorrectly
   returning STATUS_INFO_LENGTH_MISMATCH.

----------------------------------------------------------------
Namjae Jeon (3):
      ksmbd: follow SMB2 session expiration semantics
      ksmbd: fix partial normalized name responses
      ksmbd: keep compound responses on query info errors

 fs/smb/server/connection.c        |  72 ++++++++++++++++++++++
 fs/smb/server/connection.h        |   3 +
 fs/smb/server/mgmt/user_session.c | 124 +++++++++++++++++++++++++++++++++++---
 fs/smb/server/mgmt/user_session.h |   8 ++-
 fs/smb/server/proc.c              |   2 +
 fs/smb/server/server.c            |   2 +-
 fs/smb/server/smb2pdu.c           |  71 ++++++++++++----------
 fs/smb/server/smb2pdu.h           |   3 +-
 fs/smb/server/stats.h             |   1 +
 9 files changed, 243 insertions(+), 43 deletions(-)
