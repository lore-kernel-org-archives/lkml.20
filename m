Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793987454;
	b=3IpCt8joEKHox/q0yI940//I9ENy9ONNdjT7TaxBRY5YruLF8kHDTWxrr++24+uq3o5I
	 oFMk02HgKqjM9v/F0JXTss8HN3CvZQ4w1J9qgGR/aYf3aY2UQteoy1JUvDpbBT01GS1HN
	 bNLJI0amupudjZ5cAtD54hyuTLhjje9Km6WriagW+beZhAvOsSF6O0KBBWlr1Vg7F6C5Z
	 Wx+W09NF3qScaHOb8NdpEySJOIErnVOo+ufSjv81DQ139iNa/tTA5UbW/KPnt17cjN+s6
	 227MRs89XYjX8UGWzBOw8baSNfH5/QbJ355WxrznSuUVELrKDyvd46wPdACTZoiju3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tUrssP6MshoZktd0NrO0Gm8SiEs8U5r/BOD5vR9U3Qc=;
	b=AvXZwCm6vqTFwn2lK9yItaC0BBFffV8g8k/y/WIhiATUntWRSeL4uUC9GJ2ii53ClNEE
	 IZUmfmirAl6I64BDHws1N53APXWJz8nc3nkZ6Dhi4GQkL3j+id1WZISWeWNsB9oM8a9vO
	 sONAq0but/Xt9hMAVFNRLB5Qxa5YsrVDjZajp3DYeZhM1IQZ34oQdgdE9+3hRgyTAeCLd
	 oapB4tYK8GfB5lwthmvnkhi8QyWfPhQd/AAwK5rXq5ttN9N4GNQ5+pox98jdf5vaSMxRs
	 mBsnlfA3OA4NwO3Y2o6TGE/R4F92mrQM7ZLSSaw3k9qru7tg26RgaODAwDUQcYf32Ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O69tEFB+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EED606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37EED606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O69tEFB+
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so554632241.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:50:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793987453; cv=none;
        d=google.com; s=arc-20260327;
        b=S7sA+cL5mNM1XnEOGgUjn7yhGX4Io1kWu5liZ+rcgEQ9ksVyLOpRoVRqYxAD7ES58V
         a0TR1pskGgbCJ6vFaqb4EafmeLJJ+kJb8CZWoMpX6GjdJ2yb0HX5o+0+UUIDmpQylBFp
         YD9fpQIUSZEdshc9w6yJvuBOuvFbKU5jkCvEylxSgt/O50tsyPVkmP8jtaORU9a+e2yk
         ZkMLPI4FzHQpOuXZftC9pbfEU5RVUIPlxdewu0owR9YiwANyNmTz0oBfT/mMrm3Uw22F
         QpjMwfnrhygbmibvQ7IRA9eqK12jeDaR/+2sTxV6AqYfBSubocOLKibnmtbJT0d2d7wt
         20cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tUrssP6MshoZktd0NrO0Gm8SiEs8U5r/BOD5vR9U3Qc=;
        fh=9/oWN01kUuHX3XuQ4mK9CrenPjrH1PIRWj9adMCG7iU=;
        b=C/xt5tNANUGRLu94m+J0tYZnZ1He/ZMwTnX0e6nD0BOL4UdWXSH6QlghX0S876fp5c
         J7q36nzEncr89yHr0HmIEagc+FQnffjbg/JAdoIbwRbAt+o/RxQm2175dyBo5xV1l93r
         zHZSaw9ts4eQ7dPVJIlRscWaeFKpEl6JnZwWy9Apr67Cz+NbaGsD7GY0Uq9buUf1leO9
         NO0gly00VIVAXrGshXqFD/tSRvqNxfEjN+vqcuRnBqmlkmjzlStHVYvUqUTDod+LRNEW
         eRew0BapBStPSgvm9z9TAabzm/81wmu4eJWk0GY6i7maQVpUvmShspNjolt9THKSxYqD
         GZpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793987453; x=1794592253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tUrssP6MshoZktd0NrO0Gm8SiEs8U5r/BOD5vR9U3Qc=;
        b=O69tEFB+86t4d69le7JGVkAJSLUUhs+pSPdJDO5L9+vt/U1REitlk6EVEKXBvjDxIR
         pD5cXL84BJWmFtj81aP92DOOfrmRIbhVMykiL+4glVKLLWd+GbEQMFf9xHZ4qSSikQwx
         oyCNeCwZgDAraksbxL6kOXEOER4ZtDMOsNuarWuYBDzAMQqTeouswC0o0FSuoVs0NoMM
         X22V8HZTYtb4zvbO4zuPNmA+651NwQckRlexb6wLllHRWGHXSeaonVl82cg3vN+u2Yf8
         LhDHc1XLAuhHQS9nXuq7ZCH4d9Iu8VNzwY3hPiLYI186XP3kVar/4QHB9O4sZt6P1DSA
         SJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987453; x=1794592253;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tUrssP6MshoZktd0NrO0Gm8SiEs8U5r/BOD5vR9U3Qc=;
        b=CNlrFD1RsFOA/KW9QNfmEKivRs6rq3xMHwAWtIT2o7rlEIgxGMzS2fHknLNyrsqJPw
         +Z0qD0CtFXLSUKTx2eyBj8f6kcsQ3i5KY+G7+lXF2tvk+dqLNaag42KDwMcOIi6O/Rz3
         MsGIJlIS8y6yuP8NZFlptfi9OntedUKYaCiIgIQ91V9keybxfRTC/ywm1hKNqqrftICR
         i04lVYYKOs9wcoApwQsnbEnQJP5ufMfOvBJy5/0pHVU6mEASjAsW2DFu2wzkk9j3f9B/
         oE57IUtO5g/r1yKPUlvi4M7WxMjUgfAd6wrPgj3AriDBlnSl0QBf71c9rVb0B1AUDmwW
         4U8w==
X-Forwarded-Encrypted: i=1; AKwUvBw692EYQiCpeCSxF+fr/QytPBj72Nxp9UV1qwIMBgQJEAnfL+y/9hfCS0yOfnPIgmuckXD1Z841zocaz9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x0a762+wrsc2rJJTvdihl4XP6inu0utjCnp0a0X9X6ptz1wIQ
	AnJ73WLt93TxpUj1aqV9D+Dc/zHgyMTdilXa+BJ7p0fZv2MwouD8mmcyQ9xKCR5EwXy0R9+/F1Y
	9F2GowhfPuEDZPEiRti/6OnNjJ6K7r5c=
X-Gm-Gg: AYBFou0ycVzr6aVQBMigdz8xGEF0HQECbCmu39FEusT7ShUkIFHhtBadXUqwBxxN1hW
	w+3jFsStJPnhtTwm7u/guhFPax9UzNG3JPWJ+P3d38QXXAK7GAras9RiI0UdXI+WVkV3F8S+4Pa
	FZtQM7oIWSoxfcw9q2V8HbsosDL6S2xgSgS9Ypzz3ST62BBKDnDN775ebvHGbp/odCy06OpiimV
	4t3K6/faYMM/LUqk97QcoMebwHX8BYR8OMjNZSyMHE5NsfAK7tYFTix3lgE4pNvngkpPHYxZfQ+
	5UnNQpG9nY4zIgUWkElVK4LjF9SAh6reuiNWmz8M4SMsjaVTmgTMqceRv0744DiDR4CO7xGjSNW
	ib21iD836S6JFIEtQx5UKc3gFBIACXcISrmlucnlmRIynRYvtLCOKjabSSsyQLiW1ppFyr1e+TE
	DUY34oPstw
X-Received: by 2002:a05:6102:3250:10b0:7d2:b199:670f with SMTP id
 ada2fe7eead31-7d2b1997cbdmr654347137.17.1793987452979; Fri, 06 Nov 2026
 09:50:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106172620.318113-1-joshua.hahnjy@gmail.com> <au4REhIF64b6TUms@gremlin>
In-Reply-To: <au4REhIF64b6TUms@gremlin>
From: Joshua Hahn <joshua.hahnjy@gmail.com>
Date: Fri, 6 Nov 2026 12:50:41 -0500
X-Gm-Features: AclHuK8iqUYH9uwHjDssr02UoFzrjsc7Hb2Jh_xgaQ_bcnovytG22SUXrSO7fWI
Message-ID: <CAN+CAwNk2SN0t5LpuQUM4t5itG_rj=u0Kvs=zpKXhO0n5vhpWA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/vmscan: consolidate promo vs. high watermark checks
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Gregory Price <gourry@gourry.net>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 12:42=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> Hi Joshua.
>
> Please send patch series of two patches or greater with a cover letter,
> with each email sent in-reply-to the cover letter.
>
> The easiest way of accomplishing this (+ our preference) is to use
> b4 [0], otherwise format patches like this:
>
> $ git format-patch --cover-letter --thread ...
>
> (You've got 22 patches landed in mm, I shouldn't need to say this :)

Hi Lorenzo,

You're right ; -) If this series gets a v2, I'll be sure to add a
cover letter. I just wasn't sure what I would include in it that
wasn't covered in the commit messages themselves, but I think I could
offer some more explanation of how this was discovered and why there's
no CC: stable in the patches.

Thanks! Have a great day Lorenzo,
Joshua

> [0]: https://b4.docs.kernel.org/en/latest/contributor/send.html
>
> --
> Cheers, Lorenzo
