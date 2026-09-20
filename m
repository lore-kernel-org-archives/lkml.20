Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EF53D5C0B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881787; cv=none; b=bfWvRrTIi2i+z6Rd8fFhUiqboLonwuZI5a/l0uU1X7pOKdz9TW3qInxa9w3WeOD+WrVrq47cECY+D7jHW5P44s078iwxmW4mPoK2sRu81gIKMTLdvxW2lfe/Gn3jrXaZqSiiMD0vNL41UQOncpS/5J7u79VUo8PxIwAYBP0m898=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881787; c=relaxed/simple;
	bh=/VOAtg2lu5N2Nvzvlu6ANo0nxnKw4y0WWHEMAzYuN90=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gNG1G596/+r4ATdtqugfLRJeEAxf/9wLnb1sZkTzLL6M9JXQy8nlCUFLvxHlYlhgQTgFtHq8IBKhOy3qRzS067kg9hf39TxazAkAplyDrgbLgwLw5rATds2gFwaAk6NFHeBCiDDpsBjIs4fkDIMJyrkB4g8NX56cxlx/EhE/e5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SoC0nka2; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SoC0nka2"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3c10ac70so5179650a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789881785; x=1790486585; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njBfARfpD3SnV1SNIGOHUGhGOxd8dPHLz+F5h6CB8AM=;
        b=SoC0nka2Net8WrA7+hFNxI6x4Sz8NXvaAxKcrIAdfPLY7WHbIqFLs+8+Se9CFS5bLP
         uB0WitXS0Fje51JAapAQdv85qcXgst3hWGIQyOz/lYHKvjLaD9S+VCHijQlXNsd78W5v
         M8n2JK+y/p4+HQrHX00yfkaQLGLP48ds7+nrgG4Ljw2GSkBuRhqklcDplPBrVmj9D1ki
         HY8JiLSwbdJ7siCtRqA6pvJNHkW7cX2Jf26C2qWawaLLqlOAmYjf5IGWqzzsMEbYp225
         VJ+tIK85dsuNs9y+e8VGFzb+qglzGNwvVjhZsS8SqGaytJq9nVZTof4ESmwiChfgkNQt
         TGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789881785; x=1790486585;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njBfARfpD3SnV1SNIGOHUGhGOxd8dPHLz+F5h6CB8AM=;
        b=DB91jG+WdIHo49MX555KgvhJCRJivuAPccXTHEgzowsgcTFltkPsLj06928fdCK/Wy
         MZLy0zkfSbVwYTBSLjv9TN0VM4y3vh6umbqiywtFvd5Pb3CH/HU0WOvWI1grtdmrkvXT
         hvgZgj10vOJzKC+d/Cz1Mekc2a27iabdUiNdgLmuy1keOoMjBQpDKGoAUjeuJYGkXBHl
         1SsNSdP/54j9fmcDyISw1NaQLN+8EkIYG2XZK+1zMzdsu4ud4/p+Sn/fEBC8PWxY7QR5
         n2wD2SdNVgQQXyd+a4RQiAFcyElb/vepOm5NjrW31tJm3qztr7Q4a5JxiffRZy8rfWpc
         zm8g==
X-Forwarded-Encrypted: i=1; AKwUvBz1phL0Ylngt6n3NM5L35Sf7TbOFoHvUpH2XoNWHGeVML2YGPhbwMOkCfA+KGNKZpZElmSPKjm5DT66oKw=@vger.kernel.org
X-Gm-Message-State: AFuF++lL3Ds5sOc29FIwCjh9XxhBNWGeK2GdjE4ZOxOjIi0DXSq79ESP
	YL/suFIVFaUFecVOMvQVwqMInBkA6ZKj3CiTaGsY4dibrKKXQ2RB8N6Y6FF3IlrlPSUM7XZlb1S
	oiMyPIlbGUA==
X-Received: from dybtk5.prod.google.com ([2002:a05:7300:d945:b0:33c:2cf5:c43e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5784:b0:39d:f5b1:e365
 with SMTP id 98e67ed59e1d1-39e54f35b9cmr12058496a91.25.1789881784802; Sat, 19
 Sep 2026 22:23:04 -0700 (PDT)
Date: Sat, 19 Sep 2026 22:21:07 -0700
In-Reply-To: <cover.1789880842.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789880842.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <f8600b666480094589f38b430cbbd0519d1d539f.1789880842.git.irogers@google.com>
Subject: [PATCH v1 15/49] perf Makefile: Install standalone Python scripts
 during transition
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, adrian.hunter@intel.com, 
	alice.mei.rogers@gmail.com, james.clark@linaro.org, 
	linux-perf-users@vger.kernel.org, namhyung@kernel.org
Cc: dapeng1.mi@linux.intel.com, leo.yan@linux.dev, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

Install the newly ported standalone Python scripts from
tools/perf/python/ alongside the legacy scripts during the transition
phase so that newly ported scripts are available in the installation
directory before legacy support is removed.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.perf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 3e193d609988..abd377c16435 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -905,6 +905,9 @@ ifndef NO_LIBPYTHON
 		$(INSTALL) scripts/python/Perf-Trace-Util/lib/Perf/Trace/* -m 644 -t '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/scripts/python/Perf-Trace-Util/lib/Perf/Trace'; \
 		$(INSTALL) scripts/python/*.py -m 644 -t '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/scripts/python'; \
 		$(INSTALL) scripts/python/bin/* -t '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/scripts/python/bin'
+	$(call QUIET_INSTALL, python-scripts-standalone) \
+		$(INSTALL) -d -m 755 '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/python'; \
+		$(INSTALL) python/*.py -m 755 -t '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/python'
 endif
 	$(call QUIET_INSTALL, dlfilters) \
 		$(INSTALL) -d -m 755 '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/dlfilters'; \
-- 
2.55.0.1082.g2b9226bbc0-goog

