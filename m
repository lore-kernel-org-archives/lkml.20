Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BD439F160
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787770094; cv=none; b=IRnoqgdIjghxZAYbVwLxBo4YmQpE/2wuJAJNKQJC9cMft3cirHKXUjTuQfF48jsNLsa9Jst/aCgnmWx9Bt2BHHF2PQ14Xy5wuvcPJLrflbXIu6ZiHNic3wGBAq1RM9+2Q8MUlhlIQi7bZB8qzj3yctxlrw1SBDqENfQ9bILi5S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787770094; c=relaxed/simple;
	bh=efJ7OzdzKldWooGfysUltqqJ5ryhNVoM0o3wKqoeieE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=U2Dv0c7enKD1vRwmCZa1OFhdU/Uvr+19IWCF/dAltpQpZLRJK3Y5tx2vQSFTuG/fHka0PGIUia4l5MoPhw+ZvJdOo0sSi7TBMd63bjUSywsg5cr6trW+fzkefGUPg0r4YSSqbQCO8DbSnp7l+YbT97nHHxXqLzlUaX7elZO6Kvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=pyyO2f8F; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="pyyO2f8F"
Received: from omf01.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id D2C641A01EF;
	Wed, 26 Aug 2026 18:47:57 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf01.hostedemail.com (Postfix) with ESMTPA id 15A7860011;
	Wed, 26 Aug 2026 18:47:55 +0000 (UTC)
Date: Wed, 26 Aug 2026 14:48:41 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Gabriele Monaco
 <gmonaco@redhat.com>, Kuan-Wei Chiu <visitorckw@gmail.com>, Nam Cao
 <namcao@linutronix.de>
Subject: [GIT PULL] rv: Fixes for 7.3
Message-ID: <20260826144817.7af76334@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ud4msytimxp5zjy7wd7m9octjx4zdbqe
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 15A7860011
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX199BPvgGHMg2daSkG6mI3bgdmWjF4amp/k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=zrsEN1+9v/Vwvujs3u/9dsl0EZPGGG9pCS6180WDFDk=; b=pyyO2f8Fzs32bsyVRwYAGoN2m/88NrR6CYKSU5dtvO2UeaFthrf+2fxRgSjyEPSrLF2pw2wgbOQIm1Id3OHGjRXpAw1jziiHImpZTuBtRuNK+RU1E+MnnChBqfIpXSzxgAsIsFZU4F0Epvd59UHm/uNwwQh9cFaIbd8jyiYmBvE=
X-HE-Tag: 1787770075-9801
X-HE-Meta: U2FsdGVkX1+1ufxPeW1U7kfM0X6YMfieLInfY7vgJeiP2f+HnkkEGuixqutAXTiMOgSKROBy/GqOYO59fO/nYgHYvZZQtPiN9MC3dGPBWnd3gHxtdFvJzZ8DQ7h5Wj4+gyEKv+dBsS2xLSQkgBDsAltzFvTV5T6oEJ5gYKv7Cj3ApT6BhuAvdStlbkBSOgRuCSlXQlPp/NsSyWkvOmkOgpB2rPF4L7ulK+vCGZqResBHF83T0M+iEvKkyWkdzZT7Cko5yZKyU+uqsg5dsYI5f5Ma1AvTeYsQ9iKqH8w6Iiejk4/5IS6hhEDtnKHMLPNp/IiYvg/vwZoltHmmjGnTmDBIU1Gzj892F9QtZ4WUmd4VYGgI/kafGa66zE8kwK8JV42HgYLNm+1HilIoJbf5pbT8EsuO/oqW


Linus,

runtime verification fix for 7.3:

- Use .old instead of .bak for rvgen kunit backup files

  The rvgen kunit command generates .bak backup files and these are
  checked in for selftests as "golden" files for make check. Clean
  make disclean removes such files, leaving the tree dirty.
  Switch to .old to preserve a clean tree after make disclean.


Please pull the latest trace-rv-v7.3-2 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-rv-v7.3-2

Tag SHA1: 59b4def9b53efdd6c9e83f6a32aabf8b7001652a
Head SHA1: ab0304fd69b07605553e9f161d65ecf9ccc2e2fe


Gabriele Monaco (1):
      verification/rvgen: Use .old instead of .bak for kunit backup files

----
 tools/verification/rvgen/rvgen/kunit.py                                 | 2 +-
 .../{test_bak_kunit_kunit.c.bak => test_bak_kunit_kunit.c.old}          | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tools/verification/rvgen/tests/golden/test_bak_kunit/{test_bak_kunit_kunit.c.bak => test_bak_kunit_kunit.c.old} (100%)
---------------------------
commit ab0304fd69b07605553e9f161d65ecf9ccc2e2fe
Author: Gabriele Monaco <gmonaco@redhat.com>
Date:   Mon Aug 24 10:15:19 2026 +0200

    verification/rvgen: Use .old instead of .bak for kunit backup files
    
    The rvgen kunit command generates .bak backup files and these can be
    checked in for selftests (make check). Clean targets like make disclean
    remove such files, leaving the tree dirty.
    
    Switch to .old to preserve a clean tree after make disclean.
    
    Reported-by: Kuan-Wei Chiu <visitorckw@gmail.com>
    Closes: https://lore.kernel.org/lkml/aosuwKH5GOEo0xTN@google.com
    Fixes: 7b6246294eb0 ("verification/rvgen: Add selftests for rvgen kunit")
    Reviewed-by: Nam Cao <namcao@linutronix.de>
    Tested-by: Kuan-Wei Chiu <visitorckw@gmail.com>
    Link: https://lore.kernel.org/r/20260824081519.81103-2-gmonaco@redhat.com
    Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>

diff --git a/tools/verification/rvgen/rvgen/kunit.py b/tools/verification/rvgen/rvgen/kunit.py
index ed2082d7d3bc..85973f918c9b 100644
--- a/tools/verification/rvgen/rvgen/kunit.py
+++ b/tools/verification/rvgen/rvgen/kunit.py
@@ -173,7 +173,7 @@ EXPORT_SYMBOL_IF_KUNIT({struct_name});
             for path in (header_file_path, kunit_c_file_path):
                 if path.exists():
                     try:
-                        path.rename(path.with_suffix(path.suffix + ".bak"))
+                        path.rename(path.with_suffix(path.suffix + ".old"))
                     except OSError as e:
                         raise KUnitError(f"Error backing up file {path}: {e}") from e
 
diff --git a/tools/verification/rvgen/tests/golden/test_bak_kunit/test_bak_kunit_kunit.c.bak b/tools/verification/rvgen/tests/golden/test_bak_kunit/test_bak_kunit_kunit.c.old
similarity index 100%
rename from tools/verification/rvgen/tests/golden/test_bak_kunit/test_bak_kunit_kunit.c.bak
rename to tools/verification/rvgen/tests/golden/test_bak_kunit/test_bak_kunit_kunit.c.old
