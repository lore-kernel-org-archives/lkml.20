Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276304A5EAD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361356; cv=pass; b=m3W9hLoxiB4HM52/YNT995h6J1dZMwBj7NgdMO5lOfq9wk2Wv5mVBpyubmxZ9ZLY1pC/VAyCEduSLOl899jlsGnv4DQbKbG1a3HSNTSRCwzb7esxkAGcTLTNuqht7P3Qq7ulaY0Ih36lREZBcs8mSBrwcfggbkcxQm0vPKsB7UM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361356; c=relaxed/simple;
	bh=4hCdEHOD5c3EpnGTMHlUu8D7fgdaQakWWcnz0VXo2UQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h8M1G7kpLRUEjF+AXhO+0nbIYQJNzUHo9TZdxurUo+v7ksDC2q1EMbxN90hhcoo4uxOcLnuu/zlfJ7Y0mWuR7Sb36inOEO61uw+/j2RoMsQ8QH0at5bcTmk4V7UHgBN3S63HBIqphjxA9dDykulIws70oRDQlQkP6FO8YdW1IuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FMHEYdga; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KebqNpno; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FMHEYdga";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KebqNpno"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788361346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=om4eZ/680TZMrxF1o7QRaN/1jT9e+TXfBTQEkyPNCmY=;
	b=FMHEYdgaCQBDpALaNskUyvogA8cNwPhTZI9ZiXmbDHDMUVCQ0Asd5YTKKVXbJf662vXotR
	yiLF9Pd1LgrWpfyFci8YUXugfX6n2AmHCUbbEKE0USDQmA0OKWeOiRjb4ujU85FoHcH5sq
	UYbll7afoN4w2HWB7Z4Mxitx2+eSdDk=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-hXdfUli1P6i81AEggHjPLQ-1; Wed, 02 Sep 2026 11:02:25 -0400
X-MC-Unique: hXdfUli1P6i81AEggHjPLQ-1
X-Mimecast-MFC-AGG-ID: hXdfUli1P6i81AEggHjPLQ_1788361344
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-39c9666682bso5166971fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:02:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788361344; cv=none;
        d=google.com; s=arc-20260327;
        b=UTbsMilHSsBLS0Q1XJy81htGFQypswQHquXhcofJIrTiK0CDJOOOFEPCULnL6772IZ
         56KQh2OE4DoZ281C3MA6yjZB3WPJQcIPyoXutFleRtiuVGGgII7cjgitqHindwRm6Ldx
         +5StXer9gS/p5XWqDaCVflfFUmtrERYZuQwxeE7Liscs3Ex+nSy43VlKnYMhnZsIKzxo
         hirjmlYUbyTfMVNKpREKoVUl0mkmtgdmX8H/SGPfrSs244lLFSUPVUT3+OxbXrGjqqGf
         a47PAiGziU6hY9S1iRnZ/jiXbqgBdTaqoM6MsbcwpIuG/I5P23JevrNmYmS4mrXnQAkJ
         02gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=om4eZ/680TZMrxF1o7QRaN/1jT9e+TXfBTQEkyPNCmY=;
        fh=XPHCaJQv2JodGAbRK/2Q21Xa4GaUt/LIbNayd9vUmi4=;
        b=kVo6FfjeK+dOfg6ntreuwncfnJ3HTV9/MHVb6DbtRW0Ot33R9uPrps3eLsR9+kqb+V
         s/n/WdLQfpQvG4A4LIYvnmAhEvRibfvkx6olj+iG8lASavJyLNFfVFEAVBxIZIJt6tVX
         ZUSt1WM1GoHfokhzMUM6fQ769hoa7s79p634XHT05WgYLIduApdle569s37kPobXPX8T
         8acHoBYflXnyeEInSE+KrSSgJhsUGQDRY9tof6IjozZ/byc57dq9iwVgttDVqCbtUJTg
         sfLDSeC76u2PX+YdtmlF+6FLe0wkt1SygRZNn9Is/NZEjSox9nA8yR55qfFqGHF8QlxP
         NFpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788361344; x=1788966144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=om4eZ/680TZMrxF1o7QRaN/1jT9e+TXfBTQEkyPNCmY=;
        b=KebqNpnoO9pYUMOmT8ol7BUJpxgP2/HePljmvJSq56/5H3B98nrJ7WTeZ91P8O4Pwk
         v/AL2zZzYefw0Kl2ShYiar4Y+ZfSL33zOVPE9i3rLNbUaRLn/QazG0jmvLzhTzUb4a9y
         TZiPvDQLsj8UA+YlsaBlZxOTv7QvL8S850jqe2HfTAxCMssuTW6u5m9stuu3Lu/aq97I
         H/OhI1sgoA7gajkVcCUssEzTuliRc7USJ7LG0S9AqwAZPuQui57sweOOuo9rr2yPzind
         HEUHVpW9vWBFu9HzDfLXbFkPkC3gjfOxr0rEwhiTB6tRuW4TrCpGy9lnOLzxmdIHmXRR
         836Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361344; x=1788966144;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=om4eZ/680TZMrxF1o7QRaN/1jT9e+TXfBTQEkyPNCmY=;
        b=SDRSWeMmGeXe509TA+5pMQA9iGfuqvs3pWPZQ4jrFynHd5fZOMc10l+45xoYczas6Z
         wMPODPuIgEz4VJxtooBBkj+IV0yuEMyPHVo5yWh86+FHXfoByZbsDJEZ03PkgASTQrzN
         8SJ4MZRCD4W4m3sEpVZSj+CodnZSHZtbIbEZzNnCfXlXJV5VJFsocqJpWSGz0IaqCeH2
         S0g/QHSVyQNz5/EvNDZjLfA0zCRUlahr7oP0Rl3GMI7TThy3s9NTktQ4UjvBccy6N5kf
         6KiwdTLsGqFdRSwmC+IN0qzXvEAse78N6V+zoN049BaH2AAXyU5CwywSu+reFGLKJk5a
         6HIA==
X-Forwarded-Encrypted: i=1; AKwUvByn2szyTmCOlg+hfRaj4QeKfdg8JiqepsMAB3w3oqFBeH91ddeVCu/VTeoE3G05uRdpQuYzJvBYuw5+YX4=@vger.kernel.org
X-Gm-Message-State: AFuF++lXeHXrOquW2/lkOLvWrrIb5DAr2tE+A0aKuvCpBKAEp/43F0vq
	KGUaTVd5kfaeGwgCdmwaDY6dWOzFeNzdHMbn3iqDvnuPzi4VUU7rBUxfEujH57MEUZ4dLvqhrZ7
	aGr+Ki+v6kIQCrJpfJHJN0ig/s8KWUZVEpuF8vQRepB9LO81T1d0yHYnQg3wyGEjlrzxavhCnku
	M3jy0CboLhmv3kqhpQmIgzGMAkJDEqLOwNaWyy68DR
X-Gm-Gg: AYBFou0Qm+qJYwpYzBRVP6MVEtyCqYS+wY45eImjswe1+4ZlZEcuvg5fJ5AqmbB1mSi
	3kg806ZuYZn38NJZuIE/2FFlXA7cPPBbmt3GYKhC/fg87q1YqSD7YcEgE/1QRNHf6lvX/0R5xy8
	NFvzzp+v/mNnLqBnZa7hySeFh5avrUXA2o8NhK78YFxz4PZlqkcWdFXjB3
X-Received: by 2002:a2e:9a04:0:b0:396:7547:439e with SMTP id 38308e7fff4ca-3a34fd41f57mr13878421fa.7.1788361343808;
        Wed, 02 Sep 2026 08:02:23 -0700 (PDT)
X-Received: by 2002:a2e:9a04:0:b0:396:7547:439e with SMTP id
 38308e7fff4ca-3a34fd41f57mr13878321fa.7.1788361343420; Wed, 02 Sep 2026
 08:02:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901091836.16906-1-qiang.zhang@linux.dev> <CAK-6q+jFXsZpWHrm0CSa8Tr+P3qHDmWVQA+9stXViyUf48CuvA@mail.gmail.com>
 <b530646295a64f5e1cec5bfec5064f1fc79d3d9d@linux.dev> <b686c4e5066aa11d7d868097b35e04db58190103@linux.dev>
 <CAK-6q+gET5NPczHYexcGXgptGTVnynYuVWzdbDkpsuvnbrymLA@mail.gmail.com> <2ff0e6ca8e1e05078a69dbd2b2ccd1e62fc4650f@linux.dev>
In-Reply-To: <2ff0e6ca8e1e05078a69dbd2b2ccd1e62fc4650f@linux.dev>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 2 Sep 2026 11:02:12 -0400
X-Gm-Features: AcwNN1Uhwe44GL1WoqPHmRji7SmzGB5HOuEKMZek4F9ItyxN1HMNrCmnAfT5LSk
Message-ID: <CAK-6q+hfRsoznk9is9Z0XEkfhMjacw8urk7NkZ4cr=mw6HGwcg@mail.gmail.com>
Subject: Re: [PATCH] dlm: wait for outstanding SRCU callbacks to complete in
 exit paths
To: Zqiang <qiang.zhang@linux.dev>
Cc: teigland@redhat.com, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 2, 2026 at 10:49=E2=80=AFAM Zqiang <qiang.zhang@linux.dev> wrot=
e:
>
> >
> > Hi,
> >
> > On Wed, Sep 2, 2026 at 10:30 AM Zqiang <qiang.zhang@linux.dev> wrote:
> >
> > >
> > > >
> > >  > Hi,
> > >  >
> > >  > On Tue, Sep 1, 2026 at 5:19 AM Zqiang <qiang.zhang@linux.dev> wrot=
e:
> > >  >
> > >  >
> > >  > The dlm_lowcomms_exit() and dlm_midcomms_exit() iterate over the
> > >  > srcu protected connection and node hash tables and hand each
> > >  > element to call_srcu() for deferred freeing (connection_release()
> > >  > and midcomms_node_release()). call_srcu() is asynchronous: the
> > >  > callbacks are invoked only after an SRCU grace period, which may
> > >  > happen after the exit function has already returned.
> > >  >
> > >  > These exit functions are reached from exit_dlm() on module unload.
> > >  > Once they return, module teardown continues and the module text
> > >  > may be unloaded while call_srcu() callbacks are still pending. Whe=
n
> > >  > such a callback finally runs, it executes freed module code and
> > >  > touches the static SRCU domains that are being torn down, resultin=
g
> > >  > in a use-after-free.
> > >
> > >  I should rephrase it:
> > >
> > >  Due to missed call to the srcu_barrier(), when invoke cleanup_srcu_s=
truct()
> > >
> > Then there need to be a MUST call of srcu_barrier() before
> > cleanup_srcu_struct() every time.
>
> If there are some call_srcu() call, the srcu_barrier() should be called b=
efore cleanup_srcu_struct().
> usually, when the cleanup_srcu_struct() run, we should ensure that there =
are no pending SRCU callbacks
> or ongoing SRCU grace periods at this time.
>

For me, this is a MUST because who is maintaining something to know if
it was ever called?

> there are another reason:
>
> The midcomms_node_release() srcu callback can call call_rcu(), we must wa=
it the all
> call_rcu() to complete, because rcu_barrier() which in dlm_memory_exit() =
is required
> to successfully intercept these RCU callbacks.
>

Yes, I can see why "nodes_srcu" is necessary as this has something to
do with kmem_cache is being involed.

The "connections_srcu" is necessary for the above reason that the srcu
API requires you to call srcu_barrier() before cleanup_srcu_struct()
because for whatever reason we don't do that in cleanup_srcu_struct()
as I understand it now.

- Alex

