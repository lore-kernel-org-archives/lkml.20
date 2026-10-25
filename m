Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792944532;
	b=UDPW+Is94y34E1qYo/371w/7ySB3dT09T9o79zY3sPaSuR5JOg2JAjTQrpN2CjL/MMsq
	 ZkHw5zI5ydxomXkBoOTzSKzwWPKtd0FrDwpBX1Q+n9hk+NgxcqfPOYIaKow0iz9VDfFzA
	 fzQsRYSADuIfzYhgX4FDwV1wSCpsjrGDsuDZ4E2mvKeuHiDJ/6k93MCp2GBNXJGv17J0X
	 wqSfX9JmWKDbN6d1tkrgz7kspVYrjZXhXOmwn5Aytahz8YsddS5VWX1Ko1WVY92bt92Jq
	 3Pj15H3mAWFJKj6B1HNuqpe1MbbAT8dMl538rrNQRGy45S6ICxQqsjHN1c6eNJKSKTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792944532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5bsFb1VGF6oWmE/SaHObYdwjauVdSsHZobYqpgFT4fg=;
	b=uFs7CuVCA+774DqKyNujQhu8TZD58mJ97NVh/5/3IZFgX/eynpCBHO32YSceFtUQq0rO
	 sEJ6+4eR3lrVR5473ZurJjm54s7ffGCTVQfhDCm3qxVE9TFMlIKyb4D9IOIqBa+/1A9qk
	 GLBR9UkD+l5FTpZqxckWsvX2vbrYshJ6RojhCDvBVAS/+rkh6EjNcXTr5quLTLGCxYO9p
	 10oSfAwNHK6NOeWOkSq5D6RmRWJ18D17m+LWw4PHa9rjbeF88FDzdZLNaMgaWp2vhLsr+
	 6CnC8RPh7nQzgMkia6VrdYLPrcala5zdPrzPRwhbhSiJTr9599TXEYhiW+6Yluf3ckg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=exSmZb4+;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C662606A33F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C662606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=exSmZb4+
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-157fe9d771bso2722943c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792944531; x=1793549331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bsFb1VGF6oWmE/SaHObYdwjauVdSsHZobYqpgFT4fg=;
        b=exSmZb4+Kw/kxqqpDCYdKTZy7cTyRv6ROKOOKXPRoAjBll5aml/FiU0qd78qRCr46V
         hBvBAKzCyQEe0CPsezteuFWs4H4TuL2+Irsy0SMiU2CdIdj5H7t8AP40PnczFjz106CB
         giwqCpQlfq1Om6b93qLEUlrD1/rpW689+tbjhKX/4zRmFh/GGLGGexJu4W6dicjNBD98
         j2QcTlfLMjcHDbKuMcUB0qtl0oxYTiZ4TVj8O+YFoVRGkLAsuyVVY+gXN+BLxeHCm2rr
         0wKTiwU/+z3WB74m3g0erDteWlyV5jX4hcDrNRDsFvZa6qjEN7Cf3o5N6MmlI2Riy51t
         DM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792944531; x=1793549331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5bsFb1VGF6oWmE/SaHObYdwjauVdSsHZobYqpgFT4fg=;
        b=S45mFf0s1oUxUbQa2xrSF0Vl6hHvKe0Drdzo+LGfU1rqOGCK69pvE3s0ChntG6CZra
         J2nR06MQCBrba0hwLND/m5Ena5mxK0NQJZbG2/rwnaJ3pTLivZ3/o7SwPzT5mbp8tLyP
         MyaiTy/tvqQFz5gVqQT4tO7g0jiYoLnnXe6zN0v1CJypmQduQJPLGyeAy3GC+6eoeym0
         gTj1y+vBnAx885uYF8s+P4nnxB3CnBvXsTibyITsgLcoeMJBAiLOpjVxY/iJWbem25Uz
         B3Kl4quL0sfwvPoZr0oi+JsdLkweTMUq3j+bg/HLAlaP71k7Sq3mBdJbYYfLKYV88vX9
         grKA==
X-Forwarded-Encrypted: i=1; AKwUvBw67ug4o/H9JEF+JXYwQITQXSxrLuhz6VaIY+yd9NTvjJSHamxVx6m9qsqhuUAdm0NM7KvFAUvokd5qOzA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXrDWlOPKALKAfkH9tBXkL7itV0Qu1QlSd1X/dFbR1bxu/Uln1
	RYkC9y4vMhVuFoNjT/+H4o4d53kX8qp8z1zsREF28yi7rRy9yR6tGqGX
X-Gm-Gg: AYBFou0fSx1R5as2J0bXMxqPud0E19f074SE101LzCav/d2uiMYK9jDxMM/a2G5lpUO
	OMjlYk8QK1PLhRA2CDI54z2/2flqc1tluBstbjH2Qa0v/1zsBx/EX9KhlECbrVeziej35E45jUt
	T+0o4t6D9JDYtA7TPnqc7742Uq+TkUUw09bpcls1Rvx/OVgxTmvYRY5RvpTpC0zWj6Td+eEp9h6
	sIv9SuwRFlUAeV3lR+hCoZSUdrzLOk9k5ikfJxGKlEyDoAPPNfRpBYtpyPWAR9aios/fxB1hWUc
	r+GtM/iN97Ps7eEDUXkmz1nx6rezbATibFhvSl3tFNRaOXDRsesVJacTNuOLSET4a41CiOqji7l
	1z0GnzBpBDjS0hfG6bAZ7kU7tceq4fnmkehpzJ9Il/xbzhZZD61exMwIPgVrAb2CHQjrq/CQrNP
	2MVj6Bn93P02N7SYTPwTB4ORjI1/ABm0ArZnVBeNFIZfaPX17pKKNUgQX2enslbSOZu7+8hObpA
	wviztrgUTOJ7bx1r2Yp4LF2x2jJm0ygKQrpIGCnx78fKqOApqNCmHEBK3VtzzaQvAZsXd+btI4/
	X0NQPqcsl1QGvcQObwi8
X-Received: by 2002:a05:7022:1087:b0:17d:7b45:f905 with SMTP id a92af1059eb24-19937025befmr6506534c88.31.1792944531413;
        Sun, 25 Oct 2026 09:08:51 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([136.226.232.166])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d59f90sm16330421c88.3.2026.10.25.09.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 09:08:51 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] selftests/net: test network sysctl extremes
Date: Sun, 25 Oct 2026 21:39:27 +0530
Message-ID: <20261025160927.3934600-2-sahaj123.sc@gmail.com>
In-Reply-To: <atXJLy6iTh5vbe9D@fedora>
References: <20261014041446.2821085-1-sahaj123.sc@gmail.com> <atXJLy6iTh5vbe9D@fedora>
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

Hi Hangbin,

Thanks for asking. C was a choice, not a requirement; I agree shell is
clearer for simple sysctl toggles. This test also searches accepted bounds
for each value in a sysctl vector, verifies writes, restores the original
vector, exercises loopback, and checks kernel log records. I chose C to
make the numeric and error handling explicit. My shell prototype was
unreliable in QEMU when parsing the vectors and reading /dev/kmsg; I don't
mean that shell could not be made to handle those cases.

I've narrowed the test to tcp_rmem and tcp_wmem; UDP is now only a
transport smoke check. I recognize the C implementation is sizeable, so
if you think that complexity isn't warranted for this coverage, I'm open
to simplifying or folding the test into an existing one.

Thanks,
Sahaj
