Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3451F2931D2
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 05:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788671076; cv=none; b=Wo6+ALjRl6/9e+fRRf4nKGrsw1S1A7FIiOknCYOLwSiKjK3dM4+rsp+gruUCViG6bEtmOKknQqUQugIPEaDS6tauP7JNVi9cQ0LXZgSjuOIOEzqPsTqyrnY48vyuGZVh0sF0amRE6ueIyxbtS1X+skUQJhIkAMAOgN88cBYUX2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788671076; c=relaxed/simple;
	bh=pdpuAcQCT2azLLZEbEAiga6mgNjTVCAcrguE+8vSzyU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y/dyVJHKBtNSjBbb15GVYgjY4+zzwXKBjMXROApsKcOJkH+JN/KFD9YK3bs3odij8b70LqAnhD7Y+rqbbQYmwym0JObXaCPA+Hr6DLp0yOSAXZ73BLgNoIoAVUPk3IN1HtqI0cU3qiwqcAazrrKYxmydSQx23Iutlgsz3/pMF9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=riC8QrVV; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="riC8QrVV"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d715f4a587so34632935ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 22:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788671074; x=1789275874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SozSqp/P84pK5ttbmbx/yerpxYYU16syxX8QCf2wgzM=;
        b=riC8QrVVunq8lIzonPhML1Hx+jLtP12isyEISJNYtPWl4TDfK/D09RoEKyCZox4nRx
         14EMzvdnoqZSsadfZ+F5C53RRAI7AIGId6aakfJM3YDc4SNHIsKdyELFnnp0IDrBwI+1
         7fhtvzUwad/8YtrskWgWbd97uHG6x87loMnl+3CqBbIebnvXiKDMabyIghERj3kA/rgY
         Z5aYAGwbpHraQbm+R2OZ49KtM53vAz73LzfaIetxkgT3bNL9GpSl0DMbzE/PLmTeOuUW
         3xej4ZkRqvhJAJ3IZruUAQTs8BbG74jybHD25fIj3VWTnxFJQ01B8eEVRO8vqDcaaXFB
         WX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788671074; x=1789275874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SozSqp/P84pK5ttbmbx/yerpxYYU16syxX8QCf2wgzM=;
        b=jzc6JIk8gHX22bYZ5Ld+LpAsMs3lydWfvq5ca0fBECJDSbu82Uvngt3tyvvCKEi2s4
         SCz13Ca+Pwf0oaWBpDVWHsyQTpea/NHUcD9OFRuHmMRLHpeQK/GfpyGZqqixoSIKdYQ6
         I+DdRsC5OmGvI7f3QX2t9EUWkbIC0ZNxY/YkuJpKhs1sArkleIVh+DLmS2Y9f+kFqJbY
         Sb3wBqAQnkLViK7TvRAbEgar/lc+bQI9W2dMVixhAKG6jJEYZPM9grLbaY9v4obKIV11
         t8apLOUQDlWczaS4gdkmdqW21HVHCbm8kAnOzpi3Jk4+PM1CFuzXGcNDR9VVM6uc/r4z
         2BZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHGI9cWz+70SB9/cHQxJdZVJsAWO1325s19FCTDRE2hLmI36lOPtoCrvgdCQvvKW8PvNcgJMyffQpn9CM=@vger.kernel.org
X-Gm-Message-State: AFuF++lWEbXr2hyzJDStbrJewmOPQVn3pkXOiJZ5EucO8DN3oxWuNOAX
	TRIkimlA8W34bOWNNNJWotWwmGWQZcelMNk1zMuQWTngkW7gR4Ykmof3
X-Gm-Gg: AYBFou3rR37swAduxQ8hDnX+GdP94z7/Iw/Unvj1YPGcOj4Mjj4obN9J4YZSD4S3rJW
	5TBfdNvJqcj05mGKc3/GS9nXxhmHLdgj9u7NjdjguYNQ9ZoZ3W4GFIOp/HsMzhHEaibBzNKAzN6
	6Awq0Hxw0NepS4tBTw6Uh/gKUtljA9sh3P/6i4o1J2/aUnZ5DaPLEB3mrZ2VeIzmC2/qgEy77XA
	MfNEdFELmGWoTuA8y/Pr9n32CZDPQAiywQ5yRNaPrvN589Dt2eY4jtAZnmtOsv23dE76ewe5U/6
	93xjPK9bpvP4tZdqvpzS2hJ6QzYKP3Q8PvBok9PpzqLZNSr+uqu5G3phdLrwd5ttBwbFKAVd8OI
	aMrB45caIJIQvzHozesgdfllzEpTkN0GqhjOb6J/2R4lCd2qLCYoh9owLKs87Xkz39cHh/HIcmr
	ekmXdm/wXeO3OXynSAxrNBY83/CNO1JSChDHtNl4jsorYn3x429Usj6o/xhAtLOK01WBT2ek8t6
	/aKlQ==
X-Received: by 2002:a17:903:124e:b0:2d9:4baf:f1a7 with SMTP id d9443c01a7336-2db1287a543mr210656715ad.19.1788671074409;
        Sat, 05 Sep 2026 22:04:34 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1483de0asm28106155ad.11.2026.09.05.22.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 22:04:33 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: baohua@kernel.org
Cc: akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	david@kernel.org,
	mhocko@kernel.org,
	ljs@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: vmscan: avoid anon scanning for GFP_NOIO with low swapcache
Date: Sun,  6 Sep 2026 13:04:11 +0800
Message-Id: <20260906050411.405850-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAGsJ_4wC78QDTrETC0WpnouN=8aF8ae6Yxgb+oKiOP3A76ATLg@mail.gmail.com>
References: <CAGsJ_4wC78QDTrETC0WpnouN=8aF8ae6Yxgb+oKiOP3A76ATLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks Barry.

On Sun, Sep 6, 2026 at 12:53 PM Barry Song <baohua@kernel.org> wrote:
>
> I notice this only fixes the active/inactive LRU case. To address the
> MGLRU case, it seems we may need a more fundamental change.
>
> I'm fine with starting by fixing the active/inactive LRU case first.
> However, could we mention in the changelog that this patch only
> addresses the active/inactive LRU case, and that fixing the MGLRU case
> is on the TODO list?

You're right - MGLRU decides anon vs file scanning in its own path
(get_type_to_scan()/isolate_folios()) and does not go through this
can_reclaim_anon_pages() check for normal reclaim, so it is not covered
here. I'll note in the changelog that this patch only addresses the
active/inactive LRU case and that the MGLRU case is left as a TODO.

> > -               if (get_nr_swap_pages() > 0)
> > +               if (get_nr_swap_pages() > 0 &&
> > +                   !reclaimable_anon_is_low(memcg, nid, sc))
>
> Can we also update the comment above accordingly?
>
> /*
>  * For non-memcg reclaim, do we have space on any swap device?
>  * For GFP_NOIO, do we also have sufficient swapcache anon folios
>  * to reclaim?
>  */

Will do in v3.

> > -               if (mem_cgroup_get_nr_swap_pages(memcg) > 0)
> > +               if (mem_cgroup_get_nr_swap_pages(memcg) > 0 &&
> > +                   !reclaimable_anon_is_low(memcg, nid, sc))
>
> Do we also need to update the comment?
>
> /*
>  * Is the memcg above its swap limit, and does it have enough
>  * swapcache anon folios to reclaim for GFP_NOIO?
>  */

Yes, updated both comments in v3.

Thanks,
Bo
