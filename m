Received: from mail-oo2-f36.google.com (mail-oo2-f36.google.com [74.125.231.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B7551992F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862867; cv=none; b=lawAG5J5VOkgZRFqi9nPWzEOvO3bUhXn9HIqx7Q9YJ9hajlS2iGQ5uG66V5CjQR3r2fwO05oTljn8i0v6MpdwP5dwNUEGc1YH1Y5SPuVOdNowXMVP7bDTEGuXieqzmRGlEz9SD53QUG/s5H6eNSunvEysRBpGS+aYtHNrB3Q8KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862867; c=relaxed/simple;
	bh=qjW8hwIoElWxA0iUFDq4qI6cCoaWjoffu2xCTdl55CA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PZk33nrUn1c42N7Qqb2pL10Ahfdy4BgnaEaj8diMat4RPsBmoW3IGukiQ/JqBP1X8kh/+KYj/l6LXChtTHYhV2HG2HLfB1v580iklhQStYudgI+J3Q1Y6rHIeiLN4Ku32X2P7ajJn5fAZQyFyZRjP6x9dl03SoQqEsMiBoUGUX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=IUmV1ZsJ; arc=none smtp.client-ip=74.125.231.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="IUmV1ZsJ"
Received: by mail-oo2-f36.google.com with SMTP id 006d021491bc7-6dcf2ba1fa0so798730eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790862857; x=1791467657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1q33kSEPPj9vs/L5DXTf6JcpgngvKm5JTS+mJu9VGq8=;
        b=IUmV1ZsJN82AWuQ9LrabVy6OBSTm1XupN0yzyFSsxFC2L/jAFcKm75c8kbC+s+ZU5F
         F3joDewuGaTizkRbgxeXodeSmO5qxOzsf9agFHWmWEeZOSEkYPeI5GihQiPNdsmhefty
         DdseqsJVfDoT7Tt+oukh9vVhHiZjHXKe6k87Df0ogjviuGMkWRfzP7woPPx2cH0b7/hp
         BWCogj50ff1vY/OrHgmys100QQS2XBCillebAvpiYnrs4U8+cfT/0RqTxy7I4g8LDrU1
         QV0A7LUGUTNDe82WTmoorIEt/ZquzeFen00kwpTvi09uioXSPmNAO7FJvkwb5/sFs3kD
         61kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862857; x=1791467657;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1q33kSEPPj9vs/L5DXTf6JcpgngvKm5JTS+mJu9VGq8=;
        b=fjgO6N2odm2v7dwgRGa3lVLecockemUAelWCq/03CHiksln3XIkpejjgSWSX58vEOR
         dIWNePUaGDDMdW3HdGFvkjnb75xrbjjnLJmcrn8xLfj7iDXszFtbC2d5M3Cd3xqntC8D
         Q8RX6GODZNl8lZJgpb92B+7TQU5K0N3rqbmpeThYyVTl6CLD78s0aYdsAwORrm1LZep0
         mW7OF4nOJ24c/tpGwdk/S9/feLMyVa6kOi60CTu9UXzd8gx8TrwsJvKPsVHuldQxgY9V
         v5qV3JFbN64m1buOSt96cXJqYvav5Yc+valrrKPTwO5oO5m/H+EYxlWwQT9preSsezed
         yocQ==
X-Forwarded-Encrypted: i=1; AKwUvByXsqYCIjhuJYJft30KnriJVtb9uME5mwnDvG1kVDHolU3CNj3m/wwQ/g3OHRPJtxx9O+TqcXkzDiJ/Ukk=@vger.kernel.org
X-Gm-Message-State: AFuF++mw0eKNv8JbLYHET44EEldiLRiP8YDnW2JpykTKfPiEP/1mCYjc
	VBlaqL0XLuEfSzoeI9G4KAra5eqZzmeHStFmlCtRKxIBhEzkGBFTDaVhlELU00M2tWE=
X-Gm-Gg: AYBFou2THdawuT+2UJk9e5gIDmY1e8AL1y7h0uBltavVLwOQdTMuMC9try5tIl815BE
	9ccVCQWK8pv9IRuoQdzjBHGD4ixI6zGMOkp0zhsof54Y/1vlenojd0UbYmHc1P/TBdgg55Bs5pt
	Gi8eeYnxOOq7ttivEBirk9vx0WcxCwOluJD9Ijfx4EICVClnrDSgXo3qTYpYUGcp1vdYhCCV4/u
	MKMRKVdd10UIyNVU/zjdVWym5VJTzfDrQgdoAqUnun0vDfRklJ22NFZAMwWK2gHQ2w28RmJ7FzL
	lEbwAHQpmaSIlTTvO5btUuv4dJUxtNUtyS0NTBmU9TW0xJxjq6G/vw9/2RSlwt32Iu1V07wqCt8
	jJM6EsmYDYParun63IWNzyYxzQGkwC5rZAE9RU1Nli7HLMa2PVhwr3kPrPbkNeHbOl7RQ78fzLK
	e6ZMgzDXPxqjIONsZCc2b7c8efpNRe7EjlFsX+e9hKur6p17RkM05fUxr1ysQ2J7suPuZqkzjvP
	7FcEiK/VatMkR1sp6hc0Urd8q90yQutmtV13vT+/0Wwtai7UvmToCc=
X-Received: by 2002:a05:6820:4df3:b0:6ba:2927:3661 with SMTP id 006d021491bc7-6dcf514de6fmr4675732eaf.18.1790862857501;
        Thu, 01 Oct 2026 06:54:17 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6dd985dfee1sm2647663eaf.12.2026.10.01.06.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:54:15 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, Boqun Feng <boqun@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260930-tag-set-send-sync-v1-1-51acdb36f4bb@kernel.org>
References: <20260930-tag-set-send-sync-v1-1-51acdb36f4bb@kernel.org>
Subject: Re: [PATCH] rust: block: implement `Send` and `Sync` for `TagSet`
Message-Id: <179086285425.1662570.7711958272817795555.b4-ty@b4>
Date: Thu, 01 Oct 2026 07:54:14 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 30 Sep 2026 21:43:55 +0200, Andreas Hindborg wrote:
> `TagSet` never implemented `Send` or `Sync`. This did not matter until
> commit "rust: block: fix `Send` bound for `GenDisk`" made `GenDisk: Send`
> depend on `Arc<TagSet<T>>: Send`, which in turn requires `TagSet<T>: Send +
> Sync`. With that bound unsatisfiable, `GenDisk` is never `Send`, and the
> rnull driver fails to build once configfs requires `GroupOperations::Child:
> Send`.
> 
> [...]

Applied, thanks!

[1/1] rust: block: implement `Send` and `Sync` for `TagSet`
      commit: 06dad60393f20985cc5f24eeed63f965d366c4a0

Best regards,
-- 
Jens Axboe



