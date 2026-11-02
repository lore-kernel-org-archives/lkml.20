Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793633398;
	b=JUcmKJ6bCVpcn28QKMBBS2FKfBWGUkGBLUEWm76yaBJPe7EnZ+qWL/lL7XxOb4UHv/QM
	 ZpHSOqgpkJTx5tcIFoc8mZR7y+zarR33s686rz+97owX1x4IX5yzXGXzisIT2wBYTPoim
	 GdFGU+rDgUKYo4So+Y6sp/dsFu5agh2ct0QxVsX7fZsocrJhsfYNTL55gddt39U4DOe65
	 a2cmx72AULof0reQxh91PvKoZZCQxdWJ/Pd9dHlEM8ZHjF4QjiYNBl5y3nAMm9EnlreMx
	 Hg9uLCtzjTFsn2po1FVRFTC3YBCIOBgdUH5TlY4SPFyCJHDgzJU3Nh+D2RCGmPeyCtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=P7oHHMkIM1swADUlplUIw0AliwJNApZ8BZBXp6ze1xc=;
	b=lYfaoNWgDH5S3+GukQxXySCf8q+jMrRANVOopGSAmLgp0WcKZc7DnrStVxPtbIcTnywk
	 r29xQOxiifayM43Lp6CQKc1LF9uiYcmIaof4+LadSOGUNkis4NmjiwKbhBCdy0dPUPsRW
	 PakxwKH4pt0K/Bk/RGLVh6LvCMVRDnJdou9EmO3qDgt7yv+5neSpssUMEWNezB2Aa+Jd6
	 Qqvci63DKS8l1BfyPJ9Bn7ZOsv44nyjkzwwQ06+Tt9/DjISgBjePEYrTM/9PNZIuGyWgI
	 p+cda4etKX2FTXGOrjDTBCE7XwPyaYHudjVy6ggnTFf3CGvLsRVlCGlJi+LDZsx1r6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DPoB7zEb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B0960D2B9E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7B0960D2B9E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DPoB7zEb
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so3932701241.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:29:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793633397; cv=none;
        d=google.com; s=arc-20260327;
        b=ZTPaj38Dra7Smg6HAqepMPGkCZouq5ZLKngNdZJDprrrytfcFWlzSh/o40jYqQulb7
         HsHnJbsi+B97Y1OVV/D5IPRNf8sd7LU7SNjOeF7+v/FPKJa3SdKHEdgaxkiP+aceUMvz
         g+7kBemftT52TfprDr6UIy4nkSsldr9n6kiQEwMXKItl9JawaAN4msOkNCR/ChDyFY+C
         syy9pUwLAHp63ZgQ01lU5ME5lb2SDXkbk/3VoM+duJpGXsT9OTlluzb7aRrdEHkuSvz2
         oEatRZ1qwQir48kGHKBqSNYxZnxv2DgqP7S/4wVTGT0gdqAd7lEJpTlju/mtjMmBkeme
         0HDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P7oHHMkIM1swADUlplUIw0AliwJNApZ8BZBXp6ze1xc=;
        fh=jnZfl/EJ3sWovGK3P9GmeBy7zCYjILGFXHPlaGJf8w8=;
        b=KI3b8g9I5VE0r8gS9kV4lMXNd7ggR6ljb7ibuDUazP3CJPTJ2i1OPayk9HOpQoB0/e
         Eo5ib20SsPINB9rLNo1C2QJWPACjgz7SpR+4WFrwvTzFyCv4d7Nv4dwpHyfhfpWssB9a
         AG2X6Q0+TAhneuE+d0VKHuH1QxL1NLx2JHt5BeU+XKKat/1uk9ovyC18k5kvf4a26VN7
         LxDNEpk+Qi0M7bfuSabbLh9RfELTlvqSEUPO1ZruPPWvW23hyw00xA6rBmyR7VMpMVn0
         EocqZuD+EWsCKg9zC81TZb17NdnP2w1IWRQ9BvoRxv4DuyC3OsZjbEs6D5fUWReCJSzv
         DaSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793633397; x=1794238197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P7oHHMkIM1swADUlplUIw0AliwJNApZ8BZBXp6ze1xc=;
        b=DPoB7zEb46bWtdTF7JIKZ0Wo33TffI9DxLqdPRgUQhsGB4mHSFJlFzSIOMGV5PtPFa
         2kXsamgrfS5DXbQR5pqHDJsLlXJ3Qr0cYdm6AOXSB+i8lturJutBvpA/qfOWYwX1/s/W
         7rX+QeVytIAVoxAi08HK+WyKT9oBk5KHBiRNi9q97xMdhbQN8jm02w3iFU7/L11XOU6B
         tqpTBU2wla+w5DSOO/Wuv+0C2Gpgf74xoqrSMsak6dEoS3Pl1ASyPgTeN2471WA0TfH4
         CL7cppNNBD/wtOO549kHZxnvDI+RG1qCoY2QfSpL3kK6QFRmG+vI+M1mtR/VwEi7FD5C
         82MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633397; x=1794238197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P7oHHMkIM1swADUlplUIw0AliwJNApZ8BZBXp6ze1xc=;
        b=xmpYjmBlrpbeG9LYDRiRv5fCBU42gau1ZMleea17DpZsMK/lgllbOWf9YAcMoCgMqh
         fU0iymtPktJESn3Vs3kl8oW/EipyIU+aSGLZlll2JXOo0+ge3ZtUojsQ6SEcFA0aEnjS
         qIxgN8SFEvx6eI99MV4OFh9Y7EkbkR5Qs4b0sGiJ9y0Q2Z1lVDm2lfPstQ6pluovgIvM
         FVj4Lx/HTf3HTMcAPkWB/BG20FqBMrwZAT55SXOR85acctJphj1G/0MGqY/nhbWWuZhz
         sqsDbj9OjpefROkr0ni0pJsFONXMDJ81L0cLpiZmtjzdtEBWLD74l1PIsY9OzrQFQx1p
         xXWg==
X-Forwarded-Encrypted: i=1; AKwUvByd3iMsw/yAMw8KFooXZIkbyp7I5/DUF6D3rQu6zoguLvhQ5+dIDNBXp1bViY8L8iUv08s//ikR7PGED50=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jvGOUODxQK+1nqtt949eUVydxF+bif27eA+UIcO5X+oPLzq/F
	IMyIFRc9BB9rgDdEFt10UwSb/Ax3sP+4nrQTOwhFEfQ+uGF7XPz4c9zzjpRiAI3Z24UHECQTubB
	BQdDithFsVsehKvVLWgdlw81bndkHoD8=
X-Gm-Gg: AYBFou3ghU8gmp9SUvGHyYXXaT/kQg/htLYTDnHTNnLL1hWVwa4+70WSfrOZe+NIx2M
	0/6NJAQm79Ug7UUCT3qkpI5bbF8TQEvxUNNL5H02NBzt5iJrXFC2r8leC/T+Hids7Pl49Es59lO
	jcG2E12rrNm4XWqz7UMZrDN4SCRJ38vgH63vsqcGG123pkaxk4CA+ur79DOiU5QrC6OvQdP3WNk
	DgZywJr4j1bCot39WfjqsSZaX6g2nq0a+Ard+0Z4DZ9OEX9d7lKWWXFDLnRZ9stCVE1x9l59zcW
	mKQWctHdfc13tlhJAQ5MnWn4RvgOj6HxuKt6W7obN78JejPsjwsb+zDWu31DQKKxopjZISXFwsH
	M3sAYZQek57FPkybgPhE9KOA9FOocxYRhCu7idurJvvGhEC4n8z59Ib8nCS53OjggyGGvhlGpPa
	MBeVnRttAO
X-Received: by 2002:a05:6102:5cc8:b0:7c3:874d:60bb with SMTP id
 ada2fe7eead31-7d072bc027emr2842138137.5.1793633396723; Mon, 02 Nov 2026
 07:29:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030161234.1505367-1-gourry@gourry.net> <CAN+CAwN+OPMPpVdBA+XtQvFpDy+EOY2TAiusxMjYR+r0F+MPhw@mail.gmail.com>
 <20261030164303.02c5cce0521c3d6fd4ddf015@linux-foundation.org>
In-Reply-To: <20261030164303.02c5cce0521c3d6fd4ddf015@linux-foundation.org>
From: Joshua Hahn <joshua.hahnjy@gmail.com>
Date: Mon, 2 Nov 2026 10:29:45 -0500
X-Gm-Features: AclHuK-onw5mfffqhDCdUvG-akV0FfaPCDY7vf1GKDjU7CU-jXjuRXPuiw8F_m8
Message-ID: <CAN+CAwOSz7BuPyd+u8KOitbDNFiDa0iNv+oFnQwbbt6kUw21PA@mail.gmail.com>
Subject: Re: [PATCH v2] mm/mempolicy: recompute automatic interleave weights
 on memory hotplug
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, david@kernel.org, ziy@nvidia.com, rakie.kim@sk.com, 
	ying.huang@linux.alibaba.com, harry@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 7:43=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri, 30 Oct 2026 12:35:38 -0400 Joshua Hahn <joshua.hahnjy@gmail.com> =
wrote:
>
> > On Fri, Oct 30, 2026 at 12:12=E2=80=AFPM Gregory Price (Meta) <gourry@g=
ourry.net> wrote:
> > >
> > > In auto mode, weighted interleave derives each node's weight from its
> > > bandwidth, reduced over the nodes in N_MEMORY. HMAT and CXL report a
> > > node's bandwidth once, when the node first gains memory, and nothing
> > > else on the hotplug path recomputes the weights.
> > >
> > > This can result in a major skew in distribution and overload tiers
> > > with more data than their respective bandwidth can support, resulting
> > > in a performance regression.
> >
> > ...
> >
> > I think you may have dropped my review tag from the previous
> > version!!! I believe the only thing that changes is the warn, so
> > please feel free to add:
> > Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>
>
> Actually, quite a lot changed, so dropping the v1 tags seems
> appropriate.

Hi Andrew,
Ah, thank you for the catch. Looking through the code again, I think
it still looks good to me so my review tag should stil stay. I'll be
more careful about stuff like this in the future!

> v1->v2:
>
>  mm/mempolicy.c |   36 ++++++++++++++++++++++++++++--------
>  1 file changed, 28 insertions(+), 8 deletions(-)
>
> --- a/mm/mempolicy.c~mm-mempolicy-recompute-automatic-interleave-weights-=
on-memory-hotplug-v2
> +++ a/mm/mempolicy.c
> @@ -261,7 +261,11 @@ static int wi_state_refresh(void)
>         mutex_lock(&wi_state_lock);
>         old_wi_state =3D rcu_dereference_protected(wi_state,
>                                         lockdep_is_held(&wi_state_lock));
> -       /* NULL wi_state assumes auto=3Dtrue */
> +       /*
> +        * Hotplug events can arrive before any node reported its bandwid=
th,
> +        * leaving nothing to compute weights from. NULL wi_state assumes
> +        * auto=3Dtrue.
> +        */
>         if (!node_bw_table || (old_wi_state && !old_wi_state->mode_auto))=
 {
>                 mutex_unlock(&wi_state_lock);
>                 kfree(new_wi_state);
> @@ -302,6 +306,28 @@ int mempolicy_set_node_perf(unsigned int
>         return wi_state_refresh();
>  }
>
> +/*
> + * HMAT and CXL report a node's bandwidth only when it first gains memor=
y, so
> + * recompute the weights whenever N_MEMORY changes.
> + */
> +static int wi_state_node_notifier(struct notifier_block *nb,
> +                                 unsigned long action, void *data)
> +{
> +       struct node_notify *nn =3D data;
> +       int err;
> +
> +       if (action !=3D NODE_ADDED_FIRST_MEMORY &&
> +           action !=3D NODE_REMOVED_LAST_MEMORY)
> +               return NOTIFY_OK;
> +
> +       /* The hotplug is done, failing the notification would not undo i=
t */
> +       err =3D wi_state_refresh();
> +       if (err)
> +               pr_warn_once("failed to recompute weighted interleave wei=
ghts for node%d: %d\n",
> +                            nn->nid, err);
> +       return NOTIFY_OK;
> +}
> +
>  /**
>   * numa_nearest_node - Find nearest node by state
>   * @node: Node id to start the search
> @@ -3424,6 +3450,7 @@ void __init numa_policy_init(void)
>         if (do_set_mempolicy(MPOL_INTERLEAVE, 0, &interleave_nodes))
>                 pr_err("%s: interleaving failed\n", __func__);
>
> +       hotplug_node_notifier(wi_state_node_notifier, DEFAULT_CALLBACK_PR=
I);
>         check_numabalancing_enable();
>  }
>
> @@ -3910,15 +3937,8 @@ static int wi_node_notifier(struct notif
>         case NODE_REMOVED_LAST_MEMORY:
>                 sysfs_wi_node_delete(nid);
>                 break;
> -       default:
> -               return NOTIFY_OK;
>         }
>
> -       /*
> -        * HMAT and CXL report a node's bandwidth only when it first gain=
s
> -        * memory, so recompute the weights whenever N_MEMORY changes.
> -        */
> -       wi_state_refresh();
>         return NOTIFY_OK;
>  }
>
> _
>
