Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375644;
	b=vxF/5m93wWrGi+obGdxEmwLO5sxrms+FAh1fKqzo01nldf4eWEdtQ6pZqUXS18+YHLBT
	 Jc+4Jn1yj7ufcLiGrL+Vld+dFL3NPnyuFPwwgHB2AEdOxIZgfeejV/U95VZXcS0gPSK+Q
	 0oEUsGGC8mPwJT8SzTtyD8kLmvKxZwkcGac5IQTgAq8EMEGcBmvzaHCOcU/ediKXf5ycs
	 tu7Fzf2/Vx/WZIxY57nGekfRJ8M19RYYfUAVR6jNkXwxsWEl449c2xiA4BScvZcQKDXmG
	 qmTPmejeCk7M1lWLOOx75gp24g7PQVJiFJ31DX1CbFykJZZKEwuAxTvRkGpKyxQ6XmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375644;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Developer-Signature:
	 X-Developer-Key;
	bh=AyjKUZ3anoXONfF8EAKk5B5Mg7hWHRQn98r/unZefzM=;
	b=SZ6wZdgIeewFbNdJ5uzkKIxY6JMBKrIDb6PA+i3eX0Fx0Kyt86OoDjdvOErXhCPvfmvJ
	 uidmB4XVZKkkGthSJIAr1q/BYZWSjpEiG/KidTUVqlGNmgYzROxQb6+q25VTiRsPBNP5d
	 YXBFMRS9nBFOOEkicwy4PNnGuua+NYfYAapdt0aWnYq2IXHxa3GrPYeNnRmHPumoIcA8W
	 I5QtVgBHhrvQWEq7SwmgFTdPpvHgfTecaOwhDI2di/y1GDKZRQSMftcSlIfC7PWFR3dT6
	 eDY6cfkpRFnga1EC02zvSv+/3Hht9jTVq5q2yNLyfRBFM3OiKplyexzDBe6F2RIFUrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens-energy.com;
	spf=pass smtp.mailfrom=errorhandling.siemens-energy.com;
	dkim=pass header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=pH6OJosQ;
	dkim=pass header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=SVrb+PH9;
	arc=none smtp.remote-ip=185.136.64.135
Received: from mta-64-135.flowmailer.net (mta-64-135.flowmailer.net [185.136.64.135])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77428606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77428606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=pH6OJosQ;
	dkim=pass (2048-bit key, unprotected) header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=SVrb+PH9
Received: by mta-64-135.flowmailer.net with ESMTPSA id 2026103015534778e303d82e0019fd9c
        for <linux-kernel@vger.kernel.org>;
        Fri, 30 Oct 2026 16:53:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=s1;
 d=flowmailer.net;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:Date:Message-ID:MIME-Version;
 bh=AyjKUZ3anoXONfF8EAKk5B5Mg7hWHRQn98r/unZefzM=;
 b=pH6OJosQD6Z5T39KQH8el2E4dBsaQ2GvBjBZbqbsHNsF68Bwc9WDNeh33xD8Zu1o68jXu2
 pN0CpFLAs5Z9JoinoBWwgwf+uua1xB2T8pigweEnt1kYrxE9iNy9diWdJg9PNuLcB6WNjsNi
 zqko4KVxWCJYkSXWUNli3iNbwIako=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm4;
 d=siemens-energy.com; i=schuster.simon@siemens-energy.com;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:Date:Message-ID:MIME-Version;
 bh=AyjKUZ3anoXONfF8EAKk5B5Mg7hWHRQn98r/unZefzM=;
 b=SVrb+PH94iNasNjLXVsbd53JYdGk6idMnWyKZMIeCcVPH6JKS0gpribOUw9dRtdJ+taa1m
 4HjVTJHcgTtuIFL6bQWfL12enXIDmFvCBxQP/JlEQ6LsWXB3f4oSKRhA47Uss9poe0ws2FNu
 WlHDU8HhhGpMinJR5tNqGpHrUcy6x06xzewNJfFiMMVW3X8sMIgY0r4bPfSj0HQSlr6F2KEd
 TrqNrryC+9scPLy5N5W67nE8NgzQRFB6cIVw32ACnzDogILOb/OHoXYuvE6Pryxn7mjho4wD
 jJhlk66lNYe7ptpV8TsB/9YckWLMQ6j/jguBXXWw+ch/wjAT4rPWF80g==;
From: Simon Schuster <schuster.simon@siemens-energy.com>
Subject: [PATCH 0/3] lib: Add software mul/div helpers and use them from
 nios2
Date: Fri, 30 Oct 2026 16:53:03 +0100
Message-Id: <20261030-nios2-remove-usage-of-libgcc-v1-0-4e341c66082e@siemens-energy.com>
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
X-B4-Tracking: v=1; b=H4sIAF+95GoC/x3MQQqAIBBA0avErBswBaGuEi1MxxooDYciiO6et
 Hzw+Q8IFSaBoXmg0MXCOVV0bQN+dWkh5FANWmnbKaMwcRaNhfZ8EZ7iapEjbjwv3qM1oQ8qOhe
 shro4CkW+//04ve8Hcu8Gy24AAAA=
X-Change-ID: 20261030-nios2-remove-usage-of-libgcc-63d9d0faad62
To: Dinh Nguyen <dinguyen@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
 Simon Schuster <schuster.simon@siemens-energy.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793375627; l=3137;
 i=schuster.simon@siemens-energy.com; s=20250818; h=from:subject:message-id;
 bh=OYjNaDm7Bjl3rKufSDP4kG4YgxRleAgasx+RVbb2AoI=;
 b=7DwuCIULvXPS2W74jfThwvJY322pbF759EZq1/g3e7+gu+WdTqxBqUwRZb1zxtAbYnFJ8hKRZ
 1teFlab007OApWrMnwfCGjnK/GVSR7u1bp108uJ9QpTVt6vPdRLdgx2
X-Developer-Key: i=schuster.simon@siemens-energy.com; a=ed25519;
 pk=PUhOMiSp43aSeRE1H41KApxYOluamBFFiMfKlBjocvo=

Recently, there have been linking failures on nios2 regarding libgcc
symbols that we reexport to modules (in particular __mulsi3 [0], and
__divsi3_table [1]).

In the resulting discussion, Arnd suggested [2] dropping the libgcc
dependency altogether, as -- while specific functions might be fine --
libgcc does not expect to run in a kernel-like freestanding environment.

To this end, Dinh Nguyen was kind enough to locate and extract
GPLv2-compliant versions of the software mul/div/mod and __gcc_bcmp
functions required by nios2 gcc and integrate them into the kernel.

As Arnd also suggested [3] that these might be helpful to other smaller
architectures (such as arc or openrisc), I've further extracted them to
lib/ with corresponding CONFIG_GENERIC_LIB_* options that allow
selectively enabling and exporting these as required.

The patch series compiles mostly^4 fine in a nios2 allyesconfig
without modpost errors; a quick boot test on a regular build also
completed successfully.

One aspect I'm not fully sure of is whether adding declarations for the
new lib/ functions to include/linux/libgcc.h unconditionally in the last
patch of this series is completely clean; but it matches how other
"optional vendored" functions in libgcc.h seem to be handled.

Best regards,
Simon

0: https://lore.kernel.org/lkml/20261019-nios2-mulsi3-v1-1-4fd75b1bacef@linutronix.de/
1: https://lore.kernel.org/lkml/20261026234452.1086974-1-sashal@kernel.org/
2: https://lore.kernel.org/lkml/686f4ca2-0fb6-4a73-9cdb-0edcccafdd62@app.fastmail.com/
3: https://lore.kernel.org/lkml/426c73b7-b4dc-4b68-9aa5-6145a13280bc@app.fastmail.com/
4: There seems to be an unrelated issue in linux-next regarding
   CONFIG_PNFS_BLOCK, furthermore -Wno-attribute-alias
   -Wno-missing-prototypes -Wno-missing-declarations and
   -Wno-unused-function were required due to unrelated Werror-related
   compilation issues; but as this series concerns compiler intrinsics
   that are never explictly referenced in code and it links fine this
   seems acceptable to me.

Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
---
Dinh Nguyen (1):
      nios2: remove usage of libgcc

Simon Schuster (2):
      nios2: export __divsi3_table
      lib: extract 32bit mul/div helpers from nios2 into GENERIC_LIB

 arch/nios2/Kconfig              | 11 +++++
 arch/nios2/Makefile             |  4 +-
 arch/nios2/kernel/nios2_ksyms.c | 22 ----------
 arch/nios2/lib/Makefile         |  1 +
 arch/nios2/lib/math.c           | 26 ++++++++++++
 include/linux/libgcc.h          | 12 ++++++
 lib/Kconfig                     | 18 ++++++++
 lib/Makefile                    | 11 +++++
 lib/divmod.c                    | 94 +++++++++++++++++++++++++++++++++++++++++
 lib/gccbcmp.c                   | 13 ++++++
 lib/mulsi3.c                    | 24 +++++++++++
 11 files changed, 211 insertions(+), 25 deletions(-)
---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
change-id: 20261030-nios2-remove-usage-of-libgcc-63d9d0faad62

Best regards,
-- 
Simon Schuster <schuster.simon@siemens-energy.com>

