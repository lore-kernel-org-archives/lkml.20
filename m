Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280CB29ACFD
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788126192; cv=none; b=MBkHeD7eFhh2BYTdftpjnhHR568rd4h86pTw7JnyYo2w+YO0LHv2BpVWuAqkZUFeAqzukFJsKfoWwv5MzzSeJ7odfkOmnoDaVYNe3R1Lf3VkjsM5jK9gttHMbNmhAQWDPMvBNHJ8mT4KlyjUHWjLi0Fzq2PdGzI+UVxhrhcZcJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788126192; c=relaxed/simple;
	bh=tMYlAlO9oI3tMcI/rKIDs9rqZu40VTOxuXGX+UjB6hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vq3g820nLbK1m3RaNbUL0CUIDoMYvpd7YsjLyTB/PEsl8J5QTD1bZLKfBHzikkHMjf8MmHibRI8+LGqLKyTNQcaM1CuYoEmyYd4DjMHKy40AV6sjP++vhalZki33dHpYg9EbhyXrAjiDKD0esTLXz0B4Qkrh+o5PXZtK4J86xAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso29298295e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788126189; x=1788730989;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMYlAlO9oI3tMcI/rKIDs9rqZu40VTOxuXGX+UjB6hg=;
        b=S3lI9x7CI9isGkUB0sVV+A7eC255vfviXrIEY2812+yIzv0xfbYWEE+4LWCKlKBMLR
         5VgWn2Z64Dtsz+fBEtXaX0rm2WefzTBnBJ08kEShNaOjwjNB6/X+eOZrDnLfBdFIHIen
         hXpRmnKg95EGOfriy0ILVaC6RxfYOyolZxcadb9AX1c/fddSGGYhAbyR/cHQ+JWwHvww
         +azuogfSRvU0LIxq+hFRI1Ry48bDcIaddfZr+yR4uKTu4yJ0yQL++8rOuq6ABfrfH1Db
         UyCQwHgS1o0jpDI/Nfqbp5bhh2YcKAov9BbGhGXpJqf9W5FxowQTolU4zZ6+y0/oWVB6
         hWww==
X-Forwarded-Encrypted: i=1; AHgh+RoZ+dNvqrvu7CsGTjMxt1UbiQ15S1gx6Yla0PVribzMQS9YbNl7QhO3V4VOM7R7u6c1SzxhKLLy65fkmNU=@vger.kernel.org
X-Gm-Message-State: AFuF++ldqvrluSaBW4DCdQBw3lWBXiRVXL2mSi9/Vi4nzRBC3fXPfnOy
	dhfMpiMQMJ0UPhMVIzrvr4J+GHyqmmFxToKwPZvgrpxtd8Qno6ZLb841
X-Gm-Gg: AR+sD11++oxKTcPfsYo0/xknTFLvUDWcgPsox7gd48foaADC8WMNOmmQ0O04QES04ts
	KD2hj83kjDQ2ptQI51NcQfB+eTFzcINXh3iKAuK72FiG9/WlFa1kFdOgSsmJJEPo2T5dMmlVoFU
	hqA54PQFQdKddtmABOZ9tRRROrG6gs0ODvMN5XQRXohJ05sytYamufgKcah1A7nf+VIXWKhyTAm
	PR8T1K5/CpZXd+wgnKn+hkrbmgrzauWmu2EyXZWYXbgJjdcJkIc/PJkHFHSo3kzufnlyFq/J2VZ
	6sxCXNvs/QXhyXYZu73gwnDh10a28omPNxA8XY5xJdll/dp++mPnUue0PhaUOeRnd6OUYEVylOd
	59NRIVlv4JfBiM87caUj4UtoJH61Nwlv7beulrTOJ2focGaA0mw9PqhsC2gZQTnEWk8lstzdIo7
	UH0pAsTs5eDDVMLhF7WSR9ELXwFuojga36A0/XahMTn2ecnObYiZbdYg8EX8kc4jxNjUcrgtTNW
	7eE+/bkf69EJHJPvjzErA==
X-Received: by 2002:a05:600c:5491:b0:49b:4eb6:6ffd with SMTP id 5b1f17b1804b1-49cd53987cfmr56996385e9.5.1788126189256;
        Sun, 30 Aug 2026 14:43:09 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c80asm273192935e9.9.2026.08.30.14.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 14:43:07 -0700 (PDT)
Message-ID: <9ded840a-d7c0-408d-a3a4-2729e26e15e9@grimberg.me>
Date: Mon, 31 Aug 2026 00:43:05 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] nvme-tcp: fix wrong status on deferred digest
 error
To: Xixin Liu <liuxixin@kylinos.cn>, linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, hare@suse.de,
 dwagner@suse.de, linux-kernel@vger.kernel.org
References: <cover.nvme-tcp-req-status.v1.git.liuxixin@kylinos.cn>
 <cover.nvme-tcp-req-status.v2.git.liuxixin@kylinos.cn>
 <1.nvme-tcp-req-status.v2.git.liuxixin@kylinos.cn>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <1.nvme-tcp-req-status.v2.git.liuxixin@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/08/2026 4:05, Xixin Liu wrote:
> A C2HData digest error stores a host status code in req->status. Without
> DATA_SUCCESS completion goes through the rsp path, which passed that host
> value straight into complete as CQE Status wire encoding.
>
> On the rsp path, shift left when a deferred host error is stored,
> otherwise use cqe->status.

Why not just assign with a shifted status?
We already do this in nvme_tcp_end_request()
