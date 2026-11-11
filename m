Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411944;
	b=5KxMpU/goGA/mWngZHOjihHGaUmEbje5GugmM2srM86/itYejpvi3vJYqNwQWa5bM1gq
	 wCPlKcZOtTOSLw3bulZ0Ktt1snPf1nZADv8TEtyDA9c6ankgForqLaxJdJnFymsj9zLlK
	 HX/fBSePL+mEHC7vwWgYsESIeUEGNFjsQO9kcu5Bs6br3LBosPjkttfn+DayJ8vEo6mgx
	 yYZChtnSFuIb8bi1wVHo0LXHYRkaGTXeJOs3jiPHLVDnb82eEmupxnFDMGlqrJsaokeDU
	 h8XGmLkA8PfPaVM8vwX3kfhGEyiNzZy0XUwVvXsjY3P5orIty1u4ht2Z+NV0MN6Ls/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N7jG8qlIvYKjoXn3tNaYxmGrygzFqcyCAqa2HwUrUVk=;
	b=TFXpIdzRXqhIOOADkEFvR2qd6tJtwuCjlK4QBEzPuOL07yB08rUMOdrOd+5+gwLgrXcR
	 RNqoqf+g1JVc6o+KXd7GL0330HCGy8jtSiCuKDLGNRZiGnDYGjinSMlgTU1WbP0JgGqG+
	 momhdl9vK0mspetXaDB/G4vyb11NvKz/3AY8P9eEktgbVJh56FCMwHtwEdhwlxfNW5/jy
	 speXMeAnQZlzB6S0AuJXYiCQrsAtPlDDjCFqOvdNAUG2SoV5v+wl5S4CBMhOZ6Y7u+clb
	 tM406P9mMCMIyCFURboNmLUlXkoXS+70m6r1VkzZQeMW3XHQaIQwsoaEVlDjWv2DKNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qJAZQ6mW;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34946606A331
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34946606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qJAZQ6mW
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67c24619b19so3331610d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794411943; x=1795016743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7jG8qlIvYKjoXn3tNaYxmGrygzFqcyCAqa2HwUrUVk=;
        b=qJAZQ6mWSMFxoquRvMNoXNgt5hiox5BzuH7nygG4x5JYQWfHdgztateXr9JCOrjHxv
         NnjCaLmomq2hI0EWo034lmajYWUKCLvVo+g6hs8SkWMMfaBpbIYsURUiwaCl36zBpRch
         qdeJWPwVzAtG7YnxbMdkX4ZCLoGoSPtf4aGoMCPCWAFZKhcMUKCvEVha8XMiBkK8JBYY
         Mp11glU31Sn78rdLPi20mOiHVrCb7K64DBlkVZFSHNpFH5m+VCxl3vhRQCBJUCd0O/ZZ
         2x7y51B+T/EXNAqWptrxq19EXJ94T7VNcmdMUhhT66V/cHZa2q2sZNOJlT/qYZ90M5gn
         xFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411943; x=1795016743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N7jG8qlIvYKjoXn3tNaYxmGrygzFqcyCAqa2HwUrUVk=;
        b=S2vP8ZgRIEdaCPBPkqu8qyfw6KwPl//DpawFW/YTzqnk4fV/v9xOM/dwvtsizT+A2k
         aULAtfQjhzGNSlwWt2JESpNgRs+2oIMral7RXI+kSzJcfuif/j16DDNUPQvdu6V8NkHi
         98BRhGKW7Gd9bdwBzPuI7zU9m/mnfQDeYC/xHMWj+DPiskFDWczywKpbDjubKkaDY3sW
         oMLEWTgpLw9BFBu74/M72rHMnuz5P3Dnniep4JeXUTyOABdnX0k2Ujohgnly8qpnuG2Y
         iu5AiOiDuOyk78DHT3zMfKnWj+zmkc5yMZUdERDK9PmBUWepparbSV6Aa4csD1DIAkVb
         cZ0w==
X-Forwarded-Encrypted: i=1; AL+hErHVAFTh6R1HYTSg7fb/Rl6gz3blmOEtdQJhMDLamqJA4m3ce4iIq4Odux/1OrD89B4TAoDjQHc9/vlKOsA=@vger.kernel.org
X-Gm-Message-State: APuU4Z92/GGDuUjvlmmiDO3bAoBG/s7hl1D9N+nOA7TYFNQOWtw0B82l
	10rCcnugq9hRBJ5h+qsqqnfQUsiYJFMqDZallWQFXLfRNliInb99UDnzSlWpCXEg/IE=
X-Gm-Gg: AYBFou2CMtpcJSscVm2IUFlA4Tq4DjW85NRO85R3+1croIegvJ0o6vjRi+OdD51OlWe
	67N0147rzT29g4e1EUzbGg87FSPB/Ng8e/+Cc8STY11hk+nXjw36tX+dAZw5ffHVRAYeFp7wpqU
	3apH/fXkUBbBY42eItgvVuLYB6ZRYKEDr8DokeJ+z4sQVQmXugunOsUpRjWvsZx1ZgiGU0EpvsJ
	M4ItgMV65gmkMCZ7PGQQ32Rps+eiX+kA0qyjiaBb98ewa+FELc4BGmL+GyRoHnlhyBX11w/bqYW
	je9Jqj13RMA2jBWAo3uwmtQfkjmNN8ijxodivbW1q0Unmn7Tfu699On6Fdhw2BqKnpGHVxkO9kF
	RoGEQGJJHirod1oWoJBkwcF5M1q5e6bqsSZB7bc6OAHAjpE8UMlQ3QbCbMAuAkUkHvLwa4j6ek9
	jYTzKH5vsFPDDVtdledhmJ6VEFsx8y9tubS0QF0qalAaSJAnx5HBHTgE9nEwkMXLIcIqkNxQNLK
	EcggIHi07e+G+ZGRPaZjZE/XpZ3N3keeR3kSN4dmzm9qUCtJa382739yPp1ob4yEoTIc7at75H8
	RBbkX3onC9WIrXOuYFUR1BnM+F87Md6aktUu5DD89C/glZVVBZMVQy4PpADUajn3XcyKUqwYsWF
	slEo=
X-Received: by 2002:a05:690e:790:b0:67b:f621:8d4c with SMTP id 956f58d0204a3-67c67f038dcmr1488696d50.25.1794411942980;
        Wed, 11 Nov 2026 07:45:42 -0800 (PST)
Received: from localhost.localdomain ([104.28.212.24])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c6e207adcsm1433127d50.15.2026.11.11.07.45.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 07:45:42 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: qcom: camss: vfe-4-1: program the RDI write master buffer size
Date: Wed, 11 Nov 2026 12:45:36 -0300
Message-Id: <20261111154536.24163-1-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <6fdd46b6-e57e-4688-8231-b31b61810cb4@linaro.org>
References: <20261111135338.27008-1-allan@fatecpompeia.edu.br> <20261111135338.27008-3-allan@fatecpompeia.edu.br> <6fdd46b6-e57e-4688-8231-b31b61810cb4@linaro.org>
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

On 11/11/2026 14:35, Bryan O'Donoghue wrote:
> I would appreciate a more direct and succinct problem description.

How about:

  media: qcom: camss: vfe-4-1: program RDI write buffer size

  MSM8226 has no CAMSS IOMMU. Program WR_BUFFER_CFG from the active
  format and clear WR_IMAGE_SIZE to prevent RDI buffer overruns.

Can you take it with this changelog when applying, or do you want a v4?
