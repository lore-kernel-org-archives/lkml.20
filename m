Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B9452CCE0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 21:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789766535; cv=none; b=mG8qGCBl37eXpPyTcZUX5evPIKZhnm3KwiKtLyrVgeHNRAXUXo7zIx1AW3kGtByG7xmfdaXKU1MYpsT5gH2AL5OWbjjWeFL+d6ZfNUuI7OgO6Gl8uqcdMIlgJ1zZi4xYac7Ix0P0nbTePLRcw6VupV67MxHbdb0CdVKe5u18IeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789766535; c=relaxed/simple;
	bh=X9OZRbLgJLOqk1WlSsd3gudo9f4gAyD1+kyq5qwCh/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DXkvYxO+hYi/IG32tAtZ6EO4oiEoYluugV622cqEjijk96SbeXWDaJMf2dpjLrxghXCPaPrGdGThgJ3oAZkGmkcDPuh2DdZ1u8tUfTFssz/Z+aH1bpp67mrFo7fDozWqkFXvHgrxv3GVPytE4BhCqwr9QbAd4ypShhl+yf8ChWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uowct0ls; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uowct0ls"
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-785692e5907so736424137.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789766532; x=1790371332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9OZRbLgJLOqk1WlSsd3gudo9f4gAyD1+kyq5qwCh/Y=;
        b=Uowct0ls3LatVKgW4aDT9bGdjAu5eqAYiFi3pqhl25mwm9UaID1a6tlkTJ7F9W/Z2R
         +XHVHBvIKKb5P/xKd3AjheebKtm0p+R4OxNFr5LHgWfkz4t3WVtt5iXnmLbfqoiOS2Fj
         KFZnNj+hwvEC3DQKX2Uh72Zz9mdnaLwxpu0ZRi3DMgB6yvXjqpt34L1SM7c/5PQ7Db4w
         P0irXiS6uZBGOVKwSEBKrDBacbYw98fMAMmtFZkAe4n4j0qgH6WpxrydxvI2Nj7MhLNO
         EJCjOnq33uD9o10JqaMYis96vc8Irq6aqbi0Tz3Q4xoY2J/mzaDHkfFv1Wiga1W9zP//
         +OZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789766532; x=1790371332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X9OZRbLgJLOqk1WlSsd3gudo9f4gAyD1+kyq5qwCh/Y=;
        b=dLPBZ/bLax7iWGNZFZX93dw7pm/Tgs/fyhLfydcvPwO9bBJxh7MQ3PMXaxiGz7g2/x
         eLH1cpUZRZSSJi6dRwqcZ91l8jzWXXUQ5rxwBobMgkYaB7zRh0X+8wXce3JrRivE5vv9
         ETCdRI/xRUAJpXv/R54lxreXyU0rkldKKqcUxxyqBUX6zkz8y6jHDeZ4pduD326sV5Xl
         Yfd9b/nl+4CMx4r10noPIba4ggqit4yO2eS7NwCS+nVDnuAxqMTniwN+CME9Apq8oLOC
         alRs1g1nEGecfwBQA4OT/g2ma0ccGVmVneD0i21QnIxRR3UZ0HgJEgbpRoP7Z9k/NIJi
         bzWw==
X-Forwarded-Encrypted: i=1; AKwUvBy1qCVSCgCRgbxg9nF00o4oiDlTr/S4+1OjjtY8M6FOb9hwbnmEzesZmnjHAmpvSU1WuPBVGSxdl1XlyHk=@vger.kernel.org
X-Gm-Message-State: AFuF++m4N3q+Nu9yRvQrhcihk2zVbDRT0SIuoLCowETernEiG8rsa9NZ
	VPdNbuLP/RDGijUI1ywLe2SVartQ4l0u4dnh+CiadAsmMdqitP/01kqc
X-Gm-Gg: AYBFou3jcIc5bB8OEKQH5HT8dqGjh9H37N7oCZ1CzwUkSfizxs6/g7GENn6UTmfh9M7
	fQ6AS0AqRkgoubeLNcxz54BLeEbJoNbCFKIin3Et7WpWI7/mqZifQ0PN2zs+Krvd4rhBeAL183m
	gF7zdpB3UvcqqhQq/ummh4tQY5Sz66ptCLkTpYdH+WO4F70TktadMKX3Q5E8rGlb2Gf9AJMC9kS
	kwJlJykwvcN61Ut/yHKhB5VSifQBXADB1WCXRdDGN52tYN8pkej7urnyknpglAjqOl/P+gVIKVs
	cubmoOUIeEPd33R57+smo3YDmEsUx+1da+qYbnpUZ++gt5+88zfhLJICNwQb366qB2dvv+oXILJ
	K6MsPbh/PV4TbMU/6wDbmoc77ZYgjPUNuLijHKVB6GZRHvsb2kEFMsGhNc6mciprn7Nd0+p4Y4d
	/YmNd1e4cLAbzGtPdO1zdG5u+KfukNaUDGNe75FnDxukCQH4De6qRis1EckcFYTA==
X-Received: by 2002:a05:6102:5094:b0:7a1:f951:664e with SMTP id ada2fe7eead31-7a55d28698bmr2162620137.21.1789766532242;
        Fri, 18 Sep 2026 14:22:12 -0700 (PDT)
Received: from beelink.. ([186.22.57.86])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7a6ac1bfdd0sm649155137.3.2026.09.18.14.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:22:11 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: slava@dubeyko.com,
	konishi.ryusuke@gmail.com
Cc: linux-nilfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] nilfs2: fix checkpoint root lifetime on sysfs errors
Date: Fri, 18 Sep 2026 18:21:53 -0300
Message-ID: <20260918212153.23651-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <13b330df140a2ee488952b4c7145e261ec884555.camel@dubeyko.com>
References: <13b330df140a2ee488952b4c7145e261ec884555.camel@dubeyko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Slava,

No, wait_for_completion() without a timeout is intentional here.

The kobject subsystem guarantees that the release callback will
eventually run -- CONFIG_DEBUG_KOBJECT_RELEASE only defers it, it
never drops it. So the wait is bounded in practice.

If we used wait_for_completion_killable_timeout() and the timeout
fired (or a signal arrived) before the release callback ran, we
would kfree() the root while the kobject release is still pending.
When the callback finally runs it would access freed memory -- a
use-after-free.

wait_for_completion_killable() (without timeout) has the same
problem: if the wait is interrupted by a fatal signal, we cannot
safely free the container because the release callback may still
reference it.

The unconditional wait_for_completion() is the only safe choice
when the caller must free the container of an embedded kobject.
This is the same pattern used by other subsystems (e.g.,
blk_mq_tag_set, configfs subsystems).

Aldo
