Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315296;
	b=r6Gr4fE/JL7lhSDv2j0jI9yIX2RWrOjk0NeFeOiwwkpwRlnf6xcuJL4R4v4QizJ7yl5m
	 YWSmtCEOJzssHDsBlNokZh5gPWGmaALf+jN2VGSTUZJuOd9XwieyA5ZQ6uxBJnLGCmqlo
	 ri+tXgmv38sa0UijCD2T8yGOekxoHS3wcmt/I/pDInxWbFvJxoz6dQOCnqpK5a4c5BrZG
	 JcrHSDU8vxsvHRP5awaVJyo9JY8psPrwO4pGCxuq1yApP+wPj+xSuQKmr7MBtOot+cOV+
	 Tuw5J0EJgV6hzy7TkIIRendyG6ukOVYNzDc7O1hINbzf/jnjQuEGirAoK//vCr9DeSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y0M4h/vehAQMF6R3fGbmwS23pY4/kxWDOz1/LJz28sw=;
	b=iKVVFsOY53Pxx88ALZT2k61+F5cqeHpgfvzNHe8igI2QD6zPhWCr/z0xYzfuVyx07nSy
	 lsPy72KpTlb8+uLHCbfY2vW7ZLka4VWGaGqATr9ZTWFXMU36iTWLBPT2KtMaavVdOsbv4
	 3BDweIxGlgQfqZozkdgJA0KWWelrXlG6ahchANhGDk3ipd1SW6w61+9nzqHn3qrrqnS03
	 y8ZSqrT+W5mz45wODJHW7xsixBwWAeFwM4w+ZGgjgTrfsC8sEO0yYuidx1vMpw021QipF
	 PuJr+K9gw9Xhznn6oYHm/AQHV7uvdJpacXq/9J2gMSIgQi8Ok19piZEN+crlEzzaVAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gfTvipCX;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE1460A3807
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFE1460A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gfTvipCX
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so3033374eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794315295; x=1794920095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y0M4h/vehAQMF6R3fGbmwS23pY4/kxWDOz1/LJz28sw=;
        b=gfTvipCXqBGm3NNA+zZR9EFcSt9ST8UEBbukfnrSNqLQk8Wi4q3x0sO0o0pM1aC0yR
         P5r89crrBGwF5RFAnOm58G8fuR4KzIDq8p5nGcC0jjOzzvVSg951coRihE13IioSPq3l
         gMt8QwJP1VaZsAsJJr1IREzi8MtyuaTORIEELouL9cEaxj4YWMpm9SLD/+hHjGl20Zcj
         ZMuZF3sceK4XxBZSx1ov+iEYhN8o3+5szpDyumoQPLMR2UVbXjBToA6UfNyoaQMGIZJL
         WV+112RqkX9jcLxOR5za30V0lyDBDDT7F9PC0DieICSABfifyBvYi3aRm+ew/G2b/m1S
         x2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315295; x=1794920095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y0M4h/vehAQMF6R3fGbmwS23pY4/kxWDOz1/LJz28sw=;
        b=uGnWdbN4qzJGFjHGJqGn2QyJXAVwzkfnch5ljhFkR4GSINIjgW8073xSR7Q3vGFo8X
         AP6Sg5y0Lts18OtMPvA6jd1ymXVx0u6qO7jJpCOA3U/nCPmbQyq/cUqwMR6lSKG0T4w5
         v/9+zTmKcXvtt8FTjYL5hQuv5WHMQNX2Vlz6lVMm5WsIvioiKUFTIC6Bx2eyPPVMdLdg
         IdTHyX22Z4CQykqnNXn2U+V7c7UmvLxYRvJxjOLU4JVBStANGMmozyRF3kiZ/rUFNWMu
         d+8N2YeFVBpKZcCngXWzlD+skgeCTk4yDBKZa47/Lv56iI+x2qzkohsZhHkwszJG9XkL
         QwSw==
X-Forwarded-Encrypted: i=1; AL+hErFAOg98d03EEOst7ZsyV3WFeD7VdC782KBaZAOpIY+Hvk2yFkVV+R4+ZqRi2M0rGRUZJWzIDYTe9GagoOc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AgaxnzuLMgYcaX/3snQnNrH9SpEUbj7gYyFwKXzQ3Yl8RNYNk
	y39HnTsB4kFYlKLIftO45Ra6s6JaIts0G9yQSal0tmgzZxmPbsvW2k2+
X-Gm-Gg: AYBFou09C8PZkn3v+d6hJ58qj30ocwjIlUz991+TeZOFXQGayVoSRWwYPBBAanWhw6b
	xhWhDXSUelxFQUbrr9GKpjiccqH91gvHvmKGUIcy3uZZJyllgu5F0TNf6uiirycQo+rkaJT1LDh
	vVni/TWmI1HGVTvJRbrYGf7BgskH8l4xscfIq+izGLudqCEsZlb0X+spyhP4jfsrDjfArsRISIm
	RnzE5UJ4Y8cqnVBxD6Q2EbQHcOkeNob0360gYhJ3CNSqupe12EstsGzkByJ5qznIHYZA+XAWHJX
	i81pwRUEm8ONBINErXy1dkvXZztta8rFOZJQ3hi2k1Try+puodgFq750+hOqaE1meSA0UtDqzin
	ecb2diZ67HBZ4hQe9Yc98hdHKYc5q6UZLTOYvg+veMW+eZOcf7ZDlKkoZREckc94aMwS1MSlwUI
	whC75BV5kngcf1K5KeooV+Plb2mpcby9V6vSvJWhb8OZGK62H9jZw6VRnWqpXEHJuCvp0Qo4xmu
	gQvE9l7TkheH9aygmMumyH+TVvxn8DtLCVf0NRIR5S4tr9dCb6XmEK1u4WejiSQ1sIWqRYsVGSe
	5W+fQpN3KQAMXWvw28jYwVB29Os1f3/0/2gQrJew26uXKItN5A==
X-Received: by 2002:a05:693c:62d0:b0:375:9a26:cbae with SMTP id 5a478bee46e88-3759a26d2bemr1808434eec.24.1794315294772;
        Tue, 10 Nov 2026 04:54:54 -0800 (PST)
Received: from localhost.localdomain ([103.170.54.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm7580066eec.7.2026.11.10.04.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:54:54 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: hare@suse.de
Cc: hare@kernel.org,
	hch@lst.de,
	kbusch@kernel.org,
	kch@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	sagi@grimberg.me,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH] nvmet: synchronize DH-CHAP secret removal
Date: Tue, 10 Nov 2026 12:54:29 +0000
Message-ID: <20261110125429.2733-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <4ff74c54-7478-4ea5-9e26-32101acd4556@suse.de>
References: <4ff74c54-7478-4ea5-9e26-32101acd4556@suse.de>
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

Hi Hannes,

Thank you for reviewing the patch.

I've sent v2 with the missing Fixes: trailer added. 
The code changes are unchanged.

For reference, v2: https://lore.kernel.org/all/20261110081559.2730-1-sreekuttan2156239@gmail.com/

Thanks,
Sreeraj
