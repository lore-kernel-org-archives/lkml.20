Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9069917BCA
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986022; cv=none; b=Y7bMacJMdO6P9P4iwmzNzFeIEFR4bq1OqtHvAJNILhndYIo+Kp5V5dab9Y6FjE4l9JTTAlDiedLy6zXYo1EKx/Okv9FxLhEU9VcBlQ1o70deX1KM+YuxZAk9e9CFUo2gJCqysjDDWa4mL7iJbbsa27QbLhulcvfg2RBKDswFf0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986022; c=relaxed/simple;
	bh=7lWCA+ds2kzJxk7k/X6iGCwYFVaFcweC2tbK44mPPdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tfReY8z78vDr+dnBcoTl/TY+akmCgrXTUgZR+Xynx+XyHYo41VQ2uPJ3CT/jPvzohaDoPyo1D3YdGyBV4cobxuQ7ENoxTX0aHyVLKJmI+wsx8uhUkUSa1fmajX9ce9K7WuyfFsCOFB5EIPRvAkyeQjMohJ0CV/C6ypi5Zd5268s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Qpnq5eDC; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=smA5zSrM; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Qpnq5eDC";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="smA5zSrM"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790986009; bh=BgA/woJloVEVuEOFK/bU02+
	k3kWsHXUXXsgknq320eI=; b=Qpnq5eDCqTdEfLjhYxHUerVRX2X+20NtQhSFQ39BW7/8zoucdu
	Wj6PhKlrgfbJvi4fpXpAKjtUONBdS8Pi2vwR8m0DFccnmiW74nimF/CuxUM7L+5c6WVZ8R973gB
	gBXAk/gzaQwr0NAYFtEAvFAIMC8UefuT3FpCleBoogwPdPfPcgCJt8PnNNivrbzhNtTNYRICr4+
	JPyq+OIhYvLEZCUuoTo81Va1d5g4npiveFPZFcbpx8mVNhp7/Fl/TL8FmTFEtk0JpTjW0GD2o8l
	cpibODpdmaEN7dOyMls/FCIpDiit5DDaWT9iMLEQmfSPvdfaKDYmJBHXg8hwtdThUdA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790986009; bh=BgA/woJloVEVuEOFK/bU02+
	k3kWsHXUXXsgknq320eI=; b=smA5zSrM4Yli4nrrRz3MhbC34U9WTxp/YwAuqCOrXqx7cqgE4A
	4XcAgovgzeJbESzuZSpZCFnPxZxWtN1qmSAQ==;
From: Bradley Morgan <brads@mainlining.org>
To: akpm@linux-foundation.org
Cc: blum@kernel.org, tglx@linutronix.de, dianders@chromium.org, linux-kernel@vger.kernel.org, brads@mainlining.org
Subject: [PATCH v2] watchdog/perf: fix off by one in the raw event config copy
Date: Sat, 3 Oct 2026 00:08:00 +0000
Message-ID: <20261003000800.2-brads@mainlining.org>
In-Reply-To: <CAD=FV=U-uH7iTA8Gs_vTqzbKjpk9uwCiSRGbPchmJc7DAWR43w@mail.gmail.com>
References: <20261002175000.1-brads@mainlining.org> <CAD=FV=U-uH7iTA8Gs_vTqzbKjpk9uwCiSRGbPchmJc7DAWR43w@mail.gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

You were right, the truncation was the bigger half of the bug and my
v1 only closed the corner. Fixed both with your len + 1 shape.

Commit 6164be01f179 ("watchdog/perf: optimize bytes copied and remove
manual NUL-termination") replaced strscpy(buf, str, sizeof(buf)) plus a
manual buf[len] = 0 with strscpy(buf, str, len). That count is one less
than the code needs, strscpy() always reserves the last byte of the
destination for the NUL, so the config loses its final digit.
nmi_watchdog=r300,panic for example ends up with buf = "30" and arms
the raw event with the wrong config.

The same count also drops the empty case on the floor, strscpy() with
a zero count writes nothing at all, so nmi_watchdog=r,1 leaves buf
uninitialized and kstrtoull() reads stack garbage.

The old code was safe on both counts by accident, strscpy() filled the
whole buffer before buf[len] = 0 overwrote the comma position, so the
worst outcome was a truncated parse failure.

Pass len + 1 so the copy includes the character the NUL replaces, and
reject len >= sizeof(buf) like the code did before the optimization,
which also makes an empty config a clean parse failure again.

Suggested-by: Doug Anderson <dianders@chromium.org>
Fixes: 6164be01f179 ("watchdog/perf: optimize bytes copied and remove manual NUL-termination")
Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 kernel/watchdog_perf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index cca0485ba28c..a4f677c16b20 100644
--- a/kernel/watchdog_perf.c
+++ b/kernel/watchdog_perf.c
@@ -301,10 +301,10 @@ void __init hardlockup_config_perf_event(const char *str)
 	} else {
 		unsigned int len = comma - str;
 
-		if (!len || len > sizeof(buf))
+		if (len >= sizeof(buf))
 			return;
 
-		strscpy(buf, str, len);
+		strscpy(buf, str, len + 1);
 		if (kstrtoull(buf, 16, &config))
 			return;
 	}
-- 
2.53.0

