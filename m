Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F793446066
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788560170; cv=pass; b=qAGOQQL1DdtQyZ1BaCgo9fNVulsAcQ59wCReP0iXya5PBF2+LJRZVDwqM9HjoftCvRxSogPKTNXMnkAhAjcUVxd/qJYaCXu9QR6/mC752+b7pNI90S7ljgQUg/mUu1/C78YOzieKv4xe4Kn+EsQbI9W/1Fd9wX5vzi59KSxwu7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788560170; c=relaxed/simple;
	bh=dz2fj88YTNw0Ti+IhRHiMFJ+cu0G95tHI9e8c83/Hzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W6OrhBodn8dx+CCs7Mfw7SB6+0bt9fKBmEQZhwcxUj6N9IQZ0Dh0SDidsGqBzi4s9PVkyFvKuuh+K6OcdCoDpF/BXFUvXTa37POGFYWPRzeaBYZbgFRMbiOKekg7v9UVV8LxZxX1qaPmFTdBdaL1rE2E1wb4unMbqs6qKPjvd5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NKwV3ncZ; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NKwV3ncZ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3bc34cso5125e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788560166; cv=none;
        d=google.com; s=arc-20260327;
        b=SVuqqFE5hJxd9dljEMM8Cau6GvA6yojC/Q4ddsij5S05adgZzjqlCjJtt+EXAOOXCv
         CznNFf8kDfIQBTjNDQou/uDRmUYNxK+sA5bi1wFTyh+YJJQYh2VG1Kr/6Qr07f8IO/o0
         8p+9TFuhiEYqA+Vjo3j5OX8OhcrFXpDDgexfNOCXUBbiGUvvlAa98HV5Ne+0C4HLnqOJ
         oLsPFweW+gXoRJiWtfAgjPTYI2wZTSo8JXNujJCwlqUponx3J/PyxCD3/8FQDxH+IHFX
         syn5w0/6D/skecKjGL4cB99I28mH69Pwt3pT06kO6g4MsBlVAaryX06eH7Cx03B5oIuO
         iQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0l8VM1lkkUjt52ORVhFYEbx3JRFVUpwcUSSFpCihGCk=;
        fh=e282yoOffn+n7df4ZUCQzk3si+w7JGSaKNO2IXLaG00=;
        b=fFReSdXo+QNg6ro/3ysVpopdLWPh1lZ6XPh2MbdUSCyc3SCAq5I2O50dOEbggK+sxd
         MvDhk8J6tlY5ZFvTV7FoMvCuF27ZCuQgMuOhV8kGjJC7L5cQJK/ytA+VL5xkqIrRwE76
         KyRjZMSfKYkm33B4K9FLIosIT+mHqKBLEKbXOo9uHsp5JDsggURIZJwVJUw3faBt6yfO
         L14C9cuAsvqyDzBIv3RXWAEvNiNfXIzKhWAm0sno7+Bd+nkMgMNpV550GgW7xsHnXbM6
         mdOtTNxzBZFT1iCiuakI+rI53/JAK4rtPW9b7MsFj56gsv37ZaMwnsQrN5jn6HrTYQkY
         ZNRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788560166; x=1789164966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0l8VM1lkkUjt52ORVhFYEbx3JRFVUpwcUSSFpCihGCk=;
        b=NKwV3ncZA2lylVdyey7jD7wRUGkdvzs7/XYI2XZD0HgmOwZtp5fcsqw4e5ovBEOGAz
         bm7Ui01c/Yxj8yQhaf5KH5yD/uoaLUljRUuZcGmZJL9KXMUNmJT4x4SUXJ3zNXflXqoh
         i88/QuZJAJz8uGKWXc+PtWZt5egoLWDdrU+vqSM9Sb3coQmjOTVvikd7qslAVYnwBtFW
         U3WrypdHxswdeum18xARveXZQLSi4CvhgBw7RY2P7uH3k7W5I7I6cNeWItj62zEh+Ny/
         uf3KFfnzY3A1TzY3vikPi41R+HGXuJaB+SDrToOro1jeQcLvMB0RXwxvX5xPxDP/qLs0
         GQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788560166; x=1789164966;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0l8VM1lkkUjt52ORVhFYEbx3JRFVUpwcUSSFpCihGCk=;
        b=ZlsbnehSEVvDfL5Ig5vkqoXXt2TGGxmYJwo91g4udZy7qPkNfpMaUlwbWe8pR6P4a6
         zj76LJxjv0tKtMBUOAkD/ljI3qihYUJPGN/0ek3eFcLDAeoO99/1pRkt/HVw3ueMN1oJ
         dZUpOqQnLJZ4V1hdLJnQCkw2Pw4jElNYdQry8p+F0AtEov7PgKskexsMjVFgXmd1eG6s
         yRyik/+e0kjZQzdM24tkzEUjVsKWIp3g314we/b7NXOn7cTY3I/doe3ULK9n5fZulnyh
         ZGJRADf9eu8TI+gg1REEpl62PfoPvLIvsuE0MjsueXtjOI26oGH2jt3f8TK6eSrpW8Fk
         zAww==
X-Forwarded-Encrypted: i=1; AKwUvBx76GQYREbxrwPxP9fLSKyRdIA52iBXmZs/ukihvtY1y8W4N72itnz0JEReh7REsFeWSS6bQtabEfgmTDQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lyp+kpazBUmtcg4yB9i4YZXO83NFXQDxN/KLiexzXKuoRrbCl5
	SEGmWMeQv3qwvpumfC17Ysh+Mt2AxfQLGNuOpk2L5lSz3HKRgng7Kl1Ev5aUleQTJ0EcyGu+Lnd
	Cp6EPRCHCg36GdTIcf2UCtMdaktXxEoTj835k5bbY
X-Gm-Gg: AYBFou0GStGneUj0p1QbdAOW7fjyX/En9APvHb08eaZLQdgnFWeYYXMMsLikTL641sj
	1+4TpF+EY2x4QXFG11F6DILG0KJi6egJ/rsARwyBMCzPMPJXfOi3KSilpmEOFcLxLYpM9YiGGoG
	BbGG699CLFMaLOCmPQRB99aFaB6XuKHByhHkaAGg0e17gC/OVBt+CnZWWE7KPZJa1/PYk7m5pY7
	Yfun51n0LJ1rV5AhlxCmb9rmaht/uvUrTY7Vtt315AUbfWTEbBlqp4nrUmpg9APg7Z/vlphLx8t
	FOwig3t3cm63PllGCkW/DmgsrBFwjBcSnvfN6QVS51NzDeXW8ASmPwdL9f9Et4P1yBvXkBBB6vA
	=
X-Received: by 2002:a05:600c:470a:b0:499:c4db:2ea9 with SMTP id
 5b1f17b1804b1-49d01dd5312mr209675e9.9.1788560165981; Fri, 04 Sep 2026
 15:16:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904173145.2028377-1-stevensd@google.com> <apsTohKZNnZuWIxC@linux.dev>
In-Reply-To: <apsTohKZNnZuWIxC@linux.dev>
From: David Stevens <stevensd@google.com>
Date: Fri, 4 Sep 2026 15:15:54 -0700
X-Gm-Features: AcwNN1VpnwWrsGTRyjmKHtNydJf_FSs12X_Euci9xsJuEck82AevDlkEA_BZZfE
Message-ID: <CAOiLmNGdPk+7v6Aqm9ctQV9J3YKti50gVTP00P=-3cZ8-x5cUA@mail.gmail.com>
Subject: Re: [PATCH v2] memcg: Don't call schedule_work when no spinning is allowed
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 12:03=E2=80=AFPM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> On Fri, Sep 04, 2026 at 10:31:45AM -0700, David Stevens wrote:
> > Memcg charging can be done from any context, but calling schedule_work(=
)
> > isn't safe from an NMI. If memory.high is breached from a context where
> > spinning isn't allowed, use irq_work to schedule the reclaim work.
> >
> > Fixes: 3ac4638a734a ("memcg: make memcg_rstat_updated nmi safe")
> > Acked-by: Michal Hocko <mhocko@suse.com>
> > Signed-off-by: David Stevens <stevensd@google.com>
> > ---
> > v2:
> >   - Added missing includes reported by Lorenzo and kernel test robot
> >   - Added Acked-by
> >
> >  include/linux/memcontrol.h |  2 ++
> >  mm/memcontrol.c            | 13 ++++++++++++-
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> > index 8170bb8066a2..4a5ef0aba475 100644
> > --- a/include/linux/memcontrol.h
> > +++ b/include/linux/memcontrol.h
> > @@ -23,6 +23,7 @@
> >  #include <linux/writeback.h>
> >  #include <linux/page-flags.h>
> >  #include <linux/shrinker.h>
> > +#include <linux/irq_work_types.h>
> >
> >  struct mem_cgroup;
> >  struct obj_cgroup;
> > @@ -219,6 +220,7 @@ struct mem_cgroup {
> >       spinlock_t       peaks_lock;
> >
> >       /* Range enforcement for interrupt charges */
> > +     struct irq_work high_irq_work;
> >       struct work_struct high_work;
> >
> >  #ifdef CONFIG_ZSWAP
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index 6dc4888a90f3..0e8b302ca9ad 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -62,6 +62,7 @@
> >  #include <linux/seq_buf.h>
> >  #include <linux/sched/isolation.h>
> >  #include <linux/kmemleak.h>
> > +#include <linux/irq_work.h>
> >  #include "internal.h"
> >  #include "swap_table.h"
> >  #include <net/sock.h>
> > @@ -2360,6 +2361,11 @@ static void high_work_func(struct work_struct *w=
ork)
> >       reclaim_high(memcg, MEMCG_CHARGE_BATCH, GFP_KERNEL);
> >  }
> >
> > +static void high_irq_work_func(struct irq_work *work)
> > +{
> > +     schedule_work(&container_of(work, struct mem_cgroup, high_irq_wor=
k)->high_work);
> > +}
> > +
> >  /*
> >   * Clamp the maximum sleep time per allocation batch to 2 seconds. Thi=
s is
> >   * enough to still cause a significant slowdown in most cases, while s=
till
> > @@ -2752,7 +2758,10 @@ static int try_charge_memcg(struct mem_cgroup *m=
emcg, gfp_t gfp_mask,
> >               /* Don't bother a random interrupted task */
> >               if (!in_task()) {
> >                       if (mem_high) {
> > -                             schedule_work(&memcg->high_work);
> > +                             if (allow_spinning)
> > +                                     schedule_work(&memcg->high_work);
> > +                             else
> > +                                     irq_work_queue(&memcg->high_irq_w=
ork);
> >                               break;
> >                       }
> >                       continue;
> > @@ -4129,6 +4138,7 @@ static struct mem_cgroup *mem_cgroup_alloc(struct=
 mem_cgroup *parent)
> >               goto fail;
> >
> >       INIT_WORK(&memcg->high_work, high_work_func);
> > +     init_irq_work(&memcg->high_irq_work, high_irq_work_func);
> >       vmpressure_init(&memcg->vmpressure);
> >       INIT_LIST_HEAD(&memcg->memory_peaks);
> >       INIT_LIST_HEAD(&memcg->swap_peaks);
> > @@ -4337,6 +4347,7 @@ static void mem_cgroup_css_free(struct cgroup_sub=
sys_state *css)
> >               static_branch_dec(&memcg_bpf_enabled_key);
> >
> >       vmpressure_cleanup(&memcg->vmpressure);
> > +     irq_work_sync(&memcg->high_irq_work);
>
> On RT kernels, this will put rcu grace period here while we are holding t=
he
> cgroup_mutex. Easy fix would be to use IRQ_WORK_INIT_HARD instead of
> init_irq_work() in mem_cgroup_alloc.
>
> Something like:
>         memcg->high_irq_work =3D IRQ_WORK_INIT_HARD(high_irq_work_func);
>

This executes as part of css_free_rwork_fn(), so it isn't under cgroup_mute=
x.

-David
