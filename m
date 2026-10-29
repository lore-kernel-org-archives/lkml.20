Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793289009;
	b=GLkYVvhlxJ6KcMOFBkc76k1OXGfWS3fr/qLImWiNwHKZ2JfTBEBfvaN+fU9nbJmselvX
	 HQ++4L43eSRJhxr88+ykEzkyc2W0lfD6qwWmpXJrHRQx32197ImIHBaxPSBHg+m9Go4C5
	 47jIsVSoJm1yf9cNHlxbyHRSSHwG4XVDPZEtNOOxuw7dmScxlpuDGZfEXhKxKMCcbf657
	 HJ1KYQUl4MbnwrkX7No7Ws7qicMFGQqgkWJXo/sPDiDvaFlzS6XSwUKW6Qpjwj+BKswbP
	 T4sRxiY+gBB8i4BgDgI5S+nMnfrhyf+ntzNsxShVwG60hXSsQuSqhWgnO3tdnZDpGEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=KO2zCYqPM97Qlfn39fdTx9d78CfkFYYHVPWw93WarAo=;
	b=OhMp3TyTXVnEXFpGLM3oE+JF+cyTPklUQ/eJJPj0ewH7Et+WdBhUtHUCTOlVtIMEhuT1
	 GO2YhVCtkP3keFoX41gT9ZbksUDlre0NdPIVKgicAvwMSnzySDVpPVFIJOqd7N1bshwzo
	 bhEtkmqpbGlv9su5/8sCEwKIKqKt2AwECTo3j6jsQDPiYBxmLd1SqvYs2V0PWSOaPolpq
	 WGMN/zW8dKGTVgfZ1JOgVIrcm4bsPG6JQYniaa20Q3EZlSQ8szgd5WwnZjOjmKjRUT4Bd
	 zx6CVyzo+dINThT0NMtpDtdUNV9eSo+PwkBkhOFtjEBjMEGpbOUJjPiGf/0xxXOZEag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=d04nNPdM;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C8B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87C8B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=d04nNPdM
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4911df1e196so1356647fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793289007; x=1793893807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KO2zCYqPM97Qlfn39fdTx9d78CfkFYYHVPWw93WarAo=;
        b=d04nNPdMCFhdZh07rdXdALecsU4fJmwyvWTLaH34u3kWvbcz+0PYJU2U4bmYL4cFkb
         B9Tv5/73PMmPa/Z1c/iZTcbLsWovJDhaCfI7eWqeNLDOtHtF33jvcLCdTkTUK5df+161
         BW8INF6Dhaz6UY0VVpE7bKAp9p15nizULbqM2HWxjHY8MS7auDu/JkupScPAkFPxoYkK
         4DgRpAx/vgqCm8o4hrBQsfh4TN5QMi7f1pWDNjy7BiYkvOX45Spddc0y+RsoEk6g8mKH
         GWiTgJjzMNKYFsV44zfC0T5zxdxu00L+EJoU2hoQcPm5C+qb3pqWpDu3RwijOZjcE6Ge
         mwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289007; x=1793893807;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KO2zCYqPM97Qlfn39fdTx9d78CfkFYYHVPWw93WarAo=;
        b=qckhNNFnuyIKAXRGBUhC7ekH3oRc9D5U4bVOjDaXkX478efCxCZoGvZTUVkfuJscJ5
         tYvuYe6knWoduToqRP+c0Scz60q8nr0kDJ+xjEde/NJUMJmeXHcTQZmemvVG63KVnpif
         UJkPZZd6K9+LsGsE1Ccox1l0JQWsvULW/feAkE+NKvHUUlOJdYHo2DyENn1V8dQ9k2NA
         zGDboYJ0StaRuLSBr19CncPi0YWMiGUmtg1AzNaUsze4RAk4mBzq3CBEuvOWwDmCVuch
         Whur7XUBSgAoyxZgYQ1PDI1g1L9G4Bn9xdOr4wkVLGMUf24pwb93C08UNJ40V3qb4xlu
         iOrA==
X-Forwarded-Encrypted: i=1; AKwUvBx3wIkU/koyTCxPXx/gNvqFMtfiIgXlaqWuTdZQHxlWoLPw2plc+Nry0naRtY52PX7UaTPtVsJGfhSFF+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkOBtp/ehVWmx3jLGQMg5EkopEcYeIq3TwHY7i9RcEvsKFHGIj
	c3jWwuIe3Xh69WWnszXGFBEY5F8y6sIj927jXBGZFGdBOGZkKjmSktDNIU5hPoWjZZNnF1BEbOC
	hJEVu+X0=
X-Gm-Gg: AYBFou3k7Xa3rvrHWxQno+6OizexlaElNBjpC+tGHHhnLRkryQJ+SwCQEkIi14kXY14
	J9mBbfe6R7NTNMDleSlHWnJixvVlN4bIT/kRYSFQPUthN3AetRhq26MzEUlIIL+jGNMrmXyP86H
	yKcQMLy/IeG0WC1WRl82kwVwKMpH1YvU4T+xQxo2b/XwPIMnG8O2A0owMSyM4p1UP9oRb5qGEtK
	Vy+M8dRrlG9IIi6yXLVd1fSE8PEpWoslBCeFIu47ROn75P/h/EYTiU4Ke7ZJHmdNSZjpyxM6wZl
	W+14PTXLfs2VcH4vzx4OE66m+VMOv/WjHeISm9uyMxHyncQSQHF+jt9iYaOG7fEVKo8z8zz1IAe
	hH39JnnbeV1Jl92pMJ6UNBSbgo7RBtDwzREProkQ1AUL96TzV9R6SirZHG7Sf8CSTNWMewX3mNO
	NeIiuioTz/KAAYlDUL5mK5ek6WOAUPNcNBM7b2W8XtlEWJyH0MDF2SW/Q5jUjkBheRIEUFX/GDA
	SJmgwLnmYo4pqU3NxRXvvAupAZezetL8qGuSOq3md+KYF8qdI7JOD4YuGLJ5qyCgZrMQg8crjFJ
	fmR3LwwT15vpkxSPFsjzOJyS/NQyyIbw40ZYFFeUfmjAsDUmkkyqJ3zUGygDh5wjZWp8QxxVIAb
	DQclWMxZDeMA=
X-Received: by 2002:a05:6870:9f08:b0:475:e235:905 with SMTP id 586e51a60fabf-4a8bba79bfcmr3909108fac.35.1793289007293;
        Thu, 29 Oct 2026 08:50:07 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a901ff3779sm124024fac.4.2026.10.29.08.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:50:06 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Cheng Yongkang <teel4res@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <179328314078.648427.13761781546953594668@gmail.com>
References: <179328314078.648427.13761781546953594668@gmail.com>
Subject: Re: [PATCH] io_uring/timeout: count cancelled timeouts in
 cq_timeouts
Message-Id: <179328900650.1492023.7191895676873527353.b4-ty@b4>
Date: Thu, 29 Oct 2026 09:50:06 -0600
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


On Thu, 29 Oct 2026 07:12:20 -0700, Cheng Yongkang wrote:
> io_timeout_cancel() posts the cancelled timeout's -ECANCELED CQE without
> advancing ctx->cq_timeouts.  io_timeout_fn() and io_kill_timeout()
> advance it for every timeout CQE they post, and io_flush_timeouts()
> computes the number of non-timeout completions as
> 
>     seq = cached_cq_tail - cq_timeouts
> 
> [...]

Applied, thanks!

[1/1] io_uring/timeout: count cancelled timeouts in cq_timeouts
      commit: 1c8b49851543f41fc8bb18bcd1f15cc93d14b530

Best regards,
-- 
Jens Axboe



