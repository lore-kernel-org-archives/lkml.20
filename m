Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843292;
	b=l8GLkXJMdr3IDPykx6BN03bu0L/n4KCXvEYydbcxXr0mxfPSoafS9QJbIaQA9pAe++6B
	 71/XlmUKCZLmRqzEIK35kseLRR1/VXWqwCYnHTB3ZdSspSvqj6qXf+DlLHYYbRuJknoeX
	 X2I+4wz+/3GGSguILRG78rYQWRr8SqSnSKsQlpk46OI+3xNaJ1v5jhbbHLEYDau3muZMg
	 Qr6b5BD4oiU0hDtHzsM3ypi0Zz9HBaH2MTwhumFenS+Gpj2kWsoNthK91Liy+MhfvZMcz
	 X4Wo01+3O53FCYV1ljU/1L7r5Fd5LnL5xR3icKgb+VgBAstpIzoPrQJrWKMUzb3cWjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843292;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8b/gLKGLdfWANirP9jy5FELFzBRnBugqMgAUNt34O4c=;
	b=ruyxO+/+5Omugp28rKtta12w6a6xbvHADIrLfLFZSIn26kwrepHuKcWnrWAD6bEVHBDN
	 rL+qnTzd0C5frLgxw/K2R6f7qNAl5Zwomaza+29uhCrRkL8sPwUF3F6sD9IZcb09QBrg0
	 w5EkNZi1Ln1hQwTLi7eIPtTamCTl2pVj8Rse2+YyjsBQq3WeuhYY9TA2chnFGNP5+VoTz
	 GBNXvo59bZZVaz+PpdSmudVmEMvD+Y2u1N1fX1UgZj3Lg5PtbmlV0xjyY0QAr/P2/VT7E
	 D2wyjljqbg18reAqUD3mQ2GC0fVwViUgFKAsU7DQFsAIhPvlzgqSw0U/cUmf8WrBaqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Liukoc7j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89059606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Liukoc7j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85881F000C4;
	Mon, 16 Nov 2026 15:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794843292;
	bh=8b/gLKGLdfWANirP9jy5FELFzBRnBugqMgAUNt34O4c=;
	h=From:To:Cc:Subject:Date;
	b=Liukoc7jJqjxJAwnauywHWc4OfP02nCzUzhmrPm1LgCmtDuv8Q1NXwlntkOivQrNl
	 Q0y0YpasalIqboa8yPU23ef287kkPMTwGS2AKL98Mrv6iztMPR7grSPrEtD+GElxT/
	 k+xtjKTp/6nXcgSQMTERdj8B4EW6xP2UzCAGLwRJPbVgBhqq/mw/FN9n3udxWtvdQA
	 tcb7W/5fRalxm9l3QOvTi6no4S8VipSA1ZzRlhm7cKxsPgdXtCEMBq6UyydHafh8+c
	 OYOKnbWIg3tnecw3XKnrtaZ61upgrcmrgtQeaEmkr0PIBgT6Dll45M2WRylaNkzSgr
	 oP6wU0kV2AiPw==
From: Dinh Nguyen <dinguyen@kernel.org>
To: gregkh@linuxfoundation.org
Cc: dinguyen@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] firmware: stratix10-svc: fix for v7.4
Date: Mon, 16 Nov 2026 09:34:50 -0600
Message-ID: <20261116153450.3073467-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/svc_fix_for_v7.4

for you to fetch changes up to 4b00d3b2f84324af9732d663cf0d228a074a37b1:

  firmware: stratix10-svc: Use proper atomic to fix possible double free (2026-11-09 11:27:02 -0600)

----------------------------------------------------------------
firmware: stratix10-svc: fixes for v7.4
- Remove separate atomic_dec() and atomic_read() into
  atomic_dec_and_test() to fix possible double free

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      firmware: stratix10-svc: Use proper atomic to fix possible double free

 drivers/firmware/stratix10-svc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
