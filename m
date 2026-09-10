Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE51E568545
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070671; cv=none; b=I8rFq8laFkHkXreeBjtzoVqg/wfQ04ReH1b9xF/4fJYwPzgX89Gt6NwhK3mKIl4rxAwIw1mnY8UbfNpenIXI77X+JYBnMbJa0QSIMWPOraxPbxaAq7MiGKzvF9DjNpxZmkcdY9N7252a3UP2zb+U7CG/Lx3OXRv/ImEVfu9de9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070671; c=relaxed/simple;
	bh=QU7+8PnTUHCyn8hffWhSDUsb7xKb5GiAibGTys1SkwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NNNtx+03X9oqUp201JcCE3E/X/KahyT5M6h8i0XgZjIPyubPoPSd8X0EU8N6gii09YYU/bbglzlo2XohvdJJNOkMYmH8LJHAckwY4CI3yrU35TiA7vs7HmQPsQOnFJgT7jcJs8onawzS+b/RyGRcrSH3wG+r8TnrExGeIuAW02A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1ibWoQV; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1ibWoQV"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so96794f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789070668; x=1789675468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E/CE6O+ApcSVulWPcpwNDxwwPGlzhy7ppFTpXizwwhY=;
        b=P1ibWoQVxkWaamqdVR40P4OcAQz5NoWrO+d+XtpyLbvtmfPvgq2NPtKnudsqlxPtzA
         KfbeDyDlJqavgYmx8FqwqurUXA+Rb/yhRKjJY+QXdGlBF9TChG7yXGPGCrgl6j/Q4Dmr
         Zd1O+rsQGweq+Uj4ozH6/72AXBIctg4hbGG7voRjsAZzL2dp/PFgrcPBHAeXQJeGnP5M
         do4x26oe9oAaUjUhG7S6YNeY3VCWiDPHGaUYPzuLvQvfV6a1So+Jt2Ym5r1Mji0gwEbG
         AZ1xFRNVtCYN3jR4+JQf5QYOgL3R/ZQRhriN7edxg3DSXNJD1oJ7ArQ4opUnRsqZfB0H
         B5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070668; x=1789675468;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E/CE6O+ApcSVulWPcpwNDxwwPGlzhy7ppFTpXizwwhY=;
        b=itgQGvq9yPuq+itMUAzsmroalS2ShQuD2vExvzZ2NdftjeOf5p+HAg5wWhNobJabME
         o8/O4F2ehbUUAWwaoh9AQyh0dC5DvNkKlUdq44aGeq1rzEkaaKLwp5zmW/dpU8X+Qror
         zm9AH41AOpWv9kyWypJSwBh5YRdRIqgoa9caZ7+t7YmCYa5G6tRSVtD+fqZBdvNonLgQ
         NomqEC6Ll/hW6xkQAwGuPvX2u55PDv2QUHIDleosAj++ldTolYV0DZA8e4CacNwOmiAg
         kSN5sJXCASDVaZKtgcCGeHckb9x0mad65TK0CUbiZyb6/LAnRPDDM+ubwPKGyry+hYhf
         S5IA==
X-Forwarded-Encrypted: i=1; AKwUvBxxvrZ6NZ9EcmBYJnPfuDfEp9/w/4VUj+W/lp9mLpb10MHXJwt+fEGMeq4Qfi40HRex0OIkcSoQTV0BYQQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kOk5BjtSZGUxxB6shk/IOBtvSUE+fSDxt5j+d/8JqGbYvvJd+z
	ij7KlNqyU2SVlagNtgmla+6tI05j5MMlwfeFm51D47hampLvBwBTV+AT
X-Gm-Gg: AYBFou0pU7xSAf8+JPFDzLweOZi6riFd8jF3OxefBNiXzW6wxcCgNxOzAUma3T3BKCC
	nw+m1jbRrcvx5cF7FlUlFtq4JwFlz7URmT/j1OF36PfNVlBBiaRybl8zsOok1UQ6EvNFzr7u7l6
	73nF32pCVFFGYLXqNAxbPmAbktbL+d9hBXFewUNdJMP9R7JACG5ZaSafVMkodPyyoGeA1SHeoWD
	bFn8urfWW1xSZQFfitkjvpq2+BtAhdGRWMLmUaEdQS6ZTjmzvksAp78q3mwZKcrSDmycR6RuybB
	hHdfjCJQO6vLFxH3XfM9cXYwP4brIBrjP/rSFIeTFJ1S5tltPI9rO1Q7Ho3xLZDg4uPn1xCvGXj
	CXODhUHwLv94B7lGG0C+1N+qZoIQlXB5KBjlRRf6x+Dxe5Zv8BbaB7Re9dX+viOZ21/mdPB0qs0
	5f/BTqNxMl8je2CcXfSYhEcC3J04DDA+I6/JBwyPTHMrhCB7D9Ii3FaXlZTNknXim5nHUuqRRAZ
	AgZmxmH
X-Received: by 2002:a5d:4112:0:b0:485:877d:ea8e with SMTP id ffacd0b85a97d-486eb31a68emr1055670f8f.14.1789070667850;
        Thu, 10 Sep 2026 13:04:27 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34fdd2sm680631f8f.28.2026.09.10.13.04.25
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 10 Sep 2026 13:04:26 -0700 (PDT)
Date: Thu, 10 Sep 2026 22:04:21 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pierre-Loup Griffais
 <pgriffais@valvesoftware.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, "open list:USB
 SUBSYSTEM" <linux-usb@vger.kernel.org>, Curtis Vogt <curtis.vogt@gmail.com>
Subject: Re: [PATCH 2/3] HID: valve-index: Reboot headset on system power
 transitions
Message-ID: <20260910220421.40356e51.michal.pecio@gmail.com>
In-Reply-To: <20260910170254.833871-3-mario.limonciello@amd.com>
References: <20260910170254.833871-1-mario.limonciello@amd.com>
	<20260910170254.833871-3-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 12:02:53 -0500, Mario Limonciello wrote:
> The Valve Index HMD stops serving its EDID after the host disables the
> DisplayPort PHY.  The headset remains powered by its breakout box across
> suspend and shutdown, so the bad state survives and the next connector
> detection reports "No EDID read".  The HMD then appears as a synthesized
> 640x480 display until it is power-cycled.
> 
> The 64-byte HID output report 0x16 with command 0x01 reboots the headset
> and restores its EDID service.  Add a device-specific driver which sends
> this report for system sleep transitions and orderly shutdown while leaving
> runtime autosuspend alone.
> 
> Resume a runtime-suspended interface for a shutdown request and restrict
> the command to the composite interface which declares report 0x16.
> 
> Closes: https://gitlab.freedesktop.org/drm/amd/-/work_items/4333

Hmm, people say it's a regression, so it looks like at least one
alternative solution should, in theory, exist...

Obligatory question: does it work any better with Windows? :)

> Link: https://github.com/ValveSoftware/SteamVR-for-Linux/issues/939
> Assisted-by: LLM
> Co-developed-by: Curtis Vogt <curtis.vogt@gmail.com>
> Signed-off-by: Curtis Vogt <curtis.vogt@gmail.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  .../ABI/testing/sysfs-driver-hid-valve-index  |  12 ++
>  drivers/hid/Kconfig                           |  11 ++
>  drivers/hid/Makefile                          |   1 +
>  drivers/hid/hid-ids.h                         |   1 +
>  drivers/hid/hid-valve-index.c                 | 142 ++++++++++++++++++
>  5 files changed, 167 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-valve-index
>  create mode 100644 drivers/hid/hid-valve-index.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-hid-valve-index b/Documentation/ABI/testing/sysfs-driver-hid-valve-index
> new file mode 100644
> index 0000000000000..47d8c26b1eace
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-hid-valve-index
> @@ -0,0 +1,12 @@
> +What:		/sys/bus/hid/devices/<bus>:<vid>:<pid>.<n>/reboot
> +Date:		October 2026
> +Contact:	linux-input@vger.kernel.org
> +Description:
> +		Writing a boolean true value reboots the Valve Index headset to
> +		recover its EDID service. Writing a boolean false value has no
> +		effect. This file is write-only.
> +
> +		The Valve Index is a composite HID device. The reboot command is
> +		only supported by the interface that provides the headset's 64-byte
> +		output report. Writing true to this file on another interface fails
> +		with -ENODEV.
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index a81bf51cbcf10..8ea2dd570058f 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -547,6 +547,17 @@ config HID_WALTOP
>  	help
>  	Support for Waltop tablets.
>  
> +config HID_VALVE_INDEX
> +	tristate "Valve Index headset"
> +	depends on USB_HID
> +	help
> +	  Support for the Valve Index headset. This driver works around the
> +	  headset failing to provide its EDID after a DisplayPort link shutdown
> +	  by rebooting the headset on resume from system suspend and at shutdown.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called hid-valve-index.
> +
>  config HID_VIEWSONIC
>  	tristate "ViewSonic/Signotec"
>  	help
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index 48a863b245eed..21f512cab6250 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -156,6 +156,7 @@ obj-$(CONFIG_HID_XIAOMI)	+= hid-xiaomi.o
>  obj-$(CONFIG_HID_XINMO)		+= hid-xinmo.o
>  obj-$(CONFIG_HID_ZEROPLUS)	+= hid-zpff.o
>  obj-$(CONFIG_HID_ZYDACRON)	+= hid-zydacron.o
> +obj-$(CONFIG_HID_VALVE_INDEX)	+= hid-valve-index.o
>  obj-$(CONFIG_HID_VIEWSONIC)	+= hid-viewsonic.o
>  obj-$(CONFIG_HID_VRC2)		+= hid-vrc2.o
>  obj-$(CONFIG_HID_HUAWEI)	+= hid-huawei.o
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index b3aca5aa91767..15cd29a338a8d 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -1391,6 +1391,7 @@
>  #define USB_DEVICE_ID_STEAM_CONTROLLER_IBEX_BLE	0x1303
>  #define USB_DEVICE_ID_STEAM_CONTROLLER_PROTEUS	0x1304
>  #define USB_DEVICE_ID_STEAM_CONTROLLER_NEREID	0x1305
> +#define USB_DEVICE_ID_VALVE_INDEX_HEADSET	0x2300
>  
>  #define USB_VENDOR_ID_STEELSERIES	0x1038
>  #define USB_DEVICE_ID_STEELSERIES_SRWS1	0x1410
> diff --git a/drivers/hid/hid-valve-index.c b/drivers/hid/hid-valve-index.c
> new file mode 100644
> index 0000000000000..43c1142b7215b
> --- /dev/null
> +++ b/drivers/hid/hid-valve-index.c
> @@ -0,0 +1,142 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * HID driver for the Valve Index headset
> + */
> +
> +#include <linux/hid.h>
> +#include <linux/module.h>
> +
> +#include "hid-ids.h"
> +
> +#define VALVE_INDEX_REBOOT_REPORT_ID	0x16
> +#define VALVE_INDEX_REBOOT_CMD		0x01
> +#define VALVE_INDEX_REPORT_SIZE		64
> +
> +static bool valve_index_has_reboot_report(struct hid_device *hdev)
> +{
> +	struct hid_report *report;
> +
> +	/*
> +	 * The reboot command is a vendor protocol carried in the unnumbered
> +	 * 64-byte output report of the headset's third interface; the first
> +	 * data byte is the command id.  Report 0x16 is only declared as a
> +	 * feature report and is not what the command is sent as.
> +	 */
> +	report = hdev->report_enum[HID_OUTPUT_REPORT].report_id_hash[0];
> +
> +	return report && hid_report_len(report) == VALVE_INDEX_REPORT_SIZE;
> +}
> +
> +static void valve_index_reboot(struct hid_device *hdev, bool wake)
> +{
> +	u8 *report;
> +	int ret;
> +
> +	if (!valve_index_has_reboot_report(hdev))
> +		return;
> +
> +	/* USB transfer buffers must be DMA-able, so not on the stack. */
> +	report = kzalloc(VALVE_INDEX_REPORT_SIZE, GFP_KERNEL);
> +	if (!report)
> +		return;
> +	report[0] = VALVE_INDEX_REBOOT_REPORT_ID;
> +	report[1] = VALVE_INDEX_REBOOT_CMD;
> +
> +	if (wake) {
> +		ret = hid_hw_power(hdev, PM_HINT_FULLON);
> +		if (ret < 0) {
> +			hid_warn(hdev, "failed to resume headset for reboot: %d\n",
> +				 ret);
> +			goto out;
> +		}
> +	}
> +
> +	/* Use the same interrupt-out then SET_REPORT fallback as hidraw. */
> +	ret = hid_hw_output_report(hdev, report, VALVE_INDEX_REPORT_SIZE);
> +	if (ret == -ENOSYS)
> +		ret = hid_hw_raw_request(hdev, report[0], report,
> +					 VALVE_INDEX_REPORT_SIZE,
> +					 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
> +	if (ret < 0)
> +		hid_warn(hdev, "failed to reboot headset: %d\n", ret);
> +	else if (ret != VALVE_INDEX_REPORT_SIZE)
> +		hid_warn(hdev, "short headset reboot report: %d\n", ret);
> +
> +	if (wake)
> +		hid_hw_power(hdev, PM_HINT_NORMAL);
> +out:
> +	kfree(report);
> +}
> +
> +/*
> + * The suspend and shutdown hooks only cover orderly power transitions.  After
> + * a crash, a hard reset or a power cut the headset is left in the state where
> + * its EDID no longer reads, and nothing recovers it until the next orderly
> + * transition.  Expose the reboot command as a write-only "reboot" attribute
> + * on the HID device so userspace can recover it, for instance from a udev
> + * rule that fires only when the connector reports no EDID.  Writing to an
> + * interface that does not carry the reboot report returns -ENODEV.
> + */
> +static ssize_t reboot_store(struct device *dev, struct device_attribute *attr,
> +			    const char *buf, size_t count)
> +{
> +	struct hid_device *hdev = to_hid_device(dev);
> +	bool val;
> +
> +	if (kstrtobool(buf, &val))
> +		return -EINVAL;
> +	if (!val)
> +		return count;
> +	if (!valve_index_has_reboot_report(hdev))
> +		return -ENODEV;
> +
> +	valve_index_reboot(hdev, true);
> +
> +	return count;
> +}
> +static DEVICE_ATTR_WO(reboot);
> +
> +static struct attribute *valve_index_attrs[] = {
> +	&dev_attr_reboot.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(valve_index);
> +
> +/*
> + * The headset's EDID service is lost when the host disables the DisplayPort
> + * PHY during system suspend, so it needs the reboot on the way out of
> + * suspend.  Doing it on the way in does not work: the headset dropping off
> + * USB is a remote-wakeup event from its hub and aborts the suspend.
> + */

The internal hub which will be quirked by the next patch, or its parent?

> +static int valve_index_resume(struct hid_device *hdev)
> +{
> +	valve_index_reboot(hdev, false);
> +
> +	return 0;
> +}
> +
> +static void valve_index_shutdown(struct hid_device *hdev)
> +{
> +	valve_index_reboot(hdev, true);
> +}
> +
> +static const struct hid_device_id valve_index_devices[] = {
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_VALVE,
> +			 USB_DEVICE_ID_VALVE_INDEX_HEADSET) },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(hid, valve_index_devices);
> +
> +static struct hid_driver valve_index_driver = {
> +	.name = "valve-index",
> +	.id_table = valve_index_devices,
> +	.resume = valve_index_resume,
> +	.reset_resume = valve_index_resume,
> +	.shutdown = valve_index_shutdown,
> +	.driver.dev_groups = valve_index_groups,
> +};
> +module_hid_driver(valve_index_driver);
> +
> +MODULE_AUTHOR("Mario Limonciello <mario.limonciello@amd.com>");
> +MODULE_DESCRIPTION("HID driver for Valve Index headset");
> +MODULE_LICENSE("GPL");
> -- 
> 2.43.0
> 
