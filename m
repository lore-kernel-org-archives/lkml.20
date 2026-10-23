Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792754305;
	b=R1/HM+xevGwICTTz4xG2qoFIg8m2UtO+zhqbCp7RV1LpezV1wsq1WEGhKM+rOC0SDSoI
	 IfF8M40gWselcjbGlA5COLvZQTJBiLN6T1KSJTE9LlTTwRPi1bYXBUG7cBaG4ofpMTD6u
	 aQHAhf5m5sphFqXWDoQxBHKGTInwvcX4cfuHK/XZFS3uDsulNddrXEBWFrs55F5WfNBSe
	 od/CAOcoTSeEwc3C61iUnhF/EhmluXhvgEbDtCpvA3YHt26Ga9ZoIkhFCxyNeP98z2dcY
	 lQ8uuv3d83mV4/6bFaLZGcVsnitTQKVlJFUleuj+hnX7xLvEYjhh8FrP3oVr39bTMog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PIkt9+Fx/YCYAbZPoTX6F+aKXP9x+sAWjt1ugbmEx8k=;
	b=nBaMeYYHvZ0I6ZUN+p2ns9qKmzUrxeoUmDrsXkStNwPr6KgcTGwmUw8WviFde3khgYBI
	 q6IBnA0ssk1/aDxQ38WneJAe3uWahGOPp5Dtzjuv8Tyhmh9TNuzkc/2KKNVN9J5yDv+Qh
	 Oiq+3u0yVw98CR3oKWxDvFajZu28RowVmDhXXiaMgnqLjnULfktvx2H3JuQwIFyhpbU16
	 kaMJ/CHCJd0En9Gr+rtzdeBTr/wVzuqNAlPd1DyM5xXXaGGih0v20q5Y/T+3Dvu4EPPan
	 F6SE30B0Su5jlpmhZmgpX/fsTMjCED6wloh/Jx9hbPky7d35cRx2szIbDw0PEN46BgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qhzd2UlF;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E253606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E253606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qhzd2UlF
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso514214f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792754304; x=1793359104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PIkt9+Fx/YCYAbZPoTX6F+aKXP9x+sAWjt1ugbmEx8k=;
        b=qhzd2UlFNglAdwJNuwK1g+JNcFDsL1dmaLYPEk+opN0WEKigikFeo/zmpm755GJJQ3
         IzWwxzdbniPhW/lWe+vPXzOzcoFYU4MKGwmWUcrH2Us+tzA0nWnmmno0zPxXPixqQJN5
         o2zHtNtRRZSKIixfMyHog55mdzLH6q2/n/1OTdgEVT1octFwAA4xoXCLwRM4YjB/ae1C
         MOpNiRNfQYkuE89ksvt6mKAuVBW00k/uwrWm47v+iEUl2DKHIKQ3fnPI6wjnKc6PijTN
         XGtr/G6G3QSMw7/mcHWQu3T610Fjbrf9cGxwrtDum6+brOmt5EWAZAZq7ovfJForpGa0
         tKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792754304; x=1793359104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PIkt9+Fx/YCYAbZPoTX6F+aKXP9x+sAWjt1ugbmEx8k=;
        b=mddRF2jXOUcQHOHmUVtfzSfD3bYQgUsrSHBK3K9IXcgx0bYy9yYB48vv4HX/+ij/cn
         xHk+x5kSAxp/L2f9+ytbnJbZ6xeGdzkX4HfmP+FKJnxcMcr7wqL1EsB3LMVNcEV6WuYz
         ConMNuhTOKWt4Ly89div4qQ2tCNFy09tyaj2YMIbc2dx6Bg0M/bDl6MOguiPfZnwK2VT
         2ZtUmOgeiS9PYgFQmY6k8RoDJ3b5lCLQcDpFXpJQSuXp7pYsM/w9tWHYBF6JrNhHtTiH
         VHJTY5auaN1c47dUKQESGhi977UUOmb712UB03ublwxxoBouoEYT0pVziQYmqI5f1KZd
         2XTg==
X-Forwarded-Encrypted: i=1; AKwUvByhdrDdEzrPhEgjNBYAdzaeOKIGiDQlEFNuQsioRBE0EPcwyjfwDv671c17FmmPD6IaJ8RAqIILDx/8tEE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVBzys3buXCqQuN24h1sOXZzMw2eyCbr5tA9aUga3Z8QG7XXZ3
	F17nKn76G2RQUjulv6dhwEjMreDuctWAR2G8wZg9De+Mi6c63HoDo48C
X-Gm-Gg: AYBFou3nY15G0UujVdopGwsiBs5mdbbixoUZtc60whb24rCBU/H7T3cQNOl5AoYpz2H
	zk/lcUVOptzR05HHJ3PqVu5N0rU6kfZC2nCiWx5Pv0TSwPLLJ9XXUgEuxINhle6LTeXBz3rRdOB
	fmnYJ2i2dONGt7GziJ8X/KKZF8Zmp5OfjMtBdQvAujLEwIDTNxysvsggCG2XGcf9QMtFP/uKrX4
	rKKCPW46kOXpYaX/kYFCtMiHgJO7yThLYeduwWOSTSTfpCwn+2o1ZArBj6ZRRx+iyej3vI32etR
	xflyBY0HrzGl/ti5saWEAa96Qu00vnXGdSBje3Ory7DhaNpo8as5QEUzPTsu3whw9uyTpz5VBYX
	HrYyJQ59LJHtT6HD4QgK21L9/UBdAttB2qrU5+Y6MzH/xp5zP7DTYm05Ird2PuQ23QqpS3/va6J
	qaO8BFw/fF7zel3zFBulC5NxLhoS8xNlNIU0vNTej441DaYJtrOErtVLhPJ5vvNKqLYwuhAowSY
	zJsUPqrT6livnfcCip7LKUwMnzuObHw6GMvI7DfHZvEQzE0xQNjwAQSLYicvdOfdIxtGA0Ji5eU
	AA==
X-Received: by 2002:a05:6000:3105:b0:488:654b:ccd8 with SMTP id ffacd0b85a97d-48e3854cdb4mr2949659f8f.6.1792754303172;
        Fri, 23 Oct 2026 04:18:23 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:c12:cf67:3b23:18e7:a7a0:65af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38048ad9sm4621612f8f.35.2026.10.23.04.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:18:22 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] net: dsa: qca8k: serialize register access
Date: Fri, 23 Oct 2026 13:18:20 +0200
Message-ID: <20261023111820.10630-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179266392377.3135.12848522239467347386@kernel.org>
References: <20261019191137.307514-2-kuncy7@gmail.com> <179266392377.3135.12848522239467347386@kernel.org>
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

Thanks for the review. The issues that exist in released kernels now go
to net as a separate series [1]: the regmap locking from this patch,
with Fixes: c766e077d927; dropping late autocast frames once a request
is over; and a length check on MIB frames.

v3 of the MIB statistics will be rebased on top of them once net-next
reopens, and will address the points raised on 2/2: requests from the
poll and from ethtool sharing req_port and data, 32-bit deltas and
counter resets, the register fallback on link loss, the teardown of
the work, and locking of the raw buffer.

[1] https://lore.kernel.org/netdev/20261022192933.384898-1-kuncy7@gmail.com/

pw-bot: cr
