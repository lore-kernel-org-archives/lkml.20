Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.27.248.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794514694;
	b=nFXJs/Jm1yG3ybT3bfUHuhPrsxUQDDAhdvtKEGaZPzr+++3XTNOmavU4qwJi2b5boF4/
	 p53Vt7+IJSmQc7egKFbyt+aPUBDavoWrScfXKGHPDdhAod+TfENxLo0RQKm3ssoLC8HG7
	 jH9AbdKp8yD8J6jvRHtGG57dQiavDElY1r2JmvUweFq+174F73+wgBnOUMc7ABPp5ArFL
	 ked7WITZ8BEc5dIX1qiOIfeuNsdKkBZCkbiFfZSEaG4qxdjShZijYg50gBRQR+IAaWqQ1
	 spOQX6uw1Tmqqryc9UkEhJfzMByiD8Dh0VS0U4C5YjEt0F01HkySEXurNHJBre1N+Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794514694;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:X-PPP-Message-ID:X-PPP-Vhost:X-Virus-Scanned:
	 X-Virus-Status;
	bh=oCp10RO+jykX6nh8+oWUvgkuTw62mXWM+Aa3/9kcvNA=;
	b=UDer2wqWDN1YNvctPFL5JxEHGcRnWX4G97QTHTXIElfOCupsGcLE+XByB0HJdZkw3eR1
	 5g/EWi6oWgoUoqIuQgU7E0pilGWjXclFu9QG8sj2ZzWKh30TuHdXCQYs4jUqO+eJeHwKS
	 2b9gP1qgsXN86Y6DKuZZu5e14wsErikK4bAnJqcKLkJThzEK2HXSXvDPM91f2s+ec5xtZ
	 fk2HmOm8FqyCYgieJ0D6agCXf8LRrCEsUd8aq+WgSyF3aya282gJLsMqSUp+b7Tvio5rc
	 8ztFS2sS3plfWPN1bptawnljvlq818+DpmM/seqKlAOLnIrtCHH8DHGh0SU8w/Vh5qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=GaHoiUxZ;
	arc=none smtp.remote-ip=37.27.248.198
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A681606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A681606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=GaHoiUxZ
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id B3A174692D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:18:05 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id C6BFF46929
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:18:04 +0200 (EET)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 9BA95202368
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:18:02 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1794514684;
	bh=oCp10RO+jykX6nh8+oWUvgkuTw62mXWM+Aa3/9kcvNA=;
	h=Received:From:Subject:To;
	b=GaHoiUxZaJQlitnJv3qLmaEjZXnhvGnUagcOd8jQsbcai9hrtix+BaagLICNIkVsX
	 AzqL5sFVNOyMlGMtOTwWsK6d3mRYjSaRCGWg506Y+2VMHdqwaBamnZKvgUdENqQT9W
	 gwtX+cN+glhRcK5+UI4p08LOC5S7IPYdFkFKYK5Ch/PkKueMIVjp2wxiwGoGkx2F8x
	 7bOEwfK4IyVCD/yex+4u66pPT2dpvcx7gyTYgVX2k8DJ653Xa5KQbpQBnz300ZLOkO
	 HnofG7/s3/BF9tONpb5KMt0u79zoPA/LS153J8W/T7fUirbdUSMk3pbPpPWp0YO7ek
	 tjN5oCjQfW5NA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.216.52) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj1-f52.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-3b17cf2fa0aso92292a91.0
        for <linux-kernel@vger.kernel.org>;
 Thu, 12 Nov 2026 12:18:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AL+hErFNgMupqHHLP0Mw5lO419nWTCgJatqgm2ZVcdGUNvJtkEgvthmZ1apIBIgAIVpocjQOJGHbnVrSkmFRm3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EpbDf4SjG+TF5cU6eCdg05CX1xquc/9ty1g6/Q8NBHL7s7snr
	peL3WL96srMPnea7m7nTcU0Xyg81zxGtL3/7FRQFQsS8nqVH+kK1k9QYTNXBBpgTD2rI+FriT5v
	OKLpSfkzGm6dDSuRXAB1osVR7SOdjxP4=
X-Received: by 2002:a17:90b:2543:b0:3b1:ae88:5c31 with SMTP id
 98e67ed59e1d1-3b1b0cc9714mr187431a91.43.1794514680813; Thu, 12 Nov 2026
 12:18:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-ayaneo-ec-module-power-v1-1-00d42014bed3@jler.org>
In-Reply-To: <20261112-ayaneo-ec-module-power-v1-1-00d42014bed3@jler.org>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 12 Nov 2026 21:17:49 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEVkdSpY==gBPE4E+10Ggs3zowYGWqjw2p+z1Jh9nNi6g@mail.gmail.com>
X-Gm-Features: AclHuK-BPFs-BFNAjJjl4LREkB81AzejKKi14MW70FR7X1QsXTPuVy5ZVN-Iyhk
Message-ID: 
 <CAGwozwEVkdSpY==gBPE4E+10Ggs3zowYGWqjw2p+z1Jh9nNi6g@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: ayaneo-ec: Restore controller power when
 the modules are refitted
To: lily@jler.org
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?B?TWF0w61hcyBNYXJ0w61uZXo=?= <hello@matias.me>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179451468412.1377401.18121817199971222142@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 12 Nov 2026 at 21:06, lilytaylor42 via B4 Relay
<devnull+lily.jler.org@kernel.org> wrote:
>
> From: lilytaylor42 <lily@jler.org>
>
> On the AYANEO 3, releasing a Magic Module means writing the eject
> command and then turning controller power off. Once the modules are
> fitted again, power has to be turned back on before the controller
> reappears. Today userspace has to watch for that. If nothing is
> running when the modules are refitted, the controller stays off and
> the device has no built-in input.
>
> The EC raises no event when a module is attached or removed, so poll
> the module register while controller power is off. Once a module has
> been taken out and both are attached again for a second, turn the
> power back on, as the vendor's Windows software does. Power turned off
> with both modules left in place stays off. Notify controller_modules
> and controller_power so userspace can poll() instead of re-reading.
>
> The investigation, code and this changelog were produced with an AI
> coding assistant (Claude Code). It decompiled the DSDT and traced EC
> query events to confirm that module changes raise no event, wrote the
> patch, and ran the tests below on my AYANEO 3 while I removed and
> refitted the modules.
>
> Signed-off-by: lilytaylor42 <lily@jler.org>
> ---
> Built in-tree on platform-drivers-x86 for-next (568051916) with W=1 and
> x86_64_defconfig plus AYANEO_EC=m: no warnings before or after.
>
> Tested on an AYANEO 3 (Bazzite 45, 7.3.3 kernel), built as a module
> against the running kernel, with no userspace module handling running:
> after eject and power off, refitting both modules turned power back on
> 1.2 s after both were seated and the controller re-enumerated. Power
> turned off with both modules attached stayed off.
>
> Independent of this patch: after power returns, the controller first
> connects in a state that does not answer GET_DESCRIPTOR and reconnects
> about 11 s later, so enumeration takes ~32 s with the default scheme and
> ~12 s with the port's old_scheme quirk set. That happens with the
> unpatched driver too.

Hi,
this is the responsibility of the program that powered off the
controller. This driver contains no logic for when to power or unpower
the controller. It only provides a hook for userspace to access the EC
addresses required for it.

If this driver was the one to power off the controller this would make
sense. But that's not the case. You used software to eject the modules
and turn off the controller. Therefore, you should expect that
software to decide when to turn on the controller again.

AYANEO_MODULE_SETTLE is especially problematic since you are embedding
logic into the driver about arbitrarily turning on the controller. In
this case, you'd use something like a new abi auto, to decide to turn
on the controller automatically. This would not interfere with current
software that handles polling on its own, such as hhd. But it is a
large code change compared to making the userspace software that
initiated the ejection handle it.

Best,
Antheas

> ---
>  Documentation/ABI/testing/sysfs-platform-ayaneo-ec | 10 ++-
>  drivers/platform/x86/ayaneo-ec.c                   | 90 ++++++++++++++++++++++
>  2 files changed, 99 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-platform-ayaneo-ec b/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
> index 4cffbf5fc..8c70be0c3 100644
> --- a/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
> +++ b/Documentation/ABI/testing/sysfs-platform-ayaneo-ec
> @@ -7,13 +7,21 @@ Description:
>                 the controller power (e.g. for power savings). Write 1 to
>                 turn on, 0 to turn off. File is readable and writable.
>
> +               After power is turned off, the driver turns it back on
> +               once a module has been removed and both modules are
> +               attached again, as the Windows software for this device
> +               does. Power turned off with both modules left attached
> +               stays off. Userspace can poll() this file for changes.
> +
>  What:          /sys/devices/platform/ayaneo-ec/controller_modules
>  Date:          Nov 2025
>  KernelVersion: 6.19
>  Contact:       "Antheas Kapenekakis"  <lkml@antheas.dev>
>  Description:
>                 Shows which controller modules are currently connected to
> -               the device. Possible values are "left", "right" and "both".
> +               the device. Possible values are "left", "right", "both"
> +               and "none". While controller power is off, changes can be
> +               waited for with poll().
>                 File is read-only. The Windows software for this device
>                 will only set controller power to 1 if both module sides
>                 are connected (i.e. this file returns "both").
> diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
> index 7c6a06330..3f89f8f9d 100644
> --- a/drivers/platform/x86/ayaneo-ec.c
> +++ b/drivers/platform/x86/ayaneo-ec.c
> @@ -9,6 +9,7 @@
>
>  #include <linux/acpi.h>
>  #include <linux/bits.h>
> +#include <linux/devm-helpers.h>
>  #include <linux/dmi.h>
>  #include <linux/err.h>
>  #include <linux/hwmon.h>
> @@ -19,6 +20,7 @@
>  #include <linux/pm.h>
>  #include <linux/power_supply.h>
>  #include <linux/sysfs.h>
> +#include <linux/workqueue.h>
>  #include <acpi/battery.h>
>
>  #define AYANEO_PWM_ENABLE_REG   0x4A
> @@ -43,6 +45,13 @@
>  #define AYANEO_MODULE_RIGHT    BIT(1)
>  #define AYANEO_MODULE_MASK     (AYANEO_MODULE_LEFT | AYANEO_MODULE_RIGHT)
>
> +/*
> + * The EC raises no event when a module is attached or removed, so the
> + * module register is polled, and only while controller power is off.
> + */
> +#define AYANEO_MODULE_POLL_MS  500
> +#define AYANEO_MODULE_SETTLE   3       /* polls with both attached before power on */
> +
>  struct ayaneo_ec_quirk {
>         bool has_fan_control;
>         bool has_charge_control;
> @@ -58,6 +67,12 @@ struct ayaneo_ec_platform_data {
>         struct mutex hwmon_lock;
>         bool restore_charge_limit;
>         bool restore_pwm;
> +
> +       /* Turns controller power back on once the modules are refitted */
> +       struct delayed_work module_work;
> +       bool module_removed;
> +       unsigned int module_settle;
> +       u8 module_state;
>  };
>
>  static const struct ayaneo_ec_quirk quirk_fan = {
> @@ -395,11 +410,69 @@ static int ayaneo_remove_battery(struct power_supply *battery,
>         return 0;
>  }
>
> +static void ayaneo_module_watch(struct ayaneo_ec_platform_data *data)
> +{
> +       data->module_removed = false;
> +       data->module_settle = 0;
> +       data->module_state = AYANEO_MODULE_MASK;
> +       queue_delayed_work(system_freezable_wq, &data->module_work,
> +                          msecs_to_jiffies(AYANEO_MODULE_POLL_MS));
> +}
> +
> +/*
> + * While controller power is off, wait for a module to be taken out and
> + * for both modules to be attached again, then turn the power back on.
> + * This mirrors the vendor's Windows software and means a refitted
> + * controller works even when no userspace program is watching. Power
> + * turned off with both modules left in place stays off.
> + */
> +static void ayaneo_module_work(struct work_struct *work)
> +{
> +       struct ayaneo_ec_platform_data *data =
> +               container_of(to_delayed_work(work), struct ayaneo_ec_platform_data,
> +                            module_work);
> +       struct kobject *kobj = &data->pdev->dev.kobj;
> +       u8 power, modules;
> +
> +       if (ec_read(AYANEO_POWER_REG, &power) ||
> +           ec_read(AYANEO_MODULE_REG, &modules))
> +               goto again;
> +
> +       /* Turned back on elsewhere, e.g. by userspace */
> +       if (power == AYANEO_POWER_ON)
> +               return;
> +
> +       modules = ~modules & AYANEO_MODULE_MASK;
> +       if (modules != data->module_state) {
> +               data->module_state = modules;
> +               sysfs_notify(kobj, NULL, "controller_modules");
> +       }
> +
> +       if (modules != AYANEO_MODULE_MASK) {
> +               data->module_removed = true;
> +               data->module_settle = 0;
> +               goto again;
> +       }
> +
> +       if (!data->module_removed || ++data->module_settle < AYANEO_MODULE_SETTLE)
> +               goto again;
> +
> +       if (!ec_write(AYANEO_POWER_REG, AYANEO_POWER_ON)) {
> +               sysfs_notify(kobj, NULL, "controller_power");
> +               return;
> +       }
> +
> +again:
> +       queue_delayed_work(system_freezable_wq, &data->module_work,
> +                          msecs_to_jiffies(AYANEO_MODULE_POLL_MS));
> +}
> +
>  static ssize_t controller_power_store(struct device *dev,
>                                       struct device_attribute *attr,
>                                       const char *buf,
>                                       size_t count)
>  {
> +       struct ayaneo_ec_platform_data *data = dev_get_drvdata(dev);
>         bool value;
>         int ret;
>
> @@ -407,10 +480,15 @@ static ssize_t controller_power_store(struct device *dev,
>         if (ret)
>                 return ret;
>
> +       cancel_delayed_work_sync(&data->module_work);
> +
>         ret = ec_write(AYANEO_POWER_REG, value ? AYANEO_POWER_ON : AYANEO_POWER_OFF);
>         if (ret)
>                 return ret;
>
> +       if (!value)
> +               ayaneo_module_watch(data);
> +
>         return count;
>  }
>
> @@ -518,6 +596,18 @@ static int ayaneo_ec_probe(struct platform_device *pdev)
>                         return PTR_ERR(hwdev);
>         }
>
> +       if (data->quirks->has_magic_modules) {
> +               u8 power;
> +
> +               ret = devm_delayed_work_autocancel(&pdev->dev, &data->module_work,
> +                                                  ayaneo_module_work);
> +               if (ret)
> +                       return ret;
> +
> +               if (!ec_read(AYANEO_POWER_REG, &power) && power == AYANEO_POWER_OFF)
> +                       ayaneo_module_watch(data);
> +       }
> +
>         if (data->quirks->has_charge_control) {
>                 data->battery_hook.add_battery = ayaneo_add_battery;
>                 data->battery_hook.remove_battery = ayaneo_remove_battery;
>
> ---
> base-commit: 5680519168f65666d2c03cc6ed8fe2b7052aee12
> change-id: 20261112-ayaneo-ec-module-power-66f183285f3e
>
> Best regards,
> --
> lilytaylor42 <lily@jler.org>
>
>
>

