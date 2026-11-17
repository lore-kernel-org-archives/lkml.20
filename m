Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794883014;
	b=OSSbhRodDvBqYyZFHHD+y0zx393ax75m6fElLlJSLi/8nPU1fcD949kkCKt/whtTyrv9
	 yNhzVEGl4hGIKYVyxPBPj8U+dlLiQTEX0es1UiAQ+ry2rU3Gq0AdoMEL3FylpOqgIRdw0
	 3n5kzQuhSNaqZOadH17L/+vSdXxnWcjljbizkpgecwLhyLqVY/211aP+mZ8nk0yygU9qq
	 SpraJbagwJ+nE2T5k84abB6T5uyOksTkb2iRAxwwcZwglFIguztH3nFa2W8ppmIHESFXM
	 LssIdFeEJvfQmKibXlWy5oMsRBBPdTQy074gTt7JSqI1hnXA9piC09LgHwnUyqSDfHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883014;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Nc0Kx1j/LAZLLQGwSBqbBP8FB/6wPqlG0izEEFd5vzQ=;
	b=msKiPj2dGrk9fXoP9e0h6XaBiUJ0Tdap8cbk/Oly+DeLtly5oNxIznbmkObwMFrhEzXM
	 O0edV4j1hmzUChaojVADuIOfzSBUH73AzP9oYuf1y8QvhWKMyiY79pFCvVY6N7myc2JIu
	 W0rIDElk3mu/LO3TdhJnPqJqj3NmJeaFrzL3UnimxnvdCRNUClVYlMblFtkIP1eYd/znG
	 cxT2LOrWRm5WbYCPEgYB5u8NT+y0uiRvftSn/Ipho4sw/l55g+w3bDRu+nlMfxYwyLisr
	 CfWnRDEJTgSdcvdhq6c8/ZPbaN5A3DMesCtGQWAk3rx/b4qap4auan9As+6GduoTznA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rua9RebK;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ljzSf5Ms;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088B4606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 088B4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rua9RebK;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ljzSf5Ms
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794883013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nc0Kx1j/LAZLLQGwSBqbBP8FB/6wPqlG0izEEFd5vzQ=;
	b=Rua9RebK8CtpD1x6eef9GPQtHxxISo5+T3Ml6MBcjMVtlUJhqywzMCeTK01tQFU/22cKrk
	qOoCg3kc93YtzCJ7qc7nS8xmdHFKqP3AF2TvrREcZ5nz5i4EBOmPOrmvHLtx0rFQ8uAQTe
	RjNOJb/DxfGG9+GpFLjxMszzrPxJ2rc=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-VZzy84aUN--BeXl19lOv2w-1; Mon, 16 Nov 2026 21:36:52 -0500
X-MC-Unique: VZzy84aUN--BeXl19lOv2w-1
X-Mimecast-MFC-AGG-ID: VZzy84aUN--BeXl19lOv2w_1794883011
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6755fef4f96so6609985d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:36:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794883011; cv=none;
        d=google.com; s=arc-20260327;
        b=TchbMJOKyYcpFWRj82a3iZNKdXtPTussedwBCdA68rsl+rVT8OqC+su9WjXeC6QXFj
         FNT7xRaBb8i8W6OnhE/vXZU+TtTCu5kt/+UH9v8+GtRHIa0S1D1QXRcyPtEr1XaB5dtt
         PjlEDryKSgFQhYS1PWz43cmtzUvDLeDf2IZ5ChvZNsJQmykS0qLj2nVBQjAVCQ3jy87n
         4tdao0npQLyBO8c0f4CMc+9xbqJPx4NMRSrBDpqyw3uFCVRfegEtl+nuE6aI2p/ZYNHE
         47pu0SoE6QzhMMjQQuMBcGh53tKWQz2S0uDhAJ971avgOI/VMcEVo1L8p723bY1mV8wt
         9mwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nc0Kx1j/LAZLLQGwSBqbBP8FB/6wPqlG0izEEFd5vzQ=;
        fh=ElmiIicq9yUfBGd0qXMcvdGUEJMaL5UIqlr6fSX0y8I=;
        b=ludjroenfYP+HE4eeogNG0ZJLE0s3ObmpIzqRjuzqloPOl6K3GgCMedPYud+whd4So
         MOubWN0ZkWk+eRGjb9HFrbfHG5ia8rF3D8gV7/7HkvSPc8jgAhdwtk0ZWhSmWmuGthvO
         zJyuZmOyphu/p1uqcrnPtzWA2KN1E+aElujFUU0L6aOckC6RD5yc5vWAGf4YTVSp6nPt
         OlD12n+qoecldNzlMUDbznZhSeTLi1KTqwflUU8r0A80p1MtlReH8AujO1pfstx2Vf+o
         Kjj+K1g7Cx5CW4RWXXyPhMU0BuQ56eJoPrDHlipGEZCCtZD5lHrWxsYV5tgr7tVdbJnV
         sxhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794883011; x=1795487811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nc0Kx1j/LAZLLQGwSBqbBP8FB/6wPqlG0izEEFd5vzQ=;
        b=ljzSf5MsrfJHSCbtn64qvX3AyFJhYDYCWoHUOGaXhbS1K50YTAu4r6P6q1Z2KXEqzu
         AQByMFtCw2qN4+4y2JVorbyAL7NFBSqfVfeTB6PmjagJfIKZsuToKnaXUlxA6hCVwhoA
         OHhy3nulmmQbNHBYsEv1kZYIyrKN4GlFwMMOqOMsnGduGWrGc7ousssl9SqT8DqrRe8W
         EYyCwrZ3aPyUrPJ57FELuC/yVe60+IxUrGCXTphhc8Vx2ynp7msSmFIfCjzKG8RxBh37
         WPcbsTdT+v6b8S/HjkEkImSyCKmjSxs9ibv9W/q7TAx75nzXv8l6om2V3d6IbEJp+DPJ
         o3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883011; x=1795487811;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nc0Kx1j/LAZLLQGwSBqbBP8FB/6wPqlG0izEEFd5vzQ=;
        b=2O7qGq2E7Wj4SbnQpjpNAsaLYjqWs873WkPs3sklg/Pq7hk++aq3E/0vavcVvfdbqX
         y62CoER/5nV+JU0aszOlnsHgZBRu+KEQ8X2w3NiXGuRcAsMtc5kN92n6cqSN9lR9+T9j
         +nsYEB8rEJEZ50KmBgOkBJkOSBYNs3tUENeSowj9TmVV5GfaKIo7jFQxrabnYO+DJrjz
         H8hiYc6H3NK8dyccffwivFCYHOZ2Ucqjov6XfYEfUMaxf3k3ITUOC/JRdZx0gZYwjU8N
         sbg4mppvqZlZ5Od0YaawgFj+yRoQB52Dt/0i5RtnTwiSKD+5NB1CIsCGFGrYkhiHc+yY
         73jA==
X-Forwarded-Encrypted: i=1; AL+hErFrKsjytHNGct46GtO76KKHPztxgx+mMAFtxipV5p4Giqx0vykXuiryAFdV9KXVrqk0aW1+9gAS1+BPxyo=@vger.kernel.org
X-Gm-Message-State: APuU4Z96D/P7EBiyz5Ss9KXe+upKVu/rKhjqdNiw2o7h9PrZD6xOySFC
	jETxDLo2H3KpD5h4sI+6OWLqPlPRbGInUVw5gz6xQxZm8ENBooRLFoO33rJIftqh6vak8TOpR58
	h/5vAHcxNLCtAknucU3hH0rbYXxlBeggRCnZXzPP+6fo/Wf+R89uLovleEsYVQlFoP99lOF+avS
	NzkfZJXuBCWgbdVniexCyppOgEEcC+hS5w9s2ehp0ROIfpAI5c
X-Gm-Gg: AZFdTZcN5PAOTQtQ0mxj+YnlmbJQLq4y4i+L1OeU+w2Ho368NbV5psuk+TBHw7bWGw8
	IMr6hMZWlDLL8F5tqI7RS7k9aF4gLoqZvIwx/fbuvdFFHboDlCO5dUfWDeVO0SMksRKFhIWYDGv
	rJ4toiWfQz6LALugNVb6wH+efOHDBKbPb2f7tWdhOmHGLsTDhooM5KD5fsBmxRRgw/lMmHbK7Uc
	o6AbRuwZU88O/zgIyZMWpXukgJA0SaWMLXhhgvjBE2p1w==
X-Received: by 2002:a05:690e:1286:b0:67d:ba39:f922 with SMTP id 956f58d0204a3-67dba39fc87mr2249543d50.105.1794883011249;
        Mon, 16 Nov 2026 18:36:51 -0800 (PST)
X-Received: by 2002:a05:690e:1286:b0:67d:ba39:f922 with SMTP id
 956f58d0204a3-67dba39fc87mr2249529d50.105.1794883010751; Mon, 16 Nov 2026
 18:36:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116180002.44336-1-founder@logarcheon.com>
 <20261116220843.378480-1-agruenba@redhat.com> <20261116232409.46988-1-founder@logarcheon.com>
In-Reply-To: <20261116232409.46988-1-founder@logarcheon.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 17 Nov 2026 03:36:39 +0100
X-Gm-Features: AclHuK8jipT2sqTxWhLP9_-fF2K8gGmgIWV6DE8puWPi_tixSxFnVaitHavNBps
Message-ID: <CAHc6FU5=ELOJiaP6VWg7q5S+=jULvgrB4mF7diNSUpOg1aiZZg@mail.gmail.com>
Subject: Re: [PATCH v2] gfs2: Fix NULL pointer dereference in gfs2_seek_data/gfs2_seek_hole
To: William Chuang <founder@logarcheon.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+5a5f492ccae698fd7434@syzkaller.appspotmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 12:24=E2=80=AFAM William Chuang <founder@logarcheon=
.com> wrote:
> gfs2_seek_data() and gfs2_seek_hole() call gfs2_glock_nq_init(), and
> independent of the outcome, they call gfs2_glock_dq_uninit().  When the
> gfs2_glock_nq() call in gfs2_glock_nq_init() fails, gfs2_glock_nq_init()
> returns with an error code and gh.gh_gl is set NULL.  This causes a NULL
> pointer dereference in gfs2_glock_dq().
>
> Fix that by only calling gfs2_glock_dq_uninit() when
> gfs2_glock_nq_init() succeeds.
>
> Fixes: 3a27411cb4bc ("gfs2: Implement SEEK_HOLE / SEEK_DATA via iomap")
> Reported-by: syzbot+5a5f492ccae698fd7434@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D5a5f492ccae698fd7434
> Suggested-by: Andreas Gruenbacher <agruenba@redhat.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: William Chuang <founder@logarcheon.com>
> ---
> v2: Adopt Andreas Gruenbacher's version of the fix -- skip
>     gfs2_glock_dq_uninit() via `goto out` when gfs2_glock_nq_init() fails=
,
>     rather than guarding the dequeue with gfs2_holder_initialized(); rewo=
rd
>     the commit message to match. v1 posted at
>     https://lore.kernel.org/r/20261116180002.44336-1-founder@logarcheon.c=
om
>
>  fs/gfs2/inode.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
> index 2c2dc459c037..d4678e4832b3 100644
> --- a/fs/gfs2/inode.c
> +++ b/fs/gfs2/inode.c
> @@ -2253,9 +2253,11 @@ loff_t gfs2_seek_data(struct file *file, loff_t of=
fset)
>
>         inode_lock_shared(inode);
>         ret =3D gfs2_glock_nq_init(gl, LM_ST_SHARED, 0, &gh);
> -       if (!ret)
> -               ret =3D iomap_seek_data(inode, offset, &gfs2_iomap_ops);
> +       if (ret)
> +               goto out;
> +       ret =3D iomap_seek_data(inode, offset, &gfs2_iomap_ops);
>         gfs2_glock_dq_uninit(&gh);
> +out:
>         inode_unlock_shared(inode);
>
>         if (ret < 0)
> @@ -2272,9 +2274,11 @@ loff_t gfs2_seek_hole(struct file *file, loff_t of=
fset)
>
>         inode_lock_shared(inode);
>         ret =3D gfs2_glock_nq_init(gl, LM_ST_SHARED, 0, &gh);
> -       if (!ret)
> -               ret =3D iomap_seek_hole(inode, offset, &gfs2_iomap_ops);
> +       if (ret)
> +               goto out;
> +       ret =3D iomap_seek_hole(inode, offset, &gfs2_iomap_ops);
>         gfs2_glock_dq_uninit(&gh);
> +out:
>         inode_unlock_shared(inode);
>
>         if (ret < 0)
> --
> 2.43.0
>

Applied.

Thanks,
Andreas

