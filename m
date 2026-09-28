Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EE036B938
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618750; cv=none; b=SCHLb5SSO02atIz/rkh/HnIuyy2Fc8yFcW08nikAC/sWu5ZVa6YT8ISkHcbBtEx92fUp61SpPq3aWXWxxf/8gvBT2dYuMhY3RcSdpQqb9o8DD4ewunJiLLHNBIRSp/KS2LuvQgGiv0Y0LDG0xkUQpEg2lDyxZKM3sKkoEBar7eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618750; c=relaxed/simple;
	bh=jA2qEEH/TqMtph53ziCcOv0zrk2sCF4ePafpeyrWq6M=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qH7Io8vrkLtc6oaenlT7C0zZtED3e3hErcn2bvGg9kyD2AF4d351TK1MNXguqmqxSPEfG1ODg6JXKMQBWR+LgTV1nyyjzC/be7uK6BMJ7CQx92ZyxRcthcbD7Zayy0SN2jLV84FuuGuhZDM1UieBxs+qLEJGnVISlGQ4W6Ni2Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NTDOqtny; arc=none smtp.client-ip=74.125.82.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NTDOqtny"
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1384427c3efso4908042c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790618748; x=1791223548; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FGnGZNXVf5jmkJiAI+lk1KmtJV6DT/Jw/yy0Z8sAbzw=;
        b=NTDOqtnyOfk/+G0RBPa5CwrG5OeoH+EWqfIHBWLE4DUCnBYd34D/IpSjSrBailzxQi
         vQgwuRkTUwF6iODU3s/RRVKeR46BzvbCT17eHYKpQYto/G079a8Qzn9MMx96gG+h8966
         ZsNwZfXEEIwiURsfcZtvB9raEUBoHwC8M8Qib9gALsiRxj642rSl5vJu36cL6DpzMBHp
         0YNz4iuSyDsRoPUciJ+m7sH/GUQre/qlY0SLKpx7aWbi3HSv+g2g6O5ZhNiisbjFfKw7
         YEvlQoEcc/2JJ2EtWIJbPFzjlz/hx6G8zn2y2jVNtjEFt9h+lBsotXQ973Nr4P07VgW1
         AsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618748; x=1791223548;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGnGZNXVf5jmkJiAI+lk1KmtJV6DT/Jw/yy0Z8sAbzw=;
        b=nEyiELx161MA5Wbllgjo/nuro3xIpeIADVxRF+ub7j1Ou9XDKMw04ZIEoo0HAElSzb
         oKDfJdm7ui0Hbyb4OR8vVwXErrrkfOgeYm4kK/6+FtMh4DEEIIZlbmQxQL6kumodKxYn
         vy0yThAa8ev6xgS3If8yoXjUXSh4tLTFucdlrypb3zM6HApzC1Xy0gOPRef7MvpHileC
         EK9FK/REO0+liGT7XU4KE74Eahz9ZFRtKZEbJ1tVpjFQBaDmCPySpUoNUxQ4pmuiAisu
         AJWDAtnbzn+ALzqnBdmd7ymMa0m2sMqakVEEgUdiAwhUKX/5PIXs1bJ/XE+Xtsl45En5
         W4pA==
X-Forwarded-Encrypted: i=1; AKwUvBx0h9iuWzLO9dpHcvZw2j2M8NBfN7o5o3r27opfWph3JX8jjdMfgFhxZjzlKr4d0xpbTGEXC5RJ4R+vkoM=@vger.kernel.org
X-Gm-Message-State: AFuF++nBDtvIHvELpAAUjI72uOdM29MXW+gEaVhgQoatD+N0ZN7XS2+J
	bxToStbibFgbPG+vRy5CJidVGzLgm2bYVFuKYwbKNN/fOCDM9Pc7+X939Prl2SPN12RNno5xDRK
	Fge8EnjWXmw==
X-Received: from dlbox15.prod.google.com ([2002:a05:7022:120f:b0:144:f706:dbd4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:d08:b0:137:c0a7:8d01
 with SMTP id a92af1059eb24-146d01af6a0mr14195283c88.23.1790618747052; Mon, 28
 Sep 2026 11:05:47 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:05:32 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260926223905.6865105-1-irogers@google.com>
Subject: [PATCH] perf test probe_vfs_getname: Also look for the probe line in do_getname()
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Leo Yan <leo.yan@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Since commit 9fa3ec84587c ("allow incomplete imports of filenames"), in
v7.0, getname_flags() only calls do_getname(). None of the lines the
vfs_getname tests search for are in getname_flags() any more, so the
tests always skip. Fall back to the initname() call in do_getname().

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
Tested on a v7.1.6 kernel with its debuginfo and fs/namei.c, which
perf probe -L needs. The three vfs_getname tests now pass instead of
skipping.

 tools/perf/tests/shell/lib/probe_vfs_getname.sh | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/shell/lib/probe_vfs_getname.sh b/tools/perf/tests/shell/lib/probe_vfs_getname.sh
index 88cd0e26d5f6..a4230a83bcae 100644
--- a/tools/perf/tests/shell/lib/probe_vfs_getname.sh
+++ b/tools/perf/tests/shell/lib/probe_vfs_getname.sh
@@ -13,6 +13,7 @@ cleanup_probe_vfs_getname() {
 add_probe_vfs_getname() {
 	add_probe_verbose=$1
 	if [ $had_vfs_getname -eq 1 ] ; then
+		local func=getname_flags
 		result_initname_re="[[:space:]]+([[:digit:]]+)[[:space:]]+initname.*"
 		line=$(perf probe -L getname_flags 2>&1 | grep -E "$result_initname_re" | sed -r "s/$result_initname_re/\1/")
 
@@ -28,13 +29,20 @@ add_probe_vfs_getname() {
 			line=$(perf probe -L getname_flags 2>&1 | grep -E "$result_aname_re" | sed -r "s/$result_aname_re/\1/")
 		fi
 
+		# Since v7.0 getname_flags() is a wrapper around do_getname().
+		if [ -z "$line" ] ; then
+			func=do_getname
+			line=$(perf probe -L $func 2>&1 | grep -E "$result_initname_re" |
+				sed -r "s/$result_initname_re/\1/")
+		fi
+
 		if [ -z "$line" ] ; then
 			echo "Could not find probeable line"
 			return 2
 		fi
 
-		perf probe -q       "vfs_getname=getname_flags:${line} pathname=result->name:string" || \
-		perf probe $add_probe_verbose "vfs_getname=getname_flags:${line} pathname=filename:ustring" || return 1
+		perf probe -q       "vfs_getname=${func}:${line} pathname=result->name:string" || \
+		perf probe $add_probe_verbose "vfs_getname=${func}:${line} pathname=filename:ustring" || return 1
 	fi
 }
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

