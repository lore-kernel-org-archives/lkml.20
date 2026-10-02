Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE224347532;
	Fri,  2 Oct 2026 19:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968216; cv=none; b=ZsTpy1/XoPAFBWMuL1Czt+Sws6UMcYlKxQhwef9XmYaeqWOtCS38HKYKrl/FuPz2CgFadVX0KEKK/v8vBA1NUJUyV7z/A2UEB2fFA3AQzmARt/y7zQ78cFEo8hotVsB64SenpJYY3HxZVRDcnS4lkolBv+pv0e1Wou6WhJLIc6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968216; c=relaxed/simple;
	bh=KtaDO/r74G/GnhBlbKRhP7LLqBx9sM31GmYaFO6PUoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rykq92vF8dbyh2rq8k8GA8R7xWCLPCLTST4TTdweVIDINtkVzWjsVHT0tXxv6tn8NSMbIg+OyHFPEmIWb+i7ym9zv59Se9HEtBrgSVB6oB6DYnHqFYbtk7KfOsQmY9QWc+8AYRM+GYponpQCCKaQyVSqKoK55bQEgzrG/IS2N94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2nUVAZk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2nUVAZk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0FE1F000FF;
	Fri,  2 Oct 2026 19:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790968211;
	bh=qlSrBYso4EEfVUPgxIO/sNKai+oC0Hd2E6Zpp0fRewU=;
	h=From:To:Cc:Subject:Date;
	b=a2nUVAZkcxRPwxj5738uDNNQLBiPbAT+WlGCe3dxDaC3MIwx84Kvnc23oDAYKu8Jp
	 b+5CvkjFsfwhNENLHN/MvmYHZ1Pw1DGWdZ91lWUU/LHu+4MNd/wd+Tsx7qQeJYjkaI
	 z7vx9/rUl4KtNMPQqKN6Mu/uUHNnQ6vrrimUwQ2/Ci84wXaYmxAH1qUXrd5pEJl/hM
	 Iwc4wYvMWi2w9iajYC/xOoxd1gq1i5rpeUHR0ypXy3JNH/v9Bc82+fGGbW04j1v34K
	 ab584WTqMIHM8xtjNkWA7aGH1lKhNOQbkpFJcBX9v1nj8vtNt4qIslqTedfZ48UJ6w
	 YW8j1/xXtxpGw==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>
Subject: [GIT PULL] Apple SoC driver changes for v7.4
Date: Fri,  2 Oct 2026 21:09:57 +0200
Message-ID: <20261002190958.8205-1-sven@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-drivers-7.4

for you to fetch changes up to 4edbfa916dbfba44af3ef2378cae2b2653c96058:

  soc: apple: rtkit-crashlog: Add support for AArch32 state 'CrgA' section (2026-09-27 18:48:47 +0200)

----------------------------------------------------------------
Apple SoC driver updates for 7.4

- Enabled shared GPIO support for ARCH_APPLE which will be used for a
  shared GPIO line for the speaker codecs
- Add RTKit crashlog support for older 32-bit co-coprocessors used in
  older iPhones and iPads.

Signed-off-by: Sven Peter <sven@kernel.org>

----------------------------------------------------------------
James Calligeros (1):
      arm64: Kconfig: Select HAVE_SHARED_GPIOS for Apple Silicon

Nick Chan (2):
      soc: apple: rtkit-crashlog: rename 'Crg8' section from regs to aarch64
      soc: apple: rtkit-crashlog: Add support for AArch32 state 'CrgA' section

 arch/arm64/Kconfig.platforms       |   1 +
 drivers/soc/apple/rtkit-crashlog.c | 141 +++++++++++++++++++++++++++++++------
 2 files changed, 120 insertions(+), 22 deletions(-)
