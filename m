Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAC4476071
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791136484; cv=none; b=BH1pwkLh2FeyZP1lZCJ6YCJcvxV6faEnvQo+YfZSnNbiczc7CJw/lj2Qe3S7OdRTDZ17XClec7SNhZA6ITmFxe3Pgpd4wgLaEmyMfRCWEa71MIcQ2KkMR4TtNFwqHtPa9NJgPuZDp4L5E5AouLP0s9C7zw01aRqh2kDrMKdKfgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791136484; c=relaxed/simple;
	bh=zMZ1jCSGPsmB6EtJXrK3GU7emA2Xe5E2w3+mNyyu/64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sIxte/vETI7CzCAFgBwoPwcphXCuZtbblgJgwX9ekEG/Tq3ctCzXJMYAFK54D1QgAfdbkS69AoUOJN8Ona1qXfw5fyiAwHcMBsSUiwWNaQUZx7U2tZGBeSJb4S/59NLCe2cKyCiHdg9d3VEM3uESYGW/XV1DguGvG0zo6naGiGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Gk886uCW; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=JHkygbHt; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Gk886uCW";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="JHkygbHt"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791136461; bh=rr21VEWMWC4/MTnhmZNxFlr
	tAEB0c6JEAyEZvFOt8kg=; b=Gk886uCWE3W91vX5/3yMGaAOXqHonyPhTlKb1MkdlHskkUPZxo
	eCDyuSjB0HVlHtJq/FTJdfRVU2mOBGIh0DaW1co0imWLslYYGvL5+jZiVFJeLBvQZM3TAXD+Lwc
	Wpm46fPaPvI+JVTsIJuI2UYvXckGplvniTfhWbfjvsFpnN0MqGtWwpk68wfLce0dV2T3KhO3js2
	jirGmrFZ/UEXHEYho3E7f3UAYHDYqBoWd9xuRAhZah7Dvlnyt5GoS1Bf2SDLim8aWzEcOk4WTbK
	y+ydNIk7r6PxZL7BzSs2n6lMKUCi5BKDzWHRfGDN0oQIqe9jTCEMuTTI2EDCNbkMr1Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791136461; bh=rr21VEWMWC4/MTnhmZNxFlr
	tAEB0c6JEAyEZvFOt8kg=; b=JHkygbHtpIdes6/ARztsc/gmRzLEM6j3PlYD8VptXEiVJIMqkw
	4YlZGjjvMAE0i0/RS7dBETMOUVmTfrMKzJCA==;
From: Bradley Morgan <brads@mainlining.org>
To: pmladek@suse.com
Cc: akpm@linux-foundation.org,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	brads@mainlining.org
Subject: [PATCH] panic: drop the fake trace id from the oops end marker
Date: Sun,  4 Oct 2026 17:54:19 +0000
Message-ID: <20261004175419.269865-1-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

print_oops_end_marker() prints "---[ end trace 0000000000000000
]---". The format pretends each oops has a trace id, but the value
has been a hardcoded 0 since the oops id machinery was removed, and
nothing prints an opening marker anymore. Nothing in tree parses the
id either, the pstore selftest greps for "---[ end trace" without it.
Kill the fake id, the format specifier and the 0ULL argument go with
it.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 kernel/panic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/panic.c b/kernel/panic.c
index 213725b612aa..0436a92318ed 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -1051,7 +1051,7 @@ void oops_enter(void)
 
 static void print_oops_end_marker(void)
 {
-	pr_warn("---[ end trace %016llx ]---\n", 0ULL);
+	pr_warn("---[ end trace ]---\n");
 }
 
 /*
-- 
2.53.0

