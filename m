Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793141735;
	b=RURY6GPGqYIRIybXeXYoKb0pU78LuabYc5M7IvRr6qYRZ0JIeMy8zgt4XcYFW4DHlfkC
	 9QoTmNiNOdlYLO3ZvflwYof+IxhLPlX8zZRZSTx8TIqjiNNjop4l/YAG9YnNy6eK3MtHB
	 AEBkrPsPUK3uXyKjA7rAduWKG9PHQsl7CWDfSPl6sqQqqdDi2/t9y0nExFZup9nlGZVkV
	 Zp7kE3IwfiajNw7wDYbdOtbngGiMD5trkgSEySHtAC0W5L8acfBeeYdtzEezToB2KU0yC
	 jElbWwZ6ahe0MppXAHm2kKkzUGyb4cXebwojr+OdVj3Djip+ttuIisqc8sVZY/2IeQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793141735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Dg6DKeJe8T1TjUEB8BdApW20xD5v+RzBX9HRp4VliEA=;
	b=W5gWzDw1g1Duqbx1nFjhF58Jop0WrhAdPi6rszQ+lx67sDy9PSEzvQ4vDsqaV7M3qjBa
	 D6WFZKYXWc4aTN3fDwcjX2ipq0TlkUlKg9KUNLzeAlLGznCr8F9x+lezoNca6xf0PTdu7
	 z9LFEDM7WMZFoSqiiuT9hhjUvtSu360wAMzCQv7pPCVuDMjKPg9HL78t8/JCNXsdZvi/B
	 y/cjY6zMoF10d+xrryFm+GB0drXckiMlSmUoiPaawNQeNi6q0erYiIVcBAIPeSHwOoYYl
	 J/6jI+TlDr8PsEjjpgrTkzbmAuSoTX6uuubviFbeS7nw1MH+QSh5UTzWBXHptQmGKjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YnIXlso+;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323CE606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 323CE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YnIXlso+
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-18cdcfc05ffso503290c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793141734; x=1793746534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dg6DKeJe8T1TjUEB8BdApW20xD5v+RzBX9HRp4VliEA=;
        b=YnIXlso+peWB8/TKXFPvO15tF/TiuesRU8A22mId6cZfm7JN585K5uoSZT9TUrBxp3
         n9+AHzv4sTZrSqA6rYQp6iOFjpZv7+2grSC6alAT9mt+aeRJAGtN0qMC++xaMTbQVZ77
         YbaaAuC0EBD5fmxWRZLbmj6rmA841pbBPdaILozrdmr1cikiCAdx7tgrVFcR8E62B/A/
         qALu3V8koPgvSORaZXXbYKgOeSTiVH4xzG2+/e05vpD1q721En82IQYwatLJZ7clx7P7
         0iJ5KgRweEbvr6A6MCuBeqdrNe13QIBNW4IEE60iUMiWv4OPWSYx4GKaWtusH5QXQP4p
         MTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793141734; x=1793746534;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dg6DKeJe8T1TjUEB8BdApW20xD5v+RzBX9HRp4VliEA=;
        b=06kaeS36blC6RzS6s6aWhexfwCY8Fgtw6YAAjzaj2EtXyq5fIONQj0psrYmQGzazS5
         sr3Y0W9SaTd8ybjnbZF9JAuhYLiqMZZCmT/d26YRfV0uIuZAPR+lsYZRiIMEB46Qctz4
         oaV1qabmi0TPtMxPF7Ae8Hrway0asmOlugSqJ72tHp3VUaYgpfB5jU0iWGNiXS7fZmC4
         P5npyZgeLNag3uYLqFLhH39cNBJkHD6nvJl7tGOxCPRY1K6FwqnoXTR2gnVq7iA0+bLq
         rKiRcfFbYZsREz3RX0KhD+XjwHyCKcTrV6qhx5u9iPYVwaaWqW0d1I1DJLLwXk3ZoPxQ
         wF3w==
X-Gm-Message-State: AFq9FYLf0tYfD73sb7uoWCI9e8dbYKGGWiPAO7ymPfCJ0OwfH5lGD3oT
	7Pdk2S5upCMziTR6h6QL1iI7uR+mkKgqoXzGnH2+tRG47HkRliKkO2jU
X-Gm-Gg: AYBFou1jKjElZFo54v7digBZ4aDRUQ8ixefVbvUqffGY2Cw+OKIW+QOoiOzWEtgtsnL
	FUgMTRXuf1nut3QkJUZI4op3UhMbz4QOE+28ztQdaUb2uk5DmvEgE/0P4rrld94D3BFht3b8YT3
	dWb8z2Zl9ZeX5N46i+2J6+C2IQBJWDQfImGDuwuf/ObraWG9Yh/a/5kXFS7Cu91QlLkk8yLcRLD
	1fC/Q19xo50kfy8QjELxweS5rGrFlizwyklG3W5HRho8jNvnIoMxE7SJUpmBgecc6V5KXMgD9mT
	gF9BFjsg+7LibGf5XoUACbsLQaOeEIHVztMrl62CIlbDnL49kaGKxE/pigajrTj6YzM81hIitvb
	K57LvihxcQU3VA8F35/Ijyu6Iu/r1k7WChkANh/lOG5CTr+k8zjyWkOQ+2SflXjBDLcnR4Aa/6t
	lAesr2wKpwivrSJFNSwPgs6jjkizOhNqH12T4JiRkVkVv/nSL5lOY7hKEE6tYRLZbjfq0NpI0HJ
	Gxe8oSX/zwrVIe7SAvnbBVFuq61uAUj0bBFYELrArXN00oddacm/Ovrn4AJr4iO151Ig2CSHElR
	8q5u/WDjvBGty1qJ/nMUe+0IIBkcOb5GZ5uW4BRFr+qtxiOtA7P9YPvF038pxgx7ew==
X-Received: by 2002:a05:701b:290e:b0:169:9f67:a91b with SMTP id a92af1059eb24-1a6cbf7506dmr703505c88.12.1793141733940;
        Tue, 27 Oct 2026 15:55:33 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net ([2601:647:4d7e:c9e0:ca98:dcb5:85a9:f03f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6da44c132sm1243138c88.18.2026.10.27.15.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:55:33 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 0/3] xtensa updates for v7.4
Date: Tue, 27 Oct 2026 15:53:02 -0700
Message-ID: <20261027225317.1561318-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

please pull the following updates for the Xtensa architecture.

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20261027

for you to fetch changes up to 28722ed2527aa63ac1454013defe718c56032886:

  xtensa: time: Fix clk reference leak in calibrate_ccount() (2026-09-10 03:40:17 -0700)

----------------------------------------------------------------
Xtensa updates for v7.4

- fix clk reference leak in calibrate_ccount
- small fixes in comments

----------------------------------------------------------------
Hemanth Selam (1):
      xtensa: fix typos in comments

Randy Dunlap (1):
      xtensa: atomics: drop kernel-doc comments

赵宇 (1):
      xtensa: time: Fix clk reference leak in calibrate_ccount()

 arch/xtensa/include/asm/atomic.h    | 13 -------------
 arch/xtensa/include/uapi/asm/mman.h |  2 +-
 arch/xtensa/kernel/entry.S          |  2 +-
 arch/xtensa/kernel/time.c           |  1 +
 arch/xtensa/kernel/vectors.S        |  2 +-
 arch/xtensa/mm/init.c               |  2 +-
 6 files changed, 5 insertions(+), 17 deletions(-)

-- 
Thanks.
-- Max
