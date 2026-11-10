Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318467;
	b=257MgTXTXjZ8f58zWf6c3OfmFJyQdRPG94RlYSG3XrnxJEWaO1MjQAT2oV2FyT92Kl55
	 dA5JtKVQWmA5umGAwgXPEInxIuentiu/CgQQ7rbBzzT0P8ux1FQq0Z24ToncrDxiCziBy
	 Uc03sfS9bBDSsGGVgjVA50e/1h/Bgfj9oc4U4zRarATjm7qzZGRXLh+/2o14sNGHFPOwL
	 tmyz76+zMjPBYX/MJSlOvWeukDpD6VGpUSbeFOla0PJKknYheTqavQmYIWC96Ima+W9pb
	 aZF0aWqUdwqzCY2VWdua7BINIj+ygNqlaS87Wz76XoNZyHA9i9fzPEwB8aBqSf3e2Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=61QcDSDsSH5n6LCVlJAKE5htGdjtvYorgYiqBUo3mWE=;
	b=ACO7fWHPcSkPVaHM/yvHgE1utqOMBWkNF9Ci8KdAslfw8F38ivOngqpsm1CJqbLywC3N
	 65XGC4RChMjkxgv1V+vwjqOsEsReNXivVjPSpEI8Z9vedA50vsqD/OzW/CFHAB7e5cclz
	 a0whKthWyQSCqgICd3muhjG2scTDi97LN+2/TUz+e4OJ+TVJ1yWsqWA7ixa1vNvjYQC0U
	 qe8nZ/9R13V/b4R9XuzT7OKqQldZR7lqHvjXF+d3ZUp36jwxe0OfRuODu9aElZ+ycOtdg
	 kzvT9GYbEM+pmpQChkaRAaUmEWdRJ+gUyvtelZSIkIhdeP+3b2zNbbgGm0HRQGhvMHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xvTb0nc7;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5FF606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE5FF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xvTb0nc7
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-37071c0f42aso3643373eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794318466; x=1794923266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61QcDSDsSH5n6LCVlJAKE5htGdjtvYorgYiqBUo3mWE=;
        b=xvTb0nc71hMTramlyW6pF0NFGe6Iksjh8IW+m1vzu8xleusCqrjm5Bwz5/h6wG+KSN
         TMt1B/CWZoWKOWN+dspSUdASSDJSoeRNz+NB+RM/q1b+aQ0DXl6H4kbG0aiFraFpWfHA
         YtAg0EQV0Qk0MsEYOZY3yXo4PdJjpAc/h94zWmuTy5uflFTJEt7jCSljgQpuKutCnSyv
         oJKwXevXeFMB+A7ofeBjkT9hZ5+Y33QVL67ZNvQdZAXnadh+vhpSFQe+kMHK1REeAXrc
         YgeDznoL+ubrPRNtiuiKnIFkJAnu32lZIFxzAT5bmKekKNc7cZgeEIlWxsV4pz1HIjjq
         qOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318466; x=1794923266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=61QcDSDsSH5n6LCVlJAKE5htGdjtvYorgYiqBUo3mWE=;
        b=H9bK1D7iHLRTBQ0BRpg6Hy7O9yl4BQAeyXeiIiBzvngv1XcS8WfW7n0cLBaQD2b0sU
         B+IPZhbhtw8Qi4KPZJ/SzxU84pn7XNWXYbApfOaiYpCnr4xpSDOqR1y0rSBXaSBTIN12
         5KxoNZvMES48KiN8x83qZlwqkZHQnQyQ9pGhc9unK23h8PypsxNlVYJwU5iBda9msO46
         mHCqFSr9ezIOH0Y1kCKUyinYQIgCOnsVtMfIG7DpQHMlSlUmvil50tuxZk0UZyaVmjX7
         0ifWw1KISqkEpFMevvSPM56B046AryUoyxNGPI8/AYNIsJ2rDgVdyAPzui7Mf7bOxyV5
         8B3Q==
X-Forwarded-Encrypted: i=1; AL+hErF/viNMl0dFp8VcEB2RmGO4sVcdpa+1cT4WcREcouoqoKuX3YstJkBbEWdRHxJZyqY4JCYicf3sKmsuSK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/m61a6cBNqR3sFzOQodVxpiC67lK+ZY+8R61QddMkVHo6hE2/6
	tKDM9qZX/yNfXfGiDYQo5+YtlZFSlRkjcCkMQCRgiipaU7PWUsUIW6sC
X-Gm-Gg: AYBFou2C88HQSG2PGbY6AV4dnXMrR/vcnVUb5vaQUP21ASznM8gFf16gwKCIh/q4KfS
	t9OpnUqF0iZ1A0WCjh60MdzUGgK21Nab6hw0HsclVXjTqsYNo33J1BiOxx96y7vaJPfzpVs9XOK
	7v+b/EjCLXjfcUCcG68OxO+dfrmYg9va4VhiSrnrI3zG4yhCWz1WWf53M0W2ONkMpGlcbQGOjOA
	Vg3CqnID1Uyhcefh98cMLaPLKdzO4+phXNjU21YR/LGlTdgcllTr16AHgutXQLDXjhpsoXHCUY6
	sqF2nqewdQMTBtv6wvMYMocg3DvRymYdeM93OxSnq8PsGOlBelJ60Q/TofMMB+27FQmsommoULx
	e/NRmOjlelkeANSw3euKlbvsZe18wLamIKZCQmYjJc9smiFEwElmnwCM/JpxiHxp6C2JLi+EUeE
	6qrT2Y/CiVxUCxl62Tb6qBl4Mi51f+g4oFLT64iQllRlt8sJr4wvtTbEkp/9X43hi3JnH3rmPi5
	8Jmg+amiiJZxYnWz1Q7ic3tBgJ7dsQdAtR35uH3/ZhWbIRQkKgNrEQgquhIu7rr8j9ar5cCibIx
	pYq1Zl/gHrmdxxD07ubHCxA4hVsm+2ISyy0MvFUw+2fHtD67ZQ==
X-Received: by 2002:a05:693c:87d0:20b0:36a:1e0a:accb with SMTP id 5a478bee46e88-37520026b83mr3535881eec.35.1794318465405;
        Tue, 10 Nov 2026 05:47:45 -0800 (PST)
Received: from localhost.localdomain ([103.170.54.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e76e2sm8350319eec.24.2026.11.10.05.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:47:44 -0800 (PST)
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
Subject: Re: [PATCH v4] nvmet: clean up DH group state on initialization failure
Date: Tue, 10 Nov 2026 13:47:20 +0000
Message-ID: <20261110134720.3500-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2f0e8fe5-42b6-47d9-9bcd-c549544e099a@suse.de>
References: <2f0e8fe5-42b6-47d9-9bcd-c549544e099a@suse.de>
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

Thanks, Hannes.

I kept the cleanup in a common "err:" path to avoid duplicating the teardown 
logic across multiple failure paths.

The diff looks larger mainly because I removed the existing "else" block after 
introducing "goto err" for error handling. This allows the successful initialization 
path to remain linear, with all failures handled through the common cleanup section.

Thanks for the review!

Sreeraj
