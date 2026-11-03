Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712671;
	b=U2Dt2TMrMbsM3eJgrruJLrzc2Z9le0Z/wh1UyDS2Lt0sS6y23vflM4ZMzMBWiWq8M0y5
	 VJXgHrS48mTHXOlUOBlntLve+JPIBwvp2ix65iWktjpHuE5hvLJh9kgWPj6fKanvtu9Yf
	 0QtZItxUUtU+6YYilfgniGvT2rFB7QkA1D65AYCZ3Hfja/GSMMjKFBBIqi+RMp6CIOhv4
	 3rC+miJUh9c4LCBDXcuLx+5ptU1v8JPOt3HtRDyc3AV4LRXIjTjhyOtIKj4t5t/Eg5DoG
	 sZrRQ69M/b/Utouu+1FjqAGcN1yXCxDoHUUAyTB0LevOQt1d4VJ07YP/WUsnF0esGMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712671;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Developer-Signature:
	 X-Developer-Key;
	bh=xSV//YIvQFpsiqfyOHHS9nn4wHPA8FQGa2A+LQxzVT8=;
	b=ssz0ESx3gi6vlHiwMlC0M9wwFzjLEZ7exnL4hAACO37C+qDXqjkU0iQHeH1vse3HvMbS
	 EV2BMRlFDnTdCQPn5+Ko7t11rqJTHULOyKDZo+wuMCZTvjuaxSZ+7mRd5xOk2deNPs7lq
	 9xYN+6R5w/g7B+Qvsheafx35g1s718GZ5Zr9psxmdE8+3AHLXRuu2YfsJQ2I3+rzMFKOw
	 8B0/irbiS8DFskKstiJmN3RnJax8acd3HGobDIWyzfsK1OUvRLgphSPscfs1OeQaVslcq
	 S+6IkWefc/ki8SMzzTJwMnBQw1ZYDjOH7J7SBc8OkZzZ0ckbWywf6qkDvoacV0cxumg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens-energy.com;
	spf=pass smtp.mailfrom=errorhandling.siemens-energy.com;
	dkim=pass header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=c7qHa2XU;
	dkim=pass header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b="flnfQ/AO";
	arc=none smtp.remote-ip=185.136.64.133
Received: from mta-64-133.flowmailer.net (mta-64-133.flowmailer.net [185.136.64.133])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D175D606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D175D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=flowmailer.net header.i=@flowmailer.net header.a=rsa-sha256 header.s=s1 header.b=c7qHa2XU;
	dkim=pass (2048-bit key, unprotected) header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.a=rsa-sha256 header.s=fm4 header.b=flnfQ/AO
Received: by mta-64-133.flowmailer.net with ESMTPSA id 20261103133101d5e565c1920019fd61
        for <linux-kernel@vger.kernel.org>;
        Tue, 03 Nov 2026 14:31:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=s1;
 d=flowmailer.net;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=xSV//YIvQFpsiqfyOHHS9nn4wHPA8FQGa2A+LQxzVT8=;
 b=c7qHa2XUe0nQUUG5x9m1JM+8bXds4r+8wsf4K7xfsqNn7ddjPCMxA/TtzYlGuBD9DYSIyw
 J6Nj742SU7mgolKWgADLgsAwOnO3k+hau2RP/EZKzgHQ2NR0+FXGLdEDUD+DtVTyR2HL18Pw
 GMpQra7VrE2t+HYAm+9k86UngEAk0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm4;
 d=siemens-energy.com; i=schuster.simon@siemens-energy.com;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:content-transfer-encoding:References:In-Reply-To:Date:Message-ID:MIME-Version;
 bh=xSV//YIvQFpsiqfyOHHS9nn4wHPA8FQGa2A+LQxzVT8=;
 b=flnfQ/AO3o5TQ3/cOoYwkkucFhTBZUF7T3o3LY8cwpCmTrIn9p24LHXMpZVfOuerPn89T+
 kH7ckGZBPWdHu/3q3Qwfea4wjRRM3yrB4Kcr9JYPSQwtQAZYs1SLBRyeFj/GhtkC0nrTZyQl
 peNZIi/ZyDDa0oGHmoExUfTv2fgkdXALk8z0VEvTfyYno5BBhIhpFnvLX4aGu5LmmvzEkGRr
 51eBRGmiMwTnoVDyf8BlbKCH3d0Lxx5TrtqqS5OYwdkd2lR/7VkFmydtjmz4PTZcPU27uPdT
 ZI8S5rpSAljSZ+QaXcsjYWGrc0iyWtKOY+2EXpZwQy/b2NzcjOPc/GBg==;
From: Simon Schuster <schuster.simon@siemens-energy.com>
Date: Tue, 03 Nov 2026 14:30:29 +0100
Subject: [PATCH v2 2/3] nios2: export __divsi3_table
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
Message-Id: <20261103-nios2-remove-usage-of-libgcc-v2-2-5fabbedc49ec@siemens-energy.com>
References: <20261103-nios2-remove-usage-of-libgcc-v2-0-5fabbedc49ec@siemens-energy.com>
In-Reply-To: <20261103-nios2-remove-usage-of-libgcc-v2-0-5fabbedc49ec@siemens-energy.com>
To: Dinh Nguyen <dinguyen@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
 Vineet Gupta <vgupta@kernel.org>, 
 Simon Schuster <schuster.simon@siemens-energy.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793712660; l=3006;
 i=schuster.simon@siemens-energy.com; s=20250818; h=from:subject:message-id;
 bh=+9QxRmY6o4vxmPgi/ALJKWN2/H3nqYpovklxL5aNY28=;
 b=t6YtuXWcfrAhMN5jm6bcGifSTNOJCXXEyv1YqX4W948h5LBw1N6cU2rsmP7defTBKwGTKzAHa
 qZm2pw9mqXFAZIJjKBzwgLrKiJXsoyT5ByBH3hC/wAYNA4t8M+HToQx
X-Developer-Key: i=schuster.simon@siemens-energy.com; a=ed25519;
 pk=PUhOMiSp43aSeRE1H41KApxYOluamBFFiMfKlBjocvo=

As noted in <20261026234452.1086974-1-sashal@kernel.org>, gcc can
occasionally emit references to __divsi3_table, so we need to include
that one in libgcc-less builds, as well.

The definition originates from gcc/config/nios2/lib2-divtable.c that
was distributed in source by Altera as part of the nios2eds in
gcc 3.4.1 (Altera Nios II 6.1 b197) under GPLv2 or later.

lib2-divtable.c does not carry an explicit copyright notice in the gcc
release, the associated nios2.h is: Copyright (C) 2005 Altera.

Nonetheless, the table can also be regenerated by the following snippet:

perl -e 'for my $row (0..15) {
  print join(", ", map { $_ == 0 ? 0 : "$row/$_" } 0..15), ",\n";
}'

Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
---
 arch/nios2/lib/Makefile |  1 +
 arch/nios2/lib/math.c   | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/nios2/lib/Makefile b/arch/nios2/lib/Makefile
index 9d5bf1df520c1..86433dcaac7e5 100644
--- a/arch/nios2/lib/Makefile
+++ b/arch/nios2/lib/Makefile
@@ -7,3 +7,4 @@ lib-y += delay.o
 lib-y += memcpy.o
 lib-y += memmove.o
 lib-y += memset.o
+lib-y += math.o
diff --git a/arch/nios2/lib/math.c b/arch/nios2/lib/math.c
new file mode 100644
index 0000000000000..ae65cc11667fa
--- /dev/null
+++ b/arch/nios2/lib/math.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/export.h>
+#include <linux/types.h>
+
+u8 __divsi3_table[] = {
+0, 0/1, 0/2, 0/3, 0/4, 0/5, 0/6, 0/7, 0/8, 0/9, 0/10, 0/11, 0/12, 0/13, 0/14, 0/15,
+0, 1/1, 1/2, 1/3, 1/4, 1/5, 1/6, 1/7, 1/8, 1/9, 1/10, 1/11, 1/12, 1/13, 1/14, 1/15,
+0, 2/1, 2/2, 2/3, 2/4, 2/5, 2/6, 2/7, 2/8, 2/9, 2/10, 2/11, 2/12, 2/13, 2/14, 2/15,
+0, 3/1, 3/2, 3/3, 3/4, 3/5, 3/6, 3/7, 3/8, 3/9, 3/10, 3/11, 3/12, 3/13, 3/14, 3/15,
+0, 4/1, 4/2, 4/3, 4/4, 4/5, 4/6, 4/7, 4/8, 4/9, 4/10, 4/11, 4/12, 4/13, 4/14, 4/15,
+0, 5/1, 5/2, 5/3, 5/4, 5/5, 5/6, 5/7, 5/8, 5/9, 5/10, 5/11, 5/12, 5/13, 5/14, 5/15,
+0, 6/1, 6/2, 6/3, 6/4, 6/5, 6/6, 6/7, 6/8, 6/9, 6/10, 6/11, 6/12, 6/13, 6/14, 6/15,
+0, 7/1, 7/2, 7/3, 7/4, 7/5, 7/6, 7/7, 7/8, 7/9, 7/10, 7/11, 7/12, 7/13, 7/14, 7/15,
+0, 8/1, 8/2, 8/3, 8/4, 8/5, 8/6, 8/7, 8/8, 8/9, 8/10, 8/11, 8/12, 8/13, 8/14, 8/15,
+0, 9/1, 9/2, 9/3, 9/4, 9/5, 9/6, 9/7, 9/8, 9/9, 9/10, 9/11, 9/12, 9/13, 9/14, 9/15,
+0, 10/1, 10/2, 10/3, 10/4, 10/5, 10/6, 10/7, 10/8, 10/9, 10/10, 10/11, 10/12, 10/13, 10/14, 10/15,
+0, 11/1, 11/2, 11/3, 11/4, 11/5, 11/6, 11/7, 11/8, 11/9, 11/10, 11/11, 11/12, 11/13, 11/14, 11/15,
+0, 12/1, 12/2, 12/3, 12/4, 12/5, 12/6, 12/7, 12/8, 12/9, 12/10, 12/11, 12/12, 12/13, 12/14, 12/15,
+0, 13/1, 13/2, 13/3, 13/4, 13/5, 13/6, 13/7, 13/8, 13/9, 13/10, 13/11, 13/12, 13/13, 13/14, 13/15,
+0, 14/1, 14/2, 14/3, 14/4, 14/5, 14/6, 14/7, 14/8, 14/9, 14/10, 14/11, 14/12, 14/13, 14/14, 14/15,
+0, 15/1, 15/2, 15/3, 15/4, 15/5, 15/6, 15/7, 15/8, 15/9, 15/10, 15/11, 15/12, 15/13, 15/14, 15/15,
+};
+EXPORT_SYMBOL(__divsi3_table);

-- 
2.39.5

