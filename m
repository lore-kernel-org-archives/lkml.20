Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048027;
	b=z59Syy7JRMOGQKyRvPZALFoCDAQyoNdf5S+ndTkZbwcOb5TkittOqEA/4upT8R+qdJQP
	 cW4xuYLF8FtUTRr2iPAMlLKDZdBp5folA2pMQw0lTvX5E2F/NHYMBoT2Vh4P4oob67+G0
	 k3q1yhmh3MA3HxMKrkoIw47HKFghBK7u7Sb06AWwNBD87zQ+064jNoB1P22cisF7dmdNu
	 Fu2oKDscEkS/Y+ca4DvKtYz0keuOdYQ9Zgk/ADzyskbOMKtDiRuNjgxjNm/zYb0HOrcp7
	 +szI2HBCm+OZ2R955Pp/gs/N/d/gFSq3xOVjZGrjUi6iRdryIjU+WzoiWk9Gb0NF4jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GRsbzaKK/G8Nd4aO8k9PJxasRg5rLjQXIgOrDxgxGow=;
	b=DZbqpmR/wYJevKXkHHP6FfLoW2q+WYBy6GvR5Z5rVI/b3v7TsGUwCIz0fgZ1OU+YyVjo
	 HBu/+SMWaEtS9/ldm26ZFd/y1qxE2UR8bwgwlq0ciXoPss+gIN4A0FcayDmIdRTO0WAdW
	 iCb/IMEQ/EFUxqkLkMeqXt9MFU7fi4fH4gdwSf+ESy3GnoPISO5vZ9pDiPAUtc4/v1W96
	 bD38tdwjaC/DI8p/KY5o/unyr376TVs/r/K4o0OzsbV7Gq1BR91S/sVNyt54LKE7Cwupn
	 iK8KAu+I3tWyguLgSsYHguyREMpk7uzw4/kzWK7DDl/C79ODwEdCEeuXFC2sE4i996A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ksq5pE8M;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C57606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41C57606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ksq5pE8M
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so5610762eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048026; x=1793652826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GRsbzaKK/G8Nd4aO8k9PJxasRg5rLjQXIgOrDxgxGow=;
        b=ksq5pE8MZ5XiHqAmyy9r5EYhTPCljIyaoRX18NRH7Q9hMpdL1nolMhLm5rpReJCneB
         76lv7wZB2LM3Ikh7JYeF84d7XKZDTMpuJ4/0Ol8aQ7nZxSPMzDBioEKKK34HOyPbA7td
         mFmwjKgJzLDE/QLl+6l1Ll4aqosUf0SY/mlAvH3H4/IaMqvb2nGuNRZtoecBCHtMNfu/
         rtfy0hrZMNJwfSXnxojwjtwAbYtZaGF73A55X6F3QZOfFk7yfZVEisHbY9UwPJaihj4O
         XzjFJV0sYaO27bW66t3ncn/MOUiGN6jCPd7RK3Ets0R8br0H4s5uhvKbU6dbJWwtJ53/
         AblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048026; x=1793652826;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRsbzaKK/G8Nd4aO8k9PJxasRg5rLjQXIgOrDxgxGow=;
        b=HTZpQMvWJXFAjd7Eb3rOdDRQKWgwiPuGSaRTXWpgClTNL9YyzclVxC4UaPgA4GwKOP
         dvLKWa1SKGTeNKVE+z5lOjm8CP2LwjaJeUTqz5/caes1sZqDJep7qoJxxaP9yTorNh/E
         IWN5Wm8L/Qb8JG/Jil/hVSDI1PLdJn724KZDXJ+NEIeAVQrdJpcCYN/msRn6O1a30uRJ
         u3H4hc+n/gRmX24FAuDumLWaSEvxS9N2thwZsWci191zl+uMPdIjBM9i8RbuPVgHRqwE
         Y6jEPP4xDHtrKOzgA0Ffd9cDWIwUL7A5cJcga1jwSNqVCuYrjcgrdWpp1CQ/RaNVQwI0
         OTwg==
X-Forwarded-Encrypted: i=1; AKwUvByfnbdcvS2ca61doV070JjnL7BoG8xgI3IoaFa1w6ePzE6HpSV/ubfQ7QTSrFZ2lwf8NqK7Ozb7eaxuwac=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiE06BfBaS+XvXwGyoqLV/kGzu26nGhqgbxWAinyt20j4OU56A
	52DBgrwc507L7tKObUvSSWAPrYkYQnBbhKel22qmVgQOytnSMef+2X/C
X-Gm-Gg: AYBFou2ftJQQxCnOuAn5cbhrByJo7h05lSCO+HUMmIgw8YQUKsQowbMWbpk673GerHB
	vOjSP5+SGZcJ4SdgA95Y1nn339wwCyyd2R4KNj+Nrq2Jfiqb8RvBqgOhj1Szs21VAAMGgD0v6xx
	0BBuZdoGZJ2EaPme4ssM6qwIgWQY/Bm4I2Q3xf3AVuYFEy5O3DLa3BDkGsnuIPHiGjsUvuO5bkc
	ZvFJft8qLdkDkcp0EfQA1v+0pZPhlu3hHg1/K7vYqtQj2txBB27QVlAqPadSKu88I1HGxPGRkJ4
	b72Q/zS2uCMRbWhLpvHEtx3u2qlObs5Hey1hOtugoC1nojX3AqptAyZfri2sgoVAVvRVQVPjDjf
	wQhSMRxz6TSMHtEXweVOBDPo8xIV7RJ5/n3Qg8c9RwjxK81FFyTg4gGTIvZyOhg42IO3xwtli8O
	Bs/z3n+1dUv39HPvKy695mQIYwiV4SmvZcgxbBS3ykmdHOU/5MMMuO1oFnJXwL4/zO0wMTqUlDA
	ZXp9vlkEsRWkmnp64mnkZBVdiroo1aCkz0V4D7h2JBpnvpkEgn0+mA+JQetmAh6MA13UuQ=
X-Received: by 2002:a05:693c:4152:20b0:35c:6268:8127 with SMTP id 5a478bee46e88-369e845b089mr12900546eec.13.1793048026017;
        Mon, 26 Oct 2026 13:53:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm51604442eec.23.2026.10.26.13.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:53:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:53:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zac Lanzon <lanzonza@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Aleksa Savic <savicaleksa83@gmail.com>,
	Edward Blair <edward.blair@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (asus_rog_ryujin) Add pwm1_enable for the
 Ryujin III pump
Message-ID: <13ba8c17-cbd5-4c39-9cf4-4b348bc6ca5a@roeck-us.net>
References: <cover.1790512964.git.lanzonza@gmail.com>
 <8bf4a14fb5d3e2ecffeeef2948f7536518f0298a.1790512964.git.lanzonza@gmail.com>
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
In-Reply-To: <8bf4a14fb5d3e2ecffeeef2948f7536518f0298a.1790512964.git.lanzonza@gmail.com>

On Mon, Sep 28, 2026 at 07:41:06AM -0400, Zac Lanzon wrote:
> Once pwm1 has been written, nothing in the driver hands the RYUJIN III
> pump back to its internal controller, and user space cannot tell which
> source controls the pump.
> 
> Expose the pump control source as pwm1_enable, read from the cooler
> duty report: 1 when the pump follows pwm1, 2 when it is handed to its
> internal controller, which follows the PWM of the header its 4-pin
> cable is plugged into. Writing 2 sends the reported duties with source
> 0, and writing 1 sends them with source 1, with the same neighbouring
> duty write as pwm1. Other values return -EINVAL. Writing pwm1 still
> selects source 1. The attribute is not created for the RYUJIN II.
> 
> With changes in both directions, source changes can follow each other
> closely. The cooler ignored a source change sent 500 ms or less after
> the previous one (7 of 7 trials) and applied one sent 1 s or more after
> it (5 of 5). Its duty report showed a change within 1.1 s of the
> command in every trial. So a write that changes the source now waits
> until 1 s has passed since the previous change, then polls the duty
> report every 100 ms until it shows the new source, and fails with
> -ETIMEDOUT after 2 s. pump_source is only taken from the report. Other
> writes are unaffected.
> 
> Measured on a RYUJIN III 360 (firmware AURJ2-S750-0108) with the pump
> cable on AIO_PUMP and the header PWM set through nct6775 (pump rpm):
> 
>                                      header 50%  header 80%  pwm1_enable
>   driver loaded, internal controller    2160        3090          2
>   pwm1 = 40%                            1725        1740          1
>   pwm1_enable = 2                       2130        3090          2
>   pwm1_enable = 1                       1740        1740          1
>   pwm1_enable = 2, then pwm1 = 60%      2475                      1
>   driver reloaded, pump on USB          1740        1740          1
> 
> Written back to back, each source change took 0.95 to 1.07 s, and the
> sequences ended as requested in 2 of 2 runs each: pwm1_enable = 2 then
> pwm1 = 60% with the pump at 60% on USB, pwm1_enable = 1, 2, 1 on USB,
> and pwm1 = 60% then pwm1_enable = 2 on the internal controller.
> 
> From power-on (measured with v1 of this patch; v2 changes only how the
> wait is computed, and the first source change after loading never
> waits), with the header at 100%, pwm1_enable read 2, read 1 after
> pwm1 = 40% (pump at 1710 rpm), and writing 2 handed the pump back to
> its internal controller (3585 rpm).
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Zac Lanzon <lanzonza@gmail.com>

Applied.

Thanks,
Guenter
