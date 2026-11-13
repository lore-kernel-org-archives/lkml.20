Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567920;
	b=FbhhWNkhO4O7xeP3iC9B7cotnZ5fuNsDtKxQtMv81XVaMum7uUb/Oiwhnsu1ko8+gp4Q
	 MIJsUyhvrQFp/mYHQAo51UbwpSmIjeXjXvt7n5fDBghXC2j0WUeuRLrFlC03Rfzn8xrMK
	 Dh0Nq2bZh65qRNzMeEtBoS4MSJ98RxCLPv7K3WoH72PTHFuGBGIpbNeF5qvjjV8JB4RwY
	 j7PTEtvDY0VEHjl766iMpukXpgcf3otnE/H7HPKbzrhIovTjZ0nCUlwbs1+hK59r7Kwek
	 QWw4uhFk2yLajH/mPTNjXixuF45LXeUhfIkgQDMUdWmuJ3Jg0YcDUaRCKcgoJ40jR7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QftI3K44ZZiobTwr/u+4ZTOlGFkxNtcO4iEVZ0vgnek=;
	b=jwJCx8qqMyrYGM/CIVNLdayxmK5O2TxsQ/9IHadKnAgwPAol+ARQB4ALAobHZtPD6ACX
	 tfImysh+8ebagZU54H7e2LgMltpFl/xw31Z5WekEIkx/Mj70rmA1GHEtLfYB6CkicA+Jw
	 X917i5f7i6HOr/b2sfKemvUdLkwVQ9WHQIoiGvu6cV1SwVbDK101EG9tU9+vBoYE4vHLT
	 qVwOb345YGBtabxFjj7amIIdExHi1+BJsdBEZbXqpHPivpt6umF2ZBXyV4+VZK71ZAOfP
	 RUWum8HmPR1SEPqk5graxVjNLyhF3P5ey0OJM8aR2GCWyQYHcbP4XFgUydcZJxwhXxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A2OthWkM;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2C3606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F2C3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A2OthWkM
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so3115925e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794567918; x=1795172718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QftI3K44ZZiobTwr/u+4ZTOlGFkxNtcO4iEVZ0vgnek=;
        b=A2OthWkMGm0zsNyY35xrHT76UqK6yWeQ07k30O5+g0WUzIeRFNJnwKJFwe35vdk6ys
         S90fiAwfr06xGkl5DyCyQNIe9Hc3nQGEUzV0L2VHa/BisCyvWruEdn+kR5fs4jxBE9nw
         diyiyKH3d/3y8vz14vzsOwxj61a2tpSo5kO1dcbcxOA19SalILeuktA6zzlC/srIsA92
         cd/vKip27+mkdz0CClhTTHy+w+opMEOcOvYTiaLB0/MPuKHKHhgToU4cUTeh+qccsO2/
         c9VWqsSt1twsHNCavS31smcL9BgN7YH4LBlJP79RBf23eXug6pfS7V6wMyJAkoVHfr5B
         A/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567918; x=1795172718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QftI3K44ZZiobTwr/u+4ZTOlGFkxNtcO4iEVZ0vgnek=;
        b=vhXseNcxDD/qgooh/vKGW9UM2xIIlkxT7D6pJKkjJOOJ689qhNJDzGCET3JmuWkm6v
         AcrAdUw1Xf7ybs8LLtQNwjsmhqHBWwmyNTHe9zacqQLH51nopH4HTEGPVN9YRiNEyqxN
         35OtyY4CG29f46rElGgD2Pcw00f0j+Nlx88WUgQ4poe+a/679tj83VeNxdi0MDusrWyu
         AfoKrPspnqoodpqa7/0t9l90vbb7Vl6WpLl5e4j8cZXs7dKW7DLEqPfKU2HhXlWGXesh
         Er68Ioyv56tdA1xxqHuWitHWYbZOMh35phgIM4UgKxLpyWM0hID12YoK9o3e+ma+4YJC
         7yGg==
X-Forwarded-Encrypted: i=1; AL+hErHdNAwofiYn8wMuYb+m7XVORb7Tbjt4/ptu4SLUBjwHMTn8E2PI/3DjJqiE32WzP5bDVWp6KTfn28K+Ras=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e3FSEzuYxosd4eomQmhJT4RM/oqfeajEMrdfh+gRkaTgRsrN7
	xSJzXGgmTmJxYrhw4DUHuZLCi0M/v38uDumgjH/xNnD/SRAibW1uAamR
X-Gm-Gg: AYBFou3lHk2owahw5EgdN7ch8Y4PmKDk4Imk8CIc75+TLXPIs4hSb1vnqJ0nUJEwMeO
	6A6FsxNStCkGrRxew5arOSnjRewZa7eprXaiyHqQ9AqrulTQ9nJJJG5OwDcwQXeF95N5+PHM4lt
	l6SrzfoWNAWqH57lzeP818701A5C9DxB+5Lq7P1baeKkUs3Jzea5USTtYdBtxVxBRmDmBhJM8cL
	+yLyl/TpdWLF1vRKEsQ0YEPpuoivOrksuFBorywRc380IHabXGBIzCPEYyStiwI8e6fIIGYcuBl
	NHYPwB/djxGgVZ1tu8F6T0h2tgn+jfIyn7q4ZkCjJL5yQow9fS03EFot06PzR7iVx3VZxhWG5Cd
	I14b40YknMZIRh4mboZi4ZChVpOaT+/SFiYbcZtf6NgNALBIqT9yd3BegY2dyAni5+eTieNMt94
	M2XqM98zPTv2N6cpYC9yFyIf2Z3vbH2pKnYBZjDxHOkDt4rz7EDeN/1lrnjJ2ji8C24frEW3DUj
	X6M8xjiaIDyiKlhE6J85ISDE2d7dvlk83jT3u2ROn8s6gzJ254UbXCvEZhrpIEIatjtJRwzLoro
	u1hcjkJR19RKE0tyvHREFhu56idCeNS1fZg=
X-Received: by 2002:a05:600c:3b16:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb55a6116bmr46200125e9.4.1794567918385;
        Fri, 13 Nov 2026 03:05:18 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e4a2asm4788105f8f.39.2026.11.13.03.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:05:17 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: imx: return -ENXIO at once when a DMA write is not acknowledged
Date: Fri, 13 Nov 2026 12:05:16 +0100
Message-ID: <20261113110517.1142293-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113073250.1037215-3-mehmet.fide@gmail.com>
References: 
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

Please do not apply this patch as it is. Sashiko is right on both
points: the new -ENXIO path leaves the DMA buffer mapped, as the timeout
path does today, and a NACK of the last byte the DMA writes can be
missed. v2 fixes both. Patch 1/2 is not affected.

The block_data remark on patch 1/2 is a separate bug; I have sent a
patch for it on its own.
