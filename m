Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0C04EA371
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556786; cv=none; b=gaIBiZDuNQXhfkX0orLQzHGdFFussGlVbqBGttBqTO3p2xHGt7QJdyqWJIg9/tjqoqg8dUZfFFkJZJeQGXBEWGlINTDqUmquLOaCxTohtOHV8eAOwvVrmmUd1S6xvcfy66lm3nDxAt7f4FCDNLX92QRX7THxWYGdmAbewZpjOv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556786; c=relaxed/simple;
	bh=KvGxbBIIZYJxbA/goM5wib5m0sHgZa7QQZXkuKeLEYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LweXhZQXF2vu/CSISq3sYc2SOkZIx3dWbK8WWLu8ySyGjWMug1EKPxiez1tm7tnZIRu3xMweIiq/6OIi+nRgOsdm9VCYfP4uEJHTXSy2AwLazRweVnEXVaHENi9pvrq8bXUpaaHlF6M7OMX+qH1TtfIG3jz2y7WRQyY+MyBgIlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZJWZyHA; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZJWZyHA"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7c6dbc60so300165e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789556767; x=1790161567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2mTRCT19PSs98SBRuFAUCXLrvDpRI5nVmcGar4PNf4=;
        b=eZJWZyHAqYXeVTNchjC9I9QwFJoLYPtSyZtlG6pGc3rWiipTdZHhkzH2ccNwbFFbJY
         AfOThFsFxM9iqFAUNFjo+a6/Nkx4tvgr4m6GIC8nLIXkz7wYs+H/yCRzxXk4IKw0F5HP
         RHKFY9R+VKZbqqncFb7w0E4P92Us+U6JTK3uydVF8IWCdboZDKoh2/uYjgehalpAffZ5
         vvJXlRkR4BtSB1OHdHzhn7BVOFkqUeMUZ553vbYI7XGEEkv5U7kH5mTwllavBWrVlr8g
         q7IgUmRFCDe5CbAGO57T/gxfS8t+IoFAG65ETzLvZp7tCU+YABc6QiI7OqXmPlQRJoFJ
         2EhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789556767; x=1790161567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z2mTRCT19PSs98SBRuFAUCXLrvDpRI5nVmcGar4PNf4=;
        b=E8lywNiH+vm0hKfjhfUyBpQXlVglsEwacLrYXxmQPt77/rBztDwYLQ9ihic4KI0jX+
         RHbC92WGHedgK8ngsKkuFemTVlwts0fwTCWyRp9YlH9ksj9a/5Nn4ptes65VS63e2gkH
         q8Icwcon1iGtDo1iGz6o/qb8gFZB44oo+oXCCyfzhAtal5TKf8Mh4CFqASAiJcvxquN8
         CYbf21cefUSm+jeZOuj/tMdw/63sGel2Orh76wW+OMm85WnqMsgHwfAIOz8G7qXcM1Hu
         RHDm5Oipboy/CWCTwTO0jwNNtNjRjqdsMwpBLbJXODHzbANFXOwNAf5v5yoa6cuiaXfl
         j6BA==
X-Forwarded-Encrypted: i=1; AKwUvBzgqzv9Il1Dp24HbQqOGiPNteqq4j/DDraY1LfFLAQI3VWALvQ9O/YrKoFJi4BhO3O7W5+X+0IlBDFlWSw=@vger.kernel.org
X-Gm-Message-State: AFuF++nhZeT05yFZFjqtVZ6shVIScOSt0OqqR+7V/lxxWUP63LoJm56E
	OeKlu/1z0ZKxZSZXUfSYKwr8KpxXIQB7UprbGyuj4+7oWWFBii7tF3gL
X-Gm-Gg: AYBFou3F8NQGk6720Gr1uws4A1AM6uUbWrjyTTx7SkeytGKbY0Innn9BV29CAI+L4do
	YndJzHHt+o/xXMNbLCo4PMZXlaXerX/U1f+KGDCGBGkTN5S71XxeXz1Txu+i4uXVbqNvcjADnkO
	3Y0hM2qDokMgx22Y3S9ZYXE3IOmFHK+lOOetmKRQSd0xGR5gYcuAYMvNrLRSBb13uDajlLrdq30
	RyRCU2qb2hBKum1aLZXKqKqzusryh4jc5ya6CLajX5hy1MwncrR20gH0KBqS2D5y5Aw48OYqGMH
	KqTOMlaZRsBjhjxSq1ruzQ6flcbBOM1PfQ5rjAs/gepFRr3aSVJ0E0rOblOAFwk8aC8vQbELZ4F
	SDMEUK/CmTLGGcuVmGvuDH0+kNqVOqyAxs+pVyNBf6BPJ0uJ7qEvVSo9z0eFsosaNswOcjQEtPM
	M5FndTIcxZnpToUcG9H/7F8cjwaQtFFi1aa5gN37o4wMwDRlv1AI7HT0SiuxFOkf5ByqO2R9ue3
	kHCRBToyZbWpfHEsSyaZpM=
X-Received: by 2002:a05:600c:6995:b0:49c:ff81:e062 with SMTP id 5b1f17b1804b1-49eb7328137mr21808175e9.2.1789556767374;
        Wed, 16 Sep 2026 04:06:07 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d9057dsm79447295e9.3.2026.09.16.04.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 04:06:06 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: christian.loehle@arm.com
Cc: beata.michalska@arm.com,
	cl@gentwo.org,
	daniel.lezcano@kernel.org,
	dietmar.eggemann@arm.com,
	elif.topuz@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	rafael@kernel.org,
	rostedt@goodmis.org,
	sh@gentwo.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH 2/2] sched/fair: Randomize equally shallow slow-path candidates
Date: Wed, 16 Sep 2026 14:06:03 +0300
Message-ID: <20260916110603.24230-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916100116.701206-3-christian.loehle@arm.com>
References: <20260916100116.701206-3-christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Christian :>

> Picking the first eligible idle CPU leaves a scan-order bias. Concurrent
> slow-path selectors can choose the same CPU before either task is enqueued.

> Use reservoir sampling in the tie branch, resetting the candidate count
> when a lower advertised exit latency is found. Use the per-CPU scheduler
> PRNG and reciprocal_scale() to avoid variable division or a second scan.

> This reduces deterministic convergence without reserving the chosen CPU.

OK. 

But, your test platform was 160 Cores too. I don't think randomization has the same effect on lower
CPU systems.

Let's create a scenario:

On a 80 Core System, that %50 of it's CPU's are idle the randomization's chance of choosing the same CPU
is low. Since there are 40 CPU's to choose from.

But on a 8 Core System in the same idle conditions, randomization's chance of choosing the same CPU
is really higher. Since there are only 4 CPU's to choose from.

I think this solution works better on higher CPU counted systems. 

And I don't think it fully removes the issue. Just better than the original tho.
Thinks can still go bad on this one too, just harder.

Maybe we could add a fallback. Because the real concern is the selected CPU's state
changes when we come to enqueue. If possible tho, I did not really test anything.

Thanks,
Kayra :>>>
