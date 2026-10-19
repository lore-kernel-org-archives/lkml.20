Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437186;
	b=kddEdnuAEORcvcTsCQPKgM5XRiO/OKIfaB5IU9tfH+dNHyRQ2CpYg5ylwTtCO7Ew8473
	 FUko0il27TRY3bxsYndhLZ6mnPDqyUFasL54CeKty1FqtgFtSQmokZ4WZmJwr5ybBMpt5
	 RltuxC0wJ5RnqQ0lshgiyBpAQ2LW11nq/aryoMa+jPeax6ubQT/jJQnA7/PQPavsrb+ok
	 xcM4KSQ3sqRX1bQKfRcHqLHUKTVmOoKdPEX8JCPbBrmWcGqOOUDE1068Hcna9fFUFJfvU
	 Jnftu+NEHmEZeoWeQGMClUlqf4s8WnBB48ix6gByjJQTxZ4HM5x1XRpF+hc7HycpgcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=JlYuJFL698MPXVE8UPk93QJm/Q3q10vd5sQJv1hUa+M=;
	b=v/Gr+Z4az4Xb/Qpe3QZ0tYit3X0P3nfdgnNynWrFoIW5dyhj51uql+MoSM6zvPKB7JfD
	 aqZqZYgV5EcfORBmCiXRwjJpU5c5lQFsnSbBe+f4n9eEBSgtKmhby5MfibkAAfabm82ep
	 VcC0MpNZ2wtU43pIvds9BZWYOdYnP5wgbRRH7lTu7dwTKeWrihP4A/mjoH/F93DXiIiYG
	 1f/oulcxR7mtHeCRRQVxfSxM88tZxgS9QPleFbfoTw4mFfH7aBNGiOM4le+Xd3CPTyd+I
	 zXmp9RmXsm1deXadwQaQQNKDKFmDYXuno2InHYJiy3sH3wQ7L45atRiJR6649NmbVUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=ehcUHhqd;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E9E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12E9E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=ehcUHhqd
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-84a248254f4so648187a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792437185; x=1793041985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JlYuJFL698MPXVE8UPk93QJm/Q3q10vd5sQJv1hUa+M=;
        b=ehcUHhqdv7LAsfYWK9WpM7vkkCvXaZnvosnqo7AqRtmWKd2hRMSZOu3mtYiXX9DUB6
         P65CFuXOdhVpi0F/LS+ta328YpW80vsOPoSyTfqu6ncXmNMZV9tSS2gqfpV4arVmGhsL
         5WamlmOYi830m0yrB++Shi5d8uG0RhafYPdWNeEz5e4E4FavY+SjM3r8DgunhCWFwPSQ
         OiRP0GXzSIQ0LZnmya2uSeQoTWMib2scV+qCTPOkOasY4Lc7AeWiP1KizpST3UUCwTde
         /sNkvtmmgPkdlgido/6lO7l2j+Dx6Zp9u/58DRqnbvcQIPJB8bmgAD2MJSOROa3EJbol
         ASaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792437185; x=1793041985;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JlYuJFL698MPXVE8UPk93QJm/Q3q10vd5sQJv1hUa+M=;
        b=hDAOq+hojIBGdMWWiJnOUGQPfF8qyzgmmOAgp1eJgeo5zRNLqaTQJFKNaoF3MIvB68
         z011uWx6XYgE/v+C58I6gN65DpirqZ6E4mypd5c7KMuK7LHEelnHS6FKDgbH5PO+NSKM
         EGs34QW1vxtJKmCn3hLfvfgk3EfuvZQX+Jtov/GZ3X8UcQKS3Yntluq8V2p4KWo9Xl8w
         qayqanUhFvh1I9EO98t35lCanrUT1J/2a5jSOBxW7WYdBDoJdp3hQWEVCjxty6Xaf5vo
         OZHzFR0wirOnWixJ2VSLMa2Tu8dYVRJsC3CLBd2X3B0AmnAeE91ub/zlIbYnSs+XJqik
         tD2Q==
X-Forwarded-Encrypted: i=1; AKwUvBy6IVQWaecT+sB7Z66LZHV4Ju1AyHIcHpOp0qsqkPrUxEOyeNaJhxnVBeOoE+R0c56TZ3EXxQ+2Vj40F5k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPsUWu6A8iM1gERDD3i/UJpOe+RZc0bSm3QHWbyePgzAwlX2u7
	znRyMopPtfkVgKd3rCuN9KvAbO4uSuNyPBqcq1jHp09VpbLkiOcwLV/+NlUzieNTPyNqa66B4Os
	5YGAFNtM=
X-Gm-Gg: AYBFou0cXibIqPlzojsSIkNjhTU8uzMG+w9OZgzmuAZhvRaAc8Gb17ZlrqsnoTsBKUC
	G2eypMyW2BjmhN90EZxFyGCDninmZDKjUffskUSW2mlld9YCXe6xFRE8YMqsnDNE6i92bC4e/4l
	Ma1oT2WV8URZM3LvXJ8LGrZiyaLmLcLEFwlR/TjWoRVN19RTTJJD0nVTpEj+41HX6hDeWeEdDHK
	RKjoBDc69+UYYwBYysslZ+/ZVfsaga9WQh0WtNT3k1Y1v2mW3RKntV80g1VgKEvTCowtdZRMDlc
	OBME+U8XBp2MG0o2AV4nkbpAk6PwPfmL0bGGA9x1UJNv9dWj6U9Y6uxt6JGQPwh6jgAqOwKqiCu
	SCJRxPl6V+23UYeJj9v7no9sJya7drtBTv5rWK1WMhb4FBbkdHsyStUq++/S8HvjbM41+WQs7fm
	Z6Ly6W1EZf82y83KqB7TVAccOA+SK9RqMwP5Gtcczg2hgyK9cAGdO36tQPLV0wqNPV60seh3dOB
	K2+QnpObgM/AIZWYHvIFCFoSl1r5r5us9iqIwICfh1wHk8Y7AJyaBTKCmKVWlFs5Q==
X-Received: by 2002:a05:6830:6738:b0:80c:d34f:5f5a with SMTP id 46e09a7af769-844fffc14b7mr6946604a34.19.1792437184957;
        Mon, 19 Oct 2026 12:13:04 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8462659e3f0sm6669149a34.17.2026.10.19.12.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:13:02 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Junyeong Lee <jylee5498@gmail.com>
Cc: greg@kroah.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261019152100.63565-1-jylee5498@gmail.com>
References: <20261019152100.63565-1-jylee5498@gmail.com>
Subject: Re: [PATCH] io_uring/waitid: prevent cancel reference wrap
Message-Id: <179243718143.3127071.15080151622998954631.b4-ty@b4>
Date: Mon, 19 Oct 2026 13:13:01 -0600
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


On Tue, 20 Oct 2026 00:21:00 +0900, Junyeong Lee wrote:
> io_waitid packs the cancellation state into bit 31 of ->refs and
> uses bits 30:0 as a 31-bit reference counter:
> 
>   #define IO_WAITID_CANCEL_FLAG BIT(31)
>   #define IO_WAITID_REF_MASK    GENMASK(30, 0)
> 
> __io_waitid_cancel() marks a request canceled, then increments the low
> bits of ->refs to claim completion ownership. When another path owns the
> request, the increment remains even though cancellation returns false.
> The request remains discoverable by cancellation, so repeated failed
> attempts can wrap the 31-bit reference field to zero. A later cancellation
> can claim ownership and complete the request a second time.
> 
> [...]

Applied, thanks!

[1/1] io_uring/waitid: prevent cancel reference wrap
      commit: 98787d3fa4e99564d2b2bc21255b21f670c450d0

Best regards,
-- 
Jens Axboe



