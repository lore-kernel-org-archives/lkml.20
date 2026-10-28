Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156856;
	b=us9zjZ64Hjg27rOkWKC9rCp1WW2fZQ7TvKjU9oUWiPPfCkfvAsmdzxVCemuLUMEeACpH
	 eE3sii6fqXinYZ18HVlIhBJyTZPxNDFWb4qMTV09jRdE8Mc0E+jfTLdeDIO5QDjdwnujT
	 HKon/VIt2JOvOWDbRlQyVVQyfoR3Ao5yB2f6jnNw/ZzldK6xHb3jb6tGvOTiz9Zf+Hmut
	 gfZWqJkiKD8P9mGpyy4eALKTyAUFWNmOo2AX1s1K86Zntekg3p2I0XfQAk1R6CgrCmv1B
	 eWqbsiFnLlKfFLOQyIwbuJ0iZyhSXYah54/hzoji21NBsMQ6NMsGRjt76e5kQ4ZwuTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J0Be1q2Mf9sv1KZdHv7WT6uB4RENkXIH8A5t3SCQfjk=;
	b=z2E9yE/NEAx2KK0MLIr1MbpXF38NS3ASlQ9R70umitzDbbSDNH57FErggs0lP4F0K7BT
	 wyiDHGq8L5GaM1bsjL0QZE0kE3atwatX9UzVcVLRBostnBHCE9jEOAXeUDIAUQjH3b6SD
	 f4SLAFLhuLrhEzL5EzabS4beXbSers2rrgogGzdDufGU9crT/TDaoOPfEZeKU8Ij8CmIh
	 D80IpvkL17Mj0w7oSiGnZaH/GIlLvwCTg9bhe+F90oxIjGXJGD2aw6Wx42PbxAiX9fJuR
	 5XF37xQ0MqUq8evY66S6Na7DTQt+4equH7WswQhrKEbCyApWN8dWxFU5S2I5B5pklsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ourcRmkO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172CC606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 172CC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ourcRmkO
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso795984a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:07:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793156853; cv=none;
        d=google.com; s=arc-20260327;
        b=OhDBoaJDk5DFkQou6LaC99ADjeyiWx9Yo1QnEclbptvzaTKg6Z6ehwLPYi3cp3/dSS
         HNFHynC3Nl6YfG4tfPnc9bBxoTZ6NJuxIZjkJiOe2xkEgY0n1rOIcmGmeFnLbPhFcoOr
         w85UyZnV3aLs+rn7j73ApgGssOIjB4ZhNuhbxal80ghUcpAwMiaKaY4M1W8+/h2wTfFb
         1suVrqgUuphvuT3lSEwjN2J8JqIKL25izmMQJ0CIy8D4wEl4dnnZsLIP8yrhojlbXNCG
         JZyZXlTI6ZsuVJP3+3XaIZ3q1lOzZWBex0nzVBJ6GDlqQJQWbL5e95kXA06zvLVT6hAW
         mdwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J0Be1q2Mf9sv1KZdHv7WT6uB4RENkXIH8A5t3SCQfjk=;
        fh=xL+vKb1/coxwI9ZvV83D/uB8u9zdjMIsmTlBcENdBL4=;
        b=UjgyGQeocuTA5yO1QKUuN/Ot5RmAgdlrSLfYa83cKZT/zkQKOywHb1h32NAbwGZf7e
         mDBehH7g/vArT5K9YiufX69sWLBGPjTWTAY9YybKDnwPJQercIb+drnk6Hhg+BY/fXDe
         1SsIMYoCELdGj/6Q6o8nWhjnaijprlASl/KOH1qcc7PN5+3ZnJeTScJ+STNJDp0wITbF
         ia97ZND+HkOCeKa4V5UzLx7bUIgZAgkzNCVXv1EncL9Wlnwg3nK5jHVsesiMEa72xiWG
         CGrzZ2VVJAzkVnxUHExZg6lUk2i+iIJ4nElloI7Lfsi+QrM8oGVm64Mwu6ej8IqxuctW
         LjlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156853; x=1793761653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J0Be1q2Mf9sv1KZdHv7WT6uB4RENkXIH8A5t3SCQfjk=;
        b=ourcRmkOH/IjfAvfCJMqpw8JEzyGEQLLpIyM3oq32ZzxtqSCibGO/9Qw/Zk8dFF5D8
         fq//S7uF6tXiGg9nQZRB6HtoBxFSa2TVcrKRBzBk5be9hIxjLnhroFo6uiFDTIL9+COy
         GKuGIj4CWW+G7mOqoAXg8EaLp0hk8d9+L0PXgj/Vy028JFOIXvBPPhhEJjYBBEt+u805
         2+GOsDyCAQDkByjNAJiQzEGqowmLSCJGi0AtsMpvSTEiIVkZ5a9wCJ1grbRnLH9hZBH2
         l6VXiMFEwb8nUI2eKb8LXhhz+qy0r0h3R++UuQIYJn1PKvc76dEdobFz1zSbnASn4i9m
         2cvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156853; x=1793761653;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0Be1q2Mf9sv1KZdHv7WT6uB4RENkXIH8A5t3SCQfjk=;
        b=UBhSUwrwvo0cQoutf2whDHfdUk6NFRXOLtxd998BDWTX6B0Mn1MXJ5WGo8CD4Q2Y5K
         7FwZXJti1nbXdLtdtKJ+dn/JSZ7+1yp1FIAxTlEqs7+2J9cgRZSUan8eZtCM00VkDx0d
         hf959AYWnjyB6KEvGanyMfbpOaS1y6im1yxl6aVvEa+ZAatLowK7v37DspS/xH8iniHY
         HsFzosZGRanKr2/qXh8cO7AktQxfwLZq2hbVcgFiD49YvKkQp2Gn6vBD8zFbKk7C+g4d
         fiqLEYmk/B+e6feqXeGzITr6bdXbv+/TNoMjZL8yLOVPAmz0njJVDA1eikDXlaihFojm
         lapw==
X-Forwarded-Encrypted: i=1; AKwUvBzgHriBvsiGDsCbCZSPI/cqAXO6+gsP3vge9zVbgosc4mjPY8ZmTJD8ei4aAE3QTi3vK3rqXnQ7GCY5oYw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKolyaJExo5ji7rkfjwL+b7ZuwvrR3Io7M7j/WX+G4fUD8EWsyS
	ODMnIlzmKrkLz2Cn871KXFhKXv1vwwUa/dVtMSQYMet5Atwazd3lqAtsl85JnZXhOVzsc+BLuUL
	FfKUCf6JjOVpD+WlsDqpzEjukli12X2A=
X-Gm-Gg: AYBFou3v/ZFJZU4cJQJorm35RWINi4ujtk5/sVt7HWUTcYl4ZACXSsiQbOwnbDHYxHd
	qhMAVTHJPKokBynS/mz5c5zEY/znBKk2pNEoxD35qtubhWzEpERrvkTekQVMOKnibTrDIB+isik
	SSh4Gd04rF5zINultTp1HyBE6dV4FuXvFsMeoWWjbsQIX656F0V29tpt0GO40XShUdaSPj0o8ra
	1IiU1G5LlJD2oKmMAF6Kcwq6KbLH3rLpF3C45+sxJQuOJsEX/z0NglZ1a/7OOf9aqC91TtuNnJw
	txWa+L2XBThUhzKdDaGbME7xF/l9oLVT0CecpIF2OVztnXa1GYlYu1t7rl5sMVjYfDSP04hdTBr
	iC+yp0RcXTRMm7MREbr80R3BqsO+O0FijlES17OjUdvv2CcbCN42Jntv/eCSPFk1SCJo=
X-Received: by 2002:a05:6402:42c8:b0:6ab:6e:a8e4 with SMTP id
 4fb4d7f45d1cf-6b49cc24773mr498856a12.44.1793156852883; Tue, 27 Oct 2026
 20:07:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027192027.8617-1-dennylin0707@gmail.com>
In-Reply-To: <20261027192027.8617-1-dennylin0707@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 28 Oct 2026 05:07:21 +0200
X-Gm-Features: AclHuK8Zk3JqjSuknFqDZQNv-pnsmVv-lUejnYaLZe-5J4JnZLEJi3oDDiYwgrk
Message-ID: <CAOQ4uxj3et_cyzD1iWHr3_z1dH1R3WQMCOm+kO2Q90TXjaV9pQ@mail.gmail.com>
Subject: Re: [PATCH v2] inotify: do not coalesce rename events
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: jack@suse.cz, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 9:20=E2=80=AFPM Hungyu Lin <dennylin0707@gmail.com>=
 wrote:
>
> inotify compares the mask, watch descriptor and name when coalescing
> adjacent unread events, but ignores their rename cookies. Distinct
> IN_MOVED_FROM events can therefore be coalesced, losing the cookie needed
> to match a later IN_MOVED_TO event.
>
> For example, watch two directories with IN_MOVE. Move an entry from the
> first directory into an unwatched directory, recreate it under the same
> name, then move it from the first directory into the second watched
> directory before reading the events. The second IN_MOVED_FROM is merged
> with the first, while the IN_MOVED_TO retains the second rename's cookie.
> Userspace can no longer pair the second rename's events.
>
> The original inotify implementation compared cookies before coalescing.
> The fsnotify conversion lost this comparison. Do not coalesce
> IN_MOVED_FROM or IN_MOVED_TO events, which carry the identity of their
> respective renames. Leave coalescing of other event types unchanged.
>
> Fixes: 63c882a05416 ("inotify: reimplement inotify using fsnotify")
> Cc: stable@vger.kernel.org
> Suggested-by: Amir Goldstein <amir73il@gmail.com>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/notify/inotify/inotify_fsnotify.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/notify/inotify/inotify_fsnotify.c b/fs/notify/inotify/ino=
tify_fsnotify.c
> index 7c326ec2e8a8..6e3af6452dcc 100644
> --- a/fs/notify/inotify/inotify_fsnotify.c
> +++ b/fs/notify/inotify/inotify_fsnotify.c
> @@ -36,7 +36,7 @@ static bool event_compare(struct fsnotify_event *old_fs=
n,
>
>         old =3D INOTIFY_E(old_fsn);
>         new =3D INOTIFY_E(new_fsn);
> -       if (old->mask & FS_IN_IGNORED)
> +       if (old->mask & (FS_IN_IGNORED | FS_MOVE))
>                 return false;
>         if ((old->mask =3D=3D new->mask) &&
>             (old->wd =3D=3D new->wd) &&
> --
> 2.43.0
>
