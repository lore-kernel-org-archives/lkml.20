Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EF1492E53
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788922240; cv=none; b=gXYsFdZCl4xq0x27sFOhVSnKCRVY7Jt7L0Sx3q24QrCfQrvjkCszrIY6z28ZATO0N/qS7bP1NJV4mkzUpJIKWz2KV+fr3oGUVn/V4zclfXuipNmpkJjC0hbyW8EM/AbK/Eh6jEKSWGVb9SQQVppPDsVSIAHer4Ma8hm7tmdYJxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788922240; c=relaxed/simple;
	bh=ZpMWf0mmEjm42iJUxpfB3CY6H9148SV6nnAr/13zjOY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j4WG3I927FaZ9gv8rsdWsyGzC9M/FMiDpjj1nXQzUMNlH0VbcKim+VqAiiZ+hWx69vOqoHSiyaXXOWJKcDBiCsRmmru//bcl7wsyTiVnX1E0eoGfoRquQa5Dma1Lu1jcvTtRGqDVd40Y7FR2fnpJGjQG74VtKk+FtDOwtqvonXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+zuU2Ye; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+zuU2Ye"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-86cba60d4f2so40096567b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 19:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788922236; x=1789527036; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7KcmM3MS3Zo8oEvXtwDuI95pn1nsgMeCw5aYRzAM4f8=;
        b=Q+zuU2Ye+kLo3qfdiFSfxCq2s8wRT1kD59uBQpQ2YeSB6RoaGROlZR7GbkmLl6wX7l
         xCXl+H+4rnZSNmGgLPOb0pxrtqyX6XZaF69fb1gVbU/lskPZ2LhMEeCxfMfyYwWSUL61
         h/k4jGvhfRhce5T9PtcSCo3V6cs2qb3ZAWJ8gzxeoHo5y9GrkaG01WdqdJtp1zWW8WlC
         Znjdn+U0Z1vNb6GYhDlorkksmo1o7Uo8zHxuzy8Aj2h4c9j4MCJEsJTXR9uRLGamuh/u
         OuqTYJ3iiR4wXhZBz1gCugYsNwvCxUvQWfEdmVyJorCwBCmy36ZW66pxj9ezrMsm3gtU
         owNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788922236; x=1789527036;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7KcmM3MS3Zo8oEvXtwDuI95pn1nsgMeCw5aYRzAM4f8=;
        b=IftfHEZMCl3RJWxInlyp2V07IkWWIJlBQaJCVpNBULJgZz3LFmcYPkR74ss00axrp/
         ct9YnQpbnAbp41fWhr5Zf75aFtKOzdPWqTZ2SSmqE7AFAN3nmw4gOwG3+qIv6Hm57F/h
         JBXozF43QmM2i6gZfdHUjpUE8zZ0NIleggpf1EswVmqK4X8IR8K7qoFuA66R5AE8rVoW
         xTlhE8gpjL3nXoLfOo1CDX80w6LBPADPUI1+pDqeMgTiFOauet46nxxe6xqf7bBapswB
         jyhRspGmqXj3FL+4LJDs03aT67B1+tkp3ZU6UbDerQqLYQ1Doanr+ny257S37duJi+8z
         VpiA==
X-Gm-Message-State: AFuF++mWTyHqnKzWJkSjCxjVx/O+OkWf7cxaG1cQnzjvoI8/hFLb8nhb
	MMg9fHHSzxB5DA/0Xa8WK/6NFtSA1PfsvJSSqwEu3VyEaReGjBq3JZZG
X-Gm-Gg: AYBFou1fz0HjyAtdk5HEXB6YEc6H/J1uv0NDfOgGeZpumyViCb/LN7XyKWI2N2hFl6g
	BvQ1rtlTmp22hW6F/XORxVNgLN3duOzFXSVfyBazZDSdu0jta3VMbtHSFTQvEeVKgQxfFN0GY/e
	McEA3qchzxeaOwU6YWa3ffJpFARDdiEMof6/h73L2dmt9sDwgqcnXchtbI1yTXHUlzHK64KYeU4
	NV0QDr2/oRMFvGwIsZdQUQo/HWctuOxiCHtpM6JEBeqUYD81nzh/S6MegVehkCtIf3GL1MlWHHC
	2Hc/r2qH38zVBsllygALzvoP9hgX4lVwQIAh3lFm2TyXEVcV2obBuxvlLSmpQ7lxRGv5h/InC/H
	ZbvjgF3fchdAnaen7T7Kh5Tcu3o7hrXHc9m4F/HdaR6enIasZERwkNOqJd5J9qidUd67orh6qf6
	RiqXND8FxWb3GcGuOpGeAcNj9/sm8nm2sdvo6TplTAuDZ8C8+a0Lz2bwoZvipEMBPrDPpF4Z8=
X-Received: by 2002:a05:690c:d8f:b0:873:5c6b:a2fa with SMTP id 00721157ae682-8735c6ba696mr91380127b3.40.1788922235924;
        Tue, 08 Sep 2026 19:50:35 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714bef8930sm104346937b3.46.2026.09.08.19.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 19:50:34 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v8 0/3] perf tools: port UI from GTK2 to GTK4
Date: Tue, 08 Sep 2026 22:50:33 -0400
Message-Id: <20260908-perf-gtk2-v8-0-e90d5d155f0d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XPwW7DIAwG4FepOI8JDIbQ095j2oE4JkVbm4pU0
 aYq7z7S29Jx/C1/v+W7mLlknsXxcBeFlzzn6VJD93IQdIqXkWUeahagwKmgnLxySXK8fYJERIr
 K9r1DEHX/Wjjl70fX+0fNpzzfpvLzqF70Nv2vZdFSSY/O9qlDMDG8jeeYv15pOoutZYGmhCoNE
 6Wk0NCg99I0pamSdQLVOdA2qr20TWmrDJ4DMCtf7V5iU+J2s/PWR4cE9umma0pXpQs4aFI6xvj
 0p29KX6Vm4s6E1NPfP9d1/QURtNQ1/gEAAA==
X-Change-ID: 20260906-perf-gtk2-555ca04bb652
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6343; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=ZpMWf0mmEjm42iJUxpfB3CY6H9148SV6nnAr/13zjOY=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIWnKy8zvXJWsjzedy2ileP+aZvc5u7cc+Bxq4rjKruw
 ipyJy/GdnxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1xokMf7jupO489S
 WulIOPd9pklzVGd+SrItZmOT/jvfX5GDPDqauMDM+jFqxZNp2zRuLK/UmO/3d9nPVFQMD9eW7/x
 Fu/JLgOazACAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

GTK2 is long dead upstream and increasingly hard to keep building on
current distros. This series ports perf's GTK-based report browser to
GTK4 and fixes it up so it's actually loadable at runtime after the
port.

Patch 1 does the mechanical port (build system, widget API changes),
including the leftover-GTK2-call and signal-handling fixes that were a
separate patch 3 in v4. Patch 2 fixes a runtime issue found after the
port that prevented the browser from loading. Patch 3 fixes two stack
buffer overflows in the hierarchy view that predate the port.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Changes in v8:
- Fix perf_gtk__add_hierarchy_entries() to restore hpp->buf/hpp->size
  unconditionally after formatting each entry, not just before
  recursing into children: leaf entries left the buffer state
  advanced, so the next sibling in the traversal inherited a
  shrunk hpp->size and an already-advanced hpp->buf, eventually
  running hpp->size to 0 and pointing bf past the end of the
  stack buffer for the strim(bf) call (reported in v7 review)
- Link to v7: https://lore.kernel.org/r/20260906-perf-gtk2-v7-0-1ece839fbca0@gmail.com

Changes in v7:
- Add patch 3: fix two stack buffer overflows in the hierarchy view
  (perf_gtk__show_hierarchy()'s unbounded strcat() into a 512-byte
  buffer, and an advance_hpp() size_t underflow in
  perf_gtk__add_hierarchy_entries()). Both predate the GTK4 port
- Link to v6: https://lore.kernel.org/r/20260906-perf-gtk2-v6-0-695d1c01aaa1@gmail.com

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
Matt Turner (3):
      tools: port perf ui from GTK 2 to GTK 4
      perf tools: make the GTK4 report browser actually loadable at runtime
      perf tools gtk: fix two hierarchy-view stack buffer overflows

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
 tools/perf/ui/gtk/hists.c                        | 72 +++++++++---------
 tools/perf/ui/gtk/progress.c                     | 40 +++++++---
 tools/perf/ui/gtk/setup.c                        |  5 +-
 tools/perf/ui/gtk/util.c                         | 97 ++++++++++++++----------
 tools/perf/ui/setup.c                            |  2 +-
 tools/perf/util/annotate.c                       | 11 +++
 tools/perf/util/annotate.h                       | 12 +--
 22 files changed, 278 insertions(+), 200 deletions(-)
---
base-commit: 9f0346dcbea363787186c94ef94dd01aaa215afa
change-id: 20260906-perf-gtk2-555ca04bb652

Best regards,
-- 
Matt Turner <mattst88@gmail.com>

