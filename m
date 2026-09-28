Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC4039E6F8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790620019; cv=none; b=iN0L6PL8KMNiob8CSK6PrlJG88A6OXZ2mvwRmoALw0HuFWMTKuZqOUfxyuYiclfQYcdrEumnyg8FlxH3kd3bFAA1T30LuIJ1BTvSGIRGJ2uQGfMm/u23In3v6nenridvPKkoP166JT2hGlf0p/KIPBSKGlZNXKdcSTKBZHFzrgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790620019; c=relaxed/simple;
	bh=QBJ1TXfroVLT43aUlu0VYJShdQ/5P4Nw9+kV1JnrH+Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Csl84m4anb+ku3X7bYbBNsMq4v/RxLlgm/IaUkPST+8HuMLnBfTeDRJqu21oUD/hF5So9YaWDzt9Pp9Hse6a8AUnNbHfReGLecg320jN3nCyKldMRWnta6DXl/c6+9IY89c40SBN0hu2oolnoks6ExxYdREdPLJQ5hkD3d1WoAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U8qJuNdn; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U8qJuNdn"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34afa104860so80228eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790620017; x=1791224817; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qetGO+kJtSrkzooD0K52/h3hxl/7qmQXLVxIGMd1obU=;
        b=U8qJuNdnWkRFrRnmDbV65SEQ7tTWR6wG5Vsr4jIEOeUnv6qOK5+h/c1Dbd39W1qOmh
         7In6AxKkmWc1wIGPZTwZNOyYb46oPjQVaj6caHP9SUA9tqgkVNogJkOHNuVAfmAnf7FU
         9RH8+niqRagwUZD9394U/gRoUxdqzb68VR8TPDgpaXmEyItBxKDr79D2QmmiWxubftMk
         Sr/dJkGIFGNLDklNI4WRiJA57bx/gCBJ75reVPAKav3qEvDNIhBwxXZ/7f4TKFfOxCBc
         4o7nmPWDzcsoY8/oFxaeFFP+BXYsftr0ZHDYQleIteNKXFiYxIl8M8vbLkLWy386SvCb
         DGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790620017; x=1791224817;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qetGO+kJtSrkzooD0K52/h3hxl/7qmQXLVxIGMd1obU=;
        b=Z1w1UrTsABMHOGY+O3/VSuN0WQoBEry92coaloH1QIte+P2ZZNjUJh1Le6AWl5STlp
         TTD8QQRoT8uuBCBADQi3wL2KhZPArqtiMq7W9pFivvkHA9AO6uM3oq5X3s9axnka5NMJ
         FcfZvEW3eshXkFQyJGPjcHBCC+zaLUUtXxOKZZ5ljgn2LQykysk9qfLwFQtrloUOg+lB
         sPpNhDZYjTD6M7arZ1rBxDHkwlkurfsn+KTUC+GmfP2E3+FnNn/yanQGZut7wo7m0BbX
         Qa4DqLyXaILbA+Po66le3nSOYwugxIdZ4ZyUjop8V85kRwOnx1pjyBadyWkSyk0KAUuE
         TcCg==
X-Forwarded-Encrypted: i=1; AKwUvByVsJiKQUqaHkDBKHuQn4AHa2jMu+zKinyv28juBevNtoVDjn1l89x7RpylgAdF7lVxxNmeCEFqfUECKiE=@vger.kernel.org
X-Gm-Message-State: AFuF++kAGAF7qsTOrzrxeg/yQ0ti7S5/Eioe85VNzr38jotf6Nz6a7dS
	GGTYH7REcE18dNZC22dsNkoam7f4v+yM2n4GvCMV3KRB5hobYwpGHJlK6KEdxSAyeB1IND0jFM0
	SuleqTuEx5w==
X-Received: from dlbsw8.prod.google.com ([2002:a05:7022:3a88:b0:146:40d5:dd6b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:428b:20b0:148:80d4:84ac
 with SMTP id a92af1059eb24-14880d485e6mr6837425c88.29.1790620016274; Mon, 28
 Sep 2026 11:26:56 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:25:59 -0700
In-Reply-To: <20260928182605.3649015-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790145937.git.irogers@google.com> <20260928182605.3649015-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928182605.3649015-21-irogers@google.com>
Subject: [PATCH v6 20/26] perf test common: Only disable probes in clear_all_probes
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>
Cc: Howard Chu <howardchu95@gmail.com>, Jakub Brnak <jbrnak@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Writing 0 to events/enable disables every tracepoint, breaking perf
sessions running in parallel. Disable just the kprobes and uprobes, an
enabled one would make clearing kprobe_events or uprobe_events fail with
EBUSY.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/common/init.sh | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/common/init.sh b/tools/perf/tests/shell/common/init.sh
index cbfc78bec974..db89a5be95dc 100644
--- a/tools/perf/tests/shell/common/init.sh
+++ b/tools/perf/tests/shell/common/init.sh
@@ -130,9 +130,28 @@ check_uprobes_available()
 	test -e /sys/kernel/debug/tracing/uprobe_events
 }
 
+# Disable every kprobe and uprobe, listed as "TYPE:GROUP/EVENT ARGS...".
+disable_all_probes()
+{
+	PROBE_SPECS=`cat /sys/kernel/debug/tracing/kprobe_events \
+		/sys/kernel/debug/tracing/uprobe_events 2> /dev/null |
+		cut -d ' ' -f 1`
+	for PROBE_SPEC in $PROBE_SPECS
+	do
+		case "$PROBE_SPEC" in
+			*:*/*) ;;
+			*) continue ;;
+		esac
+		PROBE_ENABLE="/sys/kernel/debug/tracing/events/${PROBE_SPEC#*:}/enable"
+		test -e "$PROBE_ENABLE" && echo 0 > "$PROBE_ENABLE"
+	done
+}
+
 clear_all_probes()
 {
-	echo 0 > /sys/kernel/debug/tracing/events/enable
+	# Any enabled probe makes the clearing below fail with EBUSY. Unlike
+	# events/enable, this leaves other sessions' tracepoints alone.
+	disable_all_probes
 	check_kprobes_available && echo > /sys/kernel/debug/tracing/kprobe_events
 	check_uprobes_available && echo > /sys/kernel/debug/tracing/uprobe_events
 }
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

