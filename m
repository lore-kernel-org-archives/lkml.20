Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792531140;
	b=X3SCj83MLAubBHmz1oseVC6Zqts7PeLIBYmtNDbtn1QF+69ToGI0PU2YwKcCUDnjar4P
	 oW9lsmuBnszhVcp9+dYubWwdZWpvy9aSDP2xKjxO4/8t3Mj8GypdtV8b3IPMq9JwjhkGT
	 hfnoEmTU6brHqTJEaUIu9yxEWisOSKIg4sJlaTnTsaVaHki2z1aKw/p2PoKpFHTeNixVW
	 hpjbWXnJAqVYvIBgbn+QdAvcpavGAB8ZLYd9NdAOnMM8qkJ3rB4V+uL0TmwI/oyswVYod
	 RtaeuaVxn+0cB+N88CyVjVkg+8MPSkvfN+8QdaAIs2bQljDae0DzhTNl0lpoIrO501g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792531140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=n1CNQoz7YOW2mncHIqZvcCqL2yIFjYG47u7uxaBBZuA=;
	b=M+014lqjJ6Et/qUTqBI8pPoisyLJGqtfzL6bTGGQJfy02nbF9UtJjh1nEKhXsTD8LcEQ
	 WJK2CsXdKXSJA8tzi2b03aE2DRJnjAFAXEIGmgAlake8TuKYNp8qih0jVg5upVsn7dLib
	 ab3HCINIXrmy9OefsuH9mnFM0/bqzgdpHqLBQm584ZjiWPUdBvayb5j6Gz+hvuf22dTDG
	 JLz6l5fhHRV28D5bVCo8pW0V/TpUGIoOlnPyya+vprBY3PnaS24pXoPu8AFFaiOpexirD
	 XS+LLnMGEK3C0WnDitMpp7XP882hd7iVGSaQGRXcPHYCAmkOrPYXbfWxFZHErHxBB/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AvERfuAw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A771606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A771606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AvERfuAw
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso202348a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:19:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792531139; cv=none;
        d=google.com; s=arc-20260327;
        b=EIdKpg5NwT7A4W3xr46gUE+v30CMCJh9nOd/17PjDHAYBxZepHaFn/cdodqxDitAf3
         p4ax9DXjORw6PtSQDFDtlp9ooH9ZXqyzHmEoUEXh7C+7dxeqSyrpHc0tFchaRMsxLn/q
         EkgYl5zAnuGuHaWgK1EKCdEfLdna9Xs7Qn09SRTsiK8dBo937IWecXQmft+pS6Wy0Scl
         vjxC53JSa7s6++yMPEaMUtrNH2Eb9NAFRXEZKW/1WGetZ/l3h9LhGAnZgIWqmUyNNb89
         LqQ1FIYKsKnErsf/mQw3W4FEFlYuMJkb312YtYFAQyAuhJczUby3bYf5t9+eVsYdRF9O
         o8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n1CNQoz7YOW2mncHIqZvcCqL2yIFjYG47u7uxaBBZuA=;
        fh=+Pbez6TAQMO6Ob4jvNqwOGUg07Gxg8hwoDTCEcfHVuA=;
        b=TT7R4Vg1BQjTbwPWdlc+xBIIEVAPV6SaRAcShXehMywOaFGCp2Zzb80gVsYeJyKe/k
         S750lvqLMqDSWswDrj/kdgk2Lj+HEN9k92Xz7FgB/t6sH9d7+UVLULHx6FLxPS00CgiZ
         tMnWvlOfHq40McfLVBEDcEdFhyCdyXnLZK19TiA/t93wcGhyUzaej7fJ0y/7d48FI0Xj
         KBxQyGy1BA7Meib8mMSXQgHCfnv1i5tfV+/Jat1uyDlQG2IE3aslhsdIsEwbywvwWcwM
         ekUV1RaXpRu8t8m8mQDs6DwJJ6lfbJEVuy5do1TY60V0t8cRhsGKltM/qyJwwGh46mpj
         Fpbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792531139; x=1793135939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n1CNQoz7YOW2mncHIqZvcCqL2yIFjYG47u7uxaBBZuA=;
        b=AvERfuAw9wHzWmxg+xGWxY4TyQR2VKWOr5/Xc9m8UIjKKwqsc/j2hOcGVWS9wqKEgo
         8Hadyb7//1qmvSA7wgcsJHx+dBf5ttaTCd0Azmqxres5b7YkmP2ayymjkfy39Ok/dohS
         w2vchAjHQvBgXpOXviI+NZYPHsnGANEQJbF3uAd9Y+BSWPPvOY5nd2XmnwSn5ITDIgRT
         hYvShtV3CbD222kelHwiqMJL+Bw3K+DlZz1ByRELfAyvKPUylYrxtU/eL4IP+Vjdut+4
         VqdWEzcVRIvCQlSV5rrXOYhdpZGVPk93vpR7UMXZmolNyHM8Ds/8mmSLHWndjY7Ez1LK
         AFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792531139; x=1793135939;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n1CNQoz7YOW2mncHIqZvcCqL2yIFjYG47u7uxaBBZuA=;
        b=NerJe2BCTfvPPoc+zZUjSHDFD+URVaIL8fMYT+IswiJ6JhSReqHwYjvvO7kcMBs1Qb
         m21njv4UnFlsj4YjW0TCTce5/dxm8C3fSmXM/JkPhcLWN1+hkLljZAXRtrP4DAk7WFee
         GXgpcHPwV/66gTIk9V904I1j5o2R2bg5W8DMtcnA+V0k3dnoKoUFHOkvmQCQn7HvNR88
         pWr1wmP2pjNnz0TxyQHNaCnkXjsYXCyWdWzJBt64VWg6Yvz+JouDodzmIQIS6GI958dj
         JKIOGDjnkVJj5n56UAv/0cN5zsKZZDwzPWdFLf75ydrfrajeGq39kP/86h+n6pVrFdP1
         WFOQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3P7UsnwHYTDupvUEdPdl1jHLS/hXjkObnRFz1Q4QEYM3O84tEyGW+qZ+rXf8lNCpQf4Mg1Ynwdw/bfl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtb+RpKaB/R/GyLJIPtZoDP+ntZOvBb66LA9fjlAzKy7eR4jR3
	AlmOYBUeN+VPTzaOSKEZiRe0et3lxixn7nSlal3FlxNyEV2EnuUb1PrItEYifjbNGmggSuv+ynV
	pODIOEkdevGspLJ+k8K1r6mftEuVvUVU=
X-Gm-Gg: AYBFou1brEIBcmrGypXQ+V5G/YqlPBuPi/sk8RLmDUo7EKWsy0m/nGF9EaAydHMkJTh
	srKJwh3TJI4kgqxo/AvHwAiJmx+uCcj1s7FGA5+IZuVpM338lfHONg7jtoohPxf91oT2tA66oqq
	CkaTxZ3/YgmLa9+BhaseGW5hKZbVg2s5kFZ1K0yW/FREx7WplEjzI4maFQBIply6IeZv76eMY2V
	2jaRFRSTnwU6kby6nTpM0O0fPAp2gplSw+CNe7yf0O037DiQU4+W2ilMidhgPL0Q9rFQVZlt8oy
	ncsTxrSVjfuwLSkIsV1B4MGETUW8HtBgLx94jd+I815FvV0AZjD4Yd1uOmmaaL0=
X-Received: by 2002:a05:6402:46c3:b0:6b1:e8e1:a3b4 with SMTP id
 4fb4d7f45d1cf-6b3e675cc2bmr2035025a12.4.1792531138278; Tue, 20 Oct 2026
 14:18:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-ovl-comment-v1-1-499b532b69de@studiomoob.com>
In-Reply-To: <20261019-ovl-comment-v1-1-499b532b69de@studiomoob.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 20 Oct 2026 23:18:46 +0200
X-Gm-Features: AclHuK8u7NMzJVQ3fB7Pw1SYNHUXpGAV3svh7RaiGIlUB3SPpFZaX-u4bs_Q02o
Message-ID: <CAOQ4uxj=YLpi-X8eg1fZkCdjgTTY1JBm4a3=rJWo9Fhtp-fqZw@mail.gmail.com>
Subject: Re: [PATCH] ovl: say that only the capability to use reserved space
 is dropped
To: claudio@studiomoob.com
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 2:32=E2=80=AFAM Cl=C3=A1udio Fernando Pinto via B4 =
Relay
<devnull+claudio.studiomoob.com@kernel.org> wrote:
>
> From: Cl=C3=A1udio Fernando Pinto <claudio@studiomoob.com>
>
> The comment above cap_lower(CAP_SYS_RESOURCE) in
> ovl_fill_super_creds(), added by commit 51f8f3c4e225 ("ovl: drop
> CAP_SYS_RESOURCE from saved mounter's credentials"), says overlayfs
> never uses reserved space. Lowering the capability does not stop ext4
> from granting its reserved blocks by fsuid: with the default reserve
> owner and a root mounter, a write through overlayfs still spends them.
> Say what the code does, without going further.
>
> Link: https://lore.kernel.org/linux-unionfs/CAOQ4uxh0g1MtgCO7Q2f4yJP5vq5r=
LEiiXHbVfeCxwXB5ff4-VQ@mail.gmail.com/
> Assisted-by: LLM
> Signed-off-by: Cl=C3=A1udio Fernando Pinto <claudio@studiomoob.com>
> ---
> Follow-up to the reserve report after Amir's reply: comment only.
> ---
>  fs/overlayfs/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index bd0a3f9039..21d0cb8719 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -1508,7 +1508,7 @@ static int ovl_fill_super_creds(struct fs_context *=
fc, struct super_block *sb)
>         else if (!ofs->nofh)
>                 sb->s_export_op =3D &ovl_export_fid_operations;
>
> -       /* Never override disk quota limits or use reserved space */
> +       /* Never override disk quota limits or use reserved space by capa=
bility */
>         cap_lower(creator_cred->cap_effective, CAP_SYS_RESOURCE);
>

Look Cl=C3=A1udio, I know you have good intentions here, but I cannot help
it not being annoyed from a patch like that.

Comments are made for people who read the code and help them
to understand the code better.

Find one person on the planet that understands the code better because of
the two added words.

Come on! Don't send patches for the purpose of sending patches.
You want to do good, then find a way to make something better.

Sorry for the tone, too many real bugs to deal with.
Feel free to try again. I don't promise to like it better ;)

Thanks,
Amir.
