Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956376;
	b=k2oT2Exh4slNuBAIbhj67S7U0MK4bTmOn+oaReWkoZl5m1D0ishajoxOFBEGktAC0R1F
	 IHNq7/jipI2jBKKn5r4610EiNibM7z9cacAMLh+fwLqAEFPecN4dFq2imH+WM8XkJp8HU
	 RARFhGFZBSeyG30hueBs/OF4mHmPekjmVdR/i6D4ydV9GvTG8HCLZRYmCgEVMK3L1vHhQ
	 PEp22KdCRDSRYHLabCzM8SCweGoS7m6UrqMB8liGf9lf9ta1q6FWGhK2nfbwUmPTqDdCf
	 1u2pbHYnsKKBnDp+DGf+xQoknio3FzWGOqCNRkxWNmzs1XTENbO+pm1kx6rYkBbX9EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fmoyspqstw2/9PiOOpzl/yM+dFrdSjNpOnDbiAxrbfI=;
	b=mQYDZag7bZH2Ip6QV3Ofsx3POf5BHrOBtBfecfG9/YRiWPblP7hI6ic8ZlhECoSKRGK6
	 owhnHeDYRsEpYZd46e0qeRrkzNZrYh6isfXsNZYp4lFSwv5dMCzpORNJg3EOm00TIBD3Q
	 CwaBT5WYJhXvjre3zruxlq0jMVzpc/8Uld3SYxRiK/F3GZkZC1dHdveYNkYdwQqcPhvmi
	 vXt2quN4WrvtlU1Zy2s546NIQgRzZywPtylb1AlAlVfDZZPGQn/9RMxkmY6JvgANQYhGr
	 OU+Om+N9u5ieKP3jNKdxKJ1DIv6O0D12/wLePnLOGrbZI4L9DCth0PQCNP2IFkOh23Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tomeuvizoso.net;
	spf=pass smtp.mailfrom=tomeuvizoso.net;
	dkim=pass header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F7DCHBDW;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331AB606A33A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 331AB606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F7DCHBDW
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so2871735e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1793956372; x=1794561172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fmoyspqstw2/9PiOOpzl/yM+dFrdSjNpOnDbiAxrbfI=;
        b=F7DCHBDWJZ+4W4fYCOJAzTGIPUZxKEM3GQC0UOoOPoAWs2sXUCP0NuFdJ6wVu2Os50
         3wVL8GvuFQE9sHoxI8MVjxE6iTpOBUpa5gDiv+DeuFw4+Jk1J47d+J9iL2ailF9aRunt
         evoZoHyEB8egMEAfX7568Yz8zZUnzf91RfioeY/omDmPu3ZKADe6339IZJqYWVHPc26J
         z5VNCpWEHO2L7dXDObSFERCeTlRP/WQ8092QYY/fghw9MpgBbnJG83NLZf4fc2Y3H0ed
         Y06oe2zadbaLO6k1LP9aUY+7pkHtxwkzuUfNJKb94ZaW874HUt18oTsDZzdhU8U4MzRj
         c9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956372; x=1794561172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fmoyspqstw2/9PiOOpzl/yM+dFrdSjNpOnDbiAxrbfI=;
        b=bVtlIlSzAjMpkgu03/Cm7PSVX3dy8o11f5uZnkkOapjiQAWsIk8NSuE9LSZmcpr+TV
         pIDZVveRvhFCh/XyK7ZlEyltt07rW74nlf+xAXv3pdbcQZXkoCq2waM8DzJqgJ7f5Brq
         eVIgqqSjhsxHuH708r+O+JfC4/mzjG511e6xgTKR0quvfRSRUZ1/eSi9amF87nvO7OZb
         BhGemeCwdpmzEQ/FvA8wpBCyUzwdq9q8sbv0k6A2MZqbzhek9ZwMifsyhels5u//mQrG
         gV5fTdBP4KAxemjmxdiPFEj59QroXAhBI9Z162jrBZsS4m6t2GCBjQK0ajoE3xkEz2Du
         s3ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMwytkgya/YmiWqDgrwesIjkudhWuGgnY44Iox2cEa68BljKVBjNfaL7Tkq6gYAtNeQuxJrXEzq5w7woY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aYBCf+42+iBN7xVZqpXCOEhOBjJdLXFWDwoH+cUXdOMOKX8JN
	FyIJt/fdffLdNgY0PWIxrlmTC2GkJ8YcxIdDEYsRZGIiGBh1ev8LnyzF7i8NhXD5FWc=
X-Gm-Gg: AYBFou3rbJWczJoVXsJIk2FDsHoFJwNjQgW3iKAJoKBXjkl2baamCUOmF289LqfJO0K
	vIOOPJxb6IOH5XDIzSyUH5Zcq+oGaTjA1eFrV8Q+Zw2jj44ggVncpbOPda5Ju0MVMhqSc/3cLZJ
	JEQsX5jm3bCLFLApFUdYX6zlwgTdt8IUBOkTHMpsYwfKBsdB1YsHmnVHWc9JXp71RBvf/ew4erZ
	c/5qS7XbDhOmeE05tlnV5JKFdSgUVnfHVurolQGBn2yBsDb8m4xLTsDo6q2hHFu3YjE4CXDR/T+
	qte9PCO154nsBAY3bzUCLK8jKrTeY+brQScoqFmQKp5Kvo9rtIcgtBij96kt4b5aYARRHEHrv/r
	bBfLXgpWN0Jj9o5+vukdB0uolJmx6etR5frQiDNbG7xi6Ob3CtSLONh/4zIy2dDD0Ts7Huw4h35
	cRpHAQKeNKQ/vO0nQikdiEXmBUBQhx+yKJ6mrUl+CMdX1EP1dOdDF8QGFfKNLLItbnXRt8eMpeV
	MZIlL49A1XVhZlYnAce5BNJKBOvDvJmeZrgAr9qQ80yhngqL2XaUMR+NjivCidf03ih6UMS2eV7
	UfXX3AmAe4XntVQcK7cREEdA1tTy6WjwZHWiQA6LZhIN11T8NQ67KLsxGAWvclZpxqSyt8YNZEy
	MEq3GuUqv3CNanEcOBXump9DXLDiNEZznBudx14bI0Dxwz8YYig==
X-Received: by 2002:a05:600c:a4b:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4b6dff8449emr26012245e9.35.1793956372121;
        Fri, 06 Nov 2026 01:12:52 -0800 (PST)
Received: from alcachofa.home (cst-prg-36-190.cust.vodafone.cz. [46.135.36.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcc6sm226920045e9.2.2026.11.06.01.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:12:51 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	dmitry.baryshkov@oss.qualcomm.com,
	andersson@kernel.org,
	krzk@kernel.org,
	rob.clark@oss.qualcomm.com,
	jgg@ziepe.ca,
	lingtong@qti.qualcomm.com,
	cacar@qti.qualcomm.com,
	sandheep@qti.qualcomm.com,
	Bharath Kumar <bkumar@qti.qualcomm.com>,
	Chenna Kesava Raju <chennak@qti.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Bharath Kumar <quic_bkumar@quicinc.com>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	Ekansh Gupta <ekangupt@qti.qualcomm.com>
Subject: Re: [PATCH v4 00/25] accel/qda: Qualcomm DSP Accelerator driver
Date: Fri,  6 Nov 2026 10:11:19 +0100
Message-ID: <20261106091121.3958523-1-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 02, 2026 at 03:51 AM, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com> wrote:
> User space
> ==========
>
> - FastRPC library: https://github.com/qualcomm/fastrpc
>   (accel support: https://github.com/qualcomm/fastrpc/tree/accel/staging)
> - QAIC compiler:   https://github.com/qualcomm/QAIC

Hi Ekansh,

I'm still confused on how userspace gets to execute its compute kernels
with this uAPI. Let's say I have a compiler and have compiled a function
that reads some values from a buffer and writes to another buffer. Could
you explain to me how should I use the uAPI so this kernel executes and
I get the expected results in the buffers?

Regards,

Tomeu
