Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049848;
	b=ssJKe8a+MKR4uQRINUcojj2iV4Yb3pN4D2ax8F3Gaz7Ap3nOwxiI3GM29zlnVW3GcBAw
	 K4649TOKPSsnaNu1LWgFZ3kpyXWBYqyJVe4hkhpLxVjxBw13dVJhSi+1MQT8fsL9Sh1zK
	 8otbBZRpHUXBw/gymtO500XJMfSvYxHOuWtkTJtthql/4hJLaiY8AI8m13UfjjRlCZ2WJ
	 Z3bkze+fQW+ie8m/joCIdDJqKCNZV8eiNkizeM/pdPwVXmo25N9VEj3nLr7FsXiZftBFq
	 zWySo9HTXZ9nu1iCV9EyUgKdBat9JAaNwayTUxJTAJD6dd8OoY08UvYNwDeJUWnwEMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=5H3XFudOIVUpfowGZGMfKOHChQPyfvsUBh9VsbVmyjQ=;
	b=UPWk2CK8trc6oSLmjbh61eCBk27vrV6UJJWALStpHSgQ3RvJiVazvPzuI6CSXveYUHDx
	 JF7ndl4H6mVXw03vePDJCbxVY7JkAH9tcDoy6yfbAfoTv9W0X9P6tCJbpilJhtEXboIQL
	 rXxgCsZikDL2FVEtED/v//W8nAgPxm039VcbDbJI+F9E00ccyXLNjXp6eJR1gDwYx5Wpe
	 cMHqO8TJ88hEYcZIuyiA7/ByB5FDyJ5Vhjg3ut6PpVAJ7iEPnn3aKK+KYDqz+KM2MSKHO
	 lWF9yQheq+dfti1XMMzwM4qOz+5NdNa0nCwTaVbLZ5TbRRBhAMpvr3n5+4sDXjNBpPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Y5bP7viH;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161AA606A325
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 161AA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Y5bP7viH
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93efc0452b5so229222585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793049846; x=1793654646; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5H3XFudOIVUpfowGZGMfKOHChQPyfvsUBh9VsbVmyjQ=;
        b=Y5bP7viHjKXlpjFXbRwohniuB0ZmS69xoZxwCocvKBVzzp+gPK+xkTX/shb9wVgqRm
         fTC4kHMENGNuFoUb9eERqKTqQEWkaV8oyl+WHPncnpV5SrrhlVemCOvPqByQD37gTMAm
         DiwngHdusodUnHz9V39ynTWouJV7GQKWEAmkfAlV+XVzFy9qbKxmp2tlm6qu5q+qMffL
         twX0F3oxzfouC78MrMma6fDM4bh8edkE64tq26GmEHW7pfCMfBsjpwJa84vw4nxq5y7J
         ZeB4JrEfeljl+i0PdZGID/N2XL02ItrOl6V1CgYMZq/ZDekdLF/INzIz66n9CjsYNKaR
         /c3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049846; x=1793654646;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5H3XFudOIVUpfowGZGMfKOHChQPyfvsUBh9VsbVmyjQ=;
        b=FfbOC0+A5gaVNh1IKROBkmn3iq6JhzYBqtQ4T7pRPAK2Micu5+ZiOHm2mUELbCxxf9
         n58rxxm1JDsh/fz8bVsHrZ3fzUYIv3Qv0w+MSXNYtcUZzBAMXDrt2tFxThJ1kiItxYbU
         uwlGq9aZJKK3ZIplj+QcGnOyaNVmx+isE3RUuSZuDxYTYJ0TRgg8N4KjqZRJyvv2rMX2
         Nyn5mhmBI4HSizRgAkLAqqQJz94wkQHZshPlGDpq7xYOB1611Kq1fKPX7JLFbo99mYWy
         QrjSVpHWtymI5nyjPljMeJzOQEVAPsRiuf8ZFPPgWwRR3Z/oMF6fb85V4iQo42ENfhw+
         PvZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjybSxMZV3csYjPF9i88yvAjciojeaoAiHLGbSKcN+Wp4wMVPQ0H4Aau+Eel72T8FkCj/G4YMMm59fS2g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoZGJO7OFIaKLSizAaXkcmfogsxa+bLem0waC76ESld6fK3/zO
	ZB6/cK4QSkGzNflHDplAy+PLDW+cewNMAeEqFeT7dwSXplYoDPQqkwg5N1O90ja48b4=
X-Gm-Gg: AYBFou3c5qNIbg041T5YAVz0LzXnfcUGvbDEELDbnGAr0yNH0VpvD5kcYUW4IVhnXwp
	MJeAyO/phnDLC+0NIpzHZbGiwEZ3usUWDWj3cqjbk78AUXQYzXHQG/s1ZTbzCG9Hirx752huNxW
	bz7xvRaHzOiL6ccqdFypG7o3AfmzcSxhZGaYGoChEx/XQbV6wgETSCAPmvt8JBpaongqckrE4QN
	enLA64kbUIgdezWtncPBLC2EY3IPBrIKpcFqvO2Yvga0t+BNxiG7e/4Ls2WB3q9DTEr+zt8dElm
	ZDnsyDPluahdmI+Xann43pCINPnYlogbmDVnMhvIdOuR2gxKsE4+UOUY8Y9DuZxZzOKbcDZ6KQ6
	z4k80fhHmQI0jGg6MJ4bFafqI6aJpuUKE4Nr3oEP/6KPErVEaHHgu4a+Ezxbb7HvGYdZtjXyQqg
	X8m5PIyfvLJVq37SYgT5W97zMebRHW+6b0oKWj74SEpK0uwvor6PtgLmIh2jHk7NT0kL96/7g7X
	zGksD1HdjUlu8EKO8YS6EZXbzmz2kEM41PK2hxnvrSL1I/TlokaK37nREN+JUAhBg6TeumFvlKY
	sifsj5q3loIxZIsUQat8USTeNK4=
X-Received: by 2002:a05:620a:2603:b0:93f:565f:e46 with SMTP id af79cd13be357-940ef97fb6emr1203588085a.52.1793049845808;
        Mon, 26 Oct 2026 14:24:05 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0a78c06sm789620285a.35.2026.10.26.14.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:24:04 -0700 (PDT)
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
Cc: Gregory Price <gourry@gourry.net>, 
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
In-Reply-To: <5d10eba8-11cb-4031-84e1-a394ca5b4cba@kernel.org>
References: <20261026-fixes_shmem-v1-0-703206d5fa0c@kernel.org>
 <at-yaxmjeOXtA15M@gourry-fedora-PF4VCD3F>
 <5d10eba8-11cb-4031-84e1-a394ca5b4cba@kernel.org>
Date: Mon, 26 Oct 2026 17:24:02 -0400
Message-Id: <179304984259.319828.7383468637599462048.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-26 22:09 +0100, David Hildenbrand (Arm) wrote:
> On 10/26/26 21:08, Gregory Price wrote:
> > On Mon, Oct 26, 2026 at 10:40:33AM +0100, David Hildenbrand (Arm) wrote:
> > 
> > feel free to take or leave the selftests.
> 
> Thanks, no time to polish selftest ;)
> 

It's there to show the work more than to merge, but the long-term goal
here is to feed these tests into a larger session that does the polish.

Fixes: -> Tested-by: -> Analyze -> Proper Self-tests -> Upstream
                                   Or unit-tests :]

Usually these tests are not things we want to test for long term,
but they do help define the contracts we DO want to test.

~Gregory

-- 
~Gregory

