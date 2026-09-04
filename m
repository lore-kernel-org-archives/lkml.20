Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8365B3DDB0A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788556819; cv=none; b=FA0eJp/E01Q029ZYtXO2jRN44F1DxM/m2WkdyZ7wrRzvbuy1NcmYHMrIrq1dMjHUR4+7RisyEXJQHMNZTGkBlW/bF6jOSmEdfm+ddSxavrWLmOFtzM/YWIFl+Ld3ji8S4pwiRZrJfS++HY0y3a4s57eECYy/NJ93EPUXS/8/YxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788556819; c=relaxed/simple;
	bh=WECOXtzgmU3pytQmEyldGn4N2Qsc3l93x2GCjunkLAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g8de067TF6ToTHS5WTu+iC1pqZ1uEmVZjMfwYUklCXQUu4N3DrzFt2urLfozxhQl0Vbw/gt8/MpGKUWiXe52wUAjDauyxj3Lu2KMX81aS97F6JrM3TerMmlx1bBG8/EuyuMX6s25usOlWasAqzxcLqGgS4LXsLdVojIfbdxWlKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eNN+XXck; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eNN+XXck"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d94c868ea5so14900815ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788556818; x=1789161618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JOM/X+z5mBAOMP3cnh0Z9yrAw//GnO+efgsvLLHBMy8=;
        b=eNN+XXckrIE6mef/kXyQYKl20ly0pXuLyvVBOIUR9tGFRcN3JbmrH9z/3LE4Y53Ugm
         OKGgfXOIttncnoBhZU0TqW73w8/Sv2v0f9EshKjWLiAHMnYs7RQTuj6+du72ceJD872I
         UQXVtmzTi5oI+vvPtIMUQ0rXNyOWji0As1R3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788556818; x=1789161618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOM/X+z5mBAOMP3cnh0Z9yrAw//GnO+efgsvLLHBMy8=;
        b=W7SZhDcPxtlP0gQufLm3nPHr498TCVMf4jXK64yxMt8Mqox4w4kGKtTR7bFqH4RrNL
         gKW8+GSos228lc/P37wOK6RiEVIROYN6ihZrcu2TmYpesTRfhKB2618OSc4k+CBjC/Ur
         48nwhbX5+1vFRK391f15ARR1n3IchGhKyx1ah5hguSdymVxh3fdy8X3VeyqrQ5/kDGpY
         wVwKDZ2LFbn1EBq0PAqStHbD3luZwtthBcj0LUZOcRTDYclFF+ivhM+FuXZPBMFyli0m
         rwgYEpRZ3p/qPkeX7RbBa/TlYpBOnbIfBdcJLpt+mxpqs5yAljJs/oKCPpOnFNQlmm5s
         mhgQ==
X-Gm-Message-State: AFuF++lSa7ibHqhT2f9n6XMtxOJHLfMe1+XWtYZX2/TYQh/uUl53amuj
	3kxJKOsKhBM+VhZCJS9JTioxjEm4oYcNiq/+ppD6OxNhSTKNLraxqxVwqRQGAwlT+g==
X-Gm-Gg: AYBFou1n8mEbYSP5kA96tciXuXKa8EQh+asgpzRCDboB3/d8UxfDNIe0aIsYK5gN2VA
	CdclBDPpYn5X0brJLla6QZ1GHigkQuR43TXW6AZeCFVQIShwKhMyYnysvdvQt5YhoZrkarZivGR
	yxUJlBw+MHAYKksPwTBoatn6YyKNOYqtspBkOSAK4FjgN+QgAtsWjl5vY0rfK8z05vj5WeLqQyP
	peELlMbLWwslR8Ow0AYvwigAbscJpnA8+neGMwB1YeeXnp3MI5i2Ko2rlWkiDFqJBI/Iwi1duYY
	6L8haBxQzl9ysJCQCgZPQNzPrTfFAFaQBE08ujAUaEgAFs3Dv7B1ombWVPPpkcUtmeLKb8awku4
	9MyfwOWwMG3AMHTpWHja8oYN9YlcqzflgI4AhahXkKq+mG3StnRS7swCA/0hCxbvT/FL8QPF3M0
	vYNeeFo58BMYNemIr8cUXUePwPPnL1CwOL6T7rtJ6uRkWYwUmShLJH2ShSa/e45ErHZL3UJN7cy
	sTuc8xhgZieNDvO3yIxgbqHns4=
X-Received: by 2002:a17:903:98d:b0:2d8:d4d0:792b with SMTP id d9443c01a7336-2db12831fddmr111315835ad.15.1788556817531;
        Fri, 04 Sep 2026 14:20:17 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5597:62ab:c321:4a7f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3339885ca07sm10438663eec.1.2026.09.04.14.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 14:20:16 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Len Brown <lenb@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-pm@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 00/11] PM: runtime: Overhaul kerneldoc, runtime_pm.rst docs
Date: Fri,  4 Sep 2026 14:12:05 -0700
Message-ID: <20260904212000.4167880-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series started as a relatively small observation last year, that
Documentation/power/runtime_pm.rst includes a number of API descriptions
that duplicate similar docs in the source/header files, and that they
tend to be a bit more out of date. This is a great case for pulling
kerneldoc into the generated documents, so the docs can live closer to
the code.

Per Rafael, "that's the plan for the future":
https://lore.kernel.org/all/CAJZ5v0jFdUDN_Z5isEpWoisxzMHSgzu460VH2LDCLQTRsUtEDA@mail.gmail.com/

The future is now!

Of course, nothing is ever that trivial. I found several other itches to
scratch along the way:

 * Basic warning-free kerneldoc validation (resolved in patch 1)

 * Touch-ups to the existing kerneldoc (misleading descriptions,
   borrowing valuable work from the soon-to-be-deleted runtime_pm.rst
   portions, trying to improve ease of reading/understanding) in patch 2
   and 3

 * Pull drivers/base/power/runtime.c and include/linux/pm_runtime.h
   kerneldoc into generated runtime_pm html (patch 4)

 * Move dev_pm_info descriptions (+ more) from runtime_pm.rst into
   include/linux/pm.h kerneldoc (patch 5)

 * Overall reworks, fixes, and (IMO) improvements to runtime_pm.rst, for
   clarity, and hopefully to make an easier and more useful read to
   driver writers and people less familiar with the subsystem (patches
   6-11).

   Highlights (IMO):

   - Clarifying core concepts in the Introduction. (Pretty much all new
     readers I encounter have a hard time with the difference between
     "enabled", "allowed", and "active".)

   - Adding Example driver patterns -- because the API is so large and
     complicated, it can help to try to walk people through standard
     practices, and what everything means in context.

I purposely kept some of the larger changes toward the end, to hopefully
make it easier to rework or reject them while cherry-picking some of the
easier stuff from the first part of the series.

Feel free to add suggestions! Within reason, I'm open to tackling more
here, as I think many people have many valid perspectives on exactly why
and how the docs do or don't serve people well today. Or I can tackle
less, if you think some of my choices are not improvements.

Some possible follow-ups I'm toying with:

 * Slimming down the API might be better than heavily documenting it. A
   smaller API is a more digestible API.

   My only concrete next step: drop __pm_runtime_put_autosuspend(). Its
   last user is nearly gone:
   https://lore.kernel.org/all/20260806-smmu-rpm-v4-1-8183d007331c@oss.qualcomm.com/

   I could also see deprecating one of
   pm_runtime_put_sync{,_suspend,_autosuspend}(). They all do slightly
   different things, but I'm not sure every difference is actually fully
   intentional (or at least, not necessary).

 * Tweaking some of the behavior on pm_runtime_barrier(). Today, it's
   very asymmetric, as it prefers resume. But I believe there may be
   value in making it flush (not just cancel) pending suspend too. That
   may be in a future proposal; for now, I just try to make its
   asymmetry more clear in the docs.

 * Sand down some more rough edges on return codes. For example, it's
   very difficult to get any useful meaning out of pm_runtime_put_sync()
   return codes. There's a high chance that anyone trying to treat
   return codes as errors is inviting bugs. (Is -EAGAIN a failure?)

   Of course, the answer there is not "document it better" -- we can
   make it easier to use.

Regards,
Brian


Brian Norris (11):
  PM: runtime: kerneldoc fixes
  PM: runtime: Improve set_{status,active,suspended} docs
  PM: runtime: kerneldoc wording improvements
  PM: runtime: Pull API docs from kerneldoc
  PM: core: Document struct dev_pm_info with kerneldoc
  PM: runtime: Expand introduction with core concepts and structure
  PM: runtime: Clarify ->runtime_idle() callback return value handling
  PM: runtime: Clarify driver callback expectations and structure
    Section 2
  PM: runtime: Misc improvements to runtime_pm.rst
  PM: runtime: Add "Section" hyperlinks
  PM: runtime: Add Example Driver Patterns section

 Documentation/power/runtime_pm.rst | 915 ++++++++++++++++-------------
 drivers/base/power/runtime.c       |  93 +--
 include/linux/pm.h                 |  93 +++
 include/linux/pm_runtime.h         | 409 +++++++------
 4 files changed, 878 insertions(+), 632 deletions(-)

-- 
2.55.0.979.g7e5102b832-goog

