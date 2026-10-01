Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C0B42E8F4
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870357; cv=pass; b=cDrL2EF95QIByHYHRgu0NIhNTf6l3xkj7O6Bx1s79eCV7tFf89nkO84RHyKC7cFWRQWHDHk4NlYt36NXnOFSzRvAKrOFJCXA7wXPdbBLjZQnBT1AaS5cqwxszHrHMOyuEZvjiHP0DfyU4X5OkXZToRR1wOwWMbcc+evd1aHC9yU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870357; c=relaxed/simple;
	bh=xGRVRG3bANziLbbWfgLCs1dTAw7UUNAdO1KbQXxklMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D6/KebE+7eTcP9vYMeKjvoL8zm2foPxIaNQ52inYzKyBdHLrGOMXWem4xB9mnxVML+vam6LeSWTJ1rEcOhlvD3Ef+DcwukCsdaO+Y95qp+W+DU8wbxCJnVdkHY4ORVvQ4OtZh5WdJOfD56Fq5KYVG3cjfaIqfqebr8IUw/SwIfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=GVmnq3n0; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="GVmnq3n0"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4c2c368cb3bso3296334b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790870354; cv=none;
        d=google.com; s=arc-20260327;
        b=BMyxblxA81HIxf65HHZvcYWtSjzCDo5rSaSe5M4GKRGnRtIHPaLQnUWeoNhKCbY/S2
         mBeUbTCm795ouYD/peU9xz8TuYcnAvWBPjzHYf/89s7KQKVoNYW1OfoHW9Q9QTnivcId
         JKelDu705EPsmyKLYTmr1yzmJVq6j3c1KLR7/06n/aRktOnde5gNalEZ4t5mIaUNTNXN
         ioFHSdwjqWLGt0n5FeN+6b/aenylqT0KFWr8q5WPYDbBVwvHOVMT5a2ZYRaT7uYi7yoA
         zQ7lDEfFXFJD6Oj8rUvZJETO9/Xxu6+aQcV4WJEcJKI2d2mWXnynOtVlmotBH62k4UP5
         4EhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gGXBtD5i3iEOjYjdpDLSyJG8vr5d+zCegcbbH2xRJZs=;
        fh=HOEjbV6mOi3oPXb0U/gn/op67+cMSqhCQA1gsYxyGIA=;
        b=TJItRfnWlzm6uKFKox7HxmPna5IvC+t/hIcuk5JVwbveoTJABlE0efzvZFUhVFvSs8
         GwjFYdpxIWzUwGYIsGh6gFpxahTuZ+Lmt0ZeJVNeJw8pGAu4rXZtY3yG+jgIyKBGZsqJ
         Hesf4D9Nt3saRvf9CuoFu4YU3Alznb81D725FztCgecStC6SNtgclGlxFFept1uLjzSL
         oCl+tZukQhv3sN95i0xpPPJlQBfNBvoYfPsduCaMVfXsmloMehC4rTphitPsl4IH1iZZ
         Fp/h1fArCbnzTx304peJWYaJO/pT/98/dzqVzflOElFJYSZhmdm++nYwMKDwoWbF3aQS
         xBmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790870354; x=1791475154; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gGXBtD5i3iEOjYjdpDLSyJG8vr5d+zCegcbbH2xRJZs=;
        b=GVmnq3n0yltosIrzzqEj+0hfboI1DxdmygcIxnKE1OAyLWK4SGPfxzx6do5lpD2O99
         7tzsj24lXremONEgd7lGsqztCjTgJ+ql8QeFTBu1mbk53SZ3gDNdAFVbjWZ4bi3yjSI7
         U41nvGmopyWHPTG5WWsQ5FCgOghT7WSEjBAyzkutDA78ZrOzg5YfuqPpiWL/X2H+dNZR
         fO44KcV3mxsOLxWDwOTs3sN++jl2lhGW5FwUJ7TernKfYNoDvBD33eagwV0YLwkMBef7
         vsvNKoBbZhcINWh+z6qeRZAhBjtmY0+NMFwmNa2pP9iFQ9x6H+UwW9YhYqWj9WazAxgS
         0Ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870354; x=1791475154;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gGXBtD5i3iEOjYjdpDLSyJG8vr5d+zCegcbbH2xRJZs=;
        b=YUmG9nOQcw90Kcfe3qDQl2k2EYDgQZfwHQvrYwLWud5PoF6QtciX9RaOido+t8Z1ti
         V69iiTYU2Vgdx4tSzaH8TDlZ4r3l7m0JsKd0XBkSoHp+x0MiY5RVROdRb+7Iu9O08jTy
         uJKM5t5pbRxxF4YQcyZPBvnASml2/PsDKT7Tyc3WWs0GONQeuzmd+nzyminhhjUr5yR7
         pbnuNM0dwczDC39z+jmKXRaaTI+ukd2UYcZUrz/6qzQTyyCO68CwiDN+lhhBSertL163
         KLP5kntrB02MgeB/gb1XXa4XjsQCrvJz93pwiyCv959GO97VGqkQ80GAHq3mImTjDixV
         PZ1A==
X-Forwarded-Encrypted: i=1; AKwUvBwxVu3SrjCTbiMNiXOqVFh8NS4/LQgOaO5ZoyutZoN6cDPXq3lJHmxCD4mTJu0fu+Rjy9V6K4kpY54KufI=@vger.kernel.org
X-Gm-Message-State: AFuF++lKfs6EjXbSOm5It0y9DIbFEuXcEN1rSD+9xt+JR3TOTr+Azhdw
	TtSADLrwOXEgZ1y+0N3rgD4slSoSC14DZfWbvhRMYCjYGDTTp6SukIB0I5ILRf8S4TZH1hGQQgl
	NHjCc/b4qEDibwcpLma+lvy3yrF6FIECKE9TpxVLSWg==
X-Gm-Gg: AYBFou1s15cN3DGefHXTt9F3Hk7PVZwkwRPKr8jr1fnKN42C8IPLregYGTPJ6y9EuFb
	Lj1ze/7tGi9RRfW2H3YDOjzJ4M0lia87dEm4tcvXPbOEcGUe2kUwJdQI69FKmlmWciAAAY66a0e
	LRaEx9SghYzai62gXspA1ZLOucKYNA2cVpy2CHd5gkuKSg9aAlZY7woVKHTNe06vwwuv8Q5cooj
	HBJN370HX/d9mZjQCmkljBTdRHvc1yrRvBf3ukKweXB368UTYuoziccL44ffOAnSr4klBzKAQLj
	bo2dK5qzDDkow4gAnIv/a/MXYbNbqf0zmYfwgaoD/eB1vgeqs5NDigA7oOPLhwvmugNd+IlApEf
	oExmkO28uH59GJjt0c3sOJZrZwyyko3Zpig4rbPD5Td5FS/I030SqqBkipcQaJrnfVY8ilYck
X-Received: by 2002:a05:6808:4497:b0:4e8:18ee:eb4d with SMTP id
 5614622812f47-4f1b5fcd0afmr5535366b6e.20.1790870353757; Thu, 01 Oct 2026
 08:59:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org> <20261001-v4l2-sensor-detect-v1-5-a45993be17b8@kernel.org>
In-Reply-To: <20261001-v4l2-sensor-detect-v1-5-a45993be17b8@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 1 Oct 2026 16:58:57 +0100
X-Gm-Features: AclHuK_Yf9QyrCc0iJsQd3RXKlqA6IRw77W3fZK_Zobo9ZJVh5iTB54WTG55uA4
Message-ID: <CAPY8ntCBcUXte5pAG+i0SRNC-z6GOjakfgGLjDm7D=z91A3uhg@mail.gmail.com>
Subject: Re: [PATCH RFC 5/5] media: imx219: Add status polling using .detect()
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Maxime Ripard <mripard@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mattij

On Thu, 1 Oct 2026 at 13:55, Mattijs Korpershoek
<mkorpershoek@kernel.org> wrote:
>
> Userspace needs to be notified when a sensor connection status
> changes (e.g. disconnected at boot, then later reconnected) so it can
> react accordingly.
>
> Add periodic polling using a delayed work that calls .detect() every
> 2s and sends a KOBJ_CHANGE uevent with HOTPLUG=1 on status changes.
> This mirrors the approach used by DRM connectors in output_poll_execute().

AIUI DRM polls from within the framework (drm_probe_helper.c), not by
a workqueue in the individual drivers.

Admittedly V4L2 doesn't currently have a totally obvious place to
setup this, but it would be far less effort to have the polling
framework within the core code rather than driver.
Possibly initialised in __v4l2_async_register_subdev_sensor() based on
whether .detect is set, and cleaned up in
v4l2_async_unregister_subdev, with the workqueue calling .detect and
generating the udev event based on the return value? I think that's
feasible.

  Dave

> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> ---
>  drivers/media/i2c/imx219.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index e198d3fe99c6..76e578a8eab5 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -20,6 +20,7 @@
>  #include <linux/i2c.h>
>  #include <linux/minmax.h>
>  #include <linux/module.h>
> +#include <linux/workqueue.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>
> @@ -374,6 +375,9 @@ struct imx219 {
>
>         /* Two or Four lanes */
>         u8 lanes;
> +
> +       struct delayed_work detect_work;
> +       enum v4l2_subdev_connected_status_whence detect_status;
>  };
>
>  static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
> @@ -1252,6 +1256,35 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
>         return ret;
>  }
>
> +#define IMX219_DETECT_INTERVAL_MS 2000
> +static void imx219_detect_work(struct work_struct *work)
> +{
> +       struct imx219 *imx219 = container_of(work, struct imx219,
> +                                            detect_work.work);
> +       struct v4l2_subdev_connected_status status = {};
> +
> +       /*
> +        * All async notifiers should have been run before
> +        * we can use sd.devnode
> +        */
> +       if (!imx219->sd.devnode)
> +               goto reschedule_detect_work;
> +
> +       imx219_detect(&imx219->sd, &status);
> +
> +       if (status.status != imx219->detect_status) {
> +               struct device *dev = &imx219->sd.devnode->dev;
> +               char *envp[] = { "HOTPLUG=1", NULL };
> +
> +               imx219->detect_status = status.status;
> +               kobject_uevent_env(&dev->kobj, KOBJ_CHANGE, envp);
> +       }
> +
> +reschedule_detect_work:
> +       schedule_delayed_work(&imx219->detect_work,
> +                             msecs_to_jiffies(IMX219_DETECT_INTERVAL_MS));
> +}
> +
>  static int imx219_probe(struct i2c_client *client)
>  {
>         struct device *dev = &client->dev;
> @@ -1334,6 +1367,11 @@ static int imx219_probe(struct i2c_client *client)
>         pm_runtime_set_autosuspend_delay(dev, 1000);
>         pm_runtime_use_autosuspend(dev);
>
> +       imx219->detect_status = V4L2_SUBDEV_STATUS_UNKNOWN;
> +       INIT_DELAYED_WORK(&imx219->detect_work, imx219_detect_work);
> +       schedule_delayed_work(&imx219->detect_work,
> +                             msecs_to_jiffies(IMX219_DETECT_INTERVAL_MS));
> +
>         return 0;
>
>  error_subdev_cleanup:
> @@ -1355,6 +1393,8 @@ static void imx219_remove(struct i2c_client *client)
>         struct v4l2_subdev *sd = i2c_get_clientdata(client);
>         struct imx219 *imx219 = to_imx219(sd);
>
> +       cancel_delayed_work_sync(&imx219->detect_work);
> +
>         v4l2_async_unregister_subdev(sd);
>         v4l2_subdev_cleanup(sd);
>         media_entity_cleanup(&sd->entity);
>
> --
> 2.55.0
>
