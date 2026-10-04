Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2832AD35
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 07:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791100514; cv=none; b=kaRB1+rsSKekMD+0tfDDsgDUTkx8ni71+4OzI3SqIxYevDLQBVZi3b6gr67RXN2LgonotvQc30oRbqkyqsSqinpVLb5B91pLAuVunKFIWROkrG23rvgtWBUQpKqH09bMmVmI7PxkvullvG4p1W3FYWkTEBcAYw7m9R6IpGS2LH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791100514; c=relaxed/simple;
	bh=IXvSIqUD7kiEDAkdxSCU66CV6SE2EUppxuwqkxxlkDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H7SNdr89AJWQVFvLxkXLlyNfVJntowEmNuIR1MeBGMKIfg3vx+KhOwAP3XyRX8OhvQ4/SQNE4htZdfa0qHpZIDMYEJ0hFOuUElUZe/Q119mNnxPX4G8xQJekWgMdxcwE4e0iCiA6zqZOdclvZHWhHDa/R06Uw5BgoTyZpMVFsj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xo4zZIwL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xo4zZIwL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E5B1F000FF;
	Sun,  4 Oct 2026 07:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791100513;
	bh=n9mwCMutlY8lAxp0Lzbbi7iXdD4jaQrqqMoZsXzX3ao=;
	h=Date:From:To:Cc:Subject;
	b=Xo4zZIwLnb5boAF2C/d30xfEmVDzMJw8pkV099qA4mNnDa6VBXsTyVTLP9hbq9gDo
	 X0VihVDIhjqIKymXNschdU4nTjbhOea9zSl1QLXjn1BVk5SOm9iZFtDP4uqwNE+9d8
	 UtjbKkm6dAH2jC1tSjsYk5Ubp1K28qoM4yS4RfB0NLBPM1T7A2LJFKDN+ze/s59YUH
	 icPg0bEq+oKbwvt7Rs5rTx0TKe1wKa2HOF5ku3+doSagZYMt8RfL1814VjrYwVBISJ
	 PehEHX09JXCayFbxa4iCHkT2/J7VEd5FHT4BhN89LM0TxMBZyI5OFZuIHVz4WodcMJ
	 70z69JV+XhrHQ==
Date: Sun, 4 Oct 2026 09:55:09 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [GIT PULL] x86 fixes
Message-ID: <asIGXTyrnzreymrr@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-10-04

for you to fetch changes up to a661c34fe693c8f9ef29b45ee71cfa1fe593502b:

x86 architecture fixes [with an UM fix included]:

 - Don't apply va_align to hugetlb mappings on AMD F15h systems
   that have custom va_align.bits values (Laurent Wandrebeck)

 - Fix PMD teardown handling regression flagged by lockdep
   (Mikhail Gavrilov)

 - Hide ptrace header register offset macros behind __ASSEMBLER__ or
   __FRAME_OFFSETS, to fix user-space build errors that may trigger
   if they happen to shadow these short and generic macro names
   (Nick Desaulniers)

 Thanks,

	Ingo

------------------>
Laurent Wandrebeck (1):
      x86/mm: Don't apply va_align to hugetlb mappings on AMD F15h

Mikhail Gavrilov (1):
      x86/mm: Drop unnecessary PMD page copy when freeing

Nick Desaulniers (1):
      {x86,um}/uapi/ptrace: Guard register offset macros with __ASSEMBLER__ or __FRAME_OFFSETS


 arch/x86/include/uapi/asm/ptrace-abi.h |  4 ++--
 arch/x86/kernel/sys_x86_64.c           | 15 ++++++++++----
 arch/x86/mm/pgtable.c                  | 38 +++++++++++++---------------------
 arch/x86/um/asm/ptrace.h               |  4 +---
 arch/x86/um/ptrace_32.c                |  1 +
 5 files changed, 29 insertions(+), 33 deletions(-)
