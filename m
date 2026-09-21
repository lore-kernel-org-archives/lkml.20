Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C832448FF8D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989287; cv=none; b=Hk+YZLLugV+QppeHWtZPhIyVDvNlyUlPEmRLTOA3kiL7/jR28hHV4E48vu4c7XRMFJHIouFasX9fwnzmLnJa8d9EeBIlKRQ9dXz76ImVcbUmj6BL5XDEh2ZMQ4jGN870w/NjvE494NbRELK/QbGVGR2YU7q/tU+X8FAnZnoF+0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989287; c=relaxed/simple;
	bh=b0/p2GPV/jFztrPjaSitCITmnZY2YmNnIkNfwBgAVI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BLTB89eib4YizGdx6m6kyCxtfpKQlv6M69Ts40WKif/Gb3NxEOvD46yxq4oktX9Hj8ArIsf4VXm4YVkGdKybgcWswp2L/fdikcoZ/QkQxijZaVkLorouGHWyu9Y07YKE+AfLEUNl+LUOLG6cAqWmg9gIcKo+77FGAPGlt2X+9wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0Q1D7SE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0Q1D7SE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757EE1F00898;
	Mon, 21 Sep 2026 11:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789989285;
	bh=RsA7swmCTdvJfvZSjir0G0j3XLinLlHb71HyNwVYut4=;
	h=From:To:Cc:Subject:Date;
	b=A0Q1D7SE3aaEcSVHYRB6fLD1o0gYxB9TED9uceJ9Lr8p1qNlyr+YmpGKD6mVt2Qvu
	 j1DgtdaqsdRkgKSr6tVtmjrtMGACDGsptCUGdMAVxcA6EanvGHBAEF4F2yHnfVlSf6
	 UcUNME6RdqdZOQlfZQ59FrD72LVBhTtlgpH7bCSHzOTq2Xyg3qg44U3EkD9jLiSEsh
	 3TsnQFng8qGtAjl9JMEpCW9Cvf2yjuqBT8RM2fhsNHkoShtpihbx/NDplBknI0ZLeb
	 3ucYvPP3GBsgZtZHWqAW65tYxjwvES5phEiGmU7TlRJjvB1iGvekukBZDImb9krtMQ
	 ODTB7pEh1X4vQ==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Yue Haibing <yuehaibing@huawei.com>,
	"devzero@web.de" <devzero@web.de>
Cc: Thorsten Blum <blum@kernel.org>,
	Ingo Molnar <mingo@elte.hu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] x86/cmdline: Fix cmdline_find_option_bool() for unavailable cmdlines
Date: Mon, 21 Sep 2026 13:13:36 +0200
Message-ID: <20260921111337.37099-4-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2378; i=blum@kernel.org; h=from:subject; bh=b0/p2GPV/jFztrPjaSitCITmnZY2YmNnIkNfwBgAVI8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkbBRN1vYr4a75xzrKLTqqqVYj9UTn5wyMFjgnBqXvW5 Ac5HQ7tKGVhEONikBVTZHkw68cM39Kayk0mETth5rAygQxh4OIUgInMPcfwv9K62OHAx9ZNLpcd b1796rNPh/HIfklxadnLCXat4daGOgz/bMyt7mx9Uv7yufvGDYJnqr6c2WIZxtVRlrLg7SaRSSZ HGAA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

cmdline_find_option_bool() returns the position of the requested option,
or 0 if it is not found. However, its implementations return -1 when the
command line is unavailable.

Several callers interpret -1 as an option being present. This can print
the setup debug message, suppress EDD output, force PAE, disable KASLR,
or prevent 5-level paging from being enabled, even without a command
line.

Return 0 from cmdline_find_option_bool() instead to match the documented
behavior when the command line is unavailable.

Fixes: 32d0b9898029 ("x86 setup: early cmdline parser handle boolean options")
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
Changes in v2:
- Describe the user-visible effects in the commit message
- Drop unnecessary comment changes
- v1: https://lore.kernel.org/r/20260801125444.18082-2-thorsten.blum@linux.dev/
---
 arch/x86/boot/boot.h    | 2 +-
 arch/x86/boot/cmdline.c | 2 +-
 arch/x86/lib/cmdline.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/boot/boot.h b/arch/x86/boot/boot.h
index 8e3eab34dff4..b623572b6964 100644
--- a/arch/x86/boot/boot.h
+++ b/arch/x86/boot/boot.h
@@ -261,7 +261,7 @@ static inline int cmdline_find_option_bool(const char *option)
 	unsigned long cmd_line_ptr = boot_params.hdr.cmd_line_ptr;
 
 	if (cmd_line_ptr >= 0x100000)
-		return -1;      /* inaccessible */
+		return 0;	/* inaccessible */
 
 	return __cmdline_find_option_bool(cmd_line_ptr, option);
 }
diff --git a/arch/x86/boot/cmdline.c b/arch/x86/boot/cmdline.c
index 21d56ae83cdf..69dc33832a9d 100644
--- a/arch/x86/boot/cmdline.c
+++ b/arch/x86/boot/cmdline.c
@@ -110,7 +110,7 @@ int __cmdline_find_option_bool(unsigned long cmdline_ptr, const char *option)
 	} state = st_wordstart;
 
 	if (!cmdline_ptr)
-		return -1;      /* No command line */
+		return 0;	/* No command line */
 
 	cptr = cmdline_ptr & 0xf;
 	set_fs(cmdline_ptr >> 4);
diff --git a/arch/x86/lib/cmdline.c b/arch/x86/lib/cmdline.c
index c65cd5550454..f1e65aa8c479 100644
--- a/arch/x86/lib/cmdline.c
+++ b/arch/x86/lib/cmdline.c
@@ -42,7 +42,7 @@ __cmdline_find_option_bool(const char *cmdline, int max_cmdline_size,
 	} state = st_wordstart;
 
 	if (!cmdline)
-		return -1;      /* No command line */
+		return 0;	/* No command line */
 
 	/*
 	 * This 'pos' check ensures we do not overrun
