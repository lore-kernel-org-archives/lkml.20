Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACD336F41C
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 18:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788721058; cv=none; b=dGs7Rfcc8EsJAUK1oVbAoyK5nBJRfR4kS5ZXimgFhvayKg7/HxTWT1UAQPdX5mZw0qv+zymZnc3LJJz3HRAvEZ/WWlopMo7K3qNINUMPCEtGeDIikORO0Qsk+gimSuBohPnEHSmyvzuwTzBFbAjk+inHtjf+S4TAg7EU8XremtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788721058; c=relaxed/simple;
	bh=rJdDGuuLXwWwi0+YctgfhPVqqUuk5Zm+eKOhIzDmD3A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lCsGSCYmZKgxFnn1RUlhGpKoyBNwlakNfTNjJP/FG9lnxogW265La9ok4USAUG7pWqWl1s4IX1CAOpTzJfh7NGaBSlutArhTQdGudMea3YFz8ILcyrg2PLcltZdSzMeBNZON12iZ9dG+NVMANPoN8JldA9sROfAMqi+jsycFfis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjQ6pyDd; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjQ6pyDd"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66fcf87897fso778978d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 11:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788721055; x=1789325855; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ooyeucvHNbUkHL36Nom6RqEKj60jDXRF1sRDnJESWo0=;
        b=XjQ6pyDdsQPQcinwY9cwmMC7Gep+gsR+Vr/2Mcu1keM7nL9lQ7rd0ReqZAbm50rR23
         FTO2bRy2BCkW+olPbWb5o3+N6G0ObBd656RGZSEbwWMVc3lE60W55y4rN+CveZ3N7tcu
         YGo9pMIclNRyA6Rx5bPpjxyDGOU79yZuHEguxaBW/7KV4mpajsuxyTHsmXlEWL7fe0Mq
         q+bjEKMuOFQJlEMlqvGAYQrntd7kUVwkjDsp9Ycqc2LnBz6TnjAmLsuTQ4jXEsBkxMAX
         /4rqf959W4vEXovmC+qfW3TGrtbvoDGL5/BgEQbMD4biQQoHwrjPU7ql3wd/eEDpvSp+
         /MsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788721055; x=1789325855;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ooyeucvHNbUkHL36Nom6RqEKj60jDXRF1sRDnJESWo0=;
        b=a6lk9tkFbalyffcN+XY6BU60JeZu1D7qnf+Qjvru925pPTloHpV1ExUdLj1oA3Sy+G
         RFe5ZGot6M98bY5KsBPABgLmisobpjB3ymYkDaUXt2gPIncZ+OXFXYO8UvpVgNEuQgTl
         qyALbzVY7f3sKuCCbyBr1IeKBUCUsjcDWP373dRKllvuq5/MFagQ1I2qXR04W02ACvJY
         W9V7E6sLiHfB7zfpPfRd32KuxEbY5FFe97wwzC1MRjgf9fedxsB0AW6JbYqsDSrHveMZ
         S/khs/G6TTo5950SrOzcshpTmgnodn07NF7tIolmASBIHpZ2bpY/rFHwroCEHBtfVUdl
         mtQA==
X-Gm-Message-State: AFuF++lg/NL8DZcfmmRJvHmWJKie1YfnvSP4UnI7myEtt78zdECQMNV6
	7CTdTnbGFKAtuMQzZBSRAn43bIdmf5zrMqd5GZ+kV9mxdJDudM4A3jnU
X-Gm-Gg: AYBFou3nnBaG7dL/C/j5eADlTy5Ejv83g5/C1L2RhxC9JNpWJs5sCntI2qTzvNcr9J2
	C8lJWu1evZPGIbqohQ0IT5xKw/Va8XFJAQLnnP02OIwwaUZjGd8AKGYjjMDAMdoQQxt51DTur73
	Da9AdWXtF54Za2DVUz/VKcBpSJdAc4uOY6idE3UbhsbymVx9UffRu3rYL8u+UtONtHtO7WhdSzY
	qba/1N9i15agtqyfD82jclo9gmjgW/h6uRxmT+jV3jWs8Y6H7+C7QCo8xodrNKepDTG81mV/wha
	c31vL/PdxipV/Aeh2+Wb6mANcKa4BKEjpvhyGatXLr2/Uf+ZW0nfbKkfRv1B89fWwRYuqQvPqOm
	0Me70HBiuOs6uxiVrwV4Yk9YvRuWeqrrTCvkhfkJc0WtPX9L78X7ei4CldViSuFuHcD4/jkNbHL
	MVH+SoYYQ9e3pedFn4BSj5dtaUwe0Ti9lOA8voKdevrufDbqOF//M7BEtJpKxe
X-Received: by 2002:a05:690e:118e:b0:66f:c1bc:4072 with SMTP id 956f58d0204a3-66fc1bc49aamr3207402d50.53.1788721055402;
        Sun, 06 Sep 2026 11:57:35 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714bef8930sm59326237b3.46.2026.09.06.11.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 11:57:34 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v6 0/2] perf tools: port UI from GTK2 to GTK4
Date: Sun, 06 Sep 2026 14:57:32 -0400
Message-Id: <20260906-perf-gtk2-v6-0-695d1c01aaa1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ7CIBAF4KsY1mKGgYHWlfcwLigOlfhTQ02jM
 b271J2NXb7JfO+9Rc85cS+2q7fIPKQ+dbcS7HolwsnfWpbpWLJAQAs1WHnnHGX7OKMkouDBNI0
 lFOX/njmm57drfyj5lPpHl1/f6kFN138tg5IgHVnTxIpQ+3rXXn26bEJ3FVPLgIsSi9QcQoxAO
 hzVXOpFqYtkFREqi8p4mEuzKE2RteMamcEVO5e0KGnarJxx3lJA87M5juMHuzc2J4oBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5263; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=rJdDGuuLXwWwi0+YctgfhPVqqUuk5Zm+eKOhIzDmD3A=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLmbp87y2HPjg9LzHf8ONYwZVHq7hmtd31S2AMyYo8IW
 r57VJcY3/GRhUGMi2GmmCJL3HpFllltO5b6nJb+BTOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GQIZOkbxEDk9Bo3M4uLS1CLdtIIih7z8ksSSzPy8Yr38gtS8gvQCvbTMtJKMjPyi4lSgEXp5qSW
 mro5uRoYGJpaOFmZOFo6mJs7OToZObo6Ozq5ORpbmJgbOlo4mrpbmDFycAjDXiD9i+B8cf06sdZ
 t2xct1xXw9gk/+fdpio5b5iS9xi9rHnoJ97E8Z/ulL5Pd6cK8J2HBj+pynt7pvS691q7uy4c06p
 nx9L43HUrwA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

GTK2 is long dead upstream and increasingly hard to keep building on
current distros. This series ports perf's GTK-based report browser to
GTK4 and fixes it up so it's actually loadable at runtime after the
port.

Patch 1 does the mechanical port (build system, widget API changes),
including the leftover-GTK2-call and signal-handling fixes that were a
separate patch 3 in v4. Patch 2 fixes a runtime issue found after the
port that prevented the browser from loading.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Changes in v6:
- Explicitly include <string.h> in annotate.c (strcpy()) and
  <stdarg.h>/<stdio.h> in hists.c (va_list, snprintf()) instead of
  relying on transitive includes, which isn't guaranteed on musl
- Link to v5: https://lore.kernel.org/r/20260906-perf-gtk2-v5-0-e8747a65c240@gmail.com

Changes in v5:
- Fold v4's patch 3 into patch 1, since sigprocmask() only blocks
  delivery to the calling thread: it did nothing to stop the signal
  handler from running concurrently on another thread and doesn't make
  the handler's GSList calls async-signal-safe either
- Defer perf_gtk__exit() on SIGINT/SIGQUIT/SIGTERM to a GLib source via
  g_unix_signal_add() instead of running it straight out of a real
  signal handler, so it always runs on the main-loop thread, serialized
  with perf_gtk__error()'s updates to perf_gtk__error_loops, instead of
  racing them from arbitrary signal-handler context
- Keep a real handler for SIGSEGV/SIGFPE, since those are synchronous
  faults with no "later" to defer to, but pare it down to reporting and
  reraising the default disposition: there's no safe way to run
  GTK/GLib code from the faulting context itself
- Link to v4: https://lore.kernel.org/r/20260906-perf-gtk2-v4-0-97e92ee07214@gmail.com

Changes in v4:
- Fix gtk_widget_show()/gtk_widget_hide() calls left over from the GTK2
  port: both were removed in GTK 4. Replace with gtk_widget_set_visible(),
  adding a small wrapper for the info-bar "response" signal callback
- Block SIGSEGV/SIGFPE/SIGINT/SIGQUIT/SIGTERM around the
  perf_gtk__error_loops list updates in perf_gtk__error(): the signal
  handler (perf_gtk__signal() -> perf_gtk__exit() ->
  perf_gtk__quit_error_dialog()) walks that same list and could fire
  mid-update, corrupting it
- Link to v3: https://lore.kernel.org/r/20260906-perf-gtk2-v3-0-e1f2086214a0@gmail.com

Changes in v3:
- Fix GMainLoop leak if perf_gtk__error() is called re-entrantly: track
  active loops in a list instead of a single global pointer
- Add explicit <stdarg.h>/<stdio.h> includes instead of relying on
  transitive inclusion, which musl doesn't guarantee
- Drop the gtk4-infobar feature check and HAVE_GTK_INFO_BAR_SUPPORT:
  GtkInfoBar has been unconditionally available since well before GTK 4,
  and the check was failing outright due to its deprecation warning
- Link to v2: https://lore.kernel.org/r/20260906-perf-gtk2-v2-0-3eccff053cd1@gmail.com

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

 tools/build/Makefile.feature                     |  4 +-
 tools/build/feature/Makefile                     | 10 +--
 tools/build/feature/test-gtk2-infobar.c          | 12 ---
 tools/build/feature/{test-gtk2.c => test-gtk4.c} |  4 +-
 tools/perf/Documentation/perf-report.txt         |  2 +-
 tools/perf/Makefile                              |  2 +-
 tools/perf/Makefile.config                       | 27 +++----
 tools/perf/Makefile.perf                         |  6 +-
 tools/perf/builtin-annotate.c                    |  8 +-
 tools/perf/builtin-report.c                      |  8 +-
 tools/perf/scripts/install-build-deps.sh         |  4 +-
 tools/perf/tests/make                            |  4 +-
 tools/perf/ui/gtk/annotate.c                     | 36 ++++-----
 tools/perf/ui/gtk/browser.c                      | 96 ++++++++++++++++++-----
 tools/perf/ui/gtk/gtk.h                          | 16 ++--
 tools/perf/ui/gtk/hists.c                        | 43 +++++------
 tools/perf/ui/gtk/progress.c                     | 40 +++++++---
 tools/perf/ui/gtk/setup.c                        |  5 +-
 tools/perf/ui/gtk/util.c                         | 97 ++++++++++++++----------
 tools/perf/ui/setup.c                            |  2 +-
 tools/perf/util/annotate.c                       | 11 +++
 tools/perf/util/annotate.h                       | 12 +--
 22 files changed, 257 insertions(+), 192 deletions(-)
---
base-commit: 9f0346dcbea363787186c94ef94dd01aaa215afa
change-id: 20260906-perf-gtk2-555ca04bb652

Best regards,
-- 
Matt Turner <mattst88@gmail.com>

