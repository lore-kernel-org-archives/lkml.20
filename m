Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2BF3A4F50
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134149; cv=pass; b=MNY0XMTDo5W1eEzCgyHgb1IV2NP6innpxz9JvUE4javk8EiMLPo5HDso+GNwuTKF9QUzq++gppMv412xyE0ikzof8xVaQTDxv+FRrhi+0oWQv0bvmeUcmQYRnAN5jymv5B8NduGQkEQ6VJihQz7XR2TpJfDNNa6LWN5mlCaLth0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134149; c=relaxed/simple;
	bh=NoYKk+zfA2Vg0NFqER3/7jFPnk0Q80RgMfB5SuCFhbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SZDVKQoITHlTaGgnFxYbs6vz9DJbFxuN4YhS6akEnNoT5lTIJaIg8wepnMF5ENJJ+gHCZhKk+kBTC5XXj4UOijb58XN0QSGC3HjqmvlfekVEt+CV/gO3N+Eev2UoCzT6KLV/+GY9XDgkQvH8o+QcDjnnlnefoMvhSZ2xsc1CG/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3t09dmq; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3t09dmq"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab1ba47so264134d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790134146; cv=none;
        d=google.com; s=arc-20260327;
        b=o0y37VASicfc7evXs0R/sOQRJdzkSOhqbfczjU38A6kb1WMxxtekLDhZeA04NFWzcQ
         ZPfQKOzRq3sackF9LXCKWYNGom1jnSGMJnQzhklrL5VUDbSycbUCMPK9ioTRR2Dl9M3d
         Mx6WwHYzB8iT3M94kabL/Y83MVhVSp9VZjV5XIui5C0GehMiD7uRIwf7dGRqsCQPwdQ1
         Ob59Mz2Fac5dKVSAyIxxyuKSW6I7iOqjMHoORo5z+y5sqEa8CuHW8ZQMrl53DJYy49Nf
         uPAESZKGHI6qnoL7MpDbekgl1w0up5RcX5qcsTk6Ee0IYO4MwqqkZhejyZqIMofXrsRU
         4tLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q42INxzKbcLL2mib11Z2FAWyf7Td8LLy4kQfAr2Vl58=;
        fh=XSQqtH+Z9D1TacTj0Jx7rt84GE6Wz40r2h0aRGVc7dE=;
        b=g6vfzG+9M3suxd8oJ/TlWRZ5AH/+Azfiv+Of0U2lg+SXWOUBK+Icb1asu15H1PHUG0
         LhqNh7L5LKkBU7+Q2e+scY+BUByXH2NmPjis14xEnfQw/zn7hzWObTz+gSj/oe4O2QWy
         dG2f2vT9k6D08WlabnirqhbuCxod8IaNexJ33eO7pCgQMLc0FBGGkdGPAoz8dkvnogzF
         553+D2JaZWf/zk5IrXSUTjRxDkL4BWrZdSawJIDMx1Hmld+HD+iiLKAClUVHV08jdCXi
         XWrl7rf0WJTDX6bzZAKAaR1nFq7lJjp8Kmdm2koIcR5ofqJcBlrXTyCvMD7d9bkyKcsu
         PjSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790134146; x=1790738946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q42INxzKbcLL2mib11Z2FAWyf7Td8LLy4kQfAr2Vl58=;
        b=o3t09dmqDmJPwVRGd4s9tT509Uqp9vC6YpG7TdA5CI/SE5XBNntYxVPre8AijM1Pnk
         kURHPAEDzKpy6IotHxe1f/9d4/xVxl9gPKXjNqvPjU0FrTaA3ijcR5cmvyFzxmWNgMZo
         3/DpGCjbapsAAmzenWt2c2obBfwDgwyPXeBvZM0dThqlK2pdlFASvGNbbkf66/2SaKFy
         hSn7r7zFFcD2Yst0X+gyjM6uNAS2SwZzo2rbrZDS5/gzB4J1BRXidJX1uzqiAZZqC4lF
         9txaPTPgYeafLVpJPQiaG/OhgKCxABeubO0OUJYA+g88SyH8wGSadTLujQOzFZ58kfY9
         rcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134146; x=1790738946;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q42INxzKbcLL2mib11Z2FAWyf7Td8LLy4kQfAr2Vl58=;
        b=E68zhGji1UH1e0SCAtgYQcE/af9fe9mwEsPdRnE7Rl10B4ENgrAYKMCMqs6XnpOIV6
         aLj5hEf1mvjPG2KGDoEFStVjWjvmHxNduA0iHhN4GWmmr5cBH+6DhLVmB+FvOTPQI+tF
         Zac4ubXZxFfFK6KFBNS1yv9H+koB/R6iBp5/vU/VGqUMVsj9mGfwNphpkQqZiIH7Z3vO
         Soqx7itAUJAfEG7/u6w/CpLhfwXvHEtIiYDPgxeIce6fJlrXfJyDbzTXiOVSP2Hg4nou
         z0MeV20dxTxJf4q5YMN+gJz4NgBxUVI5pwdySPJppiKjPgcZmNNhw9QKxDtNrHlwsIti
         gCaA==
X-Forwarded-Encrypted: i=1; AKwUvBzAEtpKxOyOHsZVVAOhyRvUbDHR/w+b4V7okyTDmxPPOtiUlVQBnylMBfmcGTmfeogVwszYhnJb/BQ3L2c=@vger.kernel.org
X-Gm-Message-State: AFuF++kTzA1Flg4Wi7PvJsUKlZs/cjptnp0TTvj6EX0MPiZZG9zndeGX
	oWYZNab+6/X57OxDUm2vwbsB5wk8F0QdmNjdaI1K+ZsiXS5Oo+iCuEzeSalXnc035dmfW6YsI8D
	Hu7yzo5hhirTxzZLJ1MmVehBLF6MA3hrx/MdF
X-Gm-Gg: AYBFou0jH+EvJNxVaN8G02Os9rs+jeKlkUIyLZCq82POI3mlW3/D0mEHCOH4AreazmM
	LyA+X7cbjH+Zt3rpv3lDK12TOpTkuMsDUxbHpcrZwZ52z+FY/5FDUf7oEg7/Ia1w5AlHgnerRyd
	tTfKhOCSA+stoopwo8GPl1GN0qDmOQwdwPhwIzJ2BTL59OmbboST0AzhRpQ4z1zp8v15Ue7X1uw
	urOEWpQY2PAHZas6+iQoLNXPAHg+CI4tJrvXu/tel/7pzwCKY1dQ3WSCkQqKQ/G3+Rmm7XIgREN
	4X/Btlq8cy7Ixzmgt+cQ6+6Q26uzfLJU1AcrjvPsRZKGId6e/V4RJ0rwxWv/0jqVOGOY3Ehc02d
	Ax4YooVd29Lv7EqBW3/pbvuYeSNS0S9uI18b3dplvbV8=
X-Received: by 2002:a53:ac8c:0:b0:671:28c0:64fb with SMTP id
 956f58d0204a3-672d585d6eemr704698d50.12.1790134145777; Tue, 22 Sep 2026
 20:29:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825135717.36369-1-kartikey406@gmail.com>
In-Reply-To: <20260825135717.36369-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 23 Sep 2026 08:58:54 +0530
X-Gm-Features: AcwNN1X00fNegi2u2fWuLyHFqoda3BOM4DikBWd_t-lsQVZ762UdpZjDF9c8iLE
Message-ID: <CADhLXY5f=VTmp_rv6UHM3C44aeGokSRsMUjFUK+a7d4A2A_r1A@mail.gmail.com>
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
