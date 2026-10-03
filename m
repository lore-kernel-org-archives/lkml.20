Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC9B41229C
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791024098; cv=none; b=jn/ofJzaN1j/gIrV/aij+4lknvwqYrv59sYcwv/JIRc5lrYV+gXDi9F6nVNe5eF+f4efpwIM3zk9YsYzAxwOZ3dBYTC0A/WHnYKUEFERtNTlPbJ9CljLa1bZpOTa6/Ca2hzkX7UWx7bc2gVQvg67NMKEKmQz7+G9eVGsmXoNLEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791024098; c=relaxed/simple;
	bh=D7L+BhHg7vQhQCsYvmsuNzFCBtkt2sIu0FN/eKS6Gc8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=J/v3Xb52Bv9fpSB6iQvKla2M7wfBRTDFZ0Kq69Ju64bFGVMwuM13QVdDyJjQGpu1kJAzeYuaBw8iWKMyZc85EnNGqm7pGiRuTlrcasOCqaDuz1SIJ6HGBSnKi/VNT4A7VhzTmlLpdjcuhsMCaPJUqHSW78bvQD70OTEvTHH+WkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Ro5UNJIX; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ioRx17Cz; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Ro5UNJIX";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ioRx17Cz"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791024089; bh=TUcgI7jQx/EonpL1bhoagcm
	pdrpC5tkISLtFAHtECCk=; b=Ro5UNJIXf9nfVwRA7nYv/zhgMIqer8jNeUGU3Df19H4Ta9uUzi
	OgpNrXH3pzR/SBK3MgqPxUdmHwLqAiVj7wXDGm3ceqPKT7HyoTdjK4L3pxYUMDxLcWMQgwQeur6
	SnDdoKSxKLVAYbkQiTUGUzrrRYFuMCwPRSbNxMD0fgn+Oj/4Fy5+I4p3+EHKz7mJOqTpUiXquqQ
	1zhOvJgGy7Vdc7hm1fsc2CeSOPy+oIM6TuZpFb0wZ7QEXk0bU5LiB+Jrm22G/ykTGc8otdKWSiU
	WdKNfsZIGxYLTNiNtL+YKmJfR/CXXyjcqkKiN/pVApwKyt9wkGOsbWl91QzocH8Cmfw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791024089; bh=TUcgI7jQx/EonpL1bhoagcm
	pdrpC5tkISLtFAHtECCk=; b=ioRx17CzNRMaXhuXTMZjfgV4Mzb4x037ELQ8Cp1O41yjJZOwNP
	LdSQi+FlC0/3RVQtkTCew6KWtGAx/qvUi+Dw==;
Date: Sat, 03 Oct 2026 11:41:30 +0100
From: Bradley Morgan <brads@mainlining.org>
To: akpm@linux-foundation.org
CC: blum@kernel.org, tglx@linutronix.de, dianders@chromium.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3=5D_watchdog/perf=3A_one_digit?=
 =?US-ASCII?Q?_too_short_in_the_raw_event_config_copy?=
In-Reply-To: <20261003110200.3-brads@mainlining.org>
References: <20261003110200.3-brads@mainlining.org>
Message-ID: <2AB484EF-0CFE-46FE-A93B-010933F3EF2B@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 3 October 2026 12:02:00 BST, Bradley Morgan <brads@mainlining.org>
wrote:
>Commit 6164be01f179 ("watchdog/perf: optimize bytes copied and remove
>manual NUL-termination") swapped strscpy(buf, str, sizeof(buf)) plus a
>manual buf[len] = 0 for strscpy(buf, str, len), and that count is one
>short. strscpy() keeps the last byte of the destination for the NUL,
>so the config loses its final digit, nmi_watchdog=r300,panic for
>example ends up with buf = "30" and arms the raw event with the wrong
>config.
>
>The empty case falls over too, strscpy() with a zero count writes
>nothing at all, so nmi_watchdog=r,1 leaves buf uninitialized and
>kstrtoull() reads whatever stack garbage is sitting there.
>
>The old code was safe on both by accident, it filled the whole buffer
>first and buf[len] = 0 then stomped the comma position, so the worst
>you got was a truncated parse failure.
>
>Pass len + 1 so the copy includes the character the NUL replaces, and
>reject len >= sizeof(buf) like it was before the optimization, which
>also turns an empty config back into a clean parse failure.
>
>Fixes: 6164be01f179 ("watchdog/perf: optimize bytes copied and remove manual NUL-termination")
>Signed-off-by: Bradley Morgan <brads@mainlining.org>
>Changes since v2:
>
>- rebased on pristine mainline, v2 was cut on top of v1 so the diff
>  carried v1's hunks
>- the intro note moved below the cut, it ended up in the commit
>  message in v2
>- dropped the Suggested-by, review feedback doesn't warrant one

For god sake, not again, since I'm lazy, just ommit the changes since in
the description Andrew. Imagine it's just below the ---

>
>---
> kernel/watchdog_perf.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
>index cf05775a96d3..a4f677c16b20 100644
>--- a/kernel/watchdog_perf.c
>+++ b/kernel/watchdog_perf.c
>@@ -301,10 +301,10 @@ void __init hardlockup_config_perf_event(const char *str)
> 	} else {
> 		unsigned int len = comma - str;
> 
>-		if (len > sizeof(buf))
>+		if (len >= sizeof(buf))
> 			return;
> 
>-		strscpy(buf, str, len);
>+		strscpy(buf, str, len + 1);
> 		if (kstrtoull(buf, 16, &config))
> 			return;
> 	}
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
