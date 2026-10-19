Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443773;
	b=SIk7D6KD97EacBT9Rtrkz9+ZN0WZ/xk6wXFpBdHHqN9UHKnl3WThLO1oSoJgAMhCPERM
	 eEKDc7sWtnCGooL827PHrnXOM0Si/bBOGaK/osa26HGfxBXUgsJlGeJjoa7m+PHJ+5wOT
	 xT8l++V6arfEDLHw/AbvWArDp13xAPG2GpzfgBW+dfw3dcRYsci0LLF1fgcoPDMX/7JPw
	 FKNfWteteSXdaRECUTtij8FB7YRVPBK4A7OJVEUAPvuT2mER6X7IzuF7qyIzECXx0aEt4
	 ST3C2GkobJAeLf6H00kfYGWXupJhTiumUBw+SKQeJX8teMGYgBV82MvVKx+7vfJu5cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=xFtfINSonkJB+J7cDg4OJ4WdR4XOLP+Q5XiVEZloT04=;
	b=t9bPNEYHtr9I0XTtENCT0DnRItW+v5DriGSk9PmtFfl+fNJzClTUDJI27nuRT5brfgL2
	 Z0g+U0TpiGnG0w1ObAgul8z5d8oAyV99M+BSKO5yTwBUtdsO37s4fGK/0sJC5mPcEgaco
	 QW4W+WimBGDMGbucJ6p1+feM9+NOm08ceUyMUBt6RojyTcMWSTu8Vywi0igAgG6ZSvBO0
	 o9YiP4YyN5p1IXGEmzSD5XwUcBAO5M09kCr2mbhwoiEz8+FUO2ABVcwrzq1FC7P92ob/c
	 yFb/PqLn8pZYR1GWSD5Zile32kAvJLnW/NnisajL4SqEtZKseXvtOSN+kxb3aWN9kFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=jImQWPC3;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96B7606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C96B7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=jImQWPC3
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6d7e06dbcccso1616913eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792443772; x=1793048572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFtfINSonkJB+J7cDg4OJ4WdR4XOLP+Q5XiVEZloT04=;
        b=jImQWPC3wGvGp7XXq92FOXS7nSbS3U9xLvZBYBQo9tST11xBrcZbnwQ3KGp69jL44H
         ZQUMXcDxaR2otZqSs8GBSsHaPtGUe79c829Fb7P9u8/4JMYyiqlERDGNBUInlVzD3Ry2
         2ckD+2Z8Dstp6mmg4BNF1pduhkKtoVSvv94mDjJQmfUNllTvaeehqERlnDKw3gYN7wVQ
         +uIJ7W363U9fIJXTd2xgs7Sa/JOXqskXvJaV7RvYtSf3ZwwAOwA2NhjkWocEy+OT04WI
         /Qvpb22Mvbf7fYkfCFqFWBbXPPfOcgp2BXw++u4ey7jmfGiqhuVP57ILuH3lU0ZylCH9
         QzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443772; x=1793048572;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFtfINSonkJB+J7cDg4OJ4WdR4XOLP+Q5XiVEZloT04=;
        b=MgzG6+q4GL7pBoN70wHMgIeKNCSLW/R4omFpIxCGK9YZvfNplBxt49nD5JB/YNgbJw
         wUUP5qmZapCPuIjdPoTh6WnRI4Xq6t1VddFT6bmOdck8jisI/6YPJ97UJgDYOvs4nFxH
         4igZAobA3frXb5ck63pl0bBp6RYqa0iiDnGu+8AUhag97apZKQ5dhfyKtEGyns5LjKIo
         FPxrZclEv7i3k+nLHUkxSqPtQ7qPVoXntjrw+cPU89iAq1SarSj959MasceaW73lOv8B
         MxS28yvyFnyWhooAGuBuh7IYyqKde5VsIyFcodBxbSj31yDyKRFjxBHwvWSP9RDYsKwh
         hDNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeCJTCFdnT2j8oPYWnW9T8oLb0uugA2sKiimYnWTz4lqnuckKHVIYvODdAu8CAOH+leTRxssxKyX6i9Vw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGkj558pxBbvpEZOjunuXKlgb65ahG9slELL8B+NU/HpOPjqdS
	xj/9w2sezLuwXgfi1L3kZ97iLrTZQ9XnOQbYVAGG13glTrf2daHZblpOzi2YTk7DaKQ=
X-Gm-Gg: AYBFou0pnkVUrr5CZigRPo7pY0Qkek+DmKK83lV1T+aOSw+ES72ZSFZqBWdZLkCo70I
	piS2f8VTAHi44+R2tB+g1eqc5SzENADrxiLDljkEBXUHyZABKB8XC6Q+NTTqZNxr8Hq8ydh6Y/d
	9offWO9WcyOHcgh3RfN30ONHBl3pcfLp+GvJMnxlZI7DJYQL8ZeiU5eyvtDlBlYacRZsHa5Zlq3
	c6EasvtDYDWgfXsVEpsUtNUGbMA8cRnUlWkdbCXnxGVSOoNIzpT5kD2tTnrAf7Qt/E7+6q2OOIU
	51TB7ElICnCdjvAk4q1ucFLjLvCo2leaTiUhWoguVyO2X9nJHmeIz+5DPA9ksCWdqnOY/kK+fRP
	7b2xX5QhW8SFBspaR/7jsn5UxrzjhM2IKIJE3IpId+x/WPZHC+OmpOfPL1HyPbwJRct9b5EJXmk
	Z5ilzZcGd0aZhu2S9XKuqdJsaJ6wnK5haGcoEscbbxYwZKpJC6I5MgBeUlidvRd/xLpuv12N6QG
	qDbzxwJPafr+L30g2ViysvRroJO5qaosxg0c55D4db9xOYm1wmUFyg=
X-Received: by 2002:a05:6808:17a5:b0:4fb:c2dd:c7ae with SMTP id 5614622812f47-53cc2aa9259mr8493736b6e.6.1792443771712;
        Mon, 19 Oct 2026 14:02:51 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388a5572b4sm7960424b6e.6.2026.10.19.14.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:02:49 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Austin Schuh <austin.linux@gmail.com>
Cc: bigeasy@linutronix.de, io-uring@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, clrkwllms@kernel.org, rostedt@goodmis.org, 
 tglx@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261017171726.601443-1-austin.linux@gmail.com>
References: <20261017171726.601443-1-austin.linux@gmail.com>
Subject: Re: [PATCH v2] io_uring/wait: wake real-time waiters from hard
 interrupt context
Message-Id: <179244376847.3231032.17554903346880483813.b4-ty@b4>
Date: Mon, 19 Oct 2026 15:02:48 -0600
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


On Sat, 17 Oct 2026 10:17:26 -0700, Austin Schuh wrote:
> Since commit cebf123c634a ("io_uring: implement our own schedule timeout
> handling"), a CQ wait with a timeout sleeps on io_uring's own hrtimer
> instead of an hrtimer sleeper.  On PREEMPT_RT, an hrtimer that isn't
> marked for hard interrupt expiry expires in the per-CPU ktimers thread,
> which runs at SCHED_FIFO 1.  A real-time task waiting in io_uring_enter()
> is therefore not woken at its deadline while any other real-time task is
> runnable on its CPU: the wakeup waits until every one of them has blocked.
> 
> [...]

Applied, thanks!

[1/1] io_uring/wait: wake real-time waiters from hard interrupt context
      commit: 5b01d5955ac206e38097f777eff6ab2a8b948c41

Best regards,
-- 
Jens Axboe



