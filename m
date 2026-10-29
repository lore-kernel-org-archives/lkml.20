Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793309465;
	b=JP/wUBkgV1gBOqiMk3/dwSakw8wi9nt4v1wu6ifpbKW1Po07oud1Uruohsy4jUL7jt1A
	 nqKCgII91jpme5djnKu8ylk/bLlO9m+EQCdAYzBZtmkeeteRFpCiA6u6+BimgHT2Roosp
	 sGuOqGqZSRs83Fhk9K4daBQhgug6xPoJVhD4GU80ONhT95huouOzdYlgyqVoRejzJ1ADX
	 NpbliCdSCoQlZNHpI5BIDLcsmUZbv3aHyH2tHk4FBkpXNByFLxI10wPOrY8qWnlfqdMfb
	 10jv0NjpqobKmqGwgBPvqbiScaeulpSq1rAD2OcEDbNDXQVbxWs1Uk/27mV5HiER+Tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kreUdF0uNoXIPwkvrEWSR7P/OzeK9mmS/iNz6Eo8YyY=;
	b=g+RZwQpFa2YoU+Frs6sLaUJqPG8Cf4rdAZj5yx8C6CvT10GArKHiWG1Uy4gLLTojg10n
	 GKtJptHEx2cYNvygkOutEhgs/lJQKnr/KEUWxKczUZO3MTDqmxLW0P/fBwqYhtbQTAe8M
	 5ye5jgKBnntpPEIN1mkuTuKpVuN06jd6OZabk3jkLv0PrqjLWmltWy61SdOkXmjMgzG4S
	 tcI9QdXZB1WpdjJ6DQUqC0pqnU3t1WMP1uZT4LI2CeoARmh0lEjSuO+QrXTL63RM0ZX1R
	 LPok6xRoUu12RwYG75XN+nvI8rxuDt680NteJ77O+5SzIWnJgJr70XRdUldZPkSjApw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d0IwzWfv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447DE606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 447DE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d0IwzWfv
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so1495a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793309464; cv=none;
        d=google.com; s=arc-20260327;
        b=Eqc4ILq0JGbmP2NsRvaKYTiJL96mvmdMUmPq3se7A99NsTb5Hapf3i+WzkV8vqVDRr
         NEAQIoVK8oYdbUw5tzIwsP0WNEgiQlk6EJCJbKgyoxb2UEwp+SlkV5qyuaO8lqFrgjt6
         Oy5a33ZBlWOT3VoGrrRzh+YEZoY+Em8TKDuE6+Ei/qpw+tXVdsAxZe3y7/g5IEleNcmA
         oLqhEeDYEyZWjQICTEo3NE6SqzzL8DOUeqD3To7AE2Ciai5hA2XL8roE+O/WWysF6qbj
         z7mCEPB4TT97k3EIQXVkLNxM/0k/25k9VA1NLS1Hp5VAcXeCInivh8jRVHD8HAEsjhLO
         To+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kreUdF0uNoXIPwkvrEWSR7P/OzeK9mmS/iNz6Eo8YyY=;
        fh=Am81sxxeJAClvaBP8FlxKFqntxGrzuAYPVu12JsMboE=;
        b=pRK4BF5aOjn6f4YeYAyJxwP+MMrbwalXYjPz/iUrYAJ/kDbOJMY1u+ZSoALQ5hWcfw
         yA1VJLEzhNvmXC7fJ30ggP4GA5v5BeY9IlZo1myWS9jfoZzAg31LUQ2gGO+xr+uPwOrg
         gqzNLjkJKOh9DnO2QQBiLKNsnsDz06TAfOZv3IeTwIIKTTbEDLl/a6ZDOkfpVX498lEc
         VKTfAZZnHLsvpl7vcATcXoMJZaKgFMruCqz0DLt3kczvcOEgA5lJ9UQ2RpLUsgTA0Wwo
         LxucgM1wLIKHbW6vyvPQnCsEXhfoDd99ljmCe14cwEJhQX5l5rQpJQT3rfE5h3IZxcjw
         m/5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793309464; x=1793914264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kreUdF0uNoXIPwkvrEWSR7P/OzeK9mmS/iNz6Eo8YyY=;
        b=d0IwzWfvXP4d3zE2Zq+7oXnlNdI8Mv0zAp505O9nyaJgZXdanqRMuWEgS+guwgbMcK
         qjGNhXfRKgan5hb7y4zOFTHMbH6Tcw3jeHDOG18EY4UXb7VtigK19BYMH97KsqxkYmDL
         l+GLMbO2+BxjqzfRAywwHjEruqTIDPw7dgM4MUwiBjoIheOs8REvzs0/Y6Q6PrAFlEql
         mPWcnZ3c/XUAO1dBalQNFecjxiVLLF20SFKMC5/zsiqUBSZ/MpfhfGS8dyRM7P6QeqVU
         3ZwGSnmVJC4rb6zK5WQwPFg9MDKOMBjjRYWiRwylNoW9y9e2g6YpPOTipBjLSvUVdMlF
         6WyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309464; x=1793914264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kreUdF0uNoXIPwkvrEWSR7P/OzeK9mmS/iNz6Eo8YyY=;
        b=Q0cbQ6PPxcmhC4y7qNyJT2RSNk3hMR/cZyqe/h/3kpEUVhuXc45oDqGn8aa/rXOmNn
         JfmCWjbJ0brIZNakaExDXTPUMM9pvWxDoyi6n6bpDjZUZc5NOgvbPTzXeh+wxmVEIKTW
         D6CG1K/eOGHvZCsMXi5JBaOKhRN6nFrZCYphmpeI+xO2iX0VPXE2QJuKCcIbAdRV3eSo
         oUKKs4rA5IMOAnjUcFNICuH+HgS0wU9W+WF3qMT/4CaYVAcEKNzbaqUvprAE4wpEOSdu
         23OG9e7/NvdwQS8kBDpaW3BRp/Mo247vt950ilIrj4Z9cHKlLZZsyc+S8t+m4ZflAfEn
         Xbbw==
X-Forwarded-Encrypted: i=1; AKwUvByo7p9fjdqq9CchuLwKdHKYQ+BTJ9stNH4O78cPnzFsWlMd0lAsMwG8Q+td7DVtFZGRANjPZVHOj0trzCY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQEN99g7sl4b5ihX3E+i8+kZgcVbc5ceh8mHtT/ilX5HLEGLeG
	VEifBaAhrhEcThnrHOvnvOXcnERWz7Gc7HJ/jHLV4GUijmYZcmEsLY0AN/yPQ1oh9t7Cq16yHC2
	FRkW+9GXaJQMTzw1roLCRvE77kkB4zNA90uAH5RNl
X-Gm-Gg: AYBFou1gtXcZOm266dLiSty78H4qfAZjCtxZfZ7X+lrBO4S63EI2CietMyDEgSdlnuP
	JVTwR9ahMv7/5MKdw1BmZyl2gPAp1XAUkM02LB6W2VLvMnyzu0IzWNI8H/eo1oIvxB1lWnKgTxq
	QntxggMiPfDuvroK2JA7YeoRagHtDOzrL1h+/r7z5cZmmxHP1lwANXCsmEVBe5TsSuRvhjrf1DP
	Bp4om1neH7adgTCmYgRAvAI/uvsVYg7WGHDSNDzWcHkosO+FDjzEpVdGN6/sQ3uRRBzvo8rLa5X
	ihCmjqJGemvb1pk0mnp+KK7EVW6uHkBPF4K3QMn4b74UComKHW3AwSZxI1E833dR8m1zVfjU41U
	aQV27DaPQeK5caH6FRamgg2aonbQ69aWHguquq9U/e3/CjBYSYUBEgdAfm8HD9IngUoY=
X-Received: by 2002:aa7:dd17:0:b0:6b1:d80d:396b with SMTP id
 4fb4d7f45d1cf-6b4b40b8186mr104372a12.14.1793309463143; Thu, 29 Oct 2026
 14:31:03 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029145844.231018-1-omermetekaya0@gmail.com>
In-Reply-To: <20261029145844.231018-1-omermetekaya0@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 29 Oct 2026 14:30:51 -0700
X-Gm-Features: AclHuK9vwMToW08OTMztQpW3bR5sve3bLoPc_H7WIharriRZuH5COTSWDbQX4kE
Message-ID: <CAHS8izORg8OR8TyWBHmZsgFBtM3+qh7gXCJxifk1QGs13Q=ygw@mail.gmail.com>
Subject: Re: [PATCH net] netdevsim: reject port addition and clean up ports
 after a failed reload
To: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abini <pabeni@redhat.com>, Jiri Pirko <jiri@resnulli.us>, 
	syzbot+88435e204734072bf39a@syzkaller.appspotmail.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 8:02=E2=80=AFAM =C3=96mer Mete Kaya <omermetekaya0@=
gmail.com> wrote:
>
> nsim_drv_port_add() does not check devlink_is_reload_failed(), so ports
> can be added via new_port after a failed reload.  nsim_dev_reload_destroy=
()
> returns early in that state, leaving them behind.  nsim_drv_remove() then
> hits WARN_ON in bpf_offload_dev_destroy() and a subsequent use-after-free=
.
>
> Block port creation with -EIO when reload has failed, and delete any
> leftover ports on the early-return path as a safety net.
>
> Fixes: 75ba029f3c07 ("netdevsim: implement proper devlink reload")
> Reported-by: syzbot+88435e204734072bf39a@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D88435e204734072bf39a
> Cc: stable@vger.kernel.org
> Signed-off-by: =C3=96mer Mete Kaya <omermetekaya0@gmail.com>
> ---
> Tested with syzbot C reproducer.
>  drivers/net/netdevsim/dev.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/netdevsim/dev.c b/drivers/net/netdevsim/dev.c
> index feb88ccbbced..61f0824ce4d3 100644
> --- a/drivers/net/netdevsim/dev.c
> +++ b/drivers/net/netdevsim/dev.c
> @@ -1697,8 +1697,10 @@ static void nsim_dev_reload_destroy(struct nsim_de=
v *nsim_dev)
>  {
>         struct devlink *devlink =3D priv_to_devlink(nsim_dev);
>
> -       if (devlink_is_reload_failed(devlink))
> +       if (devlink_is_reload_failed(devlink)) {
> +               nsim_dev_port_del_all(nsim_dev);
>                 return;
> +       }
>         debugfs_remove(nsim_dev->take_snapshot);
>
>         if (nsim_dev_get_vfs(nsim_dev)) {
> @@ -1758,7 +1760,9 @@ int nsim_drv_port_add(struct nsim_bus_dev *nsim_bus=
_dev, enum nsim_dev_port_type
>         int err;
>
>         devl_lock(priv_to_devlink(nsim_dev));
> -       if (__nsim_dev_port_lookup(nsim_dev, type, port_index))
> +       if (devlink_is_reload_failed(priv_to_devlink(nsim_dev)))
> +               err =3D -EIO;
> +       else if (__nsim_dev_port_lookup(nsim_dev, type, port_index))
>                 err =3D -EEXIST;
>         else
>                 err =3D __nsim_dev_port_add(nsim_dev, type, port_index, p=
erm_addr);
> --
> 2.56.0
>
>

net and CC stable for a netdev sim bug is extremely overkill. move to
net-next with the AI-review comments fixed, if any. Thanks!

--=20
Thanks,
Mina
