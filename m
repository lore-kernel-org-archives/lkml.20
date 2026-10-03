Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6F139EF12
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791024029; cv=none; b=EkLq1AzGFcP37ktdL33fmr4u2feEf+ixj3nTwkteS3sgWDTSQ7AYiG6DAgGSbn0rvQYPRK40VgXyLA7K1CRVbJ0TOs31KXsNP13Du4+cXP7RRkxuM2DCxVw+WgO6wjZ860COphZ/6eILdsCkodhC3hkV2yeizRt6ASOIubXZ5wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791024029; c=relaxed/simple;
	bh=b4JBAqdz9pZsuW15MYpco3k06IjXQeV/jEl/m7pN3H8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LXKXlO2mUzrDF1UtR24rkjnoyCb/fHD4cOuJJXlplid4YIcYwZPgBBNmCJ14q0nceTYaifEXH/N5CfLeEpWM/xfmBrkvg4GoFaICTEplCbYGo8Hy175xsNhFEP/Da7T8uj2BXVp7O8sKkIlLblLY2PaaUMFpLEMAqpItBcj1O4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=CaVo+xW7; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=xBNzR80V; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="CaVo+xW7";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="xBNzR80V"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791024023; bh=8+wtaoKdshHGXTrcFDiEyZR
	rbWakCYvZ6yo/8fDDnVE=; b=CaVo+xW7zzIsTt44xh7NUDR/cl3sf5MrSFznV3yRfSQ/tC4iQx
	U1dq9se9wGrVq4wmvv6rC/G7/n9a1O5aAtGr4eeMIYDH7pjvYANFecNGhI7Wll65WpkQpnddRfL
	7lviMDDKfDBb4mZFRX221oSurtyHrtEK7GzMenEmVjs23TOB9CIdDx3q7ldCkkCTKIERWwTIFuD
	TQsgO+50+Q8yBJKWS+Ew5T7RTElD6h93pH/8TfnDbjIGBYmy7s3KioGvbyXZlg7BdbfU0swBSbz
	1iV7FdIQjIL0Nif9z/uYvk0nQQmTPYZ5N3J23oamRkvkQZJssttzausNytgvAUNiNvA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791024023; bh=8+wtaoKdshHGXTrcFDiEyZR
	rbWakCYvZ6yo/8fDDnVE=; b=xBNzR80VPw1Ipkq8qGB9q8bQ75PLIMIWGAzzrtRcSkOS+wEtyV
	daO8CBbS3Uc45m5+uAcRSWGNX+qNw0LdsoBQ==;
From: Bradley Morgan <brads@mainlining.org>
To: akpm@linux-foundation.org
Cc: blum@kernel.org, tglx@linutronix.de, dianders@chromium.org, linux-kernel@vger.kernel.org, brads@mainlining.org
Subject: [PATCH v3] watchdog/perf: one digit too short in the raw event config copy
Date: Sat, 3 Oct 2026 11:02:00 +0000
Message-ID: <20261003110200.3-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 6164be01f179 ("watchdog/perf: optimize bytes copied and remove
manual NUL-termination") swapped strscpy(buf, str, sizeof(buf)) plus a
manual buf[len] = 0 for strscpy(buf, str, len), and that count is one
short. strscpy() keeps the last byte of the destination for the NUL,
so the config loses its final digit, nmi_watchdog=r300,panic for
example ends up with buf = "30" and arms the raw event with the wrong
config.

The empty case falls over too, strscpy() with a zero count writes
nothing at all, so nmi_watchdog=r,1 leaves buf uninitialized and
kstrtoull() reads whatever stack garbage is sitting there.

The old code was safe on both by accident, it filled the whole buffer
first and buf[len] = 0 then stomped the comma position, so the worst
you got was a truncated parse failure.

Pass len + 1 so the copy includes the character the NUL replaces, and
reject len >= sizeof(buf) like it was before the optimization, which
also turns an empty config back into a clean parse failure.

Fixes: 6164be01f179 ("watchdog/perf: optimize bytes copied and remove manual NUL-termination")
Signed-off-by: Bradley Morgan <brads@mainlining.org>
Changes since v2:

- rebased on pristine mainline, v2 was cut on top of v1 so the diff
  carried v1's hunks
- the intro note moved below the cut, it ended up in the commit
  message in v2
- dropped the Suggested-by, review feedback doesn't warrant one

---
 kernel/watchdog_perf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index cf05775a96d3..a4f677c16b20 100644
--- a/kernel/watchdog_perf.c
+++ b/kernel/watchdog_perf.c
@@ -301,10 +301,10 @@ void __init hardlockup_config_perf_event(const char *str)
 	} else {
 		unsigned int len = comma - str;
 
-		if (len > sizeof(buf))
+		if (len >= sizeof(buf))
 			return;
 
-		strscpy(buf, str, len);
+		strscpy(buf, str, len + 1);
 		if (kstrtoull(buf, 16, &config))
 			return;
 	}
-- 
2.53.0

