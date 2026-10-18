Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76AE366DD3
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792292027; cv=none; b=f7Ucq1exJA7mkGtiE4HKVzzYDPAVNnbIqRHXzXV8zn/padlmchtc9y2II5Y0naqqRVj5cJUzHlgBFzPwXA5csI7LWRjJUWWgr9+lNQiK3CEBlsRZIOmvPiSqygsJWR2CwPeEMrTAirfvzh1X5rTbVU/q8h8lh5xQet0W+eS2iQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792292027; c=relaxed/simple;
	bh=bBj6psTg0atPzJHuE/vK78ETes9bC48NNTa8QuWS9mE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fv4hLDkAsT+w/yZ+YlGeOt17l7ILTYA3Xe4d1wnhyTdbdWtuG4pE6JOwsKOEBqrS0ybshC9LhxEFLBL8QerVqCtG0b9Iyx91ogUnTyzGax9y1q5ISCIMv+3p4hcM52bQp5wqAxqYl0pdomP7S0EaKENUnHh3xwxx/PxTOZidLj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=HYZISQcq; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="HYZISQcq"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso1177606a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792292024; x=1792896824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBj6psTg0atPzJHuE/vK78ETes9bC48NNTa8QuWS9mE=;
        b=HYZISQcqf5hf4y0N6uHqGFkBZiXkDh6h/RZxTr7yStUo5ktO8PWjm+C9OFcEa8KW/A
         1/fz8IVJmBFQmH+hPqnBQBgUswKQM5CqYgoohxyiPvTg6myMdFrYfe+f3B7/4IIeH3TL
         KS4GzAajFpXG7DfWIwUE2zKDoTcgI+aRG1Y3MTQRH9odrszYjxo2Apune39h8yT5td7F
         M+Zdc6GHxpvd6TYao3g8jPrfnBdJj62icL6h/3lwFOCDpEkLMqFPHuRpS35w7xzlDcT8
         p9xrYWM2pxz1I9giuBT1KRAO9DCKbQT4vCVjtt0H2nakwPEbpAYULd+WEhLzqxieeX1V
         zqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792292024; x=1792896824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bBj6psTg0atPzJHuE/vK78ETes9bC48NNTa8QuWS9mE=;
        b=WqYgHwmTvZtPvfhdNNfJn7qDm8iTKdnlmrrXBOHoZTsHHwfP6ZNN10WGiuWAgaFiT3
         dO4ONLtMFpaEr3adIsZmFHpi5LNd1r5BA4pilLBaCD7jhhQ9HOFgzIua5LvfRefDaxFO
         ygLmiNeeFwsVdrZf0rLScrDA886jx56SwraqJUHuXZrcgsAlEi0C8gKsIbPvXzZpkVbi
         POz+b43MQY4+UyqpaoU43Bt/iqtIKky/BAmgXM+JPuOOTCTdNuMOJKLLdZhVpkIZwsUv
         d7NIgkeIx6QDgdKFn/HD3ziZQNdotKitlJF7Ll3w/bv+u/ZmM8eGAdQkcTo6Ylokk16I
         fVMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxm2NKFQo8C+gplNntLcehrbbvLO3nxwIJU6BOz+K/QM2j7HAqnArUQvlaL7Vezig1ox28nux2tJl6RO84=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNx3ZoUaKZRSJ+Yn7yoWEitcM8ugtUaXVBQ6oLqsSYoB7bQ6bu
	RCyb7mQ+FLqC8KShyKDkmtQdDtZb25+T9q7H/UmebI4hIoBwnb0VWMrzHgEoGw9npw==
X-Gm-Gg: AYBFou1Kz+ov7EGHOxsJvr8Do7DF9mUNn2eOmWs7S2Nr+meYrTRGGTNtSszEXSjY1dB
	cloFDzzzvPbXO6AdqPZc8nKuqFVMjGs3GKqIP5oS7eBbU9beDAzNTrA86A6rYl9Q3e0suxsQpe5
	SsrQz3lScjxh+o/mGxrfrFXaaOBBjiQ9qqqtte1O9ozVrbtD9yma/mwRR/lo4e4hG2DvHcnl145
	rfRUGZx+Fk/nvfyc729grJsgY202oLKbj7/B6OyyDIl8vECS/lEy9Ydqp/Rg2NNaHpP9z4SM54T
	0faQ2a1JbdMxQe358yoWNgZwdmv42EVAunTz7H35wxI28Mi2GhzW4HBSiPjbjdvK3K01L+kbuHB
	njuYUQs6Wy9Y0csJLe7pUUXUzk4lAEo2kUh6ECoAK0rksmZq99QvMuMlbGmV2tF0yvaioA0r/n4
	E0VO7JfgjNWaJhavQXRWVt118R77K4NT4Tr/L5tf8oIt4gSXReRQEg1XMvgN4EnnpElHwvKBCCI
	1MQ1Ar+n2cZxR8A46oQUCW+ClAV6+0oIZ4zKftq16EGjCwJJFsI8KvzcjBdRAs+Vdq3Ty7r/F4a
	Q34Xjlemqkws0f/EpGTEQbXem35CfD0wxlyGHcQVAMsQqiKygg60kc0jg1Qgts0kHr9eU6PxMrT
	u+8G0UbYD7zvmIY5oSmNsNWxDDE7JyDaN8Q1WMfciQGdpj00ZYeHsZU3V1yafzRlBjWPqy5jMBH
	nV0gxe6dxi85UNY8m6hRWJ9BtkswR6hbZ+tilbqjXc0RqQLoyBLF5/UliP/u+SKRc5QGlA
X-Received: by 2002:a17:907:94d0:b0:c41:285a:46a9 with SMTP id a640c23a62f3a-c41a08d9fc4mr265085666b.46.1792292004094;
        Sat, 17 Oct 2026 19:53:24 -0700 (PDT)
Received: from Desktop.fritz.box (p200300f24740ac10545cfe8be1a407c1.dip0.t-ipconnect.de. [2003:f2:4740:ac10:545c:fe8b:e1a4:7c1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd1130sm227219666b.25.2026.10.17.19.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:53:22 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org
Cc: netfilter-devel@vger.kernel.org,
	fw@strlen.de,
	phil@nwl.cc,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nbd@nbd.name
Subject: Re: [PATCH nf-next 2/3] netfilter: flowtable: update upper device stats in the fast path
Date: Sun, 18 Oct 2026 04:53:19 +0200
Message-ID: <20261018025319.1445197-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atQmpPlfT_DSd9dq@chamomile>
References: <atQmpPlfT_DSd9dq@chamomile>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 18, 2026 at 03:53:40AM +0200, Pablo Neira Ayuso wrote:
> I mentioned it is a feature that these counters are not bumped,
> because packets are not passing through this devices in the bypass.
>
> This allows users to see what packets follow classic path?

OpenWrt users report it as a bug. On my router a 268 MB download moved
0.15 MB on br-lan, while the port below it counted all of it.
conntrack already shows which flows are offloaded.

> But if you insist, then explore a way to synchronize these counters
> offline (ie. not from packet path) to see how it looks like.

OK. The gc could add the conntrack counter delta to the upper devices,
which would also cover hardware offloaded flows. I will try it
downstream and post it after the fdb series.

Julius
