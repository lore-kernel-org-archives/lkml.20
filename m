Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E375D40DFC8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936100; cv=none; b=o5tDsa7HCChbUKZsNGvsDGCKbHzRv4XM3MIVHnsc2EtD9GWHx5rI1SHm66Gr547I/g9Cf7p13dTDSBqjyaK/SGFoK8xqft/xz5kbaVC54iC2NwEshtL5WbyQGoG/0d9wYbkW6wd9J8l2XtRZ55vgDSzhbwZyPQF3a82tS+ZaZKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936100; c=relaxed/simple;
	bh=rEOepemNcU6u5hjFXqSABguTOfEnpY3JnWL7gWoBvTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V1JvVVKAjJTYyU2NUbSMbUeoB/ZiMwscsC8b5V94f9vuQ2hRZJFOX0tg8ysNqmV3rgVtmpRDNA5v3sQS7sGC8HXZTJFXkP2ZkIsuG0WiPnzj/AMkQPkD1Lr/k9eoTxRbSLuY4HEbpEk58bc9VMJ1/O9J86Qq4iBa6m0XIeUbLzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEx3aOGP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEx3aOGP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A3D1F000FF;
	Fri,  2 Oct 2026 10:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790936099;
	bh=PwscZ2qr+G2s5tHNK7DN8jEnoXweNhhut85QsH75IYY=;
	h=From:To:Cc:Subject:Date;
	b=mEx3aOGPNZBPxwv1qfQxqD/kVT4JWDKcrY4ArzqF6XYNAu0527+KAhKUG+HhY36vX
	 WoH63Bw5wbMNubBoYvmrOsrJMOCbJS2gvF/S5ENYG0PFWcSP3Q2w+XFEigosrsCIyY
	 +3xwcs/J+Kltbfg0+T9RlD6JMuBXEGLxEyr2vYBjDgtsym1F5vshWLmSHqjM0Ie4N+
	 6nANzNJMV+Qc0iYmdpjd1/MicDQfYAdmI0ERnjXvWD7KZVRI3Xx/wcvxKXEnk+IGMG
	 QjBXiPHo+xWLnoGo5hFKhA/qsOmuIw2tloEhB4PEEnGzSHvYMdIJ/xSz28d4EyVsv3
	 1ER1CRS+Aq0cw==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 0/1] slimbus: fixes for 7.3
Date: Fri,  2 Oct 2026 11:14:47 +0100
Message-ID: <20261002101448.1084691-1-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srini@kernel.org>

Hi Greg,

Here is a slimbus fix for 7.3, Could you please queue
this for 7.3.

Patches include
	- messaging: fix leaked PM vote when slim_alloc_txn_tid()
	  fails in slim_do_transfer()

Thanks,
Srini

Zongmin Zhou (1):
  slimbus: messaging: fix leaked PM vote on tid allocation failure

 drivers/slimbus/messaging.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.53.0

