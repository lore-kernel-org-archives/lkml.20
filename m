Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7BF3DAAD6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789440136; cv=pass; b=pJ807bAQeRE4lET6JWsN3YH9oMmhGJNnBMiZ5HMohXCuDuLtXsasrWEYAHeXCzbaCaG3u2dmrolb5PSkN0/DMyqAFBHewNFkP6im2x5P/nT5r9TvDCwJ4RvbFuwuUIcFPg+kgt1GY/BgzUQEf7soPp8regD4kpwZxFftmXe9WCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789440136; c=relaxed/simple;
	bh=+DDdbGLSJfvQbZkbGm7bBoB2KElgfTdMwS/XgJyKo2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rWkN5inug0fAcsB/kLAm7jQbyDoDqB+0xG66t6A/xcxTV6WwYvbTpTrvudtc+166y/pCPUePe47Lf/Xrp6pj/Oyu5wE/x/MYzCHOcEhKopWsFChjUquCMp7BJmPUvrzIlPeY3UGMgA0ee01EWGCYOpJE5eUfo0WgufvWsT/jlbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5Bl9yTF; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5Bl9yTF"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac8990caso367008f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789440133; cv=none;
        d=google.com; s=arc-20260327;
        b=PwzEhRXUmRpoTFWHOCCgA+OR4WPJTyvanROHff/BapbdtVxOo5UjmFZS9oCt2RGVpU
         p6KQjSWei8ezWIP9SuDpFmEj2o464ieNfvSnlnrKClwjqH4HAB3NM4ILp7LEw7iKdlsG
         udYLTly8+k1ed9f4cxvxdTO/QmNOkuoWPeJ8vF7w885mDPk7pFbmo4QS/kT6YvBGRMhp
         uxToIe2fhM9NNxWMAW5wm3sNkLBAgpsHp418NBTwVyvx6eneHdHtvbchbTBqkYPhsj+L
         /qQmHrhSPCJjnjM7sCKQUcvwxB6LixiNUYnm1J0AUc6pOe3TkDJSE2PDmI14v2cOyLMN
         9ZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U6R6y4nzdJbQk6LyzNosubAtaa0HaBHr8xGj66Oybpg=;
        fh=QBzoNd9iHTvQWVHR9+JIM7nzZv9CpOG5dLGDh6no6ZA=;
        b=HN3GHIr7wmeQvtREjmB1+fXrsAaygmKLouM/ID1tNnNQWJn43qcYT5fRDghfScyM8M
         cZSazAAvt1mlpAdk0RZ+/ZRkoOToUADmIrEiuSpWF5GRuyfRR4zGgi/Y008eO6kjV8Gf
         0Wi8dQVt2ZqVpBPCeKbYIPfMy14hUxgez4G+7GTVicXfGodrcsDq288I0ScjrUn7tbYC
         yKyEpKumNBkhA7UbYkCXf/bZUR3TVbJHzhKEjyeHn0QfzDyFg5Ng1AzXTnaf+m7SFZZL
         qQb6kTFkQzngAzqifLLK299eL17rmsxwcOZxcPre6RmTXNBGn7AWMyyc5lpcHGH1bKv6
         qiwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789440133; x=1790044933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U6R6y4nzdJbQk6LyzNosubAtaa0HaBHr8xGj66Oybpg=;
        b=F5Bl9yTFHxsrgKGlRhVtjKN3HtIr/mxWCSI/B2sxNni4rN6Pea2yyZiyP03GlKR3pc
         RlL3OXEOhFEnOfLHrpNMohTZiStlZwh3p/btco5wS7i0zU4rJQmQrefBC4szZgUiHW8b
         IgmGpTqFUqFoxfB50peF/qOz1hX3fV2bfl/q/9JO1RK/KKjkBB6uYDYc9bI5QrW9pbre
         br2rE6C5M53MlSWgXTq4GHfCYttAuVQiulYzKOfFNcPg83G6veAbayGVaPrZfCmLAlFL
         qBO/sBet/Hn5buZbEEgQX5c67Yh1ijgybF5+/gaJpmFHu2GcO85BkTAi90ecBN6HcVlX
         SRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789440133; x=1790044933;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U6R6y4nzdJbQk6LyzNosubAtaa0HaBHr8xGj66Oybpg=;
        b=0JsRg4mimVG8CHZfPkEAublP2pxHF6oc0dauvrsNdlOLTH0igLDBCEJRceeNp4uV0W
         loDH6/Rp3Q5PdGfnCsHH7M2xRZypn23SNJk4K4EkqUzsIk0lhpKEO++GpbY5NHGq+XMq
         YBT7WheYCfjlzPNOdX93aViN+7qiHTSdL6WtE1uudQN8MGi2CpoFX6x7E1d9xmfMJt9W
         72284oCQp1f2WHR/aJQGy2+pGqNBZB58qKYivYogEabA4PQMGi+EcuBGh6epGPw2lu9M
         Ou11FRX2WFHUJFw3iZSeB5doM1MXCxogGgjik1Hk8NV12Tedzdsg6u2SGS5BE9Ssc1Bj
         MDBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAzQ3mE9qmpbCmgZWf9BmFpd6OOP5nnu8rlyxnPzqoibGtI06XqLH47/tRzSaAQ5nGYgctTRQePnmM0bs=@vger.kernel.org
X-Gm-Message-State: AFuF++nsyGI6R1esnV088B4grhCVbeIdKRKUwI2AeIfAaZsKqptpwbUT
	kEebpdnPF7nKnqsTw9cFE8TsxQlBQxSlOLCDcVw3h6+B1pGMS3iTaPuLsFimEYAFAUp1XXa+72J
	p+SUTl62+a2Q8I9NUxSejmKYDJ3wrW1bej9r2
X-Gm-Gg: AYBFou3PzLUaBEuzsJe4b2E74Sf9pRXmj5fuDvpGNJXdjWN+8chzCUp+3Pxs2KADNi7
	Y5vNRtBFUJsim+P/RCaduEnvTlcqG9mK9EM8B2Hc6DCEIcb2qHpVXUu7/h0AGzqiBzazvM/4Fdh
	saq2KdieisedhkdyTZXcGGMEoodpBiUOZ/gS93N4rVaSmw07DR0BGoRTr01LWaUE8Jtz+jTeagO
	eUOIkdj1VoVx80n2npQmuvzRWWojsSP5YjJEqfJR0h4aa1b2efNHNrh8YTDe1e+kPQuipZXqr51
	ZS612ZPsRtXufv7qbnhCTLxDcT+TtVLxGMGX6Z/YG8dgjIpVXEM97wZC5o/d9YL+DNE=
X-Received: by 2002:a05:6000:2f84:b0:485:b0bb:38a3 with SMTP id
 ffacd0b85a97d-48702bd61f1mr5645821f8f.6.1789440132621; Mon, 14 Sep 2026
 19:42:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911232405.1815804-1-chao@kernel.org> <20260911232405.1815804-4-chao@kernel.org>
 <CAHJ8P3J2kOBFhy5zTDw1c_67Z9Mmbw-nzZqQui9-W8ajh4b07A@mail.gmail.com>
In-Reply-To: <CAHJ8P3J2kOBFhy5zTDw1c_67Z9Mmbw-nzZqQui9-W8ajh4b07A@mail.gmail.com>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Tue, 15 Sep 2026 10:42:01 +0800
X-Gm-Features: AcwNN1Wvz2cwRHmiHhFaLGuOJHDOu2bz5EZJMzg53Lu2M-lRG5aVMq08PsI4TBI
Message-ID: <CAHJ8P3Jc5FxkeK6yNAUfw3kt3ZX27G_vwdk0w1PCuCYkt=HkAw@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v7 03/12] f2fs: cache: introduce shrinker
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Zhiguo Niu <niuzhiguo84@gmail.com> =E4=BA=8E2026=E5=B9=B49=E6=9C=8815=E6=97=
=A5=E5=91=A8=E4=BA=8C 10:34=E5=86=99=E9=81=93=EF=BC=9A
>
> Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
> =E4=BA=8E2026=E5=B9=B49=E6=9C=8812=E6=97=A5=E5=91=A8=E5=85=AD 07:28=E5=86=
=99=E9=81=93=EF=BC=9A
> >
> > From: Chao Yu <chao@kernel.org>
> >
> > This patch integrates the metadata cache into the F2FS memory shrinker
> > subsystem to reclaim clean, unreferenced cached blocks under memory
> > pressure.
> >
> > It implements f2fs_shrink_cache() using a 3-phase cache reclamin method=
:
> > 1. isolate clean entries from lru list
> > 2. truncate from radix tree under lock
> > 3. splice un-reclaimed entries back
> >
> > And hooks the new interface into f2fs_shrink_count() and f2fs_shrink_sc=
an().
> >
> > Signed-off-by: Chao Yu <chao@kernel.org>
> Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Hi Chao,
sorry, pls ignore the attachment in the last email. its Operational
error by myself.
thanks!
> thanks!
> > ---
> >  fs/f2fs/cache.c    | 89 ++++++++++++++++++++++++++++++++++++++++++++++
> >  fs/f2fs/cache.h    |  3 ++
> >  fs/f2fs/shrinker.c | 12 +++++++
> >  3 files changed, 104 insertions(+)
> >
> > diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
> > index fb0ab77d3b49..563615761d11 100644
> > --- a/fs/f2fs/cache.c
> > +++ b/fs/f2fs/cache.c
> > @@ -537,3 +537,92 @@ void f2fs_destroy_cache(struct f2fs_cached_block_l=
ist *cache)
> >         f2fs_put_cache(entry, true);
> >         goto next;
> >  }
> > +
> > +static unsigned long f2fs_do_shrink_cache(struct f2fs_cached_block_lis=
t *cache,
> > +                                               unsigned long nr_to_sca=
n)
> > +{
> > +       struct f2fs_cached_block *entry, *next;
> > +       LIST_HEAD(dispose_list);
> > +       LIST_HEAD(keep_list);
> > +       unsigned long freed =3D 0;
> > +       unsigned long scanned =3D 0;
> > +
> > +       /* Phase 1: Isolate candidate entries from LRU list into dispos=
e_list */
> > +       spin_lock(&cache->list_lock);
> > +       list_for_each_entry_safe(entry, next, &cache->lru_list, list) {
> > +               if (scanned >=3D cache->num_entries)
> > +                       break;
> > +               if (scanned++ >=3D nr_to_scan)
> > +                       break;
> > +
> > +               /* If accessed, give it a second chance to rotate to ta=
il */
> > +               if (f2fs_cache_test_and_clear_referenced(entry)) {
> > +                       list_move_tail(&entry->list, &cache->lru_list);
> > +                       continue;
> > +               }
> > +
> > +               if (f2fs_cache_test_dirty(entry) ||
> > +                   f2fs_cache_test_writeback(entry) ||
> > +                   f2fs_cache_test_locked(entry))
> > +                       continue;
> > +
> > +               if (f2fs_cache_refcount(entry) !=3D 1)
> > +                       continue;
> > +
> > +               list_move_tail(&entry->list, &dispose_list);
> > +       }
> > +       spin_unlock(&cache->list_lock);
> > +
> > +       /* Phase 2: Process isolated candidates one by one */
> > +       while (1) {
> > +               spin_lock(&cache->list_lock);
> > +               entry =3D list_first_entry_or_null(&dispose_list,
> > +                                               struct f2fs_cached_bloc=
k, list);
> > +               if (!entry) {
> > +                       spin_unlock(&cache->list_lock);
> > +                       break;
> > +               }
> > +               f2fs_cache_get(entry);
> > +               list_move_tail(&entry->list, &keep_list);
> > +               spin_unlock(&cache->list_lock);
> > +
> > +               if (!f2fs_trylock_cache(entry)) {
> > +                       f2fs_put_cache(entry, false);
> > +                       continue;
> > +               }
> > +
> > +               /* the entry has been truncated */
> > +               if (!entry->cache) {
> > +                       f2fs_put_cache(entry, true);
> > +                       continue;
> > +               }
> > +               /*
> > +                * at least there are shrinker, radix tree and another =
user
> > +                * has referenced the entry.
> > +                */
> > +               if (f2fs_cache_refcount(entry) >=3D 3) {
> > +                       f2fs_put_cache(entry, true);
> > +                       continue;
> > +               }
> > +
> > +               f2fs_do_truncate_cache(entry, false);
> > +
> > +               if (f2fs_put_cache(entry, true))
> > +                       freed++;
> > +       }
> > +
> > +       /* Phase 3: Splice un-reclaimed entries back onto cache->lru_li=
st */
> > +       if (!list_empty(&keep_list)) {
> > +               spin_lock(&cache->list_lock);
> > +               list_splice_tail(&keep_list, &cache->lru_list);
> > +               spin_unlock(&cache->list_lock);
> > +       }
> > +
> > +       return freed;
> > +}
> > +
> > +unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
> > +                                       unsigned long nr_to_scan)
> > +{
> > +       return f2fs_do_shrink_cache(META_CACHE(sbi), nr_to_scan);
> > +}
> > diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
> > index d5ee51691fac..5728e2225465 100644
> > --- a/fs/f2fs/cache.h
> > +++ b/fs/f2fs/cache.h
> > @@ -206,4 +206,7 @@ void f2fs_stop_cache_wb_thread(struct f2fs_sb_info =
*sbi);
> >  #define f2fs_truncate_meta_caches(sbi, start, len)     \
> >         f2fs_drop_cache_range(META_CACHE(sbi), start, len, true)
> >
> > +unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
> > +                               unsigned long nr_to_scan);
> > +
> >  #endif /* _LINUX_F2FS_CACHE_H */
> > diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> > index e3e0a7e89406..baa09bc63585 100644
> > --- a/fs/f2fs/shrinker.c
> > +++ b/fs/f2fs/shrinker.c
> > @@ -37,6 +37,11 @@ static unsigned long __count_extent_cache(struct f2f=
s_sb_info *sbi,
> >                                 atomic_read(&eti->total_ext_node);
> >  }
> >
> > +static unsigned long __count_cache(struct f2fs_sb_info *sbi)
> > +{
> > +       return META_CACHE(sbi)->num_entries;
> > +}
> > +
> >  unsigned long f2fs_shrink_count(struct shrinker *shrink,
> >                                 struct shrink_control *sc)
> >  {
> > @@ -68,6 +73,9 @@ unsigned long f2fs_shrink_count(struct shrinker *shri=
nk,
> >                 /* count free nids cache entries */
> >                 count +=3D __count_free_nids(sbi);
> >
> > +               /* count generic cache entries */
> > +               count +=3D __count_cache(sbi);
> > +
> >                 spin_lock(&f2fs_list_lock);
> >                 p =3D p->next;
> >                 mutex_unlock(&sbi->umount_mutex);
> > @@ -120,6 +128,10 @@ unsigned long f2fs_shrink_scan(struct shrinker *sh=
rink,
> >                 if (freed < nr)
> >                         freed +=3D f2fs_try_to_free_nids(sbi, nr - free=
d);
> >
> > +               /* shrink generic cache entries */
> > +               if (freed < nr)
> > +                       freed +=3D f2fs_shrink_cache(sbi, nr - freed);
> > +
> >                 spin_lock(&f2fs_list_lock);
> >                 p =3D p->next;
> >                 list_move_tail(&sbi->s_list, &f2fs_list);
> > --
> > 2.49.0
> >
> >
> >
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
