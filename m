Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A060D33A6E2
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 15:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788707001; cv=none; b=vA4yy3gWJWF4WI88ovCHp8LU3KdtRybrSGxLhej0XoRYDalWJj/FEA0Ti7LxRXa8AYP1jE+l4ypinQE506lztL6yn8mtbmg8yK1veOWmK+SwetxS9qYp5b1Mjd3sI2oaE0dafQd/KL33sCWHpWv+343nPgWjagpVVxKeAXXA9B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788707001; c=relaxed/simple;
	bh=yXoY/9Jdn2Bh1wjZWv3vhwPgti2rTbW9TXtgpdFB4+w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z16EiuFIxTgvSTw2+VnO2PTtu9fTC7zDjoa6kMi5E8F7/3IrhFtjPKFlxMnS5MB317KPQI2jJu5e1gBcWGFVBrKzYoOSYNUNjQab5cmBv1OgGYVEps6m7PgEgr8VypEO+IgHbn7fcU1vr3yX1mNs90S1u/zpI7TtIQy3oj06pOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ls8Q3m2T; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ls8Q3m2T"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66d9f9d8384so672209d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 08:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788706998; x=1789311798; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=azMvLN7G+K5QCBJaIvwSGsEL+rjx+SGnVYrqi+oBp1U=;
        b=Ls8Q3m2TG08JHds55ULEnAcLsEVTXM9Edq8WS2aAWCV08OKJTTs8oLvFA7W1B6PuZT
         G3Lo0iliglZ5QTLOmq3qZyIyNz8EYqwvenO100U/m3rRLUEMokx/ZfbRA4u8rXaE87uo
         okjeX8T03VxMYQOmKv9Y0KDW2icetEwccyOXCEe4j+6H8eFlD4sd4nDrlT+BLX6qodVm
         96NrXsBFlvLSbutq7jPzS+kcHOvGs8+fY5Hnh9cBhmXM/Fi0n9zxu922SEDNbNGRjyNx
         6NaXOxqYUuKvJ+vfdO+pjCdBJRaj6d19r7Y+hzQQcdXIIR1FTfgyoaFxtLMhYd2DUAWa
         Hgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788706998; x=1789311798;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=azMvLN7G+K5QCBJaIvwSGsEL+rjx+SGnVYrqi+oBp1U=;
        b=dQshGwrczCz3T1xN1o+OZXieu/iKH72vquWHNJQ0+E8MaAtMoinjVThIGd1VX5qIwo
         qG7bq/fEPCxt1NMEDdmAX3659+W9xtnWU5t3XGOJkXcLryGevKnRSV8U/UO3pC4ttznm
         oCJAVYcjkh86PRjh/Cy5ZNgu/d2GGfn/0jWSKNSjl4CaLsksZ5bi/HVyRPs/hyN8Iacg
         Z+Tydaf2Bzc9x5B4xDkDeGOiQ4WCwZs/Az7mIt6nIwkeR7GbyjTb7qdPrrctrdfIZhYR
         Ejad4YCKfyxhMuQZUdtOhpu2KkOjlL3GHFX/OTpKUGYMbY3fqj6y7aUfI09OdAGD83xX
         nbsg==
X-Gm-Message-State: AFuF++mStGvwxQ5sae5u1bHrYYsArrWsGp2pivfzhXCmtNR5mgpUDQru
	QT5swVfWvMWyw9IJhnMsFt+wuOOywgO5XX0gOLc8sdawUvYM2fjYw5bTwXUrQ9JdhQA=
X-Gm-Gg: AYBFou0YzQ3+a0MWEyG4NSykvnA/uSc+pOPPriFsBG8zPS2Jj3mIe2Ok/1bXPd5wGrR
	W8V5RVmu86KROtKMqgN5voPvKvWnMTaREv5LGcc6zyl/yL+8nDA1eJpL3bEVULkkIrVjzNTbgkq
	LdU8LOSZUxpE6xH/KQYeWFn/cTMOy2/0x0GaEr/27vCmtdWmywURequJO365w6Zecd/zpvUZU5H
	/6VbshtyjdTZ5vKLm8UKVcbGm+BRCQCVMc12rxX9bNJy38eLLKfcHTda91RH2+h5DuSvGIRyzJ0
	GJxIh00gQUTV48gYyjDHCQRfkCdvgtix0KbEttndRcK0jKCM/AXoaOsCJkclB4PYJu+jE0LFbGh
	MqPHTiKvS/u6rOXDe4+Wn1v0D8ycZBv+rOzb3O2DoCPWRBRV6vnFj3WJOTKwVfw4vPAOzMbkS2K
	LhqHVhpaHV6THkRuI4BMZl78qsDKMG2zt2T1KNMcFxhV3ExqpXLcGpzFpl3Dshcw==
X-Received: by 2002:a05:690e:191b:b0:66f:dcfd:5530 with SMTP id 956f58d0204a3-66fdcfd55b7mr143035d50.86.1788706998442;
        Sun, 06 Sep 2026 08:03:18 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48f1646sm6520289d50.9.2026.09.06.08.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 08:03:16 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v2 0/2] perf tools: port UI from GTK2 to GTK4
Date: Sun, 06 Sep 2026 11:03:14 -0400
Message-Id: <20260906-perf-gtk2-v2-0-3eccff053cd1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MQQ7CIBCF4as0sxZDsYPWlfcwXQACnWhLAw3RN
 Nxd7Nrl//LybZBsJJvg2mwQbaZEYa4hDg2YUc3eMnrUBsGF5D2XbLHRMb8+BUNEo3intUQB9b9
 E6+i9W/eh9khpDfGz07n9rf+U3DLOzig77S4oTqq/+UnR62jCBEMp5QssWtO6ogAAAA==
X-Change-ID: 20260906-perf-gtk2-555ca04bb652
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 bpf@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2777; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=yXoY/9Jdn2Bh1wjZWv3vhwPgti2rTbW9TXtgpdFB4+w=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLmNmz+mNEd17pMwkA7br6Qf9lbSSvJ7Okrb1iYzehgb
 L52uLKr4yMLgxgXw0wxRZa49Yoss9p2LPU5Lf0LZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 BDJ0jOIhcnoMGpnFxaWpRbppBUUOefkliSWZ+XnFevkFqXkF6QV6aZlpJRkZ+UXFqUAj9PJSS0x
 dHd2MDA1MLB0tzJwsHE1NnJ2dDJ3cHB2dXZ2MLM1NDJwtHU1cLc0ZuDgFYK5Zx83IMM9p+6GFLw
 QX6C080eotWndmrfDpFzOXvmItneD/x0so/S7DP20dJbY214WbFWbuzuZ1N3WN3jP/SpXIzyYDL
 /cTN04GMgMA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

GTK2 is long dead upstream and increasingly hard to keep building on
current distros. This series ports perf's GTK-based report browser to
GTK4 and fixes it up so it's actually loadable at runtime after the
port.

Patch 1 does the mechanical port (build system, widget API changes).
Patch 2 fixes a runtime issue found after the port that prevented the
browser from loading.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Changes in v2:
- Fix error dialog's nested GMainLoop hanging if the parent window
  closes or a signal arrives while the dialog is open (quit from
  "destroy", not just "response")
- Fix build with GTK_INFO_BAR_SUPPORT: gtk_info_bar_get_content_area()
  is gone in GTK 4, use gtk_info_bar_add_child() instead
- Fix use-after-free in the progress dialog on manual close
- Fix reuse of an exhausted va_list in the vasprintf() failure path
- Link to v1: https://lore.kernel.org/r/20260906-perf-gtk2-v1-0-7564bf8523a9@gmail.com

---
Matt Turner (2):
      tools: port perf ui from GTK 2 to GTK 4
      perf tools: make the GTK4 report browser actually loadable at runtime

 tools/build/Makefile.feature                       |  5 +-
 tools/build/feature/Makefile                       | 12 ++---
 .../{test-gtk2-infobar.c => test-gtk4-infobar.c}   |  4 +-
 tools/build/feature/{test-gtk2.c => test-gtk4.c}   |  4 +-
 tools/perf/Documentation/perf-report.txt           |  2 +-
 tools/perf/Makefile                                |  2 +-
 tools/perf/Makefile.config                         | 27 ++++++-----
 tools/perf/Makefile.perf                           |  6 +--
 tools/perf/builtin-annotate.c                      |  8 ++--
 tools/perf/builtin-report.c                        |  8 ++--
 tools/perf/scripts/install-build-deps.sh           |  4 +-
 tools/perf/tests/make                              |  4 +-
 tools/perf/ui/gtk/annotate.c                       | 28 +++++------
 tools/perf/ui/gtk/browser.c                        | 54 +++++++++++++++++-----
 tools/perf/ui/gtk/gtk.h                            |  3 ++
 tools/perf/ui/gtk/hists.c                          | 32 +++++--------
 tools/perf/ui/gtk/progress.c                       | 39 +++++++++++-----
 tools/perf/ui/gtk/setup.c                          |  5 +-
 tools/perf/ui/gtk/util.c                           | 52 +++++++++++++++++++--
 tools/perf/ui/setup.c                              |  2 +-
 tools/perf/util/annotate.c                         | 11 +++++
 tools/perf/util/annotate.h                         | 12 +----
 22 files changed, 206 insertions(+), 118 deletions(-)
---
base-commit: 9f0346dcbea363787186c94ef94dd01aaa215afa
change-id: 20260906-perf-gtk2-555ca04bb652

Best regards,
-- 
Matt Turner <mattst88@gmail.com>

