Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F6C30C637
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 01:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788573136; cv=pass; b=XVvER2C2Wbd77oOR4kBJVWgCFVE4eHZDAMXeLyeTsgTvrreaX6yzTF5a6JY36cKjKE4JPoJk0bkr/k3kQJQOPCCLRpshNfGV82r6cM4loEWyDmhfFd6WU+lXEfS8Q73DjbVdVTHggPB4yP1AQ73nX6pIRok6A9diFPi0mRxBaIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788573136; c=relaxed/simple;
	bh=QXe/qLEGPNp6rYVF9CAbWyTgXu3VADgmCm+boxz7WzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HH1WJZEmHQMcz1FoOtIeCjD1tr3//u+mjb21+D/UxYE2LCZO7uzZVFalRWS0oQrZKXmzvaMXi76UcKCmMOzQuSm1I4ehHGoFMxi4nE+EykYn/h2iQ8Eia2Fquqd6Mm/lQTGv3wInymSz9yJcsA/meR2vaEiykq2dMZN084N6QbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=clyso.com; spf=pass smtp.mailfrom=clyso.com; dkim=pass (2048-bit key) header.d=clyso.com header.i=@clyso.com header.b=F1km+XtK; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=clyso.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clyso.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clyso.com header.i=@clyso.com header.b="F1km+XtK"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c197e7e4e94so277086666b.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 18:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788573132; cv=none;
        d=google.com; s=arc-20260327;
        b=Hf7JlE/1OHOUcyocfeaDioB8aUqpftFb/Ks0qHyV4S3QsKBNZ1hORraemcXphFqrap
         WU7JaCFWw2Notp/2M6/HM/1oyIUVYn7cZH1G9meKjYWBc0Qw6Z/xURKygswH6icvmgib
         mTyB1rH8esLsuHDLVd/6yqkAD3xsc9FRp/mB8k7y9gyhScFUQP0agQnReTMhuPJNOOH6
         qSJXNMbHq7vZvjUT9N5NByDl6A+I8MU6OgXKSnrk86dty4NlCl5hyoZ0cF7nK5Bu+Awh
         oDXWC0Dp5CEcMWXD7dfWKd7Ej9WnmmC89DAvuec4pZD8ttYz54lOdixUOll3DDQEmuHS
         Ywpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zizaHlGLemHEp2ko9U/krNPoMS0xneIqW4TRSLAG3is=;
        fh=TnaYhK8p8HIuX2DPY63gDFlG3O0BNBQeJ+G4+IJEK68=;
        b=HwP7FaLda2k+VbE6BcpPfRI6msmtvg+icOWE1tjLtuXtA1Qe78sZSR8LBmmu9GuAFa
         dlsvdbnl1TIKtNiwzHiEyXkqZ/G/JnRXp61unH1r5rZVoHea6wYCjNBK5ty6SzotRpjX
         4bSv8aoaPr02gvqjXdfGZ3Nv+MjdUOZ17Db/hp5IwJvHHtD5NYnQr7+FAvu87ZdCW7ZC
         vgESumx2wWhzpB1HRO4sH5Jtx6MuHONxgclcT/M7KEnVltZJLtkOXeRAk+/piZER7LLH
         8dDpdYNq9ZAldgY2PIYwX2tWCC6j4etF1Vh0aWwxleFEeLqu9d7pJdlCs4AFdX5GZQrv
         IqcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=clyso.com; s=google; t=1788573132; x=1789177932; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zizaHlGLemHEp2ko9U/krNPoMS0xneIqW4TRSLAG3is=;
        b=F1km+XtKUusQ9t4acZzrpuwQ1pGBJ8aKZMR5Z+1rMpn9ihiW8FUBlaOpJWYAlwbGb8
         chaDrHHHhAq2hLuf/mOScKVig2xmEuLLHmWiPwTpcRCclsklpfVismFVPd3pUWLehV3n
         Am4AqMpTUu/vEKtqo8+jPaLzPjIMrQLamWDEJtSSBfEUNLs4u9VqkZz2a1ZupeVK2zke
         LG2h3A+VnsnS6kpg3ds8d9hqhDvF4L3nfymSS5I3u0Si7kB6eFY+snNe1j6u0PeaestA
         ltdTAirLn7bzoYy8j3w2Rvm33hHaRv89YaWM2cVzFyz9P9giFSM6KF1Ar0jf1Oent5ZB
         R9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788573132; x=1789177932;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zizaHlGLemHEp2ko9U/krNPoMS0xneIqW4TRSLAG3is=;
        b=ksSj7grastegMKoXA/TchAH6rz7hpbU/g/yN0JO0midNlBWRJTrIXCjJ4IlFFBuIHc
         +CHk6yycKvxNrkzntHOyuldxrClMuQv4WDHQHZimanndC5rUDn+N12Gig81ZJyMp8QqB
         IwxVIUqnXfmQ+Zx/Zcj/Oqbl/XZiox0h/xzWJYnfetsT+GrXZZt5owhZ33d0BqGJAp30
         6AMgON+4P3Zx4xN9WenFaqlrQV4UOmhgvOGApSgFlYMrAkaIpleuLjdzOU7Z2kvuJLRK
         M5msLKbZpi0lbgXcr8NhH7Q0YgWLMXmtB4Xukey4nQbyJ9y0H5iW+sa9tk2r1IpVvecf
         k8Kg==
X-Forwarded-Encrypted: i=1; AKwUvBzGVEtnIDZU+aXTwKxR9acM+Kh62QOFp6aEKwYI+oz02LLMIXeL4YDYq2A8NbqQPWSiN1IyyQIHV17Whhk=@vger.kernel.org
X-Gm-Message-State: AFuF++m45BgaKbnhX34r/4Fyiko0v9b0/9ABCi6AghKUTEwy2oF7gcuU
	8f1htFPOqwrXbe8M1ylZbo29ppY2CwHasAnSJz0PweTP+cJiw/sd1Vn8ozw2ELuJ2VeTBD39Jph
	MsEtcDcHcYQdge22wGhuMiC1lIO/4u8UxZsPN9UftWA==
X-Gm-Gg: AYBFou3ciSco/5Nn93BdTFqXImoX0kOislOQ8LDh9rvnny7TDgx0p03NRnnj4QmPojW
	btPjbY7sQPQaNDKKf3hzVLfqsox+O9AkpfhZGOOB8Kp6Yg+sGV4W/o5DwZsL5R/yKcIqtLrSSSb
	ePcYhecCzheS0C/DAKcVMCAMGM5d3aukip2ZjB2kU/XnORr1D6RhFCWo6zlD5c7koq7aOOnexUt
	jgotE3z1Ks8NJh1dRM9GlqKuECv9WGVVxN7CqQRQ598en9ID5yqk1XnuLQ94W4PvNxpzdJ270X4
	9659Ma5k/cqeL0UbOs6x0wMs6QTYRAUOxeMw5naF3dQB8A==
X-Received: by 2002:a17:907:7b9e:b0:c26:19de:9ace with SMTP id
 a640c23a62f3a-c2619dea6ffmr271428166b.38.1788573132401; Fri, 04 Sep 2026
 18:52:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904150304.49104-1-max.kellermann@ionos.com> <20260904150304.49104-2-max.kellermann@ionos.com>
In-Reply-To: <20260904150304.49104-2-max.kellermann@ionos.com>
From: Xiubo Li <xiubo.li@clyso.com>
Date: Fri, 4 Sep 2026 18:52:00 -0700
X-Gm-Features: AcwNN1WDZu_1s8_xnV9u-kbrEsmmesZJZNKdYDJ26EL6R83yaSu4quJJiSUFKlE
Message-ID: <CAOJNxRJ-A8+PyVYB75ensD_i4r0MppFJ32_hXrD9HhzcQRCJ_Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] ceph: fix use-after-free in check_new_map() after
 early session put
To: Max Kellermann <max.kellermann@ionos.com>
Cc: idryomov@gmail.com, amarkuze@redhat.com, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Good catch Max.

LGTM.

Reviewed-by: Xiubo Li <xiubo.li@clyso.com>

On Fri, 4 Sept 2026 at 08:03, Max Kellermann <max.kellermann@ionos.com> wrote:
>
> check_new_map() drops mdsc->mutex while it locks a session, prepares a
> reconnect, or kicks flushing caps.  A concurrent teardown can call
> __unregister_session() in that window and drop the sessions[]
> reference. When check_new_map() reacquires mdsc->mutex, its temporary
> reference may therefore be the only reference keeping the local
> variable `s` alive.
>
> Commit ee611a750955 ("ceph: fix UAF in check_new_map() on session freed
> during unlock") addressed this by taking a temporary reference around
> each unlock window, but it drops that reference as soon as mdsc->mutex
> is reacquired, while `s` is still in use:
>
>   ceph_get_mds_session(s);
>   mutex_unlock(&mdsc->mutex);
>   mutex_lock(&s->s_mutex);
>   mutex_lock(&mdsc->mutex);
>   ceph_put_mds_session(s);    /* may drop the last reference */
>   ceph_con_close(&s->s_con);  /* use-after-free */
>   mutex_unlock(&s->s_mutex);  /* use-after-free */
>   s->s_state = CEPH_MDS_SESSION_RESTARTING;
>
> If the session was unregistered during the window, the sessions[]
> reference is already gone, so this ceph_put_mds_session() frees it.
>
> Additionally, the session could be freed while its s_mutex is locked,
> which trips the WARN_ON(mutex_is_locked(&s->s_mutex)) in
> ceph_put_mds_session() and then unlocks freed memory.
>
> Fix this by holding a single reference for the whole loop iteration:
> look the session up with __ceph_lookup_mds_session(), which returns it
> with a reference held, and release that reference on every exit from
> the loop body.  This subsumes the per-window get/put pairs, so remove
> them.
>
> Fixes: ee611a750955 ("ceph: fix UAF in check_new_map() on session freed during unlock")
> Cc: stable@vger.kernel.org
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
> ---
> Note the stable maintainers: this is a fixup for ee611a750955, but the
> bug has existed before; see
> https://lore.kernel.org/ceph-devel/20260828174504.1247038-2-max.kellermann@ionos.com/
> for a patch that applies to pre-7.2 kernel versions.
> ---
>  fs/ceph/mds_client.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/fs/ceph/mds_client.c b/fs/ceph/mds_client.c
> index a091f77cedaf..d36a114747ae 100644
> --- a/fs/ceph/mds_client.c
> +++ b/fs/ceph/mds_client.c
> @@ -5860,9 +5860,9 @@ static void check_new_map(struct ceph_mds_client *mdsc,
>         }
>
>         for (i = 0; i < oldmap->possible_max_rank && i < mdsc->max_sessions; i++) {
> -               if (!mdsc->sessions[i])
> +               s = __ceph_lookup_mds_session(mdsc, i);
> +               if (!s)
>                         continue;
> -               s = mdsc->sessions[i];
>                 oldstate = ceph_mdsmap_get_state(oldmap, i);
>                 newstate = ceph_mdsmap_get_state(newmap, i);
>
> @@ -5875,7 +5875,6 @@ static void check_new_map(struct ceph_mds_client *mdsc,
>
>                 if (i >= newmap->possible_max_rank) {
>                         /* force close session for stopped mds */
> -                       ceph_get_mds_session(s);
>                         __unregister_session(mdsc, s);
>                         __wake_requests(mdsc, &s->s_waiting);
>                         mutex_unlock(&mdsc->mutex);
> @@ -5896,15 +5895,14 @@ static void check_new_map(struct ceph_mds_client *mdsc,
>                            ceph_mdsmap_get_addr(newmap, i),
>                            sizeof(struct ceph_entity_addr))) {
>                         /* just close it */
> -                       ceph_get_mds_session(s);
>                         mutex_unlock(&mdsc->mutex);
>                         mutex_lock(&s->s_mutex);
>                         mutex_lock(&mdsc->mutex);
> -                       ceph_put_mds_session(s);
>                         ceph_con_close(&s->s_con);
>                         mutex_unlock(&s->s_mutex);
>                         s->s_state = CEPH_MDS_SESSION_RESTARTING;
>                 } else if (oldstate == newstate) {
> +                       ceph_put_mds_session(s);
>                         continue;  /* nothing new with this mds */
>                 }
>
> @@ -5915,7 +5913,6 @@ static void check_new_map(struct ceph_mds_client *mdsc,
>                     newstate >= CEPH_MDS_STATE_RECONNECT) {
>                         int rc;
>
> -                       ceph_get_mds_session(s);
>                         mutex_unlock(&mdsc->mutex);
>                         clear_bit(i, targets);
>                         rc = send_mds_reconnect(mdsc, s);
> @@ -5924,7 +5921,6 @@ static void check_new_map(struct ceph_mds_client *mdsc,
>                                                "mds%d reconnect failed: %d\n",
>                                                i, rc);
>                         mutex_lock(&mdsc->mutex);
> -                       ceph_put_mds_session(s);
>                 }
>
>                 /*
> @@ -5937,15 +5933,14 @@ static void check_new_map(struct ceph_mds_client *mdsc,
>                                 pr_info_client(cl, "mds%d recovery completed\n",
>                                                s->s_mds);
>                         kick_requests(mdsc, i);
> -                       ceph_get_mds_session(s);
>                         mutex_unlock(&mdsc->mutex);
>                         mutex_lock(&s->s_mutex);
>                         mutex_lock(&mdsc->mutex);
> -                       ceph_put_mds_session(s);
>                         ceph_kick_flushing_caps(mdsc, s);
>                         mutex_unlock(&s->s_mutex);
>                         wake_up_session_caps(s, RECONNECT);
>                 }
> +               ceph_put_mds_session(s);
>         }
>
>         /*
> --
> 2.47.3
>
