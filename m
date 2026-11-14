Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794679726;
	b=v8IQmcO8elr5SOoB3YwSQ0gCAA3QEe5Dt+CNQFS9A5UNU7Gjc8ac36tR/9k11P/wRGzo
	 tdWPDuyEzVPitTlT9ofr+Cg9NJDc0gbH5QDRRPOW1RnPK3TgjrrA4g2Hv0I+s1H5NBT9i
	 B35hGuWDlFq2Ye7rmXpi+mWG4ktOCaZIV1g7DhX5QVY8BkTKAd3/Du0yuOBhsxnxXTcLm
	 Hr/SkkY//edJHELitirVv7nWo0SupT++HM9DuK/GpEEDny8VSueBTr3TTW3V/duUbkSF1
	 ZkjKrT/srKbeZ1svgLCOJz+gWPkZLL5o9/pHYVINS5fS7z+FOHxrEUtjKWsuRyRTJsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RvhLrxGhqHACKbn99b5AMFC48BGMEpVYG0nynwtl6E4=;
	b=zh63y1pIaaL7Cc1p3/PC8rGwQ08aHy9IS6o9yqJJ6a2I3Ge/ObtnOGxMOMGkzTT+jzjt
	 PrbO5Vx9BFqWYbYjFkEHuqE+g1ZtMoxPvHX6Q/R08D30BBJi3aJ00YRVzHJRFr3mF+gW/
	 Im0D9dlQ22TmRbkprF+sjibeD/5p01gz/XglknF2QBdIKKzXfss4E4kmiJuQ4Rjs/qGP+
	 Jh+hUf1KMbSg8eqQlhNbSUMxBupEIdNaX0OaHyGaFmdx+sgI1HDlt5KsEPtJjD0JeR8Dd
	 Y6H9XxSi40NlbHDY/ERpBXAT12uwB42Gqp+Jjubxxalp+mefHAyvKwyGLDqkszdMAqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sCe6MTmG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5C3606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD5C3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sCe6MTmG
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso2177005e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:08:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794679724; cv=none;
        d=google.com; s=arc-20260327;
        b=FfrTZokZps/Eeds6rG4WR+wE5aLtHkGgYTULVR6dGJ3LmAIicascExfYlaocGk3cmE
         82OyZx040qobGfp2II7kPS9HfoNqcFptUYhIHIJujkSXLIbsQwHdCZClnZh8fWI5tAtx
         tmiVybOZhME9UZ1XvO+o6261PJs600DhCRut6mwr4/MtXj1yaHwKmYxvEfwG/82t32OH
         qgeURqImWkXseCV3s9dzMBB5jzdziX2IPDZYRrbZqDzuNfsQ7Hy+7roDplhL8nf/iA7X
         VuDkKPl7uFgVbomWGhL019g6ltYqyBMXx5g2AqA7kV2767hAt87gAnBqDUC0oE76gabi
         ytYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RvhLrxGhqHACKbn99b5AMFC48BGMEpVYG0nynwtl6E4=;
        fh=qDXBwfdy+5Mn6U053pzb87LcO5Sk9TEaAoPHqHFj5js=;
        b=mxyGfmiiP8vHO0goeiV474DYn8Dgh1d8JdmKNrsuNrQ66tnh09mB1kfUuRw9BALGF0
         W1p51UJiY38EKKrKMsS7V6EETDctwGQMUVllRtsAS5csrloytESdCiCbNtSc6QKK3XDV
         HJwIbkrOY9iaCNJHBJvuqd5T1ZECrW6WB3JUhbFzp//De/64YqeZ2XL+9cNuIOh1S7mJ
         ZLwddCAW00yrrbDaykze9bKBYMMbOxVuGMv95EvSr31InTge1mUVOdXo4bfkfgmaHaH8
         ExpmEgJJonlKGYd/FYJy+Bu9nIsxYj7l2whfcPzHUOt5go21hJzXGkM1ZrdAmOIOh2b5
         Tu1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794679724; x=1795284524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RvhLrxGhqHACKbn99b5AMFC48BGMEpVYG0nynwtl6E4=;
        b=sCe6MTmG/PTU3oGU7M4EUL95RcZHJUHhAI09lpNccVD9WepyZRp2NA5N5pUSigg/Oz
         cUKixAqonUznmhINZjcuYomHOdycftKzYvGh/71hxyd6qvDnJtBsdtu4bBOPjZu6FpHm
         YnGNBQMSyiMlmgK6h2f0Q5mT68XBdI0yis2GwkoRk+D6gFcDbYohb+T7Q5+jisM43arB
         0JKwbEHXqGwHw8R479k9LIoymNiRVjl4vt7tBby245/HoZyaY8K50PpVzuM56Jgc0Bt6
         S6Xy6VuRYI9TkO4+JNV7fbRbJ3w+qEW1QFE+9hxX6TCzf0pjo9rgmlDPQvHB04dq2Kvk
         kMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679724; x=1795284524;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RvhLrxGhqHACKbn99b5AMFC48BGMEpVYG0nynwtl6E4=;
        b=YGj1YS47f0NGX7HDaWIsSaBEjGfivD/gQTh11lsTfFOFCHASEDXewxhWjaVnTPnt5i
         M5HbNybh1UeAioDFu+WE9206V6LNYzyVpAnofuYlDEpFeISxI5BdJeQqJDp1q4IMvbVL
         ir0v09hpDJI/1ESYDUa/U66m/064eW3eM9R8fi7ZfL9XxTY1l5sPyg/13hmFhEutatPB
         FeCgjtBppd9dWUP5iXSS5xfkcI4xV7CX079Dlz4ncv9BPK6WW/qTq8z/Kd+JvfLZ2z3V
         eMnEVRRADLKr9HfsUbHleE45y205keimOCnLqIfyKKiMK3lHuYJx5I/kNaiPNmCufHV2
         rbYA==
X-Forwarded-Encrypted: i=1; AL+hErFtoTE3aoUk7bD6ZST4Kt1iyWKYhoOlXV+RRXkMz2cAKkPzi/V31vvZbRHcozVZT8ZRJAnJlKT4sqq7KcE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JWSkiU/lRvDvC3KrMADnqAVx0tGIDHulRZ+bR4jOb+a4Ca21v
	8bR25R1zXI3PQvmbngZVnE/pqTJfNnK6FKXh3sYIAF2C5Ys8WcPHk1bkZQPa90MGdgPJAWXyHnL
	wcpvV+zQiLad1l90ac0RT2GdmBYjMph4=
X-Gm-Gg: AYBFou3mv0a6V6qh1IlDEPnhHelEc6UAk686jD6JKgwyRU9s+f6WR9QHBpHe/SNwwvG
	80/71o2AiFAFnUd9uXdSMc2TgWbnsjmg9VYLpUj2wvwb6qUY835C+ZzkBoxPqJ7nAzKKqIVgtvp
	ZM4BktphuqcvnNVOjraL6uD5OVAd7dYPqGaeUlcDkGF16n7UChSHBHVDd6Tc2Hp+aBIWSKhtJDB
	+eUifJuZx4ggWFBUoDDxPZidzzlQoiEQfFVvjl0aiEW+d84s1AmRaMqBkNOCZL7y5ppbKq9iVyk
	hMaRmCU9WR0WgbhTZ/SmbYdowfW/0ffJ9tjDNKA15Xc08MyvEiHYvR40QzgWZJGIzhOURKEjaoA
	f2Nehmo6SEtX6OPJxZdOn0ljvoPEx78ztJ7qwPvffe8zeynOKaGUVoU17+qMogZDPoonvZBmR9e
	0cWH7/u6/KAWBd9fTQQaN0XXik25qZyo0ChOqV3WCym6WwQlyp+kmQ
X-Received: by 2002:a05:600c:b99:b0:4a8:cb23:f71b with SMTP id
 5b1f17b1804b1-4bb55a92e7fmr127107305e9.18.1794679723922; Sat, 14 Nov 2026
 10:08:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-mason-migrate-et-al-fixes-v2-0-50a2ed382b61@kernel.org> <20261113-mason-migrate-et-al-fixes-v2-3-50a2ed382b61@kernel.org>
In-Reply-To: <20261113-mason-migrate-et-al-fixes-v2-3-50a2ed382b61@kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Sat, 14 Nov 2026 11:08:32 -0700
X-Gm-Features: AclHuK_ELRI1TE67xJqn6AwyBkxgPS__XUAV3eZlpMOL_-YZzAJWxxy4oUoG69c
Message-ID: <CAKEwX=MmKuFwXpH5f8MtfJteqgs_O+xMUCNkNK4hxuAMpFUuVg@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] mm: cachestat: restart the walk after each entry
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	David Rientjes <rientjes@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Usama Arif <usama.arif@linux.dev>, Kairui Song <kasong@tencent.com>, 
	Balbir Singh <balbirs@nvidia.com>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Yu-cheng Yu <yu-cheng.yu@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Peng Fan <peng.fan@nxp.com>, 
	Josef Bacik <jbacik@fb.com>, Chris Mason <mason@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Mark Brown <broonie@kernel.org>, 
	"Dennis Zhou (Facebook)" <dennisszhou@gmail.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 2:46=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> From: Chris Mason <mason@kernel.org>
>
> cachestat() can leave cached pages out of its counts. This happens if
> the entry that the call has just counted is replaced by a larger folio
> that starts in the same XArray slot.
>
> The issue is that filemap_cachestat() walks the page cache under the RCU
> read lock, so racing concurrent collapse/split is possible.
>
> Thus, an entry can be replaced immediately after the walk has returned
> it. When that happens, the next xas_find() skips the sibling entries that
> point to the slot of that entry, since ordinarily they belong to that
> entry.
>
> However a concurrent collapse_file() or __filemap_add_folio() (when
> replacing a shadow entry) can store a larger folio in the slot, in which
> case the sibling entries belong to the new folio and the walk still skips
> them.
>
> Consider:
>
>     cachestat                         collapse
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D                         =3D=3D=3D=3D=3D=
=3D=3D=3D
>     count a 64-page folio in slot 8
>                                       store a 512-page folio in slot 8,
>                                       with sibling entries in slots 9-15
>     xas_find() starts at slot 8
>     and skips slots 9-15
>       /* 448 pages are never counted */
>
> Also consider:
>
>     filemap_cachestat()                  __filemap_add_folio()
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D            =
      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     counts the shadow entry in slot 0
>                                          slot 0: a folio of 32 pages
>                                          slots 1-31: siblings of slot 0
>     xas_find() skips slots 1-31
>       /* 31 pages are never counted */
>
> Essentially the fact that large folios might be present means we cannot
> safely continue the XArray walk, and must reset the iterator each time.
>
> Fix this by resetting the walk in each loop. This incurs a performance
> penalty, but given that only the RCU lock is held here, it can't be
> avoided.
>
> Fixes: cf264e1329fb ("cachestat: implement cachestat syscall")
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ ljs: squashed 2 commits, fixed up comment in code, and commit message ]
> Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
> Tested-by: Gregory Price (Meta) <gourry@gourry.net>
> Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
> Reviewed-by: Pedro Falcato <pfalcato@suse.de>
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Acked-by: Nhat Pham <nphamcs@gmail.com>
