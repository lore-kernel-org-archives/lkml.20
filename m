Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013385;
	b=GIJ7l0lKKmndO9QV/8eufcUikZTiVkhHYPTV/OAe4tdfTuRaCHnSIwpZYE2uRAuqJujA
	 WGF7tlmGLUG7XRK2bXabv4FQgaI5c0efTi2rsbWUrcPxcwI9D/GG7p75sEtCSE2DlN7Qm
	 zkhgjIt8nrYS6kVWk5hQzExeX//re66utY4VRiEPf4IahD7wKIMImT3d/46rigPU8BuJA
	 OLPxWQr7UMhgezhANT9qJ1Rjjdr6GUfFFjvne13LmI2I7JTU7IcO3Ldy14rGc6j7Cqgtc
	 LWXbSsbSgE8aP2zBfRaD0ktY54Za7/ElMyi9R42U+6VUuBsOZL3jo4osreVE0URoY9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID;
	bh=8rYpsphUHQN5o3M8ULTGHPBVlkOicoYy0qDzZu7+FCs=;
	b=wwMqUKRPO2HCEYnEmQ4zCFmgMQRymF3WoekIADDhBL3+Wr+qJqOjxaVXumslPPEOOBM6
	 QC1qhRF947XStLBxNouCYI5L2Il030h4cWuGx51I058lbHgOBdP9FH6JZ3puypo1+ECVZ
	 un/vFp9A2BhtPRFTfmsJDVn26hnbHdkveDACmFq2NmjrPDRby/s4RMrZ/eZ+eMKs7zO5G
	 tomTjnTf1xX1BKzvzt5hXc2m3YdDxD3xXmF3so94R5pcuG/bLFGbgnGvWwJVEoKkMqpNw
	 /7pBT+ieG0YiIGV9cSlk3Ch1+puhTkxowQbMzpfb9oYpUp3qXiqWXcsUTUHhDvGdx6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="I/dtqwDD";
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEB2606A909
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EEB2606A909
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I/dtqwDD
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3ad6011ecebso523762a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013384; x=1793618184; darn=vger.kernel.org;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8rYpsphUHQN5o3M8ULTGHPBVlkOicoYy0qDzZu7+FCs=;
        b=I/dtqwDD+Us8GmtNcipj1TAJUj0KaLw0UGElvxdGiC6GFTaipKaMxmKYfVJM/J8A3g
         LZDueCQXvm+fkRUt1+6MFXcLZe7KvUfcMYFZmNSWhmDWKd1WPLTnBPr7EYBEdXSBUpQu
         lNxZgRF9VcSUrMccK3PADA3Ka26VacgUAyEGqCBPwXpqHe4MhfNK/y/lzUzfTnuTheD+
         Ufw8W3owRzl7WKbJe80ThKrUI0Tsp4ES1PPESNzurBh+yMQCGPbll5Q040uuajMcTpio
         8H06DjNzXoFRYqOT1mrVcEKAYkRCFtf1wOEbPjO9ipkw8V+2xuzmDT5Lmu3WeOLd88/7
         UH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013384; x=1793618184;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8rYpsphUHQN5o3M8ULTGHPBVlkOicoYy0qDzZu7+FCs=;
        b=VKSFn1wDTWAOoq5S2LDSIEMAZRQT2bsfAHndJ5xI/xZcIp3cCceDQ/b0Js3ogKIyFP
         J1iWfVHusJ18GeaxGr+Ln3uqxvZW9PujL1lc4z3SwXLGLVp4BlJCrqvxNR9UmxBUCzrn
         65q94N679qCpTmf2aeyMMbiR5BPYO9YRqlSobsYzrRhrqWs/r2pzGJmMbZW2VcfoCtHB
         zhnQPGxi9qzPi4pKM/F9uzdsKSyGYt63AxPKarqNcSVWPflJDOeRLriEy1JvcP1LH3YE
         FPrieE6CNnSAAoYIs3nEFDl3TaQd4LhHePzNpUpF290+vWIZh1KXMixbVTLA3Hk6m+kL
         41iQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0Ue6waiayfFo1e2cyTojftLqnGcdph5/fKU3BNSPD7vTF1yYpJ8rSsP8+BNbjO/7VRClMVqFYoqxAcjU=@vger.kernel.org
X-Gm-Message-State: AFq9FYISFrJZ6LIqFYXHtxHANjw0MYd5a9hZ4zEhkybZuT324sCnPzw5
	rZnmVNSPPml2siLUJ7mfWamIY43XvtFyeqUM8KKrO5Hdo4yP0e6fI/bY
X-Gm-Gg: AYBFou36xyybpNeFlwLzShGNEgWwInv1DSRkheEQJ3IUaxfVEvzqoSULpe2p4RUWyLF
	6w42R147pi9BIjlVpkvr+0tvRyZ6A1dRseB3qwXxx0DOcyIHKvEQHYiTIS/oZGghcXvAbi5FU5c
	pgH9YlZpZsaiQLgdeerP+I4Khk50U4KYIRHnWlTUARRbrYNl6sJB9lM+NaBp0E1VJNYegl+vZ41
	NtZnhnGnNXiI232b9jTyr8Io2WzGnZy5uMr1fh7mmopwMx/ZwojYswt3GZFDGnXeeKx7UalDqgj
	ZGhdLgSkv+6Km4JZhSdWenyYiLhI9ipRuYgj/W3cRt2ojjVKhcT5XTM0B7c2mGeVt9PG7ZGa493
	NeWi8Hb08aWvQs6oNC3HKBqSr2qR3fFIz9dzFqS98v7KDNt9O5ZmwtJh54UzMJme9tzw90nRoBr
	ycAxhoYY2EMef1O0EFwTZRksCtZeEoCk0luwGibqEghs91hBN18ZhyjuwSejVm5WJjfUMgq8gOg
	zCas8MQXNgoL7B4c/8aT8f4V0vpX5DVVpZhmKANd/ly9BYAuXXwWnHztQwdVOMv4jP69FSGSDUp
	6kAgvdLiAY5PNaKIsOvRdKifM+IlR1fBXKUqS7Dgtun+E2AaW0SKDA==
X-Received: by 2002:a17:90a:b896:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3adead4dce8mr3439038a91.46.1793013384321;
        Mon, 26 Oct 2026 04:16:24 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc90d74sm1382169a12.20.2026.10.26.04.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:16:24 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Manuel Ebner <manuelebnerli@mailbox.org>,
 damon@lists.linux.dev,
 linux-mm@kvack.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] Docs: damon: fix grammar and typos
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
Date: Mon, 26 Oct 2026 22:14:32 +1100
Message-ID: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>

I was reading the DAMON docs and kept running into small grammar
mistakes and typos, so here is a series that tries to clean them up.
There is one patch per document, and nothing beyond grammar was
changed :)

Some fixes pushed lines over 80 columns, so those paragraphs are
rewrapped.  Patch 4 picks up what I think was left in lru_sort.rst
after Manuel's recent fix.

Based on damon/next at 9d301805e3f6.

Thanks,
Aveline Noir

Aveline Noir (8):
  Docs/admin-guide/mm/damon/start: fix grammar
  Docs/admin-guide/mm/damon/stat: fix pronoun agreement
  Docs/admin-guide/mm/damon/usage: fix grammar
  Docs/admin-guide/mm/damon/lru_sort: fix remaining grammar
  Docs/mm/damon/design: fix grammar and typos
  Docs/mm/damon/api: fix verb form
  Docs/mm/damon/maintainer-profile: fix subject-verb agreement
  Docs/mm/damon/monitoring_intervals_tuning_example: fix grammar and typos

 .../admin-guide/mm/damon/lru_sort.rst         |  45 ++++----
 Documentation/admin-guide/mm/damon/start.rst  |  10 +-
 Documentation/admin-guide/mm/damon/stat.rst   |   8 +-
 Documentation/admin-guide/mm/damon/usage.rst  |  31 ++---
 Documentation/mm/damon/api.rst                |   2 +-
 Documentation/mm/damon/design.rst             | 108 +++++++++---------
 Documentation/mm/damon/maintainer-profile.rst |   2 +-
 .../monitoring_intervals_tuning_example.rst   |  28 ++---
 8 files changed, 118 insertions(+), 116 deletions(-)
