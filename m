Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEF12EFD95
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790493876; cv=none; b=Z1bpa/co7IvtIxOPEtlN1WyMJXfwdqLZnAanuZFDLkZ2DD+Waz4ax+dEsoI5kPm6IL5DOg0Go8oAoe5hgIbZGiKVQ+YGUt+Z8FDEoGB8qDs658VbRJuE8Ag+bIYM1Mp0O0TYDfsoMls3ynpoesRBEaCW3KyKOvRxVHBt0Uk9DA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790493876; c=relaxed/simple;
	bh=z0rBgtnC9PLu0tvotjxYjwwrGubWB8KVmdTu41ZCeHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DT1Y7C+/Nee0OUglIPUgtMbG13aUl4ZhWHGTtE44/DkIpsmtkO+TMTm2Bqz+lDoil5l0pYUeYLuOd3bVDLAwdmYb81BC7rXfQez/gNCMi97EaeFtGd6bNke3sHl3caRsNNGBKghTO1jZkW61mopd2Ph6C+h/KNO7R/7PxGOf8hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpxcFxku; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpxcFxku"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887635e952so865377f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790493874; x=1791098674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L6/LgVjWBfUQytwT/TqmlYNEbPKmjS81Vvh2KZnx68I=;
        b=HpxcFxku+1O7HGE18Q5uYAAKSTb/5SQFAcMHUBQduJB2vP6zal8VwAV10pGR1FLDg1
         RSu1u1ekd4CRcSPIBiSBdb2dyABRGgtK/1q4op/U9hM9so+/gsqFls7AP4QM42b1B6u8
         W5rzGb65b275uTX46h6RcDdf8Rb3XC032a6Wb809CQNRim+Ot2Mv6F81psfb/HGcAqRe
         4hCDzfQ5EVj8M3Wf8h3GxM1HNyra3j7Tv249Yqyk9KtDddZonxMXoM5Gf2mXYfOdDIOa
         jpniyoZOfCnDj0KH7mIBCOjixQVYUeeHtKHxHDjcfaxk4Ok+raaS9UJ2t8boYKLL+pAD
         EjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790493874; x=1791098674;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L6/LgVjWBfUQytwT/TqmlYNEbPKmjS81Vvh2KZnx68I=;
        b=Av9raXkF80t5eKlF6Xpr0wKdcpd+ix46PAGzh6NYp0aMBmPJsz/TSH+3o+XzoHygE8
         fVwCMZkWx0j8AwOTn4KPj+akxSjw1NGrOwZbO4t75c0OACOvy46agN1aRNxsAWwExTdq
         xO0qg5Zg0lQoTUiURoy8p8Ksb1HUNLlr0gQN1n68nVm6SbPmCQMjcxtdPFhHP/gRiz/M
         wFXmCeOhknW5q8gB8f2HsKJ206m6eXqz11As6ufLmTY5miZj8Imwn0pdN57WsQ8StJt4
         SqHpfGcy8DzBEIq0rAfMPrCXSlPyY3wUt2mtX5Oh6kuHMLIuMM7IVdGAiQm04n0WbZDd
         hLfA==
X-Forwarded-Encrypted: i=1; AKwUvBwYa135ehgST+DPJ+QH06TyHh6ogwvlwbnSuaKxR9EdCJgqL5EEC3ucIa18lN03aPgV3WMam8gPLHcGE44=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHssvAqc7wgh1eDnNfdFo5r3u7Ewn3FR6fSe8HN/NEyaA/Xmuf
	oqFBLN8bmDtdDpv9vlHDOCOAgmEhPoEL8l+ZlV/k1wLXlJXy3CkG0lA=
X-Gm-Gg: AYBFou0TaW2sEW7LdM2XqqBfPDeg4in9HzERf3++Jb00lVs7cE5ISFrC5PzgKtNh/0Z
	UDlqyVR+mokzUhmw6vbBpje0Dwu/SbxLzaC55QRbvxc0b1TbFWI0uQ7RObsDq4gvjUDfrC9bQm4
	50O+PwJw1cEOX+fDyT5IMFJJRH81lLXgYzFjU/KV2Kf5AXHU5VvNRWfFjwJRWJYg3KDLyEYG916
	ZO7M2D73RzBqCX9dznBqBSY3W5S68igECmK2Is6EhIXrCCNwFfCZ/QukfnXjMz6tEvSF2gedpOL
	KB3qOPyQKfvpmyW9op38rOslRAnuB5PHY/7ZQQDN3c+sKcrHZ0TurivWk6jCNec7ORDgbc6ua6/
	6pLfF10XVZshb8M9Y9wX7M15AlW9lwbLWyzFw7fwn7PqUvGN0oYdIum/YVfY/ehfERToBWvUw9S
	6xYqmgbVAtNsRuqQmiBLhmTFgfzRNs4dDRn/H+jhw1A3EbPSqCWa+qHNgp2Fj3ecVNu7Qe+nmLY
	vylvUm54SP53AQLtdxF6GaezslXOgBlDWjwMsik/UJBWUXRF/5ASXEpKg==
X-Received: by 2002:a05:6000:2c0b:b0:487:a87:24c9 with SMTP id ffacd0b85a97d-4887168cd56mr20720950f8f.3.1790493873487;
        Sun, 27 Sep 2026 00:24:33 -0700 (PDT)
Received: from localhost.localdomain ([31.223.3.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a74538asm18263754f8f.34.2026.09.27.00.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:24:33 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: corbet@lwn.net,
	clemens@ladisch.de,
	tglx@kernel.org
Cc: anna-maria@linutronix.de,
	frederic@kernel.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH v3 0/2] docs: timers: hpet: Modernize and document API
Date: Sun, 27 Sep 2026 10:23:14 +0300
Message-ID: <20260927072425.7892-1-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <87jyo74rbv.fsf@trenco.lwn.net>
References: <87jyo74rbv.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series updates the HPET (High Precision Event Timer) documentation
by updating outdated file paths and documenting the userspace API, including
the available ioctl commands.

---

v2 -> v3:
- Add Assisted-by tags to individual patches for LLM assistance.
- Remove stray [PATCH v2 x/2] prefixes from commit subjects.
- Fix a missing newline warning.

v1 -> v2:
- Split the original single patch into a two-patch series.
- Keep the text files less than 80 columns.

Habil Eren Türker (2):
  docs: timers: hpet: Modernize file references
  docs: timers: hpet: Document userspace API and ioctl commands

 Documentation/timers/hpet.rst | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

-- 
2.47.3

