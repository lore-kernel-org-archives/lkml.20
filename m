Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792976100;
	b=yypyrbAKEXiZ7yzhJcxDm5KRZAkCZkDMV8hJWkeBCqLuAdcsSOcu9WvQ5y5DeJ8yVORv
	 is5jZjjknh4sPIzOBpkZ8MvwY/xJ166onZNexwDGQWworkmhSuWyAPO3P65sryptDw29A
	 R1/xOR5ZKdU8HDz7kksZ3mTc479yk0Q6UI+RF0Hruu6NlSV2IqBXCfVlPxAgz991+/vX7
	 ROTEbTky7VAoGt5nA6cBCQlkiVcCQMc3siCQ25r9aP3hJJBHqXFbZDA/qDJCuNRUeCeka
	 +1hDHgLaqrLIxgB78kV4S8cNU5e615Drvg+9Z8iEo/ufFSoBezPsWYtr1X7fRvR88Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792976100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xtkJhtt7gdLqfyFrDYEU8VNnmv2Kks3hOhntWWSBmiU=;
	b=gewrynpNyAYAl3381eNivDlssPuW+CuzA79+ydnr5lAGnbmiir6h6rCTmEAIEQ1GlMZ/
	 xczptfCAIgjLabIpr6hrZOSZFYCFDuyO4pv6U1zSGO2ud4un6LTsUPg1LDSEIvUne9wuz
	 FGh/SbDE5OGWoHdlu1rUuiGkGRVC9I6+76kKFNva1EALfheD4RF52brZS/HoGheEYoamr
	 emtBSBJskB6LiGFdhk1pczyM+Ees+4ES/S38gO1Fo4xnyUSz4GHJr+iykmFI/G001BBzc
	 V9b0ScVf6l4GVIALBzLsFcZPIUuijOxI/sMdVMu5BAeU89LtxXKHc6qWhruRKGwdQ2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EFGdjEVR;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E34A606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E34A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EFGdjEVR
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1505209a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792976099; x=1793580899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xtkJhtt7gdLqfyFrDYEU8VNnmv2Kks3hOhntWWSBmiU=;
        b=EFGdjEVRT2z/k67XUVC38GP6b/AGdWOpLn7fRa6nt/iR7JGqEkm3PEToqMj0f2/Y6G
         EUkccUd52ztIX9awbfA1n7L4ZxPOvHPmHVwTZVWGhjQ97aydmZTDk8njTgRBC3YWanx3
         oaEube4nR7uIhFYE5mXCd4S0nzkFI5JIf7ZbsMqkSSHwfnPZcbRyQaKuyHRGAIyu/EBV
         xN58/WvdgygP7w9pjO+1mb654v+cy2CPWn+byXVoSQEj2hPL17HDipXyCIXLUXhinwRv
         m82OrIqRC/z/f9f5Lkoy4Gz5b/rlxwhUXKkiW+ecay/CVlmY5IHBbFEWvbDsSxCM2HWf
         UW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792976099; x=1793580899;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xtkJhtt7gdLqfyFrDYEU8VNnmv2Kks3hOhntWWSBmiU=;
        b=gwgPAP0kNMhjBR225ytQQazWawga7ngi7YkTX/Ul9Z7451mM6j6RVKHnx9ht3/1Jz3
         McnGwxUSEoXGjp2fmhWamPMgxkN1U+fZpQJCvd+lJM5x6ijD36OMG2x5pIAWqUMPZqBD
         smQejEcz3/Y5jJoiP510TP3P2ZjKmPjY7GnVKYmVtL1JS3n38RLukITviBDB4PtUOnxc
         romYWvxqdnc5pgR+0s1HNG/6aR13WOJdoDrvS4VZBSOk9dBJc2/ZVze1IJOAAUcWJ/S9
         /PtzyDsijT6TarNFwbIc4GASnnrWy0XbuuK3gdcoPQKrfnDs0mQoJVsc1Du3liYALXrZ
         z6MQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqSNxn4GCnmiH0vg92Jol5zqE4y1pqqkcKanf71tqYIh8ZckgdfsN9kpP0n15nveE6yP7HCZz3xQXg5Ck=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKibYLa2W7YWSHzopp8TkbJZGO16lcrik9Yz+/EXkILZgrdbpI
	pkCKwX9b5CglGnuNYE5XfShklHybuPD3bajau4r6YUzoK9SZ77s8pb1Y
X-Gm-Gg: AYBFou0csNE7GoChzIgmtK1/US9BU2562vI/on3+LFxsNxpUDiqTQxK1R4wpWCszouF
	9hNeULBD+nvFj6QLw57wiGuuZFY648Gb7p+x8FMs8QeTx0bR8t8vEao+BTquZjIUDDhbg//nRnA
	rDrq6rEAbQgkmyJZIHGEkPiO3H0DqWKYb3U061XMftHexjMqk/iG/4+HhG9aFuPAxj9Dc7d2/wI
	eWXvqOh5i9awMqwE+eSmGjyn3X+HfwKUs1KJY6Ci6fSEvK21RkjcZbLQPX4cDrRvJB5I4bDoCky
	FLv7TiBc7ibOLobD41F2uZ97bU+k62uM5Zesxh4tuBEs6u/u4mIdAeVzuxJQg5I+geHOoVon0TB
	GyrxtmMUu2KAC/j1aFiePaAH8/Ki31kti0+jydwuhUfU3wVQEuyrNOJX+g4F+0w7l9IQqu0L18G
	/Ao6orUTf1fEGtBZbUoOy+lO3uE0z4DuNWHyS9k5DodRUyvIlh4RB8YJNy9nq7y6bobls1s+Dz1
	BvXADA7Vo6pcLwuXbAlBlN97OZuJNwl8Te5vVj1E6IM3DwxuxN+6OVja4C6pDKmJC8/xQ==
X-Received: by 2002:a17:90b:53cf:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3adeabde79cmr4337887a91.31.1792976099324;
        Sun, 25 Oct 2026 17:54:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebaddd45sm4643910a91.2.2026.10.25.17.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:54:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:54:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/max34440): add support for adpm12886
Message-ID: <004b7fb6-e704-484c-8748-c31a9194da9a@roeck-us.net>
References: <20260928-hwmon-next-v1-1-55b6c5cd8e2e@analog.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-hwmon-next-v1-1-55b6c5cd8e2e@analog.com>

On Mon, Sep 28, 2026 at 12:27:55PM +0800, Alexis Czezar Torreno wrote:
> ADPM12886 is a 1/8 brick DC/DC converter that provides up to 98%
> efficiency at half load. Can sustain output power of 1200W. Uses PMBUS.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter
