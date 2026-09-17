Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5EB4FDA4C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664892; cv=none; b=nDlDp7BLldiJQK+fSSBkrQidD4en9KDlo4TDgq+LSaZ1MozZVsXQaEimWanXAOsuKrmHCPBmsbrYQu9Yew9gRt9FidDcO0qKMncuU6idsogy54LOFqq6sWurMoLwWKGDbVEmjSSac5KcmCLADKb0CQ8yEK0ZX5yXwGXgQF9GnE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664892; c=relaxed/simple;
	bh=bWkFqhcxRzjwJio2bUVTGTf72jyWIZPzjQrvTOKs1HU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tNhbEqtUh2ufI2NdLwbYcTZjwZT6L8EKL9loEKyp/pwTlXHpdRHlZxOiDp+B0swfikzr6hOqruMGBMoV4F9gdQ57lqk+n5A8bqh01dkKqO8V3Pgp1pLyxZ9q2dj+psDQyqyv+2c0fG8y4zwPL1uxs/QXsJliHaejVgZe7fZMT0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJIiSV8e; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJIiSV8e"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fbef5018so11568975ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789664890; x=1790269690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bWkFqhcxRzjwJio2bUVTGTf72jyWIZPzjQrvTOKs1HU=;
        b=eJIiSV8e3yNGX3Mxj5Wtu/us4/FYfxrR6SWvCqsHfwrYXMTkfAmUinHbzcdUHrsxw9
         vhGmX2L4sK+Ur5TG9+rn7bK0k3VAOZD1jmc0lv1n8DhXdaOkktDLODuRys1BTHCDuhEH
         7/jzUoO1pvg8OUcFw+9LkkEpLfWhQGxH7kHBbCneHrO7hK6ePGZUrkNBmX2QwEPSijWv
         ZeJi2BFFGO5MmeDkgurD/6cXQgdNdroFyRCXeK2AyRpKXRrsBmrd0BBsg8chcP4N2Spe
         7MX1F0NS6IiHpuk6RwsR2cHSM6eSZmpJ/wEA3UbBqgv+08JwFC1lyg9IU4fSjvHM2GQu
         /Qgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664890; x=1790269690;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWkFqhcxRzjwJio2bUVTGTf72jyWIZPzjQrvTOKs1HU=;
        b=bXagaV5fRbZTj8+kobhetmoNA4Zp0azRUqDDe3GsmFxKa8GoSznU9mFCA2k+bRKfgl
         8oBeEC01hCZDYHQ3amM1m9r3uDKWPEcffFKMKS966+0CNYmwB+XsHBT5DAVXzh1fPdEK
         oj0+Egmqpjv+WiZgB0es3WzqbVo7HeS0Fxx5z4cV6OU3wqGLK7NHlHWS8I60oJDX9TLa
         4mBmkz0cdaOaSNoyl2TJP7g7+g/EWDauyUHGhYAOqBYTErIt6ety47c3aszZWI3gm2Ot
         K5seHGQ+8ER2154IXAyhJHIlW8IxTSaqQ2gSIcTRbaNIngIYUApevEH21+uM5mY52BpQ
         ihsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdQSKhE8YI53YLwsEaY7tL4/Eur+j2SI+fzuSQYGpcjtIhcxSyhRJr7c7yBrDB+nu7F4aOPzXMkuuEVlw=@vger.kernel.org
X-Gm-Message-State: AFuF++muMc2O4h+LmGKzwyaEI+1jV8rpFlnhEUKHjP69HILI6lyDtufr
	nSDV8y10Ne9BIekWiBUuAx6I+Y6nGpJS548Dc/LIKoELug9TAJY56Jwb
X-Gm-Gg: AYBFou0Je3o2iQ4+557+iZBkAzkFHKA54h2M3ZuipGxvyROuWaYLPNXRJXhnqkwJNA0
	ucEIVkDIc/pgqPAsBtmMyQRjn89uoOAlO/dVDV/nxXrgD20JpRlizOjaWNFA2g2RShSUMj6L2lV
	Yar3+SDPX5Eklph8iYuk+gR7HFlueNAkuQRNdGJYN/xZVT0fNhiuX4dKKBePe+Wolt3owj5Nt3i
	RH1SeZ7Ta/GeUUYi6W337awvE2kDht8eL7cKFrQlxRxGsDJ+W+gjlY4YfITvEx+ZQDPel1hwjZ8
	ZhPM+KUoxXW2OULUF/i0YMFq7OVA7BXop6IWZPFnHWXL27PQEsgnm/jPGcDaIjT/oPSPZHVmDKq
	88h5aGk4RBmbbJYQHF9vtDcskkDswXnAqo6XTaqjlLlahKtmfnEnJAelY/VOQvJBs2Mqx4yHtYO
	mLOo3FfVAfyrJjjWoHKX27qb4w1CQwQHayMUloOquwRuyXOAoXxf2UwewcL+iP7fnWni8kUxBu
X-Received: by 2002:a17:903:1b63:b0:2dd:ad74:ac1d with SMTP id d9443c01a7336-2ddad74ad63mr17538865ad.24.1789664889696;
        Thu, 17 Sep 2026 10:08:09 -0700 (PDT)
Received: from archlinux ([2402:e280:411b:ec:aa93:b1ec:5a6b:5fce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd90c7b215sm28274645ad.72.2026.09.17.10.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:08:09 -0700 (PDT)
From: Adarsh Das <adarshdas950@gmail.com>
To: gregkh@linuxfoundation.org
Cc: rafael@kernel.org,
	dakr@kernel.org,
	driver-core@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kobject: fix uevent socket use-after-free on net namespace delete
Date: Thu, 17 Sep 2026 22:38:04 +0530
Message-ID: <20260917170804.102139-1-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917144206.85836-1-adarshdas950@gmail.com>
References: <20260917144206.85836-1-adarshdas950@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg,

v2 adds Assisted-by and Tested-by tags as requested.

Local testing: syzbot C repro on unfixed master with -smp 4 (parallel
runs) reproduced the KASAN UAF. With patch applied, no KASAN.

Syzbot testing: #syz test with patch on upstream — Result OK
https://syzkaller.appspot.com/bug?extid=4393dfdddf166f2de2b0

Adarsh
