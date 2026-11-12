Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794490257;
	b=kQZYt4ObL1q2+oThVo8kGAT+Sl9zJVim57KI+efbn7KTl/Q33J6BUyECYI6E5acalCqY
	 UcORyNibafvB+qIBv+LX7qS6xse7UVreax/mbYgOCLxfqf+gTLfiOjoPuwfJW0dXKnazi
	 dTl+yeBroBFd9VBX0ilI6zqz5TEQLXc4v4S6gW/lXhlqnwj/SRzQW9dKSCmu8KhMFQHct
	 JkuP94Cy+eYJS0zMiHrlVLbUItVkAmoAbaT1Y6t/gtBMp+jNK7+2ZjiJrutaGPQglMlWa
	 0PQrRwcZFoqpJ2b/QWE2xOjmXVw55SGQgOtBQ6V+xx1opV5sJQGAN+Lgi+tFV0nUvjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S1xZYGW3sp4V9GD5hAamXepdrQgJ2mYyugoBZizhATM=;
	b=d3YC6YQ9PAP14WIhQN0fTIrXlHL0IfrQDCvGOGhmcYnRIoQqvwfbIn4RUlgwJlFykxj5
	 7c9uLYvXapMYiEodGQIlNqi6GpbHBzujblU2PnUQQesi23aoIbV7dXkFmt3peczlvrWxJ
	 LfzJF974UCIEWr+QYW8oUnHqX5wNmvEW0pSRbcaMdLA+r7j/F2pxyuzUfy/rteNmtzP2u
	 AGJGvocO2yHHOrZ73acryvss826LngDP07j959lN0G8hmI2aq0+ePZ4Ofa5UFgQox6GGC
	 uNeXcePwqqgNiuryDoURwz6Wq+H8bm15O9vaUvJKRW/1B1Ms5UUJJVBRbGAo4CxHi3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OAMZCKUT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526AA606A880
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 526AA606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OAMZCKUT
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490d59c3edaso671964f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:30:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794490256; cv=none;
        d=google.com; s=arc-20260327;
        b=csWxqlvNo62ua6m4uLTaX+Hr17L0g03OX0SS6Lcxy16VeDPspVwRF8o7PlomzbXFZr
         CIpNqTmzyA1F5AAcfjFR9FapNzGg8PtlZkhS6GZyytczGsCN/DnXy3qETvF9dVRfPDye
         YG//hp+q0AgVNixo05c/cqZ26aRGKlLaQzhFl8rIoM7gyx3+IA2mLvhhn2p+OOHJhBej
         wngfkPaYQcoJTCzosmXfe7agDL75kSLsqj0HZ0TwfvM8I1z5GrZeN5XqAa5yOa4N0Ap5
         QunFih3pZyg5exeCoy7J5vNFR0VtvqQQBngLDfcPWfNWeSeOKV8+B3ABSLLIejmByV8p
         sVtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S1xZYGW3sp4V9GD5hAamXepdrQgJ2mYyugoBZizhATM=;
        fh=6bb07JDcMIl7WKedKWfGbjzJXbkuqJmn0c+3VMASj68=;
        b=VQbmSjba+wOwgEndJYvHFtJaKyrAwDnYR7UdwP4ptmBHVIRCbSuKnM6Pkd3/TSasTU
         Hg+0JEO9V3X+g6vT+ZZdzcRagser/QsD9lEQbDnSE603+XOcRSL2BOm2ckbh4iujvh7U
         8oBlP1CqiYIVO2KP0tSMNv6iAyMM1zjblCTxkRz+p2vDCvfdh/ELarKQxKV4Q1YtBB5K
         ri1RIlWmuNcNj/3Ybtwcr6nwy9f6gMPJAnjA0qysipxFJus+NxvHegfbLTKB2/Acx5Rg
         kfKnDa8X6k5YPOtDDjMbKVnnndO1zCCNTE3SP2lJGlYeSH/JDy1fIt4+vKz8aCU2gEiE
         w8HA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794490256; x=1795095056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S1xZYGW3sp4V9GD5hAamXepdrQgJ2mYyugoBZizhATM=;
        b=OAMZCKUTw3l6QKgGiSX8VX6jr2xJ0IvEcRr9aN8o+RSKzS0Ud1802z5BmqWJ9NxpS9
         o3yLiXe7EpfLOU8AotMwhaxYDX4IYn1kaXcRWUjxRNpbsVVTbOoX65nZtlh4BRg7T78D
         MTxgNivkTdUXHnu2V/QGcXltawmwZRgBJaZ0sSaelhIj00Pme/vMlmyVyUawmp6C3OCW
         1iC+F2PRLrkgfuby5NfOjvtseFVMYZdoGPviqrzEx0yJTu2zE9Qu083p+IxoE7l30IGw
         8rESjm9DJhyoCPUVWYMRKsEyZzYzcOZZZkiu1d81jda1IdrKguAiClSkm1H9k/aPdZ6l
         hBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490256; x=1795095056;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S1xZYGW3sp4V9GD5hAamXepdrQgJ2mYyugoBZizhATM=;
        b=FHq1xlhWP0EX/Q5w0cJTQ/7zm2D5NNik7Pr2y8AY1YeCYPMZd8bBov+wQ0LeCQsmEr
         Pue+FnhkIlqdNlcXNdfn62lNkI9XQzH+PsGCwYHzer6PPe7khgFrUBkJ1gB5Wl4FP9Qe
         yIV73qPN+8mFkQF0ehf4a9PsmFXW0GFZPQ9ruQKpvggbgbd2yW69jPKxwxQeardJj7vT
         VQik3IqmQ/03IyzmESOLicIvNHDZ54OeRLMFCSZ9mjEMzwLu9rexiRWSZEWQg3mLWuaO
         E0CJrMMQLGU7xRA2tYTmvyfewbMXY+3/rueGqfDKqkGfxNzHXAT2XwWn1KnOIUUMx/qs
         Ddgw==
X-Forwarded-Encrypted: i=1; AL+hErElNLYBsnuQPtxoHB/VUDYmTV7d2HmLp+w0BAC1ugc8Ob3FxOoClVz43oVeGPf1DntMU/aMMTqrAD+1gfk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Uy6DXrfxUkn8W7IEzSXPtVeORjzVnYKsRuSMbnL8YBY4ZzO6V
	x1EbyIjPEvP8Zw5FIfzY4LnNatY2YiaJE8jhQmP0a6eO6ILOUrxMA0q025h3plVLG+HEhzk0LEU
	P2Lrnu+WW76pb8pUorAaFuKgBgeDutIc=
X-Gm-Gg: AYBFou3ZxRhfBSJ74ptwtTH0WZLBEHffexbPfTPmSBOnJjSKYjiQUep9sVffvw87cy4
	C/akO/m+2+724ZjK907uEorGldnf8tk/VBXhgw9iufAOGFeO3aArth72yjlgIPSG1SBVc43ruxb
	UMJB/P4txxYzozFHtnflICSCJURt7iNZ3ow3XE8WPFTV+asBnrc6z4FdAeK3ocu+Ar9GmARoFYn
	cK1pkJQLoWtDfz5q7is7T7iOXxZjAwrPf1IBylb2gYLHy3b1HtqxdXBjYr8QbaLMr/AI1E2eOsx
	96wC8GysS50wH/2dzhhfUqFhvW4GiA5+XE0QFGiEjMxyPXcdGX9nOLxw+7hhsZEgiYRE8uHBuhW
	UiNWrm6NH/M2ZTR3pRYeJHMuCstqooHe+16KeiWIbp7HRE8u9nFGRSjHHZW6SqVOMoR4LWd2zZH
	ayZLPv7EhcZN3S9jojAQWcZrK+c9tU61ZseIjqu+PuycbeNRDhF7eZAfAlDbkZOYTlH07KTogF0
	Q==
X-Received: by 2002:adf:e00e:0:20b0:491:632f:2c8f with SMTP id
 ffacd0b85a97d-49afe168872mr4263229f8f.2.1794490255492; Thu, 12 Nov 2026
 05:30:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org> <20261111-mason-migrate-et-al-fixes-v1-2-3d2454362e8d@kernel.org>
In-Reply-To: <20261111-mason-migrate-et-al-fixes-v1-2-3d2454362e8d@kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 12 Nov 2026 06:30:43 -0700
X-Gm-Features: AclHuK_EMQbfmXamV3TaIqS6catb5--28CKUD5GkvfpyfyoaKenoCKPieGjScZg
Message-ID: <CAKEwX=MDNW=tj5cfSrAN=VG-NEd2cax6f7QHcPfGDc1vTix+TQ@mail.gmail.com>
Subject: Re: [PATCH 02/13] mm: cachestat: count each page only once
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
	"Dennis Zhou (Facebook)" <dennisszhou@gmail.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:14=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> From: Chris Mason <mason@kernel.org>
>
> It turns out that filemap_cachestat() can unwittingly return incorrect
> page counts, if large folios are present.
>
> This can occur due to underflow - nr_cache is nearly 2^64 on a 64-bit
> kernel if the input range starts more than 64 pages into a folio that is
> split during the call.
>
> It can also occur due to pages after a large folio being skipped if the
> range starts in its second or later XArray slot and the call reschedules =
at
> that folio.
>
> Finally it can be caused by pages being counted twice due to folios in th=
e
> range being split or collapsed during the call.
>
> filemap_cachestat() walks the page cache under the RCU read lock only,
> and for each entry it counts the pages that lie in the range. It does
> not track how far it has counted, so the counts are only right if the
> walk returns each index once.
>
> But a large folio can be split during the walk, or small folios can be
> collapsed into a large one, and the next entries then cover indices that
> were already counted.
>
> Resolve the issue by tracking the current index as one past the last inde=
x
> in the folio, and explicitly using xas_set() to set the current position =
in
> the XArray.
>
> Additionally, add a check for folio_last_index reaching or exceeding
> last_index and break out of the loop if so.
>
> Fixes: cf264e1329fb ("cachestat: implement cachestat syscall")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ ljs: updated to use curr_index, fixed comments, updated commit message =
]
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Thanks, Chris and Lorenzo, for taking a look at this!

Acked-by: Nhat Pham <nphamcs@gmail.com>
