Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3803346774
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 02:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788402145; cv=pass; b=EF9MCOFBF5PEV005iRbdCyyoHPJTpOylBNFPtYyZsPy7b8/+bA1dPmmHBh0hqWH+8oOnkz/se5bHiISi/TxJTelgidt9YIYIoEcWXq7Kolk7Y7cS8dI9PHtKFDjjIhfxw3aoIvrVMxAlqSEhcWzFyWpgd60we2D+wsP94HHOeyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788402145; c=relaxed/simple;
	bh=wG8yfXZMFVAt9IH9Z1c2y228HekdWYvnNtOdJZcmldo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9HozNCnAYFhhpHC7VpXkPgjLvruT0hdr51PhwAXHt7Td1QSsyPGrVfg85J2AxhaHOOSxYq1d5rvi7KEpT6bz0dsaDzg1M5elKTMzAtqJUxnvDAPzrWyauWX6DojLL004k7a0WPWF6MWpa9GCla39ou1v70HnbA3jSR54jmGR4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YTjUSBjL; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTjUSBjL"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c25b3c641fbso222676466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788402140; cv=none;
        d=google.com; s=arc-20260327;
        b=isahIIu1lTV2pGUtGpM23p/9wO5od6SX+ydtrQq1UnbRy0BiJkbHWYFQA3OiXi4xfo
         eoVH/urXOZ8WI7ig3iX52oiDp2y9sZNgq8EXbEcxKnG5al0HHg64OULFv7Va+r+CFeuc
         Uydp+b1e1QCVdDJdpwxwcmQZ4uBa51OSQ5FRRPDMZzmF4rk9b1rEuZHpKOENoAaq3wTt
         elTlM3Q69iZB04+3iYWTZVb2ZHiFeihRaZY4pw58LP/K/iRJKkowgrzabRf0A2pKX7GY
         FeOuBPtDhgRMexTMyla49HP+UG/5VGjJhG+BAnBC158ZBVag32Sqf9f3f0WQozb2JODG
         2IsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uzF2akW8js1Qtl2W3U8D53PAMgePI3lJc85Uvk4KROs=;
        fh=n39XfI4Kos8qAb+XtJ+quWa2+FbWOvPDnAh+dBZYfC8=;
        b=mWN1Bp2paz5Tw/3WzXHwCnWXHP6dbB5tTHimEACIM5zGZW13NSUEnZgHB2h9fjQDst
         GLPwjVPHhTWEHhSn36SajfHb4GGVSfmA7DS7ByR3FLtSpCsu4/GfwwNZRSevAITXXaT3
         Xp+UtICK4r/9CS1WKZdpcDiUhrMvkYPKvgNyEA4B0N/XWY6KSF36QELnIL1ywzG+zwJv
         HOjy9Yh8uCelwbfPEmlWb1Nk5H4NIsPOlyPV7kK0l0zp+WkR8ffU8xnMdAZa74gDmKiL
         QT8PjHjl34l2+hZ6l83r8vGxBhemoppspDlR3tZTBQ4aCy/kwukn6dtQ/VzxqxuRsnQy
         OYJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788402140; x=1789006940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uzF2akW8js1Qtl2W3U8D53PAMgePI3lJc85Uvk4KROs=;
        b=YTjUSBjLFLKfilsVxzaQMmK/Ywnv18Gcw0ii/xq9gTUugYWkoO3/+hPXAOd+Q7pFNM
         8/pB95vwCckYFCl8LmduNjU58U+oU8zIAuiKzgcT3ScHZGtdWog8BaXcZ7gAKCC7EjWe
         Kav1AVeERSQoeHQdhdcQlh/b98D3GKG/Gl61isZqPcG0MykmL0YPDxTzU/+h/8yGsvaS
         IVKCKDF/HmPH5pAF8kBWotyMtrY2t6SDtBRu/8DK7guCh8N4g/AiuqggEPsP3qMMMPlj
         tfqdLwpCNIxyR6XfZWvpzjudQQ9wvxli2gR2mVHhdmlqgtEaBSW5MA6ec4Z9YKoC0+ww
         GyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788402140; x=1789006940;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzF2akW8js1Qtl2W3U8D53PAMgePI3lJc85Uvk4KROs=;
        b=TppW+KQkPAbymc9ejymmnsPkzef2JlMit/vw82hSdmY0PnL4inssga8S833P7W0t8K
         qlgXgeH892hAUtmeIyAFYngKCQw9uk97XDX3Or1mav9mKE3Aw8YQBH/Y5F5Hh3FEj5nm
         Da1mC5d51vhL1+r0RVDPaYig02052aRUV+9lZuOP4x6TPwZ7OlgSmSC+/ym+Ys2hr+6F
         9Q5qxWW3XhRWQLxwaN4Hqs0aoXtBGmUVirE/NF235AknxT+vNn1fAOlc4h6AiXD1RvYX
         UNssOjV2TR01TAdecEzJbHHpgGXA+1eBU5rQq9jEQJC+DW/QuiS+UDUBQtHgohYsZ6Mp
         lQaw==
X-Forwarded-Encrypted: i=1; AKwUvBzJ5KyQJpHtPiS7yDMYmbdh3u7uXyuAi3o9e1q7d1lDNB2pIPwiGzr8TWbVHmvyeA1NiUF/8di692t/dgY=@vger.kernel.org
X-Gm-Message-State: AFuF++mEr70STthh8wXEBCIeQ15fKkKdd0yl/gRCr5wwmyMiRMJfGP3Q
	mChsqsw0BNMDE2MkBi/EHDMmXQokY6+wLo4Qzcs3WI+xSRriY6WOBcFXmjwkKM0DYn3ogY5a+hh
	jBlGiNCw5CfnTkzWgzfgZMkSD9juyG8c=
X-Gm-Gg: AYBFou0oBq+nVDjer/AndYUCW96ixkYZrhIijXbiFDMg0FdhKP1XjqY8NR5Sx5evuuY
	4turVkoGHOMfJbi2QfKfrufsHNPms7qDPf290ioylpSJDNDRuQ3ZIpmc13VPoiQskqjueVwG0YO
	s37O5BmP0ejP3fyLfKb/dsYzs1nOVBzgf4e5DeNyp4+OtfcVgkM8dgH1sUPQamwPp+0XDWiuWq2
	M6s0dQUu+mCM2rfVfO1gpGnWq+Nw+icCai/ZipasNpdU6hYZc5NP3QZpizd1kdjlT+5xVh6SD4z
	mxUr3NzSyq5NxihNOGQD4p5uJ4OvwYpYy2I3jfmiNQdf5ihMu0niN5nyptJy9HKWjYgQShTlDji
	D
X-Received: by 2002:a17:907:940d:b0:c16:84dc:9607 with SMTP id
 a640c23a62f3a-c25d5509043mr579045666b.19.1788402140304; Wed, 02 Sep 2026
 19:22:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-mglru-flags-cleanup-v5-0-9db761d779ef@tencent.com> <20260902141153.93b932ba572b1d3375216cc4@linux-foundation.org>
In-Reply-To: <20260902141153.93b932ba572b1d3375216cc4@linux-foundation.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 3 Sep 2026 10:21:43 +0800
X-Gm-Features: AcwNN1VaXdfXwDwuHgeUlK13sDpqUXHJ071CJYvST4lMD2Ml0BFv40TbHBDM9GM
Message-ID: <CAMgjq7BoNJMxZ0DSCyJHZ+KHTP0pwOp8C9298PTYZK1OBv7sFA@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] mm/mglru: clean up folio counters and flag usage
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>, linux-mm@kvack.org, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Chris Li <chrisl@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Ridong Chen <ridong.chen@linux.dev>, Lian Wang <lianux.mm@gmail.com>, Yu Zhao <yuzhao@google.com>, 
	Zi Yan <ziy@nvidia.com>, Qi Zheng <qi.zheng@linux.dev>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 5:11=E2=80=AFAM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Wed, 02 Sep 2026 17:50:53 +0800 Kairui Song via B4 Relay <devnull+kaso=
ng.tencent.com@kernel.org> wrote:
>
> > This is a cleanup series separated out from the MGLRU-FG series [1]. As
> > that series is getting too long in following updates, seperate out the
> > clean up part for easier review and merge.
> >
> > No feature change is intended, except one bugfix. It mostly replaces
> > the open-coded bit operations scattered throughout the MGLRU code with
> > new helpers, with proper kdocs, sanity debug checks, and hardens a few
> > MGLRU functions.
> >
> > A subtle generation counter leak is also found during the refactoring
> > and the fix is included.
> >
> > Also collected review feedbacks on the cleanup part from the posted
> > series.
>
> Thanks.  I hit a non-trivial reject in [2/6] presumably thanks to
> mm.git (mm-new) race conditions (appended).
>
> The patchset comes nicely review by humans, but AI is less happy:
>         https://sashiko.dev/#/patchset/20260902-mglru-flags-cleanup-v5-0-=
9db761d779ef@tencent.com
>
> So please take a look at all that and retry in a few days?

Right, I checked both already, sashiko has beem compalining about the
same issue again and again since V2:
https://lore.kernel.org/all/CAMgjq7BheDgQZa0=3DKiRnxVwky9by5LA=3DiaexfPfT0W=
ftgfL=3DqQ@mail.gmail.com/

It's safe to ignore: not introduced by this series, and not a real
problem either.

The refs part is also fine, it barely has any real effect.

Should I just rebase on top of mm-new? I also saw Barry's rebased
version of Patch 2, that looks good to me.
