Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794915063;
	b=AQpF/BlRfKo+brAaufT69p5qNtnTpLi3jurwaEfICy7OJa5ULZ4fBB/cneTaZm9ALfvk
	 eaaTaD8K1awvPCBWY/QuENyCIxhNXPaUio9BqsX2FL0mQBDDnbcgXZ76VQ+E0Xa6iEkqZ
	 /FAgEryzuLMDtxfRaAKRQAiADbm5zDfjr//WK5YNJTQbSdiRhrNhyNLNzXf484n30epGy
	 KpUK898k667nRHAn3tTirD0zoWAytlqhG/5Ck+7VFvVHe66Ex8qie8bHbeOVrDqHsCpcU
	 CXGLApZL4fp9ZlXRZ9XTwgnoRMwcxYkHNKrcbyZ6h01SB489Rh+eNzfGs+ckELuvjcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sHqTog/ne1tIAODWoueABoMI9y3MVejv4Wup7ITBtxs=;
	b=P2BBjOmfL30iIjZFTFpRErWclw2SmfV94eYIXQf5FycmS4lhbI9VUEscNUWG2cXMmktN
	 TnjXT4Ivga9TZIPjXaox/fQVBhpGQ1xmKYt+GFERI46BBY3i4+Gaw2ixLOitNHFG9fabX
	 e79RwH4RAf4xuMz1KKknmNlcXn4MqZv7fk6y9I9dD6DnaO+k5SUlorXWTR9PoJyAShQOr
	 cpc+zBYxe5afQLUZO48sxXNnOEDk1Hk7gO6J3cC63jClSJHpEiG9oOcpnSQ2+ke2Ae0l4
	 RZW30fQDZ47XU4s9qYROyb02lYqhG2TmYm19pST62HUpPc91JIjyprnbEmd0bJxMzSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EwIoUr8d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF43606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EF43606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EwIoUr8d
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so6701444a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:31:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794915062; cv=none;
        d=google.com; s=arc-20260327;
        b=Xcn8t2i53H+KJlxXd/ix12uau3d7TwUZRIn/PoLkwU4i636U9hq3pKhlhTbAlhQor3
         Cfuio1jdqD4WMzE2EN75aHuSorcJtX+029oOh95eACBVYTzoPnpOaJtLkAj/hyfH2gfU
         wadDON57osWXmd3hOIIYO+Zwd8iHdtBQV38P+CcuMQME9XoWeEo9NVqc/hW6pN4NxI1a
         abnMMei0qEGqLtvt7EpuzG64kzgkLWdskDd7RxSTAKo3nJaIuCNQZGWHP0NBY4CO1BVw
         7AFIjL5DTpmNs+ljjmTbdaWMVjTHTM74I4hvP4VmzhUt0+w+2Hl+Vu3uO4anSYTQumUo
         5UVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sHqTog/ne1tIAODWoueABoMI9y3MVejv4Wup7ITBtxs=;
        fh=cEizX5k48eURgN21ENbJjlyV+OVBtf87wapqBIDenyQ=;
        b=amhyh1P8VlGQnf7cJBkm2idPYQcuY/90wjcd8cgpFX7de9KG7nOqBKRYAqS+hucsdD
         RvanWMmCWUjx1VyCg4vCVtqEMfDK0dwevYHC/cjqFrF8sr3nnktBZV2SH3y7ZVocWJFW
         /MHWnwzvfTDMhOJ8xlZpvMxSGZDCvFZ7vOvzgOiVEaYU/6apZErsmosVDtk0eq1Gf+wn
         kX+I9b8W+EeTVO9JTp/W6gSYtLEtnFI7oNpmJ73mjUWa6+n7btAHhkqlqCDuIMZZ7B43
         f1WdyADYYRF+D6f/j7yMWkarDpTEmCMCddeaov8XkzB74rSP0OVtNw24BIsSDF9iwIwx
         0ApA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915062; x=1795519862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sHqTog/ne1tIAODWoueABoMI9y3MVejv4Wup7ITBtxs=;
        b=EwIoUr8dYX5uu2QBYSJJWAL7KC8VxBwQlezHVA7WcEJDGlOfNIo8aMgev/cvmDDr+3
         yxwOPTyImz5SLnJlmKhfv6Wu9jeInPZ2Z8kKoAMudYHa3UjlCNEsjLUX8i7ko1sCnBO/
         UX9o9Q4bh6WWgRYqqjsRMFIGPekA44Tpx9mJKsrWnjnlC78OVgqVO+4A76KMqRk6di/G
         g6oznk4Yxu1e8GS6tJsiEtu2QVVrRxAv/1MONqENUPkUVNI5iBSUqdBh9V5E0m9ikqKq
         zp9NxfampMxxsKFeE/zM3yOJlyYmDdSdh7Nubr9CV3a7IbAqA6apkjbyTDGA8c3rTde3
         YU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915062; x=1795519862;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHqTog/ne1tIAODWoueABoMI9y3MVejv4Wup7ITBtxs=;
        b=sThTkwXIV/z3T2H84ty/7kT9MD93t34lO2t1m1vsAiDxAyBhSRfPzzEkSGgLI6mINg
         ptY7xgFc7S9EKwDk/xqu6DZxEvdzZ5zLvplUzPf84cxvqvoh76zQHulGvemg0Xd41TML
         B31ew290zTo3GltNxbXgGQXm/3RkCR+k9usoQvfARye3e1ZWGj3fCYUZ5qjt/+VAGQ3s
         LViuu04POtA1+vakYZEu42nFXLOEHKHlbPpvXiuaO18YSg3ZBt0georP+/zyk+G+ClcU
         3j6KxJqLApU+3ZTCTylYTx5EheCwsgD79Uthby3Epo2bb511BIeKwhLWzbZtN6HTpYXp
         k6TQ==
X-Forwarded-Encrypted: i=1; AL+hErG7YLVQ9pjKEdfjf087xXdBJ//leAtxpPAlvitTl5aiQLaLYiYkfIhbxL+vMq2uJNpQisyBPKaH2v4xY6o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qNuNL3kWXh8cEdBmzayStroRqiPfIJtuNwaO5MwXMs39KbsT/
	RQR73PXKfkHW1l5+FAdh1kObN2eZUmeiUgxaULnIKOalLRVBHurQ7ZkUK5DXOfsARNTKxJzLfA5
	HqRKwQPcrGlHgEVpAmr1kDARYuxe5Ckw=
X-Gm-Gg: AYBFou3mxtX+Ui0DgA2wRp+e/1Lmy+TchU00ABK4JE40eDP1obTnkhy28QrkfMQGT18
	SXjjoC7fYSrDNyNHvz/BjR4jD7237rfsQeGnzk5TXndjqo4Qlkwvf5qDH1rbn8++prfelWHiUFV
	wC3VMixMIvF1OxozLZbqvGD7ZpxWDThr8WobMitbv5sWK6H46Dab6SpvzngKDaBGKurmPl2Ritk
	dAZ/4DqKgYjGMs1dEhOdwPs4rW04G/okXqBKyuOQ7zZbp0CBhiwVeozikaEnQYVyqr2aKb6EBlW
	gLxnUDxP8vijEwruoBYSlPfSQc1wkQ35P4wVi8Un9XaQ+oM5AAPIJwHJE+XdkNX7RbDTDI0eiEl
	U2FzAVMCmWe3pk9VJ1rK14uP4Ls+hWsEZbARKGn5hK3cUbU7WMPzwOIw1NIA2hqmPqP+KFwAq7i
	l8RdQVZeeICodR1NE7nGk2+IE=
X-Received: by 2002:a05:6402:13d2:b0:6b7:e902:5e23 with SMTP id
 4fb4d7f45d1cf-6b7e9026013mr7246878a12.33.1794915061458; Tue, 17 Nov 2026
 03:31:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com> <20261116-marvel-env-v2-7-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-7-ef614eb2e7f1@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 12:30:49 +0100
X-Gm-Features: AclHuK-3AQWyEuEmPx6s_0GtAb_wBlE9MGdQYNlj8Y9ExHWDtBYm7MfD4viHzqc
Message-ID: <CA+=Fv5SHxQq+Fx3hiKdw4_eTw1nP0_Hf7L7rHXJOnzyigi472w@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] hwmon: (marvel-env) Notify userspace of
 environmental events
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Nov 17, 2026 at 3:59=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> The firmware reports each change of a sensor's state as a system event
> machine check. On one, reread every node from a workqueue and notify
> userspace of each alarm attribute whose value changed. The notifier runs
> in machine check context, so it only queues an irq_work, which queues
> the work. The work takes the hwmon device lock to serialize the refresh
> with the sysfs callbacks.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  Documentation/hwmon/marvel-env.rst |  4 ++
>  drivers/hwmon/Kconfig              |  1 +
>  drivers/hwmon/marvel-env.c         | 89 ++++++++++++++++++++++++++++++++=
++++--
>  3 files changed, 90 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/hwmon/marvel-env.rst b/Documentation/hwmon/mar=
vel-env.rst
> index 7e0457a60094..ae3edda557ab 100644
> --- a/Documentation/hwmon/marvel-env.rst
> +++ b/Documentation/hwmon/marvel-env.rst
> @@ -27,6 +27,10 @@ A refresh keeps the boot CPU in the console with inter=
rupts disabled for up
>  to 300 ms per unit, so a unit is refreshed at most once every
>  ``update_interval`` milliseconds (10000 by default).
>
> +The firmware also reports every change of state as a system event machin=
e
> +check. When one arrives, the driver refreshes all units and notifies
> +userspace through the alarm attributes.
> +
>  Sysfs entries
>  -------------
>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index c0ce5591c82d..99c5d84c8752 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1258,6 +1258,7 @@ config SENSORS_MACSMC_HWMON
>  config SENSORS_MARVEL_ENV
>         tristate "Marvel (EV7) AlphaServer environmental sensors"
>         depends on ALPHA_MARVEL || (ALPHA_GENERIC && !ALPHA_LEGACY_START_=
ADDRESS)
> +       select IRQ_WORK
>         help
>           If you say yes here you get support for the temperature, fan,
>           voltage and power supply sensors of Marvel AlphaServers (the
> diff --git a/drivers/hwmon/marvel-env.c b/drivers/hwmon/marvel-env.c
> index e501e049d702..d319556929e3 100644
> --- a/drivers/hwmon/marvel-env.c
> +++ b/drivers/hwmon/marvel-env.c
> @@ -17,12 +17,15 @@
>   */
>
>  #include <linux/hwmon.h>
> +#include <linux/irq_work.h>
>  #include <linux/jiffies.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/notifier.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> +#include <linux/workqueue.h>
>
>  #include <asm/gct.h>
>  #include <asm/marvel_env.h>
> @@ -94,16 +97,21 @@ struct marvel_env_chan {
>         unsigned int pkt;               /* packet offset in the node */
>         bool ps;                        /* power supply, as an in channel=
 */
>         bool present;                   /* known when the driver loaded *=
/
> +       u32 alarms;                     /* alarm attributes last reported=
 */
>         char label[32];
>  };
>
>  struct marvel_env_data {
>         struct device *dev;
> +       struct device *hwmon;
>         unsigned int update_interval;   /* ms */
>         struct marvel_env_node *nodes;
>         unsigned int nr_nodes;
>         struct marvel_env_chan *chans[hwmon_max];
>         unsigned int nr_chans[hwmon_max];
> +       struct irq_work irq_work;
> +       struct work_struct work;
> +       struct notifier_block nb;
>  };
>
>  static const char * const pe_names[] =3D {
> @@ -290,6 +298,7 @@ static void marvel_env_add_chan(struct marvel_env_dat=
a *data,
>         c->ps =3D ps;
>         status =3D marvel_env_status(type, c);
>         c->present =3D env_status_valid(status);
> +       c->alarms =3D marvel_env_alarms(type, c, status);
>
>         if (n->cabinet || n->drawer)
>                 len =3D scnprintf(c->label, sizeof(c->label), "Cab%u Dra%=
u ",
> @@ -512,6 +521,72 @@ static u32 marvel_env_config(enum hwmon_sensor_types=
 type,
>         }
>  }
>
> +/* Reread everything after a system event and report changed alarms. */
> +static void marvel_env_event_work(struct work_struct *work)
> +{
> +       struct marvel_env_data *data =3D
> +               container_of(work, struct marvel_env_data, work);
> +       unsigned int i, k;
> +
> +       guard(hwmon_lock)(data->hwmon);
> +
> +       for (i =3D 0; i < data->nr_nodes; i++) {
> +               data->nodes[i].valid =3D false;
> +               marvel_env_refresh(data, &data->nodes[i]);
> +       }
> +
> +       for (k =3D 0; k < ARRAY_SIZE(marvel_env_types); k++) {
> +               enum hwmon_sensor_types type =3D marvel_env_types[k];
> +
> +               for (i =3D 0; i < data->nr_chans[type]; i++) {
> +                       struct marvel_env_chan *c =3D &data->chans[type][=
i];
> +                       unsigned long changed;
> +                       unsigned int attr;
> +                       u8 status;
> +                       u32 alarms;
> +
> +                       if (!c->present)
> +                               continue;
> +                       status =3D marvel_env_status(type, c);
> +                       if (!env_status_valid(status))
> +                               continue;
> +                       alarms =3D marvel_env_alarms(type, c, status);
> +                       changed =3D alarms ^ c->alarms;
> +                       c->alarms =3D alarms;
> +                       for_each_set_bit(attr, &changed, 32)
> +                               hwmon_notify_event(data->hwmon, type, att=
r, i);
> +               }
> +       }
> +}
> +

This covers crit_alarm, fan_fault and the supplies' in_fault, and the
supply test on the ES47 exercises it end to end. Thanks.

> +static void marvel_env_irq_work(struct irq_work *irq_work)
> +{
> +       struct marvel_env_data *data =3D
> +               container_of(irq_work, struct marvel_env_data, irq_work);
> +
> +       schedule_work(&data->work);
> +}
> +
> +/* Runs in machine check context, so only queue the irq_work. */
> +static int marvel_env_event(struct notifier_block *nb, unsigned long act=
ion,
> +                           void *unused)
> +{
> +       struct marvel_env_data *data =3D
> +               container_of(nb, struct marvel_env_data, nb);
> +
> +       irq_work_queue(&data->irq_work);
> +       return NOTIFY_OK;
> +}
> +
> +static void marvel_env_unregister(void *arg)
> +{
> +       struct marvel_env_data *data =3D arg;
> +
> +       atomic_notifier_chain_unregister(&marvel_env_notifier, &data->nb)=
;
> +       irq_work_sync(&data->irq_work);
> +       cancel_work_sync(&data->work);
> +}
> +
>  static const struct hwmon_channel_info * const marvel_env_chip_info =3D
>         HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL);
>
> @@ -522,7 +597,6 @@ static int marvel_env_probe(struct platform_device *p=
dev)
>         const struct hwmon_channel_info **info;
>         struct marvel_env_data *data;
>         struct hwmon_chip_info *chip;
> -       struct device *hwmon;
>         unsigned int i, k, nr_info =3D 0;
>
>         data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> @@ -591,9 +665,16 @@ static int marvel_env_probe(struct platform_device *=
pdev)
>         chip->ops =3D &marvel_env_ops;
>         chip->info =3D info;
>
> -       hwmon =3D devm_hwmon_device_register_with_info(dev, DRVNAME, data=
, chip,
> -                                                    NULL);
> -       return PTR_ERR_OR_ZERO(hwmon);
> +       data->hwmon =3D devm_hwmon_device_register_with_info(dev, DRVNAME=
, data,
> +                                                          chip, NULL);
> +       if (IS_ERR(data->hwmon))
> +               return PTR_ERR(data->hwmon);
> +
> +       init_irq_work(&data->irq_work, marvel_env_irq_work);
> +       INIT_WORK(&data->work, marvel_env_event_work);
> +       data->nb.notifier_call =3D marvel_env_event;
> +       atomic_notifier_chain_register(&marvel_env_notifier, &data->nb);
> +       return devm_add_action_or_reset(dev, marvel_env_unregister, data)=
;
>  }
>
>  static struct platform_driver marvel_env_driver =3D {
>
> --
> 2.56.1
>

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
