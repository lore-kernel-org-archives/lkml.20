Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794629849;
	b=pKkIvPWaZK+n8/dniqPaOkNUXQGktEWebgZe5TnwR0QIjU6krc4TrGznvP6mj2DkKEL5
	 6uexIkozNceaSt+IFw9hXPwp95OVePy/jsRAlPhK4oqmNdJi9w0RQmQf71xvwdgr/smQO
	 4uThODnUZswrQskng6sQ0bxU3Z+LMLX8YTotF+evIDUFOd1G1Qg8zhqHvgaYppzDTvS8F
	 QSul1w0KFp6cKMaDQl6qluKINqmE/azDzC5o1mFE+ExVMzn4NrzlPmGWUz/FetAggquJh
	 /qpMrZN79QHXsZP8vNexoTt2GHes37sWtlf/B/5/pRfbG47Y6cisRRVS2C3vjYCmBeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794629849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=iB/K03lI4KCa3CigydQl65EWnXtxB4ckz0UoZC12GJM=;
	b=YiTVVVumNKE6Q4yMgSmRc4aEzjwIfGbDzDACdSluBvd8PXUfmlyjuJMBrdQdAFtaWpft
	 WtE71X47jyNN+wXicKXneYdt7mreJv9cl+SKzjNheTSnU+2j0DfMrzRrEBst1gwE6Pv2F
	 fW/mbmTL7I0RW+kFCmKd8XhytABKNrgYJUVJJPOKOW4Ioqaeq2O5uVBCfq3y84xZYcTlG
	 obnhFy8upjAsgWh3B+RbddrabFMcRIruqsVzxPgt9cLRko8HILPk25NqZQ7cWzK0XjjA8
	 b+4Q+76PQWoaeriXx9WcL5iKQrCZxdCWw17td571FFd0D76kqnzTHbD30vLPXjrzTVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OuFlSZ8M;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114DA606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 114DA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OuFlSZ8M
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3119419eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794629848; x=1795234648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iB/K03lI4KCa3CigydQl65EWnXtxB4ckz0UoZC12GJM=;
        b=OuFlSZ8MQIsrwDi8G4zjq3k4pLwpvbrHSKiXX6UOXn/y5OvcQVTwJ5FB83JYBW2ON1
         HPYLr1mbypw2ko+jPnccdjGAf9K+pz+0Em9zot5d6svD+mog6lio2H3/cJe5orVXUSyB
         wOAAyqfk/v/JdxSytCjnZSG/Dfmdw7i7anf/3UN20SwqZrlRlUy5b6c9j8WYu+i5Tyzv
         sxSERoMfahWESVOmlN45nFSnvZERoZJOu0zlqHsO1jfKreKbjRILtHbVTQsZYZlx7CMe
         M2IXtNcjwRP4mlcG+oT/rujgGAG7Z6CLWCwgFSDEBAfcdRGl9MP+Eu+eTgLc1dWUPmyS
         zPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794629848; x=1795234648;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iB/K03lI4KCa3CigydQl65EWnXtxB4ckz0UoZC12GJM=;
        b=ddYCwOXmn4pFfodBpIN1MTSDWTFfQdEAR9q73ZrDZl2spuiiT+helkS+blWjFdT0N5
         XAFkUrVqcmVMe4JzX2XZUrET7d1v2n2Nof7kTUkYZP6A/yK7awhLC8BynQhGofMfvLH1
         pIq1Td6e320xEYvmp7ZSQxcR9/D/g5IR5RzuSkUZbKVFVKRyRbTblhEhN1f2Rnjuo8/M
         X+C6yUoaDSLjC8KLQTtUBQzZpsUzO9pG26pHNNNOtlrpjxzSdBxRtMJ/6MhgDttnMJnw
         lklO/fOeleffOVZ6p11LZmkSzCyEX7EAcQhAU3u9K3gVyrD6wwDoH5XCADUPZqXp4Yge
         HRaQ==
X-Forwarded-Encrypted: i=1; AL+hErGElVmcs5wShd4ludxMFKe3S5WuDfxextpEX0/4KLLDNoqw93KU2H/9y6v94DBRYzmRoamE2bhpapteUHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yN7r+CIi0r5mH1UHAL79ytNCezSMYJBijubu2loboZsetP+Ga
	7OuM7LQFS7MSF/PT/X7rziw6lTTWZXskIz7sSvq3Pxge2LgPE3VvpBW6ef5WK8uL1O4=
X-Gm-Gg: AYBFou3qhDGIUu/4Di7CIjs1A/8rk165WHyJF4dzvScH00LaPXEl//MzQ+fJ+9yqJAP
	X6d8FBxYhjYn8QJDEGgJJwYQxPv6PzuNdxm9yKru2ik7IFuy6yOT0fjZMxp/Nwgz4SbeuL9iM//
	IXAJerNVG7xgKZJmtfxdXr2NThHSsZfitlQHDdjAdqeENCF97Aiga/05Pyb2FtHWazMdyIcttla
	+M/giSS2jeOSAoBvNt4GpIoEQqbxvlRYf/6+U/wZ4qKYqWBWF3apH1eGD2c9LoeOW3Q9eHifKGa
	jW0500pqbfizmtxJ6vR8IMXm9J7uO2M9DImkwuUaGviK013+Va5IgyE1ZxjuRjgbkPO1MRaLkWx
	qtuUhbr0TPf2JfRjZ9N2SPE+5gGa/nbaV3LORIi077RMzTE6qZld2wlxJyI9fE3q8WvnnrGwLgM
	2M4qsxFGPfTREAd5762lYtsU+OF3VKUqIqfm3R/pUwlTOy7qoMi06qvyoVz8GD0HuEmv/3Ts2bO
	mN7z7rIhcdDl9iVHRWj12YmfYq0+xZcP/Dm9rFd1SmJg/YssWAMa4u+Ewvl+ON3VzU80ixpupeH
	54QvRERxoj+dT/C3wq06vRDQjSK9IDG831KjEiauHZ67D/AZ0mSvb8X/JX6R5G4jaDh++Bv/jnU
	ULDL+DhzjsDvQQJDKTtWJONZF13e1JLZjZtCnOg==
X-Received: by 2002:a05:7022:2390:b0:18d:96e8:b913 with SMTP id a92af1059eb24-1b503195191mr6210044c88.47.1794629848063;
        Fri, 13 Nov 2026 20:17:28 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:f861:b117:6318:c068])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b27dsm11046075c88.2.2026.11.13.20.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:17:27 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org,
	James.Bottomley@HansenPartnership.com,
	ching2048@areca.com.tw
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	thenzl@redhat.com,
	erich@areca.com.tw,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v4 3/4] scsi: arcmsr: wrap the type B completion index
Date: Sat, 14 Nov 2026 13:17:18 +0900
Message-ID: <20261114041718.551698-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-214130@kernel.org>
References: <20261114033810.549787-1-yhlee@isslab.korea.ac.kr> <20261114033810.549787-4-yhlee@isslab.korea.ac.kr> <sashiko-outbox-214130@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The review above is right about the Fixes tag on this patch.
1c57e86d75cf has no type B code at all; struct MessageUnit_B and both
doneq_index readers arrived with 1a4f550a09f8, so the tag should be:

Fixes: 1a4f550a09f8 ("[SCSI] arcmsr: 1.20.00.15: add SATA RAID plus other fixes")

Nothing else changes.  I can send a v5 with only that line corrected
right away, but I did not want to put another version in front of you
just for a tag.  Martin, would you prefer a v5, or could you fix the tag
up when applying?

Best regards,
Yehyeong Lee
