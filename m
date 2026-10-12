Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F9A468C23
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813626; cv=none; b=G+fdqZRnnlgyY4m312dUwvayI6gxwcu0xC5986uGMpIyF7DAClPDy/6aHWbu1RZiEoioi0kCmEESUpuWX/XM3moeWGFwCV7ZYWN+fbb47va8Bx4eWkubkpQ3XKLuW6yFOjWUUYqcOH39qJouh+sG18u0icDsbp62zpRq6rexwm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813626; c=relaxed/simple;
	bh=aa5DERomGGvC4qLnGZLTEOZG21c+T/FPi1X9gvZMK+c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CPu1jbVyhTn1kJBqwqGF5JB9NdTJfLJ/R2w7Q5IS5u28B2TFn+nOSE4dRI8+wXE8ZHN46dFjfCRjb/MN9HC2Fw9GOyY9l051jwTGNn2gppO3E1PQJusKWEC2QA5gpgxgOhVKpI5d/2yt/lOH45ABYQEyQs+VL6Sr7oufzMaJFJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lu6vWgvc; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lu6vWgvc"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a01933b584so16850445e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791813621; x=1792418421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X1FOHZ/aarWttDJsXYH5g4xTlMJF5XYAWbfKp7MZzrk=;
        b=lu6vWgvchcpBFY5SNlqPvGSSmfvvdX4X5c7xI+C0mmQ3cAmkXZrrCUmB0s9gH+91fV
         dGQcDt34QdkoxOt52cMwPJHxVnVGqunZjf812+SRrIKhsbm6EtLdA6UWPRqwtpz1Uk5l
         +p9K9yOWFIpomCKOw3cT+45TnakRZxWgm1GrVYmR3UgQy+J2TFwfgw6WdRCSy2yx++F3
         ylxNYYCvZrPjpPzHazfsZgYY5arKRdH7XBC24ToG7Hy8hQnJMdbdSE8G9Jm3FS3mMj5/
         Ke7ATVSZeuVBgIPEha/fH0Ban1JLx5vdsr9HkZfMQQQ2OSPmJE65XmmTcxvzjqFw5htW
         hWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813621; x=1792418421;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X1FOHZ/aarWttDJsXYH5g4xTlMJF5XYAWbfKp7MZzrk=;
        b=u8W7cX9PnavQijQAC+/2eVa5DTM60mQVlPGC6++fTUvmJoz1E0FNToXOzl0RT6aY1i
         0V3KzanhCfoA6+FVCk4zdkboUCucOvpuNtOD94tDAOxBJ0PdttO2dyACaOIEHR/InRE/
         i/4vP7NpfF/IukYUIL2cFyCZNIr4uwouYRy8BO0glNv4qe1mGeR014Mb7AzibisuKQPs
         s6vjbIJwccwj1ypL//GMXlA0ZHeuIo794p1Gkh6nMIY8stH+lrjJspCG5zGkM5SKqavp
         FAcnXSSmfa3uoCNvUvvdjFaAUDEQHo4NZELa3xKlxcnoYwI1aXJF97VKAa1O1W72gYgD
         6FRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkHJw9JK0yn3hlOp3W6RZmmKj+Wf3n35cctt4Lfvatja0pMPdLW7UPoiGKujb9kRb8/wxIYLu7k2uH1rI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCbwxv3UbHxf7/dWt1yM5ntkKh5hteWZPEBIHLAWEew8ZybJj7
	PNLENgj0Ja10+rR7AWaawTjdvrGB5D28Wn0Zn/tm2XbuMw7Fs6RQKCWH6OLQ9K+a2nM=
X-Gm-Gg: AYBFou3J8UqYOTJDIdgFBZxpc5rq7gpyFl64s7ITD5bYZMy5adUVGrg4pQughs0qbhU
	T2MuNBNEPytsyZefALCFzQG5PrVzbjWpR9b8Z1c4DaoH7zSR36uqqC7ycbhsCJTPLIxMvTFAkzI
	Fwnp4UkhoH6F4cmRdEMi7crUc9yBvhThlC79X+T9MB5hy2Og0W8+44HXyvQwYiNbUfxBOWPT2Gv
	vXJMEAlcH2L/WOcj8KefNABpdZJERX+vn2LX5fuFwG2SsPgByhAPIiHyQRou4SxqB6y/86WT8Uk
	q5/bnjns+A//N2uRQPvTeqdkrwmxp6vlJVDYJ+CcpZJn9P+9ViOm6neTrFG9l+sMKrMuDWb8ib+
	jpg3uPhZUB8spcdYICwyBL8300cUnpJGGI/UQqiYOteCL0d1pCrgDTo3rKRZK/7k1ThqzXXl0se
	LVhdan50n05mu+G+g4hjKJImF+Cm1h1IH2zSdVuZHiokPGU6Ce3BUNHqbGwmwKMd/gI/MUPRkcu
	yxP/9RpQ6Ho6IVwCw==
X-Received: by 2002:a05:600c:a088:b0:4a0:2644:80db with SMTP id 5b1f17b1804b1-4a18e4d55a2mr179206085e9.35.1791813621497;
        Mon, 12 Oct 2026 07:00:21 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ab981asm20197430f8f.30.2026.10.12.07.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:00:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 gabriel.fernandez@foss.st.com
Cc: linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261012131859.215240-1-gabriel.fernandez@foss.st.com>
References: <20261012131859.215240-1-gabriel.fernandez@foss.st.com>
Subject: Re: [PATCH] clk: stm32: fix clock array size for STM32MP21
Message-Id: <179181361097.33566.11163084689857836132.b4-ty@b4>
Date: Mon, 12 Oct 2026 16:00:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=186; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=aa5DERomGGvC4qLnGZLTEOZG21c+T/FPi1X9gvZMK+c=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlnnn/a9NpW/ihXqd0BQdk/jza5dC680t825+WcdZfjt
 KSurgu83FHKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJKE9kZFijtTo89LBn7NeG
 3pPeBScT+vqqkr6F229zO/r80GTe2FpGhn5urf3rMkKSGfcaP9r8Ze/FWpc9tyc92Lk0e53QOrv
 j31kB
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-pile), thanks!

[1/1] clk: stm32: fix clock array size for STM32MP21
      https://git.kernel.org/clk/linux/c/57e9b2c11056

Best regards,
--
Jerome

