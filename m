Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109F94DBD62
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791549209; cv=none; b=ma5H1RJuEaULmLBcWY3+UMkFwCOA0ZE0OcS4qmsYKWMhlhmbgnTjcGbh73wriTnv/U6TUQDSlPUPXOMnKMq4pAumEckBakjhvgyjKhAQoammsznRYw8mf2cGNp2XBlYh1Tt8C75AE8x3QxbxtKmzAwswXuQu+X54HKHSRdXuAY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791549209; c=relaxed/simple;
	bh=jbamgwQfLb+hH9hvkawjSzHeaoByt48REmiE5+CdFxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BGd8IDWWpLJ4SmZkbhhr7SAFsdPR54jc4tQAvUTswvz7hDnHzDH9mf8bm/tSXUhAAQIc0ndfEIiwQs+byEUw21oDRD4gJV1X0qAoqc+uYgiH/fApD+FMd54OJXwA0iaIz+CVRH0J59cYkm1Htbr+hWVCfJ042WYthm31mL1Afew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUNi72O1; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUNi72O1"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-487048857f6so3630651f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 05:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791549194; x=1792153994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SErRyHSFpCUt5Avm8F9PG91ICpNkYudvdNEVEjAozzI=;
        b=KUNi72O1uN4teyOpBOELyWyV7WGJ3oMXZIw3b+An55hAVy8ytl6lMYk5ry1l5GFbCg
         3ASTb9S2xVQZrcsi/99rDrVZGcGAoTCe+8gxL1lIQEuP+s6VTHzApTxAAX92TUi9wg5B
         qWI5hxWIGeELEBKJEn6KRA6e1HtuqH/kmsfhu+UkGcKmaAOZOzoiJOjcSalX+7SoHhaM
         DhAmnCVsrv3fENXrQo/mAGC2mp/1zidQPjxKtcWd23nADW9fW+VRKd2s0n+chB+mkf3a
         Z4BePbrP/FdDWY0JynSTgS8rAjio6ihyYoDVCvrooeaaEFjZ5aIHJb7deCGcoVhvAdRN
         twpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791549194; x=1792153994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SErRyHSFpCUt5Avm8F9PG91ICpNkYudvdNEVEjAozzI=;
        b=QtXq+R+q1Guc437U0xLe0CSsf+QmrZCb6MB+BMTIHaG9pkTiTyEReBLQQitcjHYPWk
         uSJwXm4o+8jtDL0XS2OEkkFTjvTBxVsFLVUwUi7aZeaZZZeyIKGD74BIUwtwLS3MD2xC
         pLs1wZNPILH/MnK8sorLCTKFxc01nRJQVBHZ5ZSt2u9ZFJGr7zWIkIX3EDeHws1RYYwj
         9Xx3NL5lA72UQXwi6a/u3gKtZpaj/BZEzKUGcYBDvc3OWGnqQv8ityPx4/3BHb0hgOWC
         ubSyI58s5ujSQu0DFDM2rzLWlZ29zZ+gBtHynIvlZPe3lmJfgshOTXC49ACDYWwZDeKZ
         kk9w==
X-Forwarded-Encrypted: i=1; AKwUvBwt0HdJLLxAqPEpn9FQsQqkBCO93TjT5tvfkeMIjAhxCeLbRnvQuaiUi0zZY8Zs+W1nTj7jjoycFlKAi0g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfh+DpR7+2PTaP0WWbnsksWjQDuwMp4g5ZLLYtK2+0jVGztpa4
	QaUFb5HiGGAeFpvvcYFlnnpaplLMT2OjkXyspHUukO0Qi4yPlkOmBAO7
X-Gm-Gg: AYBFou30gO+qjoS+1c1uDIRqMOQNYZbuB5Xwyc3teOxrVeIYtw1a4zaEDgZ6B0TAaTH
	EmwHeJHXNx5LbFGsLeFSeUb1cGkxflj79XMX4RduL1bh4SsXY0+HXsy+x4fMJRQs5jfoaQyUodl
	0vG2Nmdpectu8VDbfxMoUdRPAbK/nwszPBaKYssZa2HY6Q5hM/QIHktrSSuLNVlrS/3qwOFGsYy
	B8N/SWgrIJ1BYSPW1RznIAZwfMlfd8eq2B9kftpE3U00ItDocyyxl2e/V8N8n26b4dH/oj6Ofkg
	qghe294qSnb20tJZR7G2gKDNThn5y0NIPXl6duZZTdfHO8RZWiOfkvoxWeWTX0RhlxQvKxATpMa
	i0AVQgxct0hE3a+koDLkFFv12KE5CKgekVuHs+JIlIfXnwRKlPd3PTFoXLsCzvGrwyfxs0MPcQC
	T0WR5BElYruVft2i+DKz88Daf5POhSKwmLlzAqdzuuppNXBEyUtMtIiwUgRaVG8R4HiqScXvZna
	Xe/ahG31wY9vtQ32D7rN1CM1IfRD2UE3LYXVfcuafZwa8f/BndzkjC4xBFt1WKM5MQPXxwQGfMw
	cKDUZJwV0Y1hFhHOsw0ukVVV1Juojdpj3CsHR5A008GLeyjjLntbSHqvFG65Ap0GNJ4QpBNW7y6
	InMDuOssNVKHIWja9tf4=
X-Received: by 2002:a05:6000:2907:b0:48d:c18b:d644 with SMTP id ffacd0b85a97d-48dc18bd66dmr152416f8f.26.1791549193843;
        Fri, 09 Oct 2026 05:33:13 -0700 (PDT)
Received: from Ubuntu (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acee65sm3650230f8f.49.2026.10.09.05.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:33:13 -0700 (PDT)
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/2] net/sched: taprio: fix RCU stall from replayed schedule entries
Date: Fri,  9 Oct 2026 14:33:07 +0200
Message-ID: <20261009123309.284193-1-krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported an RCU stall with a software taprio schedule made of a
single 127 ns entry. When advance_sched() falls behind, it replays every
missed entry inside the timer interrupt and the backlog only grows.
Patch 2 makes it continue from the entry in progress instead.

Patch 2 then checks for an admin schedule handover once after catching
up. That requires the cycle_time_extension comparison to be monotonic,
so the sum now saturates instead of wrapping. As a result a large
extension can hand over to an admin schedule whose start time leaves no
room for the timestamps derived from it. Initializing such a schedule
already overflows today, and a carefully chosen extension can already
reach it. Patch 1 rejects these schedules at configuration time and
comes first, so the series never hands over to one.

v2:
 - patch 2: do not use the list iterator after the loop in
   taprio_entry_at(). The helper returns the entry through a separate
   pointer that is set inside the loop (Jakub)
 - patch 2: wrap the lines longer than 80 columns
 - patch 1: no change
v1: https://lore.kernel.org/all/20261006113335.241564-1-krystianmkaniewski@gmail.com/

Krystian Kaniewski (2):
  net/sched: taprio: reject software schedules that overflow their
    timestamps
  net/sched: taprio: do not replay missed entries in advance_sched()

 net/sched/sch_taprio.c | 179 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 157 insertions(+), 22 deletions(-)


base-commit: af39eb111ce6b5eba9c08513b62c4868eb7e7fd5
-- 
2.53.0

