Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E5F25F988
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788264247; cv=pass; b=YTqZRlsHbpBTEJEQ7Ew9PoabZAam8a6ubVykrTjeZNC+FqiaE8diCZTcQjx+gNRRKIHhoMwY5JtpNmRjcasYb2WwJl2scUtvU3/FaernE1WYASUzihE7ou00k0lhv4QLPMZg5r3StuAMKTM/0ApIs1tDzmi7SL+fSH1Pm4auyUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788264247; c=relaxed/simple;
	bh=4wX95984+0yQBtDcOClZ0inBv6+RRrIe9kyWoLrt8CA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xb+hPiVgSIgwf1SVTXeOQ5TVieXrgwQDjxXBJWRkFe4csQ+EE4kDuT8KYHbH5Np68jNT9oNqNRl5o121npU0GVGnmIqWS87uObwtgfMIljgPz1g1uykX3ztPTjCze5MTJrp7PqgR8Tj2bYwaW/SlPzdJ/3qyltQQM62hy3a/DDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tl/KTB3j; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tl/KTB3j"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so30216011fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:04:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788264243; cv=none;
        d=google.com; s=arc-20260327;
        b=qWwdbag8EAWStl85GOpd4e1KbIGu6HKTR79sTKaY25AbeVhomcj40uRI2Wh7vcgxUa
         /OEXS8QBzb+FARAvmYHz5hAr+LyYrG//Nj4N5GCZxOckAQNRpwCFRKk8q++rJCLli170
         9yGk38Vq4+DW/szfFOo2JPgAOx10VLkOSO0GOJe+pGSYQZfpZZeJ/K56HmTnNw2xE6qC
         0K6C7P7Pw3KbgNTLLpAAz4hq6IIny9z5mwbJtzac7nM4/iHj1gwM77FpmRSpKKMW1Hjy
         hDEG4pKrgaYARiAyHK7ql1EPhcTmRMF86KMBvj5ewF8MJO9Y11hEsX/YVTBAlSTheis0
         puZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sofiRxnEQnW9qdiNAvl3XkRdrOIskc1MiCk8v3PsR+I=;
        fh=x4/ueJg5ExkcK8Q5mQtSs3URJyf9zYZyLVh3hnrvfDA=;
        b=nihPFvpzJN4OxtjPsniPeFhvtdW+DQRA2rGcx4V0R8UZdGoijk+LNgbZ9pU7dYrvQv
         VpsTzKKnk0NkPDPDsMThYaQoYMcekaJJF52Y0G9UUZe8rbL95niLJiK5gFBZE8KKl2Fu
         CtzXghNu/OCDvDEMnrzC4TlxzA98EkT6CnVnxun+fdK4JpvbU5HbwDCHKNDzGVK7dCmx
         2nOCz2kSyhZ+XeE3V0hkYzd3a1v4feMzZ76BrH3RcqkMt82biPosdaIp138E/ybev7U9
         Bvf1TVLUf1AM8uOsZnlVVr81VblNLJmb8vRgcwKFCUGnzcVUis+xPjBUc0ZKtUvxPtUe
         PlrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788264243; x=1788869043; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sofiRxnEQnW9qdiNAvl3XkRdrOIskc1MiCk8v3PsR+I=;
        b=Tl/KTB3jFB9IpDWcykmCUnueumvOV/8OcVp7B3u7JsWN7nuvrvu6Z9tVHDiJqDGzzv
         9S6fplWm3qAC4g2S2GV6nYH0juts6PyZW3BhAyVEzZlapHa7uEqqECfbqBFEqNxNpHbU
         CcxhDmGwzakUkp0ES7o455Gho8FgvcvIHBmNzwg1988XbjY1iGa5sL4sRIOOVB12rbFg
         aAQtq84vMa1f5rLlm4y/2+D71sy3QX+yoZ2XYldk60+K0mHNIBAzDJH81Wc02zoaWu7U
         R0qoXTDVw9bSg+H/8ZEFCSryoTpYqjY/2HzWUKewS/Eu6potxFOcjTtPLMhfUjwhiqrm
         1+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788264243; x=1788869043;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sofiRxnEQnW9qdiNAvl3XkRdrOIskc1MiCk8v3PsR+I=;
        b=sDdQ9osxVvZdlytVlylR333M23zy9xQNGNKfj8LVD7IaoGIJq05A5gAJt8dPoCWphA
         BG1la0iXyDCvSbfNfMOlhjsm6OQ/DDJn1eSW92YWIpIrr2Xd2Mx6kfd1AWc8embQBo89
         KN/N4wObw1Nq3ahqSCW/OS+vSQNnFmjmyWZHhwQlE3ZMYwqtUgEL3Vw3GQw3lea6ippP
         J/Gc8ouL1sjlwH+qEWD435hYkroiX7ahqvtcQrCy92MaYztaZOvdpaYS8N5oUCPltrxc
         /Oa+kMd4EAFpHiT/+x8YPn2+VhFc6j/N5VaDk9VxjsbbSarO3zwiCe+t6xy4DZZaToGB
         3Yzg==
X-Forwarded-Encrypted: i=1; AKwUvBzuV4wlmpHp996Awxv4GlgcMS6CIVQ7XSnx6mrm++5E/YjyUXMEg+kz94y5oh67kSLwCySea4IZ50pBkgk=@vger.kernel.org
X-Gm-Message-State: AFuF++nM3tbUQSSMu9bZFB/A1ppIZmPfq06OK34ihJODMGLfjCwylCaC
	xL6CmMP3W6b0nOYJYqtVbuE1TAebyq0Euz9bxoR1m9At7i3LHmrJKM6JkQC2cchi3c77Zc9vIcO
	EOtuE4jSk5C7m+LbLxKPXuwKgxrTsVMs=
X-Gm-Gg: AYBFou0Lk3+Q0sT4iNiu0SgcmGJdAvGx2zYwM8YK+sHjouYUivtmn0DeItLGhSxE7P7
	5Fh4W7OkKgJ6Olt779qTuZ766Jv8kVvDOF1nZ+hZRbHzlgHgwcV1ommM9qRIjyG76kmwbbaaW6p
	m8Khm9p8sRzX5lPmekXA67QWvOmXUBNE/iLUhhP6tUULm1YVw1XUsCcpp0u6xEw4zxSRVmHLoVE
	wHWFuLnLloOOCSAflNkQUWN95yBi+Tfe1A3KL+TC57kr7I+D9JxIYULcN2jiKNgoh5NZHsN3k78
	yeFferdh4BV2V5HfGIaEhmZGfVHaZHKTlnBcusoUXWkKAJMULwF1qy8k4RTAgztk0FYwwau6zJy
	NL5ZTckVpZ56LEVziuwyPi/vwr51SNkEg/NmKZ4ciSWexVBZXIQ1yRu+NAt2b
X-Received: by 2002:a2e:a7ca:0:b0:3a3:1418:ac70 with SMTP id
 38308e7fff4ca-3a33964aa2dmr14956651fa.10.1788264242504; Tue, 01 Sep 2026
 05:04:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829145516.13500-1-edward.blair@gmail.com>
 <20260829145516.13500-3-edward.blair@gmail.com> <apavoDwVFw_FKRNd@black.igk.intel.com>
In-Reply-To: <apavoDwVFw_FKRNd@black.igk.intel.com>
From: Edward Blair <edward.blair@gmail.com>
Date: Tue, 1 Sep 2026 13:03:50 +0100
X-Gm-Features: AcwNN1UEea8S3wAXLqqHMJokgR8_-cuL_GQ1DBl7z6gMRKRRgcsCI9a3_hBWT7M
Message-ID: <CAJDQNgjq-oxQkdYK+fTSd5AHMjM-qTcSPo+s2-+W=Pcn7jYr-g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] usb: typec: ucsi: add ITE885x I2C transport driver
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, rafael@kernel.org, 
	lenb@kernel.org, mika.westerberg@linux.intel.com, gregkh@linuxfoundation.org, 
	W_Armin@gmx.de, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks,

I will add the explicit includes and use guard(mutex) for event_lock.

I kept the explicit IRQ handling because ucsi_resume() queues work which
issues UCSI commands. If the callbacks are moved to the noirq phase,
that work can run before the parent I2C controller's resume_early or
resume callback, while the controller may still be unavailable.

The current ordering disables the device IRQ before quiescing UCSI, then
re-enables it during normal resumption after the I2C bus has resumed. Does
that address your concern, or would it be preferable the IRQ and UCSI
handling to be split across separate PM phases?

Thanks,
Edward

On Tue, 1 Sept 2026 at 11:57, Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Sat, Aug 29, 2026 at 03:55:16PM +0100, Edward Blair wrote:
> > Add a UCSI transport driver for ITE8853 and ITE8800 through ITE8805
> > USB Type-C controllers found on desktop motherboards.
> >
> > These controllers expose CCI, MESSAGE_IN and CONTROL at ITE-specific I2C
> > offsets and signal UCSI and vendor events through a shared interrupt
> > status register. Read and cache each complete UCSI event before
> > acknowledging it so command data remains coherent between the interrupt
> > handler and UCSI core.
> >
> > The interface does not expose a VERSION register and does not accept
> > PPM_RESET over I2C. Report UCSI 1.0, limit MESSAGE_IN to its 16-byte
> > window and handle PPM_RESET locally, matching the vendor driver's
> > behavior.
> >
> > Signed-off-by: Edward Blair <edward.blair@gmail.com>
> > ---
> >  drivers/usb/typec/ucsi/Kconfig    |  11 +
> >  drivers/usb/typec/ucsi/Makefile   |   1 +
> >  drivers/usb/typec/ucsi/ucsi_ite.c | 395 ++++++++++++++++++++++++++++++
> >  3 files changed, 407 insertions(+)
> >  create mode 100644 drivers/usb/typec/ucsi/ucsi_ite.c
> >
> > diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
> > index 87dd992a4..3819c4f73 100644
> > --- a/drivers/usb/typec/ucsi/Kconfig
> > +++ b/drivers/usb/typec/ucsi/Kconfig
> > @@ -104,4 +104,15 @@ config UCSI_HUAWEI_GAOKUN
> >         To compile the driver as a module, choose M here: the module will be
> >         called ucsi_huawei_gaokun.
> >
> > +config UCSI_ITE
> > +     tristate "UCSI Interface Driver for ITE885x"
> > +     depends on ACPI && I2C
> > +     help
> > +       This driver enables UCSI support on platforms that expose an ITE8853
> > +       or ITE8800-ITE8805 USB Type-C controller over I2C, commonly found
> > +       on ASUS Z690/Z790/X670E motherboards.
> > +
> > +       To compile the driver as a module, choose M here: the module will be
> > +       called ucsi_ite.
> > +
> >  endif
> > diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
> > index c7e38bf01..9bc1d6bbb 100644
> > --- a/drivers/usb/typec/ucsi/Makefile
> > +++ b/drivers/usb/typec/ucsi/Makefile
> > @@ -28,3 +28,4 @@ obj-$(CONFIG_UCSI_PMIC_GLINK)               += ucsi_glink.o
> >  obj-$(CONFIG_CROS_EC_UCSI)           += cros_ec_ucsi.o
> >  obj-$(CONFIG_UCSI_LENOVO_YOGA_C630)  += ucsi_yoga_c630.o
> >  obj-$(CONFIG_UCSI_HUAWEI_GAOKUN)     += ucsi_huawei_gaokun.o
> > +obj-$(CONFIG_UCSI_ITE)                       += ucsi_ite.o
> > diff --git a/drivers/usb/typec/ucsi/ucsi_ite.c b/drivers/usb/typec/ucsi/ucsi_ite.c
> > new file mode 100644
> > index 000000000..16b22c77f
> > --- /dev/null
> > +++ b/drivers/usb/typec/ucsi/ucsi_ite.c
> > @@ -0,0 +1,395 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * UCSI I2C transport driver for ITE885x USB-C controllers
> > + *
> > + * ITE8853/ITE8800-ITE8805 are UCSI-compliant USB-C controllers found on
> > + * desktop motherboards. They communicate over I2C using UCSI registers at
> > + * ITE-specific offsets and signal events through a vendor interrupt register.
> > + */
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/i2c.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
>
> We need to include everything instead of relying on nested headers
> nowadays.
>
>         linux/device.h
>         linux/device/devres.h
>         linux/dev_printk.h
>         linux/pm.h
>         linux/string.h
>
> > +static int ucsi_ite_process_event(struct ucsi_ite *ite, u32 *cci)
> > +{
> > +     u8 message_in[ITE_MESSAGE_IN_MAX_LEN] = {};
> > +     __le32 raw_cci;
> > +     u8 status;
> > +     u8 len = 0;
> > +     int event;
> > +     int err = 0;
> > +     int ret;
> > +
> > +     mutex_lock(&ite->event_lock);
>
> guard(mutex)(@ite->event_lock);
>
> > +     ret = ucsi_ite_read(ite, ITE_REG_INT_STATUS, &status, sizeof(status));
> > +     if (ret)
> > +             goto out_unlock;
> > +
> > +     status &= ITE_INT_MASK;
> > +     if (!status) {
> > +             mutex_lock(&ite->received_lock);
> > +             *cci = ite->cci;
> > +             mutex_unlock(&ite->received_lock);
> > +             ret = ITE_EVENT_NONE;
> > +             goto out_unlock;
> > +     }
> > +
> > +     if (status & ITE_INT_CCI) {
> > +             err = ucsi_ite_read(ite, ITE_REG_CCI, &raw_cci,
> > +                                 sizeof(raw_cci));
> > +             if (!err) {
> > +                     *cci = le32_to_cpu(raw_cci);
> > +                     len = UCSI_CCI_LENGTH(*cci);
> > +
> > +                     if (len > sizeof(message_in)) {
> > +                             len = sizeof(message_in);
> > +                             *cci &= ~GENMASK(15, 8);
> > +                             *cci |= UCSI_SET_CCI_LENGTH(len);
> > +                     }
> > +                     if (len) {
> > +                             err = ucsi_ite_read(ite, ITE_REG_MESSAGE_IN,
> > +                                                 message_in, len);
> > +                     }
> > +             }
> > +     }
> > +
> > +     /* Acknowledge each latched event with the value expected by the PPM. */
> > +     if (status & ITE_INT_VENDOR_ALERT) {
> > +             u8 ack = ITE_INT_VENDOR_ALERT;
> > +
> > +             ret = ucsi_ite_write(ite, ITE_REG_INT_ACK, &ack, sizeof(ack));
> > +             if (ret)
> > +                     goto out_unlock;
> > +     }
> > +
> > +     if ((status & ITE_INT_CCI) && !err) {
> > +             u8 ack = ITE_INT_CCI;
> > +
> > +             ret = ucsi_ite_write(ite, ITE_REG_INT_ACK, &ack, sizeof(ack));
> > +             if (ret)
> > +                     goto out_unlock;
> > +     }
> > +
> > +     if (err) {
> > +             ret = err;
> > +             goto out_unlock;
> > +     }
> > +
> > +     if (status & ITE_INT_CCI) {
> > +             mutex_lock(&ite->received_lock);
> > +             ite->cci = *cci;
> > +             memset(ite->message_in, 0, sizeof(ite->message_in));
> > +             memcpy(ite->message_in, message_in, len);
> > +             mutex_unlock(&ite->received_lock);
> > +             event = ITE_EVENT_CCI;
> > +     } else {
> > +             mutex_lock(&ite->received_lock);
> > +             *cci = ite->cci;
> > +             mutex_unlock(&ite->received_lock);
> > +             event = ITE_EVENT_VENDOR;
> > +     }
> > +
> > +     ret = event;
> > +
> > +out_unlock:
> > +     mutex_unlock(&ite->event_lock);
> > +     return ret;
> > +}
>
> > +static int ucsi_ite_suspend(struct device *dev)
> > +{
> > +     struct ucsi_ite *ite = dev_get_drvdata(dev);
> > +     int ret;
> > +
> > +     disable_irq(ite->client->irq);
> > +     ret = ucsi_suspend(ite->ucsi);
> > +     if (ret)
> > +             enable_irq(ite->client->irq);
> > +
> > +     return ret;
> > +}
> > +
> > +static int ucsi_ite_resume(struct device *dev)
> > +{
> > +     struct ucsi_ite *ite = dev_get_drvdata(dev);
> > +
> > +     enable_irq(ite->client->irq);
> > +     return ucsi_resume(ite->ucsi);
> > +}
> > +
> > +static DEFINE_SIMPLE_DEV_PM_OPS(ucsi_ite_pm, ucsi_ite_suspend,
> > +                             ucsi_ite_resume);
>
> Is the enable/disable_irq really necessary - couldn't you just use
> NOIRQ version of the PM operations (DEFINE_NOIRQ_DEV_PM_OPS)?
>
> Thanks,
>
> --
> heikki
