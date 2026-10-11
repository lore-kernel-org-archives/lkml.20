Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8B73876C5
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 17:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791740044; cv=none; b=ivyDPd+cdHAHJOujcBDVmp1gDaI9dFvWXYTrpd+9iRlU01ls7cT6HJ4xa55dcUwuVwt0bWlsNJ1NAR6PTiXfWWKZbBaKKTglV4LzUiCHdprHs4lbidmx+nJimRwOMYiTtLwaejcKeTx71NSREq2YVAH/S1F4e8pAdcR2AivapeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791740044; c=relaxed/simple;
	bh=CJLr4pB0xXQD8PTWTHC/kN+Z90gir1+n4RTjMZ5jg+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pVhugeplqIVo74qbr3xGfIlKUtcIUdzJ363IxR27F70rAEhPXfoHsXdmPXRyH/en1GMPba9kXOIcelap/o8DW+YYGKUbDQqKjExZLpHgYqcc+Ka2YbEKZMxgBOeKwl9qnJHarwGmyIBz8akjIXUW/L/jXxEpUam26NNgt+Meftc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZI5T3m1q; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZI5T3m1q"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so10739195e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791740039; x=1792344839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6khg2ySPx5GYZEE9oh5YW3CL1Pu4Rm7qSXlUY8AbDv0=;
        b=ZI5T3m1qoDfaG96sqvPTC3xACK+7geeRMCnIdsZFOHhG1qERvNL33qWjdu/rcLQd5d
         tm5dbCKN4HRr1TZhIwlBxvPdfHTm43kPdBddBrnFg2lIyjOp6MfnbGcp6hRJ36QIxEee
         YhoRZCAG7JnSxU7EUA9sstUiC6jat85G3R4S1SMDEe5ZhbertvVBobzMl3tpG2gJsnB7
         Wn2rxEyeDP3C33IKCPNv+4VNoet+AfoeQyUqRLsNvZEnR7/2RBLt7cu3PfCnwzsZFynD
         fh/Ujpg6vOWFOGhE3MTZhfMb07PMcld31Bq3rFzjgYgOvBF9tU03Ivt8+IJrER89oRge
         6JGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791740039; x=1792344839;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6khg2ySPx5GYZEE9oh5YW3CL1Pu4Rm7qSXlUY8AbDv0=;
        b=NdBbkgqMa631tdPSdOQVAGc0cVEnxifY9dY/L/gL948Myil37CXdI6SXyKFm/ltO/r
         cZisO9d5oICNqAWabXsv0TQqb3dtWhB+JVlIv1nLVPy7eKog1I4+k3p9Qw7mnMP2x/rb
         9WN4CY6GTqwO9/U6drdyiDUi+QF2ie3+c5Au+64owkWpDC3pv23SlcySVlLpJfghqoIO
         Cuwqg21yi6O3ptn8iyK9gg6ZJtxLwZsWeEeGHagKtgrBrXUCwRSqWdHlUp4IT2U4lbO+
         mj8soVOSGLvRSZlSx5TsgtwEP02/Ia18ea+R9X1QG/Dw0cVf+DQ7UwBJ9EmO8Nd7rVIX
         7A8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzgfuBAPqAAYN1ad9vOGozAo5o2LKz7camhHLHOwdgMfVCcIfisiXSVx+JZypHPwYt936Eb0ahWjnWokWs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8LpwnVL76iBul8xtvQS9krwlXG/RFozJT93qc4aEFGDUQo4+F
	sHDW0rrWD9haQ4gDw3WjlOOEBQ5z+47rJrqpPN0h6ANYLJjJm0nDBYjP
X-Gm-Gg: AYBFou1b7dL7c0Dgf3Y/gDRH2bBzzDb4RtkJYBPalOzR0EaI/pdGxc95ywTAyNmDbH7
	ET2akIkEPAZZxmTl8/oNnswb8W3y/p1s9i00wELIPOU2Z2IwTxr6gsKrn/qlpkuE23KepY9OE+b
	PO9K9Lrtug1ctPKj6bkvRdjf4i9SAwYsxFiMKCHKF2kweK/bEsuXxxKgHxWi4PrB6Dr1qozN+EJ
	RiHn8L973zFLxil0dgs3ul6jMdousLETb60ftRk2BGxriVggXonBr0KNsXUzLBe//S2l+l/DdhW
	JKv4D6XDcx9uFwyoOuk82eNJ0WYAptb8CCm0+KJ08kXYmRrqlglMUCuaGAUkbvRsKcnYIjd4y2G
	F3YuTFxUwuFm5D3YtMIHR7sL9jBErdn+dpTMUz0e9jfTMQdCbDMHoajYsvLroNnyu5MqujwAt+v
	fdQzwaZ6xOSA6ReEakDdxrPTJBU7cbyeHR+pV1Y8y4rTGjoeJ+axqZQ6bUYxBtiWNznaIae5JnK
	Od1mAmofSajjIsqJqzmMbxYMmZymR7Tl8+fGbM538S6g7WXnuor66rYM+zH8y7CDkkK2L2n6IuW
	qQrSlQVo9QNj7KQgWJ/Ax0D8b0Rk1FohMJjjNtcTGlzxXPEmWKkiiBNSQj7ArtzaAK1WH5a3pKf
	nthJP+7QAevMxHObO03lvGYeylLp/pz+gxqBKDts7ig==
X-Received: by 2002:a05:600c:19cf:b0:4a1:7b56:1151 with SMTP id 5b1f17b1804b1-4a18e48f00dmr137096565e9.18.1791740039242;
        Sun, 11 Oct 2026 10:33:59 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18ca51465sm173866565e9.4.2026.10.11.10.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 10:33:58 -0700 (PDT)
Date: Sun, 11 Oct 2026 19:33:57 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Jonathan
 Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: imu: inv_mpu6050: fix kernel-doc warnings
Message-ID: <20261011193357.51c393e4@systembl0wer>
In-Reply-To: <20261011045754.358335-1-kapoorarnav43@gmail.com>
References: <20261011045754.358335-1-kapoorarnav43@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 11 Oct 2026 10:27:49 +0530
Arnav Kapoor <kapoorarnav43@gmail.com> wrote:

> scripts/kernel-doc -Wall reports several warnings for the inv_mpu6050
> driver:
> 
> - inv_mpu_magn_get_scale() only describes @st, not @chan, @val and @val2.
> - Eight functions use "Returns ..." in the body instead of a "Return:"
>   section, and inv_mpu6050_set_enable() and
>   inv_mpu_data_rdy_trigger_set_state() do not describe their return
>   value at all, e.g.:
> 
>     Warning: .../inv_mpu_aux.c:87 No description found for return value
>     of 'inv_mpu_aux_init'
> 
> - int_pin_cfg in struct inv_mpu6050_reg_map is documented with a ';'
>   instead of a ':' after the name, so kernel-doc does not see it, and
>   user_ctrl in struct inv_mpu6050_chip_config and startup_time in
>   struct inv_mpu6050_hw are not documented.
> 
> Describe the missing parameters, members and return values, and convert
> the return value descriptions to "Return:" sections. Where the return
> value was described before the long description, move it after it, so
> the description is not parsed as part of the return value section.
> 
> With this change, scripts/kernel-doc -Wall reports no warnings for
> drivers/iio/imu/inv_mpu6050/. Comment-only change.
> 
> Assisted-by: LLM
> Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
