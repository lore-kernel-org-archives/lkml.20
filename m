Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA182381AFF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789013057; cv=pass; b=LUDVtPeKOSqmNVWLLZtgiPpen7mMuSWreXx3K7+cooAb4Cpow3tf4cBW9yKd+0nB96Mp0d7FMD+r1FGUD3Ez9TZdo+FHGlKQfYrKhcnjtZtbWaTnW2tAD3CQU0q4wld1d5dK4wJrxYH7l8EvI/saZnU1271zmWxbrZsFsVdxqu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789013057; c=relaxed/simple;
	bh=l/EAaO5OOE4PvdFfUPVYr/0nOobA9KoQhMRWAD/2oro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T6+PXQJflJkt8+YVIjFJbNHome9bIDezz+c1WRt5eb9iXtEoLJ1TN0J33D2ijiR0SbCIFe9sXPNZoO3ZT7dF3hb+Wqt95Nwx+dzzYV++N2bRV09HlpWvHaipciuQZ3gK4num2Hn7snQPGS4i7MQL86u03LhUsmjiT+Dev1fpwGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBDAHhO7; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBDAHhO7"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1801fso1013482e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:04:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789013054; cv=none;
        d=google.com; s=arc-20260327;
        b=WYYLMM5mGBCv5FTNN29D4vbWi4AiLHX5vyj/rHZ8eNZNn406AA1hO5Nuss4lKktp9B
         M6LudrSNdd9U5LA1LHpEIr94J4Yeq/RDLLd0rewHQaefVDPqZkQAHSfX7D2JXQK6nddd
         92/vYbLpVrcPz+Uj5Ogts2YOvlsvDc34EWj0z654LK+QX/88tSrEHptUFpbTT2hbp9cl
         9lsUwyEhe9k5pB8V48v1RyCbVNhl5hMObLE5qXGmuusVWqmfZrdy45IAXzB+9zd/k/sv
         /xI8a7hhsuje/Usd/hfY5RPr/HoMYa08m2sTBM3/InEWn92toIFSpPfyiMy1TYADAIfm
         /xaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l/EAaO5OOE4PvdFfUPVYr/0nOobA9KoQhMRWAD/2oro=;
        fh=EYECUcfnAidE6/qlP48LaXWLBB9Zc12+0gpYFpQELa4=;
        b=BryA4tV/xQLOlJuWYbfNOlIelqJPBosSgffPNtnmq6gVTGw2kzUssPyOfZBEPt+mTC
         vZ4nDm868pp7D4/7fUOtQuPG3SZS0rlP5dj82cUE5l/WtTUOvgxz6CwLEPcMQAhafXOz
         e7LXOO7ZUbuquY5d/wlXQCRKuNXy8Fnm5PL4dhvTdoww8XX359tfF7oCoMqhAOYNvuqN
         pEgw62RtUC/U52EN5YdxTfuwasg2lXplBBe1eYS3wu25Ej6v23KXH3Y1PjC1k6yxgpmI
         1Y+l+ws1HWFXZWkBc6VDLf7vy2B6nWeUlNDlcD4rSAjF5Lb6VBBxTsSxDm1ZmMR1cVFD
         e6lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789013054; x=1789617854; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l/EAaO5OOE4PvdFfUPVYr/0nOobA9KoQhMRWAD/2oro=;
        b=eBDAHhO7SNBvUTl9gFLG2JawKkSkcw8t2NhHylZLkuZ8xcTxvUpyBM6OvS3q72aA7v
         OBYn9g/5fJAD37HfiLmEybbkUafRLd4mDD6Y5XMHKWwwY805d9OIaOvUsVrCqCyy6UmZ
         eM9TnrkeLzDjb0TaDz9S8PdGMxV5uP62S86oJvzR7ayNQc9kWHmHcmZ+Oq8c5sS0eTnQ
         ib5qCZluqH6NQtxJnybP25yCvSt/eV7fEsUT9hIENgqR3ZS+FlKYTSiJhrlJ3ArfNOrV
         OgqrMwq9L2n0boVozthUUOC3Qi4E8uxEGAB8NBCJx1qlGXC8CWansOjed3LDRmyIbZw5
         qjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789013054; x=1789617854;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l/EAaO5OOE4PvdFfUPVYr/0nOobA9KoQhMRWAD/2oro=;
        b=BRj7JKvjCnGJZXQPuis6dOaXuJEIK6Z+Mg6ZNaTOgZcruTXRHfOsEnhewJwtSzcWYD
         zwTbwj6CidpXI+zWhqYXFjAyADjd5ISkXah9+Piwnf69HvHSOMqXMwqmI26B1mCvW3qq
         BRzI1R6cYYDOWmMw6cYxqX3awsquu5mqJtrrz3TYYbqjkeRHc9DMVeW2RdaKb8LYmW1u
         HXIpL/GYAjMEZt8mR8XkhhJAZ80EvoIMd2fMG9BLL5aveja8c+Q9OyuHFBZoleHqqoau
         ca9q0UWrYY6lYAagnUjP/hIPgWOM7f872fML3o3E2TjbjzvPzBdy7BKYFUsvXo/xg0j1
         8hzw==
X-Forwarded-Encrypted: i=1; AKwUvBxfzC2VbWaQMeg4DnHj3urvdT3kTFsFq9+srPRIv+/5/SDR/KPuwvM2Oj7EUR59liH01t6JIg8nqvmQLz0=@vger.kernel.org
X-Gm-Message-State: AFuF++lH69Em5BjrEVqHsxta+uBP2c/Hk99CUYVeiEuad+E9yaM/gakP
	PwOGAvlEuxtVpLAyjPyGceeIpOewAIIOvLJS+Y+9B2z9Xfhj1/beXwEZPldSoCW+LZXb04T2vh6
	4GopT9wbTZC6wX7+8xYxAM0jxb9aGj7Q=
X-Gm-Gg: AYBFou1O66OsLkxn+Tl4g3299NJflWCQLrQHKrluedp4En4pwYdV0eNAgKsfgP5DKZv
	6dTTtFmmfwF2lCq5fpvkzhmmP39muHRQ7YdTBbINdY24YUpkfIZhF45ugyMKUt+x82X1c0HwgQc
	Q8e270x8VvKtoTAnpyD4cCwrtt2ahtQfPzmyNX5sKRGYp4SijA9lmtQ74eemvZE9dBYkSXA5nbK
	fu6NDyDoIGWpJrMs0fVKoG5z+uzgYc7eIyDal06k64yj2OylFcbwjkOmlP2TJ/f7n3Sre9qsfJp
	JDlBQ/N8jwRvmm0AM7Kmkcx7JOpRnTLHOALZlideqGEyy2AHvAe16LuYVBxl4hQU49Za0lOauGQ
	OEbHM8aLMODyWDtQb61IIdpJm4UJxMB6Lm78se7HBXA==
X-Received: by 2002:a05:6512:2c98:b0:5b6:1883:b1ab with SMTP id
 2adb3069b0e04-5b8981081f8mr1128634e87.40.1789013053655; Wed, 09 Sep 2026
 21:04:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905093932.43726-2-sigefriedhyy@gmail.com> <178901169340.219967.5720246601361596190@kernel.org>
In-Reply-To: <178901169340.219967.5720246601361596190@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Thu, 10 Sep 2026 13:04:02 +0900
X-Gm-Features: AcwNN1UzE9U2hCIXKFIf4HaPYtniZ-QsUnDUKbE5iwtT7QXVPA8oUnZsDwBc8hM
Message-ID: <CA+7S2vJN-Qg2PuonpuJBrZBpVib6R7=k9Qmx2dFBG-1Dm8niSw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] rtnetlink: add AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, dsahern@kernel.org, donald.hunter@gmail.com, 
	edumazet@google.com, idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com, 
	nickgarlis@gmail.com, pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org, 
	horms@kernel.org, sdf.kernel@gmail.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The comment in this sashiko round is on an old patchset. I think the
following comment is worth fixing.

> Should ctx->addr_idx be reset when the resumed ifindex does not
> match the recorded one?

Good catch, yes. I'll reset it in v4 when the resumed device is not
the one the dump stopped at. inet_dump_addr() has the same issue with
ip_idx, I'll send a separate fix for it.
