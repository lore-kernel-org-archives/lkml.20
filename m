Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0FA4E66A3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561325; cv=pass; b=UI72+WBp0jr7DR7Ekx42q9mawvenhXY81SWzjbATzfE1fxV8b9ZECUqXgy7S63bxCjfoYGdXpddWqSykZ9UDHi7VysiFtabrws9B6+/oCCIF8iregjhcfwEhkcw9YBaZ/RLDDKrokdbxHudRtg+901+WAi8zRyYOic+nmF+ZHG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561325; c=relaxed/simple;
	bh=Bq881M2dqm6GKoOZGIh/gzGfZPXNikD/fmFhifV/8bA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2DQ4Sg5+dPgGcOofjkQtUadsv5raViyd6zyGq9Ei6rpSD38pqD7siOzG4WcQZNeEdfgYq7ohYgY5oLctn1H600d3jISO2JRjS/yhy/wLvjh5RQGygmr21F+h7UTxkkZoOvjYfAiNTYQXxLFdn78KZfWrCXaKJltiX2q6+fnSdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b=aDW7G5DV; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b="aDW7G5DV"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d5bso7997651fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789561319; cv=none;
        d=google.com; s=arc-20260327;
        b=GQEOMaR4wrrCe6f5M/kA9cSpb4uumDiyV245Ros5uZNdcu0/frBIaW1kLrcv0NkVDv
         mLL47zglk1lhM625w/hp8y/ja3SGdQZ80iCBB+3BP7uYrzNPWRTTIUQWlsSFytPx2hTT
         zP9bnN3oMg0wXTOb+/p7XifcGnM3CwcgmO3+reEkOQH/Uo2jpYWzNKOCmSWD0qRM0bPN
         ZKxxwY9jHu8pG3kM5XTDYY4RC9PZ8CSqetsQG9VITM/XRDiSsngl1eVzCCv51GYnmpRV
         foECXN7EypLOJnynWYc1kS/yVIPdOMjwNO2WuVonRFHbD2NY11Ml6ls+3Mf7mssj9Mlf
         X/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WAMMSKRtR5SkKpZeFxgDlMOeMMYKcKQW0S4EL9ByfSk=;
        fh=Qjng78FWfnutlXszD7Rk/tDHFwpKEX82+M8Jao2pN9o=;
        b=B1yk8GUKeTT09Fe91Jm9/1SERR3HIc/ChLCqNWJBBzil27CYsPrck/sGuZKiMu998l
         bfc4bWcO61gpJWb9oI90Cct1UVOg2+43qEPqE5A5WaYnZGe3Xn0jlelRlp/f1MorixJJ
         kbN2eaSbb4/d84fgVMGmYvlOdNw3xlYul+Ou8JS6V7xbaWl3MO76PgMJE7jZlTLxbZJl
         F8eMgfEABsPmD9YyBS8z/Z1gDv0cdMbjBAiA4peePegUjeCBSPTQaIutZWcHaoDx0FKA
         JLLRJIYOP1ASpmCSwpC8J5hqWpbTOyeaN/d5yiHwhKhrhP/EC005LxTbzZ8/dj/6x730
         iM4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1789561319; x=1790166119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WAMMSKRtR5SkKpZeFxgDlMOeMMYKcKQW0S4EL9ByfSk=;
        b=aDW7G5DVZIZguqUQAQZ9d6ieMhNF76o1BAJzGf6emv35elRZYmhWyB4tEdqLklciIr
         5WTgpEoP8+rVGA3a33dzmcpSLqG5mZsZTimKJ+sITg1kQLeXyHkjE/2eItUNrcg97BDl
         WWeOWHaSUOMH1Inp2MjiK+ZkdyZ5+6LHvEFFBwXyAYBvN0CeRA+fLlon3BBb6slYBU5p
         NRcsi4p68+CCxatGA7iNASlxvLQ7RuCDj0ybhTHckpuvz77uVwGXsNoMywIZe3wW7705
         sFEKDwrAgaefhNNBlmNvAGnLn+1P3Gzh8SwWrPncsMUSxY9vsi+OI4Yc8u8oka6s8ei0
         79dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789561319; x=1790166119;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WAMMSKRtR5SkKpZeFxgDlMOeMMYKcKQW0S4EL9ByfSk=;
        b=no0DZGVKcXGA7hJLW/z9G/au9W7q+RrWg4ugH9wB3vjv1we9x1/6YMIS12UhSP9Ez6
         Nw25RGg6n99SErQouN1OnTVnb1h7OBMoN7CEOpbpKPHDy5bEjSJa0KrRvanG/Sk+y/ae
         n0qJoimHzL+JkVAtijOR1aro8DeTPlL0FQeUsO8GQjGIGNtA9cDS5LmeS4AnlE6vfV8G
         h8VrV9rLCumejyVqp1vASyxo+REha+0aqsb4knB7Fx23K9Deu/p/KYK2QaVcSWwUUS4/
         cAAD+wCO5AQaddYvy9nwDQmZ3QHNcvtd4Is4WAbDb9+QuzDiJXONb+peT5xwxgC4++BZ
         E4hQ==
X-Forwarded-Encrypted: i=1; AKwUvByH2kjpMZN+Lj6geRUkf4Qbe+YFDc/BSB3i5hrcYA6BLFtuzoCZV1EH8ON//uV3LRf8+yDC1jNMvxHlji8=@vger.kernel.org
X-Gm-Message-State: AFuF++kdqdggXnakqe0zTUXEuVynXnfTQdw9AeaFnxj4lgtMi2pY12ym
	LWl8BhZPZKL9Uttoc58UnW7gtCOyyuQQqbWK9NVcg9FY9AaXjB0usib810k0MZu/yJ03XkvpQYd
	TZzEIu0vdHCkHBoGElwxltcDEv87h+OtuZMn7AgtFA1pcpe5UHQ5wLXTqZw==
X-Gm-Gg: AYBFou3H9anwj5wyYODDnK5Fzm3JY0dyeXP+rb8Gsbysn64KsWzQBcOLQY+xIaTO1lG
	8FhqZXm41aNHXkYiU+y+Int1Np9Nr4FuNHUPtWPpdkrLjcPdYZzFuXNNzzTgJ7zs/UXlk9n4pgu
	t0bAliXiY/X1qJubrdE1b6YQy+HEixz1McdxRbDxNnng2KM51nLUZsogYMdrS1DgPcGAI84QWIh
	tAse+Vk1iLVa/B+ndgnY3s207ZPXnXiFqaqj04THdeNw0EqbUtWNmbxbIGCj+bUFdw+T3Rae4OS
	s/w0ebhQZbRFPgKpZv2FvtYhUAHrAk334MlX15seVMbkaw1ijaaAVt3sVojSWMc6v7B1QojuB0K
	DdsyQRNa+Mz5+taGc8KTFY20yCzmZt53FOl3M1Dpy
X-Received: by 2002:a05:651c:a382:20b0:3a5:b957:d23d with SMTP id
 38308e7fff4ca-3a5dc9c4523mr7083011fa.6.1789561319145; Wed, 16 Sep 2026
 05:21:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916094817.2007756-1-vulab@iscas.ac.cn>
In-Reply-To: <20260916094817.2007756-1-vulab@iscas.ac.cn>
From: Haris Iqbal <haris.iqbal@cloud.ionos.com>
Date: Wed, 16 Sep 2026 14:21:44 +0200
X-Gm-Features: AcwNN1Vj5MCCxsybETxa2RMBFpc8N2_N-J2Oave1MHK29JMnf2xnRGfsiC31dsI
Message-ID: <CAJpMwyia7fYUOq=dj8E2FWnrtjZ9jHjZQSBW2vwB2vRBkbi2eA@mail.gmail.com>
Subject: Re: [PATCH] rnbd-srv: Fix sess_dev use-after-free in process_msg_close()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: axboe@kernel.dk, bvanassche@acm.org, danil.kipnis@cloud.ionos.com, 
	jgg@ziepe.ca, jinpu.wang@ionos.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 11:48=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> w=
rote:
>
> process_msg_close() drops the device reference with rnbd_put_sess_dev()
> before using sess_dev again in rnbd_srv_destroy_dev_session_sysfs().
> If that put drops the last kref, e.g. when the device is concurrently
> being torn down through rnbd_srv_sess_dev_force_close(), the waiter in
> rnbd_destroy_sess_dev() is woken up and frees sess_dev, so the
> subsequent rnbd_srv_destroy_dev_session_sysfs() call operates on freed
> memory.
>
> Move the rnbd_put_sess_dev() call after the sysfs teardown so it is the
> last access to sess_dev.
>
> Fixes: 2de6c8de192b ("block/rnbd: server: main functionality")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/block/rnbd/rnbd-srv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.=
c
> index 10e8c438bb43..2ebc2eac384f 100644
> --- a/drivers/block/rnbd/rnbd-srv.c
> +++ b/drivers/block/rnbd/rnbd-srv.c
> @@ -361,10 +361,10 @@ static void process_msg_close(struct rnbd_srv_sessi=
on *srv_sess,
>         if (IS_ERR(sess_dev))
>                 return;
>
> -       rnbd_put_sess_dev(sess_dev);
>         mutex_lock(&srv_sess->lock);
>         rnbd_srv_destroy_dev_session_sysfs(sess_dev);
>         mutex_unlock(&srv_sess->lock);
> +       rnbd_put_sess_dev(sess_dev);

Thanks for the patch.

Sashiko has critical finding about this change.
https://sashiko.dev/#/patchset/20260916094817.2007756-1-vulab%40iscas.ac.cn

Can you please review that?

>  }
>
>  static int process_msg_open(struct rnbd_srv_session *srv_sess,
> --
> 2.34.1
>


--=20

Regards
-Haris
