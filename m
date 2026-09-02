Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EE020E334
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314209; cv=none; b=d3v7Z+y4in4jObFP/JRSI6nw7xhTcxrHqf8HiFKZZXA84pAimQu8EXcxFBV7RCII8toyRBUkyHGzk6B5dzC1MDJ4J/XONT8WNhpxcPruoMQ/4HLdAYuxQJlCjFgjhQlwcOV8IB6HfXbJehKzjkxOJWi0LDE2Zi39bM/WYE/gAYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314209; c=relaxed/simple;
	bh=B7FskVfDnX8Oz02fpEp2GxWVOi19S6IVI9O1jHf5Twc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RqaWn7PQNhKmpiCfuX4TboJRhgVl47gDr4ynMsbCM60l9dG4ArUN6n36AlAeoBhe9vFXvv+5PP1pNAo7FpouPfl2y2HmcGm/sstPRKyXFCVAEc1dLteYSqoMl1qghF8cUVv5dXx7pSQPyzJHDDeOxu1H1PvNVeLjUf0ScP2IFA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEBh6VZd; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEBh6VZd"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84fa3b14ee1so480827b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 18:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788314201; x=1788919001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0iE/WlAJeXqXVC99kZcLf0HoTEM4Su3/szAnydyeKE=;
        b=YEBh6VZdE7SHSJHc7d0O7JTgPLwBRfnenCiDrOvfOwt0zs0RzbE8PB6EK9t6pcWKJb
         UuYYKohNVLGFMty2gvAL8w5iUfA4Y4cqMzP4aJre2le2u/abseU5X+W0x017lWpPOJqA
         15z7vCHYgnoWyThqHr9mGc+ZS6tVmCPWpsxqaU2GLulce/RIRym1eUtUD4TCNcG+RzR8
         4NOLgGRj9RJMO/5ZK8CNNWf/AqYf9iO2CabGTALMpZwDb8kEOt853X0qISbzps3b4BbS
         e3Ukn/LpuyRi+a0VL1mYUAnmAPcDVqy6SDuPRL17jiUd2mwB0aC+OqJiKoA3I3xP6Jw0
         iRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788314201; x=1788919001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0iE/WlAJeXqXVC99kZcLf0HoTEM4Su3/szAnydyeKE=;
        b=K60mSB16hdSx/exZJSEOL9ST3UxyOxu/LzBJm5CJzGzQuNw+Ea26sA+4L6pcEwankr
         8TrzRnJYYsMxpAQBixM3Wiiar9m0u48iJyhigb+6dNzpQxnBh1tnRUOrMRUJIfLt3Kl5
         viiT68AkterczwvsVokVfPPxxd/eQlPfE6OHeX3VdY6sOTzvFAfWUY6GAtFfkgTurWKA
         04qQEfDtj/Fkn10XyPLGishoV8ljOlRd0ZlD1TVyyzA2nCQaZUQGG8Ej7CmAe01PnS7a
         Epv+EHxEu94PPX5Czw4vVPgyc6NKFCabq96VQ1F7hdpTA/pt8549t/Ch5vyukWetvvLL
         1YgA==
X-Forwarded-Encrypted: i=1; AKwUvBxM/6b98DWZrY/ewrDIPXok7I54uTJxd9d6SLm+zNSo/w3EnJyYBVT4FjgXvZ0bGz7N0cvc+s/24cKQS6E=@vger.kernel.org
X-Gm-Message-State: AFuF++n4FQLZZGJlHWbbEx9Q0HVxpKCaz8uIyYavmb4goMLkkbXvbmfQ
	UmVrrRY4aQwTxAUQ+qKRM8coaZ4YN+2oW7e1Dol3Sgn7oP7oyMD+BCpT
X-Gm-Gg: AYBFou0zMFhYlcL9+gGxPlYWRSUQGRZhdG29/u1yqmJ06A03fMQfYuHsrgYoKXbvSVS
	vV8/38MEtkMol6DZ3bhxAp1l44ajgElh/GVgjCI+VL5cNU3UNyRQ/hYtfGxEUmCg4aybI2ntc8C
	ziL8X5awvdQzG+Uwl5iMiGNX2OUceaBOp0cjJTaUfzdqpT3v+Ag2c+6AtPrDaPYND3LkIcNONYY
	MWxGdHeicreEQSsGkKmMM+5bbJ/3HHU7p+EP+EcNirjbeWil5l/Xu3jevhr58G+HrAPKHGpGXgu
	8NIv6LDXxLPkqE0KUXQViow+uMbKnk/X/P5AtGGSgpP4JI45KmtwNktiVp3Tcm4kve38SxkKyKy
	mwWv3EXC1o9i0DB4Sm16a4JVK2SPXbCNRyn1OM4ScJUSuc74wcovSTbP6oz3GiHwBnmY+MHergu
	TYYAyWjFJ9iNY+aYj04SpxGsCEUgCU2802kwViIsK0g+fGII+lcPJw29hIx1sI1GFkIngkRSsve
	xVeJNNoOshdK3FIVhAE9VHkpGIH
X-Received: by 2002:a05:6a00:1da5:b0:857:72ba:ff0b with SMTP id d2e1a72fcca58-85ed3f70537mr3178673b3a.19.1788314200492;
        Tue, 01 Sep 2026 18:56:40 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2ad8a45sm590819b3a.18.2026.09.01.18.56.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Sep 2026 18:56:38 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Asier Gutierrez <gutierrez.asier@huawei-partners.com>,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v4 1/3] mm/damon: Introduce DAMOS_QUOTA_HUGEPAGE auto tuning
Date: Wed,  2 Sep 2026 09:56:01 +0800
Message-ID: <20260902015616.57702-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901142307.100701-1-sj@kernel.org>
References: <20260901065847.42869-1-lianux.mm@gmail.com> <20260901142307.100701-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi SJ,

> Seems using MTHP_STAT_NR_ANON that is exposed as 'nr_anon' can be used?

Thank you for the suggestion.  I will study MTHP_STAT_NR_ANON and nr_anon
further, and document what I find.  We can continue discussing it by email,
and I will be happy to review any follow-up or updated patches.

> I'm curious if you and general reviewers need or prefer to directly be Cc-ed.
> I was naively thinking people can search and review DAMON patches by
> subscribing to the mailing list or using the archives via lore.kernel.org like
> tools.

I subscribe to many mailing lists, including linux-mm and DAMON, and I also
follow patches through lore.  Direct Cc is not required, but I appreciate it
for DAMON-related patches.  Because I care deeply about DAMON, directly Cc-ed
messages are filtered into my important mailbox, so I can archive and review
them quickly.

I am very happy to contribute to DAMON, and I look forward to continuing our
discussions and reviews by email.

Thanks,
Lian
