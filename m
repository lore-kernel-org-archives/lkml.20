Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914162;
	b=i8ZT9FK0b4NZBjBcbnuE/p9MpA0yhpaMPiiDjckUGriO/vqhJaiTnwm0TPjAGSA/fuwB
	 XXMkBIh+/y3IJP3rKdudb6ScLU4XgF3k247POaklDn8LdtLeDcMcOwLcJyVZ3lvlp/nWs
	 bugKjhT7a3Ph86NFX6Q7hl5ccVHQ+Gu5yXzyypX9cXCpylDaKJ5ENlqQerrgH8pTDkcQk
	 o249iC+P9K3h6y+gzH4IicDt3MWbPF8fZ1ZqzU7p3ShgTau/pmFWZCn/3EeqFCDKoE/1b
	 +oz1wOdnD4xnvOqBNEy7JqkI9CT7o6wZ9WQOcVTlo/YsDUsFLkeRPqt21Ul1a0nfijQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914162;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bfBKw5Dqe7/QCgl28CEIM4EiUR1wvD/Rw1mMg1W1wSQ=;
	b=2w60a7m33PldgbuIisPySpO7TCkGxvSJqjXnqImt07tkhJr+4Ji6cJLmEUpgPQS2BwIT
	 TpMHqx7Cq6DRLRb0zXIbLvmj5D45ZzziQ3uJoOP/+EGAvkT2x78qpb+x6JZ8QZhFmTb3I
	 yBZ5cp9XcccNGR2hFzC5y9mPZJLou2CKmMa+baGCbKm677ZBXQbb2lMInSo1tfpzTgi3l
	 +c+m53BxAJLtz8JgRYKNrr47Xm3x0ewoAxJNvT8+tIb+n5Ilp6gZVnG4fHs9iv5cKQmyB
	 CCet1d5YA3bf7R0V+sRKP8Y8z98USYQ5QCCCO0bQq1SpEgUz78US3jlEjLPRsOxeu7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YlkbXgUU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DB0606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YlkbXgUU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52C31F000C4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794914161;
	bh=bfBKw5Dqe7/QCgl28CEIM4EiUR1wvD/Rw1mMg1W1wSQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YlkbXgUUQRhyrxgpsJ7Qvml07CSWbgUu8B9MBcv6Rb7T7SWdq8Aq1SQrmZk4EnAhp
	 TcmeQ1ddK4h+Pu6rPK+bVxj9nTENOoMDtpxr/d7pzn6PP0stPZXXTCeTk/x9BdxWok
	 By92sXJDNTF9T+YZxDMLuMMgthIA0MZbqwOtlsHUtiyjq7qF12Dwctp5QuSSU1oZ62
	 3mIGTmaU9HYjlOR/Mw83mXoVkeR8viHwpqjJvVoFTQ+3NlPR3N4Vfq12juTxVu4Kvy
	 pNy7xoR8tcMopGP9TY5NVo+AKp8eALuZYTDKFnCrTCR9bJzmyt4brkpbKPdrhEUdpo
	 BZpOOnX6mFrCA==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4682977f9aso643607266b.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:16:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGSnatINpYBMdRXdPAmrp9OODEvMpKDBBtqjJ0Q5cIX55H6IUr66ZDPxhPdwgVz/FqfizGytvrcNOJiulY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eXwA08GMSvCBBUmIuUD1PHZc55fJrUXr5iawVl49fSigDC2AY
	9YbCWwenfEWpWCwfD2c36xRzTMl+b9Wb5GUI7+CrjOg7QEux3HFQOIiUZgQPggycv6DXVHgu2KI
	oEfSXW+EcJiN1l0v6Vql0W9N7P/Kj1UE=
X-Received: by 2002:a17:907:3e9e:b0:c40:4848:f7fa with SMTP id
 a640c23a62f3a-c50965421ebmr1168834366b.44.1794914160376; Tue, 17 Nov 2026
 03:16:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116085752.3908082-1-chizhiling@163.com> <20261116085752.3908082-2-chizhiling@163.com>
In-Reply-To: <20261116085752.3908082-2-chizhiling@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 17 Nov 2026 20:15:47 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_wMVWSp1OZox-dF+G9x3seF1pTe436Y5dhR8LAqjtPdA@mail.gmail.com>
X-Gm-Features: AclHuK_g651WVLWBvZ3JkfDxJ0juXOGnsif_vLCZ2PuPoqhZPKjOh8aIm_6kPfQ
Message-ID: <CAKYAXd_wMVWSp1OZox-dF+G9x3seF1pTe436Y5dhR8LAqjtPdA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] iomap: export iomap_bio_read_folio_range_sync()
To: Chi Zhiling <chizhiling@163.com>, Christian Brauner <brauner@kernel.org>
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	exfat@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	"Darrick J. Wong" <djwong@kernel.org>, Chi Zhiling <chizhiling@kylinos.cn>, 
	Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 5:59=E2=80=AFPM Chi Zhiling <chizhiling@163.com> wr=
ote:
>
> From: Chi Zhiling <chizhiling@kylinos.cn>
>
> Filesystems that provide a buffered write ->read_folio_range handler
> need to perform the same synchronous bio read as the default handler.
> Move the declaration of iomap_bio_read_folio_range_sync() from the
> internal header to <linux/iomap.h>, together with the !CONFIG_BLOCK
> fallback, and export it so that modular filesystems can call it.
>
> exfat will call it from its own ->read_folio_range handler to zero
> the stale bytes between valid_size and the end of the block under
> the folio lock during buffered writes.
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>

Christian, if you apply this patch(1/5) to the iomap tree, I will
apply the remaining patches (2-5) into the exFAT tree.
Thanks!
