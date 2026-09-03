Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D920472762
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788453657; cv=pass; b=mqA4qSaE4EUWvUAMldRqbVEtE7J9OxdeDrcvAXWHBlRQxiQIBExts6+dnFxa/GKuEwi4A0eJD/1FhXppIHa+Wql1YIOaLWWy885FgRT9lbpsuywovKaylrYQA3BHUSlWhcIXJnGrUd05usiKtPaJYzKbPFVQh3kbeNggCDgJG38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788453657; c=relaxed/simple;
	bh=J0dhx+VeUTRJHd1Uk49mYD+x7HKao8t8elSFpjtDW1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VC03aATr9gElianH2povW0/gFHjUlo9HXYMJD/115bAIXvGfHvd7XqUd7XkOy4nNsUxMVRKziVVPGk9HqexOiMzZsax7kAZ19kgNkwdfdGfKZmtrRqDxTMYLszNYCOXivtUl7z2jt1udHRKgq3bTg4U8LqjLUzFMeQtXQWsEAq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UrH/BbNV; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UrH/BbNV"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so271281cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788453655; cv=none;
        d=google.com; s=arc-20260327;
        b=Eoj1qLt982Tk6m3piYm0HjE+BRzUDvMu2hyk5KNMsNMrIwlME+PxQopH3RjBtDwkQt
         LaCdh4GJ2BuQSsEnwXtbEBrU3SXfkzjJQ5m37jConlGD41oSBEZs+SqNCO0OKrv8g999
         u3g2rU2tRu9m9BglSE0AtXDiJTHJVA3eAPHSqc4RBPgzY5LySvd3U6HkalSjAX1PQgrK
         T2U6UcM3lNpzSvlhJFd8W+L9ZNi/ehiiXNkGffspyxz1p2aeE20b+j04mxMeInjndqAO
         pobL1zZF3xmFdc+Zbyjb9SRvWN306AgKczkjC8WZxo1dqf3fEu5KvN+uroDSURY7JfpE
         BfXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bWWOqaCDFtUK4h2CQWXGFy/5EpfShib0USljQr9tOwA=;
        fh=qXMI7gvOjMBPpXkzk1GAMJ94t++7dC7TGSxJIclJcUY=;
        b=ecLDvgbJAWUnM3FLGKqt+gs6to7N24Yxg3OqRCDUf+DqrgsvL0+QeJ5IozeJdzjEwX
         0i8qrL55X77znetnABzNl3ldkiYmuTqlTwt2BRmkropYn+YN+W1DZHNstzrmZM2bPAVm
         b34/75nkQriRW7p53dZoY+tQCJy2bZ3UTVybHPgLEDIpXeIT5m0t6JC56fThi1kM1NBP
         WLbJNMS4ICTj8IIQYvXof+TAN8V4c+6bff8xNmexaIzipyBoaH8mayF7LvENE44+Z61O
         ZeBz/q6XOA4wLnL76gw6+aLrcfPfTdgVHASjeTvxXZ49O4ZHudCKA7URbR6k84o0Wt91
         fDdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788453655; x=1789058455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bWWOqaCDFtUK4h2CQWXGFy/5EpfShib0USljQr9tOwA=;
        b=UrH/BbNVOIr+nwFaKTZdhKKXwk9xeEDY0wMSnns09I6+EmiGwRLdGvyFTBwWsOaD6+
         pm5P87GTLjmFVs+shsZ47PjGvBn5hGFfnbpy7Hm26AqYHAJskOSucfFFzZKM9TSh+jIy
         3PCkvJhubG6d77vYZrFVUE4whBlkqjZikMve5J1nem6P/ox9srRnx1Jv8mogfhQldZbp
         WD274rHKJZdMUDgU3zJLQtrw4sCOZ3M6Q0rpc6AKa+U9ZgVENvEfXezSYEqfBrnuoVbK
         FAlW0+fl66XCNxQtKtma8GqobEZlPf98KlQGbdBqs0kA6fQpfXmOYVBOa22Vo2NPwNFY
         l1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788453655; x=1789058455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWWOqaCDFtUK4h2CQWXGFy/5EpfShib0USljQr9tOwA=;
        b=lb6u08etxmeA29bn8h9vgv+w1e37ACv3evGm/tjFF8CGJShORyo6+30vgwPNPZVzyg
         b6pPxlcvPacnCGY72pOraeWPptzWT5c4acBXK0iOeLYkUcBBkLliGL2ooU83jDl61us2
         DFKdC+91mFxQR1xyYxyL4uUx3Ce4HlgkHdBzC4JHKfTy/RwRAWCgzNNkhl8rC9osCcTC
         dK9xzc9N4i+JqRwDOIO6lsVrc6jjJkyzN+q/FiQo4ojS9IE/hN28gb6E2ZGlBX5QrwdR
         FjW0KncJhEUnQ018CWTixqOCxHeq26D/NCcHlv56JboklHb3yMHCsSxhWhyn+pYLRpDo
         WcmA==
X-Forwarded-Encrypted: i=1; AKwUvBwUKtJdIRfHvII17TkX5MGeAjGpbU6QbTKWfimQZmTGuPybm5pY6HmhY3aaMBr+3CVMLtBdWzXNw3+rQOc=@vger.kernel.org
X-Gm-Message-State: AFuF++m7sxtsQ5PXHinhc2WRJLhyHl9sRHHVM0BpN9G69jWLL249sjBy
	ELlDbe5jhbAhWUOOe6wzKuZ2An61qxgflyqaW1SgSmz8FgjVQIIH3j0Um/wSrlOtiWJGDxPFL2B
	tD0+1nLF8hcIqkPc4useu6rM8VRGHr9ewwE2fdHah
X-Gm-Gg: AYBFou2CfQCBlaRYvlvhK1auatkTgV5aNyStfaTkZ9ie9m6WRTMBMF+1LWyrpH2fKKe
	/tFQ/mjzQqVtvE9vaZ1Y5xd8QXejVkT9S5wFUqy3oh4tVUi1nF4SfkYtzYiM8YPWZAJlsXOxZz7
	ozAI72/pgCTMkEujHZT4TmiJn2MZ/mvfsI5Q9cTaUP5+bEYjwk8ywwUryPAK1kMv03+Bfbp7kxG
	YxNCjn/QCpqNSQ4D9WbO11kbVdyYQsMVh3y9tj+wjF3MQuV75tt0v7WmptjEfPX5re/tn5IWfbt
	H/uSNXDUl77FaHFBId/ES7Rj5zN2cqkDzu0aFvdLk/A+O9UbQ+CVubZPa3eV1y9zM7PclUeLZQN
	DzB0oFbM=
X-Received: by 2002:a05:622a:293:b0:517:64f6:3365 with SMTP id
 d75a77b69052e-53043e62d4fmr18986561cf.4.1788453653083; Thu, 03 Sep 2026
 09:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903132251.237029-1-acme@kernel.org> <20260903132251.237029-6-acme@kernel.org>
In-Reply-To: <20260903132251.237029-6-acme@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 3 Sep 2026 09:40:40 -0700
X-Gm-Features: AcwNN1UEzYLyLW7bFheLs0fRmukHfSV8n-mDlL9d14htXgMHbEC_TGM3Ry1Umms
Message-ID: <CAP-5=fUu4F2kj=8S+EPU21pffRJpNJs_z84oJdZhJ6n7tmi=+g@mail.gmail.com>
Subject: Re: [PATCH 5/5] perf dso: Defer dropping the open list reference
 until after the lock
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	sashiko-bot <sashiko-bot@kernel.org>, Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 6:23=E2=80=AFAM Arnaldo Carvalho de Melo <acme@kerne=
l.org> wrote:
>
> From: Arnaldo Carvalho de Melo <acme@redhat.com>
>
> There was a problem in the code with some resources potentially being
> left unbalanced, and the logic on dso__data_close() becoming confused
> if the fd had been closed already.
>
> The reference taken by dso__list_add() on the open list cannot be
> dropped while holding the open lock: dso__put() may call
> dso__data_close(), which takes dso__data_open_lock() itself,
> deadlocking and leaving the list and its counter inconsistent for
> concurrent threads.
>
> Fix it by changing dso__list_del() to transfer the reference to a
> deferred node, drained by dso__put_deferred() right after every
> unlock of dso__data_open_lock().  Since the counter is now decremented
> under the open lock, do_open()'s close_first_dso() no longer races
> with a stale count.

So I'm not a fan of this change due to its complexity. There reference
counting with dso_data is funny, see:
https://lore.kernel.org/r/20240506180104.485674-5-irogers@google.com
Basically a dso has a dso_data embedded within it. Perhaps the cleaner
fix is to allocate the dso_data, separate from the dso, and have a
reference to the dso from the dso_data. We should be able to scope our
lock usage and avoid deadlock without resorting to a deferral
mechanism.

Thanks,
Ian

> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Cc: Stephane Eranian <eranian@google.com>
> Assisted-by: LLM
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> ---
>  tools/perf/util/dso.c | 75 ++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 71 insertions(+), 4 deletions(-)
>
> diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
> index 42bfe30a3b518e80..a4b2361bc7420084 100644
> --- a/tools/perf/util/dso.c
> +++ b/tools/perf/util/dso.c
> @@ -531,18 +531,79 @@ static void dso__list_add(struct dso *dso) EXCLUSIV=
E_LOCKS_REQUIRED(_dso__data_o
>         dso__data_open_cnt++;
>  }
>
> +#ifdef REFCNT_CHECKING
> +/*
> + * A deferred put: carries the reference taken by dso__list_add() for an
> + * entry removed from dso__data_open.  Dedicated nodes are used so that
> + * the dso_data's own open_entry node can be relinked by a concurrent
> + * dso__list_add() without corrupting this list or its reference.
> + */
> +struct dso_data_put {
> +       struct list_head entry;
> +       struct dso *dso;
> +};
> +static LIST_HEAD(dso__data_open_put);
> +#endif
> +
>  static void dso__list_del(struct dso *dso) EXCLUSIVE_LOCKS_REQUIRED(_dso=
__data_open_lock)
>  {
> -       list_del_init(&dso__data(dso)->open_entry);
>  #ifdef REFCNT_CHECKING
> -       mutex_unlock(dso__data_open_lock());
> -       dso__put(dso__data(dso)->dso);
> -       mutex_lock(dso__data_open_lock());
> +       struct dso_data_put *put;
>  #endif
> +
> +       list_del_init(&dso__data(dso)->open_entry);
>         WARN_ONCE(dso__data_open_cnt <=3D 0,
>                   "DSO data fd counter out of bounds.");
>         dso__data_open_cnt--;
> +#ifdef REFCNT_CHECKING
> +       /*
> +        * The reference taken in dso__list_add() cannot be dropped while
> +        * holding the open lock: dso__put() may call dso__data_close(),
> +        * which takes dso__data_open_lock itself, deadlocking and leavin=
g
> +        * the list/counter state inconsistent for concurrent threads.
> +        * Transfer the reference to a deferred node drained by
> +        * dso__put_deferred() once the lock is released.
> +        */
> +       put =3D zalloc(sizeof(*put));
> +
> +       if (put =3D=3D NULL)
> +               return;
> +
> +       put->dso =3D dso__data(dso)->dso;
> +       dso__data(dso)->dso =3D NULL;
> +       list_add_tail(&put->entry, &dso__data_open_put);
> +#endif
> +}
> +
> +#ifdef REFCNT_CHECKING
> +/*
> + * Drop the references deferred by dso__list_del().  Must be called
> + * without holding dso__data_open_lock: dso__put() may re-enter it via
> + * dso__data_close().
> + */
> +static void dso__put_deferred(void) LOCKS_EXCLUDED(_dso__data_open_lock)
> +{
> +       for (;;) {
> +               struct dso_data_put *put;
> +               struct dso *dso;
> +
> +               mutex_lock(dso__data_open_lock());
> +               put =3D list_first_entry_or_null(&dso__data_open_put, str=
uct dso_data_put, entry);
> +               if (put =3D=3D NULL) {
> +                       mutex_unlock(dso__data_open_lock());
> +                       return;
> +               }
> +               list_del_init(&put->entry);
> +               dso =3D put->dso;
> +               mutex_unlock(dso__data_open_lock());
> +
> +               free(put);
> +               dso__put(dso);
> +       }
>  }
> +#else
> +static void dso__put_deferred(void) {}
> +#endif
>
>  static void close_first_dso(void);
>
> @@ -805,6 +866,7 @@ void dso__data_close(struct dso *dso)
>         mutex_lock(dso__data_open_lock());
>         close_dso(dso);
>         mutex_unlock(dso__data_open_lock());
> +       dso__put_deferred();
>  }
>
>  static void try_to_open_dso(struct dso *dso, struct machine *machine)
> @@ -865,12 +927,14 @@ bool dso__data_get_fd(struct dso *dso, struct machi=
ne *machine, int *fd)
>                 return true;
>
>         mutex_unlock(dso__data_open_lock());
> +       dso__put_deferred();
>         return false;
>  }
>
>  void dso__data_put_fd(struct dso *dso __maybe_unused)
>  {
>         mutex_unlock(dso__data_open_lock());
> +       dso__put_deferred();
>  }
>
>  bool dso__data_status_seen(struct dso *dso, enum dso_data_status_seen by=
)
> @@ -1058,6 +1122,7 @@ static ssize_t file_read(struct dso *dso, struct ma=
chine *machine,
>         ret =3D pread(dso__data(dso)->fd, data, DSO__DATA_CACHE_SIZE, off=
set);
>  out:
>         mutex_unlock(dso__data_open_lock());
> +       dso__put_deferred();
>         return ret;
>  }
>
> @@ -1188,6 +1253,7 @@ static int file_size(struct dso *dso, struct machin=
e *machine)
>
>  out:
>         mutex_unlock(dso__data_open_lock());
> +       dso__put_deferred();
>         return ret;
>  }
>
> @@ -1405,6 +1471,7 @@ uint16_t dso__e_machine_endian(struct dso *dso, str=
uct machine *machine, uint32_
>                 *e_flags =3D 0;
>
>         mutex_unlock(dso__data_open_lock());
> +       dso__put_deferred();
>         return e_machine;
>  }
>
> --
> 2.55.0
>
