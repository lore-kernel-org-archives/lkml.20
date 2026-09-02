Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3357415F0B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341091; cv=none; b=T+tXBikr4xbuC8Pl3iBmmSYY6QowNqWgo1jwVkRmmjPOW6w4RKjzYPmD3nEh6UOV3jZq7e3mYe5c/OXBxrT4nXaCK715+3zZhez+SSslaKgklf9OmpyJerV9Vh3mY4vqsYUhWLTdIa9rrtuKZX3udG3o1wCXlwszM/7/Iun8M/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341091; c=relaxed/simple;
	bh=ZdHHIbZJfkxShW+VC/jzQX9xO0bjMsfZ4Uqry3H0ap0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bryCuLAUHDsjE/Avs+BfHJ992Pp0eDqp+zpob8FCvSuAdlkqs0Aikw0i0d3h6T4SnrkNkIChe0V967Rlkr+5d1YeePxW3FCMy9MUdHwI6cKS84fZHwaeEt9CPsafq05C2LY32jbw8kYv4g1mobSNwdlASorgEj8TS6oELMWhaEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SHoUGUrm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SHoUGUrm"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso8001895e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788341087; x=1788945887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQeV/8ekaSrKNPDw7JKOOSul0YRAVF11Ftj2jef2Dyg=;
        b=SHoUGUrmhH5s5DeMHO8lbMtz8qJ6ycnCfApQpx0eETNasHbtoRCO3NaSNT2URCmPm5
         4o7Y4UaGKSaU8D0fuyuZ7Fc5zPL2Ifrl6p8gvxbC2cqbjvzh6WQvysFpmfnC4YqMqWTD
         OehE7Gw4xbDBz2aSaa4ydkGDmaqd+O87/iZ2a1eHydQ89HbqPBTXaWrtvjy14W1olh/6
         pemrGHqsuO9M25p9vBhOWOwWYwy/jCO4k6GFPjUBRG6XA2NqXczzIu0HXYRl0Ekqw2E8
         CJISLKz0hhAQaLhl0JAeVSDcRXuShes4EG5WoAOWFYBLMCbVzFoNWuaCSyBAUofW43Pv
         C7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341087; x=1788945887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQeV/8ekaSrKNPDw7JKOOSul0YRAVF11Ftj2jef2Dyg=;
        b=MC0bLyUyjijT0as0v7dM1rI0xR9sDLax6FPBUULRYPwIrxLPcY+VQnQzNuJwTvlESM
         DEwtne/Vc6u3MVn9yXfX0+JQffdEzxVUfL8GVD+rNPtYsql/aHeSHv92X1B+kW4ECa+g
         kC2wbhj77FBk5esRi0/6HSnkEXsJt1sDNDp6MyUazP/NrrdgW9IrF00o/8YYtJLtamJz
         +jEHBcNJy4NMKRJ624x42xLgNwe2jcuhZThaUFsicUzn5Ciyagm4vuh2jnt5Ys8g6zwa
         Y+TEk5ExUaTnDmbtjjqZir5/WlGWrCHpEUyU8GeDAZ3wcbQsg6oTuKZ2tF2HtqdXe1UG
         ojkQ==
X-Gm-Message-State: AFuF++lHA04/uvQ1FBXX8ziaWTH1HSIeUIRdmfxVncN51f+t0zW6xa7s
	H+sH6g3M2YkMfOmZxentnAvEv/xew/EuvRP3CAU9d3jSOTHDo8yHc55EGu6lqB9xSGUNyhDG+Df
	iPlJ6nms=
X-Gm-Gg: AR+sD11D5THM49ewkH81ikEFnHqQy6Wf6ymqoyZjIotPFQDYa0wtJ9mzTa9Ga8dfc4t
	rIJgQytdbK+zI4WppP33zrBp877UQ+iHrxhugGfbYfqtQJyUc6a4mzN07Q3Jy9xh/nfMpgzxWMd
	3XP+W8hGII2OGp13GvOZ+nFtRlTmJIu7pO9KpPpPtRefpebHKNEuWnah+DDqzK67kRl3t9ZcJyu
	o2qrCNvvu1evF0OSdEY8v7V6AjCZNkjtEswfDeZmNrMEgm12tW4gGHeh+RiFX6SjgWEqd+CCroP
	kYigtcVBE+vFiFse0KGjOz8b4rapIcTiSxIt4+z0PK7gALQrSYrqjFzrj7lSD0IXV5QlbmbtXrB
	/Vy79dg+pJfnbKHggq4SIb6zLr7nonIIVlUM596RwZKeTOqmeRXsjAPTQD7fTUpmfpfLDiYDa92
	NU+GZU9JUZsAkmUkcK7q8z5xPtg2mbz38SrUpE48/LSMOs3BPZCv8nspeCiaKjpuRCdy2x
X-Received: by 2002:a05:600c:e558:10b0:49c:e9c1:2819 with SMTP id 5b1f17b1804b1-49ce9c12842mr13261025e9.16.1788341086717;
        Wed, 02 Sep 2026 02:24:46 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46422desm52404145e9.1.2026.09.02.02.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:24:46 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Marco Crivellari <marco.crivellari@suse.com>
Subject: [PATCH v3 2/2] Documentation/no_hz: Change dynticks-testing repository name
Date: Wed,  2 Sep 2026 11:24:25 +0200
Message-ID: <20260902092434.85096-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902092434.85096-1-marco.crivellari@suse.com>
References: <20260902092434.85096-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the documentation still mention dynticks-testing.

Recently the repository name and the tool have been renamed
to cpunoise (see Link tag below), so fix the URL.

Link: https://lore.kernel.org/all/20260815083728.15470-1-marco.crivellari@suse.com/
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 Documentation/timers/no_hz.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/timers/no_hz.rst b/Documentation/timers/no_hz.rst
index 7fe8ef9718d8..4006cab64079 100644
--- a/Documentation/timers/no_hz.rst
+++ b/Documentation/timers/no_hz.rst
@@ -204,9 +204,9 @@ but do not see any change in your workload's behavior.  Is this because
 your workload isn't affected that much by OS jitter, or is it because
 something else is in the way?  This section helps answer this question
 by providing a simple OS-jitter test suite, which is available on branch
-master of the following git archive:
+master of the following git repository:
 
-git://git.kernel.org/pub/scm/linux/kernel/git/frederic/dynticks-testing.git
+https://git.kernel.org/pub/scm/linux/kernel/git/frederic/cpunoise.git
 
 Clone this archive and follow the instructions in the README file.
 This test procedure will produce a trace that will allow you to evaluate
-- 
2.55.0

