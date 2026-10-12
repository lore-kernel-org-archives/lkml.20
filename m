Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9059E4DE716
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791839864; cv=none; b=Ygetco4Bwh+I7esGf/Nk9MteOINgbzBGx5RKB+xwy3IrjXE1JgDGqtAblNUa2qcFou1qZ2vfsdc56b1da8S4u0eEnpJByQEGcq8EXn1lhyT+fB/s5pQxzC4psQSBS+3FtJwf9Sh/gOvI7IMd647u9c6irZY0sDNb4SsNlGqXVhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791839864; c=relaxed/simple;
	bh=ZOaV5j+eXuFSiRY/48xGC3VEaW0+/0IwPIwLqoa+0WA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PnuqUczjSuOIV0JBUMhDwl9VXNFptbXT+c7+xVDCUI3O3rKmlmWSxzqrkq+7WBQKcrlpTuu2H/GPm5PySViN/Uei9Jt9rEhGKW2DfzZGMhpWnTSt+Ko4LNEijzKQt419eTcfqNAYLYzWy0b6mYDo3sUtq9+Q8bQMuk6pB0WWuS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RiCc+2Q/; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RiCc+2Q/"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso5796788eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839863; x=1792444663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZOaV5j+eXuFSiRY/48xGC3VEaW0+/0IwPIwLqoa+0WA=;
        b=RiCc+2Q/dfpmswyVrpmJehN0lyNki4pV09gyLNQ6Va885M2TlXH7ovKBhxII5KAxmA
         ddclO++KwQJpJbsjt0Y3pW8qt3r0Ef8G8wN8E1ti0JqPo3AU02mWFNHSbo9Lfi820W2n
         GlgTXYF4HqWovS+QvxlZGE4LTtgkRf50IsLWGTrU68+mlR4mK6n15z5ETEAT8CFevwX7
         I4sC78bcvHUJjTS/NdWvLqXMiOWdBL5x9hfQ/kzbHcamCI3s9mreJhmpC7ygXAV2MF1u
         6Fl7kqJCoWhErgxTQcSCQYC4xtsAVBuzHI4QwuAIp66o8dqcu85BBRbi2DkEasrW+cU2
         8CXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839863; x=1792444663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZOaV5j+eXuFSiRY/48xGC3VEaW0+/0IwPIwLqoa+0WA=;
        b=h16AKPXhmNKQQeggfLL426+f4QiamoRU+ptDtcI83ngWsCogJdvwCSK58T3b7Q9kH/
         1MMB3CVv9BCEjd8Mr3JVUPDuRYZSQs52jQ2s8V/VauJyR6BqhQ4ll/8u8Os+3/ZKj36d
         A/pRT9dM476mIksWKj8APWws//nODBiPk3D5FJ5BFBQWw/eXuL6YnaIyR5n/buB+PIYx
         o/K1FVABlfN31ZrKLzg8h4cgaIkn/Kp15SRiSIQVJuIveiZw/dIuNWqSGCfhXsdFrsd9
         TmGTfldTN4nlzTkrL3X6cr134K9eYIpOmprSK78nFKSstXu06YG1yAoBwh43L47/1sGu
         Amdg==
X-Forwarded-Encrypted: i=1; AKwUvBx2vx5+2U2FYNaGRPpze27pjeUiGYw1DdiObY51CTwKf4IgbQfDTYys4m/j1yMYkfWcpZ4KFipPg1ttc4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLX/8uRWnlPWc4p/YOrr5U7bFpvfFh3a00VmHoqjsloXKESQ5N6
	5FOsQt+lvKJgNpYnDN2HLPgUAvnXF8+krx/fCBP6ox9S94BctE4cFYV1
X-Gm-Gg: AYBFou1mvGY8hNM2B7+ziNe5/xHGIghAbmv5+yHuFCDHgFfFofHPtlQugBmpdMNBsXr
	c4Eco3W0jZD3XOoNPXorBTzIC5GOFqrOAZIWXTS6UQy2/dImb2hLDnp6D7WLeRQRTvROA8neFYH
	l0Fv3iGGdNfot7b/V1w0ZWVM0Pxh2xd2jbocaOoHkkgHPpUp0SXSfxiTJ70v+/fR7m4W6mmDCct
	6au19IdVU31LjPlWGhAKYAtNme7jxnuKj+Owp89ESY3quEYQ4SeKQvTwiwlLUQE4uFWb0fqH3NL
	hNTQC8vfSDSB5WP1YTMD69hjSrjud98R/BG9LOcObddcKDbh27h0jVV+T6c6JE2kccNlAe9MhMN
	jnTpLbbS94faJntck26mnykJuCI9P4Q3BC3OFygPnUjHjR1FqJwyQTCRtikZGQk8eCBA1h7kzff
	NJztB00aRmTzNfgS7UolspWrHkg0hLQcbECOPjriK+Mm64ma500/aVTt1d0KZDjMQ4TRvvTSp8k
	oSnAHgZkrXp4HTd5bWAiEpHGfiyaQYk0yN4YwdS4U7eF5pTILcH7R6vUe3EH79MGnT6QxxDzEl3
	fdK0sVR8dSF7dAIal9CAq0pWufgxkg==
X-Received: by 2002:a05:7300:8245:b0:35a:7464:6159 with SMTP id 5a478bee46e88-35a74646242mr5454876eec.34.1791839862310;
        Mon, 12 Oct 2026 14:17:42 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e02asm39147488eec.27.2026.10.12.14.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:17:41 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Arnav Kapoor <kapoorarnav43@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: common: cros_ec_sensors: use sensor_scale union member for CALIBSCALE
Date: Tue, 13 Oct 2026 02:47:30 +0530
Message-ID: <20261012211733.575305-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011191641.4e9e2ac4@systembl0wer>
References: <20261011045410.356156-1-kapoorarnav43@gmail.com> <20261011191641.4e9e2ac4@systembl0wer>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 11 Oct 2026 19:16:41 +0200, Joshua Crofts wrote:
> Please add a Fixes tag. Otherwise looks good to me!
>
> Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

Thanks for the review. The mismatch was introduced when CALIBSCALE
support was added:

Fixes: ed1f2e85da79 ("iio: cros_ec: Add calibscale for 3d MEMS")

Jonathan, could you pick this up when applying, or would you prefer a v2?

Thanks,
Arnav
