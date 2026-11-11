Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794440635;
	b=ZoB9/46rRe2sVklSXkFC0xBTzoDTn/KQEI0G0Nz1G4eRq0Szm1FScbcnluAdzi/pvjOM
	 OI+em+sXXX01V4dVohMtaid2w03483ioz2Xwg2alujSL8yKkJ0Ct0GOeGWOl/C0Z+JM4I
	 KOZLsObqMXzRANguQboLKWNNJ9bmZZbqcCHtXDCD3Sal4CN6sX89BsaxUzY0gOt2Cvzvp
	 x3ggKneGj5AYOfCANRPBB22YY4+DFCiP9ArJR6OCo5pPCiRWnb39opO8ih45wZ0tEhowP
	 q40tb0M+Z88PyoVcODaZDwh2+WlLQl8DS4VY6NDSI8FKPHy69xaDF3781y6qP/QEFtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794440635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZJa3+c7lvB0GyH/4c7Bbh01U8Ethr6bq+o6IlSmjCFg=;
	b=BQmrSq81K7sKOOH2+pTZosR5YncjxxSVLT6t2yA+ANVsbPl+ViASlPxGtplIGWTUlFp6
	 EEs/aCwNIIpk9mZECtSk9R+YaxxS/hpzcySAalnoJcILtTJoQPIzBvr+XqwyJcRadyo2g
	 T8b7unwfe9R4TUKfReF8WY2mw9vc1T33pr6bbt7PF3k71sZDqkxTHGfODxEPanHnHkBH6
	 tyBbDjhTmirnV+pdouVugKZhpa9il/oBNlbF/snEIfd94uVopzc+ozjxjIlgAC96imboV
	 /pPsr1NR8Wz195oDOGzaBSfhkySetepvnD+Dw+QLCNlv8gBvy3CwZOBigD3Hf+Re13Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E3sFb9vy;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1000606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1000606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E3sFb9vy
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso1605600b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794440634; x=1795045434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZJa3+c7lvB0GyH/4c7Bbh01U8Ethr6bq+o6IlSmjCFg=;
        b=E3sFb9vywxekelTd16YxQPmFZDdFroKdTTK+rDlu4uqyhGfWrWUxM4Z4M8ejkvNYsK
         xht/H5ZY3RuQnWZqcz7xcRuueM9gt0eWLQoKNThblfCQ83rZi3+6I09YTDcvqsztxh2A
         PcVrizo4pAhRkPEoZpgW2GqxGPDbFBN2nqGIMHm3jBdR1etxiQ50/qMvGoABPMapBAP0
         ei1Vj40m7S+M4HKA3d1hDf81EWFVwRUZUpUX7FyhOFnKK6v8mib0QFDpLXLZ1ukOsfVP
         V31F2yBT6aVWRwMhKZZ2b/fyKYSyxNsGgb/nuJiURTJ6rErXSu2CEofbF9UFeua+Qwu4
         68DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794440634; x=1795045434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZJa3+c7lvB0GyH/4c7Bbh01U8Ethr6bq+o6IlSmjCFg=;
        b=a95EBPmxu8HfAMMau7f2hLd8MMeOtNp7X20adMa+4iMV38y3G7LzXFx4/9G/ZXO0vx
         jJNdOfiZTg/EDhp5W+StoAO9GVAAqW7oWNXBZPDkICd6gpfe+Rpno3YHJw0NjUdQksi9
         hq8CsXyw6kzwdk6B9Q+hS/R57sPvjRIEUFkPBrwsjq6Q09qk8TlClsVDE1q6kf8Q7QID
         KzddL0NC4BRvFugKMkC/RXGUHRqOpow1HfWl3+STAFParJsLl7Pux+PQGsYD1uEiz3Tw
         zWXOiifUFUoVdb7I6sYEQyH58uWfgNMrxcI7WRcf3RRyoWwT0xpCHyqJmG89H7UtvWno
         3ZJg==
X-Forwarded-Encrypted: i=1; AL+hErF7xVOkd+qNPjAZ31/GKVX8sEvE5L+MZRiI5N66ZTexIANlkbKPAz522mEEqmDyYqkthjTo+irszzFUgEw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bERtbc7rCFqmMGVjMs3HyIlQ0EHb8WIik9X5G742ym//vZQTD
	8a0vtpr9m/+IYvOMrr4rakT3e+DY/0bU+92XIFybERmHUiCJQEuSeKXY
X-Gm-Gg: AYBFou0K7u/OldKjuJBppMUJHVv4edWZSQLpI7E4MLwQLhK1cFTT7kpMJQjPVhbZPAb
	BrtN8El02hLEolG22IrUC104TJIFvmWiQTAs5xx0hLEqk6XncLG5VH7CfMX0viofg+GZ8P+feLR
	nW5P//LacyECPUuXaj8BffPGcF7UXcBdmQvl7ucWBi9jKL5Bqdn4kl2718gdEyJjLLZWSVC3Kp+
	XT/LgvwDkdJp/4v7RSnY2kMH5zl5jcstz80NVAVtqyaW1aaDCkxetFxQ7mVQLFDshLCtdbGICIM
	uvVPuXu+/RmMO5xNG3bzAjfxJTO9kvBzoQG7BAdV0uWaOr82lDh+/yzMF/zoUSw80j7hg3VuaAu
	pYYkiSUmVzPtAiIpNmBvnIdI3sa0ynnJdkcCOo0hYhL8fD1Z6QsD/JWmc2e6Vvy21vp2E1/VfP2
	n3za/XZOVJQFRyjQC8VUxi04MINGdDHfi3PDZ40dydyMcEflM7gJqndhI0NG0JoxAi50Iyc+R82
	Wxm1JZ4jjjiDgLK4bqYf6YwFNiSqfPozGoT8cMm0waeV95HYnje1cWgjF3lMEJ9G5l2kp9+nxrV
	E6Ba6lEOx6mmT2mPKImZRWiNkEo/wEaiLmIwWbB8V1tzhi9ScelSLA==
X-Received: by 2002:a17:90a:d643:b0:3ad:43c1:7d41 with SMTP id 98e67ed59e1d1-3b182fbe2e4mr3515536a91.33.1794440634111;
        Wed, 11 Nov 2026 15:43:54 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c74bf3sm1328794a91.10.2026.11.11.15.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:43:53 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 0/3] net: dsa: motorcomm: FDB fixup
Date: Thu, 12 Nov 2026 07:41:03 +0800
Message-ID: <20261111234110.1449602-1-mmyangfl@gmail.com>
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

Various FDB defects. Assisted and verified on the hardware by LLM.

There are more gotcha about multi-bridge setup, but I'd leave that for
net-next since multi-bridge has always been tricky among DSA drivers.

David Yang (3):
  net: dsa: motorcomm: Do not inherit ports from dynamic FDB entries
  net: dsa: motorcomm: Rewrite FDB entry on port migration
  net: dsa: motorcomm: Use VID 0 as the unaware PVID

 drivers/net/dsa/motorcomm/chip.c | 111 +++++++++++++++----------------
 1 file changed, 52 insertions(+), 59 deletions(-)

-- 
2.53.0

