Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51923E7167
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790807269; cv=none; b=tOxQ+Jyqsi+TDc2XqtvVSb7/grFyWqLY5EnEg6BKjZHW2gZvbD8PnUNTZQ49Ks379Z3xLrkNB/3Wtvx8S00u8Seub2zJLrnibrXw7cSPmpwa8CkWTik5jnHLe8M4SujS8CVZtcUTNr2EAnpP+wAKvGEWOeLW+5qqJg87aZk/6w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790807269; c=relaxed/simple;
	bh=ZSwULQAHzGA0yfFQVkuurUtRXeq+EcSnpkm1sjqtUG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HlwnHai73VbdEXAw5Z9bwUYHNGURvPvxCCRDyMOEG0sEr4N5CIT9x1ekllmgyvkr9fjRDT+Gj4wy6Lk04Mfj6cqUcXuBfPau3xqgZj7JFh/GQCCIMKd1vVT7OlqWCDXjc4evTm0YkuvyIhGIVy6eudIVR48m1xTP4VF4YDoefXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=kQDXVqFX; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="kQDXVqFX"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so34965315e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1790807266; x=1791412066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZSwULQAHzGA0yfFQVkuurUtRXeq+EcSnpkm1sjqtUG8=;
        b=kQDXVqFXYzulDpIu4sviPqPJLzPmK9tuMlFlUdZ1shePGvXm1TsirEPuA//09X+btp
         BNUzDDH9jlKsgycYrnHkWcmMcZr8skXmQA0nq2C5mAQacyTA48YzvSbulvBQGjPR5iNp
         lUJQpPo6/8NUeV5+B8QV+i4DBZ9NsLN+jp6rw9VuDBLimH6hOlLHf75k1gUoyj8fk3IR
         +/7j8C3T1zkC7Ecyte7mibuunQR+FhUvDfpLZ9L70EiCHXUNUJi3UYB1PTUpUvbhzfzn
         tvk3oMP5X9EcPXn0RnRpp2ZEsrhN8BZM5K5O8FdfOId2XtQF8inyTIGQPlhkJjQVwo1W
         TCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790807266; x=1791412066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZSwULQAHzGA0yfFQVkuurUtRXeq+EcSnpkm1sjqtUG8=;
        b=L5vSefLcwAm+IKI3//XWRZ1e8uaXGAeTLu+Q5dzkjRvSChBq4olpgJXfCf/rcbrd2T
         XU5p0pwrS2AgHKNoyFYT5IadZWz6yd64aefgBOCoLX25rZk5eTt7ZZ1mCQnZilp3wcYd
         YmLCSNfkrSdqU/fLltf5u+qsSxZPKz3QBv3d5w3Z0FQo2JUQrI33ypiCbIQ1MJckSK+u
         WOJcnpnQltzdfQxput0YvPsNqCM8mptF/EDi8Yyj58FBcX177RQUeHMNtE0BMRutG5rJ
         p27hsr23nGQmRcTAvta9joLZdxmxzfDPKXnIInqgUONd4QxQColV5Q/rU6xtXap6drv3
         di4A==
X-Forwarded-Encrypted: i=1; AKwUvBzJmkwiJG4MBKDOOAK5PMHbHmUncpUURa10YyS/AgEVaVF4oY83bO9bYa6oi64iOi9Bh1nRxhUC0oDqOxk=@vger.kernel.org
X-Gm-Message-State: AFuF++kfcI7X7csFHXVpZWKrTBsz3GQbAJDsYs1/HiskEjez0zV4q5va
	N78JT4SH/J1h0RtOUzbNpw6UiDfjIypGTo558fAxxkXDO7w+66Uc54vaFrVQYDg3bdA=
X-Gm-Gg: AYBFou0RPd6HFgrN6EWeQS7yzcbWDkjSlLz9HvcnPo7QWb/TsCEHrRXjZOtjr3Rrjm1
	jSgDuSR+QcxYvyR/janyq2XL+aPJDfsNwFqXrjvQW7PQ/Pbn9umlw1SyzIe6ifAzK0FY6LzshEi
	nGB58CMQ4HfnASjWBcn84zeGVsuSxb/OdBvR671o3XDV1sWBgX3Ui0zHVIwISzh+LaxIye5geJA
	iWsbizf7O1KlIpO+8oMaqq5g4cOpEWownz3aaV0aqBQBusBy5Viw8QO5Ia7uWr3Aj295Z9yuaw9
	+AYFG/KBCveaZVxutf6dSTGolbmUVkvtqoabGjw84KxhzMOb5/105jxZ3mIFsnFeWc2iGjRAqC0
	sHXay2TxWoBDG9QNTXoNp6CphWWOdkhZ8kQE2Lw5tFvex7wIjZexZZHz/eb2LRzHOeZlPu/X6MO
	gZCLQVuG9V5J6TdhZg2AoJGY3kDDhu5ZvyE9L0pk8Vc5oJtPOpRxCdi/YSq8AVCyYhi6W4Jy++/
	yPIaz5piUfT5SzE5mswc0FJRwSsmZvgwN/B4SlpNvHK+e8y3vcOsnqNUcYURgb0WjSZooGWIO/X
	wTo=
X-Received: by 2002:a05:600c:1f86:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-4a01aff3978mr44945685e9.25.1790807265320;
        Wed, 30 Sep 2026 15:27:45 -0700 (PDT)
Received: from localhost.localdomain ([197.51.54.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01feb7198sm9238075e9.1.2026.09.30.15.27.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 15:27:44 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: netdev-bot+sinfo@kernel.org
Cc: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] amt: pull the AMT header behind the transport header in amt_parse_type()
Date: Thu,  1 Oct 2026 01:27:28 +0300
Message-ID: <20260930222733.47563-1-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <179061960357.31693.937915571809434718@kernel.org>
References: <20260928181557.85796-1-omar@blockcast.net> <179061960357.31693.937915571809434718@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Found by code inspection: an LLM-assisted review of drivers/net/amt.c
while I was working on an IPv6 outer transport for amt, whose ICMPv6
errors would go through amt_err_lookup() the same way.

It has not been triggered. I have no reproducer; it comes from reading
the code. It needs an ICMP error reaching a gateway's encapsulation
socket that quotes only the IP and UDP headers of a Request, so that
amt_parse_type() reads the AMT header past the data it pulled.

Testing: W=1 build with CONFIG_IPV6=y and =n, and
tools/testing/selftests/net/amt.sh passes with the patch applied, but
no test injects such an ICMP error, so nothing exercises the changed
path.
