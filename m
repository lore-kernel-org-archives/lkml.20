Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804854;
	b=WFr+N5guGDGKI1AjitqWZEIlV0f5v8PxWuUfIXwfsaqu+mmlC/LjknBcBeGhg9wLQUUE
	 lEwGKnz5gIMMo28ZuVdAdfx9OwefW6ssDFQwVzf8kPU5wuqCJSpEn59e9CUhi794qwIz0
	 +jJPVSqPFWeGLojDObTC+ckEcgMBe7zgOTEbnphzx843qTysgtB9PCYku3ZB7PMGXEX/f
	 oAAOtfReYoelc9QKDoO8rCDZwh7ON0ynhw2v7BRL3UIob1YUAfg5FysWCUJFNc0hQ6y1I
	 T1JNYpD6l/3zdlkAp3baWEtYKcTFreQKZpp9Yk9NEejii2AgMO82keksomTzySM0UHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=52M0Mx3QqLQFvHEpAisibJWPHYozvMJfANyGg7k/AzQ=;
	b=YSJOhVmlhU/BhB2Mzxf5kaEEEK2X/ANYouv+p7i5K94S8kPt5mVdQMHiosf7oTlhkjzj
	 sfQJMN9fYgBCbPOITr3rZXyL47ktEqug+18hgbNp/udY27Hz0AB9/vR1Dn+G5hnEY2yBN
	 I/OXIopuprJulQjGjU76zvM8+e8mBLrXIgVg5EsHefLk0ZO+5cPrMlPfXQ2LKAoZlxF5N
	 jCKhw7mrn4NnsmczN68GMhLVjFssjGeSew05zHoMLU0tGne9INbzVFpd8Hf0G9FVBxUXl
	 PbI6yGctw83O4QeqR6CFBf/fsB24+rtGHu1Sd7rGCyTYZERKkeoMsLm2OBFZHOhhQpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KOx9SHdU;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DEC606D80D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84DEC606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KOx9SHdU
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6de2f213b7aso364849eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793804852; x=1794409652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52M0Mx3QqLQFvHEpAisibJWPHYozvMJfANyGg7k/AzQ=;
        b=KOx9SHdUEll96Op2QsIzCBrIWWCmZ2+ruKEdyzkwfLr2LjnDrSJIV4Ay9x00LI/xDj
         eAB4pYrp3HN1ACvtIv8hAR7KIr3wdGmByYgXxUn0nrT2Zz5Hv9gxFWGrNl4ryqg9U/Dh
         5cQC77vJkN3xKzbs9h2/y2/o9Tnddr3FsL86inDGwNQSzTPfE76upOHgw7mzAc2GXfGS
         GWQyCmRGzR7/y0LupP7NQalHleWahuN6h/3rtQZeDG6dLNO2mPcziU2U0xTUb4NjL+80
         yVEtPauJFpSjvnaRpCLFcWS1f3bwVu64DfY5zzrTSTAqKvNzcLFIL7hJF1lJWwv5Lauo
         hFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804852; x=1794409652;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52M0Mx3QqLQFvHEpAisibJWPHYozvMJfANyGg7k/AzQ=;
        b=QEuKvacXr0OZS4lUCQ64GmfXXyLUUqfWdLcNOiPx+9ia58EdaPpkB7QPKiC9ioZVLB
         n0w3HjKWRhmpQqL/5wUdIX0ZT1NtY6CnT8pNKjcQSpejJTWzIZ6Wxcxgee9vZlow/Wmw
         RLeS7wdWtpcZjTURfTajihOH2dcqz3ePVTDI572jB/he2kjllxksmR8i+P5cRgH3mnh9
         LL+ZqcU+iCA99GZyZbEdLRG8crKeg+/+nHPBLzp8YV8jsfP5XKu2mO0LynXz9ANUSDVj
         nY5WhVpUxn5e+0qL4kTgg+u+R/eDSgsP/ZTlgxw/L+ApyuHUvmPRnVR0oouTYrJzdKfz
         dPng==
X-Forwarded-Encrypted: i=1; AKwUvBxkU1XKtRkPsea/StySzJEedS2a8rikoHJDlWJwOA0C7ru/h6/Iq+CHfimFlInXyDxobmCyobk7R3O/hSc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BiDJQnw0wz4Pa1vc8ditDf2AaDdun9uQKG2EOnbQnz339nqPi
	1V+4USyHBd+mLdcTsV/pHPrghI9JweEnCPeiXR3rEjik+gI7Lt2Jd2iD/WfChDfVYRw=
X-Gm-Gg: AYBFou23abB85ruZCaoeux+da8c/fe6lLFf49wXpSP3OsLOgmAzojqkV21t2aPKXfdy
	jHtiutpja8cnjr0JNEXtNcrHFNZMsI5aYs6Ow8MGIPecSvtqdM2c7AhQY/9Fyr/QkCBzVVas0NA
	qMe1m16US18le7hYpOklX6N0kt3pnsZQLQV2K6YtzCfKHNCRzYok+G4wPBv8VRjZ1L/MvsG5E+c
	2wpIzvh4seIj8AO3ztjOTPBIyWId4lp++3i23gMxUIGuDXbhi3rfaJ8snWi7+han2/ncnuFI9VC
	xMQpSj14xF+qwWckRj6mnvDrhvNIwjlRfIhPPgf/O3CM6bu8tO3N56qkR/qwFV+Dh/2YkfMamFR
	ieKGEqgvl2on2T/gO7uROpU9IK2wqYjazKBVIc357EmXaDiIXEoARRRTOXHGfrpE6laLhKREpUe
	YU3GRcKaUwQDlDRo1YnsjNnBJfbQULAjbIVPm3qWNHK5bw0xpm7I2BI7xf8nbLynBwsWvyKl7vi
	kQ9jUzNYwn5mNl+BuRc+ncfnbayJGf9Ayy1qOg21iPIAsUwTiGn5hdhRMyUYt8TLID9HNyG0NzY
	2+J8cbGJjaUxbFJo+f/jzc8RU9jhpOzPF/eD4jNzJ3p6Ietn6jPeaXJDoM2+shNG5Ps+i+O++f5
	I+wtAysLiTA==
X-Received: by 2002:a05:6820:a284:20b0:6f6:61c5:d929 with SMTP id 006d021491bc7-714f29beb3emr6788172eaf.38.1793804852411;
        Wed, 04 Nov 2026 07:07:32 -0800 (PST)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c0cdb22dsm1886033eaf.0.2026.11.04.07.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:07:31 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Sasha Levin <sashal@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, 
 Breno Leitao <leitao@debian.org>, io-uring@vger.kernel.org, 
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104144623.3803717-1-sashal@kernel.org>
References: <20261104144623.3803717-1-sashal@kernel.org>
Subject: Re: [PATCH v2] selftests/io_uring: cast optval through uintptr_t
 in mini_liburing.h
Message-Id: <179380485099.4021488.15926225621505501263.b4-ty@b4>
Date: Wed, 04 Nov 2026 08:07:30 -0700
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
X-Mailer: b4 0.15.2


On Wed, 04 Nov 2026 09:46:23 -0500, Sasha Levin wrote:
> io_uring_prep_cmd() puts the optval pointer into the 64-bit optval field
> of the SQE with a plain cast, which warns on 32-bit architectures:
> 
>   mini_liburing.h:272:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> 
> Cast through uintptr_t, and include <stdint.h> for it.
> 
> [...]

Applied, thanks!

[1/1] selftests/io_uring: cast optval through uintptr_t in mini_liburing.h
      commit: 699e7ba5915c8b2c76e257e157464f2bfe7ab8bb

Best regards,
-- 
Jens Axboe



