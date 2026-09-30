Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA57651EE0F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793202; cv=pass; b=mLQbeyEtqY/JoIrlU9Jw8DaRZ2vGYMiKswq1EAUgn3U6ALBzo3ZOTO3qB3syMBFKUX0W/u3+Z1zgTfonsJOqTnnCq4tIsPbGNg+4HfzHhsZrlS2w/G14pAx0AYMLXh8jTU+uMOg2aQBxKWKxYzbUOboGv/1nHhRR28wPKidkhts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793202; c=relaxed/simple;
	bh=7f9mJGlZR9hUD3IYdldDuTH1aQHWGHT8NvxFAbMpSC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sgceldpHPqsDuqWdsBW2Ymhw9uXJBVscujtEtJN6vANK4y5JyCa+La27Ovs3HRydbtP5MNk4czxWuKVex5taAkamRmkzxKItMHs1GNd19DUYHAoGBF1iGV93PBCJESJzRO2XZjqlUra6s42CM8IEVhnOeYeYzABAbFZE1rPVZEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQGfd0ar; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQGfd0ar"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba390408cdso1842178e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:33:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790793199; cv=none;
        d=google.com; s=arc-20260327;
        b=g1sHowezTPSEAeHXilZ1Ft13p6Y0KfQh9XM3U9j4ThKCKXs2l6rfeqg4ExnjNvT5fO
         /lNKRG+iZ9u25G9yC/VQFwuYmF3fUdle7JsvqOzFqJRm625pceuBOA5ajLoyhln2tzy6
         QqbBtkuicyPW02cGvSvumkEym4hnLMoHKS8GjZ/p6toOnyPHyhPjRvtMQ039EjCwKoBK
         LBa62WthTsvaMvOriedehmlnxz16AM60qYKfwmz5XQrwCmVskvuFcbbiNvjNRB/8S2eu
         gPaJefyqWvQlgsyQ0UaTmjjLgZTu03MGRG3f5XjM9IcPfEZR8Hzf3x8PQPp4O3rY5OX0
         TdcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gMwEIwl3BX8MWs8GGgKDpSrO53q/tdMoraXZVrEeGrc=;
        fh=OHiPmy+pes5FHtYyNQvV3ldxIJfzqkTR1WaFEiedanw=;
        b=EhC+bW8wpwN5C7JuaO2tEcfpHBGkEjnHdW4q2OXp16tKh02K3reR9tQnolgYIsCT8r
         ZXFMgfWajvwi2P3vuX6ZPickh88tI1hswNd8Na5264tCdLtBlE7E7RXEEiagw90rJIx4
         BFEJpQW9jXKNikuo0JgIR/bkO0xU2NlUP7BnDnqxNFSQkFGyJrBsJuuhoPpklLjfjF3b
         CZcVLmMpxTsgVpAWTaSXkqhJz21Pf0q0eUR5ZkIfsx0ADSKYmp25HmkajrNjEZt5TFrg
         7eYVAq6xZQ110z2zza+p+C9K1jO+7AZaVZ5pjPcQCiTZ/SBRuMJ+47cSx57pU3cY1/Wk
         ExlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793199; x=1791397999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gMwEIwl3BX8MWs8GGgKDpSrO53q/tdMoraXZVrEeGrc=;
        b=mQGfd0arUg/5xLffbSJlxnkGhtR9cRNXV0I4YvbV9Acp9Js+63f3raFZaYgxFwWqOe
         KA/qDlPZlWiYJdsSPd2sURvmIQElJLaeEOm4uFkcI8bENTTWLmb85MWBNVS/352+gvSi
         tsi5hF8dDXOb1DlzvAudVvoulTMhtxcD0HPiTiTv1fV0CIASptL4cOBmie+zvO2siQ+m
         1SeoE3ph66hnw5VxmwVtma9jQ9KoDBoCPsgUjERVl8JPaGC+sAhQTOscllMWUm2YFsTK
         +gVnkI5dTnpkcpk59UgJLaQjr/KwK5F9rfFBFPbQg5Zfus/ShUjkRiXQ9IVz492pI5uV
         Vliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793199; x=1791397999;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMwEIwl3BX8MWs8GGgKDpSrO53q/tdMoraXZVrEeGrc=;
        b=TGYzeWYBSTXYKn6dbtthKn6i2ci7Mn3AtZh7LJyfa77ego1wgkd/vsB1KVatPOTaz6
         pyrvJvoq7jV0GFzflkhYrdYdM6Qj+NAZbBqg8/AgzZ7bwIulvgDMbiJrRvIz65JR/hgP
         Jjj5M51Qa323TY3virLAAJrs4u9lghejG8mvG7v7ydHqrMRA+6B6Q9r1ttN2MiyO0JRb
         U5hY5+5AZl8oiu4HIuQF8W1xtLEVLLyBHodeQpNiq5OXn9xfdmXaZwusrfVErQRpdaas
         Mx/zTDtwz224Y5rlxOrl3BL/kATMDuzbt68YFRc3NbjkkWQjfO16V5hqEHyeZ8ch3H+f
         U+sg==
X-Forwarded-Encrypted: i=1; AKwUvBw+lzB5/Ef0Ww0MiRI+H8h15LbVFkMzTFRYOfYzT0oggLjpBHI63MZwGLB6gwClH6Twz6Qmo/5An3on1CE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2v6OjODjlXH35nOMWnnNpiwx6h23n4q0nRMw5c7s2Z7YZTkd4
	cn08FyR889WOwLXn3M+pjIP3jGOGWsy2SVfFkVxjhQJbTi6BewvmSqmdC78rTKXDq6GhqOaufbq
	2p6h+WZf5UhyZamxR3tCQXF+8WtKMCZI=
X-Gm-Gg: AYBFou3WRJYOpLo+nnJhYU1YZVyK1E5sJIUdA6iBWcHiWqjOd809QZRNDnlvgqMrWAu
	6pSC28le+wwn0idJ+OeWPjiQGCNN4ChonsH0x4lgETRKyCOMCa2INMx36Bwkf6V/PI21rKJzlZ2
	0IXAtGBEavVGmxR7Ik973imdN7p6guEwUyY9i5mjE0W/rc/ox5Cj+D3QkOeWGAinSq++xfTSid/
	OR2eDofmRZT5GwARCbqI1pFMxg8F6PCWupZ4/3HjEFIDSYT0zGKr1Gahzg48q/HncEwT7MkJgg2
	4EjaeL39S6jhv3szc+nyOrX5SS/tZdSsL3UR+Gr1F7OdN3zbZijTvLaQDIz0YiSLTbsXZtxR5g9
	NRdmmTK4meHf45gHMBoQo3g==
X-Received: by 2002:a05:6512:24b:b0:5b8:f42b:ee35 with SMTP id
 2adb3069b0e04-5ba4060068dmr673782e87.51.1790793198330; Wed, 30 Sep 2026
 11:33:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260822024850.2504871-1-hanzhijian1991@gmail.com>
In-Reply-To: <20260822024850.2504871-1-hanzhijian1991@gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 30 Sep 2026 20:32:27 +0200
X-Gm-Features: AclHuK-51FVTMcVXEbrcEW8IDW8baNBM7mZPKzcpMaYbu_jzJGQ0OtqW8B-GSb4
Message-ID: <CA+fCnZc_YW5AjuVMR8c9RhiQQtvexW=w4vu1_2Rv7G88Cf4AdA@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: gadget: raw_gadget: fix memory leak on connect
 event failure
To: hanzhijian <hanzhijian1991@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 22, 2026 at 6:34=E2=80=AFAM hanzhijian <hanzhijian1991@gmail.co=
m> wrote:
>
> gadget_bind() allocates an ep0 request and stores it in dev->req.  If
> raw_queue_event() fails to queue the connect event, the function
> returns without releasing the request, leaking it.
>
> Release the request before returning in that case.
>
> Reported-by: syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=3Dd83b3c49738aea97c0e5
> Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
> ---
>  drivers/usb/gadget/legacy/raw_gadget.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/=
legacy/raw_gadget.c
> index 4febf8dac..33d70b552 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -316,6 +316,8 @@ static int gadget_bind(struct usb_gadget *gadget,
>         ret =3D raw_queue_event(dev, USB_RAW_EVENT_CONNECT, 0, NULL);
>         if (ret < 0) {
>                 dev_err(&gadget->dev, "failed to queue connect event\n");
> +               usb_ep_free_request(gadget->ep0, dev->req);
> +               dev->req =3D NULL;
>                 set_gadget_data(gadget, NULL);
>                 return ret;
>         }
> --
> 2.43.0
>

Maybe this is a valid fix (though it's not obvious: dev->req should
get freed in dev_free() even in case of an error here), but it is
unrelated to the referenced syzbot issue (cause by bind-unbind-bind
sequence). LLM?
