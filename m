Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169410;
	b=UYXYC4nysmprU2mVrX5wpnZCUZW447Uc0WjSiI2Iq7oXyEDvnu/W0e4EgoyzhkiUenme
	 8jobrlMm5jQ6jqfcgBTm2qW6+RIFHUDiFE9fmvRrT9TEDGnzgROyy9tQ0F/FeOdc84jGd
	 EP9VmxGK2kzGbyzxx/FJtPQ6kRHj++PkKZ7uTP+E6cGBH2tz/kqWDIh5MCWsvJr+TPUHz
	 UBk8LubzyixD6F3yxnr9Tix1hmz9GvMzfmHoaVkYamuYMqZ21Li1ERqyNe2xuUZ30Bt+i
	 39k9O/zDbOmXIu7bRrdySgvMQQXof9tCujUFJbothGtPCvBJot+Ry3oOa+IwVb5p0Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169410;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=OHtbbnXNjLGZhap5GPvMIB0XRYjf7N7iCg+Gn3VnS10=;
	b=2hMIHFPMkpycFgrMdapMn9+Kjv+JgKNKgkuZp2e25+qb7k/RTEJoSQidfcp3ZkNfkXTh
	 fy/oir8Qpa6Zdiw6dl+eDFyfEOeKsIv2HvRhIiRPiXnLphGmlnmPxekiIWa5gM4xX0+kb
	 eums77f0LhhVX1ccwhV3QdVKtZqbwo9ldBhie0Kb66Sx2YXqbgkc5yF5pRo1ndJI/3WXP
	 E0mT2IGW467EuzihO5Mbx2CGlxe1q2ZbzrTMvOxyym0eBQlKb6CgnhO2D7jOzmn3J+AD7
	 3n3/uXl5Kokte1XdbmZcxWXsTxmZtQH/Ma1jYOoj6UR0ncwCq6AQqnGAjG7a4j1+0Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HKIBu585;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94212607163E;
	Sun,  8 Nov 2026 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HKIBu585
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00071F008A2;
	Sun,  8 Nov 2026 20:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169410;
	bh=OHtbbnXNjLGZhap5GPvMIB0XRYjf7N7iCg+Gn3VnS10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HKIBu585J2wCM1Hv6aQg2GLgrbZOtRFrhItdSLv7027uhXgL9yD6vHDX1SRPg4gJI
	 jemCRG61mExfqS8Zpr9aF3Z6gbVHQ4nOJhNr1VLPeD9/8bzXURqEzUkKmQwauMAxLc
	 dMF/oOEOzNBPYZmrpts0R7Lgv5WwCoMJ/ecVJlj9tvQXmYfKvEsbyNMGFJBzcBHWek
	 1O22PjP0I34+j11yZc0i+X9QruWMmuP790oN0SRmyV5ZafJ6S7rKSqwPbki2nHLKko
	 w4GdazsE7/wroqY8zrf+QxjZAXKtVnQo3f2E8WEJcIOY003AnjkWbSSOgbqngiTx5z
	 iBl5ao1vO39ww==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Kenneth Kabogo <kennethkabogo2@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: mdt_loader: fix off-by-one heap overflow in segment name
Date: Sun,  8 Nov 2026 14:20:15 -0600
Message-ID: <179416929243.628393.13902347516696518018.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912065651.59968-1-kennethkabogo2@gmail.com>
References: <20260912065651.59968-1-kennethkabogo2@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 12 Sep 2026 09:56:51 +0300, Kenneth Kabogo wrote:
> mdt_load_split_segment() builds a segment firmware filename by
> overwriting the last three characters of a kstrdup'd copy of fw_name
> with "b%02d" formatted from segment. %02d is a minimum field width,
> not a cap: for segment in [0, 99] this produces exactly "bNN" + NUL,
> which fits the buffer, but for segment >= 100 it writes "b100" or
> wider, one or more bytes past the end of the kstrdup allocation.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: mdt_loader: fix off-by-one heap overflow in segment name
      commit: 3e0d5015fc90859ca8c3a2edacdbaad546969f54

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
