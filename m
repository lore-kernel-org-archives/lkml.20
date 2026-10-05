Received: from out-2z4y-a131.jellyfish.systems (out-2z4y-a131.jellyfish.systems [198.54.127.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB5C51FCC6
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220724; cv=none; b=DAsqj6jAcog8JXBWhX1EZe79wYILLmX2jbhPGmkd34VMG6k7ggYXyUAdyglNP5a/F3/3DGBPvnFieBsO4V89v9xhJwpOLuULfo9/dxZrNd5jubstIxkM5rWp22vUJdVMCR2gtnYC8nomLOHJPq+N5iqucE3tDUk/D+/Zxvryhmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220724; c=relaxed/simple;
	bh=zLmMW7WqZsvCXwQoaxz1YitXwEAb+EnIFK58ppzbNSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XrJF/G4cTIKIm8HvNOHh4L7FC7GHzF4GyW5XLplmDZNQgCSStzHe07oHwTB7epdMcEVwZT/WWeO0fKNGprzoLAmCQ2Zna3+8WG9h8VQ96Fwo22H4ZgajQdp/Op24xhWcgtFLcicStCgLywuUBD37wZFOKc6JvkYCjac3ePCABmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ciallo.tech; spf=pass smtp.mailfrom=ciallo.tech; dkim=pass (2048-bit key) header.d=ciallo.tech header.i=@ciallo.tech header.b=Cp0zxkZg; arc=none smtp.client-ip=198.54.127.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ciallo.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ciallo.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ciallo.tech header.i=@ciallo.tech header.b="Cp0zxkZg"
Received: from desktop.ciallo.tech (unknown [104.28.208.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hz5h13Sylz8sWS;
	Mon, 05 Oct 2026 17:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ciallo.tech;
	s=spacemail; t=1791220711;
	bh=g40sJXTxjH1CSLJx2UnnsNZ8TyOWnOkWypw9lmAMbgQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Cp0zxkZgl/M2bn+ihbUeGbI8J+5XrFJnTtbpqIfip/PbXh2Kwi88PTuJlDShbhcLm
	 RDj/f8Kx/k4OjXh/LdX5cX0hhARD7LenFSc6pCeNyau4FBIGtdj5S/5aWPx8bgbDRA
	 Odd6id0cKpIERNvNRzeI1Lk7o8aNwLrJ/rNdWH6BU9CePPKGuGyKV0dlKXl2/uMBdS
	 WqJngG/m4fIIX49oZqVt2jdWVro9r3eWl5xamFKWC8SfNwhpnrtOU8a6kWsMyJjUJ9
	 vXw20SiEL+FGRQa7Ef69UPjQ0Xq313Usfxc2m1gSW9eWKTHj0pjM4GhzF4BMJtJtLx
	 pafdHbwHDs7cA==
From: sayo <rg32@ciallo.tech>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	m.younesbadr@gmail.com,
	nir@lichtman.org
Subject: [PATCH v3 0/2] x86: stop handing boot-stage parameters to init
Date: Mon,  5 Oct 2026 13:13:44 -0400
Message-ID: <20261005171815.49494-1-rg32@ciallo.tech>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: rg32@ciallo.tech

Some kernel parameters are consumed before the main kernel is running: the
boot stub, the decompressor and the EFI stub read the command line directly
and act on options that the main kernel never registers, because they
describe things that are already decided by then - the kernel's load
address, the paging mode, the memory encryption mode. parse_args() cannot
know they were eaten, so unknown_bootoption() hands them to init: valueless
options in argv, "key=value" ones in the environment.

On x86 that is nokaslr [KNL,EARLY], no5lvl [X86-64,RISCV,EARLY],
mem_encrypt= [X86-64] and edd= [EDD] - all documented kernel parameters.

That collides with init's own argument convention: busybox init does
"if (argv[1]) xsetenv("RUNLEVEL", argv[1]);", openrc-init takes the
runlevel from argv[1], and a shell used as init treats the argument as a
script name and exits, so a plain "nokaslr" boot reaches userspace as a
bogus RUNLEVEL.

Earlier attempts at this (2024-03, 2024-10, 2025-01) added a stub handler
for "nokaslr" alone; Boris preferred the generic version over per-parameter
stubs that only silence a warning. So patch 1 adds the hook and patch 2
fills in the x86 list. Nothing changes for parameters that are genuinely
unknown - they still reach init, and the notice names only those again.

Link: https://lore.kernel.org/all/20240331200546.869343-1-m.younesbadr@gmail.com/
Link: https://lore.kernel.org/all/20250114145521.GDZ4Z62dOwYffaUrsr@fat_crate.local/

sayo (2):
  init: claim parameters consumed before the main kernel
  x86: claim the parameters consumed by the boot stub and decompressor

 arch/x86/kernel/setup.c | 40 ++++++++++++++++++++++++++++++++++++++++
 include/linux/init.h    | 12 ++++++++++++
 init/main.c             | 16 ++++++++++++++++
 3 files changed, 68 insertions(+)

