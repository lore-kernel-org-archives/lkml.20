Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FD3387375
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286427; cv=none; b=Xbey85FZIfCD1zUcV9dkwFDbsC1ob84bJ2qeu0VL3288USdE5qdajElp+l87lmJzdteq40xlc+80B8VCmvXeqEfoZcLGn1kzORmd/vqpVX1Sp0Qj28En0q5QsdnpLgOsJDKePvGs+uN+/UOyUcLjap02K0oan+rlLtLGv7ZbohE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286427; c=relaxed/simple;
	bh=rbvt+tFZXxO5cFLINWgZ71k4YVwvsng5rl3cw2NGZ6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tHeS3aY9lY1mcqZW+3M7R01wCND3tu3kcFmc5uGUSWGH8CCAjrLuBJyZ6N2HActuKLmvWJtyfDqH8kafDoAVPrPskgQdphzc4g8CZb4w3MPEMijR8bp/8BEN+0JT3HieSKygTpx+TFlM+XOn278BpVtF/juSz75S9yXtji0rQyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ou9jdrN5; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ou9jdrN5"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a9a20a5e72so653551a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791286424; x=1791891224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kcAdRzVf/u8zZAu+qB0ABmtM1m8Lw721MraQWUZf5XE=;
        b=ou9jdrN5E8suovejcv4mQx+crgmUN3BqXNrUiyYEK/04W/n7XeADOkHb03lSrOWrrr
         /4I770nVYiV1cuCd9t1Y7p3uRLtVTniUCS8y2Wu3+GSR868Xho1wjFxsVojn8lemrcdL
         uHw6ZHyRUQ+idtG6QnyBGbFjye1FLn7+BT3ED1u+bNjBzhtZf5iuU030HoAjf5wF1CUp
         KIGTD2wk5HWPUPFbJnQcpif2/9HfiCjqcmKfmAUvZ/zrq4tJ3A2VdnqdlTFx/AzcQ/KT
         Dw2VVb7KugaeYRO7DBBiY9Usx8higPnoIBmTS6uww1lFYSMGvTVG98sVUmVGomg0czh6
         iFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286424; x=1791891224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kcAdRzVf/u8zZAu+qB0ABmtM1m8Lw721MraQWUZf5XE=;
        b=q0u+fmKcf7MY1JqR60XelL5QR0KFXS39WvRC/Gt2yB5HevYvfEnVRxVurdMv3EX6yh
         MktSvzqSNCmnko26fpqcjy6isMgL+BBi8iCwmILsU0Ws76Umq+fwXhtYBCh60W/bjYgN
         xP50iVskzvVmB3rdrSofh43PkPcX471NZljArvAQBTwuYrpHdrODpDe9n+V7U21MGacH
         PpzGTwt9py1dl/E3MFHspkYT6BC0+ifkktXuH5k607xxcUh1HCdOm7BJhErZQna6MB3g
         0UJ9bru6ePw2pUiykRo4dVepEkjTZKb8w5XTW940Vxa9Z8ef2gdErQhi4/lPma/BtNbi
         XKJw==
X-Forwarded-Encrypted: i=1; AKwUvBywpN4F8COKqZXhJM0eH0aXpIcUV+fkfHKcOaMzY2E3y92JxiInLhNKKYpEfEMtpW62lUsP3Ts3wuDJSoc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdzl4mVnn7NBNuQUa1AgPycO1+9j54BwCLDwJCC0FLUA9p/eyo
	zYkSPY57HTOsINviiDCd6XlRrQ12s2aqKSRDX3hm+Rbxe0fcTVLK5sW6
X-Gm-Gg: AYBFou1pKeNHtFsLp0BvgRGdImw6OMqAigsTXAbkoeOqRgK2H2oJc+LAI2/3AgBfmp4
	ApwEcDnwp7vT3XBEWnOWSqqK1Ndzq70CipFs+oYObAQB51qvx3bkuB7BJY6Pv4ozVA61q1KpVXH
	uAtcJhOPWX7W/qR5dLB/oSDTP2fBlBYydi0DiEIpj6fBFrSBAERKTaHTLymPQSwx931maEP7zgD
	9/6lNcVAvZeyYGQPaUaq9AYO0s93iokHFB0a9LiFp5kPM6/34ttkW/H5bacdNT9ItLL6jDD12Oq
	FavYSyuV/XfLLZcDsLsB00WzK1rdcNK2wjYj3dhzCjyc4iGB4ufUZIyHA7KfjhHbIKjsAuIdZH2
	qqVDGrYFAt90g/cdtJ7N6qCM5UwObV2H/T57EOkfTPCCFjmd0r8gOKBjxV+RQV05o05auEJY4FI
	3w0+sMRg0TZDJDI3OklEvg1K0LY5oWU21DthhhKJiBcMvfMGLC1dtCiEbgC4hGi5JnNdWcSbUfB
	rYzasg5pdziqBGvBPMiq1CCxz3rvYmOUpf1pbJ+wHe53+ar2r2zAT2XaXdQ2uZT0nkueV7vrODW
	UzQSRhf87YULgHd82MvxWCoeBhQb6FLkEPj3zuJiNH8HN6o4iG8DoA7wHQhRUNZ7e5OQvJFetlQ
	pgWLiUWx1hEeuuf8OCcgyjj+dCf7k
X-Received: by 2002:a05:6402:4512:b0:6ac:8b71:fd91 with SMTP id 4fb4d7f45d1cf-6afe2959a75mr1292168a12.3.1791286423860;
        Tue, 06 Oct 2026 04:33:43 -0700 (PDT)
Received: from Ubuntu.ts.net (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e5937sm4465468a12.11.2026.10.06.04.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:33:43 -0700 (PDT)
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
Subject: [PATCH net 0/2] net/sched: taprio: fix RCU stall from replayed schedule entries
Date: Tue,  6 Oct 2026 13:33:33 +0200
Message-ID: <20261006113335.241564-1-krystianmkaniewski@gmail.com>
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

Krystian Kaniewski (2):
  net/sched: taprio: reject software schedules that overflow their
    timestamps
  net/sched: taprio: do not replay missed entries in advance_sched()

 net/sched/sch_taprio.c | 171 +++++++++++++++++++++++++++++++++++------
 1 file changed, 149 insertions(+), 22 deletions(-)


base-commit: af39eb111ce6b5eba9c08513b62c4868eb7e7fd5
-- 
2.53.0

