Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792555848;
	b=oHK6E6GjqEtSGxFpckCFL8ZYuaXotpCgpfBwRZ4KEyrKHVH4U2mG1MwfPrufiaARcueK
	 zocVSqGgaUE1VOKOYzr5yTKs0vPbfwLG6oxc0ziW3Z4gF9TrG2YH5OEDHvwEGmj0PAHoq
	 MIW5fOYgYl4+H0zEEMBPQ2cAv7zA0BmPF2RQDK9BYPLwYACmtDZJNkmDhBJZuq80nZY1m
	 F4Zg0dImUXGsBbEJKvCpizRi5BcmIrcRLOx9mw0rLYVr0DaeKGzcrVxaAq5ZrfTYL8rdr
	 oW6rf3EXlU/Yh7RroVNjMnJr6/rJwHODBZUA2A6z5xvj75R87DYsyKqkUBAqq4lZRIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792555848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oGhvDxI3zW4RDmWwBNExt8CDr9PPRQWD4dlxrwabZRw=;
	b=XNr54d2QH67Uf0yCorl/Iz9359n9ggk1+/Lxc9CiX1UIvRp6sg3HLEWQiJE6lHCZvUk+
	 Jmd6O1IFcuwWQW/3Neypb8Op/NuKBwKF3sBigXVNEI0wWVyctEA/OX86YZ59J24yysixd
	 yLEJXCkdSyJ3gQFB+gQ3epVDNfnmvhD5NUcsxVsCPHunLwM+LwGmMjkejl04pFgDyuQ1y
	 v3J2qMRzxLBBE5aAt8RBD6b+hNWOGLjMH8jeT3eToJEmnTZszsLsyexg+TBJN2N0s45iB
	 pMHrpjDP2PZ/yzFkxxQiZZtujAToa7JB4+yrunGr8QNkc7rSb1rV6HNyfn/6oaPgpqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U7r8awW4;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65ABE606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65ABE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U7r8awW4
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93cc1ab5f6cso32409985a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792555847; x=1793160647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oGhvDxI3zW4RDmWwBNExt8CDr9PPRQWD4dlxrwabZRw=;
        b=U7r8awW4d7wFmrFO7u1NARM3mK4MzpEMRRLD1y1k9W7ZFhRhXLQrD0Y/cQ2FjxDRjn
         b9uLKRzic+RqXsLLGCcV+2inpy4rBoaj3/7StfariJ1ab+lVBrxFhTTokOSaGMpSkzsJ
         zvSpDO34JoUyv51TVd1wfhTTqRwO0oSsyIhSXOn409U2+5TXffmQklkJvlUEhUArIcrO
         SRP8eDQrP/QZp76MP3qW3l4yf7TDGDnVMrMAOaxxHv7/oiqqpKbqI6E9uwe0LKkDdqLY
         4j6SU8tkvW5P2Uz/GEg4UQEfBDMkPvekNM5c7DPN/WXm78//kXWTQMyi+uMP3GRNUAB3
         TKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792555847; x=1793160647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oGhvDxI3zW4RDmWwBNExt8CDr9PPRQWD4dlxrwabZRw=;
        b=du/ny9qVtZrLx/S80d20J8FAyDcp7MZLKNnWNTcbAnxQv0VqB9IdEc/C3B5AY11ogT
         S/PAn/MPsW5acvHuDRn+6H0EudVSNsvzopT60bCbPl6H7th+RuGAP4qs46otPj6zX1YG
         JPCCUXmRDMS0kn9vQ8CFyeIQp9v7fc+VuAycwS61TGIc+95Chwp6O0+Or9G4eFeq78Lf
         9FfVrE+kdoTlGSxPns2MsffLVvlJF9F47LVWKuIS23eSm05G32yrGBmksyvHBXW7OwRy
         uIp09mB0+zb0lHqYsHvL97sD28wOSPnDQMJyNJAxKFpcfYDwshyDw+Dca8tdFLyIeBd+
         mFoQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5qkAg28wdWQNVq3fDNoIjxdGx4HfYAOb40+QFAoGwIZqiKI+eN5hcaQNfwhjf9wRoTV93G/alUufAu4g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSWXvalOVVHvRGIf1d5i8b0cHSHAnVoTNmvx9OUjR+AxP5Gt/l
	0/xsTOM73o0jkAwsoDMBlVfuQU630JblVuyzZBRsdhFYRmLt9PG2T2LA
X-Gm-Gg: AYBFou0l6hXRFuhQNR7GHty/lakcoNgZa3jl9UrpJuRBUJBlIWEXc6CrvXZWxiKgRyw
	ZTJm9i3LGA62gK+VUy3F/WQR/boT7A0xWoQaQDbwW1I+kJrpSurc7HHlpgIWHvLtv/YqJFGwU+z
	Hla0UQqSKoHkVLmTk2GVtKGV1W9fJcn+VnNfcUWWRtUu4xJjyLKKN7fa6iV7fAeM4Z/AQ8iBFgs
	9TVSevxIu/gHzebAUhIkKZhlOQ6Fz3JAn2douAP1loZHEWdmFDljz8J2atan1Sou4XoGxDgDKhq
	LJd/JKD9fXyDPzmukVBPuYNyYvtg5RfPfr49EooEgIJW9c5JLinlFI9PQNpbCaNIzd0xLMkSuEU
	Z1Brtw6lfibF9eNBQwtgYwal4Nzhz+9rNl1lxKobAmNNLv7J8q3N/Hi8V+sRAso5tAPS+7XuY5X
	jdvtG8CKcLmOKefFLGaapfqbwr8XN0Yzl23IAEvONl2VxVKP236Z8K6H+sJ8Tn52ew/VIYrKtrQ
	bXbls+DZBth6eBHCv8CgGiEbrX/4tUnVfnmNclx65br4a/JEEZ59wAvs36EQF00DcIqoYO3F8tq
	hSzGV6A=
X-Received: by 2002:a05:620a:44cd:b0:93f:2c95:658c with SMTP id af79cd13be357-93f57f1ed0amr231705985a.14.1792555847390;
        Tue, 20 Oct 2026 21:10:47 -0700 (PDT)
Received: from keith-pc.taila86f15.ts.net ([2600:4040:50fa:9200:fff4:6e82:93d2:837e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56e247ffsm149480485a.39.2026.10.20.21.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:10:46 -0700 (PDT)
From: Keith Teeple <keithrteeple@gmail.com>
To: szwyb123@gmail.com
Cc: akpm@linux-foundation.org,
	axboe@kernel.dk,
	david@davidgow.net,
	kunit-dev@googlegroups.com,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Keith Teeple <keithrteeple@gmail.com>
Subject: Re: [PATCH v2] lib/sbitmap: add KUnit test suite
Date: Wed, 21 Oct 2026 00:08:49 -0400
Message-ID: <20261021040849.688374-1-keithrteeple@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016073253.520971-1-szwyb123@gmail.com>
References: <20261016073253.520971-1-szwyb123@gmail.com>
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

On Fri, 16 Oct 2026 15:32:53 +0800, Wang Yibo wrote:
> v2:
>  - Test sb.alloc_hint as a plain boolean: KUNIT_EXPECT_NOT_NULL() passes
>    its argument through a const void *, which a __percpu pointer cannot do
>    on architectures that keep percpu data in a separate address space, so
>    the test did not build on x86 (David Gow).
>  - Use a BITS_PER_LONG-relative bit number in sbitmap_test_iterate_set().
>    The hardcoded 130 lies past the end of the test bitmap when
>    BITS_PER_LONG is 32, so that bit was never visited and the test failed;
>    assert the precondition while at it (David Gow).

I am new here and trying to be helpful by testing others' patches. I
reproduced both v1 failures and confirmed the v2 fixes, applied on the
stated base (4056b3c9d3c9) and built with gcc 16.2.1:

  - x86_64 under QEMU: v1 fails to build at sbitmap_kunit.c:38,
    same as you saw with gcc 15.2. v2 builds and passes 8/8.

    One detail: this needs CONFIG_SMP=y as well as
    CONFIG_USE_X86_SEG_SUPPORT=y. Without SMP, __percpu has no address space and v1
    builds and passes. The kunit.py x64_64 QEMU config leaves SMP off by default.

  - i386 under QEMU: v1 fails sbitmap_test_iterate_set with
    nr_visited == 5 (expected 6). v2 passes 8/8.

  - UML: v2 passes 8/8.

Tested-by: Keith Teeple <keithrteeple@gmail.com>
