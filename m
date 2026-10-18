Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FBC3B42FE
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321043; cv=pass; b=iQwUZ0GxZB0celkmt0Gou/rGgvPIrz8rVEECak8KivHV/Q96xCUlqUVE5j6Bk2sIjEw4etbAetD9j3T/St7eao6UPTXv/HzGJcGPEzQz0BR4jHOUoLYDx9UG0xcAit8XTfk7TBB5yWNatqAnhIT2W6gL5H2XZlM8jrIKni8KPZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321043; c=relaxed/simple;
	bh=NoYKk+zfA2Vg0NFqER3/7jFPnk0Q80RgMfB5SuCFhbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lNfG0pd8gBPZW5c/ppC8ep45c/HC3EBm45vLzdpM8e4LxB52VRU6w//vQM+8CKJxJ4hl7t07Valfu7veZtPEVzX7BCtkGAKMpiteMX8nN/XXpW7XBJ9GSwhq/NPNzvcP/Z0G0th4iYEqmk6PfIivLusLdbnsFh0uz/wJjMp24ms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqBEQ6by; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqBEQ6by"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-675676afc3cso1206253d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:57:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792321040; cv=none;
        d=google.com; s=arc-20260327;
        b=nuBiheMIHXpxt2GOAG+cGVFQt9dmBfFkSGjzC/sSbuFtldDiNDfbhYhfHfPBxlOkP6
         qyxGf+AVKnsK80yPxd2CCXFyGY9Ohqmrr7hRAlS6PbFacv5BYB7w9LJJGMr78PHEkvgz
         W+3gsD7OpwHVUCtJ3vH1CEahO40du5K2un+YECTgnO5lfTC5U61M6r4QsJiRO1lwtn0P
         TLzOH1W5ZbQmUH7WNZ3r8wdCecwvRumYf9zJCwQw8r+5CjYfD5zjt7H0qkltKbb8+yeA
         Hy7PzQwarFtdu+IsS2vXH/V9RBqLIkFPYenrNJgGWmy83zJ29Apnd99Wgem51SSb/Vw0
         +6Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q42INxzKbcLL2mib11Z2FAWyf7Td8LLy4kQfAr2Vl58=;
        fh=MaAHZyHk024q3wpVJdbbwED1xWf+7ExoiDQITdDVwJY=;
        b=pq6VxRK3ZIIZJrFXyZm+s4X79fN6iHrMEJEn0QXeLzuuNaelnLw7FioHnlMwOOaLz+
         pIP7w/M1W8DlNQuTv/2WFUvheKfHVJ4E4DSEo9v2ZRTS8JsprlhvhOoi6AV5RkdNGoX1
         Byz/HlNfZhmPWedTd0eXe4uEyx/reWCFw+mKQJO+q0K30OemE13HsdfFi+TsmMX0SRKU
         AIDcKBCbdopErXWjgKZwzyiIlb8pOovO4mrx6cy7mRSKBJGo6NPlp6CBoqooB57tQJu8
         7UpQ1giKUohv706RFGiLbuYhBy9hmleKVX2QXVIdE4dws15RM7oREVdtFkx1ZoBfNVMa
         K0mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792321040; x=1792925840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q42INxzKbcLL2mib11Z2FAWyf7Td8LLy4kQfAr2Vl58=;
        b=ZqBEQ6by7ey3282eNR7dSX7yA2wjlaII9XMSKfs4HSSf/Nb56G4vSjEMy4nWZmOmz3
         pwwb7HKMC38Nj6Aoph8Oc7IYj2ayIl32vQl2zUbsTLklF7y+V4kYpY2xOuYkjb9HBj7S
         gU5M0Z6HZstSHTdLOvmTCLB2+Zeqqx9qTHTIsneYsmp30yD7Jf7w6umgpRjgBkntw1iT
         YBgsVqnA/pxKNZ6ugP8Vow7dXzEZBTSZDrJEtf4YhrQiEk0ZvkoPSGUYJJ6/UhvVLC+q
         9hWqGF3uJbThI0eXgh9t8Y7c4MhTGf20oakWOSASuQefPlG4dO96fdwsY+t0Gxw83hQf
         cOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792321040; x=1792925840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q42INxzKbcLL2mib11Z2FAWyf7Td8LLy4kQfAr2Vl58=;
        b=liNg2Yb+EWK7829U8cEZSLPeF5F0dM6FZ3RVgcWudH6d7Yb92HJhlvOLCCoQwi3icW
         bs3IZsbLJwAFXGc6bpa1aOmP8sJA2PcK5yruKOZ5VjxZyMLYar0RS8xyFJjZ1WD+HPFF
         l7OnN0eI6+/odndfZiFL0xNWB05UwuktK2jz1KYuoOy04nLuGZqzlOvXk4G78L7fkRXx
         hA5UY6l/tiTJTOx0vkdVrL2G7mrPvawj/vgK9ZPIvX+esRJuQL930sNb7xmFj9cxRlvQ
         Z6hf923IP6Xv/ofS4OyplMJsm5UG9tzxDOWq6dzLQmmN2+rrmw1dZxsuHcydbxi/XwdB
         K6uQ==
X-Forwarded-Encrypted: i=1; AKwUvBwU0QedC9Y7LYk70HMKk8gpYQ8ZGKcj+qtLMfPyLRmmlHuMqUOqfK1+MPYkdx561XoUMOLntN+5Uk3oKuQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJrkXQhzN0/0K8eJPW0ALi29RKuD+JAYTFF97Inm7j+iJe0G+c
	qymQ4nddpR7Df0hO4T3dc4xpLnCxy4Zt8Y6hjGZiwbdmTJ2b3R1slj7UUsPjLzAsIdIq00B19/V
	nxWkGwQaw5bU8VnaF6SEk6obWesA8Riw=
X-Gm-Gg: AYBFou0/CghKHp7TGfZy4X5EQvqwBNF4DA0lFYEudJ56f0LwdLzH5O9PXF0y7JKFkhB
	yAK2eFiCJj7xymGp1JzfHv/9IYMCG/Awb0rtitl+th9pDOW4dxh15W1prxYKMQhi464cAnujpgI
	tPMgjzDffG8tjGnnYObpCQRS9ezf7dW54x1PFmUcXg5w0z9ydnsOLBrnI99KtXkORtsPDISTo3G
	Q1znMBFSDhgWszSnArEnFwudZ0Zlc3L2MEk8XU7kcJJBub8sPTt9qeX5NNFWwrPc4nOI0fnPK/O
	CJEsjQJ80qvCe3Y10nOKpcLpWB5nNwN+qm0asszui1GOhhXDKBY/YfL6yvESXqPcGP/P9cN4tD1
	zIKiWDRuZSyHd4Us5UOebVLOHSGos/+Bm8OaaU3wtCRdd
X-Received: by 2002:a05:690e:138f:b0:679:cc49:55dc with SMTP id
 956f58d0204a3-679cc496392mr1276885d50.92.1792321040069; Sun, 18 Oct 2026
 03:57:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825135717.36369-1-kartikey406@gmail.com>
In-Reply-To: <20260825135717.36369-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 18 Oct 2026 16:27:08 +0530
X-Gm-Features: AclHuK8VgSJacpo0L0UN9QxBNGzCJb6Inw5_tPuhgVzMlP_LjGu1MvoOIZ-h0FQ
Message-ID: <CADhLXY7-NaijsaX-+5M555xf+inRXXF_DfDr9kh45B4tWTdtsg@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: mac80211: mesh: free pending CSA settings on
 interface stop
To: johannes@sipsolutions.net, nico.escande@gmail.com
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+f5752cd6b94fe38be666@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 7:27=E2=80=AFPM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> ifmsh->csa is allocated in ieee80211_mesh_csa_beacon() and normally
> freed in ieee80211_mesh_finish_csa() once the channel switch
> completes. If the mesh interface is stopped while a channel switch
> is still in progress, ifmsh->csa is never freed, leaking the
> mesh_csa_settings object.
>
> Free it in ieee80211_stop_mesh(), the same way ifmsh->beacon is
> already handled there.
>
> Reported-by: syzbot+f5752cd6b94fe38be666@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Df5752cd6b94fe38be666
> Link: https://lore.kernel.org/all/20260824054611.29728-1-kartikey406@gmai=
l.com/T/ [v1]
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
> v2: drop unnecessary NULL check around csa, kfree_rcu() already
>     handles a NULL pointer (Nicolas Escande)
> ---
>  net/mac80211/mesh.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/net/mac80211/mesh.c b/net/mac80211/mesh.c
> index d4507e4e6ec1..48015dcb7add 100644
> --- a/net/mac80211/mesh.c
> +++ b/net/mac80211/mesh.c
> @@ -1201,6 +1201,7 @@ void ieee80211_stop_mesh(struct ieee80211_sub_if_da=
ta *sdata)
>         struct ieee80211_local *local =3D sdata->local;
>         struct ieee80211_if_mesh *ifmsh =3D &sdata->u.mesh;
>         struct beacon_data *bcn;
> +       struct mesh_csa_settings *csa;
>
>         netif_carrier_off(sdata->dev);
>
> @@ -1222,6 +1223,11 @@ void ieee80211_stop_mesh(struct ieee80211_sub_if_d=
ata *sdata)
>         RCU_INIT_POINTER(ifmsh->beacon, NULL);
>         kfree_rcu(bcn, rcu_head);
>
> +       /* free any pending, unfinished channel switch */
> +       csa =3D sdata_dereference(ifmsh->csa, sdata);
> +       RCU_INIT_POINTER(ifmsh->csa, NULL);
> +       kfree_rcu(csa, rcu_head);
> +
>         /* free all potentially still buffered group-addressed frames */
>         local->total_ps_buffered -=3D skb_queue_len(&ifmsh->ps.bc_buf);
>         skb_queue_purge(&ifmsh->ps.bc_buf);
> --
> 2.34.1
>

Gentle Reminder. Please let me know the status of this patch.

Thanks

Deepanshu
