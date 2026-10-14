Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4197D3F4DF3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791950323; cv=pass; b=KhQF3kRTmOjFs0hRz34mGmk6IxyEAL8sUm2NojclAoP8Vhc+MXwain8q4Mzr1r8NW/gnpy3tz9EyrSrEG1eKC2EOwgzQXp/lbjFnN+jyAq8ZhXYy4xtqcP3ZxV30iUc81skp+xVXScgg2i3SyEJZu8rmGYI16aGDeSfnMsiXJqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791950323; c=relaxed/simple;
	bh=WorismvNRkuQ9tjYVreeBhmYfh3bupSga23jA+9gRoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W/1lDXyBcJU0C1PPScH/xj5ZP8xEEAqNnNG5qgPLqLyL4jdXYfBBtbtnRl+5UXcUmxOqF7tG82oP38DLnIJmQSMpVKZEKK+4GWV0x1Fz2kRY7a8R95O7h9jH5USCeMH0NWt/7WZ2Q3SPRMA0K3JuWbel6Y7I/klpf+Evc58bqbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=YE61nxA4; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="YE61nxA4"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c169ae1cb26so1026572266b.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791950319; cv=none;
        d=google.com; s=arc-20260327;
        b=RIE6d5p5P0ILRDM7KI/930Iz9+5GovCXedyUl8c2ZbyT6spbzYVw2ItJosjZs9usuQ
         dkMF/9cGoiQpyjb6sUl/FkYo+bI9muXG5nxEYkOYQVGfm42QuM5YcP3FAQlrJUEqbE5p
         2su4wrX2ZNPpxLlU5Ptexz5SrUohomfEPA91tCj2yKMFT7Ad7zp1XOuYko4pJNXSe6Lw
         J+m67yKQsQaSwG2+R2lN0EHOyRALKBrTkpfH8ZeSCQmIAXKLHBZVkyEjr1xAlU7S1nzL
         NpQJNT4TZdknOnniM6d+o5Y9A5/neGVauuhEDseLuCDfjbfNBw7azDWfvbVtsuGrbUNe
         Uaiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hCM/rLbUxNjORiVZD5L+LGA24mSGgi/XAzABcfZnU2E=;
        fh=MoGdhXj+NxJMNju4RGpkBsBZJp5s7eQnRX5pK7wFKYo=;
        b=Oba1SUarJVc7sEM5tG4ZAFzF5h/PSteVQF+OiCu1oTjCOo2Foz17B+pDnfcQFIjq1c
         DPcn2ZI3po+KBItOFCOhjzTCMcbFAyvpLOFzHLML5RU8U+Opd1/OMLEWRCEVn5M6z0uP
         yzDmuSyOz9WqajPytP3Xkxdy9AKMpGLPTut9CtEX9pNkBojRyJQoZ7d3/AHCHjr58qLe
         Qmel3pPPt6uSUZ3FekdKUuIg7ltqXaCfEAHeOHsBr98KnUSRWrjaHeQSa9ooG5NEQ/Aa
         RuAxKdkSklqaxbZkfLgDrwAdZvelape+PBwNRi1gnDY6sMgjQPL9p1DpgHhdBOs+1Jqt
         eIew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1791950319; x=1792555119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hCM/rLbUxNjORiVZD5L+LGA24mSGgi/XAzABcfZnU2E=;
        b=YE61nxA4KCGgfRRmGze17+5Jha6T3v9A+xiW2P+24Xl3ATA/OFi4W17EadZB1/wEeb
         16msuEdw50/r0+A12SJxhVCLTzxPYdn3Ur5ASIy+tSpZDI9pfhknLITyCBL2lgh4AQzu
         GOwnd9XFvZNuZItJ2iNgbrpoHhJDohDK7XrEfraRcZmDweK2727iqSntxq84DUXCzxr/
         NsHOTrxKklKR1l15VnVrkoeZDZVcU8SRWEbcYvkauEkt+K36sMZevPk2tYheY4D8wo7U
         vmz5TamaHH4ybTiTJpZR6w07zzLpTvfMvdK/MsGUDqYUWjg9iuqawd1JuTNxQKSuHbSs
         vang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791950319; x=1792555119;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hCM/rLbUxNjORiVZD5L+LGA24mSGgi/XAzABcfZnU2E=;
        b=B9SAN8kJQXSv8Q9+d1GchLSMSKg/UKJ4DCw2O4w5VeWzWGgttr83X8vb7dmpRvIfqP
         twJHuaqXiicM5Mcj+Nq/e1ks5SLWqeNcJq2vWVhrROB6t2mz9YGTna/x6Kp3QuZxCYQA
         299ZIyWTSwMgbZvbrKsxGgcKhj+A9n2Q2Q+iRZjsjC2/ha9umEHMXJ6nCLvrJjDgoQk3
         12/SY6GRaCS2ypB4sKeNZNNHj5Iu5DsO6lXrul0WGlt4it7Woziv+q7r0TzqJg2w8HqQ
         DqZBJam2zYa4EcdOLH9z5GUfBwMvcpTVyPG0hy5MbM5fB3lrWNLb//6FMa+zMweOuxjd
         jcgg==
X-Forwarded-Encrypted: i=1; AKwUvBwtGpENPcAgGlb3i30O3DZMwhKBVyTgyxhbs2Gey9P+3QffGbzsOG9qltEL076byTbmpAJ8b/5N9BD1OLw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIV8w9+8peMK9ntcXfVTxsTSnmzca9USo4y4oulJ4q7F9Z2Z8NB
	0vF11wI7LW03juJNfizvIM1OkcX9yHKcyqElPE6k9hiA1va1LQbsw3snI9bth5/JEi8Nwt6LU3j
	+dC/R4ufIzwDBFZZszKVv0ntjvP2UGMexlp+iGJ0+mZYksNdRBp4gtY4=
X-Gm-Gg: AYBFou05i1qMSPN/con1EL+E8F8PgQS70niJNH1EFfIo4WMonPwRfvfQs9wHxs67i3P
	wiOlyO/l0aHfi40GyXpc/GsK/Ti8e5oyIUVskYzeB6RyUJeFAd2fhGQrMy7o/xxmpmG3XsDXZXU
	XimXXlqGmOz5Y3KoBqH614p5qnMNULxnYDBmLN0rUj/N1o9MqsUJHPCpPE6VnYn5294baZs3lQV
	ZTwbH6oltSoRL3w5O112LaIicyNKiFp2pNr+zHwMNTg4ACxHy0TITyj5BMrl9pkNcaPghN5Dfkc
	TfvaLiX+OyUrAsomy/7VhQqyWMxoZ6w86dpcSQPzlUEoKJDfjg7jki2buV25DitClpeJYwG73KX
	cUCN7/Rrc
X-Received: by 2002:a17:907:9813:b0:c2e:22f7:59c5 with SMTP id
 a640c23a62f3a-c31a700713fmr1462632366b.7.1791950319528; Tue, 13 Oct 2026
 20:58:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012205447.2717801-1-max.kellermann@ionos.com>
 <20261012205447.2717801-4-max.kellermann@ionos.com> <a64f6a98-de70-4004-aac0-312cb05aaf92@linux.dev>
In-Reply-To: <a64f6a98-de70-4004-aac0-312cb05aaf92@linux.dev>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Wed, 14 Oct 2026 05:58:28 +0200
X-Gm-Features: AclHuK-EVXCJZ2dMETv7V581o_s9NhAvmGhqI1-eNh0gIrQGd2lTR1oPmoD0xNc
Message-ID: <CAKPOu+83bH2CRtiAio+1VTTQrYFF9th5XfG5wL45ujEavPS3Dg@mail.gmail.com>
Subject: Re: [PATCH 3/5] mm/mglru: cache the last memcg node, make tail
 insertion constant time
To: Ridong Chen <ridong.chen@linux.dev>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, baohua@kernel.org, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, baoquan.he@linux.dev, 
	baolin.wang@linux.alibaba.com, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, hannes@cmpxchg.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 5:31=E2=80=AFAM Ridong Chen <ridong.chen@linux.dev>=
 wrote:
> I've also submitted an RFC patch that addresses this issue.

Oh, interesting!  I did not know but your patch, but it looks very
similar to mine (but without the hlist_nulls refactoring so yours
comes with some code duplicating the hlist_nulls header).

Too bad your RFC went nowhere, that would have saved us from a
production incident...  Anyway, even if neither gets merged, I'll keep
my patches on our internal kernel fork, because they do help a lot
with our workload.

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group
