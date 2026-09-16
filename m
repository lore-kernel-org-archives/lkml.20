Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A14477994
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547955; cv=pass; b=EUPpTgQxDPJwTUtBQW0bBf/5PZUp37s7JfodL28702CXwRkfENg0rz7X7e+cz7A4JniV6xhAK7Hn46mmSjILDUmcXh5VcMDxk7zROmja4RuXczCW7qq8Vj54Sc+NbNnr30tW18L2dCnX+9BuuQdbCRN35pNr+EKUHpAUqZP6OeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547955; c=relaxed/simple;
	bh=9n3jjmSPydEac4OpzLVHay3P89pv9PBRtC/AixhDU3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=StxfQkFLnfHeicqz3Wyw3N92QhzoikNnn8AlJrM6Mq/U6VDH/kZBW4yLQr+pS9KPbToapNtJEvKysnMb61416QksRP+ksT5A+wS0hIhWz1nKGqZfdmudNXJyIDAc6KghR/qO/e8TPg2bbfJ3RMF01NyKzhVJbY8Wv4LGF6QV02k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kva0WNp9; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kva0WNp9"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a9a2f16ed4so2756728a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:39:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789547951; cv=none;
        d=google.com; s=arc-20260327;
        b=e2sX5cAPxqkQmqEdHDExW5jqMv4gtNKP3FPsXPM+4bry5Lg9sGn8YzL842tHcw2ZJL
         Lj0e968ASVDWUzOIlUPTuuKP7GYYOsX0h0p+oDriLn7e1mVn1a8h94ILW9NyTz2A+Nkp
         eO308nwIgQX2QDXFQ0fhjOaQTot9uSXmVQ4+hQRTXySR4f17738aT7xag7bKmCTCWFk/
         xHrXj0OGJhLKOgcVN/hgBeyXjUywbG8QEfSQZGz2Bt1h88SKrPCZn+vkF0Y2ElZ6+V/h
         L7FYBuLJctNo2s6cyqWVhCh/ArttwTqqmp1HUUqrSwwGOgH6Bl+mA+7zT+VUjC10kAIc
         Racg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9n3jjmSPydEac4OpzLVHay3P89pv9PBRtC/AixhDU3Y=;
        fh=5JY+kL49ybLXKk7gwBajjFz9lTlM1KfRyMpfrElAYLk=;
        b=KRMceB8hdBNaXrEgtnD+uSUaTlgXsslIN3uffPAy0YNr3pAWkMz0gYzAAWSAMIahkN
         lA5qDjebHEcMDe4JvVHIwc+9KPssi5AHVC3klR8izlVL69ilwNr6UoDRgl3rSy4Pvybt
         SRGhzKsBnP6K+emEwT9UZ01R0gkS3NmiovyHR5p2xK0Y6NwdSZdZgegGlSXIC8tGA+Ih
         8kQ0JdLc6HKuNrNkc1AxLiu8J7RHvNucTkqPO4c8y7LDn1Oi8okOD0EJL50uIRYt46k6
         eO+fIjvESiZTDInDRRRb9bO29GCj3r1OQbNEIMzKAEzgoWiJkk0i6luOnCvgNfVP8+zy
         XXDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789547951; x=1790152751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9n3jjmSPydEac4OpzLVHay3P89pv9PBRtC/AixhDU3Y=;
        b=kva0WNp91hK922vW8uEn1XZOSxGLWIhCm/GrywED5wEr3agJiciLaAC7Sq39O6U5FP
         Zosr5JtFh9E5uaiv5kHI+RF0iu+SFC4BC8F3iT6xjXT8o3mbrMzIbnUV348GxIET4Ywd
         /ZLXzJLjLaLIAtiy3quoUEx/l+E7ahaS5usqEJokM3wJAcmyg73hmXxj560FckOWyqWa
         AbEWJno3hgvgyA/60W0L/wC9bR6UgoqfhAJBV5CqK5WAabKn8rT1FJvup8QRTN11emPT
         PCxsK6Brc+reCTp45yLX8CKvHAfZnNb0G8kDPRUyQdm6PEC84ChBZA8MtFIVHz4F5Liv
         vphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789547951; x=1790152751;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9n3jjmSPydEac4OpzLVHay3P89pv9PBRtC/AixhDU3Y=;
        b=yg+bOOecKXVjsEHuR+Ybm2lNtHz+ndOeIn2aSgwecytG950cfLDoDHlzxTQgDo937f
         TJTOrY4n7HwPcjGVamKrP8D/NnmIj4iIBZjQw5AqMOt+NoH0JLVBnj6fWuCl7/S1IB+J
         YmnuPGkKytxC7CIDXmgpWj1VlCAGpv6FxXmdKeg1HQ8EyGq/VSp5DRx4B3+GsbHj9W5h
         /bu54G/ZTQaRJDNmsQfgQv6CyhlK/dcXlPVxb88FnxBgLcbc1UNbgDdN1zzTm6l1gvT3
         S695ysCawjnKgmugl6XwUwdMRr/6cDht/bJ722J2/ADHan7EM4vjKE22oNAX51TftOnE
         wtZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxT+8hAWKG5NOGyGvu2qhMwfJAPP+NlbgOngmZW1hO7/BCk/v+PWtAx5Sm/d1TbWXqFbH+h9PHq35a87UM=@vger.kernel.org
X-Gm-Message-State: AFuF++mvzLXIiF30Ku+s9jGjUg1kMecyeTHvSsdsoh3n5ofx4BO7QCT1
	HpEEsxDb9lht0swzKM2prgPol5Oy14JRUkg1gU1OrY8+3/9BHzwNVys5ltfZo9rjUJyd+Jkfox6
	UdsuEz4Xhvuw3e8X2DuOG91VdGjQOQxI=
X-Gm-Gg: AYBFou01Py8Lb/5vL+mnVK+vZ9iBWDj1S/w8iyMh9m8KXwlLNB88nYD6mMMAQ/mmQPN
	aTXs8jcTF99wjbDQOrX9HSsGaO3eYWUiHsL+wUZvbPkR3cznagMdRQm3ntr07ozpa0hHugl461Y
	sUFivKImhjG+b6pV/R3tPJnLGLfk7Cr5/kbv+NWA7X/DQFQDgfNzYnxnXjT1qrJrTX4H8DWjmWd
	izAzuumhb9MUriRutXcjdw9E3+M5e5i3zAsAuAO5HzgjYaFbgOUpAe2dahjSU0GxS58f8nXxDe9
	LRaBoqJNYcOCComOXji2sZDdzxGKxKRemLkIBQIhw2UGWww6oH1cAOFC3ua4jS0PtfF/NOVErHX
	3Bptaa1Bo+xtQvTAZkSG59yY=
X-Received: by 2002:a05:6402:a246:10b0:6a9:8863:ada4 with SMTP id
 4fb4d7f45d1cf-6aa03f4c4ffmr3790992a12.3.1789547951018; Wed, 16 Sep 2026
 01:39:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-mglru-fg-v2-0-f26e5cb26da7@tencent.com> <EF8E0336FFC4841B+20260916074241.3373002-1-zhaozhengzhuo@uniontech.com>
In-Reply-To: <EF8E0336FFC4841B+20260916074241.3373002-1-zhaozhengzhuo@uniontech.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 16 Sep 2026 16:38:33 +0800
X-Gm-Features: AcwNN1UpOaSQEBAOnxFM7gGPIqShqgdOpI3fmggqN1N_R_GBYHUnJOQm-8PiMzM
Message-ID: <CAMgjq7BMHPxkEYfTOaaP-dXX+EDhOdG1Yu9O8yqaEUHoeBa5XA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 00/15] mm/mglru: frequency guided promotion
 (MGLRU-FG) and flag cleanup
To: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	SeongJae Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 3:43=E2=80=AFPM zhaozhengzhuo
<zhaozhengzhuo@uniontech.com> wrote:
>
> Hi Kairui,
>
> Following up on my earlier v1 test report [1], I tested the complete v2
> series on a small WSL2 box. Applied on the stated base-commit
> 9958290885035431e2494159f555e332c3c14906 (mm-new): all 15 patches
> applied with git am, zero conflicts, and the resulting diffstat matches
> the cover letter exactly (20 files, +812/-499).
>
> Environment
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> WSL2 VM on a 32G Windows host, 12 CPUs, deepin 23 userspace, swap on an
> NVMe-backed virtual disk. VM memory was 15G/4G swap for the kernel
> build, fio and sqlite-grep runs, and 20G/8G for the DB and browser
> workloads. The distro WSL kernel ships without CONFIG_LRU_GEN, so both
> kernels were built from the distro config plus CONFIG_LRU_GEN=3Dy +
> CONFIG_LRU_GEN_ENABLED=3Dy; the two kernel configs differ only in
> LOCALVERSION. MGLRU was toggled at runtime via
> /sys/kernel/mm/lru_gen/enabled for the CLRU/MGLRU split, as in your own
> harness. Workloads were scaled proportionally to this smaller box as
> noted below.
>
> In summary: no After-vs-Before regression anywhere in my matrix, clear
> wins on fio miss rate, Chromium&Node and sqlite hot-path stability,
> both MGLRU modes consistently ahead of CLRU, and classical LRU
> untouched (MGLRU-off runs agree across the two kernels within <1% on
> every metric). Both kernels survived ~8h of heavy memory pressure with
> zero panics/BUGs/warnings. One caveat: your +13.4% MongoDB gain did not
> reproduce at my scaled 12-thread setup (+0.7%), but no regression
> either. Android was not tested (no real device here).

...

>
> Tested-by: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>

Thanks!

Glad to see this is working well for desktop and smaller devices, most
of the cases here are for large servers this time, with fast storage
and maybe WSL has double caching of files (not an expert on that) the
effect of LRU is limited. The result still looks good, which is good
news.

I tested Android and deployed it on my desktop look alright on my side too.

> Thanks,
> zhaozhengzhuo
>
> [1] https://lore.kernel.org/linux-mm/92DCEFFD13221261+20260828102344.1537=
874-1-zhaozhengzhuo@uniontech.com/
> [2] https://github.com/brianfrankcooper/YCSB/blob/master/workloads/worklo=
adb
> [3] https://lore.kernel.org/all/20221220214923.1229538-1-yuzhao@google.co=
m/
> [4] https://dl.acm.org/doi/10.1145/3731569.3764820 (artifact: https://git=
hub.com/cache-ext/cache_ext)
> [5] https://github.com/ryncsn/emm-test-project/tree/master/sqlite-grep
