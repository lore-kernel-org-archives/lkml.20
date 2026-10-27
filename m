Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101048;
	b=Rm6Ay3HzegN5Amtrts5xP8mQnWDcs+VYKmDpj4nBQapY2WYFp9bN7+xXHrbaeRjIds+3
	 LLjwyk05tJjffBbvAbXuuCuvbvXL9mD8UrdwF5Orus0M7rUsOU0ucH60VjLE2dLqaSbsP
	 jVqVprBjJH9x2+pO1NYIu2rTntXMqr/6fZfK+vss9QkxG5K1SSVaQe0jz3V4QPZNmL+6s
	 UdRmyiB6VGVP5/G2jZ0yUJDndP3UHDNK12934bcSvPRzbfaLoLBDBbrEoTlCpZdY11wUi
	 QdRzHqle3C3Qvb4QR3vFEJ3tefB3R24ZEb+BnGUpuuQmyv5bY4bVDA4BtSf6DyTy/1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=B0AENkjEZYL4fzS8mYn3YPtPPkm4rS6Tf5gq0kxi7XY=;
	b=PLUpvVSNZSCMsFxuCjgP7vo3S/b48ihiFvQ1OYwlUwEa6OKK+wyV8r5+VNSPgm9VgloN
	 K4Du5TJxepmDkY+BDiBPAvWflcTb6ywBbDRNMAtTv6vDf+AK5tUWoq1GqDHoYThnExhog
	 rq9lzxbq/B80zh325RbxrTSNILKO/A6msSeGcbd5ES3RJbealQYRKdWolBs3QbT2/ICYD
	 NO6pA6YkzDhp7csbPZS2hTIcT+6f3HJ/D4mE/QsRvSxct+w9A0uoCfZeCKV1ddLPDpXpP
	 fzWFuIDM0lZQmu/vKPvb5/Z2y9I9ArZpszb+CKtG9Y7WwB1yqICaM5FgmaPG+mgmmZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=cfVq1BF2;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279F1606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 279F1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=cfVq1BF2
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5363c8de563so40505751cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793101047; x=1793705847; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B0AENkjEZYL4fzS8mYn3YPtPPkm4rS6Tf5gq0kxi7XY=;
        b=cfVq1BF2EvPw3tStOKBPCpXo9c/BBUUyyLctzvWGZfXIYp+Z36ZjiWwM04mKSKiNDJ
         UfdHl+ZMucUt6/4nx3kBWvhetR0TY2XikuDLZ8y7+3QHgzZKSMS7eq9OfPPcTIPnKUUM
         gQCm2OsVLbZwxpU9arpxabWSa8OO/oc24WYEeYJZKZMdyawBegk5BjAmOonH19oYVLCG
         zkcVDAba00f+7GZwDA4e3lpt/AgTyZ8L/qR62eRLdgNNjKQN+oxm4UYZDfZ7z8TAdGIL
         P4sowfYMyeQMSh2QtqWXPWk+ZhX8I2LVshVfvLy/yhyowPRVJWOkh38qV0UUQeyy1Ao0
         7JJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101047; x=1793705847;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B0AENkjEZYL4fzS8mYn3YPtPPkm4rS6Tf5gq0kxi7XY=;
        b=f4xit7l/NZinkYTOQpmJUNvFAn8rIJAvs6TZNLszz4PnMMvS1iQvS8AUkUQR7zhj6B
         1M1dpcSEFoZOlktEVANe4ktZJzT1qk8JQnXF5B4g1oboisVo1cuUjOcTEDHzBGbGIjq8
         AMHPOME0X+LAFpWawkvLEJmlNCiljFUJsFHeqdmajXwaPW/e441IFsdbhJDvOSg+jFZ4
         5sDRDPrP1S7EnqF5IIC7RtOvajPaEGXuAswXxtozOBiyL3rvZOQitEGshperfUS5PmJj
         +2J7oDerf2eJUSQthoKTq5TVTpZec2s4XvXvFzzvpySWVXx9iDYtk8j7aMJnaq/DPMrU
         QnOg==
X-Forwarded-Encrypted: i=1; AKwUvBzd47tD/KauvPK8+7Jqb+xe8R3AEo4c5zRnIo/y1OyD1BiSMBkUXleavWWtGmYKQIH0DWkXrmz9xT/c/4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYK++bkcuq07JmaowBvwYuQwBNPBdSUzWYVWmdfxR2eovumslkXN
	RVw5C7vt3SvTgX5VZTpDHSaloHGJ1+JP8WUlA6kNrj8RtlV+EypMzvVALRBAwahENnQ=
X-Gm-Gg: AYBFou25IVJ0kP2lg8y8d5/2kjcTX5chuTHqoqHMN0gt2UwaB+GI+hLF+YU8xUz5Rv1
	DUayNmzKT1EZYD0AJ9LWQ1uIfkOPpBZwT7aIXl839km9lmL5AK5DKm/YoqrjkuraahL3+Q9z3hX
	stKpNIsHlS8jGRvjzz7JR9ZcU4DpClCPxfhHaaOyM8Y0ER1diYaaRQad+8QARpy9LZjQs5t37Yg
	bRlaJfLdmTMYRuUm40RGwok0obTmmwSlOtSZnyEVCDtJaOkPjySzgCGA1D/xEqux7Fqa9zfqysW
	tt6VnNc+xqMAScH+1wMZNil1V+NvEONWULN8BvuAGYyhLRDGJrv6/YGSZPRWQO/KSHyVYzm06s9
	91p+xGa/VXJqIS7FYplAmc9MvUioYmniwoJKGw3/oeesLRVa83B+yDbPzPgeiJ0ye/wq5uVwjLY
	gnOGZgr+pK2X0pY6ekZ2qtwiOxsG2kCiXhWVqSvF10iTKa53DWS0UVBXknETNFXLvkZp1GlnXor
	ECl+xxDU7hzJyeUobXNREd1a7M70C7/DKO2+L5bdY4CYBtq+y/7p0rkUt0fIOOW+9zCiqeDp8Xg
	FBHdd55haVVYIe/AgK2aEldhi8g/
X-Received: by 2002:a05:622a:5e8c:b0:533:920d:7bf8 with SMTP id d75a77b69052e-5383b4ae34fmr146287491cf.24.1793101046776;
        Tue, 27 Oct 2026 04:37:26 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53838cf2e96sm77329351cf.1.2026.10.27.04.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:37:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 00/16] mm/shmem: various (urgent?) fixes
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 Vladimir Davydov <vdavydov.dev@gmail.com>, Michal Hocko <mhocko@suse.com>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Lukas Czerner <lczerner@redhat.com>, Carlos Maiolino <cmaiolino@redhat.com>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Daniel Verkamp <dverkamp@chromium.org>, Jeff Xu <jeffxu@google.com>, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 David Stevens <stevensd@chromium.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 William Kucharski <william.kucharski@oracle.com>, 
 Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
 Nhat Pham <nphamcs@gmail.com>, Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Chris Mason <mason@kernel.org>, 
 stable@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, 
 Eva Kurchatova <eva.kurchatova@virtuozzo.com>
In-Reply-To: <3022ba03-54c6-499d-b07a-2ca8d033a56d@kernel.org>
References: <20261026-fixes_shmem-v1-0-703206d5fa0c@kernel.org>
 <at-yaxmjeOXtA15M@gourry-fedora-PF4VCD3F>
 <5d10eba8-11cb-4031-84e1-a394ca5b4cba@kernel.org>
 <179304984259.319828.7383468637599462048.b4-reply@b4>
 <3022ba03-54c6-499d-b07a-2ca8d033a56d@kernel.org>
Date: Tue, 27 Oct 2026 07:37:25 -0400
Message-Id: <179310104515.664110.14057520583832900506.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-27 10:34 +0100, David Hildenbrand (Arm) wrote:
> On 10/26/26 22:24, Gregory Price (Meta) wrote:
> > On 2026-10-26 22:09 +0100, David Hildenbrand (Arm) wrote:
> >> On 10/26/26 21:08, Gregory Price wrote:
> >>>
> >>> feel free to take or leave the selftests.
> >>
> >> Thanks, no time to polish selftest ;)
> >>
> > 
> > It's there to show the work more than to merge, but the long-term goal
> > here is to feed these tests into a larger session that does the polish.
> 
> Agreed. But a note that if these essentially contain reproducers that can cause
> harm on real systems, posting them upstream might not be a very good idea until
> fixed.
> 
> Well, unless people can trivially generate them already.
> 

Nothing here has been generated by anything the public does not have
access to with a $20 subscription or enough RAM to a run a decent
model locally. Otherwise I wouldn't have posted it.

Posting the patch is the full disclosure at this point.

-- 
~Gregory

