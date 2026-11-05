Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793892053;
	b=MjEFOpyqg4V56NMrMMjwSFtE3Qz7b9r2uIOEPi+OKB0w2Ky+ckvghZnc6fFgdzw8R8HM
	 kF1QQxHUJtTQt7vmeOVlWh6NunA4S86zEr9zMvaqnJaij0yIa9J1Prv3gRK6gObnnUrss
	 WnAgSRJY4qhFRC3A/kT6Qjyt2lBVqWVsNslUbA+pV1QHr8Yv8WY8nPQrFa9/ytzWdQ7jF
	 uxzti7Hv07QT9hmzLsbGhxG4vo8282smklCraHEsN4Ngurl1cJ5uQSFFOXBepQ3QNmG7w
	 MChbx0xufHGwE9hLabE049GqQQDVYi8Kdn+tpkQ3bcerN7hwVPk7pogjuP+9U2GT4IA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9oNVn8taDxwUxdvOB1h32bxmNoqj405m6JDzlp9SE6o=;
	b=d7B+tZY9yDMZuk7jz1zwI/b9maqJdxR+hEezC1vlnerl8Vhs3WKoZHHaYInmpTXcGPEC
	 wZKH39r9QlQROGMVcjiyVq9G2DOXap7HCjaIxWF8CCCzPZVZtMlqTBqofOYZkOOEmeBQz
	 9i34TTGoL74lgLS9wfjJXyDgSwYbR7ABO/M8JLeByheHD8ztRgTmd/QpjYD0hOGK/eHo+
	 jri3lf7T6Mmk9tyaXTLU9hikfAZ12ufwMTLyf50eiIonm7/v3Khqd9tqJxKzyMVmespX5
	 JVrzCmqOkKgcAlW/KNzE7VMcOlIRePQLrsaS2gNy/TJDmYdfuJNRNc75mv6k1+g170w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b="Rk/mIQOm";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A814D606D825
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A814D606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=Rk/mIQOm
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so3746635eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:20:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793892050; cv=none;
        d=google.com; s=arc-20260327;
        b=gp8ZTqJbFN+y8lT6g9GujXIWphw4XJPIObOy1O6RhNp0NkasUcFnabQszVJKZeCHcf
         IkxnxObzYp5is3k8OEvJbATCEjR7WEESObc+hj3D0u8SUSpnh0ugNHYAkPqYH4Osj1fI
         RxLeXH7aYIasfc9wILr7JFgA0WFTystrcN9YGWWNnr2ovDcRSowNNSn2EP4f8fHB1jTG
         zHdeIF2ZENhI20MhNTi2hfoFD0AGlpMemlR5dOsuvCqD6cgvZQklH9a0Rrs5oJCMei8S
         TgFS/DlTRVZykqeG04OZSQdNDrlPTnvCxfwqoR7zF37heOGDQnEFyhHfdw9OcpzNvskz
         h+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9oNVn8taDxwUxdvOB1h32bxmNoqj405m6JDzlp9SE6o=;
        fh=e1+c/O3S8noAYlJauqo0q1mo/MKMIKNAorZ2PjR4KvU=;
        b=rP3VGtZ2NASliwbWrzie/AiqnN4Hy8DERMGJLMB9qsn/VkG7XgeGMzWcDpDhqn/b9Y
         wVCaE0c+utPiXg4UF1DT+gvY4bMA7neXq2UJ1FDfymrYPPb7l92vxWoz25ZZjgZ++TUG
         IxHR+SUFdymJtgh2ZPPJ/H3LSMlJlmepdngpEkA2hTu1AfEWJAmTMVS2g2nCNeJYCRtl
         aJgceNccT5diqyplso4PdNQmAIKXKOISxEjgQJewSSq11YegIadk4zcv+yUBR6qnRl+H
         Te7qj/2EM5xiO2lB93Dx+M5UBLs+CDpdBmk741fAWNjro8mXETlgOXANA//nitBMdZKN
         K8hA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1793892050; x=1794496850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9oNVn8taDxwUxdvOB1h32bxmNoqj405m6JDzlp9SE6o=;
        b=Rk/mIQOmswX7r32qFJfwyjBBCPJZm8bQ62GGIP0ykysrpdlT5+K6zYtSvAu0eShPaa
         Yrr0NfZ3FAl7zpM1JkVnKgXPfQJg2+kGN4pyhjv2VG28OZh4QA94dp5SPSu0PyFJVf55
         SqY84TmGpfmBIUuCzFnkwnjRJRUYhqgdHOP3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892050; x=1794496850;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oNVn8taDxwUxdvOB1h32bxmNoqj405m6JDzlp9SE6o=;
        b=x31iF2+NJPn013BJtW58eayZt9fD0N2Sptx4xp4wxPkggN93JpTM7UB55wAg84Pgho
         pTT/ngROS/gn5dnyl8GG3pojrZbJ6TIaiDYeLVQzX5/beyY6qMkbou/rhue9iVjZdS2c
         Czvv5KgTegqQqLbYkAqOt0KNYeHMwnEKD8S2ekkRX6dNpPcJeKUVWOKmhZnGg66GyIc2
         4B1TqQOQOfQBD3Mt0mdUWzs1iqCfw7xSKPAcTGsnEuARi/Rc7q+rY4VdYjtuuzI5CxJi
         /nz+uKeOIcTG5SwmfisHC1D12V/oDqx12FlYPQFAypgYL5exykSxmD24FAR7mf1WV0A0
         kUMA==
X-Forwarded-Encrypted: i=1; AKwUvBwq3ljcgbPJf5/p0vnNGW9j3AUvEVdeMO/1vz5qCnNBzQybz2RAqbWkomveYfyqgiD6l/qeMkGOhu0pkhQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Gz+lLblMxZ2n7p35xAvFN8wsa9crrYd97kYT8QVxSnfs0K+Sw
	tVzMs26xgUHqoSD5AmuyyX4O/N7Wf4qH2iTQVM4OueFBhDL1E1EnFJu5eYkCooWwPMIsMvnmO7T
	4D+sA4S7NOcEZftojI8ziisqxkvN+cIrpfqyBu7Acqb2PvGtHiVVc
X-Gm-Gg: AYBFou2IXvNgQtTv3I8nAK/EuF0kNJkiY0Uc5MaXuv2pUOkLQwYLRjK2UnLbiDTBYon
	xy6tBbaJJsD1Lwi8GWF+BZieD4bQV/T3K5L5meB4uLuT1sgeLzkLl3rjCJj9zbaf/BMaHusqHeV
	1vzazx6ygtjeAptkBkZX1XwQlB21tJ6wKkehD+JX6Tr/Uq2Jup8YWFEdR8gI7StPs3cS6yy/SQr
	0hlZKQiFlKFOo+oyYsk9zzvZqCZYSLhLxTVt2/XtG4o/1M/B89zgACh8lj37X9Pq+Dy/3XTqIdH
	6am+dHhAufRuftDseE2QlZ/03uJLS4o9gdPSE4t++WvuFeEw6FbOhwh0zexeg3/yRHYn2qz92mW
	wI9kYipYX2qu8rnJdfvc9OCDCjyoW0v24rSK5xxbLQ0quZ/E5bYF/jUm/PZ1LmB8PgX4epVNxOV
	WVIWiOEJsWAiO4q9Yz
X-Received: by 2002:a05:693c:88c8:10b0:36a:1f:9b74 with SMTP id
 5a478bee46e88-36a423bf83emr29053078eec.27.1793892050273; Thu, 05 Nov 2026
 07:20:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-fuse-cuse-release-v1-1-8be1eec02c66@gmail.com>
In-Reply-To: <20261105-fuse-cuse-release-v1-1-8be1eec02c66@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 5 Nov 2026 16:20:33 +0100
X-Gm-Features: AclHuK8DUdgD_8ZNs09MZGawixt-scCOpxSSzX7YLcBDzrNxhZfwKgYKjsYE-JY
Message-ID: <CAJfpegtebqB3ECjvLVXeVoADsAjC2B71ozYbMaUn3D3A3D_1kQ@mail.gmail.com>
Subject: Re: [PATCH] fuse: don't pass a NULL inode to fuse_inode_backing() on release
To: sariorkunemin@gmail.com
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Nov 2026 at 14:23, Orkun Emin Sar=C4=B1 via B4 Relay
<devnull+sariorkunemin.gmail.com@kernel.org> wrote:
>
> From: Orkun Emin Sar=C4=B1 <sariorkunemin@gmail.com>

> Pass a NULL backing when there is no inode. fuse_passthrough_release()
> only prints it.

Applied, thanks.

Miklos
