Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794749880;
	b=fhI9UnaX2mni1ojU7XkN0nyQdScS0elh4v+jXYxJwygMq1irArQjb4FVNgpSQqpXU122
	 BSDe/x5SsszpCiQlbrPNIpLojocj7rAYVOeQVj0E4VrxPd6h4Y9qcJ7JfCba3ozpKUODP
	 hCpiu+f2KHJxt6pshAepBz/tBrFM24o8TPBSeIzPzfbVRUY/IN3lOWIeNeveXVnCB2t1S
	 j4eugtHKg4ssSerEb3ENdJ1rnrqCVk6quZoKaDOin4m87p9gkoLGhWlLDRNZl6x2XJalx
	 7zzS6BvqRtm9MkWR0WxIQu9FpIeSsp9MjsIRjb8fI1tw+b1+BSdT+OBUw3aAqMslM3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=I90gEB0wXViVEQKBJGc0k65wJxE2LARqA1Y1G7+3VwI=;
	b=0j1oaZFbClr1aqye9103dm0sl05Se1kStj1/FimFxhLJXsN0+0h29Qer2iSMhO7MQ+ZE
	 gtwKqgndzQ5fNunn0IJepBGJ2+RtiGdRpF4ztJKGZBw9CznMAktkHFq3+0UznCTiJIWMs
	 lMlbXuoOLfqHELwuuBuhFprzZMgyNN4waHcEdwR7zRjuMZjSrduQP4/+3Z3ilgvKgnela
	 3Y+Cw6luIBb4sqwjzEfh/QUADsjWYj9vsh5aLz/FUQmlri3ZcBlrW5FjviUEcghSbpDhE
	 GYbLcwjwQqOZu1ZJjIfWF5u87LdiYiFEjtnt7KlRC9xj9B8xIsC9ssL1DThdeiQ2SWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j5u+8Tgm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EEC606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01EEC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j5u+8Tgm
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67da3d03263so566797d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794749879; cv=none;
        d=google.com; s=arc-20260327;
        b=WUZ2syRqDbdSJtt3E0xL82J4p/JctU45c7IHe+gavZpQ7z1n5kmk9VPrvkym6rJyzk
         7X7J8PA8Uaruygp/WwgviU2CDMDcvpC1fSVTkQa3+Pb0KJgGEUs09qOwwN3iEEqsMh2+
         GHCwxG3RnrFNenOVbJFfa/lxDR97mk+oBteQRubb26W15F5KEFzhWCzzSDE+QPftFBeh
         Rq4cJ8FEH+RIviwR9l0RAATVG+GD1SAmynI6ZbVCfgFFzIX/c6oslKzqdC9WfJt1unK1
         5FwWEApYHTzhL0Eckkca4Rk/QwVjN86b3pLVdw3x3NwlfjjZt1ERoHxII6qYTW9dl3jn
         yXfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I90gEB0wXViVEQKBJGc0k65wJxE2LARqA1Y1G7+3VwI=;
        fh=F1t6GjOvKrvB/nbn4NqdIcLYuiYqkQNh3duErkT1jHM=;
        b=AfvOARkVw6CFtS/yYFP1JjkR42mJB2ersbLSbcTcsMRiE6hLdNx6HzrA3tL7CuFjO3
         KFI/rEV7/eigYHetleAMLpUXwudKP4UGjQ6Hpv4XK5n1d2qW3qsjUPoNs+zeT03HCpea
         +/HdL8v0QOmxUNxPKy0LBV8joAQRhKxg+yJ43EOiYMJ+vQu4zGazHuO8e/mFyewlrWsN
         cbzpPMYbp71yYsMZf+0bXqb2x4pCXkQ86L7V2bn6rCSOs8eparpQid8wWWq67lI+svjQ
         EKrmV/tj6I0v0wy92gj0ZIQscfU3Ar8n9aIFYlkz4tcvaCkBActUMXLi2xZok0IrEPjo
         QoGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794749879; x=1795354679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I90gEB0wXViVEQKBJGc0k65wJxE2LARqA1Y1G7+3VwI=;
        b=j5u+8TgmwHXiKKpsbR7Szs8SaLfIfbPRiyJwZ9+fEjUNNPJnUNa3XTCzXk/DYH0khU
         MLrDmKFRDHsbW4ecqBlbueP9cdY0r7aeF9Izq4t/GRv2HaU+xmYVWTvm28qdLEUHKfgd
         UBBrE1o96MbOr+O5Iu/aTPO/eYHtuDDQ4nE9i3WFmBa4irbluZP24pQe8ShbtgoUBlCF
         lP/Fl6ltI8SvqfqC4KsJdfI/dj2TZ/0mBFdB2E4u/oJtZeljqE5e8D1vBQKXw+Bpms1g
         ZxvEL66v49EBTCXJR72ww1e/xcxIaXRxmQzHfwKMLUGoHwPjN5CejaUXjB0Ez3yMRvlP
         5msQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794749879; x=1795354679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I90gEB0wXViVEQKBJGc0k65wJxE2LARqA1Y1G7+3VwI=;
        b=bosgLsNby8Tv9+f93LhANhFJIdv06d37wTt67CNYRH98vr7sSAjPiYwoPw2K3GgOc7
         HWmZ+e/oDyyoE/lO0QSEIFAiWGsydIqzcThfSnEtwgdjW9C91OB2/A0LoSOM/EJcRGMS
         OqtqF2s3W19/3qyrTn92F1MP3XXwxWQv1sjnLacFDcekLRYOogz66cAi1+T826ISIR7x
         qBAECxl//P8S2U/+U3MVZ4uX31IX0UcA6OCr8AcMVX2zkV6RKkkiY10umkpGRGfa37AX
         ziFYGVIsAanFcv2yvEUtazyJAfXmNfq+0J2F80Imp8M9kM+vA93Im3DpjQED3uvdOonB
         GxZw==
X-Forwarded-Encrypted: i=1; AL+hErGQHNWei6gSAK1UjfCXYxTnKYWP8ZRzC3rie+Q7bw/rY7taq+d2eKEL3u2zqwdAgQ3kz5aH7uyGfV3Oxiw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pFE1VScRTCAYs7jwAKfomeidpK4VXQDkxbvqPYalix4t6PIyN
	ZE9Bs66VRQqWN1TjfSqMKG45kCpbSBoisBPYQikyYMHAEThwPyBL9Ga7kpE+l7MNtULFfQtm8Tt
	6LFU89nggh7c0rCkKLiSALddJL1nIYFA=
X-Gm-Gg: AYBFou1+cXbgpIvmWVGGfjdlAiVKRx5FctLpMg/eDpx5I9Y6KxdbEk4ZCDXHql0KHKm
	IYJCSPqCAIOTSUskCLPdGFXf34DIkRxRT62FvHQDslxxfOMArget+/dT155q4Zsc3STDY0kDFck
	zFulRyJs1BiTdO0gcqffVTsrspCoRPc/XVz4v94SaOmpf7nJJgDaHuKpd/XunuaYwEnUxFUrMJ3
	q5QYV9O5CGr6cD5XVhZ90rX8i6Vi9iOn82c7l4A7TDuzJhCC+mUUm5aqt8E6TaRohLI2dgaalS8
	8fbGIywVuem0YGPOHvZPj5kz0OMOkwGEqHWHp7NSnT7ze8yTMuZnfMpYHj39bGpmAuQXlLcp1A5
	ax/gc8yg4ShOLjOmzDnJ6fUUcBVMtAfZJMnx2QtmezDcymoBLgZTyMKjx5IKxK71fxuZXuWtWX5
	vsV5BmMY21Srw9a8aG4zU+CDiCBC4Qhcr6mwxTBpQAUK8q0xBbZBaeOAqM4RKwCdxL0OUimK4Xj
	ad10q4nZS7W
X-Received: by 2002:a05:690e:190c:b0:67c:3a93:638b with SMTP id
 956f58d0204a3-67d893e2324mr4461724d50.12.1794749878698; Sun, 15 Nov 2026
 05:37:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102141439.13505-1-kartikey406@gmail.com> <20261102141439.13505-2-kartikey406@gmail.com>
In-Reply-To: <20261102141439.13505-2-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 15 Nov 2026 19:07:46 +0530
X-Gm-Features: AclHuK9aacDMZDOlVUzvL63WXYgaGKeLzw5nDq0_SsaPm0rMWGu8Dy2tKKW2KeE
Message-ID: <CADhLXY4DPmT8Q7Pw8b22gqwMha+RPdy-Gt17aqoeOc8OrxeVcA@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: em28xx: clear dev->v4l2 on v4l2 init failure
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	laurent.pinchart@ideasonboard.com, hverkuil@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+54648a6c1187a7ef46a6@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 7:45=E2=80=AFPM Deepanshu Kartikey <kartikey406@gmai=
l.com> wrote:
>
> If em28xx_v4l2_init() fails after registering the video devices (for
> example in v4l2_mc_create_media_graph()), the unregister_dev error path
> drops the initial v4l2_device reference but leaves dev->v4l2 set.
>
> If userspace still holds an open file handle to a video node, the
> structure stays alive. On USB disconnect, em28xx_v4l2_fini() sees the
> non-NULL dev->v4l2 and drops the initial reference a second time. The
> refcount underflows, em28xx_free_v4l2() frees struct em28xx_v4l2, and
> the later close() makes v4l2_device_release() touch a media entity in
> freed memory:
>
>   BUG: KASAN: slab-use-after-free in dev_dbg_obj+0x630/0x830
>   Read of size 4 at addr ffff888023601bd0 by task v4l_id/6384
>
> Clear dev->v4l2 in the error path after dropping the initial reference,
> so that em28xx_v4l2_fini() returns early and does not put it again.
>
> Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
> Reported-by: syzbot+54648a6c1187a7ef46a6@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D54648a6c1187a7ef46a6
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/media/usb/em28xx/em28xx-video.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/=
em28xx/em28xx-video.c
> index 84424284d486..ec4ed2b0e5fd 100644
> --- a/drivers/media/usb/em28xx/em28xx-video.c
> +++ b/drivers/media/usb/em28xx/em28xx-video.c
> @@ -3137,6 +3137,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>          * v4l2_device refcount to zero.
>          */
>         v4l2_device_put(&v4l2->v4l2_dev);
> +       dev->v4l2 =3D NULL;
>         return ret;
>  }
>
> --
> 2.43.0
>

Gentle Reminder, Please let me know the status of this patch.

Thanks

Deepanshu
