Received: from mail-dl2-f33.google.com (mail-dl2-f33.google.com [74.125.229.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8333C9EE4
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869908; cv=none; b=b0JtfM/Tx/0zl7yP6gzYNK92g/mpp+2S9leDL5TuE5QgVzp9JG0gpZC4sSv5lSbUkKgNC4fhQIAba6tzKlDeCTKGC4YJHkCoRlBtkN5U9bQNWUyj/xo2h+uoC4kAhjJN08Nz7OYsszrGx9OdvpUNGu6DAv+w0o7WqbEUGS9UcGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869908; c=relaxed/simple;
	bh=OF2UpoVYoX410mc1SzzOypl8KSOO/KvZWjbPCC/0g54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TbHpBr9ccc536keo9+OAOyqxpevVbie+UWzZsAO+KOwJLXEPgvqOIQddC5brIP8FU2U0oo9PGMl2i6ma2gD/flVqQuu46oePa7SMYww9+7P0hvvI77My7pDs6JWXuFcnNkhVMh+0jtSHa0DIbZ6txSBw4qMsQD9wz8PtRsHQVt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AhPM8Lsb; arc=none smtp.client-ip=74.125.229.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AhPM8Lsb"
Received: by mail-dl2-f33.google.com with SMTP id a92af1059eb24-1438e88300cso6934308c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790869905; x=1791474705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9SSVxD8Q50vKAGJw1dPQdeHHdj1MbKb779CFMeOXNtI=;
        b=AhPM8LsbVad94+zbA2lzdNWS7cmrAbRUZUTKHYSpn8ECtOWLh9wZbr7OuEMpN/17pE
         aRReW2uAR4S6ND238PjWx6eipDWIOFMrhFgQc2BymCAr5d3/rN5rLz9SbPHAMEAMtee+
         mGz/oZFaPmkBXU2f78UHQaXLOxS2r21eW/3No=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869905; x=1791474705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SSVxD8Q50vKAGJw1dPQdeHHdj1MbKb779CFMeOXNtI=;
        b=2HraXUq0Z1FMQBy2E5SQIbTrXI+wG5xQL0VFZnnTU0Ywsk3Qm/WlBcxwFaUXQoIAkd
         6p8P8cIZjxMSKvIoO1yw7Yj7MrgtVq9dpnobhtqSmlJUktBfmRIw4OpMy8/E5devbVz0
         NZ5TahFr6iBaV8DGoDlELV1dzNi1Ry2dwAadNBTIaq+s4Ma2EdKbcuzuiAM83OHTGY5o
         qF05/aF2ujVBXe8B/NgzrvE8dFvh95TXJZqUITFuBcAGmkIfEjQpFOajADvjTbm3rRfh
         GGYLFD0vWavVN7/Xj99V+SWtRf1yt6qs8xUhsZLfV5arDuG91524+O2unekglR7oVOo7
         P5Lg==
X-Forwarded-Encrypted: i=1; AKwUvBzPMYwld+nPF8Ejdj63bUxBwSt+Bn9MiW+3mjWIHTspQtSNE4NkrmC6SpaPUaPoUW80DjENIrSdfJQeSSI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKWaVpMwxGHELQtCpYsBoRSa3ETG2VMeR7PKP+A9qSiv7yf78+
	Ty4mz4PVID1hN1fS6ea65QR+8xpATsdHX/4v+26QWV32QR60fKZSPv9aHqWA+gZ6yw==
X-Gm-Gg: AYBFou0/A/pTVraY9I2t/nl8w5/JWa13baBBPV0n08RRIr+DiaVuIoGFlIi9gi0QsBS
	2QYjXlF676gPgONWd1Qx5LUY73ePZ+vxanu9MtbjrGb76P5Ad8Bhek8f9lMyso2mMvLd5/e4z+b
	ZbkqaxtZWhHoOudnsBqwHAaC+NXlAAM3QIlEBrbmTI331O0WU34GSmXY2pwoSuF4xw4Bt6IBSsS
	ee1ocLG6GEW18P1dVHzLFYrzTcj1MnLsmlEyxEnYfxvcSzYsBhG/kopMf68BlMaNLt5jL8rz+RC
	/15oCF6zYWNWChH4sii0uAfOlYaiMPw0GgdhpLMWPkU+HJlwLd1+Iz+wWylSdL70Z88JFhO1RnU
	lteUHVDLkUO87Cj0pQOG70vLmPLA9EvObKLDlt77s43rW8chyOazqHas8dVJThK6zxLJyPUPK1g
	8X27OOnvad3HVKawUkzBLZJnZu5zaN40Sc6XUiaLxNqLN2GupdVsjGWm2zyy5PzPJQUGcAymUMJ
	zsw3uhY7GJ73QqeWlik8h+NGWtag7MqpzG7zTQ=
X-Received: by 2002:a05:7300:b2af:b0:34b:354b:79b9 with SMTP id 5a478bee46e88-34cdbadb190mr5134704eec.12.1790869890202;
        Thu, 01 Oct 2026 08:51:30 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:7cf1:ee59:f140:7be9])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-34db3750765sm7796452eec.12.2026.10.01.08.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 08:51:29 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>,
	Len Brown <lenb@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v4 0/2] PM: runtime: Overhaul kerneldoc, runtime_pm.rst docs
Date: Thu,  1 Oct 2026 08:50:07 -0700
Message-ID: <20261001155118.1750028-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The runtime PM documentation could use some improvements and additions,
to help guide people less familiar with the main runtime PM concepts and
its internal implementation details.

v1 is here:
https://lore.kernel.org/all/20260904212000.4167880-1-briannorris@chromium.org/

v2 is here:
https://lore.kernel.org/all/20260923174711.1283986-1-briannorris@chromium.org/

v3 is here:
https://lore.kernel.org/all/20260930025044.104824-1-briannorris@chromium.org/

Most of the v1-v3 series has been applied already. For the remaining
work:

 - Clarifying core concepts in the Introduction. (Pretty much all new
   readers I encounter have a hard time with the difference between
   "enabled", "allowed", and "active".)

 - Adding Example driver patterns -- because the API is so large and
   complicated, it can help to try to walk people through standard
   practices, and what everything means in context.

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

 * Adjust the way devm_pm_runtime_enable() works, specifically for
   remove()/teardown. Currently, this is very hard to use correctly --
   some common driver patterns may assume that a device will tear down
   while RPM_SUSPENDED; but that's not actually guaranteed. Notably,
   this makes some of the "Examples" section fairly tricky/subtle.

Regards,
Brian

Changes in v4:
 * Significantly overhaul introduction, based on Rafael's
   feedback/rewrite
 * Drop most implementation details (struct fields) and API names from
   intro
 * Expand the "in use" and dependencies concepts in the introduction

Changes in v3:
 * Rewrite Examples to avoid devm_* at first, to highlight correct
   approaches
 * Include error-handling and remove() in any probe() Examples
 * Advise more caution when using devm_*, as ordering issues are subtle

Changes in v2:
 * Major rework on Introduction section, especially regarding "enabled"
   and "active"
 * Add appropriate teardown to "Probe with Hardware Powered Off"
   Example, as the remove() + power-off behavior is subtle here, and
   easy to get wrong
 * Drop changes that are already applied
 * Add a few new fix patches, noticed while reviewing the rest
 * Move Introduction patch near the end of the series, as it is a likely
   target for further discussion and modification.
 * Correct Ulf's email address
 * CC linux-doc

Brian Norris (2):
  PM: runtime: Expand introduction with core concepts and structure
  PM: runtime: Add Example Driver Patterns section

 Documentation/power/runtime_pm.rst | 589 ++++++++++++++++++++++++++++-
 1 file changed, 568 insertions(+), 21 deletions(-)

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

