Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318504;
	b=4jtM41b4HLAIlEncgua0okYFXsR0f0lOTFsHg7uGMTcgLLIfz1zdd7D/tpcghWYWjGpU
	 pKYyQ0se6M9G8lCFwpD/wKKa+vbFrO0YZ7HwHjTlNmqccbnRamcEgtlHuUCW3E0D+hVwR
	 rFeqjEF1fRjl2cXtzdqST6wX1vfTYPEcbsRCOHvRXMBsJMsxSb11P9U1NLgLyHyW1Om7+
	 1Vr/p6wzRWHv60ChUmvOt4v4WSHw4mD2yxVHRc8JTkvgyaKMmI7Zb67iHuJyE1zdLY24l
	 N5qMhaGfZm8XRSd4Sd9mB28EYScgn3+4cWmVFESbBQRFUkzbO6lBnxWH8C9AWurruUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318504;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=paY47Z+ZpDtoIZ3i7uCxhoYzpyOEXAiLycHInjnGEmI=;
	b=zpLcQkg+3jrgvlcFuXmByeRecoE+5W0DTfCiyRXsQdFvhX3VQV9olmSyp/vT/eiY5axV
	 6nntuNWiciuVDkC+lhnBKDHzct05UcnPZUA+d4NmShkMpCOBZrvzWmytPdwVL/EIwrCe8
	 GxubNP3O1OnEdbVE6Az86NFkKc6hh68d4aB6wEeL+UI2MPdGebD/5njubgU/Xmu342zrC
	 9ppnh9iA3bgbsV7spdkMzwMe/olWcAcgY6ObBrNKff+yIkHG1HzirihejU3bP46mnr+Wn
	 X9rl+Jj9dOkz42EoFQSd0olNKREgMecQQ3KOH7Pg+FApyOvKRiXN2px0bLcCSkGl0/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HAjvAPma;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E289460A260C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HAjvAPma
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0322B1F008A3;
	Tue, 10 Nov 2026 13:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794318503;
	bh=paY47Z+ZpDtoIZ3i7uCxhoYzpyOEXAiLycHInjnGEmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HAjvAPmapJMkoy4+BGsY1KE4rbLUkQcBnvby8WbR34ltf2wXVPqqWfsphNv0kfeF4
	 0779J0tOWIV1Il3pIh4UmlzM+pVAJ1nllycACb3b2LrTtLTKNyhJWxoNEvwzoz3Sh9
	 avlZRc8D/6BtpljhObyqry2VYvqDb4FoJUGeGpRkp5Bf1CHJB73QJr6sgcc2P2R+Sy
	 23QnQ4++F50E44oMF/6sBG99YUrz59p958FqxX6eCf6GYZ6GY/L8JVNM8tUt0C/QCt
	 Ycw2utFjmDNvdb7eCvjzMbzzvYfTNuzMtWeTymvfjrJKvXRp43O2+1jLvbwZ2/q73Z
	 4r/j38/OROjFg==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.ams.internal (Postfix) with ESMTP id F1655198003A;
	Tue, 10 Nov 2026 08:48:16 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 10 Nov 2026 08:48:20 -0500
X-ME-Sender: <xms:oCDzavwRUEkh3Vddp4PSkAeM6tYwnDcFdWnYYfdm6T-Q7VC7R74Nog>
    <xme:oCDzagfmTHU3GHkQ5Q8MLDdOaHxqrFkzx3ipCg1Pl-goEPGww5tyTTdpd2B2CVdNm
    Z_Zx9pEKptbgzigRp8DO8tdJXURqMx41dfGrcpQoWcX8e1Mb9qCHlk>
X-ME-Received: <xmr:oCDzatltycWqntVyjyxP-ykO1D4aOkQWOaI-fyD1FjJQIaFIZvahgdMSm94>
X-ME-Proxy-Cause: dmFkZTERFrmMnBfEvkf8isDUARn3LuFwW7Ic3uZtkKhgVTcfc3eTgZiX/QtJzVEtIhb0Km
    Ou3o5nwXL5vuXk2DLYMmnkH/Q3R8ZalE05i16qMWWGXsnbjWWsn+SCaNHyVwfcnAadYgvc
    Il1U/cdEkRkxAfIVrCfLvQHiea4wSG1MrTV9DcH2YSX8YJGc5IUiyeTd0fMr5I6w0hLSQ7
    RIdPa9cSpQyprJqlNhPy8EmcrljlPXLgBlLdLrhBw8nc5F33d3Hd4G/yEhSZX6ajSB/3Oh
    Y7m2UE5EtY5sZ3pqo5VhYaCgpnG9qC3Rns/dbXKbatMvGyYivQ9sj/YmTVE6EBA7q6IwW7
    AsgfBHSDTR6aXzqCJ+7vROrPBjGc8pAw1QyDWcKwCTF1pNRltDRLCsFo3pg4uyVTsTZRo9
    vLtv3+kE6N4zUjuUgni8CQWUnh0g193ZAYgjqwTXkDVYgGf0krgpyo0IvtpQ48b4BaP3Or
    Ko6E5PWqygPGBmT08euEqkps51bGcgqj1qlSftkPduuSez6CH553Vg+09q9yeDtZccaZdA
    sDPeoALWq7rZQDUdlNq21IxajBQxNye5v97mBUs6r16h9Nf+tlyN5/SlnekRgDzRvYiXjA
    oueyUXjpFqoSj3CCaMBcN+0q+xtDoJe2d4rVU/xIJbq7Er288kksauiPK2aQ
X-ME-Proxy: <xmx:oCDzavS96LBkUIy8jHgSlUKnBosr6fdOspsx_OLCYC31pcbhymEV4Q>
    <xmx:oCDzasdP4fD8ky3mgRKFW530OTJPqZa5WDG2lpq6FuR7eOxwlf84qw>
    <xmx:oCDzas21v4uys8Gvdesm_hGJ88SqVMvHHa2YMbvcs4ygURIWDvRfqQ>
    <xmx:oCDzatIlrWFH7Plvc1z6LKSQ19gaiwA85B7pgzmBsWUL7i_xNYwLVg>
    <xmx:oCDzaoIn1aCcUOuHPzHBn97SY3kDElFqvidVhUx9-hmbC6MN-q85eKmn>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Nov 2026 08:48:15 -0500 (EST)
Date: Tue, 10 Nov 2026 13:48:14 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Ye Liu <ye.liu@linux.dev>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] mm/huge_memory: prevent losing PG_waiters in
 __split_folio_to_order()
Message-ID: <avMaQIdAj5Zal3rd@thinkstation>
References: <20261109-fix-split_folio_to_order-race-v3-1-1cdc509e34be@nvidia.com>
 <5a7bb477-5392-404c-a748-4748cec2c84f@kernel.org>
 <940CBBBB-D564-4D4F-9C8A-A9A272F08064@nvidia.com>
 <a3557629-d86d-42f6-b181-bf8540dc1982@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3557629-d86d-42f6-b181-bf8540dc1982@kernel.org>

On Tue, Nov 10, 2026 at 12:31:21PM +0100, David Hildenbrand (Arm) wrote:
> > This is V3 of the patch. Instead of using prep_compound_page_atomic(),
> > PG_head is written before clear_compound_page(), after which new_head
> > is visible to the reference-less writers.
> 
> I'm confused, how is it then valid to have PG_waiters set concurrently while we
> read new_folio->flags.f?

It is not. The comment names the wrong word: PG_waiters can be set
concurrently on the old head, not on new_folio.

CPU1 and CPU2 below are two faults on a migration entry that points at
new_head. Both take this path:

  do_swap_page()
    migration_entry_wait()
      softleaf_entry_wait_on_locked()
        softleaf_to_folio()
          page_folio()           <-- old head or new_head?
        folio_set_waiters()
          set_bit(PG_waiters)    <-- on that folio's flags

Which one page_folio() returns depends on clear_compound_head():

CPU0: __split_folio_to_order()  CPU1: fault           CPU2: fault

                                1. page_folio()
                                   -> old head
2. flags  = new_folio->flags.f
   flags |= folio->flags.f
                                3. set_bit(PG_waiters)
                                   -> folio->flags.f
4. new_folio->flags.f =
           flags | PG_head
   smp_wmb()
5. clear_compound_head()
                                                      6. page_folio()
                                                         -> new_head
                                                      7. set_bit(PG_waiters)
                                                         -> new_folio->flags.f

2 and 3 race on the old head's flags word.

That is Ye Liu's KCSAN report, and it is benign: PG_waiters is not in
the cloned mask. new_folio->flags.f gets PG_waiters only at 7, after
CPU0's last plain write to it at 4.

So only the folio->flags.f read needs data_race().

The new_folio->flags.f read needs nothing; the READ_ONCE() I had there
in my sketch was not needed.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
