Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36D221257F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 19:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788116520; cv=pass; b=llsjLkohyXe9tiqychNZBvBBxREDtG3CNAgulRCqsH5ym5uWQYwefb3uLZ2w36lyTO2X9BqF0PvqnmMZDGcIkWo9QDyBx7mebSVsEZE4zgDA0E0roaXUnbPoYe7EU52JGlV94wzWwwF0WHVaeBnao8lhXM01RfHqfC7ndZRDkh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788116520; c=relaxed/simple;
	bh=Aw69XSiWbGpFsFLtQRZwB1RWfF9glV45DFF9AfI7qow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dIqgE7axRAFCfJtwwo3YdMza7JFB/GBPtWtwPiFHZ9Q7fLA0E2GWea4XtWhFr5+aHXOlbUPnFqifaGgZyTp//iAJhqSLm7Ns2dGY9qeU05wCEbW0ykM8iEURMJcOMCHFSj6KxlHlzPyJxYt7KA7aSJSu2cLgfqsvZ8eipotnlh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mI1vRdJk; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mI1vRdJk"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so2891400e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788116517; cv=none;
        d=google.com; s=arc-20260327;
        b=T0xmBtWp5MF+y01WEa4opza0oQdvLWfk4f2MR/MVVIVuz2wpwjiQva3Eq3dkqoThur
         gPM674LbXiSols2MAy30EY5eUGdqzdJDW2r/yRGbQn7jat4CkkcjuxjEqff0hIpUJq+1
         Mud6oFI/Qve5QViI5ImO7z+mra58vO39WUZFOUX6jBmV+hPFBGwPrmhZd2VOuwh8iR6o
         5QcplLSIXs4mWKkRywQax/HOHTHDI7/QZdoUG0fCn4pipHiKUxkDMGVJpcdORzTJ6Dqu
         9OLwtdm9kCg9oze00/z+sNrt6oD06ne5bHCWOtp4SIFsTzhJr546iIoQiQYJaUDgDrp0
         bSvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xFCHS9y+rltPZAUUGlotlTizcT/cuz/3d41GnzmltgU=;
        fh=TC4iTWK9TRgMMrcQajxT4QvIh+YxwwEfIuPxyGvJAIQ=;
        b=rdE1QeE2vcFPin6rFg+RZAO3lSA+vauXaLh8VmifU+jbj8k6qRxMKZSUAKLWWnaDzV
         /rEH6hZpEOIJ9hHKPpJYad0mWjIwIM5BLwmbVzm6e62NADwRSx3VKCUUAuvvEBsqsH4v
         HamUFIVx60UQ9NUoyXrkhbi7TbvRX84Q3AZr0Tc5pBZvgb5WIdcKLaHV/vtlM3C0ffzC
         Df5DjfVAl0Vt6zSqe51j56+QKnffor/ruuQnMPtDa097NISYOSF+kzxG5E6hby/RqlET
         jYrB2EFPkyxwYIYUB83J+BSunwOYncq+FjLUF8cOH7a25Yw4Ncp+AsrDDbnFnJj+SJhW
         aKAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788116517; x=1788721317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xFCHS9y+rltPZAUUGlotlTizcT/cuz/3d41GnzmltgU=;
        b=mI1vRdJkRcEVtShqqwSysrw4htE3t/TS3UrqNGsOxMyEXBXMDbaUsjluyHFinjUU29
         +8qVGWk92eKV2b/BBheRf08VKjj13bBX4JdmV4VMOKs+Uojit/vKky4qsZaWkB777ZgM
         LBu1NXhJtWajL1J1vevS6jK/HGEi032F5S7uSUqa4+czw+ZK6wlcMavjcCPmOEHU7Ac1
         u51klvbQ1EZlOyf1EQKEn7Zlap9m7dP/ezw9rC36/p2rffji6F/GkLBp6Ix3iVUg1enE
         3EQR3UGkkzu3S+et1eb3s3szYntcSNYXxItJvHyLRAQMEceYUDldOWpf2M9161E2B1nQ
         5yUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788116517; x=1788721317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFCHS9y+rltPZAUUGlotlTizcT/cuz/3d41GnzmltgU=;
        b=jBrhZ6C4mh3RNvj1UL2LWwv3+Tull5fVF+FHI4Ie/+/NdNu+vDNE3wrfkUJjbLxy/e
         aIofixiIBwnyTvfj+gW6/LTZrno2S8eoKtB8FXFhh0tFff0sQhU/PZkGZx0kmB55hHIF
         hzTG6vWcSNg2olXads1dtsbB91hc7O13ELEAT1JdldpI7I6OXuRpd5zH41bePOZK9xCW
         RyGrVbBrFm2To4Z/GljbVArwjyj7cVq4LM1L92gDzgUECcDnzELqv9eaGsIcrVDsEMYI
         jFtEq3ykSNO8JA2wOKPNLtHqpcgyHW5z6Fa0k6rENv01RdXWEuN1WmZoObTabQ147G2P
         NN0g==
X-Forwarded-Encrypted: i=1; AKwUvBz3MuVqnY6ltHqK65cfVkSQ35s+bEyEgq/vbRjQUm5Kst9c8hz1brgBcHebsg++tvLs5xlJ5Cr4MS+QNdE=@vger.kernel.org
X-Gm-Message-State: AFuF++lXT2QSzj8axqXIUUudn/Z5brhtLy9jq/4RBS8JyCI1dGVj+RR0
	Zj/fB06MC0f/EL14TrBOrc+qW0BddWvv93kyZXIUxNX/ELfOlfd4Bt3no6V30eFNYtWy5Wevpoq
	awDUu+k+ourf8ZOY69rF/oiPc/p8StG4eR/o5v+puhjBRJQ==
X-Gm-Gg: AYBFou0guPKDS5yXzy9JNHCnx5ed9gKMdmaCb7pGTuBQVcBH8hsnnD8tftsMcyyY0a1
	7Yi24VUwsa2/D+JYMNwfYWTUo/7cBfSx6MFhmlkJ9Lrhiqdv36LkedtNv/lEcbY+Y4u7AoN2TiF
	wtJYG7pPx9lEe6VWQhVwUoWDIc12TSeCYtrc3K/yKCM2aMP/wCiNuwVgtrNxIf+DiTlZ7aefOFo
	lXAnW6zi/hyfRHelv+aPjrryEl31NV5em9RWQuottfYjKWmfDkXdDvvsTZDSb29s0ssMHiCWItB
	RVt5HT90EVtvSr2scBNj5a81s0gunCpkFvklYsov9byukVajghOKGZc5F6a4w5o=
X-Received: by 2002:a05:6512:4605:b0:5b2:a6e6:8d83 with SMTP id
 2adb3069b0e04-5b5e6b07d24mr6613988e87.23.1788116516570; Sun, 30 Aug 2026
 12:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830054237.2147950-1-donggeunyoo.kernel@gmail.com> <20260830174116.36fccbdb@systembl0wer>
In-Reply-To: <20260830174116.36fccbdb@systembl0wer>
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Date: Mon, 31 Aug 2026 04:01:43 +0900
X-Gm-Features: AcwNN1V1FvmhrwbE6PvSdYFPuLz9cA0AaGTHVxRNN4ZJggNHXTVHV3ILC6479Hg
Message-ID: <CAGdSRjkCaEKCcwvZaE+V_jFXdPATJfa0MAW5fybyKU9+pFHGbQ@mail.gmail.com>
Subject: Re: [PATCH] iio: light: vcnl4000: use sysfs_emit() for near_level
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> You should also include <linux/sysfs.h>.

Thanks, added in v2.


On Mon, Aug 31, 2026 at 12:41=E2=80=AFAM Joshua Crofts <joshua.crofts1@gmai=
l.com> wrote:
>
> On Sun, 30 Aug 2026 14:42:36 +0900
> Donggeun Yoo <donggeunyoo.kernel@gmail.com> wrote:
>
> > Use sysfs_emit() instead of sprintf() for writing to the sysfs
> > output buffer. sysfs_emit() is aware of the buffer's PAGE_SIZE
> > limit and is the preferred helper for sysfs callbacks.
> >
> > Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
> > ---
> >  drivers/iio/light/vcnl4000.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.=
c
> > index 336468d59ea7..dac235dd6220 100644
> > --- a/drivers/iio/light/vcnl4000.c
> > +++ b/drivers/iio/light/vcnl4000.c
> > @@ -1504,7 +1504,7 @@ static ssize_t vcnl4000_read_near_level(struct ii=
o_dev *indio_dev,
> >  {
> >       struct vcnl4000_data *data =3D iio_priv(indio_dev);
> >
> > -     return sprintf(buf, "%u\n", data->near_level);
> > +     return sysfs_emit(buf, "%u\n", data->near_level);
>
> You should also include <linux/sysfs.h>.
>
> --
> Kind regards,
> Joshua Crofts
