Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D605C49363E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 19:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758542; cv=none; b=h70I1h4Nm4iUgN328MVMBPLU1OiZijQ/32JKiGNlYraV+t4LQlqQrncBIDQMBjQL0kEdkqp/2/iLTxXRTn0HdTmXklQQdM329cKau3aHLDjSscs6V6iRMd7PH5i2rBn4k0pXSGwuRdAgAYnIUknOHuaVVkrHdn2NnWTdgOEFfOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758542; c=relaxed/simple;
	bh=vtzHYOZsL+DsQ6OU9w78rV8QDnNXXiUdKTEDMcuSfOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WSy6ATfRNCiHdZxnOw8uKGzkdGFDdJ3cNlUC69+7pG6RwQJ9IE+R111lSvs6H8d3MbaBL+iVNYUlT3zEeZYHWDPv3ct3m3soXsuGXP5Y+nYppNIqlevWz88AKd4Er3C49+RWESeYdWS4rTtxyDSdb4l2H66N3+F1UXqHHdhUIb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tAO9a1HG; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tAO9a1HG"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso10193565e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789758530; x=1790363330; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlR8Li9AQguqMj6ZVMr+f+KkK5/jHymLg1fc6OgUNdE=;
        b=tAO9a1HG7XGoxqkPakxi3HIQETvzhB6Mh5wmYoYTbJBS5K4++O6jVR8fhGXM2Z4YjE
         ikpKBFsKE3QJ5FoCH/6wmgZCTlJduc6RNSzwjJd7+8G9HOuHgdyrF0oD4NC2gAyrbQS/
         5Q63wh3DuniqtjfkcHorOr94t4no5mNREH21rK9ZUa/c2h8RWmAVerfc6eBYYzLK9HVm
         oEAOkE8jvshinrKvF6vdYyc/hReFGrbFZ8oUW9uiQFLwDo76tlJ8X5Bzt8I9X5U9Qs2G
         Nm+WuL/w0eXqXGSdcN56FJ526L9GQyKsXqRg0Oe2M9IJWZN5oJJeFBuD7gTtvXK03Wlg
         NmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789758530; x=1790363330;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KlR8Li9AQguqMj6ZVMr+f+KkK5/jHymLg1fc6OgUNdE=;
        b=FEAp0kJyXIL+Tqf6fq5/s6zuS/g+PZXB/Hd5NYurGjOq24hFAkN9z4uj0RE3xUXhzZ
         PtIDL3uhIqh8eaApENTx8xGN88UwUY58YTM7cy/NCAUsPh2ZZs5kcvDk+z3xr8uTWOrm
         JZ2Ce902TJlpPP8mLBOEx0o6Zuf0069WJDEYFryd4oxvYl0t5iK/41z5j0jrRdiaAYF5
         cqCQ7zAq3oMmLpNdnfATjRxHCKpV2qa6R7kB5R4IclFst8d8vnBghKbcW/AISarcPx9Y
         i5n/OsCO9aU41d7QQYMQTs6lVQ+pZQcm1i46tVfiteC4tMolQJoc+L5YFBc4xKtRnF9B
         +Y8g==
X-Forwarded-Encrypted: i=1; AKwUvByXG6IRY/CDJgGc1ep080BlsD4t3olsTU+VEv0x5I13pLVv6wtUndmF4RitQ7yycLNhDusIcnU0qpPtPWI=@vger.kernel.org
X-Gm-Message-State: AFuF++nKnE+zuw8qZNsaCQpHTa/9A8qBupahKjf3OJTnV3UV+NEBmS8z
	iTgMxOxzceDDu56O/nXvkcqVMyYm6s9gc7ZdfcnZdGRtLGtPniXKlhxj
X-Gm-Gg: AYBFou35auZprYaSWatgd6/nkaUWPkaln+YFX+NzBD45mmu54Cs4tMiiT2WDqpiVRWL
	hREP6RoPi+qe4V/G4SH2jqnvIQ+cwxRSC5eSDqHzPsrwEWP8+mVx2BWVKcqXoA/Y7GzoNFoTIbF
	pOlqR+6zYlg3lWulJBZ4MIc7Sy3/lwt60mZxoADT1ilV9QlRSkdW9S1RBuzYNYsm0auyCEqizDg
	pKlI9OfQXHwuASdXVJvX0s3YeQ1p2OD2JmI5o7LjqTowL0UITIMydk5hjRZ4QtD5/5kfq0km0/l
	1i2IDQczkI5zRIOmR09VW8oH9Cc1sYYe/IEFM9DhuHEsXyYgmKtHGSjPhhJ6RfrzFXRLte8+Vuv
	l5e0Fb0QaNNjeEr47tOay+lIToyiP+sCQru5l/GdFeDUARtTxLFD1IlGac5QZKJIgF/Nxziy1Cu
	9/5rlX0S+yb+KhVsVGnPFxrgkkBmvqs7jRoRpm0uahRis5+Ipum0RH1eeLn2umTVRaSiJ883RO7
	CGaxyyhVOAgAvtVAr8V9saMAINCGN8i4Qc=
X-Received: by 2002:a05:600c:c1c8:10b0:49e:81a7:9fbc with SMTP id 5b1f17b1804b1-49fc574aacbmr35802825e9.24.1789758530233;
        Fri, 18 Sep 2026 12:08:50 -0700 (PDT)
Received: from eldamar.lan (c-82-192-247-196.customer.ggaweb.ch. [82.192.247.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0874c3sm20217525e9.14.2026.09.18.12.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 12:08:49 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id CE28FBE2EED; Fri, 18 Sep 2026 21:08:48 +0200 (CEST)
Date: Fri, 18 Sep 2026 21:08:48 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: stable <stable@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	James Clark <james.clark@linaro.org>,
	Collin Funk <collin.funk1@gmail.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>
Subject: Please backport subset of 2f5d370dec3f ("perf test: Change all
 remaining #!/bin/sh to #!/bin/bash") for stat_bpf_counters.sh script to
 v6.12.y and older
Message-ID: <aq2MQLKmyrxkFd0Y@eldamar.lan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

Recently for v5.15.221, v6.1.188, v6.6.157, v6.12.110, v6.18.52 and
v7.2.6, the commit b02027776ac5 ("perf tests: Fix flakiness in BPF
counters test on hybrid systems") was backported, but it introduced
bash specific syntax.  For versions after 2f5d370dec3f ("perf test:
Change all remaining #!/bin/sh to #!/bin/bash") aka before v6.17-rc1
this is not a problem.

The proposed patch is a stable series backports specific one, as one
cannot simply backport 2f5d370dec3f ("perf test: Change all remaining
#!/bin/sh to #!/bin/bash") without picking as well some other context
related changes to make it possible. So I was proposing to only change
shebang to #!/bin/bash in stable series were it is a problem, as in
the stat_bpf_counters.sh script.

Regards,
Salvatore

From 1e3d5b5f62047b147428d20bf2cb794bb0bb300d Mon Sep 17 00:00:00 2001
From: Salvatore Bonaccorso <carnil@debian.org>
Date: Fri, 18 Sep 2026 20:48:59 +0200
Subject: [PATCH] perf tests: Change shebang for stat_bpf_counters.sh to
 #!/bin/bash

When commit b02027776ac5 ("perf tests: Fix flakiness in BPF counters
test on hybrid systems") was backported to several stable series
(v5.15.221, v6.1.188, v6.6.157, v6.12.110, v6.18.52, v7.2.6) it
introduced specific bash syntax. For versions after 2f5d370dec3f ("perf
test: Change all remaining #!/bin/sh to #!/bin/bash") in v6.17-rc1 this
is not a problem as the shebang was already hanged to #!/bin/bash. For
the older stable series this introduced invalid syntax if #!/bin/sh is
not bash:

	$ sh -n tools/perf/tests/shell/stat_bpf_counters.sh
	tools/perf/tests/shell/stat_bpf_counters.sh: 12: Syntax error: "(" unexpected

	$ checkbashism tools/perf/tests/shell/stat_bpf_counters.sh
	possible bashism in tools/perf/tests/shell/stat_bpf_counters.sh line 52 (bash arrays, ${name[0|*|@]}):
		base_instructions=$(perf stat --no-big-num -e instructions:u -- "${workload[@]}" 2>&1 | \
					awk -v i=0 -v c=0 '/instructions/ { \
						if ($1 != "<not") { i++; c += $1 } \
					} END { if (i > 0) printf "%.0f", c; else print "<not" }')
	possible bashism in tools/perf/tests/shell/stat_bpf_counters.sh line 57 (bash arrays, ${name[0|*|@]}):
		bpf_instructions=$(perf stat --no-big-num --bpf-counters -e instructions:u \
					-- "${workload[@]}"  2>&1 | \
					awk -v i=0 -v c=0 '/instructions/ { \
						if ($1 != "<not") { i++; c += $1 } \
					} END { if (i > 0) printf "%.0f", c; else print "<not" }')
	possible bashism in tools/perf/tests/shell/stat_bpf_counters.sh line 68 (bash arrays, ${name[0|*|@]}):
		stat_output=$(perf stat --no-big-num \
			-e instructions/name=base_instructions/u,instructions/name=bpf_instructions/bu \
			-- "${workload[@]}" 2>&1)

Change shebang for the stat_bpf_counters.sh script.

No upstream commit exists for this change as for versions post 6.17-rc1
the scripts were converted to #!/bin/bash already.

Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>
---
 tools/perf/tests/shell/stat_bpf_counters.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/stat_bpf_counters.sh b/tools/perf/tests/shell/stat_bpf_counters.sh
index 76d4a7f15a43..c4f71bfc0fc6 100755
--- a/tools/perf/tests/shell/stat_bpf_counters.sh
+++ b/tools/perf/tests/shell/stat_bpf_counters.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # perf stat --bpf-counters test
 # SPDX-License-Identifier: GPL-2.0
 
-- 
2.55.0

