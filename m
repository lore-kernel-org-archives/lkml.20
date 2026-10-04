Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE9033998
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 03:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791084645; cv=pass; b=ptYKb+JWQZwESoT6P5tAe2nVBlnepnBCdtsGXUQqUEGoLO9R4fC7DJ7kXTTo7R6ZbtZD/HPt4+YooifcQTTIZ//ARYJlL287B4JEZpLqeFczS3Qtb7yyqkzGxg1JskueSglKsU7hvmX9vOZc4iu3SUjmZlCgnsfaiRI/dBN0e1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791084645; c=relaxed/simple;
	bh=C3qe6xrBttWpE47/cr80mPV4srst/5FkKQdl15lo4VM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BtxeP6BBS4HQSywAQ2qtR1eCqAyIsnzmg0I3U/FoFtg3CH2vyJ3UlWpMZwpj27eJLmyZUIly9a/mIFlnL0WYpE3d20dpMp/3VxBNFF3VaR/l2uN16J2RQMfT52qi5OPD7tC3Vxun0y92n65mGf/5P8nRraHrpCMzndYRWU5jcvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+Zs8GyX; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+Zs8GyX"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c1670dad7a8so151485466b.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 20:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791084642; cv=none;
        d=google.com; s=arc-20260327;
        b=etCHfneNXE4021gylvenybewKNT7zmHKmfzuBkb8v0crFRrDspfVwHR6Zmevc5EcO/
         YjKwkxnGuBTZDwuSazeZmVrB/LspQYXR8eOpEqxJjtIZjswW/Kfey18DL6hfnZLX1pah
         hrCnI9Iuvvy/6+n/ou9lyMtV+nHDgOl9O5vlTdlK7dZbQ0EpaeDcljjtfHZwtkkcHwMW
         dZnfUU2TyYlezdhnKJTup7vP/MPaa+S6gu4e+IS19+MS6wzvDjj97qjzB5lOc2n9TqzQ
         tgOD0WSQM88qOfAlrXGeO2YEGtevJjSgj6Zju6kOiZzgUeT99JaOxJvhOV7HvOay6Mzf
         wBXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ocMEG1JQitysYEbxaeOoYgeb6SO1YjUdEbtsSzCE3S8=;
        fh=gy1lrbcsI/U3/UpUB6RlB5U5uZFWsfOPPYuu6ViWIgs=;
        b=dJZv57+qQ8mVkQOqT+AXDd7Wgy5ZvwJGdcVe+tNU6F8h2rSsw97xUWImFxBogD0mkt
         Xy+sEGBE79D6pBJQ2THSwPB+0QQ8eIW4licN9e3yyidwyGJJSL2U6OzkkpTFZVad6J8y
         EpXAqe+qlgKx1G0vTE0VW9/EbUF9Fgx0xVIQM2/Xm3nUfz5HjcG48cAqEo/06Gj2aJUS
         N6p7+1/ggTqboUKI244v5e9jS8Dp56C91WrUeN/kxSmZoIeNxmhhpcekk/yhmX6ldc/J
         MW0P6FkHzjxcbL6iEQdGWO761rHfhtHMz/wDuuC6Voxz0NRD4pDz6k5Ps3wWmiazlo+E
         gE+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791084642; x=1791689442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ocMEG1JQitysYEbxaeOoYgeb6SO1YjUdEbtsSzCE3S8=;
        b=b+Zs8GyXKGtphecIfxq1xDM5EgrLYTw9lH/cKWK028H99nPv/8INSTssARC0sKSEoU
         mQI+6ci2dRUIQ4JOMQWZOav0mtghWCek1h4LoUHZeKryk/VjgD9hFD8LraoIhgnBUebR
         tx1ckS+d0Y1t1KgGiw54vupXVSj3f3nhYwdtNcrs6npVB384NDA+47DKy7FlRU68LgZr
         JHGx5kEjdG/1TE5Zj2pXXEU356vFhlHQhH9OpGug1pUU/OpTc2P5RHDgSs+MTqaqmx10
         W1Z7WBAXuC57dYTeTC4blwjEFdwuaLlvEKu3K3VdV+4fhqj2od1rCepR7sZNbNh+MqQr
         h/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791084642; x=1791689442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ocMEG1JQitysYEbxaeOoYgeb6SO1YjUdEbtsSzCE3S8=;
        b=iI28NHFxC1gBhAeU7hUfizbmm4F702dTPchD5eAcqwTxLHAMxGrRacl2O2UkLfnKaI
         wHQHi3RswErcG7LO96l1UA+kB7+Eu6iVs0qAwTdOzOqLSy/VqyCQPKEZsw7QT40+s5oj
         09dUCktW3JxDoUvJOVgH5BuPKddasZJZ2zoU73Q4GaNKlRdytxI1KBkyeoBrkg4i93h8
         ku9I3Lq8l+m1lIULT4VWsnnRHmwibFGxtLUaEIyrKEcNu0TffKaCjpg2z70YYZBLllpm
         zGRFwg75uLZNKe2G+YyA4HdYolmmUP9Ts3UDqXD4qggFvc9crcaYkXzuk2txRiMX/aaM
         gXTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTaPYVvFgsy55NskJDCTEZsSg0tLj5/UPbVvu2XCbknxA1rWL61XQRo0HOP/9ywxxri7SGZA0WtVpGvxw=@vger.kernel.org
X-Gm-Message-State: AFuF++m1OVyL16ibEBBlj9715Y1MCIozFYZW9PzCbEi/S86j/36PWxV7
	/FBI2eRZDGpI2ka3T1RBfeoT7ERl1sDpCvdBjsAfmFxZDdHkkedBfrIOPZcNb1Miei8V6NzhGFj
	aYiLOGic/JJr7k48vQYvYWObHAgCGpV0=
X-Gm-Gg: AYBFou3Ol/oD4dC3LrQprr/XtoQg9n6VkJpjBvneePJnxbS0+9VYDOyWhyGTLIneOqT
	N9zzmss7TJS4E47BuvLWI4s5aWmJHSdPGD6SYV0WeqrCGudVWxyKEHxErf2Sox1v4yJWHSGJo0J
	5cSbkKQpRu6kNh5ZibbrwbBEc9xBFTNYJBY+hPJjubGzXZfX52QHicAnl11mB8q5vXgMbvnmvB2
	eTEhCnwWpgjKO1X5bw3PjejxKC+ItHE3coFxnIUngcya4iQPKpn6WpITDDRpn/FVHb2Ll36Iy8R
	dX4UoWREMQr0alRGcXmSl6wjDWFgI0VOJtu5Q1QSy/FY5qDjiWN0PpLPTxUt4vslqy7JieySubj
	bofkTMd4+PIsczabciLM=
X-Received: by 2002:a17:907:97d3:b0:c29:45f6:6a0b with SMTP id
 a640c23a62f3a-c2e6edba366mr293421166b.34.1791084641659; Sat, 03 Oct 2026
 20:30:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-mglru-fg-v3-0-cbd4546a5bd9@tencent.com>
 <20261003-mglru-fg-v3-15-cbd4546a5bd9@tencent.com> <DLVOTZLINBSQ.2FBQBO7G548GA@nvidia.com>
In-Reply-To: <DLVOTZLINBSQ.2FBQBO7G548GA@nvidia.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sun, 4 Oct 2026 11:30:05 +0800
X-Gm-Features: AclHuK_0vu692Azs09lD-vnP7S-2xAgVgXDUAR3MwsA-IVgdqMPkuZxdr53J7D4
Message-ID: <CAMgjq7CNpFbtU5X5bhjMFgb6qcgw0yuLbw73mKOCkE9tpMohkg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 15/17] mm/khugepaged: check folio referenced state
 via LRU refs under MGLRU
To: Zi Yan <ziy@nvidia.com>
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
	Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	SeongJae Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	zhaozhengzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Kunwu Chan <kunwu.chan@gmail.com>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 6:11=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> On Sat Oct 3, 2026 at 8:55 AM EDT, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > For MGLRU, PG_referenced is only the lowest bit of the folio LRU refs
> > count, so folios with a higher refs count no longer have the bit set.
> > folio_pte_referenced() testing the raw bit misses hot folios at
> > refs >=3D 2, under-counting the referenced folios of a candidate range
> > and aborting otherwise good collapses with SCAN_LACK_REFERENCED_PAGE.
> >
> > Test the refs count directly when MGLRU is enabled, mirroring the
> > smaps conversion.  The classical LRU keeps the plain bit test.
>
> Why not reuse the smaps helper function? You can rename the helper to
> check_folio_referenced() for general use.
>

That's a very nice idea, will use that.

> --
> Best Regards,
> Yan, Zi
>
