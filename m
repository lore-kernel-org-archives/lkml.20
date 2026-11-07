Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794030043;
	b=PE8m6P2uKs49eNs3NPxHaErf1SMy3AetJZl2s6D98dhqGEc5CM6R44eE5X7UOAylbz3y
	 3rXek6WbATr5KZlRTy4eeuoj2Jd8L5zQTyVeAKQW5JDWHbeF54ndtRcJ9/VlIuFJLl5XT
	 1AwcxJGw1NgZqlmJJDs0UELU3dVF2AEuZcpfifRNnjUg96P0xrK8jnAfbdBC2cVByusxj
	 mqVC+ce1Rmv0LuK6PYY+V5E/TvZVpRcyCeHMqdEat9LQMFy7kKKf6VZ8fDV0Mn3b9DxpK
	 JYbO+5ht+8Nz99x0JattxAj2z0QruvUUr03bSeI8k92iXxPttWbUbuD6Ixia6miQ8UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794030043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=U+0pTkB3+MWRLSYz9PVlpdTWCZvpDF7n5p0vN/UixaA=;
	b=pViM1Z9AhXk388VTI96PD0A2AGuF9IXYbKqp2EI1xsF+3aui/S03XFRnr117aP1h0zTk
	 cTP/C5HAZxx3p5yzny2/Ec5iV2CFnrHsUnjBOdzkQstNh31wwCkFQNKTChVWtrtVDmyAb
	 3amkIFzGU88xewjRopVoASiDrwKdhuAHUpIkqT6cutIV43AnBfBq0l05oeNowb8HBCrxu
	 whcb3UaYJ2vqcazvPe6mBMe+10uIBSl1WTIHsihCrbd4Yv6jkYsrNM81EvYO2A8VnUqIq
	 LTfdHEFmL/uSQzhzzBub4+KmYakLC2Y2RBm5b/YqdwU7xbHU0f8aU5E9Y87Q2pzg8tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MKKfBy8c;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933E4606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 933E4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MKKfBy8c
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so735001a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 21:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794030043; x=1794634843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+0pTkB3+MWRLSYz9PVlpdTWCZvpDF7n5p0vN/UixaA=;
        b=MKKfBy8cKXapsmlYd8GOwL/ZTCcezrUbWwB0OqF5FjEPGS3PRmlqS61fHiccoL9MGR
         jQiwSHoSjQrFn5Wj/D4vDaOSjN/+4kzY5aGKTHsXJqNOVuCf03zIoqsNt9WbLv4rdHTd
         af9JsvxOc8J/50gWAu624GSz6J2egf1JjB4hMsOt9wW2cZvQ67Hp1a58eo5GzX60furA
         R67LX83ZH5EEqS1hlkhpAoYzV0Yh+WmEQoOV/jYt9vxhervEObCUCHCwDg/CizKShOv9
         jhlKU4eegdoUpRYmGeZW78IIsijX8MRJgyxUiRaL4SJBukmYR7PaBr7bhkiOZ3veavyJ
         IZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794030043; x=1794634843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U+0pTkB3+MWRLSYz9PVlpdTWCZvpDF7n5p0vN/UixaA=;
        b=geht6ER0z4Ifh+c8IVU7LBM0UIgjtnB+S/SLC/PIpzqlsHfSm7b71eV7rZ56cn99iJ
         KuR8AS6BaoP58hDu7KNFgWHfLAUQ5prVvQmYlZCtT2WGiUqx+YJhDdw15PF8/jEEXkB7
         r8xVPgbOaKWrSg6XSwCGVwzujjFXJ55hdZJ96G3GLzZuB6e7OVJZjGFQD79bbJzGOROS
         AlwusP1tSRnuo4HPpyZmxw+CqBCM6i5IJLOVk9Rl2LJ4yEdmyPx+n329/Bi/tAWgTy26
         WoxtwTi3YCtx5CGKTR4/4QdVtl7v1lEaMJc+9LY55JHveGDmhkUwKcYkJ66CWpz2ZGJM
         tgew==
X-Forwarded-Encrypted: i=1; AL+hErFB0ZqoSsWER2m+PGfNdhNHedd7J2tzCpLOyYXzr/TUBDPm2lgIcuCAH+2//K/11Br1t5PS0u7zHN88uq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yVler7TAMCtOd3uW2J19a/NHOu9HczCcsp2xuh5kbfDanWGIL
	OTCVki/7tPo88XqEdGDyOnxDAmxZP6HRG2//7tEzbbC71WZNs+nLU9L5
X-Gm-Gg: AYBFou0Z8fUKm/6ud8bUiFwncc1t3GRBJYNMSP5BoAmkjxw83pIFpDPOPfXT8wS0woK
	0NiCDoh7qxdaItiCpjUmeKRLiO/riximn2F0SL7B38lRVP+9/sqgS66a4Fie71jRy+n1SEk3aj5
	3pg7DsiLbuaeh5+FVrS+n1MeJi1/cpvaVhy+i2BMDGtx5kjVAVV9jJ70AuXb94lyOmFHN7iN7FH
	UjI9OHR2X2vHAo/oMkrQIuLsKacvVJovebawQVtuIiZKA3+xdoOBS/i6ve3BeGIY29Oe1qSpqXU
	yvbuxIhdISnZ0lc+7z4Y0cZ6Tsbe4CXCmCPvUF/Qr/C319Hm31+q8ucK/GpOxLnx4ElE+xFANXE
	y9Xjfr9PeBevJBz4bDkGfb5LaZM0/kIuJ6T8oMBMQsPrYh3ixq2VUd+KSo02EcKLzUVpAKZJxl3
	gias7JueToQc4EF94ePD7lG59NgSlVK6AGWh3bSdRYf2Wmm3kBKGuyzy5zpBluEgWyjFFJGwuZj
	zpcg7NZeZw7T/G14t3z9lucDFqCMrTcoUqQZqp9L77PpGHsYyqqI9v7LwpQxnE1XromGLr2otxV
	Xqi988vxa+Y6UHZ7NrK/XnD0KggYAd7o+VwFjVxr1S/kGjE5UJD07ahPMIOWei2IBGoj1g==
X-Received: by 2002:a17:90b:39b0:b0:3b0:a757:e372 with SMTP id 98e67ed59e1d1-3b0db71a88amr4553467a91.47.1794030042944;
        Fri, 06 Nov 2026 21:40:42 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a1a:7bc2:20ba:a479])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a0475sm1847682a91.0.2026.11.06.21.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:40:41 -0800 (PST)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com
Subject: Re: [RFC PATCH v7 00/10] trace: stack trace deduplication for ftrace ring buffer
Date: Sat,  7 Nov 2026 13:40:23 +0800
Message-Id: <20261107054023.3077908-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103194429.739feafc@gandalf.local.home>
References: <20260912083753.3426176-1-lipengfei28@xiaomi.com> <20261013020321.1898006-1-lipengfei28@xiaomi.com> <20261103194429.739feafc@gandalf.local.home>
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

From: Pengfei Li <lipengfei28@xiaomi.com>

On Tue, 3 Nov 2026 19:44:29 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> Yeah, the cookie + generation looks like the best way forward.

Thanks, v8 uses that format.

v8 will be the core, the hookup into the stack recording path, the
statistics file, the documentation and the basic selftest, with your
comments on 01-03 addressed. The binary export will carry the generation
in its header, so I would like the core and the cookie format to settle
first; the binary export, its parser and the capacity boot parameter
will follow as a separate series. If you would rather have them in the
same series, I can include them.

So there is no need to look at 04-10 of v7.

Thanks,
Pengfei Li
