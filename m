Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582271;
	b=C5CpXJpIpuBjxYwujm6NBIC1h4wLp1EFJDQq1HvnSiN6u9K16FDaMNg6an/UtWoQlBct
	 3ah3/xmFOKda/P+V99lNOZQy4es+NEmvGhDEmmpeU5Q0cT7IgNvgoSQ5X2LjIODJS+Uo6
	 SI4brRMUuoYfjBVLTSVA73Z8ioQY9zrZxanj+6njiJido4zZPrN/BsF7VDVgyq4pwKY7R
	 B3iZERjfjarQJ69SIKTFHYFQ+1VJYfc3u7u52lKosNQG69SziXNyM02g2Mz3SyeedvnMl
	 UQH0ELfx0JjSEFJaElPR0NDTujx6CrBleNNFvj30qhBv2YpsjKVJAltG5fkIRfcvrfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582271;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=sgPMa0gfUkHGd4z3V4+VQDpi46qRVCGX1U55gKcCsUo=;
	b=zSJURHILnI8Nz+y7/zb5D1zPjiZ9BCIoQ/oxgDBBzpBxaW+iQydatLbxNeL862fKYJ1Q
	 j9i3C4IowrtKvoxRdcqvdoWb0/pMDAn/LDIZN1927fJBygZS1x2ttWQf5e7jzuVwsTHAc
	 0vUfs+SydK9m6oHsNMSnPvkUMrr37usVN8vfQiO8/DBmBHiLeUee4nNox+j6BrI7L4v6T
	 sfZEV+CPIFWFvXaSBzz4CptImsYsose/40SqUGKal90QB+zhezarQjXtEQ+j/UgN7O7w3
	 f5wfwOl8LSHfeKfkk701bI9uNWXhXxLzxzQ/2ngEw3oxbVXpo5HVwXi3o6hrOwmCVjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PwsniD4d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13855606A323;
	Fri, 13 Nov 2026 15:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PwsniD4d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373331F000C9;
	Fri, 13 Nov 2026 15:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794582270;
	bh=sgPMa0gfUkHGd4z3V4+VQDpi46qRVCGX1U55gKcCsUo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=PwsniD4dQpxIsCOvehTyNAXtJMfW84ZVyioVwHePgUMQyHqFrExRtQpY85htQs5bn
	 kB2niv6dZfJyQ/y5+RghW32Mi+jK5QytdkZPgBrST9MqVW3tn2qcUfE8GEDf8b4agx
	 n7TU69avjyfovkA4xNlQRKl5hwfNPX6okKoETMnFA1WyD/5fBTuPO7BTZy2oNEvzPC
	 SDFRGw3GLcZVsgjyp7zCmi4dBQEQCDcWrd789iIOKN0QkQH9f72lcC5aj5wBmlwcH4
	 KFxGSoLt7inCmlRHb/ErcTv/Vj8V0zmB1nx/YotfkBJuMwGEX+tgf+HoHXDxiSIW02
	 ynO4m9dmBvlWQ==
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] ASoC: qcom: lpass macro / soundwire: retry
 deferred clock acquisition
From: Mark Brown <broonie@kernel.org>
To: yass27106 <yass27106@gmail.com>
Cc: andersson@kernel.org, broonie@kernel.org, srini@kernel.org, 
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com, perex@perex.cz, 
 lgirdwood@gmail.com, pierre-louis.bossart@linux.dev, 
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <90d9d32bd8d44c4f97ca3af4e1bc5481@gmail.com>
References: <5cfd0705da5845b88ffe6d9e8bfeb966@gmail.com>
 <90d9d32bd8d44c4f97ca3af4e1bc5481@gmail.com>
Date: Fri, 13 Nov 2026 15:04:24 +0000
Message-Id: <179458226469.68977.13033139550086904479.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1338; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Huy88cvQigqlAYWxi787wZEnKg9GQefuC/xm2h+O+EU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+q/3smnypgc3b89wtTfbIWf8evWM/3fn+d223w8KtE
 lO3cWtf6ChlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBE/rMy/HeXvJjdseXpWfU8
 /v1HzrK0L6hJvN7zckdy5ZKN6/6GHqxkZPiRFD/JbNqj1WXyfiEnH+XZnXjIbZ5mZ7Dyue7ypxv
 v8TEAAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> drivers/soundwire/qcom.c           | 37 +++++++++++++++++++++++-
>  sound/soc/codecs/lpass-rx-macro.c  | 45 ++++++++++++++++++++++++++----
>  sound/soc/codecs/lpass-tx-macro.c  | 45 ++++++++++++++++++++++++++----
>  sound/soc/codecs/lpass-va-macro.c  | 43 +++++++++++++++++++++++++---
>  sound/soc/codecs/lpass-wsa-macro.c | 45 ++++++++++++++++++++++++++----
>  5 files changed, 195 insertions(+), 20 deletions(-)

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

There's also no changelog here.

> +/*
> + * Bounded retry for deferred clock providers. Clock-provider registration
> + * does not trigger deferred-probe retries, so a consumer that loses the
> + * probe-order race stays deferred forever. Wait up to 30 s for providers
> + * that are registered milliseconds later.
> + */
> +static struct clk *clk_get_retry(struct device *dev, const char *id)
> +{
> +	struct clk *c;
> +	int i;

This obviously isn't something that should be open coded in drivers,
this is going to be happening all over the place.  The clock API and
driver core need to be adjusted so that we trigger deferred probe runs
when new resources appear.

-- 
Mark Brown <broonie@kernel.org>
