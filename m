Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913246;
	b=CGZf8piiavWJI0Hu4/j78PtyE/eplgCC1Yz/I0jSUlCFme87pkoe9zjLp+orbd1ROaKi
	 dTHs26qKSAHJgAvVW7z+lCvu/wM3XNayozR4ObxpXLVPWyQA3nX47M/tnl9qTs2usDeHK
	 KuS3eNRBKHgxTVwsLEURpMz2cMZ7tVwnAQNHo+APWTjCKXC6OAnUfjlP4X0hfUYYpj2jl
	 //UNO8fq7vxBDQjucQ4MV41uBu9dq3sH8R76zbN6XmAWRL/nqhbdAOF2IvzTmYEjjNXLg
	 UMMyLfacwuG+s/KnYjz0Nm10DuktVjLxTtLsKooseyguohrjBalpDppE+hzCvzooOnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913246;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y+Jf9HlpMjkJ/6ix4ew1upvfuwcFL6cNOjjo/sfG/Rw=;
	b=3XyKEQ/O0eCEes+Meqfcz8XOkNW936ekLKgsRkk4I/PV0AKpnoVMMSYnbcNBFTCG+btm
	 aIza6Pm7w/vuboSvVePVUn6qmDBwY1KHVxZRPjWmFC3g/iGX7jMQms7ACizOfdbnI/BrO
	 w04IwCiPY2PEzlygYrZRpUeL9nLvMYt7espbIBTza09Fch0nx3iqYIPCU4/zSkfyjtJwG
	 dsRt/ENAFVK5v4BNI6U1ZCMLIDTR88KAK3dQ2PwIDAnnINbH0B2dEu63h0Nibl4VTQCbl
	 HFVdDbHj5lX5J9Tv9RbNLa1PsI8zdStflo6TK4oJb+r+r1BrtGp11IZGx1/GB4a0JDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jEGgnV3t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18BE606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jEGgnV3t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B43431F008A2
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793913245;
	bh=y+Jf9HlpMjkJ/6ix4ew1upvfuwcFL6cNOjjo/sfG/Rw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jEGgnV3t5PzKSQ8TikIytSkfbH6GjCYtswDDlXqn5J0Otuddr7NPu3NDUrWlHYb9F
	 wP4bwTNiIUIV6uZ1swyYXldSCut1FcqDSozHOwFtHh2aFovXvDNDvkNi+VT72fUt2e
	 OMAPOnQ9eRAsM4rd0sNy6FRT8ObKgqBqMZH9YDMtXv4oli3JL9FZMM97NY8MDYBHou
	 xZuhRenhEr2fSyPRQiSWonqnZiEqoBdQ4toaiI2LkXL4CWmSK0JleysKh6bbtX6caE
	 RV/zjdP1GpnM19U0Wp2mawSZEZpZNmsxc8LMBqitH1pWRwzYvUapib0VUL9lnIgtbD
	 VEvsbaJoBgwCA==
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e7ad9f78dso281440985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:14:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz1Uotaa5qCyvu3e9a2cMv3CbCQ6mV2ufBjyH99p8Q6V6/6XZD5lMx3xN8ky5Z5kUTLfZtoFjTdzz/YGMQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z86fu099EzxyO8KswQLRrhjUXLL3uMP9LUGp8nXKPRmsW+OFOX7
	lIukmx30KwdKTB7AI1C3UDmYH98xtr08DrlxAza4s5BYyACoBT9tWpqAzQKc5yb2PiVGxhJFsJc
	sdSUB0yO4LyBZI+HSn+9rmzXZSSv/dsI=
X-Received: by 2002:a05:620a:4385:b0:93f:2ae1:ea06 with SMTP id
 af79cd13be357-945f34ac2f8mr61467985a.44.1793913245103; Thu, 05 Nov 2026
 13:14:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026084035.535989-1-hui.zhu@linux.dev> <CAMgjq7AJSU9jUBTHGcm05mtGBH4EMQ_ua9YNwuLOGVzhkdLKkA@mail.gmail.com>
 <CAGsJ_4zPZg6pCuhDtTpSkueS2EDSfWeYa23h7kC9hEU0iGB-+w@mail.gmail.com>
 <CAMgjq7DvmrwTu0vz7oHx7y7w1B9uA0AbS3YJ5CcrDVg9VwKqpw@mail.gmail.com> <CAMgjq7A6jJQ_Ncp0BCqjQJ8pJXrjr1PoOu0rdj0NJOivKp6e+A@mail.gmail.com>
In-Reply-To: <CAMgjq7A6jJQ_Ncp0BCqjQJ8pJXrjr1PoOu0rdj0NJOivKp6e+A@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 6 Nov 2026 05:13:54 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zO5S5XFc6dd70wKEs_mzqu_QW2bGOPyhKo4w2cjZrWUQ@mail.gmail.com>
X-Gm-Features: AclHuK_B_VZ3qcNpr2dPS2dUlAbGVZX7TPvdgSf43uHODhJbux5jfw9zMDTWt5Y
Message-ID: <CAGsJ_4zO5S5XFc6dd70wKEs_mzqu_QW2bGOPyhKo4w2cjZrWUQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/mglru: fix a no-op lru_gen_clear_refs() call in lru_lazyfree()
To: Kairui Song <ryncsn@gmail.com>
Cc: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Yu Zhao <yuzhao@google.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 3:27=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
[...]
> > > > >
> > > > >  mm/folio.c | 6 ++----
> > > > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/mm/folio.c b/mm/folio.c
> > > > > index 35e242b48870..ea3adb6a89d7 100644
> > > > > --- a/mm/folio.c
> > > > > +++ b/mm/folio.c
> > > > > @@ -597,12 +597,10 @@ static void lru_lazyfree(struct lruvec *lru=
vec, struct folio *folio)
> > > > >             folio_test_swapcache(folio) || folio_test_unevictable=
(folio))
> > > > >                 return;
> > > > >
> > > > > +       lru_gen_clear_refs(folio);
> > > > >         lruvec_del_folio(lruvec, folio);
> > > > >         folio_clear_active(folio);
> > > > > -       if (lru_gen_enabled())
> > > > > -               lru_gen_clear_refs(folio);
> > > > > -       else
> > > > > -               folio_clear_referenced(folio);
> > > > > +       folio_clear_referenced(folio);
> > > >
> > > > Why can't we just call folio_set_lru_refs(.., 0), and should we cle=
ar
> > > > PG_workingset? Keeping it helps PSI on refualt / redirty tracking (=
not
> > > > sure if meaningful but CLRU does this), clearing it makes eviction
> > > > better, but the eviction issue is MGLRU-only, CLRU keeps it.
> > >
> > > I recall that in v1 [1], Hui mentioned:
> > >
> > > "Use folio_clear_referenced() rather than
> > > folio_set_lru_refs(), which is not defined without
> > > CONFIG_LRU_GEN."
> > >
> >
> > Or prehaps we can have a folio_clear_lru_refs() do in a unified way
> > for For both CLRU / MGLRU? (Just like folio_migrate_lru_refs).
>
> And it will be better if we can keep this operation off-list just like
> right now :), some later works could benefit from it.

lru_gen_clear_refs() is currently multifunctional. It clears
refs/workingset, but also returns true to skip
folio_batch_add_and_move() in both deactivate_file_folio()
and folio_deactivate().

This actually looks a bit weird. However, following the current
logic, I've drafted a version that we can use as a starting point
for discussion:

diff --git a/mm/folio.c b/mm/folio.c
index dc2c796a4ea7..bc17cd3b6b6c 100644
--- a/mm/folio.c
+++ b/mm/folio.c
@@ -444,12 +444,12 @@ static bool lru_gen_clear_refs(struct folio *folio)
        int type =3D folio_is_file_lru(folio);
        unsigned long seq;

-       if (gen < 0)
-               return true;
-
        folio_set_lru_refs(folio, 0);
        folio_clear_workingset(folio);

+       if (gen < 0)
+               return true;
+
        rcu_read_lock();
        seq =3D READ_ONCE(folio_lruvec(folio)->lrugen.min_seq[type]);
        rcu_read_unlock();
@@ -465,6 +465,8 @@ static void lru_gen_inc_refs(struct folio *folio)

 static bool lru_gen_clear_refs(struct folio *folio)
 {
+       folio_clear_referenced(folio);
+       folio_clear_workingset(folio);
        return false;
 }

The another option is:

diff --git a/mm/folio.c b/mm/folio.c
index dc2c796a4ea7..8d1fd788188c 100644
--- a/mm/folio.c
+++ b/mm/folio.c
@@ -438,6 +438,12 @@ static void lru_gen_inc_refs(struct folio *folio)
        } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags)=
);
 }

+static inline void __lru_gen_clear_refs(struct folio *folio)
+{
+       folio_set_lru_refs(folio, 0);
+       folio_clear_workingset(folio);
+}
+
 static bool lru_gen_clear_refs(struct folio *folio)
 {
        int gen =3D folio_lru_gen(folio);
@@ -447,8 +453,7 @@ static bool lru_gen_clear_refs(struct folio *folio)
        if (gen < 0)
                return true;

-       folio_set_lru_refs(folio, 0);
-       folio_clear_workingset(folio);
+       __lru_gen_clear_refs(folio);

        rcu_read_lock();
        seq =3D READ_ONCE(folio_lruvec(folio)->lrugen.min_seq[type]);
@@ -463,9 +468,10 @@ static void lru_gen_inc_refs(struct folio *folio)
 {
 }

-static bool lru_gen_clear_refs(struct folio *folio)
+static inline void __lru_gen_clear_refs(struct folio *folio)
 {
-       return false;
+       folio_clear_referenced(folio);
+       folio_clear_workingset(folio);
 }

 #endif /* CONFIG_LRU_GEN */
@@ -659,10 +665,7 @@ static void lru_lazyfree(struct lruvec *lruvec,
struct folio *folio)

        lruvec_del_folio(lruvec, folio);
        folio_clear_active(folio);
-       if (lru_gen_enabled())
-               lru_gen_clear_refs(folio);
-       else
-               folio_clear_referenced(folio);
+       __lru_gen_clear_refs(folio);
        /*
         * Lazyfree folios are clean anonymous folios.  They have
         * the swapbacked flag cleared, to distinguish them from normal


I would personally prefer the latter. What do you think, Hui and Kairui?

Best,
Barry
