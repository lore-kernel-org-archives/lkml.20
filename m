Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326359;
	b=MOama5zSF00NfiksqcgXJRCODcRV9q5PLmSUxMSCQbu/Nsbxr8Ozcwwpy27JHZtw90zM
	 WKABvBShjvruK90OFVyAOAtdQO0osqN/XKgiaeHtILJC7+qdBWunkHwRdbNiOpqsl5+FA
	 1tf9w8GNXf7sHyKrL9nYLPzFA2GcqWh0s4P0IvyGMMYmww1Zl+4Qdf1xq2p/dCTAgmhSX
	 hJgdpIa2KdYtwtHX4d30gFJPY2uulhTSK3t0Wex9tYt2knYiTliV11GXorjD9jF0coveJ
	 YLhjea9ZqWOcNy3cBjLQ6Ax7C4PkIacsgJZtSV5H312n0hNP/d8GoZ5s4Dj3HvDsORA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326359;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Developer-Signature:
	 X-Developer-Key;
	bh=FDITyzOVhKN2IDHjq3TOSJCYUUFGuNWHEA/0LAovGv4=;
	b=o8K9YFmqCQ9pSCwZvoRdH9aPEz4jGiM2gyU4wGNmsYJaK7Z3gEGS8xAGSyBg8diRHHVZ
	 Dfeou1OxTG+uzFnJyv2U3uYop0o1uhmYZLTMjQpGvR5nmluFbd0yVVq4H1jhzSwV41l9q
	 rt0Z1Yyq2DLt3oeqJPzmGHQ5lI59a483kY5cXpYF3alXrNxT5bETskQ2xLTHlkZE+RVf0
	 PPqnkIxw1u37g9jgBoKIZyrrWhtGlsWSItvSuVRT6pugBoSZpP4nRjM87mevsLzeCDyQM
	 W2uyfiIjlveTTRaGJ8KusF9/UIxKJps4gS/jlysAj3ajC+F5rYhpZVcHTuLeZWWGZug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens-energy.com;
	spf=pass smtp.mailfrom=errorhandling.siemens-energy.com;
	dkim=pass header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=RxS073JF;
	dkim=pass header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=aYcs2Y8v;
	arc=none smtp.remote-ip=185.136.65.131
Received: from mta-65-131.flowmailer.net (mta-65-131.flowmailer.net [185.136.65.131])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F76960A2613
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F76960A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=RxS073JF;
	dkim=pass (2048-bit key, unprotected) header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=aYcs2Y8v
Received: by mta-65-131.flowmailer.net with ESMTPSA id 202611101559079fd05f59e00019fdc9
        for <linux-kernel@vger.kernel.org>;
        Tue, 10 Nov 2026 16:59:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=s1;
 d=flowmailer.net;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:Date:Message-ID:MIME-Version;
 bh=FDITyzOVhKN2IDHjq3TOSJCYUUFGuNWHEA/0LAovGv4=;
 b=RxS073JFGW+N68XsqpiFnyoflLWmlklDPYU9jiUrJzzbOcx4hWWHIJt/NkiHcqikO/aDaK
 fOWe7sYj9DVviNdYCwECE49Y0+MBOnA6SSk0iyTEber1fa1FdzPxBils5l0PqXTSdCI0R4vB
 1jBgHLASvzI4lO6tKqhtEYPNEbAXw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm4;
 d=siemens-energy.com; i=schuster.simon@siemens-energy.com;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:Date:Message-ID:MIME-Version;
 bh=FDITyzOVhKN2IDHjq3TOSJCYUUFGuNWHEA/0LAovGv4=;
 b=aYcs2Y8v3f1WEHggVQgaTHzhH+H3QhEhFd1b8hu4xGAJ6LHNLdrDhvk+ats7GFJ6ye8SIf
 Ga/NVKDUQLK4L2YKLxI18QKZB5/6zZpmgMF2G6crWmRFdNk6+7deM8ejsF+6fAT0IJasftRN
 C5KphnXYA9t0sjll9ztXfUMOnCQOLk/exEajzSZWJ66sgMCeGoXjnJi7GC/JlcbxbINQkWcS
 uFdMPDQlxc6nbjSmW72jy6eeBh9Slmox3uNX6BjD+w6YsBQ/sk/dVueZaJucuEFMaFBaw9BG
 r1OPMtnTgKj3Hg1ftJX/YhfSmQsglU8HWou3pn8NSfxbWaZdjEVwsG4Q==;
From: Simon Schuster <schuster.simon@siemens-energy.com>
Subject: [PATCH v3 0/3] lib: Add software mul/div helpers and use them from
 nios2
Date: Tue, 10 Nov 2026 16:58:49 +0100
Message-Id: <20261110-nios2-remove-usage-of-libgcc-v3-0-1449ce37948e@siemens-energy.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADk/82oC/43NQQ7CIBCF4as0rB1DoRLrynsYFxSGdhILBpTYN
 L27tBs3Jrr8J5PvzSxhJEzsVM0sYqZEwZeQu4qZQfsegWxpJrhQNZccPIUkIOIYMsIz6fIRHNy
 o640BJW1rudPaKsEKcY/o6LXxl2vpgdIjxGlby/V6/RPONXBoUDa1UYofBZ4T4Yg+AXqM/bQ3Y
 WTrQhYftbA/VFHUg9Ndh9Y0LZqv6rIsbysvQbQnAQAA
X-Change-ID: 20261030-nios2-remove-usage-of-libgcc-63d9d0faad62
To: Dinh Nguyen <dinguyen@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
 Vineet Gupta <vgupta@kernel.org>, 
 Simon Schuster <schuster.simon@siemens-energy.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794326347; l=3357;
 i=schuster.simon@siemens-energy.com; s=20250818; h=from:subject:message-id;
 bh=fQKeWMGHxU9V6DITSwK1K4FeMpeuDyhPhP/JR44AQS0=;
 b=0YQfkUwRj+QZ3xI2DeF4rdvkt5Zt6z7Q2LV3JO34V6BKjKOX54AGsQk/C9AT165r7Box/exmr
 tAzCxzMZfXLBqHT5cNVHSdwft5MbyoSmytAq1oGllZY5ir/CqdWtJrq
X-Developer-Key: i=schuster.simon@siemens-energy.com; a=ed25519;
 pk=PUhOMiSp43aSeRE1H41KApxYOluamBFFiMfKlBjocvo=

Recently, there have been linking failures on nios2 regarding libgcc
symbols that we reexport to modules (in particular __mulsi3 [0], and
__divsi3_table [1]).

In the resulting discussion, Arnd suggested [2] dropping the libgcc
dependency altogether, as -- while specific functions might be fine --
libgcc does not expect to run in a kernel-like freestanding environment.

To this end, Dinh Nguyen was kind enough to locate and extract
GPLv2-compliant versions of the software mul/div/mod functions required
by nios2 gcc and integrate them into the kernel. As Arnd also suggested
[3] that these might be helpful to other smaller architectures (such as
arc or openrisc), I've further extracted them to lib/ with corresponding
CONFIG_GENERIC_LIB_* options that allow selectively enabling and
exporting these as required.

The patch series compiles mostly^4 fine in a nios2 allyesconfig
without modpost errors; a quick boot test on a regular build also
completed successfully.

Best regards,
Simon

0: https://lore.kernel.org/lkml/20261019-nios2-mulsi3-v1-1-4fd75b1bacef@linutronix.de/
1: https://lore.kernel.org/lkml/20261026234452.1086974-1-sashal@kernel.org/
2: https://lore.kernel.org/lkml/686f4ca2-0fb6-4a73-9cdb-0edcccafdd62@app.fastmail.com/
3: https://lore.kernel.org/lkml/426c73b7-b4dc-4b68-9aa5-6145a13280bc@app.fastmail.com/
4: There seems to be an unrelated issue in linux-next regarding
   CONFIG_PNFS_BLOCK. Furthermore -Wno-attribute-alias
   -Wno-missing-prototypes -Wno-missing-declarations and
   -Wno-unused-function were required due to unrelated Werror-related
   compilation issues; but as this series concerns compiler intrinsics
   that are never explicitly referenced in code and it links fine this
   seems acceptable to me.

Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
---
Changes in v3:
- Switch __udivsi3 and __umodsi3 signature from s32 to u32 as requested
  by Vineet Gupta in <bba7f6da-82ee-46cc-bd8f-b0e3e027f5e2@kernel.org>
- Link to v2: https://lore.kernel.org/r/20261103-nios2-remove-usage-of-libgcc-v2-0-5fabbedc49ec@siemens-energy.com

Changes in v2:
- Reorganised to directly add to lib/* skipping arch/nios2/lib/math.c
- Dropped __gcc_bcmp as it is not actually needed
- Link to v1: https://lore.kernel.org/r/20261030-nios2-remove-usage-of-libgcc-v1-0-4e341c66082e@siemens-energy.com

---
Dinh Nguyen (2):
      lib: extract 32bit mul/div helpers from nios2 into GENERIC_LIB
      nios2: Drop usage of libgcc in favour of GENERIC_LIB_*

Simon Schuster (1):
      nios2: export __divsi3_table

 arch/nios2/Kconfig              | 10 +++++
 arch/nios2/Makefile             |  4 +-
 arch/nios2/kernel/nios2_ksyms.c | 22 ----------
 arch/nios2/lib/Makefile         |  1 +
 arch/nios2/lib/math.c           | 24 +++++++++++
 include/linux/libgcc.h          | 10 +++++
 lib/Kconfig                     | 15 +++++++
 lib/Makefile                    | 10 +++++
 lib/divmod.c                    | 94 +++++++++++++++++++++++++++++++++++++++++
 lib/mulsi3.c                    | 24 +++++++++++
 10 files changed, 189 insertions(+), 25 deletions(-)
---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
change-id: 20261030-nios2-remove-usage-of-libgcc-63d9d0faad62

Best regards,
-- 
Simon Schuster <schuster.simon@siemens-energy.com>

