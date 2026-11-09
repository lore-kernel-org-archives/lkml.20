Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220511;
	b=uprtme0vGiCJNcydKl2O/EAbt9CoNqDNuKSmd03+HdQgno5j7PPH+lecBDRPJXJ5A9OZ
	 js3wc2OwLoVyYqW8kPlqvoAVwh5nbRCwexXMwbjRry37JyIjV8SFE8vKKpSvNyn8pzxM6
	 esuyN3DPYISgluoZ11GHgBWZ2T74eprD8TRU3fp3AEMjbvpeGTGC3I0x3eWJfxAmG3O4c
	 hZsdDaN1eXLT3vTWAOw0x/AgYYFFm2BobZBsO7WjKSf1ea56T16F6TvT2HejNgf7M2+ut
	 75BgLCDIlja7bUIrq9+3CrgQT/Bso/Px519FcdX026e0mL9BeslqJ/0eyW9kpDndXCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8Hb0sYmcLHQnhtWzS9j1woOF2kw5P/sRWChZAP1XD0M=;
	b=rg10XMt2A8M/HE6DlQCYZ85GM5rj7sN0IbSeftOLBGlLOB6W3eTE8s+di2XiLPF06lvw
	 7S5f87t4YLdoysymb5t2Z2Q4deV7TE7HKKYtd/1/tg0OgLyB31ghW10vsRlORQV9IxoZ9
	 +ZOpHFKanghX5e0V/3UT3T7FotYF0I/xJAjslQKgbdQbtboNqpkAOebfKghuwGJqfazgI
	 z/+L4uODCcLbhm3+GgSGGKE/oJAdlHfMaHho3MgSQCiLuuJt1v0LYalezmbXESFy2FHDy
	 aJ2q4cnkJ+OEcGiG89mB203j0wumIu0g9lasHSe8QgGIZyvwUAYmbZQZrVGV8wtyi+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="g49MWb5/";
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A74606A33C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3A74606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g49MWb5/
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b147e06befso241635a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794220510; x=1794825310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Hb0sYmcLHQnhtWzS9j1woOF2kw5P/sRWChZAP1XD0M=;
        b=g49MWb5/yifGNXK9v3uJRzMXvdGfHYwVnDsvkvqEbUJ6QN0jlYqr1ebA6azfClAOT/
         RK/UbwGDRf1IqGGk6TL2Kwi5PkpKUg9C6hmiS1LVRsH41VSiAS/nlk7H4cp+5AJtbbC8
         GSnqjaXUhNuWEVSqFtLKFOu6cE/WcQjuIWQRH2P92DD+wRfV4wAR2aVxlEVHt2SgG/pJ
         srvU7WjvoR/jsUrFzj+vQ8Yl48XoC7MhyKTF1Rap8WKCzascASo+RhvYPclJepG/G00W
         7VgpYVYilAtvFTbNuW/FfaxsImmKv8evAU/LZm2cwA0Xxmi5Lv4IJeerouQbo+5r+rWa
         gWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794220510; x=1794825310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Hb0sYmcLHQnhtWzS9j1woOF2kw5P/sRWChZAP1XD0M=;
        b=fT9vyF7hgsBWqIi0/lv6j20IFSayQJQbxnbUMFoSvjgdm0/fmZYD02WqMtW41iMWJL
         uBX7aVtyDNbjyHtuqaE0/2L5TS+IhA1yxUFN2qyIvF0HHc7AmifKAdv37TUCAHCGP7J3
         jJMTewgkRcKBxtG7vB7/qbGTXK82MqzSn0QFrvAmqN567/sdUOarrMuMIRqmIcOrD14y
         SDpSTnGHBoTxIXCPUlXvkcJzton9hCIxyCYn+m3YJRYQ+LgbDOVyjfYp3GyuZfxNsKxz
         SQ4gMIisDYdlKSJNyUr0+X5gCD37dUdG0lpYmFy1vpriQOKRAZ0SbiEFiF21Oc786hwF
         B2Lw==
X-Gm-Message-State: APuU4Z/ZrKCWBRnnwsrwhXDt8syFMoKT49R+XOrmFy8U1IFtNkaNS3O0
	mRYPh0uSgi9p2P3BFSh1wWbIBorV/6QOiDV9sDQQKUJXdUb0eQr30LV+
X-Gm-Gg: AYBFou3mYyRLyu5cUwP2UqNUwXDH+1tsiopUy/yMOMNWHHRebDvAxgNr6m0s2pwRImu
	kaoooz45GU0X+uJQ8CPBAsezZJ5Yi7eCh4ExRF1LbOT04ePWHorySt/u7y0LnlyGH0+a4FcWt+w
	0q4BegS5/Gp0xfB3ePLojz3uZDkz69SFfpRsmOefHKdYLXYMerf3xHTlt0/tF+rPrcp5Kyukv/9
	f2mt6RyKdAKuzt04oi8kzifGTbfhZUrLvIfKQ5KFPOxyBgoQ68GOhWKLbFN0B0UWLQwbozhZokV
	nTb4QelITcVV5rTUUaboDIaEiMRYpKKX17bDrnw7scqfPTHcRdp8obkzkkT6KCOfBInn36rl8d5
	vVqC/RFhyh5/yVG1y9UD6J68nCqSF+YCjlP8LWiN75gNsrsmBvPK/GoyklTJSr3EwJvINVdO6uF
	wDZwpdbeFKr4PG/DHOhLioIDHc5/mozCT1GdncLcSo2XxDNgv+m2QcO9Ie5avt7mGqV4eU0krlK
	V7BCUwNonUhAzmdBQe0yJY+fYYHCo5XgY+Xm0M6kLBkb22CXbyrt6+prAPAn5hDdiD1Pk5y3gFF
	EqfbFjxkMXNqEpwEqGC1fedU/R+5GPyE14FwHqMLrXes8DmSlQxUCH1DuFGcazoWqlxRm93jSNb
	Y
X-Received: by 2002:a17:90b:530c:b0:3a5:c08:4c41 with SMTP id 98e67ed59e1d1-3b12d49b258mr2971323a91.50.1794220509924;
        Mon, 09 Nov 2026 02:35:09 -0800 (PST)
Received: from LDYT9Q2G2M ([2a09:bac1:7680:450::1c:35f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1058d3310sm10379457a91.15.2026.11.09.02.35.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 02:35:09 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Finke Lennart <lfinke@student.ethz.ch>,
	netfilter-devel@vger.kernel.org,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 0/2] lib/ts_fsm: preserve patterns across tc dump and restore
Date: Mon,  9 Nov 2026 18:34:54 +0800
Message-ID: <20261109103454.50617-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261101081736.51803-1-zhiqizhangg@gmail.com>
References: <20261101081736.51803-1-zhiqizhangg@gmail.com>
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

Hi Andrew and all,

A gentle ping on this series, sent on November 1:

https://lore.kernel.org/all/20261101081736.51803-1-zhiqizhangg@gmail.com/

v2 describes the tc dump/restore impact, adds the exported-pattern
equality assertion, and splits the fix from the KUnit tests, with
Cc: stable on the fix.

Could you please advise whether this series should go through Andrew's
tree, or whether another tree should handle it?

The netdev CI also flagged the new lib/tests/textsearch_fsm_kunit.c file
as lacking specific MAINTAINERS coverage. How should that file be
covered, in light of the dedicated textsearch entry discussed in the
v1 review? I would appreciate guidance on the intended maintainer and
coverage before preparing an update.

Please let me know if any further changes are needed.

Thanks,
Zhiqi
