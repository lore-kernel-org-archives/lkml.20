Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260467;
	b=NgTws3SWeLVne80kC+HGAirqL80qZzHjppL+2+5SEykPcMsJZOBbvPc91b/CEQBVk5py
	 /MQeZt6/I9gN/W7g+aS1k/F1EEx1OypZu1yoKSZnCASOmqtdA9OK7lP6aTOIuzQJiBCyI
	 4/Saf4tSjePcm4X0caGyiHw6rzEK8CvylmdDjH1Hoc3/6HiUbzU6Yud9HMr08jZpdrMMR
	 6boscYeltcppWptIsE08lpXQaBn0sfvkmxPIIxl4+LtCKyyB8aY6MpeA39M2RZS5nup/f
	 U+rWf1OiuwooDihdUDjpSANYrI01Hu82Fg18rsYY9YXXoORs9c1a6lSKz9vSDztKoTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=By4KURhizAFsUCUD82I12bXsDStdt5cAmT5yhqtFyVw=;
	b=1BqTGtossuEOBUyXLyiztLlH5Gp3eu/NzRGL2MizoSTQZpqTUm+jlS1yLupgIvblVuR0
	 pCGzmRi7RIdvQNA9LKsCmEBPN//8dEXzVYxELtSm4XOvqXhXrF8LCsSW7CBaMYWtvoTNC
	 nipvrQ0ofbX6PeCdMGD9m2fJIyeBG7kvtvE/+bc3L6puvLTxUp2JzTeD57bSbWZm6mIPn
	 3mPMhSQiTI3HI146uoGo4NJNKxbhCSYAR2AeIYMaEKha6WgRQPn4+WIwwKjOx0EQ/Jiph
	 oDSy7q2ovfLzCg6/hW6uE010augHknQQKQUP2j8wSRtp8QDbGejZx0F9t4v+lWXTXHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A6myxUpH;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305F860A260B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 305F860A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A6myxUpH
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso722246a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794260465; x=1794865265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=By4KURhizAFsUCUD82I12bXsDStdt5cAmT5yhqtFyVw=;
        b=A6myxUpHu+Dl5sOR5LPhYJSAl5WDkKGLETqyxqOhDqdtuA+FlC4ZbWvNWnX1VYFLLi
         +acdmzY7UW6W8txrfzT9gLMm5haMYl3ENRaHNf9Zh8EJoXSGQAu8IlWPfd6oO2Db49tp
         WT9hwp/tDx/7z8+PmqPT+UGZ/+ml/UtWxdDzTmAHvoJoG0NZzN84R7FVkUYVULSDkN75
         XYDVxtmJioh/Lt8AJBqx3trD62MJJ/QpSbZxP8MmhqYsUj9ij59LTXbUiXFJjc+Jd1Cz
         +7iplAf2ydDkhc7ivsuqG2zTqwZ+qGfjSZ7Mu2j1Q7JVRss1L0/zBvSPVWwCKILyg8O/
         npQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260465; x=1794865265;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=By4KURhizAFsUCUD82I12bXsDStdt5cAmT5yhqtFyVw=;
        b=xiDIO4Wvr/FSxxLPgYkxtnemKGswPZWhVf2g5Y2c9xdEj+peheq9Pm9C8yzx4DHS97
         2Ci5FmZQj1ezw5jpk1bbKnRTFpYfJgxHIeNjKyohP9BAGgmJI3qt4bcCIZzERh4tt0pm
         2TqTR00TnJdSmEhl2DndjhGuKkxdMhsIdgFAqCXNhBoB1s47eGFVU97KJKgX/p+nLLx0
         Wh3xgVcK+5H3TXfSqlPoNwOUeFukQjpJEaR91iZcTbksz4sF6Q+kOkgVHOsDFkw6j3B2
         kHITPMCIZygqr6vWKtOEpqblNfN7t3eGAhcqgENLbnycAdkbw9l9PjZOazYny9D9J/LY
         vtGw==
X-Forwarded-Encrypted: i=1; AL+hErE/6py15A9PbTCbwXl2QJeNsTPWzTbkFHNG9PcNKfkcqxuf0Unwka9i+4ZBZS3vwWAnd5jRvASYp9w0SUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B/RdtUrFPGG75oLUtPBC5RT6tpwpQa6wHnYESi/TZoKgOdlZl
	En09IDDmXEiXtybSoTDnCLaVIrRffU8x/fNGgm2i8rwu4wOaujY3l8kLNNRdlc5/hAE=
X-Gm-Gg: AYBFou3NEalAw1y4qnyLaqm+GwE2AmlpFQELayHrzliitOoIRqvnjEKmZXqHikW/pXM
	e3EQy/XQB7YLXTUS9U+Egd+8UPa9PKds1lVgxr/LYenLeI/HNs8TOGiXS42uzNCplqIiKTmLUyg
	oFbKprkZ19/GWibJjiCuii62NMbJCwA4HNJvkhqgFM1cIKNGHSfAQx15AAT3cu4dsR6Fe/Jkgws
	3VMlorNeYyTEdJ4xACKZHeYhnQqGLFqFECDGyF9PpDLz2k9D5gWLmiYrjHUFg6yIyygCagYMNeN
	uBgcJpLSx+s0h+xtaBLkoTTsqkLtpHI8mOs+pidstHsGYtGDlEmGq9HPrbAOjA+LMSDGSXvbQmF
	pJXbfHW4LTQH5BnDFrYUmYuKZG5NvF5/02udEEiQ+V56UOLhXjjKNBqkeB1CubLPJCo6gnFIye/
	WxVdEhkkLerrYsHsdR9++ZwG4y6eK55V4NoFeaicsb7JdiKVkOrXcfwcKqtt811djcc/PdkVduL
	pksL4SlXzvarCiyknuW71RnL6SQFN1ZLlAoWfb12HnahYDYvaMIXEyu1mVqV7ZVFVGySK1zaEOh
	5J+SHYks1qkLLHXKgYb4h9aOFg7lcwOMf/bvkXe0mCBwZdhmtBqgkC6s0HfHk+4yDks/mZlAMr/
	wjyvFeXQMpvLh
X-Received: by 2002:a17:90b:33ca:b0:3ae:2969:903f with SMTP id 98e67ed59e1d1-3b166cd699amr991916a91.45.1794260465496;
        Mon, 09 Nov 2026 13:41:05 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16903a7fasm366974a91.3.2026.11.09.13.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:41:04 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <tom.leiming@gmail.com>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261105021351.2295547-1-csander@purestorage.com>
References: <20261105021351.2295547-1-csander@purestorage.com>
Subject: Re: [PATCH] ublk: optimize ublk_queue_cmd_list() for length-1
 lists
Message-Id: <179426046337.144457.268870608872473898.b4-ty@b4>
Date: Mon, 09 Nov 2026 14:41:03 -0700
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


On Wed, 04 Nov 2026 19:13:49 -0700, Caleb Sander Mateos wrote:
> For a request list of length 1, ublk_cmd_list_tw_cb() is more expensive
> than ublk_cmd_tw_cb(). It loads rq_next, which is in a separate cache
> line from the other struct request fields accessed in the dispatch path.
> And it dereferences mq_hctx->driver_data to get the struct ublk_queue *,
> whereas ublk_cmd_tw_cb() gets it from struct ublk_uring_cmd_pdu
> alongside the request pointer. On the submission, ublk_queue_cmd_list()
> can cheaply check whether the request list just assembled has length 1.
> So pass ublk_cmd_tw_cb as the io_uring task work callback if the list
> has a single request and ublk_cmd_list_tw_cb if it contains multiple.
> 
> [...]

Applied, thanks!

[1/1] ublk: optimize ublk_queue_cmd_list() for length-1 lists
      (no commit info)

Best regards,
-- 
Jens Axboe



