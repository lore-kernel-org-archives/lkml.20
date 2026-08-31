Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5307539B94F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159862; cv=none; b=gEu4Qwebczlw2P7z3reGgxP2V84PW9a2NiqsFnJPRH+Zz+OfDfZPshv+CYxl9360ngSLlzZP9OO/as9KaAC3lsqeNKivZ3n9YZ+OZwue0ZYH405D3gjRbiaosSdQ9t7tGAo2xOttZHIXh91UNFOHy05Nl/R7XhhlzoftUClIVCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159862; c=relaxed/simple;
	bh=pgvZUIY/mmx2p9Um6/ggswie+EFVhV0AHZd4nhgLD0A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QrJc/gIx+NtEJSVqvYSBeflkg/BcvZINUHS6s9cO7JIMqlYPPcdSCUFO4SrmCZFsxklv0+md8k417g4Of5GrMDHJnS54Qn2VsXJVWlTmTYVTs+f4qjF7kbODk1KgAipuvo4xBlj9F+smDLiCx0EzjCKbUMRfyEWiZxF6+5V1sE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEYjzIQQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEYjzIQQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF491F000E9;
	Mon, 31 Aug 2026 07:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788159860;
	bh=9HJK0tI4fgY01xAtxNzOF7III44M7P9AeWGap6l7eZE=;
	h=From:To:Cc:Subject:Date;
	b=AEYjzIQQfO5jTod7Ft7nhG+ucMDu+zDyfuHGvId/cKyJ/SWqrl/UpmBZP7BgO+2l1
	 AAGuWdOOkU/uFk6Ekydk+BhoTslbca7kMuwGIv5Z3Fq0eCz4FclJFAaJqmhmFOl/0I
	 cVdddC72qtEuTV+CryzL5FZSq8K92xgyvzFyKnteK7XMnFN5EvJ/M2gDSp9zeEYSrX
	 pAcZd3iTejxXFlqeXypeK8rGOT5A9UQ+h/QxRI572zYkUxZfcvBlW0jwWGUbnObkDN
	 WRa/YeY/cB74OTb2MjgY12lIPyBJ54cJZYqU7OzFe/Rta/Jq0/R4NChN5Bzdsqp9g4
	 YVbuETlzK9jtA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Petr Mladek <pmladek@suse.com>
Cc: Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	tzungbi@kernel.org,
	tfiga@chromium.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] printk: Introduce loglevel bypass for pstore console
Date: Mon, 31 Aug 2026 07:03:44 +0000
Message-ID: <20260831070346.3490745-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, offline consoles (e.g., pstore_console backed by ramoops)
inherit the system's global console_loglevel.

In production environments, physical serial consoles (UARTs) are often
heavily rate-limited to prevent verbose messages from causing severe
execution bottlenecks.  Unfortunately, this identically silences the
pstore console.  When a kernel panic or lockup occurs, engineers are
left inspecting a crash dump that has been stripped of the verbose logs
that could have identified the root cause.

This series introduces CON_BYPASS_LOGLEVEL, a simple flag that allows
specialized offline consoles to request unsuppressed logs directly.

Patch 1 introduces the CON_BYPASS_LOGLEVEL flag.
Patch 2 adopts the flag in pstore_console.

Tzung-Bi Shih (2):
  printk: Introduce CON_BYPASS_LOGLEVEL flag
  pstore: Bypass loglevel suppression for pstore console

 fs/pstore/platform.c    | 4 ++++
 fs/pstore/ram.c         | 3 ++-
 include/linux/console.h | 4 ++++
 include/linux/pstore.h  | 2 ++
 kernel/printk/nbcon.c   | 7 +++++--
 kernel/printk/printk.c  | 6 ++++--
 6 files changed, 21 insertions(+), 5 deletions(-)

-- 
2.55.0.897.gb25b4bd76c-goog

