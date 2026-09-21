Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4FB4BB277
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790007843; cv=pass; b=R7OQ4jzDd6jT4C2/htWNY7oa4JeqM9D5Kt9cdfAziMyWLUV4o5SMr6GMjlgtvKJlyQICY8Z5zpJzDvfcuur3qapGfTnBNrjPVh4iAVZbnWPToXaKJ9b6BUfMObpQpJSXX1MD8JYmy+wIXaIdOIL9zivp3Iq6z1ERjVppy6xIIU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790007843; c=relaxed/simple;
	bh=2eJZABd1KhDaqH5R5RatQY64qEhnstOQkvcGNYCrxaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gm2jyWICLbX/Be3LdhpTw1wOWG/eymnovHxAAR9eTKBvb9u+DEIVt06mbe4ud4HH+Rg0nnidpy9g8UsEWtqd1sPmHO4pv2W3HfzBn+23vfFnzovaN8ySHaWXenhB15w5hynTveg3Z8TlTszjylGTZAXZpKE1joTsvWfyQxVb+2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I7MCrCT6; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I7MCrCT6"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53113d72966so503811cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:23:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790007838; cv=none;
        d=google.com; s=arc-20260327;
        b=OIyrJy4CsC3seSiWwyA/S4KkjVhe7lmpJs4xZeDexnPO21W1TsUoPBRVgbP4Revh5Z
         s/UoX56Jbm6KKB/gr6tsuLTiIcSczEgtY9cbhhY0hgsCU38D/QYm3iQkIY9lAa1g1b2c
         /SPHyvSOZxi7fp+LD1ncLAqp0xNLCetHyCHNW1ZKkD87pgLfnUQmQRCaNQ732YMm7BUx
         JecafrzoZVetdz89/IUnp9yPEVHKXsNlAhsfDN6r8yD/qnYPdw2iSjowbCYdu3z71dBI
         hCVfDwrcH3iL1+YnSRG8xwnvERDyNCPvZWz2GCoNgVA31SiNTR3ODUG6ucwk8SVOe8l7
         maUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DIxL0kqk4j8Y34L+nTA86vhyKtqo4LqqAJTpMKBQ+Y8=;
        fh=vabveCoNLb7zVwUvPuZ4ZUIyfxloM9SaHZx5bU5pMPI=;
        b=bXxRKhT3hVfVLQ4orPIJv90CwW8GTYS8Ep7PJPnTCoXLEUPVaScnnjkhvuLuDHnl8e
         d0gW08Q5QTh/YY7slM8vdbWn+B84jSbZYeTpXI+LgzOa+6ofmoO0ukBokhN4Uz/FqQoH
         iNh91TBenq2v5RaYQMIF97Ha09bnSl/w+DY3QPiSwBOamANZ5vz5Ub2KbJCoysz5FR53
         P/Ap2AllOmvr3mAIliQKbNxhNFv0RD0VX8s4n+eJQqn7hrwm6E3mkFLztdESLzqC9rJB
         qrpWjdTQa2KtonIOu1nS7x95lUt0iOtgf8VV/MxGeW673DBdccQ7accmz4o8SDNWxNiO
         BQcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790007838; x=1790612638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DIxL0kqk4j8Y34L+nTA86vhyKtqo4LqqAJTpMKBQ+Y8=;
        b=I7MCrCT6OseDgQKd8mf7YbSjRo5m4cCXiBPr5vFYUB08yJRmYXV/xSpzZSvdljAqfM
         85xoo0aX9ac9BeblfjFOSZO/ruStgHEdTgOO6aHDUWijHx6RZIVignfVzMXDDplCOK0o
         LhZGtuS5j1Wb/kMSA+bJZQHUDqgY/gp38Na8HhaCA560EnuJC2TjLlheRnruOjK7QZw1
         KcUOkD7xr3W01eZtv1G/3r6gknfeWFyaoce5xrY6CKfed//Y7h+a+96cMb1iXUN4Y8rB
         zMEmJmfrY4dtHnPTTkK3+N1SZWb8ov7NKKw3PEbnErAX9+H7j4Ze1YUkpE6VnRmqiGdQ
         l07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790007838; x=1790612638;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DIxL0kqk4j8Y34L+nTA86vhyKtqo4LqqAJTpMKBQ+Y8=;
        b=VCtxqLJi/j6ALw0mummIbt/HBUyRZUuyY/kdesndIgQFrcTXwzEfwqmJbY1cvlggwA
         TfQgBsYv8uipb+SbRLnmU8wuz8kdw4W18JzF12u3WQmGL3b+FZdZ5+xGrCsfVAPOOM2g
         rDKrhUQuBcOlQw61tfxLqMVSAyEgOQozo7VvTtGQ3kH735eh7m2Vnl3DqfqXS6ra0SiC
         dsLJ2GNVA/VOcdQKDKdtDhk3IwEqQO3GdeiKqEpeTRfedM0409e2mfo5N62no5QHcgr9
         Br6EYaoqBjz4WM8IuIwI2tlHx3NooPA3FVrErN7Ovrj7paC+5mhafRu4jDHJgDt88Biy
         nwew==
X-Forwarded-Encrypted: i=1; AKwUvBxmn7LPlCLjY3fKyFqntmIJiS9tWVJpayXw9PcJl/ZMG1NyftSC0ZpzelIOEidfM5G4idgZtAVbIJqqIeM=@vger.kernel.org
X-Gm-Message-State: AFuF++mYp6UKYfCihP95bLyxFWmR+V6zC53ZeyRrd3Z3j986YoarU9xa
	EhvTf1HK333TGGJ/UxkVGU9XXsu1etTbHdeJSaHfWDFOftzw3pCVh6terxHC0gLyCZu8rSyKgzj
	bvOkgRy3E8Uxd/AyCoxqUr7ahmQXD7F6HSPlQw2vS
X-Gm-Gg: AYBFou3NU3BKEhNPO/mqW1KTgHdh8odV6W6zA7PZ9FYPBTUInp/yI4nSS/zWrirEUHr
	wnW4SPX+CDx2NhetjgAGhoI0yrUqlmiF5Ggjc/QOiesLMMZD94mPz5/X2VB1ovUt0gFaHK98WBu
	lHi0TrG6R7zAL0kmOl1STdXN8+RJyCMwEMnqibP7CVSj2HYACLEyjZiIAiF0d+k5Usj7g66GLkr
	eRM7xRPmmCaQK5HBadAcvPJiNgAoDbaAUOlYw1rsVB82TLL43m4nKjHF8B1jXUZb2fqAeHd6L3R
	SOtFzn2rGCQa5lEFfpRcyO7YJELThGKLO0wTpJvfRNXvcSJj/2obFjscHKf3x2MIjW8G9CqB1ir
	NC/GVrGYC+zUxgM+QK+0=
X-Received: by 2002:a05:622a:1cc5:b0:532:9003:35b1 with SMTP id
 d75a77b69052e-532d8d2fd53mr4769851cf.2.1790007837072; Mon, 21 Sep 2026
 09:23:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915091112.333308-1-dapeng1.mi@linux.intel.com> <20260915091112.333308-2-dapeng1.mi@linux.intel.com>
In-Reply-To: <20260915091112.333308-2-dapeng1.mi@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 21 Sep 2026 09:23:45 -0700
X-Gm-Features: AcwNN1WkLBXtXxpdp75rpfIZxFhFJUV8npdtSPEEAM6R2JsKlD9iC8Gb9DOXIjg
Message-ID: <CAP-5=fXQ3dRsg5erJM2YaQ2A1s+YBXSK9vScio__SQWnZyssPQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] perf util: Explicitly include required headers
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Zide Chen <zide.chen@intel.com>, 
	Falcon Thomas <thomas.falcon@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 2:18=E2=80=AFAM Dapeng Mi <dapeng1.mi@linux.intel.c=
om> wrote:
>
> Sashiko complains "the perf tool can be compiled with musl libc, which
> enforces strict POSIX namespace separation and does not implicitly
> include headers. Relying on implicit header inclusion can cause build
> failures under musl."
>
> Include the required headers explicitly to avoid such failures.
>
> Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/parse-regs-options.c           | 1 +
>  tools/perf/util/perf-regs-arch/perf_regs_x86.c | 2 ++
>  tools/perf/util/session.c                      | 5 +++++
>  3 files changed, 8 insertions(+)
>
> diff --git a/tools/perf/util/parse-regs-options.c b/tools/perf/util/parse=
-regs-options.c
> index 709fcfb077a2..e70393388fae 100644
> --- a/tools/perf/util/parse-regs-options.c
> +++ b/tools/perf/util/parse-regs-options.c
> @@ -3,6 +3,7 @@
>  #include <stdlib.h>
>  #include <stdint.h>
>  #include <string.h>
> +#include <strings.h>
>  #include <stdio.h>
>  #include "util/debug.h"
>  #include <dwarf-regs.h>
> diff --git a/tools/perf/util/perf-regs-arch/perf_regs_x86.c b/tools/perf/=
util/perf-regs-arch/perf_regs_x86.c
> index fb6cf34f42f2..ea1d402b0893 100644
> --- a/tools/perf/util/perf-regs-arch/perf_regs_x86.c
> +++ b/tools/perf/util/perf-regs-arch/perf_regs_x86.c
> @@ -3,6 +3,8 @@
>  #include <errno.h>
>  #include <string.h>
>  #include <regex.h>
> +#include <unistd.h>
> +#include <stdbool.h>
>  #include <linux/kernel.h>
>  #include <linux/zalloc.h>
>
> diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
> index a5b596cd14be..04fba6fb02e8 100644
> --- a/tools/perf/util/session.c
> +++ b/tools/perf/util/session.c
> @@ -1,4 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <stdbool.h>
> +#include <string.h>
> +#include <assert.h>
>  #include <errno.h>
>  #include <signal.h>
>  #include <inttypes.h>
> --
> 2.34.1
>
