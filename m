Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8937F54705F;
	Fri,  2 Oct 2026 08:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930381; cv=none; b=spT5VKEasLu4pVxodyI4jzBWH4apq39SX2JXF/SjNQYJ+MriHvttx7YjnQGh29rJS038gPoXRarVqdeegnBeTxmd2VT/9VGGHigO/PZINpKDZtSY/4T8C//zhFTb2q4yV95B7kMI0X+h8e+kF52qjoGmXT57lYvxbuwGvq3C93Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930381; c=relaxed/simple;
	bh=U5mEEO7//jRDCGUE5hUoApcFl3HfGwW3t1MAS6ozyR8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hGthZ4NQb7TRZU2ErxXoz75wS3e7hm8VkZYXVdWydwTGAzgSDc2QauSvGhUPsPIg6kWpRzW2sLUS2dXjO4X0yEHRj6RtONOxufILg1QlYk1yA6fvd5W+mh1KEy76a2Ws/aF4qMKXoCK6UZPdWUrkadqDKrLv/b70HAsVA6fRNJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQPHMN74; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQPHMN74"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED071F000FF;
	Fri,  2 Oct 2026 08:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790930380;
	bh=+WzlYuPlh9aIo2JdP89X9ehdPidCMSpANGlTybbb3J8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=aQPHMN74Qezi30p5nAIfA2FbeJqw19RLhzkw0/k7ViNQxvhgl5wHkYPj4hmeE4B3A
	 lPl3Gy9Z4qpoeO15BIkVO7mh56s7AVqnFmaC8oq1IK6D6zZiJ0mG3YkSy+K/SNAZJB
	 LgjhbAVcm9HnKYpNcsD5mvCuiBnZhXYRwcz2FhpebAwFwGgTWdpVVHbn1ECtduEf1J
	 /hU4+mzthjkaqVKitkzx8aVu/FPIUUcQZ73K5e7+3GpnoIn0ZeLhKLAmfYIWhDgQ0z
	 iTyXQt7icPyl5T7+SbZ+Jlb87QnmPj8UmdypPy7w5ixvr7Cv5umEO/ZArDPJf0pZmL
	 aTDEFFNrYXgCQ==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Michael Riesch <michael.riesch@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 5/5] media: imx219: Add status polling using .detect()
In-Reply-To: <CAPY8ntC_4UWjR3hPG7E3ORaO_WaDaK9iiGoghcmwkmN3H0qmUQ@mail.gmail.com>
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
 <20261001-v4l2-sensor-detect-v1-5-a45993be17b8@kernel.org>
 <CAPY8ntCBcUXte5pAG+i0SRNC-z6GOjakfgGLjDm7D=z91A3uhg@mail.gmail.com>
 <CAPY8ntC_4UWjR3hPG7E3ORaO_WaDaK9iiGoghcmwkmN3H0qmUQ@mail.gmail.com>
Date: Fri, 02 Oct 2026 10:39:38 +0200
Message-ID: <xhkdbbj9cv6lx.fsf@mkorpers-koolstof.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Oct 01, 2026 at 18:26, Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:

> On Thu, 1 Oct 2026 at 16:58, Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
>>
>> Hi Mattij
>>
>> On Thu, 1 Oct 2026 at 13:55, Mattijs Korpershoek
>> <mkorpershoek@kernel.org> wrote:
>> >
>> > Userspace needs to be notified when a sensor connection status
>> > changes (e.g. disconnected at boot, then later reconnected) so it can
>> > react accordingly.
>> >
>> > Add periodic polling using a delayed work that calls .detect() every
>> > 2s and sends a KOBJ_CHANGE uevent with HOTPLUG=1 on status changes.
>> > This mirrors the approach used by DRM connectors in output_poll_execute().
>>
>> AIUI DRM polls from within the framework (drm_probe_helper.c), not by
>> a workqueue in the individual drivers.
>>
>> Admittedly V4L2 doesn't currently have a totally obvious place to
>> setup this, but it would be far less effort to have the polling
>> framework within the core code rather than driver.
>> Possibly initialised in __v4l2_async_register_subdev_sensor() based on
>> whether .detect is set, and cleaned up in
>> v4l2_async_unregister_subdev, with the workqueue calling .detect and
>> generating the udev event based on the return value? I think that's
>> feasible.
>
> 2 followup thoughts:
>
> 1 - This rather defeats pm_runtime_autosuspend.
> The sensor will be powering up and down for every detect call, which
> may or may not be within the autosuspend time. A grep for
> pm_runtime_set_autosuspend_delay in the current tree gives mainly 1
> second, but video-i2c uses 2 seconds, and vd55g1 uses 4 seconds.
> If the regulator has a startup delay defined, it'll be slowing down
> your polling.
>
> DRM hotplug polling is at 10 second intervals.
> Assuming that enable_streaming triggering power_on reports the error,
> then your application always has to handle that failure mode, so a
> larger poll interval isn't a big issue.

Yes, the 2s was an arbitrary decision from me. It's certainly not set in
stone.
You make a very good point about pm_runtime_autosuspend. I'll increase
to 10s for next version unless someone has a better suggestion

>
> 2 - if the sensor has a privacy LED connected to the power rail, it'll
> be blinking away with every poll. We've already got folks worrying
> about that blink during probe, but it's now become 100 times worse.

Oh, I did not think about that at all. Having the privacy led blinking
every poll would indeed be super creepy.
Thanks for bringing that up.

> This polling process likely needs to be opt-in based on use-case,
> either through some configuration parameter, or possibly by the first
> call to VIDIOC_SUBDEV_G_CONNECTION_STATUS starting the process.

Ack.
I'll look into it for v2.

Thanks a lot for the suggestions.
Mattijs

>
>   Dave
>
>>   Dave
>>
>> > Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
>> > ---
>> >  drivers/media/i2c/imx219.c | 40 ++++++++++++++++++++++++++++++++++++++++
>> >  1 file changed, 40 insertions(+)
>> >
>> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
>> > index e198d3fe99c6..76e578a8eab5 100644
>> > --- a/drivers/media/i2c/imx219.c
>> > +++ b/drivers/media/i2c/imx219.c
>> > @@ -20,6 +20,7 @@
>> >  #include <linux/i2c.h>
>> >  #include <linux/minmax.h>
>> >  #include <linux/module.h>
>> > +#include <linux/workqueue.h>
>> >  #include <linux/pm_runtime.h>
>> >  #include <linux/regulator/consumer.h>
>> >
>> > @@ -374,6 +375,9 @@ struct imx219 {
>> >
>> >         /* Two or Four lanes */
>> >         u8 lanes;
>> > +
>> > +       struct delayed_work detect_work;
>> > +       enum v4l2_subdev_connected_status_whence detect_status;
>> >  };
>> >
>> >  static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
>> > @@ -1252,6 +1256,35 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
>> >         return ret;
>> >  }
>> >
>> > +#define IMX219_DETECT_INTERVAL_MS 2000
>> > +static void imx219_detect_work(struct work_struct *work)
>> > +{
>> > +       struct imx219 *imx219 = container_of(work, struct imx219,
>> > +                                            detect_work.work);
>> > +       struct v4l2_subdev_connected_status status = {};
>> > +
>> > +       /*
>> > +        * All async notifiers should have been run before
>> > +        * we can use sd.devnode
>> > +        */
>> > +       if (!imx219->sd.devnode)
>> > +               goto reschedule_detect_work;
>> > +
>> > +       imx219_detect(&imx219->sd, &status);
>> > +
>> > +       if (status.status != imx219->detect_status) {
>> > +               struct device *dev = &imx219->sd.devnode->dev;
>> > +               char *envp[] = { "HOTPLUG=1", NULL };
>> > +
>> > +               imx219->detect_status = status.status;
>> > +               kobject_uevent_env(&dev->kobj, KOBJ_CHANGE, envp);
>> > +       }
>> > +
>> > +reschedule_detect_work:
>> > +       schedule_delayed_work(&imx219->detect_work,
>> > +                             msecs_to_jiffies(IMX219_DETECT_INTERVAL_MS));
>> > +}
>> > +
>> >  static int imx219_probe(struct i2c_client *client)
>> >  {
>> >         struct device *dev = &client->dev;
>> > @@ -1334,6 +1367,11 @@ static int imx219_probe(struct i2c_client *client)
>> >         pm_runtime_set_autosuspend_delay(dev, 1000);
>> >         pm_runtime_use_autosuspend(dev);
>> >
>> > +       imx219->detect_status = V4L2_SUBDEV_STATUS_UNKNOWN;
>> > +       INIT_DELAYED_WORK(&imx219->detect_work, imx219_detect_work);
>> > +       schedule_delayed_work(&imx219->detect_work,
>> > +                             msecs_to_jiffies(IMX219_DETECT_INTERVAL_MS));
>> > +
>> >         return 0;
>> >
>> >  error_subdev_cleanup:
>> > @@ -1355,6 +1393,8 @@ static void imx219_remove(struct i2c_client *client)
>> >         struct v4l2_subdev *sd = i2c_get_clientdata(client);
>> >         struct imx219 *imx219 = to_imx219(sd);
>> >
>> > +       cancel_delayed_work_sync(&imx219->detect_work);
>> > +
>> >         v4l2_async_unregister_subdev(sd);
>> >         v4l2_subdev_cleanup(sd);
>> >         media_entity_cleanup(&sd->entity);
>> >
>> > --
>> > 2.55.0
>> >
