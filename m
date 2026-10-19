Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792433301;
	b=QYvLbaV5IuMUIflrfbnQR/x9Ua69KVTpA88V1mYo8X64SDUdYwYSs6eZriCXWL0YnCrU
	 acvKbMEqO0pS0U1Q/Oa7+NxRNk8XTemR2iU1OTdZKMEfmFbfhroE07SXag/U0YvLZ6oTD
	 3FUqlmrdeEj11NPm63YZ2nQSrzsBJh850yOlFeIsjNVXxkOssWmxFkjtxXx7NrvXx3s5h
	 wv1dokg7RZ1RDMbORPFzyb20br3llGWEBuoWuJ96mmHdxU1lvWZYlgC5B9Q7i6zI3z0ve
	 aFd15nzhgRovsdxIzXw054I6U540NqwinUY9qiSvtbsJxRC0BdjbBqgg6L4q1NE73Ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CEHqrQqIUJuEAEhLJre5IVlU0Gf59c6vRQqAHHFJVMc=;
	b=ql77ddempSSsRF43C9gj4785zhsYqNTt82Z+WundT3ks1TWpXg4Wi6UM5GGLgmYdWT4H
	 kJ9FiVpiZ7aoePl0KQyntE58g7dAFJAs/hqiuDQ5ctFnq4eLxC6NFMZJWGWuhCV1vx5q+
	 TsJY73cWkyS4D1bFZm+fLXEk0iF/UIUpZbqcztiEz+W7+PUfSGIf4oaVVpGrU81L/ZlTd
	 S9Hemfdfag1dFuPzcqAEyNXagQQOLZLME3V2M9XNJDVAn6spUVuzgdx8uyyqLooyruUmW
	 sJjHK04II7Ng64cKDQdKQ/L7eUD8BJn9ZnjaAykOmSkMfo9upE4kQosdIaovr6Xyj/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=emYncTJn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723E3606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 723E3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=emYncTJn
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4956869750eso19393085e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:08:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792433300; cv=none;
        d=google.com; s=arc-20260327;
        b=n6PYoJjYUnKHif6aRhggrcgNQVwKxnDTknK7d3dg96v5E2h5WB84qCFn38IE4QcAz5
         C0ktvMlu0mezZ6JuI/EGiA5LYc5+wPU4yxMTPQlc1PGcwtnK7dunqEHSlEwN0ayrDLCT
         R+4LAxJRx8io0FMhe99hd53N7MglaKaYxyF5PKV8EzeVG4nW5zBh5+Dptk/BAG5TFQjZ
         jnUzZvfaHZNKc2yuozzkMIKJWjR/Jew6+Q0EdylCMcktlz/lo9ZsjJjkTbSl7m8kANGu
         KwWKqJ97l/kt3pcUNosa0HBEBpBU9U5pJX0ZjM8KZJ5Kd8piHvyBjt8exKeAALwo31dB
         C46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CEHqrQqIUJuEAEhLJre5IVlU0Gf59c6vRQqAHHFJVMc=;
        fh=TUwG9MMdGZWL+YFOGFkOA5AA8XKRC43nJCLhl/kWehQ=;
        b=RK4iEQt3NXlsWjCR3NEREG761oZQ9r3vn65lN/JOb8vCxrkHgRObLSYyfcXGIfkeJX
         MsVyFuL2N4i/sg3YLIybpcYFzN3x6zumjo8dOwQcjamUQnYSUp2C0qaQ8h2qz7DQYdIC
         l8pwrCD1YbvN2TP9jg9pI1jbmBND+zI1pO2y5E/i0+b4Jaqolp2DE0v/ikoJSqxG0Jim
         4kEMxPw/jwnd5fCQY/a2HHd5AoxhZYGumJyoUGaYmSK+JTxvq6LbeO7j0o6sHNmkg1WI
         x90a47C6mtIb5iJ/PfeTQD4gmEVgFwSE69EHkziGggJcDK9vRj9XrsAOz7BBeQLTH06s
         pnAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792433300; x=1793038100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CEHqrQqIUJuEAEhLJre5IVlU0Gf59c6vRQqAHHFJVMc=;
        b=emYncTJnZi7C7zDLYTFXtcjFvBBlsa2CJqUjl9Bvytwj6EQSxDUmcOJFwH4Sh9ncVv
         Bk6gYtWYPGTqZ4PJ8OECJSQaHoR6cm89P/9zL2WTA7+IPl3r/gH8ckim2GsQv+4KAHnl
         BCakoKnHkUjw5JQcuwngaiAYWcLI9lu6v6ij5qS5FmBCNcVsMz7PVjMGef5AxuXPHTOn
         w+SQyL5MBfe9n97f2WNcnQlImIUZCb1o5vwOONzHp2i3URXGFCILrWDbSPNxL09O6RY0
         XGnxu5qWV2X8OjugO21lQMydAj0IaFoYPfDybhLxbN+prD+jdVhvAwzIoPUBGSk1QVlf
         G7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792433300; x=1793038100;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEHqrQqIUJuEAEhLJre5IVlU0Gf59c6vRQqAHHFJVMc=;
        b=difPx5LkMPalQC0oLTGbnSOPdcQyvKRHczuD2/bO2rvPJqOdNEEqsGg/P7AuPNRY2+
         cIufnUQW4+H6dY5ZaLGQKcsXIRumWrbyFbihKCusVU5TFg3yHPJS4odzXyYj2LNlpp9V
         POCxr0qsfGtU6WFLThfobomQrIjURON1jJnEmr3veEC71LxJ5N4cFKbppKhCDHnj+RGU
         soS5123+qU8TT4en2uWaHvEVCQZteen/ChnsI+3BVNA6vfZa3ImuU1WLX8aqpXwpgjug
         mCZYhGr+G8GwaoFlkHTiuqglaCfXHyFnPBuAa7CE08TiwWlEohrEbkbV9ivIFUEfCYqQ
         laOA==
X-Forwarded-Encrypted: i=1; AKwUvByAF22Ga0fCofZu/z9kDy6za/IW8x0OwM8pir23b++uCiyyJ77vi/He6El9W7r2nJgs6u/Mf9R21PBH/2M=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3vyB/v7Ls+u9FfCfxsl9RJA+cjjZ/8m4fBCC8uLhswfbQvuq9
	/U5dpstU2cllHLd7X5DpvwLeD1PH6ks7Wz18ecUTiV21luvkUJd+5QotJNmoMSVEyhvyttUv7kX
	SSltys4sxEdqyZe9K2ILabZBy7DN5PDE=
X-Gm-Gg: AYBFou3b9OrCdaxLQM9L9Q5W6zYxSnCOPR3Em1D+QrBIzNNio6o9crwzZXhQWbhNkgL
	F9Cgj461VrZidImW0XtI36WgIo/zbgXHLCPddlsqRa3QrdAky+6rKiw8p5bAyEd+qkK3IOntvNN
	PtKZoYjqZS/2oAIMoIvGzg9A5gsgrdoxuRFLLLVGYMzwYEh0/h3G15jtd3x3uYSDkUwEZrTsVR+
	NwCg9LRNNR1ap1OHQXxE3HUItHCS7qd0266+SmkVVVUl8wnaI4o+60Br9FyaCTyzXlCEitxsXa4
	XvwrRmqVG1MaaHOB3q1I+5rY6tCJaMZoMLaWY7tYaJ5Lik2hN50v/LNmNsQ/VkF6p+dBT8Xg1xe
	fBFokj/rSDxhcvDid6yYcL6tuFX7i4Qx6Olww8U+qJOHQwxeX6gwJovf2jdrdRouP70hEpyo=
X-Received: by 2002:a05:600c:8709:b0:4a1:ac85:9696 with SMTP id
 5b1f17b1804b1-4a1d75f926cmr156323695e9.17.1792433299484; Mon, 19 Oct 2026
 11:08:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014090821.227366-1-jiayuan.chen@linux.dev>
 <CAMgjq7D50X47JFsTnF2-jYGv7i-Nd3WhQLK-TJGy4XkhMQU4OQ@mail.gmail.com>
 <62d17959-d695-4fec-a87b-8eadaaf995a8@linux.dev> <CAMgjq7CJ+bwKgwUmCzO9Hr7TrL68bDjgAsLx-4AGuXo6zowh9g@mail.gmail.com>
 <CAKEwX=O4sPx5MtGL4-JwLzD4TWm7fNycFMiuOqLk4ADFUUipNg@mail.gmail.com> <4f361479-1dbc-4f09-aa26-e1ad6c06cbee@linux.dev>
In-Reply-To: <4f361479-1dbc-4f09-aa26-e1ad6c06cbee@linux.dev>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 19 Oct 2026 11:08:08 -0700
X-Gm-Features: AclHuK9vaeh-jgxGcgdG4be4jSZZYP2tmKHzOooeZ7UEDXMX4rlJN14DJbM88jE
Message-ID: <CAKEwX=N4jj3PGXFx6wwh=PG4Vt6hRJ=-kqX24B55zoXyhAa1WQ@mail.gmail.com>
Subject: Re: [PATCH mm-next] mm/swap: free swap cache folios the zap path gave
 up on
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: Kairui Song <ryncsn@gmail.com>, linux-mm@kvack.org, 
	Jiayuan Chen <jiayuan.chen@shopee.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 7:37=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
>
> On 10/17/26 3:28 AM, Nhat Pham wrote:
> > On
>
>
> [...]
>
> > /proc/meminfo | grep Swap
> > SwapCached:     489006260 kB
> > SwapTotal:      976561148 kB
> > SwapFree:       487554888 kB
> >
> > cluster_alloc_swap_entry() picks clusters from nonfull_clusters first,
> > then free_clusters; it looks at frag_clusters only when both are empty,
> > and at full_clusters only when vm_swap_full(). A cluster gets onto
> > nonfull_clusters in partial_free_cluster(), that is when
> > __swap_cluster_free_entries() frees a slot in it; after
> > alloc_swap_scan_cluster() has used it, relocate_cluster() moves it to
> > frag or full.
> >
> > A leftover slot has count 0 and a folio, so __swap_cluster_free_entries=
()
> > never runs for it. Once the live slots of a cluster are gone, nothing
> > calls partial_free_cluster() on it again, it stays on frag or full, and
> > cluster_alloc_swap_entry() doesn't pick it until the device is half
> > full. That is what the swap table looked like after the run:
> >
> > list      clusters   leftover slots
> > FULL        106415       54484480   (all 512 slots leftover)
> > FRAG         44822       18471614
> > NONFULL          1              0
> >
> > Making cluster_alloc_swap_entry() revisit those clusters means changing
> > the list policy.
> >
> >
> >
> >>>> Or, from the LRU's side, put swap readahead folios at the tail. I'm
> >>>> actually trying to do that and it's not very easily doable at the
> >>>> moment but will soon be easy to do.
> >>>
> >>> That helps the RAM side under pressure but doesn't give the slots
> >>> back.
> >>>
> >>>
> >>>>> Options considered:
> >>>>>
> >>>>> 1. Fix it on the readahead side: after the read, check the swap cou=
nt
> >>>>>      and free the slot. Covers the lock, not writeback, and the
> >>>>>      asynchronous read path unlocks in the bio completion where the=
 slot
> >>>>>      cannot be freed. Two places to patch, neither clean.
> >>>> In fact, readahead checks the count before starts the read. It shoul=
d
> >>>> prevent some of the problems but seems not enough.
> >>>
> >>> Right, the count is still 1 at that point. The zap drops it to 0 whil=
e
> >>> the read is in flight, after the folio is already in the swap cache.
> >>>
> >>>
> >>>> And another idea, what if we just add dropbehind flag or rotate the
> >>>> folio, if folio_try_lock failed in __try_to_reclaim_swap?
> >>>
> >>> dropbehind would work for readahead and writeback if the read
> >>> completion honoured it too; today only folio_end_writeback() does, fo=
r
> >>> zswap writeback folios, and swap_writeback_dropbehind_folio() expects
> >>> the folio off the LRU. It still misses other lock holders (migration,
> >>> split, ...). Rotating only helps under memory pressure.
> > Yeah might be worth trying. You'd have to modify readahead and zswap
> > load logic to check folio_mapped() etc. I suppose...
> >
> > I'm not sure how reliable it will be FWIW. There is still a race
> > window right? Albeit a bit smaller - the readahead thread might check
> > the dropbehind flag before __try_to_reclaim_swap() sets it.
> >
> >> Right.. But I think it will be much better to avoid such folios from
> >> hunging in the swap cache in the first place instead of having a
> >> worker to reclaim them. I'm not strongly against adding a reclaimer if
> >> other approaches are too difficult at this point though.
> > Also, IIRC, dropbehind can only be handled in task context, right?
> > We'd need to make readahead bios to complete in task context
> > (BIO_COMPLETE_IN_TASK). I wonder if this has any perf implications.
> >
> > Another idea: how about, in swap_read_folio(), where we are guaranteed
> > to have the folio's lock, we check if folio is mapped. If it's not,
> > invoke folio_free_swap(), unlock, put, then drop that folio from the
> > submit batch?
>
> At that point the swap count is still 1; the zap comes while the read
> is in flight. Checking after the read works for the synchronous zswap
> path, which I tried first, but the bdev read is unlocked in
> swap_bio_read_end_io(), in interrupt context, where the slot cannot be
> freed.

Zap drops swap count first, then try to free swap cache. You're saying
the read check the swap count before zap dropping it, but still holds
the lock by the time zap try to free swap cache? :(

I was kinda hoping this kind of interleaving would be rare :(

And yeah, I think if we want to free the slot after read, readahead
swap IOs have to be submitted with BIO_COMPLETE_IN_TASK. zswap
writeback's dropbehind relied on that...

>
>
> > That takes care of the readahead race. Seems safe to me
> > (I assume if a folio is not mapped and swap count =3D=3D 0, then it's a
> > pure readahead artifact, but maybe I'm missing a case).
> >
> > The write direction already tries folio_free_swap() before submitting
> > the writeback, FWIW.
>
> Same shape: the zap arrives after that check, while the folio is under
> writeback. On our box with a swap partition that is where most of the
> leftover came from.
>
> Every check on the holder's side runs while the count is still 1. Only
> the zap sees it go to 0, and it cannot wait. That is why the patch has
> the zap hand it over instead (very nasty i know it :( ).

Yeah I got no smarter ideas :( sweep_work it is...
