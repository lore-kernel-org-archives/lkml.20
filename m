Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EA434CCE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002626; cv=none; b=MQWtSPgsJ1eJdGpJwGH793b1jWdxRhGDeypEsJCShItEoqgUSE29E15FHzn4MeKwjdC68nxuf0XG+FU08T/X8L65VctFItPfpPA9yqAhlOltwMJELRVimxzqi1WLdKjoZRPtoe1YYKp/R/lByShLl6FYvdfN7bGGT3Il4lg9T1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002626; c=relaxed/simple;
	bh=6a2ZbMEkIiw904HUxdkFsA++lslFLkj9V9JCozTDMBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNOFJZrg9eNPZ9DQQrQKrYY8tGXdoOyDrg7oondb93LTNbWLvSHYMsa9Z3mb7gLEN9kq4Hn31bWYG4hQqFJedvFJ1FGwrC/WQHGBlxa89eMWiqzUld1A0UXMduF6eY39+yGGHe3RjwTsFW5GORpfvFEkvA0bGa1mcy3AUVWE/4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eb8w1x/R; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eb8w1x/R"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9866so8633145ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789002624; x=1789607424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6a2ZbMEkIiw904HUxdkFsA++lslFLkj9V9JCozTDMBY=;
        b=eb8w1x/RX2UA1lqmdMwzYOiUYugyN2LjWlYpTED+EcnCIMfhiDztvx5ffgOaRDcaDG
         34kxvD682kAMIF0mVkdf4U0s8foYGeShNfFhRKq1I26NPIh2AzQbOwyaJhyOto/Q34Cc
         mHcJoUdBBwqyJO6sL5SqNYdpt6hOhCEd8bz44Tb0Eb3/kRHbDgYQKxWD0USVdfmFfs0L
         rmWdEETMCISzsT5pKtvX3sKmcCiUpp922TWbH6d8TzulDo5fqCaytvzsnqVZvNqsRorK
         xCxLB9/qoJAvq1wo2Basz5pBJW10VOHgRklznWkQiVFBTskZk+2PSDZuIxqa3ZtcNNpL
         QBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789002624; x=1789607424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6a2ZbMEkIiw904HUxdkFsA++lslFLkj9V9JCozTDMBY=;
        b=LURxFFA894sZg46tATqZQafpBvNlqSiwErazKGglUlWvN+y4pEM9rcvMhHpvmvokpl
         KcDg/HSfapfGogUQz9GATgWA1Y9Eoqa+Aw76K5I973FgEDTl6t8+4Y6/eMyVUGWwc6/T
         6apNJhUWEMWLR5fV3lLhXWSB8d6SfhlX7Kkb+ihY+rC/84eJ36THbV1z3eGDnXY5qHYA
         Ke5K6pzGXZTO1iZYGjhPT0xsi9rUZunxwr8+H9/NLediCPdwrXDEvHEE434r84IoM8NV
         u/00SPE/RxY9uzfZKrb26A5UIqein/ILRq2sxMoHm+6W7JJrVoxWnMJhVHQd+S605nUf
         2r4w==
X-Forwarded-Encrypted: i=1; AKwUvByTZ/TEQsHoc2KtILWMtmwTx8z+c0HCdlRVAUlHwIK59Rrm3j2gECtWjODSUHp9n/LMLX6hUItm74ZIQkk=@vger.kernel.org
X-Gm-Message-State: AFuF++nahSo0bIlNbWFs9CPGsv5VZOzQHSdwxbRuRvVymnveEIZhWihl
	PkTJwkHaeYaOIgo1HSu+vgRtks4BHCf7mY+4dSnfIVNKzDo5YTWnSrk=
X-Gm-Gg: AYBFou38d/dR11lSwLdDCNiNAY2yKL2pCtWxA/8Nj12JNIVyzswaseUkgSvt3vAIjqu
	uuoRfdg6IBYQLkvtGqLFDRBGIF2ANOdWELKizILAXZ+7QEoh9+Us4ouXg36WMLyrihddfhTBMxy
	C15e5RnACikomhKBIReOah0DOoU8R3iAdxGBhTMpTdxkz9ULhxSvLrQycZ6sri6HU5zxLZtJcoq
	F/ZCaEmmoljZYybuJevTNePgrA9wWQsXtHPdPSK8l9nK6MS9ATr/nFiqou5at1wHgMfi0a6nSeQ
	VtkaSkYVDS9qbhY3b8LbauBvrSyj8pdgH54fkAtvbzY6xx8aoisn+pfDvKyhXES5NxHMf9YRulH
	9Sw2DTqifIeVyqp0lbIo5fAnOpVrlK8ah7EcLq5u0WZlpsSFh7XVKFHMJHCFF0/JGKfAMUlD9ln
	QqY992UBCHS+/EAg6BQVxqol+uDdneaTG8Oc7gv0pkjmxDhsK1mnPUm2rigJqS83PtRypkKlEfT
	numPDPYrdmdFNNQVNcaXUox8Q==
X-Received: by 2002:a17:90b:3b91:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39d70b1c48bmr5704657a91.18.1789002623824;
        Wed, 09 Sep 2026 18:10:23 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f04:fd2a:f01d:1dc7:1e5:47d8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d77608fb4sm2251431a91.15.2026.09.09.18.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 18:10:23 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tom Zanussi <zanussi@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH 0/2] tracing: hist: two named trigger error paths that free a published trigger
Date: Thu, 10 Sep 2026 10:10:18 +0900
Message-ID: <20260910011018.532378-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907124420.607097-1-donggeunyoo.kernel@gmail.com>
References: <20260907124420.607097-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sashiko AI reviewer reported these bugs before I sent the patches, in
its review of "tracing: hist: set the trace clock before registering the
trigger". Both patches should carry:

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/linux-trace-kernel/20260907092944.3950E1F00A3D@smtp.kernel.org/

No change to the patches themselves.

Thanks,
Donggeun
