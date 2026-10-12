Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDB44C33E0
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827234; cv=none; b=Gj/+hPpuMxQ03t9/qZxgjQh2MESyphgdIE5qb4qNyJ7W1l03aPxGnEnB11Ctwy9Sx+yAX+VtFeeP6TB9CM86dHIeraNTsRzh2pMXDsN5e3Y/6kxSACy71GRPtR5RBzrO1Hji0zGyW6Yhk6pdVRhmU4thZE9dkfiPfmBQdeNWiBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827234; c=relaxed/simple;
	bh=6SnTWiDOhKBn1/SfUIOXViz4y86VbHYFc8GbTKs6J4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VYSDPkltgT5a+MU/NaFDz2GWEzW4pkCSksoVasS6VP1Tl2WFCoDPoCOIfmq4xGDv7d2Eg1vA4qNjlaTbqjyhqulxhLAyR/laHJ/1N2U7J8+VTs/sqq+RXqDjtGlGdWUZcrz2OkcwtkW8qaaHLrUw2Nkk6AoDnX+cPSHrrbBRjAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=q7HfDMMx; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="q7HfDMMx"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-1438d9363fbso519769c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791827231; x=1792432031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6SnTWiDOhKBn1/SfUIOXViz4y86VbHYFc8GbTKs6J4A=;
        b=q7HfDMMxE7OlMIzx7f+RByMarTew4ipxdkz10+3nAM8LHBFMO1V+IYtjUJ+/bOsv83
         IJ43MJbvK5wKmiOkU7IkJgec5bGc9hktVsqQ2Ju4TfH9moFnHlglBp85NnqnGgYxroWJ
         SujSIbAxQljmmTqJGfu9z8xbGGXvDrXVDuyiefu0wRZAiFhO/NH4LUr1esgPfPVQDr8D
         hukKsTeSVrChPFTchr5ocvnxjeqpL7RA2l+Zjv2UJy2SuN8A0KQYoSj5vVKXCJS47qVN
         nsjzF3cw6pxE8/JMi4B82BIglnUwLgNlceQyUNgSUmc6nvp+wRdzd5G1qZpSXe6cjqe/
         D4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791827231; x=1792432031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6SnTWiDOhKBn1/SfUIOXViz4y86VbHYFc8GbTKs6J4A=;
        b=QqwhmWDBg46DcmliyCbzIPXxFaZ8r7ajZV9HVZX/R4COhf5L+P/WWU1MPMaL3xHnUt
         gnchSuYdVhdCp1cBYOx0ZgkE1psM1+3PzSCYb2lL1aD6zsm9bVbd+meMUfaJkRo22YSo
         IGNWUM5tGqWaBa7hP9ldObHrI/F0gkoJA00t/yLQ35yjxIL/1xiIOwr6+bOdZFS+9u/H
         Br03Af0oTyr0/c7+sycUmo0rjTeTUz+jLTjdfUA6ugUCnRd282uqVwDVL6w3kj6D4FW+
         vezhNXZ9dB73QY6L2RHoEQvXxJr9V+UMUBkyrkwvicN6FraVuuKWRzSboEd7ZhEJamyT
         nYEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAhhOwcFCcKuA67q/NaClw2UhKvhB1rNgr54aF0ltNVfwAoUpcy53qKq6JMy1qdlwB6OaojLkcbS3lBag=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiK8bXINLuTMQNI03pdkQuYGoe+CCXdUiNBLHdJCIXQ24Dfv1H
	RrhWsY6MNWtg9DAishFLJlh63KCSWlw9wJ0I5PH1JvTfnq0h9QSyRVxCM0c7zN8FhVs=
X-Gm-Gg: AYBFou0Xugy0BTCkYGge3zWV+cKECgeAhJqEi7Phfe2V0ZZI+Q3NUBkslUaLlpv8R9v
	pjhMIVKwd5beebkTG86AO5bgbZMkgK9b9dIcooavt04M1h4uGKoOWQHMwaf+sOsNHZUxZmbqJLH
	bXCA4+B+0LoY5YCWCrQ738Eqaf1aVkN93YJ76lhJgxIrwihlyomQGU3NZRi81YYdPceJjeKM+Xi
	nC1o5EKUzvxgh9tVuXjNRJ7UK5+RJ9tJceChomXi6bVbZtsevuweAGkMHJwVy5PGajsSDAZDPbG
	bW85z8tzttXMVCoHrZKEkfg9B5CRZ7nLTLNUTzcRpy6lNnNqtyR/S3ZHkCNFax80+Q+rKVdzlBR
	FHy1goWGTrdx+x2Gg5WqHO3D7/tHBjdxexjADkTaW6mTrGYUH6KMwJ2YT12cCoiHDwLWNguz5Ii
	ag/k/1l9kIzGkXubFz6UHdYLMBJOUJHFNCO8EHfIcPSb4tY5eKQQvuYWVmxopkc6hmnDFM2Zkdu
	04MykUmKF6qdeZA0FGcVkJHoCa01XKl0FAowXDVzW8AQubj3NqbwpNBQ0S/izvEjwMwWf2t9pY=
X-Received: by 2002:a05:701b:4585:10b0:14f:5870:2e9c with SMTP id a92af1059eb24-16a15460f46mr12616380c88.23.1791827231478;
        Mon, 12 Oct 2026 10:47:11 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1698de65af7sm34305162c88.0.2026.10.12.10.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 10:47:10 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: netdev@vger.kernel.org
Cc: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net v2 0/3] amt: fix relay tunnel keying and unauthenticated-Request DoS
Date: Mon, 12 Oct 2026 17:47:08 +0000
Message-ID: <20261012174708.3623512-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009201455.1904698-1-omar@blockcast.net>
References: <20261009201455.1904698-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is superseded by v3, which grew to six patches and was
renamed, so patchwork did not link the two:

https://lore.kernel.org/netdev/20261012125943.558629-1-omar@blockcast.net/

pw-bot: cr
