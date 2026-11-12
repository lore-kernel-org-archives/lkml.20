Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794448617;
	b=vM2ke14Q6e021PHI0F/8oqPJItXStSD6P7ByWmVVLndp+s4u/f6zNxT9dcQWTXpIFogB
	 22aSvpz0tEHCq/dqwpRE/f/1sNDHrm115wwF0vGj49elOBao4MZrAp6SYLRabxhnGmdeo
	 Mez9EfyY0yfR8rzvjyqMNnD8UJqKfsxJCF9NliEdGUpmGc0UH0TvTVIi5nmq/mmOtU9vi
	 mx3uTPg/6yeRzx5tsVbFk4LbolXxsmrAUbCPghK7ERTULoVq0LzKKtUTj4s2DWzEotKjb
	 PtHVXTtt/9GvZAG6jdj748wdmhBd1hnWXwOGIowkprlZxpKq8LL3WDA6PROm2LKYsXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448617;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vlcD19G9xALmfVWh6qixAsChTTMjTVjAvWOnGyaCmRU=;
	b=D+Taq+62ouF9EGGbauLlSNEJV+P79Mj0CDiEZCvuBoOQnRwMGFE9W4yBjt29sZMtrKca
	 2f8Ou9SDEhBD76EVHg571fwb7opWBPHO5UYA3tq8uds1nrTvio3XR8oGgq0oQTHwkSp92
	 ZXvGfo6nFYFcjMhuSIDoDX/F6CtXn3h31YG4beo1iG+Mo/GS5UJc6opZGNetlRZlnUjem
	 SW87eXCM69JUQzwFFBxKNY9z1ouNC1rOjpvQzIPde6XDq89SOJ2jIGy2/itl6YEs7MG2X
	 sdLWvqmOyRkICajUEpb/uBteKlrolYmb+Pr+y9dbCfe9F0eYQmtApfbopDNx613MzRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KVg8hANL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A58606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KVg8hANL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC321F00A0E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794448617;
	bh=vlcD19G9xALmfVWh6qixAsChTTMjTVjAvWOnGyaCmRU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KVg8hANLAXoO4hjUTXJD88oRydg5HS0AYNxQVPyuoKzVm0EzcXS4t3Cp1efu4QNd7
	 cCoMliDydlabNX8nRDYdEGCFwjwXqDgyyu0hdKT80vkFoduN/6sitOT8AyRkuIHV4K
	 uOxX5aY6+YRtM7uHFbuVgOBArvcFsqgDs73ZqlCntPtna1kMcrjnhOQ5NVRSOuGXfl
	 7A64kABhMJvbZ0kuwlsbQPOuWFhfhEXlqDA3rTFZTK2DgDJ+c1Dbt507GZLSwBGEFX
	 Js+zqSfokjA1+OWT8REZ91NlF8u6ZgoVDrXMPxQ43o3/iM1ua5rub1UZZNxqZzccZn
	 rqxfZU2t2B+qw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3acd523a802so31325281fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:56:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFFEK+nGFZp31EBT+wOMGeYwt4NglhXZqgN4rmBt0KbB5mFmktduhWcc1CnPOq6/inMXvxrI+wPHs/PYk0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eUEYXtZs4w0fvNf552b/0eY67ewlgpSwv/m3nPt0DucrFJti5
	Vx5EwxPks/KtkAUG9WmeeMK0xxzIa0aI74ZhpaDvgHMIbY4DBqX5EaPBVXOAl4t2TTYkLA8h4yt
	hQTMSacu0N6wA/gTeOMMrWJ1vwwGFXMg=
X-Received: by 2002:a05:6512:b9e:b0:5c1:44ea:cfa8 with SMTP id
 2adb3069b0e04-5c15d649f37mr1460481e87.47.1794448615836; Wed, 11 Nov 2026
 17:56:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <1794382813.6AF41BD9.002.4jPb5k0FlFz6R2s@fangwg01>
In-Reply-To: <1794382813.6AF41BD9.002.4jPb5k0FlFz6R2s@fangwg01>
From: Xiubo Li <xiubli@kernel.org>
Date: Thu, 12 Nov 2026 02:56:43 +0100
X-Gmail-Original-Message-ID: <CAOuZWzxwa2hB-Sr7zm7aAhhsM6OBqMF_A5C==Y=HvM47EAc9Nw@mail.gmail.com>
X-Gm-Features: AclHuK_9QaL_JNXEb95zt0gFcFLZIxE5kmkdC5h7lK5XobXrnpOjdQOgNcl3ID8
Message-ID: <CAOuZWzxwa2hB-Sr7zm7aAhhsM6OBqMF_A5C==Y=HvM47EAc9Nw@mail.gmail.com>
Subject: Re: [PATCH] ceph: fix slab-use-after-free of capsnap in ceph_put_wrbuffer_cap_refs()
To: zhangdaolong <dlzhangak@isoftstone.com>
Cc: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On ... zhangdaolong wrote:
> In ceph_put_wrbuffer_cap_refs(), when capsnap->dirty_pages drops to 0
> and !capsnap->writing, ceph_try_drop_cap_snap() may drop the last
> reference on capsnap and free it via ceph_put_cap_snap(). ...

Hi Daolong,

Thanks for your patch.

Reproduced on testing with KASAN and the doutc in
ceph_put_wrbuffer_cap_refs() enabled: dirty a file under a snapshotted
dir, rmdir the snapshot (snapc seq bump without new snaps, so the
cap_snap is queued with need_flush =3D=3D false), then sync. Every
writeback completion that drops the cap_snap gave two
slab-use-after-free reports (4-byte read of dirty_pages and 8-byte
read of ->context) on the ceph_cap_snap cache, freed by
ceph_try_drop_cap_snap(). With this patch the same 30 drops give no
KASAN report.

Reviewed-by: Xiubo Li <xiubo.li@clyso.com>
Tested-by: Xiubo Li <xiubo.li@clyso.com>

Thanks
- Xiubo

zhangdaolong <dlzhangak@isoftstone.com> =E4=BA=8E2026=E5=B9=B411=E6=9C=8811=
=E6=97=A5=E5=91=A8=E4=B8=89 08:40=E5=86=99=E9=81=93=EF=BC=9A
>
> In ceph_put_wrbuffer_cap_refs(), when capsnap->dirty_pages drops to 0
> and !capsnap->writing, ceph_try_drop_cap_snap() may drop the last
> reference on capsnap and free it via ceph_put_cap_snap(). However, the
> subsequent doutc() statement still dereferences capsnap->context->seq
> and capsnap->dirty_pages, triggering a KASAN slab-use-after-free when
> debug logging is enabled.
>
> Fix this by emitting the doutc() log message before calling
> ceph_try_drop_cap_snap().
>
> Fixes: 860560904962 ("ceph: avoid sending unnessesary FLUSHSNAP message")
> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
> Closes: https://tracker.ceph.com/issues/77923
> Signed-off-by: zhangdaolong <dlzhangak@isoftstone.com>
> ---
>  fs/ceph/caps.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/fs/ceph/caps.c b/fs/ceph/caps.c
> index 4b37d9ffdf7f..2f9f334276d1 100644
> --- a/fs/ceph/caps.c
> +++ b/fs/ceph/caps.c
> @@ -3393,23 +3393,24 @@ void ceph_put_wrbuffer_cap_refs(struct ceph_inode=
_info *ci, int nr,
>                 }
>
>                 capsnap->dirty_pages -=3D nr;
> -               if (capsnap->dirty_pages =3D=3D 0) {
> +               if (capsnap->dirty_pages =3D=3D 0)
>                         complete_capsnap =3D true;
> -                       if (!capsnap->writing) {
> -                               if (ceph_try_drop_cap_snap(ci, capsnap)) =
{
> -                                       put++;
> -                               } else {
> -                                       set_bit(CEPH_I_FLUSH_SNAPS_BIT, &=
ci->i_ceph_flags);
> -                                       flush_snaps =3D true;
> -                               }
> -                       }
> -               }
> +
>                 doutc(cl, "%p %llx.%llx cap_snap %p snap %lld %d/%d -> %d=
/%d %s%s\n",
>                       inode, ceph_vinop(inode), capsnap, capsnap->context=
->seq,
>                       ci->i_wrbuffer_ref+nr, capsnap->dirty_pages + nr,
>                       ci->i_wrbuffer_ref, capsnap->dirty_pages,
>                       last ? " (wrbuffer last)" : "",
>                       complete_capsnap ? " (complete capsnap)" : "");
> +
> +               if (complete_capsnap && !capsnap->writing) {
> +                       if (ceph_try_drop_cap_snap(ci, capsnap)) {
> +                               put++;
> +                       } else {
> +                               set_bit(CEPH_I_FLUSH_SNAPS_BIT, &ci->i_ce=
ph_flags);
> +                               flush_snaps =3D true;
> +                       }
> +               }
>         }
>
>  unlock:
> --
> 2.48.1
>
