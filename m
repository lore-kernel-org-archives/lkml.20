Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576B43783B5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755989; cv=none; b=lvU/yAa2oD4DkGFV4aVo2quip2S8jV8F+lSTNZEXxRsaNiBhlGlgGtjqYQK41CMGJqo4SfdVxl1WW0VZ9lgFdajuefe7TZy27E1kKbDOPUr32J3/SfhfmIigWR56DtdZ8aXJ5dHfmhwz8SYAhoKTPQyPlKFNEM1+GpZ3D0BsABE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755989; c=relaxed/simple;
	bh=0szBl1KpAqdYl+/iLU82KzE0MUT5jGzpSEQ4wgBzJhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RB3BOgYA9nZLrTgTn2x8lYfyWIhF1l6goj5Zq/dyRZt5SDFzJd/liO4efnBYBHhtnvqwYNeLffhsL4A958LTnWZ60VXg68PsqY5eWjWt7Ecl2zauGumZbsouIbrb1jMsdv6RFupxj30hSwOzAJlVINqNdZEsHr+S5sHQ0vCs6Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+yCZc5Z; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+yCZc5Z"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso2199278a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788755986; x=1789360786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NFJtmsje91DWGpcIA1bWlvRmTiFeE/3YUxs7e19aT0k=;
        b=K+yCZc5ZSj3CCj/YaZaBdOZgtFEMAVZSlbU7QLUqJdC0FgHtetgb0TKEywlikE/uJ8
         5fcbE/Uo2tHTeg4YKPXvhFa0/zHwciBss4wCVciXOdJz+AGSwiCSrspxWrW3B3uE7kmW
         EFI5V0gqYXDBCldaV74mgpH59X+DCd7wpQ4NnCIlp5mYcTR37lN0aS8zmPFepnTwmpZH
         rLj3Gj+LpZ/j6cqCw9QZRuBW2KZ1KtWg/jPnog9UrsVTMnEb9C8Q1TH4/jGBhZ0eTcc/
         1ZRh9A4ppWEyW/WY4f1U1S5flyruovybemrJWAMylu0ZFiUR8Tuc8v4Ij2D2r4YPV4jj
         YZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755986; x=1789360786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NFJtmsje91DWGpcIA1bWlvRmTiFeE/3YUxs7e19aT0k=;
        b=reUU3GHwtTGt9sU2T7lnvfsneqAZUd0Y2spu8LfQ2YHxl1UKjgMuiEic4uwWYssiKX
         hv0EOYlvcBh7xVkuFLky/OygNYC28UAsKLyGU6w7s6Jg2zevYbT0mzxrj6fguYbiwS7A
         TKBLUU87uL7E08h2PMDJgoIUiFa9eTd31bVKlU2qmdizQ4XAYRo9kW/2hW/7xfSv8HJI
         J42HRJ0uaaoTombua78ihW8+v+3GMAQikGspCjpnx7n1kz9CDorC3aqfG56hruqB0oG/
         fJJCpkWWTi/pN4tsKF2S50cqXciYroWuIOdscrVOvFQpqGXjd27NCB50CxVyL07OIixq
         inQQ==
X-Forwarded-Encrypted: i=1; AKwUvByJ5j45Dwty4CKu5DGWivHUul0JljCstjvyqJAfPUvH3umZ74r2UurWnqhcqEMkSwX/0CPsirU7+tuPg+g=@vger.kernel.org
X-Gm-Message-State: AFuF++k+G76Mqq8SSdD90hQa72YEqeKXQnkBrcSzvIXYX/blXfKrcUI+
	+2qoIiaQkxoiVi9r0fjrBr0Bjp5qTuyO2buDT+okrm+qthAb9HiGb6Ah
X-Gm-Gg: AYBFou1YA0Tgx14oO38PN9mIwANwA0T9CW0iq/fcF8iPw945Xt22e889czOqKkIZ2xS
	xVD05FIoDrfonlVcT6SeXFlPtYK+kf/LbEdkxAM/qlNwSzQckBfMNqR72tGBlm/Tod5q9G2NT7F
	ZuHul70zY9bd6WrqdwzjNVp8DXu0zSEWYPqCEDVIbRuIyip4d6hRiZyw81npKL4IGCvSSlIYmWO
	VkApmjS9ztUNaY5v334yr3UR+2VCwnaqnS+oYfne2MovYUVaBPlJbslvFXIpGDvugVMwZgYmn77
	PCq/+hLQKnlFYLWOW3spKma7PDn5QgzHfxxin/3fT/WegLCrXb00S2kg7cq5mdV9zAFk5ERtrrP
	oBWeilyWEuuzf6jkaU+of1uevpRacsKGO7xIW3fsHg3I+zxcdYhHdEfBi3PlPHT+JsGGvIPuVDw
	Cix2GPBm6p8HN6w4vtVLlw1TtCgC6ri2B3iwLit1rJ/TPUezjJKd23KhamptuyzpVEJva8Tp6Gc
	WcbTs6Y4/56lMATornIiXIQQw==
X-Received: by 2002:a17:90b:2749:b0:398:d292:e6d5 with SMTP id 98e67ed59e1d1-39b26304385mr32688314a91.24.1788755986571;
        Sun, 06 Sep 2026 21:39:46 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm22649867eec.18.2026.09.06.21.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:39:46 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Thomas Renninger <trenn@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	"John B. Wyatt IV" <jwyatt@redhat.com>,
	John Kacur <jkacur@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH] cpupower: fix typos in comments
Date: Mon,  7 Sep 2026 10:09:33 +0530
Message-ID: <20260907043933.33452-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <f1b5ae1c-f6cd-4f9f-9143-4bdd3b8c2b46@linuxfoundation.org>
References: <f1b5ae1c-f6cd-4f9f-9143-4bdd3b8c2b46@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fair question, and the honest answer is that I did not need it for the
typos themselves.

checkpatch and codespell found every word in this series.  What the
assistant did was the work around that: splitting several hundred one-line
fixes into per-subsystem patches, running get_maintainer.pl to decide who
each one goes to, and drafting the changelogs.  No part of the diff was
model-generated - each change is the substitution checkpatch printed.

The Assisted-by: tag names the tool and model because
Documentation/process/coding-assistants.rst asks for the tool to be
identified, and the prevailing form in the tree is Vendor:model.

I should add that the review this series has had since Friday has turned up
cases where the mechanical fix was simply wrong - deleting a word from
"kicks in in a timely manner", for instance.  I am auditing the rest and
withdrawing the bad ones rather than leaving them for maintainers to catch.
