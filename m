Received: from mail-yx2-f5.google.com (mail-yx2-f5.google.com [74.125.224.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA5553B34A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181389; cv=none; b=ZWJoa9niLP/nsLVU/mCJmYj4TwDLT4Eplhho1DS0Qs78GtiL6PutfUwCdrnt1B1LgreEOXZeDPntN7N30wwqkzUstBdYRd+GCpgNzCH2T/aW35Kk7yipqr8dOLkYn0YXxdwCG3+zUdmwcPQ4VAteVpzvBzaC+5Wk4OVFoE+AUl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181389; c=relaxed/simple;
	bh=9OeixsceemmEnxehS4nFF1a2FYDdepSavWu1P0EAnzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZjRMMXRyV+7E4i11wQlOZ3WHCgSRUXdRzynheXQEV18MNf9oJ8YaPM+TGo3EeKl8yPM/QqIp2Tn8qvWCpwRQ11leqnJuy0mwC0EBpKiu2+zr/VtPmey5JCq6/D22HBXo68XKm3YYsK/OIKfoERbqwCxdzC1lBX46UwU0BfxipLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev; spf=none smtp.mailfrom=northecho.dev; dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b=cKOOysva; arc=none smtp.client-ip=74.125.224.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=northecho.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b="cKOOysva"
Received: by mail-yx2-f5.google.com with SMTP id 00721157ae682-86333700d68so367547b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northecho-dev.20251104.gappssmtp.com; s=20251104; t=1790181378; x=1790786178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0e5lTRhuZiVse6rLfC3ssGDQx6Z+oJqHSfiMTS5QO4=;
        b=cKOOysvaur4Q9x2WyEc1b2g4vi39OoTsYvdqSSn+c29aYnEUz+0p0a/vBqVSU+iYBO
         Qa22NU3nCcjEZNi6Nwmij/tsLjGD3uW9hy/TZFDG8phDuMMqmryNMvoOzWGZ9QcxyB2D
         uELEEv+hnUftol0gtl1QZjtbgTw9Bp9rhoAtKUUe1n40l9l4IhPkssn7e6hxQUmp/kp/
         +gRyp2oM/V4iKDb0uanFXWj6YZ2UR8P+jmzUsnhkPn/dvuceEXctlGcM5Og8MIrqE6h1
         DuOBzM+Y9fSKcWkTw6AiCa9Fw1/EUrKDDZHToJ+/RSXGCGBsqi4KOJKFHfZSdC/RChVN
         DKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181378; x=1790786178;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J0e5lTRhuZiVse6rLfC3ssGDQx6Z+oJqHSfiMTS5QO4=;
        b=YObNTrWJpttEy54pOXhyihP/JA6VNvpaCI9+gSHSc4Kors3a0m6s61uTWSeiqUgyNQ
         Af0s8p1eXoSCWRZKWLyogak84+YnUffObWqXEP9MtZhqdtavReA62O5Sy4UzyQtpE5co
         ixxVPrKcVXa0IhbeGnN7KH6qqXMjkOW1vx+KlmqEK9y0vPTM6g90/+3zW7QEcCQtqE2X
         vlVH7KbmPX1ZzUJqDtQSYNzNBMympRfl1bNyttxis/3J/4UQkrujWbJK06enJdkYYk8a
         vPAllDPX25mVbxI4Syj4bymNbTlnnj0LbhyIYcEZ0De4SV+lTFz8fOtIrVkok7olam2n
         zj6A==
X-Forwarded-Encrypted: i=1; AKwUvBxpVri8yE3taPDntcj1Uaef9gc0d9yxK8yJdtc28X8X0G1p1beGaPZeyCQ645ltIXQUzFIXqkJ7SONh4tQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nU6JY7CYZz6BgoD84/sBYWDFGuhGVGdIcMYSahcFGkGargeerJ
	U9YXS5WspkvCa6iDhlQ2aFu+J5ZPFYeVknVizsbrvIqacXaDq7ShOSabPz+N1Tvzjczx
X-Gm-Gg: AYBFou1/eQySFQd0Y9MAz3OxBI+OSxRniGTNhXaffFIZ7QMWDdy1Fsf5eWR8g9NQZV6
	pO2cHrCSINlGqkU20a/wPza77Vdnim3po/7sBNH22xOid8zckMjgJy+V7N4A9Ic1jlfGjVJjioT
	l+VMkiP0wauE70hG+OZKzmutHakzhl6TjZ5CVXsEVhrFHu3d1gaDpAkRGwFVKpyOdxE+3cN4OMr
	w1h40anErXtF+Ut+O8yjVrU95uiWC3S4ZWEfDge3IvW0yXH1kgcZkr44LuCw8ujPYQj9M1wFtaQ
	Gepwn6JWf+rXfFA2zVVb8+ple6UjoLVfWkIbOSEOKd4aVmMJOz0XeoqkcXvqpR0pr0dQJexvlM0
	bl0xgEVXTaBsZmvLyiXZBzH4Epr6LkcJyO13KUn59arl6tuSMc/VJB4nPzl/DCddpsYP7WIvCMA
	wZkKzAtfwovoxVWsh67tY+W9NUunVoeG3NA9G0GiWaM08Z/DOsrtawCWsXHZ68AsJa458TKRfMA
	io+W77JHV0JDsjar2s2JYolkRr3x4exiJaRPHYUEP+fBZvtBg==
X-Received: by 2002:a05:690c:998a:b0:841:dd38:a734 with SMTP id 00721157ae682-8a452878e4bmr37543737b3.0.1790181378043;
        Wed, 23 Sep 2026 09:36:18 -0700 (PDT)
Received: from kelso (99-10-92-174.lightspeed.rlghnc.sbcglobal.net. [99.10.92.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a4658c9778sm12709257b3.8.2026.09.23.09.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:36:17 -0700 (PDT)
From: Christopher Lusk <clusk@northecho.dev>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-security-module@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] landlock: clarify TTY signal scoping
Date: Wed, 23 Sep 2026 12:33:19 -0400
Message-ID: <20260923163321.79770-1-clusk@northecho.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document that a PTY master retains control over processes attached to the
terminal, and add a selftest covering this boundary alongside the direct
signal restriction.

Since v2, the documentation follows Mickaël's capability framing, the UAPI
description refers to arbitrary signal targets, and the series includes the
requested selftest.

Link: https://lore.kernel.org/r/20260916152336.1589383-1-clusk@northecho.dev

Christopher Lusk (2):
  docs: landlock: clarify TTY signal scoping
  selftests/landlock: cover TTY signal scoping

 Documentation/userspace-api/landlock.rst      |   6 +
 include/uapi/linux/landlock.h                 |   2 +-
 .../selftests/landlock/scoped_signal_test.c   | 175 ++++++++++++++++++
 3 files changed, 182 insertions(+), 1 deletion(-)

-- 
2.55.0

