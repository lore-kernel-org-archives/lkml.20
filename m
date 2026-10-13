Received: from mail-pz2-f6.google.com (mail-pz2-f6.google.com [74.125.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3244189DE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791858688; cv=none; b=BkYYfH1WXJROZ1hKJ0NKRFRmkSqt9tQOTs3pHo63TTtimZlqohaPTrV16xUysLSbbTv7ugOcZg67UvyayMKo6+/QNV3alYfJXzTPB9mrvBs3JHupcEIic7t4408/s3kPcq9tp5Tka1AALAYI4fccH4F3EsTQmBLPKQhklKSxQ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791858688; c=relaxed/simple;
	bh=v5tONA2LxrOLSUjqd88pbtiKH2gaZjORspEuhh6aOns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oyIteaUimHNC+jkChFWmNlgRpZjWyRAtZttElgjHbtwFf+MTHz730veSV47LMqUvYRhgaBTLnqmwHzI8n4PL/mMm2f+zcpJXOhTT+Onp0ub1TedA4wpX/iRy+hiyN7g7+s8fDSGG7nv/Op9/JbzQHgVNI16FRKXytMN17iAUe54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBwdtiT9; arc=none smtp.client-ip=74.125.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBwdtiT9"
Received: by mail-pz2-f6.google.com with SMTP id 41be03b00d2f7-cd613507bd1so44971a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791858686; x=1792463486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v5tONA2LxrOLSUjqd88pbtiKH2gaZjORspEuhh6aOns=;
        b=WBwdtiT9bnfcR6oU5J9hvGPPsl1VYrtXNfTCfAnjawEHtvD6WikdXXUwNf27v8mMYq
         i+JF+IDNSKB/6NS/3miLYWZKANDFun1Lvph7k8JKtXrnCCxfTbA9iDUxDOsaB4B8npH9
         vOR4aYP6p/3DC1/OA0XL/D7QFZjujS70Vf9BM6UoOHLzzLEU6HEMF5yhb1CEJj8ltUMC
         yoeGE0497bUXj5PzMlrxX/nj+A5ogAgIgEQlrW3ZWVimJ/gBpAqWc44JB43f+jwKOBzN
         3n10I/tA1Ib2UMbjdZyPb3eeq9fDYHBoxzS5rBgDWWvcg9S7aL54E9E90Osr5utrej75
         G4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791858686; x=1792463486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5tONA2LxrOLSUjqd88pbtiKH2gaZjORspEuhh6aOns=;
        b=tOyQvFQ0MU2k7pA3VzhlM5LmTZiICMeBQH90HWfXCS92KgeiGDMa7SoL4crRQkZcmh
         HWv2J4BOtnUE3tJYMubXtJUz2taa2qL/AWmkh6pY4hyrxEZjEx0fDdZRFB5tQT4x7ky7
         Orws5BVGYTlq09OlxCytMA5Y6rDlQqd+5yGquFTHci8mlyEHzMTfRiSKKh7/W+oDyg+o
         1LzJJXRf6EstEozj3X1KyUtXPqxujmTKHiXQu9cPZwn/pY976gMRRSBNaRUzbJgao6FU
         2ZwbEEyIDy80ASRWfasVAhYGdXwnzQeJW+1n8vh0SFf3Yx2xdRAQjL2pJdT8SwBHcOlu
         hYJQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7vIHukLSs8cS1gCMkmUCEMYrUmOeW/NpbA3W2jNa2iK3WbpYSbZQKe5PoM22CqmU3vKIG70M1qG8cEls=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXr70Rdfg2vvX9FOPU/fxSZgJvsCrgXDtA9QtCFNenOIylSEko
	C6oDtOsgSi4Uwqj4E7HV5h0YS51Y72t8yODScTNNMftTIo91zl5hxFq7
X-Gm-Gg: AYBFou1ZwtX5SkzM0q5o04k13NpVkKcA2NUp7EW4KURvBlkAf0jT+qnCDIJkiIqJuUX
	o7DNen09gpbuVX4liZrQWPsOUqPd5bnnG0IzyMheH77GQ51oDgipB+WFgTCn9yGKdrkrc3Q9YHO
	X9kP1okM3pbxBq/FiPiWs6mPe3GF00+fH2HuTT6YkMIGyrPrAQNJhLx3FLeDSisTEbi3Oh/A5s6
	Bz542U5kND87iZEV1BAuTCBNStclBLZApBdhCEGupOvWdhqhLdvt8fEpS+GigTnycde9IT2PCVY
	bBUB99VdwtCpTSZF5uzB/0nJgH9qP7KMMHTbOmtKZ84jCGktTWSA02zVlc7y1QkCMnOeyandCSi
	idWAQKr9gwAx6eOIVqZ3v1FirjSP9U5kuDo42wyZtRRqOefnJTeD3j2IiD5df70m5mb6Ia8dFNR
	LanovHYzHlkZZc8ktVl4Ix681lBr1AzIDtQ66OcczDsOUj6LqWx8KP5A+3EyUUSfelK+6IQ7dhA
	jXxtFGd+OmW3CpeHv4VvIOuVhblhRodCuFBU5FKEk6coD9tnyFoBBAemGJcEAGZcjQgGyocVj4u
	zCjoSXoj1htQev6KlCBXu2QXADEDMjCzSltj1CJH
X-Received: by 2002:a05:6a00:8019:b0:886:84c7:72b3 with SMTP id d2e1a72fcca58-897c78d79d0mr9188887b3a.26.1791858686286;
        Mon, 12 Oct 2026 19:31:26 -0700 (PDT)
Received: from localhost (ec2-13-231-150-91.ap-northeast-1.compute.amazonaws.com. [13.231.150.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c310738dsm4513065b3a.16.2026.10.12.19.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 19:31:25 -0700 (PDT)
From: jianyungao89@gmail.com
To: songmuchun@bytedance.com
Cc: akpm@linux-foundation.org,
	alison.schofield@intel.com,
	dave.jiang@intel.com,
	djbw@kernel.org,
	joao.m.martins@oracle.com,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	muchun.song@linux.dev,
	nvdimm@lists.linux.dev,
	vishal.l.verma@intel.com,
	Jianyun Gao <jianyungao89@gmail.com>
Subject: Re: [PATCH v3 1/2] dax/bus: fix mapping attribute error reporting
Date: Tue, 13 Oct 2026 10:31:21 +0800
Message-Id: <20261013023121.11036-1-jianyungao89@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260924025035.1265035-2-songmuchun@bytedance.com>
References: <20260924025035.1265035-2-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jianyun Gao <jianyungao89@gmail.com>

This patch also fixes the mapping_store() error return issue I reported.
The fix looks correct to me.

Reviewed-by: Jianyun Gao <jianyungao89@gmail.com>
