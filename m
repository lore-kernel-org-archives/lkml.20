Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801841;
	b=HaBXzVnjca+pvgdrjCfNNkEeRrJqiuerSh61BRYyXXLcQMKgu9KbuPJDO5zJMGGWMEZx
	 dc48qTF8Qgy2iAWwzz/t7pgX6OU/V9cEuKHiRmIIeulYgMuRcMqbQzXT10sRdeCKZtjSe
	 vZzhgVrv1eah1PVjCy1gYwJcfUkIcz8DPTzigMBNxIW+O52Mvop8aWcqSRqRGrOBewCwc
	 nApDkKnm6dnoyENrYePLfMeqvJogFEP4saGWbXsFy/2NsTafmySInZVhpugAH5B0Ejiu7
	 MdGTYd6w+FuYIpYdSJU1b2/gDVvSAoazTJkQWaplS3YmuHjeBuRY9JsvW3BOb3Os2EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pKzlEM7eLpAeI+xeRCLoKvbM3rxDxUKIyYaryyr6NqM=;
	b=Bj1p5boqargV9vA3y/n5JmdaH6aQRc/HaA6ee64S/jHV+G52W/Bz/XdNQfvqsYFrC36Y
	 v7lCAIoi7w9emYapElAjx6AeTTGqZb8KOkvZ15ttp0W8T31Yv1MoLtWs7F8GS/ZT5Jb7w
	 WYwGi04xzbashveB/+Tb/gJaAhEy044301TXc0mZkgtRpTgNT4KUErbdUsjl1S5BJ1EWd
	 94ISjO/AzNISiY70LRKAgTOxj4Q0qdnBN2SC0FUOXfpQct40aRDMoY/DbvfoJW0HSbEhX
	 Fbrv8kABDnYAfyL5pxZjogwln9T1pIAeTEegZghYGwR/bl9tNfKFnpVk9+SCGGXmTQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b8Zh1YAi;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E608606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E608606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b8Zh1YAi
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c40f29667e6so118774966b.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793801839; x=1794406639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pKzlEM7eLpAeI+xeRCLoKvbM3rxDxUKIyYaryyr6NqM=;
        b=b8Zh1YAifXedzqflRyMS/kHfSanHWuE6dFDkuFqlC8dSa0Ny+Qhp79AT4daFd3iRja
         jGiVFF9bLEtBetMU2iJGIR3QlOrE7FdNHkXKfTdr7elyVG1QJnTEf/dGjLCKc+ckZTnD
         nALFIROWpDnAeQeJaNT/rd/FekK7XLsiG/Ii95lXXQ5nPGYz80SGjtfQU0DxjD/pe8hw
         E+WqoZThpYcjl9xXNYq9cbE2b+fJ43F5UMp1hooUQslYOB+KbPHzTVjnTnEPLX4u5h7n
         xT9rLyLpalZNZ7ut7nYMrEeSSEhhZ+aY0MryOIBrO4K8mNuxNT0BUaNgAs+8tZnrj2l1
         QtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801839; x=1794406639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKzlEM7eLpAeI+xeRCLoKvbM3rxDxUKIyYaryyr6NqM=;
        b=FUSDzDJIFOzYn37tu0FN9+VGhwCDR9kyb6Iefw9TJtaNLoVvBtDUFTVFh+IsOyKxZg
         3z6w4R+LauyT2n7gwCUgmOKcqMzP7UzQJGuDcprlx9FVHp9GVvn+T76ujG1P3xil6Vde
         5m0pM9vAjf4UKsBJC6W1nvQ5PyIu0qE66QttP7sekvWHwC1o6qfkO/UcI7g3iaTH4zdD
         8sANHavNKEr5UanTFS5VosVzTyi0WOVJdjs2Gle+TeB8RhWOCbomHXyqJql2tjrC37gu
         h2eAi5kBhHFoCR+4lfRCnyG0LfCC+o0LqCrU7I1ZP4wDHj0I9XVCIJU9KImDE7U+7jbG
         w21g==
X-Forwarded-Encrypted: i=1; AKwUvBzZZ1dvunVHMs9YGxS+kbleEuyupYi6KHkU2P6Sg6QmnmIPdF7yfm75u3UVHw7UpvAUvbDRwC8syifEdi0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jc5ofWl79NC2Oe64eyVDud9jW2fIXUAOFRFruJlDCYT00cCdT
	g8U0YQJvS0CD+OIDrEV31RU6R5gSiIS/3Al+HH1vtq6W55xrialemE88fSFog0RYqFeDEMrd
X-Gm-Gg: AYBFou0iL2aJFO7yMC/JUJQ1J6eKQSFfqAVV5VA4mTJMnhfaIkoI/pDwv2ya955V1Kx
	jPrDBQwosIE5i+xd9BqE8VhzDjOC5FdsLt+FPJi8h/je5+Yx9JAiSGgnAOTK5K3n+w9OrgTW64u
	DiC9r8dju2VVyJEB/FX2PZZzhMvAeOqxoYTT/knuprHkIbglezmT6e8rJtM5DkDpOUOaAPjOvbM
	G31PT0T0KZLwOR/A0jN+zGlzDuHfjh6ftq07rpk6sYz1lC/DNjM1pmiV2fzr7aQP3kUdyTAGk2A
	W1pqUEt7PxA6COjORqZDIm8MD66R8hdd8i/m+owxxU0KtdQbc+nAK2iV8PbaYUthW3blp+iT79c
	6MLrDGodDi2fCMxioE9KDK6cS7Ey7sF7KeGb48d+aOdNqKjgqxgWUTaV5hfk7cnQodsN93Jt4ZE
	iu/Gt0gHUBP83RQ3qNnugjrMISvSOwqd+920a1+hCLiGshYOJ+rm366qULDchNmCxXYhIvPVTdO
	o4R6Jxt+ziFw74DYKyxZZ0tThiy99qMNco1CSlMeHJfT3KyVAEmj0CFNsy8t7M1FO92vMNOWj4I
	XIQ1/zf+S/KXa5KLBkUJFscXjNeylIyItLJGhbfSUt70aKGypIfxW6DW+/OFTt4CaQMJrxnCb4G
	YUBaZjyp4wzCyy8DXMNlRBQumcExDWPnJh8AXGU62s/U/ICMKWdQqvDT1ZSos01QmMRHuhx3aBN
	K8/FN+7VS3TyIkBVvq68eAqAWU3Q6Uit1/Q//haH7Akbl32xKMgwGGJnW8xDNSEO93mLQr0tnWe
	NXMHmVwzRjRGJ7NhIWW4v0=
X-Received: by 2002:a17:907:6ea4:b0:c3e:d2c7:c530 with SMTP id a640c23a62f3a-c4ca7a072d1mr1375241766b.12.1793801839040;
        Wed, 04 Nov 2026 06:17:19 -0800 (PST)
Received: from Ubuntu.tail0f733b.ts.net (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e43e2eesm77311566b.31.2026.11.04.06.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:17:18 -0800 (PST)
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Vedang Patel <vedang.patel@intel.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/3] net/sched: taprio: fix RCU stall from replayed schedule entries
Date: Wed,  4 Nov 2026 15:17:10 +0100
Message-ID: <20261104141713.355958-1-krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported an RCU stall with a software taprio schedule made of a
single 127 ns entry. When advance_sched() falls behind, it replays every
missed entry inside the timer interrupt and the backlog only grows.
Patch 3 makes it continue from the entry in progress instead.

Patch 2 fixes a pre-existing wrap of the cycle-time-extension sum in the
software and txtime-assist paths. Patch 3 relies on it. Patch 1 prevents
a saturated extension from handing over to an admin schedule whose
software timestamps cannot be represented.

AI coding assistants helped with analysis, patch drafting and review.
The submitter reviewed the complete series and is responsible for it.

v3:
 - patch 2: split the cycle-time-extension overflow handling from patch 3
   as suggested by Vinicius, and use the same saturating helper in
   get_interval_end_time()
 - patch 3: return the cycle end from taprio_entry_at() and update
   cycle_end_time in advance_sched() (Vinicius)
 - patch 1: reword the range-check comment to describe only software
   timer timestamps (Vinicius)
 - all patches: add Acked-by from Vinicius, drop the obsolete
   Assisted-by trailers, and rebase onto current net/main
v2: https://lore.kernel.org/all/20261009123309.284193-1-krystianmkaniewski@gmail.com/
v1: https://lore.kernel.org/all/20261006113335.241564-1-krystianmkaniewski@gmail.com/

Krystian Kaniewski (3):
  net/sched: taprio: reject software schedules that overflow their
    timestamps
  net/sched: taprio: prevent cycle time extension overflow
  net/sched: taprio: do not replay missed entries in advance_sched()

 net/sched/sch_taprio.c | 191 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 168 insertions(+), 23 deletions(-)


base-commit: 241dec6f9ab74d8c3ef246764f3611666b96b9e1
-- 
2.53.0

