Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712670;
	b=EN3BY6hNhB5Dj7I1ESLST58qJkk4ZzhlQ0DXvGryMibjjf5mk4OASaCW7STRL2iLiufQ
	 BLf9iXUeRWDAp5IkwlMGzpLmlCE908MRNngdJQDSFk3eDHNoqm7M7MBd0QXsT2Hyl3Gee
	 hvuj4LPcezOtHLNUoruDPsqtuYtU7gTtss7rhT9OBBKu4MKFMRgGWMEqgyRGCmYzxygZC
	 TxQ5WeUKX9gm6vTXFLr40CW3Dt63xddfjidicqAMrxmBblScE9+QKyalpR6gVbdJyBZys
	 tFcR1ZJeJqWkClAu29UvA6uwn1eUBTVZUoOEvUJicjpevNRwv6+fm+lGPfUsKY43KYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712670;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Developer-Signature:
	 X-Developer-Key;
	bh=9RF5bmgBFOvuDjB0XV04CAil3nzrHImYSkW40EAqvfg=;
	b=am0xCJQUpSqrbT0Vx2X8z3o7YpbtcWcIdGN2yaRsThhY2/ryXU28UuIZo6o13Osg7O6h
	 anF1t+F+Xy0/b4kspD+ZQ52DbTKnTQs3vrWWaYFuKaCfdjbFc7HOGko30iOdx9E1oJzje
	 3dd5yLSBZ6NNnZyP561VJcpfheLFInFXHqiyHg5DudS0Ko4uBUAnWQn0sBns6Di9Jerd5
	 UfGnIdnZKfsJ9trYoeVYYzkcupVtL9LzjZYs86febsRTAJ/Gi74znW8Gr3wnXCyqKzIsN
	 5PGSXbN6HsKnvCo1c26BQMy99bgVmvkcrnE290KCxXiLpp+8KP3dcKvPZxRY0amv8Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens-energy.com;
	spf=pass smtp.mailfrom=errorhandling.siemens-energy.com;
	dkim=pass header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=bGNJSwUh;
	dkim=pass header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=mmXSvCqV;
	arc=none smtp.remote-ip=185.136.65.144
Received: from mta-65-144.flowmailer.net (mta-65-144.flowmailer.net [185.136.65.144])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0636F606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0636F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=bGNJSwUh;
	dkim=pass (2048-bit key, unprotected) header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=mmXSvCqV
Received: by mta-65-144.flowmailer.net with ESMTPSA id 20261103133100451450b8170019fdc0
        for <linux-kernel@vger.kernel.org>;
        Tue, 03 Nov 2026 14:31:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=s1;
 d=flowmailer.net;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:Date:Message-ID:MIME-Version;
 bh=9RF5bmgBFOvuDjB0XV04CAil3nzrHImYSkW40EAqvfg=;
 b=bGNJSwUhULT3laE4eNVB0pAKgfmRugkOql03vw9sM9wBtdLyQzmXUwpm5i4n8gnl2Rc/qG
 Gobh6e/GuziH0wibbO9SDq/NFrHfnEstjXQD0LlBbt4wNeUjNrbMns9vROcsTDVrUbw+z484
 2n6QiqpgUZzgPof5zzwRpVWfKxgeA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm4;
 d=siemens-energy.com; i=schuster.simon@siemens-energy.com;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:Date:Message-ID:MIME-Version;
 bh=9RF5bmgBFOvuDjB0XV04CAil3nzrHImYSkW40EAqvfg=;
 b=mmXSvCqVUXKCCmxP3fxdc+24N12DyzfSKXH4o9xkMrJYzHODEnGYniLCJkxPaBKSsH/yEu
 aZruTJXYJYp974a+GmGI+W0zwwZowYVqqiaD/acDREbwjRSZrEPFUO6k4ByR92tuE5jvcpWj
 Oj1ZriXA/5AZeZY6iJgFbY7E2PtgBsX7yBYmX6iLqkmNNnIdCNPntv3LIcRwbLhdWvSlUJCH
 VEd14cZYC8z2v3yOe+FwFDkddUWDTW9kAaOcGNuoLvk1OfqzlLZda1ik7jzdnMQb+E9LViBB
 RNh//0jcu44E0WxDK6Hw3iNVph0WEcCAqKQTIhPrMWv6+PMpVEx7Wumg==;
From: Simon Schuster <schuster.simon@siemens-energy.com>
Subject: [PATCH v2 0/3] lib: Add software mul/div helpers and use them from
 nios2
Date: Tue, 03 Nov 2026 14:30:27 +0100
Message-Id: <20261103-nios2-remove-usage-of-libgcc-v2-0-5fabbedc49ec@siemens-energy.com>
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
X-B4-Tracking: v=1; b=H4sIAPPh6WoC/42NQQrCMBBFr1Jm7UiSlqCuvId0EZNpO2ATyWiwl
 N7d2BO4fI/P+ysIZSaBS7NCpsLCKVYwhwb85OJIyKEyGGWsVq3CyEkMZppTIXyLq4s04IPvo/d
 o23AOanAuWAM18cw08GfP3/rKE8sr5WV/K/pn/wwXjQo7ajvtrVUnQ1dhmikKUqQ8LkefZui3b
 fsCEquxh9EAAAA=
X-Change-ID: 20261030-nios2-remove-usage-of-libgcc-63d9d0faad62
To: Dinh Nguyen <dinguyen@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
 Vineet Gupta <vgupta@kernel.org>, 
 Simon Schuster <schuster.simon@siemens-energy.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793712660; l=3078;
 i=schuster.simon@siemens-energy.com; s=20250818; h=from:subject:message-id;
 bh=W8xwPsjIABokCDuT4eVFZpTy4WRFjbZQjhH29zd7Mq4=;
 b=x95hPakuWHzajV5vrydAo6xUVBfCnt26Na08yWUu1Fy+NDP6SwMmZwZxZlWaoi6/hK3lo7FkN
 v5mZuwGm0OdCKvkvqQS53xXQ60rLS1nMYO0JgRSJJMn2cz1kSbLMV5L
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

