Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E6C3F3270
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790875587; cv=pass; b=m27A8vF3AGr6C2TBbXyVfhOkyPSiHT5cxoWoIjnTCgIiajrmAKM2bZL0hICStZSyPx+OWS8eH1YDjmmewJ8/hY7sVnTb+wgIPa0FwDbrR7+bU6pcKuIAa3QWrntMoiJhX+BZ8NVmZQvewsehBk5T/AHuyobhV64pjOFPDrrucdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790875587; c=relaxed/simple;
	bh=3CJUxrL3kW030JoHEX5HubkolpDZz0bB0OuESBTT/Wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5oDGojLX1LrDyT61me+SLTdz0nR50VGT2dqwNOJCnVW9iV/0annX9orwGAF4BLMCL7KX297z8SyZACP8O5+mpeDnmZXMIwuv6O5uFSKVVs+li0iMZufnersK+1b0TR1N/MjU2g12ZZ073zpxvZva8JHPH0BtLDPjSuTJvDI7Ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=JADdcFWA; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="JADdcFWA"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9b2f02so1324208fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:26:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790875584; cv=none;
        d=google.com; s=arc-20260327;
        b=nIFibjbli2vBoKlZLnWHVXkjA4qFPUQ7Hy45iK4Pr00bWzc3LwjP3Acvqy0w3Qbaqg
         wHFGqWkRNykVgM+jz5P1TEmYkxhkrTmO6HVGNZxiNMrkS2lL9JavI1UXAyrCEy94BhO6
         rweakgJDmpinJ2jP9UpMkz1vfX7186srtQodD4pJjRo2+8+hvWIys2tFIEIgFNiFeY1O
         z9QlaWJhur6uhI/sT+oUUtCO0G5DyKwGL+R/zH301KFT58SYXv6m1PfXfXDOPxtcGvp0
         bujP98VommcXha6TYYMBopigH21hNV2rsVWf6zdNjqs6Du25IaoM39ffdWFFZSB1Ojl4
         nfKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R+7f1WEXi7Dnz/u+SCwV0uCtWUYjG5PzPuRb4pUkzq8=;
        fh=SJNL2wrL+RR9H4+fDkutpWjSMdl+P1rsuP/UJR1CmIQ=;
        b=Mr8BXtVQanGU9PF2sTS8MN3m9BG2dJ5G7odXCudJ4bWGiJw+goAFadSYyxWv5mGPf5
         fONw6I7pXIUUMn4PTAERB1bUl6mkJoHU9Ps3OzoHHfXClnhDUmaftQ0uU0EhcdJ5MKks
         PRoIaHN3cmGSslxkfHDAvRg1srTXJYCStlyy29r0WjvIyk4U4Q4DtzGk9vG3kTb7XfXb
         D56t1gYFw7+xnd34ttxYYk5+JuWj5VEOypBDIZNg9fZMplP4lcbFJGvhQ4Btlr5ej3JL
         zs0D5vk9I2Zs6vaomXHTt8kkIa/wmw/0Rm/felwBKu7+KWSPRBf/hyyFJQ2eD51gaG8+
         6wOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790875584; x=1791480384; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+7f1WEXi7Dnz/u+SCwV0uCtWUYjG5PzPuRb4pUkzq8=;
        b=JADdcFWAq1HyCyEc+xI9C4ktpBrnzyRgaRgVu1+97kG0gz/NoQlUp2lI9lLFu7wklf
         QfQ2Qq/Ihr9ait0wY9JkaHNe2/exa6QbztLp1FgbVSJaLxw67xBVJ6RdZsuqvXRTwlzL
         4zor5wdA7QMWthi9C3OaNtSjmw6xqYlt8AZp4KEFWtDzDeV+TkUjCRrpAdstWVqYui+K
         GhLaj2TgZsjNzPMEurOz+O2zUykYhbzQRXfYE5DsV5EGdznGF+wd4zjOVvJEDQL7H2bm
         6PQmWB2OdAFnkzXFxbWWqKXECQ6vUKevQXnMibW7s9OOxH3RfzM7ttJ2i2+hYuj2KUoY
         pkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790875584; x=1791480384;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R+7f1WEXi7Dnz/u+SCwV0uCtWUYjG5PzPuRb4pUkzq8=;
        b=ZLs5k7MMKXZTJr/Ey3PC20l9tDRQSJeMFnGW+UeSSLFl1fHgDO4qLMkaQCkk6EXW7e
         hugt2jK9VfM2UgfLNoo1gyIuqSsnTGYput4nRuN+mcXWgd3+tdzH+i7n0+jqNeLux7FA
         9lPEmhq+eWjjoQljIImniKWvrBX4bc7yartMg7Sq0MSnbOjegJMAxwu7Y73uF+N5sr5s
         hvIAUWFLyXYEtxOdyKo7n0+6M35lDtKxWUc6cnsL4vUnisKtUzWQ+aAL/zt0wO3RjM8a
         +PwV+0cIg2tDzK4LnZPYOAcRCAcLsxJDS8zOXLyOI65kYmFVqmzKrohn8xUprS8+/MBx
         bgzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnXdiVkoBs+VgpFqqmYFIizBMwwaBp6gaqlUyubx8i1z6uVblg+KnzQoNBwpuA/WoSTG8j0w+o3EqiWG8=@vger.kernel.org
X-Gm-Message-State: AFuF++mlS/LCnvspIWoipeYk63+peroJX0Um9OCCkzB/zAfq0UdGQ5x1
	TaXXIPwt8BRu7oJwxmFzJWyHoCyAdU316x33jNmObDKjJlzri7xT3LecG5PcjPqEcFxX/OiwOQZ
	x/3eMo7MPPR8TDzBqHnRBDAoqUHu4JEYiDG9MAswT0Rp6ocqbPF6GNvQ=
X-Gm-Gg: AYBFou1t0W9JP5/eqOYIAr09biWA1Ej2oSpipnFafkvNy7mqTyrsYFmLMnKFxtNbagY
	rCbo8wZDuAPAPNoHmS42EyUeC9o7ERBmUKXAbudILNxpO01Yr26b1dR9g+FBupWGtnX8i4Xsetb
	bd5fRFRXzybfGeXYFUdlr44Osod99NVAhpkh0kSOJDVSdZA+zEpWzbVr/7TspoIps9cSOwuiE4t
	STcXiDbjYrW8BkDIjSJtDVdguj9rCoyqe7GkQxESK0UdCav0n5jfJyXMb9rOEbdTMlgTCujj9ET
	GP2RTIEc0nQ7cVkzeRbcDrpAEoiaNWrKiISPIyXDHaZjtuPTAQjCH7HkX5WdXwsaUo949VEb/wq
	rjEzrrteq+2cS85qhBxNi/y2iyX+FKiI33Uo1L9KvzhZyzKLnU5J4leXHSmN4YYmWKKXf0q6m
X-Received: by 2002:a05:6870:17a3:b0:48f:e0f6:bfea with SMTP id
 586e51a60fabf-49e15e4be7dmr131030fac.22.1790875583606; Thu, 01 Oct 2026
 10:26:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
 <20261001-v4l2-sensor-detect-v1-5-a45993be17b8@kernel.org> <CAPY8ntCBcUXte5pAG+i0SRNC-z6GOjakfgGLjDm7D=z91A3uhg@mail.gmail.com>
In-Reply-To: <CAPY8ntCBcUXte5pAG+i0SRNC-z6GOjakfgGLjDm7D=z91A3uhg@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 1 Oct 2026 18:26:07 +0100
X-Gm-Features: AclHuK9xdYo1ENtvCe2bDvlA21YMpzjkK_sVOz108ZEs_aVAzZPVifHLAuU6otM
Message-ID: <CAPY8ntC_4UWjR3hPG7E3ORaO_WaDaK9iiGoghcmwkmN3H0qmUQ@mail.gmail.com>
Subject: Re: [PATCH RFC 5/5] media: imx219: Add status polling using .detect()
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Maxime Ripard <mripard@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 16:58, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Mattij
>
> On Thu, 1 Oct 2026 at 13:55, Mattijs Korpershoek
> <mkorpershoek@kernel.org> wrote:
> >
> > Userspace needs to be notified when a sensor connection status
> > changes (e.g. disconnected at boot, then later reconnected) so it can
> > react accordingly.
> >
> > Add periodic polling using a delayed work that calls .detect() every
> > 2s and sends a KOBJ_CHANGE uevent with HOTPLUG=1 on status changes.
> > This mirrors the approach used by DRM connectors in output_poll_execute().
>
> AIUI DRM polls from within the framework (drm_probe_helper.c), not by
> a workqueue in the individual drivers.
>
> Admittedly V4L2 doesn't currently have a totally obvious place to
> setup this, but it would be far less effort to have the polling
> framework within the core code rather than driver.
> Possibly initialised in __v4l2_async_register_subdev_sensor() based on
> whether .detect is set, and cleaned up in
> v4l2_async_unregister_subdev, with the workqueue calling .detect and
> generating the udev event based on the return value? I think that's
> feasible.

2 followup thoughts:

1 - This rather defeats pm_runtime_autosuspend.
The sensor will be powering up and down for every detect call, which
may or may not be within the autosuspend time. A grep for
pm_runtime_set_autosuspend_delay in the current tree gives mainly 1
second, but video-i2c uses 2 seconds, and vd55g1 uses 4 seconds.
If the regulator has a startup delay defined, it'll be slowing down
your polling.

DRM hotplug polling is at 10 second intervals.
Assuming that enable_streaming triggering power_on reports the error,
then your application always has to handle that failure mode, so a
larger poll interval isn't a big issue.

2 - if the sensor has a privacy LED connected to the power rail, it'll
be blinking away with every poll. We've already got folks worrying
about that blink during probe, but it's now become 100 times worse.
This polling process likely needs to be opt-in based on use-case,
either through some configuration parameter, or possibly by the first
call to VIDIOC_SUBDEV_G_CONNECTION_STATUS starting the process.

  Dave

>   Dave
>
> > Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> > ---
> >  drivers/media/i2c/imx219.c | 40 ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index e198d3fe99c6..76e578a8eab5 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/i2c.h>
> >  #include <linux/minmax.h>
> >  #include <linux/module.h>
> > +#include <linux/workqueue.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/regulator/consumer.h>
> >
> > @@ -374,6 +375,9 @@ struct imx219 {
> >
> >         /* Two or Four lanes */
> >         u8 lanes;
> > +
> > +       struct delayed_work detect_work;
> > +       enum v4l2_subdev_connected_status_whence detect_status;
> >  };
> >
> >  static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
> > @@ -1252,6 +1256,35 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
> >         return ret;
> >  }
> >
> > +#define IMX219_DETECT_INTERVAL_MS 2000
> > +static void imx219_detect_work(struct work_struct *work)
> > +{
> > +       struct imx219 *imx219 = container_of(work, struct imx219,
> > +                                            detect_work.work);
> > +       struct v4l2_subdev_connected_status status = {};
> > +
> > +       /*
> > +        * All async notifiers should have been run before
> > +        * we can use sd.devnode
> > +        */
> > +       if (!imx219->sd.devnode)
> > +               goto reschedule_detect_work;
> > +
> > +       imx219_detect(&imx219->sd, &status);
> > +
> > +       if (status.status != imx219->detect_status) {
> > +               struct device *dev = &imx219->sd.devnode->dev;
> > +               char *envp[] = { "HOTPLUG=1", NULL };
> > +
> > +               imx219->detect_status = status.status;
> > +               kobject_uevent_env(&dev->kobj, KOBJ_CHANGE, envp);
> > +       }
> > +
> > +reschedule_detect_work:
> > +       schedule_delayed_work(&imx219->detect_work,
> > +                             msecs_to_jiffies(IMX219_DETECT_INTERVAL_MS));
> > +}
> > +
> >  static int imx219_probe(struct i2c_client *client)
> >  {
> >         struct device *dev = &client->dev;
> > @@ -1334,6 +1367,11 @@ static int imx219_probe(struct i2c_client *client)
> >         pm_runtime_set_autosuspend_delay(dev, 1000);
> >         pm_runtime_use_autosuspend(dev);
> >
> > +       imx219->detect_status = V4L2_SUBDEV_STATUS_UNKNOWN;
> > +       INIT_DELAYED_WORK(&imx219->detect_work, imx219_detect_work);
> > +       schedule_delayed_work(&imx219->detect_work,
> > +                             msecs_to_jiffies(IMX219_DETECT_INTERVAL_MS));
> > +
> >         return 0;
> >
> >  error_subdev_cleanup:
> > @@ -1355,6 +1393,8 @@ static void imx219_remove(struct i2c_client *client)
> >         struct v4l2_subdev *sd = i2c_get_clientdata(client);
> >         struct imx219 *imx219 = to_imx219(sd);
> >
> > +       cancel_delayed_work_sync(&imx219->detect_work);
> > +
> >         v4l2_async_unregister_subdev(sd);
> >         v4l2_subdev_cleanup(sd);
> >         media_entity_cleanup(&sd->entity);
> >
> > --
> > 2.55.0
> >
