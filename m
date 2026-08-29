Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B022D5932
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 14:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788013953; cv=pass; b=ZL9Z/vTjP8XG4wboP0hNGH/qOu2p3s1gx1U4qZVZtx0kUTkUEKVhM6Okf4Hm2da54cffuTfRhaAha2s8BbwNkO/MDcbUAEMP04AqhGDV0YdpRybOCpMtiRbWHF8CYxbaX3J19gYVg4etJ4hDkElHIG/MRuSmw+RB2AxyDs6X/vY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788013953; c=relaxed/simple;
	bh=bw9e0RkPAnFNpT6iU3Y4+l6yC1de+Muma8XPrpWZVgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q6BAcZiNfHvvm26ikup6Sgl67ayPdg2GfonVSaYhJLVwuyAwy7Co8gBJEz14RWqfVZjEluOJCrims+0LT+tmuEXECR7gSy+D0+HMAiH+4KiXjNdqZf1CeP9rcg3D2EkzX2R0ZVYRqmqBILJXLvQ/uhzFhfx40iAzw5m+nNEbchk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJvacSe8; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJvacSe8"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c160420289bso271280366b.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:32:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788013950; cv=none;
        d=google.com; s=arc-20260327;
        b=YojzZ7Z/TZp11CnUrD5pDwnb+iuE+8u64d+eH0ZZTOum6DY32Y6zhxzyyuF9sw+khG
         /4/KW0tMMq/pGFQHpsAMyhySnyGOnn09hhLgE87YvSdNB3sptooJSPB2bDaehYoe5C0a
         vGbtcFyhqgeQGtv5qMAf6WvxQUdjDwhBEPG+4uxZu+jjV0AMXOQT9tX5kBpKM+qA6b6W
         vp/x+7zYov36tL3izfRvX7hqAzQVft7EX2n52+/Nyuopv3AseOPDHte+3wH5xPmOi2G0
         V0WNE58zFmZILSOOSCVIF7StF2NH08GOreVqpHAc1H7cpJpwjGW+WqyX+9sg9wPwKr2q
         nfBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4hygF3KOg5K3j/SEn1AwfTDb0LJzxqqJ+rrQ/Ud785c=;
        fh=GYkxwrQvWLQ/uN2i4ipMxpn9YxepJzrn4Dwe0qd3BTE=;
        b=QKjtXh04A4oVQYp+tfUxrgyQSF7xd38pz5QLsiuile0x4XBYeqxxxtWisMuyVL/VDV
         NeC1M7/aordMxQz5j7UWldSnBTNIjR0EZPMbpkzkXRQXbKNv64AB+hG30tp8pIXapOpg
         SUsH/scH50o12JDx221Qqu4kdC52+FYAMducTAj8GVxAU934EwQh2KmptClARfXOKp69
         ymYsyjPNdM2h3MZzEVEzFx5FxMz+4znalyJAkJsD5ItEZKvt+MbhvzmaS41VTP2mO2IP
         Zfk5ecyEOtDnqa/MGqkaya6OCrkxt2ypn+ieFA8Gm/7aTVZuhwmaQW+piFz+gtFDKyuj
         NsSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788013950; x=1788618750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4hygF3KOg5K3j/SEn1AwfTDb0LJzxqqJ+rrQ/Ud785c=;
        b=aJvacSe8d8dMUG1tFKjW5ZeX6dU0OgdMfSIomUR5iMktRI+3Z40dN69p6OpS/rgrKQ
         BavwMUGMAqXtTNxvLjVGGCGqEfD/rCVlF+uo8zX9bYUE02AbvsuEqdZtP1afwj95ShID
         s31tX53rP5OPrkGsw8Xp+WZb2hULx6CbHrwRnmXP/ou+4hn3QiD82qN1S307ZNADQv1q
         qxZu0mkxG0qLBRa2oqQwrPe3zDbpCU4nO7ZIcUNgevTbU+HxvrUymqsb0ppCxxkQ3b9d
         eSOxfi+xGpcMrY/iAGPnA8pVXq+rOE0szRuH88fuP3psG2oKzH9v4GhSjvZSsOy8VmSb
         ow3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788013950; x=1788618750;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4hygF3KOg5K3j/SEn1AwfTDb0LJzxqqJ+rrQ/Ud785c=;
        b=DeEOkPynbK4bY+l5l2sgk4fkuSSTlQk+SZYMG9a8tkRtnYOp/FyrvIcmHUHMHC9flp
         V7H9pqpYqoYSxeyjvyDo/Xi4ZYeXHLz1yvIy4PLFdgLkTzuq7lof4qotM3e2UUG28BiQ
         jJ7g6o+bjtvoU5ZvsHIUVSdW3niBJMKOJI+aRYE95iKowUujiSX2UAOeN/0MJJnLT5Yr
         iWgYuYleOzJI5gM4kOMnbPYI+sFUUYldmtUeT0/DDILyDP1DSJJxl7eAQ8DQzqWBC/xg
         trBVgMVTGBk2Jwv4500v0T7kg762AQSod2d6pf4IqjYuQdpmD0+78HWuFp8ckqoUWhSO
         cC6A==
X-Forwarded-Encrypted: i=1; AHgh+RpII5ZGGL/QmtidlbI640/7Ayo5zwPeYrcVW9QRg+FXwXkJnZPqUZcv0t8QGc0LPOA5eKqE6aEGhSR0psE=@vger.kernel.org
X-Gm-Message-State: AFuF++lRqIV4qEbKKGSwt/S791y6f+uZDPK6FcoNTlzoSxD6fsnnHzpw
	Ekuhcg7WXWkvJWsVxtmINiMbAT4s+g5RXDHzU13aiYmh0n/ueRJ5geGiRKWNJwN5WBkMSFkcFTH
	crvOSsdTn5tCg7OIPBnhvg8Ktwmu8B0M=
X-Gm-Gg: AR+sD10O+NPCIslGsaQ07v65LQcnA/aqTdQdPbvX+LpbRijrx2/xsQ1jqWfkmudNfVN
	DM5MISDPY3qz/x2xYcjBiz173HoQGa5aSswZJbjU6VNfzVCqkiyBK9r1EKvecJiKB8NPpSnys9V
	4M8tV1swY9um/p1fTf3OjcppwD7Blukjs1zEBnWWFOLWoYpsJfnWoBH3HR+bKY8i6gwh1nJRYWY
	kLKbUdYprlIZBY1xGKnmwDhmMTLpzpWzCPEAwM8gQs5kubdev2vcPqo5qIJ7S3NkhO3vPBibkxL
	xJijoXJi9wIk+zPyGeZuf+U9jrkrmqmw37F9lo+BCihhLJ4ffm3AcjukqHZAEeEgpeME0kAyyoi
	B3g==
X-Received: by 2002:a17:906:99d0:b0:c25:6210:84e5 with SMTP id
 a640c23a62f3a-c256210a3f9mr776428566b.14.1788013949866; Sat, 29 Aug 2026
 07:32:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826-mglru-flags-cleanup-v3-0-d9f1c75549c8@tencent.com>
 <20260826-mglru-flags-cleanup-v3-5-d9f1c75549c8@tencent.com> <20260828052949.52874-1-lianux.mm@gmail.com>
In-Reply-To: <20260828052949.52874-1-lianux.mm@gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 29 Aug 2026 22:31:53 +0800
X-Gm-Features: AcwNN1U1XN5oJYNoIA4DZfdB5v_IkrXwFftUeLIhH3MOVieiywGaW9p9wEVYMfA
Message-ID: <CAMgjq7DONqF_TZaxtez0fVzxyNdiAzMBikM2nKdQojRqX_n-rw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] mm/mglru: use explicit tier range in read_ctrl_pos()
To: Lian Wang <lianux.mm@gmail.com>
Cc: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Chris Li <chrisl@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ridong Chen <ridong.chen@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Yu Zhao <yuzhao@google.com>, 
	Zi Yan <ziy@nvidia.com>, Qi Zheng <qi.zheng@linux.dev>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 1:30=E2=80=AFPM Lian Wang <lianux.mm@gmail.com> wro=
te:
>
> Hi Kairui,
>
> > Replace it with explicit (tier_min, tier_max) parameters using a
> > closed [tier_min, tier_max] interval
>
> While touching read_ctrl_pos(), would it make sense to add:
>
>         lockdep_assert_held(&lruvec->lru_lock);

Hi Lian

Thanks for the suggestion. I don't think that's necessary, though.
Nothing will go wrong if the lock is not held, reporting warning is
kind of over react :)
