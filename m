Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618014BF94C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005670; cv=none; b=QIpuNyihXtEd43o1J+B7OsfDMx/p6LDr6RLwbDXX+eipAN7JidaLwAXkQNTOdKvoSD22K+uj7AlWqXjBu57y+E27NAqnpBJOejvZP4NDx2hU/qSoPYgj5nma7coguQQpWEkz3dG9ugP6k1ArkXUIrRkSkMjYwOsSABEp7JARVMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005670; c=relaxed/simple;
	bh=nHVksdY8w4wF3N08fRE1ytwkMeXTDgOSdB45U/VyuoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AHhS/K/J2j6DawEzg3nDEDdvx+Q1DQnKPVmdQNv3Dyvm582GpVP6Off7UsRnNrpMuVMmC1M7EGu9gdT4kOHkrvBQptHZPfJTyqFqvDZnCrto2ATF2f0rsTR+bPgxKKcOrBXILnKzOAz0yz0U6SASM1YiUO1AHN/L8J/NxNUcLHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HgyGkpR0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HgyGkpR0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so17003865e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790005665; x=1790610465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pOnOOGEA+4+JPvESbiYqMHc15VbAUTSR17XouVJ46Ss=;
        b=HgyGkpR0V8r3OeGpaQSOmgrsHFOaIYS6UCItXj8uaAtfKStrj/0BslYIphst7UooTS
         5mcHLtpUYuuy0XdzyKLZQ5/rGyAbcPk4aX9IhyXZYge6GZlRa9mZ1M54WyjLLftYUGWD
         t9qKtpAqMlfKXFs3Qqg9DqyDS3r1UPA0WwvQ1QupNvNyFzDNoY7sgpbCgcnUEB0WkTrp
         /e4xP5c0/A9tJ9wkDai0OCQaIHrXwoHX78YRE4TN0iikLxfwvnAisbuC7XBCZMRof6wh
         NxXPJaGy+ST6cJFl9qTy/dMiLY5XkIiZ2uqb+S531E6+Sg80otehLilUj4ar9Wi//Yf5
         yh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005665; x=1790610465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pOnOOGEA+4+JPvESbiYqMHc15VbAUTSR17XouVJ46Ss=;
        b=h0YtqZ8lQzyFB1M9GoEfKx2HHi3WrcRcGgpxeAw8ie8kYz2BO0KNjGJfb71SypiX11
         PXwb9RpNuaRTElabuwcrhGsvQF8tLUQCue7bPUQ3/c3V9943ZloslqJZlmOaX0zpFlAH
         BMzTNaMjf7tv782Ad4FyGZXd2JJZoLuvtd4/LHxwLy806Ero2Nuru0fK5P/1nwUJPXV5
         AhfVMBOalCHrn7r03W37OkM+sQNx155OhvTgoILuDoOIn5HltG2ra12g6hpQyuOib6XM
         JlqPxXIjbwLvqNG3Iw2c4FrfO5njccjtrltyHK3CkeQC9sbnVmqNlzeDk3GmkvGqIU+D
         aAgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCPivezSo40YKdlyd7ErJ+5nIkhLURwRyuJmFS0F0H61nyUA9zawsQ6j3rO0yDAm7A26dvgjzyDKCJRSg=@vger.kernel.org
X-Gm-Message-State: AFuF++mo3bmAkeMV0MOIKYlfAFT4ZUxO58c+D8PjBGIqYTu+jv+7Tm6E
	PlAU1AG14o2PNUJ+v4dv1kbHRQ8wPdOlfmuueG5fRfcEtofRJVeFLl1c/Two2zMLTbA=
X-Gm-Gg: AYBFou2lVYIIeKvc54UpvZZhzYnsEOC30FE8ITd+O8ds2bUncWzw57j9h5hSqr/SeuJ
	R1DzKzKflbfJEhDhfsmsU31cdosA2hFAYGUIBQPL+bsXlditRUWI7x9hJWNXArhtJVKOGcRIiwp
	MyxUIKiz7aDjXS0v5Z10DpcC19vnWP7wEx6hkwnBwFFd8ImYKQjXPgXzK7+BJre02KvTNvjfYWj
	hwYOYUlNh3j7k8Ezw9o29rsFi5rhWqjByD6DTwAZb2hRbkHWyFOQ4Sroc4lU1yyq4KoRydaPhAl
	yXn5UEc9QkwLvKL5sN5c0J1UHRJxmIetgxUsgKZ0BPFH5pOfDQzVKxUnJmowIzm21fo1Sg9hi2W
	9n2KwEA4eMbPV73dY85OiD/Zm51IrUq1mRxAVrKPYN57lIUNYvhWqVjPeq5Gq33Can5cSqrMB+E
	14E2wIjDm7OcIZ8nVA3lQzSWg9/zbbJx3RE8byZ9btYtFrUzSzWNhlhH/+DMl3Tg52zH+eGgXxT
	ug=
X-Received: by 2002:a05:600c:620e:b0:49f:ce78:3560 with SMTP id 5b1f17b1804b1-49fce7835e0mr135252035e9.17.1790005664767;
        Mon, 21 Sep 2026 08:47:44 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd103325sm279287355e9.9.2026.09.21.08.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:47:44 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Sep 2026 16:47:29 +0100
Subject: [PATCH 2/2] perf build: Follow sourced files when running
 shellcheck
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-james-perf-shellcheck-source-v1-2-adcfc107c997@linaro.org>
References: <20260921-james-perf-shellcheck-source-v1-0-adcfc107c997@linaro.org>
In-Reply-To: <20260921-james-perf-shellcheck-source-v1-0-adcfc107c997@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

Shellcheck follows sourced scripts when -a is provided, but only when
that file is also provided on the command line along with the one being
checked. We only ever provide one file at a time to shellcheck, so -a
does nothing.

Improve coverage by following sources using the script's directory as
the base path.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/Makefile.perf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 29cfd44c427f..76a17d3614a6 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -258,7 +258,7 @@ ifneq ($(SHELLCHECK),)
         sed -e 's/.\+ \([0-9]\+\).\([0-9]\+\).\([0-9]\+\)/\1\2\3/g') \< 072), 1)
     SHELLCHECK :=
   else
-    SHELLCHECK := $(SHELLCHECK) -s bash -a -S warning
+    SHELLCHECK := $(SHELLCHECK) -s bash -a -S warning -x -P SCRIPTDIR
   endif
 endif
 

-- 
2.43.0

