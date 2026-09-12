Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2334BEE51
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789175243; cv=pass; b=XOLdf68/Wu1VD4/ZFz8qvokGDJ7OGFrktzPzC6eBN68IKmoE0FXYoqz1Ie+JtE6t+FOI5MoJj/PBYFssKrw0NNWMIRPHi0gLTk6bBzu0+c16rBKB3sLhwV0T28hPJNPjuOsWGRQAbmYjZN6Fp1HKFrZ2oIsPXx731a/qBOIe5jY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789175243; c=relaxed/simple;
	bh=NoYKk+zfA2Vg0NFqER3/7jFPnk0Q80RgMfB5SuCFhbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KDpNuJhkEdPUoGY0huTvd2QSHqiW5wGEHxTiWDvLwo2ouqhkfRgJq0MARcqKfXrjbkMqQgeaPCGPdHhzLCO6Zr75qAaWm5yjK/UibpKNrEqsi60v4v1+8qJfFxUjVAzV/TeBQYRS3jvTPHoJ+lxdtf1ZAKMSbYDx8qx1+Mxf8tM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6zkXI0S; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6zkXI0S"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab1ba47so169209d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:07:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789175241; cv=none;
        d=google.com; s=arc-20260327;
        b=WtJ+Efn+ZrbSXMJ37L4OvutFBf1GPpdGrBP2lSta8MDR6FTFV0pOVsaKhVfTmLJiib
         netIwoH07FPb7kuBOADXmzK2EKQyNncMByVADK/tsgB6qeaUqWTTzyW1J76BOjXGq3F1
         hyq142zrms2qb9LGxyEjEQm3s0T6icshTeFZoDue/jIm2ZpC0vb14WKet9mAM3XStaPD
         eVMWRF+qiI8MXRCSLqTqUrfaQt6w3qm21ItPaEOJl34vGe86NDkZ0YNRAn/tu/WAy9Hw
         W9xfHdLyTX7vPygJcLR3PCj71152aL75tplRCA/QQj+EDg/Fuz327LUP65RWfil71oI5
         uWDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q42INxzKbcLL2mib11Z2FAWyf7Td8LLy4kQfAr2Vl58=;
        fh=onlpcrwl1l7MHNIRZoInz+cfc5NTw6Ku8afq2rpyPDg=;
        b=D66VLXLKwwuPgcUobx0RN6tn2ePJt66zA77RyauuX799MlbiNxD1BrzAjJdsUJ7xU7
         5BHMLrJZKtgLhC1xsR5dg+WZLfTZMKp/UkFtEfnhm0D3o4yll8XLf8Q0w+p6XmuUk63n
         YO7v1bZSUw6dVK+vv60mx7f1H+b4hx3E77Tp5wvclLx12MpnB4gnQS3bklzCSJk0ILzq
         OvKgodhOyk66h7RY7OCnkL3xHGvSVc9SEHOHDZ4iMuRloNEvAr4MZnAxi2At+s3hEpni
         xtD41kQzTklXhNHgRQvvIrz2iawFh1D1VRvl7U5uN0E1dprOm8wUYivW8lgzSKG6Lhy8
         FvGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789175241; x=1789780041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q42INxzKbcLL2mib11Z2FAWyf7Td8LLy4kQfAr2Vl58=;
        b=a6zkXI0SNfN1QS6lAoPF00bv/crDnGeMNIbvI9jct7xFnxe4aOI6lUebSCMHi7iAlU
         k+MWVzmQDfzqL6RgzAXkuY6sewlkjUBeEU2V06yReL+bVKrxkkLs9C/2Rnw6HqSql4F/
         MdlWroLqvrVVjJpdIYB3AxOaLkGJ2QfN9EPJ0he5OhU3vkQ9Zr/jCeY7qsueDkYwmatU
         l3r+mQLEZ8mEkHLI95BHmit5Hrm7TooKb0oo/H0GVgwyRElH1j/ZUnbvtl50/d+V0bkT
         xyDZKXz8UdH2+A2+J7PvPfL7NeHZwpsanhIKNLDTnbDCJftWtvuIiYYifz+iITb0GB8q
         UWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789175241; x=1789780041;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q42INxzKbcLL2mib11Z2FAWyf7Td8LLy4kQfAr2Vl58=;
        b=ONes00gesJdmYDkzh43a9Yvz+59E4htYfdM7pHVU+7wHZKiokVH9xO69zZGtBC0aG/
         s9srNfkYiuoSRIXqJpgnPIhE+fITivf0sYVsYIDsJepjfFWDxJeL/D2gscQ48x8l4Dj3
         YpQbwKYVzLRhHb4g6awb0OCHakixYKETJQjC+hxxK1H3u2PA5NJQogljxtaHwh8v1kih
         2gTq7VYEnlBaGTMKF8FSAM3ZamNqUxepwGL9FQgUo5gL494mx1q7Y7Cg+ZO5RB9ENmQA
         TuHsBBXYrzQPOHF3kVSXh+m4CbF0TyYaG2Kt3K994QXi0HW8/2t3BnYeJKmIUZz+4oEU
         JRwA==
X-Forwarded-Encrypted: i=1; AKwUvBzcBe2/z1NG3aM7el30bM5kZ8mf5JuHs+wl5Zb5r8Sp1CGVX9FktGGlvzmO26x6YTlCgG1aGgVzugGn+uY=@vger.kernel.org
X-Gm-Message-State: AFuF++kPkMwjxOZst4U+IoxT7oaHpQmcSBqT38PAH7UCvYandiz8AVo7
	zZ0CoNgQ+osYCkU7s/meUPQbfXd2yXEQlnLpJiKILYlVmDmQiPLNJ2QNZBajTphIcpIzcxFcyTk
	I2KtSetEfjN+yFgq8IcWvB0jfjtwf8o8=
X-Gm-Gg: AYBFou0bwebxxBf6psNU8N0rAWKlZOoZfs7+rV9KWFZCgvIH4zqNV+J91dpBlRqdqsj
	v/M1sIs3PzwewjoXVdgsYmFCjHXWTZRT80KUWhEUFR0hxTzKx68+6ZfN4dhrZc9apJ3FX0xpzuM
	1MlasEJQLzPN1XIFjZH5Qf+W3OiBN2Ryw30sPEsSaoU51qiT+gh/TP0qxUkSE/aSHyGXR0rvApQ
	DoQBKN4OmcjpxH3OvK9OUiggYapYKb50vTrGgqwCbptA2vGjnWu8dnMJMKp6QuCdEknc6w+xBSi
	uYiy9Q9yph9gieLmBpCej1tmd2zL4liIPXahdyDTIGwxkBI93457u4xUtPJF7Il0lGrT/INoJTv
	iRoPn7IL+ayJ8uJkbSsz9gop/3qIEByewrtmAhe5hEMzb
X-Received: by 2002:a05:690e:1186:b0:671:251e:a5b with SMTP id
 956f58d0204a3-671251e0df0mr1500697d50.35.1789175240898; Fri, 11 Sep 2026
 18:07:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825135717.36369-1-kartikey406@gmail.com>
In-Reply-To: <20260825135717.36369-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sat, 12 Sep 2026 06:37:08 +0530
X-Gm-Features: AcwNN1UJeXmdb9KknDcsthyIhOBUktSAlTf54RExh80U6BxToohI0BSU73dFvtI
Message-ID: <CADhLXY4H1NMSQQyHjT55hyEmhoEh6mq3n2w2obKdn2NRVWrfuQ@mail.gmail.com>
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
