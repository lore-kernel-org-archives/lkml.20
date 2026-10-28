Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183677;
	b=HG2mgW0towM2zJDr3oPaUGBSECEs5jgWLwUkvbBbr6TmNIZiE1KrjniCDkh6+YMQ8o3y
	 ckFOeA2O5QRCKT2/E3QjXeRmT87MSD9wItEj0WjbYJtTWfiSR3woiwEJ0PcCRKbM8FvER
	 8bXZtVFyKKC9MAumpJ+y/EY00DujjAbVIHZS97hOtGXgrFlnuOfxGCI9UcNlas7+mzH6c
	 8fPpC/y5X63pe6UHh++/mrpoxwBGy91VG8oeCfg9l8NH61h9/vKTspeKQWzkXFtIwenYs
	 nv1SjW0f+zun+i6IhhAbdpG6c1zyDgZayMSGm6XRfHnHVWgXUQ5YaasYSUmJ0G6uTaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fJvqHOk07FUa6s5/fD4Hq7cD2mBklo9gU81ggaCJZwE=;
	b=HtN1RLwhPmCyP+lmz8mHA+Z/+zEWdpxAWwh5PGeic5yMd4BxkRdLpfH/x5JEKkM16+hX
	 MoM5gg6hz8Gr6jicHEo2WdT4PesmA8oHC1bFRPiMB/R2KacLkOcHXSIpzfIDRZ1p1X1ef
	 bGdMhTe0GKBkmSFrbW5ZovOeHGHmlSwTvUStMvzxI/AZHJVHq5KbmlBy2mSw0lBGXcsRQ
	 +cdrOmGFfF22OGbhpsRd/c+asoOXOLQdoLPzonYWEzTBCiuGjzYPZqzkWV62tCOPzP8nD
	 IfcCUwHo7ePvBmD8qvZ8lHm+wq5MVPG4x4gxCMSCUOfEk3o+SLpxjhI5+KFHl1yWhew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w6jgn5KW;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD60606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FD60606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w6jgn5KW
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535a54bed9so1158058eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793183676; x=1793788476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJvqHOk07FUa6s5/fD4Hq7cD2mBklo9gU81ggaCJZwE=;
        b=w6jgn5KWCIwipZN2DshlTNs0liLS/ACzw5DyHXPoxLQ4oTK1oEx7VkDiOvx6IILqnd
         f7nk/OB1aod2dHo2Yt0MX4QxqAYaMrQVq2/c/iRHFrbqBnQX7h7iHvYjiq+7WePyBtjS
         0Yrr5pCBq+/xEweDG/fAAK5VmgQu26vpjDup3pVI1+FiUFv83HSOKfv2+vdQ0ZryyfQg
         DHkLJWXYBp4QbA0kCOm5N/O/Kso10becOMPmaNqdHqENg4r4WhSFBo1BuRBRxJ4EfELN
         KcpqG0saxptR0HHs7zQiFmdKKB791rJ4/l8P3mnR8QpvXXumMayWED1Ha0NhdzeNavfr
         kX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183676; x=1793788476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJvqHOk07FUa6s5/fD4Hq7cD2mBklo9gU81ggaCJZwE=;
        b=ZCUqrdg3Al4zh/RCvIG72K0Bk7nr0PTdPoJOPa2sZuMewc4jAK59PJacYIrU6J90kY
         RAKatr8u5x6vfkAy5KiRWqqhQ4d+FNRJJWGoMXv5r1jT8me+YuL5PfwStljGEgh3JR68
         zTmgrq/zd90KZKPMeEtg7UkLin4PTYjc/VEKB77VcadhiVipn17JfBnEWojNfrswxL7u
         qnkbTZ3nItXN6e55TXcs4WGCOPYbRVtW28SkRYFZAUwHA8sOAnlPb6/s8UOQ86sgx5U4
         9VoZt/pbc4dJI0cqOw0N0mMbAwMGF1natzbAcQhW2RoSrGVqa5Ex4lvf4MzXvoBpW25F
         UsIA==
X-Forwarded-Encrypted: i=1; AKwUvBxOZAsPnlmmL/BtJfPorEdMqVBwJ1tX5hNHvpe2wJLkYJ7nTBt6OwovcDb3JzUOhFnKeOFvu3f5n4FccKE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLz3oN6iLpIeBUmhpaRA1e2Lq3wAuugzr1Mh9h9e2u4Jea2r26H
	6gr+ITsHSifQyQVrHx81tNGAqEz3OMD99PGjCUbMqLPTm7amSJM9dGyQ
X-Gm-Gg: AYBFou1IRlsWGhGhZU9mm7D4DuiL+12rnZ+x8qaRqnWV97jDAThzQMzPgOFoh7KSf/j
	kQrMuUCUEDqN6ChP5c3EzPhFQlYxVlIueKVb+/LONOaxZHTkSTFb1kN5PHz8okvKuu0WWkw99hn
	x7SVjKqWD2xpxAMtAtqN4nzLBMNXWbfILGIiYSU+ng1rTHS+Tvcmlqi4YVMQt2bq5ZtvHktOkep
	OEFTalYxU7iHAAypRiAALsjB+hP0FCZZkg41KuNBkLV/V4+UUGkIGtPn4nkqUHCgSbOjHKZwAgP
	mWcPzsKofDYw2GAgwJZCyCwW0WmTB4qc5PEFkesSoJXP4LnUC9Hnj8lzaB5dluKy0HImFd2Mpyk
	fcTa3yqr/ZcFoqXP917IHFSNQuGaEZmeSMJTNwuwf12vu55s0a8vKW8FcbfNUjvcuEpn4372F/h
	WU38AQVqSLIcXgp2sZpxa7m+n5CkTr5yxN51AtZ5GnyBkx3LCa2m3+Bbu8Q+vo2B2O2LkJGvu28
	KQMu7h4xo/8xdcT1zjjZrW87WA1IVoUzBTI+V1NGbLgK8ZhIIRsswQ36g+8ZcnpMdYcxRUAJ95O
	pcX7CHQ/ZySsF5Bi52eo+6XPSNqr3UnL2YU9jmKigXj6/LQeDf8=
X-Received: by 2002:a05:7300:2406:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-36a203bd31bmr2926356eec.19.1793183675982;
        Wed, 28 Oct 2026 03:34:35 -0700 (PDT)
Received: from localhost.localdomain ([103.177.252.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2399b05dsm5723047eec.25.2026.10.28.03.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:34:35 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: mani@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	bhelgaas@google.com,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	ryder.lee@mediatek.com,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v4] PCI: mediatek: Fix integer truncation and handle oversized resources
Date: Wed, 28 Oct 2026 10:34:00 +0000
Message-ID: <20261028103400.2532-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <kfnxuro5xf4mhokabg773zcyp7otcjxwpzcn3dlo6y3kpv4uv4@bne4qf3vcif5>
References: <kfnxuro5xf4mhokabg773zcyp7otcjxwpzcn3dlo6y3kpv4uv4@bne4qf3vcif5>
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

Hi Mani,
 
Thanks for the review.
 
I've addressed your comments in v5:
 
- Removed the redundant zero-size check.
- Changed `fls64(size - 1)` to `fls64(size)`.
- Kept the full resource size calculation and added validation to reject oversized windows rather than silently clamping the size order.

 
I'll send the updated patch shortly.
 
Best regards,
Sreeraj
