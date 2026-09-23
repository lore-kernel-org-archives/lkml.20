Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68148414413;
	Wed, 23 Sep 2026 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172702; cv=none; b=t802KL/ahzzdgmuNohLR943vhR8xiBICixs85eCWIKniQhgM3aIb6NZoPh4gaK2JD575Pg27WttyC293GH4HOwAOSvhbN3Tf/2q5r0wcoQ/b3lqLjb0ZQLQjFqqd84dAuJuJBnADa5ZPqnKeEdhMLdoPiW+B/2ZxEJ1wRJc9qJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172702; c=relaxed/simple;
	bh=Tfc/aNXPT7HqcpR/RZX4WVD/veNojBwN8DR+YT9tww4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=oqNsXXZ406cl644tVUjWAlhHZ6/DnRSZjUXFUHE7yi+OmZA48NBvxhghVXg3Ea2r9Qc67CV7UApyPvlA4Vdx2oazJAmqae7aEFlF+dZzw2GA3+KaVbwS1dU9QFRbHWreEX9/smxNPpC311ImgGPdCuOn8XdFMfV4Zrpkit7YZ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ozGhBASy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ozGhBASy"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7C671F8;
	Wed, 23 Sep 2026 16:09:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790172592;
	bh=Tfc/aNXPT7HqcpR/RZX4WVD/veNojBwN8DR+YT9tww4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ozGhBASyhT0gvtiobFspx38ZM9kVEt1VNAawzv0VKVPAAU/ahFZ4KySyLa0SbDD0Z
	 wsNw0ZfbFX9XEG4L+2sbNMvRuz102AuRd0NmZpCSrmTSLilchWdXvGDLnx1IKEY+0k
	 uOhAR4Ifh/9EODe6cwhPPeKdlEQl1+4IQQ14GSbM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260923015631.44973-1-ginger.jzllee@gmail.com>
References: <20260923015631.44973-1-ginger.jzllee@gmail.com>
Subject: Re: [PATCH] media: i2c: ov5648: Fix a data race on state->streaming
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Ginger Li <ginger.jzllee@gmail.com>, mchehab@kernel.org, sakari.ailus@linux.intel.com
Date: Wed, 23 Sep 2026 15:11:35 +0100
Message-ID: <179017269592.2497080.16397128200359093970@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Ginger Li (2026-09-23 02:56:31)
> ov5648_s_stream() updates state->streaming after it has released
> sensor->mutex, while ov5648_resume() reads that field with sensor->mutex
> held.  A concurrent resume can therefore observe a stale streaming state =
and
> leave the sensor in standby while the software believes that it is stream=
ing,
> or the other way around.
>=20
> Keep the update inside the sensor->mutex protected section that already
> programs the standby mode.
>=20
> Fixes: e43ccb0a045f ("media: i2c: Add support for the OV5648 image sensor=
")
> Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
> ---
>  drivers/media/i2c/ov5648.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
> --- a/drivers/media/i2c/ov5648.c
> +++ b/drivers/media/i2c/ov5648.c
> @@ -2145,12 +2145,12 @@ static int ov5648_s_stream(struct v4l2_subdev *su=
bdev,
> =20
>         mutex_lock(&sensor->mutex);
>         ret =3D ov5648_sw_standby(sensor, !enable);
> +       if (!ret)
> +               state->streaming =3D !!enable;

I see streaming is accessed in ov5648_suspend and ov5648_resume with the
lock held indeed, so I think this makes sense:


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>         mutex_unlock(&sensor->mutex);
> =20
>         if (ret)
>                 return ret;
> -
> -       state->streaming =3D !!enable;
> =20
>         if (!enable)
>                 pm_runtime_put(sensor->dev);
> --=20
> 2.43.0
>
