Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387C737E2EC
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 05:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791524397; cv=none; b=ATqnhh6lvrgAnW9mFAwte/DH7wnrFC6iaFdI2Q5l+PnBa+9SF6+rRptfT0StwOqF1IQ47KUNXlPbwGCAJhuD0NsOSrZ3A+S0eGfpqRBsqcpwePY9hb8Bzgl+yCxdIszMJiGXbGMAxkkgn4uisevHM0qmXQxi3lClu1TAJ70CNbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791524397; c=relaxed/simple;
	bh=UXUFl7FhiN5wibBmmXj/11HbDZmxBMXi9qkzZx1E71U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPdRirgkh1UNVJZy4ydafc8FDlySkBblnj8hQWvO8VHwfLtXtsXyLlj4DdBa/1YgFDG+FRPRzUP2kaiDlEWC0rbkWWH3gCe/9bTXIYOGuXfqDf55fk+2Cnz3ih7kXHr6eZlwFxeX8/u9NLkx+WgMNF6WXIXHqrf3EOcipmhflW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=slLP4XN/; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="slLP4XN/"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e831e86ebfso5665715ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 22:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791524395; x=1792129195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UXUFl7FhiN5wibBmmXj/11HbDZmxBMXi9qkzZx1E71U=;
        b=slLP4XN/fI4U9/ZpT1ul3lEH1ZDWIuxnb5ACFiYbF45KQCA+Aw3NfycGT3vmRlZ6YQ
         HpM3b6rOB898saaigJPofRzhbBlgOs4Z1PuJ5qrMSuxXpGSqsRoKZcbwOGfI5a68GHT7
         RQMlKrB2OmKPr9L8fNBoq2uPiBfKSd6HmJiWTjWnHjzxe58B6pACWEAFxSV365m+bKzR
         wFYuUYZNq6QwcuwPiM2S8HyAs6iaq/nlpNhK0ZKvu+DkkFXwhVAIB82gh4hOLSdvMuMe
         FxmAr9EcHK+zd/H7VY+8YCabhKk57zZ6TKxWcCpVblvpcjtHmy45GllYn60JVYsHzXYY
         IWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791524395; x=1792129195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UXUFl7FhiN5wibBmmXj/11HbDZmxBMXi9qkzZx1E71U=;
        b=DpBUyD8+O2KBTNqrrguFJQZhDEHz0E25Cz2AGs8EPzHx+1o0IvA8ZCh+wjTfPjpa4z
         5Wn3WdC0rrNkojTKtw6rlXZhAgPtK8/hcbMW5dJTdaMXau9b+SMQcWixd+HFcuQYLv9v
         dQyBjPjLofk1KhTAgeP4lerED+wOu814RoWVmIjiHXrrQIgAxpS/Uniuvqg0WAJFMvTA
         0ijm2Rdesky/4/0Oc6XGTyK4Fb2P7tWmspFuoXg8LjCF+Gtnec2y/TTPiqpkACsOf/O1
         d52DBiK1MyYxWryaztWX6NZ8wbXf4dx5oenW4CTANW0AoZhk/Ai6gTSU7aJzmDsprjR3
         cKAA==
X-Forwarded-Encrypted: i=1; AKwUvBwUWbOajBPocyq6p8KRxvHvEF1muWH9HiLqoyQrQ7Qn/sHtr4yXfxYzYH6mWpJeaKN1Ub+CD0UIZrQysJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYISkRawhE8rWljE+HhVH5488ic8A2OaNw/6a8mkDCAuQ8GhlLbh
	4zEkoQWkyRFlUGwkNfVJkxv+ods8xbl7C71bnMFGQykJP0gpLd1984B7
X-Gm-Gg: AYBFou1JtOp19DL1LOK+VM9nyYM9DNPAWrYEyS6JXAUKpGw8tHPESx/3xg2YAPkCht1
	9SbRbQxxaXBXudVBAwR/CrMFZfR4gFNnnvsjwmmG/6+f3ZbeZW77Tg4YBFfxZg7Z1zxC/yih8SY
	+Tk5Fza4fJA51dxI2pg82eD0Io83XLdcxtciQUI46h7/7DZleuL+/HVwDkuSF6NqVM8238U0ARx
	S1B8Nbj0+kqC5VLJmKhfZeIwNP4We9vujp1t1La5zmq1smy+cv/kpxRjDSMILM7Tb7SnUDOy1iZ
	UBxX65oW5Y8quGykef04T9BGjQLsUmJCseMzSjCZCzjWJCuLvgrxK8Ozngl65zxITmF8Zh6pq0j
	LlPbHUVaL1gvJLaUysTtNJb6LXcaU4s+1B1I+m1k7LqVwFqiPHDQFHLPTQrZLN5L224oVxOaoBX
	f2mQDpARK1x5xhamm0ReZ0XuSEvPTiR35n0Bhno/K1HFn6yGssxepEeEOKZA7thrNgrKku2UgEL
	Wosn/fNqsM=
X-Received: by 2002:a17:902:d2c8:b0:2e6:646:8ee5 with SMTP id d9443c01a7336-2e842cd3e90mr6908545ad.39.1791524395437;
        Thu, 08 Oct 2026 22:39:55 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e1643sm3620345ad.70.2026.10.08.22.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 22:39:54 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Daehyeon Ko <4ncienth@gmail.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 1/2] ipv6: serialize address publication with device teardown
Date: Fri,  9 Oct 2026 14:39:37 +0900
Message-ID: <20261009053940.266350-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179122559913.434549.12720841717630168470@kernel.org>
References: <20261004183639.3773498-2-4ncienth@gmail.com> <179122559913.434549.12720841717630168470@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The finding is valid. Patch 3 in v3 passes the public ifaddr through
ifa6_config and initializes ifpub before hash and per-device publication, as
Ido suggested. The caller retains the reference on add errors and transfers
it on success. Thank you for the review.

pw-bot: cr
