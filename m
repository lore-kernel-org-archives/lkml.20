Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242161;
	b=uS2SvOi1tw6OyJpKJZAEcWZ3exF7Bolkr9tmhO8kPIebqkmbKeKl+t8TjXHaU3Xb07aT
	 Etp19O2oz312JFsFl8JjLOuCx1DZuLAiobhLkzXpz9tTghtBA1i+INqfMxO5fZq65L2KH
	 3kUb0a9EIf9v5Qj21478Yz1nS5bLqBTihAoPJVDay+S9HUSDxptzd2AuJD9AkVQWnDwFU
	 keuc58SOYq2dzXGeMVMqFm23O/1//tJXJFxljwNG92K4vzJbzucz0E9Un/C7keknT7330
	 Xyu15thywAFYQpzQK7rYpXkJsGz/9NS+qLHgB7vEdu/FtAijpeBLMB/7EUkiGHrzrcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=RXXU/zrEl8TcSV2xj8OBdFZs1lPljfbXu/prQveYVIU=;
	b=Namzl2mVwnGvBXaNHQnxyoOGv1jlt2q2q8seXLxGu2TwW/ELZ0tgJ/vLa/Lf9+lhQCFr
	 32c+FwA6LhAdRnph8TrqakHJo7G8QcZ7ZlB0PcZYyrqYOHn8V65LcII11kc78GPqrIBsA
	 euza3maR9YSelgXEog7DnLyEwYMW36CO/hNLYWPxKT0S7v6lJth15SUb2Q5YjvehoL+iS
	 5EWZ3B/MaPeupA+UPhZwb7+W9x5LS/9lTs/0ftFYjvTFimXxNU1CK5bu8/wJgrz8QGnu1
	 iM7MqC3WGmrtgP6op5qEvvVas9+ipmy+A4yzq5jbL2+YFTe1ZPNkyi9FIiEOEXM3Svw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=LeeYXujM;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA57606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCA57606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=LeeYXujM
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4ceaee6770so147082466b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794242159; x=1794846959; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXXU/zrEl8TcSV2xj8OBdFZs1lPljfbXu/prQveYVIU=;
        b=LeeYXujM+Yl+oA8EWPSk9RsZ+3gYjj3Zkr7OaSTA51Xm9pcVRdLk5xbJfAp/Ol+umv
         LHw7ATk431fizTbuAnJyDpegg/int+gjVaQAPWPFRLkrhYBBvjFhpLkmoVfXfE388uXv
         rwUuhfOCXe3V1M2oAWfksacTVistXHtBs9zRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242159; x=1794846959;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RXXU/zrEl8TcSV2xj8OBdFZs1lPljfbXu/prQveYVIU=;
        b=C5M3n03JhEo2hv9GCBbBNuGPUwc0BQCkcGPumkogRXA7kaPji9m4comWL9kwydT6Zb
         KTHtgi0nlqrjljfpWfJhs1NdVHgpuviHAHvNoCiIa04EaTJv58myOtuFYwszNaFemU3w
         AdnF1YSAGMjUyRllfW5f9+2ETOJxkXbk+sthXennv07lXxhDe/hQIED6PY6qxBinzHBo
         4ZGlzmEqJE0fhex9Oyh1gWB9IkkA7KlLq9SL5nycrBWbmVft2U7yUrHFn8gJ0vPzB51c
         zAOR/rPYI3JPtps5BJMDDvcuMMT7tjzCI5zTPaWMcTPHRgFteTMxeKjg3w+iJ6MoHktW
         Hm/w==
X-Forwarded-Encrypted: i=1; AL+hErGThigoGkCNJ4DNuCGIBbFJpNxHggBpJeKFVQ+aiKhy4Tnc/dfA1Wv5NtJ+6gihEsx3EE9eLaNppBahZBU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ELrb3MRu1qOOQWok1LuxtEenyyksTDHkLPY5gEX4Ywbs0/HP1
	8TiT1KHYbbxACbpPVoWk4rag+oJfc7LKsvIR7ojSzhZB5frRGXvdJdNpjkHTlEZnSyRX25Vk5bX
	EelXI/QU=
X-Gm-Gg: AYBFou2EoqGHcZmU6s83u2EOckQBF6B3/DMdDIO3S0CIExgU2iQQXxVnK90ghXvGv7f
	4eKFWsc8t1jlY2d9UK0Is5wa7wef+9R+SuIIIvQp2JSR4NScT6BcjMb6WyjgD6Vtja4SVrwqgHL
	WJSm083ieV5ixzIBuaVJsb9YdgB3+1vbjrS1YiykCL+jjlXwhVLlTqxPy4Fn8cwc0GI03zpJJId
	39ACmNBv9W/GM1hxS7Af+ACTQ6Syf8hW6ahWYiMxaYoIJohOupDPyR9vPC91ntRbIsTTci2vZ9s
	hIjg4t7PQw95y0qp1aOKmUxMREeamK/B+/U3h3QLREJYILdshgJw8piV/U9nOlM1a+sGkGgXWLJ
	+kEaKkWruvbEELQ7RM2aExFk63pNqDjbIjwMxFXWTFlzybZHFYOZWLTT500K9WWbeGR8BB5tHzr
	sA7cMF3EhbVqK9zm4EEeakzrYY8WiZ43fgPrteZGSGNJUG6Vfuh0jevXnjyXrlqp+WbekFBg5K4
	o+sz7SNE7LuYRmsRuxk/ZFgSc4EFkqRKrK/eAk4+CP36531/EeimS+Uql7cNyLmZ+9zCLYEj80U
	20Dp3FAt1klNehE6TxQJzSTjmnaWa4L3zJiHF5j7yJCKGhFvqEzYZhA0Sbd4ZiKibM6vNE0NqQI
	TYg==
X-Received: by 2002:a17:907:c0a:b0:c40:36ca:9d1b with SMTP id a640c23a62f3a-c4d6dd90a72mr398294266b.40.1794242159191;
        Mon, 09 Nov 2026 08:35:59 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a999358sm188223766b.78.2026.11.09.08.35.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:35:59 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso2476493a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:35:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHqDKtQUeOi7905w+ds5jU85JW9RGoikV78MnvL5Y1agU3gnCf0SDYoRNhHQAHPnilJhFnepPeywylD6ns=@vger.kernel.org
X-Received: by 2002:a17:907:d23:b0:c4d:4ce1:e2b7 with SMTP id
 a640c23a62f3a-c4d6db81591mr423916266b.34.1794241699892; Mon, 09 Nov 2026
 08:28:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104130118.2507513-1-kas@kernel.org> <20261104130118.2507513-4-kas@kernel.org>
 <f21433af-afc6-4a8f-8d2d-3a377cd3bd6e@kernel.org>
In-Reply-To: <f21433af-afc6-4a8f-8d2d-3a377cd3bd6e@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Nov 2026 08:28:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=whn=xc9J3qApHWRGTaBpwVRtGbvJ0LURGF=dqC9B3swUw@mail.gmail.com>
X-Gm-Features: AclHuK-PHrKxDKHmHgqeqU9KXvHFHYbJyk2lhNjfjS1J1daidL5w5IKJYicIRls
Message-ID: <CAHk-=whn=xc9J3qApHWRGTaBpwVRtGbvJ0LURGF=dqC9B3swUw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 03/18] fuse: don't move a folio with PG_rcu_free
 into a fuse file
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Jan Kara <jack@suse.cz>, Hugh Dickins <hughd@google.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Harry Yoo <harry@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, Luis Chamberlain <mcgrof@kernel.org>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 06:46, David Hildenbrand (Arm) <david@kernel.org> wrote:
>
> Could we get rid of fuse_try_move_folio() entirely?

Please. That would be great.

              Linus
