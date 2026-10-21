Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584052;
	b=NrO8TGK43XpsdNoWw9MM9SmG7k80u8OuDm3mbLwBF7mDheFITcO53Fu1kP+PtSEYuZbv
	 2xgdpq0xerhyjhGOJBV2t2QzK3VBuM9u3uNR+mEHcaA38gJsUnR7/tdtO4r3xX035LJKy
	 hyvkUeEP95gKCp3yJavTSKFEiylyEzb8itHbXms+rLUy7tTdHJiPkQ3qf8is4i7Tukb9p
	 yP/NpRhQRXXUPdmSE9ygdphxWcmv2vRB68iIzK96jg9uA+SZsWBsNpniUOVz9uts3v9Aw
	 Atz5U0NbFIzRgAddUNBg0Jd6P3GVV4Y9SClAGwxtNPsDHhe7jxOxfrV/3vsPsEidiwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sFIge3pvKg5tOjs6OafupZRnQ+taR/KXdTgP36TD1t4=;
	b=sY8xdKl6P29CNqDYhtBq19KRjVYiL3PWi+6AFS2ZvOgGnv7zSwtwuonDXBlRMoJsN5BN
	 AfXaL7XixCmJnKAD0dJDr/8cXunIo/rPUV3gR0d6FCAwycjyNygJMNR9BGSD7w8AxJO4h
	 V71dTGV672rCyozOWepzSxHa1k0i2hUAFKIHr8/Igc9nEYK2HLQSOOs0nN/tFvpq4U1mP
	 F9IItCEiaa2UqPhjwZlxZynDRKBS+sJX+kKDzypJMEVCUx+bWzFOn0vSee/BDLjPVDKEC
	 NXZTGe3hroLh3+oaoLVKLV+2vr/aXJItxfb8jaqbJcZtlCh6zjqdzBxipAXtc6glYsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Ni2/mLP+";
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE678606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE678606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ni2/mLP+
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c20ce3c118aso112049966b.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792584050; x=1793188850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFIge3pvKg5tOjs6OafupZRnQ+taR/KXdTgP36TD1t4=;
        b=Ni2/mLP+iAbSaf4FkE0ykYCMgbK4kPCN3VwLapCetbM0FY4KPtNdrXAv0QBhxAjyTv
         eNe6hU27/TyIXRfsw/ss4WFt3dDVOjkRDCtSFdlN+R5afJ3dM3/4xB0X0j3HWgl20ycj
         ItkCVQiA6v3VKJQicOuLEHARAzySVcUqkSwhpb1DarNH6IQvLr1VyfFmGvEAeHitjBlh
         ML8V2LgdeGHe3ijOkOnj0F5q6KXwaNYlr6XYm/x9a5j1xZ7mclaNSGIdL8yucf8nZdzZ
         mwCqbEwvHn8GtuEyksudk4epRCTZVPyofMmw5olW6dYr96qluPMntNljDL7v7bdT5rDb
         kSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792584050; x=1793188850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sFIge3pvKg5tOjs6OafupZRnQ+taR/KXdTgP36TD1t4=;
        b=GyDabz2kz9YfA1K7pdX1mCA7iz2rrzm2NmjoxM+WtIYh/FWbSKvcBdL17/rB7symyM
         76+4volCso9UQ6lwNzUZVy1YWIrOn59YFYGSx4ai0v8Hbk5962ifCN9FV5Cn1kMPx86k
         cN/+D0wsIJaIUUUsj17g1Gb4il6bSmyfCrT0rf1j/KgMN5HRoH0HbqF8uH7tTFQ1FS3q
         jB/dWHqzM7zOI70UxrQF9PwEjU90MN8s4QV81Q4Y4yA0QW9OLqpD52btfum6Qbo23su/
         0v9Kaxzl0kbX8rH3J86Mn/uVnBRRWnRVUwa6gzER0Qczj5NUSRzYjc2Q5QLRN5KnYTIQ
         iOeA==
X-Forwarded-Encrypted: i=1; AKwUvBxbxpEcceZz3QsmFmIxTH1LjB8d5G+o3pU5LZgjeJaAptHFsr2aXRfG3T47qNtqiPBFSKERc3y3CI4SE8k=@vger.kernel.org
X-Gm-Message-State: AFq9FYI98er5DKTFZMWtQQaLRIG7iJqAndquCtxboEGK5gXGAuCOSg4k
	1rXkeKfNtYqyQ1zVfPiB+B8ApnPU58/xXxRRMAFzKpFB8nDGhZ7YMlhz
X-Gm-Gg: AYBFou0YwUnbhfa0pAJUlYMaYYtJ45haSluwF4l/KG8O3eTo1hHSjEyLylFNok3f2qZ
	QzZsKHHXD+O4xrGnIKN5CppBBBm/obnX9XKJ1ETpjGi34jlpW/+LcajKCylWcdzvn/gjv/C/JSX
	/3RyZ1/F4l/TTTCiCOnBuVhJLe7t1eaz3I47OBIW/u7/5Bbmo0USqivOY6o9Kcibl7mgazO/apN
	JXsTeE3Ru/5duO1ycLOvcijWXy2YcbIi5LEWbnwlNHNQOj3TgPtYBmikkM6PvRItWxg0SHLNYrx
	AjDrU3xtmyEeMEiQxpvs+a3qmQngyv5drlbFnIHDmt/H3KMhJGwTVq+LHB/Gv7OGt5uNMYfkav6
	+I/rS+uGYhhBZnJjTNw66IabuizD7azZjjskecwvt9RWlMl7PLhGovkpOlLOnu3Hspwa8pXI0t8
	iD3A1BlvRObx2JlVJMkKK8b/Awj4YDso4scZWzX7jlFt+GZn5evefM82W/Na3LB56JhLnMV2kEa
	7vhRFEjwqmDmq7lSrkJKD5fxdOCfnwQThbSXoYHm2r9yZS5JA==
X-Received: by 2002:a17:907:9490:b0:c42:6632:a369 with SMTP id a640c23a62f3a-c46799b30a6mr165818266b.21.1792584049857;
        Wed, 21 Oct 2026 05:00:49 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:48::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fda057sm68875966b.58.2026.10.21.05.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:00:49 -0700 (PDT)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: Boqun Feng <boqun@kernel.org>,
	netdev@vger.kernel.org
Cc: Bart Van Assche <bvanassche@acm.org>,
	Eric Dumazet <edumazet@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Davide Caratti <dcaratti@redhat.com>,
	Breno Leitao <leitao@debian.org>,
	Nilay Shroff <nilay@linux.ibm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] net/sched: don't wait for RCU when destroying qdisc lockdep keys
Date: Wed, 21 Oct 2026 05:00:46 -0700
Message-ID: <20261021120046.3279601-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atehw5Cn5Ev7Z68i@tardis.local>
References: <atehw5Cn5Ev7Z68i@tardis.local>
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

On Tue, Oct 20, 2026 at 10:15:47AM -0700, Boqun Feng wrote:
> Sounds like a solid plan to me. You can make it behind
> CONFIG_LOCKDEP_DEBUG.

Done, under CONFIG_DEBUG_LOCKDEP, as a fallback.

> But this means lockdep needs to do its own allocation for the hash
> nodes? Where does the memory come from, a slab or something? If so, I
> think we should probably avoid that. But I like this idea more since it
> won't introduce another API. So please do explore this idea as well,
> thank you!

No slab. The nodes live in a static array with an in-use bitmap, like
lockdep's classes, list entries and chains, sized by a new
CONFIG_LOCKDEP_DYNAMIC_KEYS_BITS. Unregistering hands the node to the
existing delayed_free machinery, so a slot is only reused after a grace
period, and lockdep_unregister_key() no longer waits at all.
is_dynamic_key() only compares key addresses stored in lockdep's own
memory. I posted it as an RFC against tip/locking/core:

https://lore.kernel.org/all/20261021115621.3194947-1-vlad.wing@gmail.com/

With that, this series is not needed. Given Jakub's note it is on hold
anyway; I will only come back to it if the RFC approach does not work
out.

Thanks,
Vlad
