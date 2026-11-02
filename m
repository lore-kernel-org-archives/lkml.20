Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793662540;
	b=BbssUWtk2IoIV3/cvhAV3UnHIwjT9SouTMmG0aXk2Xz/1tV2pGoJBzxTy9Jt3K5FV24T
	 TV70Yd5/X6eAv50IL1RmINqiiNVBase7wn7FRmLMTdzgy1aUlaGRSvcPM31G7SsLalINL
	 j6MgV7/wKLlnenRHiF9hZSGrsRsKCbUcFhEddEBBuxScy0QzEqraKSq4hwbOtMiD2/X9h
	 hXWUKtk3nzgWj8rqBbDE9ahppFUVM5PyXbgTc1f87dq48Y42KWrDV43HP6EdGsZaPPogq
	 +2+/cjco/GxOfSBlo8OESCjWH6CKQbEFNzBSanqLSh/Bdi4O7QEXzzrLYSK5+if+Mmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fzJ7DDrA7BFfziOD+5U6zgKxvJNhVIYCuhgUNRUmPc8=;
	b=4TyHCCvMYHP6w0+zucqWyx2SNmAEe8HwC58oDn6KiS+OTTDjaIaHn9FfqyBIgyyLBNvx
	 gxZmLrSWS+QU1hLvg2f5zciJyM+ac6gnJpwIPRO9B8bD13O590O/FcL4LBvJVZFtTgJyD
	 rYKAjexEfuCyv65cIl/uEsCDgDwroiWORY62ameI4nl1crLNMwW1vTWNjm6dymKu4RDaw
	 PyXWRgXMkMybZTpX8D16UXUD4CyuH5K0T1rHUJNeQdVcXV1QxMMWEve5MlBlrt4Cj6zAu
	 eeMORvWV7cp8b6GXrAfPX/EozeWhGdvnMHToJvPrMnAwL47HM2Y8VjSu2wCt2mRaZxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aDb4Dtpv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C18606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00C18606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aDb4Dtpv
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b06c0794cfso32364687b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:35:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793662539; cv=none;
        d=google.com; s=arc-20260327;
        b=k6seFE7tIjjnjbgKmI5ik38DUhmzHn94cs82cK0RI5mIQH9Oc4cYkikpvqU1WlCvBg
         M8CRJpTgbyTR7LUHV4ElRfiayLG6yr6KVLxQE001O+VZkPng9vl92LFykmaX+hyPSWC8
         oJwvZ6XTtXkpcmuieUkvy0C7msg6oiMjoiEDr0DRxsn+L+xakr9ycKuijSCPRLpYPbDw
         hYVfuBtdfL+vG9NZjMSFR7poHR2sFRugZ9Dn9I920as3QQHopzP8l0p0UtVUnzANDOXj
         TWApcv91njpvF2JMz/IkYCyT1YpA3JC9j62i+PvNb5dVc50Xv3qP6scQpjqFUvd7EfbL
         0O7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fzJ7DDrA7BFfziOD+5U6zgKxvJNhVIYCuhgUNRUmPc8=;
        fh=oKCSYuJhOeFQmu+w3c8tKPWN8DgjjLuy10ecIsvR6HA=;
        b=EPQ6EK+IfVnvedVh16urCQWe87aUUpb2xSaDjf2nD3nvLA4igRW95eq6Gv69mlDU3f
         zNLn0rD2f4ffoqsro5havSERJRBQQLseXAlfQ/xwD1gRILc5LQbJgW8hWCUb+UfF26aL
         Ugy2yCVdp8OpFgXTYcJGYPj5YBvncqZQnz1QZe9V9MASrBDpVSCTbqWX1u+pS8EN2coD
         XYghWuHYr8btY++ZDDIssrU1IYn7rJJnld9R5dT4xZoOsng7uRRyvqxsyAID9tndAfcJ
         ujUsM9i4ClxFutuyw6xcvGBRsX6OW9mAMFpwFv6XHV7emVODgJTHIVwy3bk/6xgUCKuJ
         uPxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793662539; x=1794267339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fzJ7DDrA7BFfziOD+5U6zgKxvJNhVIYCuhgUNRUmPc8=;
        b=aDb4DtpvgkyOAKMvoIRqdt1mKwGuQ87IF+9G7QVMu5Z0iZfyebF6MriW7tQROXtEI+
         QCMBwmPB3VIhdbEPOmaXj5K07XbEfi5Dg3GVKCCc7Oddln26ISMNlf5LwB8/GAXbKxSz
         Zwm10G0M/bynqKqIeXpHXHnTJDoDHWBUegFr0ogoOTfakjtygVsCSr9CxQyZnXkg6kAS
         AzHkWxXXNGJ9UwPUYCDrWrmIrKdxww1ZDHKXo3FMCFpaFWbv8fnRaYz5Z3xeS28g7kEx
         KQDQSjiZXrdQGwy71yaWceY+Pv0bJeS9qabtqUBj758ce0J7wjLR+KqCrMeVpKbsctdG
         PHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662539; x=1794267339;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fzJ7DDrA7BFfziOD+5U6zgKxvJNhVIYCuhgUNRUmPc8=;
        b=LOIR9qabgUgxooZ7DayifvjpDDJ2TD1eGMayCziGryZWoVJ2GscSLQdsbmmVnlPS7r
         9RaEgQOgn61xvXsrdjKSLTBrxlAKaii/v44AqFrewYYMmgAGO4L8I5d0RaKLF8EknC5f
         VcuecE92+aM8GTHL31EkjtHTc5BPtNzcb/n63Gcrjlc5KKqk2G/F4Vrx7nstOJPs3KZl
         zNb9gHpTeQe484gXWuikLmvYuy4xSlW/ZpyNwvcmY1i8jTmL2LWguH93m/ROnHA4PTKK
         hp9cMpNAysnn5R4+WOGf4ERAuKsXJP0eLFT1I34fAN42UKNtDZtcWN+hoDwqFIkoZMGw
         oiTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwW+e16D/yJm0YeY/QU0q9O1j+FH2vhXQDSLAFqpmO8rYdb5Nj2TciKMQKHdxoE2P+5tzm07Zsa3DIvOx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vD0rmjvbT5KbGYE9ToYY0WqgO5/UDL+gTkmfp2lrfd0097gwb
	mQAnOHFJe1C9xl5DOipJvNkk1eK0AKYA0yUA+9QnKljOPYMCYC8C+5WEoK0Aihj5TjcOAzLOLWO
	zlENjlKLm0q0QUMSCcZ5GGdVLI9Vu1xM=
X-Gm-Gg: AYBFou2cDb85Cvwu4sLwyyqty92F+eydZawG54TPMAjScPQoqVmtgn5shiEfqJ/iA3w
	Sk0w8Hlu9AssDWzWuuYFCqjKZWBAfrInjYgij4yiehYWtL2wADzqrhIaPd7L3i6APTL138o2654
	B16Fb3kChAivAFBFtFb1M6oZZy27xvvW94Pm4pTI1g6JceXQxM/9zZIS6/DLTvsOCw3zN4WWYg1
	DO2npDdrPFllt9eW4cGeStVSGTM6pjxY2zFhTUV95RSPaneFJyqbCJPSavf5GXZb9vOaqz+hk/c
	yEVDzFKtCe/90LiujZQqZoh9/QnH3u9eKbdhj1C6R6mCTQp62EvNCp09FsXYHv/b+Q3zA1vZc/L
	HoySrCSBCb+Z9LCp/3aLiNyPCNzq0sxMJHujaOXfCbfMkoonrSjWpHmumeNKaiWBYuPqvbbvmzr
	Q8XKpt1DjJ5J7ptAR2TVJySpXrhjtv1Y3P5X8dfrV1YPK2CgjPeyTaCcUYgXhFoUaKkSRfSDc24
	3lr1cE=
X-Received: by 2002:a05:690c:a046:b0:8b0:eab2:f502 with SMTP id
 00721157ae682-8b2b67992e6mr70242497b3.61.1793662538781; Mon, 02 Nov 2026
 15:35:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026202313.63122-1-sidchintamaneni@gmail.com>
 <20261026202313.63122-3-sidchintamaneni@gmail.com> <CAGsJ_4zGmtvOApjFH_-V9z_zNWWQnrBX9q0_iWtbqzENCetfgw@mail.gmail.com>
In-Reply-To: <CAGsJ_4zGmtvOApjFH_-V9z_zNWWQnrBX9q0_iWtbqzENCetfgw@mail.gmail.com>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Mon, 2 Nov 2026 15:35:28 -0800
X-Gm-Features: AclHuK_XPYCmlY6syHd_CEWjIh9aCzkJuKkCbt_Y0sdvkYXztjtpge7vYJ3DEZ0
Message-ID: <CAE5sdEhVfFuiYySA0cNPTV6FjY3wnwccfLR7HA9vhVOF7DH+_g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm: multi-gen LRU: remove get_lruvec()
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, david@kernel.org, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, ljs@kernel.org, 
	kasong@tencent.com, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	yuzhao@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	apais@microsoft.com, rlmenge@gmail.com, 
	Hardik Garg <hargar@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Nov 2026 at 14:56, Barry Song <baohua@kernel.org> wrote:
>
> On Tue, Oct 27, 2026 at 4:23=E2=80=AFAM Siddharth Chintamaneni
> <sidchintamaneni@gmail.com> wrote:
> >
> > get_lruvec() was originally introduced in commit ec1c86b25f4b ("mm:
> > multi-gen LRU: groundwork") to guard against NULL NODE_DATA(nid) on
> > uninitialized NUMA nodes (`return pgdat ? &pgdat->__lruvec : NULL;`).
> > After commit 09f49dca570a ("mm: handle uninitialized numa nodes
> > gracefully") and commit 931b6a8b36a2 ("mm: multi-gen LRU: remove NULL
> > checks on NODE_DATA()"), that NULL check was removed, leaving
> > get_lruvec() as a thin wrapper around mem_cgroup_lruvec().
> >
> > Remove get_lruvec() and call mem_cgroup_lruvec() directly at all call
> > sites.
> >
> > Suggested-by: Barry Song <baohua@kernel.org>
> > Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> > Signed-off-by: Hardik Garg <hargar@linux.microsoft.com>
> > ---
>
> It's great to see the MGLRU-specific get_lruvec() gone. Thanks!
> Hopefully, we can get rid of more MGLRU-specific code,
> such as get_swappiness().
>

I just looked into removing get_swappiness() in favor of its LRU variant
(sc_swappiness()). Do you mean moving the additional conditionals
directly into the callsites?

something like this -
<AI Suggested>

diff --git a/mm/vmscan.c b/mm/vmscan.c
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2761,25 +2761,6 @@ static struct lruvec *get_lruvec(struct
mem_cgroup *memcg, int nid)
  return &pgdat->__lruvec;
 }

-static int get_swappiness(struct lruvec *lruvec, struct scan_control *sc)
-{
- struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
- struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
- int swappiness =3D sc_swappiness(sc, memcg);
-
- if (swappiness =3D=3D SWAPPINESS_ANON_ONLY)
- return swappiness;
-
- if (!sc->may_swap)
- return 0;
-
- if (!can_demote(pgdat->node_id, sc, memcg) &&
-    mem_cgroup_get_nr_swap_pages(memcg) < MIN_LRU_BATCH)
- return 0;
-
- return swappiness;
-}
-
 static int get_nr_gens(struct lruvec *lruvec, int type)
 {
  return lruvec->lrugen.max_seq - lruvec->lrugen.min_seq[type] + 1;
@@ -4173,8 +4154,13 @@ static unsigned long
lruvec_evictable_size(struct lruvec *lruvec, int swappiness
 static bool lruvec_is_sizable(struct lruvec *lruvec, struct scan_control *=
sc)
 {
  unsigned long total;
- int swappiness =3D get_swappiness(lruvec, sc);
  struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
+ struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
+ int swappiness =3D sc_swappiness(sc, memcg);
+
+ if (swappiness !=3D SWAPPINESS_ANON_ONLY &&
+    (!sc->may_swap || !can_reclaim_anon_pages(memcg, pgdat->node_id, sc)))
+ swappiness =3D 0;


> Reviewed-by: Barry Song <baohua@kernel.org>
