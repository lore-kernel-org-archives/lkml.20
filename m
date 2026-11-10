Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794271896;
	b=UBhRjPgzxaQU4UhDvhVlb0dUOh6ILpHRYD/jMCfRyorbCZdk96UuNzV047WeqS8RE2HZ
	 O331KjcZz0HiWoTpZ8vvSrjc0JYZbLOpwEzWt56q0pYOteWN6WVsEhz5ONhRpAkLzokx6
	 Je1ohuqCnSIApz6y3HMUR+EMrlFD2BQbbsiXr+KU3iHXogK+nzEiyNCz/X9VfivFlDJG3
	 nGN90K5MogtIR61CokkrnLY7xo9XIjBOB385YMcSceCfXnA15HZi3uDjZJJbKR8EQ1NH4
	 MkFjGSOeMAE4BHTfTzFN3ZDUqZ8HgbCRnNWldmEF1C+xDcUKdv2fIXWwzi237QeCmlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794271896;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:MIME-Version:Message-ID:Robot-ID:Robot-Unsubscribe:
	 Precedence:Content-Type:Content-Transfer-Encoding;
	bh=LxD33bNL5rSCXAzzNAfOTxYq1lnExYbcm26tyMihFoM=;
	b=3Wf0rFmCagzVZUZEWtpE6ekP/cY64017fMunIWebFd5ZpXbEftRIeGuo7dPCezRRsHVs
	 CUla+kE/3gdyDsV5nSFmUzknlA8BarTrJwNWsU55MYuHznETjic817EMCvpuffI795Kgc
	 YRkk11HXjskh5V/VDFSvvMgy6vHNBfr3qaMyXrtxGsjRixmzfbI6q82eH8HxGmfNAc4Ld
	 p6s5cHY+n4cSBkoFg7/wZZpH4wvSZskoQMKxDU/h/bk3dKugSm0GYD5AroTHCGQAaFSjy
	 PLAmdEKKtwd5t5/SSWDk/hye/OwQ49TYJczOqAlNHDvqwY19X3lJoCor2MqKE/xWa9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lDtpx7iO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=g53wR0D0;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85CE606A31C;
	Tue, 10 Nov 2026 00:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B85CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lDtpx7iO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=g53wR0D0
Date: Tue, 10 Nov 2026 00:51:25 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794271887;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=LxD33bNL5rSCXAzzNAfOTxYq1lnExYbcm26tyMihFoM=;
	b=lDtpx7iO6lCepei/koJiKoXjMLnnMH8ck47qoDWYNctHxWWzoEzYZ3EjXHjqWqTAMvP++f
	wxklrXPnkWNc7rXXuy7tFmHUTXFZce8jBULBdSlovg19Yro3ieTSwRWBs33JywvpAUOh1E
	kbLYS9M34AAHALNjYCGI2hZagwPo9JTlTtwm+3WnAOnFxWmVNSO6Gohuge5a4G2Na6krrI
	vUKt9LTtjIRug08qFU1kAZMZZKHL6recBkujuYG6ZTvkfFcdN6pU/2NMqpCuj2NWJ28ZNg
	ZdYhFfxw1UsmuAAUQf7fY6SNNV1vpN0HJef1V0P49jBku8JP/zi9zi4tskPC/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794271887;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=LxD33bNL5rSCXAzzNAfOTxYq1lnExYbcm26tyMihFoM=;
	b=g53wR0D069YYm24jPQxW1xUf3kKOr4Gz4+hwG4R1JasKoEoYRN6akU7HIAEpAa6hq52pAl
	KQ65EhCbw9cNS+DQ==
From: "tip-bot2 for Borislav Petkov (AMD)" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/misc] MAINTAINERS: Fix Intel TDX kernel file patterns
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>,
 Francesco Dolcini <francesco.dolcini@toradex.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179427188525.2093942.2236341209244600692.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/misc branch of tip:

Commit-ID:     4718aa616ec36dee6b4b846236174754b86f0852
Gitweb:        https://git.kernel.org/tip/4718aa616ec36dee6b4b846236174754b86=
f0852
Author:        Borislav Petkov (AMD) <bp@alien8.de>
AuthorDate:    Thu, 29 Oct 2026 19:25:27 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Mon, 09 Nov 2026 16:45:05 -08:00

MAINTAINERS: Fix Intel TDX kernel file patterns

A K: is a content regex file pattern which matches any text in a patch
so if a commit message contains "tdx" as in

  has_tdxe_auto_clear

for example, see

  https://lore.kernel.org/r/20261026-g2ul_sci-v3-3-b3097163edd5@bp.renesas.com

get_maintainer.pl adds the x86 gang to the Cc list for what obviously is
a completely unrelated patch due to the K pattern being overly broad.

The same happens when someone uses it to check

  drivers/power/reset/tdx-ec-poweroff.c

patches.

So switch the x86 TDX patterns to files and directories (F:) wildcard
type patterns and group them by path, for less false positives.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Link: https://lore.kernel.org/r/20261027055750.GBauA9XlPykc1c1Xhv@fat_crate.l=
ocal
---
 MAINTAINERS | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc..f617535 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30465,8 +30465,11 @@ L:	linux-coco@lists.linux.dev
 L:	kvm@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/tdx
-N:	tdx
-K:	\b(tdx)
+F:	arch/x86/**/*tdx*
+F:	Documentation/**/*tdx*
+F:	drivers/virt/coco/tdx*/
+F:	include/uapi/linux/tdx*
+F:	tools/testing/selftests/tdx/
=20
 X86 VDSO
 M:	Andy Lutomirski <luto@kernel.org>
